"""Small serial search runner, frozen existing workloads/drivers/N, append-only raw.

screen: each case A-before/candidate/A-after once; optional single drift diagnostic.
No old elapsed values are used as a denominator. Analysis works without runtimes.
"""
import argparse,ast,csv,hashlib,io,json,math,os,random,statistics,sys
from pathlib import Path
import lab
HERE=lab.HERE; ROOT=lab.ROOT
OLD=ROOT/'experiments/ic_fast_slow_20261102/attempt01'
OCT=ROOT/'experiments/v8_inspired_ic/attempt03'
SEED=20261104

def mapping(path,name):
    for n in ast.parse(path.read_text(encoding='utf-8')).body:
        if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id==name for t in n.targets):
            return ast.literal_eval(n.value)
    raise KeyError(name)

def artifact(label):
    if label in ['A','M']:return lab.load(HERE/'workspace.json')['artifacts'][label]
    if label=='V8_ON':return lab.load(OLD/'runtime.json')['artifacts'][label]
    return lab.load(lab.candidate_metadata_path(label))

def inputs(kind):
    old=OLD/kind
    if kind=='sunspider':
        cases=mapping(ROOT/'scripts/run_sunspider.py','TESTS')
        contract=lab.load(old/'checksum_contract.json')
        files={str(p.relative_to(ROOT)):lab.sha(p) for p in (old/'inputs').iterdir() if p.is_file()}
    else:
        catalog=lab.load(OCT/'case_catalog.json');cases=[r['case'] for r in catalog if r['suite']!='Box2D']
        assert len(cases)==17
        files={str((OCT/r['frozen']).relative_to(ROOT)):r['LF_sha256'] for r in lab.load(OCT/'inputs.json')['files']}
        ids=lab.load(OCT/'inputs.json')
        for f,key in [('adapter.js','adapter_sha256'),('driver.js','driver_sha256'),('crypto_preload.js','crypto_preload_sha256'),('zlib_read.js','zlib_qjs_host_adapter_sha256')]:
            files[str((OCT/'inputs'/f).relative_to(ROOT))]=ids[key]
    for p,h in files.items():assert lab.sha(ROOT/p)==h,'input identity '+p
    ns={c:lab.load(old/'selected'/(c+'.json'))['N'] for c in cases}
    info=dict(kind=kind,cases=list(cases),N=ns,files=files,source='Existing frozen workload, adapter, driver and prior selected repetitions; old times NOT reused',
              metric='internal native CLOCK_MONOTONIC ms per complete Run, first Run included, no workload warmup',
              N_note='Existing N reused for exploratory screen; below-1000ms samples retained and flagged, not silently recalibrated')
    if kind=='sunspider':info['contract']=contract
    else:info['catalog']=catalog
    return info

def script(info,case,n,phase):
    kind=info['kind'];config=dict(case=case,N=n,phase=phase)
    if kind=='sunspider':
        folder=OLD/kind/'inputs';co=info['contract']
        parts=[(folder/'adapter.js').read_bytes(),b'function __tebSunSpiderWorkload(){\n'+(folder/(case+'.js')).read_bytes()+
               ('\nreturn String('+co['expressions'][case]+');\n}').encode()]
        driver=(folder/'driver.js').read_text().replace('__CONFIG__',json.dumps(config)).replace('__CHECKSUMS__',json.dumps(co['allowed'][case]));parts.append(driver.encode())
    else:
        row=next(r for r in info['catalog'] if r['case']==case);folder=OCT/'inputs'
        parts=[(folder/'adapter.js').read_bytes()]
        if row['suite']=='Crypto':parts.append((folder/'crypto_preload.js').read_bytes())
        parts.extend((folder/'octane'/f).read_bytes() for f in row['files'])
        driver=(folder/'driver.js').read_text().replace('__CONFIG__',json.dumps(config)).replace('__SUITE__',json.dumps(row['suite'])).replace('__INDEX__',str(row['index'])).replace('__BENCHMARK__',json.dumps(row['benchmark']));parts.append(driver.encode())
    path=HERE/'scripts'/f'{kind}.{case}.N{n}.{phase}.js';lab.save(path,b'\n;\n'.join(parts));return path

def invoke(info,cid,case,label,n,phase,position,rep,campaign):
    art=artifact(label);path=script(info,case,n,phase);bid=lab.boot()
    cmd=[art['path']];flags=[]
    if label=='V8_ON':flags=['--jitless','--no-lazy','--use-ic']
    elif case=='zlib.zlib':flags=['--std','-I',str(OCT/'inputs/zlib_read.js')]
    cmd+=flags+[str(path)]
    identity=dict(candidate=cid,condition=label,kind=info['kind'],case=case,N=n,rep=rep,order=position,campaign=campaign,
        binary_sha256=art['sha256'],script_sha256=lab.sha(path),input_sha256=info['files'],
        flags=flags,runner_sha256=lab.sha(Path(__file__)),repetitions=n,warmup_calls=0)
    # capture records a process_start before waiting; unmatched starts stay evidence.
    r=lab.capture(cmd,phase,f'{campaign}/{case}/{label}/rep{rep}/pos{position}',timeout=300,identity=identity)
    valid=False;reason=None;d={}
    try:
        assert bid==r['boot_id']==r['boot_id_after'],'BOOT_CHANGED'
        assert lab.sha(art['path'])==art['sha256'],'BINARY_CHANGED'
        assert r['exit_code']==0 and not r['timeout'],'process failure'
        assert not r['stderr'],'stderr'
        prefix='TEB_RESULT:' if info['kind']=='sunspider' else 'OCTANE_IC_RESULT:'
        lines=[s[len(prefix):] for s in r['stdout'].splitlines() if s.startswith(prefix)]
        assert len(lines)==1,'payload'
        d=json.loads(lines[0]);assert d['case']==case and d['N']==n and d['correctness']=='PASS' and d['warmup_calls']==0,'correctness'
        if info['kind']=='sunspider':assert d['checksum'] in info['contract']['allowed'][case],'checksum'
        elif case.startswith('Crypto.'):
            # Same fixed RNG, exact same input; ciphertext identity independently
            # recorded by the earlier validated deterministic-input experiment.
            golden=OLD/'octane/crypto'/f'{case}.N{n}.json'
            assert golden.exists(),'missing deterministic Crypto identity'
            assert d['checksum']==lab.load(golden)['final_ciphertext'],'Crypto ciphertext'
        elapsed=d['elapsed_ms']
        assert elapsed is not None and math.isfinite(elapsed) and elapsed>0,'invalid internal time'
        assert d['stop_ms']-d['start_ms']==elapsed and elapsed<=r['wall_time_ms']+5,'TIMER_CONTRADICTION'
        valid=True
    except (AssertionError,KeyError,ValueError,TypeError) as exc:reason=str(exc)
    sample=dict(event='measurement',process_token=r['token'],timestamp=r['timestamp'],completed_at=r['completed_at'],
        campaign=campaign,stage=phase,candidate=cid,kind=info['kind'],case=case,condition=label,rep=rep,order=position,
        N=n,elapsed_ms=d.get('elapsed_ms'),elapsed_per_Run_ms=d.get('elapsed_ms')/n if valid else None,
        external_wall_ms=r['wall_time_ms'],checksum=d.get('checksum'),payload=d,valid=valid,failed_reason=reason,
        below_1000ms=(d['elapsed_ms']<1000) if valid else None,identity=identity,
        boot_id=bid,boot_id_after=r['boot_id_after'],exit_code=r['exit_code'],mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1',
        performance_sample=True)
    lab.append(sample)
    print('SAMPLE',campaign,case,label,rep,valid,round(d.get('elapsed_ms') or 0,3),flush=True)
    assert valid,'saved failure, stop without omitting case: '+str(reason)
    return sample

def verify(info,labels):
    for c in labels:
        a=artifact(c);assert lab.sha(a['path'])==a['sha256'],'artifact '+c
    for p,h in info['files'].items():assert lab.sha(ROOT/p)==h,'input changed '+p

def screen(cid,kind):
    lab.execution_gate();os.sched_setaffinity(0,{2})
    candidates=list(csv.DictReader((HERE/'candidates.csv').open()))
    row=next(r for r in candidates if r['id']==cid)
    assert row['status'] in ['CHECKED_NOT_SCREENED','SCREENED'], 'minimal correctness required'
    profile=artifact(cid).get('build_profile','legacy');suffix='.matched' if profile=='matched' else ''
    if (HERE/'build_configuration_issue.json').exists():assert profile=='matched','legacy build configuration is confounded; no new legacy performance'
    prefix=cid+suffix
    info=inputs(kind);verify(info,['A',cid]);bid=lab.boot();campaign=f'postreboot.{prefix}.{kind}.screen01'
    outfile=HERE/f'{prefix}.{kind}.screen.json';assert not outfile.exists(),'preserve old screen'
    prior=[json.loads(s) for s in (HERE/'runs.jsonl').read_text().splitlines()]
    assert not any(r.get('campaign')==campaign for r in prior),'partial campaign exists; do not overwrite/retry'
    protocol=dict(campaign=campaign,boot_id=bid,seed=SEED,stage='exploratory_single_candidate_sample',
        info=info,conditions=['A_before',cid,'A_after'],drift_threshold_max_over_min=1.10,
        drift_rule='one bounded complete triple diagnostic only; original remains primary even if retest looks better; repeat unstable stops search',
        aggregate='all26 equal case GM' if kind=='sunspider' else 'core16/13suite and expanded17/14suite; within-suite GM then equal suites',
        primary_ratio='candidate / sqrt(A_before*A_after)',confidence_interval=None,
        incomplete='PARTIAL, no complete GM; failures not deleted',artifacts={c:artifact(c) for c in ['A',cid]},timestamp=lab.stamp())
    protocol['build_profile']=profile
    protocol_path=HERE/f'{prefix}.{kind}.protocol.json'
    if protocol_path.exists():
        recorded=lab.load(protocol_path)
        assert {k:v for k,v in recorded.items() if k!='timestamp'}=={k:v for k,v in protocol.items() if k!='timestamp'}, 'protocol changed'
    else:lab.save(protocol_path,protocol)
    ordered=info['cases'].copy();random.Random(SEED).shuffle(ordered);groups=[]
    for index,case in enumerate(ordered):
        assert lab.boot()==bid,'boot changed'
        rows=[invoke(info,cid,case,label,info['N'][case],'screen',p,0,campaign) for p,label in enumerate(['A',cid,'A'])]
        a,b,z=[r['elapsed_ms'] for r in rows];drift=max(a,z)/min(a,z);retry=[]
        if drift>1.10:
            retry=[invoke(info,cid,case,label,info['N'][case],'drift_check',p,1,campaign) for p,label in enumerate(['A',cid,'A'])]
        unstable_again=bool(retry) and max(retry[0]['elapsed_ms'],retry[2]['elapsed_ms'])/min(retry[0]['elapsed_ms'],retry[2]['elapsed_ms'])>1.10
        groups.append(dict(case=case,N=info['N'][case],A_before_ms=a,candidate_ms=b,A_after_ms=z,ratio=b/math.sqrt(a*z),
                           drift=drift,status='UNSTABLE' if drift>1.10 else 'OK',retry=retry,
                           primary_tokens=[r['process_token'] for r in rows]))
        print('CASE_SCREEN',cid,kind,index+1,len(ordered),case,round(groups[-1]['ratio'],5),groups[-1]['status'],flush=True)
        if unstable_again:
            lab.save(HERE/f'{prefix}.{kind}.partial.json',dict(status='BLOCKED_REPEAT_DRIFT',groups=groups,expected_cases=len(ordered),GM=None))
            lab.save(HERE/('STOP_MATCHED' if profile=='matched' else 'STOP_CURRENT'),'Repeated >10% A-before/after drift; preserve all samples and check environment.\n')
            raise RuntimeError('repeat drift; no favorable subset GM')
    verify(info,['A',cid]);assert lab.boot()==bid
    result=dict(candidate=cid,kind=kind,campaign=campaign,status='COMPLETE_EXPLORATORY_SCREEN',groups=groups,
        unstable_cases=[r['case'] for r in groups if r['status']!='OK'],boot_id=bid,timestamp=lab.stamp(),
        complete_case_count=len(groups),ratio_GM=math.exp(statistics.mean(math.log(r['ratio']) for r in groups)),
        greater_than_10pct_regressions=[r['case'] for r in groups if r['ratio']>1.10],confidence_interval=None,build_profile=profile)
    if kind=='octane':
        cat={r['case']:r['suite'] for r in info['catalog']};result['suite_GM']={}
        for key,subset in [('core16_13suite',[r for r in groups if r['case']!='zlib.zlib']),('expanded17_14suite',groups)]:
            suites={}
            for r in subset:suites.setdefault(cat[r['case']],[]).append(math.log(r['ratio']))
            result['suite_GM'][key]=math.exp(statistics.mean(statistics.mean(v) for v in suites.values()))
    lab.save(outfile,result)
    key='sunspider_screen_gm' if kind=='sunspider' else 'octane_screen_gm'
    lab.candidate_status(cid,status='SCREENED',**{key:format(result.get('suite_GM',{}).get('core16_13suite',result['ratio_GM']),'.8f')},decision='exploratory only; inspect per-case drift/regressions before retention')
    print('COMPLETE_SCREEN',cid,kind,json.dumps({k:v for k,v in result.items() if k not in ['groups']}),flush=True)

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('action',choices=['screen']);parser.add_argument('id');parser.add_argument('kind',choices=['sunspider','octane']);args=parser.parse_args()
    screen(args.id,args.kind)
