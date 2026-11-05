"""Public-data-only tables, target-site identities and separate interval plots."""
import html,statistics as st
from common import *
def load(name):
    with (HERE/'analysis'/name).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
def figure(rows,name,pair,title):
    prefix='execution_'+pair
    lo=min(.99,min(float(r[prefix+'_CI_low']) for r in rows)*.98)
    hi=max(1.01,max(float(r[prefix+'_CI_high']) for r in rows)*1.02)
    left,width=275,590;x=lambda v:left+(float(v)-lo)/(hi-lo)*width;h=100+len(rows)*34
    s=[f'<svg xmlns="http://www.w3.org/2000/svg" width="1020" height="{h}">',
       '<rect width="100%" height="100%" fill="white"/>',f'<text x="12" y="24" font-family="sans-serif" font-size="16">{html.escape(title)}</text>',
       f'<path d="M{x(1)},40 V{h-45}" stroke="gray" stroke-dasharray="5 4"/>']
    for i,r in enumerate(rows):
        y=58+i*34;s.extend([f'<text x="12" y="{y+5}" font-family="sans-serif" font-size="13">{html.escape(r["case"])}</text>',
          f'<path d="M{x(r[prefix+"_CI_low"])},{y} H{x(r[prefix+"_CI_high"])}" stroke="black" stroke-width="2"/>',
          f'<circle cx="{x(r[prefix+"_speedup"])}" cy="{y}" r="4" fill="#24465a"/>',
          f'<text x="900" y="{y+5}" font-size="13">{float(r[prefix+"_speedup"]):.4f}</text>'])
    for k in range(6):
        v=lo+(hi-lo)*k/5;s.append(f'<text x="{x(v)-15}" y="{h-22}" font-size="12">{v:.3f}</text>')
    s.append('</svg>');save(HERE/'analysis'/name,'\n'.join(s)+'\n')
def main():
    summary=load('summary.csv');dd=load('diagnostic_summary.csv');mem=load('memory.csv')
    with (HERE/'correctness/octane.csv').open(encoding='utf-8',newline='') as f:correct=list(csv.DictReader(f))
    compatibility=[];calibration=[]
    for c in CASES:
        row=dict(case=c)
        for v in VERSIONS:
            rr=[r for r in correct if r['case']==c and r['variant']==v]
            row[v+'_correctness']='PASS' if len(rr)==2 and all(r['valid']=='True' for r in rr) else 'FAIL_OR_MISSING'
        row.update(included=all(row[v+'_correctness']=='PASS' for v in VERSIONS),main_aggregate=c in OCTANE_CASES and not c.startswith('Crypto.'),reason='random padding not pairwise frozen; sensitivity only' if c.startswith('Crypto.') else 'predeclared coverage')
        compatibility.append(row)
        sel=read(HERE/'selected'/f'{c}.json');calibration.append(dict(case=c,N=sel['N'],independent_pilot_processes=len(sel['pilot_ms']),min_pilot_ms=min(sel['pilot_ms']),max_pilot_ms=max(sel['pilot_ms']),first_Run_included=True))
    csvout(HERE/'analysis/compatibility.csv',compatibility);csvout(HERE/'analysis/selected_n.csv',calibration)
    csvout(HERE/'analysis/end_to_end.csv',[{k:v for k,v in r.items() if k in ['case','N','A_n','P_n','M_n'] or k.startswith('e2e_')} for r in summary])
    ds={(r['case'],r['variant']):r for r in dd};ms={(r['case'],r['variant']):r for r in mem}
    wide=[];memory=[];targets=[];creation=[]
    from mechanism import sites
    from micros import TARGETS
    for case in CASES:
        r=dict(case=case,scope='whole process; final-bytecode read sites; cold queries included')
        for v in ['P','M']:
            for k,val in ds[case,v].items():
                if k not in ['case','variant']:r[v+'_'+k]=val
            if case in MICRO_CASES:
                d=read(HERE/'raw/diagnostic'/f'{case}.{v}.json.gz')
                for s in sites(d,TARGETS[case]):targets.append(dict(case=case,variant=v,**s))
        wide.append(r)
        if case in OCTANE_CASES:
            r=dict(case=case,unit='KiB',measurement='separate GNU time; 3 fresh processes/version')
            for v in VERSIONS:
                for k in ['n','median_KiB','min_KiB','max_KiB','values_KiB']:r[v+'_'+k]=ms[case,v][k]
            for a,b in [('A','M'),('P','M'),('A','P')]:r[b+'_vs_'+a+'_RSS_change_pct']=(float(ms[case,b]['median_KiB'])/float(ms[case,a]['median_KiB'])-1)*100
            memory.append(r)
    for label in ['many_functions_once','one_function_many']:
        for v in ['P','M']:
            d=read(HERE/'raw/diagnostic'/f'{label}.{v}.json.gz');ss=[s for f in d['functions'] for s in f['sites']]
            creation.append(dict(case=label,variant=v,queries=sum(s['queries'] for s in ss),hits=sum(s['hits'] for s in ss),
              finalized_functions=d['finalized_functions'],sites_created=d['sites_created'],sites_used=d['sites_used'],
              requested_direct_bytes=d['requested_direct_bytes'],peak_live_direct_bytes=d['peak_live_direct_bytes']))
    csvout(HERE/'analysis/diagnostic_comparison.csv',wide);csvout(HERE/'analysis/memory_comparison.csv',memory)
    save(HERE/'analysis/micro_target_sites.json',targets);csvout(HERE/'analysis/creation_use.csv',creation)
    for pair in ['AM','PM','AP']:
        for label,cs in [('octane',OCTANE_CASES),('micros',MICRO_CASES)]:
            figure([r for r in summary if r['case'] in cs],f'{label}_{pair}_CI.svg',pair,f'{label}: {pair[0]}/{pair[1]} ratio of medians, paired 95% CI (>1: {pair[1]} faster)')
    lines=['# 同批次 A/P/M 执行时间','',
      '单位 ms/完整 Run；微基准每 Run 4096 轮。每组每版 30 新进程；首次 Run 在内，无额外 workload 预跑。',
      'A/M、P/M、A/P >1 表示分母版本更快。区间为 10000 次三元组配对 bootstrap 的探索性逐项 95% 区间。','',
      '| 项目 | N | A ms | P ms | M ms | A/M [95% CI] | P/M [95% CI] | M/A 时间变化 |',
      '|---|---:|---:|---:|---:|---|---|---:|']
    for r in summary:
        f=lambda k:float(r[k])
        ci=lambda pair:f'{f("execution_"+pair+"_speedup"):.4f} [{f("execution_"+pair+"_CI_low"):.4f}, {f("execution_"+pair+"_CI_high"):.4f}]'
        lines.append(f'| {r["case"]} | {r["N"]} | {f("execution_A_median"):.6f} | {f("execution_P_median"):.6f} | {f("execution_M_median"):.6f} | {ci("AM")} | {ci("PM")} | {f("execution_AM_right_time_change_pct"):+.2f}% |')
    lines+=['','完整 A/P、各变化率区间和样本数见 summary.csv；mean/sample std/Q1/Q3/IQR/min/max 见 statistics.csv。',
      'Micro 不进 GM。Crypto 预排除主 GM，另给敏感性聚合。不是官方 Octane 总分。']
    save(HERE/'analysis/tables.md','\n'.join(lines)+'\n');print('SUPPLEMENTARY_PASS',flush=True)
if __name__=='__main__':main()
