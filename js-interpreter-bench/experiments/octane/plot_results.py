#!/usr/bin/env python3
"""Render Octane per-suite V8/QuickJS ratios as a self-contained SVG."""

from __future__ import annotations

import csv
from html import escape
import math
from pathlib import Path

HERE = Path(__file__).resolve().parent
SUMMARY = HERE / "summary.csv"
OUTPUT = HERE / "plots" / "ratio_by_suite.svg"
MODES = (("fixed_source_to_finish", "#21466f", "Fixed source-to-finish"),
         ("native_frontend_amortized", "#d47a35", "Octane harness / run"))


def main() -> None:
    with SUMMARY.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    cases = list(dict.fromkeys(row["case"] for row in rows))
    lookup = {(row["mode"], row["case"]): float(row["ratio_v8_over_quickjs"])
              for row in rows}
    if len(lookup) != len(cases) * len(MODES) or any(v <= 0 for v in lookup.values()):
        raise RuntimeError("incomplete/invalid Octane summary")
    values = [math.log2(v) for v in lookup.values()]
    low, high = math.floor(min(values + [0])), math.ceil(max(values + [0]))
    low, high = min(low, -1), max(high, 1)
    width, left, right, row_height = 1050, 180, 100, 38
    top, height = 125, 125 + row_height * len(cases) + 90
    plot_width = width - left - right

    def x(position: float) -> float:
        return left + (position - low) / (high - low) * plot_width

    items = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" '
             f'viewBox="0 0 {width} {height}">',
             '<rect width="100%" height="100%" fill="white"/>',
             '<text x="30" y="35" font-family="Arial" font-size="23" fill="#1b3656">'
             'Octane 2.0: V8 Ignition / QuickJS median ratio</text>',
             '<text x="30" y="63" font-family="Arial" font-size="14" fill="#444">'
             'Ratio &lt; 1: V8 lower time; ratio &gt; 1: QuickJS lower time. '
             'The two modes have different timing boundaries.</text>']
    for i, (_, color, label) in enumerate(MODES):
        y = 90 + 25 * i
        items.extend((f'<circle cx="195" cy="{y-5}" r="6" fill="{color}"/>',
                      f'<text x="210" y="{y}" font-family="Arial" font-size="14">'
                      f'{escape(label)}</text>'))
    for tick in range(low, high + 1):
        xpos = x(tick)
        items.append(f'<line x1="{xpos:.1f}" y1="{top-10}" x2="{xpos:.1f}" '
                     f'y2="{top+row_height*len(cases)}" stroke="'
                     f'{"#2b455f" if tick == 0 else "#dce3ea"}" '
                     f'stroke-width="{2 if tick == 0 else 1}"/>')
        items.append(f'<text x="{xpos:.1f}" y="{top+row_height*len(cases)+26}" '
                     f'text-anchor="middle" font-family="Arial" font-size="13">'
                     f'{2**tick:g}x</text>')
    for index, case in enumerate(cases):
        y = top + index * row_height + 18
        items.append(f'<text x="{left-14}" y="{y+4}" text-anchor="end" '
                     f'font-family="Arial" font-size="14">{escape(case)}</text>')
        for mode, color, _ in MODES:
            ratio = lookup[mode, case]
            cy = y + (-7 if mode == MODES[0][0] else 7)
            items.append(f'<circle cx="{x(math.log2(ratio)):.1f}" cy="{cy}" r="6" '
                         f'fill="{color}"><title>{escape(case)} / {escape(mode)}: '
                         f'{ratio:.4f}x</title></circle>')
    items.append('</svg>')
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT.open("x", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(items) + "\n")
    print(OUTPUT)


if __name__ == "__main__":
    main()
