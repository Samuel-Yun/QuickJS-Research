"""Independent mechanism counts and one-pass targeted Release comparisons."""
import argparse
import json
import os
from pathlib import Path

from build import HERE,ROOT,PACKAGE,LABELS,REFERENCES,sha,save
from full_bench import b,v

CAT=json.loads((PACKAGE/'tests/benchmarks.json').read_text())
TARGETS=[('octane','RayTrace.RayTrace',['SPARSE','NEG_DIRECT']),
         ('octane','EarleyBoyer.Boyer',['SPARSE','NEG_DIRECT','PROTO_SMALL']),
         ('sunspider','access-binary-trees',['SPARSE','OLD_P2','P2_COLD','PROTO_SMALL'])]


def capture(label,mode,script,args,name,suite=None,case=None,extra_env=None):
    m=json.loads((HERE/(label+'.'+mode+'.manifest.json')).read_text())
    assert sha(m['binary'])==m['binary_sha256'] and m['instrumented']==(mode!='release')
    cmd=[m['binary'],str(script),*[str(x) for x in args]]
    old={k:os.environ.get(k) for k in (extra_env or {})}
    try:
        os.environ.update(extra_env or {})
        r=b.capture(cmd,mode,name,timeout=600,identity=dict(label=label,mode=mode,suite=suite,
             case=case['case'] if case else name,binary_sha256=m['binary_sha256']))
    finally:
        for k,val in old.items():
            if val is None:os.environ.pop(k,None)
            else:os.environ[k]=val
    assert r['exit_code']==0 and not r['timeout'],r['stderr'][-2000:]
    row=dict(event='targeted',label=label,mode=mode,name=name,suite=suite,case=case['case'] if case else None)
    if mode!='release':
        lines=[l for l in r['stderr'].splitlines() if l.startswith('SCREEN_COUNTS:')]
        assert len(lines)==1 and len(r['stderr'].splitlines())==1,r['stderr'][-2000:]
        row['counts']=json.loads(lines[0].removeprefix('SCREEN_COUNTS:'))
    else:assert not r['stderr'],r['stderr'][-2000:]
    if case:
        prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
        data=[json.loads(l[len(prefix):]) for l in r['stdout'].splitlines() if l.startswith(prefix)]
        assert len(data)==1
        row['ms_per_Run']=v.validate(data[0],suite,case);row['N']=case['N']
    else:
        data=json.loads(r['stdout']);factor=10 if script.name=='ctor_micro.js' else 7 if script.name=='negative_micro.js' else 3
        assert data['checksum']==factor*int(args[-1])
        row.update(payload=data,elapsed_ms=data['elapsed_ms'])
    b.append(row);return row


def main():
    p=argparse.ArgumentParser();p.add_argument('phase',choices=['counts','measure']);args=p.parse_args()
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C');os.sched_setaffinity(0,{2})
    out=HERE/'targeted'/args.phase;out.mkdir(parents=True,exist_ok=False);b.H=out;rows=[]
    for suite,key,labels in TARGETS:
        case=next(c for c in CAT['cases'][suite] if c['case']==key)
        for label in labels:
            mode='counts' if args.phase=='counts' else 'release'
            name=suite+'.'+key+'.'+label
            print('TARGET',args.phase,name,flush=True)
            rows.append(capture(label,mode,PACKAGE/'tests'/case['path'],[],name,suite,case))
    for pattern in ['all','rotate2','switch','rotate3','rotate4','rotate5']:
        for label in ['SPARSE','OLD_P2','P2_COLD']:
            mode='counts' if args.phase=='counts' else 'release';n=65536 if args.phase=='counts' else 1048576
            rows.append(capture(label,mode,HERE/'ctor_micro.js',[pattern,n],'ctor.'+pattern+'.'+label))
    for pattern in ['negative','alternate','positive_then_bad']:
        for label in ['SPARSE','NEG_DIRECT']:
            mode='counts' if args.phase=='counts' else 'release';n=65536 if args.phase=='counts' else 1048576
            rows.append(capture(label,mode,HERE/'negative_micro.js',[pattern,n],'negative.'+pattern+'.'+label))
    for pattern in ['short','wide']:
        for label in ['OLD_D16','D16_STATIC']:
            mode='counts' if args.phase=='counts' else 'release';n=65536 if args.phase=='counts' else 33554432
            env={}
            if args.phase=='counts':
                env=dict(SCREEN_IMAGE_PATH=str(out/(label+'.'+pattern+'.image.jsonl')),
                         SCREEN_IMAGE_FUNCTION='readX' if pattern=='short' else 'readWide')
            rows.append(capture(label,mode,HERE/'read_micro.js',[pattern,n],'read.'+pattern+'.'+label,extra_env=env))
    if args.phase=='counts':
        rows.append(capture('P2_COLD','counts',HERE/'ctor_micro.js',['rotate2',65536],
                    'upgrade_failure.P2_COLD',extra_env=dict(SCREEN_FAIL_UPGRADE='1')))
        for suite,key in [('octane','EarleyBoyer.Boyer'),('sunspider','access-binary-trees')]:
            case=next(c for c in CAT['cases'][suite] if c['case']==key)
            for label in ['SPARSE','PROTO_SMALL']:
                rows.append(capture(label,'atomcounts',PACKAGE/'tests'/case['path'],[],
                            'atoms.'+key+'.'+label,suite,case))
        def get(name):return next(r['counts'] for r in rows if r['name']==name)
        assert get('negative.negative.NEG_DIRECT')['negative_direct']>0
        assert get('negative.alternate.NEG_DIRECT')['negative_direct']==0
        assert get('negative.positive_then_bad.NEG_DIRECT')['negative_direct']==0
        assert get('ctor.all.P2_COLD')['upgrades']==get('ctor.all.P2_COLD')['second_hits']==0
        assert get('ctor.rotate2.P2_COLD')['upgrades']==1 and get('ctor.rotate2.P2_COLD')['second_hits']>0
        assert get('ctor.rotate3.P2_COLD')['normal_constructs']>32768
        fail=get('upgrade_failure.P2_COLD')
        assert fail['upgrade_failures']>0 and fail['upgrades']==fail['second_hits']==0 and fail['positive_hits']>0
        for suite,key,labels in TARGETS:
            base=get(suite+'.'+key+'.SPARSE')
            if 'NEG_DIRECT' in labels:
                new=get(suite+'.'+key+'.NEG_DIRECT')
                assert base['normal_constructs']==new['normal_constructs']
                assert base['positive_hits']==new['positive_hits']
                assert base['eligibility_entries']-new['eligibility_entries']==new['negative_direct']
                assert base['remember_entries']-new['remember_entries']==new['negative_direct']
    save(out/'results.json',rows);save(out/'complete.json',dict(status='PASS',processes=len(rows),phase=args.phase))
    print('TARGETED_PASS',args.phase,len(rows),flush=True)


if __name__=='__main__':main()
