#!/usr/bin/env python3
"""Audit raw strict data before statistics; never edit old experiments/raw."""
from __future__ import annotations
from collections import Counter, defaultdict
import csv
import hashlib
import html
import json
import math
from pathlib import Path
import statistics

import run_strict as run

HERE, ROOT = run.HERE, run.ROOT

def write(path,text):
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(text,encoding='utf-8',newline='\n')

def csv_write(path,rows,fields):
    path.parent.mkdir(parents=True,exist_ok=True)
    with path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fields,extrasaction='ignore')
        writer.writeheader();writer.writerows(rows)

def gm(values):
    values=list(values)
    return math.exp(statistics.mean(map(math.log,values))) if values else None

def stats(values):
    ordered=sorted(values);half=len(ordered)//2
    upper=ordered[half+(len(ordered)%2):]
    mean=statistics.mean(values)
    std=statistics.stdev(values) if len(values)>1 else 0.0
    return dict(median=statistics.median(values),mean=mean,stddev=std,
        iqr=statistics.median(upper)-statistics.median(ordered[:half]) if half else 0.0,
        min=min(values),max=max(values),cv=std/mean)

def winners(values):
    ratios=list(values)
    return dict(suites=len(ratios),quickjs_lower=sum(x>1 for x in ratios),
        v8_lower=sum(x<1 for x in ratios),tie=sum(x==1 for x in ratios),ratio_geomean=gm(ratios))

def preservation():
    expected=dict(run.PROTECTED)
    expected['experiments/octane/raw/measurements.csv']='28e98f7f9574d396560de8fcdbf67bca5eb87a0b18834730621f358727c95c4a'
    expected['results/raw/sunspider.csv']='1e27d75a7d38ab48d5fd3a8b30b8d29b4c47b9ba648a9f080fd10ee3b968df82'
    return {name:dict(expected_sha256=value,actual_sha256=run.baseline.sha256(ROOT/name),
                     unchanged=run.baseline.sha256(ROOT/name)==value) for name,value in expected.items()}

def plot(suites,comparison=False):
    width=1060;height=105+len(suites)*42
    colors=('#8b9bab','#547f9d','#153c62')
    parts=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="white"/>',
        '<g font-family="Arial, sans-serif" font-size="14" fill="#173350">',
        '<text x="20" y="25" font-size="19">Octane: V8 / QuickJS median ratio (lower than 1 = V8 lower)</text>']
    names=('fixed_work_ratio','native_per_call_ratio','strict_interpreter_ratio') if comparison else ('ratio_v8_over_quickjs',)
    maxvalue=max(1.4,max(float(s[k]) for s in suites for k in names if s.get(k) is not None)*1.1)
    left,right=170,960;scale=(right-left)/maxvalue
    for tick in (0,0.25,0.5,0.75,1,1.25,1.5):
        if tick>maxvalue:continue
        x=left+tick*scale
        parts.append(f'<line x1="{x:.1f}" y1="60" x2="{x:.1f}" y2="{height-28}" stroke="{"#586572" if tick==1 else "#e5e9ec"}" stroke-dasharray="{"5 4" if tick==1 else "none"}"/>')
        parts.append(f'<text x="{x:.1f}" y="{height-8}" text-anchor="middle">{tick:g}</text>')
    if comparison:
        for x,color,label in zip((20,320,630),colors,('Fixed source-to-finish','Native internal per-call','Strict execution')):
            parts.append(f'<rect x="{x}" y="38" width="14" height="12" fill="{color}"/><text x="{x+22}" y="49">{label}</text>')
    for i,suite in enumerate(suites):
        y=68+i*42
        parts.append(f'<text x="155" y="{y+20}" text-anchor="end">{html.escape(suite["suite"])}</text>')
        for j,key in enumerate(names):
            value=suite.get(key)
            if value is None:continue
            by=y+(j*11 if comparison else 5);bh=9 if comparison else 24
            color=colors[j] if comparison else colors[2]
            parts.append(f'<rect x="{left}" y="{by}" width="{value*scale:.2f}" height="{bh}" fill="{color}"/>')
            if not comparison:parts.append(f'<text x="{left+value*scale+7:.2f}" y="{by+18}">{value:.3f}</text>')
    parts.append('</g></svg>\n')
    return '\n'.join(parts)

def main():
    run.require_gates()
    raw=run.read_csv(HERE/'raw/measurements.csv')
    cfg=run.config()
    plan=json.loads((HERE/'schedule.json').read_text(encoding='utf-8'))['samples']
    key=lambda r:(r['suite'],r['benchmark'],r['engine'],int(r['iteration']),int(r['N']))
    planned={key(r):r for r in plan}
    okay=[r for r in raw if r['valid']=='true']
    errors=[]
    counts=Counter(key(r) for r in okay)
    if any(c!=1 for c in counts.values()):errors.append('duplicate successful sample key')
    if any(key(r) not in planned for r in okay):errors.append('successful sample not in frozen schedule')
    missing=[p for k,p in planned.items() if counts[k]!=1]
    groups=defaultdict(list)
    for row in okay:
        try:
            expected=planned[key(row)]
            if int(row['execution_order'])!=expected['execution_order']:raise ValueError('execution order mismatch')
            elapsed=float(row['elapsed_ms']);n=int(row['N'])
            if not elapsed>0 or not math.isfinite(elapsed):raise ValueError('nonpositive duration')
            if float(row['elapsed_per_call_ms'])!=elapsed/n:raise ValueError('elapsed/N differs')
            if row['exit_code']!='0' or row['stderr']:raise ValueError('exit/stderr differs')
            expected_flags=' '.join(run.FLAGS) if row['engine']=='v8_ignition' else ''
            if row['flags']!=expected_flags or row['timer']!=cfg['timer']:raise ValueError('flags/timer differs')
            script=run.generated(row['suite'],row['benchmark'])
            if row['script_sha256']!=run.baseline.sha256(script):raise ValueError('script hash differs')
            recorded_command=json.loads(row['command'])
            payload='STRICT_CONFIG='+json.dumps(dict(N=n,mode='measure',timer=cfg['timer']),separators=(',',':'))
            expected_args=[str(script),*(['--'] if row['engine']=='v8_ignition' else []),payload]
            if recorded_command!=run.command(row['engine'],expected_args):
                raise ValueError('actual recorded command differs from frozen engine/flags/script/N')
            result=json.loads(row['stdout'].split('OCTANE_STRICT_RESULT:')[-1])
            if result['mode']!='measure' or result['correctness']!='PASS':raise ValueError('JS output differs')
            if result['N']!=n or result['elapsed_ms']!=elapsed:raise ValueError('JS/raw elapsed identity differs')
        except (ValueError,KeyError,TypeError) as error:
            errors.append(f'{key(row)}: {error}')
        groups[(row['suite'],row['benchmark'],row['engine'])].append(float(row['elapsed_per_call_ms']))
    selected=run.selected()
    cal=run.read_csv(HERE/'raw/calibration.csv')
    calibration_audit=[]
    for unit,n in selected.items():
        records=[r for r in cal if (r['suite'],r['benchmark'])==unit and int(r['N'])<=n]
        valid=(len(records)==n.bit_length() and sorted(int(r['N']) for r in records)==[2**i for i in range(n.bit_length())]
               and records[-1]['status']=='SELECTED' and float(records[-1]['quickjs_elapsed_ms'])>=1000
               and float(records[-1]['v8_elapsed_ms'])>=1000)
        valid=valid and all(r['status']=='BELOW_TARGET' and
            (float(r['quickjs_elapsed_ms'])<1000 or float(r['v8_elapsed_ms'])<1000) for r in records[:-1])
        calibration_audit.append(dict(suite=unit[0],benchmark=unit[1],N=n,passed=valid))
        if not valid:errors.append('minimal shared power-of-two calibration invalid: '+str(unit))
    preserved=preservation()
    if not all(r['unchanged'] for r in preserved.values()):errors.append('old experiment changed')
    correct=run.read_csv(HERE/'correctness.csv')
    goodcorrect={(r['suite'],r['benchmark'],r['engine'],int(r['N'])) for r in correct if r['status']=='PASS'}
    for suite,names in run.eligible().items():
        for name in names:
            for engine in run.ENGINES:
                for n in (1,2,selected[(suite,name)]):
                    if (suite,name,engine,n) not in goodcorrect:errors.append('correctness gate missing')
    suites_complete={s:bs for s,bs in run.eligible().items() if all(
        len(groups[(s,b,e)])==30 for b in bs for e in run.ENGINES)}
    compatibility=[]
    original=run.read_csv(ROOT/'experiments/octane/compatibility.csv')
    for row in original:
        suite=row['case']
        if suite in ('zlib','Box2D'):
            compatibility.append(dict(suite=suite,subbenchmarks='',quickjs_status=row['quickjs_status'],
                v8_status=row['v8_status'],strict_status='EXCLUDED_ORIGINAL',included='false',reason=row['reason']))
        elif suite in suites_complete:
            compatibility.append(dict(suite=suite,subbenchmarks='|'.join(run.BENCHMARKS[suite]),
                quickjs_status='PASS',v8_status='PASS',strict_status='PASS',included='true',
                reason='new frontend/tier/correctness/calibration/pilot gates; 30 valid samples per engine/subbenchmark'))
        else:
            compatibility.append(dict(suite=suite,subbenchmarks='|'.join(run.BENCHMARKS[suite]),
                quickjs_status='UNKNOWN',v8_status='UNKNOWN',strict_status='INCOMPLETE_OR_NOT_COMPARABLE',included='false',
                reason='incomplete strict gate/sample sequence; see failures.csv and audit missing positions; not silently discarded'))
    csv_write(HERE/'compatibility.csv',compatibility,('suite','subbenchmarks','quickjs_status','v8_status','strict_status','included','reason'))
    subrows=[];suite_rows=[]
    for suite,names in suites_complete.items():
        ratios=[];qmedians=[];vmedians=[]
        for name in names:
            q=stats(groups[(suite,name,'quickjs')]);v=stats(groups[(suite,name,'v8_ignition')])
            ratio=v['median']/q['median'];ratios.append(ratio);qmedians.append(q['median']);vmedians.append(v['median'])
            row=dict(suite=suite,benchmark=name,N=selected[(suite,name)],repetitions=30,
                ratio_v8_over_quickjs=ratio,winner='V8' if ratio<1 else 'QuickJS' if ratio>1 else 'TIE')
            row.update({'quickjs_'+k+'_ms_per_call':x for k,x in q.items() if k!='cv'})
            row['quickjs_cv']=q['cv']
            row.update({'v8_'+k+'_ms_per_call':x for k,x in v.items() if k!='cv'})
            row['v8_cv']=v['cv'];subrows.append(row)
        sr=dict(suite=suite,subbenchmark_count=len(names),quickjs_geomean_sub_medians_ms=gm(qmedians),
            v8_geomean_sub_medians_ms=gm(vmedians),ratio_v8_over_quickjs=gm(ratios))
        sr['winner']='V8' if sr['ratio_v8_over_quickjs']<1 else 'QuickJS' if sr['ratio_v8_over_quickjs']>1 else 'TIE'
        suite_rows.append(sr)
    if subrows:csv_write(HERE/'summary/strict_summary.csv',subrows,tuple(subrows[0]))
    if suite_rows:csv_write(HERE/'summary/suite_summary.csv',suite_rows,tuple(suite_rows[0]))
    old=run.read_csv(ROOT/'experiments/octane/summary.csv')
    old_by={(r['mode'],r['case']):float(r['ratio_v8_over_quickjs']) for r in old}
    strict_by={r['suite']:r['ratio_v8_over_quickjs'] for r in suite_rows}
    comparisons=[dict(suite=s,fixed_work_ratio=old_by[('fixed_source_to_finish',s)],
        native_per_call_ratio=old_by[('native_frontend_amortized',s)],
        strict_interpreter_ratio=strict_by.get(s),strict_status='PASS' if s in strict_by else 'INCOMPLETE') for s in run.BENCHMARKS]
    csv_write(HERE/'summary/three_mode_comparison.csv',comparisons,
        ('suite','fixed_work_ratio','native_per_call_ratio','strict_interpreter_ratio','strict_status'))
    mode_summary={
        'fixed_original13':winners(old_by[('fixed_source_to_finish',s)] for s in run.BENCHMARKS),
        'native_original13':winners(old_by[('native_frontend_amortized',s)] for s in run.BENCHMARKS),
        'strict':winners(strict_by.values()),
        'fixed_matched':winners(old_by[('fixed_source_to_finish',s)] for s in strict_by),
        'native_matched':winners(old_by[('native_frontend_amortized',s)] for s in strict_by),
    }
    sensitivity={label:dict(excluded_by_mechanism=list(excluded),included_suites=[s for s in strict_by if s not in excluded],
        **winners(r for s,r in strict_by.items() if s not in excluded))
        for label,excluded in (('narrow',run.SENSITIVITY_NARROW),('broad',run.SENSITIVITY_BROAD))}
    expected=len(plan)
    balanced=all(sum(planned[key(r)]['execution_order']%2==1 for r in okay if
        r['suite']==s and r['benchmark']==b and r['engine']==e)==15 for s,bs in suites_complete.items() for b in bs for e in run.ENGINES)
    if not balanced and not missing:errors.append('engine-first balance invalid')
    failed=run.read_csv(HERE/'raw/failures.csv')
    if not (HERE/'raw/failures.csv').exists():
        csv_write(HERE/'raw/failures.csv',[],run.FAILURE_FIELDS)
    below=sum(float(r['elapsed_ms'])<1000 for r in okay)
    audit=dict(status='PASS' if not errors and not missing and len(suites_complete)==13 else 'INCOMPLETE',
        timestamp=run.stamp(),strict_compatible_suites=len(suites_complete),
        strict_subbenchmarks=len(subrows),formal_valid_samples=len(okay),expected_samples=expected,
        original_candidate_expected_samples=16*2*30,raw_attempt_rows=len(raw),invalid_rows=len(raw)-len(okay),
        duplicate_valid_keys=[str(k) for k,v in counts.items() if v>1],missing_positions=missing,
        validation_errors=errors,all_groups_30=all(len(v)==30 for v in groups.values()),
        engine_first_15_each=balanced,formal_below_1000ms_retained=below,
        correctness_rows=len(correct),correctness_pass_rows=sum(r['status']=='PASS' for r in correct),
        calibration=calibration_audit,mode_summary=mode_summary,sensitivity=sensitivity,
        protected_old_artifacts=preserved,failures=len(failed),
        timer=cfg['timer'],flags=cfg['v8_flags'],seed=cfg['seed'],
        execution_aggregation='subbenchmark median ratio -> suite GM -> equal-suite overall GM',
        old_native_aggregation='per sample GM(subbenchmark time) -> engine median -> ratio; not commutable',
        raw_sha256=run.baseline.sha256(HERE/'raw/measurements.csv'),
        config_sha256=run.baseline.sha256(HERE/'config.json'),
        strict_summary_sha256=run.baseline.sha256(HERE/'summary/strict_summary.csv') if subrows else None)
    write(HERE/'summary/audit.json',json.dumps(audit,ensure_ascii=False,indent=2)+'\n')
    if suite_rows:
        write(HERE/'plots/ratio_by_suite.svg',plot(suite_rows))
        write(HERE/'plots/three_mode_ratio.svg',plot([c for c in comparisons if c['suite'] in strict_by],True))
    result=mode_summary['strict'];fixed=mode_summary['fixed_original13'];native=mode_summary['native_original13']
    fmt=lambda x:'UNKNOWN' if x is None else f'{x:.6f}'
    table='\n'.join(f'| {c["suite"]} | {c["fixed_work_ratio"]:.6f} | {c["native_per_call_ratio"]:.6f} | {fmt(c["strict_interpreter_ratio"])} |' for c in comparisons)
    subt='\n'.join(f'| {r["suite"]}/{r["benchmark"]} | {r["N"]} | {r["quickjs_median_ms_per_call"]:.6f} | {r["v8_median_ms_per_call"]:.6f} | {r["ratio_v8_over_quickjs"]:.6f} |' for r in subrows)
    changed=[c['suite'] for c in comparisons if c['suite'] in strict_by and
             (c['native_per_call_ratio']<1)!=(c['strict_interpreter_ratio']<1)]
    biggest=sorted((c for c in comparisons if c['suite'] in strict_by),
        key=lambda c:abs(math.log(c['strict_interpreter_ratio']/c['native_per_call_ratio'])),reverse=True)[:3]
    evidence='''- Frozen binaries/dependencies, Octane commit/upstream hashes: `config.json`, `environment.txt`; verified before and after sampling. Old artifacts hash preservation is in `audit.json`.
- Actual effective flags: `probes/v8_tier/flag_values/`; fresh 500,000-call probe: `probes/v8_tier/hot_trace/`, checksum1301262660; Sparkplug/Maglev/TurboFan/OSR all0, interpreted status333, plus `hot_bytecode/`. `--lazy-eval`, `--flush-bytecode`, `--no-regexp-interpret-all` remain effective; no claim that dynamic compilation, re-compilation, or regexp native execution is disabled.
- All16 actual Benchmark.run bytecode traces precede line-anchored timer markers: `probes/frontend_order/*.final/`. QuickJS recursive compilation source excerpts/hash: `probes/frontend_order/quickjs_source.txt`, `summary.json`. Dynamic eval is not claimed excluded.
- Timer native availability/resolution tests precede base.js fallback: `probes/timer/`. Common Date.now has1ms observed steps; QuickJS Windows performance.now uses gettimeofday, so its monotonic semantics are not presumed.
- Independent correctness N1/N2/selected: `correctness.csv`; original Run assertions and official post-region TearDown retained. No invented checksum; NavierStokes low-N reaches frame15 after timer; formal Encrypt validates last ciphertext after timer.
'''
    majority_statement=(f'V8 在 {result["v8_lower"]}/{result["suites"]} 个 suite 的聚合 median ratio 较低，方向与旧 Octane 主体一致。'
        if result['suites'] and result['v8_lower']>result['suites']/2 else
        f'已完成交集中 QJS/V8 lower 为 {result["quickjs_lower"]}/{result["v8_lower"]}，不能预设获胜方向。')
    results=f'''# Experiment definition

新增 **Octane strict interpreter-mode execution time**。每 sample 新进程，必需Setup一次在计时外；Date.now只包住官方 Benchmark.run × 校准N；第一次Run计入，不做性能warmup。
source loading/VM initialization/主要初次静态frontend在timer前；GC/helper/builtin/regexp、动态eval及Run原断言/统计仍在timed region。不是pure interpreter-loop self time。
正式单位16个subbenchmark；双engine相同脚本、相同N，V8固定`--max-opt=0 --no-lazy`。
特殊setup、状态及预先定义的敏感性名单见 `../harness_audit.md`。计时外 Crypto/Decrypt 输入生成可能预热共享RSA helper，不能称整体VM全冷。

# Evidence / gates

{evidence}
- Completeness audit **{audit['status']}**：{len(okay)}/{expected} valid，{len(suites_complete)} suites，{len(subrows)} subbenchmarks；原始候选预算960。{len(failed)}失败记录，{len(missing)}缺失位置，{len(errors)}审计错误。{below}正式样本低于校准目标仍保留；无outlier剔除。
- 统计：sample stddev n−1，Tukey median-of-halves IQR，CV=std/mean；ratio=V8 median/QJS median；subbenchmark ratio→suite GM→overall等suite权重GM。旧native先对sample内subtime取GM再取median，不完全可交换。

# Confirmed observations

只有已完成、已通过审计的suite参与数值表；审计不是PASS时，不宣称全部完成。
strict QJS lower **{result['quickjs_lower']}/{result['suites']}**，V8 lower **{result['v8_lower']}/{result['suites']}**，tie **{result['tie']}**，V8/QJS GM **{fmt(result['ratio_geomean'])}**。
旧Octane fixed **{fmt(fixed['ratio_geomean'])}**，native **{fmt(native['ratio_geomean'])}**；三模式原值保留（旧各10reps，新各30reps）。matched intersection汇总见audit.mode_summary，不以不同交集混比。
相对native获胜方向变化：{', '.join(changed) if changed else '无（对已完整strict交集）'}。
{majority_statement}
ratio相对native对数变化最大的3项：{'; '.join(c['suite']+' '+format(c['native_per_call_ratio'],'.6f')+' → '+format(c['strict_interpreter_ratio'],'.6f') for c in biggest)}。

| Suite | Fixed-work ratio | Native per-call ratio | Strict ratio |
|---|---:|---:|---:|
{table}

下表为各Run的median(ms/call)，多subbenchmark不会假装为一个整体函数；mean/std/IQR/min/max/CV完整未舍入数值见 `strict_summary.csv`。

| Suite/Benchmark | N | QJS median ms/Run | V8 median ms/Run | V8/QJS |
|---|---:|---:|---:|---:|
{subt}

敏感性（主结果不删specialized suite）：窄版预先排除RegExp/CodeLoad，{sensitivity['narrow']['suites']}suite，GM **{fmt(sensitivity['narrow']['ratio_geomean'])}**；宽版另排除Mandreel/Typescript，{sensitivity['broad']['suites']}suite，GM **{fmt(sensitivity['broad']['ratio_geomean'])}**。这些不是builtin占比测量，也不是替代主结果。
SunSpider strict既有结果QJS5/26、V8 21/26、GM0.544284。只比较方向、分布及定性一致性；suite结构不同，不相减估计frontend百分比。

# Possible explanations

UNKNOWN causal attribution：lazy compilation policy、warmup/IC状态、N和state progression、runtime行为及interpreter设计均可能影响模式差异；本次同时改变多个控制条件，没有独立消融实验，不能分配startup/frontend/warmup各自贡献。
RegExp/CodeLoad等机制可能影响ratio分布；机制敏感性不等于证明解释器dispatch是瓶颈。

# Unknowns

pure interpreter-loop self time、GC contribution、builtin contribution、regexp contribution、dynamic frontend contribution、IC/runtime state contribution全部 **UNKNOWN**。
未对每个正式Octane样本做tier tracing（会扰动计时）；来自冻结flags和全新hot probe，而非逐样本事件计数。潜在动态代码路径未逐调用追踪，不能由函数定义存在推断本次执行次数。
每个sample的CPU温度/实际频率/后台负载及墙钟调整精确影响UNKNOWN；power plan只记录一次。无统计显著性/跨主机泛化结论。
`--flush-bytecode`仍开启；是否在timed region因GC/code flushing发生再次编译及其成本 **UNKNOWN**，本次只证明主要初次静态编译顺序，不证明所有frontend活动绝对为零。更多潜在执行期动态路径及证据见 `../probes/frontend_order/dynamic_paths_addendum.md`。

# Limitations

Octane strict与SunSpider strict架构并不完全相同：Setup状态、Run颗粒度、嵌入式断言、typed arrays/browser mocks、运行期动态frontend、内建函数和regexp均不同。Date.now量化约1ms，1s目标仅降低量化相对尺度，不保证总误差≤0.1%。
Crypto rng_pool于脚本加载时初始化，ResetRNG不回填它；Decrypt必需ciphertext样本可能不同。Splay/NavierStokes状态持续演进，PDF logs随N积累；沿用upstream机制，不声称逐次状态完全相同。
原Encrypt仅独立correctness逐次decrypt，正式末次校验；NavierStokes仅frame15校验。全体PASS表示通过原验证机制，不是穷尽语义证明。
预定义敏感性子集仍保留Gameboy/PdfJS等潜在动态Function/eval路径，不是完全排除所有specialized workload的“净化”结果；不得称为pure interpreter时间。
旧native与新strict的median/GM聚合次序不同，旧suite共享进程/顺序，新每subbenchmark新进程；flags、warmup、预算一起变化。不能把差值直接解释为某一开销。
官方V8 artifact的精确source revision/toolchain细节仍继承baseline UNKNOWN；没有更新/重编译。zlib、Box2D仍排除，见compatibility.csv。

# Next step

仅建议在用户确认后做独立profiling与literature gap analysis；先分解GC/runtime/builtin/dynamic frontend与bytecode执行，再设计因果微基准。本任务不开始这些工作，也未发现或实施QuickJS优化点。
'''
    write(HERE/'summary/results.md',results)
    meeting=f'''# Octane strict：组会更新

状态：{audit['status']}；{len(suites_complete)} suites / {len(subrows)} subbenchmarks；{len(okay)}/{expected}有效正式samples。
QJS lower {result['quickjs_lower']}，V8 lower {result['v8_lower']}，tie {result['tie']}；V8/QJS GM {fmt(result['ratio_geomean'])}。
旧0.510 / 0.494 → strict {fmt(result['ratio_geomean'])}。

| Octane measurement | QJS lower | V8 lower | V8/QJS GM |
|---|---:|---:|---:|
| Fixed-work source-to-finish | {fixed['quickjs_lower']}/{fixed['suites']} | {fixed['v8_lower']}/{fixed['suites']} | {fixed['ratio_geomean']:.3f} |
| Native internal per-call | {native['quickjs_lower']}/{native['suites']} | {native['v8_lower']}/{native['suites']} | {native['ratio_geomean']:.3f} |
| Strict interpreter-mode | {result['quickjs_lower']}/{result['suites']} | {result['v8_lower']}/{result['suites']} | {fmt(result['ratio_geomean'])} |

谨慎结论：在提前完成主要静态frontend、不做性能warmup且JS限制在Ignition的当前Octane strict交集上，{majority_statement}不能据此归因于dispatch或计算frontend占比。
限制：仍包含GC/builtin/regexp/动态编译及运行期状态；不是纯interpreter-loop self time。旧模式10reps，新30reps，聚合次序及颗粒度略有不同。
'''
    write(HERE/'group_meeting_update.md',meeting)
    print(json.dumps({k:audit[k] for k in ('status','formal_valid_samples','expected_samples','strict_compatible_suites','strict_subbenchmarks','invalid_rows','missing_positions','validation_errors')},ensure_ascii=False,indent=2))
    print(json.dumps(mode_summary,indent=2))
    if audit['status']!='PASS':raise SystemExit(2)

if __name__=='__main__':main()
