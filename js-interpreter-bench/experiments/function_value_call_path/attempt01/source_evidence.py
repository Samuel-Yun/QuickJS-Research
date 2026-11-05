"""Bounded fixed official reference files and hash-checked frozen QJS excerpts."""
import urllib.request,urllib.error
from common import *
REV='37fb84941c9be9f9914ee50b1ad366f06a1bd764'
def fetch():
    rows=[]
    for rel in ['src/interpreter/interpreter-assembler.cc','src/builtins/builtins-interpreter-gen.cc','src/builtins/builtins-call-gen.cc']:
        url=f'https://raw.githubusercontent.com/v8/v8/{REV}/{rel}'
        p=HERE/'source_reference'/rel;meta=HERE/'source_reference'/(rel.replace('/','_')+'.identity.json')
        if meta.exists():rows.append(read(meta));continue
        try:
            with urllib.request.urlopen(url,timeout=20) as r:
                data=r.read(1000001);assert len(data)<=1000000
            assert b'Copyright' in data[:1500];save(p,data)
            row=dict(url=url,reference_commit=REV,sha256=sha(p),git_blob_sha1=hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest(),bytes=len(data),TLS_verification=True,actual_binary_build_commit=None,status='ACQUIRED')
        except (OSError,AssertionError) as e:row=dict(url=url,status='UNAVAILABLE',error=str(e),TLS_verification=True,retry=False)
        save(meta,row);rows.append(row)
    old=ROOT/'experiments/v8_ic_on_off/attempt02/materials/V8_IC_Resume_Materials_20261025/source'
    for rel in ['src/interpreter/interpreter-generator.cc','src/ic/accessor-assembler.cc','src/flags/flag-definitions.h','LICENSE']:
        p=old/rel;save(HERE/'source_reference'/rel,p.read_bytes());rows.append(dict(origin=p.relative_to(ROOT).as_posix(),reference_commit=REV,sha256=sha(p),bytes=p.stat().st_size,status='REUSED_FIXED_REFERENCE',actual_binary_build_commit=None))
    save(HERE/'source_reference/identity.json',rows)
def extract():
    m=verify();rows=[]
    for v in ['A','M']:
        src=Path(m[v+'_source']);files=m[v+'_source_files']
        for rel in ['quickjs.c','quickjs.h','quickjs-opcode.h']+(['read_ic_opcodes.inc','read_ic_runtime.inc'] if v=='M' else []):
            p=src/rel;assert sha(p)==files[rel];text=p.read_text();lines=text.splitlines()
            if rel=='quickjs.c':
                patterns=[('set_value','static inline void set_value(',18),('find_own_property','static force_inline JSShapeProperty *find_own_property(',50),('JS_CallInternal','static JSValue JS_CallInternal(JSContext *caller_ctx,',180),('call_opcodes','        CASE(OP_call0):',105),('local_opcodes','        CASE(OP_get_loc):',115),('get_field','#define GET_FIELD_INLINE(',90),('push_this','        CASE(OP_push_this):',45),('return_cleanup',' done:',70)]
                # Select definition (not forward declaration) for JS_CallInternal.
                for label,needle,count in patterns:
                    candidates=[i for i,l in enumerate(lines) if l.startswith(needle)]
                    if label=='JS_CallInternal':candidates=[i for i in candidates if '{' in '\n'.join(lines[i:i+5]) and ';' not in '\n'.join(lines[i:i+5])]
                    if label=='return_cleanup':candidates=[i for i in candidates if any('rt->current_stack_frame' in l for l in lines[i:i+80])]
                    if not candidates:rows.append(dict(variant=v,file=rel,label=label,status='NOT_FOUND'));continue
                    i=candidates[0];end=min(i+count,len(lines));out=HERE/'source_evidence'/v/(label+'.txt')
                    save(out,'\n'.join(f'{j+1}: {lines[j]}' for j in range(i,end))+'\n');rows.append(dict(variant=v,file=rel,path=str(p),sha256=sha(p),label=label,line_start=i+1,line_end=end,excerpt=out.relative_to(HERE).as_posix()))
            else:save(HERE/'source_evidence'/v/rel,p.read_bytes());rows.append(dict(variant=v,file=rel,path=str(p),sha256=sha(p),copy=(HERE/'source_evidence'/v/rel).relative_to(HERE).as_posix()))
    save(HERE/'source_evidence/identity.json',rows)
    save(HERE/'source_evidence/QJS_LICENSE',(Path(m['A_source'])/'LICENSE').read_bytes())
    for c in ['QJS_A','QJS_M']:
        r=capture(c+'_version',prefixes()[c]+['--help']);assert '2026-06-04' in r['stdout']+r['stderr']
    r=capture('V8_version',prefixes()['V8_ON']+['--version']);assert '15.6.21' in r['stdout']
    print('SOURCE_IDENTITIES_CHECKED',flush=True)
if __name__=='__main__':
    import argparse
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['fetch','extract']);a=p.parse_args();globals()[a.stage]()
