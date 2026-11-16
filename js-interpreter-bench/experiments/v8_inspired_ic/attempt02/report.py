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
[设计](design.md)说明保护及生命周期。未迁移validity cell、弱Map/holder、
constant handler、共享mega stub cache、keyed/global handler；不是完整V8 IC移植。
E链守卫仍需逐层检查，强引用仍会保活并增加COW/GC边，不能称与V8成本等价。

首次attempt01在新增C API回归中失败，原558条数据保留但不用于性能结论。
attempt02只修复store miss的提交/缓存更新顺序，重新构建并完整新采集。
没有按正式结果调参或混入旧E。[修复说明](repair_notes.md)及
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
    text+=f"\n17项按E/A逐项探索性区间：改善{counts['numerator_faster']}、退化{counts['numerator_slower']}、方向不明确{counts['unclear']}，版本独有正式失败0。\n"
    text+=f"最大耗时增加点估计为{worst['case']}，E/A={float(worst['point']):.4f}（{float(worst['time_change_percent']):+.2f}%）；最小为{best['case']}，E/A={float(best['point']):.4f}（{float(best['time_change_percent']):+.2f}%）。\n"
    for group in ['core16_13suite','expanded17_14suite']:
        a={r['ratio']:r for r in agg if r['set']==group};r=a['E/A'];e=a['E/V8_ON'];v=a['A/V8_ON']
        verdict='整体净耗时下降' if r['CI95_high']<1 else '整体净耗时增加' if r['CI95_low']>1 else '整体方向不明确，不能认定净优化'
        text+=f"\n{group}：{verdict}。E相对A耗时点变化{100*(r['point']-1):+.2f}%。归一化到V8的耗时由{v['point']:.4f}变为{e['point']:.4f}，差值{v['point']-e['point']:+.4f}个V8单位；这不是IC单项成本或纯执行成本分解。\n"
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
    text+='''
完整named/keyed/global类别、handler更新、分配与释放见[diagnostic_summary.csv](diagnostic_summary.csv)。
位点按函数debug源码SHA、进程内实例、真实opcode-start PC对应，见[diagnostic_sites.csv](diagnostic_sites.csv)；
仅最先释放且查询≥1000的最多32位点/进程，不是耗时Top排名。源码截断时SHA留null。
所有17个诊断均验证queries=hits+fallback、直接请求/释放平衡、shape引用/释放平衡、最终直接live=0。

实测metadata8B、site40B、entry24B、三层chain32B，另有bytecode头、allocator开销和间接保活。
诊断新增旁数组/头字段会改变布局和GC，不参与Release计时。峰值只覆盖本N1轨迹中E请求的
metadata/vector/PIC/chain字节，不包含shape保活、RSS或正式selectedN峰值；这些仍UNKNOWN。
高命中不等于净收益：入口判断、vector/state维护、强引用/COW、分配及普通回退都可能付费，
本轮总时间并未分别量出它们，不能反算“每次miss”或某helper的精确成本。

## 6. 覆盖、限制与下一步

Box2D三条件均可运行，但world保存在函数局部、原20次step没有独立完整最终结果oracle，
保留RUNS_NO_TRUSTED_OUTPUT_GATE覆盖行，不伪造checksum也不称引擎不兼容。
zlib纳入扩展集合，冻结源码/数据不变，原长度与strcmp断言仍有NUL边界限制。
zlib的独立host read调用观察见[zlib_host_diagnostic.json](zlib_host_diagnostic.json)；
不将qjs二进制read的Uint8Array与d8的ArrayBuffer笼统称完全等价宿主API。
Splay/Mandreel官方latency指标未纳入本Run毫秒指标。

这些结果只回答本平台、此冻结实现和此协议下的整体净成本及距V8的距离。
keyed/global仍用A路径，原型链没有validity cell，反馈强引用与V8弱引用不同；
代码布局、编译器决策和GC变化未被单独隔离。不能把剩余差距全归IC、dispatch或某个helper，
也不能把本实现未获收益推广成IC不能优化QuickJS。

下一步只建议从“新增named-store/反馈维护的净成本”挑一个可验证问题：
在覆盖频率、创建/分配与正式时间方向不一致的case中，确认是否有大量已GENERIC或
冷site仍支付入口/metadata成本；先取得同一位置的动态证据，不自动添加新优化或新变体。

## 7. 完成与复现

独立审计PASS_COMPLETE：1530/1530正式记录有效，每case每条件30条，六排列各5、
每条件每位置10；无缺失/重复；命令、flags、脚本/制品hash、同boot和串行次序一致。
正式偏短记录保留，数目见[summary/audit.json](summary/audit.json)。
只读重算：`python analyze.py --output replay_01`，无需WSL或旧/home二进制；
构建/采集入口另见[README](README.md)。attempt01未混入，原A/d8未替换，未提交/推送。
'''
    dest=HERE/'results.md';assert not dest.exists();dest.write_text(text,encoding='utf-8')
    print('Wrote results.md from finished same-campaign records')
if __name__=='__main__':main()
