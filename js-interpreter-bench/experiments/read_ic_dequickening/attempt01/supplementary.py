"""Readable tables from fresh intermediate results; data-only, no VM access."""
from common import *
def load(name):
    with (HERE/'analysis'/name).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
def load_correctness():
    with (HERE/'correctness/octane.csv').open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
def main():
    ss=load('summary.csv');dd=load('diagnostic_summary.csv');mem=load('memory.csv');correct=load_correctness();compat=[];cal=[]
    for c in CASES:
        r=dict(case=c)
        for v in VERSIONS:
            rows=[x for x in correct if x['case']==c and x['variant']==v];r[v+'_correctness']='PASS' if len(rows)==2 and all(x['valid']=='True' for x in rows) else 'FAIL_OR_MISSING'
        r.update(included=all(r[v+'_correctness']=='PASS' for v in VERSIONS),main_aggregate=c in OCTANE_CASES and not c.startswith('Crypto.'),reason='historical Crypto padding limitation; sensitivity only' if c.startswith('Crypto.') else 'predeclared full coverage');compat.append(r)
        s=read(HERE/'selected'/f'{c}.json');cal.append(dict(case=c,N=s['N'],pilot_processes=len(s['pilot_ms']),min_pilot_ms=min(s['pilot_ms']),max_pilot_ms=max(s['pilot_ms'])))
    csvout(HERE/'analysis/compatibility.csv',compat);csvout(HERE/'analysis/selected_n.csv',cal)
    csvout(HERE/'analysis/end_to_end.csv',[{k:v for k,v in r.items() if k in ['case','N','A_n','M_n','R_n'] or k.startswith('e2e_')} for r in ss])
    diag=[];memory=[]
    for c in CASES:
        r=dict(case=c,scope='whole process including cold reads; CodeLoad diagnostic N<=8')
        for v in ['M','R']:
            x=next(x for x in dd if x['case']==c and x['variant']==v)
            for k,val in x.items():
                if k not in ['case','variant']:r[v+'_'+k]=val
        diag.append(r)
        if c in OCTANE_CASES:
            r=dict(case=c,unit='KiB',sample_size_each=3)
            for v in VERSIONS:
                x=next(x for x in mem if x['case']==c and x['variant']==v)
                for k in ['n','median_KiB','min_KiB','max_KiB','values_KiB']:r[v+'_'+k]=x[k]
            memory.append(r)
    csvout(HERE/'analysis/diagnostic_comparison.csv',diag);csvout(HERE/'analysis/memory_comparison.csv',memory)
    text=['# 同批次A/M/R执行时间','',
      'ms/完整Run；micro每Run4096轮。每条件30新进程，首次Run在内、无额外workload预跑。',
      '比值为前者中位数/后者中位数；>1右侧更快。10000次三元组配对bootstrap探索性95%区间。','',
      '| 项目 | N | A ms | M ms | R ms | M/R [95%CI] | A/R [95%CI] | A/M [95%CI] | R/M时间变化 |',
      '|---|---:|---:|---:|---:|---|---|---|---:|']
    for r in ss:
        f=lambda k:float(r[k]);ci=lambda k:f'{f("execution_"+k+"_speedup"):.4f} [{f("execution_"+k+"_CI_low"):.4f}, {f("execution_"+k+"_CI_high"):.4f}]'
        text.append('| '+r['case']+' | '+r['N']+' | '+' | '.join(f'{f("execution_"+v+"_median"):.6f}' for v in VERSIONS)+' | '+' | '.join(ci(k) for k in ['MR','AR','AM'])+f' | {f("execution_MR_right_time_change_pct"):+.2f}% |')
    text+=['','完整变化率区间/有效数见summary.csv，描述统计见statistics.csv。端到端ms/process单列，不由两个中位数相减推self-time。',
      'Micro不入GM，Crypto只入敏感性GM。aggregate.json按suite内子项GM再suite等权，10000完整rep轮次分块bootstrap，不是官方Octane分数。']
    save(HERE/'analysis/tables.md','\n'.join(text)+'\n');print('SUPPLEMENTARY_PASS',flush=True)
if __name__=='__main__':main()
