"""Isolated same-revision O2 diagnostics, plus full-process hardware counters."""
import json, os, re, shutil
from pathlib import Path
import common as c
from diagnostics import CASES,original_source,check

def main():
    c.verify();m=c.manifest()['runtime']['engines']['quickjs']
    src=Path(m['binary']['path']).parent
    diag=Path('/home/mzyx/whitebox_diag_04be246_attempt01')
    if not diag.exists():
        checkout=c.ROOT/'engines/quickjs-upstream'
        r=c.capture('diagnostic.clone_from_checkout',['git','-c','safe.directory='+str(checkout),'clone','--no-hardlinks',str(checkout),str(diag)],120)
        if r['exit_code']!=0:raise RuntimeError('diagnostic clone failed')
    r=c.capture('diagnostic.revision',['git','rev-parse','HEAD'],cwd=diag)
    if r['stdout'].strip()!=m['source_commit']:raise RuntimeError('diagnostic revision differs')
    header=c.ATTEMPT/'source_evidence/whitebox-counters.h'
    # Materialization of supplied build patch/header only in this isolated clone.
    if not (diag/'whitebox-counters.h').exists():shutil.copyfile(header,diag/header.name)
    if not (c.ATTEMPT/'raw/diagnostic.apply2.json').exists():
        r=c.capture('diagnostic.apply2',['git','apply','--unidiff-zero','--recount',str(c.ATTEMPT/'source_evidence/quickjs-diagnostic.patch')],cwd=diag)
        if r['exit_code']!=0:raise RuntimeError('diagnostic patch rejected; frozen source untouched')
    r=c.capture('diagnostic.build',['make','-j4','qjs'],timeout=300,cwd=diag)
    if r['exit_code']!=0:raise RuntimeError('diagnostic build failed')
    c.save(c.ATTEMPT/'source_evidence/diagnostic_build.json',{'binary':str(diag/'qjs'),'sha256':c.sha(diag/'qjs'),
        'size':(diag/'qjs').stat().st_size,'revision':m['source_commit'],'compiler':m['compiler'],
        'build_command':r['command'],'optimization':'upstream -O2; diagnostic counters and optional dump',
        'patch_sha256':c.sha(c.ATTEMPT/'source_evidence/quickjs-diagnostic.patch'),'header_sha256':c.sha(header),
        'frozen_binary_replaced':False})
    for case,(_,n) in CASES.items():
        script=original_source(case,n)
        for rep in range(1,4):
            cmd=c.command('quickjs',script);cmd[0]=str(diag/'qjs')
            env=dict(os.environ,WB_COUNT='1')
            r=c.capture(f'native_counts.{case}.{rep}',cmd,180,env=env);check(r)
        # Low-N paired diagnostic overhead, not formal speed ranking.
        for rep in range(1,4):
            for variant in ('frozen','counter'):
                small=original_source(case,2);cmd=c.command('quickjs',small)
                if variant=='counter':cmd[0]=str(diag/'qjs')
                r=c.capture(f'overhead.{case}.{variant}.{rep}',cmd,90,env=dict(os.environ,WB_COUNT='1'));check(r)
    binary=c.ATTEMPT/'profiles/perf_exec'
    c.capture('perf_exec.build',['gcc','-O2','-Wall',str(c.BASE/'tooling/perf_exec.c'),'-o',str(binary)])
    for case,(_,n) in CASES.items():
        for e in c.ENGINES:
            for rep in range(1,4):
                r=c.capture(f'hardware.{case}.{e}.{rep}',[str(binary)]+c.command(e,original_source(case,n)),180);check(r)
                print('HARDWARE',case,e,rep,flush=True)
    # Actual frozen binary dispatch disassembly; no counters applied here.
    r=c.capture('disasm.quickjs',['objdump','-d','-M','intel','--disassemble=JS_CallInternal',m['binary']['path']],90)
    c.save(c.ATTEMPT/'source_evidence/quickjs.JS_CallInternal.asm',r['stdout'])
    print('NATIVE_DIAGNOSTICS_DONE',flush=True)

if __name__=='__main__':main()
