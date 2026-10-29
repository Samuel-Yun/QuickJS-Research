"""Portable source/data audit and small report tables; never invokes a VM."""
import sys
sys.dont_write_bytecode = True
import argparse
import ast
import csv
import hashlib
import io
import os
import subprocess
from pathlib import Path
from run import HERE, ROOT, read, save, sha, audit

def table():
    rows = read(HERE / "comparison_rows.json")
    assert len(rows) == 11
    headers = ["比较项", "V8固定源码怎么做", "当前M/P怎么做", "对应源码函数", "已有或本轮动态证据", "确定差异/性能假设/未知", "对QuickJS是否值得借鉴"]
    assert all(list(row) == headers for row in rows)
    buffer = io.StringIO(newline="")
    writer = csv.DictWriter(buffer, headers, lineterminator="\n")
    writer.writeheader()
    writer.writerows(rows)
    save(HERE / "ic_comparison.csv", buffer.getvalue())
    md = ["# IC 逐项对照", "", "V8 均指固定参考 commit 37fb84941c9be9f9914ee50b1ad366f06a1bd764，非已证明 actual d8 构建提交。M/P 指本轮固定框架，不指旧 NG PIC。源码简称均位于本 attempt 的 source_reference/；A quickjs.c 的带行号摘录位于 qjs/A/。旧证据目录相对 js-interpreter-bench/experiments。", "", "|" + "|".join(headers) + "|", "|" + "|".join(["---"] * len(headers)) + "|"]
    for row in rows:
        md.append("|" + "|".join(str(row[h]).replace("|", "\\|").replace("\n", "<br>") for h in headers) + "|")
    save(HERE / "ic_comparison.md", "\n".join(md) + "\n")

def sources():
    v8_files = list(read(HERE / "source_inventory_v8.json")["files"])
    v8_files += read(HERE / "source_inventory_v8_supplement.json")["files"]
    v8_files.append(read(HERE / "source_inventory_v8_entry.json"))
    for entry in v8_files:
        assert entry["sha256"] is not None, entry
        path = HERE / entry["path"]
        assert sha(path) == entry["sha256"]
        assert entry["reference_commit"] == "37fb84941c9be9f9914ee50b1ad366f06a1bd764"
        assert entry["url"].startswith("https://raw.githubusercontent.com/v8/v8/" + entry["reference_commit"] + "/")
    qjs = read(HERE / "source_inventory_qjs.json")["files"]
    qjs_extra = read(HERE / "source_inventory_qjs_supplement.json") + read(HERE / "source_inventory_qjs_final.json")
    for entry in qjs:
        for excerpt in entry.get("excerpts", []):
            assert sha(HERE / excerpt["path"]) == excerpt["sha256"]
        if entry.get("copy"):
            assert sha(HERE / entry["copy"]) == entry["sha256"]
        if entry.get("path"):
            assert sha(HERE / entry["path"]) == entry["sha256"]
        if entry.get("variant") == "A":
            entry["upstream_url"] = "https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/" + entry["upstream_path"]
        elif entry.get("variant") == "M":
            entry["source_kind"] = "local frozen M, not unmodified upstream; integration patch is separately preserved"
    for entry in qjs_extra:
        assert sha(HERE / entry["path"]) == entry["sha256"]
    identities_path = ROOT / "experiments/read_ic_mic/attempt01/sources/identities.json"
    ids = read(identities_path)
    differences = sorted(rel for rel in ids["files"]["M"] if ids["files"]["M"][rel] != ids["files"]["P"].get(rel))
    assert differences == ["read_ic_config.h"], differences
    assert hashlib.sha256(b"#define RDI_CAPACITY 4\n").hexdigest() == ids["files"]["P"]["read_ic_config.h"]
    frozen_m = read(HERE / "runtime_before.json")["sources"]["M"]["files"]
    for name in ("read_ic_types.h", "read_ic_prepare.inc", "read_ic_runtime.inc", "read_ic_opcodes.inc"):
        assert sha(HERE / "source_reference/MP/implementation" / name) == frozen_m[name]
        assert ids["files"]["P"][name] == frozen_m[name]
    for path in (HERE / "source_reference/v8/LICENSE", HERE / "source_reference/qjs/A/LICENSE", HERE / "source_reference/qjs/M/LICENSE"):
        assert path.is_file() and path.stat().st_size > 0
    save(HERE / "source_manifest.json", dict(
        QuickJS_base_commit="04be246001599f5995fa2f2d8c91a0f198d3f34c",
        V8_reference_commit="37fb84941c9be9f9914ee50b1ad366f06a1bd764",
        actual_d8_build_commit=None,
        V8_files=v8_files, QuickJS_files=qjs, QuickJS_additional_excerpts=qjs_extra,
        MP_declared_source_identity_path=identities_path.relative_to(ROOT).as_posix(),
        MP_declared_source_identity_sha256=sha(identities_path),
        M_P_declared_file_differences=differences,
        common_MP_implementation_matches_actual_frozen_M=True, P_executed_this_round=False,
        line_endings="authored text UTF-8/LF; frozen QJS LICENSE copies preserve original CRLF bytes via -text; original raw and LF hashes remain distinct",
        VM_patches_this_round=0, fixed_URLs_only=True, TLS_verification=True,
        available_V8_files=len(v8_files), missing_required_files=[],
        old_evidence=read(HERE / "evidence_recheck.json")["references_sha256"]))

def context():
    previous = ROOT / "experiments/function_value_call_path/attempt01"
    flags = read(previous / "effective_flags.json")
    assert str(flags["max-valid-polymorphic-map-count"]) == "10"
    assert flags["lazy-feedback-allocation"] is True
    assert str(flags["invocation-count-for-feedback-allocation"]) == "8"
    with (previous / "summary.csv").open(encoding="utf-8", newline="") as f:
        summaries = list(csv.DictReader(f))
    def median(case, engine):
        return float(next(row["median"] for row in summaries if row["case"] == case and row["condition"] == engine and row["metric"] == "execution"))
    own_a, own_m, own_v8 = [median("own_method_call", engine) for engine in ("QJS_A", "QJS_M", "V8_ON")]
    local_m, local_v8 = [median("local_function_call", engine) for engine in ("QJS_M", "V8_ON")]
    save(HERE / "historical_context.json", dict(
        source_campaign=previous.relative_to(ROOT).as_posix(),
        summary_sha256=sha(previous / "summary.csv"), flags_sha256=sha(previous / "effective_flags.json"),
        max_valid_polymorphic_maps=10, lazy_feedback_allocation=True,
        invocation_count_flag=8, exact_allocation_time=None,
        own_M_vs_A_time_change_pct=(own_m / own_a - 1) * 100,
        own_M_over_V8_ON=own_m / own_v8,
        local_M_over_V8_ON=local_m / local_v8,
        latest_number_read_M_over_V8_ON=median("number_value_read", "QJS_M") / median("number_value_read", "V8_ON"),
        no_new_performance_measurement=True, no_cross_campaign_division=True))

def build():
    audit()
    table()
    sources()
    context()
    environment = read(HERE / "environment.json")
    runtime = read(HERE / "runtime_before.json")
    previous = read(ROOT / "experiments/function_value_call_path/attempt01/manifest.json")
    assert environment["host"] == runtime["host"] == previous["host"]
    assert environment["architecture"] == runtime["architecture"] == previous["architecture"]
    assert environment["kernel"] == runtime["kernel"] == previous["kernel"]
    git_env = os.environ.copy()
    git_env["GIT_OPTIONAL_LOCKS"] = "0"
    repo = ROOT.parent
    git = ["git", "-c", "safe.directory=" + repo.as_posix(), "-C", str(repo)]
    workspace = {}
    for name, command in (("HEAD", ["rev-parse", "HEAD"]), ("branch", ["branch", "--show-current"]),
                          ("tracked_diff", ["diff", "--name-only"]), ("status", ["status", "--short"])):
        result = subprocess.run(git + command, capture_output=True, text=True, check=True, env=git_env)
        workspace[name] = result.stdout
    save(HERE / "workspace_snapshot.json", dict(repo=str(repo), observation="after adding only this new attempt; initial HEAD/status also checked before edits",
         initially_observed_HEAD="3b825672af2d400b963ea9b92870997dbef6a6ef", initially_observed_branch="myx",
         initial_tracked_and_untracked_status="clean", applicable_AGENTS_found=[], actual=workspace))
    assert not workspace["tracked_diff"], "Unexpected tracked edits; preserve and investigate"
    assert workspace["branch"].strip() == "myx"
    for path in HERE.glob("*.py"):
        ast.parse(path.read_text(encoding="utf-8"), filename=str(path))
    files = [p for p in HERE.rglob("*") if p.is_file()]
    assert not any("__pycache__" in p.parts for p in files)
    raw_license_copies = {"source_reference/qjs/A/LICENSE", "source_reference/qjs/M/LICENSE"}
    assert all(b"\r\n" not in p.read_bytes() for p in files if p.relative_to(HERE).as_posix() not in raw_license_copies), "Unexpected CRLF in authored text"
    assert not any(p.stat().st_size > 2000000 for p in files)
    save(HERE / "audit.json", dict(
        status="COMPLETE_SOURCE_COMPARE_AND_SEMANTIC_VALIDATION_WITH_UNKNOWNS",
        correctness_processes_expected=48, correctness_processes_actual=48, correctness_pass=48,
        performance_samples=0, new_engine_builds=0, VM_optimization_patches=0,
        prior_archives_and_site_counters_verified=True, receiver_holder_pairs_verified=12,
        frozen_artifacts_and_dependencies_unchanged=True, common_JS_per_engine_verified=True,
        tracked_worktree_changes=[], source_files_official_fixed_commit_or_frozen_local=True,
        copied_MP_code_matches_frozen_M=True, V8_exact_build_commit=None,
        candidate_implemented=False, candidate_count=1,
        UNKNOWN=["actual d8 precise build commit/toolchain", "site-installed V8 handler and per-access path/hit rate",
                 "native cost of each IC step", "exact feedback allocation/reclamation times in these runs",
                 "Richards actual QJS holder hashed-shape eligibility", "candidate performance and memory effects"],
        missing_materials=[], automatic_commit_or_push=False,
        previous_call_boundary_cost="BLOCKED_PERTURBATION; attribution incomplete; no PC cost partition reused"))
    all_files = {p.relative_to(HERE).as_posix(): sha(p) for p in sorted(HERE.rglob("*"))
                 if p.is_file() and p.name != "delivery_manifest.json"}
    save(HERE / "delivery_manifest.json", dict(files_sha256=all_files,
         total_bytes=sum((HERE / rel).stat().st_size for rel in all_files),
         generated_source_and_semantic_material_only=True))
    check()

def check():
    audit()
    manifest = read(HERE / "delivery_manifest.json")
    for rel, expected in manifest["files_sha256"].items():
        assert sha(HERE / rel) == expected, rel
    source = read(HERE / "source_manifest.json")
    for entry in source["V8_files"]:
        assert sha(HERE / entry["path"]) == entry["sha256"]
    for rel, expected in source["old_evidence"].items():
        assert sha(ROOT / rel) == expected, "Old evidence changed: " + rel
    assert read(HERE / "historical_context.json")["max_valid_polymorphic_maps"] == 10
    print("DELIVERY_CHECK_PASS", len(manifest["files_sha256"]), "files", manifest["total_bytes"], "bytes; no VM execution")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    check() if args.check else build()
