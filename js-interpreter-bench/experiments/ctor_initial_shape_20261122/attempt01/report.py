import csv
import json
from pathlib import Path

from run import HERE,save


def pct(a,b):return 100*(a/b-1)
def table(title,summary,case,labels):
    data={r['label']:r for r in summary if r['case']==case}
    out=['## '+title,'','| 轮次 | '+' | '.join(labels)+' |','|---|'+'---:|'*len(labels)]
    for i in range(7):out.append('| '+str(i+1)+' | '+' | '.join(f'{data[l]["raw_ms"][i]:.6f}' for l in labels)+' |')
    out.append('| **中位数** | '+' | '.join(f'**{data[l]["median_ms"]:.6f}**' for l in labels)+' |')
    return out+['']


def main():
    initial=json.loads((HERE/'initial/summary.json').read_text())
    times=json.loads((HERE/'candidates/summary.json').read_text())
    base=json.loads((HERE/'diagnostics/summary.json').read_text())
    new=json.loads((HERE/'candidate_diagnostics/summary.json').read_text());diag={**base,**new}
    labels=['SPARSE','P2','P2_COLD','INIT_FREE','P2_COLD_INIT','P2_KEEP_PRIMARY']
    tree={r['label']:r for r in times if r['case']=='tree'}
    selection=json.loads((HERE/'screen.json').read_text());selected=selection['selected']
    ran=['SPARSE','P2']+selected if selected else []
    summary=[]
    for label in labels:
        d=diag[label]['totals'];reason='构造前 initial 缺失' if d['before_initial_missing'] else '其他构造前资格'
        summary.append(dict(label=label,Tree_median_ms=tree[label]['median_ms'],
            vs_SPARSE_pct=pct(tree[label]['median_ms'],tree['SPARSE']['median_ms']),
            primary_hits=d['primary_hits'],secondary_hits=d['secondary_hits'],published=d['published'],
            before_initial_missing=d['before_initial_missing'],after_initial_missing=d['after_initial_missing'],
            result_layout=d['result_layout'],allocation_failure=d['allocation_failure'],
            common_failure=reason,full_run=label in ran))
    with (HERE/'tree_summary.csv').open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(summary[0]));w.writeheader();w.writerows(summary)
    lines=['# Tree 构造 IC：initial shape 依赖实验', '',
        '基于提交 7c941da；主基线为冻结 SPARSE。Release 计时与诊断分开；CPU 2、原 Tree 输入与 N=256，'
        '原计时边界，首次 Run 计入，无额外热身。所有旧代码和冻结源码不修改，不 push。', '',
        '## 结论', '',
        '第一处分歧在构造前查找 initial shape：SPARSE / 旧 P2 / P2_COLD 分别失败 '
        '6,605,699 / 3,492,667 / 8,372,555 次；构造后的 initial 缺失、结果布局和分配失败都是零。'
        '删除两处硬依赖及 initial 持有后，单槽和冷双槽都达到 512 次发布、10,769,918 次命中。'
        '这定位了覆盖下降的直接门槛，没有把更深层的 initial 可见性差异预先归因于槽位布局。', '',
        'initial 在这里指“相同原型、零个自有字段的空 shape”。QuickJS 可以在首次添加字段时就地扩展不共享的 shape，'
        '所以合法构造器不保证一直有一份这样的空 shape 留在全局表中。普通构造找不到它会创建新 shape；'
        '原 IC 的学习却直接放弃。命中分配实际使用 final，而不是 initial。这个解释来自源码；'
        '各版本为何保留下不同数量空 shape，本轮没有进一步隔离验证。', '',
        'INIT_FREE 的 Tree 七轮中位数比同批 SPARSE 快 41.78%，稳定单构造器慢 0.23%；'
        'P2_COLD_INIT 比父版快 47.33%，稳定用例慢 1.69%。两者 7/7 组 Tree 配对快至少 5%。'
        'KEEP_PRIMARY 没有 Tree 收益，不跑全集。P2_SIDE 按条件跳过，因为 INIT_FREE 已恢复冷双槽的覆盖。', '',
        '| 版本 | Tree 七轮中位 ms/Run | 相对同批 SPARSE | 主槽命中 | 副槽命中 | 发布 | 最常见学习失败 | 全集 |',
        '|---|---:|---:|---:|---:|---:|---|---|']
    for r in summary:
        n=r['before_initial_missing'] or diag[r['label']]['totals']['other_pre_qualification']
        lines.append(f'| {r["label"]} | {r["Tree_median_ms"]:.4f} | {r["vs_SPARSE_pct"]:+.2f}% | '
            f'{r["primary_hits"]} | {r["secondary_hits"]} | {r["published"]} | {r["common_failure"]} {n} | '
            f'{"是" if r["full_run"] else "否"} |')
    lines += ['| P2_SIDE | — | — | — | — | — | 按条件跳过，未实现 | 否 |', '',
        '表中 Tree 时间统一来自候选阶段的同批 7 轮；最开始另有三父版各 7 轮用于复现，原始时间均列在下文。'
        '主/副命中等来自独立详细诊断，不使用诊断耗时评价性能。', '',
        '## 两个贡献最大的静态 new 位点', '',
        '都在 bottomUpTree，字节码偏移 26 和 35；每个静态点各遇到 256 个构造器身份。'
        '完整身份聚合在 *.trace.json，未打印每次调用。', '',
        '| 版本 | 位点 PC | 执行次数 | 构造器身份数 | 发布 | 构造前 initial 缺失 | 替换 | 未命中就被替换 |',
        '|---|---:|---:|---:|---:|---:|---:|---:|']
    for label in labels:
        for s in diag[label]['top_sites']:
            lines.append(f'| {label} | {s["pc"]} | {s["calls"]} | {s["constructor_identities"]} | {s["published"]} | '
                f'{s["before_initial_missing"]} | {s["replacements"]} | {s["unused_evicted"]} |')
    lines += ['', '旧 P2 的 342 次替换中，没有一次是“计划发布后从未命中就被替换”。'
        '原负载在每个 Run 内重新声明 TreeNode；同一 Run 内两个 new 位点使用同一个 TreeNode，'
        '下一个 Run 才换新的函数身份。这里并不是 C/D 在同一轮内持续交替的场景。'
        '第二槽有几百万次命中，不自动证明双槽是必要的；INIT_FREE 单槽已达到相同总覆盖，且 Tree 更快。', '',
        '## 学习失败分类', '',
        '| 版本 | 构造前 initial | 构造后 initial | 其他构造前资格 | 其他构造后资格 | 结果布局 | 分配失败 |',
        '|---|---:|---:|---:|---:|---:|---:|']
    for l in labels:
        d=diag[l]['totals'];lines.append('| '+l+' | '+' | '.join(str(d[k]) for k in ['before_initial_missing','after_initial_missing','other_pre_qualification','other_post_qualification','result_layout','allocation_failure'])+' |')
    light=json.loads((HERE/'extra_counts/light_comparison.json').read_text())
    lines += ['', '## 诊断是否改变路径分布', '',
        '详细诊断不增加 FourSite、FullPlan、JSFunctionBytecode 字段；使用固定的原生聚合表，'
        '不持有 callee 或 shape 引用。对象释放时结束身份代际，避免地址复用被误当成同一个构造器。'
        '另跑第二轮轻计数版本比较：', '',
        '| 版本 | 轻计数 主/副/发布 | 详细计数 主/副/发布 | 是否一致 |', '|---|---|---|---|']
    for l,r in light.items():
        fmt=lambda d:'/'.join(str(d[k]) for k in ['primary_hits','secondary_hits','published'])
        lines.append(f'| {l} | {fmt(r["light"])} | {fmt(r["detailed"])} | {"是" if r["same_distribution"] else "否"} |')
    lines += ['', '没有观察到这两种计数构建之间的路径分布变化。未插桩 Release 本身不提供命中计数，'
        '所以不把诊断耗时或上述一致性当作未插桩路径分布的直接测量。', '']
    lines += table('最初三父版：每轮原始 Tree 时间（ms/Run）',initial,'tree',['SPARSE','P2','P2_COLD'])
    lines += table('候选同批：每轮原始 Tree 时间（ms/Run）',times,'tree',labels)
    lines += table('稳定全 C：每轮原始时间（ms，16,777,216 次）',times,'micro',labels)
    lines += ['## 是否进入全集', '',
        'Tree 中位数至少快 5%、至少 5/7 组配对快 5%；稳定用例中位数回退不超过 2%。'
        '其中 2% 是本轮在候选计时前声明的工程量化，并非用户给定的硬数字。', '',
        '| 候选 | 父版 | Tree 变化 | 达到 5% 的配对 | 稳定用例变化 | 进入全集 |',
        '|---|---|---:|---:|---:|---|']
    for r in selection['results']:
        lines.append(f'| {r["label"]} | {r["parent"]} | {r["Tree_change_pct"]:+.2f}% | '
            f'{r["pairs_at_least_5pct_faster"]}/7 | {r["stable_change_pct"]:+.2f}% | {"是" if r["pass_full_gate"] else "否"} |')
    micros=json.loads((HERE/'extra_counts/micros.json').read_text())
    mtimes=json.loads((HERE/'keep_micro_times/results.json').read_text())
    lines += ['', '## 固定主槽的额外小用例', '',
        '| 输入 | 版本 | 主命中 | 副命中 | 发布 | 替换 |', '|---|---|---:|---:|---:|---:|']
    for r in micros:
        d=r['totals'];lines.append(f'| {r["pattern"]} | {r["label"]} | {d["primary_hits"]} | {d["secondary_hits"]} | {d["published"]} | {d["replacements"]} |')
    lines += ['', '| 输入 | 旧 P2 ms | KEEP_PRIMARY ms | 变化 |', '|---|---:|---:|---:|']
    for pattern in ['alternate','rotate3','c_then_e','ccdd_c_e']:
        a,b=[next(r['value_ms'] for r in mtimes if r['label']==l and r['pattern']==pattern) for l in ['P2','P2_KEEP_PRIMARY']]
        lines.append(f'| {pattern} | {a:.4f} | {b:.4f} | {pct(b,a):+.2f}% |')
    lines += ['', '额外时间每输入各一个新进程；机制计数各 65,536 次，时间各 16,777,216 次。'
        'c_then_e 是前半 C 后半 E；ccdd_c_e 在计时内先 CC/DD，再长期 C、长期 E，'
        '使第三个目标进入时能观察固定主槽留下旧计划的代价。', '']
    full=HERE/'full_bench/summary.json'
    if full.exists():
        f=json.loads(full.read_text());lines+=['## 完整 Octane / SunSpider 单轮', '',
            '| 版本 | Octane GM 相对 SPARSE | SunSpider GM 相对 SPARSE |', '|---|---:|---:|']
        for l in ['SPARSE','P2']+selected:
            o,s=[f['aggregates'][k][l]['GM_pct'] for k in ['octane','sunspider']]
            lines.append(f'| {l} | {o:+.2f}% | {s:+.2f}% |')
        lines += ['', '本批没有整体耗时下降的候选。INIT_FREE 的最大单项回退是 bitops-nsieve-bits +14.28%，'
            'P2_COLD_INIT 为同项 +14.13%；Octane NavierStokes 分别 +9.88% / +5.56%。'
            'Tree 的重复收益不能替代全集结论；保留独立补丁，不替换 SPARSE。']
        lines+=['', '完整逐项：[Octane](full_bench/octane.md)、[SunSpider](full_bench/sunspider.md)。'
            '两套 GM 分开报告；这是一次全集筛选，不自动替换冻结 SPARSE。','']
    lines+=['复现命令见 [REPRODUCE.md](REPRODUCE.md)，关键 C 代码见 [key_code.md](key_code.md)。','']
    (HERE/'results.md').write_text('\n'.join(lines))
    (HERE/'mechanism_report.md').write_text('\n'.join(lines[:lines.index('## 最初三父版：每轮原始 Tree 时间（ms/Run）')]))
    code=['# 关键代码与保留的检查','',
        'INIT_FREE 从 SPARSE 独立派生；P2_COLD_INIT 从 P2_COLD 独立应用同一删除。'
        '并未把 KEEP_PRIMARY 与 INIT_FREE 组合。','',
        '## 1. initial 不是命中分配所用的布局','',
        '原 `plan_try` 实际使用 final：','','```c',
        '*out=JS_NewObjectFromShape(ctx,js_dup_shape(s->final),JS_CLASS_OBJECT,NULL);','```','',
        '命中路径从未读取 s->initial。它原来只在学习前后被查找，并被持有、标记和释放。', '',
        '`find_hashed_shape_proto` 只找同原型的零字段 shape；普通构造没有找到时会新建，'
        '但原 IC 在此放弃学习。`add_shape_property` 会扩展未共享的 shape；空 shape 是否仍存在，'
        '不能用来判定构造模板或最终对象是否合法。', '',
        '## 2. 删除学习门槛，热布局保持原样','', '```c',
        'JSShape *reserved_initial, *final; /* reserved, does not own a reference */',
        '/* FullPlan remains 96 B; reserved=16, final=24, recipe=32. */',
        'if(!plan_base(ctx,callee,target,argc,&f) ||',
        '   !plan_recipe(f->u.func.function_bytecode,&r) ||',
        '   !(proto=plan_proto(f)))return 0;',
        'return plan_chain(proto,&r);','```','',
        '删掉构造前 `find_hashed_shape_proto` 条件，以及构造后同样的 lookup/return。'
        '构造后的 prototype、字段描述符、final shape、属性顺序和数量检查全部保留；'
        '不再给 initial 增引用、GC 标记或释放。', '',
        '## 3. KEEP_PRIMARY 只改满槽时的淘汰','', '```c',
        '/* Existing same-target selection above is unchanged. */',
        'return &s->extra->plan[0]; /* replace secondary only */','```','',
        '旧 P2 的四十字节位点、双槽探测顺序、资格检查和计划引用管理保持原样。'
        'Tree 没有重复 5% 收益，因此不跑其全集。P2_SIDE 根据覆盖恢复结果跳过。','']
    (HERE/'key_code.md').write_text('\n'.join(code));print('REPORT_SAVED',flush=True)


if __name__=='__main__':main()
