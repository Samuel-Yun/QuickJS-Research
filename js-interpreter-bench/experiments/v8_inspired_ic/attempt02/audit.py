"""Independent raw/schedule/hash/median verification; portable, no runtime execution."""
import csv,hashlib,itertools,json,statistics
from collections import Counter
from pathlib import Path
HERE=Path(__file__).resolve().parent
def read(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
    scheduled=read(HERE/'schedule.json');by_index={r['index']:r for r in scheduled};rt=read(HERE/'campaign_runtime.json');frozen=read(HERE/'frozen.json');errors=[];actual={};starts=[]
    rows=[(p,read(p)) for p in (HERE/'raw/formal').rglob('*.json')]
    for p,r in rows:
        i=r['schedule_index']
        if i in actual:errors.append('duplicate '+str(i))
        actual[i]=r;s=by_index[i]
        for k in ['case','condition','N','rep','order']:
            if r[k]!=s[k]:errors.append(f'{i} {k}')
        if r['boot_id']!=rt['boot_id'] or r['boot_id_after']!=rt['boot_id']:errors.append(f'{i} boot')
        if r['binary_sha256']!=rt['artifacts'][r['condition']]['sha256']:errors.append(f'{i} binary')
        if r['command'][0]!=rt['artifacts'][r['condition']]['path']:errors.append(f'{i} executable')
        if r['affinity']!=rt['affinity']:errors.append(f'{i} affinity')
        if sha(HERE/r['script_relative'])!=r['script_sha256']:errors.append(f'{i} script')
        if r['condition']=='V8_ON':
            required=['--jitless','--no-lazy','--use-ic'];forbidden=['--max-opt=0','--no-use-ic','--trace-opt','--trace-baseline','--print-bytecode']
            if not all(x in r['command'] for x in required) or any(x in r['command'] for x in forbidden):errors.append(f'{i} V8 flags')
        if r['valid']:
            d=r['payload']
            if not(r['exit_code']==0 and r['stderr']=='' and d['correctness']=='PASS' and d['warmup_calls']==0 and d['stop_ms']-d['start_ms']==r['elapsed_ms']>0 and r['elapsed_per_Run_ms']==r['elapsed_ms']/r['N']):errors.append(f'{i} correctness/time')
        starts.append((i,r['outer_start_ns'],r['outer_stop_ns']))
    starts.sort()
    serial=all(a[2]<=b[1] for a,b in zip(starts,starts[1:]))
    for p,h in frozen['files'].items():
        if sha(HERE/p)!=h:errors.append('frozen file '+p)
    cases=read(HERE/'protocol.json')['core16']+['zlib.zlib'];conditions=['A','E','V8_ON'];groups=[]
    for case in cases:
        r=[r for _,r in rows if r['case']==case];n=Counter(x['condition'] for x in r if x['valid']);perms=Counter();positions=Counter()
        for rep in range(30):
            a=sorted([x for x in r if x['rep']==rep],key=lambda x:x['order'])
            if len(a)==3 and all(x['valid'] for x in a):
                perms[','.join(x['condition'] for x in a)]+=1
                positions.update((x['condition'],x['order']) for x in a)
        groups.append(dict(case=case,n=dict(n),complete_triples=sum(perms.values()),six_permutations_each5=len(perms)==6 and set(perms.values())=={5},every_condition_every_position10=len(positions)==9 and set(positions.values())=={10}))
    summary=list(csv.DictReader((HERE/'summary/comparison.csv').open(encoding='utf-8')))
    median_replay=True
    for s in summary:
        for c in conditions:
            v=[r['elapsed_per_Run_ms'] for _,r in rows if r['case']==s['case'] and r['condition']==c and r['valid']]
            if int(s[c+'_n'])!=len(v) or (v and float(s[c+'_median_ms'])!=statistics.median(v)):median_replay=False
    result=dict(status='PASS_COMPLETE' if len(rows)==1530 and all(r['valid'] for p,r in rows) and not errors and serial and median_replay and all(g['six_permutations_each5'] and g['every_condition_every_position10'] for g in groups) else 'PARTIAL_OR_FAILED',planned=1530,actual=len(rows),valid=sum(r['valid'] for p,r in rows),serial=serial,errors=errors,median_replay=median_replay,groups=groups,raw_only_no_runtime_required=True)
    p=HERE/'independent_audit.json';assert not p.exists();p.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
