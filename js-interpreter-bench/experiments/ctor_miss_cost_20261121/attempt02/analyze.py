"""Time and count tables for three input patterns; never time counters."""
import csv
import json
from pathlib import Path
import statistics

from build import HERE,save
from run import PATTERNS,LABELS,N,REPEATS

NAMES={'NORMAL':'原版 SPARSE','BYPASS':'直接普通构造','KEEP_PLAN':'保留旧正计划'}
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
        m=get(pattern,'KEEP_PLAN')['median_ms']
        comparisons[pattern]=dict(vs_SPARSE_pct=100*(m/get(pattern,'NORMAL')['median_ms']-1),
            vs_BYPASS_pct=100*(m/get(pattern,'BYPASS')['median_ms']-1))
    d={r['label']:r for r in phases if r['phase']=='D'}
    phase_D_change=100*(d['KEEP_PLAN']['median_ms']/d['NORMAL']['median_ms']-1)
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
            chain_checks=sum(c['chain']),descriptor_queries=sum(c['chain_descriptors']),empty_shape_queries=sum(c['empty_shape_search'])))
    csvout(out/'counts.csv',counts)
    save(out/'data.json',dict(summary=summary,switch_phases=phases,comparisons=comparisons,
        switch_D_vs_SPARSE_pct=phase_D_change,counts=diagnostic))
    text=['# 保留旧正计划：交替、稳定与换目标','',
        '本轮只增加 KEEP_PLAN：已有完整正计划且当前构造器身份不同时，跳过缓存尝试、模板解析和学习，'
        '直接调用原普通构造；不释放或覆盖旧计划。身份相同时继续执行原快路检查、回退与学习。'
        'FourSite/FullPlan、prepare/opcode 表示、所有权、GC 和其它优化不变。','',
        '## 同批次 Release 时间与独立计数','',
        '时间为每版每种输入 5 个新进程的中位数，括号内是全部最小～最大；单位秒。'
        '正命中率与更新次数来自独立计数进程，分母为所有构造调用，身份不同时直接普通构造不算命中。','',
        '| 输入 | 版本 | 时间 [范围] 秒 | 正命中率 | 计划更新次数 |',
        '|---|---|---:|---:|---:|']
    for s in summary:
        text.append(f'| {PNAMES[s["pattern"]]} | {NAMES[s["label"]]} | {s["median_ms"]/1000:.4f} '
            f'[{s["min_ms"]/1000:.4f}, {s["max_ms"]/1000:.4f}] | {s["hit_pct"]:.8f}% | {s["updates"]:,} |')
    text += ['', '| 输入 | 新版相对原 SPARSE 耗时 | 新版相对直接普通构造耗时 |',
        '|---|---:|---:|']
    for p in PATTERNS:
        text.append(f'| {PNAMES[p]} | {comparisons[p]["vs_SPARSE_pct"]:+.2f}% | {comparisons[p]["vs_BYPASS_pct"]:+.2f}% |')
    text += ['', '负数更快，正数更慢。本轮未运行任何全集。','',
        '## 先 C 后 D：分别看两段','',
        f'每段 {N//2:,} 次调用；在两段中调用同一个 ctorLoop，静态 new 位点 pc=18 不变。', '',
        '| 版本 | 阶段 | 时间中位数 [范围] 秒 | 正命中率 | 更新次数 | 普通构造次数 |',
        '|---|---|---:|---:|---:|---:|']
    for s in phases:
        text.append(f'| {NAMES[s["label"]]} | {s["phase"]} | {s["median_ms"]/1000:.4f} '
            f'[{s["min_ms"]/1000:.4f}, {s["max_ms"]/1000:.4f}] | {s["hit_pct"]:.8f}% | {s["updates"]:,} | {s["ordinary"]:,} |')
    text += ['',f'切到 D 后，新版相对原 SPARSE 的 D 段耗时变化为 **{phase_D_change:+.2f}%**。'
        '原版能把正计划更新到 D；新版按要求保留 C，D 全段没有正命中，也没有计划更新。'
        '两段中位数之和不一定恰好等于整段时间的中位数。','',
        '## 计数解释','',
        '交替输入的旧脚本中，两个目标名称为 A/B，对应本次 C/D，JS 未为重命名而改动。'
        '正常组零命中且反复更新；新版只保留第一次成功学到的目标，另一个目标直接普通构造，'
        '因此约一半调用命中。这个输入里最早成功学到的是 D：C 首次调用后未学习，D 随后学到计划；'
        '这不是按名字选择 D。','',
        '全 C 下两版正命中覆盖与更新次数相同。时间差仍按上表原样保留，不能仅凭覆盖相同就说性能没有变化。'
        '先 C 后 D 的新脚本在计时外准备两个数组，先全部 C、再全部 D；不是在长度 65,536 的环形序列里'
        '重复交替两大块。ctorLoop 函数体逐字节复用旧脚本，没有在热循环里增加阶段分支。','',
        '新版在交替输入下的变化同时包含“减少重学”和“恢复约一半正命中”，不能把全部加速只归于失配检查减少。'
        '当输入从一种稳定构造器转为另一种时，固定保留旧计划会失去新阶段本来可以获得的正命中收益。','',
        '## 实验条件与交付','',
        f'所有输入总 N={N:,}，校验和={3*N:,}；序列生成与验证在计时外，无额外预热，首个调用计入。'
        'CPU 2、Asia/Shanghai、LC_ALL/LANG=C。NORMAL/BYPASS 复用前轮已核对的 Release 二进制，'
        '但本轮 45 个时间都是同批次新进程，没有沿用前轮时间。不同版本顺序按轮次轮换。','',
        '计数在 9 个独立进程中运行，不定义 FOUR_DIAG，不增加每点字段或缓存记录尺寸；不把计数版时间放进表格。'
        'phase_C/phase_D 按实际目标对象身份区分，两目标在脚本中持续保活。身份不同时的直接路径使用 identity_bypasses 单列，'
        '不冒充正命中。Release 没有这些计数。','',
        '`KEEP_PLAN.release.patch` 相对冻结 SPARSE，仅修改 quickjs.c 的 OP_four_ctor。'
        'analysis/samples.csv 保存 45 个时间，summary.csv 是主表，switch_phases.csv 是分段表，'
        'counts.csv 是计数表；raw/ 保留命令、环境、进程起止和原始输出。复现见 REPRODUCE.md。','']
    (HERE/'results.md').write_text('\n'.join(text))
    print(json.dumps(dict(comparisons=comparisons,switch_D_vs_SPARSE_pct=phase_D_change),indent=2),flush=True)
if __name__=='__main__':main()
