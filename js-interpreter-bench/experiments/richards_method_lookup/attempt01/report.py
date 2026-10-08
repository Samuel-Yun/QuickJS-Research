"""Generate reports from independently audited artifacts; no engine invocations."""
import collections, csv, json, statistics
from pathlib import Path
import common as c

def csvrows(p):
    with Path(p).open(newline='') as f: return list(csv.DictReader(f))
def table(rows,keys):
    def fmt(x):
        try: return f'{float(x):.6f}' if '.' in str(x) else str(x)
        except ValueError: return str(x)
    return '| '+' | '.join(keys)+' |\n|'+ '|'.join('---' for k in keys)+'|\n'+''.join('| '+' | '.join(fmt(r[k]) for k in keys)+' |\n' for r in rows)

def main():
    audit=c.read(c.HERE/'summary/formal_audit.json');diag=c.read(c.HERE/'diagnostics/audit.json');m=c.manifest()
    if audit['status']!='PASS' or diag['status']!='PASS': raise RuntimeError('audit not PASS')
    windows=c.read(c.HERE/'source_evidence/archive_audit.windows.json');linux=c.read(c.HERE/'source_evidence/archive_audit.linux.json')
    if windows['archives_sha256']!=linux['archives_sha256'] or windows['entry_hashes_after_git_export']!=linux['entry_hashes_after_git_export']: raise RuntimeError('cross-platform archive mismatch')
    paths=['source_evidence/historical_bytes.zip','microbench/design_bytes.zip','microbench/formal_bytes.zip','microbench/A.source.js','microbench/B.source.js']
    attrs=c.capture('audit.git_attributes',['git','-c','safe.directory='+str(c.ROOT.parent),'check-attr','text','--']+[str((c.HERE/p).relative_to(c.ROOT.parent)) for p in paths],cwd=c.ROOT.parent)
    if attrs['exit_code']!=0 or any(not line.endswith(': unset') for line in attrs['stdout'].splitlines()): raise RuntimeError('canonical Git attributes')
    history=c.read(c.HERE/'source_evidence/byte_audit.json');t=csvrows(c.HERE/'summary/per_variant.csv');contrasts=csvrows(c.HERE/'summary/contrasts.csv');ratios=csvrows(c.HERE/'summary/engine_ratios.csv')
    qratio={r['variant']:1/float(r['V8_over_QJS']) for r in ratios};sel=audit['selected_N']
    stattable=table(t,['variant','engine','N','samples','median_ms_per_Run','mean_ms_per_Run','sample_stddev','tukey_halves_IQR','min','max'])
    contrasttable=table(contrasts,['engine','A_median_ms','B_median_ms','B_over_A']);ratiotable=table(ratios,['variant','V8_over_QJS','JSC_over_QJS','JSC_over_V8'])
    unchanged=sum(r['matches_recorded'] for r in history['records']); gitdiff=sum(r['git_blob_sha256']!=r['recorded_sha256'] for r in history['records'])
    countertable='|输入|选定方法查找(N512)|原型跳数|TCB.run调用|native .call helper|\n|---|---:|---:|---:|---:|\n|original|3365376|1|3365376|0|\n|A|3365376|1|3365376|3365376|\n|B|512|1|3365376|3365376|\n'
    source="""## 事实—调用点与实际路径

选中 `Scheduler.schedule -> currentTcb.run()`，不是所有同名 run，也不是
own state 读取。`source_evidence/sites.csv` 列出原定义：TCB 与四类 task
方法在各自 prototype；currentTcb/task/state/queue 是 own 数据属性。
TCB.run 完整保留出队、state 更新及 task.run；Scheduler、Packet、全部 task
方法和调度输入都未缩减。原型方法在脚本初始化后不被替换。

计数的接收者归属是 atom + 接收者直接原型 identity；函数计数按目标函数
identity。task.run 独立分类，不能与 TCB.run 混合。诊断 begin/end 在 Run
循环外包围计时区，Setup/输出/后置校验不计数。链步数为 prototype 跳数，
不是 find_own_property 的总测试次数：一跳意味着接收者+其原型两次测试。

固定源码 quickjs.c:19107–19170 的 GET_FIELD_INLINE 首先 find_own_property，
再沿 shape->proto；此普通数据命中路径不调用 JS_GetPropertyInternal。
8210ff 是 fallback helper，选定输入中零次；不能由 helper 热度猜总 lookup。
原调用 get_field2 run -> call_method0 -> JS_CallInternal (18220ff/17746ff)。
A/B 为 get_field2 call -> call_method1 -> native js_function_call
(41240ff) -> JS_Call -> JS_CallInternal。A/B 计数证实相同 helper 频率。

`diagnostics/counter_summary.csv` 每条件3个独立进程；各 task.run 又有
3,365,376 次一跳 lookup，B 没有移除它们。own hit/fallback/hops 仅代表
所分类的属性，绝不概括整个 VM。`diagnostics/overhead_summary.csv` 的
3对原输入过程分别观察到诊断/冻结 elapsed 比1.168744、1.142401、1.043902；
噪声/布局/构建差异仍存在，不是每次计数的精确成本，也不进入正式表。

27个 sequence 探针 = original/A/B × 三引擎 ×3进程，N512；保持原
queueCount2322/holdCount928 断言，3,365,376次调用，接收者 ID 分布一致，
输入/返回/前后 state 摘要都是4133815237。摘要有碰撞可能，不称形式化证明。
实际 code/return/this 不变的源代码审查与原断言共同支持语义一致。

复用旧 profiles，哈希与关联见 `source_evidence/reused_evidence.json`：V8
三份 whole-process top-PC 能看到属性/调用路径，但不能定位到这一个 site
的精确 self-time。JSC 旧 #EaXyiF/#Bkagj7/#DDXQoZ 分别关联 schedule、
TCB.run、predicate，见原 bytecode/函数样本表。没有新的 profiler 正式样本。

## 事实—A/B 改变与保留

`microbench/A.schedule.js` 与 B 是可读片段；完整衍生输入在 *.source.js。
只改变 schedule 的选定调用，原 Run/setup/teardown/断言及所有方法体保留。
两边相同 `.call`，builtin 在 timer 外固定为目标函数的 own 非可写属性；
该函数布局变化也属于派生设计，不能忽略。B 缓存发生每次 schedule 开头，
共N次且在 timer 内。没有提前调用 workload。不是任意 JS 合法的缓存：
有 own override/getter/Proxy、方法或原型修改时语义可能不同。

特别限定：A 的 `this.currentTcb.run` 还包含循环内一次额外的 own
currentTcb 读取和方法局部赋值；B 连同 inherited run lookup 一起把它们
移出内层循环。调用操作保持一致，但这不是“只去掉一次 prototype lookup”
的纯成本实验。不能把全部改善归给 prototype traversal。

真实 bytecode 见 `source_evidence/{A,B}.*.schedule_bytecode.txt`。V8 两边
94-byte/5-register schedule，同一 CallProperty1，run load 位于循环内/外。
QuickJS 同一 call_method1/native .call 链，属性计数一致。JSC 两边 op_call
且都有 jneq_ptr 的 Function.prototype.call identity guard、直接调用分支
和 .call fallback：不能假定 JSC 真的每次走 native .call helper。相同
JS call 方式并不使三 VM 的内部实现完全相同；正式 flags 保持 LLInt。

## 假设—证据—判断

事前 H1 要求 QuickJS 的 B/A 小于 V8，且 V8/QJS 向1移动；H0/替代解释
和否定条件已经冻结在 protocol/design 中，早于本轮 correctness/pilot/formal。
计数支持减少选定方法准备的机制；新正式点估计支持 H1 的方向：QuickJS
改善较大，QJS/V8 差距小幅收窄，但并未接近相同速度。结论是“该位置的
方法查找准备值得进一步检验”，不是“已证明它解释原 Richards 的多少%”。
局部赋值、额外 own 读取、字节码布局、引用计数、对象/IC/GC 状态及 .call
实现差异仍是替代解释。源码存在 traversal/IC 不能证明瓶颈或缓存命中率。

## 限制与 UNKNOWN

- 指标是 first-call-inclusive interpreter-mode derived execution，不是 pure
  interpreter-loop self time。Setup/source loading/输出在外；首次 Run、原
  Run 构造、调用、GC/helper/builtin/断言/残留 frontend 在内。JSC 首次
  函数准备仍可能在内；没有声称全部 frontend 被排除。
- 正式每组30个新进程，未做 warmup/trace/profile/counter/preload，串行；
  首次调用状态随 N 改变仍可能影响结果。一个 WSL 主机不是独立机器样本。
- WSL guest 诊断与正式进程组可能重启（boot_id 分开保存）；正式完整
  campaign 同一 boot，CPU/OS/arch/kernel/runtime/deps 未变。
- 未锁 CPU 频率/affinity。WSL cpufreq/governor、真实功耗/温度及 Windows
  后台宿主负载 UNKNOWN；PS/load-average 是可观察的 guest 快照/采样记录。
- selected lookup/call 的精确 self-time、每次 lookup 成本与原总耗时占比
  UNKNOWN；没有将派生改善百分比投射回旧 Richards。
- d8 制品精确 source commit/compiler/GN args 仍 UNKNOWN；官方版本-tag
  只是参考，冻结 SHA/运行时证据没有变。JavaScript JIT tier 关闭不等于
  所有 native generated code 关闭。此 Richards 无 regexp workload，但仍
  用 native builtin；三边 RegExp 策略沿用旧 manifest/机制记录，未新验证。
- 历史字节审计覆盖 Code Cache 全部唯一脚本身份及白盒 original 当前
  文件归档；不是对所有旧项目输入的全面历史恢复证明。
- NG v0.8.0 已通过官方源文件查看器检查 own-slot PIC；tag/短revision
  固定，全40-digit revision/本地完整源文件 SHA UNKNOWN。后续 NG 全部
  缓存覆盖 UNKNOWN，TLS 失败日志保留，无证书绕过。

## 一手实现与唯一下一步

`source_evidence/prior_art.md` 查阅 ECOOP1991 PIC、V8 properties、WebKit
metadata 及 NG v0.8.0。NG 当时四-shape/offset ring 的 fill 限制 own
property (`proto_depth==0`)，不能由这套 own-slot PIC 推断 inherited
TCB.run 已被缓存。官方 PR884 还记录后来删除历史 IC；不能依赖泛化文档
断言当前版本包含它。PIC/方法缓存/调用特化都不是本轮的新颖性贡献。

唯一建议：后续先验证一个受 shape/原型版本/own shadowing 约束的小型
inherited-method cache 能否以较小 guard/初始化/内存成本回收该机会；
在独立 upstream-revision 原型中保留 getter/Proxy/删除重定义/原型变更
fallback、this/返回/副作用语义，并测 hit/miss、失效、内存/GC 引用保留。
现有 NG v0.8.0 own-slot 机制不是这类 inherited site 的充分对照；必须
比较已有 prototype-cache 技术，不能宣称新颖或保证论文产出。本轮不实现。
"""
    text=f"# Richards 方法查找准备：实际结果\n\n状态：COMPLETED_WITH_PARTIAL_REFERENCE_PROVENANCE。正式与诊断审计 PASS；NG 本地完整源码制品/40-digit 解析未取得，不伪造。\n\nCohort `{m['cohort']}`，{m['host']}，Ubuntu24.04.2/WSL2/{m['kernel']}/x86_64。\n指标 `{c.MODE}`；每组N={sel}，正式 **180/180**，N1/N2 **12/12**，selected-N **6/6**；pilot60记录。\n\n{source}\n\n## 正式完整统计（ms/Run）\n\n{stattable}\n\n## B/A（各引擎 B median / A median）\n\n{contrasttable}\n\n## 引擎 ratio（均为同一派生变体的组 median 比）\n\n{ratiotable}\n\nQJS/V8：A={qratio['A']:.6f}，B={qratio['B']:.6f}；差距收窄但 QJS 仍更慢。\n\n## 计数诊断（不是性能占比）\n\n{countertable}\n\n## 字节与独立审计\n\n{len(history['records'])}个旧 Code Cache 唯一输入：现存实际文件{unchanged}个已精确匹配运行 SHA，无需复原；{gitdiff}个 Git blob SHA 与运行 SHA 不同。\n现存运行字节和可核对的 recorded 副本已归档。没有重写旧 SHA/raw/统计或批量改换行。\nWindows/Linux archive_audit 对 ZIP→Git tree→git archive→解包再 SHA 的核验均PASS；主仓库索引/分支未改。\n新设计与正式字节同时归档，嵌套 .gitattributes 仅针对本目录。\n`summary/formal_audit.json` 从 stdout 重解析、比较命令/flags/deps/adapter/script哈希、时钟差、每组30/唯一位置/排列与统计CSV；全部PASS。\n六种引擎排列每变体各5，每引擎每位置10；A/B先各15块；低于校准门槛的正式样本{audit['below_threshold_retained']}条，未过滤任何 outlier。\n详细证据入口：raw/journal.jsonl、raw/formal.csv、diagnostics/records、source_evidence、manifest.json；复核见next_commands.md。\n\n已完成本阶段，未推进 VM 优化或下一轮实验。\n"
    c.save(c.HERE/'results.md',text)
    # Append-only source records are canonical; export the actual temporal journal.
    allrecords=[]
    for phase in ('correctness','calibration','selected_correctness','formal'):
        allrecords.extend(c.read(p) for p in (c.HERE/'raw/records'/phase).glob('*.json'))
    c.save(c.HERE/'raw/journal.jsonl',''.join(json.dumps(r,separators=(',',':'))+'\n' for r in sorted(allrecords,key=lambda r:r['timestamp_utc'])))
    env='Cohort: '+m['cohort']+'\nHost: '+m['host']+'\nMetric: '+c.MODE+'\n'
    for k in ('host','os','cpu','memory','disk','compiler','power','background'):
        r=c.read(c.HERE/f'diagnostics/records/environment.{k}.json');env+='\n['+k+'] command='+json.dumps(r['command'])+'\n'+r['stdout']+r['stderr']
    env+='\nCPU affinity/frequency locked: NO\nActual power/temperature/Windows-host background load: UNKNOWN\nGuest load averages and boot IDs: per-record journal\nCompiler/build/runtime flags: manifest.json and source_evidence/diagnostic_build.json\n'
    c.save(c.HERE/'environment.txt',env)
    capabilities={'formal_status':'PASS','original_runtime_mode_reverification':'not repeated: artifacts/deps/adapters unchanged; frozen prior probes retained','new_diagnostics':{'quickjs_segmented_counters':'PASS','three_engine_sequence_27_processes':'PASS','actual_A_B_bytecode':'PASS','new_profiling':'NOT_RUN; previous three-replicate V8/JSC profiles reused','quickjs_perf_self_time':'UNKNOWN; old capability limits retained','d8_helper_self_time':'UNKNOWN','jsc_call_intrinsic_specialization':'bytecode identity guard/direct fast call shown in BOTH variants','all_frontend_excluded':None},'formal_counts':audit,'reference_local_download':'BLOCKED_TLS_CERTIFICATE; bounded failures kept, no bypass','NG_viewed_version':'v0.8.0 / displayed4822912; full SHA UNKNOWN','NG_fixed_source_view':'official source viewer, relevant line coverage in prior_art.md'}
    c.save(c.HERE/'capabilities.json',capabilities)
    c.save(c.HERE/'audit.json',{'status':'COMPLETED_WITH_PARTIAL_REFERENCE_PROVENANCE','formal':audit,'diagnostics':diag,'old_inputs':{'unique_code_cache_identities':len(history['records']),'actual_matches_recorded':unchanged,'git_blob_differences':gitdiff,'archive_git_export_windows_linux':'PASS','unrestored_in_audited_scope':history['unknown'],'repository_wide_historical_recovery':'NOT_CLAIMED'},'runtime_and_old_file_final_check':'performed separately by completion_check.py','reference_source_review':'fixed-version official view completed; local full-file artifact/revision PARTIAL','unknown':['lookup/call self-time','original Richards fraction explained','fully excluded JSC frontend','V8 artifact source/toolchain','NG full local source hash/40-digit v0.8 resolution','host power/temperature/frequency']})
    meeting=f"""# 六页组会提纲（只报告真实已完成工作）

## 第1页：已有基线与本轮唯一问题

旧同WSL cohort Richards QJS/V8/JSC median3.644672/2.245410/2.137383 ms/Run
（whitebox summary/baseline_recomputed.csv），不是旧Windows数据。已有own-state
对照没有支持QJS特别受益。本轮只问 inherited-method 查找准备是否是部分
差距候选；不重新排名全部benchmark，不优化正式VM。

## 第2页：原 Richards 的真实调用点

Schedule→TCB.run→四类task.run；state/task/currentTcb 是own，run是prototype。
每Run6573次选定调用；保留完整调度、出队/state/task/packet和2322/928断言。
展示source_evidence/original.schedule.js及microbench/A.schedule.js/B.schedule.js。
无getter/Proxy/override/原型变更是此缓存合法性的必要输入限制。

## 第3页：诊断路径而非耗时占比

独立O2 GCC13.3计数构建，原N512，选定 lookup3365376次/一跳/无fallback；
B降到512但函数调用仍3365376。Begin/end只包围Run循环。27个独立语义
sequence探针全部一致。A/B都有同一QJS.call helper；JSC有.call intrinsic
identity guard的direct-call分支。复用旧whole-process profiles，不当self-time。

## 第4页：A/B实际结果（180/180，新进程，无warmup）

{contrasttable}
V8/QJS：{float(ratios[0]['V8_over_QJS']):.6f}→{float(ratios[1]['V8_over_QJS']):.6f}；
QJS/V8：{qratio['A']:.6f}→{qratio['B']:.6f}。QJS改善较大，但仍明显更慢。
N512是从内部1000ms公共门槛重新校准；全部排列/位置平衡。

## 第5页：计时与因果边界

first-call-inclusive interpreter-mode derived execution；不是pure loop。
Setup外；原Run构造/首次调用/GC/helper/builtin/断言/残留准备内。
B缓存每Run内部一次，未移到外部warmup。A额外own currentTcb读取/局部
赋值也被移动，布局/IC/GC/builtin仍可能混杂；改善不能等于原lookup百分比。
旧45输入实际SHA精确保留，21Gitblob差异；ZIP/Git导出跨平台验证通过。

## 第6页：下一步候选与需要导师澄清

唯一候选：轻量 inherited-method cache 的guard/失效/内存成本是否值得？
已有PIC/NG v0.8 own-slot缓存并非新颖；历史IC已被NG删除，不能照泛化文档。
需保留own shadowing、getter/Proxy/原型变更、this/副作用及fallback语义，
本轮未实现。没有保证CGO/CCF B产出。
请导师确认模糊转写的引擎名称和“0.7/0.8”指什么；不把它解释成指定
WebKit revision或IC on/off实验授权。已独立完成可执行研究，不因转写暂停。
"""
    c.save(c.HERE/'meeting_notes.md',meeting)
    print('REPORTS_SAVED 180/180',flush=True)

if __name__=='__main__': main()
