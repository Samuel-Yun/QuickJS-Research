"""Freeze exact old M sources, restore A/M, derive native-once switch SW."""
import argparse,difflib,shutil,tarfile
from common import *
def one(s,a,b):assert s.count(a)==1,(a[:80],s.count(a));return s.replace(a,b,1)
def archive_baseline():
    ids=read(PREVIOUS/'sources/identities.json')['files']['M'];src=Path('/home/mzyx/read_ic_mic_attempt01/M')
    assert all(sha(src/p)==h for p,h in ids.items()),'exact old M source unavailable/mismatched; do not substitute'
    dest=HERE/'recovery/baseline_M.tar.gz';dest.parent.mkdir(exist_ok=True)
    if not dest.exists():
        with dest.open('xb') as out,gzip.GzipFile(filename='',mode='wb',fileobj=out,mtime=0) as gz,tarfile.open(fileobj=gz,mode='w') as t:
            for name in sorted(ids):t.add(src/name,arcname=name,recursive=False)
    save(HERE/'recovery/baseline_M.json',dict(sha256=sha(dest),base=read(PREVIOUS/'manifest.json')['base'],files=ids,
      origin='exact frozen prior M files, checked against committed identities, no old ELF',license='QuickJS MIT, original LICENSE retained'))
def extract(archive,dest):
    with tarfile.open(archive) as t:
        for m in t.getmembers():assert not m.issym() and not m.islnk() and (dest/m.name).resolve().is_relative_to(dest.resolve())
        t.extractall(dest)
def main():
    assert not STORE.exists(),'fresh store required';STORE.mkdir(parents=True)
    ma=read(HERE/'recovery/baseline_M.json');assert sha(HERE/'recovery/baseline_M.tar.gz')==ma['sha256']
    extract(BASE_MATERIALS/'recovery/sources/base.tar.gz',STORE/'A');extract(HERE/'recovery/baseline_M.tar.gz',STORE/'M')
    old=read(PREVIOUS/'sources/identities.json')['files']
    for v in ['A','M']:assert all(sha(STORE/v/p)==h for p,h in old[v].items())
    shutil.copytree(STORE/'M',STORE/'SW');p=STORE/'SW/quickjs.c';s=p.read_text()
    a=s.index('struct JSRuntime {');z=s.index('};',a)
    s=s[:z]+'    uint8_t read_ic_direct_mode; /* process-fixed experimental mode */\n'+s[z:]
    s=one(s,'JSRuntime *JS_NewRuntime2(const JSMallocFunctions *mf, void *opaque)', '#include "read_ic_mode.inc"\n\nJSRuntime *JS_NewRuntime2(const JSMallocFunctions *mf, void *opaque)')
    s=one(s,'    JSMallocState ms;\n\n    memset(&ms, 0, sizeof(ms));','    JSMallocState ms;\n\n    pthread_once(&rdi_mode_once, rdi_mode_init);\n    if (rdi_process_mode < 0) return NULL;\n    memset(&ms, 0, sizeof(ms));')
    s=one(s,'    memset(rt, 0, sizeof(*rt));','    memset(rt, 0, sizeof(*rt));\n    rt->read_ic_direct_mode = rdi_process_mode;\n#ifdef READ_IC_DIAGNOSTIC\n    rdi_mode_runtime_inits++;\n#endif')
    p.write_text(s)
    shutil.copy2(HERE/'implementation/read_ic_mode.inc',STORE/'SW/read_ic_mode.inc')
    shutil.copy2(HERE/'implementation/read_ic_opcodes.inc',STORE/'SW/read_ic_opcodes.inc')
    # The macros are no-ops/direct upstream calls in formal code. M is untouched.
    p=STORE/'SW/read_ic_types.h';s=p.read_text();s+='\n#ifdef READ_IC_DIAGNOSTIC\n#define RDI_CANDIDATE(x) rdi_diag_candidate(d, (x))\n#define RDI_FIND_OWN(pr,p,a) rdi_counted_find((pr),(p),(a),d)\n#else\n#define RDI_CANDIDATE(x) ((void)0)\n#define RDI_FIND_OWN(pr,p,a) find_own_property((pr),(p),(a))\n#endif\n';p.write_text(s)
    patches=[]
    for p in sorted((STORE/'SW').iterdir()):
        if not p.is_file():continue
        prior=STORE/'M'/p.name
        try:a=prior.read_text() if prior.exists() else '';b=p.read_text()
        except UnicodeError:continue
        if a!=b:patches.extend(difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+p.name if prior.exists() else '/dev/null',tofile='b/'+p.name))
    save(HERE/'patches/M_to_SW.patch',''.join(patches));shutil.copy2(PREVIOUS/'patches/A_to_common_M.patch',HERE/'patches/A_to_M.patch')
    ids={v:{p.relative_to(STORE/v).as_posix():sha(p) for p in sorted((STORE/v).rglob('*')) if p.is_file()} for v in SOURCES}
    def writes(s):return s[s.index('        CASE(OP_put_field):'):s.index('        CASE(OP_private_symbol):')]
    assert writes((STORE/'M/quickjs.c').read_text())==writes((STORE/'SW/quickjs.c').read_text())
    save(HERE/'sources/identities.json',dict(base=ma['base'],source='https://github.com/bellard/quickjs',files=ids,old_A_M_exact_bytes=True,SW_only_changes=['quickjs.c','read_ic_opcodes.inc','read_ic_mode.inc','read_ic_types.h'],write_path_unchanged=True))
    print('SOURCES_READY',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['archive','prepare']);a=p.parse_args();archive_baseline() if a.stage=='archive' else main()
