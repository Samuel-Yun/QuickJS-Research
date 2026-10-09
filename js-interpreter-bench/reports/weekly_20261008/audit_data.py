"""Offline report-only audit. Never launches an engine or edits experiment inputs."""
import csv
import hashlib
import json
import math
import statistics as st
import subprocess
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[1]
GIT = ROOT.parent
INPUTS = {}
CHECKS = []


def remember(p):
    p = ROOT / p
    INPUTS[p.relative_to(ROOT).as_posix()] = {
        "sha256": hashlib.sha256(p.read_bytes()).hexdigest(), "bytes": p.stat().st_size}
    return p


def rows(p):
    with remember(p).open(encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f))


def obj(p):
    return json.loads(remember(p).read_text(encoding="utf-8-sig"))


def check(name, condition, details=None):
    CHECKS.append({"check": name, "status": "PASS" if condition else "FAIL", "details": details})


def close(name, actual, expected):
    check(name, math.isclose(actual, expected, rel_tol=1e-11, abs_tol=1e-11),
          {"actual": actual, "expected": expected})


def valid(r):
    return r.get("valid", "").lower() == "true"


def stats(rs):
    xs = sorted(float(r["elapsed_ms"]) / int(r["N"]) for r in rs)
    check("positive_finite_intervals", all(x > 0 and math.isfinite(x) for x in xs))
    for r in rs:
        close("elapsed/N agrees with recorded elapsed_per_call_ms", float(r["elapsed_ms"])/int(r["N"]),
              float(r["elapsed_per_call_ms"]))
    mid = len(xs)//2
    q1, q3 = st.median(xs[:mid]), st.median(xs[-mid:])
    return {"samples": len(xs), "N_values": sorted({int(r["N"]) for r in rs}), "median": st.median(xs),
            "Q1": q1, "Q3": q3, "IQR": q3-q1, "mean": st.mean(xs),
            "sample_stddev": st.stdev(xs), "min": xs[0], "max": xs[-1],
            "positions": dict(sorted(Counter(r["order"] for r in rs).items()))}


def gm(xs):
    return math.exp(st.mean(math.log(x) for x in xs))


def grouped(rs, fields):
    groups = defaultdict(list)
    for r in rs:
        groups[tuple(r[f] for f in fields)].append(r)
    return groups


def audit_campaign(path, keys, summary_file, median_key):
    raw = rows(path+"/raw/formal.csv")
    check(path+" all recorded formal samples valid", all(valid(r) for r in raw))
    ss = {key: stats(rs) for key, rs in grouped(raw, keys).items()}
    check(path+" every group has 30", all(x["samples"] == 30 for x in ss.values()))
    for r in rows(path+"/summary/"+summary_file):
        key = tuple(r[k] for k in keys)
        close(path+" summary median "+str(key), ss[key]["median"], float(r[median_key]))
    return raw, ss


def baseline(name):
    path = "experiments/"+name+"_three_engine/MAIN_MONOTONIC_V1/attempt01"
    raw, ss = audit_campaign(path, ("case", "engine"), "per_case.csv", "median_ms")
    cases = sorted({r["case"] for r in raw})
    suite_for = {r["case"]: r["suite"] for r in raw}
    pairdefs = {"V8/QJS": ("v8", "quickjs"), "JSC/QJS": ("jsc", "quickjs"), "JSC/V8": ("jsc", "v8")}
    pairs = {c: {p: ss[(c, a)]["median"]/ss[(c, b)]["median"] for p, (a,b) in pairdefs.items()}
             for c in cases}
    for r in rows(path+"/summary/pairwise.csv"):
        for p in pairdefs:
            close(name+" per-case "+r["case"]+" "+p, pairs[r["case"]][p], float(r[p]))
    suites = {s: {p: gm([pairs[c][p] for c in cases if suite_for[c] == s]) for p in pairdefs}
              for s in sorted(set(suite_for.values()))}
    if name == "octane":
        for r in rows(path+"/summary/suite_summary.csv"):
            if r["complete"].lower() == "true":
                for p in pairdefs:
                    close(name+" suite "+r["suite"]+" "+p, suites[r["suite"]][p], float(r[p]))
    aggregates = []
    for r in rows(path+"/summary/pairwise_summary.csv"):
        units = json.loads(r["intersection"])
        source = pairs if name == "sunspider" else suites
        value = gm([source[c][r["pair"]] for c in units])
        close(name+" GM "+r["subset"]+" "+r["pair"], value, float(r["GM"]))
        aggregates.append({"subset": r["subset"], "pair": r["pair"], "count": len(units),
                           "intersection": units, "GM": value})
    manifest = obj(path+"/manifest.json")
    old_audit = obj(path+"/summary/audit.json")
    remember(path+"/results.md")
    check(name+" MAIN cohort", all(r["cohort"] == "wsl2-ubuntu2404-x64-20261004" for r in raw))
    check(name+" no explicit warmup", all(int(r["warmup_calls"]) == 0 for r in raw))
    return {"valid_formal": len(raw), "Run_targets": len(cases), "suites": len(suites),
            "statistics": {c: {e: ss[c,e] for e in ("quickjs","v8","jsc")} for c in cases},
            "pairwise": pairs, "aggregation": "case equal" if name == "sunspider" else "within-suite Run ratio GM; then suite equal GM",
            "aggregates": aggregates, "existing_audit": old_audit, "manifest_cohort": manifest.get("cohort_id")}


def main():
    git_prefix = ["git", "-c", "safe.directory="+GIT.as_posix(), "-C", str(GIT)]
    def git(*args):
        return subprocess.check_output(git_prefix+list(args)).decode("utf-8", errors="replace").strip()
    # Snapshot source state before regenerating this report's outputs.
    source_state = {"branch": git("branch", "--show-current"), "HEAD": git("rev-parse", "HEAD"),
                    "status_at_audit": git("status", "--short"), "initial_session_status": "clean (read-only git inspection before creating report files)",
                    "reference_HEAD": "0f57ab1865d6681704b6021981eb4f16f0a16874"}
    check("HEAD matches requested reference", source_state["HEAD"] == source_state["reference_HEAD"])
    for p in ("README.md", "weekly_report.tex", "weekly_interpreter_benchmark.tex", "notes/experiment_protocol.md"):
        remember(p)
    timer_manifest = obj("experiments/timer_recovery/manifest.json")
    timer_audit = obj("experiments/timer_recovery/audit.json")
    remember("experiments/timer_recovery/results.md")
    remember("experiments/three_engine_baseline/environment.txt")
    for e in ("quickjs", "v8", "jsc"):
        remember("experiments/timer_recovery/adapters/"+e+".js")
    for p in ("experiments/timer_recovery/source/audit.json", "experiments/timer_recovery/source/quickjs.txt",
              "experiments/timer_recovery/source/jsc_shell.txt", "experiments/timer_recovery/source/jsc_clock.txt",
              "experiments/timer_recovery/adapter_impact.md", "experiments/three_engine_baseline/summary/audit.json"):
        remember(p)
    execution_mode_evidence = obj("experiments/three_engine_baseline/probes/tier/summary.json")
    check("existing execution mode gates", execution_mode_evidence["all_mode_gates_pass"])
    sun, octane = baseline("sunspider"), baseline("octane")
    wp = "experiments/whitebox_analysis/attempt01"
    wr, ws = audit_campaign(wp, ("variant","engine"), "per_variant.csv", "median_ms")
    whitebox = []
    for r in rows(wp+"/summary/contrasts.csv"):
        ratio = ws[r["B"],r["engine"]]["median"]/ws[r["A"],r["engine"]]["median"]
        close("whitebox B/A "+r["group"]+r["engine"], ratio, float(r["B/A"]))
        whitebox.append({"group": r["group"], "engine": r["engine"], "B/A": ratio})
    for p in ("results.md", "summary/baseline_recomputed.csv", "summary/formal_audit.json", "summary/completion_audit.json"):
        remember(wp+"/"+p)
    regex = obj(wp+"/profiles/regexp.mapped/execution_evidence.json")
    for p in ("cases/regexp_boundary/evidence.md", "source_evidence/jsc.regexp.options.txt",
              "source_evidence/jsc.regexp.execution.txt", "source_evidence/qjs.regexp_exec.txt"):
        remember(wp+"/"+p)
    check("native RegExp sampled PC mapping", regex["regex_ticks"] == regex["ticks_in_observed_executable_mapping"] == 124)
    cp = "experiments/code_cache_validation/attempt01"
    cr, cs = audit_campaign(cp, ("case","condition"), "per_condition.csv", "median_ms")
    cache_ratios = {}
    for r in rows(cp+"/summary/ratios.csv"):
        c = r["case"]
        ratio = cs[c,"CACHE_NO_LAZY_CONSUMER"]["median"]/cs[c,"SOURCE_NO_LAZY"]["median"]
        close("cache ratio "+c, ratio, float(r["CACHE_CONSUMER/SOURCE"]))
        cache_ratios[c] = ratio
    producers = rows(cp+"/raw/producer.csv")
    check("separate cache producers", len(producers) == 120 and all(
        r["role"] == "producer_NOT_target_sample" and json.loads(r["payload"])["correctness"] == "PASS"
        for r in producers))
    cache_capabilities = obj(cp+"/capabilities.json")
    cache_evidence = rows(cp+"/summary/cache_evidence.csv")
    check("eight target cache diagnostic proofs", len(cache_evidence) == 8 and
          all(r["evidence_level"] == "PROVEN_TARGET_SERIALIZATION_DESERIALIZATION" for r in cache_evidence))
    for p in ("results.md", "protocol.md", "audit.json", "summary/exports_audit.json"):
        remember(cp+"/"+p)
    for p in (ROOT/cp/"probes/cache_proof").glob("*.json"):
        obj(p.relative_to(ROOT))
    for p in ("bytecode_lazy.stdout.txt", "bytecode_no_lazy.stdout.txt", "target_cache_combined.stdout.txt"):
        remember(cp+"/probes/logs/"+p)
    rp = "experiments/richards_method_lookup/attempt01"
    rr, rs = audit_campaign(rp, ("variant","engine"), "per_variant.csv", "median_ms_per_Run")
    contrasts = {}
    for r in rows(rp+"/summary/contrasts.csv"):
        e = r["engine"]
        ratio = rs["B",e]["median"]/rs["A",e]["median"]
        close("Richards B/A "+e, ratio, float(r["B_over_A"]))
        contrasts[e] = {"B/A": ratio, "reduction_percent": (1-ratio)*100}
    for r in rows(rp+"/summary/engine_ratios.csv"):
        v = r["variant"]
        for col,a,b in (("V8_over_QJS","v8","quickjs"),("JSC_over_QJS","jsc","quickjs"),("JSC_over_V8","jsc","v8")):
            close("Richards engine ratio "+v+col, rs[v,a]["median"]/rs[v,b]["median"], float(r[col]))
    for key, values in grouped(rr,("variant","engine")).items():
        check("Richards positions "+str(key), Counter(r["order"] for r in values) == {"1":10,"2":10,"3":10})
        check("Richards unique positions "+str(key), len({r["rep"] for r in values}) == 30)
        check("Richards N512 "+str(key), all(r["N"] == "512" for r in values))
    for variant in ("A","B"):
        perm = Counter(r["permutation"] for r in rr if r["variant"] == variant and r["order"] == "1")
        check("Richards six permutations "+variant, len(perm) == 6 and set(perm.values()) == {5})
    counts = rows(rp+"/diagnostics/counter_summary.csv")
    counter_output = {}
    for variant in ("original", "A", "B"):
        vr = [r for r in counts if r["variant"] == variant]
        counter_output[variant] = []
        for r in vr:
            cats = json.loads(r["categories"])
            selected, task = cats[0], cats[1]
            check("selected lookup "+variant, selected["lookups"] == (512 if variant == "B" else 3365376))
            check("task lookup retained "+variant, task["lookups"] == 3365376)
            check("normal hit helper fallback "+variant, selected["fallback"] == selected["helper_entries"] == 0)
            counter_output[variant].append({"rep": int(r["rep"]), "selected": selected,
                                           "task": task, "selected_entries": int(r["selected_entries"])})
    diag = obj(rp+"/diagnostics/audit.json")
    check("sequence diagnostic coverage", diag["sequence_processes"] == 27 and diag["sequence"]["hash"] == 4133815237)
    for p in ("results.md", "protocol.md", "manifest.json", "microbench/design.json", "microbench/A.schedule.js", "microbench/B.schedule.js",
              "microbench/A.source.js", "microbench/B.source.js", "microbench/generated/A.N512.js", "microbench/generated/B.N512.js",
              "microbench/driver.js", "source_evidence/sites.csv", "source_evidence/prior_art.md", "source_evidence/qjs.property.inline.txt",
              "source_evidence/qjs.property.fallback.txt", "source_evidence/byte_audit.json", "source_evidence/archive_audit.windows.json",
              "source_evidence/archive_audit.linux.json", "summary/formal_audit.json", "summary/completion_audit.json", "audit.json"):
        remember(rp+"/"+p)
    for v in ("A", "B"):
        for e in ("quickjs", "v8", "jsc"):
            remember(rp+"/source_evidence/"+v+"."+e+".schedule_bytecode.txt")
    for p in (ROOT/rp/"diagnostics/records").glob("sequence.*.json"):
        obj(p.relative_to(ROOT))
    gates = rows(rp+"/raw/correctness.csv")
    check("Richards independent correctness", len(gates) == 18 and all(valid(r) for r in gates))
    byte_audit = obj(rp+"/source_evidence/byte_audit.json")
    check("historical identity audit scope 45 unique",len(byte_audit["records"])==45)
    git_blob_differences = sum(r["git_blob_sha256"] != r["recorded_sha256"] for r in byte_audit["records"])
    check("historical 21 Git blob differences",git_blob_differences==21)
    for r in byte_audit["records"]:
        path = remember(r["path"])
        check("actual historical input identity "+r["path"],
              hashlib.sha256(path.read_bytes()).hexdigest()==r["recorded_sha256"])
    archive_audits={system:obj(rp+"/source_evidence/archive_audit."+system+".json") for system in ("windows","linux")}
    for system,a in archive_audits.items():
        check("existing archive export audit "+system,a["status"]=="PASS")
    remember(rp+"/source_evidence/historical_bytes.zip")
    remember(rp+"/microbench/design_bytes.zip")
    remember(rp+"/microbench/formal_bytes.zip")
    total = len(rr)+len(cr)+len(wr)+sun["valid_formal"]+octane["valid_formal"]
    check("formal target total", total == 4560)
    result = {
        "report_date": "2026-10-08", "audit_created_utc": datetime.now(timezone.utc).isoformat(),
        "scope": "offline reanalysis of displayed existing data only; no engine/benchmark execution",
        "source_state": source_state, "source_inputs": INPUTS, "checks": CHECKS,
        "status": "PASS" if all(c["status"] == "PASS" for c in CHECKS) else "FAIL",
        "statistics_definition": {"unit": "internal elapsed_ms/N, ms/Run", "median": "all30, no outlier deletion",
           "Q1_Q3": "Tukey halves: median(sorted[:15]), median(sorted[15:]) separately",
           "IQR_plot": "nonsymmetric Q1--Q3 distribution range, NOT confidence interval",
           "stddev": "sample n-1", "GM": "exp(mean(log(time ratio))); Octane suite-weighted"},
        "runtime_manifest": timer_manifest, "existing_execution_mode_evidence": execution_mode_evidence,
        "timer_existing_audit_summary": {
           "mode": timer_audit.get("mode"), "old_wall_clock_cause": timer_audit.get("old_wall_clock_cause")},
        "sunspider": sun, "octane": octane,
        "whitebox": {"formal_valid": len(wr), "contrasts": whitebox, "native_regex_PC_ticks":124},
        "code_cache": {"formal_valid": len(cr), "producers_separate":len(producers), "ratios":cache_ratios,
           "GM":gm(list(cache_ratios.values())), "capabilities":cache_capabilities},
        "richards": {"formal_valid":len(rr), "statistics":{v:{e:rs[v,e] for e in ("quickjs","v8","jsc")} for v in ("A","B")},
           "contrasts":contrasts, "QJS/V8":{v:rs[v,"quickjs"]["median"]/rs[v,"v8"]["median"] for v in ("A","B")},
           "diagnostic_counts":counter_output, "sequence_audit":diag, "correctness_valid":len(gates)},
        "formal_targets_total": total, "producer_records_in_formal_total":False,
        "historical_byte_audit_scope": {"unique_cache_inputs":45,"actual_byte_matches":45,
           "recorded_git_blob_differences":git_blob_differences,"all_project_history_restored":False,
           "existing_windows_linux_archive_status":{s:a["status"] for s,a in archive_audits.items()}},
        "UNKNOWN": {"d8_exact_source_commit":None,"d8_exact_compiler_and_GN":None,
          "JSC_first_call_frontend_cost_and_coverage":None,"lookup_exact_self_time_and_original_fraction":None,
          "NTP_WSL_Date_now_root_cause":None,"physical_frequency_power_temperature_and_host_load":None,
          "NG_v0_8_full_revision_and_local_full_source_SHA":None,"advisor_0_7_0_8_engine_branch":None,
          "per_formal_cache_acceptance_trace":None},
        "validation": {"performance_rerun":"NOT_RUN (prohibited)","runtime_rebuild":"NOT_RUN (prohibited)",
          "local_XeLaTeX":"NOT_RUN; not found in Windows PATH/common locations or existing Ubuntu WSL",
          "PDF_visual_review":"NOT_RUN; requires actually compiled PDF", "static_source_check":"pending"}}
    (OUT/"data_audit.json").write_text(json.dumps(result,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({"status":result["status"], "checks":len(CHECKS), "failed":[c for c in CHECKS if c["status"] != "PASS"],
                      "targets":total, "richards":result["richards"]["statistics"], "cache_GM":result["code_cache"]["GM"]},ensure_ascii=False,indent=2))


if __name__ == "__main__":
    main()
