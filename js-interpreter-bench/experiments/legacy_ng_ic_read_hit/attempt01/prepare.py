"""Restore frozen A/C then D; the sole C/D change is one existing macro."""
import difflib,shutil,tarfile
from common import *
def main():
    assert not STORE.exists(),str(STORE)
    STORE.mkdir(parents=True)
    archive=PREVIOUS/'recovery/sources/base.tar.gz'
    index=read(PREVIOUS/'recovery/archives.json')
    assert any(r.get('compressed_sha256')==sha(archive) for r in index)
    with tarfile.open(archive,'r:gz') as tf:
        for m in tf.getmembers():assert (STORE/'A'/m.name).resolve().is_relative_to((STORE/'A').resolve()) and not m.issym() and not m.islnk()
        tf.extractall(STORE/'A')
    shutil.copytree(STORE/'A',STORE/'C')
    for f,p in [('quickjs.c',PREVIOUS/'sources/C_quickjs.c'),('quickjs-opcode.h',PREVIOUS/'sources/B_quickjs-opcode.h')]:
        (STORE/'C'/f).write_bytes(p.read_bytes().replace(b'\r\n',b'\n'))
    with tarfile.open(PREVIOUS/'recovery/sources/ng_parent.tar.gz','r:gz') as tf:
        (STORE/'C/LICENSE.NG').write_bytes(tf.extractfile('LICENSE').read())
    old=read(PREVIOUS/'sources/identities.json')['files']
    for v in ['A','C']:
        for f,h in old[v].items():assert sha(STORE/v/f)==h,(v,f)
    shutil.copytree(STORE/'C',STORE/'D')
    before=(STORE/'C/quickjs.c').read_text();needle='static JSValue JS_GetPropertyInternalWithIC('
    assert before.count(needle)==1
    after=before.replace(needle,'static force_inline JSValue JS_GetPropertyInternalWithIC(',1)
    (STORE/'D/quickjs.c').write_text(after)
    save(HERE/'patches/C_to_D.patch',''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='a/quickjs.c',tofile='b/quickjs.c')))
    ids={v:{p.relative_to(STORE/v).as_posix():sha(p) for p in sorted((STORE/v).rglob('*')) if p.is_file()} for v in VERSIONS}
    changed=[f for f in ids['C'] if ids['C'][f]!=ids['D'][f]];assert changed==['quickjs.c']
    save(HERE/'sources/identities.json',dict(files=ids,C_to_D_changed=changed,base=read(PREVIOUS/'manifest.json')['base'],ng_source=read(PREVIOUS/'manifest.json')['ng_source']))
    mapping={}
    for f in ['quickjs.c','cutils.h']:
        lines=(STORE/'D'/f).read_text().splitlines()
        keys=['define force_inline','JS_GetPropertyInternalWithIC','get_ic_prop_offset','CASE(OP_get_field_ic)','CASE(OP_get_field2_ic)','CASE(OP_put_field_ic)']
        mapping[f]=[dict(line=i+1,text=l) for i,l in enumerate(lines) if any(k in l for k in keys)]
    save(HERE/'sources/mapping.json',mapping)
    print('A_C_EXACT_SOURCE_RESTORED__D_ONE_MACRO_PASS',flush=True)
if __name__=='__main__':main()
