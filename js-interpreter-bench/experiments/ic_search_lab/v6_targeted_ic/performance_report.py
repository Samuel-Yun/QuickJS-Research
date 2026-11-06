"""Portable v6 performance report, separate from the quarantined old analysis."""
import argparse
import csv
import datetime
import gzip
import hashlib
import io
import json
import math
from pathlib import Path
import random
import statistics as st

H = Path(__file__).resolve().parent
PARENT = dict(A=None, s001='M', d03='s001', d05='s001', B2='s001', ID_CTRL='s001',
              ID_READ='s001', W1='s001', P1='s001', L1='s001', K1='s001', C1='P1')


def load(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def save_new(path, data):
    if isinstance(data, (dict, list)):
        data = json.dumps(data, ensure_ascii=False, indent=2) + '\n'
    if isinstance(data, str):
        data = data.encode('utf-8')
    path = H / path
    if path.exists():
        assert path.read_bytes() == data, 'Immutable output differs: ' + str(path)
    else:
        with path.open('xb') as stream:
            stream.write(data)


def table(name, rows):
    if not rows:
        return
    out = io.StringIO(newline='')
    writer = csv.DictWriter(out, list(dict.fromkeys(k for r in rows for k in r)), lineterminator='\n')
    writer.writeheader()
    writer.writerows(rows)
    save_new(name, out.getvalue())


def sha(data):
    return hashlib.sha256(data).hexdigest()


def archive(epoch):
    start = load(H / ('load_precheck.' + epoch + '.json'))['started']
    data = b''.join(line for line in (H / 'runs.jsonl').read_bytes().splitlines(True)
                    if json.loads(line).get('timestamp', '') >= start)
    assert data
    raw = [json.loads(s) for s in data.splitlines()]
    assert all(r.get('identity', {}).get('cohort_epoch', epoch) == epoch for r in raw)
    packed = gzip.compress(data, mtime=0)
    name = 'performance_' + epoch + '.runs.jsonl.gz'
    save_new(name, packed)
    save_new('performance_' + epoch + '.archive.json', dict(file=name, sha256=sha(packed),
            decompressed_sha256=sha(data), compressed_bytes=len(packed), events=len(raw),
            no_old_performance_pooling=True))


def gm(values):
    return math.exp(st.mean(math.log(x) for x in values))


def summary(epoch, campaign=None):
    packed=H / ('performance_' + epoch + '.runs.jsonl.gz')
    if packed.exists():
        with gzip.open(packed, 'rt', encoding='utf-8') as stream:
            raw = [json.loads(s) for s in stream]
    else:
        start=load(H / ('load_precheck.' + epoch + '.json'))['started']
        raw=[json.loads(s) for s in (H/'runs.jsonl').read_text(encoding='utf-8').splitlines()]
        raw=[r for r in raw if r.get('timestamp','')>=start]
    results = {r['token']:r for r in raw if r['event'] == 'process_result'}
    allrows = [r for r in raw if r['event'] == 'measurement' and
               (not campaign or r.get('campaign')==campaign)]
    audits = []
    for protocol_path in sorted(H.glob('*.protocol.json')):
        protocol = load(protocol_path)
        if protocol.get('epoch') != epoch:
            continue
        name = protocol['name']
        if campaign and name!=campaign:
            continue
        rows = [r for r in allrows if r['campaign'] == name]
        expected = {(g['kind'],g['case'],c,g['rep']): (pos,g['N']) for g in protocol['order']
                    for pos,c in enumerate(g['conditions'])}
        seen = set()
        groups = {}
        for r in rows:
            key = r['kind'],r['case'],r['condition'],r['rep']
            assert key not in seen and key in expected
            seen.add(key)
            assert (r['order'],r['N']) == expected[key]
            assert r['valid'] and r['elapsed_per_Run_ms'] > 0
            assert r['boot_id'] == r['boot_id_after'] == protocol['boot_id']
            process = results[r['process_token']]
            utc = (datetime.datetime.fromisoformat(process['completed_at']) -
                   datetime.datetime.fromisoformat(process['timestamp'])).total_seconds()
            assert abs(utc-process['wall_time_ms']/1000) <= 1
            identity = load(H / 'identities' / (r['condition']+'.json'))
            assert r['identity']['binary_sha256'] == identity['sha256']
            assert r['elapsed_ms'] <= process['wall_time_ms']+5
            groups.setdefault(key[:3], []).append(r)
        complete = seen == set(expected)
        stop = H / ('STOP.' + epoch + '.json')
        stop_info=load(stop) if stop.exists() else {}
        affected=stop.exists() and name in stop_info.get('affected_campaigns',[name])
        post_identity=H/(name+'.identity_after.json')
        if complete:
            assert load(post_identity)['status']=='PASS'
            assert load(post_identity)['boot_id']==protocol['boot_id']
        audit = dict(campaign=name, expected=len(expected), valid=len(rows), complete=complete,
                     missing=len(set(expected)-seen), duplicates=0, new_STOP=stop.exists(),
                     status='COMPLETE' if complete and not affected else 'PARTIAL_OR_QUARANTINED',
                     performance_promotion_allowed=False)
        audits.append(audit)
        tab = []
        medians = {key:st.median(r['elapsed_per_Run_ms'] for r in rs) for key,rs in groups.items()}
        for (kind,case,label), values in sorted(groups.items()):
            a = sorted(r['elapsed_per_Run_ms'] for r in values)
            half = len(a)//2
            q1 = st.median(a[:half]) if half else a[0]
            q3 = st.median(a[-half:]) if half else a[0]
            parent = PARENT[label]
            own = st.median(a)
            p = medians.get((kind,case,parent))
            a0 = medians.get((kind,case,'A'))
            s0 = medians.get((kind,case,'s001'))
            tab.append(dict(kind=kind, case=case, condition=label, actual_parent=parent,
                N=values[0]['N'], n=len(a), median_ms_per_Run=own, mean_ms_per_Run=st.mean(a),
                sample_stddev_ms=st.stdev(a) if len(a)>1 else None,
                q1_ms=q1,q3_ms=q3,iqr_ms=q3-q1,min_ms=min(a),max_ms=max(a),
                over_parent=own/p if p else None, parent_change_pct=100*(own/p-1) if p else None,
                over_A=own/a0 if a0 else None, over_s001=own/s0 if s0 else None,
                timing_status=audit['status'], point_estimate_only=len(a)==1))
        table(name + '.parent_summary.csv', tab)
        wide=[]
        for kind,case in dict.fromkeys((r['kind'],r['case']) for r in tab):
            row=dict(kind=kind,case=case)
            for label in protocol['labels']:
                found=next((r for r in tab if (r['kind'],r['case'],r['condition'])==(kind,case,label)),None)
                row[label+'_ms_per_Run']=found['median_ms_per_Run'] if found else None
                row[label+'_over_parent']=found['over_parent'] if found else None
            wide.append(row)
        table(name+'.times_and_parent_ratios.csv',wide)
        if not complete or affected or not protocol['full_collection']:
            continue
        intervals=[]
        for (kind,case,label),rs in sorted(groups.items()):
            for denominator in dict.fromkeys(['A','s001',PARENT[label]]):
                if not denominator or denominator not in protocol['labels'] or denominator==label:
                    continue
                left={r['rep']:r['elapsed_per_Run_ms'] for r in rs}
                right={r['rep']:r['elapsed_per_Run_ms'] for r in groups[kind,case,denominator]}
                reps=list(range(protocol['rounds']))
                assert sorted(left)==sorted(right)==reps
                rng=random.Random(2026110706)
                cache={}
                def ratio(indices):
                    key=tuple(sorted(indices))
                    if key not in cache:
                        cache[key]=st.median(left[i] for i in indices)/st.median(right[i] for i in indices)
                    return cache[key]
                distribution=sorted(ratio(rng.choices(reps,k=len(reps))) for _ in range(10000))
                point=ratio(reps)
                lo,hi=distribution[249],distribution[9749]
                intervals.append(dict(kind=kind,case=case,condition=label,denominator=denominator,
                    time_ratio=point,time_change_pct=100*(point-1),ci95_low=lo,ci95_high=hi,
                    direction='unclear' if lo<=1<=hi else ('faster' if hi<1 else 'slower'),
                    bootstrap_draws=10000,paired_process_rounds=len(reps),
                    quantile='nearest rank, sorted sample indices249/9749',
                    interpretation='exploratory, three rounds only; not multiplicity adjusted'))
        table(name+'.paired_intervals.csv',intervals)
        agg=[]
        for label in protocol['labels']:
            for denominator in dict.fromkeys(['A','s001',PARENT[label]]):
                if not denominator or denominator not in protocol['labels'] or denominator==label:
                    continue
                subset_specs = [('SunSpider26', info_cases('sunspider'))] if protocol['stage']=='sunspider' else [
                    ('Octane_core16_13suite',[c for c in info_cases('octane') if c!='zlib.zlib']),
                    ('Octane_expanded17_14suite',info_cases('octane'))]
                for subset,cases in subset_specs:
                    kind=protocol['stage']
                    cached={}
                    def estimate(indices):
                        key=tuple(sorted(indices))
                        if key in cached:
                            return cached[key]
                        ratios={c:st.median([next(r['elapsed_per_Run_ms'] for r in groups[kind,c,label] if r['rep']==i) for i in indices]) /
                                  st.median([next(r['elapsed_per_Run_ms'] for r in groups[kind,c,denominator] if r['rep']==i) for i in indices]) for c in cases}
                        if kind=='sunspider':
                            cached[key]=gm(ratios.values())
                        else:
                            suites={}
                            for c,v in ratios.items(): suites.setdefault(c.split('.')[0],[]).append(v)
                            cached[key]=gm(gm(v) for v in suites.values())
                        return cached[key]
                    rng=random.Random(2026110706)
                    reps=list(range(protocol['rounds']))
                    values=sorted(estimate(rng.choices(reps,k=len(reps))) for _ in range(10000))
                    point=estimate(reps)
                    lo,hi=values[249],values[9749]
                    agg.append(dict(subset=subset,condition=label,denominator=denominator,
                        time_ratio=point,time_change_pct=100*(point-1),ci95_low=lo,ci95_high=hi,
                        rounds=len(reps),bootstrap_draws=10000,unit='whole paired round, all conditions/cases together',
                        direction='unclear' if lo<=1<=hi else ('faster' if hi<1 else 'slower'),
                        interpretation='exploratory, three rounds only; not multiplicity adjusted'))
        table(name+'.aggregate.csv',agg)
    save_new('performance_'+epoch+('.'+campaign if campaign else '')+'.audit.final.json',dict(epoch=epoch,campaigns=audits,
        measurement_records=len(allrows),old_data_pooled=False,internal_clock='CLOCK_MONOTONIC',
        extra_warmup_calls=0,new_candidates=False,no_build=True,no_diagnostic_rerun=True))
    print(json.dumps(audits,ensure_ascii=False,indent=2))


def decode_wsl_failure():
    old=load(H/'wsl_retry.accept01.json')
    stdout=bytes.fromhex(old['stdout_hex']).decode('utf-16-le')
    stderr=bytes.fromhex(old['stderr_hex']).decode('utf-16-le') if old['stderr_hex'] else ''
    save_new('wsl_retry.accept01.decoded.json',dict(source='wsl_retry.accept01.json',
        original_raw_hex_preserved=True,encoding='UTF-16LE',stdout=stdout,stderr=stderr,
        exit_code=old['exit_code'],no_second_retry=True))
    print(stdout)


def info_cases(kind):
    return load(H / (kind+'.inputs.json'))['cases']


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('action',choices=['archive','summary','decode-wsl','finalize'])
    parser.add_argument('--epoch',required=True)
    parser.add_argument('--campaign')
    args=parser.parse_args()
    if args.action=='archive': archive(args.epoch)
    elif args.action=='decode-wsl': decode_wsl_failure()
    elif args.action=='finalize':
        decode_wsl_failure()
        archive(args.epoch)
        summary(args.epoch)
    else: summary(args.epoch,args.campaign)
