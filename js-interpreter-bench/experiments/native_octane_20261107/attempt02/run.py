"""One P1+B2 composition; reuse attempt01 controls as explicitly requested.

Only the new combination is executed. Historical controls remain a separate
batch. Reuse the frozen process recorder and Octane payload validator.
"""
import argparse
import collections
import csv
import difflib
import gzip
import hashlib
import importlib.util
import io
import json
import math
import os
from pathlib import Path
import random
import shutil
import statistics as st
import sys
import tarfile

H=Path(__file__).resolve().parent
OLD=H.parent/'attempt01'
ROOT=H.parents[2]
LAB=ROOT/'experiments/ic_search_lab'
LABEL='P1_B2'
SEED=2026110702


def module(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    result=importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


b=module('frozen_native_recorder',OLD/'run.py')
b.H=H
b.LABELS=[LABEL]
b.SEED=SEED


def files():
    seed=module('combination_seed',LAB/'v3_mass_search/generate.py')
    v6=module('combination_v6',LAB/'v6_targeted_ic/variants.py')
    original=seed.seed('s001')
    p1=v6.render('P1',original.copy())
    b2=v6.render('B2',original.copy())
    for label,material in [('P1',p1),('B2',b2)]:
        assert {n:hashlib.sha256(v.encode()).hexdigest() for n,v in material.items()}==b.load(LAB/'v6_targeted_ic/identities'/(label+'.json'))['source_sha256']
    combined=v6.b2(p1.copy())
    assert combined==v6.prototype_method(b2.copy()),'source transformations do not commute'
    return original,p1,b2,combined


def verify():
    protocol=b.load(H/'protocol.json')
    assert b.sha(Path(__file__))==protocol['combination_runner_sha256']
    assert b.sha(OLD/'run.py')==protocol['runner_sha256']
    assert b.boot()==b.load(H/'environment.before.json')['boot_id']
    assert b.boot()==b.load(OLD/'environment.before.json')['boot_id']
    for p,want in protocol['frozen_sources'].items():assert b.sha(ROOT/p)==want,p
    for p,want in b.load(H/'inputs.json')['files'].items():assert b.sha(ROOT/p)==want,p
    for scripts in protocol['scripts'].values():
        for s in scripts.values():assert b.sha(s['path'])==s['sha256']
    for identity in b.load(OLD/'runtime_manifest.json').values():
        assert b.sha(identity['path'])==identity['sha256']
    if (H/'runtime_manifest.json').exists():
        identity=b.load(H/'runtime_manifest.json')[LABEL]
        assert b.sha(identity['path'])==identity['sha256']
    return protocol


b.verify=verify


def prepare():
    if (H/'protocol.json').exists():verify();return
    assert not (H/'work').exists()
    assert b.boot()==b.load(OLD/'environment.before.json')['boot_id'],'separate boot; do not silently reuse controls'
    os.sched_setaffinity(0,{2})
    original,p1,b2,combined=files()
    dest=H/'work'/LABEL
    dest.mkdir(parents=True)
    for name,text in combined.items():(dest/name).write_bytes(text.encode())
    with tarfile.open(LAB/'v3_mass_search/build_support.tar.gz') as t:
        support=t.extractfile('compat/test-closefrom.c').read()
    (dest/'compat').mkdir();(dest/'compat/test-closefrom.c').write_bytes(support)
    for label,parent in [('s001',original),('P1',p1),('B2',b2)]:
        patch=''.join(''.join(difflib.unified_diff(parent.get(n,'').splitlines(True),text.splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n,text in combined.items() if text!=parent.get(n,''))
        b.save('patches/P1_B2.from_'+label+'.patch',patch)
    b.save('source_manifest.json',dict(label=LABEL,composition_order_independent=True,
         historical_P1_B2_source_hashes_verified=True,files={n:hashlib.sha256(t.encode()).hexdigest() for n,t in combined.items()},
         support_sha256=hashlib.sha256(support).hexdigest(),new_algorithm_changes_beyond_composition=False))
    previous=b.load(OLD/'protocol.json')
    b.save('inputs.json',b.load(OLD/'inputs.json'))
    paths=[OLD/'run.py',OLD/'runtime_manifest.json',OLD/'protocol.json',OLD/'raw/archive.json',
           LAB/'v3_mass_search/generate.py',LAB/'v3_mass_search/seed_M.tar.gz',LAB/'v3_mass_search/patches/seed_s001.patch',
           LAB/'v6_targeted_ic/variants.py',H/'combined.js',H/'mechanism.c',H/'mechanism.py']
    b.save('protocol.json',dict(cohort_id='native-ubuntu2604-p1-b2-combination-20261107-attempt02',
        labels=[LABEL],repetitions=5,cases=previous['cases'],N=previous['N'],scripts=previous['scripts'],
        metric=previous['metric'],warmup_calls=0,affinity=[2],seed=SEED,
        runner_sha256=b.sha(OLD/'run.py'),combination_runner_sha256=b.sha(Path(__file__)),
        frozen_sources={str(p.relative_to(ROOT)):b.sha(p) for p in paths},
        build_flags=previous['build_flags'],comparison_controls_reused_at_user_request=True,
        comparison_batch='attempt01',new_performance_samples=85,new_control_samples=0,
        interpretation='cross-batch exploratory comparison, not interleaved controls; CI excludes unobserved batch drift',
        bootstrap='10000 independent new/old whole-round draws; preserve within-old-batch pairing',
        no_A_s001_P1_B2_or_V8_rerun=True,SunSpider=False,V8_OFF=False,full_test262=False))
    b.save('environment.before.json',b.environment())
    print('PREPARED_COMBINATION_ONLY',flush=True)


def checked(command,stage,name,cwd=None,timeout=120):
    result=b.capture(command,stage,name,timeout,cwd=cwd)
    assert result['exit_code']==0 and not result['timeout'],result['stderr'][-4000:]
    if stage!='build':assert not result['stderr'],result['stderr'][-4000:]
    return result


def build():
    verify();os.sched_setaffinity(0,{2})
    dest=H/'work'/LABEL
    result=checked(['make','-j1','qjs','qjsc'],'build',LABEL,dest,240)
    line=next(s for s in result['stdout'].splitlines() if ' -c -o .obj/quickjs.o ' in s)
    assert all(flag in line for flag in ['-O2','-g','-fwrapv','-DHAVE_CLOSEFROM'])
    assert not any(flag in line for flag in ['-O3','-flto','-DNDEBUG','-fprofile','-march=native'])
    identities=b.load(OLD/'runtime_manifest.json')
    identities[LABEL]=dict(path=str(dest/'qjs'),sha256=b.sha(dest/'qjs'),qjsc_sha256=b.sha(dest/'qjsc'),compile_line=line)
    b.save('runtime_manifest.json',identities)
    b.save('build.json',result)
    print('COMBINATION_BUILT',identities[LABEL]['sha256'],flush=True)


def safety():
    verify();os.sched_setaffinity(0,{2})
    dest=H/'work'/LABEL
    tests=[LAB/'checks.js',LAB/'v3_mass_search/semantic.js',LAB/'v6_targeted_ic/targeted.js',H/'combined.js']
    checks=[]
    for test in tests:
        r=checked([dest/'qjs','--std',test],'semantic',test.name)
        checks.append(dict(name=test.name,token=r['token']))
    old=ROOT/'experiments/read_ic_mic/attempt01/correctness'
    core=[dest/'.obj'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    ctests=[old/'read_roundtrip.c',old/'roundtrip_slots.c',old/'gc_cycles.c',
            LAB/'v2_20261105/first_entry_roundtrip.c',LAB/'v6_targeted_ic/native_finalizer.c']
    for test in ctests:
        target=H/'work'/('safety.'+test.stem)
        checked(['gcc','-O2','-g','-I'+str(dest),test,*core,'-lm','-lpthread','-ldl','-o',target],'safety_build',test.stem)
        r=checked([target],'safety_run',test.stem)
        checks.append(dict(name=test.name,token=r['token']))
    generated=H/'work/embedded.c';target=H/'work/embedded'
    checked([dest/'qjsc','-e','-o',generated,H/'combined.js'],'embed_generate','combination')
    checked(['gcc','-O2','-g','-I'+str(dest),generated,*core,dest/'.obj/quickjs-libc.o','-lm','-lpthread','-ldl','-o',target],'embed_build','combination')
    r=checked([target],'embed_run','combination');assert r['stdout']=='COMBINED_SEMANTICS_PASS\n'
    mechanism=module('combination_mechanism',H/'mechanism.py')
    mechanism.run(b,dest)
    sanitized=H/'work/sanitized'
    shutil.copytree(dest,sanitized,ignore=shutil.ignore_patterns('.obj','qjs','qjsc'))
    checked(['make','-j1','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],'build','sanitized',sanitized,300)
    for test in [H/'combined.js',LAB/'v6_targeted_ic/targeted.js',LAB/'v3_mass_search/semantic.js']:
        r=checked(['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1','UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1',sanitized/'qjs','--std',test],'sanitizer',test.name,timeout=90)
        checks.append(dict(name='ASan/UBSan '+test.name,token=r['token']))
    for n,want in b.load(H/'source_manifest.json')['files'].items():assert b.sha(dest/n)==want,n
    b.save('safety_gate.json',dict(status='PASS_TARGETED',checks=checks,serialization_and_qjsc=True,
          sanitizers=True,mechanism=b.load(H/'mechanism.json'),full_test262=False))
    print('SAFETY_AND_BOTH_MECHANISMS_PASS',flush=True)


def gm_ratio(values):
    suites=collections.defaultdict(list)
    for case,value in values.items():suites[case.split('.')[0]].append(math.log(value))
    return math.exp(st.mean(st.mean(v) for v in suites.values()))


def csvout(name,rows):
    stream=io.StringIO(newline='');writer=csv.DictWriter(stream,list(dict.fromkeys(k for r in rows for k in r)),lineterminator='\n')
    writer.writeheader();writer.writerows(rows);(H/name).write_text(stream.getvalue())


def analyze():
    new=[r for r in b.records() if r['event']=='measurement'];assert len(new)==85 and all(r['valid'] for r in new)
    oldraw=gzip.decompress((OLD/'raw/runs.jsonl.gz').read_bytes())
    assert hashlib.sha256(oldraw).hexdigest()==b.load(OLD/'raw/archive.json')['uncompressed_sha256']
    old=[json.loads(s) for s in oldraw.splitlines() if s]
    old=[r for r in old if r['event']=='measurement'];assert len(old)==680 and all(r['valid'] for r in old)
    values=collections.defaultdict(dict)
    for r in new+old:
        key=r['condition'],r['case'];assert r['rep'] not in values[key];values[key][r['rep']]=r['elapsed_per_Run_ms']
    med={k:st.median(v.values()) for k,v in values.items()}
    cases=b.load(H/'inputs.json')['cases'];controls=['A','s001','P1','B2','V8_ON'];stats=[]
    for case in cases:
        nums=sorted(values[LABEL,case].values());half=2
        stats.append(dict(case=case,condition=LABEL,N=b.load(H/'inputs.json')['N'][case],n=5,median_ms=med[LABEL,case],
                mean_ms=st.mean(nums),sample_stddev=st.stdev(nums),q1=st.median(nums[:half]),q3=st.median(nums[-half:]),min=min(nums),max=max(nums),
                **{'over_'+c:med[LABEL,case]/med[c,case] for c in controls}))
    csvout('statistics.csv',stats)
    rng=random.Random(SEED)
    draws=[(tuple(sorted(rng.choices(range(5),k=5))),tuple(sorted(rng.choices(range(5),k=5)))) for _ in range(10000)]
    index_sets={i for pair in draws for i in pair}
    sampled={(key,i):st.median(v[k] for k in i) for key,v in values.items() if key[0] in [LABEL,*controls] for i in index_sets}
    aggregates=[];pairs=[]
    for control in controls:
        for case in cases:
            dist=sorted(sampled[((LABEL,case),ni)]/sampled[((control,case),oi)] for ni,oi in draws)
            ratio=med[LABEL,case]/med[control,case]
            pairs.append(dict(case=case,denominator=control,ratio=ratio,change_pct=100*(ratio-1),low95=dist[249],high95=dist[9749]))
        for subset in ['core16_13suite','expanded17_14suite']:
            selected=[c for c in cases if subset.startswith('expanded') or c!='zlib.zlib']
            ratio=gm_ratio({c:med[LABEL,c]/med[control,c] for c in selected})
            newlogs={i:math.log(gm_ratio({c:sampled[((LABEL,c),i)] for c in selected})) for i in index_sets}
            oldlogs={i:math.log(gm_ratio({c:sampled[((control,c),i)] for c in selected})) for i in index_sets}
            dist=sorted(math.exp(newlogs[ni]-oldlogs[oi]) for ni,oi in draws)
            aggregates.append(dict(subset=subset,condition=LABEL,denominator=control,ratio=ratio,change_pct=100*(ratio-1),low95=dist[249],high95=dist[9749],
                 inference='cross-batch independent whole-round bootstrap; environment drift not included',new_n=5,old_n=5))
    csvout('paired_ratios.csv',pairs);csvout('aggregate.csv',aggregates)
    lines=['# P1+B2 组合复测', '', '只采集组合版85条性能记录；A/s001/P1/B2/V8_ON全部复用上一轮，没有重跑对照。',
           '同一boot、工具链、固定输入和N。比较属于跨批次探索，区间不覆盖未观测到的批次漂移。', '',
           '|集合|对照|组合/对照|耗时变化|探索性95%区间|','|---|---|---:|---:|---:|']
    for r in aggregates:lines.append(f"|{r['subset']}|{r['denominator']}|{r['ratio']:.6f}|{r['change_pct']:+.2f}%|[{r['low95']:.6f}, {r['high95']:.6f}]|")
    lines += ['', '单位ms/完整Run，中位数；括号为组合相对各自旧对照的变化。', '',
           '|case|旧A|旧P1|旧B2|新P1+B2|相对A|相对P1|相对B2|','|---|---:|---:|---:|---:|---:|---:|---:|']
    for r in stats:
        c=r['case'];lines.append(f"|{c}|{med['A',c]:.5f}|{med['P1',c]:.5f}|{med['B2',c]:.5f}|{r['median_ms']:.5f}|{100*(r['over_A']-1):+.2f}%|{100*(r['over_P1']-1):+.2f}%|{100*(r['over_B2']-1):+.2f}%|")
    lines += ['', '组合严格由冻结P1与B2变换合成，两种顺序逐字相同。mechanism.json保存两条真实命中路径计数；安全门禁包含定向语义、序列化、GC、qjsc及ASan/UBSan，不是完整test262。',
              '原始记录见raw/runs.jsonl.gz；旧记录仍在attempt01。没有将旧样本伪装为本轮同批样本，没有SunSpider或V8_OFF采样。', '']
    (H/'results.md').write_text('\n'.join(lines))
    print('ANALYSIS_COMPLETE',json.dumps(aggregates[:2]),flush=True)


def audit():
    verify();rows=b.records();starts={r['token']:r for r in rows if r['event']=='process_start'};ends={r['token']:r for r in rows if r['event']=='process_result'}
    assert len(starts)==sum(r['event']=='process_start' for r in rows)
    assert starts.keys()==ends.keys()
    for token,r in ends.items():
        assert r['command']==starts[token]['command'] and r['exit_code']==0 and not r['timeout']
        assert r['boot_id']==r['boot_id_after']==b.load(H/'environment.before.json')['boot_id']
    intervals=sorted(ends.values(),key=lambda r:r['outer_start_ns'])
    assert all(a['outer_stop_ns']<=c['outer_start_ns'] for a,c in zip(intervals,intervals[1:]))
    samples=[r for r in rows if r['event']=='measurement'];assert len(samples)==85 and all(r['valid'] and r['condition']==LABEL for r in samples)
    assert [dict(rep=r['rep'],case=r['case'],condition=r['condition'],order=r['order']) for r in samples]==b.schedule()
    assert len({(r['case'],r['rep']) for r in samples})==85
    oldbins={r['path'] for r in b.load(OLD/'runtime_manifest.json').values()}
    assert all(r['command'][0] not in oldbins for r in ends.values()),'old runtime unexpectedly executed'
    for r in samples:
        command,_=b.invocation(LABEL,r['case'],'measure');assert ends[r['token']]['command']==command
        assert r['binary_sha256']==b.load(H/'runtime_manifest.json')[LABEL]['sha256']
    b.save('audit.json',dict(status='PASS_COMPLETE',new_performance_samples=85,new_control_samples=0,
         all_17_cases_5_processes=True,all_sources_inputs_runtime_hashes_checked=True,serial_intervals_checked=True,
         previous_batch_controls_reused=True,SunSpider_samples=0,V8_OFF_samples=0,
         below_1000ms_retained=sum(r['below_1000ms'] for r in samples),same_boot_as_previous_batch=True,
         maximum_raw_clock_disagreement_ms=max(abs(r['raw_minus_monotonic_ms']) for r in ends.values())))
    raw=(H/'runs.jsonl').read_bytes();packed=gzip.compress(raw,mtime=0)
    b.save('raw/runs.jsonl.gz',packed);b.save('raw/archive.json',dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),uncompressed_sha256=hashlib.sha256(raw).hexdigest()))
    print('AUDIT_PASS_85_COMBINATION_ONLY',flush=True)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('stage',choices=['prepare','build','safety','correctness','measure','analyze','audit','all']);a=parser.parse_args()
    steps=[prepare,build,safety,b.correctness,b.measure,analyze,audit] if a.stage=='all' else [dict(prepare=prepare,build=build,safety=safety,correctness=b.correctness,measure=b.measure,analyze=analyze,audit=audit)[a.stage]]
    for step in steps:
        if step==b.measure:assert b.load(H/'safety_gate.json')['status']=='PASS_TARGETED'
        step()


if __name__=='__main__':main()
