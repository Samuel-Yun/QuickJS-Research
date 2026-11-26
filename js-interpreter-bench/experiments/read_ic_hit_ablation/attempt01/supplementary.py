"""Data-only readable tables; never pool this selected set into an engine GM."""
from common import *
def load(n):
    with (HERE/'analysis'/n).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
def main():
    rows=load('summary.csv');mem=load('memory.csv');diag=load('diagnostic_summary.csv')
    csvout(HERE/'analysis/end_to_end.csv',[{k:v for k,v in r.items() if k=='case' or k=='N' or k.endswith('_n') or k.startswith('e2e_')} for r in rows])
    text=['# 同批次四条件时间','',
      '内部ms/完整Run，微基准每Run4096轮；每条件32个新进程，首次Run在内、无额外workload预跑。',
      '比值=前者中位数/后者中位数，>1后者更快；10000次四元组配对bootstrap，探索性95%区间。不是全Octane，不计算GM。','',
      '| 项目 | N | A ms | M ms | ON ms | LOOKUP ms | LOOKUP/ON [CI] | A/M [CI] | M/ON [CI] |',
      '|---|---:|---:|---:|---:|---:|---|---|---|']
    for r in rows:
        f=lambda k:float(r[k]);rat=lambda k:f'{f("execution_"+k+"_ratio"):.4f} [{f("execution_"+k+"_CI_low"):.4f}, {f("execution_"+k+"_CI_high"):.4f}]'
        text.append('| '+r['case']+' | '+r['N']+' | '+' | '.join(f'{f("execution_"+v+"_median"):.6f}' for v in VERSIONS)+' | '+' | '.join(rat(k) for k in ['LOOKUP_ON','A_M','M_ON'])+' |')
    text+=['','A/ON、A/LOOKUP、时间变化率及其区间见summary.csv，完整描述统计见statistics.csv。外部完整N次Run的新进程时间见end_to_end.csv，不能相减中位数推单步成本。']
    save(HERE/'analysis/tables.md','\n'.join(text)+'\n')
    wide=[]
    for c in CASES:
        row=dict(case=c,scope='whole process, first cold queries included; not formal path trace')
        for v in ['ON','LOOKUP']:
            d=next(r for r in diag if r['case']==c and r['variant']==v)
            for k,val in d.items():
                if k not in ['case','variant']:row[v+'_'+k]=val
        wide.append(row)
    csvout(HERE/'analysis/diagnostic_comparison.csv',wide)
    memory=[]
    for c in sorted({r['case'] for r in mem}):
        row=dict(case=c,unit='KiB',sample_size_each=3)
        for v in VERSIONS:
            r=next(r for r in mem if r['case']==c and r['variant']==v)
            for k,val in r.items():
                if k not in ['case','variant']:row[v+'_'+k]=val
        memory.append(row)
    csvout(HERE/'analysis/memory_comparison.csv',memory);print('SUPPLEMENTARY_PASS',flush=True)
if __name__=='__main__':main()
