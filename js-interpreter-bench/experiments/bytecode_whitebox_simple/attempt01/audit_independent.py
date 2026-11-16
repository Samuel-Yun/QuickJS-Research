"""Read-only independent arithmetic/order/raw-record audit, separate from runner."""
import csv
import hashlib
import json
import math
import re
import statistics
from collections import Counter, defaultdict
from pathlib import Path
from run import HERE, ROOT, read, save, sha, verify


def main():
    m=verify()
    rows=list(csv.DictReader((HERE/'raw/timing.csv').open()))
    summaries=list(csv.DictReader((HERE/'summary.csv').open()))
    cfg=read(HERE/'cases/config.json')
    references=dict(arithmetic=(7+3*4)-(7-3),numeric_loop=sum(range(4096)),
                    branches=sum(2*x if x>=0 else -x for x in [-3,4,-1,8]),
                    direct_call=sum(2*x+1 for x in range(4096)),own_property=3*4096,
                    prototype_method=sum(x+3 for x in range(4096)))
    assert all(references[c]==d['expected'] for c,d in cfg.items())
    schedule=read(HERE/'schedule.json')
    assert len(rows)==len(schedule)==180
    locations=set();groups=defaultdict(list);positions=defaultdict(Counter);boots=set()
    below=Counter()
    for row,pos in zip(rows,schedule):
        case,e=row['case'],row['engine'];rep=int(row['rep']);order=int(row['order']);n=int(row['N'])
        assert (case,e,rep,order)==(pos['case'],pos['engine'],pos['rep'],pos['order'])
        loc=(case,e,rep)
        assert loc not in locations;locations.add(loc)
        raw=read(HERE/row['record']);boots.add(raw['boot_id'])
        assert row['valid']=='True' and raw['exit_code']==0 and row['stdout']==raw['stdout'] and row['stderr']==raw['stderr']
        assert raw['command']==json.loads(row['command'])
        prefix=m['engines'][e]['command_prefix']
        a=[x['path'] for x in m['adapters'][e]]
        adapter_args=['-I',a[0],'-I',a[1]] if e=='quickjs' else a
        assert raw['command'][:-1]==prefix+adapter_args
        assert not any('trace' in x or '--prof'==x or 'print-bytecode' in x for x in raw['command'])
        p=Path(raw['command'][-1]);text=p.read_text()
        assert sha(p)==row['script_sha256'] and sha(HERE/'cases'/(case+'.js'))==row['target_sha256']
        assert row['binary_sha256']==sha(prefix[0])
        assert text.startswith((HERE/'cases'/(case+'.js')).read_text())
        assert text.index('var __wbStart = benchNow();')<text.index('__wbLast = '+cfg[case]['call'])<text.index('var __wbElapsed = benchNow()')
        assert text.count('__wbLast = '+cfg[case]['call'])==1
        actual=json.loads(next(line[len('WB_RESULT '):] for line in raw['stdout'].splitlines() if line.startswith('WB_RESULT ')))
        assert actual['N']==n and actual['last']==references[case]
        assert actual['checksum']==((references[case]*n+2**31)%2**32)-2**31
        assert actual['elapsed_ms']>0 and math.isfinite(actual['elapsed_ms'])
        assert float(row['elapsed_ms'])==actual['elapsed_ms']
        assert float(row['elapsed_per_call_ms'])==actual['elapsed_ms']/n
        assert int(row['outer_wall_ns'])==raw['outer_wall_ns']
        assert row['timestamp_utc']==raw['timestamp_utc'] and row['mode']==m['mode'] and row['cohort']==m['cohort']
        groups[case,e].append(actual['elapsed_ms']/n);positions[case,e][order]+=1
        if actual['elapsed_ms']<1000:below[case,e]+=1
    assert len(groups)==6 and all(len(x)==30 for x in groups.values())
    assert all(x==Counter({1:15,2:15}) for x in positions.values())
    for row in summaries:
        vals=groups[row['case'],row['engine']];q=statistics.quantiles(vals,n=4,method='inclusive')
        expected=dict(median=statistics.median(vals),q1=q[0],q3=q[2],mean=statistics.mean(vals),
                      stddev=statistics.stdev(vals),IQR=q[2]-q[0],min=min(vals),max=max(vals))
        expected['v8_over_quickjs']=statistics.median(groups[row['case'],'v8'])/statistics.median(groups[row['case'],'quickjs'])
        for field,value in expected.items():assert math.isclose(float(row[field]),value,rel_tol=1e-13,abs_tol=1e-15),(field,row)
    correctness=list(csv.DictReader((HERE/'correctness.csv').open()))
    assert len(correctness)==36 and all(x['valid']=='True' and int(x['exit_code'])==0 for x in correctness)
    assert Counter((x['case'],x['engine'],int(x['N'])) for x in correctness)==Counter((c,e,n) for c in cfg for e in ('quickjs','v8') for n in (1,2,64))
    for case in (c for c,d in cfg.items() if d['timed']):
        selected=read(HERE/'calibration'/(case+'.json'));n=selected['N']
        assert n>0 and (n&(n-1))==0
        for power in range(n.bit_length()):
            k=2**power
            times=[]
            for e in ('quickjs','v8'):
                raw=read(HERE/'raw/calibration'/('N'+str(k)+'_'+e+'_'+case+'.json'))
                value=json.loads(next(line[len('WB_RESULT '):] for line in raw['stdout'].splitlines() if line.startswith('WB_RESULT ')))
                assert value['last']==references[case] and raw['exit_code']==0
                times.append(value['elapsed_ms'])
            assert (min(times)>=1000)==(k==n)
        for e in ('quickjs','v8'):
            raw=read(HERE/'raw/selected_correctness'/('selected_'+e+'_'+case+'.json'))
            assert raw['exit_code']==0 and 'WB_RESULT ' in raw['stdout']
    flags=read(HERE/'raw/v8_flags.json')['stdout'].splitlines()
    assert all(x in flags for x in ('--max-opt=0','--no-sparkplug','--no-maglev','--no-turbofan','--no-lazy'))
    static=list(csv.DictReader((HERE/'bytecode/static_counts.csv').open()))
    assert len(static)==16
    for row in static:
        ins=read(HERE/'bytecode'/row['engine']/(row['function']+'.decoded.json'))
        assert len(ins)==int(row['instructions']) and sum(x['size'] for x in ins)==int(row['bytes'])
        pc=0
        for x in ins:assert x['offset']==pc;pc+=x['size']
    serialization=read(HERE/'source_evidence/serialization_comparison.json')
    assert len(serialization['cases'])==6 and all(x['serialized_bytes_equal'] for x in serialization['cases'])
    for e in ('quickjs','v8'):
        assert read(HERE/'raw/diagnostics'/(e+'_semantics_attempt02.json'))['exit_code']==0
    def paths(case):
        record=read(HERE/'raw/diagnostics'/(case+'_paths_persistent.json'))
        assert record['exit_code']==0
        return json.loads(record['stdout'].split('PATHS ',1)[1])
    own=paths('own_property');proto=paths('prototype_method')
    assert own['categories'][0]['own_hit']==4096 and own['categories'][0]['fallback']==0
    assert proto['categories'][1]['prototype_hit']==4096 and proto['categories'][1]['hops'][1]==4096
    assert proto['categories'][2]['own_hit']==4096 and proto['selected_entries']==4096
    native=read(HERE/'source_evidence/v8_native_map.json');assert len(native['handlers'])==9
    for item in native['handlers']:
        text=(HERE/'bytecode/v8_native'/(item['handler']+'.disassembly.txt')).read_text()
        assert ('<Builtins_'+item['handler']+'Handler>' in text) or (item['handler']=='Star0' and '<Builtins_ShortStarHandler>' in text)
    files=['run.py','evidence.py','native_handlers.py','representation.py','write_notes.py','audit_independent.py']
    result=dict(status='PASS',formal_valid=180,formal_expected=180,correctness_pass=36,selected_correctness_pass=6,
                groups=6,samples_per_group=30,first_position_per_engine_per_case=15,second_position_per_engine_per_case=15,
                same_script_and_command_verified=True,zero_epsilon_or_outlier_deletion=False,
                first_qualifying_power_of_two_verified=True,formal_boot_ids=sorted(boots),
                below_1000ms_retained={c+'/'+e:n for (c,e),n in below.items()},
                raw_record_count=len(list((HERE/'raw/formal').glob('*.json'))),
                final_bytecode_functions=8,engine_function_dumps=16,native_v8_handlers=9,
                quickjs_representation_equal_cases=6,quickjs_property_path_counters_measured=True,
                full_dynamic_opcode_profiler=False,logical_opcode_visits='DERIVED_NOT_MEASURED',
                exact_v8_source_commit=None,v8_native_branch_hit_rates=None,
                post_measurement_artifact_hashes_verified=True,old_files_preservation_audit=read(HERE/'audit.json')['old_files_unchanged'],
                initial_runner_sha256=m['entry_script_sha256'],final_code_hashes={f:sha(HERE/f) for f in files},
                note='Offline parser/auxiliary recovery and diagnostic additions changed entry code hashes; targets, formal driver semantics, runtime flags and measurements unchanged.')
    save(HERE/'independent_audit.json',result)
    print(json.dumps(result,ensure_ascii=False,indent=2))


if __name__=='__main__':main()
