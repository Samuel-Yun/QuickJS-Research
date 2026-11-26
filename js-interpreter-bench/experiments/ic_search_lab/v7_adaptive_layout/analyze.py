"""Portable statistics: consumes JSONL and frozen plans, never executes a runtime."""
import argparse
import csv
import gzip
import hashlib
import json
import math
from pathlib import Path
import random
import re
import statistics as st
import sys

H = Path(__file__).resolve().parent
PARENT = dict(A=None, s001='A', P1='s001', IO2_LAYOUT='s001', IO2_DIRECT='IO2_LAYOUT',
              IO4_LAYOUT='s001', IO4_DIRECT='IO4_LAYOUT', AQ1='s001', AP1='s001', ST1='s001', a02='s001')


def write(name, rows):
    with (H / name).open('w', newline='', encoding='utf-8') as stream:
        writer = csv.DictWriter(stream, list(dict.fromkeys(k for row in rows for k in row)))
        writer.writeheader()
        writer.writerows(rows)


def gm(values):
    return math.exp(st.mean(math.log(v) for v in values))


def archived_data():
    initial=json.loads((H/'raw/archive.json').read_text())
    parts=[(0,H/'raw'/initial['file'],initial)]
    for meta in (H/'raw').glob('archive.*.json'):
        row=json.loads(meta.read_text())
        parts.append((row['uncompressed_offset'],H/'raw'/row['file'],row))
    output=b''
    for offset,path,meta in sorted(parts,key=lambda part:part[0]):
        assert offset==len(output),'Archive coverage gap/overlap'
        packed=path.read_bytes()
        assert hashlib.sha256(packed).hexdigest()==meta['compressed_sha256'],str(path)+' compressed SHA'
        payload=gzip.decompress(packed)
        assert hashlib.sha256(payload).hexdigest()==meta['uncompressed_sha256'],str(path)+' uncompressed SHA'
        output+=payload
    return output


def analyze(use_archive=False):
    source=H/'runs.jsonl'
    text=source.read_text(encoding='utf-8') if source.exists() and not use_archive else archived_data().decode()
    raw = [json.loads(s) for s in text.splitlines()]
    processes={row['token']:row for row in raw if row['event']=='process_result'}
    clock_warnings={row['token'] for row in raw if row['event']=='limited_clock_observation' and row['warning']}
    data = [r for r in raw if r['event'] == 'measurement' and not r['campaign'].startswith('precheck')]
    table, aggregate, audits = [], [], []
    for path in sorted(H.glob('protocol.*.json')):
        plan = json.loads(path.read_text())
        campaign = plan['name']
        rows = [r for r in data if r['campaign'] == campaign]
        expected = {(g['kind'], g['case'], label, g['rep']): (position, g['N']) for g in plan['order']
                    for position, label in enumerate(g['conditions'])}
        seen = set()
        valid_seen=set()
        script_hashes={}
        groups = {}
        for r in rows:
            key = r['kind'], r['case'], r['condition'], r['rep']
            assert key in expected and key not in seen
            assert (r['order'], r['N']) == expected[key]
            assert r['boot_id'] == r['boot_id_after'] == plan['boot_id']
            assert r['identity']['binary_sha256'] == plan['artifacts'][r['condition']]['sha256']
            process=processes[r['process_token']]
            command=process['command'];flags=r['identity']['flags']
            assert command[0]==plan['artifacts'][r['condition']]['path']
            assert command[1:-1]==flags
            assert not flags if r['case']!='zlib.zlib' else flags[:2]==['--std','-I'] and flags[2].endswith('/inputs/zlib_read.js')
            frozen_inputs=json.loads((H/(r['kind']+'.inputs.json')).read_text())
            assert r['identity']['input_sha256']==frozen_inputs['files']
            script_hashes.setdefault((r['kind'],r['case']),set()).add(r['identity']['script_sha256'])
            seen.add(key)
            if r['valid'] and r['elapsed_per_Run_ms'] > 0:
                assert process['exit_code']==0 and not process['stderr']
                assert r['payload']['correctness']=='PASS' and r['payload']['warmup_calls']==0
                assert 0<r['elapsed_ms']<=process['wall_time_ms']+5
                valid_seen.add(key)
                groups.setdefault(key[:3], []).append(r)
        assert all(len(values)==1 for values in script_hashes.values()),'Workload differs across conditions/rounds'
        completed_reps = [rep for rep in range(plan['rounds']) if
                          all(k in valid_seen for k in expected if k[3] == rep)]
        quarantined = (H/'STOP.json').exists() and plan.get('epoch','initial')=='initial'
        audit = dict(campaign=campaign, expected=len(expected), records=len(rows),
                     valid=sum(len(v) for v in groups.values()), complete_rounds=completed_reps,
                     first_round_expected=sum(k[3]==0 for k in expected),
                     first_round_records=sum(k[3]==0 for k in seen),
                     missing=len(expected)-len(seen), usable_for_promotion=not quarantined and plan.get('timing_quality')!='EXPLORATORY_CLOCK_LIMITED',
                     exploratory_selection_allowed=not quarantined,
                     status='QUARANTINED_ENVIRONMENT' if quarantined else ('COMPLETE' if len(seen)==len(expected) else 'PARTIAL'))
        audit['timing_quality']=plan.get('timing_quality','STRICT_GATE')
        audit['clock_warning_samples']=sum(row['process_token'] in clock_warnings for row in rows)
        audit['failed_measurements']=len(seen)-len(valid_seen)
        audit['unconverted_process_results']=sum(p.get('identity',{}).get('campaign')==campaign and p['token'] not in {row['process_token'] for row in rows} for p in processes.values())
        audit['command_flags_inputs_scripts_identity_checks']='PASS'
        audit['reliable_speedup_claim_allowed']=not quarantined and plan.get('timing_quality')!='EXPLORATORY_CLOCK_LIMITED'
        audits.append(audit)
        med = {key: st.median(r['elapsed_per_Run_ms'] for r in rs) for key, rs in groups.items()}
        for (kind, case, label), rs in sorted(groups.items()):
            values = sorted(r['elapsed_per_Run_ms'] for r in rs)
            n, own = len(values), st.median(values)
            half = n//2
            q1 = st.median(values[:half]) if half else values[0]
            q3 = st.median(values[-half:]) if half else values[0]
            row = dict(campaign=campaign, benchmark=kind, case=case, condition=label,
                       parent=PARENT[label], rounds=n, N=rs[0]['N'], median_ms_per_Run=own,
                       mean_ms_per_Run=st.mean(values), sample_stddev=st.stdev(values) if n>1 else None,
                       q1=q1, q3=q3, IQR=q3-q1, min=min(values), max=max(values),
                       per_round_ms=json.dumps({r['rep']:r['elapsed_per_Run_ms'] for r in rs}),
                       campaign_status=audit['status'],timing_quality=audit['timing_quality'])
            references=[('A','A'),('s001','s001'),('parent',PARENT[label])]
            if label=='AP1' and 'a02' in plan['labels']: references.append(('a02','a02'))
            for name, denominator in references:
                other = med.get((kind,case,denominator))
                row['over_'+name] = own/other if other else None
                row['change_pct_'+name] = 100*(own/other-1) if other else None
                if n>=3 and denominator and (kind,case,denominator) in groups:
                    left={r['rep']:r['elapsed_per_Run_ms'] for r in rs}
                    right={r['rep']:r['elapsed_per_Run_ms'] for r in groups[kind,case,denominator]}
                    reps=sorted(left.keys() & right.keys())
                    rng=random.Random(2026110707);cache={}
                    def ratio(indices):
                        key=tuple(sorted(indices))
                        if key not in cache:
                            cache[key]=st.median(left[i] for i in indices)/st.median(right[i] for i in indices)
                        return cache[key]
                    dist=sorted(ratio(rng.choices(reps,k=len(reps))) for _ in range(10000))
                    row['ci95_low_'+name],row['ci95_high_'+name]=dist[249],dist[9749]
            table.append(row)
        for kind,case,label in sorted({k[:3] for k in expected}-set(groups)):
            table.append(dict(campaign=campaign,benchmark=kind,case=case,condition=label,parent=PARENT[label],
                rounds=0,N=next(g['N'] for g in plan['order'] if (g['kind'],g['case'])==(kind,case)),
                median_ms_per_Run=None,campaign_status=audit['status'],missing='NOT_MEASURED'))
        if not completed_reps or quarantined:
            continue
        # Only complete common rounds may contribute to aggregate estimates.
        for label in plan['labels']:
            references=['A','s001',PARENT[label]]
            if label=='AP1' and 'a02' in plan['labels']: references.append('a02')
            for denominator in dict.fromkeys(references):
                if denominator not in plan['labels'] or label == denominator:
                    continue
                for kind, subset in [('octane','core16_13suite'),('octane','expanded17_14suite'),('sunspider','26cases')]:
                    cases = json.loads((H/(kind+'.inputs.json')).read_text())['cases']
                    if subset.startswith('core'):
                        cases = [c for c in cases if c!='zlib.zlib']
                    cache = {}
                    def estimate(indices):
                        key = tuple(sorted(indices))
                        if key in cache:
                            return cache[key]
                        ratios = {}
                        for case in cases:
                            lr = {r['rep']:r['elapsed_per_Run_ms'] for r in groups[kind,case,label]}
                            rr = {r['rep']:r['elapsed_per_Run_ms'] for r in groups[kind,case,denominator]}
                            ratios[case] = st.median(lr[i] for i in indices)/st.median(rr[i] for i in indices)
                        if kind=='octane':
                            suites = {}
                            for c,v in ratios.items(): suites.setdefault(c.split('.')[0],[]).append(v)
                            result = gm(gm(v) for v in suites.values())
                        else:
                            result = gm(ratios.values())
                        cache[key] = result
                        return result
                    point = estimate(completed_reps)
                    lo = hi = None
                    if len(completed_reps)>=3:
                        rng = random.Random(2026110707)
                        dist = sorted(estimate(rng.choices(completed_reps,k=len(completed_reps))) for _ in range(10000))
                        lo,hi=dist[249],dist[9749]
                    aggregate.append(dict(campaign=campaign, benchmark=kind, subset=subset, condition=label,
                         denominator=denominator, rounds=len(completed_reps), time_ratio=point,
                         change_pct=100*(point-1), ci95_low=lo,ci95_high=hi,
                         timing_quality=audit['timing_quality'],
                         interpretation='point estimate' if lo is None else 'exploratory paired whole-round bootstrap; does not include clock error'))
        print(json.dumps(audit), flush=True)
        print(json.dumps([a for a in aggregate if a['campaign']==campaign],ensure_ascii=False),flush=True)
    for kind in ['octane','sunspider']:
        write('comparison_'+kind+'.csv',[r for r in table if r['benchmark']==kind])
    if aggregate: write('aggregate.csv',aggregate)
    (H/'audit.json').write_text(json.dumps(audits,indent=2)+'\n')
    candidate_rows=[]
    for label in ['P1','IO2_LAYOUT','IO2_DIRECT','IO4_LAYOUT','IO4_DIRECT','AQ1','AP1','ST1']:
        relevant=[a for a in audits if label in json.loads((H/('protocol.'+a['campaign']+'.json')).read_text())['labels']]
        if label=='P1': relevant=[a for a in relevant if a['campaign'].startswith('p1_explore')]
        else: relevant=[a for a in relevant if any(a['campaign'].startswith(prefix+label+'_') for prefix in ['screen_','recheck_','independent_'])]
        identity=H/'identities'/(label+'.json')
        correct=H/('correctness.'+label+'.json');safe=H/('sanitizer.'+label+'.json')
        internals=[x for x in raw if x['event']=='process_result' and x.get('label')==label+'/internal']
        layout=re.search(r'LAYOUT object=(\d+) property=(\d+) site=(\d+) function=(\d+)',internals[-1]['stdout']) if internals else None
        oom_path=H/'oom_followup.explore01.json'
        oom_checks=[x for x in json.loads(oom_path.read_text())['checks'] if x['label']==label] if oom_path.exists() else []
        candidate_rows.append(dict(id=label,parent=PARENT[label],built=identity.exists(),
            correctness=json.loads(correct.read_text())['status'] if correct.exists() else ('PRIOR_FROZEN' if label=='P1' else 'NOT_RUN'),
            sanitizer=json.loads(safe.read_text())['status'] if safe.exists() else ('PRIOR_FROZEN' if label=='P1' else 'NOT_RUN'),
            measurements=sum(a['records'] for a in relevant),complete_rounds=sum(len(a['complete_rounds']) for a in relevant),
            candidate_measurements=sum(x['condition']==label and x['campaign'] in {a['campaign'] for a in relevant} for x in data),
            timing_quality='EXPLORATORY_CLOCK_LIMITED',
            site_bytes=int(layout[3]) if layout else None,object_header_bytes=int(layout[1]) if layout else None,
            tail_bytes=32 if label.startswith('IO2') else (64 if label.startswith('IO4') else 0),
            artifact_sha256=json.loads(identity.read_text())['sha256'] if identity.exists() else None,
            revised_oom_pressure_passes=sum(x['pass_'] for x in oom_checks),
            revised_oom_pressure_checks=len(oom_checks),
            oom_qualification='PRIOR_FROZEN_NOT_RETESTED' if label=='P1' else ('LIMITED_SHARED_BASELINE_FAILURE_NOT_FULL_ACCEPTANCE' if oom_path.exists() else 'NOT_COMPLETED'),
            status='MEASURED' if relevant and any(a['complete_rounds'] for a in relevant) else ('BUILT_NOT_MEASURED' if identity.exists() else 'NOT_BUILT'),
            decision='No reliable small-speedup claim; clock-limited exploratory data'))
    write('candidates.csv',candidate_rows)
    # Compact readable first-round table, sourced from actual rep0 rather than a future median.
    first=[row for row in data if row['campaign']=='p1_explore01' and row['rep']==0 and row['valid']]
    if len(first)==129:
        lines=['# A/s001/P1 独立首轮：129/129条（计时可靠性受限）',
               '', '单位ms/完整Run；首次Run包含，无额外预跑。一轮点估计，不确认小幅收益。', '',
               '| benchmark / case | A | s001 | P1 | P1/s001 |','|---|---:|---:|---:|---:|']
        for kind in ['octane','sunspider']:
            for case in json.loads((H/(kind+'.inputs.json')).read_text())['cases']:
                values={row['condition']:row['elapsed_per_Run_ms'] for row in first if (row['kind'],row['case'])==(kind,case)}
                lines.append('| '+kind+' / '+case+' | '+' | '.join(f'{values[c]:.5f}' for c in ['A','s001','P1'])+f" | {values['P1']/values['s001']:.5f} |")
        (H/'first_round.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
    # Explicit live-development request, ONLY at the serial pipeline's idle boundary.
    # Standalone/offline analysis never imports a runtime or executes this hook.
    request=H/'refresh_generator.request.json'
    done=H/'refresh_generator.completed.json'
    if __name__=='v7_pipeline_analysis' and request.exists() and not done.exists():
        owner=sys.modules.get('builder')
        assert owner is not None
        owner.variants=owner.e.load_module('v7_refreshed_variants',H/'variants.py')
        record=dict(event='generator_refreshed_at_idle_boundary',
                    sha256=owner.e.lab.sha(H/'variants.py'),active_source_not_modified=True,
                    prior_artifacts_unchanged=True)
        owner.e.lab.append(record)
        done.write_text(json.dumps(record,indent=2)+'\n')


if __name__ == '__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--archive',action='store_true')
    parser.add_argument('--use-archive',action='store_true')
    parser.add_argument('--archive-name',default='initial')
    args=parser.parse_args()
    if args.archive:
        data=(H/'runs.jsonl').read_bytes()
        name=args.archive_name
        assert name.replace('_','').isalnum()
        offset=0 if name=='initial' else len(archived_data())
        if offset:
            assert data[:offset]==archived_data(),'Earlier immutable raw changed'
        data=data[offset:]
        assert data,'No new records to archive'
        packed=gzip.compress(data,mtime=0)
        target=H/'raw'/(name+'.runs.jsonl.gz')
        assert not target.exists(),'Preserve immutable raw archive'
        target.write_bytes(packed)
        manifest=H/'raw'/('archive.json' if name=='initial' else 'archive.'+name+'.json')
        manifest.write_text(json.dumps(dict(file=target.name,uncompressed_offset=offset,
            compressed_sha256=hashlib.sha256(packed).hexdigest(),
            uncompressed_sha256=hashlib.sha256(data).hexdigest(),
            compressed_bytes=len(packed),uncompressed_bytes=len(data),
            restore='gzip -dc raw/'+target.name+' > restored_'+name+'.jsonl'),indent=2)+'\n')
    analyze(args.use_archive)
