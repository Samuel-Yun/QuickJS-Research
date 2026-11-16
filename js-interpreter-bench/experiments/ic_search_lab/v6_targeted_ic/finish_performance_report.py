"""Offline only: readable tables and frozen-artifact audit. Never starts WSL/VM."""
import csv
import hashlib
import json
from pathlib import Path

import performance_report as report

H=Path(__file__).resolve().parent


def rows(name):
    with (H/name).open(encoding='utf-8',newline='') as stream:
        return list(csv.DictReader(stream))


def number(value):
    return float(value)


def mdtable(headers, data):
    return '\n'.join(['| '+' | '.join(headers)+' |','|'+'|'.join(['---']*len(headers))+'|']+
                     ['| '+' | '.join(map(str,r))+' |' for r in data])+'\n'


short=rows('short_accept01.parent_summary.csv')
full=rows('full_accept01_octane.parent_summary.csv')
agg=rows('full_accept01_octane.aggregate.csv')
intervals=rows('full_accept01_octane.paired_intervals.csv')
index={(r['case'],r['condition']):r for r in short}
plan=report.load(H/'short_plan.json')
case_order=plan['octane']+plan['sunspider']
lines=['# v6：本次性能采集结果', '',
       'WSL2 Ubuntu24.04.2 / x86_64；复用原冻结 Release 制品和已通过检查，没有重建或新增诊断。',
       '原 CLOCK_MONOTONIC、首次 Run 计入、无计时前 workload 预跑，加载及必需 Setup 在外。',
       '本次记录不与旧隔离时间拼接；当前 boot 为 `1273e914-93c0-476a-86d8-828bf27a8689`。', '',
       '## 完成情况', '',
       '- 实际负载预检：原9个有限计算进程及 Richards/Splay/Typescript 共6个进程通过。',
       '- 短测：12案例 × 12条件，144/144条有效；所有候选逐项时间在下表和CSV。',
       '- 完整 Octane：17项 × 5条件 × 3轮，255/255条有效，制品前后身份一致。',
       '- 完整 SunSpider：2/390条有效，随后只有L1启动记录，没有退出记录。不能生成全套汇总。',
       '- WSL后续启动返回 CreateVm/WSAENOTCONN；唯一一次可用性重试失败。',
       '- 随后PowerShell运行库加载报告0x800705AF（页面文件太小）。它与WSL错误的因果关系UNKNOWN。',
       '- 没有新候选晋级；不启动正式30轮，不产生新V8比较。', '',
       '已完整结束并保存制品后验的短测/Octane保留为完成批次；SunSpider部分批次隔离，',
       '不跨未知boot补齐。WSL为何中断、L1进程的实际退出码/信号、当前boot均为UNKNOWN。', '',
       '## 短测逐项时间', '',
       '单位均为 **ms / 一次完整 Run**，每格只有一个新进程点估计，不是操作self-time。',
       '括号为相对实际源码父版的耗时变化，负数较快。新候选除C1父版为P1外，其余均为s001。',
       's001的实际父版M未在这次短测采集，因此不伪造M分母。', '']

for title,labels in [('对照',['A','s001','d03','d05']),
                     ('融合、写入和原型调用',['B2','W1','P1','C1']),
                     ('布局ID、延迟准备和外提',['ID_CTRL','ID_READ','L1','K1'])]:
    data=[]
    for case in case_order:
        cells=[]
        for label in labels:
            r=index[case,label]
            cell=f"{number(r['median_ms_per_Run']):.4f}"
            if r['parent_change_pct']:
                cell+=f" ({number(r['parent_change_pct']):+.2f}%)"
            cells.append(cell)
        data.append([case]+cells)
    lines.extend(['### '+title,'',mdtable(['case']+labels,data),''])

contrasts=[]
for case in case_order:
    for candidate,denominator in [('B2','d05'),('ID_READ','ID_CTRL'),('C1','P1')]:
        left=index[case,candidate]
        right=index[case,denominator]
        ratio=number(left['median_ms_per_Run'])/number(right['median_ms_per_Run'])
        contrasts.append(dict(case=case,candidate=candidate,denominator=denominator,
                              time_ratio=ratio,time_change_pct=100*(ratio-1),n=1,
                              interpretation='additional mechanism contrast, not all are source parents'))
report.table('short_accept01.additional_contrasts.csv',contrasts)

lines.extend(['## 完整Octane：3轮配对复测','',
              'B2、K1、L1的选择在完整复测前冻结于selection.accept01.json。',
              '使用原完整N；每个条件每项3个新进程。括号仍是相对s001的耗时变化。',
              'A/s001列仅列时间，完整绝对时间、样本标准差、Q1/Q3、IQR、min/max见parent_summary.csv。',''])
findex={(r['case'],r['condition']):r for r in full}
data=[]
for case in report.info_cases('octane'):
    cells=[]
    for label in ['A','s001','B2','K1','L1']:
        r=findex[case,label]
        cell=f"{number(r['median_ms_per_Run']):.4f}"
        if label in ['B2','K1','L1']:
            cell+=f" ({number(r['parent_change_pct']):+.2f}%)"
        cells.append(cell)
    data.append([case]+cells)
lines.append(mdtable(['case','A','s001','B2','K1','L1'],data))
lines.extend(['','### 聚合','',
              'ratio = 候选耗时 / 分母耗时，<1较快；耗时变化=100×(ratio−1)。',
              '核心16项/13suite与扩展17项/14suite：先suite内等权GM，再suite等权GM，不是官方Octane分数。',
              'bootstrap按整轮共同重采样三轮，10000次、seed2026110706；95%区间使用nearest-rank。',
              '三轮区间离散、探索性、未作多重检验校正，跨1仅表示方向不明确，不表示等效。',''])
data=[]
for r in agg:
    if r['condition'] in ['B2','K1','L1']:
        data.append([r['subset'],r['condition'],r['denominator'],f"{number(r['time_ratio']):.6f}",
                     f"{number(r['time_change_pct']):+.2f}%",
                     f"[{number(r['ci95_low']):.6f}, {number(r['ci95_high']):.6f}]",r['direction']])
lines.append(mdtable(['范围','版本','分母','耗时比','变化','95%探索性区间','方向'],data))
lines.extend(['','### 超过5%的单项信号及代价','',
              '以下为相对s001的完整三轮结果，不采用短测中最好的一次；全部17项仍进入上面聚合。',''])
data=[]
for r in intervals:
    if r['condition'] in ['B2','K1','L1'] and r['denominator']=='s001' and abs(number(r['time_change_pct']))>5:
        data.append([r['condition'],r['case'],f"{number(r['time_change_pct']):+.2f}%",
                     f"[{number(r['ci95_low']):.4f}, {number(r['ci95_high']):.4f}]",r['direction']])
lines.append(mdtable(['版本','case','耗时变化','比值95%区间','方向'],data))
lines.extend(['','## 现在能说什么','',
              'B2、K1、L1的核心聚合相对s001点估计均变慢。B2和L1的探索性区间在1以上；K1跨1。',
              '相对A的点估计也要与相对s001分开：B2/K1扩展聚合低于A，但没有超过当前底座。',
              '原来“确实少做了检查/分发/准备”的诊断仍成立，但不能自动转成整体性能收益。',
              'L1的冷代码准备减少，并未在完整CodeLoad中稳定转成比s001更快。',
              '不能补出SunSpider GM、宣布适用场景已验收或把代码布局/频率变化归因给单一helper。',
              '在完整SunSpider缺失且候选未明显超过s001的情况下，不启动正式30轮或提升底座。','',
              '## 恢复与材料','',
              '恢复步骤见next_commands.accept02.md；先恢复宿主可用内存/页面文件及WSL启动。',
              '本轮不关闭WSL、不重启服务、不修改页面文件设置，也不再重试。',
              '统计重算：python performance_report.py summary --epoch accept01。',
              '它直接读取performance_accept01.runs.jsonl.gz，不需要WSL、ELF或旧/home路径。',
              '旧analyze.py是先前隔离批次的冻结分析入口，不用于重算本次新时间。'])
report.save_new('performance_results.accept01.md','\n'.join(lines)+'\n')

identities=[]
manifest=report.load(H/'manifest.json')
for item in manifest['artifacts']:
    stored=item['path']
    assert stored.startswith('/mnt/c/')
    local=Path('C:/'+stored[len('/mnt/c/'):])
    data=local.read_bytes()
    actual=hashlib.sha256(data).hexdigest()
    assert actual==item['sha256'] and data[:4]==b'\x7fELF'
    identities.append(dict(id=item['id'],sha256=actual,stored_path=stored,current_path=str(local),
                           byte_identity_pass=True,ELF=True))
archive=report.load(H/'performance_accept01.archive.json')
assert report.sha((H/archive['file']).read_bytes())==archive['sha256']
import gzip
data=gzip.decompress((H/archive['file']).read_bytes())
assert report.sha(data)==archive['decompressed_sha256']
raw=[json.loads(s) for s in data.splitlines()]
starts={r['token']:r for r in raw if r['event']=='process_start'}
ends={r['token']:r for r in raw if r['event']=='process_result'}
unmatched=[k for k in starts if k not in ends]
assert len(unmatched)==1 and 'full_accept01_sunspider/date-format-tofte/L1' in unmatched[0]
measurements=[r for r in raw if r['event']=='measurement']
assert len(measurements)==401 and all(r['valid'] for r in measurements)
assert len(short)==144 and len(full)==85
report.save_new('performance_delivery.accept01.json',dict(
    status='PARTIAL_EXTERNAL_WSL_AND_HOST_RESOURCE_BLOCK',short_valid=144,short_expected=144,
    octane_valid=255,octane_expected=255,sunspider_valid=2,sunspider_expected=390,
    total_valid=401,total_expected_if_all_completed=789,unmatched_process_starts=unmatched,
    timing_recovery_first_precheck_passed=True,bounded_availability_retries_used=1,
    unchanged_release_artifacts=identities,raw_archive_integrity_pass=True,
    candidates_selected=['B2','K1','L1'],baseline='s001',promoted=None,formal30_started=False,
    no_new_candidates=True,no_rebuild=True,no_repeated_diagnostics=True,
    no_old_performance_pooling=True,no_commit_push=True,
    full_SunSpider_GM=None,current_boot_id=None,unmatched_process_exit_code=None))
print(json.dumps(dict(short_valid=144,octane_valid=255,sunspider_valid=2,
                      frozen_identities_passed=len(identities),unmatched_process_starts=len(unmatched),
                      report='performance_results.accept01.md',status='PARTIAL_EXTERNAL_BLOCK'),indent=2))
