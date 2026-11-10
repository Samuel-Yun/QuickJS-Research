"""Aggregate non-length named-read counters on an isolated EVAL_COLD build."""
import argparse
import importlib.util
import json
from pathlib import Path
import hashlib

HERE = Path(__file__).resolve().parent

HELPERS = r'''/* Diagnostic only: all prepared non-length named read sites. */
static int oct_count_active;
static unsigned long long oct_queries, oct_hits, oct_misses, oct_fused_hits;
static unsigned long long oct_proto_hits, oct_regular_queries, oct_own_fills;
static void micro_ic_watch(JSContext *ctx, JSFunctionBytecode *b) { }
static force_inline void micro_ic_regular_query(ReadICSite *site)
{
    if (oct_count_active && site->atom != JS_ATOM_length) {
        oct_queries++; oct_regular_queries++;
    }
}
static force_inline void micro_ic_hit(ReadICSite *site, int fused)
{
    if (oct_count_active && site->atom != JS_ATOM_length) {
        oct_hits++;
        if (fused) { oct_queries++; oct_fused_hits++; }
        else if (site->holder_shape) oct_proto_hits++;
    }
}
static force_inline void micro_ic_miss(ReadICSite *site)
{
    if (oct_count_active && site->atom != JS_ATOM_length) oct_misses++;
}
static force_inline void micro_ic_fill(ReadICSite *site)
{
    if (oct_count_active && site->atom != JS_ATOM_length) oct_own_fills++;
}
void oct_count_begin(void)
{
    oct_queries=oct_hits=oct_misses=oct_fused_hits=oct_proto_hits=0;
    oct_regular_queries=oct_own_fills=0; oct_count_active=1;
}
void oct_count_end(void)
{
    oct_count_active=0;
    fprintf(stderr,"OCTANE_IC_COUNTS:{\"queries\":%llu,\"hits\":%llu,\"misses\":%llu,"
        "\"fused_hits\":%llu,\"proto_hits\":%llu,\"regular_queries\":%llu,\"own_fills\":%llu}\n",
        oct_queries,oct_hits,oct_misses,oct_fused_hits,oct_proto_hits,oct_regular_queries,oct_own_fills);
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    spec = importlib.util.spec_from_file_location("micro_diag_builder", HERE / "build_diagnostic.py")
    base = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(base)
    base.HELPERS = HELPERS
    original_run = base.subprocess.run

    def build_with_markers(command, **kwargs):
        dest = kwargs["cwd"]
        path = dest / "quickjs-libc.c"
        c = path.read_bytes().decode()
        anchor = "void js_std_add_helpers(JSContext *ctx, int argc, char **argv)"
        functions = '''extern void oct_count_begin(void);
extern void oct_count_end(void);
static JSValue js_oct_count_begin(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ oct_count_begin(); return JS_UNDEFINED; }
static JSValue js_oct_count_end(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ oct_count_end(); return JS_UNDEFINED; }

'''
        c = base.once(c, anchor, functions + anchor)
        anchor = '    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
        c = base.once(c, anchor, anchor + '''
    JS_SetPropertyStr(ctx, global_obj, "__oct_count_begin", JS_NewCFunction(ctx, js_oct_count_begin, "__oct_count_begin", 0));
    JS_SetPropertyStr(ctx, global_obj, "__oct_count_end", JS_NewCFunction(ctx, js_oct_count_end, "__oct_count_end", 0));''')
        path.write_bytes(c.encode())
        return original_run(command, **kwargs)

    base.subprocess.run = build_with_markers
    try:
        base.main()
    finally:
        base.subprocess.run = original_run
    out = args.output.resolve()
    manifest_path = out / "build_manifest.json"
    m = json.loads(manifest_path.read_text())
    dest = out / "work/EVAL_COLD_DIAG"
    h = hashlib.sha256((dest / "quickjs-libc.c").read_bytes()).hexdigest()
    m["all_diagnostic_sources"]["quickjs-libc.c"] = h
    m["changed_files"]["quickjs-libc.c"] = h
    m["scope"] = "Run-only aggregate prepared named reads excluding length; includes fused and direct-prototype hits"
    m["custom_builder_sha256"] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    m["custom_helpers_sha256"] = hashlib.sha256(HELPERS.encode()).hexdigest()
    manifest_path.write_text(json.dumps(m, indent=2) + "\n")


if __name__ == "__main__":
    main()
