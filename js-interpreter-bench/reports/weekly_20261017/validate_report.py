"""Read existing evidence, validate editable TeX, package three-file Overleaf ZIP.
Never imports experiment runners and never invokes a JS engine.
"""
import csv
import hashlib
import json
import math
import re
import shutil
import statistics
import subprocess
import zipfile
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
WORK = ROOT.parent
DIRS = {k: ROOT / "experiments" / folder / "attempt01" for k, folder in (
    ("S1", "bytecode_whitebox_simple"),
    ("S2", "call_path_followup"),
    ("S3", "richards_site_attribution"),
)}
seen = {}


def content(path):
    data = path.read_bytes()
    seen[path] = hashlib.sha256(data).hexdigest()
    return data.decode("utf-8")


def load(path):
    return json.loads(content(path))


def rows(path):
    return list(csv.DictReader(content(path).splitlines()))


def csv_rows(path):
    # Multiline stdout fields in the timing CSV must not be flattened.
    content(path)
    with path.open(encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def close(x, y):
    assert math.isclose(float(x), float(y), rel_tol=1e-12, abs_tol=1e-9), (x, y)


def formal(label):
    base = DIRS[label]
    m = load(base / "manifest.json")
    raw = csv_rows(base / "raw/timing.csv")
    sums = {(x["case"], x["engine"]): x for x in rows(base / "summary.csv")}
    groups = defaultdict(list)
    for x in raw:
        assert x["valid"] == "True" and x["exit_code"] == "0"
        name = re.split(r"[/\\]", x["record"])[-1]
        rec = load(base / "raw/formal" / name)
        assert rec["exit_code"] == 0
        found = re.findall(r"^WB_RESULT (.+)$", rec["stdout"], re.M)
        assert len(found) == 1
        p = json.loads(found[0])
        assert p["N"] == int(x["N"]) and p["checksum"] == int(x["checksum"])
        close(p["elapsed_ms"], x["elapsed_ms"])
        close(p["elapsed_ms"] / p["N"], x["elapsed_per_call_ms"])
        assert rec["command"] == json.loads(x["command"])
        if x["engine"] == "v8":
            assert "--max-opt=0" in rec["command"] and "--no-lazy" in rec["command"]
        assert x["binary_sha256"] == m["engines"][x["engine"]]["binary"]["sha256"]
        groups[x["case"], x["engine"]].append(p["elapsed_ms"] / p["N"])
    assert all(len(v) == 30 for v in groups.values())
    result = {}
    for (case, engine), vals in groups.items():
        s = sums[case, engine]
        value = statistics.median(vals)
        close(value, s["median"] if label == "S1" else s["median_ms"])
        if case not in result:
            result[case] = {}
        result[case][engine] = dict(median_us=value * 1000, samples=len(vals))
    for case, d in result.items():
        d["ratio"] = d["v8"]["median_us"] / d["quickjs"]["median_us"]
        close(d["ratio"], sums[case, "v8"]["v8_over_quickjs"])
    return result, len(raw), m["cohort"]


def instruction(line):
    return " ".join(line.strip().split())


def decoded_lines(path):
    data = load(path)
    return data, [instruction(f'{x["offset"]} {x["opcode"]} {x["operands"]}') for x in data]


def check_subset(block, valid):
    actual = [instruction(x) for x in block.splitlines() if x.strip()]
    indexes = [valid.index(x) for x in actual]
    assert indexes == sorted(indexes) and len(set(indexes)) == len(indexes)
    return actual


def main():
    tex = content(HERE / "main.tex")
    frames = list(re.finditer(
        r"\\begin\{frame\}(\[[^\]]*\])?\{([^}]*)\}(.*?)\\end\{frame\}", tex, re.S
    ))
    assert len(frames) == 8
    assert sum(m.start() < tex.index(r"\appendix") for m in frames) == 6
    blocks = [re.findall(r"\\begin\{lstlisting\}\s*\n(.*?)\\end\{lstlisting\}", m[3], re.S) for m in frames]
    for m, b in zip(frames, blocks):
        if b:
            assert "fragile" in (m[1] or "")
    assert "fontset=fandol" in tex and r"\setmonofont{Latin Modern Mono}" in tex
    assert "aspectratio=169" in tex and r"\date{}" in tex
    assert not re.search(r"\\(?:input|include|includegraphics|write18|resizebox|scalebox|tiny)\b", tex)
    assert "minted" not in tex and "C:/" not in tex and "/mnt/" not in tex
    assert len(re.findall(r"\\PageMeta\{", tex)) == 8
    clean = re.sub(r"\\begin\{lstlisting\}.*?\\end\{lstlisting\}", "", tex, flags=re.S)
    clean = re.sub(r"(?<!\\)%[^\n]*", "", clean)
    stack = []
    for match in re.finditer(r"\\(begin|end)\{([^}]+)\}", clean):
        if match[1] == "begin":
            stack.append(match[2])
        else:
            assert stack and stack.pop() == match[2]
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

    s1, n1, cohort1 = formal("S1")
    s2, n2, cohort2 = formal("S2")
    assert n1 == 180 and n2 == 240 and cohort1 == cohort2
    numeric = s1["numeric_loop"]
    for number in (numeric["quickjs"]["median_us"], numeric["v8"]["median_us"], numeric["ratio"]):
        assert f"{number:.3f}" in frames[0][3]
    labels = {"inline": "直接计算", "direct_call": "普通调用", "own_method": "own 方法", "prototype_method": "prototype 方法"}
    for case, label in labels.items():
        line = next(x for x in frames[1][3].splitlines() if x.strip().startswith(label + " &"))
        for v in (s2[case]["quickjs"]["median_us"], s2[case]["v8"]["median_us"], s2[case]["ratio"]):
            assert f"{v:.3f}" in line
    js = content(DIRS["S1"] / "cases/numeric_loop.js")
    js = re.sub(r"//[^\n]*", "", js)
    assert re.sub(r"\s+", "", js) == re.sub(r"\s+", "", blocks[0][0])
    qloop = load(DIRS["S1"] / "bytecode/quickjs/wbNumericLoop.decoded.json")
    qloop_text = [instruction(f'{x["opcode"]} {x["operands"]}') for x in qloop]
    assert [instruction(x) for x in blocks[0][1].strip().splitlines()] == qloop_text[8:12]
    vd = content(DIRS["S1"] / "bytecode/v8/wbNumericLoop.txt")
    vloop = [instruction(m[1] + m[2]) for m in re.finditer(
        r"@\s*\d+\s*:\s*(?:[0-9a-f]{2}\s+)+([A-Z]\w*)([^\n]*)", vd
    )]
    vloop = [re.sub(r"\s+\(0x[0-9a-f]+\s+@\s+\d+\)$", "", x) for x in vloop]
    assert [instruction(x) for x in blocks[0][2].strip().splitlines()] == vloop[7:15]

    s3 = DIRS["S3"]
    site = rows(s3 / "summary/site_samples.csv")
    samples = load(s3 / "summary/sampling_summary.json")
    assert samples["pooled_context_on_internal"] == 5393
    assert samples["pooled_context_on_mapped_lookup"] == 1229
    totals = Counter()
    for x in site:
        totals[x["property"]] += int(x["lookup_samples"])
    assert (totals["currentTcb"], totals["state"], totals["run"]) == (280, 204, 79)
    for prop, count in (("currentTcb", 280), ("state", 204), ("run", 79)):
        assert f"{count / 1229 * 100:.1f}" in frames[2][3]
    native = rows(s3 / "raw/counts_N1.sites.csv")
    assert sum(int(x["ops"]) > 0 for x in native) == 189
    target = [x for x in site if x["function"] == "TaskControlBlock.prototype.isHeldOrSuspended"]
    a, b = [next(x for x in target if x["offset"] == off) for off in ("3", "19")]
    assert (int(a["ops_per_Run"]), int(b["ops_per_Run"])) == (10671, 10115)
    assert (int(a["lookup_samples"]), int(b["lookup_samples"])) == (85, 9)
    native_a = next(x for x in native if x["id"] == next(x["id"] for x in rows(s3 / "mapping/sites.csv") if x["site_key"] == a["site_key"]))
    assert native_a["own"] == native_a["ops"] == native_a["probes"] == "10671"
    assert native_a["fallback"] == native_a["prototype"] == "0" and native_a["tags"] == "0:10671;"
    qstate, qlines = decoded_lines(s3 / "bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.decoded.json")
    vstate, vlines = decoded_lines(s3 / "bytecode/v8/TaskControlBlock.isHeldOrSuspended.decoded.json")
    # Main page contains explicitly labelled non-contiguous excerpts, not fake opcodes.
    check_subset(blocks[3][1], qlines)
    check_subset(blocks[3][2], vlines)
    assert [instruction(x) for x in blocks[6][0].strip().splitlines()] == qlines
    assert [instruction(x) for x in blocks[7][0].strip().splitlines()] == vlines
    assert len(qstate) == 16 and sum(x["size"] for x in qstate) == 29
    assert len(vstate) == 14 and sum(x["size"] for x in vstate) == 31
    original = content(ROOT / "benchmarks/octane/upstream/richards.js")
    for block in blocks[2] + [blocks[3][0]]:
        assert re.sub(r"\s+", "", block) in re.sub(r"\s+", "", original)
    transitions = csv_rows(s3 / "mapping/v8_selected_IC_transitions.csv")
    assert {x["bytecode_offset"] for x in transitions} == {"0", "19"}
    assert {x["old_state_code"] for x in transitions} == {"0"} and {x["new_state_code"] for x in transitions} == {"1"}
    assert {x["receiver_map"] for x in transitions} == {"0x189b01023ef1"}
    iclog = content(s3 / "raw/v8_selected_site_full.log")
    for x in transitions:
        record = json.loads(x["raw_record"])
        assert ",".join(record) in iclog
        assert x["address"] in content(s3 / "bytecode/v8/TaskControlBlock.isHeldOrSuspended.txt")
    controls = {}
    for key, pattern in (
        ("frozen", "control_frozen_nosignal_rep{}.json"),
        ("diagnostic_on", "control_nosignal_ctx1_rep{}.json"),
    ):
        vals = []
        for rep in (1, 2, 3):
            p = load(s3 / "raw" / pattern.format(rep))
            assert p["exit_code"] == 0
            payload = json.loads(re.search(r"^RICHARDS (.+)$", p["stdout"], re.M)[1])
            assert payload["N"] == 512
            vals.append(payload["elapsed_ms"])
        controls[key] = statistics.median(vals)
    overhead = controls["diagnostic_on"] / controls["frozen"] - 1
    close(overhead, load(s3 / "summary/perturbation.json")["context_on_over_frozen_point_estimate"] - 1)
    assert round(overhead * 100) == 29
    # Referenced experimental files are never written, and unchanged while checking.
    for path, digest in seen.items():
        assert hashlib.sha256(path.read_bytes()).hexdigest() == digest
    git = ["git", "-c", "safe.directory=" + WORK.as_posix()]
    changes = subprocess.check_output(git + ["diff", "--name-only", "--", "js-interpreter-bench/experiments", "js-interpreter-bench/engines", "js-interpreter-bench/benchmarks"], cwd=WORK, text=True).strip()
    assert not changes, changes
    branch = subprocess.check_output(git + ["branch", "--show-current"], cwd=WORK, text=True).strip()
    commit = subprocess.check_output(git + ["rev-parse", "HEAD"], cwd=WORK, text=True).strip()
    report = dict(
        status="PASS_OFFLINE_DATA_AND_TEX_STRUCTURE_NOT_COMPILED",
        branch=branch, commit=commit, cutoff="2026-10-17", frames=8, main_frames=6, appendix_frames=2,
        formal_records_reread={"S1": n1, "S2": n2}, cohort=cohort1,
        numeric_loop=numeric, call_comparison=s2,
        diagnostic={"denominator_lookup_samples": 1229, "all_internal": 5393,
                    "property_samples": dict(totals), "first_second_state_samples": [85, 9],
                    "first_second_state_reads_per_Run": [10671, 10115],
                    "no_signal_N512_medians_ms": controls, "relative_difference": overhead},
        bytecode={"QJS": {"instructions": 16, "bytes": 29}, "V8": {"instructions": 14, "bytes": 31},
                  "complete_appendices_and_excerpts_match_actual_decodes": True},
        compilation="NOT_RUN: no XeLaTeX/latexmk found in Windows or checked Ubuntu WSL; no installation",
        actual_pdf_page_count=None, overfull_log_check="NOT_RUN", missing_glyph_check="NOT_RUN", visual_check="NOT_RUN",
        package_members=["main.tex", "notes.md", "README_Overleaf.md"],
        source_hashes={p.relative_to(ROOT).as_posix(): h for p, h in seen.items() if p.is_relative_to(ROOT)},
    )
    (HERE / "validation.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    archive = HERE / "weekly_20261017_overleaf.zip"
    with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_DEFLATED) as z:
        for name in report["package_members"]:
            z.write(HERE / name, name)
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None and sorted(z.namelist()) == sorted(report["package_members"])
        for name in report["package_members"]:
            assert z.read(name) == (HERE / name).read_bytes()
    print(report["status"])
    print("6 main + 2 appendix frames; 420 existing formal records reread; no experiment run.")
    print(archive)


if __name__ == "__main__":
    main()
