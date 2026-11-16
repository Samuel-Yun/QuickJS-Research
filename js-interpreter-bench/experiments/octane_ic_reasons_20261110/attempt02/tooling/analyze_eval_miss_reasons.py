"""Explain the five low-hit items from disjoint first-rejection diagnostics."""
import argparse
import collections
import csv
import hashlib
import json
from pathlib import Path


def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('directory',type=Path);args=p.parse_args()
    out=args.directory.resolve();data=json.loads((out/'results.json').read_text());assert data['status']=='PASS'
    protocol=json.loads((out/'protocol.json').read_text())
    for path,h in protocol['frozen_files'].items():assert sha(Path(path))==h
    assert len(data['rows'])==5 and all(r['prior_totals_identical'] for r in data['rows'])
    detail=[];summary=[]
    lines=['# EVAL_COLD 五个低命中表项：原因分类','',
        '每项只运行一个独立原因诊断进程，沿用旧诊断的 N 和 Run 区间；未重测性能。',
        '**五项 queries/hits/misses/own_fills 均与上一轮完全一致**，每次未命中恰好归入一个首要原因。',
        '统计非 length 命名读取，包含普通、融合和原型读取；不调用 getter 两次，只检查现有原始属性描述符。','',
        '诊断按“第一条拒绝条件”分类；某类占比不是移除该守卫就必然能缓存的比例，后面可能仍有其他限制。',
        '位点按函数编译实例及其真实 IC 记录计数，函数销毁时解除地址映射，避免地址复用把新位点误算成旧位点。',
        '只执行一次指本次 Run 统计区间内，不能自动等同于整个函数生命周期只访问一次。','']
    for row in data['rows']:
        c=row['counts'];q,m=c['queries'],c['misses']
        assert q==c['hits']+m and sum(g['count'] for g in c['groups'])==m
        reason=collections.Counter();typed=collections.Counter()
        for g in c['groups']:
            reason[g['reason']]+=g['count'];typed[g['reason'],g['class_name'],g['atom']]+=g['count']
            detail.append(dict(case=row['case'],reason=g['reason'],class_name=g['class_name'],atom=g['atom'],
                count=g['count'],percent_of_misses=100*g['count']/m,percent_of_reads=100*g['count']/q))
        summary.append(dict(case=row['case'],N=row['N'],queries=q,hits=c['hits'],misses=m,
            hit_percent=100*c['hits']/q,compiled_instance_sites=c['compiled_instance_sites'],
            single_read_sites=c['single_read_sites'],single_read_filled_sites=c['single_read_filled_sites'],
            single_read_share_of_reads=100*c['single_read_sites']/q,reason_totals=dict(reason)))
        lines += ['## '+row['case'],'',f"命中率 {100*c['hits']/q:.6f}%；读取 {q:,}，未命中 {m:,}。",
            f"统计中触及 {c['compiled_instance_sites']:,} 个编译实例位点，{c['single_read_sites']:,} 个只读取一次；",
            f"其中 {c['single_read_filled_sites']:,} 个只读一次却进行了自身属性缓存填充。",'',
            '| 原因 | 次数 | 占未命中 | 占全部读取 |','|---|---:|---:|---:|']
        for k,n in reason.most_common():lines.append(f'| {k} | {n:,} | {100*n/m:.4f}% | {100*n/q:.4f}% |')
        lines += ['','主要属性与接收类型：','','| 属性 | 首要原因 | 类型 | 次数 |','|---|---|---|---:|']
        for (r,cl,a),n in typed.most_common(15):lines.append(f'| `{a}` | {r} | {cl} | {n:,} |')
        lines += ['']
    lines += ['## 实现依据与结论','',
        'RegExp：5,432,000 次 exec 读取的接收者为 JS_CLASS_REGEXP；2,480,320 次为原始字符串的方法读取，',
        '以 replace/split/match 为主。现有普通与融合 IC 限定 JS_CLASS_OBJECT，原始字符串也不进入该对象路径。','',
        'Mandreel：332,303 次未命中是普通自身数据属性但 shape->is_hashed=0，占未命中 99.9564%。',
        '属性为 sqrt/floor/cos/pow，源码对应 Math 函数读取。zlib 同类 14,247 次，占未命中 97.7563%，主要为 Math.max。','',
        'Math 构造路径：quickjs.c 的 JS_DEF_OBJECT → JS_NewObjectProtoList（约39693行）→',
        'JS_NewObjectProtoClassAlloc（5783行）→ js_new_shape_nohash（5234行）；该路径明确创建非驻留 shape。',
        'Math 原生函数还使用 AUTOINIT 属性，首次读取会物化函数；math_reproducer 记录到 1 次 AUTOINIT 和随后15次 own_unhashed，16次读取均未命中。','',
        'is_hashed 不是“对象有没有属性哈希表”，而是 shape 是否驻留于 runtime 的 shape 共享哈希表。',
        'read_ic_opcodes.inc 约58行明确拒绝给非驻留 shape 填充；原属性查找仍可使用其 hash_table。',
        'js_shape_prepare_update（quickjs.c:10338）仅在 hashed 情况下执行克隆/解除共享，对已 unhashed 的 shape 可原地修改。',
        '因此不能简单删除这一守卫：shape 指针不变时，属性布局或描述符仍可能变化，需要安全的失效/重新校验机制。','',
        'Closure：28.5714% 的未命中是首次自身属性填充，且这些填充全部落在本次只读一次的位点上；',
        '57.1429% 的全部读取来自统计区间内只读一次的编译实例位点。其余主要是数字 toString、字符串方法、Math unhashed、Date.now 与数组 map 等覆盖限制。',
        '源码每轮重新 eval 已加盐的代码，填充的位点没有第二次读取，增加槽数不能使它们产生复用。','',
        'JQuery：77.3810% 的未命中首先被接收类限制拒绝，以函数、正则、数组等为主；call/fn/attrFn/extend/event/type 是主要属性。',
        '另外 8.9827% 为首次自身属性填充，5.9524% 为不存在的属性（当前不缓存负查询），5.1948% 为原始字符串。','',
        '这五项低命中的主要原因是类型/布局覆盖不足及冷位点，而不是单槽形状抖动。',
        '理由描述的是当前实现选择，不是该访问理论上不能优化。支持更多类型或非驻留布局仍须保证描述符/原型/失效正确性。',
        '命中率改善不能等比例换算为整体耗时改善，尤其 zlib 统计中只有14,648次目标读取。','',
        '## 诊断局限与身份','',
        '原因分类会额外做只读属性查找和分配元数据；仅用于计数，不使用其时间。',
        '为稳定属性名身份，诊断暂持有已触及 atom，到 Run 结束释放；不保活接收对象、函数或 shape。',
        '原 Release 代码、前一轮计数构建、性能数据与日志保持不变。编译失败和错误引号的校验输入均保留，成功校验见 calibration_gate.json。','']
    (out/'results.md').write_text('\n'.join(lines))
    with (out/'miss_groups.csv').open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(detail[0]));w.writeheader();w.writerows(detail)
    (out/'summary.json').write_text(json.dumps(dict(rows=summary),indent=2)+'\n')
    audit=dict(status='PASS',cases=5,one_diagnostic_process_per_case=True,
        all_totals_identical_to_prior=True,miss_reasons_disjoint_and_complete=True,
        per_site_query_hit_miss_totals_checked_in_engine=True,formal_performance_samples_added=0,
        results_sha256=sha(out/'results.json'),analyzer_sha256=sha(Path(__file__)))
    (out/'audit.json').write_text(json.dumps(audit,indent=2)+'\n');print(json.dumps(audit,indent=2))


if __name__=='__main__':main()
