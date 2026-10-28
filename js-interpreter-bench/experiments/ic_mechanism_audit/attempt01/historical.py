"""Recalculate four old A/P/M case medians from their own original campaign."""
import random,statistics
from common import *
from analyze import percentile
def main():
    cases=['Richards.Richards','M1.own_integer','M6.poly2','M7.poly4'];oldtable={r['case']:r for r in csv.DictReader((MIC/'analysis/summary.csv').open())}
    rows=[];evidence={};rng=random.Random(20261024)
    for case in cases:
        records=[read(p) for p in sorted((MIC/'raw/formal'/case).glob('*.json'))]
        assert len(records)==90 and all(r['valid'] for r in records)
        ix={(r['rep'],r['variant']):r for r in records};assert len(ix)==90
        arrays={v:[ix[(rep,v)]['elapsed_per_call_ms'] for rep in range(30)] for v in ['A','P','M']}
        row=dict(case=case,campaign='read_ic_mic/attempt01',date='2026-10-24',N=records[0]['N'],n_per_condition=30,unit='ms/complete Run; micro Run includes4096 inner iterations')
        for v,a in arrays.items():
            row[v+'_median_ms']=statistics.median(a)
            assert math.isclose(row[v+'_median_ms'],float(oldtable[case]['execution_'+v+'_median']),rel_tol=1e-12,abs_tol=1e-12)
        for a,b in [('A','M'),('P','M'),('A','P')]:
            estimates=[]
            for _ in range(10000):
                ids=[rng.randrange(30) for _ in range(30)];estimates.append(statistics.median(arrays[a][i] for i in ids)/statistics.median(arrays[b][i] for i in ids))
            key=a+'_over_'+b;row[key]=row[a+'_median_ms']/row[b+'_median_ms'];row[key+'_CI_low']=percentile(estimates,.025);row[key+'_CI_high']=percentile(estimates,.975)
            # Preserve prior reported interval too: old analyzer used a different
            # stream order over its complete 24-case matrix. Do not rewrite it.
            row[key+'_original_CI_low']=float(oldtable[case]['execution_'+a+b+'_CI_low']);row[key+'_original_CI_high']=float(oldtable[case]['execution_'+a+b+'_CI_high'])
        rows.append(row)
        evidence[case]=dict(raws={p.relative_to(ROOT).as_posix():sha(p) for p in sorted((MIC/'raw/formal'/case).glob('*.json'))},old_summary_sha256=sha(MIC/'analysis/summary.csv'),exact_medians_verified=True,recomputed_interval='10000 paired triples with seed20261024, 4-case order; exploratory; stream differs from original24-case analysis')
    csvout(HERE/'historical_APM.csv',rows);save(HERE/'historical_APM_identity.json',evidence)
    lines=['# 原 A/P/M 批次，非本轮采样','', '2026-10-24，read_ic_mic/attempt01；每格30新进程。单位ms/完整Run，微基准Run为4096轮。中位数由原raw复核。下面区间保留原完整24案例分析的10000次三元组探索性bootstrap；新4案例重算的流不同，另存CSV，不能冒充原区间。','',
           '|案例|A|P|M|A/M [原95%区间]|P/M [原95%区间]|','|---|---:|---:|---:|---|---|']
    for r in rows:lines.append(f'|{r["case"]}|{r["A_median_ms"]:.6f}|{r["P_median_ms"]:.6f}|{r["M_median_ms"]:.6f}|{r["A_over_M"]:.4f} [{r["A_over_M_original_CI_low"]:.4f}, {r["A_over_M_original_CI_high"]:.4f}]|{r["P_over_M"]:.4f} [{r["P_over_M_original_CI_low"]:.4f}, {r["P_over_M_original_CI_high"]:.4f}]|')
    lines += ['', 'P/M>1表示M更快；poly2/4的P/M<1。这里只交代同框架单槽与四槽研究过程，不与本轮时间相除，也不是总体引擎排名。']
    save(HERE/'historical_APM.md','\n'.join(lines)+'\n');print('OLD_MEDIANS_RAW_VERIFIED_NO_NEW_SAMPLING')
if __name__=='__main__':main()
