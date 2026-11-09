"""Build an isolated EVAL_COLD counter binary without changing its cache policy."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
PARENT = ROOT / "experiments/native_octane_20261108/attempt11"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def once(text, old, new):
    if text.count(old) != 1:
        raise RuntimeError(f"Expected a unique patch anchor: {old[:100]!r}")
    return text.replace(old, new, 1)


HELPERS = r'''/* Diagnostic-only counters for readLoop's sole x read site.
   The original cache decisions, layout and replacement logic are unchanged. */
static ReadICSite *micro_ic_site;
static unsigned long long micro_ic_queries, micro_ic_hits, micro_ic_misses;
static unsigned long long micro_ic_fused_hits, micro_ic_regular_hits;
static unsigned long long micro_ic_regular_queries, micro_ic_cold_misses;
static unsigned long long micro_ic_fills, micro_ic_watch_count;
static void micro_ic_report(void)
{
    fprintf(stderr, "IC_MICRO_COUNTS:{\"function\":\"readLoop\",\"atom\":\"x\","
        "\"capacity\":%d,\"watched_sites\":%llu,\"queries\":%llu,\"hits\":%llu,"
        "\"misses\":%llu,\"fused_hits\":%llu,\"regular_hits\":%llu,"
        "\"regular_queries\":%llu,\"cold_misses\":%llu,\"fills\":%llu}\n",
        RDI_CAPACITY, micro_ic_watch_count, micro_ic_queries, micro_ic_hits,
        micro_ic_misses, micro_ic_fused_hits, micro_ic_regular_hits,
        micro_ic_regular_queries, micro_ic_cold_misses, micro_ic_fills);
}
static void micro_ic_watch(JSContext *ctx, JSFunctionBytecode *b)
{
    const char *name = JS_AtomToCString(ctx, b->func_name);
    if (!name) abort();
    int match = !strcmp(name, "readLoop");
    JS_FreeCString(ctx, name);
    if (!match) return;
    assert(b->read_ic_count == 1 && micro_ic_watch_count == 0);
    name = JS_AtomToCString(ctx, b->read_ic_sites[0].atom);
    if (!name) abort();
    assert(!strcmp(name, "x"));
    JS_FreeCString(ctx, name);
    micro_ic_site = &b->read_ic_sites[0];
    micro_ic_watch_count++;
    if (atexit(micro_ic_report)) abort();
}
static force_inline void micro_ic_regular_query(ReadICSite *site)
{
    if (site == micro_ic_site) {
        micro_ic_queries++;
        micro_ic_regular_queries++;
    }
}
static force_inline void micro_ic_hit(ReadICSite *site, int fused)
{
    if (site == micro_ic_site) {
        micro_ic_hits++;
        if (fused) { micro_ic_queries++; micro_ic_fused_hits++; }
        else micro_ic_regular_hits++;
    }
}
static force_inline void micro_ic_miss(ReadICSite *site)
{
    if (site == micro_ic_site) {
        micro_ic_misses++;
        if (!site->shape) micro_ic_cold_misses++;
    }
}
static force_inline void micro_ic_fill(ReadICSite *site)
{
    if (site == micro_ic_site) micro_ic_fills++;
}

'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True, help="new diagnostic directory")
    args = parser.parse_args()
    original = PARENT / "work/EVAL_COLD"
    expected = json.loads((PARENT / "source_manifest.json").read_text())["EVAL_COLD"]["files"]
    data = {name: (original / name).read_bytes() for name in expected}
    for name, content in data.items():
        if sha(content) != expected[name]:
            raise RuntimeError(f"Frozen release source mismatch: {name}")
    release_elf = original / "qjs"
    release_sha = sha(release_elf.read_bytes())
    if release_sha != "bc0afe62ae3a4270dfc087db23042ca41c7502dd08f7b16c7863fea9cc2d4e74":
        raise RuntimeError("Frozen EVAL_COLD binary mismatch")

    text = {name: content.decode() for name, content in data.items()}
    q = text["quickjs.c"]
    anchor = '#include "read_ic_runtime.inc"'
    q = once(q, anchor, '#include "micro_ic_diag.h"\n\n' + anchor)
    anchor = '            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
    q = once(q, anchor, '            micro_ic_hit(site, 1); \\\n' + anchor)
    text["quickjs.c"] = q
    p = text["read_ic_prepare.inc"]
    anchor = "    assert(index == count);"
    text["read_ic_prepare.inc"] = once(p, anchor, anchor + "\n    micro_ic_watch(ctx, b);")
    r = text["read_ic_runtime.inc"]
    anchor = "    RDI_COUNT(updates);"
    text["read_ic_runtime.inc"] = once(r, anchor, anchor + "\n    micro_ic_fill(s);")
    o = text["read_ic_opcodes.inc"]
    anchor = "        RDI_QUERY();"
    o = once(o, anchor, anchor + " " * 53 + "\\\n        micro_ic_regular_query(site);")
    # Count the successful branch, not merely a matching receiver shape.
    for anchor in ["                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);",
                   "                    val = JS_DupValue(ctx, p->prop[offset].u.value);"]:
        indent = anchor[:len(anchor) - len(anchor.lstrip())]
        o = once(o, anchor, indent + "micro_ic_hit(site, 0); \\\n" + anchor)
    anchor = "        RDI_COUNT(fallback);"
    o = once(o, anchor, anchor + " " * 47 + "\\\n        micro_ic_miss(site);")
    text["read_ic_opcodes.inc"] = o
    text["micro_ic_diag.h"] = HELPERS

    args.output.mkdir(parents=True, exist_ok=False)
    dest = args.output / "work/EVAL_COLD_DIAG"
    dest.mkdir(parents=True)
    changed = {}
    patch = []
    for name, content in text.items():
        encoded = content.encode()
        (dest / name).write_bytes(encoded)
        if name not in data or encoded != data[name]:
            changed[name] = sha(encoded)
            patch.extend(difflib.unified_diff(
                data.get(name, b"").decode().splitlines(keepends=True),
                content.splitlines(keepends=True), fromfile="a/" + name, tofile="b/" + name))
    (dest / "compat").mkdir()
    compat = (original / "compat/test-closefrom.c").read_bytes()
    (dest / "compat/test-closefrom.c").write_bytes(compat)
    (args.output / "instrumentation.patch").write_text("".join(patch))
    manifest = dict(
        diagnostic_only=True, formal_performance_samples=0,
        release_elf=str(release_elf), release_elf_sha256=release_sha,
        release_sources=expected, changed_files=changed,
        all_diagnostic_sources={name: sha(content.encode()) for name, content in text.items()},
        compat_sha256=sha(compat), builder_sha256=sha(Path(__file__).read_bytes()),
        scope="readLoop's sole x-read site; successful fused reads plus ordinary IC reads",
    )
    (args.output / "build_manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    with (args.output / "build.log").open("w") as log:
        # Existing generated repl.c is reused; no qjsc regeneration is needed.
        result = subprocess.run(["make", "-j2", "-o", "repl.c", "qjs"], cwd=dest,
                                stdout=log, stderr=subprocess.STDOUT, timeout=300)
    if result.returncode:
        raise RuntimeError(f"Diagnostic build failed; see {args.output / 'build.log'}")
    manifest["diagnostic_elf_sha256"] = sha((dest / "qjs").read_bytes())
    if sha(release_elf.read_bytes()) != release_sha:
        raise RuntimeError("Original ELF changed")
    for name, digest in expected.items():
        if sha((original / name).read_bytes()) != digest:
            raise RuntimeError("Original source changed")
    (args.output / "build_manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print("DIAGNOSTIC_BUILD_PASS", dest / "qjs", flush=True)


if __name__ == "__main__":
    main()
