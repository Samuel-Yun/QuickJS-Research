"""Independent raw/frozen/schedule audit; portable, never starts a VM."""
import json,hashlib,collections,statistics,sys,argparse
from pathlib import Path
HERE=Path(__file__).resolve().parent
def read(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def audit(kind):
    root=HERE/kind;frozen=read(root/'frozen.json');protocol=read(root/'protocol.json');schedule=read(root/'schedule.json')
    conds=protocol['conditions'];cases=protocol['cases'];errors=[]
    def check(value,message):
        if not value:errors.append(message)
    check(sha(root/'protocol.json')==frozen['protocol_sha256'],'protocol SHA')
    check(sha(root/'schedule.json')==frozen['schedule_sha256'],'schedule SHA')
    rows=[];hashes={};by_key={};positions=collections.defaultdict(collections.Counter);script_cache={};missing_scripts=0
    if 'runner_sha256' in frozen:check(sha(HERE/'benchmark.py')==frozen['runner_sha256'],'frozen runner SHA')
    for p in sorted((root/'raw/formal').rglob('*.json')):
        r=read(p);rows.append(r);hashes[p.relative_to(HERE).as_posix()]=sha(p)
        key=(r['case'],r['condition'],r['rep']);check(key not in by_key,'duplicate '+str(key));by_key[key]=r
        positions[(r['case'],r['condition'])][r['order']]+=1
        artifact=frozen['artifacts'][r['condition']]
        check(r['valid'] and r['exit_code']==0 and not r['timeout'] and not r['stderr'],'invalid '+str(key))
        check(r['binary_sha256']==artifact['sha256'] and r['command'][0]==artifact['path'],'binary '+str(key))
        check(r['boot_id']==r['boot_id_after']==frozen['boot_id'],'boot '+str(key))
        check(r['script_sha256']==frozen['script_hashes'][r['case']],'script identity '+str(key))
        pscript=HERE/r['script_relative']
        if pscript.exists():
            if pscript not in script_cache:script_cache[pscript]=sha(pscript)
            check(script_cache[pscript]==r['script_sha256'],'actual script '+str(key))
        else:missing_scripts+=1
        check(r['command'][-1].replace('\\','/').endswith(r['script_relative']),'command script '+str(key))
        if kind!='mechanism':
            check(r['input_sha256']==frozen['input_sha256'],'input manifest '+str(key))
            check(r['dependency_hashes']==(frozen['dependencies'] if r['condition']=='V8_ON' else []),'dependency manifest '+str(key))
        elif r['condition'].startswith('C'):
            check(int(r['policy_quota'])=={'C100':4,'C75':3,'C50':2,'C25':1,'C0':0}[r['condition']],'quota '+str(key))
        flags=['--jitless','--no-lazy','--use-ic'] if r['condition']=='V8_ON' else []
        if flags:check(r['flags']==flags and r['command'][1:4]==flags,'V8 flags '+str(key))
        else:
            options=[x for x in r['command'][1:] if x.startswith('-')]
            check(not any('trace' in x or 'log-ic' in x or 'log_ic' in x for x in options),'diagnostic flags '+str(key))
            if r['case']=='zlib.zlib':
                check(r['command'][1:3]==['--std','-I'] and r['command'][3].endswith('/octane/inputs/zlib_read.js') and len(r['command'])==5,'zlib adapter command '+str(key))
            else:check(r['flags']==[] and len(r['command'])==2,'QuickJS command '+str(key))
        check(r['elapsed_ms']>0 and r['elapsed_per_Run_ms']==r['elapsed_ms']/r['N'],'time '+str(key))
        check(r['external_wall_ms']+5>=r['elapsed_ms'],'interval containment '+str(key))
        check(r['child_user_ms']>=0 and r['child_system_ms']>=0,'CPU unit '+str(key))
        payload=r['payload'];check(payload.get('correctness')=='PASS','checksum gate '+str(key))
        check(payload.get('preparation_calls',0)==(1 if kind=='mechanism' else 0),'warmup '+str(key))
        if kind!='mechanism':check(payload['warmup_calls']==0,'warmup '+str(key))
    for s in schedule:
        key=(s['case'],s['condition'],s['rep']);r=by_key.get(key)
        check(r is not None,'missing '+str(key))
        if r:check(r['N']==s['N'] and r['order']==s['order'],'schedule row '+str(key))
    expected=len(cases)*len(conds)*30;check(len(rows)==len(schedule)==expected,'actual/schedule/expected count')
    for case in cases:
        selected=read(root/'selected'/(case+'.json'));n=selected['N']
        pilots=[read(p) for p in (root/'raw/pilot'/case).glob('*.json') if read(p)['N']==n]
        check(len(pilots)==len(conds)*2 and all(r['valid'] and r['elapsed_ms']>=1000 for r in pilots),'pilots '+case)
        for c in conds:
            rr=[r for r in rows if r['case']==case and r['condition']==c]
            check(len(rr)==30 and {r['rep'] for r in rr}==set(range(30)),'group30 '+case+c)
            counts=[positions[(case,c)][p] for p in range(len(conds))];check(max(counts)-min(counts)<=1,'position balance '+case+c)
            checks=[read(p) for p in (root/'raw/correctness'/case).glob('*.json') if read(p)['condition']==c]
            check({r['N'] for r in checks if r['valid']}=={1,2},'N1N2 '+case+c)
            selected_checks=[read(p) for p in (root/'raw/selected_correctness'/case).glob('*.json') if read(p)['condition']==c]
            check(len(selected_checks)==1 and selected_checks[0]['valid'] and selected_checks[0]['N']==n,'selected check '+case+c)
    ordered=sorted(rows,key=lambda r:r['outer_start_ns'])
    check(all(x['outer_stop_ns']<=y['outer_start_ns'] for x,y in zip(ordered,ordered[1:])),'overlap')
    actual_order=[(r['case'],r['condition'],r['rep'],r['order']) for r in ordered]
    check(actual_order==[(s['case'],s['condition'],s['rep'],s['order']) for s in schedule],'global serial order')
    for relative,h in read(root/'analysis/raw_hashes.json').items():check(sha(HERE/relative)==h,'raw changed since statistics '+relative)
    check(read(root/'analysis/audit.json')['status']=='PASS_COMPLETE','statistics audit')
    return dict(status='PASS' if not errors else 'FAIL',errors=errors,actual=len(rows),expected=expected,
      valid=sum(r['valid'] for r in rows),short_samples_retained=sum(r['elapsed_ms']<1000 for r in rows),
      one_boot=frozen['boot_id'],position_balance=True if not any('balance' in e for e in errors) else False,
      raw_hashes=hashes,requires_runtime=False,requires_private_source=False,whole_child_CPU_not_internal_CPU=True,
      actual_unique_derived_scripts_checked=len(script_cache),missing_derived_script_positions=missing_scripts,
      external_ELF_bytes_checked=False,ELF_live_validation='separate final_check.py/post_identity.json; this audit checks frozen metadata')
def main():
    p=argparse.ArgumentParser();p.add_argument('--output',default='independent_audit_v2.json');args=p.parse_args()
    result={k:audit(k) for k in ['mechanism','sunspider','micro','octane']}
    dest=HERE/args.output;assert not dest.exists()
    dest.write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    assert all(r['status']=='PASS' for r in result.values()),'see '+args.output
    print('INDEPENDENT_AUDIT_PASS',sum(r['valid'] for r in result.values()),flush=True)
if __name__=='__main__':main()
