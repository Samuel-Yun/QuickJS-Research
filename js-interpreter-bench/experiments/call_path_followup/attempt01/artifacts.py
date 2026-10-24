"""Post-measurement source/representation checks and actual-artifact excerpts."""
import csv
import io
import re
from pathlib import Path
import run as c
b=c.b;HERE,ROOT,OLD=c.HERE,c.ROOT,c.OLD

def main():
    b.verify()
    formal=Path(b.manifest()['engines']['quickjs']['binary']['path']).parent
    diag=Path(b.manifest()['diagnostic_quickjs']['path']).parent
    outdir=HERE/'bytecode/serialization';outdir.mkdir(parents=True,exist_ok=True)
    results=[]
    for case in b.config():
        blobs={}
        for label,directory in [('release',formal),('diagnostic',diag)]:
            out=outdir/f'{case}.{label}.c'
            r=b.capture(HERE/'raw/diagnostics'/f'serialization_{case}_{label}.json',
                [str(directory/'qjsc'),'-c','-N','cf_serialized','-o',str(out),str(HERE/'cases'/f'{case}.js')])
            assert r['exit_code']==0,r
            text=out.read_text();match=re.search(r'const uint8_t cf_serialized\[\d+\] = \{(.*?)\};',text,re.S)
            assert match
            blobs[label]=bytes(int(x,16) for x in re.findall(r'0x([0-9a-fA-F]{2})',match[1]))
        assert blobs['release']==blobs['diagnostic']
        results.append(dict(case=case,serialized_bytes_equal=True,size=len(blobs['release'])))
    b.save(HERE/'source_evidence/serialization_comparison.json',dict(cases=results,
        release_qjsc_sha256=b.sha(formal/'qjsc'),diagnostic_qjsc_sha256=b.sha(diag/'qjsc'),
        scope='representation corroboration, not a memory dump of formal process'))
    q=ROOT/'engines/quickjs-upstream'
    for fn,lo,hi,label in [('quickjs.c',17746,17965,'frame_this'),('quickjs.c',18175,18242,'call'),
                         ('quickjs.c',19107,19179,'get_field'),('quickjs.c',20690,20723,'return_cleanup'),
                         ('quickjs.h',687,716,'refcounts')]:
        source=(q/fn).read_text().splitlines()
        b.save(HERE/'source_evidence'/f'qjs_{label}.txt','Revision 04be246001599f5995fa2f2d8c91a0f198d3f34c\n'+
            '\n'.join(f'{i+1}: {source[i]}' for i in range(lo-1,hi))+'\n')
    existing=b.read(OLD/'source_evidence/v8_native_map.json')
    assert existing['binary_sha256']==b.manifest()['engines']['v8']['binary']['sha256']
    b.save(HERE/'source_evidence/reused_native_map.json',dict(path=str(OLD/'source_evidence/v8_native_map.json'),sha256=b.sha(OLD/'source_evidence/v8_native_map.json'),meaning='same artifact code addresses; not current branch hits'))
    events=list(csv.reader(io.StringIO((OLD/'bytecode/v8_native/live_code_events_attempt02.log').read_text())))
    handlers=[]
    for name in ('GetNamedProperty','CallProperty1','CallUndefinedReceiver2','LdaGlobal','Add'):
        row=next(x for x in events if len(x)>6 and x[:2]==['code-creation','BytecodeHandler'] and x[6]==name)
        start=int(row[4],16)-int(existing['load_bias'],16);size=int(row[5])
        assert any(x['vaddr']<=start and start+size<=x['vaddr']+x['filesz'] for x in existing['executable_PT_LOAD'])
        r=b.capture(HERE/'raw/diagnostics'/f'objdump_{name}.json',['objdump','-d','-M','intel',f'--start-address={start}',f'--stop-address={start+size}',b.manifest()['engines']['v8']['binary']['path']])
        assert r['exit_code']==0
        b.save(HERE/'bytecode/v8_native'/f'{name}.txt',r['stdout'])
        handlers.append(dict(handler=name,elf_vaddr=hex(start),size=size))
    b.save(HERE/'source_evidence/native_handlers.json',dict(handlers=handlers,dynamic_branch_hits=None))
    print('ARTIFACTS representation checks 4/4',flush=True)

if __name__=='__main__':main()
