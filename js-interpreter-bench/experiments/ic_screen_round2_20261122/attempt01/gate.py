"""Differential semantics, single-site workloads, serialization and GC."""
import argparse
import json
import os
from pathlib import Path
import subprocess

from build import HERE, PACKAGE, LABELS, sha, save


def run(cmd, name, counts=False):
    env=dict(os.environ,TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
    r=subprocess.run([str(x) for x in cmd],capture_output=True,text=True,env=env,timeout=120)
    row=dict(name=name,command=[str(x) for x in cmd],exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr)
    with (HERE/'gate.raw.jsonl').open('a') as f:f.write(json.dumps(row,ensure_ascii=False)+'\n')
    assert r.returncode==0,row
    if counts:
        lines=[l for l in r.stderr.splitlines() if l.startswith('SCREEN_COUNTS:')]
        assert len(lines)==1 and len(r.stderr.splitlines())==1,row
    else:assert not r.stderr,row
    return r.stdout


def main():
    p=argparse.ArgumentParser();p.add_argument('--labels',nargs='+',default=LABELS);args=p.parse_args()
    results={}
    cases=[PACKAGE/'tests/safety.js',PACKAGE/'tests/property_reads.js',HERE/'semantics.js',HERE/'d16_cases.js',HERE/'proto_cases.js']
    expected={str(s):run([PACKAGE/'build/A/qjs',s],'A.'+s.name) for s in cases}
    for label in args.labels:
        try:
            m=json.loads((HERE/(label+'.release.manifest.json')).read_text())
            assert sha(m['binary'])==m['binary_sha256']
            d=Path(m['binary']).parent
            for script in cases:
                assert run([d/'qjs',script],label+'.'+script.name)==expected[str(script)],script
            for pattern in ['all','rotate2','switch','rotate3','rotate4','rotate5']:
                r=json.loads(run([d/'qjs',HERE/'ctor_micro.js',pattern,65536],label+'.'+pattern))
                assert r['checksum']==655360
            for pattern in ['negative','alternate','positive_then_bad']:
                r=json.loads(run([d/'qjs',HERE/'negative_micro.js',pattern,65536],label+'.neg.'+pattern))
                assert r['checksum']==458752
            # Save/load a warmed, prepared function tree, including a short read.
            c=(PACKAGE/'tests/serialization.c').read_text().replace(
                'for(var i=0;i<16;i++)new Wrap(7,8,9);(new Wrap(7)).x;',
                'function ownRead(o){return o.x;}for(var i=0;i<16;i++)ownRead(new Wrap(7,8,9));ownRead(new Wrap(7));')
            (d/'serialization.c').write_text(c)
            for test in ['serialization','lifetime']:
                src=d/'serialization.c' if test=='serialization' else HERE/'lifetime.c'
                command=['gcc','-g','-O2','-I'+str(d),str(src),
                         *[str(d/'.obj'/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],
                         '-lm','-lpthread','-ldl','-o',str(d/test)]
                r=subprocess.run(command,capture_output=True,text=True)
                assert r.returncode==0,r.stderr
                value=run([d/test],label+'.'+test)
                assert value.strip() in ['LIFETIME_PASS','PREPARED_SERIALIZATION_ROM_PASS']
            results[label]=dict(status='PASS',semantic_cases=len(cases),micro_patterns=9,
                prepared_serialization_and_ROM=True,GC_lifetime=True,binary_sha256=m['binary_sha256'])
            print('GATE_PASS',label,flush=True)
        except Exception as e:
            results[label]=dict(status='FAIL',error=str(e))
            print('GATE_FAIL',label,str(e)[:1200],flush=True)
    path=HERE/'gate.json'
    old=json.loads(path.read_text()) if path.exists() else {}
    old.update(results);save(path,old)


if __name__=='__main__':main()
