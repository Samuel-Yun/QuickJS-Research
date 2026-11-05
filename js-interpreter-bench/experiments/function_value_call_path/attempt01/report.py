"""Generate tables directly from immutable audited CSV, no performance subprocess."""
from common import *
def rows(p):return list(csv.DictReader(p.open(encoding='utf8')))
def main():
    audit=read(HERE/'analysis/audit.json');assert audit['status']=='PASS' and read(HERE/'independent_audit.json')['status']=='PASS'
    for n in ['summary.csv','ratios.csv']:save(HERE/n,(HERE/'analysis'/n).read_bytes())
    ss=rows(HERE/'summary.csv');rr=rows(HERE/'ratios.csv');table={(s['case'],s['condition']):s for s in ss if s['metric']=='execution'}
    def ratio(c,a,b,den=None):return next(r for r in rr if r['numerator_case']==c and r['numerator_condition']==a and r['denominator_case']==(den or c) and r['denominator_condition']==b)
    def rtxt(r):return f"{float(r['ratio']):.4f} [{float(r['CI95_low']):.4f}, {float(r['CI95_high']):.4f}]"
    def cell(s):return f"{float(s['median']):.6f} [{float(s['Q1']):.6f}, {float(s['Q3']):.6f}]"
    doc=['# 函数值读取与调用：实际做了什么、能解释什么','',
         '本轮只用冻结 A、原单槽 M 与 V8 ON，WSL2 Ubuntu24.04.2/x86_64 同一主机新批次；V8 15.6.21严格 `--jitless --no-lazy --use-ic`，未改变正式VM。旧提交c844a5a…仅作背景，不参加本表计算。','',
         '## 做了什么与时间单位','',
         '四案例共享cases/shared.js，仅在计时外设置CASE_KIND。每Run4096轮，独立预期4096×4097/2=8390656；最大允许N的checksum小于2^53。24/24个N1/N2正确性、12/12个选定N正确性通过，own普通数据descriptor与普通JS函数身份检查通过。A/M各有窄属性计数与新增独立call分支计数，V8保留真实最终bytecode。','',
         '本批每案例共同N=16384：从8192起倍增，三个条件各3独立pilot全部>=1000ms才冻结。每格30新进程，总360/360有效，30个完整12进程轮块。首次Run计入、无计时前workload预跑。对象/函数创建、静态frontend、adapter、输出和驱动最终验证在外；Run中的身份检查、读/调用/循环/累加、GC/helper和外层checksum在内。重复中的反馈自然变化，不称全部冷态或pure loop self time。','',
         '**单位ms/完整Run**（含4096轮），中位数 [Q1,Q3]；不是单操作耗时。','',
         '|案例|A|M|V8 ON|','|---|---:|---:|---:|']
    for c in CASES:doc.append('|'+c+'|'+'|'.join(cell(table[(c,k)]) for k in CONDS)+'|')
    doc+=['','比值为分子耗时/分母耗时，>1表示分母更快。10000次按同轮完整12进程块共同重采样，seed20261028，探索性95%线性百分位区间；没有多重检验校正，不据跨1声称等效。','',
          '|案例|A/M|A/V8 ON|M/V8 ON|','|---|---|---|---|']
    for c in CASES:doc.append('|'+c+'|'+'|'.join(rtxt(ratio(c,a,b)) for a,b in [('QJS_A','QJS_M'),('QJS_A','V8_ON'),('QJS_M','V8_ON')])+'|')
    doc+=['','## 1. 不调用函数，差距是否已经存在？','',
          '两个read的valueReadLoop在同引擎内编码相同；QJS PC12每Run实际读4096次，返回类型分别INT和OBJECT；两者call计数均为0。M在N2都是8192查询、8191命中、1次回退。V8真实dump保留循环内GetNamedProperty和last赋值，错误路径有call但未走；没有将QJS计数冒充V8 native执行次数。','',
          '不调用时，M/V8数字读为'+rtxt(ratio(CASES[0],'QJS_M','V8_ON'))+'，函数读为'+rtxt(ratio(CASES[1],'QJS_M','V8_ON'))+'。所以函数调用并不是本轮出现跨引擎差距的必要条件；数字读取控制本身也存在距离。','',
          '|条件|function-read / number-read [95%区间]|','|---|---|']
    for c in CONDS:doc.append('|'+c+'|'+rtxt(ratio(CASES[1],c,c,CASES[0]))+'|')
    doc+=['',
          '函数值在QuickJS涉及对象引用增加、last覆盖时释放旧值及最后身份检查/清理，数字没有对象引用头更新（value_ownership.md）。A函数/数字点估计多约2.37%；M和V8的对应区间均跨1。因此本批**没有支持“函数值引用处理足以解释主要跨引擎距离”**的证据；但也没有证明引用处理免费。值表示、tag检查、字段反馈、native布局与支撑循环并未被分项定时。','',
          '## 2. 加入调用与local调用后怎样？','',
          'own方法的M/V8为'+rtxt(ratio(CASES[2],'QJS_M','V8_ON'))+'；local函数为'+rtxt(ratio(CASES[3],'QJS_M','V8_ON'))+'。字段读取降到每Run一次后，仍保留跨引擎距离，且两者ratio点估计接近；这不是两种ratio的等效性检验，不能计算“消除了多少百分比原因”。','',
          '|条件|own-method / local-call [95%区间]|','|---|---|']
    for c in CONDS:doc.append('|'+c+'|'+rtxt(ratio(CASES[2],c,c,CASES[3]))+'|')
    doc+=['',
          'local完整程序在三条件均更短，M的own/local为约1.134；但它不再每轮读字段，receiver改成undefined，指令/局部槽也不同。plain call仍每次复制局部函数值并清理；不能将两程序时间相减叫纯lookup或调用self-time，更不能把它作为原Richards源码优化收益。','',
          '## 3. 已排除什么，仍有哪些解释？','',
          '- **已实测排除（仅目标位点）：** M不是没有缓存生效；两个read和method在N2只做1次普通find。local只读2次、1次冷回退；没有每轮重复字段查找。两个read并未调用step。两个call案例N1/N2实际4096/8192次call，全进入普通bytecode class分支，通用class-call回退0。没有native/bound/Proxy函数替代。',
          '- **源码与dump确认：** step是QJS四条、V8三条，做x+1；QJS没有push_this，不能归因于本callee初始化this局部槽。QJS仍递归进入JS_CallInternal，准备frame/stack、poll/检查，返回清理。local还保留get_loc的函数复制。两个引擎都有循环、加法与保存等支撑操作；更短编码不等于更便宜执行。',
          '- **仍未分开的解释：** call公共入口/退出、函数引用与receiver处理、解释器handler/native布局、不同值表示和循环支撑都可能影响时间。V8参考实现及实际少量builtin反汇编支持存在不同receiver入口，但没有本site逐次native分支/IC命中率；精确artifact构建commit未知。不能只写“调用慢”，也不能把普通find变少与时间变化换算成单次miss成本。','',
          'M在own方法比A更快；local的A/M区间跨1；数字读的A/M也跨1。可见“IC命中”本身不保证每个完整程序净收益。本轮不实现任何新优化。','',
          '## 4. 下一步首先看哪里？','',
          '**只保留一项关键缺失证据：localCallLoop的call1→JS_CallInternal普通bytecode入口及正常返回清理，相对其余循环/step执行占多少native成本。**具体位置为A quickjs.c:17787–17875、20699–20710（M对应行号保留在摘录）。本轮已确认实际进入这一分支，且大部分字段读取已不在循环内；但非调用控制也有约1.28–1.31的距离，不能据此预先认定frame是主因。decision.md不推荐尚无成本证据的新快路径，只要求取得这一个分区归因；本轮止于分析。','',
          '## 审计、异常和UNKNOWN','',
          '- 六种条件排列每案例各5次、每条件三个位置各10次；案例四位置各7/8次。全量描述统计保留全部有效样本；bootstrap只用完整轮，本批没有缺轮/补跑。2条正式V8样本低于1000ms（999.484、996.401），原样保留；长尾同样保留。全部mean、sample stddev、IQR、min/max与外部ms/process见summary.csv，内部/外部中位数不相减。',
          '- 源码/输入/脚本与正式runtime/data的前后SHA核对通过；只构建两个独立调用计数诊断版，不替换正式制品。初次诊断源码唯一性断言失败在编译前，保留partial目录及first_setup_failure.json，定向修复后用新目录；无正式位置重试。一次工具权限review超时发生在source excerpt检查前，不是样本失败。',
          '- 三者使用既有performance.now/native单调时钟，parent perf_counter_ns包围关系全部通过。UTC只作元数据，本轮记录中UTC与外部单调跨度有偏差，最低约-459.802ms，整批约-1288.236ms；原因UNKNOWN，未修raw、未将UTC用于性能，也不能据此反推内部单调时钟错误。端点记录已放在reservation I/O之后；详见analysis/UTC_consistency.json。',
          '- WSL2的频率、功耗、温度与后台负载未控制；只保留前后快照。机器码布局/编译决策未隔离。计数只覆盖已登记source-compiled函数，不是全VM统计。V8静态builtin存在不证明逐次执行分支；OFF/全缓存关闭不在本轮范围。',
          '- 不使用perf、不新增信号采样，不跑Richards/Octane正式实验；旧Richards只用来说明tail_call_method及对象/null输入的语义边界。没有总体GM、未新增VM优化，也未提交/推送。','']
    save(HERE/'results.md','\n'.join(doc))
    save(HERE/'checkpoints/05_report.json',dict(status='RESULTS_WRITTEN_FROM_AUDITED_CSV',timestamp=stamp(),analysis_status=audit['status']))
if __name__=='__main__':main()
