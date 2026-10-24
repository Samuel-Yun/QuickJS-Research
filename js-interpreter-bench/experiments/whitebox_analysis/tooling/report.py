"""Render evidence-backed reports from independently audited actual data."""
import collections,csv,json,re,statistics
from pathlib import Path
import common as c
from parse_profiles import parse_v8

def rows(path):
    with Path(path).open(newline='') as f:return list(csv.DictReader(f))

def table(data,columns):
    return '| '+' | '.join(columns)+' |\n| '+' | '.join('---' for _ in columns)+' |\n'+''.join('| '+' | '.join(str(row.get(k,'')) for k in columns)+' |\n' for row in data)

def main():
    formal=c.read(c.ATTEMPT/'summary/formal_audit.json')
    if formal['status']!='PASS':raise RuntimeError('formal audit required')
    m=c.manifest();counts=rows(c.ATTEMPT/'summary/function_counts.csv');errors=[]
    for case,n in [('Richards.Richards',512),('NavierStokes.NavierStokes',32)]:
        grouped={}
        for e in c.ENGINES:
            for rep in (1,2,3):
                rr={r['function']:int(r['calls']) for r in counts if r['case']==case and r['engine']==e and int(r['N'])==n and int(r['rep'])==rep}
                if not rr:errors.append('missing original-N function counts')
                grouped[e,rep]=rr
        if any(value!=next(iter(grouped.values())) for value in grouped.values()):errors.append('cross-engine counter mismatch')
    profile_summary=[]
    for p in sorted((c.ATTEMPT/'profiles').glob('*/v8.log')):
        current=parse_v8(p);c.save(p.parent/'top_pc_recomputed.json',current)
        old=p.parent/'top_pc.json'
        if old.exists():
            r=c.read(old)
            for k in ('ticks','top_PC_counts','unknown_top_PC','VM_state_raw','raw_sha256'):
                if r[k]!=current[k]:errors.append('profile parser recomputation mismatch '+str(p))
        regex=sum(n for key,n in current['top_PC_counts'].items() if key.startswith('RegExp:'))
        profile_summary.append({'profile':p.parent.name,'total_ticks':current['ticks'],'regex_code_range_ticks':regex,
            'unknown_top_PC':current['unknown_top_PC'],'parser_sha256':current['parser_sha256'],'scope':'whole process; top PC only'})
    c.export(c.ATTEMPT/'summary/profile_coverage.csv',profile_summary)
    hardware=[];opcodes=[];overhead=[]
    for case,n in [('Richards.Richards',512),('NavierStokes.NavierStokes',32)]:
        for e in c.ENGINES:
            for rep in (1,2,3):
                r=c.read(c.ATTEMPT/'raw'/f'hardware.{case}.{e}.{rep}.json')
                for event,err,bytes_,raw,enabled,running in re.findall(r'WB_PERF (\S+) errno=(\d+) bytes=(-?\d+) raw=(\d+) enabled_ns=(\d+) running_ns=(\d+)',r['stderr']):
                    valid=int(err)==0 and int(bytes_)==24 and int(enabled)>0 and int(running)==int(enabled)
                    if not valid:errors.append('hardware event failed/multiplexed')
                    hardware.append({'case':case,'engine':e,'rep':rep,'original_N':n,'event':event,'raw':int(raw),
                        'enabled_ns':int(enabled),'running_ns':int(running),'valid_unscaled':valid,
                        'whole_child_process_per_Run':int(raw)/n,'scope':'after child barrier before exec through exit; not internal Run only'})
        for rep in (1,2,3):
            r=c.read(c.ATTEMPT/'raw'/f'native_counts.{case}.{rep}.json')
            for opcode,name,count in re.findall(r'WB_OPCODE (\d+) (\S+) (\d+)',r['stderr']):
                opcodes.append({'case':case,'rep':rep,'original_N':n,'opcode':int(opcode),'name':name,'executions':int(count),'scope':'whole process; instrumented diagnostic qjs'})
        values={}
        for v in ('frozen','counter'):
            values[v]=[json.loads(re.search(r'^TEB_RESULT:(.*)$',c.read(c.ATTEMPT/'raw'/f'overhead.{case}.{v}.{rep}.json')['stdout'],re.M).group(1))['elapsed_ms'] for rep in (1,2,3)]
        overhead.append({'case':case,'N':2,'frozen_median_ms':statistics.median(values['frozen']),
            'counter_median_ms':statistics.median(values['counter']),'counter/frozen':statistics.median(values['counter'])/statistics.median(values['frozen']),
            'mode':'DIAGNOSTIC_OVERHEAD; NOT engine ranking'})
    c.export(c.ATTEMPT/'summary/hardware_counters.csv',hardware)
    c.export(c.ATTEMPT/'summary/quickjs_opcodes.csv',opcodes)
    c.export(c.ATTEMPT/'summary/diagnostic_overhead.csv',overhead)
    d=c.read(c.ATTEMPT/'source_evidence/diagnostic_build.json')
    compiler=c.read(c.ATTEMPT/'raw/diagnostic.compiler.actual.json')
    if compiler['stdout']!=d['compiler']['stdout']:errors.append('diagnostic compiler differs')
    mapped=c.read(c.ATTEMPT/'profiles/regexp.mapped/execution_evidence.json')
    if errors:raise RuntimeError('diagnostic audit: '+str(errors))
    caps={'perf_utility':{'status':'NOT_AVAILABLE','version':None,'evidence':'raw/capability.perf_version.json'},
        'perf_event_open':{'hardware_and_software_probe':'PASS','user_space_whole_process_counters':'PASS',
            'events':['cycles','instructions','branches','branch-misses','cpu-clock','task-clock'],
            'sampling_per_event':None,'system_security_changes':False,'identity':c.read(c.ATTEMPT/'raw/capability.actual_identity.json')['stdout']},
        'quickjs':{'sampling_self_time':None,'function_entry_counts':'PASS','native_opcode_and_array_branch_counts':'PASS',
            'isolated_diagnostic_revision':d['revision'],'diagnostic_sha256':d['sha256'],'frozen_binary_replaced':False},
        'v8':{'help_flags_tested':['--prof','--no-logfile-per-isolate','--logfile','--print-bytecode','--print-bytecode-filter'],
            'statistical_top_PC_sampling':'PASS','native_CXX_symbol_resolution':None,'precise_function_self_time':None,
            'trace_regexp_tier_up':'NOT_AVAILABLE_READONLY','artifact_source_commit':None,'compiler':None},
        'jsc':{'sample_switch':'PASS','LLInt_function_hash_and_bytecode_sampling':'PASS','anonymous_hash_source_association':'PASS',
            'CXX_unknown_PC_resolution':'PARTIAL','first_call_frontend_fully_excluded':None},
        'scope':'profiles/counters cover process (startup/frontend/Setup can mix); cannot exchange classification percentages across engines',
        'diagnostic_attempt_failures_retained':True}
    c.save(c.ATTEMPT/'capabilities.json',caps)
    nonzero=[]
    for p in sorted((c.ATTEMPT/'raw').glob('*.json')):
        r=c.read(p)
        if 'exit_code' in r and r['exit_code']!=0:nonzero.append({'record':p.name,'exit_code':r['exit_code'],'stderr':r['stderr'],'command':r['command']})
    c.export(c.ATTEMPT/'summary/diagnostic_nonzero_outcomes.csv',nonzero)
    audit={'status':'COMPLETED_WITH_PARTIAL_PROFILING','formal_experiment':'PASS','formal':formal,
        'baseline_raw_recomputation':'PASS','old_files_runtime_adapter_hashes':'PASS','counter_correctness_cross_engine':'PASS',
        'diagnostic_native_build_compiler_revision':'PASS','profile_parser_recomputation':'PASS',
        'profiling_coverage':'PARTIAL: QJS lacks sampling self-time; V8 native symbols and exact internal-Run filtering unknown',
        'regexp_generated_executable_PC_evidence':{'regex_ticks':mapped['regex_ticks'],'executable_map_hits':mapped['ticks_in_observed_executable_mapping'],
            'status':'OBSERVED' if mapped['ticks_in_observed_executable_mapping'] else 'UNKNOWN'},
        'no_optimization_of_frozen_VM':True,'old_full_formal_rebenchmark':False,'new_engines_or_migration':False,
        'frontend_complete_exclusion':None,'artifact_V8_source_commit':None,'advisor_engine_version':None,
        'paper_novelty_established':False,'formal_audit_sha256':c.sha(c.ATTEMPT/'summary/formal_audit.json')}
    c.save(c.ATTEMPT/'audit.json',audit)
    per=rows(c.ATTEMPT/'summary/per_variant.csv');contrasts=rows(c.ATTEMPT/'summary/contrasts.csv');ratios=rows(c.ATTEMPT/'summary/engine_ratios.csv')
    formatted=[{'变体':r['variant'],'引擎':r['engine'],'N':r['N'],'median(ms/Run)':f"{float(r['median_ms']):.6f}",
        'mean':f"{float(r['mean_ms']):.6f}",'std(n−1)':f"{float(r['sample_stddev_ms']):.6f}",'IQR':f"{float(r['IQR_ms']):.6f}",
        'min':f"{float(r['min_ms']):.6f}",'max':f"{float(r['max_ms']):.6f}"} for r in per]
    formatted_con=[{'组':r['group'],'引擎':r['engine'],'B/A':f"{float(r['B/A']):.6f}",'变化':f"{(float(r['B/A'])-1)*100:+.2f}%"} for r in contrasts]
    r_fields={r['engine']:float(r['B/A']) for r in contrasts if r['group']=='richards'}
    r_navier={r['engine']:float(r['B/A']) for r in contrasts if r['group']=='navier'}
    report='''# 白盒分析与小型机制对照：已实际完成

## 完成状态与事实

WSL2 Ubuntu24.04.2/x86_64，cohort wsl2-ubuntu2404-x64-20261004。
正式指标 MAIN_MONOTONIC_V1_DERIVED：first-call-inclusive interpreter-mode
execution 的 elapsed/N。4变体×3引擎×30新进程=360/360有效样本；两组N均256。
N1/2 correctness24/24，selected-N独立复核12/12；原始断言不放宽。
六排列各5次，每引擎每位置10次，固定seed交错变体。保留outlier及失败诊断。
完整旧基线未重跑；原始CSV目标9组270样本复算与旧summary一致。

重要证据：[正式独立审计](summary/formal_audit.json)、[raw](raw/formal.csv)、
[冻结协议](protocol.md)、[设计时间/hash](microbench/design.json)、[schedule](microbench/schedule.json)。
总审计 COMPLETED_WITH_PARTIAL_PROFILING：正式实验PASS，但不能把缺少的
QuickJS采样self-time、原生符号或frontend证明伪装PASS。

## 完整派生统计（ms/Run）

'''+table(formatted,list(formatted[0]))+'\n## 组内B/A（median B / median A）\n\n'+table(formatted_con,list(formatted_con[0]))+'\n## 引擎比值（同一变体median）\n\n'+table(ratios,list(ratios[0]))+f'''
## Richards：事实→假设→证据→判断

原调度器每Run状态谓词10671次；V8实际GetNamedProperty top-PC样本突出，
JSC匿名函数hash关联到schedule/谓词/TCB.run。参见[cases/richards/evidence.md](cases/richards/evidence.md)。
派生缓存字段合法且校验一致，QJS动态get_field由393224降到262152（含公共driver）。
固定QJS属性handler进行shape属性查找；固定JSC缓存StructureID/offset路径在
实际lib汇编中可见。它们是具体路径证据，不是IC命中率或精确耗时归因。

预期QJS缓存收益可能大于其他引擎；实际B/A：QJS{r_fields['quickjs']:.4f}、
V8{r_fields['v8']:.4f}、JSC{r_fields['jsc']:.4f}。
字段读取敏感性按点估计获得支持，但“QuickJS尤其受益”的相对预测没有得到
观察支持。未进行IC开关或单机制因果隔离；没有据此拒绝统计H0或证明IC解释
了原Richards全部差距。新增局部访问、字节码/分支布局和调用被移除也是混杂项。

## NavierStokes：反例与表示敏感性

旧同cohort是QJS61.663120<V874.770359，但JSC58.624688最快。
JSC原N32采样lin_solve占主要函数样本；V8出现Add/keyed访问/循环等具体路径。
QJS原N32计数105969638次get_array_el走in-handler Array分支（其他opcode未计入）。
派生同数值核的333316次读取：Array全走该分支，F64全进入helper分支。
helper本身已有Float64Array专门的bounds/load，不能说每次都做通用属性哈希。
参见[cases/navier_stokes/evidence.md](cases/navier_stokes/evidence.md)。

改成F64，B/A：QJS{r_navier['quickjs']:.4f}、V8{r_navier['v8']:.4f}、
JSC{r_navier['jsc']:.4f}。表示敏感性以及QJS方向预测获得观察支持；它不等于
已经测出helper本身的成本。TypedArray并不保证解释器更快；普通Array与typed
的storage、tagging、类型转换、边界测试/专门化等同时变化。
两组保留的工作不同：Richards偏属性/调用/分支，solver偏大量算术/索引读写。
这是相对关系不同的有证据的路径描述，仍不能完整解释原案例的速度差。

## RegExp运行时边界

原N64三引擎各3个诊断进程，不是新的正式性能矩阵。
V8 trace-regexp-tier-up在此制品为readonly，失败日志保留；--prof实际可用。
额外live-maps诊断：{mapped['regex_ticks']}个RegExp tick PC，其中
{mapped['ticks_in_observed_executable_mapping']}个落在实际进程观察到的可执行映射中，
并与注册的RegExp代码区间对应，见[原始关联证据](profiles/regexp.mapped/execution_evidence.json)。
这支持实际native正则执行，不只是允许生成代码。不能据此估计整个Run的精确
native占比或所有pattern覆盖。JSC固定源码useJIT=false会关闭useRegExpJIT，
Yarr解释路径仍有RegExp分类样本；该分类本身不代表正则JIT。
QJS调用C libregexp。JS-JIT-off并非所有runtime-generated-code-off，不能把
正则速度差当作通用JS dispatch优势。

## 诊断能力与边界

perf命令不存在，但perf_event_open实际读取硬件/软件事件成功。小型C wrapper
收集三重复的whole-child-process计数，enabled=running，无伪造软件cycles。
它覆盖exec/VM/frontend/Setup等，不是仅内部Run；WSL vPMU也不是原生Linux等价保证。
V8/JSC软件采样各原案例三独立进程，QJS采用可验证函数计数/原生opcode计数。
QJS单独GCC13.3/-O2诊断构建保留patch/hash/correctness/开销对照，不替换冻结binary，
不用于引擎排名。详见[能力](capabilities.json)、[开销](summary/diagnostic_overhead.csv)。
whole-process占比不是内部计时占比，opcode次数不是时间；引用计数成本散布于handler/helper，
不能按GC标签代替全部内存管理成本。V8本地分类器只关联top-PC，没有完整栈/inline或C++符号解析。

## 可以说、不能说和UNKNOWN

可以说：两个明确片段的对照实际完成；字段读取/数值表示会改变当前解释器配置
的时间关系，原案例相关路径得到运行证据支持。不能说：差距全来自IC/dispatch，
computed goto已证明瓶颈，或已经得到pure-loop self time。
JSC首次准备仍可能在内部；单调时钟只是修复计时，不是frontend完全排除证明。
代表性静态函数QJS/V8诊断bytecode在stdout timer标记前可见；JSC分流日志不能
证明生成顺序。动态编译/GC/helper/builtin仍是实际成本。N内状态/IC并非每Run冷态。
V8制品精确source/compiler/GN、精确Run内各成本、每样本功耗/频率/温度/后台隔离
均UNKNOWN。历史Windows不参与本轮相除。NG具体实现版本未固定，仅查阅官方文档。
导师引擎名与“0.6/0.7/0.8”仍待原录音确认，不能声称指定WebKitcommit或IC实验。

## 下一轮候选问题（本轮不实现）

1. 原Richards的prototype method查找/调用准备，是否比冗余own-state读取更值得研究？
   证据是原调用频率与属性/entry/call采样，而简单state缓存收益并未特别偏向QJS。
   最小下一步是固定真实片段输入，诊断prototype hops/lookup/JS_CallInternal调用，
   再设计保留this/调用语义的受控对照；不先加PIC。IC/PIC与fusion已有实现，
   任何未来方法需明确内存/正确性/多态退化权衡，尚无可信新颖方法成立。
2. F64进入helper的额外流程，究竟来自call/tag/conversion还是其他因素？
   下一步只对固定helper/typed load/store分类计数或采样；保留detach/resizable/
   bounds/NaN等语义。helper已有专门化，不能把“加入TypedArray支持”当创新。

已有技术核对与一手来源：[prior_art.md](source_evidence/prior_art.md)。
全部新数据独立保存，已停止在本阶段；未进入优化、IC全矩阵或发布。
'''
    c.save(c.ATTEMPT/'results.md',report)
    notes='''# 组会汇报提纲（6页，不生成PPT）

1. 已有基线与本轮问题：同WSL cohort；Richards原V8/QJS0.616、Navier1.213反例、
   RegExp0.107。first-call-inclusive，不是pure-loop。复算270旧样本一致，不重跑3780。
2. Richards证据链：10671谓词/Run；V8 GetNamedProperty；JSC函数hash与源码关联；
   QJS/JSC实际handler差异。合法字段缓存对照保留校验，移除了调度器语义，披露限制。
3. Navier反例：QJS优于V8，JSC更快；lin_solve采样与get_array_el动态计数。
   同核Array/F64，独立oracle；helper有typed专门化，不把慢标签当哈希成本。
4. 对照结果：展示results.md的B/A和引擎ratio小表，360/360、N256、30新进程。
   QuickJS字段缓存相对预测未获支持；表示变化不是自动加速，也不是原Octane新排名。
5. RegExp与测量限制：native代码PC/可执行映射实际关联；JSC Yarr解释仍有Regex样本。
   whole-process采样、QJS无self-time、first-call frontend及状态演进、WSL频率UNKNOWN。
6. 下一步：先核查prototype查找/调用成本，再谈优化；PIC/fusion已有技术，创新未成立。
   向老师确认引擎名称/版本话语，不把整理稿当commit/IC授权证据。

页4实际数值：

'''+table(formatted_con,list(formatted_con[0]))
    c.save(c.ATTEMPT/'meeting_notes.md',notes)
    c.save(c.ATTEMPT/'next_commands.md','''# 复核与续跑（当前工作已完成，默认不自动再跑）

PowerShell，从项目根目录：

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/whitebox_analysis/tooling/audit_micro.py
```

Linux同distro的续跑入口（只复用同设计的有效唯一位置，不重跑已完成样本）：

```sh
cd /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench
python3 -B experiments/whitebox_analysis/tooling/run_micro.py formal
```

本轮正式已360/360，不需要恢复。复核diagnostic报告：

```sh
python3 -B experiments/whitebox_analysis/tooling/report.py
```

原始配置/flags/adapter路径在attempt01/manifest.json，selected-N和schedule在
microbench/。resume只适用于当前冻结协议；失败位置保留并需具体诊断，不靠重试到满意。
输入/工具/flags/host改变要建立新attempt/cohort；当前tooling的ATTEMPT常量集中在
common.py，当前版本没有自动新cohort获取器，不能仅替换路径伪称迁移完成。
未来原生Ubuntu迁移须重新准备同版本runtime/依赖/时钟/执行模式验证并生成新manifest。
perf工具未安装；WSL vPMU可读但非native环境等价。V8参考源码下载遇到TLS信任链
失败(raw/reference.*)，本轮不关闭TLS验证或更改系统安全设置。下一阶段需新授权。
''')
    c.save(c.ATTEMPT/'environment.txt',f"Cohort={m['cohort']}\nHost={m['host']}\nKernel={m['kernel']}\nArchitecture={m['architecture']}\nPlatform=WSL2 Ubuntu24.04.2\nPower/frequency/temperature/background isolation=UNKNOWN\nDetails=environment.before.json,environment.after.json\nBoot IDs per process are retained; no old Windows times used.\n")
    c.save(c.ATTEMPT/'README.md','''# attempt01

已实际完成白盒诊断和4变体三引擎正式对照。先看results.md、audit.json。
协议/来源在protocol.md、manifest.json、cases/与source_evidence/；代码及共用
driver在microbench/，独立可运行入口在../tooling/。旧实验全部保留。
正式raw/records/formal/*.json是不可覆盖的位置级记录；raw/formal.csv是导出。
诊断raw/profile/bytecode与正式统计分离。未知能力不代表正式采样失败。
''')
    print(json.dumps({'status':audit['status'],'samples':formal['formal_valid'],'contrasts':formatted_con,
        'regexp_executable_PC_hits':mapped['ticks_in_observed_executable_mapping']},ensure_ascii=False,indent=2),flush=True)

if __name__=='__main__':main()
