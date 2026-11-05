"""Finite bridge configuration repair, after all main VM phases; preserve initial 48."""
import math,re,statistics as st
from common import *
def main():
    import run
    assert read(HERE/'analysis/completion.json')['status']=='COMPLETE','do not overlap main formal/diagnostic/RSS'
    initial=[read(p) for p in (HERE/'bridge_check/raw').glob('*.json')]
    if all(r['environment'].get('QJS_READ_IC_MODE')=='1' for r in initial):
        print('BRIDGE_REPAIR_NOT_NEEDED',flush=True);return
    base=HERE/'bridge_check/matched_environment';m=read(HERE/'bridge_check/manifest.json');schedule=read(HERE/'bridge_check/schedule.json');e=clean_env();e['QJS_READ_IC_MODE']='1'
    save(base/'protocol.json',dict(reason='initial M lacked prior ignored mode placeholder; only bridge affected',environment=e,seed=SEED,schedule_sha256=sha(HERE/'bridge_check/schedule.json'),
      expected=48,conditions=['M','ON'],same_source_binary_N_script_as_initial=True,no_code_flags_padding_or_R_tuning=True,initial_48_preserved_and_excluded=True,repair_declared_before_main_summary=True))
    for v in ['M','SW']:assert sha(m['artifacts'][v]['path'])==m['artifacts'][v]['sha256']
    diag=read(HERE/'bridge_check/diagnostic_manifest.json')
    for c in ['M4.numeric_control','Richards.Richards']:
        path=run.script(c,2,True);ds={}
        for v in ['M','SW']:
            gz=base/'diagnostic'/f'{c}.{v}.json.gz'
            if not gz.exists():
                exe=diag[v]['path'];assert sha(exe)==diag[v]['sha256'];out=STORE/f'bridge_matched_{c}.{v}.json';env=e.copy();env['BRIDGE_REPORT']=str(out)
                r=capture('bridge_matched_dispatch_'+c+'_'+v,[exe,path],env=env);assert not r['exit_code'] and not r['stderr']
                save(str(gz)+'.metadata.json',dict(**compress(out,gz),binary_sha256=sha(exe),script_sha256=sha(path),N=2,environment=env,performance_sample=False))
            ds[v]=read(gz)
        canonical=lambda d:sorted((f['name_hex'],f['normalized_code_hex'],json.dumps(f['atoms'],sort_keys=True),json.dumps(f['dispatch'],sort_keys=True)) for f in d['functions'])
        assert canonical(ds['M'])==canonical(ds['SW'])
        if c.startswith('M4'):
            target=[f for f in ds['M']['functions'] if bytes.fromhex(f['name_hex']).decode()=='m4Loop'];assert len(target)==1 and not any('get_field' in k for k in target[0]['dispatch'])
    rows=[]
    for s in schedule:
        c,v,n=s['case'],s['variant'],s['N'];a=m['artifacts']['SW' if v=='ON' else 'M'];file=base/'raw'/f'{c}.rep{s["rep"]}.{v}.json'
        if file.exists():r=read(file);assert r['valid'];rows.append(r);continue
        path=run.script(c,n);cmd=[a['path'],str(path)];start=time.perf_counter_ns()
        r=dict(**s,stage='bridge_matched_environment_only',command=cmd,environment=e,mode_value='1',binary_sha256=a['sha256'],script_sha256=sha(path),outer_start_ns=start,timestamp=stamp(),valid=False)
        try:
            p=subprocess.run(cmd,env=e,capture_output=True,text=True,timeout=300);stop=time.perf_counter_ns();r.update(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,outer_stop_ns=stop)
            assert p.returncode==0 and not p.stderr;payload=json.loads(re.findall(r'^TEB_RESULT:(.*)$',p.stdout,re.M)[0]);elapsed=payload['stop_ms']-payload['start_ms']
            assert payload['correctness']=='PASS' and payload['warmup_calls']==0 and payload['N']==n and payload['case']==c
            assert elapsed==payload['elapsed_ms'] and elapsed>0 and math.isfinite(elapsed) and start/1e6-1<=payload['start_ms']<payload['stop_ms']<=stop/1e6+1
            r.update(valid=True,payload=payload,elapsed_ms=elapsed,ms_per_Run=elapsed/n)
        except (AssertionError,ValueError,KeyError,IndexError,subprocess.TimeoutExpired) as error:r.update(error=type(error).__name__)
        save(file,r);assert r['valid'],'bridge repair failed, raw preserved, no automatic retry';rows.append(r);print('BRIDGE_MATCHED',c,v,s['rep'],'PASS',flush=True)
    out=[]
    for c in ['M4.numeric_control','Richards.Richards']:
        vals={v:st.median(r['ms_per_Run'] for r in rows if r['case']==c and r['variant']==v) for v in ['M','ON']}
        out.append(dict(case=c,pairs=12,M_ms=vals['M'],ON_ms=vals['ON'],M_ON=vals['M']/vals['ON'],ON_time_change_pct=(vals['ON']/vals['M']-1)*100,under_1000ms=sum(r['elapsed_ms']<1000 for r in rows if r['case']==c)))
    csvout(base/'summary.csv',out);save(base/'audit.json',dict(status='PASS',expected=48,actual=len(rows),valid=sum(r['valid'] for r in rows),same_mode_env_placeholder=True,matched_dispatch_diagnostics=4,initial_48_excluded_preserved=True,main_formal_unchanged=True,main_summary_not_used_to_tune=True))
    print('BRIDGE_MATCHED_48_PASS',flush=True)
if __name__=='__main__':main()
