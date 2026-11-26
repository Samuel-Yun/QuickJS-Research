"""Time and count tables for three input patterns; never time counters."""
import csv
import json
from pathlib import Path
import statistics

from build import HERE,save
from run import PATTERNS,LABELS,N,REPEATS

NAMES={'NORMAL':'原版 SPARSE','KEEP_PLAN':'保留旧正计划','TWICE':'连续两次失配再学习'}
PNAMES={'alternating':'C/D 交替','all_c':'全 C','c_then_d':'先 C 后 D'}
def rows(phase):return [r for r in map(json.loads,(HERE/'raw'/phase/'runs.jsonl').read_text().splitlines()) if r['event']=='sample']
def csvout(path,data):
    with path.open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(data[0]));w.writeheader();w.writerows(data)
def main():
    timed=rows('measure');diagnostic=rows('counts');assert len(timed)==45 and len(diagnostic)==9
    assert all(r['valid'] for r in timed+diagnostic)
    assert all(r['mode']=='release' for r in timed)
    summary=[];phases=[]
    for pattern in PATTERNS:
        for label in LABELS:
            t=[r for r in timed if r['pattern']==pattern and r['label']==label];assert len(t)==REPEATS
            values=[r['elapsed_ms'] for r in t]
            c=next(r['counts'] for r in diagnostic if r['pattern']==pattern and r['label']==label)
            summary.append(dict(pattern=pattern,label=label,iterations=N,processes=len(t),
                median_ms=statistics.median(values),min_ms=min(values),max_ms=max(values),
                calls=c['total_calls'],hits=c['four'][1],hit_pct=100*c['four'][1]/c['total_calls'],
                updates=c['four'][3],ordinary=c['normal_constructions'],identity_bypasses=c['identity_bypasses'],
                recipe_entries=sum(c['recipe'])))
            if pattern=='c_then_d':
                for i,key in enumerate(['C','D']):
                    vals=[r['payload'][key+'_ms'] for r in t]
                    four=c['phase_'+key+'_four']
                    phases.append(dict(label=label,phase=key,iterations=N//2,
                        median_ms=statistics.median(vals),min_ms=min(vals),max_ms=max(vals),
                        hits=four[1],hit_pct=100*four[1]/c['phase_calls'][i],updates=four[3],
                        ordinary=c['phase_normal'][i],identity_bypasses=c['phase_skips'][i]))
    def get(pattern,label):return next(s for s in summary if s['pattern']==pattern and s['label']==label)
    comparisons={}
    for pattern in PATTERNS:
        m=get(pattern,'TWICE')['median_ms']
        comparisons[pattern]=dict(vs_SPARSE_pct=100*(m/get(pattern,'NORMAL')['median_ms']-1),
            vs_KEEP_pct=100*(m/get(pattern,'KEEP_PLAN')['median_ms']-1),
            KEEP_vs_SPARSE_pct=100*(get(pattern,'KEEP_PLAN')['median_ms']/get(pattern,'NORMAL')['median_ms']-1))
    d={r['label']:r for r in phases if r['phase']=='D'}
    phase_D_change=100*(d['TWICE']['median_ms']/d['NORMAL']['median_ms']-1)
    out=HERE/'analysis';out.mkdir(exist_ok=True)
    csvout(out/'summary.csv',summary);csvout(out/'switch_phases.csv',phases)
    raw=[]
    for r in timed:
        raw.append(dict(pattern=r['pattern'],label=r['label'],rep=r['rep'],iterations=r['iterations'],
            elapsed_ms=r['elapsed_ms'],C_ms=r['payload'].get('C_ms',''),D_ms=r['payload'].get('D_ms',''),checksum=r['payload']['checksum']))
    csvout(out/'samples.csv',raw)
    counts=[]
    for r in diagnostic:
        c=r['counts'];counts.append(dict(pattern=r['pattern'],label=r['label'],
            total_calls=c['total_calls'],positive_attempts=c['four'][0],positive_hits=c['four'][1],
            positive_updates=c['four'][3],ordinary=c['normal_constructions'],identity_bypasses=c['identity_bypasses'],
            recipe_entries=sum(c['recipe']),prototype_queries=sum(c['prototype']),
            chain_checks=sum(c['chain']),descriptor_queries=sum(c['chain_descriptors']),empty_shape_queries=sum(c['empty_shape_search']),
            first_C_hit=c['first_hit'][0],first_D_hit=c['first_hit'][1],first_D_update=c['first_update'][1],
            hit_reset_writes=c['hit_reset_writes'],other_reset_writes=c['other_reset_writes'],
            learning_reset_writes=c['learning_reset_writes'],increment_writes=c['increment_writes'],threshold_allows=c['threshold_allows']))
    csvout(out/'counts.csv',counts)
    save(out/'data.json',dict(summary=summary,switch_phases=phases,comparisons=comparisons,
        switch_D_vs_SPARSE_pct=phase_D_change,counts=diagnostic))
    trace=[]
    for r in diagnostic:
        if r['pattern']!='c_then_d':continue
        c=r['counts']
        for i,flag in enumerate(c['trace_D_flags']):
            trace.append(dict(label=r['label'],D_call=i+1,
                outcome='hit' if flag&1 else 'ordinary',update=bool(flag&4),
                suppressed_learning=bool(flag&8),threshold_allows=bool(flag&16),
                counter_before=c['trace_D_before'][i] if r['label']=='TWICE' else '',
                counter_after=c['trace_D_after'][i] if r['label']=='TWICE' else ''))
    csvout(out/'switch_trace.csv',trace)
    text=['# 连续两次身份失配后再学习', '',
        '从原 SPARSE 独立派生 TWICE：先执行原四构造缓存尝试。只有失败且已有正计划、构造器身份不同时，'
        '增加连续失配计数（饱和到 2）。第一次只普通构造，第二次起允许走原资格检查/学习；'
        '成功学习后清零。命中或同目标的其它检查失败会打断连续身份失配，计数非零才清零。', '',
        '计数器占原 FourSite 尾部 padding 的 1 字节（offset 30），记录仍 32 B，FullPlan 仍 96 B，'
        '没有加槽、待学习目标引用、额外分配或新 opcode。原 plan_try 的检查与构造体不改。', '',
        '## 同批次时间与独立计数', '',
        '每格时间为 5 个新进程未插桩 Release 中位数，方括号是全部最小～最大，单位秒。'
        '正命中率、更新次数来自独立计数进程，分母是全部构造调用。', '',
        '| 输入 | 版本 | 时间 [范围] 秒 | 正命中率 | 正计划建立/更新次数 |',
        '|---|---|---:|---:|---:|']
    for r in summary:
        text.append(f'| {PNAMES[r["pattern"]]} | {NAMES[r["label"]]} | {r["median_ms"]/1000:.4f} '
            f'[{r["min_ms"]/1000:.4f}, {r["max_ms"]/1000:.4f}] | {r["hit_pct"]:.8f}% | {r["updates"]:,} |')
    text += ['', '| 输入 | 新版相对原 SPARSE | 新版相对保留旧计划版 |', '|---|---:|---:|']
    for pattern in PATTERNS:
        c=comparisons[pattern]
        text.append(f'| {PNAMES[pattern]} | {c["vs_SPARSE_pct"]:+.2f}% | {c["vs_KEEP_pct"]:+.2f}% |')
    text += ['', '负数耗时降低，正数耗时增加；没有运行全集。', '', '## 交替时是否仍反复学习', '']
    for label in LABELS:
        c=next(r['counts'] for r in diagnostic if r['pattern']=='alternating' and r['label']==label)
        text.append(f'- {NAMES[label]}：正命中 {c["four"][1]:,}，建立/更新 {c["four"][3]:,}，'
            f'模板解析 {sum(c["recipe"]):,}，达到连续两次门槛 {c["threshold_allows"]:,}。')
    text += ['', '新版在 C/D 交替时只写入一次正计划，后续命中会打断一次身份失配，达不到两次门槛。'
        '本输入先成功学到的是 D，因此保留 D、C 普通构造；没有按名字启用策略。', '',
        '## 切到 D 后，几次恢复', '',
        '| 版本 | D 首次学习/更新是第几次调用 | D 首次正命中是第几次调用 |', '|---|---:|---:|']
    for r in diagnostic:
        if r['pattern']!='c_then_d':continue
        c=r['counts']
        text.append(f'| {NAMES[r["label"]]} | {c["first_update"][1] or "没有"} | {c["first_hit"][1] or "没有"} |')
    text += ['', '| 新版 D 调用 | 计数进入→离开 | 普通构造/正命中 | 本次学习 |', '|---:|---|---|---|']
    for r in trace:
        if r['label']!='TWICE' or r['D_call']>4:continue
        text.append(f'| {r["D_call"]} | {r["counter_before"]}→{r["counter_after"]} | '
            f'{"正命中" if r["outcome"]=="hit" else "普通构造"} | {"是" if r["update"] else "否"} |')
    text += ['', '切换输入每段 N/2，调用同一个 ctorLoop，静态 new 位点始终 pc=18；'
        '没有改变循环体，三版的 JS 和参数完全相同。', '',
        '| 版本 | 阶段 | 时间中位数 [范围] 秒 | 正命中率 | 更新次数 |', '|---|---|---:|---:|---:|']
    for r in phases:
        text.append(f'| {NAMES[r["label"]]} | {r["phase"]} | {r["median_ms"]/1000:.4f} '
            f'[{r["min_ms"]/1000:.4f}, {r["max_ms"]/1000:.4f}] | {r["hit_pct"]:.8f}% | {r["updates"]:,} |')
    text += ['', f'新版 D 段相对原 SPARSE 的时间变化：{phase_D_change:+.2f}%。', '',
        '## 全 C：零计数时是否仍然写', '',
        '| 版本 | 正命中次数 | 失配计数增加写入 | 命中清零写入 | 学习清零写入 |', '|---|---:|---:|---:|---:|']
    for r in diagnostic:
        if r['pattern']!='all_c':continue
        c=r['counts']
        text.append(f'| {NAMES[r["label"]]} | {c["four"][1]:,} | {c["increment_writes"]:,} | '
            f'{c["hit_reset_writes"]:,} | {c["learning_reset_writes"]:,} |')
    text += ['', '前两个对照版本没有这个计数器，写入项为 0。新版全 C 的命中路径清零写入也为 0。'
        '另外核对了 Release 汇编：先 cmpb 检查 offset 30 的字节，零值通过 je 跳过 movb 清零指令。'
        '证据在 assembly/hit_reset.txt。仍有零值判断和分支等额外工作。'
        f'本批全 C：保留旧计划版相对原版 {comparisons["all_c"]["KEEP_vs_SPARSE_pct"]:+.2f}%，'
        f'新版 {comparisons["all_c"]["vs_SPARSE_pct"]:+.2f}%；回退缩小但未完全消除。', '',
        '## 验证与范围', '',
        'gate 对照 setter、只读字段、原型替换、目标切换、异常和非法构造目标；'
        'policy_probe 额外验证：一次身份失配后，同一构造器因 setter 检查失败，会清掉连续失配计数并走原普通构造。'
        '随后 D 的第一次身份失配仍须等待，第二次才学习，下一次命中。输出与两个对照一致。', '',
        f'三份输入及总 N={N:,}、每段 N/2、CPU 2、上海时区、C locale、首次 Run 计入、无额外预热等均沿用前轮。'
        '两个对照复用已验证的 Release 二进制，45 个时间全部本轮新进程，没有沿用旧时间。9 个计数进程独立运行。'
        '所有样本包括慢点均保留，不自动增加轮数。', '',
        'TWICE.release.patch 相对原 SPARSE，只改 quickjs.c 和 four_runtime.inc。'
        'analysis/samples.csv 是 45 个时间；summary.csv 为主表；switch_phases.csv 为分段时间；'
        'switch_trace.csv 为 D 前 8 次调用轨迹；counts.csv 为工作量及状态写入计数。'
        '原始输出在 raw/，复现见 REPRODUCE.md。', '']
    (HERE/'results.md').write_text('\n'.join(text))
    print(json.dumps(dict(comparisons=comparisons,switch_D_vs_SPARSE_pct=phase_D_change),indent=2),flush=True)
if __name__=='__main__':main()
