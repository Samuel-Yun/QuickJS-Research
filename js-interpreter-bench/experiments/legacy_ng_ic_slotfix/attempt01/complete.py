"""Final audit/report after formal + diagnostic + memory stages; no timed workloads."""
import collections,math,statistics as st
from common import *
def csvread(p):
    with Path(p).open(newline='',encoding='utf-8') as f:return list(csv.DictReader(f))
def main():
    m=verify_runtime();audit=read(HERE/'analysis/formal_audit.json');assert audit['status']=='PASS'
    formal=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    correct=[read(p) for p in (HERE/'raw/correctness').glob('*/*.json')]
    selected=[read(p) for p in (HERE/'raw/selected_correctness').glob('*/*.json')]
    assert len(correct)==96 and len(selected)==48 and all(r['valid'] for r in correct+selected)
    assert {(r['case'],r['variant'],r['N']) for r in correct}=={(c,v,n) for c in CASES for v in VERSIONS for n in [1,2]}
    timers=[]
    for v in VERSIONS:
        r=read(HERE/'raw/build'/f'{v}_timer.1.json');t=json.loads(r['stdout'])
        assert r['exit_code']==0 and t['positive_steps']>0 and t['observed_min_step_ms']>0 and t['busy_interval_ms']>=150
        assert t['busy_interval_ms']<=r['wall_ns']/1e6+5
        timers.append(dict(variant=v,**t,outer_wall_ms=r['wall_ns']/1e6))
    save(HERE/'analysis/timer_validation.json',timers)
    for case in CASES:
        n=read(HERE/'selected'/f'{case}.json')['N']
        pilot=[read(p) for p in (HERE/'raw/pilot'/case).glob('*.json') if read(p)['N']==n]
        assert len(pilot)==9 and all(r['valid'] and r['elapsed_ms']>=1000 for r in pilot)
    sources=read(HERE/'sources/identities.json')['files'];source_check={}
    for v in VERSIONS:
        bad=[p for p,h in sources[v].items() if sha(STORE/v/p)!=h];assert not bad
        source_check[v]=dict(checked=len(sources[v]),mismatches=bad)
        # Artifact copies stay ignored; no new huge Git binary/history is required.
        for name in ['qjs','qjsc']:save(HERE/'artifacts'/v/name,(STORE/v/name).read_bytes())
    from prepare import slotfix
    assert (STORE/'C/quickjs.c').read_text()==slotfix((STORE/'B/quickjs.c').read_text())
    summary=csvread(HERE/'analysis/summary.csv');diag=csvread(HERE/'analysis/diagnostic_summary.csv');memory=csvread(HERE/'analysis/memory.csv')
    assert len(summary)==16 and len(diag)==32 and len(memory)==48
    from diagnostic import validate
    for c in CASES:
        for v in ['B','C']:validate(read(HERE/'raw/diagnostic'/f'{c}.{v}.json.gz'))
    memraw=[read(p) for p in (HERE/'raw/memory').glob('*/*.json')];assert len(memraw)==144 and all(r['valid'] for r in memraw)
    for c in CASES:
        for v in VERSIONS:assert sum(r['case']==c and r['variant']==v for r in memraw)==3
    # Supplement operational identities; these are not needed for data-only replay.
    dependencies={str(p.resolve()):sha(p) for p in map(Path,['/usr/bin/gcc','/usr/bin/ld','/usr/bin/python3','/usr/bin/time','/lib/x86_64-linux-gnu/libm.so.6','/lib/x86_64-linux-gnu/libc.so.6','/lib64/ld-linux-x86-64.so.2'])}
    compile_lines=[]
    for v in VERSIONS:
        lines=(HERE/'raw/build'/f'{v}_release.1.log').read_text().splitlines()
        core=[line for line in lines if line.startswith('gcc ') and line.endswith(' quickjs.c')]
        assert len(core)==1 and '-O2' in core[0] and '-DNDEBUG' not in core[0] and '-flto' not in core[0]
        compile_lines.append(core[0])
    assert len(set(compile_lines))==1,compile_lines
    save(HERE/'analysis/final_identity.json',dict(sources=source_check,dependencies=dependencies,B_C_only_slotfix=True,compiler_settings='all release build logs -O2 -g -fwrapv, unchanged Makefile; no NDEBUG/LTO/PGO'))
    directions=dict(collections.Counter(r['execution_BC_direction'] for r in summary));ac=dict(collections.Counter(r['execution_AC_direction'] for r in summary))
    completion=dict(status='COMPLETE_WITH_DISCLOSED_LIMITATIONS',formal_expected=1440,formal_actual=len(formal),formal_valid=sum(r['valid'] for r in formal),
      correctness_N1_N2=96,correctness_selected_N=48,pilot_selected_N=144,new_assertions_each=28151,new_scenario_groups=9,legacy_assertions_each=952,
      release_micro_processes=21,diagnostic_target_unit_checks=14,Octane_diagnostics=32,memory_processes=144,
      BC_directions=directions,AC_directions=ac,source_audit=True,
      first_formal_timestamp=min(r['timestamp'] for r in formal),last_formal_timestamp=max(r['timestamp'] for r in formal),
      old_statistics_replay=read(HERE/'recovery/legacy_replay_audit.json')['status'],
      old_diagnostic_replay=read(HERE/'recovery/diagnostic_replay_audit.json')['status'],
      limitations=['Crypto padding not pairwise frozen; preexcluded MAIN GM',
        'single WSL2 host; power/frequency/background uncontrolled',
        'memory n=3 per version/case; indirect shape graph bytes UNKNOWN',
        'diagnostic whole process, rewritten IC queries only, same function+atom sharing',
        'lifetime max occupancy not time-weighted occupancy; full shape diversity UNKNOWN',
        'code layout/compiler decisions not isolated; not a per-miss time decomposition',
        'not complete test262/official Octane score'])
    save(HERE/'analysis/completion.json',completion)
    report(summary,diag,memory,completion)
    print('COMPLETE',json.dumps(completion,ensure_ascii=False),flush=True)

def report(summary,diag,memory,completion):
    aggregate=read(HERE/'analysis/aggregate.json');directions=completion['BC_directions'];main=aggregate['MAIN_no_Crypto'];sensitive=aggregate['sensitivity_with_Crypto']
    dc={(r['case'],r['variant']):r for r in diag};mc={(r['case'],r['variant']):r for r in memory}
    faster=[r['case'] for r in summary if r['execution_BC_direction']=='right_faster']
    slower=[r['case'] for r in summary if r['execution_BC_direction']=='right_slower']
    unclear=[r['case'] for r in summary if r['execution_BC_direction']=='unclear']
    text=['# 旧IC空槽最小修复：同批次A/B/C结果','',
      '## 做了什么','',
      'A为精确upstream 04be246001599f5995fa2f2d8c91a0f198d3f34c；B为前轮NG e1b5978775f75f9637c624fc45e69b92d2c15f42安全移植；C只修改空槽填充。三者在同一WSL2 Ubuntu24.04.2/x86_64、GCC13.3.0下分别干净构建，-O2/-g、断言设置一致，无LTO/PGO。没有使用旧A/B时间除以新C。',
      'B→C补丁只涉及add_ic_slot：完整扫描时记录首个空槽，同shape仍更新offset并返回；无相同shape才选择首空，满槽仍覆盖原扫描起点。index、4槽容量、函数+atom共享、准入、eager创建、命中路径、结构布局与前轮安全修复均未改变。参见patches/B_to_C.patch及sources/identities.json。','',
      '## 正确性和计时','',
      '三边旧952项断言、新9组场景28151项断言、12个smoke和11个上游测试入口通过；C的ASan/UBSan针对性检查、多shape已重写函数的序列化/加载、嵌入执行和192档OOM清理通过。断言数量不是独立场景数；未跑完整test262。',
      '16个Run单元N=1/2共96次及所选N共48次正确性通过。每项3组独立pilot共9进程都≥1秒后冻结。正式1440/1440有效，每项每版30进程；六排列各5次，同组相邻，固定seed，不删样本、不补跑到显著。',
      'Setup、静态source/编译、adapter在timer外；首次Run和后续N次在内，无额外性能预热。缓存随重复自然变热，不能叫全部冷访问。GC/helper/builtin/RegExp/动态编译仍在计时内，不称纯查找self-time。内部ms/Run和新进程ms/process分开。','',
      '## C是否修复多槽利用','',
      '实际目标单位：2shape从B的0/7999命中变为C的7998/7999，最大占用1→2；4shape从0/7999变为7996/7999，占用1→4。分母仅为已重写查询，首次普通opcode不在内；填充阶段miss仍保留。5/8shape均结果正确且最多4槽，不预设超容量必为0命中。',
      '同atom两个site仍共享一个单位，C的15998次查询全部命中、占2槽，并未变成逐site IC。另一探针在首空之后仍找到已有shape，只占3槽且发生offset更新，核查了不能遇空提前退出的要求。',
      '高命中仍有探测成本：2shape的C总探测23995/7999，约3次/query；4shape约2次/query。这是计数，不是单次操作时间。完整机制记录见correctness/micro_counters.csv。','',
      '## 正式逐项性能','',
      'speedup A/B、B/C、A/C均>1表示分母版本更快；变化率为(C/B−1)×100%，正值代表C变慢。CI按同组ABC整组重采样10000次重算中位数之比，探索性逐项区间，未校正多重比较。',
      (HERE/'analysis/tables.md').read_text().split('\n',2)[2],
      '表内CI为显示舍入值，方向始终按summary.csv的完整精度判定；边界显示1.0000不等于严格大于/小于1，不据显示舍入重新分类。',
      f'B→C：改善 {len(faster)} 项（'+('、'.join(faster) or '无')+'）；退化 '+str(len(slower))+' 项（'+('、'.join(slower) or '无')+'）；方向不明确 '+str(len(unclear))+' 项（'+('、'.join(unclear) or '无')+'）。区间跨1不宣布方向。',
      f'主集合预先排除Crypto，{main["unit_count"]}个Run单元/{main["suite_count"]}个suite，先suite内子项GM再suite等权GM：A/B={main["comparisons"]["AB"]["suite_geomean"]:.6f}，B/C={main["comparisons"]["BC"]["suite_geomean"]:.6f}，A/C={main["comparisons"]["AC"]["suite_geomean"]:.6f}。',
      f'包含受限Crypto的敏感性：B/C={sensitive["comparisons"]["BC"]["suite_geomean"]:.6f}，A/C={sensitive["comparisons"]["AC"]["suite_geomean"]:.6f}；不是官方Octane总分。完整A/B和端到端CI见analysis/summary.csv；mean、样本stddev、Q1/Q3/IQR/min/max见statistics.csv；带CI图见analysis/execution_BC.svg等。','',
      '## miss变化有没有变成净收益','',
      '下表为独立B/C诊断整进程计数，与正式时间分离。命中率分母是已重写查询；同函数同atom读写/site共享，不是V8式逐site统计，也不能将频率当耗时。','',
      '| 项目 | B/C命中率 | B/C shape miss | B/C查询探测 | B/C替换 |',
      '|---|---|---|---|---|']
    for case in ['Richards.Richards','Splay.Splay','Typescript.Typescript','RayTrace.RayTrace','CodeLoad.CodeLoadClosure','CodeLoad.CodeLoadJQuery']:
        b,c=dc[case,'B'],dc[case,'C']
        text.append(f'| {case} | {100*float(b["hit_fraction"]):.4f}% / {100*float(c["hit_fraction"]):.4f}% | {b["shape_misses"]}/{c["shape_misses"]} | {b["probes"]}/{c["probes"]} | {b["replacements"]}/{c["replacements"]} |')
    text+=['','这些计数与各自正式时间对照，只能说明该修复的整体干预结果；不能把总时间差除以miss数量称精确miss成本。命中路径没有被本轮直接简化，Richards结果也不能自动归给空槽或某个helper。新旧机器码布局和编译器决策仍是混杂因素。','',
      '## 端到端与内存代价','',
      '独立GNU time小launcher，每项每版3进程，KiB；未使用前轮受fork高水位污染的wait4平台值。下面保留中位数及范围，不把n=3小差异写成稳定收益。','',
      '| 项目 | A peak KiB [min,max] | B peak KiB [min,max] | C peak KiB [min,max] |',
      '|---|---|---|---|']
    for case in CASES:
        cells=[]
        for v in VERSIONS:
            r=mc[case,v];cells.append(f'{float(r["median_KiB"]):.0f} [{r["min_KiB"]},{r["max_KiB"]}]')
        text.append('| '+case+' | '+' | '.join(cells)+' |')
    text+=['','IC请求字节/峰值存活是同布局诊断版的直接IC分配，不含allocator和被shape强引用间接保活的对象图。C虽不改缓存结构大小，更多非空shape槽仍可能保活更多shape；间接保活的字节数UNKNOWN。占用分布是每单位生命周期最大占用，不是瞬时/时间加权分布，见occupancy_lifetime_max.csv。',
      'CodeLoad继续eager创建，空槽修复没有移除编译/初始化开销。具体初始化数量、请求字节、命中使用量见diagnostic_summary.csv；不将这些诊断时间用于正式收益。','',
      '## 复现材料与限制','',
      '前轮两个缺于Git的大CodeLoad原始JSON和派生CSV本地仍存在，已gzip归档并核对压缩/解压SHA；没有用汇总反造。recover.py可以恢复、并从真实原计数重建原CSV，其SHA与旧原文件一致。源码用固定archive恢复，不要求提交bare历史。',
      '旧A源码CRLF原哈希与Git发布LF规范化哈希分开记录，没有篡改旧哈希。数据统计入口已与制品身份核对分离：analyze.py无需Linux/旧binary；identity.py可显式路径映射；new_campaign.py创建全新attempt重建运行，不覆盖历史。',
      'Crypto脚本加载时、ResetRNG前的随机padding未证明逐组一致，两项继续采集但预先排除主GM。Box2D缺可信正确性门禁、zlib缺read()、官方latency分数均保留原边界。单一WSL2平台，功耗/频率UNKNOWN，后台未完全控制。没有完整shape多样性、硬件成本分解或代码布局消融。','',
      '## 下一步','',
      '若存在命中变化却无净收益的项目，下一步选其中一个具体位置，确认探测、回退和单态命中工作的机器码执行成本；若是单态项目，则用严格限定的命中路径消融检验。自适应启用、逐site或命中路径内联都不在本轮实现，不能把仍未消除的A/C差距预先归给它们。']
    if (HERE/'interpretation.md').exists():
        text+=['','## 本轮具体判读','',
          '逐项机制、边界案例和内存代价的具体判读见 [interpretation.md](interpretation.md)，包括TypeScript区间舍入问题、RayTrace反例和PdfJS内存观察。']
    save(HERE/'results.md','\n'.join(text)+'\n')
if __name__=='__main__':main()
