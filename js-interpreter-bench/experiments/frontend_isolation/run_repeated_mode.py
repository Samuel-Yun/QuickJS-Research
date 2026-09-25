#!/usr/bin/env python3
"""Frontend-amortized SunSpider: one compilation, repeated calls per process.

This is NOT a pure interpreter timer. It deliberately uses the frozen binaries,
the same generated JavaScript for both shells, and never overwrites baseline data.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
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

HERE = Path(__file__).resolve().parent
GENERATED = HERE / "generated"
RAW = HERE / "raw"
SUMMARY = HERE / "summary"
CORRECTNESS = HERE / "correctness"
TARGET_NS = 200_000_000
REPETITIONS = 30
SEED = 20260924

# Each case has an observable result. Original assertions remain in the body.
# A few original cases have no result assertion; see README for this limitation.
CHECKSUM = {
    "3d-cube": "i", "3d-morph": "Math.round(testOutput * 1e12)",
    "3d-raytrace": "testOutput.length", "access-binary-trees": "ret",
    "access-fannkuch": "ret", "access-nbody": "ret",
    "access-nsieve": "result", "bitops-3bit-bits-in-byte": "sum",
    "bitops-bits-in-byte": "result", "bitops-bitwise-and": "result",
    "bitops-nsieve-bits": "sum", "controlflow-recursive": "result",
    "crypto-aes": "decryptedText.length",
    "crypto-md5": "md5Output", "crypto-sha1": "sha1Output",
    "date-format-tofte": "shortFormat + '|' + longFormat + '|' + date.getTime()",
    "date-format-xparb": "shortFormat + '|' + longFormat + '|' + date.getTime()",
    "math-cordic": "total", "math-partial-sums": "total",
    "math-spectral-norm": "total",
    "regexp-dna": "dnaOutputString.length + ':' + dnaInput.length",
    "string-base64": "str.length", "string-fasta": "ret",
    "string-tagcloud": "tagcloud.length", "string-unpack-code": "result",
    "string-validate-input": "endResult.length",
}


def checked_inputs() -> None:
    baseline.verify_frozen_inputs()
    if set(CHECKSUM) != set(baseline.TESTS):
        raise RuntimeError("checksum mapping does not cover the frozen suite")


def source_path(test: str) -> Path:
    return baseline.STANDALONE_DIRECTORY / f"{test}.js"


def make_script(test: str, n: int) -> Path:
    if n < 1:
        raise ValueError("N must be positive")
    GENERATED.mkdir(parents=True, exist_ok=True)
    output = GENERATED / f"{test}-n{n}.js"
    source = source_path(test).read_text(encoding="utf-8")
    # Both engines receive exactly this file. The source body is unchanged.
    script = (
        "function workload() {\n" + source + "\nreturn String(" + CHECKSUM[test] + ");\n}\n"
        "var first = workload();\n"
        "if (first === 'undefined' || first === 'NaN') throw Error('invalid checksum');\n"
        f"for (var repeatIndex = 1; repeatIndex < {n}; ++repeatIndex) {{\n"
        "  if (workload() !== first) throw Error('checksum changed at ' + repeatIndex);\n"
        "}\n"
        "console.log('CHECKSUM=' + first);\n"
    )
    if output.exists():
        if output.read_text(encoding="utf-8") == script:
            return output
        # Only derived harness files are regenerated; frozen inputs are untouched.
    output.write_text(script, encoding="utf-8", newline="\n")
    return output


def command(engine: str, script: Path) -> list[str]:
    if engine == "quickjs":
        return [str(baseline.QUICKJS_BINARY), str(script)]
    if engine == "v8_ignition":
        return [str(baseline.V8_BINARY), f"--snapshot_blob={baseline.V8_SNAPSHOT}",
                *baseline.V8_FLAGS, str(script)]
    raise ValueError(engine)


def invoke(engine: str, test: str, n: int, timeout: float = 120) -> dict[str, object]:
    script = make_script(test, n)
    env = baseline.environments()[engine]
    start = time.perf_counter_ns()
    try:
        p = subprocess.run(command(engine, script), cwd=ROOT, env=env,
                           capture_output=True, timeout=timeout, check=False)
        stdout = baseline.normalize_output(p.stdout)
        stderr = baseline.normalize_output(p.stderr)
        exit_code = p.returncode
    except (OSError, subprocess.TimeoutExpired) as error:
        stdout, stderr, exit_code = "", str(error), -1
    elapsed = time.perf_counter_ns() - start
    valid = exit_code == 0 and stderr == "" and stdout.startswith("CHECKSUM=") \
        and "\n" not in stdout
    return {"engine": engine, "test": test, "n": n, "wall_time_ns": elapsed,
            "per_call_ns": elapsed / n, "stdout": stdout, "stderr": stderr,
            "exit_code": exit_code, "valid": valid,
            "script_sha256": hashlib.sha256(script.read_bytes()).hexdigest()}


def write_csv_new(path: Path, rows: list[dict[str, object]], fields: tuple[str, ...]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def correctness() -> None:
    checked_inputs()
    rows = [invoke(engine, test, n)
            for test in baseline.TESTS for engine in baseline.ENGINES for n in (1, 2)]
    for test in baseline.TESTS:
        subset = [r for r in rows if r["test"] == test]
        if not all(r["valid"] for r in subset):
            continue
        # 3d-raytrace has an upstream-approved two-length sentinel (20969/20970).
        by_engine = {engine: [r["stdout"] for r in subset if r["engine"] == engine]
                     for engine in baseline.ENGINES}
        if any(values[0] != values[1] for values in by_engine.values()):
            for r in subset:
                r["valid"] = False
                r["stderr"] = "checksum differs between N=1 and N=2"
        if test != "3d-raytrace" and by_engine["quickjs"][0] != by_engine["v8_ignition"][0]:
            for r in subset:
                r["valid"] = False
                r["stderr"] = "cross-engine checksum differs"
    write_csv_new(CORRECTNESS / "repeated.csv", rows,
                  ("engine", "test", "n", "wall_time_ns", "per_call_ns", "stdout",
                   "stderr", "exit_code", "valid", "script_sha256"))
    passed = sum(bool(r["valid"]) for r in rows)
    print(f"correctness: {passed}/{len(rows)} PASS")
    for r in rows:
        if not r["valid"]:
            print(f"FAIL {r['engine']} {r['test']} N={r['n']}: {r['stderr']}")
    if passed != len(rows):
        raise RuntimeError("correctness gate failed; do not calibrate or measure")


def calibrate() -> None:
    checked_inputs()
    require_correctness()
    rows: list[dict[str, object]] = []
    for test in baseline.TESTS:
        n = 1
        while True:
            trials = [invoke(engine, test, n) for engine in baseline.ENGINES]
            rows.extend(trials)
            if not all(r["valid"] for r in trials):
                raise RuntimeError(f"calibration failed: {test} N={n}")
            if all(int(r["wall_time_ns"]) >= TARGET_NS for r in trials):
                print(f"{test}: N={n}, qjs={int(trials[0]['wall_time_ns'])/1e6:.1f} ms, "
                      f"v8={int(trials[1]['wall_time_ns'])/1e6:.1f} ms", flush=True)
                break
            n *= 2
            if n > 65536:
                raise RuntimeError(f"calibration N exceeded safety cap: {test}")
    write_csv_new(RAW / "calibration.csv", rows,
                  ("engine", "test", "n", "wall_time_ns", "per_call_ns", "stdout",
                   "stderr", "exit_code", "valid", "script_sha256"))
    selected = []
    for test in baseline.TESTS:
        selected.append({"test": test, "n": max(int(r["n"]) for r in rows if r["test"] == test)})
    write_csv_new(SUMMARY / "selected_n.csv", selected, ("test", "n"))


def require_correctness() -> None:
    path = CORRECTNESS / "repeated.csv"
    if not path.exists():
        raise RuntimeError("run correctness first")
    with path.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    if len(rows) != len(baseline.TESTS) * len(baseline.ENGINES) * 2 \
            or not all(r["valid"] == "True" for r in rows):
        raise RuntimeError("correctness gate is not fully PASS")


def measure() -> None:
    checked_inputs()
    require_correctness()
    with (SUMMARY / "selected_n.csv").open(encoding="utf-8", newline="") as f:
        n_by_test = {r["test"]: int(r["n"]) for r in csv.DictReader(f)}
    if set(n_by_test) != set(baseline.TESTS):
        raise RuntimeError("selected N set mismatch")
    output = RAW / "repeated.csv"
    if output.exists():
        raise RuntimeError(f"refusing to overwrite {output}")
    output.parent.mkdir(parents=True, exist_ok=True)
    fields = ("engine", "test", "iteration", "n", "wall_time_ns", "per_call_ns",
              "stdout", "stderr", "exit_code", "valid", "script_sha256")
    rng = random.Random(SEED)
    with output.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        for iteration in range(1, REPETITIONS + 1):
            cases = list(baseline.TESTS)
            rng.shuffle(cases)
            for test in cases:
                order = baseline.ENGINES if iteration % 2 else baseline.ENGINES[::-1]
                for engine in order:
                    row = invoke(engine, test, n_by_test[test])
                    row["iteration"] = iteration
                    writer.writerow(row)
                    f.flush()
                    if not row["valid"]:
                        raise RuntimeError(f"measurement invalid: {engine} {test} iteration={iteration}")
        print(f"wrote {output}")


def summarize() -> None:
    path = RAW / "repeated.csv"
    with path.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    if len(rows) != len(baseline.TESTS) * len(baseline.ENGINES) * REPETITIONS:
        raise RuntimeError("incomplete raw data")
    if not all(r["valid"] == "True" for r in rows):
        raise RuntimeError("invalid raw data")
    result = []
    for test in baseline.TESTS:
        values = {}
        for engine in baseline.ENGINES:
            selected = [r for r in rows if r["engine"] == engine and r["test"] == test]
            if len(selected) != REPETITIONS or len({r["n"] for r in selected}) != 1:
                raise RuntimeError(f"sample count or N mismatch: {engine} {test}")
            sample = sorted(float(r["per_call_ns"]) for r in selected)
            values[engine] = sample
        q, v = values["quickjs"], values["v8_ignition"]
        def stats(x: list[float], prefix: str) -> dict[str, object]:
            half = len(x) // 2
            return {f"{prefix}_median_ns": statistics.median(x),
                    f"{prefix}_mean_ns": statistics.mean(x),
                    f"{prefix}_stddev_ns": statistics.stdev(x),
                    f"{prefix}_iqr_ns": statistics.median(x[half:]) - statistics.median(x[:half]),
                    f"{prefix}_min_ns": x[0], f"{prefix}_max_ns": x[-1]}
        result.append({"test": test, "n": next(int(r["n"]) for r in rows if r["test"] == test),
                       **stats(q, "quickjs"), **stats(v, "v8"),
                       "ratio_v8_over_quickjs": statistics.median(v) / statistics.median(q)})
    write_csv_new(SUMMARY / "repeated_summary.csv", result, tuple(result[0]))
    geomean = math.exp(statistics.mean(math.log(r["ratio_v8_over_quickjs"]) for r in result))
    print(f"QuickJS lower: {sum(r['ratio_v8_over_quickjs'] > 1 for r in result)}/26")
    print(f"V8 lower: {sum(r['ratio_v8_over_quickjs'] < 1 for r in result)}/26")
    print(f"ratio geomean: {geomean:.9f}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("correctness", "calibrate", "measure", "summarize"))
    args = parser.parse_args()
    {"correctness": correctness, "calibrate": calibrate,
     "measure": measure, "summarize": summarize}[args.action]()


if __name__ == "__main__":
    main()
