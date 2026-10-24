"""Portable derived tables/figures only. Explicit LF via common.csvout."""
import collections,html,math,statistics as st
from common import *
def load(name):
    with (HERE/'analysis'/name).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
def figure(rows,name,title):
    lo=min(.99,min(float(r['execution_CD_CI_low']) for r in rows)-.01)
    hi=max(1.01,max(float(r['execution_CD_CI_high']) for r in rows)+.01)
    left,width=275,580;x=lambda v:left+(float(v)-lo)/(hi-lo)*width
    height=100+len(rows)*34
    s=[f'<svg xmlns="http://www.w3.org/2000/svg" width="1020" height="{height}">',
       '<rect width="100%" height="100%" fill="white"/>',f'<text x="12" y="24" font-size="16" font-family="sans-serif">{html.escape(title)}</text>',
       f'<line x1="{x(1)}" x2="{x(1)}" y1="40" y2="{height-50}" stroke="gray" stroke-dasharray="5 4"/>']
    for i,r in enumerate(rows):
        y=58+i*34
        s.extend([f'<text x="12" y="{y+5}" font-size="13" font-family="sans-serif">{html.escape(r["case"])}</text>',
          f'<line x1="{x(r["execution_CD_CI_low"])}" x2="{x(r["execution_CD_CI_high"])}" y1="{y}" y2="{y}" stroke="black" stroke-width="2"/>',
          f'<circle cx="{x(r["execution_CD_speedup"])}" cy="{y}" r="4" fill="#24465a"/>',
          f'<text x="885" y="{y+5}" font-size="13">{float(r["execution_CD_speedup"]):.4f}</text>'])
    s.append(f'<line x1="{left}" x2="{left+width}" y1="{height-45}" y2="{height-45}" stroke="black"/>')
    for k in range(6):
        v=lo+(hi-lo)*k/5;s.append(f'<text x="{x(v)-15}" y="{height-23}" font-size="12">{v:.3f}</text>')
    s.append('</svg>');save(HERE/'analysis'/name,'\n'.join(s)+'\n')
def main():
    summary=load('summary.csv');dd=load('diagnostic_summary.csv');mem=load('memory.csv')
    csvout(HERE/'analysis/end_to_end.csv',[{k:v for k,v in r.items() if k in ['case','N','A_n','C_n','D_n'] or k.startswith('e2e_')} for r in summary])
    ds={(r['case'],r['variant']):r for r in dd};ms={(r['case'],r['variant']):r for r in mem}
    wide=[];memory=[];mismatch=[];targets=[]
    for case in CASES:
        r={'case':case,'scope':'whole process; function+atom units; rewritten IC only'}
        for v in ['C','D']:
            for k,val in ds[case,v].items():
                if k not in ['case','variant']:r[v+'_'+k]=val
        diff=[k for k in ds[case,'C'] if k not in ['case','variant','hit_fraction','probes_per_query'] and ds[case,'C'][k]!=ds[case,'D'][k]]
        mismatch.append(dict(case=case,different_fields=diff,all_summary_counters_equal=not diff,interpretation='inputs/GC/dynamic code may differ; no alteration to align'))
        wide.append(r)
        if case in MICRO_CASES:
            from micros import TARGETS
            for v in ['C','D']:
                d=read(HERE/'raw/diagnostic'/f'{case}.{v}.json.gz')
                for u in d['units_detail']:
                    fn=bytes.fromhex(u['function_hex']).decode(errors='replace');atom=bytes.fromhex(u['atom_hex']).decode(errors='replace')
                    if fn in TARGETS[case]:targets.append(dict(case=case,variant=v,function=fn,atom=atom,**{k:u[k] for k in ['read_queries','read_hits','read_fallback','write_queries','write_hits','write_fallback','probes','max_filled_slots']}))
        if case in OCTANE_CASES:
            r={'case':case,'unit':'KiB','measurement':'separate GNU time, 3 fresh processes/version'}
            for v in VERSIONS:
                for k in ['n','median_KiB','min_KiB','max_KiB','values_KiB']:r[v+'_'+k]=ms[case,v][k]
            r['D_vs_C_peak_change_pct']=(float(ms[case,'D']['median_KiB'])/float(ms[case,'C']['median_KiB'])-1)*100;memory.append(r)
    csvout(HERE/'analysis/diagnostic_comparison.csv',wide);csvout(HERE/'analysis/memory_comparison.csv',memory)
    csvout(HERE/'analysis/micro_target_units.csv',targets);save(HERE/'analysis/counter_comparison.json',mismatch)
    figure([r for r in summary if r['case'] in OCTANE_CASES],'octane_CD_CI.svg','Octane: C/D ratio of medians, paired 95% CI (>1: D faster); zoomed axis')
    figure([r for r in summary if r['case'] in MICRO_CASES],'micros_CD_CI.svg','Micros: separate complete-call C/D ratios, paired 95% CI (>1: D faster)')
    lines=['# 同批次A/C/D执行时间','',
      '单位ms/完整Run；微基准每Run有4096轮。每项每版30新进程；首次Run在内、无额外预跑。',
      'C/D>1表示D快；变化率为(D/C−1)×100%。95%CI为10000组三元组配对bootstrap，探索性逐项区间。','',
      '| 项目 | N | A ms | C ms | D ms | C/D [95% CI] | D/C时间变化 | A/D [95% CI] |',
      '|---|---:|---:|---:|---:|---|---:|---|']
    for r in summary:
        f=lambda k:float(r[k])
        lines.append(f'| {r["case"]} | {r["N"]} | {f("execution_A_median"):.6f} | {f("execution_C_median"):.6f} | {f("execution_D_median"):.6f} | {f("execution_CD_speedup"):.4f} [{f("execution_CD_CI_low"):.4f},{f("execution_CD_CI_high"):.4f}] | {f("execution_CD_right_time_change_pct"):+.2f}% | {f("execution_AD_speedup"):.4f} [{f("execution_AD_CI_low"):.4f},{f("execution_AD_CI_high"):.4f}] |')
    lines.extend(['','完整A/C及各变化率CI、样本数见summary.csv；描述统计见statistics.csv。',
      'Micro不进GM；Crypto受限项不进主GM；未支持项见coverage.csv。不是官方Octane总分。'])
    save(HERE/'analysis/tables.md','\n'.join(lines)+'\n');print('SUPPLEMENTARY_DATA_ONLY_PASS',flush=True)
if __name__=='__main__':main()
