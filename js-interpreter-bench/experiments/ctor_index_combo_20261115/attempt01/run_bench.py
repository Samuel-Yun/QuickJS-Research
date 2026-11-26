"""One complete combined-candidate pass; counters are separate processes."""
import argparse
import importlib.util
import json
import math
import os
from pathlib import Path

HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
OLD=ROOT/'experiments/native_confirmation_20261108/attempt02'
spec=importlib.util.spec_from_file_location('b3_bench_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)


def verify(protocol,m):
    assert b.sha(m['elf'])==m['elf_sha256']
    for name,digest in m['sources'].items():assert b.sha(Path(m['elf']).parent/name)==digest,name
    for p,digest in protocol['frozen_files'].items():assert b.sha(p)==digest,p
    for info in protocol['scripts'].values():assert b.sha(info['path'])==info['sha256']
    for rel,digest in protocol['input_files'].items():assert b.sha(ROOT/rel)==digest,rel
    assert b.boot()==protocol['boot_id']


def main():
    p=argparse.ArgumentParser();p.add_argument('mode',choices=['release','counts']);p.add_argument('benchmark',choices=['octane','sunspider']);p.add_argument('--cases',nargs='*');args=p.parse_args()
    round_dir=HERE
    m=b.load(round_dir/(args.mode+'.manifest.json'))
    # Count data may be collected while the independent sanitizer build runs;
    # formal Release timing requires the completed semantic gate.
    if args.mode=='release':assert b.load(round_dir/'qualification/gate.json')['status']=='PASS'
    out=round_dir/'runs'/args.mode/args.benchmark;out.mkdir(parents=True,exist_ok=True);b.H=out
    os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C');assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.sched_setaffinity(0,{2})
    original=b.load(OLD/'protocol.json');info=b.load(OLD/(args.benchmark+'.inputs.json'));scripts={}
    for case in info['cases']:
        old=original['scripts'][args.benchmark][case]['measure'];assert b.sha(old['path'])==old['sha256']
        if args.mode!='release':
            text=Path(old['path']).read_text()
            if args.benchmark=='octane':begin,end='  var started=now();','  var stopped=now();'
            else:begin,end='    __tebStarted = benchNow();','    __tebStopped = benchNow();'
            assert text.count(begin)==text.count(end)==1
            text=text.replace(begin,begin+'\n  __four_begin();',1).replace(end,'  __four_end();\n'+end,1)
            path=out/'scripts'/(case+'.js');path.parent.mkdir(exist_ok=True)
            if path.exists():assert path.read_text()==text
            else:path.write_text(text)
            scripts[case]=dict(path=str(path),sha256=b.sha(path),N=old['N'],original_sha256=old['sha256'])
        else:scripts[case]=dict(path=old['path'],sha256=old['sha256'],N=old['N'])
    protocol=dict(mode=args.mode,benchmark=args.benchmark,scripts=scripts,CPU=2,boot_id=b.boot(),
        independent_processes_per_case=1,warmup_calls=0,input_files=info['files'],
        frozen_files={str(p):b.sha(p) for p in [Path(__file__),round_dir/(args.mode+'.manifest.json'),OLD/'protocol.json',OLD/(args.benchmark+'.inputs.json')]},
        scope='CTOR_INDEX_COMBO; static bytecode entries; original Run only',
        failure_policy='retain failed samples; no automatic retry',formal_timing_samples=args.mode=='release',C_formal_retest=False)
    b.save('protocol.json',protocol)
    if not (out/'environment.before.json').exists():b.save('environment.before.json',b.environment())
    verify(protocol,m)
    done={r['case']:r for r in b.records() if r['event']=='sample'}
    for case,script in scripts.items():
        if args.cases and case not in args.cases:continue
        if case in done:assert done[case]['valid'];continue
        command=[m['elf']]
        if case=='zlib.zlib':command+=['--std','-I',str(ROOT/'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
        command.append(script['path'])
        r=b.capture(command,args.mode,case,timeout=600,identity=dict(case=case,N=script['N'],binary_sha256=m['elf_sha256']))
        row=dict(event='sample',case=case,N=script['N'],valid=False,diagnostic_only=args.mode!='release')
        try:
            assert r['exit_code']==0 and not r['timeout'],r['stderr'][-2000:]
            prefix='OCTANE_IC_RESULT:' if args.benchmark=='octane' else 'TEB_RESULT:'
            lines=[s[len(prefix):] for s in r['stdout'].splitlines() if s.startswith(prefix)];assert len(lines)==1
            payload=json.loads(lines[0]);assert payload['case']==case and payload['N']==script['N'] and payload['phase']=='measure'
            assert payload['correctness']=='PASS' and payload['warmup_calls']==0
            if args.benchmark=='sunspider':assert payload['checksum'] in info['contract']['allowed'][case]
            if case.startswith('Crypto.'):
                gold=ROOT/'experiments/ic_fast_slow_20261102/attempt01/octane/crypto'/(case+'.N'+str(script['N'])+'.json')
                assert payload['checksum']==b.load(gold)['final_ciphertext']
            if args.mode!='release':
                stderr=r['stderr'].strip().splitlines();assert len(stderr)==1 and stderr[0].startswith('FOUR_COUNTS:')
                c=json.loads(stderr[0][len('FOUR_COUNTS:'):]);assert c['attempts']==c['hits']+c['fallbacks']
                row['counts']=c
            else:
                assert not r['stderr']
                assert math.isfinite(payload['elapsed_ms']) and 0<payload['elapsed_ms']<=r['external_wall_ms']+5
                assert payload['elapsed_ms']==payload['stop_ms']-payload['start_ms']
                row['ms_per_Run']=payload['elapsed_ms']/script['N']
            assert r['boot_id']==r['boot_id_after']==protocol['boot_id']
            assert abs(r['raw_minus_monotonic_ms'])<=5+.002*r['external_wall_ms']
            row.update(payload=payload,valid=True)
        except Exception as exc:row['error']=str(exc)
        b.append(row);assert row['valid'],row;done[case]=row
        value=round(row['ms_per_Run'],6) if args.mode=='release' else {k:row['counts'][k] for k in ['attempts','hits','eligible','fallbacks']}
        print('SAMPLE',args.mode,args.benchmark,len(done),case,value,flush=True)
    verify(protocol,m)
    b.save('environment.after.json',b.environment())
    b.save('audit.json',dict(status='PASS',cases=len(done),independent_processes_per_case=1,
        all_original_validations_pass=True,sources_and_ELF_frozen=True,diagnostic_only=args.mode!='release'))
    print('PASS_COMPLETE',args.mode,args.benchmark,flush=True)


if __name__=='__main__':main()
