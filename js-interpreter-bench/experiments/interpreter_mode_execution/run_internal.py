#!/usr/bin/env python3
"""SunSpider interpreter-mode execution timing inside frozen qjs/d8 processes."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
from pathlib import Path
import random
import statistics
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
GENERATED = HERE / "generated"
RAW = HERE / "raw"
SUMMARY = HERE / "summary"
EVIDENCE = HERE / "evidence" / "summary.json"
sys.path.insert(0, str(ROOT / "scripts"))
sys.path.insert(0, str(ROOT / "experiments" / "frontend_isolation"))
import run_sunspider as baseline  # noqa: E402
import run_repeated_mode as previous  # noqa: E402

OLD_CORRECTNESS = ROOT / "experiments/frontend_isolation/correctness/repeated.csv"
OLD_CORRECTNESS_SHA256 = "88c6f0f2725b38f7cde5b15b1b76577f2fcef18aa902eb051780414766157443"
PREVIOUS_RUNNER_SHA256 = "ab3e21681e68768c2d6071d482ac19c6d322fd31acada9c415aa717074e0ae42"
SOURCE_SUMMARY = ROOT / "results/processed/sunspider_summary.csv"
SOURCE_SUMMARY_SHA256 = "dc558feca2607d416189f17d5509d95d2ae9f73de30bd02967f75f21350184dc"
EXTERNAL_SUMMARY = ROOT / "experiments/frontend_isolation/summary/repeated_summary.csv"
EXTERNAL_SUMMARY_SHA256 = "b8ea376b5a6558fdefefac47c056f7fe5288cbb3f6659d7c665393020bd4912a"

CORRECTNESS = RAW / "correctness.csv"
CALIBRATION = RAW / "calibration.csv"
SELECTED = SUMMARY / "selected_n.csv"
MEASUREMENTS = RAW / "measurements.csv"
STATS = SUMMARY / "internal_summary.csv"
COMPARISON = SUMMARY / "three_mode_comparison.csv"
OVERVIEW = SUMMARY / "overview.json"

TARGET_MS = 1000
REPETITIONS = 30
SEED = 20260926
MAX_N = 65536
TIMEOUT_SECONDS = 300
V8_FLAGS = ("--max-opt=0", "--no-lazy")
ENGINES = baseline.ENGINES
FIELDS = ("engine", "test", "iteration", "n", "elapsed_ms", "elapsed_ns",
          "per_call_ns", "outer_wall_ns", "checksum", "stdout", "stderr",
          "exit_code", "valid", "script_sha256")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def require_hash(path: Path, expected: str) -> None:
    if sha256(path) != expected:
        raise RuntimeError(f"frozen input changed: {path}")


def checked_inputs() -> dict[tuple[str, str], str]:
    baseline.verify_frozen_inputs()
    require_hash(OLD_CORRECTNESS, OLD_CORRECTNESS_SHA256)
    require_hash(ROOT / "experiments/frontend_isolation/run_repeated_mode.py",
                 PREVIOUS_RUNNER_SHA256)
    if set(previous.CHECKSUM) != set(baseline.TESTS):
        raise RuntimeError("checksum mapping does not cover frozen SunSpider")
    evidence = json.loads(EVIDENCE.read_text(encoding="utf-8"))
    if evidence["status"] != "PASS" or tuple(evidence["flags"]) != V8_FLAGS:
        raise RuntimeError("V8 --no-lazy tier evidence not PASS")
    if evidence["d8_sha256"] != baseline.V8_BINARY_SHA256 or \
            evidence["snapshot_sha256"] != baseline.V8_SNAPSHOT_SHA256:
        raise RuntimeError("V8 evidence not tied to frozen artifacts")
    if evidence["lazy_probe_sha256"] != sha256(HERE / "probes/lazy_order.js") or \
            evidence["tier_probe_sha256"] != sha256(ROOT / "benchmarks/probes/v8_tier_probe.js"):
        raise RuntimeError("V8 probe changed after evidence collection")
    with OLD_CORRECTNESS.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    expected: dict[tuple[str, str], str] = {}
    for row in rows:
        if row["valid"] != "True" or not row["stdout"].startswith("CHECKSUM="):
            raise RuntimeError("old correctness gate is not PASS")
        key = (row["test"], row["engine"])
        checksum = row["stdout"][len("CHECKSUM="):]
        if key in expected and expected[key] != checksum:
            raise RuntimeError(f"old checksum unstable: {key}")
        expected[key] = checksum
    if len(expected) != len(baseline.TESTS) * len(ENGINES):
        raise RuntimeError("old correctness suite incomplete")
    return expected


def make_script(test: str, n: int, expected: dict[tuple[str, str], str]) -> Path:
    if test not in baseline.TESTS or not 1 <= n <= MAX_N:
        raise ValueError((test, n))
    GENERATED.mkdir(parents=True, exist_ok=True)
    path = GENERATED / f"{test}-n{n}.js"
    source = previous.source_path(test).read_text(encoding="utf-8")
    allowed = sorted({expected[(test, engine)] for engine in ENGINES})
    script = (
        "function workload() {\n" + source + "\nreturn String(" + previous.CHECKSUM[test] + ");\n}\n"
        "var lastResult;\n"
        "var timerStart = Date.now();\n"
        f"for (var repeatIndex = 0; repeatIndex < {n}; ++repeatIndex) lastResult = workload();\n"
        "var elapsedMs = Date.now() - timerStart;\n"
        f"var allowedChecksums = {json.dumps(allowed, ensure_ascii=False)};\n"
        "if (allowedChecksums.indexOf(lastResult) < 0) throw Error('checksum mismatch: ' + lastResult);\n"
        "if (!Number.isInteger(elapsedMs) || elapsedMs < 0) throw Error('invalid elapsed time');\n"
        f"console.log('IM_EXEC:' + JSON.stringify({{test:{json.dumps(test)},n:{n},"
        "elapsed_ms:elapsedMs,checksum:lastResult}));\n"
    )
    if path.exists():
        if path.read_text(encoding="utf-8") != script:
            raise RuntimeError(f"generated script differs; refusing overwrite: {path}")
    else:
        with path.open("x", encoding="utf-8", newline="\n") as f:
            f.write(script)
    return path


def command(engine: str, script: Path) -> list[str]:
    if engine == "quickjs":
        return [str(baseline.QUICKJS_BINARY), str(script)]
    if engine == "v8_ignition":
        return [str(baseline.V8_BINARY), f"--snapshot_blob={baseline.V8_SNAPSHOT}",
                *V8_FLAGS, str(script)]
    raise ValueError(engine)


def invoke(engine: str, test: str, n: int,
           expected: dict[tuple[str, str], str]) -> dict[str, object]:
    script = make_script(test, n, expected)
    start = time.perf_counter_ns()
    try:
        result = subprocess.run(command(engine, script), cwd=ROOT,
                                env=baseline.environments()[engine],
                                capture_output=True, timeout=TIMEOUT_SECONDS, check=False)
        stdout = baseline.normalize_output(result.stdout)
        stderr = baseline.normalize_output(result.stderr)
        exit_code = result.returncode
    except (OSError, subprocess.TimeoutExpired) as error:
        stdout, stderr, exit_code = "", str(error), -1
    outer_wall_ns = time.perf_counter_ns() - start
    elapsed_ms: int | None = None
    checksum: str | None = None
    payload_valid = False
    if stdout.startswith("IM_EXEC:") and "\n" not in stdout:
        try:
            payload = json.loads(stdout[len("IM_EXEC:"):])
            elapsed_ms = payload["elapsed_ms"]
            checksum = payload["checksum"]
            payload_valid = (payload["test"] == test and payload["n"] == n and
                             type(elapsed_ms) is int and elapsed_ms >= 0 and
                             checksum == expected[(test, engine)])
        except (ValueError, KeyError, TypeError):
            pass
    valid = exit_code == 0 and stderr == "" and payload_valid
    elapsed_ns = elapsed_ms * 1_000_000 if elapsed_ms is not None else ""
    per_call_ns = elapsed_ns / n if elapsed_ns != "" else ""
    return {"engine": engine, "test": test, "n": n, "elapsed_ms": elapsed_ms,
            "elapsed_ns": elapsed_ns, "per_call_ns": per_call_ns,
            "outer_wall_ns": outer_wall_ns, "checksum": checksum,
            "stdout": stdout, "stderr": stderr, "exit_code": exit_code,
            "valid": valid, "script_sha256": sha256(script)}


def rows(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def write_new(path: Path, data: list[dict[str, object]], fields: tuple[str, ...]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        writer.writerows(data)


def require_correctness() -> None:
    data = rows(CORRECTNESS)
    if len(data) != len(baseline.TESTS) * len(ENGINES) * 2 or \
            any(row["valid"] != "True" or row["exit_code"] != "0" for row in data):
        raise RuntimeError("internal correctness gate not fully PASS")


def require_workload_bytecode() -> None:
    report = rows(HERE / "evidence/workload_bytecode/summary.csv")
    if len(report) != len(baseline.TESTS) or {r["test"] for r in report} != set(baseline.TESTS) \
            or any(r["status"] != "PASS" or not int(r["bytecode_offset"]) <
                   int(r["timer_marker_offset"]) < int(r["completion_marker_offset"])
                   for r in report):
        raise RuntimeError("actual workload eager-bytecode evidence incomplete")


def require_full_n_correctness(n_by_test: dict[str, int]) -> None:
    report = rows(RAW / "full_n_correctness.csv")
    if len(report) != len(baseline.TESTS) * len(ENGINES) or \
            {(r["test"], r["engine"]) for r in report} != \
            {(test, engine) for test in baseline.TESTS for engine in ENGINES} or \
            any(r["status"] != "PASS" or r["exit_code"] != "0" or
                int(r["n"]) != n_by_test[r["test"]] for r in report):
        raise RuntimeError("selected-N all-call correctness not fully PASS")


def correctness() -> None:
    expected = checked_inputs()
    data = [invoke(engine, test, n, expected)
            for test in baseline.TESTS for engine in ENGINES for n in (1, 2)]
    write_new(CORRECTNESS, data, FIELDS)
    passed = sum(bool(row["valid"]) for row in data)
    print(f"correctness: {passed}/{len(data)} PASS")
    if passed != len(data):
        raise RuntimeError("correctness failed; stop before calibration")


def calibrate() -> None:
    expected = checked_inputs()
    require_correctness()
    if CALIBRATION.exists() or SELECTED.exists():
        raise RuntimeError("calibration output exists; refusing overwrite")
    CALIBRATION.parent.mkdir(parents=True, exist_ok=True)
    selected: list[dict[str, object]] = []
    with CALIBRATION.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS)
        writer.writeheader()
        for test in baseline.TESTS:
            n = 1
            while True:
                trials = [invoke(engine, test, n, expected) for engine in ENGINES]
                for row in trials:
                    writer.writerow(row)
                f.flush()
                print(f"calibrate {test} N={n}: " + ", ".join(
                    f"{r['engine']}={r['elapsed_ms']} ms valid={r['valid']}" for r in trials), flush=True)
                if not all(row["valid"] for row in trials):
                    raise RuntimeError(f"invalid calibration trial: {test} N={n}")
                if all(int(row["elapsed_ms"]) >= TARGET_MS for row in trials):
                    selected.append({"test": test, "n": n,
                                     "quickjs_calibration_ms": trials[0]["elapsed_ms"],
                                     "v8_calibration_ms": trials[1]["elapsed_ms"],
                                     "script_sha256": trials[0]["script_sha256"]})
                    break
                n *= 2
                if n > MAX_N:
                    raise RuntimeError(f"calibration exceeded max N: {test}")
    write_new(SELECTED, selected, ("test", "n", "quickjs_calibration_ms",
                                   "v8_calibration_ms", "script_sha256"))


def selected_n(expected: dict[tuple[str, str], str]) -> dict[str, int]:
    data = rows(SELECTED)
    if len(data) != len(baseline.TESTS) or {row["test"] for row in data} != set(baseline.TESTS):
        raise RuntimeError("selected N incomplete")
    calibration = rows(CALIBRATION)
    lookup = {(r["test"], r["engine"], int(r["n"])): r for r in calibration}
    selected = {}
    for row in data:
        test, n = row["test"], int(row["n"])
        script = make_script(test, n, expected)
        if sha256(script) != row["script_sha256"]:
            raise RuntimeError(f"selected script hash mismatch: {test}")
        if any(int(lookup[test, engine, n]["elapsed_ms"]) < TARGET_MS for engine in ENGINES):
            raise RuntimeError(f"calibration target not met: {test}")
        if n > 1 and all(int(lookup[test, engine, n // 2]["elapsed_ms"]) >= TARGET_MS
                         for engine in ENGINES):
            raise RuntimeError(f"N not minimal under doubling rule: {test}")
        selected[test] = n
    return selected


def measure() -> None:
    expected = checked_inputs()
    require_correctness()
    require_workload_bytecode()
    n_by_test = selected_n(expected)
    if MEASUREMENTS.exists():
        raise RuntimeError(f"refusing to overwrite {MEASUREMENTS}")
    rng = random.Random(SEED)
    with MEASUREMENTS.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS)
        writer.writeheader()
        for iteration in range(1, REPETITIONS + 1):
            tests = list(baseline.TESTS)
            rng.shuffle(tests)
            for test in tests:
                engine_order = ENGINES if iteration % 2 else ENGINES[::-1]
                for engine in engine_order:
                    result = invoke(engine, test, n_by_test[test], expected)
                    result["iteration"] = iteration
                    writer.writerow(result)
                    f.flush()
                    if not result["valid"]:
                        raise RuntimeError(f"invalid formal sample: {test} {engine} {iteration}")
            print(f"iteration {iteration}/{REPETITIONS} complete", flush=True)


def stats(values: list[float], prefix: str) -> dict[str, float]:
    values = sorted(values)
    half = len(values) // 2
    return {f"{prefix}_median_ns": statistics.median(values),
            f"{prefix}_mean_ns": statistics.mean(values),
            f"{prefix}_stddev_ns": statistics.stdev(values),
            f"{prefix}_iqr_ns": statistics.median(values[half:]) - statistics.median(values[:half]),
            f"{prefix}_min_ns": values[0], f"{prefix}_max_ns": values[-1]}


def summarize() -> None:
    checked_inputs()
    require_correctness()
    require_workload_bytecode()
    data = rows(MEASUREMENTS)
    if len(data) != len(baseline.TESTS) * len(ENGINES) * REPETITIONS or \
            any(row["valid"] != "True" or row["exit_code"] != "0" for row in data):
        raise RuntimeError("formal data incomplete/invalid")
    n_by_test = selected_n(checked_inputs())
    require_full_n_correctness(n_by_test)
    output: list[dict[str, object]] = []
    for test in baseline.TESTS:
        values = {}
        for engine in ENGINES:
            subset = [row for row in data if row["test"] == test and row["engine"] == engine]
            if len(subset) != REPETITIONS or {int(row["n"]) for row in subset} != {n_by_test[test]} \
                    or {int(row["iteration"]) for row in subset} != set(range(1, REPETITIONS + 1)) \
                    or len({row["script_sha256"] for row in subset}) != 1:
                raise RuntimeError(f"invalid sample group: {test} {engine}")
            values[engine] = [float(row["per_call_ns"]) for row in subset]
        q = stats(values["quickjs"], "quickjs")
        v = stats(values["v8_ignition"], "v8")
        output.append({"test": test, "n": n_by_test[test], "repetitions": REPETITIONS,
                       **q, **v, "ratio_v8_over_quickjs":
                       v["v8_median_ns"] / q["quickjs_median_ns"]})
    write_new(STATS, output, tuple(output[0]))

    require_hash(SOURCE_SUMMARY, SOURCE_SUMMARY_SHA256)
    require_hash(EXTERNAL_SUMMARY, EXTERNAL_SUMMARY_SHA256)
    source = {row["test"]: row for row in rows(SOURCE_SUMMARY)}
    external = {row["test"]: row for row in rows(EXTERNAL_SUMMARY)}
    if set(source) != set(baseline.TESTS) or set(external) != set(baseline.TESTS):
        raise RuntimeError("prior mode comparison is incomplete")
    comparison = []
    for row in output:
        test = str(row["test"])
        source_ratio = float(source[test]["v8_over_quickjs_ratio"])
        external_ratio = float(external[test]["ratio_v8_over_quickjs"])
        internal_ratio = float(row["ratio_v8_over_quickjs"])
        comparison.append({"test": test, "n_internal": row["n"],
                           "source_to_finish_ratio": source_ratio,
                           "external_amortized_ratio": external_ratio,
                           "internal_execution_ratio": internal_ratio,
                           "internal_over_source_ratio": internal_ratio / source_ratio,
                           "internal_over_external_ratio": internal_ratio / external_ratio})
    write_new(COMPARISON, comparison, tuple(comparison[0]))
    overview: dict[str, object] = {"case_count": len(output), "repetitions_per_engine": REPETITIONS,
                                   "metric": "internal Date.now elapsed_ms / N; not pure loop time"}
    for field in ("source_to_finish_ratio", "external_amortized_ratio", "internal_execution_ratio"):
        ratios = [float(row[field]) for row in comparison]
        overview[field] = {
            "geomean": math.exp(statistics.mean(map(math.log, ratios))),
            "quickjs_lower_count": sum(value > 1 for value in ratios),
            "v8_lower_count": sum(value < 1 for value in ratios),
        }
    with OVERVIEW.open("x", encoding="utf-8", newline="\n") as f:
        json.dump(overview, f, ensure_ascii=False, indent=2)
        f.write("\n")
    print(json.dumps(overview, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("correctness", "calibrate", "measure", "summarize"))
    action = parser.parse_args().action
    {"correctness": correctness, "calibrate": calibrate,
     "measure": measure, "summarize": summarize}[action]()
