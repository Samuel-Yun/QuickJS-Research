"""Portable raw-only recomputation: never opens a runtime or Linux build path."""
import argparse
import collections
import csv
import json
import math
import random
import statistics
from pathlib import Path
from run import HERE,read,save,sha,csvout

CASES=['prototype_method','own_method','own_integer','numeric_control','Richards.Richards']
CONDS=['A','M','H']
RATIOS=[('H','M'),('H','A'),('M','A')]
SEED=20261029


def quantile(values,p):
    a=sorted(values);i=(len(a)-1)*p;lo=math.floor(i);hi=math.ceil(i)
    return a[lo]+(a[hi]-a[lo])*(i-lo)


def describe(values):
    a=sorted(values);n=len(a);assert n and all(math.isfinite(x) and x>0 for x in a)
    half=n//2
    q1=statistics.median(a[:half]) if half else a[0]
    q3=statistics.median(a[n-half:]) if half else a[-1]
    return dict(n=n,median=statistics.median(a),Q1=q1,Q3=q3,IQR=q3-q1,mean=statistics.mean(a),sample_stddev=statistics.stdev(a) if n>1 else None,min=a[0],max=a[-1])


def main(out):
    assert not out.exists(),'select a fresh output directory'
    frozen=read(HERE/'campaign_frozen.json');schedule=read(HERE/'schedule.json')
    assert len(schedule)==450
    for name,h in frozen['files'].items():assert sha(HERE/name)==h, name
    for name,h in frozen['script_hashes'].items():assert sha(HERE/name)==h,name
    # Schedule checks use all planned positions, never fabricate missing raw.
    import itertools
    for case in CASES:
        perms=collections.Counter()
        for block in range(30):
            x=sorted([r for r in schedule if r['case']==case and r['block']==block],key=lambda r:r['position'])
            assert len(x)==3;perms[tuple(r['condition'] for r in x)]+=1
        assert set(perms)==set(itertools.permutations(CONDS)) and set(perms.values())=={5}
        assert collections.Counter(r['case_position'] for r in schedule if r['case']==case and r['position']==0)=={i:6 for i in range(5)}
        for c in CONDS:
            assert collections.Counter(r['position'] for r in schedule if r['case']==case and r['condition']==c)=={i:10 for i in range(3)}
    planned={(r['block'],r['case'],r['condition']):r for r in schedule}
    actual={};rows=[];invalid=[]
    for p in sorted((HERE/'raw/formal').rglob('*.json')):
        r=read(p);key=r['block'],r['case'],r['condition']
        assert key in planned and key not in actual,key
        s=planned[key];a=read(HERE/'frozen_runtime.json')['artifacts'][r['condition']]
        assert r['N']==s['N'] and r['position']==s['position'] and r['binary_sha256']==a['sha256']
        assert r['flags']==[]
        # command path is original Linux provenance, not a file opened by this analysis.
        assert r['command'][0]==a['path'] and len(r['command'])==2
        assert r['command'][1].replace('\\','/').endswith('/'+r['script_relative'])
        assert sha(HERE/r['script_relative'])==r['script_sha256']
        assert r['boot_id']==frozen['boot_id']
        if r['valid']:
            d=r['payload'];e=r['elapsed_ms']
            assert r['exit_code']==0 and not r['stderr'] and not r['timeout']
            assert d['correctness']=='PASS' and d['warmup_calls']==0 and d['N']==r['N']
            assert e>0 and math.isfinite(e) and e==d['stop_ms']-d['start_ms']
            assert r['elapsed_per_Run_ms']==e/r['N'] and e<=r['outer_wall_ns']/1e6+5
            if r['case']!='Richards.Richards':
                expected=dict(prototype_method=8390656,own_method=8390656,own_integer=12288,numeric_control=8386560)[r['case']]
                assert d['last']==expected and d['checksum']==r['N']*expected
        else:invalid.append(dict(block=r['block'],case=r['case'],condition=r['condition'],reason=r.get('failed_reason')))
        actual[key]=r
        rows.append(dict(block=r['block'],case=r['case'],condition=r['condition'],N=r['N'],position=r['position'],valid=r['valid'],elapsed_ms=r['elapsed_ms'],elapsed_per_Run_ms=r['elapsed_per_Run_ms'],external_wall_ms=r['outer_wall_ns']/1e6,raw_relative=p.relative_to(HERE).as_posix(),raw_sha256=sha(p)))
    complete=[b for b in range(30) if all((b,case,c) in actual and actual[b,case,c]['valid'] for case in CASES for c in CONDS)]
    summary=[]
    for case in CASES:
        for c in CONDS:
            rr=[r for (b,k,v),r in actual.items() if k==case and v==c and r['valid']]
            if not rr:continue
            for metric in ['internal_ms_per_Run','external_ms_per_process']:
                vals=[r['elapsed_per_Run_ms'] if metric.startswith('internal') else r['outer_wall_ns']/1e6 for r in rr]
                summary.append(dict(case=case,condition=c,metric=metric,N=rr[0]['N'],**describe(vals)))
    ratios=[]
    if complete:
        rng=random.Random(SEED)
        draws=[[rng.choice(complete) for _ in complete] for _ in range(10000)]
        # The SAME 15-process block draws are shared by all cases and ratios.
        for metric in ['internal_ms_per_Run','external_ms_per_process']:
            def value(r):return r['elapsed_per_Run_ms'] if metric.startswith('internal') else r['outer_wall_ns']/1e6
            for case in CASES:
                med={c:statistics.median(value(actual[b,case,c]) for b in complete) for c in CONDS}
                sampled={c:[statistics.median(value(actual[b,case,c]) for b in draw) for draw in draws] for c in CONDS}
                for num,den in RATIOS:
                    bs=[x/y for x,y in zip(sampled[num],sampled[den])]
                    lo,hi=quantile(bs,.025),quantile(bs,.975);point=med[num]/med[den]
                    ratios.append(dict(case=case,metric=metric,ratio=num+'/'+den,point=point,CI95_low=lo,CI95_high=hi,time_change_percent=100*(point-1),CI95_change_low=100*(lo-1),CI95_change_high=100*(hi-1),complete_15_process_blocks=len(complete),bootstrap_draws=10000,seed=SEED,
                          direction='numerator_faster' if hi<1 else 'numerator_slower' if lo>1 else 'unclear'))
    csvout(out/'raw_index.csv',rows)
    if summary:csvout(out/'summary.csv',summary)
    if ratios:csvout(out/'ratios.csv',ratios)
    missing=[dict(block=b,case=case,condition=c) for (b,case,c) in planned if (b,case,c) not in actual]
    save(out/'missing_invalid.json',dict(missing=missing,invalid=invalid))
    groups={case:{c:sum(r['valid'] for (b,k,v),r in actual.items() if k==case and v==c) for c in CONDS} for case in CASES}
    audit=dict(status='PASS' if len(rows)==450 and not invalid and len(complete)==30 else 'INCOMPLETE',
       expected=450,actual=len(rows),valid=sum(r['valid'] for r in actual.values()),invalid=len(invalid),missing=len(missing),
       complete_15_process_blocks=len(complete),counts_by_group=groups,schedule_permutations='PASS',case_positions='PASS',
       commands_flags_hashes='PASS',payload_correctness='PASS',one_formal_boot='PASS',all_outliers_retained=True,
       below_1000ms_formal=sum(r['valid'] and r['elapsed_ms']<1000 for r in actual.values()),
       raw_only=True,no_runtime_paths_opened=True,confidence_intervals='exploratory percentile; whole-block paired; no multiple-testing correction')
    save(out/'audit.json',audit)
    lines=['# 同批 A/M/H 点估计与探索区间','',
      '内部单位：ms/完整 Run。方法小例子每 Run 有 4096 轮；Richards 为完整原始 Run。',
      'H/M、H/A、M/A < 1 表示分子更快；变化率 = 100 × (ratio − 1)。',
      'Q1/Q3：排序后上下半段中位数；n 为奇数时不含中间值。所有有效样本用于描述统计。','',
      '|案例|N|A median|M median|H median|H vs M 耗时变化 [95%区间]|H vs A 耗时变化 [95%区间]|',
      '|---|---:|---:|---:|---:|---|---|']
    for case in CASES:
        ss={c:next((x for x in summary if x['case']==case and x['condition']==c and x['metric']=='internal_ms_per_Run'),None) for c in CONDS}
        if not all(ss.values()):continue
        rr={r['ratio']:r for r in ratios if r['case']==case and r['metric']=='internal_ms_per_Run'}
        def ci(k):
            if k not in rr:return 'UNKNOWN'
            r=rr[k];return f'{r["time_change_percent"]:+.2f}% [{r["CI95_change_low"]:+.2f}, {r["CI95_change_high"]:+.2f}]'
        lines.append(f'|{case}|{ss["A"]["N"]}|{ss["A"]["median"]:.6f}|{ss["M"]["median"]:.6f}|{ss["H"]["median"]:.6f}|{ci("H/M")}|{ci("H/A")}|')
    lines+=['',f'实际 {audit["actual"]}/{audit["expected"]}；有效 {audit["valid"]}；完整轮 {len(complete)}。',
      '内部与端到端分开，不通过相减中位数估初始化时间。不计算 GM 或总体引擎排名。']
    save(out/'table.md','\n'.join(lines)+'\n')
    print(json.dumps(audit,ensure_ascii=False,indent=2))


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True);a=p.parse_args();main(a.output)
