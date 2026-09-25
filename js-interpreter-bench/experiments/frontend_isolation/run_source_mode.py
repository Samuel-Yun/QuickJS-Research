#!/usr/bin/env python3
"""Read/verify the frozen source-to-finish baseline; never rerun it."""

import csv
import math
from pathlib import Path
import statistics

ROOT = Path(__file__).resolve().parents[2]
RAW = ROOT / "results/raw/sunspider.csv"
SUMMARY = ROOT / "results/processed/sunspider_summary.csv"


def main() -> None:
    with RAW.open(encoding="utf-8", newline="") as f:
        raw = list(csv.DictReader(f))
    with SUMMARY.open(encoding="utf-8", newline="") as f:
        summary = list(csv.DictReader(f))
    if len(raw) != 1560 or len(summary) != 26 or any(r["valid"] != "true" for r in raw):
        raise RuntimeError("frozen source-mode baseline is incomplete/invalid")
    ratios = [float(row["v8_over_quickjs_ratio"]) for row in summary]
    print(f"Existing source-to-finish: {len(summary)} cases, {len(raw)} samples")
    print(f"QuickJS lower median: {sum(r > 1 for r in ratios)}/26")
    print(f"V8 lower median: {sum(r < 1 for r in ratios)}/26")
    print(f"ratio geomean: {math.exp(statistics.mean(map(math.log, ratios))):.9f}")
    print("No new process was launched; no baseline data was changed.")


if __name__ == "__main__":
    main()
