"""Post-formal unchanged regexp library and derived interpreter layout check."""
from common import *
def main():
    assert read(HERE/'analysis/formal_audit.json')['status']=='PASS';m=verify_runtime();rows=[]
    dest=STORE/'code_checks';dest.mkdir(exist_ok=True)
    for v in VERSIONS:
        src=STORE/v;obj=src/'.obj/libregexp.o';out=dest/(v+'.libregexp.text.bin')
        r=capture(v+'_libregexp_text',['objcopy','--dump-section','.text='+str(out),obj,dest/(v+'.libregexp.copy.o')]);assert not r['exit_code']
        rows.append(dict(variant=v,libregexp_c_sha256=sha(src/'libregexp.c'),libregexp_text_sha256=sha(out),libregexp_text_bytes=out.stat().st_size))
        r=capture(v+'_regexp_exec_asm',['objdump','-d','-M','intel','--disassemble=js_regexp_exec',m['artifacts'][v]['path']]);assert not r['exit_code']
    assert len({r['libregexp_c_sha256'] for r in rows})==len({r['libregexp_text_sha256'] for r in rows})==1
    save(HERE/'machinecode/regexp_derived_audit.json',dict(status='PASS',versions=rows,
      conclusion='regexp library source and unrelocated object .text identical; no regexp algorithm modification',
      remaining='final link addresses/relocations, interpreter layout, new site/index/guard/ref/GC metadata may still differ; no per-helper time attribution'))
    print('REGEXP_GENERATED_CODE_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
