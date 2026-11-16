"""Independent raw-data audit, comparisons and a source bundle of candidate C."""
import collections
import csv
import gzip
import hashlib
import io
import json
import math
from pathlib import Path
import statistics
import tarfile

HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
OLD=ROOT/'experiments/native_confirmation_20261108/attempt02'
LABELS=['FIELD_RMW_I32','INT_LOOP_KERNEL','FIELD_RMW_UPDATE','INT_LOOP_BITS','TRANSITION_EDGE_STRONG']


def read(p):return json.loads(Path(p).read_text())
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def gm(values):
    counts=collections.Counter(c.split('.')[0] for c in values)
    assert len(counts)==14 and len(values)==17
    return math.prod(v**(1/(14*counts[c.split('.')[0]])) for c,v in values.items())
def write_csv(name,rows):
    stream=io.StringIO(newline='');w=csv.DictWriter(stream,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows)
    (HERE/name).write_text(stream.getvalue())


def main():
    old={(r['case'],r['condition']):float(r['median_ms']) for r in csv.DictReader((OLD/'statistics.csv').open()) if r['kind']=='octane'}
    cases=read(OLD/'octane.inputs.json')['cases']
    for rel,digest in read(OLD/'octane.inputs.json')['files'].items():assert sha(ROOT/rel)==digest,rel
    for label in ['A','EVAL_COLD','V8_ON']:
        runtime=read(OLD/'runtime_manifest.json')[label];assert sha(runtime['path'])==runtime['sha256']
    aggregates=[];times={};coverage={};samples=0;diagnostic_samples=0
    for label in LABELS:
        times[label]={};coverage[label]={}
        for kind in ['release','diag','san']:
            m=read(HERE/(label+'.'+kind+'.manifest.json'))
            assert sha(m['elf'])==m['elf_sha256']
            for name,digest in m['sources'].items():
                file=Path(m['elf']).parent/('compat/test-closefrom.c' if name=='test-closefrom.c' else name)
                assert sha(file)==digest,(label,kind,name)
            assert read(HERE/'qualification'/(label+'.'+kind+'.gate.json'))['status']=='PASS'
            if kind!='diag':
                assert read(HERE/'qualification'/(label+'.'+kind+'.rom.json'))['stdout'].strip()=='ROM_ROUNDTRIP_PASS 144'
        for phase,expected_count in [('octane',17),('oct_counts',17),('sun_counts',26)]:
            folder=HERE/'runs'/label/phase
            protocol=read(folder/'protocol.json')
            records=[json.loads(s) for s in (folder/'runs.jsonl').read_text().splitlines()]
            starts=[r for r in records if r['event']=='process_start'];ends=[r for r in records if r['event']=='process_result'];rows=[r for r in records if r['event']=='sample']
            assert len(starts)==len(ends)==len(rows)==expected_count
            assert len({r['case'] for r in rows})==expected_count
            assert len({r['token'] for r in starts})==expected_count
            assert all(r['valid'] and r['payload']['correctness']=='PASS' for r in rows)
            for r in ends:
                assert r['exit_code']==0 and not r['timeout']
                assert r['boot_id']==r['boot_id_after']==protocol['boot_id']
                assert abs(r['raw_minus_monotonic_ms'])<=5+.002*r['external_wall_ms']
                assert abs(r['utc_minus_monotonic_ms'])<=1000
            for path,digest in protocol['frozen'].items():assert sha(path)==digest
            for info in protocol['scripts'].values():assert sha(info['path'])==info['sha256']
            if phase=='octane':
                samples+=len(rows)
                for r in rows:
                    source=read(OLD/'protocol.json')['scripts']['octane'][r['case']]['measure']
                    assert protocol['scripts'][r['case']]['sha256']==source['sha256']
                    assert r['N']==source['N']
                    times[label][r['case']]=r['payload']['elapsed_ms']/r['N']
                    assert times[label][r['case']]==r['ms_per_Run']
                expected=read(folder/'summary.json')
                ev=100*(gm({c:times[label][c]/old[c,'EVAL_COLD'] for c in cases})-1)
                av=100*(gm({c:times[label][c]/old[c,'A'] for c in cases})-1)
                assert abs(ev-expected['vs_EVAL_pct'])<1e-9 and abs(av-expected['vs_A_pct'])<1e-9
                aggregates.append(dict(label=label,vs_EVAL_pct=ev,vs_A_pct=av,
                    vs_V8_pct=100*(gm({c:times[label][c]/old[c,'V8_ON'] for c in cases})-1)))
            else:
                diagnostic_samples+=len(rows)
                coverage[label][phase]={r['case']:r['counts'] for r in rows}
                if phase=='sun_counts':assert all(r['N']==1 and r['payload']['elapsed_ms'] is None for r in rows)
                for r in rows:
                    c=r['counts'];assert c['edge_hits']<=c['edge_queries'] and c['rmw_hits']<=c['rmw_attempts']
                    assert c['rmw_attempts']==c['rmw_hits']+c['rmw_guard']+c['rmw_type']+c['rmw_overflow']+c['rmw_const_other']
    assert samples==85 and diagnostic_samples==215
    assert all(c['rmw_attempts']==0 for phase in coverage['FIELD_RMW_I32'].values() for c in phase.values())
    assert all(c['loop_entries']==0 for phase in coverage['INT_LOOP_KERNEL'].values() for c in phase.values())
    assert all(c['loop_entries']==0 for c in coverage['INT_LOOP_BITS']['oct_counts'].values())
    bits=coverage['INT_LOOP_BITS']['sun_counts']
    assert [c for c,v in bits.items() if v['loop_entries']]==['bitops-bits-in-byte']
    write_csv('aggregate.csv',aggregates)
    matrix=[]
    for c in cases:
        row=dict(case=c,A_ms=old[c,'A'],EVAL_COLD_ms=old[c,'EVAL_COLD'],V8_ON_jitless_ms=old[c,'V8_ON'])
        for label in LABELS:
            row[label+'_ms']=times[label][c];row[label+'_vs_EVAL_pct']=100*(times[label][c]/old[c,'EVAL_COLD']-1)
        matrix.append(row)
    write_csv('octane_all.csv',matrix)
    cov=[]
    for label in LABELS:
        for phase,rows in coverage[label].items():
            for c,v in rows.items():
                cov.append(dict(label=label,benchmark='Octane' if phase=='oct_counts' else 'SunSpider',case=c,
                    rmw_attempts=v['rmw_attempts'],rmw_hits=v['rmw_hits'],rmw_other_constants=v['rmw_const_other'],
                    loop_entries=v['loop_entries'],loop_iterations=v['loop_iters'],loop_checkpoints=v['loop_checkpoints'],
                    global_shape_queries=v['edge_queries'],global_shape_searches_skipped=v['edge_hits']))
    write_csv('coverage.csv',cov)

    descriptions={
        'FIELD_RMW_I32':'A1：显式 x=x+1，局部/参数同槽，两次接收者加载的序列',
        'INT_LOOP_KERNEL':'B1：纯整数 sum+=i、i++、i<整数上界',
        'FIELD_RMW_UPDATE':'A2：依据实际字节码扩展到字段 inc / +=1，不匹配源码',
        'INT_LOOP_BITS':'B2：纯整数逐位计数循环，一个有真实SunSpider覆盖的模板',
        'TRANSITION_EDGE_STRONG':'C：32项转换边缓存，保活两端shape、沿用原COW和数组分配逻辑',
    }
    micro=read(HERE/'micro/results.json')
    lines=['# EVAL_COLD 执行路径实验：2026-11-14','',
        '底座为仓库 ports/eval_cold 的确切源码包，逐文件SHA校验。每个候选独立派生，未组合A/B/C。',
        'A1/A2、B1/B2是本轮实验编号；本轮B2（INT_LOOP_BITS）不是历史借用融合版本B2。',
        'Octane沿用 native_confirmation_20261108/attempt02 的17项、固定N、原脚本字节、CPU2和计时边界。',
        '每候选每项一个新进程，共85个Octane性能样本；A/EVAL_COLD/V8_ON引用旧30轮中位数，没有重跑。',
        'V8参考为 --jitless --no-lazy --use-ic。没有引入JIT、修改benchmark算法或工作量。',
        '整体仍为14个suite等权，suite内子项先取几何平均；负号表示耗时降低。',
        '这是单轮、跨批次筛选，无置信区间；不能据此证明所有项目无退化或确立稳定的新最佳版本。','',
        '## 整体结果','',
        '|候选|相对旧EVAL_COLD|相对旧A|相对旧V8_ON耗时增加|',
        '|---|---:|---:|---:|']
    for r in aggregates:
        lines.append(f"|{descriptions[r['label']]}|{r['vs_EVAL_pct']:+.3f}%|{r['vs_A_pct']:+.3f}%|{r['vs_V8_pct']:+.3f}%|")
    lines += ['', '旧EVAL_COLD相对A为−5.7106%，相对V8_ON耗时增加56.6300%。C本轮相对A为约−6.44%，相对EVAL_COLD进一步降低约0.77%。',
        'C的Typescript相对父版仍慢约2.63%，不满足逐项无退化的目标。','',
        '## 完整Octane表项','', '单位 ms/完整Run；每个候选括号内相对旧EVAL_COLD。A/EVAL/V8是旧30轮中位数。','',
        '|表项|A|EVAL_COLD|V8_ON jitless|A1|B1|A2|B2|C|',
        '|---|---:|---:|---:|---:|---:|---:|---:|---:|']
    for c in cases:
        row=[c,f'{old[c,"A"]:.4f}',f'{old[c,"EVAL_COLD"]:.4f}',f'{old[c,"V8_ON"]:.4f}']
        row += [f'{times[l][c]:.4f} ({100*(times[l][c]/old[c,"EVAL_COLD"]-1):+.2f}%)' for l in LABELS]
        lines.append('|'+'|'.join(row)+'|')
    lines += ['', '## A：真正做了哪些合并','',
        'A1识别最终字节码的同槽加载→同槽加载→get_field_rdi→push_1→add→put_field_shared，等长改写首条加载。',
        '命中时：普通对象/非exotic/own shape/可写数据描述符/int32/结果不溢出，全部通过才直接更新字段，栈不变并跳过原序列。',
        '旧B2+READ_STORE在稳态仍分派约5条指令；A1该段变为1次分派，合并读写两次对象/shape守卫，省去剩余接收者Dup/Free与中间栈槽。',
        '不满足条件时只执行原首条加载，随后执行保留的完整原序列。中间指令和合法跳转入口均保留。',
        'A1在两个负载集的计数区间内均未进入；专用微基准能进入并加快约9%，但没有真实覆盖，不能把Octane波动称为机制收益。',
        '实际字段自增常见形状是get_slot→get_field2_rdi→inc→put_field_shared，A2因此把已证明安全的get_field2换成专门入口。',
        'A2命中后保留最初接收者的所有权，直接更新int32并释放接收者；语句型字段++的4次分派降为2次，+=1的5次降为2次。',
        'A2保留inc与add的原始回退区别：字符串++仍做数值转换，字符串+=1仍做拼接；返回旧值的post_inc等其他形状不匹配。',
        '新增入口不要求所有get_field在运行时前瞻；匹配只发生于准备阶段。窄版支持短/宽局部与参数槽。', '',
        '|A2 Octane项|诊断中的成功次数|', '|---|---:|']
    for c,v in coverage['FIELD_RMW_UPDATE']['oct_counts'].items():
        if v['rmw_hits']:lines.append(f'|{c}|{v["rmw_hits"]:,}|')
    lines += ['', 'A2合计8,853,466次成功。独立诊断还统计到182,288次其他整数常量形状；它们只做频次统计，不在Release中改写或融合。',
        '没有一次生成一批常量专用handler，也没有用未覆盖的加常量版本替代有效性证据。A2在真实Octane与专用微基准均未显示净收益，当前实现应放弃。', '',
        '## B：C局部变量中的整数循环','',
        'B1整个循环由最终字节码识别：i与s为未捕获局部，边界为整数参数/局部或常量，i/s/边界槽不能别名。',
        '原每轮约8次分派变为预编译C while中的局部整数计算；不是生成机器码，也不是对源码求和做闭式替换。',
        '加法每轮检测int32溢出；溢出时写回旧s/i并接回条件已检查后的原循环体，让原add_loc完成浮点提升。',
        '类型不符时原地取消可选入口，执行原第一条加载；其余中间指令仍然合法。',
        '原if_false8不论条件真假都poll，后向goto8也poll。C路径逐个扣减同一interrupt_counter；需要回调时写回局部和正确PC并接回原序列。',
        'Native测试中B1与父版均为21次回调、结果4999950000；第2次回调中断时双方均抛出同类中断异常。',
        'B1专用微基准快约89%，但Octane/SunSpider计数区间内都没有进入，不能作为真实负载优化。',
        '随后按实际SunSpider字节码实现B2：比较mask与整数常量、条件按位与、计数器inc、mask左移1、回跳。只有一个模板，不解释任意循环体。',
        'B2用uint32左移再转回int32，保留JS位运算；计数器将溢出时接回原inc；参数非int32等情况退回原字节码。',
        '原每轮约13或14次分派变为C循环，中断检查点按原来的外条件、内条件和回跳三处分别处理。',
        'B2 native回调次数与父版均为29次，结果39968；第2次回调中断行为也一致。', '',
        '|SunSpider项|handler进入次数|C中完整迭代次数|检查点返回原字节码次数|',
        '|---|---:|---:|---:|',
        f'|bitops-bits-in-byte|{bits["bitops-bits-in-byte"]["loop_entries"]:,}|{bits["bitops-bits-in-byte"]["loop_iters"]:,}|{bits["bitops-bits-in-byte"]["loop_checkpoints"]:,}|',
        '', '其余25项未进入B2，仍通过原字节码完成校验；B2的Octane覆盖为0。SunSpider本轮每项只做N=1正确性/覆盖计数，没有新的SunSpider性能结论。', '',
        '## C：只在已有新增自有属性内部路径查转换边','',
        'A/B的窄模板没有真实覆盖，因此按任务分支选择对象创建路线C；本轮没有实现或测量D FRAME_WINDOW，不对它的有效性作结论。',
        'C的key为原shape指针、atom和完整flags。命中后复用target shape，仍运行原有属性数组扩容、shape引用更新、后续属性初始化。',
        '没有跨过JS赋值/属性定义的语义判断。没有把数组分配代码改成另一套算法，也没有把分配耗时单独算成缓存收益。',
        '弱引用首版在门禁中202次查询0次命中：中间shape往往很快释放，缓存边随失效清掉。该失败保留在qualification/TRANSITION_EDGE.diag.counter_gate.json，未跑它的完整性能。',
        '有界引用版使用32项direct-mapped缓存、每项24字节；保活两端shape，使原有引用计数/COW保证缓存布局不可原地修改。',
        '缓存替换先发布新记录再释放旧引用，运行时销毁先禁用/清空缓存再进行原GC。GC外部根通过shape引用计数保留，无新增JSShape尺寸。',
        '原Release的DWARF类型检查：JSRuntime为1440→2216字节，直接增加776字节；JSShape两版均56字节。间接保活内存另计。',
        '引用保活及可能增加的COW成本都包含在本轮时间内；该实现不能被描述成完全没有内存/分配副作用的纯查找消融。', '',
        '|Octane项|转换搜索机会|实际跳过全局shape搜索|跳过比例|', '|---|---:|---:|---:|']
    for c in ['RayTrace.RayTrace','Splay.Splay']:
        v=coverage['TRANSITION_EDGE_STRONG']['oct_counts'][c]
        lines.append(f'|{c}|{v["edge_queries"]:,}|{v["edge_hits"]:,}|{100*v["edge_hits"]/v["edge_queries"]:.2f}%|')
    lines += ['', '计数来自独立诊断构建与进程，不与计时进程逐事件配对。C的地址哈希、分配布局、保活会影响冲突分布。', '',
        '## 同输入、同工作量的专用微基准','',
        '每行父版/候选各一个新进程；这些是新微基准的父版对照，不是重跑Octane基线。无额外预热。',
        '微基准用于区分“入口本身有效”和“真实负载有没有覆盖”；短于数秒的条目仅用于探索，不作为稳定收益确认。', '',
        '|候选|EVAL_COLD ms|候选 ms|耗时变化|','|---|---:|---:|---:|']
    for r in micro:lines.append(f'|{r["label"]}|{r["EVAL_ms"]:.3f}|{r["candidate_ms"]:.3f}|{r["change_pct"]:+.2f}%|')
    lines += ['', 'C微基准包含new、字段初始化、数组分配/GC等整体成本；−14.15%不是单独的全局shape查找耗时降幅。', '',
        '## 主解释器机器码体积','',
        '所有数据直接来自本轮Release ELF的nm/objdump。体积/栈帧变化不能单独证明时间差的原因。', '',
        '|版本|JS_CallInternal字节数|入口栈空间指令|','|---|---:|---|']
    for r in read(HERE/'native/footprint.json'):lines.append(f'|{r["label"]}|{r["interpreter_bytes"]:,}|`{r["entry_frame_instructions"][0].split(chr(9))[-1]}`|')
    lines += ['', 'A/B把新handler放进主解释器，改变了代码体积/布局；B还增加了入口栈帧。A/B本原型准备阶段还新增一遍识别扫描，没有匹配成功也会支付准备成本。C将逻辑放在内部属性新增路径，主解释器体积保持原值。',
        '这能解释应进一步调查哪些成本，但不是硬件采样或同批次消融，不能据此把所有退化都归因为指令缓存或寄存器分配。', '',
        '## 验证和复现','',
        '五个Release/独立诊断/ASan+UBSan构建均通过原底座targeted测试与116项新断言；A2另有118项、B2另有266项、C另有属性flags/原型/删除/访问器测试。',
        'Native中断次数/中断异常与父版对照一致；新的字段与循环opcode均测试保存/加载和ROM_DATA字节码读取。C另做100轮创建/释放/JS_RunGC检查。',
        '全部85个Octane性能样本和215个独立负载诊断进程通过原输出/校验；没有重试、丢弃慢点或补轮。',
        '本轮没有完整test262或完整负载的sanitizer运行；sanitizer为针对性测试，leak detection关闭，保留QuickJS自身运行时释放断言。',
        '编译锚点的首次准备失败、刷新前构建、弱缓存门禁失败均留存；没有失败的正式Octane样本。', '',
        '源码/实现：build.py、execution_helpers.inc、execution_handlers.inc、loop_bits_*.inc、edge_strong_helpers.inc。',
        '每个候选完整补丁位于patches/，构建身份在*.manifest.json；计时/计数协议、stdout/stderr与进程记录位于runs/。',
        '完整数值：octane_all.csv、aggregate.csv、coverage.csv、micro/comparison.csv。',
        'C源代码包与说明：[TRANSITION_EDGE_STRONG-source.tar.gz](candidates/TRANSITION_EDGE_STRONG-source.tar.gz)、[移植说明](candidates/README.md)。', '']
    (HERE/'results.md').write_text('\n'.join(lines))
    (HERE/'audit.json').write_text(json.dumps(dict(status='PASS',performance_samples=85,diagnostic_workload_samples=215,
        independent_aggregate_checks=True,all_fixed_N_scripts_match=True,all_correctness_pass=True,
        source_hashes_pass=True,release_elf_hashes_pass=True,old_controls_not_rerun=True,
        SunSpider_performance_samples=0,new_micro_performance_samples=10,D_implemented=False),indent=2)+'\n')

    # Reproducible source archive: no binaries, objects, benchmark algorithms,
    # diagnostic hooks, or build-generated test helpers.
    m=read(HERE/'TRANSITION_EDGE_STRONG.release.manifest.json');w=Path(m['elf']).parent
    out=HERE/'candidates';out.mkdir(exist_ok=True)
    bundle=out/'TRANSITION_EDGE_STRONG-source.tar.gz'
    with bundle.open('wb') as handle,gzip.GzipFile(fileobj=handle,mode='wb',mtime=0,filename='') as compressed,tarfile.open(fileobj=compressed,mode='w') as archive:
        for name in sorted(m['sources']):
            rel='compat/test-closefrom.c' if name=='test-closefrom.c' else name;data=(w/rel).read_bytes()
            item=tarfile.TarInfo('quickjs-transition-edge/'+rel);item.size=len(data);item.mtime=0;item.mode=0o644
            archive.addfile(item,io.BytesIO(data))
    (out/'manifest.json').write_text(json.dumps(dict(source_archive_sha256=sha(bundle),sources={('compat/test-closefrom.c' if n=='test-closefrom.c' else n):v for n,v in m['sources'].items()},parent='exact EVAL_COLD source archive',
        original_source_archive_sha256=m['source_archive_sha256'],candidate_label='TRANSITION_EDGE_STRONG',new_performance_rounds=1),indent=2)+'\n')
    (out/'README.md').write_text('''# TRANSITION_EDGE_STRONG 源码候选

独立从冻结EVAL_COLD派生，不包含FIELD_RMW或INT_LOOP，也不包含诊断计数。
这是单轮筛选候选：Octane相对旧EVAL_COLD约−0.77%，相对旧A约−6.44%，Typescript仍有退化。
不是已多轮确认的新默认版本。未测新的SunSpider时间。

在新的空目录解压，再构建：

```sh
tar -xzf TRANSITION_EDGE_STRONG-source.tar.gz
cd quickjs-transition-edge
make -j2 -o repl.c qjs qjsc
```

当前原型针对同一x86_64 Ubuntu环境；编译时验证JSShape为56字节、缓存项为24字节。
缓存32项，保存原shape、atom、完整flags和目标shape，保活两端布局；不修改属性数组扩容和初始化代码。
运行时退出先清空缓存；COW、GC及保活成本包含在实验内。
包内没有对象文件或ELF。源码身份见manifest.json；同源改动补丁另在../patches/。
''')
    print('INDEPENDENT_AUDIT_PASS',samples,diagnostic_samples)
    print('WINNER_SOURCE_BUNDLE',bundle,sha(bundle))


if __name__=='__main__':main()
