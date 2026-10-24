"""Aggregate counters, with denominators and no diagnostic timing claims."""
import collections
import csv
import json
from pathlib import Path
from prepare_sources import HERE,save
from run import SUPPORTED,csvout

FIELDS=['read_queries','write_queries','read_hits','write_hits','read_fallback','write_fallback',
        'read_nonobject','write_nonobject','probes','shape_hits','shape_misses','descriptor_fallback',
        'updates','replacements','insertions','update_probes']

def summarize(path,case):
    data=json.loads(path.read_text());units=data['units_detail'];tot={k:sum(d[k] for d in units) for k in FIELDS}
    for kind in ['read','write']:assert tot[kind+'_queries']==tot[kind+'_hits']+tot[kind+'_fallback']
    queries=tot['read_queries']+tot['write_queries'];hits=tot['read_hits']+tot['write_hits']
    row=dict(case=case,**tot,queries=queries,hits=hits,hit_fraction=hits/queries if queries else None,
        probes_per_IC_query=tot['probes']/queries if queries else None,
        compiled_functions_with_registry=data['initializations'],cache_units=data['units'],
        units_ever_filled=sum(d['max_filled_slots']>0 for d in units),
        maximum_filled_slots_in_one_unit=max((d['max_filled_slots'] for d in units),default=0),
        requested_bytes_diagnostic_layout=data['requested_bytes_diagnostic_layout'],
        peak_live_bytes_diagnostic_layout=data['peak_live_bytes_diagnostic_layout'],
        live_bytes_after_runtime_free=data['live_bytes_after_runtime_free'])
    enriched=[]
    for d in units:
        q=d['read_queries']+d['write_queries'];h=d['read_hits']+d['write_hits']
        enriched.append(dict(case=case,cache_id=d['cache_id'],atom_unit_index=d['slot'],
            function=bytes.fromhex(d['function_hex']).decode(errors='replace'),atom=bytes.fromhex(d['atom_hex']).decode(errors='replace'),
            queries=q,hits=h,hit_fraction=h/q if q else None,**{k:d[k] for k in FIELDS},max_filled=d['max_filled_slots']))
    return row,enriched

def main():
    totals=[];details=[]
    for case in SUPPORTED:
        row,units=summarize(HERE/'raw/diagnostic'/f'{case}.counters.json',case);totals.append(row);details+=units
    csvout(HERE/'analysis/diagnostic_summary.csv',totals)
    csvout(HERE/'analysis/diagnostic_units.csv',details)
    micros=[]
    for p in sorted((HERE/'raw/diagnostic_micro').glob('*.json')):
        row,units=summarize(p,p.stem);micros.append(row)
        csvout(HERE/'analysis'/f'micro_{p.stem}_units.csv',units)
    csvout(HERE/'analysis/diagnostic_micro_summary.csv',micros)
    # Only choose representatives after the formal table exists.
    with (HERE/'analysis/summary.csv').open() as f: formal=list(csv.DictReader(f))
    faster=[r for r in formal if r['direction']=='B faster'];slower=[r for r in formal if r['direction']=='B slower'];unclear=[r for r in formal if r['direction']=='direction unclear']
    picks={
        'largest_speedup':max(faster,key=lambda r:float(r['execution_A_over_B']))['case'] if faster else None,
        'largest_regression':min(slower,key=lambda r:float(r['execution_A_over_B']))['case'] if slower else None,
        'unclear_nearest_one':min(unclear,key=lambda r:abs(float(r['execution_A_over_B'])-1))['case'] if unclear else None}
    save(HERE/'analysis/representatives.json',picks)
    text=['# 独立诊断计数（不是正式性能样本）','',
      '范围：整个新JS进程，包括脚本、adapter、Setup、计时驱动、workload与验证/TearDown。不是仅timed region的统计。',
      '单位：每个compiled function + atom；同atom的多个site及读写共享。cache_id为进程内唯一编译实例，不跨进程对齐。',
      'queries仅含已经重写的IC opcode；首次普通opcode、未能重写的原型/getter等操作不计入queries。',
      'read/write queries = accepted hits + fallback；shape hit还须满足write descriptor guard，不能全部当成功写hit。',
      'probes为IC前置shape比较，update_probes是回退后更新扫描；不是native instructions。',
      'requested/peak live为诊断布局的IC malloc请求字节，不含libc malloc管理开销、shape间接保活或记录器内存，不是RSS，也不冒充正式A/B内存。',
      '未提供生命周期安全的全部shape多样性/超容量计数，记UNKNOWN。max_filled是实测已填槽数，不等于见过的shape数。','',
      '| 单元 | IC queries | accepted hit % | lookup probes/query | update probes | max filled |',
      '|---|---:|---:|---:|---:|---:|']
    for r in totals:
        text.append(f'| {r["case"]} | {r["queries"]} | {100*r["hit_fraction"]:.2f} | {r["probes_per_IC_query"]:.3f} | {r["update_probes"]} | {r["maximum_filled_slots_in_one_unit"]} |')
    text+=['','## 代表函数/atom（按查询数，不是耗时排名）']
    for label,case in picks.items():
        text+=['',f'### {label}: {case or "该类不存在"}']
        if case:
            for r in sorted((d for d in details if d['case']==case),key=lambda d:d['queries'],reverse=True)[:8]:
                fraction=f'{r["hit_fraction"]:.4f}' if r['hit_fraction'] is not None else 'N/A (zero queries)'
                text.append(f'- cache {r["cache_id"]}, function `{r["function"]}`, atom `{r["atom"]}`: queries={r["queries"]}, hit={fraction}, replacements={r["replacements"]}, max_filled={r["max_filled"]}.')
    save(HERE/'analysis/diagnostics.md','\n'.join(text)+'\n')
    print('DIAGNOSTIC_ANALYSIS_PASS',picks,flush=True)

if __name__=='__main__':main()
