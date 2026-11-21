"""Summarize only the two Release conditions; counters are separate evidence."""
import csv
import json
from pathlib import Path
import statistics

from build import HERE,ROOT,PARENT,sha,save

def rows(phase):
    return [r for r in map(json.loads,(HERE/'raw'/phase/'runs.jsonl').read_text().splitlines()) if r['event']=='sample']
def csvout(path,values):
    with path.open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(values[0]));w.writeheader();w.writerows(values)
def main():
    timed=rows('measure');counted=rows('counts');gate=rows('gate')
    assert len(timed)==10 and len(counted)==1 and len(gate)==8
    assert all(r['valid'] for r in timed+counted+gate)
    assert all(r['label'] in ['NORMAL','BYPASS'] for r in timed)
    stats=[]
    for label in ['NORMAL','BYPASS']:
        subset=[r for r in timed if r['label']==label];assert len(subset)==5
        values=[r['elapsed_ms'] for r in subset]
        stats.append(dict(label=label,iterations=subset[0]['iterations'],processes=5,
            median_ms=statistics.median(values),min_ms=min(values),max_ms=max(values),
            samples_ms=values))
    normal,bypass=stats
    overhead=100*(normal['median_ms']/bypass['median_ms']-1)
    reduction=100*(1-bypass['median_ms']/normal['median_ms'])
    n=normal['iterations'];counts=counted[0]['counts'];q,h=counts['four'][:2]
    assert q==n==counts['normal_constructions'] and h==0
    assert counts['four'][3]==n-1
    assert sum(counts['recipe'])==2*n-1
    assert counts['no_plan']+counts['identity_mismatch']==n
    out=HERE/'analysis';out.mkdir(exist_ok=True)
    csvout(out/'samples.csv',[dict(label=r['label'],rep=r['rep'],iterations=r['iterations'],
        elapsed_ms=r['elapsed_ms'],checksum=r['payload']['checksum']) for r in timed])
    csvout(out/'summary.csv',[{k:v for k,v in r.items() if k!='samples_ms'} for r in stats])
    stages=['fast_try','before_normal_qualification','after_normal_learning','negative_remember','ordinary_constructor']
    details=[]
    for key in ['recipe','base','prototype','chain','chain_descriptors','empty_shape_search']:
        details.append(dict(operation=key,**dict(zip(stages,counts[key])),total=sum(counts[key])))
    csvout(out/'work_counts.csv',details)
    result=dict(timing=stats,normal_vs_bypass_pct=overhead,bypass_vs_normal_reduction_pct=reduction,
        delta_ms=normal['median_ms']-bypass['median_ms'],
        delta_ns_per_iteration=(normal['median_ms']-bypass['median_ms'])*1e6/n,
        actual_count_build_hit_percent=100*h/q,counts=counts)
    save(out/'data.json',result)
    report=['# 构造 IC 零命中成本：正常组与直接普通构造组','',
        '结论来自同一批次未插桩 Release。两组都以冻结 SPARSE_CTOR_IC 为底座；'
        'BYPASS 只替换 OP_four_ctor 的 handler，仍保留构造位点准备/记录、属性读取 IC、'
        '读取融合、读写共享记录、冷准备和 C 的 shape 转换缓存。没有修改缓存策略或运行全集。','',
        '## 两组耗时','',
        '| 条件 | 5 次独立进程耗时（秒） | 中位数（秒） | 最小～最大（秒） |',
        '|---|---|---:|---:|']
    for s in stats:
        name='正常构造 IC' if s['label']=='NORMAL' else 'four_ctor 直接普通构造'
        report.append(f'| {name} | '+ ' / '.join(f'{v/1000:.4f}' for v in s['samples_ms'])+
            f' | {s["median_ms"]/1000:.4f} | {s["min_ms"]/1000:.4f}～{s["max_ms"]/1000:.4f} |')
    report += ['',f'正常组比直接普通构造组慢 **{overhead:.2f}%**，总计多 '
        f'**{result["delta_ms"]/1000:.4f} 秒**；换成旁路组，相对正常组少用 **{reduction:.2f}%** 时间。'
        f'每次循环平均多约 {result["delta_ns_per_iteration"]:.2f} ns；这是两组整段循环差值除以 N，不是逐函数计时。','',
        '## 输入和计时边界','',
        '逐字节复用 sparse_whitebox_20261116/attempt01/ctor.js，命令参数均为 '
        '`positive 0 67108864`。原脚本将两个构造函数命名为 A/B，对应本次所说的 C/D；'
        '两者都是 `function(x,a){this.x=x;this.a=a;}`，身份不同，共享原型、字段布局及实参。'
        '没有为了重命名而改 JS。长度 65,536 的预生成序列严格交替，唯一工作位点是 '
        '`ctorLoop` 的 `obj=new C(3,0)`。原脚本的 `new Array(length)` 位于 Setup，不算工作位点。','',
        f'N={n:,}，每进程校验和={3*n:,}；生成序列和结果校验在计时区间外。'
        'performance.now 计时整段 ctorLoop，无额外预热，首次调用计入；'
        '每组 5 个新进程，顺序 NORMAL/BYPASS、BYPASS/NORMAL 逐轮交换。'
        'CPU 2、Asia/Shanghai、LC_ALL/LANG=C。计时期间不编译、不并行运行其它测试。','',
        '## 正常组实际命中情况（独立计数进程）','',
        f'- 目标静态位点：ctorLoop，pc={counts["pc"]}，argc={counts["argc"]}，共一个位点。',
        f'- 查询 {q:,}；正命中 {h:,}；实际正命中率 **{100*h/q:.8f}%**。',
        f'- 普通构造 {counts["normal_constructions"]:,} 次；负缓存命中 {counts["negative_hits"]:,} 次。',
        f'- 尚无计划 {counts["no_plan"]:,} 次；已有计划但构造目标不同 {counts["identity_mismatch"]:,} 次。',
        f'- 成功学习/更新计划 {counts["four"][3]:,} 次。','',
        'COUNTS 不定义 FOUR_DIAG，不增加每点字段/日志指针，不改 FourSite/FullPlan、缓存策略或学习条件。'
        '通过 CTOR_PROBE_FUNCTION=ctorLoop 选择诊断范围，所有计数在这个位点内进行；'
        '计数版使用同一份 JS 和相同参数，时间不进入上表。','',
        '## 没命中后，正常组多执行了什么','',
        '| 工作 | 普通构造前的资格检查 | 普通构造后的学习 | 首次负记录检查 | 合计 |',
        '|---|---:|---:|---:|---:|']
    names={'recipe':'模板解析入口','base':'调用/类别/参数/栈/GC 条件检查',
           'prototype':'构造函数 prototype 数据属性查询','chain':'字段原型链资格检查',
           'chain_descriptors':'上述检查中的属性描述符查询','empty_shape_search':'空 shape 查询'}
    for d in details:
        report.append(f'| {names[d["operation"]]} | {d[stages[1]]:,} | {d[stages[2]]:,} | {d[stages[3]]:,} | {d["total"]:,} |')
    report += ['',
        '完整路径是：先尝试当前计划（本例大多在目标身份比较处失败），再查负缓存，'
        '做可学习性检查，然后仍执行普通构造；成功后再次解析模板、核对原型/布局/字段描述，'
        '更新 callee、shape 引用和 recipe。直接普通构造组跳过这些 IC 尝试、判型、学习与更新，'
        '保留参数/返回值所有权、原异常路径和栈清理。','',
        f'其中 {counts["initial_unchanged"]:,} 次更新的 initial shape、'
        f'{counts["final_unchanged"]:,} 次更新的 final shape 与原记录相同，原代码仍执行对应的引用更新。'
        '完整计划本身按需分配后复用；不能把每次计划更新说成每次都分配新的 FullPlan。','',
        '两种构造目标本身都符合模板，负缓存帮不上这个交替输入；'
        '单槽计划反复换成当前目标，下一次又换成另一个目标，导致零命中仍反复学习。'
        '这次只测这份代价，没有据此修改策略，也不能把整段差值全部归到某一个解析函数。','',
        '## 文件和复现','',
        '`BYPASS.patch` 是相对冻结 SPARSE 的唯一 Release 改动；`NORMAL.patch` 为空。'
        '`COUNTS.patch`、probe.inc/probe_site.inc 保存独立计数改动。'
        'manifest 保存每份源码和二进制哈希；raw/ 保留所有进程输出、时序和环境。'
        'analysis/samples.csv 为 10 个原始时间，summary.csv 为中位数/范围，'
        'work_counts.csv 为按阶段拆分的计数。复现命令见 REPRODUCE.md。','']
    (HERE/'results.md').write_text('\n'.join(report))
    print(json.dumps({k:v for k,v in result.items() if k not in ['counts','timing']},indent=2),flush=True)
if __name__=='__main__':main()
