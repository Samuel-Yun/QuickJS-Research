"""Render the newly generated deck with PowerPoint; never edit its contents.

Close only the presentation opened here. Quit the app only if PowerPoint was
not running when invoked. No benchmark or engine executable is invoked.
"""
import argparse
import csv
import io
import json
from pathlib import Path
import subprocess

import pythoncom
import win32com.client


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("pptx", type=Path)
    ap.add_argument("output", type=Path)
    args = ap.parse_args()
    pptx = args.pptx.resolve(strict=True)
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    tasklist = subprocess.run(
        ["tasklist", "/FI", "IMAGENAME eq POWERPNT.EXE", "/FO", "CSV", "/NH"],
        capture_output=True, text=True, errors="replace", check=True,
        creationflags=subprocess.CREATE_NO_WINDOW,
    ).stdout
    existing = [r for r in csv.reader(io.StringIO(tasklist)) if r and r[0].lower() == "powerpnt.exe"]
    audit = {"source": str(pptx), "renderer": "Microsoft PowerPoint COM", "existing_processes": existing, "slides": []}
    pythoncom.CoInitialize()
    app = None
    presentation = None
    try:
        app = win32com.client.DispatchEx("PowerPoint.Application")
        audit["powerpoint_version"] = str(app.Version)
        presentation = app.Presentations.Open(str(pptx), -1, 0, 0)
        width = float(presentation.PageSetup.SlideWidth)
        height = float(presentation.PageSetup.SlideHeight)
        audit["size_pt"] = [width, height]
        for slide in presentation.Slides:
            index = int(slide.SlideIndex)
            png = output / f"slide_{index:02d}.png"
            slide.Export(str(png), "PNG", 1600, 900)
            row = {"page": index, "png": png.name, "text_frames": [], "tables": 0}

            def inspect(shape):
                if shape.Type == 6:
                    for child in shape.GroupItems:
                        inspect(child)
                if shape.HasTable:
                    row["tables"] += 1
                if shape.HasTextFrame and shape.TextFrame.HasText:
                    tr = shape.TextFrame2.TextRange
                    box = [float(shape.Left), float(shape.Top), float(shape.Width), float(shape.Height)]
                    ink = [float(tr.BoundLeft), float(tr.BoundTop), float(tr.BoundWidth), float(tr.BoundHeight)]
                    row["text_frames"].append({
                        "text": str(shape.TextFrame.TextRange.Text), "box_pt": box, "ink_pt": ink,
                        "off_slide": ink[0] < -0.5 or ink[1] < -0.5 or ink[0]+ink[2] > width+0.5 or ink[1]+ink[3] > height+0.5,
                    })
            for shape in slide.Shapes:
                inspect(shape)
            audit["slides"].append(row)
        presentation.SaveAs(str(output / "weekly_20261017_pptmaster.pdf"), 32)
        audit["slide_count"] = len(audit["slides"])
        audit["off_slide_text_count"] = sum(t["off_slide"] for s in audit["slides"] for t in s["text_frames"])
        audit["status"] = "RENDERED"
    finally:
        if presentation is not None:
            presentation.Close()
        if app is not None and not existing:
            app.Quit()
        pythoncom.CoUninitialize()
        (output / "powerpoint_render.json").write_text(json.dumps(audit, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps({k: audit[k] for k in ("status", "slide_count", "off_slide_text_count", "powerpoint_version")}, ensure_ascii=False))


if __name__ == "__main__":
    main()
