"""Original Richards: new isolated sampling, final dumps and diagnostic counts.
No method replacement/caching in original scripts. JS-count copies are labelled.
"""
import bisect
import collections
import csv
import difflib
import io
import json
import os
import re
import struct
import sys
from pathlib import Path
import run as c
b=c.b
HERE,ROOT=c.HERE,c.ROOT
save,read,sha=b.save,b.read,b.sha
UP=ROOT/'benchmarks/octane/upstream'

def source(n,suffix=''):
    driver="""
;(function(){
 var __cfSuite=BenchmarkSuite.suites[0], __cfTest=__cfSuite.benchmarks[0];
 if(__cfSuite.name!=='Richards' || __cfTest.name!=='Richards') throw Error('registration');
 BenchmarkSuite.ResetRNG(); __cfTest.Setup();
 var __cfStart=benchNow();
 for(var __cfRep=0;__cfRep<N_REPLACE;__cfRep++) __cfTest.run();
 var __cfStop=benchNow(); __cfTest.TearDown();
 console.log('RICHARDS '+JSON.stringify({N:N_REPLACE,start_ms:__cfStart,stop_ms:__cfStop,
 elapsed_ms:__cfStop-__cfStart,correctness:'PASS',assertions_per_Run:1,warmup_calls:0}));
})();
""".replace('N_REPLACE',str(n))
    return (UP/'base.js').read_bytes()+b'\n;\n'+(UP/'richards.js').read_bytes()+b'\n;\n'+suffix.encode()+driver.encode()

def script(n,label='original',suffix=''):
    p=HERE/'richards'/f'{label}.N{n}.js';save(p,source(n,suffix));return p

def check(r):
    assert r['exit_code']==0,r
    m=re.search(r'^RICHARDS (.+)$',r['stdout'],re.M)
    assert m and json.loads(m[1])['correctness']=='PASS'
    return json.loads(m[1])

def qjs_sample_parse(record,csvpath,payload=None):
    payload=check(record) if payload is None else payload
    samples=list(csv.DictReader(csvpath.open()))
    assert samples
    timed=[s for s in samples if payload['start_ms']*1e6<=int(s['monotonic_ns'])<=payload['stop_ms']*1e6]
    binary=b.manifest()['engines']['quickjs']['binary']['path']
    maps=Path(str(csvpath)+'.maps').read_text()
    save(csvpath.with_suffix('.map.json'),dict(binary=binary,maps=maps,clock='CLOCK_MONOTONIC',scope='top PC; filtered to JS start/stop; signal sampling not exact self-time'))
    mappings=[]
    for line in maps.splitlines():
        fields=line.split()
        if len(fields)>5 and fields[-1]==binary:
            lo,hi=(int(v,16) for v in fields[0].split('-'))
            mappings.append((lo,hi,int(fields[2],16)))
    data=Path(binary).read_bytes();phoff=struct.unpack_from('<Q',data,32)[0]
    entsize,count=struct.unpack_from('<HH',data,54);loads=[]
    for i in range(count):
        typ,flags,off,va,_,fs,ms,align=struct.unpack_from('<IIQQQQQQ',data,phoff+i*entsize)
        if typ==1:loads.append((off,va))
    pcs=collections.Counter();external=0
    for row in timed:
        pc=int(row['pc'],16)
        matched=next((m for m in mappings if m[0]<=pc<m[1]),None)
        if matched:
            lo,hi,off=matched
            seg=next((x for x in loads if (x[0]&~4095)==off),None)
            if seg:pcs[pc-lo+(seg[1]&~4095)]+=1
            else: external+=1
        else: external+=1
    cmd=['addr2line','-f','-C','-e',binary]+[hex(pc) for pc in pcs]
    r=b.capture(csvpath.with_suffix('.symbols.json'),cmd)
    assert r['exit_code']==0
    lines=r['stdout'].splitlines();assert len(lines)==2*len(pcs)
    byfun=collections.Counter();byline=collections.Counter();decoded=[]
    for i,(pc,n) in enumerate(pcs.items()):
        fn,loc=lines[2*i:2*i+2];byfun[fn]+=n;byline[loc]+=n
        decoded.append(dict(elf_pc=hex(pc),samples=n,function=fn,source=loc))
    b.export(csvpath.with_suffix('.decoded.csv'),decoded)
    return dict(total_samples=len(samples),timed_samples=len(timed),qjs_mapped=sum(pcs.values()),external=external,
        functions=dict(byfun.most_common()),source_lines=dict(byline.most_common()),
        scope='timed region CPU signal top-PC samples; C/inline functions, not JS function self-time',
        sampled_binary_sha256=sha(binary))

def v8_parse(path):
    ranges={};counts=collections.Counter();total=0
    with path.open(errors='replace',newline='') as f:
        for row in csv.reader(f):
            if not row: continue
            if row[0]=='code-creation':ranges[int(row[4],16)]=(int(row[5]),row[1],row[6])
            elif row[0]=='code-move' and int(row[1],16) in ranges:ranges[int(row[2],16)]=ranges.pop(int(row[1],16))
            elif row[0]=='code-delete':ranges.pop(int(row[1],16),None)
            elif row[0]=='tick':
                total+=1;pc=int(row[1],16);starts=sorted(ranges);ix=bisect.bisect_right(starts,pc)-1
                if ix>=0:
                    start=starts[ix];size,kind,name=ranges[start]
                    if pc<start+size: counts[kind+':'+name]+=1;continue
                counts['UNKNOWN_NATIVE_OR_UNMAPPED']+=1
    return dict(ticks=total,top_PC_counts=dict(counts.most_common()),scope='whole process top PC only; no JS function/stack self-time',raw_sha256=sha(path))

def sample():
    b.verify();p=script(2048)
    # This source is constructed directly from untouched upstream bytes.
    save(HERE/'source_evidence/richards_identity.json',dict(commit='570ad1ccfe86e3eecba0636c8f932ac08edec517',
         richards_sha256=sha(UP/'richards.js'),base_sha256=sha(UP/'base.js'),generated_sha256=sha(p),
         no_method_replacement=True,no_defineProperty=True,original_algorithm_bytes_embedded=True))
    r=b.capture(HERE/'raw/diagnostics/sampling_capability.json',['sh','-c','command -v perf || true; command -v gcc; command -v addr2line; cat /proc/sys/kernel/perf_event_paranoid'])
    lib=HERE/'probes/pc_sampler.so'
    r=b.capture(HERE/'raw/diagnostics/pc_sampler_build.json',['gcc','-O2','-fPIC','-shared','-Wall',str(HERE/'probes/pc_sampler.c'),'-o',str(lib)])
    assert r['exit_code']==0,r
    save(HERE/'source_evidence/sampler_identity.json',dict(source_sha256=sha(HERE/'probes/pc_sampler.c'),library_sha256=sha(lib),sampling='ITIMER_PROF 1ms; SIGPROF top PC; diagnostic only'))
    for rep in range(1,4):
        logfile=HERE/'richards'/f'v8.rep{rep}.log'
        r=b.capture(HERE/'raw/diagnostics'/f'richards_v8_profile_{rep}.json',b.command('v8',p,('--prof','--no-logfile-per-isolate','--logfile='+str(logfile))))
        check(r);save(HERE/'richards'/f'v8.rep{rep}.summary.json',v8_parse(logfile))
        csvpath=HERE/'richards'/f'quickjs.rep{rep}.samples.csv'
        env=dict(os.environ,LD_PRELOAD=str(lib),CF_SAMPLE_PATH=str(csvpath))
        r=b.capture(HERE/'raw/diagnostics'/f'richards_quickjs_profile_{rep}.json',b.command('quickjs',p),env=env)
        result=qjs_sample_parse(r,csvpath)
        save(HERE/'richards'/f'quickjs.rep{rep}.summary.json',result)
        print('PROFILE',rep,'QJS timed samples',result['timed_samples'],flush=True)

def counts():
    # Reuse the older native hook selecting TCB.run and the four task prototypes.
    hook="""
__mlDiagBegin(TaskControlBlock.prototype,TaskControlBlock.prototype.run,
 IdleTask.prototype,WorkerTask.prototype,HandlerTask.prototype,DeviceTask.prototype,Function.prototype.call);
"""
    data=source(1,hook)+b"\nconsole.log('NATIVE_PATHS '+__mlDiagEnd());\n"
    p=HERE/'richards/original.native_paths.N1.js';save(p,data)
    cmd=b.command('quickjs',p);cmd[0]=b.DIAG
    r=b.capture(HERE/'raw/diagnostics/richards_native_paths.json',cmd);check(r)
    assert 'NATIVE_PATHS ' in r['stdout']
    # Explicit labelled JS diagnostic copy: entry counters + receiver shapes.
    original=(UP/'richards.js').read_text()
    prefix="var __cfCounts=Object.create(null),__cfShapes=Object.create(null); function __cfCount(k){__cfCounts[k]=(__cfCounts[k]||0)+1;}\n"
    regex=r'([A-Za-z]+\.prototype\.[A-Za-z]+)\s*=\s*function\s*\([^)]*\)\s*\{'
    changed=re.sub(regex,lambda m:m[0]+' __cfCount('+json.dumps(m[1])+');',original)
    shape="""var __cfP=Object.getPrototypeOf(this.task),__cfK=__cfP===IdleTask.prototype?'IdleTask':__cfP===WorkerTask.prototype?'WorkerTask':__cfP===HandlerTask.prototype?'HandlerTask':__cfP===DeviceTask.prototype?'DeviceTask':'OTHER';
var __cfShapeKey=__cfK+':TCBownRun='+Object.prototype.hasOwnProperty.call(this,'run')+':taskOwnRun='+Object.prototype.hasOwnProperty.call(this.task,'run')+':TCBproto='+(Object.getPrototypeOf(this)===TaskControlBlock.prototype)+':taskOwn='+Object.prototype.hasOwnProperty.call(this,'task');
__cfShapes[__cfShapeKey]=(__cfShapes[__cfShapeKey]||0)+1;"""
    anchor='TaskControlBlock.prototype.run = function () { __cfCount("TaskControlBlock.prototype.run");'
    assert changed.count(anchor)==1
    changed=changed.replace(anchor,anchor+shape)
    driver=source(1).split(b'\n;\n')[-1]
    changed_bytes=(UP/'base.js').read_bytes()+b'\n;\n'+prefix.encode()+changed.encode()+b'\n;\n'+driver+b"\nconsole.log('FUNCTION_COUNTS '+JSON.stringify({counts:__cfCounts,shapes:__cfShapes}));\n"
    p=HERE/'richards/DIAGNOSTIC_JS_COUNTS.N1.js';save(p,changed_bytes)
    save(HERE/'source_evidence/richards_js_count.patch',''.join(difflib.unified_diff(original.splitlines(True),changed.splitlines(True),fromfile='upstream/richards.js',tofile='DIAGNOSTIC_ONLY/richards.js')))
    for e in c.ENGINES:
        r=b.capture(HERE/'raw/diagnostics'/f'richards_js_counts_{e}.json',b.command(e,p));check(r)
        assert 'FUNCTION_COUNTS ' in r['stdout']

def dumps():
    p=script(1)
    env=dict(os.environ,ML_DUMP='1')
    cmd=b.command('quickjs',p);cmd[0]=b.DIAG
    q=b.capture(HERE/'raw/diagnostics/richards_quickjs_dump.json',cmd,env=env);check(q)
    save(HERE/'richards/quickjs.full.txt',q['stdout'])
    v=b.capture(HERE/'raw/diagnostics/richards_v8_dump.json',b.command('v8',p,('--print-bytecode','--print-bytecode-filter=*')));check(v)
    save(HERE/'richards/v8.full.txt',v['stdout'])
    print('RICHARDS_DUMPS',len(q['stdout']),len(v['stdout']),flush=True)

if __name__=='__main__':
    mode=sys.argv[1] if len(sys.argv)>1 else 'all'
    if mode in ('all','sample'):sample()
    if mode in ('all','counts'):counts()
    if mode in ('all','dump'):dumps()
