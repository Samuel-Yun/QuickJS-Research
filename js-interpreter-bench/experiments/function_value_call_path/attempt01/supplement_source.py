"""Correct two overly broad excerpt selectors; no VM process is launched."""
from common import *
def main():
    m=read(HERE/'manifest.json');rows=[]
    for v in ['A','M']:
        p=Path(m[v+'_source'])/'quickjs.c';assert sha(p)==m[v+'_source_files']['quickjs.c'];text=p.read_text();lines=text.splitlines()
        match=list(re.finditer(r'^static JSValue JS_CallInternal\(JSContext \*caller_ctx,[^;{}]+\)\n\{',text,re.M));assert len(match)==1
        a=text[:match[0].start()].count('\n');z=next(i for i in range(a+1,len(lines)) if lines[i]=='}')
        body=lines[a:z+1];ranges=[('entry_and_frame',a,min(a+155,z+1))]
        done=[i for i in range(a,z) if lines[i].strip()=='done:'];assert len(done)==1;ranges.append(('actual_return_cleanup',done[0],min(z+1,done[0]+75)))
        for label,i,j in ranges:
            out=HERE/'source_evidence'/v/(label+'.txt');save(out,'\n'.join(f'{k+1}: {lines[k]}' for k in range(i,j))+'\n');rows.append(dict(variant=v,file='quickjs.c',sha256=sha(p),line_start=i+1,line_end=j,excerpt=out.relative_to(HERE).as_posix()))
    save(HERE/'source_evidence/supplement_identity.json',dict(correction='initial JS_CallInternal selector falsely rejected body semicolon; initial return_cleanup selected unrelated done label. Use these bounded definition excerpts only, not old return_cleanup.txt.',files=rows))
if __name__=='__main__':main()
