#!/usr/bin/env python3
"""Independent arithmetic and provenance audit of the internal-timing data."""

from __future__ import annotations

from collections import Counter
import csv
import json
import math
from pathlib import Path
import statistics

import run_internal as e

OUTPUT = e.SUMMARY / "audit.json"


def main() -> None:
    expected = e.checked_inputs()
    e.require_correctness()
    e.require_workload_bytecode()
    selected = e.selected_n(expected)
    e.require_full_n_correctness(selected)
    raw = e.rows(e.MEASUREMENTS)
    summary = e.rows(e.STATS)
    comparison = e.rows(e.COMPARISON)
    overview = json.loads(e.OVERVIEW.read_text(encoding="utf-8"))
    if len(raw) != 26 * 2 * 30 or len(summary) != 26 or len(comparison) != 26:
        raise RuntimeError("unexpected row counts")
    groups = Counter((r["test"], r["engine"]) for r in raw)
    if set(groups) != {(test, engine) for test in e.baseline.TESTS for engine in e.ENGINES} \
            or set(groups.values()) != {30}:
        raise RuntimeError("sample groups incomplete")
    for row in raw:
        test, engine, n = row["test"], row["engine"], int(row["n"])
        elapsed_ms = int(row["elapsed_ms"])
        if row["valid"] != "True" or row["exit_code"] != "0" or row["stderr"] or \
                n != selected[test] or row["checksum"] != expected[test, engine] or \
                int(row["elapsed_ns"]) != elapsed_ms * 1_000_000 or \
                not math.isclose(float(row["per_call_ns"]), elapsed_ms * 1_000_000 / n,
                                 rel_tol=1e-14) or \
                row["script_sha256"] != e.sha256(e.GENERATED / f"{test}-n{n}.js"):
            raise RuntimeError(f"invalid raw row: {test} {engine} {row['iteration']}")
    for test in e.baseline.TESTS:
        subset = [r for r in raw if r["test"] == test]
        if len({r["script_sha256"] for r in subset}) != 1:
            raise RuntimeError(f"different JS workload across engines: {test}")
        for engine in e.ENGINES:
            iterations = [int(r["iteration"]) for r in subset if r["engine"] == engine]
            if sorted(iterations) != list(range(1, 31)):
                raise RuntimeError(f"missing/repeated iteration: {test} {engine}")
    by_test = {r["test"]: r for r in summary}
    for test in e.baseline.TESTS:
        medians = {}
        for engine in e.ENGINES:
            sample = [float(r["per_call_ns"]) for r in raw
                      if r["test"] == test and r["engine"] == engine]
            medians[engine] = statistics.median(sample)
        ratio = medians["v8_ignition"] / medians["quickjs"]
        if not math.isclose(ratio, float(by_test[test]["ratio_v8_over_quickjs"]),
                            rel_tol=1e-12):
            raise RuntimeError(f"summary ratio differs from raw: {test}")
    internal_ratios = [float(r["ratio_v8_over_quickjs"]) for r in summary]
    geomean = math.exp(statistics.mean(map(math.log, internal_ratios)))
    if not math.isclose(geomean, overview["internal_execution_ratio"]["geomean"],
                        rel_tol=1e-12):
        raise RuntimeError("geomean differs from summary")
    report = {
        "status": "PASS", "formal_rows": len(raw),
        "formal_groups": len(groups), "samples_per_group": 30,
        "all_call_correctness_rows": len(e.rows(e.RAW / "full_n_correctness.csv")),
        "eager_bytecode_cases": len(e.rows(e.HERE / "evidence/workload_bytecode/summary.csv")),
        "n_min": min(selected.values()), "n_max": max(selected.values()),
        "formal_below_calibration_target_1000ms": sum(int(r["elapsed_ms"]) < 1000 for r in raw),
        "formal_min_elapsed_ms": min(int(r["elapsed_ms"]) for r in raw),
        "formal_max_elapsed_ms": max(int(r["elapsed_ms"]) for r in raw),
        "internal_ratio_geomean": geomean,
        "internal_quickjs_lower_cases": sum(x > 1 for x in internal_ratios),
        "internal_v8_lower_cases": sum(x < 1 for x in internal_ratios),
        "raw_sha256": e.sha256(e.MEASUREMENTS),
        "summary_sha256": e.sha256(e.STATS),
        "comparison_sha256": e.sha256(e.COMPARISON),
    }
    with OUTPUT.open("x", encoding="utf-8", newline="\n") as f:
        json.dump(report, f, indent=2)
        f.write("\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
