"""Original-C bytecode/layout inspection, never a formal timing control."""
import importlib.util
import json
import os
from pathlib import Path

HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
OLD=ROOT/'experiments/native_confirmation_20261108/attempt02'
spec=importlib.util.spec_from_file_location('b3_preflight_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
OUT=HERE/'preflight';b.H=OUT


def counts(result):
    assert result['exit_code']==0 and not result['timeout']
    lines=result['stderr'].strip().splitlines();prefix='B3_COUNTS:'
    assert len(lines)==1 and lines[0].startswith(prefix),result['stderr']
    c=json.loads(lines[0][len(prefix):]);assert c['regexp_named_queries']==c['new_hits']+c['fallbacks']
    return c


def main():
    OUT.mkdir(exist_ok=False);os.sched_setaffinity(0,{2});os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
    m=b.load(HERE/'inspect.manifest.json');assert b.sha(m['elf'])==m['elf_sha256']
    r=b.capture([m['elf'],HERE/'probe.js'],'inspect','probe',timeout=60)
    c=counts(r);assert c['exec_queries']==16 and c['new_hits']==0
    snapshots=[json.loads(s[len('BYTECODE_SNAPSHOT:'):]) for s in r['stdout'].splitlines() if s.startswith('BYTECODE_SNAPSHOT:')]
    assert len(snapshots)==2
    for s in snapshots:assert [x['name'] for x in s['opcodes']]==['get_arg0','get_field2_rdi','get_arg1','tail_call_method']
    assert snapshots[0]['receiver']['shape']['is_hashed'] and not snapshots[0]['receiver']['prototype_shape']['is_hashed']
    b.save('probe_counts.json',c);b.save('bytecode.json',snapshots)
    info=b.load(OLD/'protocol.json')['scripts']['octane']['RegExp.RegExp']['measure']
    assert b.sha(info['path'])==info['sha256']
    text=Path(info['path']).read_text()
    assert text.count('  var started=now();')==text.count('  var stopped=now();')==1
    text=text.replace('  var started=now();','  var started=now();\n  __b3_begin();',1).replace('  var stopped=now();','  __b3_end();\n  var stopped=now();',1)
    b.save('RegExp.js',text)
    b.save('protocol.json',dict(diagnostic_only=True,formal_performance_samples=0,binary_sha256=m['elf_sha256'],
        script_sha256=b.sha(OUT/'RegExp.js'),original_script_sha256=info['sha256'],N=info['N'],CPU=2,
        scope='original C; RegExp receivers; bytecode named reads; Run only; no second JS reads'))
    r=b.capture([m['elf'],OUT/'RegExp.js'],'inspect','RegExp',timeout=300)
    c=counts(r)
    payload=[json.loads(s[len('OCTANE_IC_RESULT:'):]) for s in r['stdout'].splitlines() if s.startswith('OCTANE_IC_RESULT:')]
    assert len(payload)==1 and payload[0]['correctness']=='PASS' and payload[0]['N']==info['N']
    b.save('RegExp_counts.json',c)
    b.save('audit.json',dict(status='PASS',bytecode='get_field2_rdi',original_validation='PASS',formal_timing_samples=0))
    print('PREFLIGHT_PASS',json.dumps(c),flush=True)


if __name__=='__main__':main()
