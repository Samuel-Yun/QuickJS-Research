"""Render final Chinese tables directly from this campaign's raw-only summary."""
import collections,csv
from common import *
def rows(name):
    with (HERE/'summary'/name).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
def table(headers,data):return '\n'.join(['|'+'|'.join(headers)+'|','|'+'|'.join(['---']*len(headers))+'|']+['|'+'|'.join(map(str,r))+'|' for r in data])
def value(s):return float(s) if s not in ['',None] else None
def fmt(x,n=4):return '未估计' if x is None else f'{x:.{n}f}'
def main():
    audit=read(HERE/'summary/audit.json');comp=rows('comparison.csv');rat=rows('ratios.csv');agg=read(HERE/'summary/aggregate.json')
    lookup={(r['case'],r['ratio']):r for r in rat}
    def cell(case,pair):
        r=lookup[case,pair];pt=value(r['time_change_percent'])
        return r['status'] if pt is None else f'{pt:+.2f}% [{float(r["CI95_change_low"]):+.2f}, {float(r["CI95_change_high"]):+.2f}]'
    absolute=table(['case']+[c+' ms/Run (n)' for c in CONDITIONS]+['状态'],[[r['case']]+['未测 (0)' if not r[c+'_median_ms'] else f'{float(r[c+"_median_ms"]):.6f} ({r[c+"_n"]})' for c in CONDITIONS]+[r['status']] for r in comp])
    changes=table(['case','M/A变化% [95%区间]','H/A变化% [95%区间]','ON/A变化% [95%区间]','ON/OFF变化% [95%区间]'],[[r['case']]+[cell(r['case'],pair) for pair in ['M/A','H/A','ON/A','ON/OFF']] for r in comp])
    gm=table(['集合','Run/suite数','比较','suite等权时间比','95%区间','变化%','判断'],[[r['set'],str(r['case_count'])+'/'+str(r['suite_count']),r['ratio'],fmt(r['point'],5),'未估计' if r['CI95_low'] is None else f'[{r["CI95_low"]:.5f}, {r["CI95_high"]:.5f}]','未估计' if r['point'] is None else f'{r["time_change_percent"]:+.2f}',r['status']] for r in agg if r['set']!='EXPANDED_FULL18'])
    counts=[];worst=[]
    for pair in ['M/A','H/A','ON/A','ON/OFF']:
        rr=[lookup[k,pair] for k in BASE_CASES];cnt=collections.Counter(r['status'] for r in rr)
        counts.append([pair,cnt['improvement'],cnt['regression'],cnt['unclear'],16-sum(cnt[t] for t in ['improvement','regression','unclear'])])
        measured=[r for r in rr if value(r['point']) is not None]
        if measured:
            r=max(measured,key=lambda r:float(r['point']))
            worst.append(f'- {pair}最大耗时变化点估计：{r["case"]}，{float(r["time_change_percent"]):+.2f}%，区间[{float(r["CI95_change_low"]):+.2f}, {float(r["CI95_change_high"]):+.2f}]%；判断{r["status"]}。')
    count_table=table(['固定16集合比较','区间支持改善','区间支持退化','方向不明确','不可估计/失败'],counts)
    mainrows={r['ratio']:r for r in agg if r['set']=='MAIN_FIXED16_WITH_CRYPTO'}
    decisions=[]
    for pair in ['M/A','H/A','ON/A','H/M','ON/OFF','ON/H']:
        r=mainrows[pair]
        conclusion={'improvement':'探索性区间支持分子总体耗时更低','regression':'探索性区间支持分子总体耗时更高','unclear':'方向不明确，不代表等效','UNAVAILABLE_FIXED_SET_INCOMPLETE':'固定集合缺失，无法完整估计'}[r['status']]
        decisions.append(f'- {pair}：{fmt(r["point"],5)}，{conclusion}。')
    body='# Octane同批A/M/H/OFF/ON：整体结果先行\n\n'+absolute+'''

单位为内部ms/原完整Run，中位数；括号是实际有效新进程数，不是目标配额。
A为无本研究IC补丁的upstream原版；M为own单槽读IC；H为M加受限一层原型data IC；
OFF/ON为同一switch ELF的继承条目填充关闭/开启，own IC始终保留。
首Run包含、无额外workload预跑。不同Run的绝对毫秒不能直接合成引擎分数。
完整Q1/Q3/min/max/mean/样本stddev/IQR与实际n见summary/per_condition.csv，
外部墙钟和子进程CPU为单列metric，不与内部时间相减。

## 各项目相对原版和同ELF开关的变化

'''+changes+'''

上表为耗时变化百分比，负数更快。时间比=分子中位数/分母中位数；变化=100×(比值−1)。
同轮五条件完整组配对bootstrap10000次、seed20261030，95%线性百分位探索性区间，未做多重比较校正。
跨1/变化跨0只表示方向不明确，不证明等效；失败和缺失不填数字。
全部八组比较（另含H/M、ON/M、ON/H、OFF/M）见summary/ratios.csv。
对应图在summary/plots/；虚线为比值1，点为中位数之比，线为区间，绿色/红色表示区间低于/高于1，灰色跨1。

## suite等权总体，而非官方Octane分数

'''+gm+'''

主集合是原固定16 Run/13suite，包含固定输入Crypto；排除Crypto的14 Run/12suite仅作历史口径补充。
每个suite先对其子项时间比取GM，再对suite等权取GM，不让Crypto/EarleyBoyer/CodeLoad获得双倍权重。
总体每次用所有case共享的完整轮次抽样，重算逐项中位数及上述suite权重。
完整18 Run扩展集合因Box2D缺可信最终结果门禁而不可估计，summary/aggregate.json明确列missing，
没有把17项称成完整18项。可比扩展17 Run/14suite（含zlib）另标EXPLORATORY_ADMITTED_17。
固定集合若有失败，主总体标无法完整估计；不会以删失败后的更好子集代替。

'''+count_table+'\n\n'+'\n'.join(worst)+'''

这些计数基于固定16个Run，不是suite数。所谓最大变化是点估计，不代表已证明因果或确认性显著。

## 能否说H/ON整体优于原版A

'''+ '\n'.join(decisions)+'''

应先看上述相对A的主总体及回归范围，再决定实现是否值得继续，不能用Richards或原型微例一项决定整版去留。
“不可接受的回归”没有预先约定阈值，本报告给出各项及最大回归，不擅自替研究者定义验收线。
suite的完整分布见aggregate.json/by_suite；收益集中在哪里应按这些分项阅读，不能仅数获胜Run代替等权总体。
没有分项耗时证据，本轮不能把差距全部归到shape查找、引用维护、24B结构或native布局。

## 实际采集和覆盖

'''+f'本轮正式实际{audit["formal_actual"]}/{audit["formal_expected"]}，有效{audit["formal_valid"]}，失败{audit["formal_failed"]}，未执行{audit["formal_missing"]}。\n原固定16项有效{audit["base_valid"]}/2400；新增zlib目标150条，单列计数。\nN1/N2正确性{audit["correctness_valid"]}/{audit["correctness_expected"]}，选定N正确性{audit["selected_correctness_valid"]}/{audit["selected_correctness_expected"]}；pilot实际{audit["pilot_actual"]}条。\n正式低于1000ms的{audit["formal_below_1000ms"]}条全部保留，没有删除异常值或重新挑窗口。\n'+'''
17项×5条件×30新进程，seed20261030，case顺序预先打乱、每case五条件相邻。
六组随机基序各取五种轮转再打乱，每条件各位置6次；不是覆盖全部120种排列。
共同N、pilot选择依据和选定N正确性见selected_n.csv、pilot_start/、raw/pilot、raw/selected_correctness。
N1/N2不是正式数据，Crypto额外plain/观察诊断也不进入正式时间。

Box2D五条件能运行，但原Run没有可核对最终结果，不能把无框架门禁叫引擎不兼容；
本轮保留五份真实兼容记录及主表空项。zlib用五条件一致--std/read接口通过原断言，
未提前初始化、移动Run内I/O/eval或改压缩算法。其原验证是长度加C strcmp，具有NUL终止限制，
不是本轮新证明100kB所有字节均相等。Splay/Mandreel官方latency不在本Run指标内。

## 输入、环境和限制

Crypto的BENCH_ONLY_XORSHIFT32_PRELOAD_V1 seed305419896在base/crypto前安装，RC4不在Setup或Run重置。
N1/N2及选定N有五条件plain/观察hook的流式真实数据摘要核对，正式无hook，末次密文对门禁。
原RegExp构造但不预跑、NavierStokes计时后补验、Encrypt后校验、Decrypt前置加密均与旧driver一致。
固定源码/adapter/driver与实际脚本SHA在inputs.json、frozen.json，旧时间没有填入本轮。

同一WSL2 Ubuntu24.04.2/x86_64主机，Ryzen7 5800H，固定CPU2；当前查询供电、
电源方案及结束快照见host_windows*.json。没有擅改系统电源/governor/ASLR/WSL设置。
频率、温度、连续宿主后台和虚拟到物理SMT映射仍UNKNOWN，短CPU快照不代表整段负载。
RUSAGE_CHILDREN差分是完整子进程CPU而非JS区间self-time，不能用它筛“受调度影响”的正式样本。
数值控制仅为环境记录，不设停止矩阵的波动门槛。

四个ELF均为冻结身份，没有新引擎构建或IC修改。switch的新sanitizer仍未完成，旧H的安全验证不是switch新PASS。
静态加载/Setup在外，首次与重复原Run在内，包括动态编译、helper、GC、RegExp及原Run断言；不是每次全冷或pure lookup self-time。

## 最后：旧局部机制证据只帮助提出解释

旧四案例的ON/OFF约6.8%收益、旧Richards查找次数下降都不是本轮总体的替代物。
它们只说明受限继承缓存确实能在某些位置生效；本轮是否净优于A必须看本批固定16集合。
若本批某些suite改善而另一些回归，初始化/共用路径、shape保活、工作量与代码生成布局只是候选原因，
没有独立分项时间就不写成确定根因。本轮到此只测量，不实现下一项优化。

复现与完整索引见README；公开raw重算不打开Linux ELF、不启动引擎。
'''
    save(HERE/'results.md',body)
    save(HERE/'decision.md','# 同批整体判断\n\n'+'\n'.join(decisions)+'\n\n'+count_table+'\n\n'+'\n'.join(worst)+'''\n
主要评价对象始终是原版A及固定16 Run的suite等权整体；17可比扩展和14无Crypto为明确标注的补充。
不能按Richards一项、微例、IC命中次数或只赢OFF来宣称净优化成功。
回归容忍线未预先定义，整版去留需权衡主总体、收益分布和最坏回归，而非自动用某一项否决。
本轮无新IC实现，停止于测量和报告；未知成本归因与switch sanitizer限制保留。
''')
    print('FINAL_REPORTS_WRITTEN')
if __name__=='__main__':main()
