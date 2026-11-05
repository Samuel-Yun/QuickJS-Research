"""Small fixed-source collection; no engine trees, builds or download retries."""
import sys
sys.dont_write_bytecode = True
import hashlib
import json
import subprocess
import urllib.request
from pathlib import Path
from run import HERE, ROOT, read, save, sha, stamp

REV = "37fb84941c9be9f9914ee50b1ad366f06a1bd764"
QREV = "04be246001599f5995fa2f2d8c91a0f198d3f34c"

def entry(path, rel, origin=None):
    data = path.read_bytes()
    return dict(path=path.relative_to(HERE).as_posix(), upstream_path=rel,
                url=f"https://raw.githubusercontent.com/v8/v8/{REV}/{rel}",
                reference_commit=REV, actual_d8_build_commit=None,
                sha256=sha(path), lf_normalized_sha256=hashlib.sha256(data.replace(b"\r\n", b"\n")).hexdigest(),
                git_blob_sha1=hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest(),
                size_bytes=len(data), origin=origin, TLS_verification=True)

def v8():
    inventory = HERE / "source_inventory_v8.json"
    if inventory.exists():
        raise RuntimeError("Source collection already recorded; no automatic retry")
    rows = []
    bundle = ROOT / "experiments/v8_ic_on_off/attempt02/materials/V8_IC_Resume_Materials_20261025"
    for old in read(bundle / "source_manifest.json")["files"]:
        if old["upstream_path"] == "src/runtime/runtime-test.cc":
            continue
        original = bundle / old["bundle_path"]
        if sha(original) != old["sha256"]:
            raise RuntimeError("Frozen bundle hash mismatch: " + str(original))
        target = HERE / "source_reference/v8" / old["upstream_path"]
        save(target, original.read_bytes())
        row = entry(target, old["upstream_path"], original.relative_to(ROOT).as_posix())
        row["status"] = "REUSED_HASH_VERIFIED"
        rows.append(row)
    prior = ROOT / "experiments/inherited_method_opportunity/attempt01/source_reference"
    for old in read(prior / "manifest.json")["files"]:
        if old["status"] != "AVAILABLE":
            continue
        original = prior / old["path"]
        if sha(original) != old["sha256"]:
            raise RuntimeError("Frozen handler source hash mismatch")
        target = HERE / "source_reference/v8" / old["path"]
        save(target, original.read_bytes())
        row = entry(target, old["path"], original.relative_to(ROOT).as_posix())
        row["status"] = "REUSED_HASH_VERIFIED"
        rows.append(row)
    missing = ["src/objects/feedback-vector.h", "src/objects/feedback-vector.cc", "src/ic/stub-cache.h",
               "src/objects/js-objects.cc", "src/objects/map.cc", "src/objects/lookup.cc"]
    network_failed = False
    for rel in missing:
        url = f"https://raw.githubusercontent.com/v8/v8/{REV}/{rel}"
        if network_failed:
            rows.append(dict(upstream_path=rel, url=url, status="NOT_ATTEMPTED_AFTER_NETWORK_FAILURE",
                             sha256=None, reference_commit=REV, actual_d8_build_commit=None))
            continue
        try:
            with urllib.request.urlopen(url, timeout=25) as response:
                data = response.read(2000001)
            if len(data) > 2000000 or b"Copyright" not in data[:1500]:
                raise RuntimeError("Unexpected source response")
            target = HERE / "source_reference/v8" / rel
            save(target, data)
            row = entry(target, rel)
            row["status"] = "FETCHED_OFFICIAL_FIXED_COMMIT"
            rows.append(row)
            print("FETCHED", rel, len(data), flush=True)
        except (OSError, RuntimeError) as exc:
            rows.append(dict(upstream_path=rel, url=url, status="UNAVAILABLE", error=str(exc),
                             sha256=None, reference_commit=REV, actual_d8_build_commit=None,
                             TLS_verification=True, attempts=1))
            network_failed = True
            print("UNAVAILABLE", rel, str(exc), flush=True)
    save(inventory, dict(timestamp=stamp(), reference_commit=REV, actual_d8_build_commit=None,
                         no_automatic_retry=True, files=rows))

def qjs():
    runtime = read(HERE / "runtime_before.json")
    rows = []
    ranges = {
        "shape_layout": (640, 760), "object_layout": (880, 1025),
        "shape_new_clone_ref": (5190, 5355), "shape_lookup": (6110, 6170),
        "get_property_internal": (8240, 8388), "prototype_mutation": (7897, 7990),
        "add_property": (9178, 9240), "delete_property": (9311, 9375),
        "shape_prepare_update": (10302, 10338), "define_property": (10350, 10565),
    }
    for variant, metadata in runtime["sources"].items():
        directory = Path(metadata["path"])
        for rel, expected in metadata["files"].items():
            original = directory / rel
            if sha(original) != expected:
                raise RuntimeError("QJS frozen source changed")
            data = original.read_bytes()
            row = dict(variant=variant, original_path=str(original), upstream_path=rel,
                       base_commit=QREV, sha256=expected,
                       lf_normalized_sha256=hashlib.sha256(data.replace(b"\r\n", b"\n")).hexdigest(),
                       size_bytes=len(data), excerpts=[])
            if rel == "quickjs.c":
                lines = data.decode().splitlines()
                selections = dict(ranges) if variant == "A" else {}
                if variant == "A":
                    needle = "#define GET_FIELD_INLINE("
                    start = next(i + 1 for i, text in enumerate(lines) if text.startswith(needle))
                    selections["get_field_inline"] = (start, start + 81)
                else:
                    for label, needle, count in [
                        ("mark_read_ic", "            for (uint32_t ri = 0; ri < b->read_ic_count; ri++)", 18),
                        ("final_prepare", "    if (rdi_prepare(ctx, b) < 0) {", 8),
                        ("free_bytecode", "    rdi_free(rt, b);", 20)]:
                        start = next(i + 1 for i, text in enumerate(lines) if text.startswith(needle))
                        selections[label] = (start, start + count)
                for label, (start, end) in selections.items():
                    target = HERE / "source_reference/qjs" / variant / (label + ".txt")
                    save(target, "\n".join(f"{j}: {lines[j-1]}" for j in range(start, end + 1)) + "\n")
                    row["excerpts"].append(dict(path=target.relative_to(HERE).as_posix(),
                                                line_start=start, line_end=end, sha256=sha(target)))
            elif rel.startswith("read_ic_") or rel == "LICENSE":
                target = HERE / "source_reference/qjs" / variant / rel
                save(target, data)
                row["copy"] = target.relative_to(HERE).as_posix()
            elif rel == "quickjs.h":
                lines = data.decode().splitlines()
                for label, needle, count in [
                    ("dup_free_value", "static inline JSValue JS_DupValue(", 48),
                    ("JSValue_layout", "typedef struct JSValue {", 14)]:
                    candidates = [i for i, text in enumerate(lines) if text.startswith(needle)]
                    if candidates:
                        start = candidates[-1] + 1
                        target = HERE / "source_reference/qjs" / variant / (label + ".txt")
                        save(target, "\n".join(f"{j}: {lines[j-1]}" for j in range(start, start + count)) + "\n")
                        row["excerpts"].append(dict(path=target.relative_to(HERE).as_posix(),
                                                    line_start=start, line_end=start + count - 1, sha256=sha(target)))
            rows.append(row)
    # The original M/P patch is only a small integration diff, not a source tree.
    for rel in ("patches/A_to_common_M.patch", "patches/M_to_P.patch", "implementation/read_ic_types.h",
                "implementation/read_ic_prepare.inc", "implementation/read_ic_runtime.inc", "implementation/read_ic_opcodes.inc"):
        original = ROOT / "experiments/read_ic_mic/attempt01" / rel
        data = original.read_bytes()
        target = HERE / "source_reference/MP" / rel
        save(target, data)
        rows.append(dict(variant="M/P", original_path=original.relative_to(ROOT).as_posix(),
                         path=target.relative_to(HERE).as_posix(), sha256=sha(target),
                         lf_normalized_sha256=hashlib.sha256(data.replace(b"\r\n", b"\n")).hexdigest()))
    save(HERE / "source_inventory_qjs.json", dict(timestamp=stamp(), base_commit=QREV, files=rows))
    print("FROZEN_QJS_SOURCE_EXCERPTS_SAVED", flush=True)

def supplement():
    rows = []
    # Allocation trigger and inline slot-access definitions, not a broader audit.
    for rel in ("src/objects/js-function.cc", "src/objects/feedback-vector-inl.h"):
        target = HERE / "source_reference/v8" / rel
        if target.exists():
            raise RuntimeError("Supplement already exists; refusing a repeat download")
        url = f"https://raw.githubusercontent.com/v8/v8/{REV}/{rel}"
        try:
            with urllib.request.urlopen(url, timeout=25) as response:
                data = response.read(2000001)
            if len(data) > 2000000 or b"Copyright" not in data[:1500]:
                raise RuntimeError("Unexpected source response")
            save(target, data)
            row = entry(target, rel)
            row["status"] = "FETCHED_OFFICIAL_FIXED_COMMIT"
            rows.append(row)
            print("FETCHED_SUPPLEMENT", rel, len(data), flush=True)
        except OSError as exc:
            rows.append(dict(upstream_path=rel, url=url, status="UNAVAILABLE", sha256=None,
                             error=str(exc), reference_commit=REV, TLS_verification=True, attempts=1))
            break
    save(HERE / "source_inventory_v8_supplement.json", dict(timestamp=stamp(), files=rows))

def qjs_supplement():
    runtime = read(HERE / "runtime_before.json")
    rows = []
    for variant, metadata in runtime["sources"].items():
        original = Path(metadata["path"]) / "quickjs.c"
        if sha(original) != metadata["files"]["quickjs.c"]:
            raise RuntimeError("QJS source changed")
        lines = original.read_text().splitlines()
        selections = [("shape_object_layout", 947, 1124), ("set_value", 2664, 2674),
                      ("shape_mark_children", 6612, 6660)] if variant == "A" else []
        for label, start, end in selections:
            target = HERE / "source_reference/qjs" / variant / (label + ".txt")
            save(target, "\n".join(f"{j}: {lines[j-1]}" for j in range(start, end + 1)) + "\n")
            rows.append(dict(variant=variant, original_path=str(original), original_sha256=sha(original),
                             path=target.relative_to(HERE).as_posix(), line_start=start, line_end=end, sha256=sha(target)))
    save(HERE / "source_inventory_qjs_supplement.json", rows)

def entry_helpers():
    rel = "src/ic/accessor-assembler.h"
    target = HERE / "source_reference/v8" / rel
    if target.exists():
        raise RuntimeError("Already collected; no retry")
    url = f"https://raw.githubusercontent.com/v8/v8/{REV}/{rel}"
    try:
        with urllib.request.urlopen(url, timeout=25) as response:
            data = response.read(2000001)
        if len(data) > 2000000 or b"Copyright" not in data[:1500]:
            raise RuntimeError("Unexpected source response")
        save(target, data)
        row = entry(target, rel)
        row["status"] = "FETCHED_OFFICIAL_FIXED_COMMIT"
    except OSError as exc:
        row = dict(upstream_path=rel, url=url, status="UNAVAILABLE", error=str(exc),
                   reference_commit=REV, sha256=None, TLS_verification=True, attempts=1)
    save(HERE / "source_inventory_v8_entry.json", row)
    print(row["status"], rel, flush=True)

def qjs_final():
    runtime = read(HERE / "runtime_before.json")
    source = Path(runtime["sources"]["A"]["path"])
    rows = []
    for rel, label, start, end in [
        ("quickjs.h", "free_and_dup", 681, 723),
        ("quickjs.c", "shape_marks_prototype", 6662, 6668),
        ("quickjs.c", "ordinary_value_store", 9670, 9733),
        ("quickjs.c", "compact_properties", 5400, 5467)]:
        original = source / rel
        assert sha(original) == runtime["sources"]["A"]["files"][rel]
        lines = original.read_text().splitlines()
        target = HERE / "source_reference/qjs/A" / (label + ".txt")
        save(target, "\n".join(f"{j}: {lines[j-1]}" for j in range(start, end + 1)) + "\n")
        rows.append(dict(original_path=str(original), original_sha256=sha(original),
                         path=target.relative_to(HERE).as_posix(), line_start=start, line_end=end,
                         sha256=sha(target)))
    save(HERE / "source_inventory_qjs_final.json", rows)

def environment():
    import platform
    info = dict(host=platform.node(), kernel=platform.release(), architecture=platform.machine(),
                os_release=Path("/etc/os-release").read_text(), python=sys.version,
                source_builds_this_round=0, performance_processes_this_round=0,
                timing_scope="no performance measurement; wall duration is diagnostic metadata only")
    save(HERE / "environment.json", info)
    print(info["host"], info["kernel"], info["architecture"], flush=True)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("stage", choices=("v8", "qjs", "supplement", "qjs_supplement", "entry_helpers", "qjs_final", "environment"))
    globals()[parser.parse_args().stage]()
