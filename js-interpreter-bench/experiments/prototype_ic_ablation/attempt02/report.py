"""Render tables from finished public analysis; never runs an engine."""
import csv
from common import *

def table(headers,rows):
    return '\n'.join(['|'+'|'.join(headers)+'|','|'+'|'.join(['---']*len(headers))+'|']+['|'+'|'.join(map(str,r))+'|' for r in rows])

def main():
    audit=read(HERE/'analysis/audit.json');ind=read(HERE/'independent_audit.json')
    assert audit['status']=='COMPLETE' and ind['status']=='PASS'
    with (HERE/'analysis/summary.csv').open(encoding='utf-8',newline='') as f:summary=list(csv.DictReader(f))
    with (HERE/'analysis/ratios.csv').open(encoding='utf-8',newline='') as f:ratios=list(csv.DictReader(f))
    def median(case,c,metric):return float(next(r['median'] for r in summary if r['case']==case and r['condition']==c and r['metric']==metric))
    primary=table(['案例','M ms/Run','H ms/Run','OFF ms/Run','ON ms/Run'],[[k]+[f'{median(k,c,"internal_ms_per_Run"):.6f}' for c in CONDS] for k in CASES])
    labels={'numerator_faster':'分子较快','numerator_slower':'分子较慢','unclear':'方向不明确'}
    ratio_table=table(['案例','比较','比值','耗时变化%','比值95%区间','变化率95%区间%','区间判断'],[[r['case'],r['ratio'],f'{float(r["point"]):.5f}',f'{float(r["time_change_percent"]):+.2f}',f'[{float(r["CI95_low"]):.5f}, {float(r["CI95_high"]):.5f}]',f'[{float(r["CI95_change_low"]):+.2f}, {float(r["CI95_change_high"]):+.2f}]',labels[r['status']]] for r in ratios])
    external=table(['案例','M 外部/CPU','H 外部/CPU','OFF 外部/CPU','ON 外部/CPU'],[[k]+[f'{median(k,c,"external_ms_per_process"):.2f} / {median(k,c,"child_CPU_ms_per_process"):.2f}' for c in CONDS] for k in CASES])
    stability=[]
    for group in range(2):
        d=read(HERE/'stability'/f'group{group}.json')
        stability.append([group,d['cpu'],f'{d["median"]:.3f}',f'{d["Q1"]:.3f}',f'{d["Q3"]:.3f}',f'{100*d["IQR_over_median"]:.3f}%',f'{d["max_over_min"]:.5f}','PASS' if d['passed'] else 'FAIL'])
    stable_table=table(['组','固定CPU','内部median ms','Q1','Q3','IQR/median','max/min','门槛'],stability)
    body='''# M/H/OFF/ON 同批续跑结果：384/384有效

'''+primary+'''

以上均为内部 ms/完整 Run 的中位数，每格24个独立新进程。prototype_method、
own_integer、numeric_control 的每 Run 均含4096轮；Richards为原完整 Run。
M为原单槽own-only IC，不是原版A；H为原受限一层原型IC；OFF/ON是同一switch ELF。
首个Run计入、没有workload预跑；不是每次全冷或属性查找self-time。

## 四个关键比较

'''+ratio_table+'''

比值=分子内部ms/Run中位数÷分母中位数；小于1分子更快；变化率=100×(ratio−1)。
所有384条均有效，24个完整16进程轮块共同重采样10000次，seed20261029；
区间为探索性95%线性百分位区间，未做多重比较校正。跨1记方向不明确，
不跨1也不称为经多重检验确认的显著结果。numeric_control的ON/H下界仅1.00012，
接近1，应特别谨慎，不能把格式化舍入误读为精确零变化。

## 这批数据回答什么

1. **同一ELF内开启继承缓存有局部净收益。** 原型方法小例和Richards的ON/OFF
   均约0.932，内部耗时分别降低6.78%和6.79%，探索性区间均低于1。
   这是整个开关功能的增量，不是单次命中的纯成本；旧85.1%查找次数减少也不是时间收益。
2. **原H的整合收益受负载限制。** 原型小例H/M=0.94479，约降低5.52%；
   但Richards H/M=1.04679，约增加4.68%。因此Richards中可以同时出现
   “同一switch里ON优于OFF”和“原H没有赢原M”。不能将两个不同ELF的差值全归到某一个分支。
3. **不能假定switch对原H零扰动。** 原型方法和Richards的ON/H区间跨1，
   这不证明零影响；own_integer的ON/H约0.927，区间低于1。数值控制也有边界很近的偏离。
   ON/OFF百分比只直接适用于switch框架，不机械搬给原H。编译器决策、代码布局和公共路径
   的作用尚未分开，本轮没有改源码去追这些因素。
4. **保留H公共实现后仍可有净代价。** OFF/M在own_integer、numeric_control、Richards
   分别约增加8.66%、11.26%、9.58%，区间均高于1；原型小例的OFF/M方向不明确。
   尤其数值控制目标循环没有属性读取，提示不能把所有非目标变化说成原型miss/命中工作。
   own_integer的ON/OFF方向不明确，没有证据说打开继承填充会让该own控制受益。

## 实际做了什么

复用三个冻结ELF及attempt01实际归档JS；SHA、x86_64架构和运行依赖均核验。
没有构建引擎、修改IC或重做64个语义/32个N1/N2/16个诊断门禁。
旧门禁只引用路径/hash和适用范围（reused_evidence.json），本轮新执行465个进程：
预校准1、稳定性24、pilot40、选定N正确性16、正式384；后者才是正式性能样本。

共同N最终为prototype_method=8192、own_integer=32768、numeric_control=32768、
Richards.Richards=512。own_integer在初始N16384有一个984.827ms pilot不足1秒，
按预定规则所有条件共同倍增，保留全部初始pilot；选定N的每条件两次pilot均≥1秒。
16/16新选定N正确性通过，微例独立预期与checksum、Richards原断言未改。

正式24轮，每轮16进程，所有案例的24种条件排列各一次、案例四位置各6次。
全程串行、固定CPU2与同一boot；无诊断trace，未删除异常值、重跑失败位或追加样本。
所有正式样本也均≥1秒（这是事后如实记录，不另行筛选）。
analysis/audit.json和独立independent_audit.json通过；缺失0、重复0。
正式前后ELF/依赖、JS与冻结runner SHA均一致，旧attempt01保持原状态和数据。

## 环境整理和有界检查

平台仍是同一台WSL2 Ubuntu24.04.2/x86_64、Ryzen7 5800H/16逻辑CPU。
本次不是复设旧CPU15再等待：在任何workload运行前，用一次/proc/stat约1秒利用率
差分，按最低忙碌比例/编号规则预选CPU0与唯一备用CPU2；这次16个虚拟CPU均显示0%，
因此实际按并列编号和报告的兄弟集合选0/2，并非测出了CPU2更空闲。没有自有并行编译/诊断任务，
未杀无关进程。首组失败后仅把affinity从0移到已预选2，第二组通过后立即进入pilot。
两组各自标注CPU/cohort，不将第一组混进正式数据；WSL拓扑到宿主物理SMT对应仍UNKNOWN。

'''+stable_table+'''

阈值沿用IQR/median≤10%、max/min≤1.25；Q1/Q3为排序上下半段中位数。
通过只是工程止损线，不保证识别1%效应。与上次相比，实际改变了CPU选择/固定位置，
并增加子进程CPU时间，而不是已经查明频率或宿主调度根因。CPU与时间窗口同时变化，
不能从第二组通过推断“换CPU2解决了波动”。

Windows前/后短区间系统忙碌比例为4.68%/6.62%，不是进程累计CPU；仅是两次快照，
不能代表整个采集期。两次均为电池供电，安静模式，电量64%→44%；本任务未改变电源方案。
频率/温度、逐时宿主背景与调度控制仍UNKNOWN，功耗状态未被连续监控。

## CPU和墙钟辅助证据

'''+external+'''

每格为“外部墙钟中位数 / 子进程CPU中位数”，单位ms/进程；不是内部ms/Run，
也没有用两个中位数相减求初始化或查找成本。RUSAGE_CHILDREN在每个直接qjs子进程
前后差分，仅一个child，记录user/system/合计。它包括整个进程，而非JS区间self-time。

稳定性CPU0组的CPU IQR/median为9.650%、max/min1.27749；CPU2组为8.793%、1.16637，
与内部/外部墙钟同样有变化，不能把本轮波动全解释为等待调度。正式样本中也存在CPU与
墙钟不同的记录，与调度/等待影响相容，但频率和其他执行因素没有分开，不能确定WSL/Windows根因。
逐条记录与顺序见analysis/time_order_cpu_wall.csv；每轮四条件内部时间见per_round.csv。
stage_cpu_wall.csv中混合案例的formal/pilot汇总只作记录，不是可比较的统一工作量指标。

## 仍缺什么，下一步只列候选

新switch sanitizer仍为上轮NOT_COMPLETED_BUILD_INTERRUPTED，未冒充PASS；
本轮没有新安全构建或新计数。动态机制引用旧独立诊断，不能当作本轮逐样本trace。
当前观察支持原型缓存在两个目标负载有局部价值，但不足以支持继续扩张H设计：
Richards原H仍比M慢，own/数值控制还有公共代价，switch也并非所有负载零扰动。
最值得后续检验的是：在稳定接电、记录后台的条件下，H保留的公共执行路径与native布局
分别能解释多少非目标变化。本轮不再实现新策略、不重做样本，也不声称胜过A或接近V8。

复现命令与冻结材料索引见README.md；raw-only analyzer已在Windows Python实际执行，
没有打开Linux ELF或启动引擎。所有旧数据保留，本轮到此停止。
'''
    save(HERE/'results.md',body)
    save(HERE/'decision.md','''# 决策：本批完成；有局部收益，原H整合仍有代价

- 正式384/384有效，24完整块，bootstrap10000；两个独立审计通过。旧attempt01仍为0/384。
- ON/OFF：原型小例及Richards内部耗时各降低约6.8%，探索性区间均低于1。
- H/M：原型小例约降低5.5%，Richards却增加约4.7%；不能把局部价值写成总体净胜M。
- OFF/M：own、数字控制和Richards仍有增加；不能归因成24B、某个helper或纯miss成本。
- ON/H并非全面零扰动，own控制有差异；开关百分比只在当前switch框架解释。
- 不追加当前H容量、策略或命中路径设计。下一轮候选是公共路径/布局的有限归因，
  先改善接电和后台可控性；本轮不自动执行。
- 安全限制仍保留：switch sanitizer未完成，旧H检查不是新switch PASS。

本批只包含M/H/OFF/ON及四个冻结输入，无原版A/V8数据；没有显著性确认或总体引擎排名。
''')
    env=read(HERE/'environment.json');host=read(HERE/'host_windows_retry.json');end=read(HERE/'host_windows_after.json')
    save(HERE/'environment.txt',f'''cohort: WSL2_PROTO_ABLATION_{HERE.name}
host: {env['host']}
CPU: AMD Ryzen 7 5800H; 16 logical CPUs (see archived /proc/cpuinfo)
OS: Ubuntu 24.04.2 under WSL2, x86_64
kernel: {env['kernel']}
boot: {env['boot_id']}
allowed CPUs before binding: {env['allowed_cpu_set']}
first stability CPU: 0; one rearrangement: 0 -> 2; formal CPU: 2
compiler/build flags: reused exact ELF; prior manifest records GCC13.3 -O2 -g -fwrapv, unchanged; no build this campaign
dependencies: libm/libc/glibc2.39/ELF loader; absolute paths and hashes in manifest.json
power plan before/after: {host['power_plan'].strip()} / {end['power_plan'].strip()}
AC status before/after: {host['ACLineStatus']} / {end['ACLineStatus']} (0=battery)
battery percent before/after: {host['battery_percent']} / {end['battery_percent']}
Windows busy fraction before/after (interval delta): {host['system_busy_fraction']} / {end['system_busy_fraction']}
frequency/temperature/continuous host background/physical SMT mapping: UNKNOWN
own parallel work: none started; pre-run snapshot in environment.json
system power/governor/ASLR/WSL/protection changes by this task: none
''')
    save(HERE/'completion.json',dict(**audit,timestamp=stamp(),independent_audit='PASS',old_attempt_unchanged=True,engine_builds=0,new_IC_changes=0,automatic_commits=False,push=False,next_campaign_automatically_started=False,ratios_file='analysis/ratios.csv',unknown=['precise time attribution to lookup/guards/refcounts/layout','continuous frequency/thermal/host scheduling control','new switch sanitizer completion']))
    print('REPORTS_WRITTEN')

if __name__=='__main__':main()
