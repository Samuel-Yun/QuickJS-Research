"""One performance pass per candidate; independent diagnostic coverage passes."""
import argparse
import collections
import csv
import importlib.util
import io
import json
import math
import os
from pathlib import Path
import statistics

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
OLD=ROOT/'experiments/native_confirmation_20261108/attempt02'
spec=importlib.util.spec_from_file_location('execution_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)


def gm(values):
    suites=collections.defaultdict(list)
    for case,value in values.items():suites[case.split('.')[0]].append(math.log(value))
    return math.exp(statistics.mean(statistics.mean(x) for x in suites.values()))


def verify(protocol,m):
    assert b.sha(m['elf'])==m['elf_sha256']
    for name,digest in m['sources'].items():assert b.sha(Path(m['elf']).parent/('compat/test-closefrom.c' if name=='test-closefrom.c' else name))==digest
    for filename,digest in protocol['frozen'].items():assert b.sha(filename)==digest,filename
    for info in protocol['scripts'].values():assert b.sha(info['path'])==info['sha256']
    assert protocol['boot_id']==b.boot()


def analyze(out,rows,diagnostic):
    if diagnostic:
        b.save('coverage.json',{r['case']:r['counts'] for r in rows})
        total={k:sum(r['counts'][k] for r in rows) for k in rows[0]['counts'] if k!='constants'}
        b.save('summary.json',total)
        return
    old={(r['case'],r['condition']):float(r['median_ms']) for r in csv.DictReader((OLD/'statistics.csv').open()) if r['kind']=='octane'}
    table=[]
    for r in rows:
        c=r['case'];t=r['ms_per_Run'];a=old[c,'A'];e=old[c,'EVAL_COLD']
        table.append(dict(case=c,A_ms=a,EVAL_COLD_ms=e,candidate_ms=t,vs_EVAL_pct=100*(t/e-1),vs_A_pct=100*(t/a-1)))
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(table[0]),lineterminator='\n');w.writeheader();w.writerows(table)
    b.save('comparison.csv',s.getvalue())
    summary=dict(vs_EVAL_pct=100*(gm({r['case']:r['candidate_ms']/r['EVAL_COLD_ms'] for r in table})-1),
                 vs_A_pct=100*(gm({r['case']:r['candidate_ms']/r['A_ms'] for r in table})-1),
                 reference='historical 30-round medians; candidate 1 new process per case',estimator='14 equal suites; GM within suites')
    b.save('summary.json',summary)
    print('PERFORMANCE_COMPLETE',out.name,json.dumps(summary),flush=True)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('label');parser.add_argument('--diagnostic',action='store_true');parser.add_argument('--sunspider',action='store_true');args=parser.parse_args()
    assert not args.sunspider or args.diagnostic,'SunSpider timing is outside this first screen'
    kind='diag' if args.diagnostic else 'release';name=args.label+'.'+kind
    gate=b.load(HERE/'qualification'/(name+'.gate.json'));assert gate['status']=='PASS'
    m=b.load(HERE/(name+'.manifest.json'))
    phase='sun_counts' if args.sunspider else 'oct_counts' if args.diagnostic else 'octane'
    out=HERE/'runs'/args.label/phase;out.mkdir(parents=True,exist_ok=True);b.H=out
    os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C');assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.sched_setaffinity(0,{2})
    old=b.load(OLD/'protocol.json');benchmark='sunspider' if args.sunspider else 'octane'
    scripts={}
    for c,info in old['scripts'][benchmark].items():
        original=info['correctness1'] if args.sunspider else info['measure'];assert b.sha(original['path'])==original['sha256']
        if args.diagnostic:
            text=Path(original['path']).read_text()
            if args.sunspider:
                # Correctness N1 driver has no timer; mark exactly the workload
                # call, not helper setup/checksum validation.
                anchor='    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {\n      __tebResult = __tebWorkload();'
                assert text.count(anchor)==1, c
                text=text.replace(anchor,'    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {\n      __ex_begin();\n      __tebResult = __tebWorkload();\n      __ex_end();',1)
            else:
                assert text.count('  var started=now();')==text.count('  var stopped=now();')==1
                text=text.replace('  var started=now();','  var started=now();\n  __ex_begin();',1).replace('  var stopped=now();','  __ex_end();\n  var stopped=now();',1)
            script=out/'scripts'/(c+'.js');script.parent.mkdir(exist_ok=True,parents=True)
            if script.exists():assert script.read_text()==text
            else:script.write_text(text)
            scripts[c]=dict(path=str(script),sha256=b.sha(script),N=original['N'],phase=original['payload_phase'])
        else:scripts[c]=dict(path=original['path'],sha256=original['sha256'],N=original['N'],phase='measure')
    protocol=dict(label=args.label,kind=kind,benchmark=benchmark,scripts=scripts,boot_id=b.boot(),CPU=2,
        samples_per_case=1,diagnostic_only=args.diagnostic,reference=str(OLD/'statistics.csv'),
        frozen={str(p):b.sha(p) for p in [HERE/(name+'.manifest.json'),HERE/'run_bench.py',OLD/'statistics.csv']})
    b.save('protocol.json',protocol);b.save('environment.before.json',b.environment())
    (HERE/'frozen').mkdir(exist_ok=True)
    marker=HERE/'frozen'/(name+'.json')
    if not marker.exists():marker.write_text(json.dumps(dict(elf_sha256=m['elf_sha256']))+'\n')
    verify(protocol,m)
    done={r['case']:r for r in b.records() if r['event']=='sample'}
    for c,info in scripts.items():
        if c in done:assert done[c]['valid'];continue
        cmd=[m['elf']]
        if c=='zlib.zlib':cmd+=['--std','-I',str(ROOT/'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
        cmd.append(info['path']);result=b.capture(cmd,'diagnostic' if args.diagnostic else 'measure',c,timeout=600)
        prefix='TEB_RESULT:' if args.sunspider else 'OCTANE_IC_RESULT:'
        payloads=[json.loads(s[len(prefix):]) for s in result['stdout'].splitlines() if s.startswith(prefix)]
        row=dict(event='sample',case=c,N=info['N'],valid=False,diagnostic_only=args.diagnostic)
        try:
            assert result['exit_code']==0 and not result['timeout'],result['stderr'][-2000:]
            assert len(payloads)==1
            p=payloads[0];assert p['correctness']=='PASS' and p['N']==info['N'] and p['case']==c
            assert p['warmup_calls']==0 and p['phase']==info['phase']
            if c.startswith('Crypto.'):
                gold=ROOT/'experiments/ic_fast_slow_20261102/attempt01/octane/crypto'/(c+'.N'+str(info['N'])+'.json')
                assert p['checksum']==b.load(gold)['final_ciphertext']
            if args.sunspider:assert p['checksum'] in b.load(OLD/'sunspider.inputs.json')['contract']['allowed'][c]
            if args.diagnostic:
                lines=result['stderr'].strip().splitlines();assert len(lines)==1 and lines[0].startswith('EXECUTION_COUNTS:')
                row['counts']=json.loads(lines[0][len('EXECUTION_COUNTS:'):])
            else:
                assert not result['stderr']
                assert 0<p['elapsed_ms']<=result['external_wall_ms']+5
                assert p['elapsed_ms']==p['stop_ms']-p['start_ms']
                row['ms_per_Run']=p['elapsed_ms']/info['N']
            row.update(valid=True,payload=p)
        except Exception as exc:row['error']=str(exc)
        b.append(row);assert row['valid'],row
        done[c]=row
        print('SAMPLE',args.label,phase,c,row.get('ms_per_Run',row.get('counts')),flush=True)
    verify(protocol,m);b.save('environment.after.json',b.environment());analyze(out,list(done.values()),args.diagnostic)
    b.save('audit.json',dict(status='PASS',cases=len(done),samples_per_case=1,diagnostic_only=args.diagnostic,all_checksums_pass=True))


if __name__=='__main__':main()
