#!/usr/bin/env python3
"""Octane 2.0 compatibility, fixed-work wall time, and native-harness timing."""

from __future__ import annotations

import argparse
import csv
import json
import math
import os
from pathlib import Path
import random
import statistics
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts"))
import run_sunspider as baseline  # noqa: E402
import prepare  # noqa: E402

HERE = Path(__file__).resolve().parent
RAW = HERE / "raw"
COMPAT_RAW = RAW / "compatibility_runs.csv"
COMPAT = HERE / "compatibility.csv"
CALIBRATION = RAW / "calibration.csv"
SELECTED = HERE / "selected_work.csv"
BENCH_RAW = RAW / "measurements.csv"
SUMMARY = HERE / "summary.csv"
ENGINES = ("quickjs", "v8_ignition")
SEED = 20260925
REPETITIONS = 10
COMPAT_TIMEOUT_SECONDS = 90.0
BENCH_TIMEOUT_SECONDS = 180.0
MIN_FIXED_WALL_NS = 500_000_000
SELF_CHECKED = frozenset(prepare.CASES) - {"Box2D", "zlib"}


def prepare_inputs() -> None:
    baseline.verify_frozen_inputs()
    prepare.manifest()
    for case in prepare.CASES:
        prepare.script_for(case)


def command(engine: str, script: Path) -> list[str]:
    if engine == "quickjs":
        return [str(baseline.QUICKJS_BINARY), str(script)]
    if engine == "v8_ignition":
        return [str(baseline.V8_BINARY), f"--snapshot_blob={baseline.V8_SNAPSHOT}",
                *baseline.V8_FLAGS, str(script)]
    raise ValueError(engine)


def invoke(engine: str, case: str, timeout: float, script: Path | None = None,
           native_timing: bool = False) -> dict[str, object]:
    script = script or prepare.script_for(case)
    cmd = command(engine, script)
    environment = baseline.environments()[engine]
    start = time.perf_counter_ns()
    try:
        p = subprocess.run(cmd, cwd=ROOT, env=environment,
                           capture_output=True, check=False, timeout=timeout)
        code = p.returncode
        stdout = baseline.normalize_output(p.stdout)
        stderr = baseline.normalize_output(p.stderr)
        timed_out = False
    except subprocess.TimeoutExpired as error:
        code = -1
        stdout = baseline.normalize_output(error.stdout or b"")
        stderr = baseline.normalize_output(error.stderr or b"")
        timed_out = True
    except OSError as error:
        code, stdout, stderr, timed_out = -1, "", str(error), False
    elapsed = time.perf_counter_ns() - start
    marker = f"OCTANE_PASS:{case}:results="
    marker_lines = [line for line in stdout.splitlines() if line.startswith(marker)]
    time_marker = f"OCTANE_TIME:{case}:"
    timing_lines = [line for line in stdout.splitlines() if line.startswith(time_marker)]
    valid = code == 0 and not timed_out and stderr == "" and len(marker_lines) == 1 \
        and len(marker_lines[0]) > len(marker)
    metric_ns = elapsed
    subbenchmarks = ""
    if native_timing and valid:
        try:
            if len(timing_lines) != 1:
                raise ValueError("missing native timing marker")
            pairs = [part.split("=", 1) for part in timing_lines[0][len(time_marker):].split("|")]
            if not pairs or any(len(pair) != 2 for pair in pairs):
                raise ValueError("malformed native timing")
            values = [float(pair[1]) for pair in pairs]
            if any(not math.isfinite(x) or x <= 0 for x in values):
                raise ValueError("non-positive native timing")
            metric_ns = math.exp(statistics.mean(map(math.log, values))) * 1000
            subbenchmarks = json.dumps(dict(pairs), separators=(",", ":"))
        except (ValueError, OverflowError) as error:
            valid = False
            stderr += f"\nTiming parse error: {error}"
    status = "TIMEOUT" if timed_out else ("PASS" if valid else "FAIL")
    return {"case": case, "engine": engine, "status": status,
            "wall_time_ns": elapsed, "metric_time_ns": metric_ns,
            "subbenchmarks_us": subbenchmarks, "exit_code": code,
            "stdout": stdout, "stderr": stderr,
            "script_sha256": prepare.sha256(script.read_bytes())}


def existing_rows(path: Path) -> list[dict[str, str]]:
    if not path.exists():
        return []
    with path.open(encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def compatibility() -> None:
    prepare_inputs()
    RAW.mkdir(parents=True, exist_ok=True)
    fields = ("case", "engine", "status", "wall_time_ns", "exit_code",
              "stdout", "stderr", "script_sha256")
    seen = {(r["case"], r["engine"]) for r in existing_rows(COMPAT_RAW)}
    if not COMPAT_RAW.exists():
        with COMPAT_RAW.open("x", encoding="utf-8", newline="") as f:
            csv.DictWriter(f, fieldnames=fields).writeheader()
    with COMPAT_RAW.open("a", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        for case in prepare.CASES:
            for engine in ENGINES:
                if (case, engine) in seen:
                    continue
                row = invoke(engine, case, COMPAT_TIMEOUT_SECONDS)
                writer.writerow({key: row[key] for key in fields})
                f.flush()
                print(f"{case} {engine}: {row['status']} {int(row['wall_time_ns'])/1e9:.2f}s", flush=True)
    make_compatibility()


def make_compatibility() -> None:
    rows = existing_rows(COMPAT_RAW)
    if len(rows) != len(prepare.CASES) * len(ENGINES):
        raise RuntimeError(f"compatibility incomplete: {len(rows)}/{len(prepare.CASES)*len(ENGINES)}")
    if len({(r["case"], r["engine"]) for r in rows}) != len(rows):
        raise RuntimeError("duplicate compatibility entries")
    by_key = {(r["case"], r["engine"]): r for r in rows}
    output = []
    for case in prepare.CASES:
        q, v = by_key[(case, "quickjs")], by_key[(case, "v8_ignition")]
        included = q["status"] == "PASS" and v["status"] == "PASS" and case in SELF_CHECKED
        if case == "Box2D":
            reason = "both run, but upstream runBox2D has no output checksum/assertion; excluded from correctness-gated timing"
        elif case == "zlib":
            reason = "QuickJS lacks d8-style read() required by upstream zlib-data.js; no shim applied"
        elif included:
            reason = "both shells pass upstream suite with built-in correctness check"
        else:
            reason = f"quickjs={q['status']}; v8={v['status']}; see raw/compatibility_runs.csv"
        qstatus = "UNSUPPORTED" if case == "zlib" and q["status"] == "FAIL" \
            and "'read' is not defined" in q["stderr"] else q["status"]
        output.append({"case": case, "quickjs_status": qstatus,
                       "v8_status": v["status"], "included": str(included).lower(),
                       "reason": reason})
    with COMPAT.open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=tuple(output[0]))
        writer.writeheader()
        writer.writerows(output)
    print(f"compatible intersection: {sum(r['included']=='true' for r in output)}/{len(output)}")


def calibrate() -> None:
    prepare_inputs()
    if CALIBRATION.exists() or SELECTED.exists():
        raise RuntimeError("calibration already exists; refusing overwrite")
    allowed = [r["case"] for r in existing_rows(COMPAT) if r["included"] == "true"]
    if not allowed:
        raise RuntimeError("no correctness-gated intersection")
    RAW.mkdir(parents=True, exist_ok=True)
    fields = ("case", "multiplier", "engine", "status", "wall_time_ns",
              "exit_code", "stdout", "stderr", "script_sha256")
    selections = []
    with CALIBRATION.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        for case in allowed:
            multiplier = 1
            while True:
                script = prepare.fixed_work_script(case, multiplier)
                runs = [invoke(engine, case, BENCH_TIMEOUT_SECONDS, script) for engine in ENGINES]
                for row in runs:
                    writer.writerow({"case": case, "multiplier": multiplier,
                                     **{key: row[key] for key in fields if key not in ("case", "multiplier")}})
                f.flush()
                print(f"calibrate {case} x{multiplier}: " + ", ".join(
                    f"{r['engine']}={r['status']} {r['wall_time_ns']/1e9:.3f}s" for r in runs), flush=True)
                if any(r["status"] != "PASS" for r in runs):
                    print(f"fixed-work case withheld: {case}", flush=True)
                    break
                if all(int(r["wall_time_ns"]) >= MIN_FIXED_WALL_NS for r in runs):
                    selections.append({"case": case, "multiplier": multiplier,
                                       "quickjs_calibration_ns": runs[0]["wall_time_ns"],
                                       "v8_calibration_ns": runs[1]["wall_time_ns"],
                                       "script_sha256": runs[0]["script_sha256"]})
                    break
                if multiplier == 512:
                    print(f"fixed-work case withheld (duration target unmet): {case}", flush=True)
                    break
                multiplier = min(multiplier * 2, 512)
    with SELECTED.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=("case", "multiplier", "quickjs_calibration_ns",
                                                   "v8_calibration_ns", "script_sha256"))
        writer.writeheader()
        writer.writerows(selections)


def benchmark() -> None:
    prepare_inputs()
    if BENCH_RAW.exists():
        raise RuntimeError(f"refusing to overwrite {BENCH_RAW}")
    selected = {r["case"]: r for r in existing_rows(SELECTED)}
    allowed = list(selected)
    if not allowed:
        raise RuntimeError("no calibrated fixed-work intersection")
    for case in allowed:
        script = prepare.fixed_work_script(case, int(selected[case]["multiplier"]))
        if prepare.sha256(script.read_bytes()) != selected[case]["script_sha256"]:
            raise RuntimeError(f"selected script changed: {case}")
    fields = ("mode", "case", "engine", "iteration", "wall_time_ns", "metric_time_ns",
              "subbenchmarks_us", "exit_code", "valid", "stdout", "stderr", "script_sha256")
    rng = random.Random(SEED)
    with BENCH_RAW.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        for iteration in range(1, REPETITIONS + 1):
            order = list(allowed)
            rng.shuffle(order)
            for case in order:
                for mode in ("fixed_source_to_finish", "native_frontend_amortized"):
                    engines = ENGINES if iteration % 2 else ENGINES[::-1]
                    for engine in engines:
                        script = (prepare.fixed_work_script(case, int(selected[case]["multiplier"]))
                                  if mode == "fixed_source_to_finish"
                                  else prepare.native_timing_script(case))
                        row = invoke(engine, case, BENCH_TIMEOUT_SECONDS, script,
                                     native_timing=mode == "native_frontend_amortized")
                        writer.writerow({"mode": mode, "case": case, "engine": engine,
                                         "iteration": iteration,
                                         "valid": str(row["status"] == "PASS").lower(),
                                         **{key: row[key] for key in fields if key in row}})
                        f.flush()
                        if row["status"] != "PASS":
                            raise RuntimeError(f"formal sample invalid: {case} {engine} {iteration}")
            print(f"iteration {iteration}/{REPETITIONS} complete", flush=True)


def summarize() -> None:
    data = existing_rows(BENCH_RAW)
    allowed = [r["case"] for r in existing_rows(SELECTED)]
    modes = ("fixed_source_to_finish", "native_frontend_amortized")
    if len(data) != len(allowed) * len(ENGINES) * REPETITIONS * len(modes):
        raise RuntimeError("formal raw data incomplete")
    if any(r["valid"] != "true" or r["exit_code"] != "0" for r in data):
        raise RuntimeError("invalid formal sample")
    output = []
    for mode in modes:
      for case in allowed:
        def stats(engine: str) -> dict[str, float]:
            values = sorted(float(r["metric_time_ns"]) for r in data
                            if r["mode"] == mode and r["case"] == case and r["engine"] == engine)
            if len(values) != REPETITIONS:
                raise RuntimeError(f"sample count mismatch: {case} {engine}")
            half = len(values) // 2
            return {"median": statistics.median(values), "mean": statistics.mean(values),
                    "stddev": statistics.stdev(values),
                    "iqr": statistics.median(values[half:]) - statistics.median(values[:half]),
                    "min": values[0], "max": values[-1]}
        q, v = stats("quickjs"), stats("v8_ignition")
        output.append({"mode": mode, "case": case, "repetitions": REPETITIONS,
                       **{f"quickjs_{k}_ns": value for k, value in q.items()},
                       **{f"v8_{k}_ns": value for k, value in v.items()},
                       "ratio_v8_over_quickjs": v["median"] / q["median"]})
    with SUMMARY.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=tuple(output[0]))
        writer.writeheader()
        writer.writerows(output)
    for mode in modes:
        ratios = [r["ratio_v8_over_quickjs"] for r in output if r["mode"] == mode]
        print(f"{mode}: QuickJS lower {sum(x>1 for x in ratios)}/{len(ratios)}, "
              f"ratio geomean {math.exp(statistics.mean(map(math.log,ratios))):.9f}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("compatibility", "calibrate", "benchmark", "summarize"))
    action = parser.parse_args().action
    {"compatibility": compatibility, "calibrate": calibrate,
     "benchmark": benchmark, "summarize": summarize}[action]()
