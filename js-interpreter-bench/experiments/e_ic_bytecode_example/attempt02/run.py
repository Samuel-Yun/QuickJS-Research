"""Tiny delayed-feedback diagnostic in existing Ubuntu WSL; not a benchmark."""
import csv
import hashlib
import io
import json
import os
import platform
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
MAIN = ROOT / 'experiments/v8_inspired_ic/attempt03'


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def save(p, v):
    p.parent.mkdir(parents=True, exist_ok=True)
    with p.open('x', encoding='utf-8') as f:
        f.write(v if isinstance(v, str) else json.dumps(v, indent=2, ensure_ascii=False)+'\n')


def capture(name, command, env=None):
    path = HERE / 'raw' / (name+'.json')
    if path.exists():
        return json.loads(path.read_text())
    r = subprocess.run(command, capture_output=True, text=True, env=env, cwd=HERE, timeout=90)
    result = dict(command=list(map(str, command)), exit_code=r.returncode, stdout=r.stdout, stderr=r.stderr)
    save(path, result)
    return result


def main():
    assert platform.machine() == 'x86_64'
    runtime = json.loads((MAIN/'campaign_runtime.json').read_text())
    diagnostic = json.loads((MAIN/'diagnostic_manifest.json').read_text())
    artifacts = dict(release=runtime['artifacts']['E'],
                     diagnostic=dict(path=diagnostic['binary'], sha256=diagnostic['sha256']))
    for a in artifacts.values():
        assert sha(a['path']) == a['sha256']
    for label, a in artifacts.items():
        src = Path(a['path']).parent
        expected = runtime['E_build']['modified_source_hashes'] if label == 'release' else diagnostic['source_changes']
        for name in ['quickjs.c', 'eic_runtime.inc', 'eic_opcodes.inc', 'eic_prepare.inc', 'eic_types.h']:
            assert sha(src/name) == expected[name], str(src/name)
    manifest = HERE/'manifest.json'
    if not manifest.exists():
        save(manifest, dict(artifacts=artifacts, source_sha256=sha(HERE/'example.js'),
             gdb_script_sha256=sha(HERE/'gdb_feedback.py'), host=platform.node(), kernel=platform.release(),
             same_frozen_release_E=True, reused_diagnostic_not_performance=True,
             snapshot_after='native js_print entry; all ten print calls follow a completed target call',
             timing=False, builds=False, source_edits=False))
    allrows=[]
    for label, a in artifacts.items():
        if label == 'release':
            r=capture('release.correctness', [a['path'], str(HERE/'example.js')])
            assert r['exit_code']==0 and 'AFTER 10 result=4 checksum=40' in r['stdout']
        path=HERE/'raw'/(label+'.feedback.json')
        env=dict(os.environ, FEEDBACK_VARIANT=label, FEEDBACK_OUTPUT=str(path))
        r=capture(label+'.gdb', ['gdb','-q','-batch','-ex','source '+str(HERE/'gdb_feedback.py'),
                               '--args',a['path'],str(HERE/'example.js')], env)
        assert r['exit_code']==0 and 'AFTER 10 result=4 checksum=40' in r['stdout'], r
        s=json.loads(path.read_text())
        assert not s['errors'] and len(s['after'])==10, s
        before=s['before']; assert before['heat']==0 and not before['vector_present'], before
        timeline=[before]+s['after']
        for i,row in enumerate(timeline):
            assert row['completed_calls']==i
            assert row['heat']==min(i,8)
            assert row['vector_present']==(i>=8)
            assert row['bytecode_hex']==before['bytecode_hex']
            if i>=8:
                assert row['cache_state']==1 and row['occupied_entries']==1 and row['shape_present']
            if label=='diagnostic':
                counters=row['whole_process_counters']
                assert counters['queries']==i
                assert counters['hits']==max(0,i-8)
                assert counters['fallback']==min(i,8)
                assert counters['queries']==counters['hits']+counters['fallback']
                assert counters['vectors']==int(i>=8) and counters['alloc_fail']==0
            allrows.append(dict(variant=label, completed_calls=i, heat=row['heat'],
                                vector_present=row['vector_present'], cache_state=row['cache_state'],
                                occupied_entries=row['occupied_entries'],
                                **row.get('whole_process_counters',{})))
    csvpath=HERE/'timeline.csv'
    if not csvpath.exists():
        out=io.StringIO(newline=''); fields=list(dict.fromkeys(k for r in allrows for k in r))
        writer=csv.DictWriter(out,fieldnames=fields);writer.writeheader();writer.writerows(allrows)
        save(csvpath,out.getvalue())
    for a in artifacts.values():
        assert sha(a['path'])==a['sha256']
    if not (HERE/'audit.json').exists():
        save(HERE/'audit.json',dict(status='PASS', stages_each=11, vector_created_on_access=8,
             release_state_and_diagnostic_state_agree=True, diagnostic_first_hit_on_access=9,
             diagnostic_scope='whole process; exactly one query per target call, zero before calls',
             checksum=40, bytecode_identical_across_stages=True, runtime_hashes_unchanged=True,
             no_performance_claim=True))
    print('PASS: release vector appears at access8; diagnostic first hit at access9; checksum40')


if __name__=='__main__':
    main()
