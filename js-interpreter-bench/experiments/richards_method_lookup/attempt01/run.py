"""Write-once prospective serial experiment. all = gates + pilot + actual 180 samples."""
import argparse, itertools, json, math, os, random, re, zipfile
from pathlib import Path
import common as c

REPS=30;SEED=20261008;MAX_N=8192;TARGET=1000

def inputs():
    paths=[c.HERE/p for p in ('scope.md','protocol.md','manifest.json','common.py','run.py','microbench/driver.js','microbench/A.source.js','microbench/B.source.js','microbench/A.schedule.js','microbench/B.schedule.js')]
    return {str(p.relative_to(c.HERE)):c.sha(p) for p in paths}

def freeze():
    p=c.HERE/'microbench/design.json'
    if p.exists():
        if c.read(p)['inputs']!=inputs(): raise RuntimeError('design changed; new attempt required')
    else:
        c.save(p,{'inputs':inputs(),'mode':c.MODE,'created_utc':c.stamp(),'seed':SEED,'target_ms':TARGET,'max_N':MAX_N,'reps':REPS,'timeout_s':180,'hypotheses':'protocol.md; frozen before pilots/formal','warmup_calls':0})
        with zipfile.ZipFile(c.HERE/'microbench/design_bytes.zip','w',zipfile.ZIP_STORED) as z:
            for name in inputs(): z.writestr(zipfile.ZipInfo(name,(2026,10,8,0,0,0)),(c.HERE/name).read_bytes())
    return c.sha(p)

def script(v,n):
    cfg={'variant':v,'N':n}; p=c.HERE/'microbench/generated'/f'{v}.N{n}.js'
    d=(c.HERE/'microbench/driver.js').read_text().replace('__CONFIG__',json.dumps(cfg,separators=(',',':')))
    c.save(p,(c.HERE/f'microbench/{v}.source.js').read_bytes()+d.encode());return p

def invoke(stage,v,e,n,rep=0,order=0,index=-1,permutation=(),block_variant_order=()):
    design=freeze();path=script(v,n);key=f'{stage}.{v}.{e}.N{n}.rep{rep}.pos{order}'
    target=c.HERE/'raw/records'/stage/(key+'.json');cmd=c.command(e,path)
    if target.exists():
        r=c.read(target)
        if not r['valid'] or r['design_sha256']!=design or r['script_sha256']!=c.sha(path) or r['command']!=cmd: raise RuntimeError('invalid/mismatched existing position; retained '+key)
        return r
    if os.environ.get('LD_PRELOAD'): raise RuntimeError('LD_PRELOAD forbidden')
    r=c.capture('sample.'+key,cmd,180);errors=[];p=None
    matches=re.findall(r'^ML_RESULT:(.*)$',r['stdout'],re.M)
    if r['exit_code']!=0: errors.append('exit code/timeout')
    if len(matches)!=1: errors.append('nonunique/missing payload')
    else:
        try: p=json.loads(matches[0])
        except ValueError: errors.append('bad payload JSON')
    if p:
        ms=p.get('elapsed_ms')
        if not isinstance(ms,(int,float)) or not math.isfinite(ms) or ms<=0 or ms>r['outer_wall_ns']/1e6+5: errors.append('clock chain')
        if p.get('N')!=n or p.get('variant')!=v or p.get('mode')!=c.MODE or p.get('warmup_calls')!=0: errors.append('contract')
        if p.get('checksum')!=f'{n}:2322:928' or p.get('correctness')!='PASS': errors.append('original assertion certificate')
        if not math.isclose(p['stop_ms']-p['start_ms'],ms,rel_tol=0,abs_tol=1e-8): errors.append('timer subtraction')
    m=c.manifest();rt=m['runtime']['engines'][e]
    r.update(stage=stage,variant=v,engine=e,N=n,rep=rep,order=order,schedule_index=index,permutation=permutation,block_variant_order=block_variant_order,cohort=m['cohort'],mode=c.MODE,flags=rt['runtime_flags'],binary_sha256=rt['binary']['sha256'],dependency_hashes={a['path']:a['sha256'] for a in rt['dependencies']+rt['dynamic_libraries']},adapter_hashes={a['path']:a['sha256'] for a in m['adapters'][e]},script_path=str(path),script_sha256=c.sha(path),design_sha256=design,payload=p,elapsed_ms=p.get('elapsed_ms') if p else None,elapsed_per_call_ms=p.get('elapsed_per_call_ms') if p else None,checksum=p.get('checksum') if p else None,valid=not errors,errors=errors)
    c.save(target,r)
    print(stage,v,e,n,rep,r['elapsed_ms'],'PASS' if r['valid'] else errors,flush=True)
    if errors: raise RuntimeError('failure preserved; stop '+key)
    return r

def prepare():
    for v in ('A','B'):
        for n in (1,2):
            for e in c.ENGINES: invoke('correctness',v,e,n)
    n=1
    while n<=MAX_N:
        rr=[invoke('calibration',v,e,n) for v in ('A','B') for e in c.ENGINES]
        if all(r['elapsed_ms']>=TARGET for r in rr): break
        n*=2
    if n>MAX_N: raise RuntimeError('N ceiling: pilot preserved, no formal')
    c.save(c.HERE/'microbench/selected_n.json',{'N':n,'rule':'first common power-of-two, all six internal regions >=1000ms'})
    for v in ('A','B'):
        for e in c.ENGINES: invoke('selected_correctness',v,e,n)
    schedule(n)

def schedule(n):
    rng=random.Random(SEED);perms=list(itertools.permutations(c.ENGINES));assign={v:perms*5 for v in ('A','B')}
    for x in assign.values(): rng.shuffle(x)
    first=['A']*15+['B']*15; rng.shuffle(first);jobs=[]
    for rep in range(1,31):
        vs=[first[rep-1],'B' if first[rep-1]=='A' else 'A']
        for v in vs:
            jobs.append({'variant':v,'rep':rep,'N':n,'permutation':list(assign[v][rep-1]),'block_variant_order':vs,'schedule_index':len(jobs)})
    c.save(c.HERE/'microbench/schedule.json',jobs); return jobs

def formal():
    n=c.read(c.HERE/'microbench/selected_n.json')['N']
    for v in ('A','B'):
        for e in c.ENGINES:
            p=c.HERE/'raw/records/selected_correctness'/f'selected_correctness.{v}.{e}.N{n}.rep0.pos0.json'
            if not p.exists() or not c.read(p)['valid']: raise RuntimeError('selected N gate incomplete')
    jobs=c.read(c.HERE/'microbench/schedule.json')
    # Exact selected scripts archived BEFORE formal, independent of Git EOL filters.
    archive=c.HERE/'microbench/formal_bytes.zip'
    if not archive.exists():
        with zipfile.ZipFile(archive,'w',zipfile.ZIP_STORED) as z:
            for v in ('A','B'):
                p=script(v,n); z.writestr(zipfile.ZipInfo(p.name,(2026,10,8,0,0,0)),p.read_bytes())
    for j in jobs:
        for pos,e in enumerate(j['permutation'],1): invoke('formal',j['variant'],e,n,j['rep'],pos,j['schedule_index'],j['permutation'],j['block_variant_order'])
    print('FORMAL_DONE 180/180',flush=True)

def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=('prepare','formal','all'));stage=p.parse_args().stage
    c.verify(True);freeze()
    if stage in ('prepare','all'): prepare()
    if stage in ('formal','all'): formal()
    c.verify(True)
if __name__=='__main__': main()
