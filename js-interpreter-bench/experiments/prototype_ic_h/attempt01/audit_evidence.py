"""Independent public-raw checks; no runtime execution or Linux file access."""
import collections
import csv
import gzip
import hashlib
import json
import statistics
from pathlib import Path
from run import HERE,read,save,sha


def main():
    out=HERE/'evidence_audit.json';assert not out.exists()
    archives=0;matched_functions=0;changed_final_bytes=[]
    for stage in ['admission','mechanism']:
        for identity in sorted((HERE/'raw'/stage).glob('*.identity.json')):
            d=read(identity);p=identity.with_name(identity.name.replace('.identity.json','.json.gz'))
            assert sha(p)==d['compressed_sha256']
            raw=gzip.decompress(p.read_bytes());assert hashlib.sha256(raw).hexdigest()==d['raw_sha256']
            assert sha(HERE/d['script_relative'])==d['script_sha256'];archives+=1
            report=json.loads(raw)
            for f in report['functions']:
                before=bytes.fromhex(f['code_before_hex']);after=bytes.fromhex(f['code_after_hex'])
                pc=0
                for op in f['opcodes']:
                    assert op['pc']==pc and before[pc]==op['before_id'];pc+=op['size']
                    if op['ic_read_stats_instrumented']:
                        assert op['ic_queries']==op['hits']+op['misses']
                    if 'admission' in op:
                        a=op['admission'];assert a['eligible']==a['mask_counts'][63]==a['first_reason'][0]
                        assert sum(a['mask_counts'])==sum(a['first_reason'])==sum(a['depth_counts'])==a['found']
                assert pc==len(before)==len(after)
            if 'cache_lifecycle' in report:
                a=report['cache_lifecycle'];assert a['shape_retains']==a['shape_releases'] and a['final_requested_live_bytes']==0
    for case in ['prototype_method','own_method','own_integer','numeric_control','Richards.Richards']:
        for n in [1,2]:
            reports={v:read(HERE/'raw/mechanism'/f'{v}.{case}.N{n}.json.gz') for v in ['M','H']}
            def key(f):return f['instance_id'],f['function_hex'],hashlib.sha256(bytes.fromhex(f['source_hex'])).hexdigest()
            fs={v:{key(f):f for f in reports[v]['functions']} for v in ['M','H']}
            assert set(fs['M'])==set(fs['H'])
            for k,m in fs['M'].items():
                h=fs['H'][k];matched_functions+=1
                if m['code_before_hex']!=h['code_before_hex']:
                    changed_final_bytes.append(dict(case=case,N=n,key=k))
    assert not changed_final_bytes,changed_final_bytes
    counts=collections.Counter();failed=[]
    for p in (HERE/'raw/commands').glob('correctness.*.json'):
        d=read(p);assert d['exit_code']==0 and not d['stderr'];counts['semantic_processes']+=1
    assert counts['semantic_processes']==96
    for name in ['semantic','lifecycle','sanitizer','mechanism','internal','cow_oom','timer','workload']:
        assert read(HERE/'correctness'/(name+'_gate.json'))['status']=='PASS'
    # Recompute medians independently from formal raw, compare published table.
    raw=list((HERE/'raw/formal').rglob('*.json'));assert len(raw)==450
    groups=collections.defaultdict(list);external=collections.defaultdict(list)
    for p in raw:
        r=read(p);assert r['valid'];groups[r['case'],r['condition']].append(r['elapsed_ms']/r['N'])
        external[r['case'],r['condition']].append(r['outer_wall_ns']/1e6)
    assert len(groups)==15 and {len(x) for x in groups.values()}=={30}
    with (HERE/'analysis_performance/summary.csv').open(encoding='utf-8',newline='') as f:
        table=list(csv.DictReader(f))
    for r in table:
        values=(groups if r['metric']=='internal_ms_per_Run' else external)[r['case'],r['condition']]
        assert statistics.median(values)==float(r['median'])
        a=sorted(values);assert statistics.median(a[:15])==float(r['Q1']) and statistics.median(a[15:])==float(r['Q3'])
    audit=read(HERE/'analysis_performance/audit.json');assert audit['status']=='PASS'
    save(out,dict(status='PASS',archives_verified=archives,compiled_functions_compared_M_H=matched_functions,
                  final_prepared_bytes_identical=True,semantic_processes=96,formal_processes=450,groups=15,
                  independent_median_quartiles='PASS',cache_edge_balance='PASS',counter_invariants='PASS',
                  raw_only=True,runtime_files_opened=False,bootstrap_independent_reimplementation=False))
    print('INDEPENDENT_EVIDENCE_AUDIT_PASS')


if __name__=='__main__':main()
