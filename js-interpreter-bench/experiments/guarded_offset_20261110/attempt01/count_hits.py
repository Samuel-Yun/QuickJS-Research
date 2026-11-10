"""One independent diagnostic pass; count original and checked-offset hits."""
import collections
import csv
import difflib
import importlib.util
import io
import json
import os
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
OUT = HERE / 'hit_rates01'
ROOT = HERE.parents[2]
PREVIOUS = ROOT / 'experiments/octane_ic_rates_20261109/attempt01'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


b = module('offset_hit_recorder', ROOT / 'experiments/native_octane_20261107/attempt01/run.py')
b.H = OUT


def once(text, old, new):
    assert text.count(old) == 1, repr(old)
    return text.replace(old, new, 1)


HELPERS = r'''/* Run-only diagnostic counters; never used for performance. */
static int oct_count_active;
static unsigned long long oct_queries, oct_hits, oct_misses, oct_fused_hits;
static unsigned long long oct_proto_hits, oct_regular_queries, oct_own_fills;
static unsigned long long oct_guarded_hits, oct_guarded_fills;
static force_inline void micro_ic_regular_query(ReadICSite *s)
{
    if (oct_count_active && s->atom != JS_ATOM_length) {
        oct_queries++; oct_regular_queries++;
    }
}
static force_inline void micro_ic_hit(ReadICSite *s, int fused)
{
    if (oct_count_active && s->atom != JS_ATOM_length) {
        oct_hits++;
        if (fused) { oct_queries++; oct_fused_hits++; }
        else if (s->holder_shape) oct_proto_hits++;
    }
}
static force_inline void micro_ic_miss(ReadICSite *s)
{
    if (oct_count_active && s->atom != JS_ATOM_length) oct_misses++;
}
static force_inline void micro_ic_guarded_hit(ReadICSite *s)
{
    if (oct_count_active && s->atom != JS_ATOM_length) {
        /* Original shape-probe failure was provisionally counted as a miss.
         * Successful checked-offset resolution makes this a total-cache hit.
         * The query was already counted; do not count it a second time.
         */
        assert(oct_misses > 0);
        oct_misses--; oct_hits++; oct_guarded_hits++;
    }
}
static force_inline void micro_ic_fill(ReadICSite *s)
{
    if (oct_count_active && s->atom != JS_ATOM_length) oct_own_fills++;
}
static force_inline void micro_ic_guarded_fill(ReadICSite *s)
{
    if (oct_count_active && s->atom != JS_ATOM_length) oct_guarded_fills++;
}
void oct_count_begin(void)
{
    oct_queries=oct_hits=oct_misses=oct_fused_hits=oct_proto_hits=0;
    oct_regular_queries=oct_own_fills=oct_guarded_hits=oct_guarded_fills=0;
    oct_count_active=1;
}
void oct_count_end(void)
{
    oct_count_active=0;
    assert(oct_queries == oct_hits + oct_misses);
    fprintf(stderr,"OCTANE_IC_COUNTS:{\"queries\":%llu,\"hits\":%llu,\"misses\":%llu,"
        "\"fused_hits\":%llu,\"proto_hits\":%llu,\"regular_queries\":%llu,"
        "\"own_fills\":%llu,\"guarded_hits\":%llu,\"guarded_fills\":%llu}\n",
        oct_queries,oct_hits,oct_misses,oct_fused_hits,oct_proto_hits,oct_regular_queries,
        oct_own_fills,oct_guarded_hits,oct_guarded_fills);
}
'''


def build():
    OUT.mkdir(exist_ok=False)
    release = b.load(HERE / 'build_manifest.json')
    original = Path(release['elf']).parent
    assert b.sha(original / 'qjs') == release['elf_sha256']
    assert all(b.sha(original / name) == digest for name, digest in release['sources'].items())
    data = {name: (original / name).read_text() for name in release['sources']}
    modified = data.copy()
    q = modified['quickjs.c']
    q = once(q, '#include "read_ic_runtime.inc"', '#include "micro_ic_diag.h"\n#include "read_ic_runtime.inc"')
    anchor = '            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
    q = once(q, anchor, '            micro_ic_hit(site, 1); \\\n' + anchor)
    modified['quickjs.c'] = q
    r = modified['read_ic_runtime.inc']
    r = once(r, '    RDI_COUNT(updates);', '    RDI_COUNT(updates);\n    micro_ic_fill(s);')
    r = once(r, '    RDI_OFFSET_COUNT(fills);', '    RDI_OFFSET_COUNT(fills);\n    micro_ic_guarded_fill(s);')
    modified['read_ic_runtime.inc'] = r
    o = modified['read_ic_opcodes.inc']
    o = once(o, '        RDI_QUERY();', '        RDI_QUERY(); \\\n        micro_ic_regular_query(site);')
    for anchor in ['                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);',
                   '                    val = JS_DupValue(ctx, p->prop[offset].u.value);']:
        indent = anchor[:len(anchor)-len(anchor.lstrip())]
        o = once(o, anchor, indent + 'micro_ic_hit(site, 0); \\\n' + anchor)
    o = once(o, '        RDI_COUNT(fallback);', '        RDI_COUNT(fallback); \\\n        micro_ic_miss(site);')
    anchor = '            if (rdi_guarded_offset_probe(ctx, site, p, &val)) {           \\\n'
    o = once(o, anchor, anchor + '                micro_ic_guarded_hit(site);                             \\\n')
    modified['read_ic_opcodes.inc'] = o
    c = modified['quickjs-libc.c']
    anchor = 'void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
    functions = '''extern void oct_count_begin(void);
extern void oct_count_end(void);
static JSValue js_oct_count_begin(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ oct_count_begin(); return JS_UNDEFINED; }
static JSValue js_oct_count_end(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ oct_count_end(); return JS_UNDEFINED; }

'''
    c = once(c, anchor, functions + anchor)
    anchor = '    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
    c = once(c, anchor, anchor + '''
    JS_SetPropertyStr(ctx, global_obj, "__oct_count_begin", JS_NewCFunction(ctx, js_oct_count_begin, "__oct_count_begin", 0));
    JS_SetPropertyStr(ctx, global_obj, "__oct_count_end", JS_NewCFunction(ctx, js_oct_count_end, "__oct_count_end", 0));''')
    modified['quickjs-libc.c'] = c
    modified['micro_ic_diag.h'] = HELPERS
    dest = OUT / 'work/GUARDED_OFFSET_COUNTS'
    dest.mkdir(parents=True)
    patch = []
    for name, content in modified.items():
        (dest / name).write_text(content)
        if data.get(name) != content:
            patch.extend(difflib.unified_diff(data.get(name, '').splitlines(True), content.splitlines(True),
                fromfile='a/' + name, tofile='b/' + name))
    (dest / 'compat').mkdir()
    (dest / 'compat/test-closefrom.c').write_bytes((original / 'compat/test-closefrom.c').read_bytes())
    b.save('instrumentation.patch', ''.join(patch))
    manifest = dict(release_elf=release['elf'], release_elf_sha256=release['elf_sha256'],
        release_sources=release['sources'], builder_sha256=b.sha(Path(__file__)),
        sources={name:b.sha(dest / name) for name in modified}, diagnostic_only=True)
    with (OUT / 'build.log').open('w') as log:
        result = subprocess.run(['make', '-j2', '-o', 'repl.c', 'qjs'], cwd=dest,
                                stdout=log, stderr=subprocess.STDOUT, timeout=300)
    assert result.returncode == 0, 'see build.log'
    manifest.update(elf=str(dest / 'qjs'), elf_sha256=b.sha(dest / 'qjs'))
    b.save('build_manifest.json', manifest)
    print('COUNT_BUILD_PASS', flush=True)


def extract(result):
    assert result['exit_code'] == 0 and not result['timeout']
    lines = result['stderr'].strip().splitlines()
    prefix = 'OCTANE_IC_COUNTS:'
    assert len(lines) == 1 and lines[0].startswith(prefix), result['stderr']
    counts = json.loads(lines[0][len(prefix):])
    assert counts['queries'] == counts['hits'] + counts['misses']
    assert counts['guarded_hits'] <= counts['hits']
    assert counts['queries'] == counts['regular_queries'] + counts['fused_hits']
    assert counts['fused_hits'] + counts['proto_hits'] + counts['guarded_hits'] <= counts['hits']
    return counts


def calibrate(binary):
    scripts = {
        'ordinary': ('var a={x:7};function read(o){return o.x;} var sum=0;'
                     '__oct_count_begin();for(var i=0;i<16;i++)sum+=read(a);__oct_count_end();'
                     'if(sum!==112)throw Error(sum);', dict(queries=16,hits=15,misses=1,guarded_hits=0)),
        'math': ('var sum=0;__oct_count_begin();for(var i=0;i<16;i++)sum+=Math.sqrt(4);'
                 '__oct_count_end();if(sum!==32)throw Error(sum);', dict(queries=16,hits=14,misses=2,guarded_hits=14)),
        'excluded_length': ('var a={length:2};var sum=0;__oct_count_begin();'
                            'for(var i=0;i<16;i++)sum+=Math.sqrt(4)+a.length;'
                            '__oct_count_end();if(sum!==64)throw Error(sum);',
                            dict(queries=16,hits=14,misses=2,guarded_hits=14)),
    }
    rows = {}
    for name, (source, expected) in scripts.items():
        b.save('calibration/' + name + '.js', source + '\n')
        result = b.capture([binary, OUT / 'calibration' / (name + '.js')], 'calibration', name)
        counts = extract(result)
        assert all(counts[k] == v for k,v in expected.items()), (name, counts)
        rows[name] = counts
    b.save('calibration.json', dict(status='PASS', cases=rows))
    print('CALIBRATION_PASS', flush=True)


def verify(protocol):
    manifest = b.load(OUT / 'build_manifest.json')
    binary = Path(manifest['elf'])
    assert b.sha(binary) == manifest['elf_sha256']
    assert b.sha(manifest['release_elf']) == manifest['release_elf_sha256']
    release = Path(manifest['release_elf']).parent
    for name,digest in manifest['release_sources'].items(): assert b.sha(release / name) == digest
    for name,digest in manifest['sources'].items(): assert b.sha(binary.parent / name) == digest
    for name,digest in protocol['frozen_files'].items(): assert b.sha(name) == digest
    assert b.boot() == protocol['boot_id']


def analyze(protocol):
    rows = [r for r in b.records() if r['event'] == 'diagnostic']
    assert len(rows) == len(protocol['scripts']) == 17 and all(r['valid'] for r in rows)
    historical = {r['case']:r for r in csv.DictReader((PREVIOUS / 'comparison.csv').open())}
    table = []
    for row in rows:
        c = row['counts']; old = historical[row['case']]
        assert c['queries'] == int(old['EVAL_queries']), row['case']
        old_rate = 100 * int(old['EVAL_hits']) / int(old['EVAL_queries'])
        new_rate = 100 * c['hits'] / c['queries']
        table.append(dict(case=row['case'], queries=c['queries'], old_hits=int(old['EVAL_hits']),
            new_original_path_hits=c['hits']-c['guarded_hits'], new_guarded_hits=c['guarded_hits'],
            new_hits=c['hits'], new_misses=c['misses'], old_hit_percent=old_rate,
            new_hit_percent=new_rate, delta_percentage_points=new_rate-old_rate))
    stream = io.StringIO(newline='')
    writer = csv.DictWriter(stream, list(table[0]), lineterminator='\n')
    writer.writeheader();writer.writerows(table)
    b.save('comparison.csv', stream.getvalue())
    total = {key:sum(r[key] for r in table) for key in ['queries','old_hits','new_hits','new_guarded_hits','new_misses']}
    total.update(old_hit_percent=100*total['old_hits']/total['queries'], new_hit_percent=100*total['new_hits']/total['queries'])
    b.save('aggregate.json', total)
    lines = ['# GUARDED_OFFSET 与 EVAL_COLD：Octane 命中率', '',
        '新版本每项一个独立计数进程，沿用旧计数脚本、Run区间和N。旧版计数引用 octane_ic_rates_20261109/attempt01。',
        '统计显式命名属性读取，排除 length、索引访问、全局变量及写入；包含融合读取和直接原型命中。',
        '新命中 = 原有 IC 路径命中 + 校验后的位置提示命中。后者校验成本更高，命中不代表与原快路径等价。',
        '所有17项的目标读取次数与旧版逐项完全一致。诊断耗时不作为性能结果，未重测A/V8或性能。', '',
        '|表项|原EVAL_COLD|GUARDED_OFFSET|变化（百分点）|新增路径命中次数|',
        '|---|---:|---:|---:|---:|']
    for r in table:
        lines.append(f"|{r['case']}|{r['old_hit_percent']:.4f}%|{r['new_hit_percent']:.4f}%|{r['delta_percentage_points']:+.4f}|{r['new_guarded_hits']:,}|")
    lines += ['', f"按实际读取次数加权合计：{total['old_hit_percent']:.4f}% → {total['new_hit_percent']:.4f}%。",
        '该加权结果由各项既定N决定，不是Octane耗时的suite几何平均。',
        '原IC命中和新位置命中在comparison.csv中分别列出；总命中变化不一定等于新位置命中数，缓存路径可能发生替代。', '']
    b.save('results.md', '\n'.join(lines))
    verify(protocol)
    b.save('audit.json', dict(status='PASS', diagnostic_samples=17, new_performance_samples=0,
        all_query_totals_match_old=True, all_counts_balance=True, all_original_validations_pass=True,
        release_sources_and_elf_unchanged=True, calibration='PASS'))
    print('COUNTS_COMPLETE', json.dumps(total), flush=True)


def main():
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.environ.update(TZ='Asia/Shanghai', LANG='C', LC_ALL='C')
    os.sched_setaffinity(0, {2})
    build()
    manifest = b.load(OUT / 'build_manifest.json')
    binary = manifest['elf']
    calibrate(binary)
    previous = b.load(PREVIOUS / 'protocol.json')
    scripts = {case:info['EVAL_COLD'] for case,info in previous['scripts'].items()}
    files = [Path(__file__), OUT / 'build_manifest.json', PREVIOUS / 'comparison.csv', PREVIOUS / 'protocol.json']
    files += [Path(info['path']) for info in scripts.values()]
    original_protocol = b.load(ROOT / 'experiments/native_confirmation_20261108/attempt02/protocol.json')
    files += [Path(info['measure']['path']) for info in original_protocol['scripts']['octane'].values()]
    protocol = dict(label='GUARDED_OFFSET', scripts=scripts, CPU=2, boot_id=b.boot(),
        diagnostic_processes_per_case=1, performance_samples_added=0,
        scope='Run-only explicit named reads excluding length; ordinary+fused+prototype+guarded-offset hits',
        frozen_files={str(path):b.sha(path) for path in files}, old_counts=str(PREVIOUS / 'comparison.csv'))
    b.save('protocol.json', protocol)
    b.save('environment.json', b.environment())
    for case,info in scripts.items():
        verify(protocol)
        command = [binary]
        if case == 'zlib.zlib':
            command += ['--std','-I',str(ROOT / 'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
        command.append(info['path'])
        result = b.capture(command, 'count', case, timeout=600,
                           identity=dict(case=case,N=info['N'],diagnostic_only=True))
        counts = extract(result)
        prefix = 'OCTANE_IC_RESULT:'
        payloads = [json.loads(s[len(prefix):]) for s in result['stdout'].splitlines() if s.startswith(prefix)]
        assert len(payloads) == 1
        payload = payloads[0]
        assert payload['correctness'] == 'PASS' and payload['case'] == case and payload['N'] == info['N']
        assert payload['warmup_calls'] == 0 and payload['phase'] == 'measure'
        if case.startswith('Crypto.'):
            gold = ROOT / 'experiments/ic_fast_slow_20261102/attempt01/octane/crypto' / (case + '.N' + str(info['N']) + '.json')
            assert payload['checksum'] == b.load(gold)['final_ciphertext']
        b.append(dict(event='diagnostic',valid=True,case=case,N=info['N'],counts=counts,validation_payload=payload))
        print('COUNT',case, f"{100*counts['hits']/counts['queries']:.6f}%",'guarded',counts['guarded_hits'],flush=True)
    analyze(protocol)


if __name__ == '__main__':
    main()
