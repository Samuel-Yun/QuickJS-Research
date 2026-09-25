#!/usr/bin/env python3
"""N=1 control for the wrapper scope used by repeated mode (not a new engine mode)."""

import argparse
import csv
import math
import random
import statistics

import run_repeated_mode as repeated

RAW = repeated.RAW / "wrapped_once_control.csv"
SUMMARY = repeated.SUMMARY / "wrapped_once_control_summary.csv"
REPETITIONS = 30
SEED = 20260925


def measure() -> None:
    repeated.checked_inputs()
    repeated.require_correctness()
    if RAW.exists():
        raise RuntimeError(f"refusing to overwrite {RAW}")
    rng = random.Random(SEED)
    fields = ("engine", "test", "iteration", "n", "wall_time_ns", "per_call_ns",
              "stdout", "stderr", "exit_code", "valid", "script_sha256")
    with RAW.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        for iteration in range(1, REPETITIONS + 1):
            cases = list(repeated.baseline.TESTS)
            rng.shuffle(cases)
            for test in cases:
                order = repeated.baseline.ENGINES if iteration % 2 else repeated.baseline.ENGINES[::-1]
                for engine in order:
                    row = repeated.invoke(engine, test, 1)
                    row["iteration"] = iteration
                    writer.writerow(row)
                    f.flush()
                    if not row["valid"]:
                        raise RuntimeError(f"invalid: {engine} {test} iteration={iteration}")


def summarize() -> None:
    with RAW.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    if len(rows) != 26 * 2 * REPETITIONS or any(r["valid"] != "True" for r in rows):
        raise RuntimeError("incomplete or invalid control data")
    summary = []
    for test in repeated.baseline.TESTS:
        values = {engine: sorted(int(r["wall_time_ns"]) for r in rows
                                 if r["test"] == test and r["engine"] == engine)
                  for engine in repeated.baseline.ENGINES}
        if any(len(v) != REPETITIONS for v in values.values()):
            raise RuntimeError(f"sample count mismatch: {test}")
        q, v = values["quickjs"], values["v8_ignition"]
        summary.append({"test": test, "quickjs_median_ns": statistics.median(q),
                        "v8_median_ns": statistics.median(v),
                        "ratio_v8_over_quickjs": statistics.median(v) / statistics.median(q)})
    repeated.write_csv_new(SUMMARY, summary, tuple(summary[0]))
    ratios = [r["ratio_v8_over_quickjs"] for r in summary]
    print(f"wrapped once: QuickJS lower {sum(x > 1 for x in ratios)}/26; "
          f"geomean {math.exp(statistics.mean(map(math.log, ratios))):.9f}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("measure", "summarize"))
    {"measure": measure, "summarize": summarize}[parser.parse_args().action]()
