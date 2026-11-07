"""Generate a factual report only from collected records; never invent missing data."""
import csv
import gzip
import hashlib
import importlib
import json
import statistics
from pathlib import Path
import sys

r=sys.modules.get('__main__')
if not r or not hasattr(r,'H'): r=importlib.import_module('run')
H,e=r.H,r.e


def rows(name): return list(csv.DictReader((H/name).open(encoding='utf-8')))
def read(name): return json.loads((H/name).read_text(encoding='utf-8'))
def pct(value): return 'UNKNOWN' if value in [None,''] else f'{100*(float(value)-1):+.2f}%'


def write():
    import builder
    audits=read('audit.json')
    current=[x for x in audits if x.get('timing_quality')=='EXPLORATORY_CLOCK_LIMITED']
    aggregates=rows('aggregate.csv')
    tables=rows('comparison_octane.csv')+rows('comparison_sunspider.csv')
    candidates=rows('candidates.csv')
    epoch=e.EPOCH
    lines=['# v7 实际结果：受限计时探索，不作可靠小幅收益确认','',
       '所有已测数字来自本目录新批次；旧73条隔离数据没有拼接。用户授权后只将RAW/UTC交叉差异降为警告，没有修改系统设置或计时器。',
       '',f"新批次共保存{sum(x['records'] for x in current)}条measurement，其中{sum(x['valid'] for x in current)}条结果有效。",
       '下面按各自同批对照报告，不把不同小批次拼成一个精确排名。完整43项表在comparison CSV。','',
       '实际完成P1五轮、七个新版本完整首轮、IO2_LAYOUT/AQ1/AP1各三轮复测。新版本没有取得完整Octane和SunSpider同时超过s001的整体点估计；没有提升任何候选。',
       '常规结果校验与原定有界检查通过不等于完整安全验收：后补OOM压力测试仍有失败，A/s001独立诊断版也复现相关异常回溯问题。所有失败保留。','',
       '## 计时和统计','',
       'WSL2 Ubuntu24.04.2/x86_64，Ryzen 7 5800H，GCC13.3；-O2 -g -fwrapv -DHAVE_CLOSEFROM，无NDEBUG/LTO/PGO/JIT。',
       '内部CLOCK_MONOTONIC区间为N次原Run，除以N得ms/完整Run；首次Run计入，加载和必需Setup在外，无额外workload预跑。GC/helper/builtin/RegExp和Run内动态编译按实际计入。',
       '质量标签EXPLORATORY_CLOCK_LIMITED。RAW/UTC不一致仍记录，不能据约1%的变化确认净收益；bootstrap不包含系统时钟误差。',
       'Octane先suite内GM，再suite等权，分别核心16项/13suite和扩展17项/14suite；SunSpider为26case等权。不是官方Octane分数。',
       '样本标准差ddof=1；Q1/Q3为排序后的下/上半组中位数，奇数样本排除中间值。保留全部有效慢样本；单轮只给点估计。3/5轮用10000次固定seed整轮配对bootstrap，未作多重检验校正。','',
       '## 各版本最新完整批次','',
       '| 版本 | 批次/轮数 | 范围 | 相对A | 相对s001 | 相对实际父版 |',
       '|---|---|---|---:|---:|---:|']
    example_notes=[]
    for label in ['P1','IO2_LAYOUT','IO2_DIRECT','IO4_LAYOUT','IO4_DIRECT','AQ1','AP1','ST1']:
        names=['p1_'+epoch] if label=='P1' else [p+label+'_'+epoch for p in ['independent_','recheck_','screen_']]
        campaign=next((n for n in names if any(a['campaign']==n and a['complete_rounds'] for a in current)),None)
        if not campaign:
            lines.append(f'| {label} | 未取得完整批次 | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |');continue
        for subset in ['core16_13suite','expanded17_14suite','26cases']:
            selected=[x for x in aggregates if x['campaign']==campaign and x['condition']==label and x['subset']==subset]
            def value(d): return next((x['time_ratio'] for x in selected if x['denominator']==d), '1' if label==d else None)
            parent=next(x['parent'] for x in candidates if x['id']==label)
            rounds=selected[0]['rounds'] if selected else 'UNKNOWN'
            lines.append(f'| {label} | {campaign} / {rounds} | {subset} | {pct(value("A"))} | {pct(value("s001"))} | {pct(value(parent))} |')
        examples=[x for x in tables if x['campaign']==campaign and x['condition']==label and x.get('over_parent')]
        if examples:
            ordered=sorted(examples,key=lambda x:float(x['over_parent']))
            description='；'.join(x['case']+' '+pct(x['over_parent']) for x in ordered[:2]+ordered[-2:])
            example_notes.append(label+'：'+description+'。')
    lines+=['','### 相对父版的例子','',
            '下面只用于举例，不删改完整GM集合；均为计时可靠性受限的点估计。','']+example_notes
    lines+=['','## 正确性、机制和限制','',
        '每版的基础检查、针对性ASan/UBSan、GC、保存加载和内部状态探针见correctness/sanitizer JSON及原始process_result。未跑完整test262。',
        'OOM另见oom_pressure JSON：这是初筛后补做的有界内存压力/恢复检查，不是逐个IC分配点的失败注入，不能追称初筛前已完整覆盖OOM。',
        'IO2/IO4只对初始真实prop_size不超过容量的普通对象提供尾部空间；对象头仍由实际探针报告。溢出后保留尾部、使用外部数组。DIRECT检查对象实际存储标志，不只凭shape。',
        'AQ1按每静态读点8次观察，own-data单态特化，4次连续失配恢复普通opcode/atom；按共享JSFunctionBytecode的待处理入口时钟冷却32次，至多再准入一次。入口检查、元数据和miss计数均有成本。',
        'AP1保留16B单态记录，第二种shape才按点分配容量2表，第三种扩至4，第五种恢复普通opcode。2/4表请求字节和最终释放计数见内部探针及mechanism_counts。',
        'ST1按put_field位置缓存旧/新shape及最多两层普通原型的守卫，只处理新增普通字段；已有字段保持原查找/set_value路径。miss临时保活旧shape，可能额外触发COW；这是真实维护代价。',
        '可以确认实现的存储/状态转换及常规门禁结果；完整OOM安全没有证明。采样时间只支持受限探索点估计，不能把总时间差换成单次miss/load成本。',
        '不同二进制的native布局和编译器决策未独立隔离，数值控制出现变化也不能一律归于IC。没有新同批V8数据，不声称缩小了与V8的差距。',
        'Box2D和官方latency指标沿用既有覆盖限制；Crypto采用冻结确定性输入；未删除RegExp/CodeLoad或失败case以改善成绩。','',
        '## 本轮回答到哪里','',
        'P1：五轮RayTrace中位数相对s001为-9.63%，DeltaBlue -5.19%，Richards +4.08%；扩展Octane整体+0.51%、SunSpider+0.73%。局部方向不同，没有形成全套优势。这些仍是受限计时点估计。',
        'IO：Splay的数组分配/重分配请求由582575降至IO2的49021、IO4的33，但IO2_LAYOUT三轮扩展Octane仍+2.68%、SunSpider+2.65%。减少请求不等于净耗时必然降低。',
        'IO4的Splay普通对象+数组累计请求字节由53974320增至68305952；IO2为53974320。这里只统计普通对象/属性数组的请求，含realloc累计量，不是峰值/全堆字节。',
        'DIRECT：实际机器码在inline位为真时跳过p->prop加载，另加标志检查/分支，片段见mechanism.md；DIRECT/LAYOUT完整首轮没有整体增量收益，不据源码表达式宣称更快。',
        'AQ1：Splay的IC查询从BASE的1401166变为101689，但恢复普通opcode后的读取不再计入IC查询，不能说总属性操作变少。它还有635747次函数入口检查。三轮扩展Octane整体+1.28%、SunSpider+2.06%。',
        'AP1：Splay命中从704113增至1290876，独立表累计请求1552B且最后释放计数为0；Splay三轮点估计-2.00%，RegExp +17.12%，扩展整体+3.13%。命中改善没有形成全套净收益。',
        'ST1：内部null原型小测试能命中；Richards/Splay/CodeLoadClosure三个N=1诊断均0填充、0命中。它在这些程序里没有省到目标transition工作，仍有记录/handler等代价；不能扩展为所有43项均无命中。',
        '本轮继续保留s001作为工作底座，不表示其完整OOM安全已获认证。P1/RayTrace可保留为局部信号，仍需可靠时钟再确认；没有新同批V8数据，不声称接近V8。',
        '所有选中的复测和条件选择保留在recheck_selection/keeper_selection。源/制品SHA在identities，补丁在patches；失败尝试留在raw，不补造数字。']
    if (H/('memory_counts.'+epoch+'.json')).exists():
        lines+=['','## 独立IO分配诊断','',
         '以下为全进程N=1，包含Setup、校验和清理，不是计时区间分配。数组请求包含realloc，累计请求字节不等于live/peak/RSS；释放时尾部未用槽不等于峰值浪费。',
         '| 版本 | case | 对象请求 | 数组请求 | 对象累计字节 | 数组累计字节 | 溢出请求 | 内嵌命中/own IC命中 |',
         '|---|---|---:|---:|---:|---:|---:|---|']
        for row in read('memory_counts.'+epoch+'.json'):
            c=row['counts']
            lines.append('| '+row['label']+' | '+row['case']+' | '+' | '.join(str(c[k]) for k in ['object_requests','array_requests','object_requested_bytes','array_requested_bytes','spills'])+' | '+str(c.get('inline_own_ic_hits'))+'/'+str(c.get('own_ic_hits'))+' |')
        lines+=['','GNU time RSS各3个独立进程的原值在memory_rss JSON；0/不可用值标无效，不能据此证明内存相同。']
        rss=read('memory_rss.'+epoch+'.json')
        lines+=['','| 版本 | case | 有效n | peak RSS中位数 KiB | min/max KiB |',
                '|---|---|---:|---:|---|']
        for label in ['A','s001','IO2_LAYOUT','IO4_LAYOUT']:
            for case in ['Richards.Richards','Splay.Splay']:
                values=[x['peak_rss_kib'] for x in rss if x['label']==label and x['case']==case and x['valid']]
                lines.append('| '+label+' | '+case+' | '+str(len(values))+' | '+
                    (str(statistics.median(values))+' | '+str(min(values))+'/'+str(max(values)) if values else 'UNKNOWN | UNKNOWN')+' |')
        lines+=['','这是独立N=1全进程小样本，不是正式固定N的峰值对照。尾部未用槽计数见memory_counts；它按prop_count计算，含删除洞等口径限制，不是精确峰值浪费。']
    if (H/('oom_followup.'+epoch+'.json')).exists():
        oom=read('oom_followup.'+epoch+'.json')
        lines+=['','## OOM补测：没有通过完整安全验收','',
          '原oom_pressure检查失败，记录和原脚本未修改；其中读null.name是探针错误，当前上游JS_ThrowError2确有OOM抛null分支。',
          '另有真正ASan错误，不能用修正探针一并抹掉：独立A和s001诊断版也在低内存异常回溯区域复现。',
          'build_backtrace及JS_ThrowError2在A、s001和七个候选中逐字SHA相同；这支持共同路径存在问题，不排除候选另有OOM问题。未修改这些VM函数，未替换正式制品。',
          '处理null的新探针结果为'+oom['status']+'；具体各预算/制品结果见oom_followup、oom_bounded_a_control与原process_result。',
          '所以常规回归PASS不等于完整OOM安全PASS。本轮不提升任何候选，不把这些低内存诊断时间混入2967条性能记录。']
    (H/'results.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
    correspondence=[]
    for row in candidates:
        label=row['id']
        if label=='P1' or not (H/'identities'/(label+'.json')).exists(): continue
        ident=read('identities/'+label+'.json')
        actual={n:hashlib.sha256(s.encode()).hexdigest() for n,s in builder.files(label).items()}
        correspondence.append(dict(label=label,current_generator_matches_frozen_source=actual==ident['source_sha256'],binary_sha256=ident['sha256']))
    r.save('source_correspondence.'+epoch+'.json',correspondence)
    manifest=dict(cohort=epoch,timing_quality='EXPLORATORY_CLOCK_LIMITED',boot_id=read('environment.'+epoch+'.json')['boot_id'],
      source_base=read('workspace.json')['source_revision'],artifacts={p.stem:read('identities/'+p.name) for p in (H/'identities').glob('*.json')},
      no_old_data_pooling=True,no_jit=True,reliable_speedup_confirmed=False,
      complete_oom_safety_proven=False,safety_qualification='LIMITED_OOM_FAILURES_REPRODUCED_IN_BASELINE_DIAGNOSTICS',
      candidate_promoted=False,
      complete_campaigns=[a['campaign'] for a in current if a['status']=='COMPLETE'],
      incomplete_campaigns=[a['campaign'] for a in current if a['status']!='COMPLETE'])
    r.save('manifest.final.'+epoch+'.json',manifest)
    # Immutable suffix archive; initial raw remains untouched, no subprocess logs itself.
    analysis=e.load_module('v7_archive_report',H/'analyze.py')
    data=(H/'runs.jsonl').read_bytes();prefix=analysis.archived_data()
    assert data.startswith(prefix)
    if len(data)>len(prefix):
        suffix=data[len(prefix):];packed=gzip.compress(suffix,mtime=0)
        name=epoch;index=1
        while (H/'raw'/('archive.'+name+'.json')).exists():
            index+=1;name=epoch+'_'+str(index)
        target=H/'raw'/(name+'.runs.jsonl.gz');r.save(str(target.relative_to(H)),packed)
        r.save('raw/archive.'+name+'.json',dict(file=target.name,uncompressed_offset=len(prefix),
              compressed_sha256=hashlib.sha256(packed).hexdigest(),uncompressed_sha256=hashlib.sha256(suffix).hexdigest()))
    before={n:e.lab.sha(H/n) for n in ['comparison_octane.csv','comparison_sunspider.csv','aggregate.csv','audit.json']}
    analysis.analyze(use_archive=True)
    assert before=={n:e.lab.sha(H/n) for n in before},'Archived statistics differ'
    r.save('offline_recompute.'+epoch+'.json',dict(status='PASS',outputs=before,binary_execution=False))
    print('FINAL_REPORT_AND_ARCHIVE_WRITTEN',flush=True)
