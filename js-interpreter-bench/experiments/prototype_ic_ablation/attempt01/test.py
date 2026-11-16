"""Reuse corrected H scripts: 64 semantic processes, short lifecycle only."""
import argparse,shutil
from common import *
from workload import script,valid_payload

def semantic():
    a=artifacts();expected=read(OLD/'correctness/expected.json');rows=[]
    save(HERE/'inputs/expected.json',(OLD/'correctness/expected.json').read_bytes())
    for mode in ['non_strict','strict']:
        for case,value in expected.items():
            for n in [1,2]:
                old=OLD/'correctness/scripts'/mode/f'{case}.N{n}.js';p=HERE/'scripts/correctness'/mode/old.name;save(p,old.read_bytes())
                assert sha(p)==sha(old)
                assert (p.read_text().startswith('"use strict";') if mode=='strict' else 'strict directive ineffective' in p.read_text())
                for c in ['OFF','ON']:
                    label=f'semantic.{mode}.{case}.N{n}.{c}'
                    r=capture(label,[a[c]['path'],p],env=environment(option(c)))
                    lines=re.findall(r'^IC_CORRECTNESS=(.*)$',r['stdout'],re.M)
                    valid=r['exit_code']==0 and not r['stderr'] and len(lines)==1 and json.loads(lines[0])==dict(case=case,n=n,rounds=[value]*n)
                    rows.append(dict(condition=c,mode=mode,case=case,N=n,valid=valid,exit_code=r['exit_code'],script_sha256=sha(p),origin_sha256=sha(old)))
                    assert valid,label
    csvout(HERE/'correctness.csv',rows);save(HERE/'gates/semantic.json',dict(status='PASS',actual_valid=len(rows),expected=64,independent_cases=8,strict_directive_and_assertion_reused=True))
    # Missing, malformed and empty option are rejected, before any runtime.
    invalid=[]
    for i,v in enumerate([None,'','2','01']):
        env=environment(1)
        if v is None:env.pop('QJS_EXPERIMENT_PROTO_IC')
        else:env['QJS_EXPERIMENT_PROTO_IC']=v
        r=capture('invalid_option.'+str(i),[a['ON']['path'],'--help'],env=env)
        assert r['exit_code']==2 and 'must be 0 or 1' in r['stderr'];invalid.append(dict(value=v,exit_code=r['exit_code']))
    save(HERE/'invalid_options.json',invalid)

def workloads():
    a=artifacts();rows=[]
    for case in CASES:
        for n in [1,2]:
            p=script(case,n,True)
            for c in CONDS:
                r=capture(f'workload.{case}.N{n}.{c}',[a[c]['path'],p],env=environment(option(c)))
                valid_payload(r,case,n,True);rows.append(dict(case=case,N=n,condition=c,valid=True,script_sha256=sha(p)))
    csvout(HERE/'workload_correctness.csv',rows);save(HERE/'gates/workload.json',dict(status='PASS',actual_valid=len(rows),expected=32))

def lifecycle():
    a=artifacts();p=HERE/'scripts/lifecycle_v2.js';save(p,(OLD/'correctness/lifecycle_v2.js').read_bytes())
    for c in ['OFF','ON']:
        r=capture('lifecycle.'+c,[a[c]['path'],p],env=environment(option(c)));assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
    save(HERE/'gates/lifecycle.json',dict(status='PASS',processes=2,new_CLI_only=True,reused_H_validation=['OOM compile limits 192','GC cycles1800','ASan/UBSan','COW OOM32','copy/ROM/embedding'],limitation='old H safety evidence is not new-switch sanitizer evidence'))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['semantic','workloads','lifecycle']);a=p.parse_args();globals()[a.stage]()
