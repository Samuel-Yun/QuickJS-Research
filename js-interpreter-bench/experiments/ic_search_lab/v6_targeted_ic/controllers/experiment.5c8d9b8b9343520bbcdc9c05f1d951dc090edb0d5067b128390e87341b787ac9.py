"""Serial, append-only mechanism campaign. Old runners/data are read-only."""
import argparse
import csv
import datetime
import difflib
import gzip
import hashlib
import importlib.util
import itertools
import json
import math
import os
from pathlib import Path
import random
import shutil
import statistics
import subprocess
import sys
import tarfile
import time

H = Path(__file__).resolve().parent
LAB = H.parent
V5 = LAB / 'v5_structural'
sys.path.insert(0, str(LAB))
import lab
import measure
lab.HERE = measure.HERE = H
lab.candidate_metadata_path = lambda cid: H / 'identities' / (cid + '.json')
ORIGINAL_CAPTURE = lab.capture
SEED = 2026110706
EPOCH = os.environ.get('V6_EPOCH', 'initial')
DIAGNOSTIC_ONLY = os.environ.get('V6_DIAGNOSTIC_ONLY') == '1'
assert EPOCH.replace('_','').isalnum()


def epoch_name(stem):
    return stem+'.json' if EPOCH=='initial' else stem+'.'+EPOCH+'.json'


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


seed_module = load_module('v6_frozen_seed', LAB / 'v3_mass_search/generate.py')


def save(name, value):
    lab.save(H / name, value)


def gate():
    if (H / epoch_name('STOP')).exists() and not DIAGNOSTIC_ONLY:
        raise RuntimeError('Explicit saved STOP. New campaign/review required; do not remove STOP.')
    if (H / epoch_name('environment')).exists():
        environment=lab.load(H / epoch_name('environment'))
        assert lab.boot() == environment['boot_id'], 'BOOT_CHANGED'
        if EPOCH!='initial':
            assert environment['prior_STOP_sha256']==lab.sha(H/'STOP.json')
            assert lab.load(H/environment['clock_check'])['status']=='PASS_BOUNDED_CLOCK_CHECK'
    elif EPOCH!='initial':
        raise RuntimeError('Recovery epoch requires an independently saved clock check/environment')


def capture(command, stage, label, timeout=60, identity=None, cwd=None):
    gate()
    if DIAGNOSTIC_ONLY:
        assert stage in ['internal_build','internal_check','counts_build','counts_link','counts_run',
                         'join_semantic_gate','native_inspection','sanitizer_build','sanitizer_run',
                         'build_clean','build','correctness','safety_build','safety_run','upstream_test',
                         'embed_generate','embed_build','embed_run','memory_probe'], 'No performance in diagnostic-only mode'
    identity=dict(identity or {},cohort_epoch=EPOCH,controller_sha256=lab.sha(Path(__file__)))
    r = ORIGINAL_CAPTURE(command, stage, label, timeout, identity, cwd)
    utc = (datetime.datetime.fromisoformat(r['completed_at']) - datetime.datetime.fromisoformat(r['timestamp'])).total_seconds()
    mono = (r['outer_stop_ns'] - r['outer_start_ns']) / 1e9
    if r['boot_id'] != r['boot_id_after'] or abs(utc - mono) > 1:
        failure = dict(status='BLOCKED_ENVIRONMENT', token=r['token'], boot_before=r['boot_id'],
                       boot_after=r['boot_id_after'], utc_seconds=utc, monotonic_seconds=mono,
                       reason='BOOT_OR_CLOCK_DISCONTINUITY', stage=stage)
        if DIAGNOSTIC_ONLY and r['boot_id']==r['boot_id_after']:
            lab.append(dict(event='diagnostic_clock_discontinuity',**failure,
                            semantic_evidence_only=True,timing_not_usable=True))
            print('DIAGNOSTIC_CLOCK_FLAG',stage,label,round(utc-mono,6),flush=True)
        else:
            save(epoch_name('STOP'), failure)
            raise RuntimeError(str(failure))
    return r


lab.capture = capture
lab.execution_gate = gate


def csvout(name, rows):
    if not rows:
        return
    p = H / name
    assert not p.exists(), 'Preserve old output ' + name
    with p.open('x', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, list(dict.fromkeys(k for row in rows for k in row)), lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


def prepare():
    assert not (H / 'environment.json').exists(), 'Do not replace a frozen cohort'
    os.sched_setaffinity(0, {2})
    inventory = subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    for line in inventory.splitlines()[1:]:
        fields = line.split(None, 2)
        if len(fields) > 1:
            assert fields[1] not in ['qjs', 'd8', 'gcc', 'cc1', 'make'] and not fields[1].endswith('.qjs'), line
    for name in ['active', 'artifacts', 'identities', 'patches', 'scripts', 'raw', 'diagnostics']:
        (H / name).mkdir(exist_ok=False)
    old = lab.load(LAB / 'v3_mass_search/workspace.json')['artifacts']
    identities = {k: dict(old[k], id=k) for k in ['A', 'M', 's001']}
    identities.update({k: lab.load(V5 / 'identities' / (k + '.json')) for k in ['d03', 'd04', 'd05']})
    for cid, identity in identities.items():
        assert lab.sha(identity['path']) == identity['sha256'], cid
        assert Path(identity['path']).read_bytes()[:4] == b'\x7fELF', cid
        save('identities/' + cid + '.json', identity)
    save('workspace.json', dict(artifacts=identities, active=str(H/'active'), frozen_A_unchanged=True))
    save('environment.json', dict(timestamp=lab.stamp(), boot_id=lab.boot(), uname=os.uname(),
        compiler=subprocess.check_output(['gcc', '--version'], text=True),
        os_release=Path('/etc/os-release').read_text(), cpuinfo=Path('/proc/cpuinfo').read_text(),
        memory=Path('/proc/meminfo').read_text(), process_inventory=inventory, affinity=[2],
        flags='-O2 -g -fwrapv -DHAVE_CLOSEFROM', power='UNKNOWN', temperature='UNKNOWN', background_isolation='UNKNOWN'))
    for kind in ['octane', 'sunspider']:
        save(kind + '.inputs.json', measure.inputs(kind))
    files = seed_module.seed('s001')
    for n, data in files.items():
        lab.save(H / 'active' / n, data.encode())
    with tarfile.open(LAB / 'v3_mass_search/build_support.tar.gz') as archive:
        lab.save(H/'active/compat/test-closefrom.c', archive.extractfile('compat/test-closefrom.c').read())
    save('seed_identity.json', dict(source_revision='04be246001599f5995fa2f2d8c91a0f198d3f34c',
        parent='s001', source_sha256={n: lab.sha(H/'active'/n) for n in files},
        repository_reference='8e42cc8bb8e69429f6c901ee4282df86659ad5aa', prior_task_active=False,
        old_partial_d05_not_pooled=True))
    save('protocol.json', dict(seed=SEED, mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1', warmup_calls=0,
        serial=True, short_N='prior fixed N / 4, minimum1; Crypto full validated N',
        repeat_N='prior full fixed N, all conditions identical',
        short_cases_octane=['Richards.Richards','DeltaBlue.DeltaBlue','RayTrace.RayTrace','Splay.Splay',
          'CodeLoad.CodeLoadClosure','CodeLoad.CodeLoadJQuery','Typescript.Typescript'],
        short_cases_sunspider=['crypto-sha1','access-nbody','bitops-bitwise-and'],
        maximum_recheck_candidates=3, recheck_rounds=3, bootstrap_draws=10000,
        promotion='mechanism or meaningful gain, complete collections, no unacceptable regression, safety before formal30',
        timer_gate='boot unchanged; UTC versus outer monotonic absolute difference <=1s; internal interval enclosed by outer',
        failures='preserve; no time-based outlier deletion; partial collections have no complete GM'))
    print('PREPARED', lab.boot(), flush=True)


def preflight():
    gate()
    os.sched_setaffinity(0,{2})
    assert not (H/epoch_name('preflight')).exists()
    values = []
    js = ('var t=performance.now(),s=0;for(var i=0;i<4000000;i++)s=(s+i)|0;'
          'var e=performance.now();if(s!==-1526072448||!(e>t))throw Error("probe");'
          'print(JSON.stringify({start:t,stop:e,checksum:s}));')
    for rep in range(3):
        for label in (['s001','d03','d05'] if rep % 2 == 0 else ['d05','d03','s001']):
            art = measure.artifact(label)
            r = capture([art['path'], '-e', js], 'baseline_preflight', label+'.'+str(rep), 20,
                        dict(binary_sha256=art['sha256'], script_sha256=hashlib.sha256(js.encode()).hexdigest()))
            assert r['exit_code'] == 0 and not r['stderr'], r
            d = json.loads(r['stdout'])
            assert 0 < d['stop']-d['start'] <= r['wall_time_ms']+5
            values.append(dict(condition=label, rep=rep, internal_ms=d['stop']-d['start'], outer_ms=r['wall_time_ms'], token=r['token']))
    save(epoch_name('preflight'), dict(status='PASS_BOUNDED_ONLY', boot_id=lab.boot(), values=values,
                               not_a_claim_of_long_term_stability=True))
    print('PREFLIGHT_PASS', len(values), flush=True)


def candidate_files(cid):
    import variants
    return variants.render(cid, seed_module.seed('s001'))


def build(cid):
    gate()
    os.sched_setaffinity(0,{2})
    assert not (H/'identities'/(cid+'.json')).exists(), 'Immutable artifact already exists'
    files = candidate_files(cid)
    parent = seed_module.seed('s001')
    actual={n:lab.sha(H/'active'/n) for n in parent}
    known=[lab.load(H/'seed_identity.json')['source_sha256']]
    known.extend(r['source_sha256'] for r in (lab.load(p) for p in (H/'identities').glob('*.json'))
                 if 'source_sha256' in r)
    assert any(actual==k for k in known), 'Unrecorded active source edit; preserve and stop'
    patch = ''.join(''.join(difflib.unified_diff(parent.get(n,'').splitlines(True), text.splitlines(True),
                   fromfile='a/'+n,tofile='b/'+n)) for n,text in files.items() if text != parent.get(n,''))
    save('patches/'+cid+'.patch',patch)
    for n,text in files.items():
        p=H/'active'/n
        p.write_bytes(text.encode())
    hashes={n:lab.sha(H/'active'/n) for n in files}
    clean=capture(['make','clean'],'build_clean',cid,30,cwd=H/'active')
    assert clean['exit_code']==0
    result=capture(['make','-j1','qjs','qjsc'],'build',cid,300,dict(source_sha256=hashes),H/'active')
    save('raw/build.'+cid+'.json',result)
    assert result['exit_code']==0,result['stderr'][-5000:]
    commands=[s for s in result['stdout'].splitlines() if s.startswith('gcc ')]
    compile_lines=[s for s in commands if ' -c -o .obj/quickjs.o ' in s]
    assert len(compile_lines)==1 and all(v in compile_lines[0] for v in ['-O2','-g','-fwrapv','-DHAVE_CLOSEFROM'])
    assert not any(v in compile_lines[0] for v in ['-O3','-DNDEBUG','-flto','-fprofile'])
    assert hashes=={n:lab.sha(H/'active'/n) for n in files},'source changed during build'
    dest=H/'artifacts'/(cid+'.qjs')
    shutil.copyfile(H/'active/qjs',dest); dest.chmod(0o755)
    qjsc=H/'artifacts'/(cid+'.qjsc')
    shutil.copyfile(H/'active/qjsc',qjsc);qjsc.chmod(0o755)
    ident=dict(id=cid,parent='P1' if cid=='C1' else 's001',patch_base='s001',path=str(dest),sha256=lab.sha(dest),size=dest.stat().st_size,
        source_sha256=hashes,patch_sha256=lab.sha(H/'patches'/(cid+'.patch')),commands=commands,
        compiler=lab.load(H/'environment.json')['compiler'],boot_id=lab.boot(),qjsc_sha256=lab.sha(qjsc))
    save('identities/'+cid+'.json',ident)
    checks=[]
    tests=[(LAB/'checks.js','CHECKS_PASS:7020\n'),(LAB/'v3_mass_search/semantic.js','MASS_SEMANTIC_PASS:9013\n'),
           (LAB/'v4_refine_s001/targeted.js','REFINE_TARGETED_PASS:1941\n'),(V5/'targeted.js','STRUCTURAL_PASS:6019\n'),
           (H/'targeted.js','V6_TARGETED_PASS\n')]
    for test,expected in tests:
        r=capture([dest,test],'correctness',cid+'/'+test.name,45,dict(binary_sha256=ident['sha256'],script_sha256=lab.sha(test)))
        checks.append(dict(test=str(test),pass_=r['exit_code']==0 and r['stdout']==expected and not r['stderr'],token=r['token']))
    save('correctness.'+cid+'.json',dict(status='PASS' if all(r['pass_'] for r in checks) else 'FAIL',checks=checks))
    assert all(r['pass_'] for r in checks),checks
    print('BUILT_CHECKED',cid,ident['sha256'],flush=True)


def campaign(name, labels, stage):
    gate();os.sched_setaffinity(0,{2})
    assert lab.load(H/epoch_name('preflight'))['status']=='PASS_BOUNDED_ONLY'
    assert not (H/(name+'.protocol.json')).exists(),'New campaign name required'
    prior=lab.load(H/'protocol.json')
    kinds=['octane','sunspider'] if stage=='short' else [stage]
    rounds=1 if stage in ['short','restore'] else max(3,min(5,len(labels)))
    if stage=='restore': kinds=['octane']
    nmap={};order=[];rng=random.Random(SEED)
    # Never materialize factorial permutations for a many-condition short screen.
    balanced=list(labels);rng.shuffle(balanced)
    for kind in kinds:
        info=lab.load(H/(kind+'.inputs.json'))
        cases=lab.load(H/'short_plan.json')[kind] if stage=='short' else info['cases']
        for case in cases:
            nmap[kind+'/'+case]=info['N'][case] if stage not in ['short'] or case.startswith('Crypto.') else max(1,info['N'][case]//4)
        for rep in range(rounds):
            shuffled=list(cases);rng.shuffle(shuffled)
            for ix,case in enumerate(shuffled):
                offset=(cases.index(case)+rep)%len(balanced)
                conditions=balanced[offset:]+balanced[:offset]
                if cases.index(case)%2: conditions=list(reversed(conditions))
                order.append(dict(kind=kind,case=case,rep=rep,conditions=conditions,N=nmap[kind+'/'+case]))
    for label in labels:
        if label not in ['A','M','s001','d03','d04','d05']:
            assert lab.load(H/('correctness.'+label+'.json'))['status']=='PASS'
            assert any(lab.load(p)['status']=='PASS_TARGETED_NOT_FULL_TEST262'
                       for p in H.glob('safety.'+label+'.*.json')), 'targeted safety gate required'
            if label in ['B2','ID_CTRL','ID_READ','L1']:
                assert any(lab.load(p)['status']=='PASS' for p in H.glob('internal.'+label+'*.json')), 'internal mechanism gate required'
    save(name+'.protocol.json',dict(name=name,labels=labels,stage=stage,rounds=rounds,order=order,
        boot_id=lab.boot(),mode=prior['mode'],seed=SEED,full_collection=stage!='short',N=nmap,
        epoch=EPOCH,environment_sha256=lab.sha(H/epoch_name('environment'))))
    rows=[]
    for group in order:
        info=lab.load(H/(group['kind']+'.inputs.json'))
        measure.verify(info,labels)
        for pos,label in enumerate(group['conditions']):
            rows.append(measure.invoke(info,'targeted',group['case'],label,group['N'],
                         'v6_'+stage,pos,group['rep'],name))
    save(name+'.completed.json',dict(status='COMPLETE',valid=len(rows),expected=len(order)*len(labels),boot_id=lab.boot()))
    print('COMPLETE',name,len(rows),flush=True)
    summarize(name)


def summarize(name):
    protocol=lab.load(H/(name+'.protocol.json'))
    records=[json.loads(s) for s in (H/'runs.jsonl').read_text(encoding='utf-8').splitlines()]
    rows=[r for r in records if r.get('event')=='measurement' and r.get('campaign')==name]
    expected=sum(len(g['conditions']) for g in protocol['order'])
    assert len(rows)==expected and all(r['valid'] for r in rows),'Incomplete collection, no complete aggregate'
    groups={}
    keys=set()
    for row in rows:
        key=row['kind'],row['case'],row['condition'],row['rep']
        assert key not in keys;keys.add(key)
        groups.setdefault(key[:3],[]).append(row['elapsed_per_Run_ms'])
    summary=[]
    for (kind,case,label),values in groups.items():
        a=sorted(values);half=len(a)//2
        q1=statistics.median(a[:half]) if half else a[0]
        q3=statistics.median(a[-half:]) if half else a[0]
        base=statistics.median(groups[kind,case,'s001']) if 's001' in protocol['labels'] else None
        original=statistics.median(groups[kind,case,'A']) if 'A' in protocol['labels'] else None
        summary.append(dict(kind=kind,case=case,condition=label,n=len(a),median_ms=statistics.median(a),
            mean_ms=statistics.mean(a),stddev_ms=statistics.stdev(a) if len(a)>1 else None,q1_ms=q1,q3_ms=q3,
            iqr_ms=q3-q1,min_ms=min(a),max_ms=max(a),over_s001=statistics.median(a)/base if base else None,
            over_A=statistics.median(a)/original if original else None))
    csvout(name+'.summary.csv',summary)
    print('SUMMARY',name,flush=True)


if __name__=='__main__':
    p=argparse.ArgumentParser();sub=p.add_subparsers(dest='action',required=True)
    for action in ['prepare','preflight']:sub.add_parser(action)
    b=sub.add_parser('build');b.add_argument('id')
    c=sub.add_parser('campaign');c.add_argument('--name',required=True);c.add_argument('--labels',nargs='+',required=True)
    c.add_argument('--stage',choices=['short','restore','octane','sunspider'],required=True)
    s=sub.add_parser('summarize');s.add_argument('name')
    a=p.parse_args()
    if a.action=='prepare':prepare()
    elif a.action=='preflight':preflight()
    elif a.action=='build':build(a.id)
    elif a.action=='campaign':campaign(a.name,a.labels,a.stage)
    else:summarize(a.name)
