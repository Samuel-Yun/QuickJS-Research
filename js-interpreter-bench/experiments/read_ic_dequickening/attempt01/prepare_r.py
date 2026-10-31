"""Exactly one predeclared R strategy derived from source-identical M, no SW code."""
import difflib,shutil
from common import *
def one(s,a,b):assert s.count(a)==1,(a,s.count(a));return s.replace(a,b,1)
def main():
    assert read(HERE/'bridge_check/audit.json')['status']=='PASS'
    assert not (STORE/'R').exists();ids=read(HERE/'bridge_check/source_identity.json')['files'];dst=STORE/'R'
    for n,h in ids['M'].items():
        assert sha(STORE/'M'/n)==h;p=dst/n;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(STORE/'M'/n,p)
    p=dst/'read_ic_types.h';s=p.read_text();s=one(s,'    JSAtom atom;\n} ReadICSite;','    JSAtom atom;\n    uint8_t miss_streak; /* fixed K=32; permanent ordinary opcode at threshold */\n} ReadICSite;')
    s+='\n#ifdef READ_IC_DIAGNOSTIC\n#define RDI_EXIT_RECORD(pc,old) rdi_diag_exit(d,(pc),(old)!=NULL)\n#define RDI_STREAK_READ() (++d->streak_reads)\n#define RDI_STREAK_WRITE() (++d->streak_writes)\n#define RDI_STREAK_RESET() (++d->streak_resets)\n#else\n#define RDI_EXIT_RECORD(pc,old) ((void)0)\n#define RDI_STREAK_READ() ((void)0)\n#define RDI_STREAK_WRITE() ((void)0)\n#define RDI_STREAK_RESET() ((void)0)\n#endif\n';p.write_text(s)
    shutil.copy2(HERE/'implementation/read_ic_exit.inc',dst/'read_ic_exit.inc')
    p=dst/'read_ic_runtime.inc';s=p.read_text();s=one(s,'static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)','#include "read_ic_exit.inc"\n\nstatic void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)');p.write_text(s)
    p=dst/'read_ic_opcodes.inc';s=p.read_text()
    s=one(s,'        uint32_t index = get_u32(pc), offset;','        uint8_t *instruction = (uint8_t *)pc - 1;                       \\\n        uint32_t index = get_u32(pc), offset;')
    s=one(s,'                    RDI_COUNT(hits);','                    RDI_STREAK_READ();                                \\\n                    if (site->miss_streak) {                             \\\n                        site->miss_streak=0;                            \\\n                        RDI_STREAK_WRITE(); RDI_STREAK_RESET();          \\\n                    }                                                   \\\n                    RDI_COUNT(hits);')
    s=one(s,'        atom = site->atom;','        atom = site->atom;                                              \\\n        RDI_STREAK_READ();                                              \\\n        if (site->miss_streak < 32) {                                    \\\n            site->miss_streak++; RDI_STREAK_WRITE();                     \\\n        }                                                               \\\n        if (site->miss_streak == 32)                                    \\\n            rdi_exit(ctx,b,index,instruction RDI_DARG(d));')
    s=one(s,'                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));','                        if (site->miss_streak < 32)                     \\\n                            rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));');p.write_text(s)
    patches=[]
    for p in sorted(dst.iterdir()):
        if not p.is_file():continue
        prior=STORE/'M'/p.name
        try:a=prior.read_text() if prior.exists() else '';b=p.read_text()
        except UnicodeError:continue
        if a!=b:patches.extend(difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+p.name if prior.exists() else '/dev/null',tofile='b/'+p.name))
    save(HERE/'patches/M_to_R.patch',''.join(patches));shutil.copy2(PREVIOUS/'patches/A_to_common_M.patch',HERE/'patches/A_to_M.patch')
    out={v:ids[v] for v in ['A','M']};out['R']={p.relative_to(dst).as_posix():sha(p) for p in sorted(dst.rglob('*')) if p.is_file()}
    assert sha(dst/'quickjs.c')==ids['M']['quickjs.c'] and not (dst/'read_ic_mode.inc').exists()
    assert all('QJS_READ_IC_MODE' not in (dst/n).read_text(errors='ignore') for n in ['quickjs.c','read_ic_types.h','read_ic_runtime.inc','read_ic_opcodes.inc'])
    save(HERE/'sources/identities.json',dict(base='04be246001599f5995fa2f2d8c91a0f198d3f34c',files=out,K=32,
      A_M_exact_old_source_bytes=True,R_changed_files=['read_ic_types.h','read_ic_runtime.inc','read_ic_opcodes.inc','read_ic_exit.inc'],quickjs_c_and_writes_unchanged=True,no_SW_mode=True))
    print('R_SOURCE_READY',flush=True)
if __name__=='__main__':main()
