"""Finite RegExp boundary diagnostics AFTER formal sampling; no formal rows."""
import re
from pathlib import Path
import common as c
from diagnostics import original_source,check
from code_evidence import excerpt,search_excerpt,WEBKIT
from parse_profiles import parse_v8

def main():
    # This guard prevents simultaneous profiler/formal performance processes.
    formal=list((c.ATTEMPT/'raw/records/formal').glob('*.json'))
    if len(formal)!=360 or not all(c.read(p)['valid'] for p in formal):raise RuntimeError('finish formal first')
    c.verify()
    c.capture('diagnostic.compiler.actual',['gcc','--version'])
    c.capture('capability.actual_identity',['id'])
    q=Path(c.manifest()['runtime']['engines']['quickjs']['binary']['path']).parent/'quickjs.c'
    url='https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c'
    excerpt(q,47612,47657,'qjs.regexp_compile',url+'#L47612')
    excerpt(q,48130,48176,'qjs.regexp_exec',url+'#L48130')
    search_excerpt(WEBKIT/'runtime/Options.cpp',r'disableAllJITRelatedOptions|!Options::useJIT',6,55,'jsc.disable_JIT.callchain')
    excerpt(WEBKIT/'llint/LowLevelInterpreter64.asm',1830,1917,'jsc.get_by_val.complete')
    for case in ('Richards.Richards','NavierStokes.NavierStokes'):
        pass # Profiles for these cases already have three independent runs.
    script=original_source('RegExp.RegExp',64)
    for e in c.ENGINES:
        for rep in range(1,4):
            folder=c.ATTEMPT/'profiles'/f'RegExp.RegExp.{e}.{rep}';folder.mkdir(parents=True,exist_ok=True)
            flags=['--prof','--no-logfile-per-isolate','--logfile='+str(folder/'v8.log')] if e=='v8' else ['--sample'] if e=='jsc' else []
            cmd=c.command(e,script,flags)
            if e=='quickjs':cmd=[str(c.ATTEMPT/'profiles/perf_exec')]+cmd
            r=c.capture(f'profile.RegExp.RegExp.{e}.{rep}',cmd,120,cwd=folder);check(r)
            c.save(folder/'stdout.txt',r['stdout']);c.save(folder/'stderr.txt',r['stderr'])
            if e=='v8':c.save(folder/'top_pc.json',parse_v8(folder/'v8.log'))
            print('REGEXP_DIAGNOSTIC',e,rep,flush=True)
    # Exact version tag is a reference only, never an artifact-commit assertion.
    for file in ('src/logging/log.cc','src/profiler/tick-sample.cc'):
        url='https://raw.githubusercontent.com/v8/v8/15.6.21/'+file
        r=c.capture('reference.v8.'+file.rsplit('/',1)[-1],['curl','-fL','--connect-timeout','10','--max-time','20',url],25)
        if r['exit_code']==0:c.save(c.ATTEMPT/'source_evidence'/('v8.reference.'+file.rsplit('/',1)[-1]),r['stdout'])
    print('POST_DIAGNOSTICS_DONE',flush=True)

if __name__=='__main__':main()
