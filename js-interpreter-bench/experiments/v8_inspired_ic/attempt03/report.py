"""Generate the factual Chinese result tables from finished public raw/summary.
Run after independent audit and diagnostics. No runtime or historical timings.
"""
import csv,json,math,statistics
from pathlib import Path
HERE=Path(__file__).resolve().parent
def read(name):return json.loads((HERE/name).read_text(encoding='utf-8'))
def csvrows(name):return list(csv.DictReader((HERE/name).open(encoding='utf-8')))
def interval(r):return f"{float(r['point']):.4f} [{float(r['CI95_low']):.4f}, {float(r['CI95_high']):.4f}]"
def main():
    audit=read('independent_audit.json');assert audit['status']=='PASS_COMPLETE'
    assert read('diagnostic_gate.json')['status']=='PASS'
    assert read('post_identity.json')['status']=='PASS'
    rt=read('campaign_runtime.json');agg=read('summary/aggregate.json');ratios=csvrows('summary/ratios.csv');comp=csvrows('summary/comparison.csv');diag=csvrows('diagnostic_summary.csv')
    by={(r['case'],r['ratio']):r for r in ratios}
    ea=[r for r in ratios if r['ratio']=='E/A'];counts={k:sum(r['direction']==k for r in ea) for k in ['numerator_faster','numerator_slower','unclear']}
    worst=max(ea,key=lambda r:float(r['point']));best=min(ea,key=lambda r:float(r['point']))
    text=f'''# V8关键IC机制迁移：A / E / V8_ON 同批结果

## 1. 做了什么，哪些确实实现

E从冻结原版A重新接入，不是M/H改名。新增最终字节码实例逐位置反馈、
按第8次目标属性操作延后建立vector、内嵌单态entry、按需四项PIC、第五种shape
转普通GENERIC，以及own data读取、最多三层完整shape链守卫的prototype data读取、
已有own writable data写入handler。特殊操作沿原语义回退。

实现依据为固定V8参考提交37fb84941c9be9f9914ee50b1ad366f06a1bd764的21份
实际归档文件；[机制映射](mechanism_mapping.md)逐项列入口、依赖和差异，
[实际调用链](v8_call_chain.md)及[设计](design.md)说明读端、更新、修改端保护及生命周期。未迁移validity cell、弱Map/holder、
constant handler、共享mega stub cache、keyed/global handler；不是完整V8 IC移植。
E链守卫仍需逐层检查，强引用仍会保活并增加COW/GC边，不能称与V8成本等价。

首次attempt01在新增C API回归中失败，原558条数据保留但不用于性能结论。
attempt02只修复store miss的提交/缓存更新顺序并重新构建、验证；其169条时间因
外部中断/WSL重启保留为独立不完整cohort。attempt03复用同一精确修复版E，
重新完成本表的新cohort，不跨boot补位，不按正式结果调参或混入旧时间。
[cohort说明](cohort_notes.md)、[修复说明](repair_notes.md)及
[最小差异](attempt01_to_attempt02_safety.patch)保留可复查原因。

## 2. 本批身份、计时和正确性

- cohort：`{rt['cohort']}`，WSL2 Ubuntu24.04.2/x86_64；单一boot，CPU affinity {rt['affinity']}。
- A：QuickJS2026-06-04，upstream04be246001599f5995fa2f2d8c91a0f198d3f34c；SHA `{rt['artifacts']['A']['sha256']}`。
- E Release：SHA `{rt['artifacts']['E']['sha256']}`；GCC13.3，沿原Makefile的-O2/-g/-fwrapv，无新增LTO/PGO/NDEBUG。
- V8：d8 15.6.21，SHA `{rt['artifacts']['V8_ON']['sha256']}`，`--jitless --no-lazy --use-ic`，冻结snapshot/ICU。
  实际d8构建commit/toolchain/GN全参数UNKNOWN；固定参考源码不能补成制品身份。
- 内部原生单调performance.now计N个完整Run，报告ms/Run；第一次Run包含，无额外workload预跑。
  静态加载、必需Setup、后验验证在外；原Run动态编译、GC/helper/builtin/RegExp和原断言在内。
  Setup可能有自身预备行为；N次重复自然变热，不称每次冷访问或pure interpreter-loop self time。
- 新语义脚本三条件各16场景/4131断言；复用语义门禁共18个进程通过。
  E内部12场景/1341断言验证1/2/4槽、5–8shape泛型、不同PC、两层C API修改、unhashed拒绝、可选分配失败。
  新E的上游make test、Release与ASan/UBSan定向GC/OOM/roundtrip、qjsc嵌入、热bytecode双向copy/ROM均通过。
  新增finalizer回归在A/E/E_san通过；没有宣称完整test262或所有嵌入行为已覆盖。
  这些安全门禁来自同一精确E、同一主机的attempt02实际运行，本attempt明确复用，
  不是冒充本boot重跑；[artifact_reuse.json](artifact_reuse.json)记录identity与来源。
- 17 Run×三条件×N1/N2 =102个独立correctness记录通过；选定N再查，Crypto三条件N1/N2及selectedN实际输入流一致。
  保留原RegExp、NavierStokes补验、Encrypt后验和Decrypt前置加密规则。

计时协议、冻结源码和排列见[protocol.json](protocol.json)、[frozen.json](frozen.json)、[schedule.json](schedule.json)。
前后binary/依赖/源码SHA均核验；正式无计数/trace。Windows供电/负载只是前后可知观测，
频率、温度、连续后台隔离UNKNOWN，未改电源/governor/ASLR等系统设置。

## 3. 全部逐项时间

以下是一次完整原Run的内部中位ms，不是一个属性操作的时间。N为同case三条件共用的
进程内重复数；每条件30个新进程。同case三条件相邻，六种顺序各5次，seed20261031。

|Run|N|A ms/Run|E ms/Run|V8_ON ms/Run|有效n(A/E/V8)|
|---|---:|---:|---:|---:|---|
'''
    for r in comp:text+=f"|{r['case']}|{r['N']}|{float(r['A_median_ms']):.6f}|{float(r['E_median_ms']):.6f}|{float(r['V8_ON_median_ms']):.6f}|{r['A_n']}/{r['E_n']}/{r['V8_ON_n']}|\n"
    text+='''
完整mean、样本stddev、Q1/Q3、IQR、min/max以及外部进程wall和CPU时间见
[statistics.csv](summary/statistics.csv)。Q1/Q3用排序后上下各半的中位数；
外部wall/CPU不与内部中位数相减来估算初始化成本。所有异常值保留。

以下为辅助整进程中位数，单位ms/process；包含启动、Setup、N次Run、校验和退出。
CPU为同一子进程user+system之和；不是内部区域CPU，不与ms/Run混用。

|Run|wall A/E/V8|CPU A/E/V8|
|---|---:|---:|
'''
    auxiliary=csvrows('summary/statistics.csv')
    stats={(r['case'],r['condition'],r['metric']):r for r in auxiliary}
    for r in comp:
        vals=[]
        for metric in ['external_ms_per_process','child_cpu_ms_per_process']:
            vals.append('/'.join(f"{float(stats[(r['case'],c,metric)]['median']):.2f}" for c in ['A','E','V8_ON']))
        text+='|'+r['case']+'|'+'|'.join(vals)+'|\n'
    text+='''
反馈释放、原生资源清理和TearDown可能在内部计时外，因此只看内部比值不能代表
所有维护代价已计入；整进程辅助表也不能通过中位数相减给它们精确归因。

## 4. 比值、探索性区间及净结果

<1表示分子更快；百分比耗时变化=100×(ratio−1)。逐项以完整同轮三元组为单位
重采样10000次，固定seed20261031，计算中位数之比及线性百分位95%区间。
跨1只写方向不明确；未经多重检验校正，也不是等效检验。

|Run|E/A [95%]|E/V8_ON [95%]|A/V8_ON [95%]|
|---|---:|---:|---:|
'''
    for r in comp:text+='|'+r['case']+'|'+'|'.join(interval(by[(r['case'],k)]) for k in ['E/A','E/V8_ON','A/V8_ON'])+'|\n'
    text+='''
按suite内子项GM、suite等权GM聚合：核心16项/13suite是主集合，含zlib的17项/14suite
另列。全套包含Crypto；Crypto/Earley/CodeLoad不因子项多而加权。总体bootstrap使用
所有case共享的同轮block索引，不跨case加毫秒，不是官方Octane总分。

|固定集合|E/A [95%]|E/V8_ON [95%]|A/V8_ON [95%]|
|---|---:|---:|---:|
'''
    for group in ['core16_13suite','expanded17_14suite']:
        rs={r['ratio']:r for r in agg if r['set']==group};assert all(r['status']=='COMPLETE_PRIMARY' for r in rs.values())
        text+='|'+group+'|'+'|'.join(interval(rs[k]) for k in ['E/A','E/V8_ON','A/V8_ON'])+'|\n'
    core_ids=set(read('protocol.json')['core16'])
    core_counts={k:sum(r['direction']==k and r['case'] in core_ids for r in ea) for k in counts}
    text+=f"\n核心16项按E/A逐项探索性区间：改善{core_counts['numerator_faster']}、退化{core_counts['numerator_slower']}、方向不明确{core_counts['unclear']}。含zlib17项：改善{counts['numerator_faster']}、退化{counts['numerator_slower']}、方向不明确{counts['unclear']}，版本独有正式失败0。\n"
    text+=f"最大耗时增加点估计为{worst['case']}，E/A={float(worst['point']):.4f}（{float(worst['time_change_percent']):+.2f}%）；最小为{best['case']}，E/A={float(best['point']):.4f}（{float(best['time_change_percent']):+.2f}%）。\n"
    for group in ['core16_13suite','expanded17_14suite']:
        a={r['ratio']:r for r in agg if r['set']==group};r=a['E/A'];e=a['E/V8_ON'];v=a['A/V8_ON']
        verdict='整体净耗时下降' if r['CI95_high']<1 else '整体净耗时增加' if r['CI95_low']>1 else '整体方向不明确，不能认定净优化'
        v8_verdict='E仍慢于V8_ON' if e['CI95_low']>1 else 'E快于V8_ON' if e['CI95_high']<1 else '相对V8_ON方向不明确，不能称等效'
        text+=f"\n{group}：{verdict}。E相对A耗时点变化{100*(r['point']-1):+.2f}%。归一化到V8的耗时由{v['point']:.4f}变为{e['point']:.4f}，差值{v['point']-e['point']:+.4f}个V8单位；{v8_verdict}，E相对V8_ON耗时点变化{100*(e['point']-1):+.2f}%。这不是IC单项成本或纯执行成本分解。\n"
    text+='''
图：[E/A](plots/E_over_A.svg)、[E/V8_ON](plots/E_over_V8_ON.svg)、[A/V8_ON](plots/A_over_V8_ON.svg)。
不把区间跨1写成已经一样快，也不把旧V8 OFF/ON倍率当作E本应获得的收益。

## 5. E实际路径与直接缓存代价

下表来自另一个诊断构建、每case一个N1进程。scope含加载/Setup/Run/校验/释放，
不是正式30轮timed-region命中率，也不是各类操作的耗时比例。

|Run|查询|own/proto/store命中|回退|mono/poly/generic转换|直接缓存峰值KiB|
|---|---:|---:|---:|---:|---:|
'''
    for d in diag:text+=f"|{d['case']}|{d['queries']}|{d['own_hits']}/{d['proto_hits']}/{d['store_hits']}|{d['fallback']}|{d['mono']}/{d['poly']}/{d['generic']}|{int(d['peak_bytes'])/1024:.2f}|\n"
    high_memory=max(diag,key=lambda d:int(d['peak_bytes']))
    high_refresh=max(diag,key=lambda d:int(d['store_refresh_inactive']))
    text+=f"\n本N1诊断中，最大直接缓存请求峰值在{high_memory['case']}，{int(high_memory['peak_bytes'])}B；无反馈/GENERIC后的写入重查次数最多在{high_refresh['case']}，{int(high_refresh['store_refresh_inactive'])}次（该case全部写入后重查{int(high_refresh['store_refresh'])}次）。这只是本scope的实际计数，不是耗时排名。\n"
    text+='''
完整named/keyed及绑定类opcode、handler更新、分配与释放见[diagnostic_summary.csv](diagnostic_summary.csv)。
binding_varref仅按get_var/put_var等实际opcode定义，不冒充源码global精确次数；
精确global分类仍UNKNOWN，get_array_el3的复合赋值读已纳入keyed read。
位点按函数debug源码SHA、进程内实例、真实opcode-start PC对应，见[diagnostic_sites.csv](diagnostic_sites.csv)；
仅最先释放且查询≥1000的最多32位点/进程，不是耗时Top排名。源码截断时SHA留null。
所有17个诊断均验证queries=hits+fallback、直接请求/释放平衡、shape引用/释放平衡、最终直接live=0。

实测metadata8B、site40B、entry24B、三层chain32B。GDB对实际Release制品读取的
完整JSFunctionBytecode sizeof由A的128B增为E的152B（见post_identity.json）；
新增头字段为24B，实际分配还受可选debug部分与allocator舍入影响，不能只数site结构。
诊断新增旁数组/头字段会改变布局和GC，不参与Release计时。峰值只覆盖本N1轨迹中E请求的
metadata/vector/PIC/chain字节，不包含shape保活、RSS或正式selectedN峰值；这些仍UNKNOWN。
原生回归还实际观测到：A在第五对象写入前已释放4个原型图中的资源，
E在此时尚未释放，转GENERIC后才释放4个（additional_gate的before/after记录）。
这证明强引用延长了该测试中资源生命周期；最终释放不等于间接保活没有代价，
也不能把这4个对象的小测试数量外推成Octane峰值。
高命中不等于净收益：入口判断、vector/state维护、强引用/COW、分配及普通回退都可能付费，
本轮总时间并未分别量出它们，不能反算“每次miss”或某helper的精确成本。

修复后的own-store miss在写入后重查当前属性以免保留失效指针。
store_refresh及store_refresh_inactive单列该重查总数、其中无反馈/已GENERIC的次数；
这是本冻结实现真实保留的工作，不为追求结果而在中途删除。

## 6. 覆盖、限制与下一步

Box2D三条件均可运行，但world保存在函数局部、原20次step没有独立完整最终结果oracle，
保留RUNS_NO_TRUSTED_OUTPUT_GATE覆盖行，不伪造checksum也不称引擎不兼容。
zlib纳入扩展集合，冻结源码/数据不变，原长度与strcmp断言仍有NUL边界限制。
zlib独立N1观察三条件read_events均为空，正式zlib的N也为1，未进入两shell的
binary-read返回类型差异路径，见[zlib_host_diagnostic.json](zlib_host_diagnostic.json)。
这不代表qjs的Uint8Array与d8的ArrayBuffer宿主API一般等价。
Splay/Mandreel官方latency指标未纳入本Run毫秒指标。

这些结果只回答本平台、此冻结实现和此协议下的整体净成本及距V8的距离。
keyed/global仍用A路径，原型链没有validity cell，反馈强引用与V8弱引用不同；
代码布局、编译器决策和GC变化未被单独隔离。不能把剩余差距全归IC、dispatch或某个helper，
也不能把本实现未获收益推广成IC不能优化QuickJS。

另有可知时钟限制：1530条的原生单调序列无重叠；UTC标签出现回跳，其跨度比单调
跨度少约91.25秒，原因UNKNOWN。UTC仅作溯源，未用于N校准、内部时间或ratio。
所有原生内部区间仍通过外部单调区间包围检查。详见[时钟说明](clock_limitations.md)，
不将本WSL单批约1.15%的差异推广为跨主机/OS的普遍结论。

下一步只建议检查“无反馈/已GENERIC的named-store为何仍支付更新前重查”：
已有独立计数可以定位其实际频率，但还没有该步骤的独立净耗时证据。
如需验证，必须预先定义新的受控干预；本轮不自动修改命中路径或增加优化变体。

## 7. 完成与复现

独立审计PASS_COMPLETE：1530/1530正式记录有效，每case每条件30条，六排列各5、
每条件每位置10；无缺失/重复；命令、flags、脚本/制品hash、同boot和串行次序一致。
正式偏短记录保留，数目见[summary/audit.json](summary/audit.json)。
只读重算：`python analyze.py --output replay_01`，无需WSL或旧/home二进制；
构建/采集入口另见[README](README.md)。attempt01未混入，原A/d8未替换，未提交/推送。
Windows独立重算已实际完成，17项时间、51项比值与6个suite聚合与WSL输出在
1e-12容差内一致；[delivery_audit.json](delivery_audit.json)记录检查及文件规模。
'''
    dest=HERE/'results.md';assert not dest.exists();dest.write_text(text,encoding='utf-8')
    print('Wrote results.md from finished same-campaign records')
if __name__=='__main__':main()
