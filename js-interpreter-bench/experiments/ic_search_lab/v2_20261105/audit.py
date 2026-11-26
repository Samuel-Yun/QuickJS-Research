"""V2 offline checks. Old raw/manifest are never repaired in place."""
import argparse,csv,hashlib,json,math,os,re,statistics
from collections import Counter
from pathlib import Path
import run
import evidence
HERE=run.HERE;PREV=run.PREV;lab=run.lab
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def audit(artifacts=False,path_maps=()):
    data=evidence.raw_bytes();assert b'\r\n' not in data,'new raw must be LF'
    rows=[json.loads(s) for s in data.decode().splitlines()];starts={};ends={}
    for r in rows:
        if r['event']=='process_start':assert r['token'] not in starts;starts[r['token']]=r
        if r['event']=='process_result':assert r['token'] not in ends;ends[r['token']]=r
    assert set(ends)<=set(starts)
    for token,e in ends.items():
        assert e['command']==starts[token]['command'] and e['outer_start_ns']<=e['outer_stop_ns']
    measurements=[r for r in rows if r['event']=='measurement'];tokens=[r['process_token'] for r in measurements];assert len(tokens)==len(set(tokens))
    cache={}
    def sha(p):
        for old,new in path_maps:
            if str(p)==old or str(p).startswith(old.rstrip('/')+'/'):
                p=new.rstrip('/\\')+str(p)[len(old):];break
        if os.name=='nt' and str(p).startswith('/mnt/c/'):p='C:/'+str(p)[7:]
        p=Path(p)
        if p not in cache:cache[p]=lab.sha(p)
        return cache[p]
    for r in measurements:
        e=ends[r['process_token']];ident=r['identity']
        assert r['exit_code']==e['exit_code'] and ident==e['identity'] and r['boot_id']==r['boot_id_after']==e['boot_id_after']
        historical_root=e['command'][-1].rsplit('/experiments/ic_search_lab/',1)[0]
        flags=['--jitless','--no-lazy','--use-ic'] if r['condition']=='V8_ON' else ['--std','-I',historical_root+'/experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js'] if r['case']=='zlib.zlib' else []
        assert ident['flags']==e['command'][1:-1]==flags,'unexpected runtime flags'
        if r['valid']:
            assert e['exit_code']==0 and not e['stderr'] and not e['timeout'] and r['elapsed_ms']>0
            assert r['elapsed_per_Run_ms']==r['elapsed_ms']/r['N'] and ident['warmup_calls']==0
            prefix='TEB_RESULT:' if r['kind']=='sunspider' else 'OCTANE_IC_RESULT:'
            pp=[json.loads(l[len(prefix):]) for l in e['stdout'].splitlines() if l.startswith(prefix)]
            assert len(pp)==1 and pp[0]==r['payload'] and pp[0]['correctness']=='PASS'
            assert pp[0]['N']==r['N'] and pp[0]['elapsed_ms']==r['elapsed_ms']==pp[0]['stop_ms']-pp[0]['start_ms']
            if r['kind']=='sunspider':
                allowed=load(lab.ROOT/'experiments/ic_fast_slow_20261102/attempt01/sunspider/checksum_contract.json')['allowed'][r['case']]
                assert pp[0]['checksum'] in allowed
            elif r['case'].startswith('Crypto.'):
                golden=load(lab.ROOT/'experiments/ic_fast_slow_20261102/attempt01/octane/crypto'/(r['case']+'.N'+str(r['N'])+'.json'))
                assert pp[0]['checksum']==golden['final_ciphertext']
        script=HERE/'scripts'/e['command'][-1].replace('\\','/').split('/')[-1]
        assert sha(script)==ident['script_sha256']
        for rel,h in ident['input_sha256'].items():assert sha(lab.ROOT/rel)==h
        art=run.measure.artifact(r['condition']);assert art['sha256']==ident['binary_sha256']
        if artifacts:assert sha(art['path'])==art['sha256']
    intervals=[ends[t] for t in tokens]
    for e in ends.values():
        for m in intervals:
            if e['token']==m['token'] or e['boot_id']!=m['boot_id']:continue
            assert e['outer_stop_ns']<=m['outer_start_ns'] or m['outer_stop_ns']<=e['outer_start_ns'],'overlapping child tasks'
    ref=load(lab.ROOT/'experiments/ic_mechanism_audit/attempt01/raw/build/M_clean_release.json')['stdout']
    commands=lambda s:sorted(x.strip() for x in s.splitlines() if x.startswith('gcc '))
    built=[]
    for p in sorted(HERE.glob('s*.matched.json')):
        m=load(p);cid=m['id'];src=lab.reconstructed_sources(cid)
        assert {n:hashlib.sha256(v).hexdigest() for n,v in src.items()}==m['source_sha256_before_build']==m['source_sha256_after_build']
        assert sha(HERE/'patches'/(cid+'.patch'))==m['patch_sha256']
        assert m['compile_link_commands']==commands(ref)
        actual=[e for e in ends.values() if e['stage']=='build' and e['label']==cid]
        assert len(actual)==1 and actual[0]['exit_code']==0 and commands(actual[0]['stdout'])==commands(ref)
        tests=[e for e in ends.values() if e['stage']=='minimal_correctness' and e['label']==cid]
        assert len(tests)==1 and tests[0]['stdout']=='CHECKS_PASS:7020\n' and not tests[0]['stderr']
        if artifacts:assert sha(m['path'])==m['sha256']
        built.append(cid)
    screens=[]
    by={r['process_token']:r for r in measurements}
    for p in sorted(HERE.glob('s*.matched.*.screen.json')):
        d=load(p);assert len(d['groups'])==(26 if d['kind']=='sunspider' else 17)
        for g in d['groups']:
            triple=[by[t] for t in g['primary_tokens']]
            assert [r['condition'] for r in triple]==['A',d['candidate'],'A'] and len({r['N'] for r in triple})==1
            a,c,z=[r['elapsed_ms'] for r in triple];assert g['ratio']==c/math.sqrt(a*z)
        assert d['ratio_GM']==math.exp(sum(math.log(g['ratio']) for g in d['groups'])/len(d['groups'])) or math.isclose(d['ratio_GM'],math.exp(sum(math.log(g['ratio']) for g in d['groups'])/len(d['groups'])),rel_tol=1e-14)
        screens.append(dict(candidate=d['candidate'],kind=d['kind'],cases=len(d['groups'])))
    rechecks=[]
    for p in HERE.glob('s*.matched.*.recheck.json'):
        d=load(p);proto=load(p.with_name(p.name.replace('.recheck.json','.recheck_protocol.json')))
        samples=[r for r in measurements if r['campaign']==proto['campaign']]
        assert len(samples)==d['expected']==d['count']==len(proto['schedule'])
        key=lambda r:(r['case'],r['condition'],r['rep'],r['order'])
        assert len({key(r) for r in samples})==len(samples) and {key(r) for r in samples}=={key(r) for r in proto['schedule']}
        for case in proto['info']['cases']:
            for label in proto['labels']:assert sorted(r['order'] for r in samples if r['case']==case and r['condition']==label)==[0,1,2]
        rechecks.append(dict(candidate=d['candidate'],kind=d['kind'],count=len(samples)))
    formal=[]
    for p in HERE.glob('final.*.complete.json'):
        d=load(p);proto=load(p.with_name(p.name.replace('.complete.json','.protocol.json')))
        samples=[r for r in measurements if r['campaign']==proto['campaign']]
        assert len(samples)==d['expected']==d['count']==len(proto['schedule'])
        key=lambda r:(r['case'],r['condition'],r['rep'],r['order'])
        assert len({key(r) for r in samples})==len(samples)
        assert {key(r) for r in samples}=={key(r) for r in proto['schedule']}
        assert all(r['stage']=='formal' and r['valid'] and r['boot_id']==proto['boot_id'] for r in samples)
        for case in proto['info']['cases']:
            for label in proto['labels']:
                positions=Counter(r['order'] for r in samples if r['case']==case and r['condition']==label)
                assert sum(positions.values())==30
                assert sorted(positions.values())==([10,10,10] if len(proto['labels'])==3 else [7,7,8,8])
            if len(proto['labels'])==3:
                orders=[tuple(next(r['condition'] for r in samples if r['case']==case and r['rep']==rep and r['order']==pos) for pos in range(3)) for rep in range(30)]
                assert sorted(Counter(orders).values())==[5]*6
        formal.append(dict(kind=proto['kind'],count=len(samples),groups_30=True,balanced=True))
    independent=[]
    for p in HERE.glob('independent.*.complete.json'):
        d=load(p);proto=load(p.with_name(p.name.replace('.complete.json','.protocol.json')))
        samples=[r for r in measurements if r['campaign']==proto['campaign']]
        assert len(samples)==d['expected']==d['count']==len(proto['schedule'])
        key=lambda r:(r['case'],r['condition'],r['rep'],r['order'])
        assert len({key(r) for r in samples})==len(samples) and {key(r) for r in samples}=={key(r) for r in proto['schedule']}
        assert all(r['valid'] and r['stage']=='independent' and r['boot_id']==proto['boot_id'] for r in samples)
        for case in proto['info']['cases']:
            for label in proto['labels']:
                positions=Counter(r['order'] for r in samples if r['case']==case and r['condition']==label)
                assert sum(positions.values())==10 and max(positions.values())-min(positions.values())<=1
        independent.append(dict(kind=proto['kind'],count=len(samples),groups_10=True,balanced=True))
    # Recompute descriptive statistics and point ratios directly from raw,
    # without calling the report generator's calculation helpers.
    statistics_checked=0
    for kind in ['octane','sunspider']:
        p=HERE/f'final.{kind}.statistics.csv'
        if not p.exists():continue
        grouped={}
        for r in measurements:
            if r['stage']=='formal' and r['kind']==kind:grouped.setdefault((r['case'],r['condition']),[]).append(r['elapsed_per_Run_ms'])
        table=list(csv.DictReader(p.open(encoding='utf-8')));assert len(table)==len(grouped)
        for entry in table:
            v=sorted(grouped[(entry['case'],entry['condition'])]);assert len(v)==int(entry['n'])==30
            mean=math.fsum(v)/len(v);sd=math.sqrt(math.fsum((x-mean)**2 for x in v)/(len(v)-1))
            q1=statistics.median(v[:15]);q3=statistics.median(v[15:])
            expected=dict(median=statistics.median(v),mean=mean,sample_stddev=sd,Q1=q1,Q3=q3,IQR=q3-q1,min=v[0],max=v[-1])
            for name,value in expected.items():assert math.isclose(float(entry[name]),value,rel_tol=1e-12,abs_tol=1e-12),(kind,entry['case'],name)
            statistics_checked+=1
        for entry in csv.DictReader((HERE/f'final.{kind}.ratios.csv').open(encoding='utf-8')):
            num,den=entry['comparison'].split('/');c=entry['case']
            assert math.isclose(float(entry['ratio']),statistics.median(grouped[(c,num)])/statistics.median(grouped[(c,den)]),rel_tol=1e-14)
            assert 0<float(entry['low95'])<=float(entry['high95']) and int(entry['n'])==30
        suites={r['case']:r['suite'] for r in load(lab.ROOT/'experiments/v8_inspired_ic/attempt03/case_catalog.json')}
        for entry in csv.DictReader((HERE/f'final.{kind}.aggregates.csv').open(encoding='utf-8')):
            num,den=entry['comparison'].split('/');by_suite={}
            for c in {c for c,l in grouped}:
                if entry['scope']=='core16_13suite' and c=='zlib.zlib':continue
                value=math.log(statistics.median(grouped[(c,num)])/statistics.median(grouped[(c,den)]))
                by_suite.setdefault(suites[c] if kind=='octane' else c,[]).append(value)
            gm=math.exp(statistics.mean(statistics.mean(v) for v in by_suite.values()))
            assert math.isclose(float(entry['ratio']),gm,rel_tol=1e-14) and entry['draws']=='10000' and entry['seed']=='20261105'
    host=(HERE/'host_runs.jsonl').read_bytes();assert b'\r\n' not in host
    old=load(PREV/'manifest.json')['evidence_files']['host_runs.jsonl'];oldbytes=(PREV/'host_runs.jsonl').read_bytes()
    norm=oldbytes.replace(b'\r\n',b'\n');direct=hashlib.sha256(oldbytes).hexdigest();crlf=hashlib.sha256(norm.replace(b'\n',b'\r\n')).hexdigest()
    ending=dict(old_manifest=old,actual=direct,LF=hashlib.sha256(norm).hexdigest(),restored_CRLF=crlf,
        relation='EXACT' if direct==old else 'MATCHES_RESTORED_CRLF' if crlf==old else 'MISMATCH',old_files_modified=False)
    archived=[]
    for p in sorted((HERE/'runners').glob('*.py')):
        m=re.search(r'\.([0-9a-f]{64})\.py$',p.name)
        if m:assert sha(p)==m.group(1);archived.append(p.name)
    decision=load(HERE/'decision.json') if (HERE/'decision.json').exists() else None
    result=dict(status='SEARCH_IN_PROGRESS',built=built,screens=screens,rechecks=rechecks,formal=formal,independent=independent,measurements=len(measurements),
       valid=sum(r['valid'] for r in measurements),stage_counts=dict(Counter(r['stage'] for r in measurements)),
       campaign_counts=dict(Counter(r['campaign'] for r in measurements)),
       invalid_measurements=[dict(token=r['process_token'],reason=r['failed_reason']) for r in measurements if not r['valid']],
       below_1000ms=sum(bool(r['below_1000ms']) for r in measurements),
       measurement_boot_ids=sorted({r['boot_id'] for r in measurements}),
       exact_byte_runner_archives=archived,independent_descriptive_stat_groups_checked=statistics_checked,
       uncompleted=[r for t,r in starts.items() if t not in ends],new_raw_LF=True,old_host_newline_identity=ending,
       optional_artifact_check=artifacts,explicit_path_maps=list(path_maps),formal_samples=sum(r['stage']=='formal' for r in measurements),
       random_input='two frozen SunSpider cases unseeded; not removed, not bytewise paired; exploratory',
       independent_checks='patch/source/compile/link/clock/payload/input/script/order/seriality; no runtime launch')
    if decision:
        assert not result['uncompleted'] and not result['invalid_measurements']
        assert len(rechecks)==4,'two candidates, both complete suites required to close search'
        if decision['status']=='COMPLETE_NO_VERIFIED_OVERALL_GAIN':assert result['formal_samples']==0
        result['status']='PASS_FORMAL_DATA_PENDING_COMPLETION' if len(formal)==2 else 'PASS_'+decision['status'];result['decision']='decision.json'
    if (HERE/'completion.json').exists():
        closed=load(HERE/'completion.json');assert result['formal_samples']==4380 and len(formal)==2
        if load(HERE/'independent.complete.json')['status']=='COMPLETE_SEPARATE_KEY_REPEAT':
            assert sum(x['count'] for x in independent)==230 and len(independent)==2
        assert not result['uncompleted'] and not result['invalid_measurements']
        result['status']='PASS_COMPLETE_BOUNDED_SEARCH';result['completion']='completion.json'
    (HERE/'audit.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(json.dumps(result),flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--artifacts',action='store_true')
    p.add_argument('--path-map',action='append',default=[],metavar='OLD_PREFIX=NEW_PREFIX')
    a=p.parse_args();maps=[v.split('=',1) for v in a.path_map];assert all(len(v)==2 and all(v) for v in maps)
    audit(a.artifacts,maps)
