"""Explain the saved counters without using instrumented timings."""
import csv
import json
from pathlib import Path

from build import HERE,LABELS,save


def ratio(a,b):return 100*a/b if b else 0


def main():
    out=HERE/'mechanisms'
    assert json.loads((out/'complete.json').read_text())['status']=='PASS'
    micro=json.loads((out/'micro.json').read_text());real=json.loads((out/'real.json').read_text())
    def m(label,p):return next(r['counts'] for r in micro if r['label']==label and r['name']=='micro.'+p+'.'+label)
    lines=['# 机制计数：确实少做了什么', '',
        '所有计数来自独立插桩构建，不使用其耗时评价性能。构造小用例每组 65,536 次，'
        '循环只有一个 new 位点，序列生成在循环外；各版脚本、参数和结果校验相同。', '',
        '## C/D 交替：解析、遍历与发布', '',
        '| 版本 | 正命中 | 模板解析 | 模板复用 | 正计划发布 | 原型层访问 | 描述符查询 | 扩展分配 / 字节 |',
        '|---|---:|---:|---:|---:|---:|---:|---:|']
    for label in LABELS:
        c=m(label,'rotate2')
        lines.append(f'| {label} | {c["positive_hits"]} | {c["recipe_calls"]} | {c["recipe_reused"]} | '
            f'{c["plan_publications"]} | {c["chain_layers"]} | {c["descriptor_queries"]} | {c["extra_allocations"]} / {c["extra_bytes"]} |')
    lines += ['', 'M1 在这组输入把模板解析从 131,071 次减为 65,536 次，正计划仍发布 65,535 次。'
        'M2 把原型层访问从 524,280 次减为 262,140 次，描述符查询仍是 524,280 次。'
        '多槽在容量内主要省的是反复学习：C/D 交替只发布两份计划，此后基本命中。', '',
        '新增成本也保留在实验里：M1 的失配路径多一次 C 函数调用，并在这个慢路径栈帧中暂存模板和证明信息；'
        '命中路径不放这份临时对象。M2 需要用 pending 位图跟踪哪些字段已经找到最近描述符；'
        '它省掉重复走层，却没有省掉本组输入的描述符查询。', '',
        '## 多槽容量与超容量输入', '',
        '| 输入 | SPARSE 命中率 | P2 命中率 | P3 命中率 | P4 命中率 |',
        '|---|---:|---:|---:|---:|']
    for pattern in ['all','rotate2','switch','rotate3','rotate4','rotate5']:
        lines.append('| '+pattern+' | '+' | '.join(f'{ratio(m(l,pattern)["positive_hits"],65536):.4f}%' for l in ['SPARSE','P2','P3','P4'])+' |')
    lines += ['', '`all` 为全 C；`switch` 为前半 C 后半 D；rotate3/4/5 为同点 3/4/5 个受支持目标轮转。'
        '第一次冷函数准备也走普通构造，所以热输入仍有最初几次回退。容量不足时继续普通构造，'
        '计划满后在包括主槽的全部槽位上轮转替换；不在命中时更新 LRU。', '',
        '| 版本 | 输入 | 正计划发布 | 替换 | 扩展分配 | 扩展字节 |', '|---|---|---:|---:|---:|---:|']
    for l in ['P2','P3','P4']:
        for p in ['all','rotate2','switch','rotate3','rotate4','rotate5']:
            c=m(l,p);lines.append(f'| {l} | {p} | {c["plan_publications"]} | {c["replacements"]} | {c["extra_allocations"]} | {c["extra_bytes"]} |')
    lines += ['', '原 SPARSE 静态构造点 32 字节；P2/P3/P4 均为 40 字节（多一个扩展指针）。'
        '完整计划仍为 96 字节。只有需要发布第二个不同目标的合法计划时才申请扩展记录：'
        'P2/P3/P4 分别 16/24/32 字节；每增加一个活跃计划另需 96 字节。'
        '第一条计划仍在主槽，主槽命中直接返回。', '', '## 真实负载构造计数', '',
        '这里保留原 N，计数包含负载进程的初始化；不是从计数构建抄来的正式时间。', '',
        '| 表项 | 版本 | 构造次数 | 正命中 | 模板解析 | 复用 | 发布 | 原型层访问 | 描述符查询 |',
        '|---|---|---:|---:|---:|---:|---:|---:|---:|']
    for case in ['RayTrace.RayTrace','EarleyBoyer.Boyer','access-binary-trees']:
        for l in LABELS:
            r=next(r for r in real if r['case']==case and r['label']==l);c=r['counts']
            lines.append(f'| {case} | {l} | {c["ctor_calls"]} | {c["positive_hits"]} | {c["recipe_calls"]} | '
                f'{c["recipe_reused"]} | {c["plan_publications"]} | {c["chain_layers"]} | {c["descriptor_queries"]} |')
    lines += ['', '## D16：进入执行的实际镜像', '',
        '每个函数的实际 byte_code_buf 在首次进入解释执行时扫描一次。分母是这些字节码实例中的 '
        'get_field_rdi 位点（D16 包含短版）；同一函数反复调用不重复计数，eval 创建的新字节码实例分别计数。'
        'IC[0] 是记录编号；这里统计的 delta 是指令操作数地址到 ReadICSite 的字节距离。', '',
        '| 套件 | 原 SPARSE 位点 | ≤255 的比例 | ≤65535 的比例 | D16 短位点 / 全部位点 | 短位点比例 |',
        '|---|---:|---:|---:|---:|---:|']
    profile={}
    for suite in ['octane','sunspider']:
        totals={}
        for label in ['SPARSE','D16']:
            chosen=[r['counts'] for r in real if r['suite']==suite and r['label']==label]
            totals[label]={k:sum(c[k] for c in chosen) for k in chosen[0]}
        a,d=totals['SPARSE'],totals['D16'];profile[suite]=totals
        lines.append(f'| {suite} | {a["rdi_sites"]} | {ratio(a["delta8_sites"],a["rdi_sites"]):.2f}% | '
            f'{ratio(a["delta16_sites"],a["rdi_sites"]):.2f}% | {d["short_sites"]} / {d["rdi_sites"]} | '
            f'{ratio(d["short_sites"],d["rdi_sites"]):.2f}% |')
    lines += ['', '| 套件 | 进入执行的镜像代码节省字节 | 对齐后链接镜像节省字节 | 短指令直接执行 | 短指令融合命中 |',
        '|---|---:|---:|---:|---:|']
    for suite,t in profile.items():
        d=t['D16'];saved=d['wide_equivalent_linked_bytes']-d['linked_bytes']
        lines.append(f'| {suite} | {2*d["short_sites"]} | {saved} | {d["short_dispatches"]} | {d["short_fused_hits"]} |')
    lines += ['', '| 套件 | SPARSE malloc 请求字节总量 | D16 malloc 请求字节总量 | 变化 | SPARSE / D16 realloc 请求字节 |',
        '|---|---:|---:|---:|---:|']
    for suite,t in profile.items():
        a,d=t['SPARSE'],t['D16']
        pct=ratio(d['malloc_requested_bytes'],a['malloc_requested_bytes'])-100
        lines.append(f'| {suite} | {a["malloc_requested_bytes"]} | {d["malloc_requested_bytes"]} | {pct:+.4f}% | '
            f'{a["realloc_requested_bytes"]} / {d["realloc_requested_bytes"]} |')
    lines += ['', '总分配列是 js_malloc_rt 的累计请求字节，不是 RSS 或峰值；realloc 的请求总量另列。'
        '镜像省下的字节按实际布局直接计算，不把它当作同等比例的速度收益。', '',
        'D16 不缩短含跳转/异常入口或非普通函数的字节码；这类排除记录在 d16_excluded_control。'
        '调试 PC 在查行号时映射回原宽字节码位置；保存时展开为原格式，加载后再准备。'
        '保守选择 delta 并核对最终布局，装不下时保持宽格式；8 bit 只统计。'
        '没有保留一份宽镜像副本，也没有为每个函数新增映射旁表。', '',
        'D16 的融合入口需要判断下一条读取使用短还是宽格式，再选择读取距离和跳过长度。'
        '这笔格式判断成本也进入正式 Release；没有关闭融合来绕过它。', '',
        '完整逐项计数见 `mechanisms/real.json`，微测试原始计数见 `mechanisms/micro.csv`；'
        '每个计数进程的命令、输出和退出状态在 `mechanisms/runs.jsonl`。', '']
    lines += ['| 套件 | 因控制流/非普通函数保留宽格式的函数实例 | 最终距离验证失败而整函数回退 |',
              '|---|---:|---:|']
    for suite,t in profile.items():
        c=t['D16'];lines.append(f'| {suite} | {c["d16_excluded_control"]} | {c["d16_excluded_range"]} |')
    lines += ['', '单个距离超出保守上界的读点也保留宽格式；它不计作整函数验证失败。', '']
    (HERE/'mechanism_report.md').write_text('\n'.join(lines))
    save(out/'profile_summary.json',profile)
    # Generate two actual code excerpts only after the formal pass exists.
    path=HERE/'full_bench/summary.json'
    if path.exists():
        s=json.loads(path.read_text());code=['# 最值得复测的版本：代码和实测结果', '']
        for label in s['next_versions']:
            q=(HERE/'work'/(label+'.release')/'four_runtime.inc').read_text()
            if label=='M1':
                start=q.index('    if(m && m->bytecode==b');end=q.index('    JSShapeProperty*d=',start)
                excerpt=q[start:end]
                explain='原来构造前后各解析一次模板；现在字节码身份、准备状态、缓冲区和长度都一致时复用，其他情况重新解析。构造后的语义检查仍执行。'
            elif label=='M2':
                start=q.index('    unsigned pending=');end=q.index('\nstatic int plan_base',start)
                excerpt=q[start:end]
                explain='原来每个字段从原型链头走起；现在按层走，在当前层检查尚未确定的字段，最近的描述符决定该字段是否允许写入。'
            elif label.startswith('P'):
                q=(HERE/'work'/(label+'.release')/'sparse_runtime.inc').read_text()
                start=q.index('    if(plan_try');end=q.index('\n}\nstatic int four_ctor_slow',start)
                excerpt=q[start:end]
                explain='原来换一个构造目标就覆盖同一份正计划；现在先试主槽，再试已分配的附加槽，容量内不用反复学习。'
            else:
                q=(HERE/'work/D16.release/read_ic_prepare.inc').read_text()
                start=q.index('            if(shorts && op==OP_get_field',q.index('uint8_t*pc=linked+pos;'))
                end=q.index('            last_read=site;',start);excerpt=q[start:end]
                explain='原来每条字段读携带 4 字节距离；现在经最终布局检查后用 2 字节距离，指令从 5 字节变 3 字节，融合读取仍然可用。'
            o,ss=[s['aggregates'][k][label]['GM_pct'] for k in ['octane','sunspider']]
            passed=label in s['qualifying_versions']
            code += ['## '+label, '', explain, '', '```c',excerpt.rstrip(),'```','',
                f'本批 Octane {o:+.2f}%，SunSpider {ss:+.2f}%。'+
                ('达到预设门槛，值得独立复测。' if passed else '未达到预设门槛；仅作为该套件中最靠前的候选继续核对，不称为整体赢家。'), '']
        (HERE/'key_code.md').write_text('\n'.join(code))
    print('MECHANISM_REPORT_SAVED',flush=True)


if __name__=='__main__':main()
