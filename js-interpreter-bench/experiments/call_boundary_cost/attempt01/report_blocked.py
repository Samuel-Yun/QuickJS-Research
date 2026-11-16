"""Report the measured gate failure; no invented attribution or new runs."""
import csv,gzip,hashlib,io,json,statistics
from pathlib import Path
P=Path(__file__).resolve().parent
CASES=['local_function_call','number_value_read','Richards.Richards']
def j(p):return json.loads(p.read_text(encoding='utf8'))
def rows(p):return list(csv.DictReader(p.open(encoding='utf8')))
def write(p,x):
    b=(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode('utf8');p.parent.mkdir(parents=True,exist_ok=True)
    if p.exists():assert p.read_bytes()==b
    else:p.write_bytes(b)
def csvwrite(p,rr):
    s=io.StringIO();w=csv.DictWriter(s,list(rr[0]),lineterminator='\n');w.writeheader();w.writerows(rr);write(p,s.getvalue())
def main():
    gate=j(P/'perturbation_gate.json');assert not any(g['accepted'] for g in gate['cases'].values());assert j(P/'delivery_analysis_v2/audit.json')['status']=='PASS'
    for file in ['summary.csv','ratios.csv']:write(P/file,(P/'validation_analysis_p23000'/file).read_text(encoding='utf8'))
    profile=[dict(case=c,total_window_samples=None,CALL_ENTRY=None,CALLER_CALL=None,CALLEE_EXIT=None,PROPERTY=None,LOOP_VALUE=None,HELPER_OTHER=None,SHIM_UNKNOWN=None,status='NOT_RUN_PERTURBATION_GATE_FAILED') for c in CASES];csvwrite(P/'profile_summary.csv',profile)
    delivery=rows(P/'delivery_analysis_v2/delivery.csv');summ=rows(P/'summary.csv');ratios=rows(P/'ratios.csv')
    def fmt(r):return f"{float(r['ratio']):.4f} [{float(r['CI95_low']):.4f}, {float(r['CI95_high']):.4f}]"
    def gr(c,den):return next(r for r in ratios if r['case']==c and r['denominator']==den)
    doc=['# 调用入口/退出是否值得优先研究：本轮结论受扰动门禁阻断','',
         '**本轮不把调用边界推进为优先实现的优化。不是因为测出了调用成本小，而是采样/重链接精度门槛没有通过，尚不能可靠估计原A中的比例。Richards同样未通过，不能据此说它有或没有调用边界热点。决策采用原提示词第4分支：证据不足，保留可复查失败，不换案例或继续扩建工具。**','',
         '## 先列要求的分布表','',
         '|负载|总窗口样本|入口|caller处理|callee退出|属性|循环/值/dispatch|其它helper|shim/未知|',
         '|---|---|---|---|---|---|---|---|---|']
    for c in CASES:doc.append('|'+c+'|未运行|UNKNOWN|UNKNOWN|UNKNOWN|UNKNOWN|UNKNOWN|UNKNOWN|UNKNOWN|')
    doc += ['',
         '这里的空缺不是0。长窗口计划9个，实际0个：所有负载在最终23ms批次至少有一项工程门槛未过。profile_summary.csv同样保留空值与明确状态。验证批次确实取得PC原始样本，但没有拿未获准的验证窗口改名为长窗口，也没有制作“原A的调用占比”表。address_categories.csv将整个JS_CallInternal范围保持UNKNOWN，绝不把包含完整解释器的符号等同调用边界。','',
         '## 具体是哪些数字未通过','',
         '下表分子/分母均为同一新批次内部时长中位数之比；>1表示分子耗时更高。括号是10000次完整9进程轮块bootstrap的探索性95%区间（seed20261029，线性百分位），不是多重检验校正后的因果结论。','',
         '|负载|SHIM_OFF / BASE|重链接门禁|SHIM_ON / SHIM_OFF|采样门禁|',
         '|---|---|---|---|---|']
    for c in CASES:
        a,b=gr(c,'BASE'),gr(c,'SHIM_OFF');doc.append('|'+c+'|'+fmt(a)+'|'+('通过' if a['accepted']=='True' else '未通过')+'|'+fmt(b)+'|'+('通过' if b['accepted']=='True' else '未通过')+'|')
    doc += ['',
         '预先固定的重链接门槛为点估计≤1.05且区间上界≤1.10；采样门槛为点估计≤1.03且上界≤1.05。本轮没有改门槛。local的采样上界1.1574、数字读的重链接上界1.2393、Richards的两项上界1.3553/1.1284，是停止长窗口的具体依据。宽区间既不能证明采样器造成确定比例的减速，也不能证明成本完全未变。','',
         '## 实际执行和没有执行的部分','',
         '- 原版A、独立SHIM_OFF/ON三条件，三负载N1/N2共18/18正确性通过；两个批次选定N各9/9正确性通过。Richards保留冻结原算法/原断言，两个微基准复制上一轮全部共同函数，不改strict/receiver/调用形式；仅两个微基准每Run为4096轮、返回8390656。首次Run计入，没有额外workload预跑。',
         '- 第一批7ms保留107/108记录。用户中断后最后一个位置尚未启动且没有reservation，未补跑；全量描述统计用107条，配对比值用11个完整9进程轮块。三项重链接通过，仅Richards采样上界1.0590未过1.05。',
         '- 按原规则唯一一次改为23ms，完整采集108/108记录、12个完整轮块，正确性/内部外部时钟检查通过。六种顺序每负载各2次、每条件位置各4次；第二批没有删长尾、没有自动重试、没有根据区间加样本。两批不混合，不挑第一批较好的local/数字结果替换第二批。',
         '- 本轮合计215条验证记录、143条SHIM元数据及572个gzip档案，压缩与解压SHA全部核验，缓冲溢出/handler时钟错误为0。两套summary/ratios与所有pilot保留。第二批按校准冻结N分别为16384、32768、512；首批为32768、65536、1024。N不同，不将两批绝对时间之差解释为降频收益。','',
         '第二批内部时长如下，单位ms/整个N次Run区间，中位数 [Q1,Q3]。CPU时间、上下文切换、端到端时间另见summary.csv和delivery_analysis_v2/CPU_and_switches.csv，不相减求初始化成本。','',
         '|负载 / N|BASE|SHIM_OFF|SHIM_ON|','|---|---:|---:|---:|']
    for c in CASES:
        ss=[next(s for s in summ if s['case']==c and s['condition']==k and s['metric']=='internal') for k in ['BASE','SHIM_OFF','SHIM_ON']]
        doc.append('|'+c+' / '+ss[0]['N']+'|'+'|'.join(f"{float(s['median']):.3f} [{float(s['Q1']):.3f}, {float(s['Q3']):.3f}]" for s in ss)+'|')
    doc += ['', '## 采样器能做什么，实际频率如何','',
         '只编译了sampler.c和插入注册调用的qjs.c，复用原VM/repl对象。原对象按原链接命令可逐字节重现冻结A；SHIM的JS_CallInternal排除地址/relocation变化后指令序列相同。但额外两个全局C钩子仍改变atom/global/堆状态，不能因此声称布局完全相同。ON/OFF用相同ELF和脚本，只切环境变量。','',
         'handler只用经确认lock-free的原子、ucontext RIP和clock_gettime记数字，保存errno；无分配、printf、锁或符号化。begin预触缓冲、保存maps并检查SIGPROF/timer与单线程；end屏蔽信号、停timer、drain pending后恢复旧状态再输出。所有记录均确认前后线程数1。计时与采样输出分开。','',
         '|验证批次|ON进程数|有效窗口PC数|各进程投递间隔中位数范围(ms)|各进程平均间隔范围(ms)|',
         '|---|---:|---:|---:|---:|']
    for batch in ['validation_p7000','validation_p23000']:
        a=[d for d in delivery if d['batch']==batch and d['condition']=='SHIM_ON'];med=[float(d['interval_median_ms']) for d in a];mean=[float(d['interval_mean_ms']) for d in a]
        doc.append(f"|{batch}|{len(a)}|{sum(int(d['window_samples']) for d in a)}|{min(med):.4f}–{max(med):.4f}|{min(mean):.4f}–{max(mean):.4f}|")
    doc += ['',
         '7ms请求的间隔中位数约10ms；23ms请求约20ms，中位数并非完整分布，均值/10%/90%分位及各进程实际PC数都已保留。不能把中位数叫成固定投递周期，也不能从请求/实收计数精确推断丢信号率。记录的是投递时用户RIP，不是硬件周期或内核调用栈。个别CPU/墙钟利用率略大于1也原样保留，相关钟与虚拟化精度来源未独立验证。','',
         '只对五个实际验证RIP做了地址归一化工具smoke，保存PIE的PT_LOAD、maps、load bias与addr2line inline链；例如既有JS_CallInternal地址也有js_poll_interrupts内联帧。它证明基础解析可用，不是热点排名或性能占比。完整分类/长窗口因门禁失败未进行。','',
         '## 中断、平台和UNKNOWN','',
         'Windows宿主/WSL2 Ubuntu24.04.2、x86_64，GCC13.3，原O2/g/fwrapv，无新增LTO/PGO/NDEBUG/frame-pointer/padding；准确身份见manifest.json。频率、功耗、温度和后台未控制，保存了前后与恢复快照。明显耗时波动只能视为可见不稳定，不能确定归因于采样器、某个宿主进程或热状态。','',
         '一条首批Richards ON记录从03:26:04到07:17:07 UTC，但内部7220.502ms、parent单调7238.256ms、进程CPU约7.228s；原始记录保留，未修正。宿主挂起/虚拟机暂停或时钟行为未证实，原因UNKNOWN。UTC只作日期元数据，不计算性能，不拼接不同boot的绝对单调值。恢复按用户继续授权设置有界90分钟收尾，不改原started.json，也不声称总墙钟在4小时内。原采样器搭建和可用性检查在60分钟内完成。','',
         'A源码与VM对象未修改，目标JS字节一致；前轮两微基准规范化dump和N1/N2次数仅引用原材料。未在当前SHIM直接重新导出全部目标bytecode，故“SHIM中逐函数实测的前后编码一致”保留UNKNOWN；不能将原VM对象相同升级为新的直接dump证据。已准备但未运行的GDB/全分类/长窗口入口不作为成果或通过项。','',
         '上一轮public_files_sha256中的5个CRLF/LF项目已逐项核实：当前Windows CRLF字节匹配源制品清单，LF正规化后SHA不同。新previous_hash_normalization.csv提供两套SHA，未修改旧清单、raw或hash。本attempt用局部.gitattributes固定新记录LF，并让inputs/scripts/gzip保持原始字节；新清单区分实际字节SHA与LF正规化SHA，不宣称已提交后的字节验证。','',
         '## 下一步与停止条件','',
         '本轮停止，不实现调用快路径、不取消interrupt/stack/异常检查、不扩展案例或重跑Octane。恢复只需在可控、空闲且稳定的同平台窗口建立新attempt，原样重复同一扰动验证；先证明误差能落入原门槛，再谈长窗口。没有理由用更多相似微基准代替这个测量问题，也没有依据将缺测改写成调用边界不重要。','']
    write(P/'results.md','\n'.join(doc))
    write(P/'decision.md','''# 决策：第4分支，停止推进调用边界的优先优化

目前不实施、也不提出已获数据支持的调用边界优化假设。原因是测量门禁未过，而不是测得调用成本很小。

最终23ms完整108条验证中：local的采样区间上界1.1574超过1.05；数字读的重链接上界1.2393超过1.10；Richards的重链接/采样上界1.3553/1.1284也未通过。点估计接近1不能代替预先规定的区间要求。第一批较好的位置不能拼入第二批。

因此原A的CALL_ENTRY、CALLER_CALL、CALLEE_EXIT比例以及在Richards的对应重要性均UNKNOWN。没有运行被禁止的9个长窗口，不能把验证PC数或整个JS_CallInternal符号当成调用框架成本；不能凭调用次数多继续支持它，也不能凭缺测撤销其实际成本。

唯一恢复项：同一冻结A、同三个既有负载、同一协议，在空闲稳定的同平台环境建立新attempt，先让重链接/采样验证落入原工程门槛。不要放宽阈值、挑outlier、添加案例、再换采样器或实现VM优化。若仍不能达到，保留测量受限结论，停止这条成本归因路线。
''')
    write(P/'checkpoints/03_closed.json',dict(status='BLOCKED_PERTURBATION_REPORTED',validation_records=215,long_windows=0,decision_rule=4))
    print('WROTE_MEASURED_BLOCKED_REPORT',flush=True)
if __name__=='__main__':main()
