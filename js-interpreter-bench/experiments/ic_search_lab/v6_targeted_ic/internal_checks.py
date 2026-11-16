"""Restore owned active source, build one internal probe, restore ordinary image."""
import sys
import experiment as e


def restore(files):
    for n,text in files.items():
        (e.H/'active'/n).write_bytes(text.encode())


def run(cid):
    art=e.lab.load(e.H/'identities'/(cid+'.json'))
    files=e.candidate_files(cid)
    assert {n:e.hashlib.sha256(v.encode()).hexdigest() for n,v in files.items()}==art['source_sha256']
    restore(files)
    active=e.H/'active'
    source=e.H/('internal_id.c' if cid.startswith('ID_') else 'internal_lazy_v2.c' if cid=='L1' else 'internal_prepare.c')
    flags=['-O2','-g','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"']
    if cid=='ID_READ':flags+=['-DV6_ID_READ']
    if cid=='B2':flags+=['-DV6_PREPARED']
    others=[active/'.obj'/(n+'.o') for n in ['dtoa','libregexp','libunicode','cutils']]
    suffix='.probe02' if cid=='L1' else ''
    target=e.H/'artifacts'/('internal.'+cid+'.'+e.EPOCH+suffix)
    ident=dict(source_sha256=e.lab.sha(source),parent_source_sha256=art['source_sha256'],
               objects_sha256={p.name:e.lab.sha(p) for p in others},performance_sample=False)
    if target.exists():
        prior=[e.json.loads(s) for s in (e.H/'runs.jsonl').read_text().splitlines()]
        prior=[r for r in prior if r.get('event')=='process_result' and r.get('stage')=='internal_build'
               and str(target) in r['command'] and r['exit_code']==0]
        assert prior, 'No completed compiler provenance for existing probe'
        b=prior[-1]
    else:
        b=e.capture(['gcc',*flags,'-I'+str(active),source,*others,'-lm','-lpthread','-ldl','-o',target],
                    'internal_build',cid,180,ident)
    if b['exit_code']==0:
        r=e.capture([target],'internal_check',cid,60,dict(ident,binary_sha256=e.lab.sha(target)))
    else:r=b
    result=dict(status='PASS' if r['exit_code']==0 and not r['stderr'] else 'BLOCKED_INTERNAL_CHECK',
                exit_code=r['exit_code'],stdout=r['stdout'],stderr=r['stderr'],token=r['token'],identity=ident)
    e.save('internal.'+cid+'.'+e.EPOCH+suffix+'.json',result)
    print('INTERNAL',cid,result['status'],r['stdout'],r['stderr'][-1000:],flush=True)
    return result['status']=='PASS'


if __name__=='__main__':
    for cid in sys.argv[1:]:run(cid)
