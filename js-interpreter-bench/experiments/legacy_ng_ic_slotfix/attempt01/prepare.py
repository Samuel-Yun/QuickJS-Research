"""Restore exact archives, recover old records, and generate B->C only."""
import argparse,difflib,importlib.util,shutil,subprocess,tarfile
from common import *
BASE='04be246001599f5995fa2f2d8c91a0f198d3f34c'
NG='e1b5978775f75f9637c624fc45e69b92d2c15f42'
def one(s,a,b):assert s.count(a)==1,a;return s.replace(a,b,1)
def slotfix(s):
    start=s.index('static void add_ic_slot(JSContext *ctx, JSInlineCacheUpdate *icu,',s.index('/* Poly IC */'))
    f=s[start:]
    f=one(f,'    int32_t i;','    int32_t i, first_empty = -1;')
    f=one(f,'        i = (i + 1) % countof(cr->shape);','        if (cr->shape[i] == NULL && first_empty < 0)\n            first_empty = i;\n        i = (i + 1) % countof(cr->shape);')
    f=one(f,'    js_free_shape_null(ctx->rt, cr->shape[i]);','    if (first_empty >= 0)\n        i = first_empty;\n    js_free_shape_null(ctx->rt, cr->shape[i]);')
    return s[:start]+f
def materials():
    old=read(OLD/'manifest.json');rows=[]
    for rel in ['raw/diagnostic/CodeLoad.CodeLoadClosure.counters.json','raw/diagnostic/CodeLoad.CodeLoadJQuery.counters.json','analysis/diagnostic_units.csv']:
        rows.append(compress(OLD/rel,HERE/'recovery/legacy_attempt01'/(Path(rel).name+'.gz')))
    for label,h in old['source_provenance']['archives'].items():
        p=OLD/'sources'/label;assert sha(p)==h
        rows.append(compress(p,HERE/'recovery/sources'/(label+'.gz')))
    save(HERE/'recovery/archives.json',rows)
    for name in ['regression.js','roundtrip.c','timer.js']:
        save(HERE/'correctness'/('legacy_'+name),(OLD/'correctness'/name).read_bytes())
    for src,dst in [('experiments/timer_recovery/adapters/quickjs.js','adapter.js'),('experiments/timer_recovery/drivers/octane.js','driver.js')]:
        # Canonical LF for NEW inputs; old hashes/bytes are never changed.
        save(HERE/'inputs'/dst,(ROOT/src).read_bytes().replace(b'\r\n',b'\n'))
    lf=[]
    for rel in ['artifacts/A/quickjs.c','artifacts/B/quickjs.c','patches/legacy_ng_ic_port.v2.patch','port.py','diagnostic.py']:
        p=OLD/rel;b=p.read_bytes();normalized=b.replace(b'\r\n',b'\n')
        blob=subprocess.run(['git','-c','safe.directory='+str(ROOT.parent),'-C',str(ROOT.parent),'show','HEAD:'+p.relative_to(ROOT.parent).as_posix()],capture_output=True,check=True).stdout
        lf.append(dict(path=rel,local_raw_sha256=digest(b),local_CRLF_count=b.count(b'\r\n'),LF_normalized_sha256=digest(normalized),git_blob_sha256=digest(blob),git_equals_normalized=blob==normalized))
    save(HERE/'recovery/line_endings.json',lf)
    assert digest((OLD/'patches/legacy_ng_ic_port.v2.patch').read_bytes())==old['inputs']['experiments/legacy_ng_ic/attempt01/patches/legacy_ng_ic_port.v2.patch']
    for v,a in old['artifacts'].items():assert sha(a['path'])==a['sha256'],v
    save(HERE/'recovery/old_artifact_identity.json',old['artifacts'])
    repo=ROOT.parent
    r=capture('repository',['git','-c','safe.directory='+str(repo),'-C',repo,'status','--short','--untracked-files=no','--ignore-submodules=all'])
    head=capture('repository_head',['git','-c','safe.directory='+str(repo),'-C',repo,'rev-parse','HEAD'])
    save(HERE/'recovery/reference.json',dict(reference='fbc008af922d416c085197903c0747314b140efa',actual=head['stdout'].strip(),initial_status=r['stdout'],base=BASE,ng_source=NG))
    print('MATERIALS_VERIFIED',flush=True)
def source():
    assert not STORE.exists(),'new store required; use IC_SLOT_STORE for a new campaign'
    STORE.mkdir(parents=True)
    with tarfile.open(HERE/'recovery/sources/base.tar.gz','r:gz') as tf:
        for member in tf.getmembers():
            assert (STORE/'A'/member.name).resolve().is_relative_to((STORE/'A').resolve()) and not member.issym() and not member.islnk()
        tf.extractall(STORE/'A')
    shutil.copytree(STORE/'A',STORE/'B')
    # Old port.py read_text/write_text normalized precisely these two files.
    for name in ['quickjs.c','quickjs-opcode.h']:
        p=STORE/'B'/name;p.write_bytes(p.read_bytes().replace(b'\r\n',b'\n'))
    patch=(OLD/'patches/legacy_ng_ic_port.v2.patch').read_text()
    r=capture('apply_B',['patch','--batch','-p1','-i',OLD/'patches/legacy_ng_ic_port.v2.patch'],STORE/'B');assert r['exit_code']==0
    # patch changes only two files; match exact final B bytes (not its debug paths).
    for name in ['quickjs.c','quickjs-opcode.h']:
        b=(STORE/'B'/name).read_bytes();expected=(OLD/'artifacts/B'/name).read_bytes()
        assert b.replace(b'\r\n',b'\n')==expected.replace(b'\r\n',b'\n')
        save(HERE/'sources'/('B_'+name),b)
    with tarfile.open(HERE/'recovery/sources/ng_parent.tar.gz','r:gz') as tf:
        license=tf.extractfile('LICENSE').read()
    (STORE/'B/LICENSE.NG').write_bytes(license)
    shutil.copytree(STORE/'B',STORE/'C')
    before=(STORE/'B/quickjs.c').read_text();after=slotfix(before)
    (STORE/'C/quickjs.c').write_text(after)
    save(HERE/'sources/C_quickjs.c',after)
    save(HERE/'patches/B_to_C.patch',''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='a/quickjs.c',tofile='b/quickjs.c')))
    identities={}
    for v in VERSIONS:
        identities[v]={p.relative_to(STORE/v).as_posix():sha(p) for p in sorted((STORE/v).rglob('*')) if p.is_file()}
    assert set(identities['B'])==set(identities['C'])
    changed=[p for p in identities['B'] if identities['B'][p]!=identities['C'][p]]
    assert changed==['quickjs.c'],changed
    save(HERE/'sources/identities.json',dict(files=identities,B_to_C_changed=changed,base=BASE,ng_source=NG))
    print('SOURCE_GENERATION_PASS',flush=True)
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['materials','source']);a=ap.parse_args();globals()[a.stage]()
