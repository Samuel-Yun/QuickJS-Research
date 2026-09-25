#!/usr/bin/env python3
"""Compare descriptive ratios; do not interpret differences as causal effects."""

import csv
import math
from pathlib import Path
import statistics

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent


def read(path: Path) -> dict[str, dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as f:
        return {row["test"]: row for row in csv.DictReader(f)}


def main() -> None:
    old = read(ROOT / "results/processed/sunspider_summary.csv")
    new = read(HERE / "summary/repeated_summary.csv")
    if set(old) != set(new) or len(old) != 26:
        raise RuntimeError("case set mismatch")
    old_rank = {test: rank for rank, test in enumerate(
        sorted(old, key=lambda t: float(old[t]["v8_over_quickjs_ratio"])), 1)}
    new_rank = {test: rank for rank, test in enumerate(
        sorted(new, key=lambda t: float(new[t]["ratio_v8_over_quickjs"])), 1)}
    rows = []
    for test in old:
        old_ratio = float(old[test]["v8_over_quickjs_ratio"])
        new_ratio = float(new[test]["ratio_v8_over_quickjs"])
        rows.append({"test": test, "source_ratio": old_ratio,
                     "repeated_ratio": new_ratio, "ratio_fold_change": new_ratio / old_ratio,
                     "source_rank_ascending": old_rank[test],
                     "repeated_rank_ascending": new_rank[test],
                     "rank_change": new_rank[test] - old_rank[test]})
    destination = HERE / "summary/comparison.csv"
    with destination.open("x", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=tuple(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    for key in ("source_ratio", "repeated_ratio"):
        ratios = [row[key] for row in rows]
        print(f"{key}: QuickJS lower {sum(x > 1 for x in ratios)}/26; "
              f"geomean {math.exp(statistics.mean(map(math.log, ratios))):.9f}")
    for row in sorted(rows, key=lambda r: abs(r["rank_change"]), reverse=True)[:8]:
        print(f"rank shift: {row['test']}: {row['source_rank_ascending']} -> "
              f"{row['repeated_rank_ascending']}; ratio {row['source_ratio']:.3f} -> "
              f"{row['repeated_ratio']:.3f}")


if __name__ == "__main__":
    main()
