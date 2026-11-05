"""Write compact reports from audited new data; never import old performance."""
from common import *
def rows(p):return list(csv.DictReader(p.open(encoding='utf8')))
def main():
    audit=read(HERE/'analysis/audit.json');assert audit['status']=='PASS'
    assert read(HERE/'evidence_gate.json')['status']=='PASS'
    stats=rows(HERE/'analysis/summary.csv');ratios=rows(HERE/'analysis/ratios.csv');utc=read(HERE/'analysis/UTC_consistency.json')
    by={(r['case'],r['condition']):r for r in stats if r['metric']=='execution'}
    rr={(r['numerator_case'],r['numerator_condition'],r['denominator_case'],r['denominator_condition']):r for r in ratios}
    def ratio(case,a,b):return rr[(case,a,case,b)]
    def show(r):return f'{float(r["ratio"]):.4f} [{float(r["CI95_low"]):.4f}, {float(r["CI95_high"]):.4f}]'
    table=['|案例 / N|A|M|V8 ON|V8 OFF|','|---|---:|---:|---:|---:|']
    for case in CASES:
        cells=[f'{float(by[(case,c)]["median"]):.6f} [{float(by[(case,c)]["Q1"]):.6f}, {float(by[(case,c)]["Q3"]):.6f}]' for c in CONDS]
        table.append('|'+case+' / '+by[(case,CONDS[0])]['N']+'|'+'|'.join(cells)+'|')
    paired=['|案例|A/M|V8 OFF/ON|A/V8 ON|M/V8 ON|','|---|---|---|---|---|']
    for case in CASES:paired.append('|'+case+'|'+'|'.join(show(ratio(case,a,b)) for a,b in [('QJS_A','QJS_M'),('V8_OFF','V8_ON'),('QJS_A','V8_ON'),('QJS_M','V8_ON')])+'|')
    cross=['|条件|inherited/own [95%区间]|继承相对own耗时变化|','|---|---|---:|']
    for c in CONDS:
        r=rr[(CASES[1],c,CASES[0],c)];cross.append('|'+c+'|'+show(r)+f'|{(float(r["ratio"])-1)*100:+.2f}%|')
    txt=f'''# 方法放在own或一层prototype：完整调用时间与实际路径

内部单位**ms/完整Run**，每Run4096次`obj.step(i)`，step只返回x+1；每格中位数 [Q1,Q3]，30新进程，无额外workload预跑。首次Run包含在外层N内，重复中反馈自然变化，不称全冷态。

{chr(10).join(table)}

下列比值为前者时间/后者时间，>1表示分母更快；区间来自10000次**同轮完整8进程块**bootstrap，seed20261028，探索性95%区间，未校正多重检验，不是等效性检验。

{chr(10).join(paired)}

{chr(10).join(cross)}

上一个表中>1表示继承案例更慢；百分比是(ratio−1)×100。ratios.csv另有denominator_time_change_pct，其方向为分母相对分子，不应与此列混用。

## 1. M分别做了什么？

N2独立诊断中，own的methodLoop PC13实际8192查询、8191命中、1次冷miss；普通find_own_property/桶/链各1。继承同PC实际8192查询、0命中，理由计数8192次inherited，普通find/桶各16384、链比较8192，未填slot。A则own普通find8192，继承16384。证明M对own省了hash定位，对继承仍先做单槽检查再沿原路径查找。

两组caller/callee的规范化opcode与操作数一致；原始函数源码SHA与compiled instance保留。返回值每Run8390656、N次checksum=N×8390656。属性归属与独立receiver诊断均通过。调用次数4096是源码控制流推导并有真实call_method/CallProperty1支持，未冒充native dispatch计数。方法体没有this.bias或其它字段读取，不能拿旧x+this.bias案例的时间来相减归因。

## 2. own方法本身离V8 ON还有多远？继承呢？

own的M/V8 ON为{show(ratio(CASES[0],'QJS_M','V8_ON'))}，继承为{show(ratio(CASES[1],'QJS_M','V8_ON'))}；两个案例都保留跨引擎距离。own已经走M命中，M的完整Run耗时点估计仍比V8 ON高35.45%。

M对A在own的时间变化为{float(ratio(CASES[0],'QJS_A','QJS_M')['denominator_time_change_pct']):+.2f}%；继承为{float(ratio(CASES[1],'QJS_A','QJS_M')['denominator_time_change_pct']):+.2f}%，后者区间跨1，方向不明确。继承/own在M为{show(rr[(CASES[1],'QJS_M',CASES[0],'QJS_M')])}，V8 ON为{show(rr[(CASES[1],'V8_ON',CASES[0],'V8_ON')])}。这些是两种完整程序的比值，包含读取、函数值/receiver处理、调用、callee加法、累加和循环；布局、原型及反馈也改变。不能相减得到纯原型成本，也不能相减两种ratio估算Richards可加速比例。

## 3. 原始Richards三处在V8建立了什么？

本批微基准的V8 OFF/ON在own为3.2015，在继承为3.2410：own控制本身也有较大的配置开关效应。不能把原Richards中更大的历史开关效应仅归为继承方法读取；旧批次时间没有参加本轮计算。

本轮独立N1/N2均通过原断言。按函数dump中的真实PC地址关联LoadIC，而不是把同名run合并：Scheduler.schedule PC20的isHeldOrSuspended与PC64的run各观察0→1/1个TCB map；TaskControlBlock.run PC58的run观察0→1→P，随后P→P，4个map分别关联Idle/Worker/Handler/DeviceTask。各map的prototype地址与同进程运行结束后读取的prototype对象和own方法descriptor对应。

QJS参考PC30/83/73重新以冻结源码SHA、原始N1/N2压缩计数核对，每Run分别10671/6573/6573次，M均全回退，理由为inherited；没有新跑Richards正式时间。TCB.run结尾是tail_call_method，参数/返回值与微基准不同，不能直接套用其耗时。

这确认了对象关系和状态转换，不是逐次命中记录。handler字段/可靠解码、逐次命中率与位点耗时仍UNKNOWN。固定参考源码有带validity cell的holder字段读取和继承常量结果等候选路径；未得到原始handler值，不能断言这几个site用了哪一种。详见richards_sites.csv、richards_notes.md及v8_path_evidence.md。

## 4. 最先推荐做什么？

**优先b：先分离两种案例共有的函数值取得与调用路径，不立即实现prototype IC。**下一轮只做一组小对照：在稳定own、已经命中的条件下，比较取得函数值但不调用，与取得后执行同一小函数；先核对真实字节码和值/引用处理，再看完整调用差异。它用于缩小范围，不把两种时间相减当调用self-time。

理由是本轮own已避开绝大多数普通查找，M/V8 ON仍为约1.35；继承对照虽然更慢，但没有给出Richards位点时间贡献。不能只因回退10671/6573次，就优先实现一个需要失效和holder管理的新IC。

## 5. 什么会推翻这个优先级？

若分离对照显示差距已主要保留在**不调用**的函数值读取，则应先定位取值/引用处理，而不是宣称调用帧是原因。若后续能取得低扰动的原Richards位点成本证据，确认继承读取消耗主要时间，且V8相应site确实走有效prototype handler，才更支持将有限继承IC原型提到前面。现在没有这些时间证据；本轮没有证明共同调用路径就是总体瓶颈。

## 审计、计时与限制

- {audit['valid']}/{audit['expected']}有效正式记录、{len(audit['complete_rounds'])}/30完整8进程轮；描述统计保留全部有效样本，配对指标只用完整轮，本轮没有不完整轮。两个案例每轮先后各15次，各条件各位置7/8次。保留全部outlier，低于校准门槛{audit['short_samples_retained']}条，未自动重试或按区间增加采样。
- 两案例共同N=16384，起始8192未全通过1秒门槛的pilot也保留；最终每条件3独立pilot均>=1秒，N1/N2及选定N正确性均通过。内部单调时钟包围关系和制品/输入/脚本SHA核对通过。Setup、静态frontend、输出与最终校验在外；Run中的读取/调用、GC/helper及引擎必要工作在内，不是方法查找self-time。
- UTC−外部单调时长每进程范围{utc['per_process_UTC_minus_monotonic']['min']:.3f}至{utc['per_process_UTC_minus_monotonic']['max']:.3f}ms，中位{utc['per_process_UTC_minus_monotonic']['median']:.3f}ms；整批首尾跨度差{utc['campaign_UTC_minus_monotonic_ms']:.3f}ms。UTC起点在reservation文件写之前，单调起点在之后，端点不同步，差值包含未分离的记录I/O及可能的时钟行为，原因不能据此确定。UTC只作日期元数据，不用于性能、不修补raw，也不据差值直接宣称单调时钟错误。详见analysis/UTC_consistency.json。
- 采样只查一次：perf不存在（exit127），未sudo、安装工具或改用高扰动SIGPROF；Richards位点的时间贡献UNKNOWN。正式采样没有构建、诊断或其它性能进程并行。
- 平台WSL2 Ubuntu24.04.2/x86_64、Ryzen5800H，沿用完全相同A/M/d8及snapshot/ICU。V8严格jitless/no-lazy，RegExp强制解释；只差use_ic。OFF不是原版QJS的替身，不代表关闭所有缓存/调用反馈。精确d8构建commit/工具链、宿主功耗/频率/温度/后台影响未隔离。
- 完整mean/sample stddev/IQR/min/max及端到端ms/process见summary.csv；不与内部中位数相减。所有旧实验只作背景，不与本批次相除；无总体GM、无IC实现、无方法外提、无自动提交推送。
'''
    save(HERE/'results.md',txt)
    save(HERE/'summary.csv',(HERE/'analysis/summary.csv').read_bytes());save(HERE/'ratios.csv',(HERE/'analysis/ratios.csv').read_bytes())
    code=(HERE/'cases/method_control.js').read_text()
    micro='''# 两个新控制：同一方法体、循环与调用形式

```javascript
'''+code+'''
```

脚本在此共同源之前设置CASE_KIND为own或inherited，adapter在前、driver在后。对象/prototype/step均在timer_start前建立；共享函数、调用参数i、receiver表达式obj、4096循环、累加和结果规则相同。own对象含step自身数据属性；继承对象由Object.create(sharedProto)建立、自己无step，holder为一层sharedProto。对象layout、prototype/feedback随之改变，不叫“只改变纯lookup成本”。

独立预期：sum(i+1), i=0..4095，即4096×4097/2=8390656。x和结果均小整数，目标sum不溢出32位；外层checksum可转为double但小于2^53，四边相同。N1/N2及选定N均核对last和N倍checksum；正式区间不打印，最后校验在外。没有额外workload预热，第一次调用包含在N内。

## 实际诊断

- 两案例×四条件的layout检查：own descriptor.value===step；继承receiver无自身step、直接prototype===sharedProto且其descriptor.value===step。
- 另建明确标注的receiver诊断副本，只有step内部加入this===microObject断言，四边全部通过。该副本会改变字节码，未用于正式计时/原始dump，不能冒充原函数字节码。
- A/M N1/N2窄计数：每Run方法读实际4096；own A每次1次普通find，M仅首个普通find，后续命中。继承A/M每次各2次普通find；M还先做1次cache shape比较，理由计数每次inherited、无slot插入。完整计数micro_path_counts.csv、micro_reason_counts.csv。
- 调用4096次是源码控制流推导，并有真实call_method/CallProperty1；没有声称测得4096次native dispatch或函数入口计数。普通查找计数是force_inline函数体逻辑进入，不是CPU call数或周期。
- 同一引擎内caller和callee的opcode/规范化操作数相同；QJS以atom字符串替代进程局部atom号，保留PC/宽度/非atom原字节；M保留实际site index。V8比较完整instruction/bytes，忽略绝对地址。见micro_diagnostic_gate.json和bytecode_notes.md。
- V8两个微基准目标PC13/FBV0各有ON 0→1，分别关联同进程receiver map。own有map-details；继承receiver详情缺失，保留null，但map-create与运行后Brief相符，holder map-details有step。具体handler及逐次命中率UNKNOWN。

新step只做x+1，和旧call_path_followup/read_ic_mic中x+this.bias不是同一计算体。历史B/C/D、P、R的定义没有改变；正式条件只含冻结A、原M、V8 ON/OFF。
'''
    save(HERE/'micro_cases.md',micro);print('REPORTS_FROM_AUDITED_240_RECORDS_WRITTEN',flush=True)
if __name__=='__main__':main()
