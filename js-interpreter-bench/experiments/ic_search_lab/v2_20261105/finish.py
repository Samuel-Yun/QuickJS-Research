"""Generate final readable tables/report from completed data; no runtime launches."""
import csv,hashlib,json,statistics
from pathlib import Path
import analyze,evidence,run
H=run.HERE;lab=run.lab
def read(n):return list(csv.DictReader((H/n).open(encoding='utf-8')))
def fmt(r):return f"{float(r['ratio']):.4f} [{float(r['low95']):.4f}, {float(r['high95']):.4f}]"
def main():
    assert not (H/'completion.json').exists(),'do not replace a closed report'
    assert lab.load(H/'postflight.json')['status']=='PASS_IDENTITY_UNCHANGED'
    independent=lab.load(H/'independent.complete.json');assert independent['status'] in ['COMPLETE_SEPARATE_KEY_REPEAT','NOT_TRIGGERED_BY_FROZEN_POLICY']
    rows=evidence.rows();formal=[r for r in rows if r.get('event')=='measurement' and r['stage']=='formal']
    assert len(formal)==4380 and all(r['valid'] for r in formal)
    agg=read('final_summary.csv');get=lambda k,s,c:next(r for r in agg if r['kind']==k and r['scope']==s and r['comparison']==c)
    core='core16_13suite';ext='expanded17_14suite';sun='all26_case_equal';cid='s001'
    ca=get('octane',core,cid+'/A');cm=get('octane',core,cid+'/M');cv=get('octane',core,cid+'/V8_ON')
    supported=float(ca['high95'])<1 and float(cm['high95'])<1
    candidates=read('candidates.csv');summary=[]
    for c in candidates:
        c['correctness']=c['correctness'].replace('1800 GC-cycle cases','1800 cyclic instances across12 GC rounds')
        if c['id']==cid:c['correctness']=c['correctness'].replace('; not sanitizer/full test262','; final ASan+UBSan and9 upstream Release/5 sanitizer entries PASS; not full test262')
        c.update(status='FORMAL_AND_REPEAT_COMPLETE' if c['id']==cid else 'RECHECKED_NOT_PROMOTED' if c['id']=='s004' else 'SCREENED_NOT_SHORTLISTED',
            decision='small cohort gain; see full formal/repeat regressions and limits' if c['id']==cid else 'no formal promotion; complete initial data retained')
        rec=dict(id=c['id'],parent=c['parent'],category=c['category'],binary_sha256=c['binary_sha256'],patch_sha256=c['patch_sha256'],
            correctness=c['correctness'],Sun26_single_screen=c['sunspider_screen_gm'],Octane_core_single_screen=c['octane_screen_gm'],
            formal_core_over_A=ca['ratio'] if c['id']==cid else None,formal_core_over_M=cm['ratio'] if c['id']==cid else None,
            formal_campaign_samples=4380 if c['id']==cid else 0,candidate_formal_samples=1290 if c['id']==cid else 0,status=c['status'],decision=c['decision'])
        summary.append(rec)
    analyze.writecsv('candidates.csv',candidates);analyze.writecsv('candidate_summary.csv',summary)
    text=['# 本轮结论：小幅整套收益，远未达到20%，也未接近V8','',
        '在同一 WSL2 Ubuntu24.04.2/x86_64、GCC13.3.0 的固定 cohort 中，完成四项设计、全26+17初筛、两项各三轮复筛，冻结 s001 后另采4380条正式记录。A/M未重建；V8原官方15.6.21制品及 `--jitless --no-lazy --use-ic` 不变。旧Windows/V1时间未作分母。','',
        '|新数据阶段/集合|s001/A 耗时比 [95%]|s001/M 耗时比 [95%]|','|---|---:|---:|',
        f'|正式 Octane核心16项/13suite|{fmt(ca)}|{fmt(cm)}|',
        f'|正式 Octane扩展17项/14suite|{fmt(get("octane",ext,cid+"/A"))}|{fmt(get("octane",ext,cid+"/M"))}|',
        f'|正式 SunSpider全26项|{fmt(get("sunspider",sun,cid+"/A"))}|{fmt(get("sunspider",sun,cid+"/M"))}|','',
        '比值<1表示s001耗时较低；不是官方Octane总分。绝对单位ms/完整Run，首次Run包含、无额外workload预跑；内部时间不含进程启动/初始Setup，但保留GC、helper、builtin、RegExp和Run内动态编译等成本。每组30个新进程，10000次整轮配对bootstrap，seed20261105，探索性且未多重校正。','',
        '## 四项改动及去留','',
        '- s001：PC相对操作数直接定位记录，code副本与记录同块；同时改准备、handler、释放和写出，共4文件。核心初筛0.9826，三轮0.9849，进入并完成新确认。与旧U的属性字节偏移不同。',
        '- s002：函数内各atom/site竞争一个有界shape+atom表，不是旧NG每atom四槽；核心初筛1.0249，未入围。固定热表仍有冷元数据、hash/碰撞和小函数空间代价，未实测其全套miss成因。',
        '- s003：整份metadata首次函数进入才准备，不是旧E的lazy vector或c008长度准入；核心初筛1.0041，未入围，首次准备在执行区间内可能增加成本。',
        '- s004：shape正查找hint，含删除重入失效；核心初筛0.9842，但三轮相对A为1.0001 [0.9875,1.0069]，不晋级。局部hash路径确实减少，不等于整体改善。','',
        '未凑足6项：融合尚缺跳转目标安全证明，弱shape缺生命周期通知；容量/inline、旧R/E/H等重复思路未重跑。完整初筛、回归核查和补丁身份见 `candidate_summary.csv`、`screen_per_case.csv`、`designs.md`，三轮材料见 `search_results.md`。','',
        '## 最具体的发现','',
        's001真实7字节读取函数中操作数0→6，控制器验证PC+6正好是记录；Release机器码去掉site索引缩放和sites基址取得的定位步骤。两对象、换值、换布局诊断中M/s001查询、命中、回退次数相同。省掉的是定位步骤，不是证明少了查找或某条指令独立花了多少时间。详见 `explanation.md` 和真实 `native_*.txt`。','',
        '代价是每个合格函数额外的对齐字节码副本/复制，旧内嵌代码空间仍在；没有证明总RSS减少。s004局部8192次交替查询仍全部MIC失配/更新，但hash路径8192→2；其shape头56→64字节。它是可保留的局部事实，不是本轮赢家。','',
        '正式数据保留反例：RayTrace相对A约+8.43%、Splay约+4.35%、CodeLoad.Closure约+5.56%；Richards约-6.93%，其中相对M仅约-2.08%。RegExp相对M约-12.32%，而数值控制bitops-bitwise-and相对A约+2.99%。这些变化不能全解释成寻址少了几条机器指令；代码布局、编译器决策和支撑工作尚未分离。','',
        f'核心相对V8_ON：A/V8={float(get("octane",core,"A/V8_ON")["ratio"]):.4f}，M/V8={float(get("octane",core,"M/V8_ON")["ratio"]):.4f}，s001/V8={float(cv["ratio"]):.4f}。差距略收窄但仍很大，不称已经接近V8。','',
        '## 独立关键集：不与正式30合并','']
    if independent['status']=='COMPLETE_SEPARATE_KEY_REPEAT':
        ir=read('independent.ratios.csv');text+=['预先固定5项Octane及1个数值控制，各条件10个新进程，共230条；不是正式赢家筛选，不对小子集算总体GM。','',
            '|case|独立s001/A [95%]|独立s001/M [95%]|','|---|---:|---:|']
        for c in dict.fromkeys(r['case'] for r in ir):
            a=next(r for r in ir if r['case']==c and r['comparison']=='s001/A');m=next(r for r in ir if r['case']==c and r['comparison']=='s001/M')
            text.append(f'|{c}|{fmt(a)}|{fmt(m)}|')
    else:text.append('正式主指标未触发预定规则，没有为追求显著追加样本。')
    text+=['','## 完整材料、限制和下一步','',
        '完整逐项绝对时间/比值见 `final.octane.table.md`、`final.sunspider.table.md`；均值、样本std、Tukey Q1/Q3/IQR、min/max及外部墙钟在对应CSV。原始命令、输入/脚本/制品SHA、stdout/stderr、退出码、boot和时间在raw；public gzip可无损恢复。','',
        '安全门禁包括9个上游Release入口、5个sanitizer入口、针对性ASan/UBSan、GC/OOM、保存加载及qjsc；非完整test262。7020等是断言次数，1800是12轮中的循环对象实例，不是独立场景数。','',
        'SunSpider两项随机输入限制保留；候选晋级依据Octane，不依赖两项随机case，未静默改PRNG。WSL/功耗频率/后台扰动限制仍在；V8精确源码commit与构建工具链UNKNOWN。诊断与正式分离；不是pure interpreter-loop self time。','',
        's003原初筛漂移的partial、唯一恢复批次以及Git换行辅助脚本/进度读取工具故障均保留；不能写成引擎崩溃或删除失败历史。正式4380条及独立复测另由audit核查，旧raw/manifest未修改。','',
        '本轮停止，不再叠加IC变体。下一步具体问题：在冻结A/M/s001上，完整Octane的执行区间有多少工作实际处于读字段handler/回退，多少在调用、GC、builtin及动态编译？尤其复核RegExp与数值控制的非目标变化，再决定是否值得继续改寻址。']
    (H/'results.md').write_text('\n'.join(text)+'\n',encoding='utf-8',newline='\n')
    lab.save(H/'completion.json',dict(status='COMPLETE_BOUNDED_SEARCH_AND_FRESH_CONFIRMATION',candidate=cid,
        actual_designs=4,formal_valid=4380,formal_expected=4380,independent_valid=independent['count'],
        primary_supported_vs_A_and_M=supported,primary_over_A=ca,primary_over_M=cm,
        all_cases_faster=False,gain20percent=False,close_to_V8=False,
        interpretation='small cohort-specific aggregate gain, not all-case or instruction-self-time attribution; inspect independent sensitivity table',
        no_more_search=True,no_auto_commit_push=True))
    print('REPORTS_AND_COMPLETION_WRITTEN',supported,independent['count'])
if __name__=='__main__':main()
