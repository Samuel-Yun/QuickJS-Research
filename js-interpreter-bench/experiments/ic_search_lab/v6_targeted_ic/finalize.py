"""Seal public records, verify source/artifact identity, never launch a VM."""
import difflib
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import experiment as e
from variants import patch_apply


def actual_path(value):
    if os.name=='nt':
        match=re.match(r'^/mnt/([a-z])/(.*)',value)
        if match:return Path(match[1].upper()+':/'+match[2])
    return Path(value)


def main():
    artifacts=[];reconstruction=[]
    ids=['A','M','s001','d03','d04','d05','B2','ID_CTRL','ID_READ','W1','P1','L1','K1','C1']
    base=e.seed_module.seed('s001')
    for cid in ids:
        a=e.lab.load(e.H/'identities'/(cid+'.json'))
        path=actual_path(a['path']);actual=e.lab.sha(path)
        assert actual==a['sha256'],cid
        assert path.read_bytes()[:4]==b'\x7fELF',cid
        data=path.read_bytes()
        assert b'V6_COUNTERS:' not in data and b'__asan_init' not in data and b'__ubsan_handle_' not in data,cid
        artifacts.append(dict(id=cid,path=a['path'],sha256=actual,size=path.stat().st_size,
            parent=a.get('parent'),identity='identities/'+cid+'.json',release_not_diagnostic=True))
        if cid in ['B2','ID_CTRL','ID_READ','W1','P1','L1','K1','C1']:
            patch=(e.H/'patches'/(cid+'.patch')).read_bytes()
            assert hashlib.sha256(patch).hexdigest()==a['patch_sha256']
            files=patch_apply(base,patch.decode())
            assert {n:hashlib.sha256(v.encode()).hexdigest() for n,v in files.items()}==a['source_sha256'],cid
            reconstruction.append(dict(id=cid,status='PASS',files=len(files),patch_sha256=a['patch_sha256']))
    for parent,child in [('ID_CTRL','ID_READ'),('P1','C1')]:
        old=e.candidate_files(parent);new=e.candidate_files(child)
        patch=''.join(''.join(difflib.unified_diff(old[n].splitlines(True),new[n].splitlines(True),
            fromfile='a/'+n,tofile='b/'+n)) for n in old if old[n]!=new[n])
        e.save('patches/'+parent+'_to_'+child+'.patch',patch)
    histories=[]
    expected={
      'v3_mass_search':'9b629101511019852f815cee15a93d7d84f5016f7c449cc1d297109129a0699d',
      'v4_refine_s001':'021a2819a8962055906bde6913da52d33a6c940022dedff1b7a134dd32331eea',
      'v5_structural':'7451a0609a1340d7fa5995d05bafa820dea30f653cb979720e14118e78750ed9'}
    for folder,digest in expected.items():
        p=e.LAB/folder/'runs.jsonl'
        if p.exists():
            h=e.lab.sha(p);assert h==digest,folder
            histories.append(dict(name=folder,status='UNCHANGED',raw_sha256=h))
        else:histories.append(dict(name=folder,status='MISSING_LOCAL_RAW',expected_sha256=digest))
    active={n:e.lab.sha(e.H/'active'/n) for n in base}
    c1=e.lab.load(e.H/'identities/C1.json')
    assert active==c1['source_sha256'],'Unexpected active source change'
    active_exe=e.H/'active/qjs'
    e.save('active_status.json',dict(source_candidate='C1',source_sha256=active,
        executable_sha256=e.lab.sha(active_exe),executable_kind='ASan+UBSan C1, NOT performance artifact',
        baseline='s001',promoted=False,performance_must_use_frozen_identity_paths=True))
    e.save('manifest.json',dict(status='BLOCKED_PERFORMANCE_ENVIRONMENT',source_revision='04be246001599f5995fa2f2d8c91a0f198d3f34c',
        version='QuickJS2026-06-04',repository_reference='8e42cc8bb8e69429f6c901ee4282df86659ad5aa',
        platform='WSL2 Ubuntu24.04.2 x86_64',compiler=e.lab.load(e.H/'environment.json')['compiler'],
        build_flags='-O2 -g -fwrapv -DHAVE_CLOSEFROM; no NDEBUG/LTO/PGO',
        runtime_flags='No extra flags except frozen zlib --std/-I adapter',artifacts=artifacts,
        environments=['environment.json','environment.recovery01.json'],
        failed_final_clock_check='clock_check.recovery02.json',contract='execution_contract.json',
        main_timing='UNKNOWN for all new candidates',formal30=False,baseline='s001',promoted=None,
        private_source_used=False,new_V8_comparison=False))
    e.save('reconstruction_audit.json',dict(status='PASS',candidates=reconstruction,old_raw=histories))
    raw=(e.H/'runs.jsonl').read_bytes();compressed=gzip.compress(raw,mtime=0)
    e.save('runs.jsonl.gz',compressed)
    assert gzip.decompress((e.H/'runs.jsonl.gz').read_bytes())==raw
    e.save('raw_archive.json',dict(raw='runs.jsonl',archive='runs.jsonl.gz',
        raw_sha256=hashlib.sha256(raw).hexdigest(),archive_sha256=hashlib.sha256(compressed).hexdigest(),
        raw_bytes=len(raw),archive_bytes=len(compressed),records=len(raw.splitlines()),
        restore='gzip -dc runs.jsonl.gz > NEW_OUTPUT.jsonl',
        license='Own experiment records; upstream/benchmark licenses remain with fixed sources; no private JWST material'))
    records=[json.loads(s) for s in raw.splitlines()]
    process_results=[r for r in records if r.get('event')=='process_result']
    measurements=[r for r in records if r.get('event')=='measurement']
    assert len(measurements)==51 and all(r['campaign']=='restore_d05_01' for r in measurements)
    assert not any(r.get('stage') in ['v6_short','v6_octane','v6_sunspider'] for r in process_results)
    san=e.lab.load(e.H/'sanitizer_summary.json')
    assert len(san)==6 and all(r['status']=='PASS_TARGETED_ASAN_UBSAN' for r in san)
    assert all(len(r['tests'])==10 and all(t['pass_'] for t in r['tests']) for r in san)
    # Preserve the exact counter source too. Before C1, the only renderer delta
    # was the subsequently added call_fused field/report. Require all32 hashes.
    import counts
    diagnostic_recovery=[]
    for identity_path in sorted((e.H/'diagnostics').glob('*.01.identity.json')):
        identity=e.lab.load(identity_path);cid=identity['parent']
        generated=counts.instrument(cid)
        expected_hash=identity['diagnostic_source_sha256']
        hashes=lambda f:{n:hashlib.sha256(t.encode()).hexdigest() for n,t in f.items()}
        if hashes(generated)!=expected_hash:
            text=generated['quickjs.c']
            text=text.replace('    unsigned long long call_fused;\n','')
            lines=text.splitlines(True)
            text=''.join(s for s in lines if not ('fprintf(stderr,' in s and '\\"call_fused\\"' in s))
            generated['quickjs.c']=text
        assert hashes(generated)==expected_hash,'Cannot reconstruct original diagnostic '+cid
        parent=counts.original(cid)
        patch=''.join(''.join(difflib.unified_diff(parent[n].splitlines(True),generated[n].splitlines(True),
            fromfile='a/'+n,tofile='b/'+n)) for n in parent if parent[n]!=generated[n])
        name='patches/counts.'+cid+'.01.patch';e.save(name,patch)
        diagnostic_recovery.append(dict(id=cid,source_files=32,status='PASS_ALL_SOURCE_SHA256',
            diagnostic_patch=name,patch_sha256=e.lab.sha(e.H/name),binary_sha256=identity['binary_sha256']))
    e.save('diagnostic_source_audit.json',diagnostic_recovery)
    for name in ['experiment.py','variants.py','counts.py','analyze.py','safety.py']:
        p=e.H/name;digest=e.lab.sha(p)
        e.save('controllers/'+name[:-3]+'.'+digest+'.py',p.read_bytes())
    old_controllers=sorted({(r.get('identity') or {}).get('controller_sha256')
                            for r in process_results if (r.get('identity') or {}).get('controller_sha256')})
    current=e.lab.sha(e.H/'experiment.py')
    e.save('controller_history_limitations.json',dict(current_sha256=current,current_snapshot_saved=True,
        earlier_hashes=old_controllers,earlier_snapshot_status='NOT_ALL_SAVED',
        limitation='Old exploratory Python controller snapshots are not all available. VM/diagnostic sources are exactly hash-reconstructed; raw statistics are portable. Future performance must freeze controllers before first sample.'))
    e.save('delivery_audit.json',dict(status='PASS_IDENTITY_SOURCE_AND_SAVED_DATA__PERFORMANCE_BLOCKED',
        frozen_release_artifacts=len(artifacts),source_reconstructions=len(reconstruction),
        diagnostic_workloads=84,independent_RSS_processes=63,sanitized_candidates=6,sanitizer_checks=60,
        numeric_valid_saved_screen=51,screen_usable_for_promotion=False,
        new_short_actual=0,new_short_planned=144,full_rechecks_started=False,formal30_started=False,
        all_old_raw_unchanged=all(r['status']=='UNCHANGED' for r in histories),
        immutable_A_unchanged=True,baseline='s001',promoted=None,
        missing='Reliable timing; full test262; per-site complete shape diversity; dynamic spill attribution',
        no_commit_push=True))
    print('FINAL_IDENTITY_AND_SOURCE_PASS',len(artifacts),len(reconstruction),'RAW_ARCHIVED',len(compressed),flush=True)


if __name__=='__main__':main()
