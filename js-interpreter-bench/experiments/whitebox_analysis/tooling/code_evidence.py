"""Collect fixed source snippets and bytecode; diagnostic costs excluded."""
import os, re
from pathlib import Path
import common as c
from run_micro import script,VARIANTS
from diagnostics import original_source,check

WEBKIT=Path('/home/mzyx/jsc_webkit_fd3406f/Source/JavaScriptCore')

def excerpt(path,lo,hi,label,url=None):
    lines=path.read_text(errors='replace').splitlines()
    c.save(c.ATTEMPT/'source_evidence'/(label+'.txt'),
        'Source: '+str(path)+'\nSHA256: '+c.sha(path)+'\nURL: '+str(url)+'\n'+
        '\n'.join(f'{i+1}: {lines[i]}' for i in range(lo-1,min(hi,len(lines))))+'\n')

def search_excerpt(path,pattern,before,after,label):
    lines=path.read_text(errors='replace').splitlines();matches=[i for i,line in enumerate(lines) if re.search(pattern,line)]
    c.save(c.ATTEMPT/'source_evidence'/(label+'.txt'),'Source: '+str(path)+'\nSHA256: '+c.sha(path)+'\n'+
        '\n\n'.join('\n'.join(f'{j+1}: {lines[j]}' for j in range(max(0,i-before),min(len(lines),i+after))) for i in matches))

def main():
    c.verify()
    q=Path(c.manifest()['runtime']['engines']['quickjs']['binary']['path']).parent/'quickjs.c'
    base='https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c'
    for lo,hi,label in [(8210,8258,'qjs.property_internal'),(9029,9099,'qjs.property_value'),
                         (17746,17790,'qjs.dispatch'),(19100,19174,'qjs.field'),
                         (19398,19446,'qjs.array'),(19494,19533,'qjs.array_store'),
                         (36260,36272,'qjs.bytecode_compile'),(45680,45770,'qjs.regexp')]:
        excerpt(q,lo,hi,label,base+'#L'+str(lo))
    for file,pattern,label,b,a in [
        ('llint/LowLevelInterpreter64.asm',r'macro (getById|getByVal)|op_get_by_id|op_get_by_val', 'jsc.LLInt.access',5,65),
        ('llint/LLIntSlowPaths.cpp',r'slow_path_get_by_id|slow_path_get_by_val','jsc.LLInt.slow',3,65),
        ('runtime/Options.cpp',r'useRegExpJIT\(\) = false|if \(!useJIT','jsc.regexp.options',4,22),
        ('runtime/RegExp.cpp',r'useRegExpJIT\(\)|Yarr::interpret','jsc.regexp.execution',7,20),
        ('runtime/OptionsList.h',r'useSamplingProfiler|collectExtraSamplingProfiler|samplingProfiler','jsc.profiler.options',1,2),
        ('jsc.cpp',r'm_dumpSamplingProfilerData|if \(!strcmp\(arg, "--sample"','jsc.profiler.shell',2,12)]:
        search_excerpt(WEBKIT/file,pattern,b,a,label)
    # Bytecode is diagnostic only. Each engine uses identical marked source.
    diag=c.read(c.ATTEMPT/'source_evidence/diagnostic_build.json')['binary']
    rows=[]
    for v in VARIANTS:
        original,_=script(v,1)
        text=original.read_text().replace('var __wbStart=benchNow();',"console.log('WB_TIMER_START');var __wbStart=benchNow();")
        marked=c.ATTEMPT/'bytecode'/(v+'.marked.js');c.save(marked,text)
        for e in c.ENGINES:
            flags=['--print-bytecode','--print-bytecode-filter=__wbKernel'] if e=='v8' else ['-d'] if e=='jsc' else []
            cmd=c.command(e,marked,flags);env=None
            if e=='quickjs':cmd[0]=diag;env=dict(os.environ,WB_DUMP='1',WB_COUNT='1')
            r=c.capture('bytecode.'+v+'.'+e,cmd,90,env=env)
            if r['exit_code']!=0 or 'WB_RESULT:' not in r['stdout']:raise RuntimeError('bytecode correctness failed')
            c.save(c.ATTEMPT/'bytecode'/(v+'.'+e+'.txt'),r['stdout']+'\n--- STDERR (separate stream; not chronological) ---\n'+r['stderr'])
            rows.append({'variant':v,'engine':e,'script_sha256':c.sha(marked),'command':cmd,
                'dump_frontend_before_timer':'QJS compile callback; V8 observed order in stdout' if e!='jsc' else 'UNKNOWN: separate streams; first-call preparation not excluded'})
    c.export(c.ATTEMPT/'bytecode/manifest.csv',rows)
    # Original-function hash to source/bytecode association for anonymous Richards.
    r=c.capture('bytecode.original.richards.jsc',c.command('jsc',original_source('Richards.Richards',1),['-d']),90);check(r)
    c.save(c.ATTEMPT/'bytecode/original.richards.jsc.txt',r['stdout']+'\n--- STDERR ---\n'+r['stderr'])
    # Exact symbol addresses from actual built library, not an assembly-only claim.
    lib=c.manifest()['runtime']['engines']['jsc']['dependencies'][0]['path']
    r=c.capture('jsc.full_symbols',['nm','-an',lib],120)
    symbols=[line for line in r['stdout'].splitlines() if re.search(r'llint_op_get_by_(id|val)(?:_narrow)?$',line)]
    c.save(c.ATTEMPT/'source_evidence/jsc.access.symbols.txt','\n'.join(symbols)+'\n')
    for line in symbols:
        addr=int(line.split()[0],16)
        r=c.capture('disasm.jsc.'+line.split()[-1],['objdump','-d','-M','intel',f'--start-address={addr}',f'--stop-address={addr+768}',lib],90)
        c.save(c.ATTEMPT/'source_evidence'/(line.split()[-1]+'.asm'),r['stdout'])
    r=c.capture('diagnostic.actual_patch',['git','diff','--','quickjs.c'],cwd=Path(diag).parent)
    c.save(c.ATTEMPT/'source_evidence/quickjs-diagnostic.applied.diff',r['stdout'])
    print('CODE_EVIDENCE_DONE',flush=True)

if __name__=='__main__':main()
