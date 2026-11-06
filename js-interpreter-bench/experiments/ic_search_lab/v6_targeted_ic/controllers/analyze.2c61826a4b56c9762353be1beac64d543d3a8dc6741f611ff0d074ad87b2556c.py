"""Portable read-only-input analysis. No Linux imports, ELF, old home or VM needed."""
import argparse
import csv
import gzip
import hashlib
import io
import json
import math
from pathlib import Path
import random
import statistics

H=Path(__file__).resolve().parent


def load(path):
    return json.loads(Path(path).read_text(encoding='utf-8'))


def write(name,rows):
    if not rows:return
    stream=io.StringIO(newline='')
    writer=csv.DictWriter(stream,list(dict.fromkeys(k for r in rows for k in r)),lineterminator='\n')
    writer.writeheader();writer.writerows(rows);data=stream.getvalue().encode()
    p=H/name
    if p.exists():assert p.read_bytes()==data,'Derived output mismatch '+name
    else:p.write_bytes(data)


def records():
    if (H/'runs.jsonl.gz').exists():
        with gzip.open(H/'runs.jsonl.gz','rt',encoding='utf-8') as f:return [json.loads(s) for s in f]
    return [json.loads(s) for s in (H/'runs.jsonl').read_text(encoding='utf-8').splitlines()]


def aggregate(ratios,expanded=False):
    assert len(ratios)==17
    suites={}
    for case,ratio in ratios.items():
        if expanded or case!='zlib.zlib':suites.setdefault(case.split('.')[0],[]).append(math.log(ratio))
    assert len(suites)==(14 if expanded else 13)
    return math.exp(statistics.mean(statistics.mean(v) for v in suites.values()))


def main():
    raw=records();campaigns=[]
    process_results={r['token']:r for r in raw if r.get('event')=='process_result'}
    for protocol_path in sorted(H.glob('*.protocol.json')):
        protocol=load(protocol_path)
        if 'order' not in protocol:continue
        name=protocol['name'];rows=[r for r in raw if r.get('event')=='measurement' and r.get('campaign')==name]
        expected=sum(len(g['conditions']) for g in protocol['order'])
        seen=set()
        for row in rows:
            key=row['kind'],row['case'],row['condition'],row['rep']
            assert key not in seen;seen.add(key)
            assert row['valid'] and row['elapsed_ms']>0
            assert row['boot_id']==row['boot_id_after']==protocol['boot_id']
        status='COMPLETE_QUARANTINED_ENVIRONMENT' if len(rows)==expected else 'PARTIAL_NO_AGGREGATE'
        campaigns.append(dict(campaign=name,actual=len(rows),expected=expected,status=status,
            performance_promotion_allowed=False,reason='Repeated clock gate failures; no new version ranking'))
        if len(rows)!=expected:continue
        groups={}
        for r in rows:groups.setdefault((r['kind'],r['case'],r['condition']),[]).append(r)
        table=[]
        for (kind,case,label),values in sorted(groups.items()):
            a=sorted(r['elapsed_per_Run_ms'] for r in values);half=len(a)//2
            baselines={b:statistics.median(r['elapsed_per_Run_ms'] for r in groups.get((kind,case,b),[]))
                        for b in ['A','s001'] if (kind,case,b) in groups}
            table.append(dict(campaign=name,kind=kind,case=case,condition=label,N=values[0]['N'],n=len(a),
                median_ms_per_Run=statistics.median(a),mean_ms_per_Run=statistics.mean(a),
                sample_stddev_ms=statistics.stdev(a) if len(a)>1 else None,
                q1_ms=statistics.median(a[:half]) if half else a[0],q3_ms=statistics.median(a[-half:]) if half else a[0],
                iqr_ms=(statistics.median(a[-half:])-statistics.median(a[:half])) if half else 0,
                min_ms=min(a),max_ms=max(a),over_A=statistics.median(a)/baselines['A'] if 'A' in baselines else None,
                over_s001=statistics.median(a)/baselines['s001'] if 's001' in baselines else None,
                timing_status=status,confidence_interval=None))
        write('analysis_'+name+'.csv',table)
        if protocol['stage']=='restore':
            agg=[]
            for label in protocol['labels']:
                values={r['case']:r['over_s001'] for r in table if r['condition']==label}
                for expanded in [False,True]:
                    agg.append(dict(campaign=name,condition=label,denominator='s001',
                         subset='expanded17_14suite' if expanded else 'core16_13suite',
                         point_time_ratio=aggregate(values,expanded),n=1,status=status,CI=None))
            write('analysis_'+name+'.aggregate.csv',agg)
    flat=[];scopes=[]
    for path in sorted((H/'diagnostics').glob('*.01.json')):
        values=load(path)
        if not isinstance(values,list):continue
        for row in values:
            if 'counters' not in row:continue
            c=row['counters'];fusion=c['fusion']
            captured=process_results[row['token']]
            payload_line=next(s for s in captured['stdout'].splitlines()
                              if s.startswith('OCTANE_IC_RESULT:') or s.startswith('TEB_RESULT:'))
            payload=json.loads(payload_line.split(':',1)[1])
            scopes.append(dict(condition=row['condition'],case=row['case'],configured_N=row['N'],
                driver_extra_validation_calls=payload.get('extra_validation_calls',0),scope=row['scope'],
                note='whole process is not only N timed calls; includes Setup and postvalidation'))
            result=dict(condition=row['condition'],case=row['case'],N=row['N'],scope=row['scope'],
                get_field_handler=c['get_field'],get_field_including_fused=c['logical_get_field_including_fusion'],
                get_field2=c['get_field2'],put_field=c['put_field'],put_fast_writable_own=c['put_fast_ordinary'],
                put_new_own_after_slow=c['put_created_after_slow'],put_slow=c['put_slow'],
                ic_queries=c['ic_operations'],ic_hits=c['ic_hits'],ic_fallback=c['ic_fallback'],
                ic_updates=c['ic_updates'],ic_replacements=c['ic_replacements'],ic_retains=c['ic_retains'],ic_releases=c['ic_releases'],
                shape_clones=c['shape_clones'],shape_new=c['shape_new'],shape_inplace_prepare=c['shape_inplace_prepare'],
                shape_shared_prepare=c['shape_shared_prepare'],property_array_growth=c['property_array_growth'],
                fusion_attempts=sum(v['attempts'] for v in fusion),fusion_adjacent=sum(v['adjacent'] for v in fusion),
                successful_fusions=sum(v['hits'] for v in fusion),proto_hits=c['proto_hits'],proto_updates=c['proto_updates'],
                call_dispatch_fusions=c.get('call_fused',0),store_hits=c['store_ic_hits'],store_refreshes=c['store_refreshes'],
                compiled_code_bodies=c['compiled_functions'],loaded_code_bodies=c['loaded_functions'],
                interpreter_entries=c['interpreter_entries'],code_bodies_never_entered=c['functions_never_entered'],
                code_bodies_once=c['functions_entered_once'],code_bodies_twice=c['functions_entered_twice'],code_bodies_hot=c['functions_entered_hot'],
                prepare_calls=c['prepare_calls'],diagnostic_prepare_ns=c['prepare_ns'],
                site_bytes_requested=c['site_bytes_requested'],copied_bytecode_bytes=c['code_copy_bytes'],peak_linked_bytes=c['peak_linked_bytes'],
                live_linked_bytes_after_release=c['live_linked_bytes'],run_boundary_reliable=c['run_boundary_reliable'],
                run_compiled_functions=c['run_compiled_functions'] if c['run_boundary_reliable'] else None,
                run_prepare_calls=c['run_prepare_calls'] if c['run_boundary_reliable'] else None,
                distinct_shapes_per_site=None,per_site_shape_diversity_status='UNKNOWN aggregate counters only')
            assert c['ic_retains']==c['ic_releases'] and c['live_linked_bytes']==0
            assert c['ic_operations']==c['ic_hits']+c['ic_fallback']+c['proto_hits']
            assert sum(c[k] for k in ['functions_never_entered','functions_entered_once','functions_entered_twice','functions_entered_hot'])==c['compiled_functions']+c['loaded_functions']
            flat.append(result)
    write('mechanism_summary.csv',flat)
    write('diagnostic_scope.csv',scopes)
    write('campaign_audit.csv',campaigns)
    new=['B2','ID_CTRL','ID_READ','W1','P1','L1','K1','C1'];ideas=[]
    descriptions={
      'B2':'arg0/loc0 prepared borrowed-load fusion without generic lookahead',
      'ID_CTRL':'64bit layout version control, strong pointer IC unchanged',
      'ID_READ':'runtime-local numeric16B own-data cache, no IC shape edge',
      'W1':'existing writable ordinary-own put_field cache',
      'P1':'only get_field2 one-direct-prototype strong guarded cache',
      'L1':'third safe ordinary entry optional prepare',
      'K1':'c011 update-only ordinary-ABI outlining reproduction on s001',
      'C1':'P1 inherited-data hit plus zero-argument normal call dispatch bypass'}
    for cid in new:
        identity=load(H/'identities'/(cid+'.json'))
        san=H/('sanitizer.'+cid+'.json')
        ideas.append(dict(id=cid,parent=identity.get('parent','s001'),change=descriptions[cid],
            implemented=True,minimal_correctness=load(H/('correctness.'+cid+'.json'))['status'],
            targeted_safety=load(H/('safety.'+cid+'.02.json'))['status'],
            sanitizer=load(san)['status'] if san.exists() else 'NOT_RUN',
            timing_status='BLOCKED_ENVIRONMENT',relative_A=None,relative_s001=None,promoted=False,
            source_patch_sha256=identity['patch_sha256'],binary_sha256=identity['sha256']))
    ideas.extend([
       dict(id='B1_d05',parent='s001',change='frozen d05 restored in independent51-process screen',
            implemented=True,timing_status='COMPLETE_QUARANTINED_ENVIRONMENT',relative_A=None,relative_s001=None,promoted=False),
       dict(id='ID_PACK',parent='ID_READ',implemented=False,timing_status='DEFERRED',change='No timing signal and full acceptance before narrower ID/record changes'),
       dict(id='COMBINATION',implemented=False,timing_status='DEFERRED',change='No independently supported net-benefit combination'),
       dict(id='SHAPE_TRANSITION_OR_VALUE_ABI',implemented=False,timing_status='OUT_OF_MAIN_SCOPE',change='Not attempted')])
    write('ideas.csv',ideas)
    report=dict(status='BLOCKED_PERFORMANCE_MECHANISMS_SAVED',campaigns=campaigns,
        diagnostic_workload_processes=len(flat),planned_new_short=12*12,actual_new_short=0,
        full_rechecks_started=False,formal30_started=False,baseline='s001',promoted=None,
        correctness_diagnostics_not_performance=True,full_test262=False,
        per_site_shape_diversity='UNKNOWN',V8_new_comparison='NOT_RUN',private_JWST_used=False)
    p=H/'analysis_audit.json';data=(json.dumps(report,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==data,'audit mismatch'
    else:p.write_bytes(data)
    print('PORTABLE_ANALYSIS_PASS',len(flat),'diagnostics',sum(c['actual'] for c in campaigns),'saved measurements')


if __name__=='__main__':main()
