"""Public API, upstream JS and embed checks against the current owned build."""
from pathlib import Path
import sys
import experiment as e


def run(cid, attempt='02'):
    art=e.lab.load(e.H/'identities'/(cid+'.json'))
    active=e.H/'active'
    assert all(e.lab.sha(active/n)==h for n,h in art['source_sha256'].items())
    core=[active/'.obj'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    checks=[]
    old=e.lab.ROOT/'experiments/read_ic_mic/attempt01/correctness'
    sources=[old/'read_roundtrip.c',old/'roundtrip_slots.c',old/'gc_cycles.c',
             e.LAB/'v2_20261105/first_entry_roundtrip.c',e.H/'native_finalizer.c']
    for src in sources:
        target=e.H/'artifacts'/(cid+'.safety'+attempt+'.'+src.stem)
        identity=dict(source_sha256=e.lab.sha(src),objects_sha256={p.name:e.lab.sha(p) for p in core},performance_sample=False)
        b=e.capture(['gcc','-O2','-g','-I'+str(active),src,*core,'-lm','-lpthread','-ldl','-o',target],
                    'safety_build',cid+'/'+src.name,60,identity)
        assert b['exit_code']==0,b['stderr']
        r=e.capture([target],'safety_run',cid+'/'+src.name,60,identity)
        checks.append(dict(name=src.name,pass_=r['exit_code']==0 and not r['stderr'],token=r['token']))
    for name in ['test_language.js','test_closure.js','test_builtin.js','test_bigint.js','test_loop.js']:
        src=e.lab.ROOT/'engines/quickjs-upstream/tests'/name
        r=e.capture([art['path'],'--std',src],'upstream_test',cid+'/safety'+attempt+'/'+name,60,dict(source_sha256=e.lab.sha(src)))
        checks.append(dict(name=name,pass_=r['exit_code']==0 and not r['stderr'],token=r['token']))
    generated=e.H/'artifacts'/(cid+'.safety'+attempt+'.embedded.c')
    qjsc=e.H/'artifacts'/(cid+'.qjsc')
    r=e.capture([qjsc,'-e','-o',generated,e.H/'targeted.js'],'embed_generate',cid,30)
    assert r['exit_code']==0,r['stderr']
    target=e.H/'artifacts'/(cid+'.safety'+attempt+'.embedded')
    r=e.capture(['gcc','-O2','-g','-I'+str(active),generated,*core,active/'.obj/quickjs-libc.o',
                  '-lm','-lpthread','-ldl','-o',target],'embed_build',cid,60)
    assert r['exit_code']==0,r['stderr']
    r=e.capture([target],'embed_run',cid,60)
    checks.append(dict(name='qjsc embed',pass_=r['exit_code']==0 and r['stdout']=='V6_TARGETED_PASS\n' and not r['stderr'],token=r['token']))
    status='PASS_TARGETED_NOT_FULL_TEST262' if all(r['pass_'] for r in checks) else 'FAIL'
    e.save('safety.'+cid+'.'+attempt+'.json',dict(status=status,checks=checks,full_test262=False,sanitizers=False))
    assert status!='FAIL',checks
    print('SAFETY_PASS',cid,len(checks),flush=True)


if __name__=='__main__':run(sys.argv[1],sys.argv[2] if len(sys.argv)>2 else '02')
