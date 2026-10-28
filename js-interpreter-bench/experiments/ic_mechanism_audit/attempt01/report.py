"""Generate presentation tables from completed immutable records, not predictions."""
from common import *
def records(p):return list(csv.DictReader(p.open(encoding='utf8')))
def main():
    audit=read(HERE/'analysis/audit.json');assert audit['status']=='PASS'
    assert read(HERE/'reason_gate.json')['status']=='PASS'
    table=records(HERE/'analysis/summary.csv');ratios=records(HERE/'analysis/ratios.csv');stats=records(HERE/'analysis/statistics.csv')
    by={(r['case'],r['numerator'],r['denominator']):r for r in ratios}
    q={(r['case'],r['condition']):r for r in stats if r['metric']=='execution'}
    def ratio(case,a,b):
        r=by[(case,a,b)];return f'{float(r["ratio"]):.4f} [{float(r["CI95_low"]):.4f}, {float(r["CI95_high"]):.4f}]'
    def change(case,a,b):return float(by[(case,a,b)]['denominator_time_change_pct'])
    save(HERE/'summary.csv',(HERE/'analysis/summary.csv').read_bytes())
    timing=['|案例 / N|A|M|V8 ON|V8 OFF|','|---|---:|---:|---:|---:|']
    for row in table:
        case=row['case'];cells=[]
        for c in CONDITIONS:
            s=q[(case,c)];cells.append(f'{float(s["median"]):.6f} [{float(s["Q1"]):.6f}, {float(s["Q3"]):.6f}]')
        timing.append('|'+case+' / '+row['N']+'|'+'|'.join(cells)+'|')
    rt=['|案例|A/M|V8 OFF/ON|A/V8 ON|M/V8 ON|','|---|---|---|---|---|']
    for case in CASES:rt.append('|'+case+'|'+'|'.join(ratio(case,a,b) for a,b in [('QJS_A','QJS_M'),('V8_OFF','V8_ON'),('QJS_A','V8_ON'),('QJS_M','V8_ON')])+'|')
    mechan=records(HERE/'mechanism_sites.csv');mt=['|目标/版本/PC|执行前→结束|操作|IC查询|命中/未命中|插入/同shape更新/替换|普通find / offset-find|桶/链|','|---|---|---:|---:|---|---|---|---|']
    for s in mechan:
        if s['N']!='2':continue
        mt.append(f'|{s["function"]}:{s["pc"]} / {s["variant"]}|{s["before_op"]} {s["operand_before"]} → {s["after_op"]} {s["operand_after"]}|{s["operations"]}|{s["ic_queries"]}|{s["hits"]}/{s["misses"]}|{s["insertions"]}/{s["same_shape_updates"]}/{s["replacements"]}|{s["find_normal"]}/{s["find_with_offset"]}|{s["bucket_loads"]}/{s["chain_probes"]}|')
    mechanism='''# IC确实执行了吗：位置—字节码—计数

以下均为独立诊断进程N=2，非正式计时。m1Read每Run4096次读x；Richards每Run保留原queue/hold断言。函数源码SHA、编译实例、原/后码SHA、真实PC、操作宽度见mechanism_sites.csv，完整原文压缩于raw/diagnostic；离线对应由diagnostic_run.py完成，N1与N2也分别保存。

计数覆盖诊断进程期间**已登记的源码编译函数**，不是全VM总数：预编译标准库的反序列化函数未加登记hook。理由计数中另有37个无源码site、37次读取，保留UNKNOWN；选定Richards/M1点均已独立匹配。详见diagnostic_scope_amendment.json。cache_probes只统计query中的shape比较，不含更新时额外的同shape判断。

'''+ '\n'.join(mt)+'''

## 三个最直接的事实

M另用独立诊断副本在rdi_prepare入口/改写后各保存一次最终代码，见prepare_snapshot_gate.json及raw/diagnostic/M_prepare.*.gz。这才是M自身的prepare前→后证据，不用A的字节码冒充M的前态；先前表中M的before指prepare完成、开始执行之前。

|M函数 / PC|prepare前真实指令及atom32|prepare后真实指令及site index32|
|---|---|---|
|m1Read / 13|get_field 626（x）|get_field_rdi 0|
|isHeldOrSuspended / 3|get_field 757（state）|get_field_rdi 0|
|isHeldOrSuspended / 19|get_field 757（state）|get_field_rdi 1|

表内atom编号是这次独立进程的实际值，不作跨进程身份。三处的指令宽度仍为5B，除这些读点外字节码保持原样；完整前/后字节见压缩JSONL。

1. 稳定own读的真实PC13：A普通get_field保持不变；B从atom626的get_field改成index0的get_field_ic，8192次操作中第一次不计IC查询，后8191次全命中；M在执行前就为index0的get_field_rdi，8192查询含一次冷miss。数字244在B/M中代表不同新增opcode，不能只按opcode编号判断是相同实现。
2. A在该位置实际执行8192次逻辑find_own_property、8192次桶读取和链atom比较；M仅1/1/1，B另一个带offset的查找仅1/1/1。命中后确实少做查找，而不只是“源码中有命中分支”。这些是内联函数体逻辑计数，不是native call或周期数。M额外shape比较8192次，不能把节省的链比较直接换成时间。
3. Richards真实isHeldOrSuspended PC3/19分别读state。B两处结束时index均0，M分别index0/1；B第二处首次普通opcode虽有已存在同shape缓存，仍先作一次普通offset查找/更新。M每site首个查询属于冷miss，两处均仅1次普通查找，后续全命中，返回INT。函数匿名名称用原始源码赋值关联，完整身份仍以source SHA+instance+PC为准。

## 缓存不是缓存值，诊断不是完整语义证明

复用原read_semantics、site_regression、legacy_regression、multislot，共12个A/B/M release回归进程实际通过。stdout中的assertions/scenarios各自保留于regression.csv：覆盖同shape不同对象与当前值更新、INT→引用/字符串、删除/重定义、getter/抛异常、Proxy、只读属性、receiver绑定及已有多shape情况。没有跑完整test262，没有新IC算法。
另外A/B/M各一次scope探针通过：getter重入inner、第二次抛异常、随后独立after读取均正确映射。GCC cleanup按栈恢复上下文；每次JS_CallInternal先暂停父属性上下文，避免把getter内的查找算到外层。信号采样未在本轮启用，不记录海量访问事件，不对每次访问调用时钟。

正式源树没有计数器。诊断差异均在diagnostic/补丁与两个hook中；字节码快照为最终编译定型/准备后以及释放前，不是编译中间表示。未插桩的访问类型不以0冒充。额外理由计数使用既有原M诊断制品，身份、源码与每个source SHA+PC的query/hit/fallback交叉一致，见reason_gate.json。

## Richards覆盖（次数不是时间）

N1：isHeldOrSuspended PC3/19分别10671/10115查询，命中10670/10114。schedule PC30的isHeldOrSuspended方法准备10671次全回退，两级run方法准备PC83/TCB.run PC73各6573次全回退；每次分别发生两次own探查，理由计数确认为inherited。TCB.run PC68读task则6573查询、6572命中。普通put_field仍走原写入，不属于M读IC；keyed/global动态次数UNKNOWN。
完整逐site表coverage.csv，不能按atom合并后冒充一个位置。N2独立核对次数增长，缓存冷miss不随Run成倍增加；分母为各site的查询数，不是整个程序时间。

## V8的直接证据和未知项

本轮实际m1Read dump PC13/FBV0；同一进程LoadIC 0→1和receiver map相符，map-details中x是in-object数据字段。完整地址和描述见bytecode/V8_m1_*与raw/diagnostic/v8_m1.log.gz。ON有状态转换不代表每次命中；精确handler编码、逐次命中率、OFF直接槽快照均UNKNOWN。
本制品拒绝print-builtin-code，只读flag失败保留；正式采样结束后实际objdump静态导出同一d8的Builtins_GetNamedPropertyHandler，source_evidence/V8_GetNamedProperty_actual.asm中可见反馈map检查/字段load和分支。它是具备路径的证据，不是目标每次走该支的trace。两种V8只有use-ic生效值不同，jitless及RegExp解释策略相同。
'''
    save(HERE/'mechanism_evidence.md',mechanism)
    results=f'''# IC实际省了工作，但不能据此解释全部性能差距

本轮完成三个固定案例、四条件、{audit['valid']}/{audit['expected']}有效新进程样本；每格30个。平台WSL2 Ubuntu24.04.2/x86_64、Ryzen5800H，GCC13.3.0 / QuickJS2026-06-04。A冻结原版、M为原始M固定源码本轮干净构建，不含R或SW开关；d8为同一官方15.6.21制品，双方严格`--jitless --no-lazy`，仅use_ic不同。版本/完整SHA/依赖见manifest.json与version_map.csv，不混历史时间。

## 1. 旧移植与M有没有真正执行IC？

有。N1/N2真实快照和原始计数见mechanism_evidence.md、mechanism_sites.csv。稳定读x的PC13，B执行前是get_field、首次登记后变get_field_ic；M从最终prepare后就为get_field_rdi。N2的B是8192操作、8191改写后查询/命中；M是8192查询、8191命中加1冷miss。只看运行前dump会漏掉B。Richards两个state位置在B共享函数+atom index0，在M分别index0/1。

12个A/B/M既有release回归与3个scope回归实际通过；这不是完整test262或全部语言语义证明。本轮没有改IC算法，没有恢复方法外提A/B。

## 2. 稳定命中省了什么？

A的同位置N2实际执行8192次内联逻辑find_own_property，桶读取/链比较各8192；M仅1次，B仅首次offset查找1次。由此可以确认缓存跳过hash属性定位。A本来已有内联own数据快路径，并非每次进入大helper。M仍检查object/class/exotic、定位site、比较shape，读取当前值，做必要JSValue/receiver处理；循环/调用/累加/GC仍在。命中省的工作、引入的维护/保活，以及CPU缓存/布局各占多少时间UNKNOWN，不相减中位数当单读成本。

## 3. 本批次M与V8 ON到底差多少？

内部单位**ms/完整Run**，单元格为中位数 [Q1,Q3]。两个micro完整Run含4096轮，Richards完整Run为原runRichards；N是外层重复，不能把此时间说成单次属性访问。

{chr(10).join(timing)}

比值为前者/后者，>1表示分母更快。括号为10000次**同案例四元组配对**bootstrap探索性95%区间，跨1只称方向不明确；无多重检验校正、无总体GM。

{chr(10).join(rt)}

M相对A的时间变化：own整数 {change(CASES[0],'QJS_A','QJS_M'):+.2f}%，数值控制 {change(CASES[1],'QJS_A','QJS_M'):+.2f}%，Richards {change(CASES[2],'QJS_A','QJS_M'):+.2f}%。负号为M耗时下降。数值控制目标循环没有字段读取，但外层驱动仍有少量属性/函数工作；其方向与区间要独立读，不能把A/M变化全归给命中跳过hash。

其中Richards的A/M区间跨1，不能称本批次已确定加速；稳定own读的M/V8 ON区间也跨1，方向不明确。数值控制的A/M区间未跨1，进一步限制了把全部A/M变化归为目标IC的解释。

内部区间包括第一次Run，没有额外性能预跑；随后反馈/缓存自然变热，不称全冷态。共同N的12个独立pilot/案例均>=1s；正式低于门槛{audit['short_samples_retained']}条照实保留。统计全表/mean/sample_sd/IQR/min/max与端到端ms/process见analysis/statistics.csv。外部进程时间不与内部中位数相减。校验、命令、stdout/stderr、原始时长与源码/制品SHA逐条保存在raw。

## 4. Richards差距来自未覆盖，还是命中/回退成本？

现在仍不能分开。直接证据显示own state、currentTcb、task等高频点大部分命中；另一方面原型方法准备持续回退，普通写入、keyed/global不属于M覆盖域。schedule→TCB及TCB→task两级run各6573次读取，当前M均零命中、各13146次普通own探查；isHeldOrSuspended方法准备还有10671次全回退。它们“频繁”，不是已量出的耗时热点。

V8参考源码有map/handler反馈及named/global/keyed读写更新条件，范围不同于M；当前x字段有同进程in-object与ON转换正证据。OFF不是原版QuickJS的替身，OFF/ON是配置开关净效果，不能计算“解释了QJS/V8差距的百分比”。Richards各V8 site实际handler/逐次命中率、OFF槽直接状态UNKNOWN。固定37fb849…只是官方参考源码commit，不能冒充现有d8精确构建提交。

既有同binary SW ON/LOOKUP确实在部分负载看到直接取值收益，但SW与原M桥接成本不为零；旧C/D已分别处理填槽和wrapper，不能用旧B缺陷直接解释新M。已有数值/固定链接布局结果也约束了简单归因，本轮没为改善结果调链接或重编译参数。

## 5. 下一轮只推荐验证一个假设

**M未缓存的继承方法读取，可能是Richards中值得处理的一部分剩余工作。**先在原程序做低扰动、能对应source SHA+PC的路径/采样核查，并在同位置确认V8实际handler，而不是立刻写prototype IC。预期观察是这些位置有稳定可重复的CPU占用、V8 ON确实使用继承结果handler；反例是主要样本仍在普通own命中/调用帧等处，或V8该site也经常回退。无论哪种结果，都不把频率当self-time。本轮不实现该候选。

## 限制和可复查材料

功耗/频率/温度及宿主后台未控制，代码布局与编译决策未隔离；诊断有扰动，只作路径次数。没有硬件周期级成本分解，没有把旧采样比例搬成新时间贡献。所有outlier保留。旧A/P/M历史同批表另见historical_APM.md，仅作过程说明。分析只读公开raw可在新目录重算，无旧ELF依赖；审计见analysis/audit.json。执行阶段状态见completion.json，失败及恢复细节见evidence_index.md。
'''
    save(HERE/'results.md',results)
    print('REPORT_WRITTEN_FROM_ACTUAL_COMPLETED_DATA',flush=True)
if __name__=='__main__':main()
