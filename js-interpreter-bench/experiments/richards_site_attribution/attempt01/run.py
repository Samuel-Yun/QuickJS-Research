"""Richards-only site attribution; execute inside the already frozen Ubuntu WSL2.
No formal performance data. Records and generated artifacts are write-once.
"""
import argparse
import csv
import difflib
import hashlib
import importlib.util
import json
import os
import platform
import re
import shutil
import subprocess
import sys
from pathlib import Path

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
OLD=ROOT/'experiments/call_path_followup/attempt01'
spec=importlib.util.spec_from_file_location('old_utils',ROOT/'experiments/bytecode_whitebox_simple/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
save,sha,read,export,capture=b.save,b.sha,b.read,b.export,b.capture
BUILD=Path('/home/mzyx/richards_site_attribution_attempt01_diag')
UP=ROOT/'benchmarks/octane/upstream'

def prepare():
    prior=read(OLD/'manifest.json')
    assert (platform.node(),platform.release(),platform.machine())==(prior['host'],prior['kernel'],'x86_64')
    for e in ('quickjs','v8'):
        r=prior['engines'][e]
        for f in [r['binary']]+r['dependencies']+r['dynamic_libraries']+prior['adapters'][e]:
            assert sha(f['path'])==f['sha256'],f
    assert not os.environ.get('LD_PRELOAD')
    inputs={str(p.relative_to(ROOT)):sha(p) for p in (UP/'base.js',UP/'richards.js')}
    preserved={str(p.relative_to(ROOT)):sha(p) for p in OLD.rglob('*') if p.is_file() and '__pycache__' not in p.parts}
    save(HERE/'source_evidence/preservation_before.json',preserved)
    save(HERE/'manifest.json',dict(experiment='richards_site_attribution/attempt01',cohort=prior['cohort'],
         host=prior['host'],kernel=prior['kernel'],architecture='x86_64',engines=prior['engines'],
         adapters=prior['adapters'],inputs=inputs,diagnostic_build=str(BUILD),
         baseline_commit='344215cd482b494eeea99b6ff6fbe05bac925d65',
         mode='DIAGNOSTIC_ORIGINAL_RICHARDS_FIRST_CALL_INCLUSIVE_MONOTONIC',
         formal_samples=0,v8_exact_source_attestation=None))
    r=capture(HERE/'raw/environment.json',['sh','-c','uname -a; cat /etc/os-release; gcc --version; uptime; cat /proc/sys/kernel/random/boot_id'])
    save(HERE/'environment.txt',r['stdout']+'\nWSL2 host power/frequency/background control: UNKNOWN. Diagnostic times only.\n')
    save(HERE/'execution_contract.json',dict(source='untouched base.js + richards.js bytes + same original driver',
       before_timer=['startup','VM initialization','static frontend','adapters','ResetRNG','Setup'],
       timed=['first and subsequent Run','original assertions 2322/928','GC/helper/builtin as encountered'],
       warmup_calls=0,clock='existing native monotonic benchNow',counts_gate='C entry/exit of runRichards',
       samples_gate='offline native monotonic timestamp within JS start/stop',
       diagnostic_times_not_formal=True,v8_flags=prior['engines']['v8']['runtime_flags']))

def transform(src):
    def once(old,new):
        nonlocal src
        assert src.count(old)==1,(old[:100],src.count(old))
        src=src.replace(old,new)
    once('//#define DUMP_BYTECODE  (1)', '#define DUMP_BYTECODE  (1)') if '//#define DUMP_BYTECODE  (1)' in src else None
    if not re.search(r'^#define DUMP_BYTECODE\s',src,re.M):
        pos=src.index('#include "cutils.h"');src=src[:pos]+'#define DUMP_BYTECODE 1\n'+src[pos:]
    once('static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,',
         '#include "site_hooks.h"\n\nstatic force_inline JSShapeProperty *find_own_property(JSProperty **ppr,')
    end=src.index('/* indicate that the object may be part of a function prototype cycle */')
    src=src[:end]+'''/* Every later caller, including writes/runtime helpers, goes through this.
 * __LINE__ records this diagnostic source, not the old binary/source layout. */
static force_inline JSShapeProperty *sa_find_own_property(JSProperty **ppr,
                                    JSObject *p, JSAtom atom, unsigned origin)
{
    JSShapeProperty *result=find_own_property(ppr,p,atom);
    sa_probe(origin,result!=NULL);
    return result;
}
#define find_own_property(ppr,p,atom) sa_find_own_property(ppr,p,atom,__LINE__)

'''+src[end:]
    start=src.index('static JSValue JS_CallInternal(JSContext *caller_ctx, JSValueConst func_obj,\n')
    end=src.index('\nJSValue JS_Call(JSContext',start)
    part=src[start:end]
    part=part.replace('    JSRuntime *rt = caller_ctx->rt;',
          '    SAFrame sa_fs __attribute__((cleanup(sa_frame_end))) = sa_frame_begin();\n    unsigned sa_fnid = 0;\n    JSRuntime *rt = caller_ctx->rt;',1)
    pattern='b = p->u.func.function_bytecode;'
    assert part.count(pattern)==2
    part=part.replace(pattern,pattern+'\n            sa_fnid = sa_enabled ? sa_fid(b) : 0;\n            sa_function_enter(&sa_fs, sa_fnid);')
    # Macro is expanded in the interpreter case, before reading atom operands.
    part=part.replace('                JSValue val, obj;                                       \\\n',
         '                SA_PROP_SCOPE();                                       \\\n                int sa_depth = 0;                                      \\\n                JSValue val, obj;                                       \\\n')
    assert part.count('int sa_depth = 0;')==1
    part=part.replace('                            /* found */                                 \\\n',
         '                            sa_hit(sa_depth, pr->u.value, prs->flags); \\\n                            /* found */                                 \\\n')
    part=part.replace('                        p = p->shape->proto;                            \\\n',
         '                        sa_depth++;                                \\\n                        p = p->shape->proto;                            \\\n')
    part=part.replace('                            val = JS_UNDEFINED;                         \\\n',
         '                            sa_flag(1);                                \\\n                            val = JS_UNDEFINED;                         \\\n')
    part=part.replace('                name ## _slow_path:                                     \\\n',
         '                name ## _slow_path:                                     \\\n                    sa_flag(0);                                        \\\n')
    part=part.replace('        CASE(OP_put_field):\n            {',
         '        CASE(OP_put_field):\n            {\n                SA_PROP_SCOPE();')
    part=part.replace('                        /* fast path */\n                        set_value(ctx, &pr->u.value, sp[-1]);',
         '                        sa_hit(0, pr->u.value, prs->flags);\n                        sa_flag(2);\n                        /* fast path */\n                        set_value(ctx, &pr->u.value, sp[-1]);')
    part=part.replace('                put_field_slow_path:\n', '                put_field_slow_path:\n                    sa_flag(0);\n')
    src=src[:start]+part+src[end:]
    once('static __exception int next_token(JSParseState *s);',
         '#include "site_metadata.h"\n\nstatic __exception int next_token(JSParseState *s);')
    once('    b->realm = JS_DupContext(ctx);\n\n    add_gc_object(ctx->rt, &b->header, JS_GC_OBJ_TYPE_FUNCTION_BYTECODE);',
         '    b->realm = JS_DupContext(ctx);\n\n    sa_register(ctx, b);\n    add_gc_object(ctx->rt, &b->header, JS_GC_OBJ_TYPE_FUNCTION_BYTECODE);')
    once('    if (!fd->strip_debug) {\n        js_dump_function_bytecode(ctx, b);',
         '    if (!fd->strip_debug && getenv("SA_DUMP")) {\n        js_dump_function_bytecode(ctx, b);')
    return src

def build():
    prepare()
    original=(ROOT/'engines/quickjs-upstream/quickjs.c').read_text()
    patched=transform(original)
    patch=''.join(difflib.unified_diff(original.splitlines(True),patched.splitlines(True),fromfile='a/quickjs.c',tofile='b/quickjs.c'))
    save(HERE/'probes/quickjs_diagnostic.patch',patch)
    if not BUILD.exists():
        shutil.copytree(ROOT/'engines/quickjs-upstream',BUILD,ignore=shutil.ignore_patterns('.git','.obj','qjs','qjsc','libquickjs.a','examples','tests','test262'))
    if (BUILD/'quickjs.c').read_text()==original:
        # Bulk line-ending normalization of the NEW diagnostic copy only;
        # Windows checkout CRLF otherwise makes GNU patch reject every hunk.
        (BUILD/'quickjs.c').write_bytes(original.encode())
        # Mechanical application of the preserved diagnostic-only patch.
        r=capture(HERE/'raw/build_patch_lf.json',['patch','--directory='+str(BUILD),'-p1','-i',str(HERE/'probes/quickjs_diagnostic.patch')]);assert r['exit_code']==0,r
        for name in ('site_hooks.h','site_metadata.h'):shutil.copyfile(HERE/'probes'/name,BUILD/name)
    assert (BUILD/'quickjs.c').read_text()==patched
    for name in ('site_hooks.h','site_metadata.h'):
        if not (HERE/'source_evidence/diagnostic_identity.json').exists():shutil.copyfile(HERE/'probes'/name,BUILD/name)
        assert sha(BUILD/name)==sha(HERE/'probes'/name)
    log=HERE/'raw/build.json'; attempt=1
    while log.exists() and read(log)['exit_code']!=0:
        attempt+=1;log=HERE/'raw'/f'build.attempt{attempt:02d}.json'
    r=capture(log,['make','-C',str(BUILD),'-j2','qjs','qjsc'],timeout=180)
    assert r['exit_code']==0,r
    save(HERE/'source_evidence/diagnostic_identity.json',dict(binary=str(BUILD/'qjs'),sha256=sha(BUILD/'qjs'),
       qjsc_sha256=sha(BUILD/'qjsc'),source_revision=read(HERE/'manifest.json')['engines']['quickjs']['source_commit'],
       original_quickjs_c_sha256=sha(ROOT/'engines/quickjs-upstream/quickjs.c'),patched_quickjs_c_sha256=sha(BUILD/'quickjs.c'),
       patch_sha256=sha(HERE/'probes/quickjs_diagnostic.patch'),
       flags='upstream make optimized -O2 -g; DUMP_BYTECODE=1; conditional native diagnostics, see raw/build.json',
       production_binary_replaced=False))

def source(n):
    # Exact original driver from previous attempt, only N differs.
    old=(OLD/'richards/original.N1.js').read_bytes()
    assert old.count((UP/'richards.js').read_bytes())==1
    assert old.count(b'__cfRep<1;')==1 and old.count(b'N:1,')==1
    return old.replace(b'__cfRep<1;',f'__cfRep<{n};'.encode()).replace(b'N:1,',f'N:{n},'.encode())

def command(e,p,diagnostic=False,extra=()):
    m=read(HERE/'manifest.json');cmd=list(m['engines'][e]['command_prefix'])+list(extra)
    if diagnostic:cmd[0]=str(BUILD/'qjs')
    adapters=[a['path'] for a in m['adapters'][e]]
    if e=='quickjs':
        for a in adapters:cmd+=['-I',a]
    else:cmd+=adapters
    return cmd+[str(p)]

def check(r):
    assert r['exit_code']==0,r
    m=re.search(r'^RICHARDS (.+)$',r['stdout'],re.M);assert m,r
    v=json.loads(m[1]);assert v['correctness']=='PASS' and v['warmup_calls']==0
    return v

def run_diag(label,n,context=1,count=0,interval=0,dump=False):
    p=HERE/'scripts'/f'original.N{n}.js';save(p,source(n))
    out=HERE/'raw'/label;out.parent.mkdir(parents=True,exist_ok=True)
    env=dict(os.environ,SA_OUT=str(out),SA_CONTEXT=str(context),SA_COUNT=str(count),SA_INTERVAL_US=str(interval))
    if dump:env['SA_DUMP']='1'
    r=capture(HERE/'raw'/f'{label}.json',command('quickjs',p,True),timeout=180,env=env)
    check(r)
    save(HERE/'raw'/f'{label}.settings.json',dict(N=n,context=context,count=count,interval_us=interval,
       binary_sha256=sha(BUILD/'qjs'),script_sha256=sha(p),env={k:v for k,v in env.items() if k.startswith('SA_')},diagnostic_only=True))
    print(label,check(r)['elapsed_ms'],flush=True)
    return r

def gates():
    for n in (1,2):
        p=HERE/'scripts'/f'original.N{n}.js';save(p,source(n))
        for e in ('quickjs','v8'):
            r=capture(HERE/'raw'/f'correctness_{e}_N{n}.json',command(e,p));check(r)
        run_diag(f'counts_N{n}',n,count=1,dump=(n==1))
    q=read(HERE/'raw/counts_N1.json');save(HERE/'bytecode/quickjs.full.txt',q['stdout'])
    p=HERE/'scripts/original.N1.js'
    r=capture(HERE/'raw/v8_dump.json',command('v8',p,extra=('--print-bytecode','--print-bytecode-filter=*')));check(r)
    save(HERE/'bytecode/v8.full.txt',r['stdout'])
    # Fixed script bytecode equality diagnostic vs frozen release qjsc.
    frozen=Path(read(HERE/'manifest.json')['engines']['quickjs']['binary']['path']).with_name('qjsc')
    for kind,compiler in [('frozen',frozen),('diagnostic',BUILD/'qjsc')]:
        dest=HERE/'bytecode'/f'original.{kind}.c'
        r=capture(HERE/'raw'/f'qjsc_{kind}.json',[str(compiler),'-c','-o',str(dest),'-N','richards_code',str(p)])
        assert r['exit_code']==0,r
    assert sha(HERE/'bytecode/original.frozen.c')==sha(HERE/'bytecode/original.diagnostic.c')
    save(HERE/'source_evidence/bytecode_identity.json',dict(serialized_equal=True,sha256=sha(HERE/'bytecode/original.frozen.c'),
        scope='one exact common original.N1.js input, final serialized representation',frozen_qjsc_sha256=sha(frozen)))

def sample():
    # Same binary, context off/on, detailed counters OFF. All diagnostic runs.
    for rep in range(1,4):
        for context in ([0,1] if rep!=2 else [1,0]):
            run_diag(f'sample_ctx{context}_rep{rep}',4096,context=context,interval=1000)
    # Alternative requested interval: actual 20ms if this WSL timer honors it.
    run_diag('sample_ctx1_20ms',4096,interval=20000)
    for rep in range(1,4):
        for context in ([0,1] if rep!=2 else [1,0]):
            run_diag(f'control_nosignal_ctx{context}_rep{rep}',512,context=context)

def audit_preservation():
    m=read(HERE/'manifest.json')
    for e in ('quickjs','v8'):
        for f in [m['engines'][e]['binary']]+m['engines'][e]['dependencies']:
            assert sha(f['path'])==f['sha256'],f
    for p,h in read(HERE/'source_evidence/preservation_before.json').items():assert sha(ROOT/p)==h,p
    for p,h in m['inputs'].items():assert sha(ROOT/p)==h,p
    print('FROZEN_ARTIFACTS_AND_PRIOR_ATTEMPT_UNCHANGED',flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['prepare','build','gates','sample','preserve','all']);a=p.parse_args()
    if a.stage in ('prepare','all'):prepare()
    if a.stage in ('build','all'):build()
    if a.stage in ('gates','all'):gates()
    if a.stage in ('sample','all'):sample()
    if a.stage in ('preserve','all'):audit_preservation()
