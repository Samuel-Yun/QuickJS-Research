"""Independent re-parser/statistical auditor, run only after sampling stops."""
import csv, io, json, math, re, statistics, sys
from collections import Counter
from pathlib import Path
sys.dont_write_bytecode=True
ATTEMPT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ATTEMPT))
from common import *
sys.path.insert(0,str(TIMER))
import campaign as frozen

def export(path,rows):
    rows=list(rows)
    if not rows:save(path,'');return
    out=io.StringIO(newline='');w=csv.DictWriter(out,fieldnames=list(rows[0]));w.writeheader()
    for row in rows:w.writerow({k:json.dumps(v,ensure_ascii=False,separators=(',',':')) if isinstance(v,(dict,list)) else v for k,v in row.items()})
    save(path,out.getvalue())

def statistics_of(values):
    ordered=sorted(values);half=len(values)//2
    return {'count':len(values),'median_ms':statistics.median(values),'mean_ms':statistics.mean(values),
        'sample_stddev_ms':statistics.stdev(values),'IQR_ms':statistics.median(ordered[-half:])-statistics.median(ordered[:half]),
        'min_ms':min(values),'max_ms':max(values)}

def payloads(record):
    # Deliberately independent of run.py.sections/parse.
    stdout=record['stdout']
    if record['condition']==CONDITIONS[0]:
        assert 'Run: Produce code cache' not in stdout and 'Run: Consume code cache' not in stdout
        chunks=[('source',stdout)]
    else:
        assert stdout.count('============ Run: Produce code cache ============')==1
        assert stdout.count('============ Run: Consume code cache ============')==1
        consumer_at=stdout.index('============ Run: Consume code cache ============')
        producer_at=stdout.index('============ Run: Produce code cache ============')
        assert producer_at<consumer_at
        chunks=[('producer',stdout[producer_at:consumer_at]),('consumer',stdout[consumer_at:])]
    result=[]
    for role,text in chunks:
        lines=[line[len('TEB_RESULT:'):] for line in text.splitlines() if line.startswith('TEB_RESULT:')]
        assert len(lines)==1
        result.append((role,json.loads(lines[0])))
    return result

def main():
    m=verify();old=read(HERE/'preservation_before.json')
    print('AUDIT: verifying historical inventory and runtime hashes',flush=True)
    # This inventory includes completed whitebox work and both MAIN cohorts.
    after=history();save(HERE/'preservation_after.json',after)
    assert old==after,'historical file inventory/hash changed'
    print('AUDIT: preserved history files',len(old),flush=True)
    save(HERE/'analysis_manifest.json',{str(Path(__file__).relative_to(ROOT)):sha(__file__)})
    if not (HERE/'environment_after.json').exists():
        ps=subprocess.run(['ps','-eo','pid,comm,args'],capture_output=True,text=True)
        save(HERE/'environment_after.json',{'timestamp_utc':stamp(),'host':platform.node(),'kernel':platform.release(),
             'architecture':platform.machine(),'load_average':os.getloadavg(),
             'boot_id':Path('/proc/sys/kernel/random/boot_id').read_text().strip(),'processes_stdout':ps.stdout,
             'processes_stderr':ps.stderr,'temperature':None,'physical_frequency':None,'power_limits':None,
             'runtime_hashes_verified_after_sampling':True})
    checksums=frozen.allowed();generators={s:frozen.Campaign(s) for s in ('SunSpider','Octane')}
    records=[];stages=Counter();valid_stage=Counter();producer_rows=[];targets=[];failures=[]
    for f in sorted((HERE/'records').rglob('*.json')):
        r=read(f);records.append(r);stages[r['stage']]+=1
        if not r['valid']:failures.append({'record':str(f.relative_to(HERE)),'reason':r['failure']});continue
        valid_stage[r['stage']]+=1
        assert r['exit_code']==0 and not r['stderr']
        assert r['binary_sha256']==m['engines']['v8']['binary']['sha256']
        assert r['protocol_sha256']==sha(HERE/'protocol.md')
        correctness=r['stage'] in ('correctness','selected_correctness')
        b='Octane' if '.' in r['case'] else 'SunSpider'
        script=Path(r['script_path'])
        assert script.read_bytes()==generators[b].source(r['case'],r['N'],correctness),'frozen generator identity mismatch'
        assert r['script_sha256']==sha(script)
        for adapter,h in r['adapter_hashes'].items():assert sha(adapter)==h
        assert r['dependency_hashes']=={x['path']:x['sha256'] for x in m['engines']['v8']['dependencies']}
        cache='none' if r['condition']==CONDITIONS[0] else 'code'
        expected=command(script,['--cache='+cache])
        assert r['command']==expected
        assert r['flags']==['--max-opt=0','--no-lazy','--cache='+cache]
        assert r['diagnostic_flags']==[] and r['LD_PRELOAD'] is None and r['warmup_calls']==0
        assert r['cache_identity']['origin']==str(script) and r['cache_identity']['source_sha256']==sha(script)
        assert r['cache_rejected_field'] is None and r['cache_bytes_per_invocation'] is None
        parts=payloads(r)
        assert len(parts)==len(r['segments'])
        for index,(role,p) in enumerate(parts):
            assert role==r['segments'][index]['role'] and p==r['segments'][index]['payload']
            for key,value in {'case':r['case'],'N':r['N'],'benchmark':b,'mode':'MAIN_MONOTONIC_V1',
                'phase':'correctness' if correctness else 'measure','correctness':'PASS','timer':'benchNow','warmup_calls':0}.items():assert p[key]==value
            if b=='SunSpider':assert p['checksum'] in checksums[r['case']]
            if correctness:
                assert p['elapsed_ms'] is None and p['elapsed_per_call_ms'] is None
            else:
                t=p['elapsed_ms'];a=p['start_ms'];z=p['stop_ms'];v=p['elapsed_per_call_ms']
                assert all(type(x) in (int,float) and math.isfinite(x) for x in (t,a,z,v))
                assert t>0 and z>=a and math.isclose(z-a,t,abs_tol=1e-8) and math.isclose(t/r['N'],v,abs_tol=1e-8)
                assert t<=r['external_wall_ns']/1e6+5
        assert r['outer_stop_ns']-r['outer_start_ns']==r['external_wall_ns']
        assert r['elapsed_ms']==parts[-1][1]['elapsed_ms'] and r['elapsed_per_call_ms']==parts[-1][1]['elapsed_per_call_ms']
        r['record']=str(f.relative_to(HERE))
        if r['stage']=='formal':
            targets.append(r)
            if len(parts)==2:
                prod=parts[0][1]
                producer_rows.append({'case':r['case'],'rep':r['rep'],'order':r['order'],'N':r['N'],
                    'role':'producer_NOT_target_sample','elapsed_ms':prod['elapsed_ms'],'elapsed_per_call_ms':prod['elapsed_per_call_ms'],
                    'checksum':prod['checksum'],'payload':prod,'record':r['record'],'boot_id':r['boot_id']})
    assert valid_stage['correctness']==16 and valid_stage['selected_correctness']==8
    assert len(targets)==240 and len(producer_rows)==120 and not failures
    selections=[];proof_rows=[]
    for c in CASES:
        selected=read(HERE/'selected_n'/f'{c}.json');n=selected['N'];selections.append(selected)
        assert n>0 and n&(n-1)==0
        pilots=[r for r in records if r['valid'] and r['stage']=='calibration' and r['case']==c]
        for k in range(n.bit_length()):
            p=2**k;rr=[r for r in pilots if r['N']==p]
            assert len(rr)==2 and {r['condition'] for r in rr}==set(CONDITIONS)
            if p==n:assert all(r['elapsed_ms']>=1000 for r in rr)
            else:assert not all(r['elapsed_ms']>=1000 for r in rr)
        for pn in (1,n):
            proof=read(HERE/'probes/cache_proof'/f'{c}.N{pn}.json');proof_rows.append(proof)
            assert proof['evidence_level']=='PROVEN_TARGET_SERIALIZATION_DESERIALIZATION'
            assert sha(proof['script_path'])==proof['script_sha256']
            trace=(HERE/proof['diagnostic_log_code']).read_text();control=(HERE/proof['diagnostic_log_source']).read_text()
            assert proof['script_path'] in trace
            assert '[Deserializing from ' not in control and '[Serializing from' not in control
            produced,consumed=trace.split('============ Run: Consume code cache ============')
            s=[int(x) for x in re.findall(r'\[Serializing to (\d+) bytes took',produced)]
            d=[int(x) for x in re.findall(r'\[Deserializing from (\d+) bytes took',consumed)]
            assert s==d and len(d)==3 and proof['target_cache_size_bytes']==d[-1]
            assert '[generated bytecode for function:' not in consumed
    schedule=read(HERE/'schedule.json');assert schedule['seed']==2026100517 and len(schedule['rows'])==240
    positions=set()
    for r,row in zip(sorted(targets,key=lambda r:r['schedule_index']),schedule['rows']):
        assert {k:r[k] for k in ('case','condition','rep','order','N')}=={k:row[k] for k in ('case','condition','rep','order','N')}
        assert r['schedule_index']==row['index']
        key=(r['case'],r['condition'],r['rep']);assert key not in positions;positions.add(key)
    summary=[];ratios=[]
    for c in CASES:
        medians=[]
        for cond in CONDITIONS:
            rr=[r for r in targets if r['case']==c and r['condition']==cond]
            assert len(rr)==30 and Counter(r['order'] for r in rr)=={1:15,2:15}
            assert {r['rep'] for r in rr}==set(range(1,31))
            assert len({r['script_sha256'] for r in rr})==1
            stats=statistics_of([r['elapsed_per_call_ms'] for r in rr]);medians.append(stats['median_ms'])
            summary.append({'case':c,'condition':cond,'N':rr[0]['N'],**stats})
        assert {r['script_sha256'] for r in targets if r['case']==c}=={read(HERE/'selected_n'/f'{c}.json')['script_sha256']}
        ratios.append({'case':c,'source_median_ms':medians[0],'consumer_median_ms':medians[1],'CACHE_CONSUMER/SOURCE':medians[1]/medians[0]})
    export(HERE/'raw/formal.csv',targets);export(HERE/'raw/producer.csv',producer_rows)
    for stage in ('correctness','selected_correctness','calibration'):export(HERE/'raw'/f'{stage}.csv',[r for r in records if r['stage']==stage])
    export(HERE/'selected_n.csv',selections);export(HERE/'summary/per_condition.csv',summary);export(HERE/'summary/ratios.csv',ratios)
    export(HERE/'summary/cache_evidence.csv',proof_rows)
    gm=math.exp(statistics.mean(math.log(r['CACHE_CONSUMER/SOURCE']) for r in ratios))
    flags=(HERE/'probes/logs/flag_values.stdout.txt').read_text().splitlines()
    assert all(x in flags for x in ('--max-opt=0','--no-lazy','--no-sparkplug','--no-maglev','--no-turbofan'))
    before=read(HERE/'environment_before.json')
    audit={'status':'PASS_WITH_DISCLOSED_UNKNOWNS','completed_status':'COMPLETED_VERIFIED_IN_PROCESS_CROSS_ISOLATE',
        'cohort':m['cohort_id'],'engine':'V8/d8 15.6.21','target_valid':len(targets),'target_expected':240,'producer_records':len(producer_rows),
        'stage_records':dict(stages),'stage_valid':dict(valid_stage),'correctness_segments':24,'selected_correctness_segments':12,
        'history_files_verified':len(old),'history_inventory_unchanged':True,'runtime_hashes_verified':True,'same_frozen_generator_bytes':True,
        'all_original_payload_identities_preserved':True,'segmentation_independently_reparsed':True,'both_cache_passes_checked':True,
        'cache_mechanism':'PROVEN_TARGET_SERIALIZATION_DESERIALIZATION','per_formal_invocation_acceptance_direct_observation':None,
        'cache_rejected_field':None,'same_selected_target_trace_evidence':True,'monotonic_chain_all_segments':True,'B_outer_enclosure_only_weak':True,
        'groups_30':True,'balanced_order_15_each':True,'statistics_independently_recomputed':True,'median_ratio_gm':gm,
        'boot_ids_formal':sorted({r['boot_id'] for r in targets}),'formal_below_pilot_threshold':sum(r['elapsed_ms']<1000 for r in targets),
        'failures':failures,'source_compile_metric_ms':None,'cache_validation_deserialization_metric_ms':None,'cross_process_cache_verified':None,
        'old_windows_data_mixed':False,'concurrency_gate_evidence':'pre_sampling_processes.json','old_main_and_whitebox_results_unchanged':True,
        'analysis_sha256':sha(__file__)}
    save(HERE/'audit.json',audit)
    report(summary,ratios,audit,selections,proof_rows)
    print(json.dumps(audit,ensure_ascii=False,indent=2))

def report(stats,ratios,audit,selections,proofs):
    table=['| Case | N | SOURCE median ms/Run | cache consumer median ms/Run | consumer/source |',
           '|---|---:|---:|---:|---:|']
    for ratio,selection in zip(ratios,selections):
        table.append(f"| {ratio['case']} | {selection['N']} | {ratio['source_median_ms']:.6f} | {ratio['consumer_median_ms']:.6f} | {ratio['CACHE_CONSUMER/SOURCE']:.6f} |")
    full=['| Case | Condition | N | median | mean | std(n-1) | IQR | min | max |','|---|---|---:|---:|---:|---:|---:|---:|---:|']
    for row in stats:full.append('| '+ ' | '.join([row['case'],row['condition'],str(row['N'])]+[f"{row[k]:.6f}" for k in ('median_ms','mean_ms','sample_stddev_ms','IQR_ms','min_ms','max_ms')])+' |')
    text='''# V8 Code Cache supplement: actual results

## Completion and scope

COMPLETED_VERIFIED_IN_PROCESS_CROSS_ISOLATE. Target samples **240/240 valid**, with **120 separate producer records**; producer records are not extra target samples.
WSL2 Ubuntu24.04.2 x86_64, frozen cohort `wsl2-ubuntu2404-x64-20261004`; V8 engine, d8 shell, NOT Node.js.
V8 15.6.21 SHA256 `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`.
Both conditions keep `--max-opt=0 --no-lazy`; A `--cache=none`, B `--cache=code`.
No QuickJS/JSC ranking or main table replacement. Historical inventories including whitebox and both MAIN campaigns are unchanged.

## Evidence before conclusions

1. The previous Windows smoke already showed headings and equal checksums but acceptance remained UNKNOWN: `../../frontend_isolation/raw/mechanism/v8_cache_smoke.txt`. That evidence is acknowledged, not reused as proof of the Linux binary.
2. Actual Linux help, flag dump, four-option smoke and full logs: `probes/logs/`. All `none/code/after-execute/full-code-cache` invocations succeeded. Shell cache options are not listed as ordinary V8 VM flags. Unknown `--trace-deserializer` was not run; actual `--trace-deserialization` was verified and used.
3. Combined diagnostic trace identifies the exact target path at `Serializing from...`; three ordered sizes (two adapters then target) match `Deserializing from...` in the consumer. Consumer shows no new generated-bytecode event and both outputs pass. This holds for all four exact N1 and selected-N target scripts: `probes/cache_proof/`, `summary/cache_evidence.csv`. These are real target serialization/deserialization observations, not merely Produce/Consume headings or snapshot restore logs.
4. `probes/logs/target_deserialization_trace.stdout.txt` additionally contains the minimal target's full source as an AttachedReference and restored bytecode-array objects. Source `--cache=none` diagnostic has snapshot restoration but no corresponding script `Deserializing from`/serialization events.
5. Actual binary disassembly (`probes/demangled_*.txt`) shows `Shell::cached_code_map_`, CachedData buffer copying/lookup; `ExecuteSource` calls CreateCodeCache/StoreInCodeCache before Script::Run for code mode and has a distinct after-Run path. Shell::Main's producer lambda calls Isolate::New at 0x625ce7, RunMain at 0x625e2d, Dispose at 0x625ee2; subsequent consumer runs in the original main isolate at 0x61909a. Thus distinct isolates in one process, NOT two fresh processes. A flags field is temporarily XORed by 1337 at producer isolate construction and restored; its exact field identity is UNKNOWN without reference-source/layout proof, so do not assert every internal isolate parameter is identical. Runtime JS tier flags remain frozen and actual target cache compatibility is evidenced.
6. `CC_TOP` reports prior globals/heap object undefined in both passes and each performs its first call once (`probes/preparation.js`, `probes/logs/cache_code.stdout.txt`). This tests JS state isolation, not machine-state isolation. Producer activity may change CPU/cache/power before consumer.
7. Pinned d8.cc reference retrieval failed (timeout/TLS validation) and browser retrieval also failed. Logs/URLs remain in `probes/source/`; no TLS verification disabled, no whole V8 checkout/build. Reference commit 37fb84941c9be9f9914ee50b1ad366f06a1bd764 is NOT prebuilt exact source/toolchain proof; those remain UNKNOWN.

## Preparation: --no-lazy versus serialized cache

Default-lazy SOURCE probe: cacheStaticWorkload/cacheStaticCallee bytecode generation events appear after `CC_TIMER_START`.
No-lazy SOURCE probe: their generation occurs before `CC_TOP` and timer marker. Code/no-lazy producer serializes before top-level Run; consumer restores before `CC_TOP`, and no new bytecode generation is printed in consumer. Evidence: `probes/logs/bytecode_lazy.stdout.txt`, `bytecode_no_lazy.stdout.txt`, `target_cache_combined.stdout.txt`.
Therefore --no-lazy generates representative static bytecode on this launch before execution; cache reuses serialized compiled representation instead. Neither implies faster interpreter dispatch or exclusion of every frontend operation. Four workload traces retain named static functions/bytecode; exhaustive static coverage, dynamic eval/Function and runtime-generated preparation remain UNKNOWN. This is not a raw Ignition bytecode file interface.

## Correctness and measurement

N1/N2: 16 invocations, 24 checked isolate payloads PASS; selected-N: 8 invocations, 12 checked payloads PASS. Both B passes are validated. Frozen standard drivers preserve checksums/tolerances and original assertions; Octane payload checksum remains null (do not invent one). Richards Run asserts queue/hold totals; NavierStokes preserves original frame-15 checksum assertion and post-timer continuation at small N.
New calibration uses first common power-of-two N with SOURCE and consumer >=1000ms, not old selected-N. Formal 30 per group, each case A-first/B-first 15 times; fixed seed/schedule. Every target and producer internal clock chain passes. Raw stdout/stderr/commands/hash/boot_id and failure details retained in records and CSV. No warmup, no diagnostic/profiling flags in formal commands; no outlier deletion.
The immutable standard payload still says MAIN_MONOTONIC_V1; runner experiment/condition fields map it to this independent supplement, never into the historical table.
Internal elapsed/N includes the first Run, loop/call overhead, GC/helpers/builtins/RegExp and any remaining preparation. Outside: process/VM/source/adapters/required Setup/output. B external process total includes producer and consumer; it is NOT divided by consumer N. Producer and consumer absolute timer origins are never subtracted. First-call diagnostic timings are in N1 cache/source proof logs and N1 pilot records, not warmed consumer timing.

## Descriptive internal execution comparison

'''+ '\n'.join(table)+f'\n\nFour-case descriptive GM consumer/source = **{audit["median_ratio_gm"]:.6f}**; same complete intersection, exp(mean(log(ratio))). No claim of statistical significance or speedup causality.\n\n'+ '\n'.join(full)+'''

All values above ms/Run (internal elapsed/N). Full precision in `summary/per_condition.csv`, `summary/ratios.csv`. Sample stddev n−1; Tukey halves IQR (lower/upper15). Calibration thresholds select N, not censor later samples; formal target samples below1000ms: '''+str(audit['formal_below_pilot_threshold'])+'''. Preserved unchanged. Boot IDs: '''+', '.join(audit['boot_ids_formal'])+'''.

## What was and was not measured

Measured: first-call-inclusive internal workload execution in SOURCE and the verified code-cache consumer protocol, plus separate producer internal intervals and external whole-process diagnostic durations.
UNKNOWN: symmetric source compile cost; cache validation/deserialization total cost; cache-only cross-process startup; persistent save/load interface. `profile-deserialization` emits numeric diagnostic intervals (retained), but API/source boundaries and clock semantics were not verified; these are NOT formal stage measurements and are not pure parser/bytecode generation cost.
The selected artifact has no verified standalone cache-file save/consume path in this task. No persistent target-cache artifact or cross-process-cache experiment was produced. This is **IN_PROCESS_CROSS_ISOLATE** only; persistence capability remains UNKNOWN, not falsely declared impossible.
Explicit rejected field is not exposed to JS by the tested CLI. Direct acceptance/deserialization is PROVEN in matched diagnostics; per-formal-invocation acceptance is not traced and is honestly null/UNKNOWN. Every formal record references selected-N diagnostic evidence of its exact script bytes/path/flags. Diagnostic profile times are not used to derive frontend percentages.

## Observations, possible explanations, limits

The four ratios describe the measured internal execution intervals, not eliminated frontend percentages, parser speed or interpreter-loop self time. Both source/no-lazy and cache/no-lazy already prepare representative static code outside the internal region. Remaining A/B differences can reflect producer-induced CPU/OS cache/power state, bytecode allocation/layout, GC/IC/runtime state and noise; these are possible explanations, not identified causes.
This supplement does not establish a new IC/dispatch bottleneck and does not change the existing whitebox mechanism contrasts or three-engine rankings. It improves the evidence for d8 cache capability, not attribution of earlier performance gaps.
A native ScriptCompiler harness with explicit monotonic compile/consume boundaries, CachedData.rejected reporting, hash-keyed cache files and source validation would be worthwhile IF the next question is frontend/cache-startup cost. It is a separately authorized future engineering task, not needed to reinterpret the current internal metric, and was not implemented here.

## Official background (not artifact evidence)

The historical [improved code caching](https://v8.dev/blog/improved-code-caching) article distinguishes serialization from isolate-local reuse and explains why execution can expand cached coverage; [code caching for developers](https://v8.dev/blog/code-caching-for-devs) distinguishes isolate and browser-managed disk caches. Neither establishes this binary's CLI capability. Reference: [15.6.21 d8.cc](https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21/src/d8/d8.cc); retrieval failure retained.

See `audit.json`, `protocol.md`, `capabilities.json`, `README.md` for audited scope and exact runnable commands. Stop here; no engine optimization, new main benchmark, or publishing.
'''
    save(HERE/'results.md',text)
    notes='# 组会补充：V8 Code Cache\n\n'+ '\n'.join(table)+f'''\n\n- 完成240/240目标样本，另存120生产者记录；同一冻结WSL2/d815.6.21、--max-opt=0 --no-lazy。审计PASS_WITH_DISCLOSED_UNKNOWNS。
- 新增证据：四个目标脚本的序列化origin/size与消费者实际反序列化匹配，区别于旧Windows只看标题的smoke。正式采样不启trace；逐条接受标志仍UNKNOWN。
- --no-lazy是本次提前生成；Code Cache是复用序列化表示。本轮是同进程跨isolate，不是磁盘/跨进程缓存，不是裸Ignition字节码。
- consumer/source四case描述性GM {audit['median_ratio_gm']:.6f}。内部elapsed/N不是compile/startup计时，不由这些差值计算frontend占比。
- 生产者无消费者heap状态继承，但可能改变CPU/OS缓存/功耗。不能把A/B差异严格归因缓存，也不能认定dispatch/IC瓶颈。
- 原白盒结果与三引擎主表保持不变。若今后要测compile/deserialize/缓存启动，需要独立native API harness；本阶段不继续。
'''
    save(HERE/'meeting_notes.md',notes)

if __name__=='__main__':main()
