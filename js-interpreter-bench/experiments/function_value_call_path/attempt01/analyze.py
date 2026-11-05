"""Portable public-raw-only replay; never opens old /home or /mnt/c binaries."""
import argparse,csv,hashlib,io,json,math,random,statistics
from collections import Counter,defaultdict
from datetime import datetime
from pathlib import Path
BASE=Path(__file__).resolve().parent
CASES=['number_value_read','function_value_read','own_method_call','local_function_call'];CONDS=['QJS_A','QJS_M','V8_ON']
PAIRS=[((case,a),(case,b)) for case in CASES for a,b in [('QJS_A','QJS_M'),('QJS_A','V8_ON'),('QJS_M','V8_ON')]]+[((CASES[1],c),(CASES[0],c)) for c in CONDS]+[((CASES[2],c),(CASES[3],c)) for c in CONDS]
def read(p):return json.loads(p.read_text(encoding='utf8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(p,v):
    p.parent.mkdir(parents=True,exist_ok=True);data=(v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode('utf8')
    if p.exists():assert p.read_bytes()==data,'refuse overwrite '+str(p)
    else:p.write_bytes(data)
def csvwrite(p,rows):
    if not rows:return
    s=io.StringIO();w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);write(p,s.getvalue())
def pctile(a,p):
    a=sorted(a);x=(len(a)-1)*p;i=math.floor(x);return a[i]+(a[min(i+1,len(a)-1)]-a[i])*(x-i)
def describe(a):
    a=sorted(a);m=len(a)//2;q1=statistics.median(a[:m]) if m else a[0];q3=statistics.median(a[-m:]) if m else a[0]
    return dict(n=len(a),median=statistics.median(a),mean=statistics.mean(a),sample_stddev=statistics.stdev(a) if len(a)>1 else None,Q1=q1,Q3=q3,IQR=q3-q1,min=min(a),max=max(a))
def main(out):
    manifest=read(BASE/'manifest.json');frozen=read(BASE/'frozen.json');schedule=read(BASE/'schedule.json');errors=[]
    def check(v,s):
        if not v:errors.append(s)
    for rel,h in frozen['files'].items():check(sha(BASE/rel)==h,'frozen '+rel)
    check(sha(BASE/'schedule.json')==frozen['schedule_sha256'],'schedule SHA')
    for case,s in frozen['scripts'].items():check(sha(BASE/s['path'])==s['sha256'],'script '+case)
    raws=sorted((BASE/'raw/formal').rglob('*.json'));records=[read(p) for p in raws];index={};position=Counter();groups=defaultdict(list);short=[]
    for r in records:
        key=(r['rep'],r['case'],r['condition']);check(key not in index,'duplicate '+str(key));index[key]=r
        check(r['binary_sha256']==manifest['artifacts'][r['condition']]['sha256'],'binary SHA '+str(key))
        check(r['flags']==manifest['commands'][r['condition']][1:] and r['command']==manifest['commands'][r['condition']]+[r['command'][-1]],'command/flags '+str(key))
        check(r['script_sha256']==frozen['scripts'][r['case']]['sha256'] and r['script_relative']==frozen['scripts'][r['case']]['path'],'common script '+str(key))
        check(r['case_source_sha256']==sha(BASE/'cases/shared.js'),'target source '+str(key))
        check(r['cohort']==manifest['cohort'] and r['mode']==manifest['mode'],'cohort '+str(key))
        check(r['dependencies']==(manifest['v8_dependencies'] if r['condition']=='V8_ON' else []),'dependencies '+str(key))
        position[(r['case'],r['condition'],r['order'])]+=1
        if r['valid']:
            d=r['payload'];e=r['elapsed_ms'];check(e>0 and math.isfinite(e) and e==d['elapsed_ms']==d['stop_ms']-d['start_ms'],'timer '+str(key))
            check(e<=r['outer_wall_ns']/1e6+5 and r['elapsed_per_Run_ms']==e/r['N'],'enclosure '+str(key))
            check(r['exit_code']==0 and not r['stderr'] and d['correctness']=='PASS' and d['warmup_calls']==0 and d['first_Run_included'] and d['checksum']==r['N']*8390656 and d['last']==8390656,'correctness '+str(key))
            groups[(r['case'],r['condition'])].append(r)
            if e<1000:short.append(dict(case=r['case'],condition=r['condition'],rep=r['rep'],elapsed_ms=e))
    missing=[]
    for s in schedule:
        key=(s['rep'],s['case'],s['condition']);r=index.get(key)
        if not r:missing.append(key);continue
        check(r['N']==s['N'] and r['order']==s['order'],'scheduled position '+str(key))
    ordered=sorted(records,key=lambda r:r['outer_start_ns']);check(all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(ordered,ordered[1:])),'serial')
    check(len({r['boot_id'] for r in records})==1,'single formal boot')
    case_position=Counter((s['case'],s['case_order']) for s in schedule if s['order']==0)
    for case in CASES:
        check(sorted(case_position[(case,i)] for i in range(4))==[7,7,8,8],'case positions7/8 '+case)
        perms=Counter(tuple(s['condition'] for s in schedule if s['rep']==rep and s['case']==case) for rep in range(30));check(len(perms)==6 and set(perms.values())=={5},'six permutations5each '+case)
        for c in CONDS:
            check([position[(case,c,i)] for i in range(3)]==[10,10,10],'condition positions10 '+case+c)
            check(len(groups[(case,c)])==30,'30 valid '+case+c)
        selected=read(BASE/'selected'/f'{case}.json');check(len(selected['pilot_ms'])==9 and min(selected['pilot_ms'])>=1000,'three independent pilots '+case)
        checks=list((BASE/'raw/selected_correctness'/case).glob('*.json'));check(len(checks)==3 and all(read(p)['valid'] for p in checks),'selected correctness '+case)
    check(read(BASE/'identity_after.json')['status']=='PASS','identity after');check(read(BASE/'correctness_gate.json')['valid']==24,'N1/N2 correctness')
    complete=[rep for rep in range(30) if all((rep,case,c) in index and index[(rep,case,c)]['valid'] for case in CASES for c in CONDS)]
    descript=[]
    for key,rr in sorted(groups.items()):
        if not rr:continue
        for metric in ['execution','end_to_end']:
            vals=[r['elapsed_per_Run_ms'] if metric=='execution' else r['outer_wall_ns']/1e6 for r in rr]
            descript.append(dict(case=key[0],condition=key[1],N=rr[0]['N'],metric=metric,unit='ms/complete Run' if metric=='execution' else 'ms/process',**describe(vals)))
    ratios=[]
    if complete:
        arrays={(case,c):[index[(rep,case,c)]['elapsed_per_Run_ms'] for rep in complete] for case in CASES for c in CONDS}
        samples=[[] for _ in PAIRS];rng=random.Random(20261028)
        for _ in range(10000):
            ix=[rng.randrange(len(complete)) for _ in complete];med={k:statistics.median(a[i] for i in ix) for k,a in arrays.items()}
            for j,(a,b) in enumerate(PAIRS):samples[j].append(med[a]/med[b])
        for j,(a,b) in enumerate(PAIRS):
            ratio=statistics.median(arrays[a])/statistics.median(arrays[b]);lo=pctile(samples[j],.025);hi=pctile(samples[j],.975)
            ratios.append(dict(numerator_case=a[0],numerator_condition=a[1],denominator_case=b[0],denominator_condition=b[1],ratio=ratio,CI95_low=lo,CI95_high=hi,complete_rounds=len(complete),point_estimate_scope='complete12-process rounds only',direction='unclear' if lo<=1<=hi else 'denominator_faster' if lo>1 else 'denominator_slower'))
    differences=[r['UTC_minus_monotonic_ms'] for r in records]
    utc=dict(unit='ms',per_process_UTC_minus_monotonic=describe(differences) if differences else None,negative_UTC_elapsed_count=sum(r['UTC_elapsed_ms']<0 for r in records),records=len(records),clock_origin_join=False,endpoint_note='reservation file written BEFORE BOTH timestamps; UTC start immediately before parent monotonic start, UTC end immediately after monotonic stop. Calls are adjacent but not simultaneous; small bookkeeping/clock effects unseparated; UTC never performance.')
    if ordered:
        first,last=ordered[0],ordered[-1];u=(datetime.fromisoformat(last['completed_at'])-datetime.fromisoformat(first['timestamp'])).total_seconds()*1000;t=(last['outer_stop_ns']-first['outer_start_ns'])/1e6;utc.update(campaign_UTC_span_ms=u,campaign_monotonic_span_ms=t,campaign_UTC_minus_monotonic_ms=u-t)
    csvwrite(out/'summary.csv',descript);csvwrite(out/'ratios.csv',ratios);csvwrite(out/'short_samples.csv',short)
    csvwrite(out/'raw_index.csv',[{k:r[k] for k in ['case','condition','rep','N','order','elapsed_ms','elapsed_per_Run_ms','outer_wall_ns','UTC_elapsed_ms','UTC_minus_monotonic_ms','valid','exit_code','timestamp','completed_at','binary_sha256','script_sha256']} for r in records])
    csvwrite(out/'positions.csv',[dict(case=case,condition=c,position=i,count=position[(case,c,i)]) for case in CASES for c in CONDS for i in range(3)])
    write(out/'UTC_consistency.json',utc)
    audit=dict(status='PASS' if not errors and len(records)==360 and all(r['valid'] for r in records) and not missing else 'INCOMPLETE_OR_FAILED',expected=360,actual=len(records),valid=sum(r['valid'] for r in records),errors=errors,missing=missing,complete_rounds=complete,incomplete_rounds=[rep for rep in range(30) if rep not in complete],descriptive_uses_all_valid=True,paired_uses_complete12_only=True,short_samples_retained=len(short),runtime_paths_opened=False,bootstrap_iterations=10000,seed=20261028,quantiles='Tukey exclusive halves for Q1/Q3; linear bootstrap percentiles',raw_sha256={p.relative_to(BASE).as_posix():sha(p) for p in raws})
    write(out/'audit.json',audit);print(json.dumps({k:v for k,v in audit.items() if k!='raw_sha256'},indent=2))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True);a=p.parse_args();main(a.output)
