"""Portable data-only replay. No imports/calls requiring an installed JS runtime."""
import argparse,collections,html,math,random,statistics as st
from common import *
PAIRS=[('A','B'),('B','C'),('A','C')]
def quantile(values,p):
    a=sorted(values);x=(len(a)-1)*p;i=int(x);j=min(i+1,len(a)-1);return a[i]+(a[j]-a[i])*(x-i)
def stats(a):
    s=sorted(a);n=len(s);q1=st.median(s[:n//2]);q3=st.median(s[(n+1)//2:])
    return dict(n=n,median=st.median(a),mean=st.mean(a),sample_stddev=st.stdev(a),Q1=q1,Q3=q3,IQR=q3-q1,min=min(a),max=max(a))
def ci_triples(vals,seed):
    rng=random.Random(seed);n=len(vals['A']);samples={a+b:[] for a,b in PAIRS}
    for _ in range(10000):
        ix=[rng.randrange(n) for _ in range(n)]
        med={v:st.median(vals[v][i] for i in ix) for v in VERSIONS}
        for a,b in PAIRS:samples[a+b].append(med[a]/med[b])
    return {p:(quantile(v,.025),quantile(v,.975)) for p,v in samples.items()}
def plot(rows,path,field,low,high,title):
    maximum=max(1.1,max(float(r[high]) for r in rows)*1.08);left=270;scale=600/maximum
    body=[f'<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="{95+len(rows)*32}">',
      '<rect width="100%" height="100%" fill="white"/>',f'<text x="15" y="25" font-size="17" font-family="sans-serif">{html.escape(title)}</text>',
      f'<path d="M{left+scale},42 v{len(rows)*32}" stroke="gray" stroke-dasharray="5 4"/>']
    for i,r in enumerate(rows):
        y=60+i*32;x=lambda n:left+scale*float(n)
        body.extend([f'<text x="10" y="{y+5}" font-size="13" font-family="sans-serif">{html.escape(r["case"])}</text>',
          f'<line x1="{x(r[low])}" x2="{x(r[high])}" y1="{y}" y2="{y}" stroke="black" stroke-width="2"/>',
          f'<circle cx="{x(r[field])}" cy="{y}" r="4" fill="#24465a"/>',
          f'<text x="900" y="{y+5}" font-size="13">{float(r[field]):.4f}</text>'])
    body.append('</svg>');save(path,'\n'.join(body))
def formal():
    m=read(HERE/'measurement_manifest.json');schedule=read(HERE/'schedule.json');frozen=read(HERE/'frozen.json')
    for key,p in [('protocol_sha256','protocol.json'),('measurement_manifest_sha256','measurement_manifest.json'),('schedule_sha256','schedule.json')]:assert sha(HERE/p)==frozen[key]
    rows=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    key=lambda r:(r['case'],r['rep'],r['variant'],r['order'],r['N'])
    expected={key(r) for r in schedule};actual=[key(r) for r in rows]
    duplicates=[list(k) for k,n in collections.Counter(actual).items() if n>1]
    missing=[list(k) for k in sorted(expected-set(actual))];extra=[list(k) for k in sorted(set(actual)-expected)]
    ordering={}
    for case in CASES:
        seq=[''.join(r['variant'] for r in sorted([r for r in schedule if r['case']==case and r['rep']==rep],key=lambda r:r['order'])) for rep in range(30)]
        ordering[case]=dict(collections.Counter(seq));assert len(ordering[case])==6 and set(ordering[case].values())=={5}
    for r in rows:
        assert r['mode']==MODE and r['campaign']==m['campaign']
        assert r['binary_sha256']==m['artifacts'][r['variant']]['sha256'] and r['flags']==[]
        assert r['command'][0]==m['artifacts'][r['variant']]['path'] and len(r['command'])==2
        if r['valid']:
            assert r['exit_code']==0 and not r['stderr'] and r['payload']['correctness']=='PASS'
            assert r['payload']['warmup_calls']==0 and r['elapsed_ms']>0 and r['elapsed_ms']<=r['outer_wall_ns']/1e6+5
    summaries=[];detail=[];included=[]
    for idx,case in enumerate(CASES):
        cases=[r for r in rows if r['case']==case and r['valid']]
        vrep={v:{r['rep']:r for r in cases if r['variant']==v} for v in VERSIONS}
        reps=sorted(set.intersection(*[set(x) for x in vrep.values()]))
        if len(reps)!=30:continue
        included.append(case);row=dict(case=case,N=vrep['A'][0]['N'],main_aggregate=not case.startswith('Crypto.'))
        for v in VERSIONS:row[v+'_n']=len(vrep[v])
        for rep in reps:
            rr=[vrep[v][rep] for v in VERSIONS];assert len({r['script_sha256'] for r in rr})==1 and len({r['N'] for r in rr})==1
        for metric,keyname,scale in [('execution','elapsed_per_call_ms',1),('e2e','outer_wall_ns',1e-6)]:
            vals={v:[vrep[v][rep][keyname]*scale for rep in reps] for v in VERSIONS};cis=ci_triples(vals,SEED+idx)
            med={v:st.median(vals[v]) for v in VERSIONS}
            for v in VERSIONS:
                row[metric+'_'+v+'_median']=med[v]
                detail.append(dict(case=case,variant=v,metric=metric,unit='ms/Run' if metric=='execution' else 'ms/process',**stats(vals[v])))
            for a,b in PAIRS:
                p=metric+'_'+a+b;low,high=cis[a+b]
                row.update({p+'_speedup':med[a]/med[b],p+'_CI_low':low,p+'_CI_high':high,p+'_right_time_change_pct':(med[b]/med[a]-1)*100,
                  p+'_change_CI_low':(1/high-1)*100,p+'_change_CI_high':(1/low-1)*100,
                  p+'_direction':'right_faster' if low>1 else ('right_slower' if high<1 else 'unclear')})
        summaries.append(row)
    csvout(HERE/'analysis/summary.csv',summaries);csvout(HERE/'analysis/statistics.csv',detail)
    aggregate={}
    for include_crypto,label in [(False,'MAIN_no_Crypto'),(True,'sensitivity_with_Crypto')]:
        selected=[r for r in summaries if include_crypto or r['main_aggregate']];suites=collections.defaultdict(list)
        for r in selected:suites[r['case'].split('.')[0]].append(r)
        output={}
        for a,b in PAIRS:
            suitegm={s:math.exp(st.mean(math.log(r['execution_'+a+b+'_speedup']) for r in rs)) for s,rs in suites.items()}
            output[a+b]=dict(suite_geomean=math.exp(st.mean(math.log(x) for x in suitegm.values())),by_suite=suitegm)
        aggregate[label]=dict(cases=[r['case'] for r in selected],unit_count=len(selected),suite_count=len(suites),comparisons=output)
    aggregate['official_Octane_score']=False;save(HERE/'analysis/aggregate.json',aggregate)
    audit=dict(status='PASS' if len(rows)==1440 and all(r['valid'] for r in rows) and not missing and not duplicates and not extra else 'INCOMPLETE',
      expected=1440,actual=len(rows),valid=sum(r['valid'] for r in rows),failed=sum(not r['valid'] for r in rows),
      missing=missing,duplicates=duplicates,unexpected=extra,six_order_counts=ordering,
      valid_complete_cases=included,below_1000ms=sum(r['valid'] and r['elapsed_ms']<1000 for r in rows),
      outliers_removed=0,boot_ids=sorted({r['boot_id'] for r in rows}),
      data_only=True,runtime_files_required=False,recorded_hashes_checked=True,current_binary_identity_checked=False)
    save(HERE/'analysis/formal_audit.json',audit)
    for metric in ['execution','e2e']:
        for a,b in PAIRS:
            prefix=metric+'_'+a+b
            plot(summaries,HERE/'analysis'/f'{prefix}.svg',prefix+'_speedup',prefix+'_CI_low',prefix+'_CI_high',f'{metric}: {a}/{b} median ratio and paired 95% CI (>1: {b} faster)')
    lines=['# 同批次ABC正式时间','',
      '内部时间ms/原Run；首次调用在内，无额外预跑。每版本每项30新进程；CI为三元组配对bootstrap探索区间。Crypto受限且预先排除主GM。','',
      '| 项目 | N | A | B | C | B/C [95%CI] | C相对B时间变化 | A/C [95%CI] |',
      '|---|---:|---:|---:|---:|---|---:|---|']
    for r in summaries:lines.append(f'| {r["case"]} | {r["N"]} | {r["execution_A_median"]:.6f} | {r["execution_B_median"]:.6f} | {r["execution_C_median"]:.6f} | {r["execution_BC_speedup"]:.4f} [{r["execution_BC_CI_low"]:.4f},{r["execution_BC_CI_high"]:.4f}] | {r["execution_BC_right_time_change_pct"]:+.2f}% [{r["execution_BC_change_CI_low"]:+.2f}%,{r["execution_BC_change_CI_high"]:+.2f}%] | {r["execution_AC_speedup"]:.4f} [{r["execution_AC_CI_low"]:.4f},{r["execution_AC_CI_high"]:.4f}] |')
    save(HERE/'analysis/tables.md','\n'.join(lines)+'\n');print('FORMAL_DATA_AUDIT',json.dumps(audit),flush=True)
def legacy():
    # Replays publicly tracked formal raw; never opens old /home or /mnt binaries/scripts.
    rows=[read(p) for p in (OLD/'raw/formal').glob('*/*.json')];assert len(rows)==960 and all(r['valid'] for r in rows)
    output=[];detail=[]
    for idx,case in enumerate(CASES):
        data={v:{r['rep']:r for r in rows if r['case']==case and r['variant']==v} for v in ['A','B']}
        assert set(data['A'])==set(data['B'])==set(range(30));row=dict(case=case)
        for metric,key,scale in [('execution','elapsed_per_call_ms',1),('end_to_end','outer_wall_ns',1e-6),('rss','peak_rss_kib',1)]:
            vals={v:[data[v][i][key]*scale for i in range(30)] for v in ['A','B']}
            cis=ci_triples(dict(**vals,C=vals['B']),SEED+idx)['AB']
            med={v:st.median(vals[v]) for v in ['A','B']}
            row.update({metric+'_A_median':med['A'],metric+'_B_median':med['B'],metric+'_A_over_B':med['A']/med['B'],metric+'_CI95_low':cis[0],metric+'_CI95_high':cis[1]})
            for v in ['A','B']:detail.append(dict(case=case,variant=v,metric=metric,**stats(vals[v])))
        output.append(row)
    csvout(HERE/'recovery/legacy_statistics_replay.csv',output)
    csvout(HERE/'recovery/legacy_descriptive_statistics.csv',detail)
    oldsummary=list(csv.DictReader((OLD/'analysis/summary.csv').open()))
    assert all(abs(float(value)-float(oldsummary[i][key]))<1e-10 for i,r in enumerate(output) for key,value in r.items() if key!='case')
    save(HERE/'recovery/legacy_replay_audit.json',dict(status='PASS',records=960,rows=16,binaries_required=False,comparison='execution/e2e/RSS medians and paired CI matched to 1e-10; RSS original measurement limitation retained'))
    print('LEGACY_PORTABLE_REPLAY_PASS',flush=True)
def diagnostics():
    from diagnostic import validate
    rows=[];hist=[]
    for case in CASES:
        for v in ['B','C']:
            d=validate(read(HERE/'raw/diagnostic'/f'{case}.{v}.json.gz'));units=d['units_detail'];tot={}
            fields=['read_queries','write_queries','read_hits','write_hits','read_fallback','write_fallback','shape_misses','probes','update_probes','updates','replacements','insertions']
            for k in fields:tot[k]=sum(u[k] for u in units)
            q=tot['read_queries']+tot['write_queries'];h=tot['read_hits']+tot['write_hits']
            rows.append(dict(case=case,variant=v,**tot,queries=q,accepted_hits=h,hit_fraction=h/q if q else None,probes_per_query=tot['probes']/q if q else None,
              initializations=d['initializations'],cache_units=d['units'],requested_bytes_diagnostic_layout=d['requested_bytes_diagnostic_layout'],
              peak_live_bytes_diagnostic_layout=d['peak_live_bytes_diagnostic_layout'],live_after_free=d['live_bytes_after_runtime_free']))
            counter=collections.Counter(u['max_filled_slots'] for u in units)
            for n in range(5):hist.append(dict(case=case,variant=v,max_occupied_slots=n,units=counter[n],denominator=len(units),fraction=counter[n]/len(units) if units else None))
    csvout(HERE/'analysis/diagnostic_summary.csv',rows);csvout(HERE/'analysis/occupancy_lifetime_max.csv',hist)
    print('DIAGNOSTIC_DATA_REPLAY_PASS',len(rows),flush=True)
def extras():
    def load(name):
        with (HERE/'analysis'/name).open(newline='',encoding='utf-8') as f:return list(csv.DictReader(f))
    summary=load('summary.csv');memory=load('memory.csv');diag=load('diagnostic_summary.csv')
    csvout(HERE/'analysis/end_to_end.csv',[{k:v for k,v in r.items() if k in ['case','N','A_n','B_n','C_n'] or k.startswith('e2e_')} for r in summary])
    mem={(r['case'],r['variant']):r for r in memory};dd={(r['case'],r['variant']):r for r in diag};wide=[];dw=[]
    for case in CASES:
        row=dict(case=case,unit='KiB',measurement='separate GNU time; 3 processes/version; point estimates, no CI')
        for v in VERSIONS:
            for key in ['n','median_KiB','min_KiB','max_KiB','values_KiB']:row[v+'_'+key]=mem[case,v][key]
        row['C_vs_B_peak_change_pct']=(float(mem[case,'C']['median_KiB'])/float(mem[case,'B']['median_KiB'])-1)*100;wide.append(row)
        row=dict(case=case,scope='whole process; one diagnostic process per version; function+atom units')
        for v in ['B','C']:
            for key,value in dd[case,v].items():
                if key not in ['case','variant']:row[v+'_'+key]=value
        dw.append(row)
    csvout(HERE/'analysis/memory_comparison.csv',wide);csvout(HERE/'analysis/diagnostic_comparison.csv',dw)
    left,width=270,600;low=.96;high=1.05;x=lambda r:left+(float(r)-low)/(high-low)*width
    parts=['<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="625">',
      '<rect width="100%" height="100%" fill="white"/>',
      '<text x="15" y="24" font-size="16" font-family="sans-serif">B/C execution ratio and paired 95% CI (zoomed x-axis; &gt;1 means C faster)</text>',
      f'<line x1="{x(1)}" x2="{x(1)}" y1="40" y2="565" stroke="gray" stroke-dasharray="5 4"/>']
    for i,r in enumerate(summary):
        y=57+i*32
        parts.extend([f'<text x="10" y="{y+5}" font-size="13" font-family="sans-serif">{html.escape(r["case"])}</text>',
          f'<line x1="{x(r["execution_BC_CI_low"])}" x2="{x(r["execution_BC_CI_high"])}" y1="{y}" y2="{y}" stroke="black" stroke-width="2"/>',
          f'<circle cx="{x(r["execution_BC_speedup"])}" cy="{y}" r="4" fill="#24465a"/>',
          f'<text x="895" y="{y+5}" font-size="13">{float(r["execution_BC_speedup"]):.4f}</text>'])
    for tick in [.96,.98,1,1.02,1.04,1.05]:parts.append(f'<text x="{x(tick)-13}" y="590" font-size="12">{tick:.2f}</text>')
    parts+=['<line x1="270" x2="870" y1="570" y2="570" stroke="black"/>','</svg>']
    save(HERE/'analysis/execution_BC_zoom.svg','\n'.join(parts)+'\n')
    print('SEPARATE_TABLES_AND_ZOOM_FIGURE_SAVED',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['formal','legacy','diagnostics','extras']);a=p.parse_args();globals()[a.stage]()
