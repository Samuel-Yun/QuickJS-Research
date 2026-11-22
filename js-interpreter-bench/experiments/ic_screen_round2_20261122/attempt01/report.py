"""Report mechanism counts, targeted Release comparisons and actual code."""
import json
from pathlib import Path

from build import HERE,LABELS,save


def change(a,b):return 100*(a/b-1)


def main():
    counters=json.loads((HERE/'targeted/counts/results.json').read_text())
    times=json.loads((HERE/'targeted/measure/results.json').read_text())
    def c(label,case,mode='counts'):
        return next(r['counts'] for r in counters if r['label']==label and r['case']==case and r['mode']==mode)
    def t(label,case):return next(r['ms_per_Run'] for r in times if r['label']==label and r['case']==case)
    def micro(label,name):return next(r for r in counters if r['label']==label and r['name']==name+'.'+label)['counts']
    lines=['# 第二轮：机制与定向测量', '',
        '计数与 Release 计时分开。定向真实负载仍用原 N、原 Setup/Run 边界；每版每项一个新进程。'
        '这些定向结果不代替完整 Octane/SunSpider 结果。', '', '## NEG_DIRECT', '',
        '| 表项 | 版本 | 普通构造 | 正命中 | 直接负缓存分支 | 资格入口 | remember 入口 | 负缓存身份检查 |',
        '|---|---|---:|---:|---:|---:|---:|---:|']
    for case in ['RayTrace.RayTrace','EarleyBoyer.Boyer']:
        for l in ['SPARSE','NEG_DIRECT']:
            a=c(l,case);lines.append(f'| {case} | {l} | {a["normal_constructs"]} | {a["positive_hits"]} | '
                f'{a["negative_direct"]} | {a["eligibility_entries"]} | {a["remember_entries"]} | {a["negative_tests"]} |')
    lines += ['', '| 表项 | SPARSE ms/Run | NEG_DIRECT ms/Run | 变化 |', '|---|---:|---:|---:|']
    for case in ['RayTrace.RayTrace','EarleyBoyer.Boyer']:
        a,b=t('SPARSE',case),t('NEG_DIRECT',case)
        lines.append(f'| {case} | {a:.4f} | {b:.4f} | {change(b,a):+.2f}% |')
    lines += ['', '直接分支只在没有正计划、负目标身份相同时启用。普通构造仍完整执行，'
        '异常与参数释放沿用同一出口；有正计划、负身份不同、临时资格失败都走原路径。'
        '冷失配多一次直接分支的身份确认，因此总身份检查的减少量不必恰好等于直接分支次数。', '',
        '## P2_COLD：是否真用了第二槽', '',
        '编译断言：FourSite 32B；单槽 FullPlan 96B，原字段偏移不变；dual/next 在原 padding 的 90/91 字节。'
        '第二个合法目标需要发布时分配 192B 双记录，移动原引用后只释放旧 96B 存储，'
        '不增加或释放那份引用。旧 P2 则是 FourSite 40B，外加 16B 扩展索引及独立的第二份 96B 计划。', '',
        '| Tree 版本 | 构造总次数 | 正命中 | 第二槽命中 | 第二槽占全部构造 | 发布 | 升级/扩展分配 |',
        '|---|---:|---:|---:|---:|---:|---:|']
    case='access-binary-trees'
    for l in ['SPARSE','OLD_P2','P2_COLD']:
        a=c(l,case);second=a['second_hits'];alloc=a['upgrades'] if l=='P2_COLD' else a['extra_allocations']
        lines.append(f'| {l} | {a["ctor_calls"]} | {a["positive_hits"]} | {second} | '
                     f'{100*second/a["ctor_calls"]:.2f}% | {a["plan_publications"]} | {alloc} |')
    lines += ['', '| Tree 版本 | Release ms/Run | 相对 SPARSE |', '|---|---:|---:|']
    for l in ['SPARSE','OLD_P2','P2_COLD']:
        value=t(l,case);lines.append(f'| {l} | {value:.4f} | {change(value,t("SPARSE",case)):+.2f}% |')
    lines += ['', '第二槽确实被使用，但 P2_COLD 在这次 Tree 的整体正计划覆盖低于旧 P2。'
        '不把保住记录尺寸、第二槽被命中，写成已经保住旧 P2 的时间收益；'
        '学习资格函数保持原样，覆盖差异的具体原因本轮没有另加改动追修。', '',
        '| 输入 | 版本 | 正命中 | 第二槽命中 | 发布 | 替换 | 升级/扩展次数 | 请求字节 |',
        '|---|---|---:|---:|---:|---:|---:|---:|']
    for pattern in ['all','rotate2','switch','rotate3','rotate4','rotate5']:
        for l in ['SPARSE','OLD_P2','P2_COLD']:
            a=micro(l,'ctor.'+pattern)
            alloc=a['upgrades'] if l=='P2_COLD' else a['extra_allocations']
            size=a['upgrade_bytes'] if l=='P2_COLD' else a['extra_bytes']
            lines.append(f'| {pattern} | {l} | {a["positive_hits"]} | {a["second_hits"]} | {a["plan_publications"]} | '
                         f'{a["replacements"]} | {alloc} | {size} |')
    fail=micro('P2_COLD','upgrade_failure')
    lines += ['', f'升级失败注入：失败 {fail["upgrade_failures"]} 次，成功升级 {fail["upgrades"]} 次，'
              f'旧主槽仍命中 {fail["positive_hits"]} 次，结果校验通过；没有重放构造。'
              '故障注入只在诊断构建中编译，Release 没有这条环境开关。', '',
        '## PROTO_SMALL：省查找后，比较次数怎样变化', '',
        '实现前的 SPARSE 直方图：Boyer 的小表覆盖为 0%；Tree 有一半原型层访问是两项表。'
        '阈值固定为物理描述符表最多两项，跳过 atom==NULL 的删除槽；物理表较大即使只剩少量有效项也保守回到原查找。', '',
        '| 表项 | 版本 | find_own_property 次数 | 查找内部 atom 比较 | 小表显式 atom 比较 | 总 atom 比较 |',
        '|---|---|---:|---:|---:|---:|']
    for case in ['EarleyBoyer.Boyer','access-binary-trees']:
        for l in ['SPARSE','PROTO_SMALL']:
            a=c(l,case,'atomcounts')
            total=a['lookup_atom_compares']+a['small_atom_compares']
            lines.append(f'| {case} | {l} | {a["descriptor_queries"]} | {a["lookup_atom_compares"]} | '
                         f'{a["small_atom_compares"]} | {total} |')
    lines += ['', '`find_own_property` 在源码里是 force_inline；次数减少不代表省了同样次数的 C 函数调用。'
        'Tree 的命名查找减半，但总 atom 比较从 8,329,858 增至 29,154,503：'
        '原哈希桶经常直接为空，新小表扫描会把两个描述符逐一与未决字段比较。'
        'Boyer 没有小表覆盖，命名查找和比较次数都没减少。', '',
        '| 表项 | SPARSE ms/Run | PROTO_SMALL ms/Run | 变化 |', '|---|---:|---:|---:|']
    for case in ['EarleyBoyer.Boyer','access-binary-trees']:
        a,b=t('SPARSE',case),t('PROTO_SMALL',case)
        lines.append(f'| {case} | {a:.4f} | {b:.4f} | {change(b,a):+.2f}% |')
    lines += ['', '## D16_STATIC：相对旧 D16 的定向对照', '',
        '短指令布局、可压缩函数条件、距离上界、序列化和调试 PC 映射规则均沿用 D16。'
        '只在准备时选择短/宽专用融合前缀；两个前缀都保留，opcode 数量没有超出 256。', '',
        '| 输入 | 旧 D16 ms | D16_STATIC ms | 变化 |', '|---|---:|---:|---:|']
    for pattern in ['short','wide']:
        a=next(r['elapsed_ms'] for r in times if r['name']=='read.'+pattern+'.OLD_D16')
        b=next(r['elapsed_ms'] for r in times if r['name']=='read.'+pattern+'.D16_STATIC')
        lines.append(f'| {pattern}，33,554,432 次 | {a:.4f} | {b:.4f} | {change(b,a):+.2f}% |')
    lines += ['', '实际执行镜像和 Release CFG 均确认短读取为 3 字节，融合没有关闭；'
        '原 D16 宽/短入口各有一次格式判断，STATIC 两者均为零。'
        '见 [真实字节码与汇编](assembly/results.md)。', '',
        '注意：SPARSE 原本就没有 D16 引入的宽窄判断。去掉它是收回 D16 的额外开销，'
        '不能把相对旧 D16 的改善直接算成相对 SPARSE 的收益；最终以本批全集为准。', '',
        '计数原始记录在 `targeted/counts/runs.jsonl`，定向 Release 在 `targeted/measure/runs.jsonl`。'
        '本表是各一轮定向结果，不据此声称显著性。', '']
    (HERE/'mechanism_report.md').write_text('\n'.join(lines))
    code=['# 四个候选的关键 C 代码', '']
    snippets={
        'NEG_DIRECT':('quickjs.c','                    if(!s->plan && sparse_same(s,call_argv[-2])){','                    }else{'),
        'P2_COLD':('four_runtime.inc','    if(!p->dual){','    FullPlan*second='),
        'PROTO_SMALL':('four_runtime.inc','        if(count<=2){','        }else for('),
        'D16_STATIC':('quickjs.c','#define V6_PREPARED_BORROW','        if (object->class_id'),
    }
    full=HERE/'full_bench/summary.json';summary=json.loads(full.read_text()) if full.exists() else None
    for label,(file,a,b) in snippets.items():
        s=(HERE/'work'/(label+'.release')/file).read_text();start=s.index(a);end=s.index(b,start)
        excerpt=s[start:end]
        code+=['## '+label,'','```c',excerpt.rstrip(),'```','']
        if label=='D16_STATIC':
            calls=[line.strip() for line in s.splitlines() if
                ('CASE(OP_v6_get_arg0)' in line or 'CASE(OP_v6_get_loc0)' in line or
                 'CASE(OP_v6s_get_arg0)' in line or 'CASE(OP_v6s_get_loc0)' in line)]
            code+=['实际 handler 传入的是编译期常量，没有运行期 field_size 变量：','','```c',
                   *calls,'```','']
        if summary:
            o,ss=[summary['aggregates'][k][label]['GM_pct'] for k in ['octane','sunspider']]
            code += [f'本批全集：Octane {o:+.2f}%，SunSpider {ss:+.2f}%。'
                     +('达到预设筛选门槛，仍需复测。' if label in summary['qualifying_versions'] else '未达到预设筛选门槛。'),'']
    (HERE/'key_code.md').write_text('\n'.join(code))
    print('ROUND2_REPORT_SAVED',flush=True)


if __name__=='__main__':main()
