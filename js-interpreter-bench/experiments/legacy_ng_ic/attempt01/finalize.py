"""Completion audit and final derivative tables. No engine execution."""
import collections
import csv
import json
import math
import statistics as st
from pathlib import Path
from prepare_sources import HERE,ROOT,save,sha
import run
from analyze import svg_bars


def csvread(p):
    with p.open(newline='') as f:return list(csv.DictReader(f))


def main():
    m=run.verify();frozen=run.read(HERE/'frozen_config.json')
    for key,name in [('manifest_sha256','manifest.json'),('protocol_sha256','protocol.json'),('schedule_sha256','schedule.json')]:
        assert sha(HERE/name)==frozen[key]
    for name,h in frozen['selected'].items():assert sha(HERE/'selected'/name)==h
    formal=[run.read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    correctness=[run.read(p) for p in (HERE/'raw/correctness').glob('*/*.json')]
    eligible=[r for r in correctness if r['case'] in run.SUPPORTED]
    assert len(eligible)==64 and all(r['valid'] for r in eligible)
    selected=[run.read(p) for p in (HERE/'raw/selected_correctness').glob('*/*.json')]
    assert len(selected)==32 and all(r['valid'] for r in selected)
    pilot=[]
    for case in run.SUPPORTED:
        n=run.read(HERE/'selected'/f'{case}.json')['N']
        rs=[run.read(p) for p in (HERE/'raw/pilot'/case).glob('*.json')]
        chosen=[r for r in rs if r['N']==n]
        assert len(chosen)==6 and all(r['valid'] and r['elapsed_ms']>=1000 for r in chosen)
        assert all(sum(r['variant']==v for r in chosen)==3 for v in ['A','B'])
        pilot+=chosen
    regs=run.read(HERE/'correctness/regressions.json');assert len(regs)==26 and all(r['valid'] for r in regs)
    for name in ['A_test.1.json','B_test.1.json','A_sanitizer_regression.1.json','B_sanitizer_regression.1.json']:
        r=run.read(HERE/'raw/build'/name);assert r['exit_code']==0
    assert run.read(HERE/'correctness/extra.json')['status']=='PASS'
    diagm=run.read(HERE/'diagnostic_manifest.json');assert sha(diagm['binary'])==diagm['sha256']
    diag_counts={}
    for case in run.SUPPORTED:
        p=HERE/'raw/diagnostic'/f'{case}.counters.json';d=run.read(p)
        assert d['live_bytes_after_runtime_free']==0
        records=[run.read(p) for p in (HERE/'raw/diagnostic'/case).glob('*.json')]
        assert len(records)==1 and records[0]['valid'] and records[0]['binary_sha256']==diagm['sha256']
        for u in d['units_detail']:
            for k in ['read','write']:assert u[k+'_queries']==u[k+'_hits']+u[k+'_fallback']
            assert u['shape_hits']+u['shape_misses']==u['read_queries']+u['write_queries']-u['read_nonobject']-u['write_nonobject']
        diag_counts[case]=len(d['units_detail'])
    micros=list((HERE/'raw/diagnostic_micro').glob('*.json'));assert len(micros)==9
    assert all(run.read(p)['live_bytes_after_runtime_free']==0 for p in micros)
    mem=[run.read(p) for p in (HERE/'raw/memory').glob('*/*.json')]
    assert len(mem)==102 and all(r['valid'] and not r['instrumented_binary'] for r in mem)
    summary=csvread(HERE/'analysis/summary.csv');memory=csvread(HERE/'analysis/rss_gnutime.csv')
    bymem={r['case']:r for r in memory};combined=[]
    for r in summary:
        a,b=float(r['execution_A_median']),float(r['execution_B_median'])
        mm=bymem[r['case']]
        combined.append(dict(case=r['case'],status=r['direction'],N=int(r['N']),
            A_n=30,B_n=30,A_execution_ms_per_Run=a,B_execution_ms_per_Run=b,
            A_over_B_speedup=a/b,CI95_low=float(r['execution_CI95_low']),CI95_high=float(r['execution_CI95_high']),
            B_time_change_percent=(b/a-1)*100,
            A_e2e_ms_process=float(r['end_to_end_A_median']),B_e2e_ms_process=float(r['end_to_end_B_median']),
            A_formal_wait4_peak_KiB=float(r['rss_A_median']),B_formal_wait4_peak_KiB=float(r['rss_B_median']),
            formal_RSS_warning='fork/pre-exec high-water floor; not uncontaminated qjs memory',
            A_gnutime_peak_KiB=float(mm['A_median_KiB']),B_gnutime_peak_KiB=float(mm['B_median_KiB']),
            separate_memory_n_each=3))
    run.csvout(HERE/'analysis/final_table.csv',combined)
    svg_bars(HERE/'analysis/rss_gnutime_A_over_B.svg',
        [dict(case=r['case'],ratio=r['A_gnutime_peak_KiB']/r['B_gnutime_peak_KiB']) for r in combined],
        'ratio','Independent GNU time peak RSS A/B (3 processes per version; not formal timing)')
    agg=run.read(HERE/'analysis/aggregate.json')
    excluded={k:v for k,v in agg['suite_speedups'].items() if k!='Crypto'}
    sensitivity=dict(reason='Crypto source initializes rng_pool before ResetRNG; random padding not pairwise frozen',
        excluded_suite='Crypto',remaining_suites=len(excluded),
        equal_suite_GM_A_over_B=math.exp(st.mean(math.log(v) for v in excluded.values())),
        no_new_samples=True)
    save(HERE/'analysis/crypto_sensitivity.json',sensitivity)
    bootids=sorted({r['boot_id'] for r in formal})
    assert len(bootids)==1 and len(formal)==960 and all(r['valid'] for r in formal)
    hashes={}
    for v in ['A','B']:
        hashes[v]={f:sha(HERE/'artifacts'/v/f) for f in ['qjs','qjsc','quickjs.c','quickjs-opcode.h','Makefile']}
        assert hashes[v]['qjs']==m['artifacts'][v]['sha256']
    final=dict(status='COMPLETE_WITH_DISCLOSED_LIMITATIONS',formal_audit=run.read(HERE/'analysis/audit.json')['status'],
        formal_valid=960,formal_target=960,formal_failed=0,first_timestamp=min(r['timestamp'] for r in formal),
        last_timestamp=max(r['timestamp'] for r in formal),formal_boot_ids=bootids,
        correctness_eligible_N1_N2_valid=64,selected_N_correctness_valid=32,
        existing_smoke_processes_valid=24,mechanism_regression_processes_valid=2,assertions_per_mechanism_process=952,
        pilot_at_selected_N_valid=len(pilot),upstream_tests_A_B='PASS',targeted_ASan_UBSan='PASS',
        warmed_serialization_load_embedding_and_OOM='PASS',diagnostic_units_valid=len(diag_counts),
        diagnostic_micro_programs_valid=len(micros),separate_memory_processes_valid=len(mem),
        archives_and_source_hash_check='source_evidence/final_identity.json',artifact_copy_hashes=hashes,
        changed_files_scope='only experiments/legacy_ng_ic; confirm with git status --short',
        limitations=['formal wait4 RSS includes launcher footprint; separate GNU time memory checks n=3',
            'Crypto random padding/input bytes not pairwise frozen; excluding Crypto sensitivity reported',
            'Box2D no trusted correctness gate; zlib lacks read(); official latency scores excluded',
            'not full test262; no full Octane sanitizer campaign',
            'single WSL2 host; uncontrolled power/frequency/background; exploratory pointwise CI',
            'diagnostic counters cover whole process and rewritten IC only; not timed-region site counts',
            'shape diversity and instruction/cost decomposition UNKNOWN; code-layout effects not excluded'])
    save(HERE/'analysis/completion.json',final)
    supplement=dict(frozen_manifest_unmodified=True,formal_boot_ids=bootids,formal_dates_UTC=[final['first_timestamp'],final['last_timestamp']],
        source_and_dependency_hashes=run.read(HERE/'source_evidence/final_identity.json'),
        RSS_status='formal raw preserved but contaminated by fork/pre-exec footprint; use separate n=3 check with caveats',
        Crypto_pairwise_identical_random_padding=None,Crypto_pairwise_random_padding_status='UNKNOWN; not frozen before source load',all_other_input_bytes_proven_identical=None,
        same_JS_source_workload_N_between_A_B=True,formal_config_changed_after_freeze=False,
        machine_power_frequency='UNKNOWN',full_shape_diversity=None,
        extra_correctness_supersedes_initial_sanitizer_not_yet_tested_allocation_note=True)
    save(HERE/'manifest_supplement.json',supplement)
    lines=['# 执行、端到端与独立内存检查','',
        '执行单位为ms/原Run，首次调用包含在内，无预跑；端到端为ms/新进程（含N次Run）。',
        '下面内存是独立GNU time新进程n=3/版本的中位数，KiB；不是正式30对时间样本。',
        '正式wait4数据仍在summary.csv/final_table.csv，受fork/pre-exec内存高水位污染，不据其低位平台判断内存不变。','',
        '| 单元 | N | A执行 | B执行 | A/B [95%CI] | B时间变化 | A/B端到端ms | A/B独立peak KiB |',
        '|---|---:|---:|---:|---|---:|---|---|']
    for r in combined:
        lines.append(f'| {r["case"]} | {r["N"]} | {r["A_execution_ms_per_Run"]:.6f} | {r["B_execution_ms_per_Run"]:.6f} | {r["A_over_B_speedup"]:.4f} [{r["CI95_low"]:.4f},{r["CI95_high"]:.4f}] | {r["B_time_change_percent"]:+.2f}% | {r["A_e2e_ms_process"]:.2f}/{r["B_e2e_ms_process"]:.2f} | {r["A_gnutime_peak_KiB"]:.0f}/{r["B_gnutime_peak_KiB"]:.0f} |')
    lines+=['','每项A/B均30有效正式样本；所有正式样本保留。mean、样本stddev、Tukey Q1/Q3/IQR及min/max见statistics.csv。',
        'CI按rep配对重采样10000次，ratio of medians，seed20261023+单元下标；逐项探索区间，未做多重比较校正。',
        f'13个suite等权GM={agg["equal_suite_geomean_speedup"]:.6f}；排除Crypto后的12个suite敏感性GM={sensitivity["equal_suite_GM_A_over_B"]:.6f}，不含官方latency/总分。']
    save(HERE/'analysis/final_table.md','\n'.join(lines)+'\n')
    print(json.dumps(final,ensure_ascii=False),flush=True)


if __name__=='__main__':main()
