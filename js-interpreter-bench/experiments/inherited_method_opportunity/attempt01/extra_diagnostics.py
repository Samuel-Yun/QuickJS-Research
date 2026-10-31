"""Reason counts and original Richards evidence, never timed performance."""
from common import *
from run import script
from diagnostics import v8,v8_blocks,instructions,archive
def reasons():
    art=read(PREV/'raw/diagnostic/M_reasons.N1.identity.json')['binary'];assert sha(art['binary'])==art['sha256']
    counts=list(csv.DictReader((HERE/'micro_path_counts.csv').open(encoding='utf8')));rows=[]
    for case in CASES:
        for n in [1,2]:
            js=script(case,n,True);p=STORE/'reports'/f'M_reasons.{case}.N{n}.json';assert not p.exists()
            env=os.environ.copy();env['READ_IC_REPORT']=str(p)
            r=capture(f'M_reasons.{case}.N{n}',[art['binary'],js],env=env);assert r['exit_code']==0 and not r['stderr']
            meta=archive(p,HERE/'raw/diagnostic'/f'M_reasons.{case}.N{n}.json.gz');meta.update(binary=art,script_sha256=sha(js));save(HERE/'raw/diagnostic'/f'M_reasons.{case}.N{n}.identity.json',meta)
            d=json.loads(p.read_bytes());f=[f for f in d['functions'] if bytes.fromhex(f['function_hex'])==b'methodLoop'];assert len(f)==1
            sites=[s for s in f[0]['sites'] if bytes.fromhex(s['atom_hex'])==b'step'];assert len(sites)==1;s=sites[0]
            old=[x for x in counts if x['case']==case and x['N']==str(n) and x['variant']=='M'];assert len(old)==1
            assert s['pc']==int(old[0]['pc']) and s['queries']==int(old[0]['ic_queries']) and s['hits']==int(old[0]['hits']) and s['fallback']==int(old[0]['misses'])
            assert s['inherited']==(4096*n if case==CASES[1] else 0) and s['own_miss']==(1 if case==CASES[0] else 0)
            assert d['shape_refs_after_free']==d['live_direct_after_free']==0
            rows.append(dict(case=case,N=n,**s))
    csvout(HERE/'micro_reason_counts.csv',rows);save(HERE/'micro_reason_gate.json',dict(status='PASS',processes=4,counts_crosschecked=True,formal_timing=False))
def richards():
    evidence=[]
    for n,filter in [(1,'*'),(2,'*.*')]:
        text,log=v8('Richards',n,filter,True);blocks=v8_blocks(text)
        for name,prop in [('Scheduler.schedule','isHeldOrSuspended'),('Scheduler.schedule','run'),('TaskControlBlock.run','run')]:
            assert len(blocks.get(name,[]))==1,(name,list(blocks))
            block=blocks[name][0];ins=instructions(block)
            target=[i for i in ins if 'GetNamedProperty ' in i['instruction'] and '"'+prop+'"' in i['instruction']];assert len(target)==1,(name,prop,target)
            target=target[0];transitions=[l.split(',') for l in log.splitlines() if l.startswith('LoadIC,') and l.split(',')[1].lower()==target['address'].lower()];assert transitions,(name,prop)
            maps=sorted({r[7] for r in transitions});details=[l for l in log.splitlines() if l.startswith('map-details,') and l.split(',')[2] in maps]
            creates=[l for l in log.splitlines() if l.startswith('map-create,') and l.split(',')[2] in maps]
            save(HERE/'bytecode/Richards'/f'N{n}.{name}.txt',block)
            evidence.append(dict(N=n,function=name,property=prop,target=target,transitions=transitions,receiver_maps=maps,map_details=details or None,map_create=creates,installed_handler=None,per_access_hit_rate=None))
        # Holder inspection occurs only after the original N Runs; no wrappers.
        holder_lines=[l for l in text.splitlines() if l.startswith('HOLDER:') or '<Object map =' in l or '<JSFunction ' in l]
        save(HERE/'bytecode/Richards'/f'N{n}.holders.txt','\n'.join(holder_lines)+'\n')
    save(HERE/'richards_v8_evidence.json',evidence)
    rows=[]
    for fn,pc,prop,count,receiver,holder in [('Scheduler.prototype.schedule',30,'isHeldOrSuspended',10671,'current TaskControlBlock','TaskControlBlock.prototype'),('Scheduler.prototype.schedule',83,'run',6573,'current TaskControlBlock','TaskControlBlock.prototype'),('TaskControlBlock.prototype.run',73,'run',6573,'this.task: Idle/Worker/Handler/DeviceTask','corresponding Task prototype')]:
        counts=list(csv.DictReader((PREV/'coverage.csv').open(encoding='utf8')));matches=[r for r in counts if r['function']==fn and int(r['pc'])==pc];assert len(matches)==1;s=matches[0]
        assert s['property']==prop and int(s['operations'])==count and int(s['hits'])==0 and int(s['misses'])==count
        # Confirm real raw in BOTH N1/N2, not just a summary.
        identities=[]
        for n in [1,2]:
            d=read(PREV/'raw/diagnostic'/f'M.Richards.Richards.N{n}.json.gz');fs=[f for f in d['functions'] if hashlib.sha256(bytes.fromhex(f['source_hex'])).hexdigest()==s['source_sha256']];assert len(fs)==1
            op=[o for o in fs[0]['opcodes'] if o['pc']==pc];assert len(op)==1
            assert op[0]['before_op']=='get_field2_rdi' and op[0]['operations']==n*count and op[0]['hits']==0 and op[0]['misses']==n*count
            why=read(PREV/'raw/diagnostic'/f'M_reasons.N{n}.json.gz');sources={x['source_id']:x['source_hex'] for x in why['sources']}
            rf=[f for f in why['functions'] if f['source_id'] in sources and hashlib.sha256(bytes.fromhex(sources[f['source_id']])).hexdigest()==s['source_sha256']];assert len(rf)==1
            rs=[x for x in rf[0]['sites'] if x['pc']==pc];assert len(rs)==1 and rs[0]['inherited']==count*n
            identities.append(dict(N=n,source_sha256=s['source_sha256'],instance_id=fs[0]['instance_id'],code_before_sha256=hashlib.sha256(bytes.fromhex(fs[0]['code_before_hex'])).hexdigest(),raw= (PREV/'raw/diagnostic'/f'M.Richards.Richards.N{n}.json.gz').relative_to(ROOT).as_posix(),sha256=sha(PREV/'raw/diagnostic'/f'M.Richards.Richards.N{n}.json.gz')))
        vfn=fn.replace('.prototype','');ev=[e for e in evidence if e['function']==vfn and e['property']==prop]
        rows.append(dict(QJS_function=fn,QJS_pc=pc,property=prop,receiver=receiver,holder=holder,M_reads_per_Run=count,M_hits_per_Run=0,M_fallback_per_Run=count,M_reason='inherited (actual reason counter)',V8_function=vfn,V8_evidence=json.dumps(ev),QJS_raw_identity=json.dumps(identities),V8_installed_handler=None,V8_hit_rate=None,time_share=None))
    csvout(HERE/'richards_sites.csv',rows);save(HERE/'richards_gate.json',dict(status='PASS_WITH_HANDLER_OBSERVABILITY_LIMITATION',new_V8_processes=2,QJS_N1_N2_reused_and_verified=True,source_identity_verified=True,original_functions_wrapped=False,body_edited=False,installed_handler=None))
    print('RICHARDS_THREE_SITES_SAVED',flush=True)
if __name__=='__main__':
    import argparse
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['reasons','richards']);a=p.parse_args();globals()[a.stage]()
