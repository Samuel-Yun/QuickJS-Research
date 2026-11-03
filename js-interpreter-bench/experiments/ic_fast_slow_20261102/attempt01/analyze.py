"""Portable raw-only statistics, paired bootstrap, audit, and SVG. No VM/private imports.

python analyze.py mechanism --output analysis
python analyze.py sunspider --output replay_01
"""
import argparse,csv,hashlib,html,io,json,math,random,statistics
from collections import Counter,defaultdict
from pathlib import Path
HERE=Path(__file__).resolve().parent
SEED=20261102;B=10000
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,value):
    p.parent.mkdir(parents=True,exist_ok=True)
    data=value if isinstance(value,str) else json.dumps(value,ensure_ascii=False,indent=2)+'\n'
    with p.open('x',encoding='utf-8') as f:f.write(data)
def csvout(p,rows):
    rows=list(rows)
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def percentile(x,q):
    x=sorted(x);v=(len(x)-1)*q;i=int(v);return x[i]+(x[min(i+1,len(x)-1)]-x[i])*(v-i)
def summary(x):
    x=sorted(x);n=len(x);q1=statistics.median(x[:n//2]) if n>1 else x[0];q3=statistics.median(x[(n+1)//2:]) if n>1 else x[0]
    return dict(n=n,median=statistics.median(x),mean=statistics.mean(x),sample_stddev=statistics.stdev(x) if n>1 else None,
                Q1=q1,Q3=q3,IQR=q3-q1,min=min(x),max=max(x))
def esc(s):return html.escape(str(s))
def ratios_plot(path,rows,title):
    width=1250;top=65;rowh=29;height=top+len(rows)*rowh+60
    xmax=max(1.25,max(r['CI95_high'] for r in rows)*1.06);left=330;right=940;scale=(right-left)/xmax
    s=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
       '<rect width="100%" height="100%" fill="white"/>',
       f'<g font-family="sans-serif" font-size="15" fill="#181818"><text x="20" y="25">{esc(title)}</text>']
    for k in range(6):
        value=xmax*k/5;x=left+scale*value;s+=[f'<line x1="{x}" y1="40" x2="{x}" y2="{height-40}" stroke="#e4e4e4"/>',f'<text x="{x}" y="{height-15}" text-anchor="middle">{value:.2f}</text>']
    one=left+scale;s.append(f'<line x1="{one}" y1="40" x2="{one}" y2="{height-40}" stroke="#888" stroke-dasharray="5,4"/>')
    for i,r in enumerate(rows):
        y=top+i*rowh;color='#155b59' if r['CI95_high']<1 else '#873c3c' if r['CI95_low']>1 else '#666'
        s += [f'<text x="20" y="{y+5}">{esc(r["case"])}</text>',
          f'<line x1="{left+scale*r["CI95_low"]}" x2="{left+scale*r["CI95_high"]}" y1="{y}" y2="{y}" stroke="{color}" stroke-width="2"/>',
          f'<circle cx="{left+scale*r["point"]}" cy="{y}" r="4" fill="{color}"/>',
          f'<text x="965" y="{y+5}">{r["point"]:.4f} [{r["CI95_low"]:.4f}, {r["CI95_high"]:.4f}]</text>']
    s.append('</g></svg>');save(path,'\n'.join(s))
def curves(path,stats):
    cases=list(dict.fromkeys(r['case'] for r in stats));s=['<svg xmlns="http://www.w3.org/2000/svg" width="1150" height="1050"><rect width="100%" height="100%" fill="white"/><g font-family="sans-serif" font-size="16">']
    lookup={(r['case'],r['condition']):r for r in stats}
    for panel,case in enumerate(cases):
        yy=panel*345;left=110;right=860;top=yy+45;bottom=yy+265
        vals=[lookup[(case,c)]['median'] for c in ['A','M','C0','C25','C50','C75','C100']]
        maximum=max(vals)*1.12
        Y=lambda v:bottom-v/maximum*(bottom-top)
        s+=[f'<text x="25" y="{yy+25}">{esc(case)} — ms / complete microRun (4096 iterations)</text>',f'<line x1="{left}" x2="{right}" y1="{bottom}" y2="{bottom}" stroke="black"/>']
        for k in range(5):
            value=maximum*k/4;y=Y(value);s+=[f'<line x1="{left}" x2="{right}" y1="{y}" y2="{y}" stroke="#e5e5e5"/>',f'<text x="100" y="{y+5}" text-anchor="end">{value:.4f}</text>']
        points=[]
        for q,c in zip([0,25,50,75,100],['C0','C25','C50','C75','C100']):
            x=left+q/100*(right-left);v=lookup[(case,c)]['median'];y=Y(v);points.append(f'{x},{y}')
            s += [f'<circle cx="{x}" cy="{y}" r="4" fill="#222"/>',f'<text x="{x}" y="{y-10}" text-anchor="middle">{v:.5f}</text>',f'<text x="{x}" y="{bottom+25}" text-anchor="middle">{q}</text>']
        s.append('<polyline points="'+' '.join(points)+'" fill="none" stroke="#222"/>')
        for legend_index,(c,color,dash) in enumerate([('A','#777','3,5'),('M','#225d7a','7,5')]):
            y=Y(lookup[(case,c)]['median']);legend_y=yy+100+legend_index*28
            s.append(f'<line x1="{left}" x2="{right}" y1="{y}" y2="{y}" stroke="{color}" stroke-dasharray="{dash}"/><line x1="885" x2="910" y1="{legend_y-5}" y2="{legend_y-5}" stroke="{color}" stroke-dasharray="{dash}"/><text x="920" y="{legend_y}" fill="{color}">{c}: {lookup[(case,c)]["median"]:.5f}</text>')
        axis='configured quota; adoption N/A (no target reads)' if case=='M4.numeric_control' else 'cache-result adoption % (controlled, not natural hit rate)'
        s.append(f'<text x="{left}" y="{bottom+56}">{esc(axis)}</text>')
    s.append('</g></svg>');save(path,'\n'.join(s))
def main():
    p=argparse.ArgumentParser();p.add_argument('campaign',choices=['mechanism','sunspider','micro','octane']);p.add_argument('--output',default='analysis');a=p.parse_args()
    root=HERE/a.campaign;out=root/a.output;assert not out.exists(),'new analysis directory required'
    protocol=load(root/'protocol.json');conditions=protocol['conditions'];cases=protocol['cases']
    raw=sorted((root/'raw/formal').rglob('*.json'));before={f.relative_to(HERE).as_posix():sha(f) for f in raw};records=[load(f) for f in raw]
    groups=defaultdict(list);positions=defaultdict(Counter);seen=set();errors=[]
    for r in records:
        key=(r['case'],r['condition'],r['rep'])
        if key in seen:errors.append('duplicate '+str(key))
        seen.add(key);positions[(r['case'],r['condition'])][r['order']]+=1
        if r['valid'] and r.get('elapsed_per_Run_ms',0)>0:groups[(r['case'],r['condition'])].append(r)
        else:errors.append('invalid '+str(key))
    stats=[];table=[];paired={};bootids={r['boot_id'] for r in records}
    for case in cases:
        t={'case':case,'N':None}
        for c in conditions:
            rr=groups[(case,c)];t[c+'_n']=len(rr)
            if rr:
                assert len({r['N'] for r in rr})==1;t['N']=rr[0]['N'];ss=summary([r['elapsed_per_Run_ms'] for r in rr]);stats.append(dict(case=case,condition=c,unit='ms/complete Run',**ss));t[c+'_median_ms']=ss['median']
            else:t[c+'_median_ms']=None
        paired[case]=sorted(set.intersection(*[{r['rep'] for r in groups[(case,c)]} for c in conditions]))
        t['complete_groups']=len(paired[case]);table.append(t)
    pairs=([('C100','M'),('C0','C100'),('C75','C100'),('C50','C100'),('C25','C100'),('C100','A'),('M','A')]
           if a.campaign=='mechanism' else [('U','M'),('U','A'),('U','V8_ON'),('M','V8_ON')] if 'V8_ON' in conditions else [('U','M'),('U','A')])
    ratio_rows=[];bs={};cache={}
    def bootstrap(case,reps):
        key=(case,tuple(reps))
        if key in cache:return cache[key]
        values={c:{r['rep']:r['elapsed_per_Run_ms'] for r in groups[(case,c)]} for c in conditions}
        rng=random.Random(SEED);arrays={c:[] for c in conditions}
        for iteration in range(B):
            indices=rng.choices(reps,k=len(reps))
            for c in conditions:arrays[c].append(statistics.median(values[c][r] for r in indices))
        cache[key]=arrays;return arrays
    for case in cases:
        reps=paired[case]
        if not reps:continue
        arrays=bootstrap(case,reps)
        for nc,dc in pairs:
            if nc not in conditions or dc not in conditions:continue
            nvals={r['rep']:r['elapsed_per_Run_ms'] for r in groups[(case,nc)]};dvals={r['rep']:r['elapsed_per_Run_ms'] for r in groups[(case,dc)]}
            point=statistics.median(nvals[r] for r in reps)/statistics.median(dvals[r] for r in reps)
            ratios=[n/d for n,d in zip(arrays[nc],arrays[dc])];low,high=percentile(ratios,.025),percentile(ratios,.975)
            row=dict(case=case,ratio=nc+'/'+dc,point=point,CI95_low=low,CI95_high=high,time_change_pct=100*(point-1),paired_groups=len(reps),
                     direction='numerator_faster' if high<1 else 'numerator_slower' if low>1 else 'unclear')
            ratio_rows.append(row);bs[(case,nc+'/'+dc)]=ratios
    aggregate=[]
    sets={'all26_case_equal':cases} if a.campaign=='sunspider' else {'core16_13suite':[c for c in cases if c!='zlib.zlib'],'expanded17_14suite':cases} if a.campaign=='octane' else {}
    for name,subset in sets.items():
        common=sorted(set.intersection(*[set(paired[c]) for c in subset]))
        if not common:aggregate.append(dict(set=name,status='NO_COMPLETE_COMMON_ROUND',cases=subset));continue
        for nc,dc in pairs:
            suite_cases=defaultdict(list)
            for case in subset:suite_cases[case.split('.')[0] if a.campaign=='octane' else case].append(case)
            ratios=[];points={};bcase={}
            for case in subset:
                arrays=bootstrap(case,common);bcase[case]=[n/d for n,d in zip(arrays[nc],arrays[dc])]
                vals={c:{r['rep']:r['elapsed_per_Run_ms'] for r in groups[(case,c)]} for c in [nc,dc]}
                points[case]=statistics.median(vals[nc][r] for r in common)/statistics.median(vals[dc][r] for r in common)
            calc=lambda d:math.exp(statistics.mean(statistics.mean(math.log(d[c]) for c in cc) for cc in suite_cases.values()))
            point=calc(points)
            for i in range(B):ratios.append(calc({c:bcase[c][i] for c in subset}))
            aggregate.append(dict(set=name,ratio=nc+'/'+dc,point=point,CI95_low=percentile(ratios,.025),CI95_high=percentile(ratios,.975),
              common_rounds=len(common),case_count=len(subset),suite_count=len(suite_cases),status='COMPLETE' if len(common)==30 else 'EXPLORATORY_INCOMPLETE',cases=subset))
    for key,cnt in positions.items():
        if len(groups[key])==30:
            vals=[cnt[p] for p in range(len(conditions))]
            if max(vals)-min(vals)>1:errors.append('unbalanced '+str(key))
    ordered=sorted(records,key=lambda r:r['outer_start_ns'])
    if len(bootids)>1:errors.append('multiple boots')
    if any(x['outer_stop_ns']>y['outer_start_ns'] for x,y in zip(ordered,ordered[1:])):errors.append('overlapping children')
    expected=len(cases)*len(conditions)*30
    if len(records)!=expected:errors.append('count '+str(len(records))+'/'+str(expected))
    out.mkdir(parents=True)
    csvout(out/'statistics.csv',stats);csvout(out/'comparison.csv',table);csvout(out/'ratios.csv',ratio_rows)
    if aggregate:save(out/'aggregate.json',aggregate)
    if a.campaign=='mechanism':curves(out/'adoption_curves.svg',stats)
    else:ratios_plot(out/'U_over_M.svg',[r for r in ratio_rows if r['ratio']=='U/M'],'U/M internal time, <1 means U faster; exploratory 95% CI; axis starts at 0')
    md=['# '+a.campaign+'：实际统计','',f'有效/实际/目标：{sum(r["valid"] for r in records)}/{len(records)}/{expected}。所有异常值保留，区间为探索性配对 bootstrap 10000 次。','',
        '|case|N|'+'|'.join(c+' ms' for c in conditions)+'|','|---|---:|'+'|'.join('---:' for c in conditions)+'|']
    for t in table:md.append('|'+str(t['case'])+'|'+str(t['N'])+'|'+'|'.join(f'{t[c+"_median_ms"]:.6f}' if t[c+'_median_ms'] is not None else 'MISSING' for c in conditions)+'|')
    md+=['','|case|ratio|point|95% CI|direction|','|---|---|---:|---|---|']
    for r in ratio_rows:md.append(f'|{r["case"]}|{r["ratio"]}|{r["point"]:.5f}|[{r["CI95_low"]:.5f}, {r["CI95_high"]:.5f}]|{r["direction"]}|')
    if aggregate:
        md+=['','## 固定集合（非官方分数）','']
        for r in aggregate:md.append(str(r))
    save(out/'results.md','\n'.join(md)+'\n')
    after={f.relative_to(HERE).as_posix():sha(f) for f in raw};assert before==after
    save(out/'raw_hashes.json',before)
    save(out/'audit.json',dict(status='PASS_COMPLETE' if not errors else 'INCOMPLETE_OR_FAILED',errors=errors,actual=len(records),expected=expected,
         valid=sum(r['valid'] for r in records),raw_unchanged=True,one_boot=len(bootids)==1,balanced_positions=True if not any('unbalanced' in e for e in errors) else False,
         bootstrap=B,seed=SEED,paired_scope='same-round complete condition groups; aggregate shares whole-round blocks',
         analysis_requires_engines=False,analysis_requires_private_source=False,intervals='exploratory, unadjusted, not equivalence'))
    print(a.campaign,'analysis',len(records),'/',expected,'errors',errors,flush=True)
if __name__=='__main__':main()
