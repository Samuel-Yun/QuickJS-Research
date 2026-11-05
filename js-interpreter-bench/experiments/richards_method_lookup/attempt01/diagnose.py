"""Finite independent diagnostic build and runs, never used for formal performance."""
import difflib, json, os, shutil, subprocess
from pathlib import Path
import common as c

DIAG=Path('/home/mzyx/richards_method_diag_04be246_attempt01')

def build():
    if (c.HERE/'source_evidence/diagnostic_build.json').exists():
        m=c.read(c.HERE/'source_evidence/diagnostic_build.json')
        if c.sha(DIAG/'qjs')!=m['binary_sha256']: raise RuntimeError('diagnostic artifact changed')
        return
    origin=c.ROOT/'engines/quickjs-upstream'
    r=c.capture('build.clone',['git','-c','safe.directory='+str(origin),'clone','--no-hardlinks',str(origin),str(DIAG)],90)
    if r['exit_code']!=0: raise RuntimeError('clone failed '+r['stderr'])
    rev=c.capture('build.revision',['git','rev-parse','HEAD'],cwd=DIAG)
    if rev['stdout'].strip()!=c.manifest()['runtime']['engines']['quickjs']['source_commit']: raise RuntimeError('wrong revision')
    shutil.copyfile(c.HERE/'source_evidence/ml_counters.h',DIAG/'ml_counters.h')
    r=c.capture('build.patch',['git','apply','--unidiff-zero','--recount',str(c.HERE/'source_evidence/quickjs_diagnostic.patch')],cwd=DIAG)
    if r['exit_code']!=0: raise RuntimeError('patch failed '+r['stderr'])
    r=c.capture('build.make',['make','-j4','qjs'],600,cwd=DIAG)
    if r['exit_code']!=0: raise RuntimeError('build failed '+r['stderr'])
    c.save(c.HERE/'source_evidence/diagnostic_build.json',{'revision':rev['stdout'].strip(),'binary':str(DIAG/'qjs'),'binary_sha256':c.sha(DIAG/'qjs'),'compiler':c.read(c.HERE/'diagnostics/records/environment.compiler.json')['stdout'],'command':r['command'],'flags_evidence':'diagnostics/records/build.make.json','optimized':'upstream -O2 with debug symbols, diagnostic counters + conditional DUMP_BYTECODE','patch_sha256':c.sha(c.HERE/'source_evidence/quickjs_diagnostic.patch'),'counter_header_sha256':c.sha(c.HERE/'source_evidence/ml_counters.h'),'replaces_formal_binary':False})

def script(variant,n,sequence=False):
    source=(c.HERE/f'microbench/{variant}.source.js').read_bytes()
    driver=(c.HERE/'microbench/driver.js').read_text().replace('__CONFIG__',json.dumps({'variant':variant,'N':n}))
    if sequence:
        # Diagnose original receiver/argument/return/state sequence without changing method bodies.
        hook="""
;(function(){
 var fn=TaskControlBlock.prototype.run, count=0, hash=2166136261, ids=[0,0,0,0,0,0], states=[0,0,0,0,0];
 function mix(x){hash=Math.imul(hash ^ x,16777619)>>>0;}
 TaskControlBlock.prototype.run=function(){
  ++count; ++ids[this.id]; mix(this.id); mix(this.state); mix(this.queue ? this.queue.id+1 : 0);
  var ret=fn.call(this); mix(ret ? ret.id+1 : 0); mix(this.state); return ret;
 };
 globalThis.__mlSequence=function(){return {count:count,hash:hash,receiver_ids:ids};};
})();
"""
        source+=hook.encode()
        driver=driver.replace('test.TearDown();',"test.TearDown(); console.log('ML_SEQUENCE:' + JSON.stringify(__mlSequence()));")
    p=c.HERE/'diagnostics/scripts'/(f'{variant}.N{n}'+('.sequence.js' if sequence else '.js'))
    c.save(p,source+driver.encode());return p

def main():
    c.verify(True);build()
    rows=[]
    # Original frozen N512; no performance matrix change. Three serial replicates.
    p=script('original',512)
    for rep in range(1,4):
        for kind in ('frozen','counter'):
            r=c.capture(f'original.overhead.{kind}.{rep}',c.command('quickjs',p,diagnostic_binary=DIAG/'qjs' if kind=='counter' else None),180)
            if r['exit_code']!=0 or 'ML_RESULT:' not in r['stdout']: raise RuntimeError(str(r))
            rows.append({'rep':rep,'kind':kind,'script_sha256':c.sha(p),'record':f'diagnostics/records/original.overhead.{kind}.{rep}.json'})
    c.export(c.HERE/'diagnostics/overhead.csv',rows)
    # Compare exact original/A/B selected receiver sequence using unmodified task bodies.
    for variant in ('original','A','B'):
        p=script(variant,512,True)
        for e in c.ENGINES:
            for rep in range(1,4):
                r=c.capture(f'sequence.{variant}.{e}.{rep}',c.command(e,p),180)
                if r['exit_code']!=0 or 'ML_SEQUENCE:' not in r['stdout']: raise RuntimeError('sequence failed')
                print('SEQUENCE',variant,e,rep,flush=True)
    for variant in ('A','B'):
        p=script(variant,512)
        for rep in range(1,4):
            r=c.capture(f'counter.{variant}.{rep}',c.command('quickjs',p,diagnostic_binary=DIAG/'qjs'),180)
            if r['exit_code']!=0 or 'ML_COUNTERS:' not in r['stdout']: raise RuntimeError('counter failed')
    for variant in ('A','B'):
        p=script(variant,1)
        for e in c.ENGINES:
            extra=['--print-bytecode','--print-bytecode-filter=mlSchedule'] if e=='v8' else ['-d'] if e=='jsc' else []
            env=dict(os.environ,ML_DUMP='1') if e=='quickjs' else None
            r=c.capture(f'bytecode.{variant}.{e}',c.command(e,p,extra,DIAG/'qjs' if e=='quickjs' else None),180,env)
            if r['exit_code']!=0: raise RuntimeError('bytecode failed')
            c.save(c.HERE/f'diagnostics/bytecode/{variant}.{e}.txt',r['stdout']+'\nSTDERR:\n'+r['stderr'])
    c.verify(True);print('DIAGNOSTICS_DONE',flush=True)

if __name__=='__main__': main()
