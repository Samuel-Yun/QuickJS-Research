"""Five-round screening of two independent P1+B2 cost reductions.

Only new candidates execute. Prior controls and parent are immutable references.
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
import tarfile
import variants

H=Path(__file__).resolve().parent
ROOT=H.parents[2]
OLD=ROOT/'experiments/native_octane_20261107/attempt01'
PARENT=ROOT/'experiments/native_octane_20261107/attempt02'
LAB=ROOT/'experiments/ic_search_lab'
LABELS=['PREP2','SPLIT16']
SEED=2026110801


def module(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m


b=module('frozen_process_recorder',OLD/'run.py')
b.H=H;b.LABELS=LABELS;b.SEED=SEED


def verify():
    p=b.load(H/'protocol.json')
    for name,want in p['frozen_files'].items():assert b.sha(ROOT/name)==want,name
    assert b.boot()==b.load(H/'environment.before.json')['boot_id']
    for name,want in b.load(H/'inputs.json')['files'].items():assert b.sha(ROOT/name)==want,name
    for scripts in p['scripts'].values():
        for s in scripts.values():assert b.sha(s['path'])==s['sha256']
    for path in [OLD/'runtime_manifest.json',PARENT/'runtime_manifest.json']:
        for identity in b.load(path).values():assert b.sha(identity['path'])==identity['sha256']
    if (H/'runtime_manifest.json').exists():
        for label in LABELS:
            identity=b.load(H/'runtime_manifest.json').get(label)
            if identity:assert b.sha(identity['path'])==identity['sha256']
    return p


b.verify=verify


def checked(command,stage,name,cwd=None,timeout=180):
    result=b.capture(command,stage,name,timeout,cwd=cwd)
    assert result['exit_code']==0 and not result['timeout'],result['stderr'][-4000:]
    if stage not in ['build','probe_build','safety_build','embed_build']:
        assert not result['stderr'],result['stderr'][-4000:]
    return result


def prepare():
    assert not (H/'work').exists(),'preserve existing preparation'
    os.sched_setaffinity(0,{2})
    parent=variants.parent();manifest={}
    for label in LABELS:
        material=variants.render(label);dest=H/'work'/label;dest.mkdir(parents=True)
        for name,text in material.items():(dest/name).write_bytes(text.encode())
        with tarfile.open(LAB/'v3_mass_search/build_support.tar.gz') as t:
            (dest/'compat').mkdir();(dest/'compat/test-closefrom.c').write_bytes(t.extractfile('compat/test-closefrom.c').read())
        patch=''.join(''.join(difflib.unified_diff(parent[n].splitlines(True),text.splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n,text in material.items() if text!=parent[n])
        b.save('patches/'+label+'.from_P1_B2.patch',patch)
        manifest[label]=dict(parent='P1_B2',files={n:hashlib.sha256(t.encode()).hexdigest() for n,t in material.items()},
                 changed_files=[n for n,t in material.items() if t!=parent[n]])
    b.save('source_manifest.json',manifest)
    b.save('inputs.json',b.load(OLD/'inputs.json'))
    paths=[H/'run.py',H/'variants.py',H/'probe.c',H/'extra.js',OLD/'run.py',OLD/'protocol.json',OLD/'runtime_manifest.json',
           OLD/'raw/archive.json',PARENT/'source_manifest.json',PARENT/'runtime_manifest.json',PARENT/'raw/archive.json',
           PARENT/'combined.js',LAB/'v3_mass_search/generate.py',LAB/'v6_targeted_ic/variants.py']
    previous=b.load(OLD/'protocol.json')
    b.save('protocol.json',dict(cohort_id='native-ubuntu2604-p1-b2-costs-20261108-attempt01',labels=LABELS,repetitions=5,
        seed=SEED,affinity=[2],cases=previous['cases'],N=previous['N'],scripts=previous['scripts'],metric=previous['metric'],warmup_calls=0,
        frozen_files={str(p.relative_to(ROOT)):b.sha(p) for p in paths},
        new_performance_samples=170,new_control_samples=0,controls_reused_at_user_request=True,
        same_boot_as_parent=b.boot()==b.load(PARENT/'environment.before.json')['boot_id'],
        interpretation='cross-batch exploratory vs parent/old controls; bootstrap does not cover unobserved batch drift',
        independent_variants=True,combined_new_variant_not_authorized_by_positive_signal_yet=True,
        LSan='previously unavailable in current sandbox; disabled in ASan/UBSan builds and tests',SunSpider=False,V8_OFF=False))
    b.save('environment.before.json',b.environment())
    print('PREPARED_TWO_INDEPENDENT_VARIANTS',flush=True)


def build(label):
    verify();os.sched_setaffinity(0,{2})
    dest=H/'work'/label
    result=checked(['make','-j1','qjs','qjsc'],'build',label,dest,300)
    line=next(s for s in result['stdout'].splitlines() if ' -c -o .obj/quickjs.o ' in s)
    assert all(x in line for x in ['-O2','-g','-fwrapv','-DHAVE_CLOSEFROM'])
    assert not any(x in line for x in ['-O3','-flto','-DNDEBUG','-fprofile','-march=native'])
    path=H/'runtime_manifest.json'
    identities=b.load(path) if path.exists() else dict(b.load(PARENT/'runtime_manifest.json'))
    identities[label]=dict(path=str(dest/'qjs'),sha256=b.sha(dest/'qjs'),qjsc_sha256=b.sha(dest/'qjsc'),compile_line=line)
    # This file is incremental only during serial builds, before performance.
    path.write_text(json.dumps(identities,indent=2)+'\n')
    b.save('build/'+label+'.json',result)
    print('BUILT',label,identities[label]['sha256'],flush=True)


def safety(label):
    verify();os.sched_setaffinity(0,{2});source=H/'work'/label;checks=[]
    tests=[LAB/'checks.js',LAB/'v3_mass_search/semantic.js',LAB/'v6_targeted_ic/targeted.js',PARENT/'combined.js',H/'extra.js']
    for test in tests:
        r=checked([source/'qjs','--std',test],'semantic',label+'/'+test.name)
        checks.append(dict(name=test.name,token=r['token']))
    core=[source/'.obj'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    old=ROOT/'experiments/read_ic_mic/attempt01/correctness'
    ctests=[old/'read_roundtrip.c',old/'roundtrip_slots.c',old/'gc_cycles.c',LAB/'v2_20261105/first_entry_roundtrip.c',LAB/'v6_targeted_ic/native_finalizer.c']
    for test in ctests:
        target=H/'work'/(label+'.'+test.stem)
        checked(['gcc','-O2','-g','-I'+str(source),test,*core,'-lm','-lpthread','-ldl','-o',target],'safety_build',label+'/'+test.stem)
        r=checked([target],'safety_run',label+'/'+test.stem);checks.append(dict(name=test.name,token=r['token']))
    generated=H/'work'/(label+'.embedded.c');target=H/'work'/(label+'.embedded')
    checked([source/'qjsc','-e','-o',generated,H/'extra.js'],'embed_generate',label)
    checked(['gcc','-O2','-g','-I'+str(source),generated,*core,source/'.obj/quickjs-libc.o','-lm','-lpthread','-ldl','-o',target],'embed_build',label)
    checked([target],'embed_run',label)
    sanitized=H/'work'/(label+'.sanitized')
    shutil.copytree(source,sanitized,ignore=shutil.ignore_patterns('.obj','qjs','qjsc'))
    env=['env','ASAN_OPTIONS=detect_leaks=0:abort_on_error=1','UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1']
    checked([*env,'make','-j1','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],'build',label+'.sanitized',sanitized,300)
    for test in [PARENT/'combined.js',H/'extra.js',LAB/'v3_mass_search/semantic.js']:
        r=checked([*env,sanitized/'qjs','--std',test],'sanitizer',label+'/'+test.name,timeout=90)
        checks.append(dict(name='ASan/UBSan '+test.name,token=r['token']))
    san_core=[sanitized/'.obj/asan/ubsan'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    for test in [old/'read_roundtrip.c',old/'gc_cycles.c',LAB/'v6_targeted_ic/native_finalizer.c']:
        target=H/'work'/(label+'.sanitized.'+test.stem)
        checked(['gcc','-O2','-g','-fsanitize=address,undefined','-fno-omit-frame-pointer','-I'+str(sanitized),test,*san_core,'-lm','-lpthread','-ldl','-o',target],'safety_build',label+'/sanitized/'+test.stem)
        checked([*env,target],'sanitizer_native',label+'/'+test.stem)
    # Counter instrumentation exists only in the diagnostic copy.
    diag=H/'work'/(label+'.probe')
    shutil.copytree(source,diag,ignore=shutil.ignore_patterns('.obj','qjs','qjsc'))
    q=(diag/'quickjs.c').read_bytes().decode()
    anchor='            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
    q=variants.once(q,anchor,'            combo_fused_hits++; '+anchor.lstrip())
    (diag/'quickjs.c').write_bytes(q.encode())
    op=(diag/'read_ic_opcodes.inc').read_bytes().decode()
    anchor='                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);'
    op=variants.once(op,anchor,'                        combo_proto_hits++; '+anchor.lstrip())
    (diag/'read_ic_opcodes.inc').write_bytes(op.encode())
    if label=='PREP2':
        reference=variants.parent()['read_ic_prepare.inc'].replace('static int rdi_prepare(', 'static int reference_prepare(',1)
        (diag/'reference_prepare.inc').write_bytes(reference.encode())
    target=diag/'probe';others=[p for p in san_core if p.name!='quickjs.o']
    checked(['gcc','-O2','-g','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"',
        '-DTEST_'+('PREP2' if label=='PREP2' else 'SPLIT'),'-fsanitize=address,undefined','-fno-omit-frame-pointer',
        '-I'+str(diag),H/'probe.c',*others,'-lm','-lpthread','-ldl','-o',target],'probe_build',label,timeout=300)
    result=checked([*env,target],'probe_run',label)
    assert 'MECHANISM_PASS' in result['stdout']
    for n,want in b.load(H/'source_manifest.json')[label]['files'].items():assert b.sha(source/n)==want,n
    b.save('safety/'+label+'.json',dict(status='PASS_TARGETED',checks=checks,mechanism=result['stdout'],
        preparation_equivalence=label=='PREP2',split_record_sizes_verified=label=='SPLIT16',ASan=True,UBSan=True,LSan=False,full_test262=False))
    print('SAFETY_MECHANISM_PASS',label,result['stdout'].strip(),flush=True)


def csvout(name,rows):
    stream=io.StringIO(newline='');writer=csv.DictWriter(stream,list(dict.fromkeys(k for r in rows for k in r)),lineterminator='\n')
    writer.writeheader();writer.writerows(rows);(H/name).write_text(stream.getvalue())


def read_archive(directory):
    packed=(directory/'raw/runs.jsonl.gz').read_bytes();data=gzip.decompress(packed);m=b.load(directory/'raw/archive.json')
    assert hashlib.sha256(packed).hexdigest()==m['compressed_sha256']
    assert hashlib.sha256(data).hexdigest()==m['uncompressed_sha256']
    return [json.loads(line) for line in data.splitlines()]


def gm(ratios):
    groups=collections.defaultdict(list)
    for case,value in ratios.items():groups[case.split('.')[0]].append(math.log(value))
    return math.exp(st.mean(st.mean(v) for v in groups.values()))


def analyze():
    current=[r for r in b.records() if r['event']=='measurement'];assert len(current)==170 and all(r['valid'] for r in current)
    values=collections.defaultdict(dict)
    old=[r for r in read_archive(OLD)+read_archive(PARENT) if r['event']=='measurement']
    for r in current+old:
        key=r['condition'],r['case'];assert r['rep'] not in values[key];values[key][r['rep']]=r['elapsed_per_Run_ms']
    med={k:st.median(v.values()) for k,v in values.items()};cases=b.load(H/'inputs.json')['cases'];stats=[]
    for label in LABELS:
        for case in cases:
            nums=sorted(values[label,case].values());q1=st.median(nums[:2]);q3=st.median(nums[-2:])
            stats.append(dict(case=case,condition=label,n=5,N=b.load(H/'inputs.json')['N'][case],median_ms=med[label,case],
                 mean_ms=st.mean(nums),sample_stddev=st.stdev(nums),q1=q1,q3=q3,IQR=q3-q1,min=min(nums),max=max(nums),
                 over_A=med[label,case]/med['A',case],over_parent=med[label,case]/med['P1_B2',case]))
    csvout('statistics.csv',stats)
    rng=random.Random(SEED)
    draws=[(tuple(sorted(rng.choices(range(5),k=5))),tuple(sorted(rng.choices(range(5),k=5)))) for _ in range(10000)]
    ix={i for pair in draws for i in pair}
    needed=[*LABELS,'P1_B2','A','V8_ON']
    sampled={(key,i):st.median(v[k] for k in i) for key,v in values.items() if key[0] in needed for i in ix}
    aggregates=[];pairs=[]
    for label in LABELS:
        for control in ['P1_B2','A','V8_ON']:
            for case in cases:
                dist=sorted(sampled[((label,case),ni)]/sampled[((control,case),oi)] for ni,oi in draws)
                ratio=med[label,case]/med[control,case]
                pairs.append(dict(condition=label,case=case,denominator=control,ratio=ratio,change_pct=100*(ratio-1),low95=dist[249],high95=dist[9749]))
            for subset in ['core16_13suite','expanded17_14suite']:
                selected=[c for c in cases if subset.startswith('expanded') or c!='zlib.zlib']
                ratio=gm({c:med[label,c]/med[control,c] for c in selected})
                nl={i:math.log(gm({c:sampled[((label,c),i)] for c in selected})) for i in ix}
                ol={i:math.log(gm({c:sampled[((control,c),i)] for c in selected})) for i in ix}
                dist=sorted(math.exp(nl[ni]-ol[oi]) for ni,oi in draws)
                aggregates.append(dict(condition=label,denominator=control,subset=subset,ratio=ratio,change_pct=100*(ratio-1),low95=dist[249],high95=dist[9749],
                    inference='independent whole-round bootstrap across batches; drift not included'))
    csvout('paired_ratios.csv',pairs);csvout('aggregate.csv',aggregates)
    lines=['# P1+B2 两项成本改进复测','','两个新版本分别以冻结P1+B2为父版，不叠加。只采集新版本，每项各5个新进程；旧对照和父版未重跑。',
           '固定输入/N/原生单调时钟；跨批次比较，区间不覆盖未观测到的批次漂移。','','|版本|集合|对照|耗时变化|比值95%探索区间|','|---|---|---|---:|---:|']
    for r in aggregates:lines.append(f"|{r['condition']}|{r['subset']}|{r['denominator']}|{r['change_pct']:+.2f}%|[{r['low95']:.6f}, {r['high95']:.6f}]|")
    lines+=['','单位ms/完整Run，中位数。','','|case|旧A|旧P1+B2|PREP2|相对父版|SPLIT16|相对父版|','|---|---:|---:|---:|---:|---:|---:|']
    for case in cases:lines.append(f"|{case}|{med['A',case]:.5f}|{med['P1_B2',case]:.5f}|{med['PREP2',case]:.5f}|{100*(med['PREP2',case]/med['P1_B2',case]-1):+.2f}%|{med['SPLIT16',case]:.5f}|{100*(med['SPLIT16',case]/med['P1_B2',case]-1):+.2f}%|")
    lines+=['','安全结果及真实布局/机制见safety/*.json。ASan/UBSan定向检查，不是完整test262；LSan依前次环境限制关闭。',
            'SPLIT16每个有IC的函数多8B布局头，函数头保持不变；普通记录16B、保留receiver记录24B，总内存变化依两类条目数而异。',
            '原始记录及压缩SHA见raw/。所有失败和偏短样本保留。没有SunSpider、V8_OFF或旧对照新采样。','']
    (H/'results.md').write_text('\n'.join(lines))
    print('ANALYSIS_COMPLETE',json.dumps([r for r in aggregates if r['denominator']=='P1_B2']),flush=True)


def audit():
    verify();rows=b.records();starts={r['token']:r for r in rows if r['event']=='process_start'};ends={r['token']:r for r in rows if r['event']=='process_result'}
    assert starts.keys()==ends.keys()
    assert len(starts)==sum(r['event']=='process_start' for r in rows)
    for token,r in ends.items():assert r['command']==starts[token]['command'] and r['exit_code']==0 and not r['timeout']
    order=sorted(ends.values(),key=lambda r:r['outer_start_ns']);assert all(a['outer_stop_ns']<=z['outer_start_ns'] for a,z in zip(order,order[1:]))
    samples=[r for r in rows if r['event']=='measurement'];assert len(samples)==170 and all(r['valid'] and r['condition'] in LABELS for r in samples)
    assert [dict(rep=r['rep'],case=r['case'],condition=r['condition'],order=r['order']) for r in samples]==b.schedule()
    forbidden={i['path'] for i in b.load(PARENT/'runtime_manifest.json').values()}
    assert all(r['command'][0] not in forbidden for r in ends.values())
    for label in LABELS:
        source=H/'work'/label
        for name,want in b.load(H/'source_manifest.json')[label]['files'].items():assert b.sha(source/name)==want,name
    b.save('audit.json',dict(status='PASS_COMPLETE',new_samples=170,new_control_samples=0,per_case_condition_n=5,
        correctness_records=sum(r['event']=='correctness' for r in rows),all_inputs_sources_runtime_hashes_verified=True,
        all_expected_positions_and_seriality_verified=True,ASan=True,UBSan=True,LSan=False,
        max_raw_clock_disagreement_ms=max(abs(r['raw_minus_monotonic_ms']) for r in ends.values()),
        below_1000ms_retained=sum(r['below_1000ms'] for r in samples),SunSpider_samples=0,V8_OFF_samples=0))
    raw=(H/'runs.jsonl').read_bytes();packed=gzip.compress(raw,mtime=0)
    b.save('raw/runs.jsonl.gz',packed);b.save('raw/archive.json',dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),uncompressed_sha256=hashlib.sha256(raw).hexdigest()))
    print('AUDIT_PASS_170_NEW_ONLY',flush=True)


def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['prepare','qualify','measure','analyze','audit','all']);a=p.parse_args()
    if a.stage in ['prepare','all']:prepare()
    if a.stage in ['qualify','all']:
        for label in LABELS:build(label);safety(label)
        b.save('runtime_frozen.json',dict(sha256=b.sha(H/'runtime_manifest.json')))
        b.correctness()
    if a.stage in ['measure','all']:
        assert b.sha(H/'runtime_manifest.json')==b.load(H/'runtime_frozen.json')['sha256']
        assert all(b.load(H/'safety'/(label+'.json'))['status']=='PASS_TARGETED' for label in LABELS)
        b.measure()
    if a.stage in ['analyze','all']:analyze()
    if a.stage in ['audit','all']:audit()


if __name__=='__main__':main()
