"""Independent raw-data audit. --check-files additionally checks local identities."""
import argparse
import csv
import datetime as dt
import gzip
import hashlib
import json
import math
from pathlib import Path
import statistics as st

H=Path(__file__).resolve().parent
ROOT=H.parents[2]


def load(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def mapped(path):
    if path.startswith('/mnt/c/'):
        return Path('C:/'+path[len('/mnt/c/'):])
    return Path(path)


def audit(check_files=False):
    plans=[('accept01','short_accept01'),('accept01','full_accept01_octane'),
           ('accept02','full_accept02_sunspider')]
    archives={}
    hashes={}
    summaries=[]
    for epoch,name in plans:
        if epoch not in archives:
            meta=load(H/('performance_'+epoch+'.archive.json'))
            assert sha(H/meta['file'])==meta['sha256']
            plain=gzip.decompress((H/meta['file']).read_bytes())
            assert hashlib.sha256(plain).hexdigest()==meta['decompressed_sha256']
            archives[epoch]=[json.loads(line) for line in plain.splitlines()]
        raw=archives[epoch]
        starts={v['token']:v for v in raw if v['event']=='process_start'}
        procs={v['token']:v for v in raw if v['event']=='process_result'}
        rows=[v for v in raw if v['event']=='measurement' and v['campaign']==name]
        p=load(H/(name+'.protocol.json'))
        expected={(g['kind'],g['case'],c,g['rep']):(i,g['N']) for g in p['order']
                  for i,c in enumerate(g['conditions'])}
        observed={}
        scripts={}
        groups={}
        for row in rows:
            key=row['kind'],row['case'],row['condition'],row['rep']
            assert key not in observed and key in expected
            observed[key]=row
            assert (row['order'],row['N'])==expected[key]
            token=row['process_token']
            proc=procs[token]
            start=starts[token]
            assert proc['command']==start['command']
            assert proc['exit_code']==0 and not proc['stderr'] and not proc['timeout']
            assert row['valid'] and row['elapsed_ms']>0
            assert row['mode']=='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1'
            assert row['elapsed_ms']/row['N']==row['elapsed_per_Run_ms']
            assert row['elapsed_ms']<=proc['wall_time_ms']+5
            assert row['boot_id']==row['boot_id_after']==proc['boot_id']==proc['boot_id_after']==p['boot_id']
            utc=(dt.datetime.fromisoformat(proc['completed_at'])-dt.datetime.fromisoformat(proc['timestamp'])).total_seconds()
            assert abs(utc-proc['wall_time_ms']/1000)<=1
            identity=load(H/'identities'/(row['condition']+'.json'))
            assert row['identity']['binary_sha256']==proc['identity']['binary_sha256']==identity['sha256']
            assert proc['command'][0]==identity['path']
            assert row['identity']['warmup_calls']==0 and row['payload']['warmup_calls']==0
            assert row['payload']['correctness']=='PASS' and row['payload']['N']==row['N']
            assert row['payload']['case']==row['case']
            assert proc['command'][-1].endswith('.js')
            flags=proc['command'][1:-1]
            if row['case']=='zlib.zlib':
                assert flags[:2]==['--std','-I'] and flags[2].endswith('/inputs/zlib_read.js')
            else:
                assert flags==[]
            script_key=row['kind'],row['case'],row['N']
            scripts.setdefault(script_key,set()).add(row['identity']['script_sha256'])
            assert row['identity']['script_sha256']==proc['identity']['script_sha256']
            info=load(H/(row['kind']+'.inputs.json'))
            assert row['identity']['input_sha256']==info['files']
            if row['kind']=='sunspider':
                assert row['checksum'] in info['contract']['allowed'][row['case']]
            if check_files:
                targets=[(mapped(identity['path']),identity['sha256']),
                         (mapped(proc['command'][-1]),row['identity']['script_sha256'])]
                targets.extend((ROOT/path,digest) for path,digest in info['files'].items())
                for path,digest in targets:
                    if str(path) not in hashes:
                        hashes[str(path)]=sha(path)
                    assert hashes[str(path)]==digest,str(path)
            groups.setdefault((row['case'],row['condition']),[]).append(row['elapsed_per_Run_ms'])
        assert set(observed)==set(expected)
        assert all(len(s)==1 for s in scripts.values()),'Different JS scripts between conditions'
        assert load(H/(name+'.identity_after.json'))['boot_id']==p['boot_id']
        assert all(len(v)==p['rounds'] for v in groups.values())
        aggregates=0
        if p['full_collection']:
            with (H/(name+'.aggregate.csv')).open(encoding='utf-8',newline='') as f:
                published=list(csv.DictReader(f))
            for value in published:
                cases=load(H/(p['stage']+'.inputs.json'))['cases']
                if value['subset']=='Octane_core16_13suite':
                    cases=[c for c in cases if c!='zlib.zlib']
                ratios={c:st.median(groups[c,value['condition']])/st.median(groups[c,value['denominator']]) for c in cases}
                if p['stage']=='sunspider':
                    result=math.exp(sum(math.log(v) for v in ratios.values())/len(ratios))
                else:
                    suites={}
                    for c,v in ratios.items():
                        suites.setdefault(c.split('.')[0],[]).append(math.log(v))
                    result=math.exp(sum(sum(v)/len(v) for v in suites.values())/len(suites))
                assert math.isclose(result,float(value['time_ratio']),rel_tol=1e-12)
                aggregates+=1
        summaries.append(dict(campaign=name,valid=len(rows),expected=len(expected),boot_id=p['boot_id'],
            all_positions_unique_and_complete=True,groups=len(groups),per_group=p['rounds'],
            same_JS_all_conditions=True,commands_flags_clocks_correctness_pass=True,
            independent_aggregate_checks=aggregates))
    assert sum(v['valid'] for v in summaries)==789
    out=dict(status='PASS_COMPLETE_RECHECK_DATA',campaigns=summaries,
             accepted_records=789,old_partial_excluded=2,local_file_checks=check_files,
             unique_files_checked=len(hashes),no_cross_boot_pairing=True,new_performance_executed=False)
    path=H/('independent_audit.complete.files.json' if check_files else 'independent_audit.complete.json')
    data=(json.dumps(out,ensure_ascii=False,indent=2)+'\n').encode()
    if path.exists():
        assert path.read_bytes()==data
    else:
        path.write_bytes(data)
    print(json.dumps(out,ensure_ascii=True,indent=2))


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--check-files',action='store_true')
    audit(parser.parse_args().check_files)
