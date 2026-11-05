"""Independent offline audit from raw subprocess records, not the timing API.

Checks real risks: duplicates/missing fresh-process slots, units, checksum,
same workloads, binary/flags, order, and process-level summary statistics.
Never imports run.py and never runs an engine.
"""
import csv
import hashlib
import json
import math
from pathlib import Path
import re
import statistics
from collections import Counter, defaultdict

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]


def load(p):return json.loads(Path(p).read_text(encoding='utf-8'))
def digest(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def main():
    m=load(HERE/'manifest.json'); positions=load(HERE/'schedule.json')
    assert len(positions)==240
    expected={(r['case'],r['engine'],r['rep']) for r in positions}
    assert len(expected)==240
    with (HERE/'summary.csv').open(newline='',encoding='utf-8') as f: summary=list(csv.DictReader(f))
    with (HERE/'raw/formal.csv').open(newline='',encoding='utf-8') as f: index=list(csv.DictReader(f))
    assert len(index)==240 and len({r['record'] for r in index})==240
    assert len({(r['case'],r['engine'],int(r['rep'])) for r in index})==240
    measured=defaultdict(list); per_case_hashes=defaultdict(set); starts=Counter(); batch_lengths=[]
    sources=set(); raw_records=set(); timeout_or_exit_failures=0
    for row in index:
        p=HERE/row['record']; assert p.is_file(); rec=load(p)
        assert row['valid']=='True' and row['diagnostic']=='False'
        assert rec['exit_code']==0 and rec['timeout'] is False and rec['LD_PRELOAD'] is None
        key=(row['case'],row['engine'],int(row['rep']));assert key in expected
        engine=m['engines'][row['engine']]
        command=list(engine['command_prefix'])
        for adapter in m['adapters'][row['engine']]:
            command += ['-I',adapter['path']] if row['engine']=='quickjs' else [adapter['path']]
        command += [rec['command'][-1]]
        assert command==rec['command'], 'extra flag/changed release command'
        assert engine['binary']['sha256']==row['binary_sha256']
        script=Path(rec['command'][-1]);sources.add(script)
        assert digest(script)==row['script_sha256']
        per_case_hashes[row['case']].add(row['script_sha256'])
        source=script.read_bytes();upstream=(ROOT/'benchmarks/octane/upstream/richards.js').read_bytes()
        assert source.count(upstream)==1, 'modified/non-original Richards'
        N=int(row['N_or_M']); assert N==load(HERE/'selected_n.json')[row['case']]
        tag='RICHARDS' if row['case']=='richards_run' else 'RFT'
        matches=re.findall(r'^'+tag+r' (.+)$',rec['stdout'],re.M);assert len(matches)==1
        v=json.loads(matches[0]);assert v['N']==N and v['warmup_calls']==0 and v['correctness']=='PASS'
        assert v['elapsed_ms']>0 and math.isfinite(v['elapsed_ms'])
        assert math.isclose(v['stop_ms']-v['start_ms'],v['elapsed_ms'],abs_tol=1e-6,rel_tol=1e-10)
        assert v['elapsed_ms']<=rec['outer_wall_ns']/1e6+5
        if row['case']=='richards_run':
            old=(ROOT/'experiments/call_path_followup/attempt01/richards/original.N1.js').read_bytes()
            expected_source=old.replace(b'__cfRep<1;',f'__cfRep<{N};'.encode()).replace(b'N:1,',f'N:{N},'.encode())
            assert source==expected_source and v['assertions_per_Run']==1
            value=v['elapsed_ms']/N;assert row['unit']=='ms/Run'
        else:
            c=m['cases'][row['case']]
            assert v['last'] is c['expected'] and v['checksum']==N*int(c['expected']) and v['state']==c['state']
            value=v['elapsed_ms']*1000000/N;assert row['unit']=='ns/target invocation'
            driver=source.split(upstream)[1].decode()
            timed=driver.split('var __rftStart = benchNow();')[1].split('var __rftStop = benchNow();')[0]
            assert timed.count('__rftReceiver.isHeldOrSuspended()')==1
            assert 'new TaskControlBlock' not in timed and '.call(' not in timed and '.bind(' not in timed
            assert driver.count('benchNow()')==2 and driver.index('new TaskControlBlock')<driver.index('var __rftStart')
        assert math.isclose(value,float(row['batch_average']),rel_tol=1e-12)
        measured[(row['case'],row['engine'])].append(value)
        starts[(row['case'],row['engine'])]+=int(row['order'])==1
        batch_lengths.append(v['elapsed_ms'])
        raw_records.add(p)
    assert len(measured)==8 and all(len(v)==30 for v in measured.values())
    assert all(count==15 for count in starts.values()) and all(len(h)==1 for h in per_case_hashes.values())
    for r in summary:
        key=(r['case'],r['engine']);v=measured[key]
        quartiles=statistics.quantiles(v,n=4,method='inclusive')
        expected_stats={'median':statistics.median(v),'mean':statistics.mean(v),
            'sample_stddev':statistics.stdev(v),'q1':quartiles[0],'q3':quartiles[2],
            'IQR':quartiles[2]-quartiles[0],'min':min(v),'max':max(v)}
        for name,amount in expected_stats.items():assert math.isclose(float(r[name]),amount,rel_tol=1e-12,abs_tol=1e-10),(key,name)
        ratio=statistics.median(measured[(r['case'],'v8')])/statistics.median(measured[(r['case'],'quickjs')])
        assert math.isclose(ratio,float(r['v8_over_quickjs']),rel_tol=1e-12)
        assert float(r['ratio_bootstrap95_low'])<=float(r['ratio_bootstrap95_high'])
        assert int(r['valid'])==int(r['expected'])==30, 'inner repeats must NOT be sample count'
    for rel,h in m['inputs'].items():assert digest(ROOT/rel)==h
    unindexed=set((HERE/'raw/formal').glob('*.json'))-raw_records
    for p in unindexed:
        r=load(p)
        if r['exit_code']!=0 or r.get('timeout'):timeout_or_exit_failures+=1
    report=dict(status='INDEPENDENT_A_B_AUDIT_PASS',formal_valid=240,formal_expected=240,
        fresh_process_groups=8,processes_per_group=30,raw_slots_unique=True,first_positions_per_engine=15,
        source_original_and_pairwise_identical=True,unchanged_release_command_flags=True,
        units_recomputed_from_raw=True,all_original_assertions_and_boolean_checksums_pass=True,
        summary_statistics_recomputed=True,bootstrap_replicates=10000,
        bootstrap_resampling_unit='30 independent process batch averages per engine, not N/M invocations',
        min_batch_ms=min(batch_lengths),max_batch_ms=max(batch_lengths),below_200ms=sum(v<200 for v in batch_lengths),
        additional_unindexed_formal_records=len(unindexed),additional_exit_or_timeout_failures=timeout_or_exit_failures,
        C_cumulative_time_not_inferred_from_microbenchmark=True)
    out=HERE/'independent_audit.json'
    data=json.dumps(report,ensure_ascii=False,indent=2)+'\n'
    if out.exists(): assert out.read_text()==data
    else: out.write_text(data,encoding='utf-8')
    print(json.dumps(report,ensure_ascii=False,indent=2))


if __name__=='__main__':main()
