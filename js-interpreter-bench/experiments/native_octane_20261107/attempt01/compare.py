"""Offline native-versus-historical descriptive comparison; no runtime launch."""
import csv
import hashlib
import io
import json
import math
from pathlib import Path
import statistics

H=Path(__file__).resolve().parent
ROOT=H.parents[2]
LAB=ROOT/'experiments/ic_search_lab'


def read(p):
    with Path(p).open(newline='') as stream:
        return list(csv.DictReader(stream))


def load(p):
    return json.loads(Path(p).read_text())


def write(name, rows):
    out=io.StringIO(newline='')
    writer=csv.DictWriter(out,list(dict.fromkeys(k for row in rows for k in row)),lineterminator='\n')
    writer.writeheader();writer.writerows(rows)
    (H/name).write_text(out.getvalue())


def aggregate(ratios):
    groups={}
    for case,ratio in ratios.items():
        groups.setdefault(case.split('.')[0],[]).append(ratio)
    return math.exp(statistics.mean(statistics.mean(math.log(v) for v in values) for values in groups.values()))


def main():
    assert load(H/'audit.json')['status']=='PASS_COMPLETE'
    info=load(H/'inputs.json')
    references={}
    old={}
    paths={}
    v2=LAB/'v2_20261105/final.octane.per_case.csv'
    v2info=load(LAB/'v2_20261105/final.octane.protocol.json')['info']
    assert v2info['files']==info['files'] and v2info['N']==info['N']
    for version in ['v4_refine_s001','v5_structural','v6_targeted_ic']:
        historical=load(LAB/version/'octane.inputs.json')
        assert historical['files']==info['files'] and historical['N']==info['N']
    for r in read(v2):
        old['V8_ON',r['case']]=(float(r['V8_ON_median_ms_per_Run']),float(r['A_median_ms_per_Run']))
        old['s001_formal30',r['case']]=(float(r['s001_median_ms_per_Run']),float(r['A_median_ms_per_Run']))
    paths['V8_ON']=paths['s001_formal30']=v2
    v4=LAB/'v4_refine_s001/recheck.statistics.csv'
    rows=read(v4)
    for case in info['cases']:
        select=lambda label:float(next(r for r in rows if r['kind']=='octane' and r['case']==case and r['condition']==label)['median'])
        old['mx019',case]=(select('mx019'),select('A'))
    paths['mx019']=v4
    v5=LAB/'v5_structural/comparison_octane.csv'
    for r in read(v5):
        old['d03',r['case']]=(float(r['d03_median_ms']),float(r['A_median_ms']))
    paths['d03']=v5
    v6=LAB/'v6_targeted_ic/full_expand01_octane.parent_summary.csv'
    rows=read(v6)
    for label in ['s001','B2','P1','ID_CTRL']:
        paths[label]=v6
        for case in info['cases']:
            select=lambda condition:float(next(r for r in rows if r['case']==case and r['condition']==condition)['median_ms_per_Run'])
            old[label,case]=(select(label),select('A'))
    native={(r['condition'],r['case']):r for r in read(H/'statistics.csv')}
    detailed=[]
    for (label,case),(old_ms,old_a) in old.items():
        native_label='s001' if label=='s001_formal30' else label
        new_ms=float(native[native_label,case]['median_ms'])
        new_a=float(native['A',case]['median_ms'])
        detailed.append(dict(condition=label,case=case,native_ms_per_Run=new_ms,old_WSL_ms_per_Run=old_ms,
             native_A_ms_per_Run=new_a,old_WSL_A_ms_per_Run=old_a,native_over_A=new_ms/new_a,old_WSL_over_A=old_ms/old_a,
             native_change_pct=100*(new_ms/new_a-1),old_WSL_change_pct=100*(old_ms/old_a-1),
             change_difference_percentage_points=100*(new_ms/new_a-old_ms/old_a),native_over_old_absolute=new_ms/old_ms,
             source=str(paths[label].relative_to(ROOT))))
    write('historical_per_case.csv',detailed)
    write('largest_historical_differences.csv',sorted(detailed,key=lambda r:abs(r['change_difference_percentage_points']),reverse=True))
    summary=[]
    native_aggregates=read(H/'aggregate.csv')
    for label in ['s001','mx019','d03','B2','P1','ID_CTRL','V8_ON','s001_formal30']:
        native_label='s001' if label=='s001_formal30' else label
        for subset in ['core16_13suite','expanded17_14suite']:
            cases=[c for c in info['cases'] if subset.startswith('expanded') or c!='zlib.zlib']
            old_ratio=aggregate({c:old[label,c][0]/old[label,c][1] for c in cases})
            new=next(r for r in native_aggregates if r['condition']==native_label and r['denominator']=='A' and r['subset']==subset)
            summary.append(dict(condition=label,subset=subset,native_over_A=float(new['ratio']),native_change_pct=float(new['change_pct']),
                    native_low95=float(new['low95']),native_high95=float(new['high95']),old_WSL_over_A=old_ratio,
                    old_WSL_change_pct=100*(old_ratio-1),change_difference_percentage_points=100*(float(new['ratio'])-old_ratio),
                    native_over_old_absolute=aggregate({c:float(native[native_label,c]['median_ms'])/old[label,c][0] for c in cases}),
                    source=str(paths[label].relative_to(ROOT))))
    write('historical_aggregate.csv',summary)
    inputs=[v2,v4,v5,v6,LAB/'v2_20261105/final.octane.protocol.json',*[LAB/v/'octane.inputs.json' for v in ['v4_refine_s001','v5_structural','v6_targeted_ic']]]
    (H/'historical_sources.json').write_text(json.dumps(dict(platform='WSL2 Ubuntu24.04.2 / Ryzen7 5800H / GCC13.3, hosted by Windows',
           all_input_file_hash_manifests_identical=True,all_N_identical=True,
           files={str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs}),indent=2)+'\n')
    labels=load(H/'protocol.json')['labels']
    primary=sorted([r for r in summary if r['subset']=='core16_13suite' and r['condition'] in ['s001','mx019','d03','B2','P1']],key=lambda r:r['native_over_A'])
    best=primary[0]
    best_expanded=next(r for r in summary if r['condition']==best['condition'] and r['subset']=='expanded17_14suite')
    lines=['# 原生 Linux Octane IC 复测', '',
      f"本次最佳点估计为 **{best['condition']}**：核心集合相对A耗时变化 **{best['native_change_pct']:+.2f}%**，含zlib的扩展集合 **{best_expanded['native_change_pct']:+.2f}%**。", '',
      '同批 A / s001 / mx019 / d03 / B2 / P1 / ID_CTRL / V8_ON；17项，每条件每项5个新进程，共680条。',
      '主聚合为核心16项/13suite，另列含zlib的17项/14suite。首次Run计入，无计时前workload预跑；单位ms/完整Run。',
      '所有QuickJS均由本机GCC15.2重建，V8为官方15.6.21，flags为--jitless --no-lazy --use-ic。未跑SunSpider、V8_OFF。', '',
      '## 主聚合与旧结果', '',
      '耗时变化为(候选/A−1)×100%，负数较快。区间是五轮配对bootstrap的探索性95%区间，未校正多重比较。',
      '旧IC结果属于Windows主机中的WSL2，不能称为Windows原生IC结果。OS、CPU和编译器同时改变，跨平台差异不能单独归因于Linux。', '',
      '|版本|本机核心耗时变化|比值95%区间|本机扩展耗时变化|旧WSL核心耗时变化|变化差(pp)|',
      '|---|---:|---:|---:|---:|---:|']
    for r in primary+[next(r for r in summary if r['condition']=='ID_CTRL' and r['subset']=='core16_13suite')]:
        exp=next(s for s in summary if s['condition']==r['condition'] and s['subset']=='expanded17_14suite')
        lines.append(f"|{r['condition']}|{r['native_change_pct']:+.2f}%|[{r['native_low95']:.4f}, {r['native_high95']:.4f}]|{exp['native_change_pct']:+.2f}%|{r['old_WSL_change_pct']:+.2f}%|{r['change_difference_percentage_points']:+.2f}|")
    v8=next(r for r in summary if r['condition']=='V8_ON' and r['subset']=='core16_13suite')
    lines += ['',f"A/V8_ON：本机核心 {1/v8['native_over_A']:.4f}，旧WSL正式30轮 {1/v8['old_WSL_over_A']:.4f}。",'',
       's001另有旧正式30轮参考：核心耗时变化 '+f"{next(r for r in summary if r['condition']=='s001_formal30' and r['subset']=='core16_13suite')['old_WSL_change_pct']:+.2f}%"+'；最新旧WSL三轮和旧正式30轮都保留，不择优替换。',
       'ID_CTRL是布局版本维护控制，不单列为一种已经证实的IC算法收益。点估计最低不等于已经证明优于其它候选。', '',
       '## 逐项本机绝对时间', '', '|case|'+'|'.join(labels)+'|','|---|'+'---:|'*len(labels)]
    for case in info['cases']:
        lines.append('|'+case+'|'+'|'.join(f"{float(native[label,case]['median_ms']):.5f}" for label in labels)+'|')
    lines += ['', '## 逐项相对A耗时变化', '', '|case|'+'|'.join(labels[1:-1])+'|','|---|'+'---:|'*len(labels[1:-1])]
    for case in info['cases']:
        lines.append('|'+case+'|'+'|'.join(f"{100*(float(native[label,case]['over_A'])-1):+.2f}%" for label in labels[1:-1])+'|')
    lines += ['', '## 旧新差异较大的单项', '',
       '下表按相对各自同批A的耗时变化差排序，每case只列差异最大的一版。此处不是直接相除跨平台时间，也不证明差异由OS引起。', '',
       '|case|版本|本机变化|旧WSL变化|差(pp)|','|---|---|---:|---:|---:|']
    seen=set()
    for row in sorted([r for r in detailed if r['condition'] in ['s001','mx019','d03','B2','P1']],key=lambda r:abs(r['change_difference_percentage_points']),reverse=True):
        if row['case'] in seen:
            continue
        seen.add(row['case'])
        lines.append(f"|{row['case']}|{row['condition']}|{row['native_change_pct']:+.2f}%|{row['old_WSL_change_pct']:+.2f}%|{row['change_difference_percentage_points']:+.2f}|")
        if len(seen)==6:
            break
    closure=next(r for r in detailed if r['condition']=='s001_formal30' and r['case']=='CodeLoad.CodeLoadClosure')
    lines += ['',f"旧数据跨批次也有变化：s001 的 CodeLoad.Closure 在旧正式30轮中为 {closure['old_WSL_change_pct']:+.2f}%，最新旧WSL三轮则见上表/CSV；本机为 {closure['native_change_pct']:+.2f}%。因此不能把与某个旧小批次的差异全部解释为迁移效应。"]
    lines += ['', '## 证据与限制', '',
       'audit.json检查680条位置/数量/退出码/flags/输入/制品/时钟/串行区间；raw/archive.json与raw/runs.jsonl.gz保留完整过程证据。',
       'review.py另从压缩原始记录复算中位数，以逐case加权log的独立写法核对所有聚合（容差1e-12），通过；结果见independent_statistics_check.json。候选之间的探索性区间见candidate_pairwise.csv。',
       'statistics.csv包含每项median/mean/样本标准差/Q1/Q3/IQR/min/max。aggregate.csv含每轮方向及配对区间；paired_ratios.csv含逐项区间。',
       'historical_per_case.csv及historical_aggregate.csv给出旧同批A、新同批A、绝对时间、归一化变化和出处；historical_sources.json核对旧新输入SHA清单和N完全一致。',
       '环境为原生Ubuntu26.04.1 / i9-14900 / GCC15.2，固定逻辑CPU2（同胞CPU3），不改系统电源、频率、ASLR或服务；后台与功耗温度未完全隔离。',
       '仅五轮探索性复测，不能将接近1%的差异写成稳定的最优算法；保留全部异常值和偏短样本。Box2D及官方latency指标沿用旧覆盖限制，不计算官方Octane总分。',
       '原始准备阶段曾因文本读取规范化CRLF触发mx019哈希拒绝；已改为直接解码字节并保留preparation_issue.json。此时尚无构建或性能样本。', '',
       '复算：python3 -B run.py analyze；python3 -B compare.py。新采集请另建attempt，不在本boot/协议之外补旧位置。', '']
    (H/'results.md').write_text('\n'.join(lines))
    print(json.dumps(primary,ensure_ascii=False,indent=2))


if __name__=='__main__':
    main()
