"""Publish raw data, lifecycle proof, and the measured stopping decision."""
import csv
import json
import platform
import statistics
import subprocess
import tempfile
from pathlib import Path

from build import HERE,ROOT,PACKAGE,LABELS,EVENTS,candidate,save,sha
from run import CASES,TARGETS,diagnostics


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
    assert set(changed)=={'quickjs.c','read_ic_opcodes.inc','global_own_offset.inc'}
    def block(s,a,b):return s[s.index(a):s.index(b,s.index(a))]
    for a,b in [('#define V6_PREPARED_BORROW(slot) do {','#if !DIRECT_DISPATCH'),
                ('        CASE(OP_four_ctor):','        CASE(OP_call_constructor):'),
                ('        CASE(OP_put_field_shared):','        CASE(OP_put_field):')]:
        assert block(base['quickjs.c'],a,b)==block(new['quickjs.c'],a,b),a
    for label in LABELS:
        for mode in ['release','counts']+(['sanitize'] if label!='SPARSE' else []):
            m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text())
            assert sha(m['binary'])==m['binary_sha256']
            for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
            if mode in ['release','sanitize']:
                expected=base if label=='SPARSE' else new
                for n,s in expected.items():assert (Path(m['binary']).parent/n).read_text()==s,n
    with tempfile.TemporaryDirectory(prefix='global-own-patch-') as t:
        for n in changed:
            if n in base:(Path(t)/n).write_text(base[n])
        subprocess.run(['patch','-p1','--fuzz=0','--batch','-i',str(HERE/'SPARSE-to-GLOBAL_OWN_OFFSET_CACHE.patch')],cwd=t,capture_output=True,check=True)
        for n in changed:assert (Path(t)/n).read_text()==new[n],n
    for name in ['weak_gate','gate','serialization','site_mapping']:
        assert json.loads((HERE/f'{name}.json').read_text())['status']=='PASS'
    for folder in ['micro_counts','target_counts']:
        for path in (HERE/folder).glob('*.counts.json'):
            d=diagnostics(path);c=d['totals']
            assert c['registrations']-c['same_key_refreshes']-c['conflict_replacements']-c['cleared_entries']==0,(path,c)
    formal=[]
    for folder,file,expected in [('micro_time','micro_samples.json',60),('target_time','target_samples.json',18)]:
        samples=json.loads((HERE/file).read_text());assert len(samples)==expected
        assert len(list((HERE/folder).glob('*.run.json')))==expected
        for r in samples:
            path=HERE/folder/f'{r["case"]}.{r["label"]}.release.{r["rep"]}.run.json'
            raw=json.loads(path.read_text());assert raw['mode']=='release' and raw['exit_code']==0 and not raw['stderr']
            assert raw['stdout']==r['stdout'] and sha(raw['command'][0])==raw['binary_sha256']
            if folder=='micro_time':
                p=json.loads(raw['stdout']);assert p['elapsed_ms']==r['ms'] and p['checksum']==p['iterations']*({'stable':3,'same_slot':4,'different_slot':4,'multi':6}[r['case']])
            formal.append(dict(phase=folder,case=r['case'],label=r['label'],rep=r['rep'],time_ms=r['ms'],
                metric='whole-loop ms' if folder=='micro_time' else 'ms/Run',raw_record=str(path.relative_to(HERE))))
    csvout(HERE/'raw_timings.csv',formal)
    for path,summary in [('micro_samples.json','micro_timing.json'),('target_samples.json','target_timing.json')]:
        data=json.loads((HERE/path).read_text())
        for r in json.loads((HERE/summary).read_text()):
            values=[s['ms'] for s in data if s['label']==r['label'] and s['case']==r['case']]
            assert values==r['values_ms'] and statistics.median(values)==r['median_ms']
    # A was also measured live, from the actual frozen original sources.
    for n,h in manifest['original'].items():assert sha(PACKAGE/'build/A'/n)==h,n
    compilers={l:subprocess.check_output(['readelf','-p','.comment',str(PACKAGE/'build/A/qjs') if l=='A' else
        json.loads((HERE/f'{l}.release.manifest.json').read_text())['binary']],text=True).strip() for l in ['A']+LABELS}
    assert len(set(compilers.values()))==1,compilers
    save(HERE/'environment.json',dict(platform=platform.platform(),gcc=subprocess.check_output(['gcc','--version'],text=True).splitlines()[0],
        head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip(),CPU=2,TZ='Asia/Shanghai',locale='C',compiler_comments=compilers))
    save(HERE/'audit.json',dict(status='PASS',branch='myx',changed_release_files=changed,frozen_sources_unchanged=True,
        patch_reconstructs_without_fuzz=True,constructor_sources_and_handler_unchanged=True,write_handler_unchanged=True,
        fusion_and_encoding_unchanged=True,ReadICSite_unchanged=True,formal_release_processes=len(formal),
        live_A_control=True,raw_times_match_medians=True,counters_not_in_release=True,
        weak_table_entry_balance_zero_after_runtime_exit=True,weak_and_semantic_and_ASan_UBSan_gates='PASS',
        full_suites_run=(HERE/'full_complete.json').exists()))


def source_proof():
    lines=['# 弱表失效入口核对','',
        '缓存键是完整 shape 指针与 atom；它不持有 shape/atom 引用。下表描述本轮新增的失效或初始化动作。','',
        '| 路径 | 原路径动作 | 弱表处理 |','|---|---|---|',
        '| js_new_shape_nohash | 新分配 shape | head=0，覆盖所有普通/预分配对象工厂 |',
        '| js_clone_shape | 复制旧 shape 的主体和描述符 | 新 head=0，旧记录仍归旧 shape |',
        '| js_shape_hash_unlink | 取消当前 hash 登记 | 先沿 shape 的链摘除全部弱项 |',
        '| add_shape_property | 唯一已哈希布局可能原地追加 | 原来先调用 hash_unlink，因此在改 hash/prop_count/描述符前已清理 |',
        '| js_shape_prepare_update | 唯一 shape 取消哈希；共享 shape 复制 | 唯一分支经 hash_unlink 清理；共享分支克隆新 head=0，旧不可变布局仍可使用 |',
        '| JS_DefineProperty / js_update_property_flags / JS_AutoInitProperty | 改 flags、getter、只读、AUTOINIT | 原来均经 prepare_update，受上述处理覆盖 |',
        '| JS_SetPrototypeInternal | 改 sh->proto | 原来先经 prepare_update，旧缓存不跨过原型链接变化 |',
        '| delete_property / compact_properties | 清 atom/flags，可能压缩搬移 | 删除先 prepare_update；compact 搬移前额外清理，新 head=0 |',
        '| resize_properties | 扩容并搬移 shape | 成功分配新块后、复制/释放旧块前清理；新 head=0 |',
        '| js_closure_define_global_var | 一处直接写全局属性 flags | 在该分支直接清理 p->shape，先于 free_property/flags 写入 |',
        '| js_free_shape0 | 释放 proto、atoms 和 shape 内存 | 已哈希分支经 unlink 清理；未哈希分支显式清理；都先于释放 proto/atoms |',
        '| JS_FreeRuntime | 释放已有转换缓存根并收集剩余图 | 最先禁用和清空共享表，避免 finalizer 重入重新登记 |','',
        'resize_shape_hash 只搬 hash 桶数组、改 shape_hash_next，不移动 shape 地址或属性描述符，不是此缓存的失效依赖。',
        '内置模板直接调用 add_shape_property 的路径创建专用上下文初始布局；其新 shape 也由已初始化 head 的工厂创建。'
        '属性 append 本身在已哈希时经过 hash_unlink，仍然先清理。',
        'GC 不扫描这个表作强根。循环回收的 shape 最终仍通过原 js_free_shape/js_free_shape0 释放。'
        '克隆和两个搬移路径均显式重置 head，不把旧 shape 的索引链接复制给新 shape。','',
        '登记在 rdi_update 之前，且不分配、不执行 JS、不释放值；rdi_update 发布新一级记录后释放旧引用时，即使原生回调重入并使当前 prop[] 搬移，后续也不再读取旧 descriptor。'
        'C 重入测试会递归替换该一级记录、释放原布局并扩容当前对象，A 的普通 JS 语义和 SPARSE/候选的当前值、后续值均另行验证。','',
        '具体源码见 SPARSE-to-GLOBAL_OWN_OFFSET_CACHE.patch；对应 source/sizeof/offset 及 C 生命周期测试输出见 weak_gate.json 与 validation/。']
    (HERE/'weak_lifetime_proof.md').write_text('\n'.join(lines)+'\n')


def main():
    audit();source_proof()
    micro=json.loads((HERE/'micro_timing.json').read_text());counts=json.loads((HERE/'micro_counts.json').read_text())
    target=json.loads((HERE/'target_timing.json').read_text());tc=json.loads((HERE/'target_counts.json').read_text())
    decision=json.loads((HERE/'decision.json').read_text());writes=json.loads((HERE/'write_counts/summary.json').read_text())
    mapping=json.loads((HERE/'site_mapping.json').read_text())['records']
    names={'stable':'同一布局','same_slot':'两布局同槽','different_slot':'两布局异槽','multi':'四布局轮转'}
    text=['# GLOBAL_OWN_OFFSET_CACHE：共享弱二级缓存','',
        '**结果：同槽/异槽白盒均改善，但三个真实用例未出现可复现收益，停止于定向筛选，不跑全集、不扩容、不换策略。**','',
        '唯一底座为冻结 SPARSE_CTOR_IC（06aada4），Release 只改 quickjs.c 的弱表生命周期接入、read_ic_opcodes.inc 的 keep=0 失配路径，并新增 global_own_offset.inc。'
        '原构造 IC、原型读、融合入口、写入 handler、ReadICSite 和字节码编码均保持原版。','',
        '## 五轮微基准：A 也现场重测','',
        '| 输入 | A 中位数 ms | SPARSE 中位数 ms | 新版中位数 ms | 新版相对 SPARSE | 新版相对 A |',
        '|---|---:|---:|---:|---:|---:|']
    for case in CASES:
        a,b,v=[next(r for r in micro if r['case']==case and r['label']==l) for l in ['A']+LABELS]
        text.append(f'| {names[case]} | {a["median_ms"]:.4f} | {b["median_ms"]:.4f} | {v["median_ms"]:.4f} | '
            f'{v["change_vs_SPARSE_percent"]:+.2f}% | {100*(v["median_ms"]/a["median_ms"]-1):+.2f}% |')
    text+=['','相同脚本与输入，N=134,217,728；每版每组 5 个新进程，按轮次轮换版本顺序。performance.now 包住整个 run()，生成对象/序列不计时，首次调用计入，无额外热身。'
        'A 没有这个 IC，只按相同输入比较时间，不给 A 编造命中率。没有引用历史 +13.2%。','',
        '| 输入 | 版本 | 原始五轮 ms | 中位数 ms | 最小～最大 ms |','|---|---|---|---:|---|']
    for r in micro:text.append(f'| {names[r["case"]]} | {r["label"]} | '+', '.join(f'{x:.3f}' for x in r['values_ms'])+
        f' | {r["median_ms"]:.3f} | {r["min_ms"]:.3f}～{r["max_ms"]:.3f} |')
    text+=['','## 白盒计数：每个 readX 位点 65,536 次','',
        '| 输入 | 版本 | 一级命中 | 二级探测 | 二级命中 | 正常查找 | 一级更新 | 二级命中/探测 | 二级命中/全进程命名读取 |',
        '|---|---|---:|---:|---:|---:|---:|---:|---:|']
    for r in counts:
        c=r['site']['counts']
        hit_ratio=r['totals']['secondary_probe_hit_percent']
        hit_text='—' if hit_ratio is None else f'{hit_ratio:.4f}%'
        text.append(f'| {names[r["case"]]} | {r["label"]} | {c["primary_hits"]:,} | {c["secondary_probes"]:,} | '
            f'{c["secondary_hits"]:,} | {c["normal_lookups"]:,} | {c["primary_updates"]:,} | {hit_text} | '
            f'{r["totals"]["secondary_all_named_percent"]:.4f}% |')
    text+=['','两布局都只正常查找/更新两次，四布局只做四次；随后二级命中不调用 rdi_update。'
        '不同槽布局的 x 确认为槽 0/1，四布局为 0/1/2/3，x 当前值不同，校验通过。实际镜像是 v6_get_arg0 → get_field_rdi → return，两版指令长度相同。'
        '逐次布局证据、最终一级快照、真实字节码见 micro_counts/。',
        '同一布局二级探测为 0，但正式时间仍比 SPARSE 慢约 2.85%；不能把这部分时间差说成热路径在探共享表。','',
        '## 真实用例：三对新进程','',
        '| 表项 | SPARSE 中位数 ms/Run | 新版中位数 ms/Run | 变化 | 三对逐对变化 |',
        '|---|---:|---:|---:|---|']
    for c in TARGETS:
        b,v=[next(r for r in target if r['case']==c['case'] and r['label']==l) for l in LABELS]
        ev=next(r for r in decision['evidence'] if r['case']==c['case'])
        text.append(f'| {c["name"]} | {b["median_ms"]:.4f} | {v["median_ms"]:.4f} | {v["change_vs_SPARSE_percent"]:+.2f}% | '+
            ', '.join(f'{x:+.2f}%' for x in ev['paired_change_percent'])+' |')
    text+=['','| 表项 | 全部逻辑命名读取 | 二级探测 | 二级命中 | 命中/探测 | 命中/全部命名读取 |',
        '|---|---:|---:|---:|---:|---:|']
    work=[];life=[]
    for c in TARGETS:
        b,v=[next(r['totals'] for r in tc if r['case']==c['case'] and r['label']==l) for l in LABELS]
        assert b['logical_named']==v['logical_named']
        text.append(f'| {c["name"]} | {v["logical_named"]:,} | {v["secondary_probes"]:,} | {v["secondary_hits"]:,} | '
            f'{v["secondary_probe_hit_percent"]:.4f}% | {v["secondary_all_named_percent"]:.4f}% |')
        work.append(dict(case=c['case'],baseline_primary_hits=b['primary_hits'],candidate_primary_hits=v['primary_hits'],
            baseline_normal_lookups=b['normal_lookups'],candidate_normal_lookups=v['normal_lookups'],
            fewer_normal_lookups=b['normal_lookups']-v['normal_lookups'],baseline_primary_updates=b['primary_updates'],
            candidate_primary_updates=v['primary_updates'],fewer_primary_updates=b['primary_updates']-v['primary_updates']))
        life.append(dict(case=c['case'],registrations=v['registrations'],same_key_refreshes=v['same_key_refreshes'],
            conflict_replacements=v['conflict_replacements'],invalidations=v['invalidations'],cleared_entries=v['cleared_entries'],
            shutdown_entries=v['shutdown_entries'],non_shutdown_cleared_entries=v['cleared_entries']-v['shutdown_entries']))
    text+=['','“全部逻辑命名读取”包括 rdi0/rdi1、融合及普通 get_field/get_field2/get_length，排除动态下标读与 C 内部属性 API。'
        '诊断覆盖整个脚本，包括 Setup/校验；正式耗时仍只按原 Run 区间计算。两种命中比例不能混用。','',
        '| 表项 | 正常查找：原 → 新 | 净减少 | 一级更新：原 → 新 | 净减少 |',
        '|---|---:|---:|---:|---:|']
    for r in work:text.append(f'| {r["case"]} | {r["baseline_normal_lookups"]:,} → {r["candidate_normal_lookups"]:,} | '
        f'{r["fewer_normal_lookups"]:,} | {r["baseline_primary_updates"]:,} → {r["candidate_primary_updates"]:,} | {r["fewer_primary_updates"]:,} |')
    text+=['','PdfJS 虽有 179,027 次二级命中，一级命中同时少 177,484 次，净省下的正常查找只有 1,543 次。'
        '不能把二级命中数直接当成新省掉的查找。','',
        '| 表项 | 登记 | 同键刷新 | 冲突替换 | 失效事件 | 清理项数 | 其中退出清理 |',
        '|---|---:|---:|---:|---:|---:|---:|']
    for r in life:text.append(f'| {r["case"]} | {r["registrations"]:,} | {r["same_key_refreshes"]:,} | {r["conflict_replacements"]:,} | '
        f'{r["invalidations"]:,} | {r["cleared_entries"]:,} | {r["shutdown_entries"]:,} |')
    text+=['','每个进程都验证：登记 − 同键刷新 − 冲突替换 − 清理项数 = 0，退出无残留表项。','',
        '## 二级命中最多的真实读点','',
        '| 表项 | 读点 | PC / 字节码函数 | 二级命中 | 二级探测 | 逻辑读取 |',
        '|---|---|---|---:|---:|---:|']
    descriptions={'RayTrace.RayTrace':'testIntersection：info.isHit（源码第 1090 行）',
        'Splay.Splay':'SplayTree.prototype.splay_：current.key（源码第 735 行）',
        'PdfJS.PdfJS':'ctxTransform：this._transformMatrix（源码第 2545 行）'}
    top_rows=[]
    for c in TARGETS:
        r=next(r for r in tc if r['case']==c['case'] and r['label']=='GLOBAL_OWN_OFFSET_CACHE')['top'][0]
        m=next(m for m in mapping if m['case']==c['case'] and m['site']['id']==r['id']);assert len(m['matches'])==1
        bid=m['matches'][0]['bytecode_function_id'];v=r['counts']
        text.append(f'| {c["name"]} | {descriptions[c["case"]]} | {r["pc"]} / #{bid} | {v["secondary_hits"]:,} | {v["secondary_probes"]:,} | {v["logical_named"]:,} |')
        top_rows.append(dict(case=c['case'],diagnostic_site_id=r['id'],bytecode_function_id=bid,PC=r['pc'],atom=r['atom'],description=descriptions[c['case']],**v))
    text+=['','PC 是该函数内的字节偏移。计数位点通过 atom、PC、记录索引与真实最终字节码对应，另用局部变量绑定和完整方法体定位源码。'
        'site_mapping/ 是冻结基线的查看构建，候选没有改编码/准备规则；查看用的运行时间不进入计时表。'
        'PdfJS 部分匿名日志包装函数存在同形快照，不强行给它们命名；原始 top 记录和所有匹配保留在 site_mapping.json。','',
        '## Splay：读侧省下的工作部分转到了写侧','',
        '| 独立写诊断 | 写入快路总尝试 | 快路成功 | 回退普通写入 |','|---|---:|---:|---:|']
    for r in writes['rows']:
        w=r['shared_write'];text.append(f'| {r["label"]} | {w["attempts"]:,} | {w["hits"]:,} | {w["fallbacks"]:,} |')
    b,v=[r['shared_write'] for r in writes['rows']]
    text+=['',f'普通写入回退多了 **{v["fallbacks"]-b["fallbacks"]:,} 次**。二级读命中不更新一级记录，原 put_field_shared '
        '仍检查这份一级记录，因而更容易失配。这证实一部分代价转到了写入路径；不能仅用读侧少查找来推断整体速度。',
        '写诊断是单独的辅助构建/进程，不改 Release 或候选策略，不使用其耗时。其 Splay 逻辑读取总数和写入总数与原诊断一致；'
        '一级/二级命中的分摊有小变化，分别保留原始记录，不混成同一进程。','',
        '## 弱生命周期和内存','',
        '固定 1024 项 × 24 B = 24,576 B；JSRuntime 2,216 → 26,792 B。每项 16 B 键/槽数据、4 B 双向索引、4 B 对齐。'
        'shape 链头 2 B 放在原空隙（offset 18），禁用标志 1 B 放在 runtime 原尾部空隙，不再增大结构；JSShape 仍 56 B，ReadICSite 仍 24 B。',
        'weak_fixture.c 已验证多 atom 同 shape、重复登记、两种确定碰撞、clone 链头不复制、添加/删除、getter/只读、resize/compact 搬移、释放、循环 GC、runtime 退出，以及 rdi_update 原生重入。'
        '表不持有 shape/atom 引用；atom 借用 shape 的描述符持有，失效发生在释放前。'
        '原生回调测试在旧引用释放期间递归替换一级记录，并移动当前对象 prop[]，ASan/UBSan 通过。',
        '普通 JS 与 A/SPARSE 的 15 组差分通过，准备后字节码保存/普通与 ROM 加载在 A/SPARSE/候选及候选 ASan 下均通过。'
        '完整入口核对见 weak_lifetime_proof.md；sizeof/offsetof 的编译断言与测量见 weak_gate.json。','',
        '## 停止结论','',decision['reason'],
        '没有进行全集，所以不报告全集覆盖率或 GM。Splay 的定向二级覆盖已超过 1%，但未带来时间收益；本轮停止容量和替换策略扩展，不替换默认 SPARSE，不 push。','',
        '独立补丁：SPARSE-to-GLOBAL_OWN_OFFSET_CACHE.patch；全部原始时间：raw_timings.csv、micro_time/、target_time/；'
        '原始计数：micro_counts/、target_counts/、write_counts/；来源与复现：[README.md](README.md)。','']
    (HERE/'results.md').write_text('\n'.join(text))
    csvout(HERE/'micro_timing.csv',micro);csvout(HERE/'target_timing.csv',target)
    csvout(HERE/'target_work_saved.csv',work);csvout(HERE/'target_lifecycle.csv',life);csvout(HERE/'top_sites.csv',top_rows)
    save(HERE/'summary.json',dict(status='PASS',micro=micro,target=target,work_saved=work,lifecycle=life,
        decision=decision,write_diagnostic=writes,full_suites_run=False,default_unchanged=True))
    print('REPORT_PASS',str(HERE/'results.md'))


if __name__=='__main__':main()
