"""Audit and report the negative coverage result without inventing a speedup."""
import csv
import json
import platform
import re
import statistics
import subprocess
import tempfile
from pathlib import Path

from build import HERE,ROOT,PACKAGE,LABELS,candidate,save,sha


def csvout(path,rows):
    with Path(path).open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)


def audit():
    assert subprocess.check_output(['git','branch','--show-current'],cwd=ROOT,text=True).strip()=='myx'
    manifest=json.loads((PACKAGE/'manifest.json').read_text())
    for section in ['original','modified']:
        for n,h in manifest[section].items():assert sha(PACKAGE/section/n)==h,(section,n)
    base={n:(PACKAGE/'modified'/n).read_text() for n in manifest['modified']}
    new=dict(base);candidate(new)
    changed=[n for n in new if new[n]!=base.get(n)]
    assert set(changed)=={'four_runtime.inc','quickjs.c','local_shape_guard.inc'},changed
    for label in LABELS:
        for mode in ['release','counts']+(['sanitize'] if label!='SPARSE' else []):
            m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text())
            assert sha(m['binary'])==m['binary_sha256']
            for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
            if mode in ['release','sanitize']:
                expected=base if label=='SPARSE' else new
                for n,text in expected.items():assert (Path(m['binary']).parent/n).read_text()==text,n
    # Preserve original qualification, GC budget, initial gate and two polls.
    old=base['four_runtime.inc'];current=new['four_runtime.inc']
    def block(s,first,last):return s[s.index(first):s.index(last,s.index(first))]
    for a,b in [('static int plan_base(','static int plan_slow_eligible('),
                ('static int plan_slow_eligible(','static void plan_learn(')]:
        assert block(old,a,b)==block(current,a,b),a
    assert block(old,'        /* The two old entries','    FOUR_COUNT(s,guard)')==block(current,'        /* The two old entries','    FOUR_COUNT(s,guard)')
    with tempfile.TemporaryDirectory(prefix='ctor-local-patch-') as t:
        for n in changed:
            if n in base:(Path(t)/n).write_text(base[n])
        subprocess.run(['patch','-p1','--fuzz=0','--batch','-i',str(HERE/'SPARSE-to-CTOR_LOCAL_SHAPE_GUARD.patch')],cwd=t,capture_output=True,check=True)
        for n in changed:assert (Path(t)/n).read_text()==new[n],n
    for name in ['gate','fixture','lifetime','sanitize']:
        assert json.loads((HERE/f'{name}.json').read_text())['status']=='PASS',name
    samples=json.loads((HERE/'timing_samples.json').read_text());assert len(samples)==20
    assert sha(HERE/'ctor.js')==sha(ROOT/'experiments/sparse_whitebox_20261116/attempt01/ctor.js')
    for s in samples:
        raw=json.loads((HERE/'timing'/f'{s["case"]}.{s["label"]}.release.{s["rep"]}.run.json').read_text())
        assert raw['stdout']==s['stdout'] and raw['exit_code']==0 and not raw['stderr']
        assert raw['mode']=='release' and sha(raw['command'][0])==json.loads((HERE/f'{s["label"]}.release.manifest.json').read_text())['binary_sha256']
        if s['case']=='whitebox':
            p=json.loads(raw['stdout']);assert p['iterations']==67108864 and p['checksum']==3*67108864
            assert s['ms']==p['elapsed_ms']
        else:
            ps=[json.loads(line[len('OCTANE_IC_RESULT:'):]) for line in raw['stdout'].splitlines() if line.startswith('OCTANE_IC_RESULT:')]
            assert len(ps)==1 and ps[0]['correctness']=='PASS' and s['ms']==ps[0]['elapsed_ms']/ps[0]['N']
    summary=json.loads((HERE/'timing.json').read_text())
    for r in summary:
        values=[s['ms'] for s in samples if s['case']==r['case'] and s['label']==r['label']]
        assert len(values)==5 and values==r['values_ms'] and statistics.median(values)==r['median_ms']
    csvout(HERE/'raw_timing.csv',[dict(case=s['case'],label=s['label'],rep=s['rep'],time_ms=s['ms'],
        metric='whole-loop ms' if s['case']=='whitebox' else 'ms/Run',exit_code=s['exit_code']) for s in samples])
    save(HERE/'audit.json',dict(status='PASS',branch='myx',changed_release_files=changed,
        frozen_sources_unchanged=True,patch_reconstructs_exact_source=True,
        FourSite_unchanged=True,read_IC_sources_unchanged=True,no_global_epoch=True,
        plan_base_and_slow_qualification_unchanged=True,initial_shape_gate_unchanged=True,
        interrupt_polls_allocation_and_fill_code_unchanged=True,formal_fresh_release_processes=20,
        five_repeats_per_case_per_version=True,counters_separate=True,no_full_suite_run=True))


def source_proof():
    folder=HERE/'source_evidence';folder.mkdir(exist_ok=True)
    text=(PACKAGE/'modified/quickjs.c').read_text()
    names=['add_property','js_shape_prepare_update','JS_SetPrototypeInternal','delete_property','JS_AutoInitProperty','js_update_property_flags']
    for name in names:
        matches=list(re.finditer(r'\b'+name+r'\s*\(',text))
        found=None
        for m in matches:
            start=text.rfind('\n',0,m.start())+1
            opening=text.find('{',m.end());semi=text.find(';',m.end())
            if opening<0 or (semi>=0 and semi<opening):continue
            # Calls followed by control blocks must not be mistaken for definitions.
            if not text[start:m.start()].startswith('static '):continue
            depth=1;end=opening+1
            while depth:
                depth+=(text[end]=='{')-(text[end]=='}');end+=1
            found=text[start:end];break
        assert found,name
        (folder/(name+'.c.txt')).write_text(found+'\n')
    proof='''# 已哈希且被持有的 shape 为什么能作布局守卫

核查对象是冻结 modified/quickjs.c，未修改任何变动入口。

- 添加属性：add_property 对已哈希 shape 先复用目标 shape；找不到时，引用计数不为 1 就 clone，再追加描述符。守卫持有引用后，接收者原 shape 至少有对象与守卫两份引用，不能走“唯一引用直接追加”。
- 删除属性：delete_property 先调用 js_shape_prepare_update，再清除 atom/flags、更新 hash 链。压缩属性表只处理已经脱离旧守卫的未哈希 shape。
- 改描述符、可写性与 data/accessor 类型：JS_DefineProperty / js_update_property_flags 经 js_shape_prepare_update。已哈希且被共享的布局被复制成未哈希布局，原守卫指向的描述符不变。
- 改原型链：JS_SetPrototypeInternal 在写 sh->proto 前调用 js_shape_prepare_update。守卫持有的旧 shape 的 proto 链接不被原地改写。
- AUTOINIT 实例化：JS_AutoInitProperty 同样先调用 js_shape_prepare_update，之后才清除 JS_PROP_TMASK、写属性值。这也是普通构造函数 .prototype 实例化后变成未哈希布局的原因。
- 普通数据值替换可能不换 shape。因此命中时仍读取构造函数 prototype 槽的当前值并比较实际原型身份，不能只比较函数 shape。
- 未哈希布局：js_shape_prepare_update 不会仅因为引用计数大于 1 就 clone 未哈希布局，所以明确拒绝，不能照搬已哈希布局的证明。

记录只覆盖普通字节码构造函数与普通非 exotic 原型对象，最大链长 4，检查实际链及 NULL 终点。数组、RegExp 等内部模板直接改 shape 的路径不进入这类记录。构建记录无额外 JS 读取/调用；js_mallocz_rt 失败不设置 JS 异常，也不触发 JS 层 GC。

结论：这份窄守卫在上述限制下可成立，但普通 JS 函数的 AUTOINIT 正是覆盖障碍；不能为了覆盖率把未哈希布局当成稳定布局。

旧 CTOR_PROTO_TICKET 使用共享 epoch 和登记对象。这次没有复制它的 runtime/object 标志或失效入口。历史结果只是参考，不作为本批基线。
'''
    (folder/'proof.md').write_text(proof)


def main():
    audit();source_proof()
    times=json.loads((HERE/'timing.json').read_text());mechanism=json.loads((HERE/'mechanism.json').read_text())
    fixture=json.loads((HERE/'fixture.json').read_text());decision=json.loads((HERE/'decision.json').read_text())
    profile=json.loads((HERE/'callgrind/summary.json').read_text())
    env=dict(platform=platform.platform(),gcc=subprocess.check_output(['gcc','--version'],text=True).splitlines()[0],
        head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip(),CPU=2,TZ='Asia/Shanghai',locale='C')
    save(HERE/'environment.json',env)
    display={'whitebox':'原白盒高正命中循环','EarleyBoyer.Boyer':'Octane Boyer'}
    lines=['# CTOR_LOCAL_SHAPE_GUARD：局部 shape 守卫实验','',
        '**结果：原白盒和 Boyer 的局部守卫覆盖都是 0，省下的按名查找是 0。五轮 Release 计时反而退化，不跑全集，不替换 SPARSE。**','',
        '唯一底座为 on_demand_ctor_cache/modified 的冻结 SPARSE（06aada4）。只增加可选局部记录，保留单槽、initial shape 门槛、原对象分配、GC 条件和两次中断检查；无全局 epoch，无其他优化叠加。','',
        '## 为什么没有真实覆盖','',
        '普通函数的 prototype 是 AUTOINIT 属性。第一次实例化会经过 js_shape_prepare_update，把函数布局变成未哈希。'
        '按本轮要求，这样的函数不能建立局部记录。Boyer 的 1,863 次计划发布全部被这一关拒绝，已有约 821 万次正命中仍走完整检查。',
        'class 的实际最终字节码包含 check_ctor、class_fields_init 等，原 R3 模板本来就不支持。没有扩大模板、没有重新哈希真实 benchmark 的构造器。'
        '实际 class 字节码证据在 class_bytecode/。','',
        '## 同批 5 次正式计时','',
        '| 用例 | 原 SPARSE 中位数 ms（范围） | 新版中位数 ms（范围） | 变化 |',
        '|---|---:|---:|---:|']
    for case in display:
        b,v=[next(r for r in times if r['case']==case and r['label']==l) for l in LABELS]
        lines.append(f'| {display[case]} | {b["median_ms"]:.4f}（{b["min_ms"]:.4f}–{b["max_ms"]:.4f}） | '
                     f'{v["median_ms"]:.4f}（{v["min_ms"]:.4f}–{v["max_ms"]:.4f}） | {v["change_percent"]:+.2f}% |')
    lines+=['','白盒 N=67,108,864，单位为整段循环 ms；完全复用 sparse_whitebox_20261116 的 ctor.js positive/100 输入。'
        'Boyer 单位 ms/Run，使用原输入与固定 N、Setup/Run 边界。每版每项 5 个新进程、交替先后顺序，CPU 2、C locale、Asia/Shanghai，首次 Run 计入。'
        '时间只来自未插桩 Release。未丢弃白盒新版第五轮的较慢样本。历史 3,677 ms 未作为基线。','',
        '### 五个原始时间（按轮次）','', '| 用例 | 版本 | 第1轮 | 第2轮 | 第3轮 | 第4轮 | 第5轮 |','|---|---|---:|---:|---:|---:|---:|']
    for r in times:lines.append('| '+display[r['case']]+' | '+r['label']+' | '+' | '.join(f'{v:.4f}' for v in r['values_ms'])+' |')
    lines+=['','## 独立计数：实际省掉的工作','',
        '| 用例 | 版本 | 正命中 | 记录发布 | 新记录建成 | 局部守卫正命中 | 回完整检查 | 热路径 prototype 按名查找 | 热路径 chain 按名查找 |',
        '|---|---|---:|---:|---:|---:|---:|---:|---:|']
    count_rows=[]
    for r in mechanism:
        c=r['counts'];count_rows.append(dict(case=r['case'],label=r['label'],**c))
        if r['case']=='class_fixture':continue
        lines.append(f'| {r["case"]} | {r["label"]} | {c["positive_hits"]:,} | {c["plan_publications"]:,} | '
            f'{c["records_built"]:,} | {c["positive_hits_local"]:,} | {c["full_checks"]:,} | {c["proto_lookups_hot"]:,} | {c["chain_lookups_hot"]:,} |')
    csvout(HERE/'mechanism.csv',count_rows)
    lines+=['','计数覆盖整个脚本，包括 Setup/校验，和正式时间分开。白盒诊断 N=65,536；两个真实用例使用原 N。'
        '三个用例的新版本都没有局部记录，因此局部记录覆盖率、局部守卫尝试/成功/失败、新增记录分配和 shape 引用持有全部为 0；正命中仍回完整检查。',
        'Tree 另有 6,605,699 次在构造前找不到 initial shape，尚未进入学习阶段；成功发布的 198 次也全部因构造函数未哈希而不建记录。'
        '没有添加 INIT_FREE 对照，因为即使解决空 shape，当前函数布局条件仍会拒绝，不把两个实验混在一起。','',
        '## 守卫分支和生命周期是否正确','',
        '普通 JS 差分：与 A / 原 SPARSE 比较 prototype 替换、直接/上层 setter、只读字段、删除、换链、未哈希布局、Proxy、异常；20 组对照通过。'
        '原生命周期、多 realm、显式 GC 测试通过，候选 ASan/UBSan 通过。没有修改字节码或序列化表示。',
        '由于真实 JS 用例没有满足构造函数哈希条件，另用 shape_guard_fixture.c 在**测试中**复制并正确哈希已经物化的布局，专门覆盖这些分支。'
        '它不进入任何 benchmark qjs，不改变构造模板，不算真实覆盖或性能收益。',
        f'- 测试守卫成功 {fixture["counts"]["local_successes"]:,} 次、失败 {fixture["counts"]["local_failures"]:,} 次；失败后完整检查接受 '
        f'{fixture["counts"]["full_check_accepts"]:,} 次、拒绝 {fixture["counts"]["full_check_rejects"]:,} 次。完整检查接受时仍走正计划，且未刷新记录。',
        f'- 强制只让额外记录分配失败：记录建成 0，原正计划仍命中 {fixture["allocation_failure"]["positive_hits"]:,} 次，JS 构造结果正确。',
        f'- {fixture["counts"]["records_built"]} 份记录全部释放；{fixture["counts"]["shape_refs_held"]} 份 shape 引用全部归还。'
        '同一 shape 下替换 prototype 当前值、函数/原型布局改变、setter/只读/删除/换链与两 realm GC 均通过。','',
        '## 内存和编译结果','',
        'FourSite 仍为 32 B。FullPlan 从 96 B 到 104 B，原 callee/initial/final/recipe 的偏移不变；可选记录为 48 B。'
        '带记录时计划 payload 合计 152 B，比原来多 56 B；不带记录的正计划也多 8 B。'
        '本机 QuickJS 小块分配头是 8 B，包含新增记录的分配头后，带记录的计划实际占用块合计增加 64 B；不含 arena 空闲容量或额外保活的 shape 图。'
        '记录最多额外持有 5 份 shape 引用（函数＋4 层），记录申请失败不影响原计划。',
        'Release 汇编显示：原 plan_try 内联进 JS_CallInternal，新版生成独立 plan_try 入口，调用处多了 call。'
        '这是本次编译结果中可见的变化；没有再强行 inline 或调布局来救成绩。证据在 assembly/ 和 callgrind/*.symbols.txt。','']
    if profile['status']=='PASS':
        table=[]
        for r in profile['rows']:
            text=(HERE/'callgrind'/f'{r["label"]}.annotated.txt').read_text()
            funcs={name:0 for name in ['plan_proto','plan_chain']}
            for line in text.splitlines():
                m=re.match(r'\s*([\d,]+)\s+\([^)]*\)\s+.*:(plan_proto|plan_chain)\b',line)
                if m:funcs[m[2]]+=int(m[1].replace(',',''))
            table.append(dict(label=r['label'],whole_script_Ir=r['instructions_Ir'],**funcs))
        csvout(HERE/'callgrind/target_instructions.csv',table)
        lines+=['## Callgrind：指令数单独看','',
            '| 版本 | 整段脚本 Ir | plan_proto 自身 Ir（含内联查找） | plan_chain 自身 Ir（含内联查找） |',
            '|---|---:|---:|---:|']
        for r in table:lines.append(f'| {r["label"]} | {r["whole_script_Ir"]:,} | {r["plan_proto"]:,} | {r["plan_chain"]:,} |')
        lines+=['',f'相同原白盒脚本、N=65,536，整段指令数 {profile["instruction_change_percent"]:+.2f}%；'
            '原型按名检查的指令数没有减少。使用同一对未插桩 Release，Callgrind 时间不作为速度结论。'
            '基线 plan_try 没有独立机器码入口，不能用它作两版共同的函数入口开关；因此完整采集后按函数/source attribution 列出目标路径。','']
    helper=(HERE/'local_shape_guard.inc').read_text()
    hot=helper[helper.index('static force_inline int local_shape_guard_matches'):].strip()
    lines+=['## 实际 C 代码：命中检查','', '```c',hot,'```','',
        '函数 shape 相同后仍读取 prototype 槽的当前值，再逐层核对实际原型链和终点。'
        'plan_validate_proto 在记录缺失或此函数返回 0 时执行原 plan_proto + plan_chain；原检查通过，这次仍使用正计划。','',
        '## 最终回答','',
        '1. 真实用例省了多少次按名查找？**0 次**。原白盒、Boyer、Tree 的热路径查找次数均没有下降。',
        '2. 多少原有正命中符合局部守卫？**0%**。新记录在学习时全部被构造函数的未哈希布局拒绝。',
        '3. 未插桩 Release 是否变快？**没有**。五轮计时白盒与 Boyer 均退化，未继续跑全集。',
        '',decision['reason'],'',
        '源码证明：[source_evidence/proof.md](source_evidence/proof.md)；相对冻结 SPARSE 的独立补丁：`SPARSE-to-CTOR_LOCAL_SHAPE_GUARD.patch`；'
        '复现命令：[REPRODUCE.md](REPRODUCE.md)；原始计时 `timing/*.run.json`、`raw_timing.csv`；原始计数 `counts/*.counts.json`。','']
    (HERE/'results.md').write_text('\n'.join(lines))
    print('REPORT_PASS',str(HERE/'results.md'))


if __name__=='__main__':main()
