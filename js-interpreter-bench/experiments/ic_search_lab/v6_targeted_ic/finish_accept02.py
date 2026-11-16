"""Offline final tables. Requires the complete new390-process SunSpider run."""
import csv
import gzip
import hashlib
import json
from pathlib import Path
import performance_report as r

H=Path(__file__).resolve().parent


def read_csv(name):
    with (H/name).open(encoding='utf-8',newline='') as f:
        return list(csv.DictReader(f))


def md(headers,rows):
    return '\n'.join(['| '+' | '.join(headers)+' |','|'+'|'.join('---' for _ in headers)+'|']+
                     ['| '+' | '.join(map(str,row))+' |' for row in rows])+'\n'


def main():
    p=r.load(H/'full_accept02_sunspider.protocol.json')
    complete=r.load(H/'full_accept02_sunspider.completed.json')
    assert complete['status']=='COMPLETE' and complete['valid']==complete['expected']==390
    assert r.load(H/'full_accept02_sunspider.identity_after.json')['status']=='PASS'
    assert not (H/'STOP.accept02.json').exists(), 'New STOP needs review, not silent completion'
    assert p['labels']==['A','s001','B2','K1','L1'] and p['rounds']==3
    archived=r.load(H/'performance_accept02.archive.json')
    blob=(H/archived['file']).read_bytes()
    assert hashlib.sha256(blob).hexdigest()==archived['sha256']
    data=gzip.decompress(blob)
    assert hashlib.sha256(data).hexdigest()==archived['decompressed_sha256']
    raw=[json.loads(line) for line in data.splitlines()]
    measurements=[v for v in raw if v['event']=='measurement']
    assert len(measurements)==390 and all(v['valid'] for v in measurements)
    assert all(v['boot_id']==v['boot_id_after']==p['boot_id'] for v in measurements)
    starts={v['token'] for v in raw if v['event']=='process_start'}
    ends={v['token'] for v in raw if v['event']=='process_result'}
    assert starts==ends, 'Preserve and review orphan starts'
    sun=read_csv('full_accept02_sunspider.parent_summary.csv')
    sun_ag=read_csv('full_accept02_sunspider.aggregate.csv')
    oct_ag=read_csv('full_accept01_octane.aggregate.csv')
    assert len(sun)==26*5 and all(int(v['n'])==3 for v in sun)
    combined=[]
    for source,records in [('full_accept01_octane',oct_ag),('full_accept02_sunspider',sun_ag)]:
        proto=r.load(H/(source+'.protocol.json'))
        for v in records:
            if v['condition'] in ['B2','K1','L1']:
                combined.append(dict(campaign=source,boot_id=proto['boot_id'],**v))
    r.table('performance_complete.aggregate.csv',combined)
    ideas=read_csv('ideas.csv')
    updated=[]
    for idea in ideas:
        cid=idea['id']
        item=dict(id=cid,parent=idea.get('parent'),change=idea.get('change'),
                  implemented=idea.get('implemented'),minimal_correctness=idea.get('minimal_correctness'),
                  targeted_safety=idea.get('targeted_safety'),sanitizer=idea.get('sanitizer'),
                  short_valid=12 if cid in ['B2','W1','P1','C1','ID_CTRL','ID_READ','L1','K1'] else None,
                  full_octane_valid=51 if cid in ['B2','K1','L1'] else None,
                  full_sunspider_valid=78 if cid in ['B2','K1','L1'] else None,
                  promoted=False,binary_sha256=idea.get('binary_sha256'))
        item['decision']='FULL_RECHECKED_NOT_PROMOTED' if cid in ['B2','K1','L1'] else (
            'SHORT_ONLY_NOT_SELECTED' if item['short_valid'] else idea['timing_status'])
        for value in combined:
            if value['condition']==cid:
                prefix=value['subset']+'_over_'+value['denominator']
                item[prefix]=float(value['time_ratio'])
                item[prefix+'_ci95_low']=float(value['ci95_low'])
                item[prefix+'_ci95_high']=float(value['ci95_high'])
        updated.append(item)
    r.table('ideas.performance_complete.csv',updated)
    lines=['# v6完整复测结果：SunSpider已恢复完成','',
           '复用冻结制品及既有检查；未新实现、未重建、未重跑机制诊断。',
           '本次accept02的时钟与实际负载预检通过后，重新采集完整SunSpider390条。',
           '旧accept01的2条部分SunSpider记录继续隔离，未拼接。','',
           '## 完成数量','',
           '- 全部8个新候选及4个对照短测：144/144条（accept01）。',
           '- B2/K1/L1与A/s001完整Octane：17项×5条件×3轮，255/255条（accept01）。',
           '- 同5条件完整SunSpider：26项×5条件×3轮，390/390条（accept02）。',
           '- 接受的以上采集共789条；另有旧失败批次2条有效部分记录，保留但不汇入。','',
           '两个完整suite来自同一WSL distro/主机/架构、不同boot，分别有同批A/s001对照。',
           '分别报告各suite比值与区间，不跨boot拼样本，不计算Octane+SunSpider混合GM。',
           '正式名称仍为first-call-inclusive interpreter-mode execution；加载/必需Setup在计时外，',
           '首次Run包含、无额外预热，GC/helper/builtin/RegExp及Run动态编译按实际计入。','',
           '## 完整suite聚合','',
           '耗时比=候选中位耗时/分母中位耗时，<1较快；变化率=(比值−1)×100%。',
           'Octane先suite内GM再suite等权GM，分别核心16/13和扩展17/14；SunSpider为26case等权GM。',
           '每条件每case只有3个新进程。10000次固定seed整轮配对bootstrap为探索性区间；',
           '跨1表示方向不明确，不是等效证明；无多重检验校正。','']
    lines.append(md(['范围','版本','分母','耗时变化','比值95%探索性区间'],[
        [v['subset'],v['condition'],v['denominator'],f"{float(v['time_change_pct']):+.2f}%",
         f"[{float(v['ci95_low']):.6f}, {float(v['ci95_high']):.6f}]"] for v in combined]))
    lookup={(v['case'],v['condition']):v for v in sun}
    lines+=['','## SunSpider完整逐项时间','',
            '单位ms/完整Run。括号为候选相对实际父版s001的耗时变化；A/s001只列绝对时间。',
            'Q1/Q3、样本标准差、IQR和min/max见parent_summary.csv，逐项区间见paired_intervals.csv。','']
    table=[]
    for case in r.info_cases('sunspider'):
        row=[case]
        for label in p['labels']:
            value=lookup[case,label]
            text=f"{float(value['median_ms_per_Run']):.4f}"
            if label in ['B2','K1','L1']:
                text+=f" ({float(value['parent_change_pct']):+.2f}%)"
            row.append(text)
        table.append(row)
    lines.append(md(['case']+p['labels'],table))
    lines+=['','## 数据和复现','',
            'SunSpider原始快照：performance_accept02.runs.jsonl.gz；归档/解压SHA见archive.json。',
            '离线重算：`python performance_report.py summary --epoch accept02`。',
            'Octane和全部候选短测仍见performance_results.accept01.md；原始快照不覆盖。',
            '逐想法状态及结果见ideas.performance_complete.csv，旧ideas.csv保留为之前机制阶段快照。',
            '', '## 本轮验收判断', '',
            '三个入围候选的完整Octane与SunSpider相对s001的聚合点估计都没有变快。',
            'K1的探索性聚合区间跨1，只能说方向不明确，不能说等效或已胜出。',
            'B2/L1同时存在明确需要保留的单项回归，因此没有选出可接受的新默认底座。',
            '本轮停止于完整三轮复测；不启动正式30轮，不扩大候选或追加测到有利结果。',
            '保留s001。少做检查/分发/准备是已验证机制，但不是整体收益的替代证据。']
    r.save_new('performance_results.complete.md','\n'.join(lines)+'\n')
    r.save_new('performance_delivery.accept02.json',dict(status='COMPLETE_FULL_RECHECKS',
        short_valid=144,octane_valid=255,sunspider_fresh_valid=390,total_accepted_records=789,
        old_partial_sunspider_excluded=2,boot_id=p['boot_id'],different_boot_suites_reported_separately=True,
        raw_archive_integrity_pass=True,unmatched_process_starts=0,all_groups_3_valid_processes=True,
        no_new_implementation=True,no_rebuild=True,no_repeated_diagnostics=True,no_commit_push=True))
    r.save_new('acceptance_decision.complete.json',dict(status='COMPLETE_RECHECKS_NO_PROMOTION',
        accepted_measurements=789,old_partial_sunspider_excluded=2,
        shortlisted=['B2','K1','L1'],baseline_retained='s001',promoted=None,
        formal30_started=False,V8_new_comparison=False,
        reason='No shortlisted candidate beats s001 in complete Octane and SunSpider aggregate point estimates; regressions retained; K1 exploratory intervals cross1',
        scope='Three-round complete rechecks, not a new30-process accepted release',
        same_suite_comparisons_use_same_boot=True,combined_cross_boot_GM=None))
    print(json.dumps(dict(status='COMPLETE_FULL_RECHECKS',sunspider=390,total_accepted=789,
                          sunspider_aggregates=sun_ag),ensure_ascii=True,indent=2))


if __name__=='__main__':
    main()
