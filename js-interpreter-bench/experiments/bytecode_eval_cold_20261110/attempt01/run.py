"""Inspect bytecode states in isolated clones of frozen A and EVAL_COLD."""
import concurrent.futures
import difflib
import hashlib
import json
import os
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PARENTS = {
    'A': ROOT / 'experiments/native_octane_20261107/attempt01',
    'EVAL_COLD': ROOT / 'experiments/native_octane_20261108/attempt11',
}


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def save(name, value):
    path = HERE / name
    path.parent.mkdir(parents=True, exist_ok=True)
    data = value if isinstance(value, str) else json.dumps(value, indent=2, ensure_ascii=False) + '\n'
    assert not path.exists(), name
    path.write_text(data)


def once(text, old, new):
    assert text.count(old) == 1, repr(old)
    return text.replace(old, new, 1)


def build(label):
    parent = PARENTS[label]
    original = parent / 'work' / label
    expected = json.loads((parent / 'source_manifest.json').read_text())[label]['files']
    original_elf_hash = json.loads((parent / 'runtime_manifest.json').read_text())[label]['sha256']
    assert sha(original / 'qjs') == original_elf_hash
    data = {name:(original / name).read_text() for name in expected}
    assert all(sha(original / name) == digest for name,digest in expected.items())
    modified = data.copy()
    prefix = '\n#define SNAPSHOT_EVAL_COLD 1\n' if label == 'EVAL_COLD' else '\n'
    modified['quickjs.c'] += prefix + '#include "snapshot.inc"\n'
    modified['snapshot.inc'] = (HERE / 'snapshot.inc').read_text()
    c = modified['quickjs-libc.c']
    anchor = 'void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
    c = once(c, anchor, 'extern JSValue qjs_snapshot(JSContext *ctx, JSValueConst this_val, int argc, JSValueConst *argv);\n' + anchor)
    anchor = '    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
    c = once(c, anchor, anchor + '\n    JS_SetPropertyStr(ctx, global_obj, "__snapshot", JS_NewCFunction(ctx, qjs_snapshot, "__snapshot", 3));')
    modified['quickjs-libc.c'] = c
    dest = HERE / 'work' / label
    dest.mkdir(parents=True, exist_ok=False)
    patch = []
    for name,content in modified.items():
        (dest / name).write_text(content)
        if data.get(name) != content:
            patch.extend(difflib.unified_diff(data.get(name, '').splitlines(True),content.splitlines(True),
                fromfile='a/'+name,tofile='b/'+name))
    (dest / 'compat').mkdir()
    (dest / 'compat/test-closefrom.c').write_bytes((original / 'compat/test-closefrom.c').read_bytes())
    save('patches/'+label+'.patch',''.join(patch))
    command = ['make','-j2','-o','repl.c','qjs']
    with (HERE / (label+'.build.log')).open('w') as log:
        result = subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,timeout=300)
    assert result.returncode == 0, label+' build failed'
    manifest = dict(label=label,original=str(original),release_elf_sha256=original_elf_hash,
        release_sources=expected,diagnostic_sources={name:sha(dest/name) for name in modified},
        diagnostic_elf=str(dest/'qjs'),diagnostic_elf_sha256=sha(dest/'qjs'),
        command=command,diagnostic_only=True,compile_or_prepare_logic_changed=False)
    save(label+'.manifest.json',manifest)
    print('BUILD_PASS',label,flush=True)
    return manifest


def decode(row):
    lines = []
    for ins in row['opcodes']:
        operand = ''
        if 'atom' in ins:
            operand = ' '+ins['atom']
        if 'site_index' in ins:
            operand += f" [IC{ins['site_index']}; delta={ins['site_delta']}]"
        if 'target' in ins:
            operand += ' -> '+str(ins['target'])
        if ins['format'] in ['u8','i8','u16','i16','i32','u32','loc','arg','var_ref','const','npop'] and 'site_index' not in ins:
            raw = bytes.fromhex(ins['raw'])[1:]
            operand += ' '+str(int.from_bytes(raw,'little',signed=ins['format'].startswith('i')))
        lines.append(f"{ins['pc']:04d}  {ins['raw']:<14} {ins['name']}{operand}")
    return '\n'.join(lines)+'\n'


def validate(rows):
    a, e = rows['A'],rows['EVAL_COLD']
    assert set(a) == set(e) and len(a) == 21
    assert all(not row['sites'] for row in a.values())
    for name in ['ownRead','ownLoop','protoCall','readStore','mathCall','evalRead','unusedEval']:
        ar = [a[stage+'.'+name] for stage in ['before','first','warm']]
        er = [e[stage+'.'+name] for stage in ['before','first','warm']]
        assert ar[0]['opcodes'] == ar[1]['opcodes'] == ar[2]['opcodes'],name
        assert er[1]['opcodes'] == er[2]['opcodes'],name
        assert len({x['byte_code_len'] for x in ar+er}) == 1,name
    assert [x['name'] for x in e['warm.ownRead']['opcodes']] == ['v6_get_arg0','get_field_rdi','return']
    assert [x['name'] for x in a['warm.ownRead']['opcodes']] == ['get_arg0','get_field','return']
    assert e['warm.ownRead']['sites'][0]['shape'] is not None
    proto_site = e['warm.protoCall']['sites'][0]
    assert proto_site['shape'] is not None and proto_site['holder_shape'] is not None
    assert any(x['name']=='put_field_shared' for x in e['warm.readStore']['opcodes'])
    assert e['warm.mathCall']['sites'][0]['shape'] is None
    assert not e['warm.mathCall']['receiver']['shape']['is_hashed']
    assert e['before.evalRead']['ic_ready'] is False and e['first.evalRead']['ic_ready'] is True
    assert e['before.evalRead']['function_class'] != e['first.evalRead']['function_class']
    assert all(not e[stage+'.unusedEval']['ic_ready'] for stage in ['before','first','warm'])
    save('audit.json',dict(status='PASS',snapshots=42,identical_case_file=True,
        same_lengths_A_and_EVAL=True,A_bytecode_unchanged_after_calls=True,
        EVAL_first_and_warm_bytecode_identical=True,own_cache_filled=True,
        direct_prototype_cache_filled=True,read_store_shared=True,Math_cache_empty=True,
        eval_preparation_deferred=True,unused_eval_never_prepared=True,
        diagnostic_only=True,performance_samples_added=0))


def main():
    assert not (HERE/'protocol.json').exists()
    protocol = dict(cases_sha256=sha(HERE/'cases.js'),helper_sha256=sha(HERE/'snapshot.inc'),
        runner_sha256=sha(Path(__file__)),labels=['A','EVAL_COLD'],performance_samples=0,
        scope='live bytecode and cache records before calls, after first call, after repeated calls; no GUARDED_OFFSET',
        stages=['before','first','warm'],original_release_ELFs_preserved=True)
    save('protocol.json',protocol)
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        manifests = list(pool.map(build,['A','EVAL_COLD']))
    rows = {}
    env = dict(os.environ,TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
    for m in manifests:
        label = m['label']
        result = subprocess.run([m['diagnostic_elf'],str(HERE/'cases.js')],capture_output=True,text=True,env=env,timeout=60)
        save('raw/'+label+'.json',dict(returncode=result.returncode,stdout=result.stdout,stderr=result.stderr))
        assert result.returncode == 0 and not result.stderr,result.stderr
        assert result.stdout.splitlines()[-1] == 'BYTECODE_CASES_PASS'
        prefix = 'BYTECODE_SNAPSHOT:'
        data = [json.loads(s[len(prefix):]) for s in result.stdout.splitlines() if s.startswith(prefix)]
        rows[label] = {x['label']:x for x in data}
        save('snapshots/'+label+'.json',data)
        for row in data:
            save('bytecode/'+label+'/'+row['label']+'.txt',decode(row))
        native = subprocess.run(['objdump','-d','-S','--disassemble=JS_CallInternal',str(Path(m['original'])/'qjs')],
                                capture_output=True,text=True,timeout=60)
        save('native/'+label+'.JS_CallInternal.txt',native.stdout)
        assert native.returncode == 0,native.stderr
        assert sha(Path(m['original'])/'qjs') == m['release_elf_sha256']
        assert all(sha(Path(m['original'])/name)==digest for name,digest in m['release_sources'].items())
        print('SNAPSHOTS_PASS',label,len(data),flush=True)
    validate(rows)
    for name in ['ownRead','ownLoop','protoCall','readStore','mathCall','evalRead','unusedEval']:
        left = (HERE/'bytecode/A'/('warm.'+name+'.txt')).read_text()
        right = (HERE/'bytecode/EVAL_COLD'/('warm.'+name+'.txt')).read_text()
        save('diffs/'+name+'.diff',''.join(difflib.unified_diff(left.splitlines(True),right.splitlines(True),fromfile='A/'+name,tofile='EVAL_COLD/'+name)))
    print('BYTECODE_ANALYSIS_PASS',flush=True)


if __name__ == '__main__':
    main()
