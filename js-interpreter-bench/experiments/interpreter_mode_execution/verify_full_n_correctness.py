#!/usr/bin/env python3
"""Separate untimed check of every selected-N workload call, both shells."""

from __future__ import annotations

import csv
import json
from pathlib import Path
import subprocess

import run_internal as experiment

HERE = experiment.HERE
OUTPUT = HERE / "raw" / "full_n_correctness.csv"
GENERATED = HERE / "generated" / "full_n_correctness_v2"
FIELDS = ("test", "engine", "n", "status", "exit_code", "stdout", "stderr", "script_sha256")


def main() -> None:
    expected = experiment.checked_inputs()
    experiment.require_correctness()
    n_by_test = experiment.selected_n(expected)
    if OUTPUT.exists():
        raise RuntimeError(f"refusing to overwrite {OUTPUT}")
    GENERATED.mkdir(parents=True, exist_ok=True)
    with OUTPUT.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS)
        writer.writeheader()
        failed = 0
        for test in experiment.baseline.TESTS:
            n = n_by_test[test]
            source = experiment.previous.source_path(test).read_text(encoding="utf-8")
            allowed = sorted({expected[test, engine] for engine in experiment.ENGINES})
            content = (
                "function workload() {\n" + source + "\nreturn String(" +
                experiment.previous.CHECKSUM[test] + ");\n}\n" +
                f"var allowedChecksums = {json.dumps(allowed, ensure_ascii=False)};\n" +
                "var lastResult;\n" +
                f"for (var repeatIndex = 0; repeatIndex < {n}; ++repeatIndex) {{\n" +
                "  lastResult = workload();\n" +
                "  if (allowedChecksums.indexOf(lastResult) < 0)\n" +
                "    throw Error('checksum changed at call ' + repeatIndex + ': ' + lastResult);\n" +
                "}\n" +
                f"console.log('CHECK_ALL:' + JSON.stringify({{test:{json.dumps(test)},n:{n},"
                "checksum:lastResult}));\n"
            )
            script = GENERATED / f"{test}-n{n}.js"
            with script.open("x", encoding="utf-8", newline="\n") as out:
                out.write(content)
            for engine in experiment.ENGINES:
                try:
                    p = subprocess.run(experiment.command(engine, script), cwd=experiment.ROOT,
                                       env=experiment.baseline.environments()[engine],
                                       capture_output=True, timeout=experiment.TIMEOUT_SECONDS,
                                       check=False)
                    stdout = experiment.baseline.normalize_output(p.stdout)
                    stderr = experiment.baseline.normalize_output(p.stderr)
                    code = p.returncode
                except (OSError, subprocess.TimeoutExpired) as error:
                    stdout, stderr, code = "", str(error), -1
                valid = code == 0 and stderr == "" and stdout.startswith("CHECK_ALL:")
                if valid:
                    try:
                        payload = json.loads(stdout[len("CHECK_ALL:"):])
                        valid = payload == {"test": test, "n": n,
                                            "checksum": expected[test, engine]}
                    except ValueError:
                        valid = False
                row = {"test": test, "engine": engine, "n": n,
                       "status": "PASS" if valid else "FAIL", "exit_code": code,
                       "stdout": stdout, "stderr": stderr,
                       "script_sha256": experiment.sha256(script)}
                writer.writerow(row)
                f.flush()
                failed += not valid
                print(f"{test} {engine}: {row['status']}", flush=True)
    if failed:
        raise RuntimeError(f"full-N correctness failed: {failed} cases")


if __name__ == "__main__":
    main()
