"""Offline evidence/TeX checks; compile only if XeLaTeX is already installed.

Never invokes a VM, an experiment runner, an installer or a network service.
Old main.tex, validation.json and the old ZIP are read-only inputs.
"""
import csv
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def norm(s):
    return " ".join(s.strip().split())


def without_comments(text):
    lines = []
    for line in text.splitlines():
        for i, ch in enumerate(line):
            if ch == "%":
                before = line[:i]
                count = len(before) - len(before.rstrip("\\"))
                if count % 2 == 0:
                    line = before
                    break
        lines.append(line)
    return "\n".join(lines)


def main():
    old = json.loads((HERE / "validation.json").read_text(encoding="utf-8"))
    changed = [p for p, h in old["source_hashes"].items() if sha(ROOT / p) != h]
    assert not changed, changed
    assert sha(HERE / "main.tex") == "266110d52471c287161aa85369c04ffd9b635b357db172673f47eb51cf89aff0"
    assert sha(HERE / "weekly_20261017_overleaf.zip") == "54803cbc94e750b9431dc9a13ca6b8558efbdf09c86ea0c53dbb512afe0c84fb"
    assert sha(HERE / "notes_original.md") == "e10993912d16cb945d7db08f8a1b9d0a84656b2f3f7acb25263964430cc4ffcb"

    # Reuse the old read-only evidence reader, not its main()/packaging function.
    spec = importlib.util.spec_from_file_location("old_report_evidence", HERE / "validate_report.py")
    ev = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(ev)
    s1, n1, cohort1 = ev.formal("S1")
    s2, n2, cohort2 = ev.formal("S2")
    assert n1 == 180 and n2 == 240 and cohort1 == cohort2

    tex = (HERE / "main_fixed.tex").read_text(encoding="utf-8")
    original = (HERE / "main.tex").read_text(encoding="utf-8")
    assert not any(c in tex for c in ("\u00a0", "\u200b", "\ufeff"))
    assert "**" not in tex
    assert "fontset=fandol" in tex and r"\setmonofont{Latin Modern Mono}" in tex
    assert "ctexbeamer" in tex and "aspectratio=169" in tex and r"\date{}" in tex
    assert r"\setbeamertemplate{footline}{}" in tex
    assert r"\insertframenumber" not in tex and r"\inserttotalframenumber" not in tex
    assert not re.search(r"\\(?:input|include|includegraphics|write18|resizebox|scalebox)\b|\bshrink\b|minted", tex)
    frames = list(re.finditer(r"\\begin\{frame\}(\[[^\]]*\])?\{([^}]*)\}(.*?)\\end\{frame\}", tex, re.S))
    assert len(frames) == 8 and sum(m.start() < tex.index(r"\appendix") for m in frames) == 6
    for context in (r"WSL2 Ubuntu24.04.2/x86\_64", "QuickJS 2026-06-04", "V8 15.6.21 Ignition", "--max-opt=0 --no-lazy", "更新 sum，弹出栈顶。"):
        assert context in frames[0][3]
    blocks = [re.findall(r"\\begin\{lstlisting\}\s*\n(.*?)\\end\{lstlisting\}", m[3], re.S) for m in frames]
    for frame, listings in zip(frames, blocks):
        assert not listings or "fragile" in (frame[1] or "")
        for block in listings:
            assert not any(not line.strip() for line in block.strip("\n").splitlines())
            assert r"\<" not in block

    clean = re.sub(r"\\begin\{lstlisting\}.*?\\end\{lstlisting\}", "", tex, flags=re.S)
    assert not re.search(r"\\{2,}%", clean), "extra slash before percent"
    clean = without_comments(clean)
    stack = []
    for match in re.finditer(r"\\(begin|end)\{([^}]+)\}", clean):
        if match[1] == "begin":
            stack.append(match[2])
        else:
            assert stack and stack.pop() == match[2], match[0]
    assert not stack
    depth = 0
    for match in re.finditer(r"(?<!\\)[{}]", clean):
        depth += 1 if match[0] == "{" else -1
        assert depth >= 0
    assert depth == 0
    outside_code = re.sub(r"\\code\{[^}]*\}", "", clean)
    assert not re.search(r"(?<!\\)_", outside_code)
    outside_tables = re.sub(r"\\begin\{tabular\}.*?\\end\{tabular\}", "", outside_code, flags=re.S)
    assert not re.search(r"(?<!\\)&", outside_tables)
    table_rows = []
    for table in re.finditer(r"\\begin\{tabular\}\{([^\n]+)\}\n(.*?)\\end\{tabular\}", clean, re.S):
        cols = len(re.findall(r"[lcr]", table[1]))
        nrows = 0
        for line in table[2].splitlines():
            line = line.strip()
            if not line or line in (r"\toprule", r"\midrule", r"\bottomrule"):
                continue
            assert line.endswith(r"\\")
            assert len(line) - len(line.rstrip("\\")) == 2
            assert len(re.findall(r"(?<!\\)&", line)) == cols - 1
            assert line != r"\\"
            nrows += 1
        table_rows.append({"columns": cols, "rows": nrows})
    assert table_rows == [{"columns": 5, "rows": 5}, {"columns": 3, "rows": 4}, {"columns": 3, "rows": 3}]

    # Data are recalculated from the existing formal records, not newly run.
    for number in (s1["numeric_loop"]["quickjs"]["median_us"], s1["numeric_loop"]["v8"]["median_us"], s1["numeric_loop"]["ratio"]):
        assert f"{number:.3f}" in frames[0][3]
    labels = {"inline": "直接计算", "direct_call": "普通调用", "own_method": "own 方法", "prototype_method": "prototype 方法"}
    for key, label in labels.items():
        line = next(l for l in frames[1][3].splitlines() if l.strip().startswith(label + " &"))
        for value in (s2[key]["quickjs"]["median_us"], s2[key]["v8"]["median_us"], s2[key]["ratio"]):
            assert f"{value:.3f}" in line
    js = (ev.DIRS["S1"] / "cases/numeric_loop.js").read_text(encoding="utf-8")
    js = re.sub(r"//[^\n]*", "", js)
    assert js.strip() == blocks[0][0].strip(), "numeric source must match real file, including code whitespace"
    for filename, function in (("direct_call.js", "stepPlain"), ("own_method.js", "stepMethod")):
        displayed = re.search(r"function " + function + r"\([^}]+\}", blocks[1][0])[0]
        source = (ev.DIRS["S2"] / "cases" / filename).read_text(encoding="utf-8")
        assert re.sub(r"\s+", "", displayed) in re.sub(r"\s+", "", source)
    old_frames = list(re.finditer(r"\\begin\{frame\}(\[[^\]]*\])?\{([^}]*)\}(.*?)\\end\{frame\}", original, re.S))
    old_blocks = [re.findall(r"\\begin\{lstlisting\}\s*\n(.*?)\\end\{lstlisting\}", m[3], re.S) for m in old_frames]
    assert blocks[0][1:] == old_blocks[0][1:]
    s3 = ev.DIRS["S3"]
    qstate, qlines = ev.decoded_lines(s3 / "bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.decoded.json")
    vstate, vlines = ev.decoded_lines(s3 / "bytecode/v8/TaskControlBlock.isHeldOrSuspended.decoded.json")
    assert [norm(x) for x in blocks[3][1].strip().splitlines()] == qlines[2:13]
    assert [norm(x) for x in blocks[3][2].strip().splitlines()] == vlines[:10]
    assert [norm(x) for x in blocks[6][0].strip().splitlines()] == qlines
    assert [norm(x) for x in blocks[7][0].strip().splitlines()] == vlines
    original_richards = (ROOT / "benchmarks/octane/upstream/richards.js").read_text(encoding="utf-8")
    for block in blocks[2] + [blocks[3][0]]:
        assert re.sub(r"\s+", "", block) in re.sub(r"\s+", "", original_richards)

    qjs = ROOT / "engines/quickjs-upstream/quickjs.c"
    identity = json.loads((ev.DIRS["S1"] / "source_evidence/quickjs_source_identity.json").read_text(encoding="utf-8"))
    assert sha(qjs) == identity["quickjs.c"]["frozen_source_sha256"]
    lines = qjs.read_text(encoding="utf-8").splitlines()
    assert [norm(x) for x in blocks[4][0].strip().splitlines()] == [norm(x) for x in lines[19125:19133]]
    assert len(blocks[4][0].strip().splitlines()) == 8
    # Existing diagnostic evidence is immutable; preserve qualifiers in the report.
    for token in ("10671", "10115", "85/9", "1718ms", "2223ms", r"29\%"):
        assert token in frames[5][3]
    assert "1229" in frames[2][3] and "5393" in frames[2][3]
    assert "待验证解释" in frames[4][3] and "UNKNOWN" in frames[4][3]

    # Only a planning estimate, NOT font metrics, TeX overflow detection or rendering.
    width_pt = 144 / 25.4 * 72.27
    width_estimates = []
    for number, frame in enumerate(frames, 1):
        for j, match in enumerate(re.finditer(r"\\begin\{lstlisting\}\s*\n(.*?)\\end\{lstlisting\}", frame[3], re.S), 1):
            prefix = frame[3][:match.start()]
            columns = list(re.finditer(r"\\begin\{column\}\{([0-9.]+)\\textwidth\}", prefix))
            fraction = float(columns[-1][1]) if columns and prefix.rfind(r"\end{column}") < columns[-1].start() else 1.0
            max_chars = max(map(len, match[1].strip("\n").splitlines()))
            width_estimates.append({"page": number, "block": j, "max_chars": max_chars, "available_pt": round(width_pt * fraction, 2), "estimated_code_pt": round(max_chars * 9.4 * 0.525, 2)})

    xelatex = shutil.which("xelatex")
    compilation = {"status": "NOT_RUN_MISSING_COMPILER", "xelatex": xelatex, "latexmk": shutil.which("latexmk"), "actual_pdf_pages": None, "overflow_check": "NOT_RUN", "missing_glyph_check": "NOT_RUN", "visual_check": "NOT_RUN", "windows_and_wsl_checked": True}
    if xelatex:
        build = HERE / "build_fixed"
        build.mkdir(exist_ok=True)
        for _ in range(2):
            subprocess.run([xelatex, "-interaction=nonstopmode", "-halt-on-error", "-file-line-error", "-output-directory=" + str(build), "main_fixed.tex"], cwd=HERE, check=True)
        log = (build / "main_fixed.log").read_text(encoding="utf-8", errors="replace")
        assert not re.search(r"Overfull \\[hv]box|Missing character:", log)
        import fitz
        with fitz.open(build / "main_fixed.pdf") as doc:
            assert len(doc) == 8
        compilation.update(status="COMPILED_LOG_AND_PAGE_COUNT_CHECKED", actual_pdf_pages=8, overflow_check="PASS", missing_glyph_check="PASS")
        shutil.copy2(build / "main_fixed.pdf", HERE / "main_fixed.pdf")

    members = ["main_fixed.tex", "notes.md", "README_Overleaf.md"]
    archive = HERE / "weekly_20261017_fixed_overleaf.zip"
    with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED) as z:
        for name in members:
            z.write(HERE / name, name)
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None and sorted(z.namelist()) == sorted(members)
        assert all(z.read(n) == (HERE / n).read_bytes() for n in members)
    report = {"status": "OFFLINE_CHECKS_PASS_COMPILATION_NOT_VERIFIED" if not xelatex else "OFFLINE_AND_COMPILER_CHECKS_PASS_VISUAL_REVIEW_PENDING",
              "date": "2026-10-18", "cutoff": "2026-10-17", "frames": {"main": 6, "appendix": 2, "with_listings": 7},
              "prior_sources_unchanged": len(old["source_hashes"]), "formal_records_reread": {"S1": n1, "S2": n2},
              "cohort": cohort1, "tables": table_rows, "bytecode": {"main_qjs_offsets": [2, 19], "main_v8_offsets": [0, 19], "appendices_exact_match": True},
              "c_excerpt": {"path": str(qjs.relative_to(ROOT)), "lines": [19126, 19133], "lines_count": 8, "tokens_and_macro_continuations_match": True, "sha256": sha(qjs)},
              "compilation": compilation, "code_width_estimates_only": width_estimates,
              "original_main_sha256": sha(HERE / "main.tex"), "fixed_main_sha256": sha(HERE / "main_fixed.tex"), "package_members": members,
              "no_experiment_executed": True, "no_vm_source_changed": True}
    (HERE / "validation_fixed.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(report["status"])
    print("6+2 frames; 420 existing formal records reread; true bytecode and 8 C lines matched.")
    for row in width_estimates:
        if row["estimated_code_pt"] > row["available_pt"]:
            print("ESTIMATED_CODE_WIDTH_EXCEEDS_COLUMN", row)
    print(json.dumps(compilation, ensure_ascii=False))
    print(archive)


if __name__ == "__main__":
    main()
