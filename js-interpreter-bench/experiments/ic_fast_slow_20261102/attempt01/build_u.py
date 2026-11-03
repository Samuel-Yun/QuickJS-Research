"""Fresh isolated U and U_san; only public M source and checked-in patch."""
from common import *
import shutil,difflib
def main():
    pin();assert read(HERE/'mechanism/analysis/audit.json')['status']=='PASS_COMPLETE'
    source=Path(runtime()['sources']['M']['path']);ids=read(ROOT/'experiments/ic_mechanism_audit/attempt01/manifest.json')['M_source_files']
    assert all(sha(source/f)==h for f,h in ids.items())
    built={}
    helper='''#if RDI_CAPACITY != 1
#error byte-offset candidate is restricted to original M single-slot IC
#endif
/* UINT32_MAX remains the miss sentinel; never truncate a large index. */
static force_inline uint32_t rdi_byte_offset(uint32_t index)
{
    if (index > UINT32_MAX / sizeof(JSProperty))
        return UINT32_MAX;
    return index * sizeof(JSProperty);
}
'''
    changes={}
    p=source/'read_ic_runtime.inc';s=p.read_text();needle='static force_inline uint32_t rdi_probe('
    assert s.count(needle)==1;s=s.replace(needle,helper+needle,1)
    needle='    RDI_COUNT(updates);';assert s.count(needle)==1
    s=s.replace(needle,'    offset = rdi_byte_offset(offset);\n    if (offset == UINT32_MAX)\n        return;\n'+needle,1);changes[p.name]=s
    p=source/'read_ic_types.h';s=p.read_text();needle='    uint32_t prop_offset;';assert s.count(needle)==1
    changes[p.name]=s.replace(needle,'    uint32_t prop_offset; /* byte displacement from current p->prop in U */',1)
    p=source/'read_ic_opcodes.inc';s=p.read_text();needle='p->prop[offset].u.value';assert s.count(needle)==1
    changes[p.name]=s.replace(needle,'((JSProperty *)((uint8_t *)p->prop + offset))->u.value',1)
    diff=''.join(''.join(difflib.unified_diff((source/f).read_text().splitlines(True),s.splitlines(True),fromfile='a/'+f,tofile='b/'+f)) for f,s in changes.items())
    patch=HERE/'patches/M_to_U_generated.patch';save(patch,diff)
    save(HERE/'raw/build/patch_source_context.json',dict(original_head=(source/'read_ic_runtime.inc').read_text().splitlines()[:8],
      reason='generate exact context from identity-verified M; retain hand-written patch failures unchanged'))
    for label in ['U','U_san']:
        dst=STORE/(label+'_build03');assert not dst.exists();dst.mkdir(parents=True)
        for f in ids:
            (dst/f).parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(source/f,dst/f)
        r=capture(['patch','--fuzz=0','-p1','-i',str(patch)],label+' apply',cwd=dst)
        save(HERE/'raw/build'/(label+'_build03_patch.json'),r);assert r['exit_code']==0,r['stdout']+r['stderr']
        changes=[f for f in ids if sha(dst/f)!=ids[f]];assert sorted(changes)==sorted(['read_ic_runtime.inc','read_ic_opcodes.inc','read_ic_types.h'])
        cmd=['make','-j2','qjs','qjsc']+(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if label=='U_san' else [])
        r=capture(cmd,label+' build',cwd=dst);save(HERE/'raw/build'/(label+'_build03.json'),r);assert r['exit_code']==0,r['stderr'][-6000:]
        built[label]=dict(path=str(dst/'qjs'),source=str(dst),sha256=sha(dst/'qjs'),size_bytes=(dst/'qjs').stat().st_size,
            source_hashes={f:sha(dst/f) for f in ids},changed_from_M=changes,diagnostic=False,sanitizer=label.endswith('san'),
            patch_sha256=sha(patch),compiler=runtime()['compiler'],command=cmd)
        print('BUILT',label,built[label]['sha256'],flush=True)
    save(HERE/'U_runtime.json',built)
if __name__=='__main__':main()
