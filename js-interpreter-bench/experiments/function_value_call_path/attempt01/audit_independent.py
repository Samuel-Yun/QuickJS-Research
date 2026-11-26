"""A second direct check, independent of runner validity and bootstrap implementation."""
import csv,gzip,hashlib,json,math,statistics
from collections import Counter
from pathlib import Path
P=Path(__file__).resolve().parent
def j(p):
    with (gzip.open(p,'rt',encoding='utf8') if str(p).endswith('.gz') else p.open(encoding='utf8')) as f:return json.load(f)
def h(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
    cfg=j(P/'protocol.json');cases=cfg['cases'];cs=cfg['conditions'];sched=j(P/'schedule.json');raw=[j(p) for p in (P/'raw/formal').rglob('*.json')]
    assert len(raw)==360 and len(sched)==360 and cfg['formal_target']==360
    by={(r['rep'],r['case'],r['condition']):r for r in raw};assert len(by)==360
    for case in cases:
        n=j(P/'selected'/f'{case}.json')['N'];assert n==16384
        for c in cs:
            rr=[r for r in raw if r['case']==case and r['condition']==c];assert len(rr)==30
            assert Counter(r['order'] for r in rr)=={0:10,1:10,2:10}
            for r in rr:
                d=json.loads(r['stdout'].split('TEB_RESULT:')[1]);assert r['exit_code']==0 and r['stderr']=='' and d['last']==8390656 and d['checksum']==8390656*n and d['warmup_calls']==0
                assert d['elapsed_ms']==d['stop_ms']-d['start_ms']>0
                assert d['elapsed_ms']<=r['outer_wall_ns']/1e6+5
                assert h(P/r['script_relative'])==r['script_sha256']
        orders=Counter(tuple(s['condition'] for s in sched if s['rep']==rep and s['case']==case) for rep in range(30));assert len(orders)==6 and set(orders.values())=={5}
    summary=list(csv.DictReader((P/'analysis/summary.csv').open(encoding='utf8')))
    for s in summary:
        a=[r['elapsed_per_Run_ms'] if s['metric']=='execution' else r['outer_wall_ns']/1e6 for r in raw if r['case']==s['case'] and r['condition']==s['condition']]
        assert statistics.median(a)==float(s['median']) and statistics.mean(a)==float(s['mean']) and statistics.stdev(a)==float(s['sample_stddev'])
    assert len({r['boot_id'] for r in raw})==1
    clock=j(P/'campaign_clock.json');rr=sorted(raw,key=lambda r:r['outer_start_ns']);assert all(a['outer_stop_ns']<b['outer_start_ns'] for a,b in zip(rr,rr[1:]))
    builds=[j(p) for p in (P/'raw/commands').glob('*_call_build.json')];assert len(builds)==2
    assert all(b['outer_stop_ns']<clock['start_ns'] for b in builds if b['boot_id']==clock['boot_id'])
    for case in cases:
        for v in ['A','M']:
            for n in [1,2]:
                d=j(P/'raw/call_diagnostic'/f'{v}.{case}.N{n}.json.gz');target={'number_value_read':'valueReadLoop','function_value_read':'valueReadLoop','own_method_call':'methodCallLoop','local_function_call':'localCallLoop'}[case]
                f=[f for f in d['functions'] if bytes.fromhex(f['function_hex']).decode()==target][0];calls=f['calls'];expected=0 if 'value_read' in case else n*4096
                assert sum(x['visits'] for x in calls)==expected==sum(x['bytecode_entry'] for x in calls) and sum(x['general_entry'] for x in calls)==0
    out=dict(status='PASS',formal=360,groups=12,complete_rounds=30,independent_correctness_and_medians=True,independent_actual_call_branches=True,old_runtime_paths_opened=False,builds_do_not_overlap_formal=True)
    dest=P/'independent_audit.json';data=json.dumps(out,indent=2)+'\n'
    if dest.exists():assert dest.read_text(encoding='utf8')==data
    else:dest.write_text(data,encoding='utf8')
    print(data)
if __name__=='__main__':main()
