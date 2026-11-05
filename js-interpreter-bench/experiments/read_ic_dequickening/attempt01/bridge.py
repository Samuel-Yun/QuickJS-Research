"""Bounded independent M/ON check, no parameter/layout search and no main raw mixing."""
import argparse,collections,math,random,re,shutil,statistics as st
from common import *
BRIDGE_CASES=['M4.numeric_control','Richards.Richards']
def one(s,a,b):assert s.count(a)==1,(a,s.count(a));return s.replace(a,b,1)
def diag_build():
    ids=read(HERE/'bridge_check/source_identity.json')['files'];art={}
    for v in ['M','SW']:
        dst=STORE/(v+'_bridge_diagnostic');attempt=1
        while dst.exists():attempt+=1;dst=STORE/(v+'_bridge_diagnostic'+str(attempt))
        for n in ids[v]:
            p=dst/n;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(STORE/v/n,p)
        shutil.copy2(HERE/'bridge_counter.inc',dst/'bridge_counter.inc')
        p=dst/'quickjs.c';s=p.read_text();s=one(s,'#ifdef OPCODE_ASM_LABEL\n#pragma GCC diagnostic push','static void bridge_count(JSContext*,JSFunctionBytecode*,const uint8_t*,int);\n\n#ifdef OPCODE_ASM_LABEL\n#pragma GCC diagnostic push')
        s=one(s,'#define SWITCH(pc)      goto *dispatch_table[opcode = *pc++];','#define SWITCH(pc)      do { opcode=*pc++; bridge_count(ctx,b,pc-1,opcode); goto *dispatch_table[opcode]; } while(0);')
        s=one(s,'#include "read_ic_prepare.inc"','#include "read_ic_prepare.inc"\n#include "bridge_counter.inc"');p.write_text(s)
        p=dst/'qjs.c';s=p.read_text();s=one(s,'int main(int argc, char **argv)','extern void bridge_report(void);\nint main(int argc, char **argv)');s=one(s,'    return 0;\n fail:','    bridge_report();\n    return 0;\n fail:');p.write_text(s)
        e=clean_env()
        if v=='SW':e['QJS_READ_IC_MODE']='1'
        r=capture(v+'_bridge_counter_build',['make','-j2','qjs'],dst,env=e);assert not r['exit_code']
        art[v]=dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source_files={n:sha(dst/n) for n in ['quickjs.c','qjs.c','bridge_counter.inc']})
    save(HERE/'bridge_check/diagnostic_manifest.json',art)
def collect():
    import run
    m=read(HERE/'bridge_check/manifest.json');d=read(HERE/'bridge_check/diagnostic_manifest.json')
    for c in BRIDGE_CASES:
        p=run.script(c,2,True)
        for v in ['M','SW']:
            e=clean_env();e['QJS_READ_IC_MODE']='1'
            dest=STORE/f'bridge_{c}.{v}.json';e['BRIDGE_REPORT']=str(dest)
            r=capture('bridge_dispatch_'+c+'_'+v,[d[v]['path'],p],env=e);assert not r['exit_code'] and not r['stderr'] and 'TEB_RESULT:' in r['stdout']
            gz=HERE/'bridge_check/diagnostic'/f'{c}.{v}.json.gz';meta=compress(dest,gz);save(str(gz)+'.metadata.json',dict(**meta,binary_sha256=d[v]['sha256'],script_sha256=sha(p),N=2,performance_sample=False))
    facts=[]
    def canonical(d):return sorted((f['name_hex'],f['normalized_code_hex'],json.dumps(f['atoms'],sort_keys=True),json.dumps(f['dispatch'],sort_keys=True)) for f in d['functions'])
    for c in BRIDGE_CASES:
        a,b=[read(HERE/'bridge_check/diagnostic'/f'{c}.{v}.json.gz') for v in ['M','SW']]
        assert canonical(a)==canonical(b),'bridge bytecode or dynamic dispatch mismatch'
        target=[f for f in a['functions'] if bytes.fromhex(f['name_hex']).decode()=='m4Loop'] if c.startswith('M4') else []
        if c.startswith('M4'):
            assert len(target)==1 and not any('get_field' in name for name in target[0]['dispatch'])
        facts.append(dict(case=c,canonical_code_atoms_and_per_function_dispatch_counts_equal=True,numeric_target_read_dispatches=0 if target else None,scope='actual N2 diagnostic; no opcode counts extrapolated to formal N'))
    save(HERE/'bridge_check/dispatch_gate.json',dict(status='PASS',checks=facts))
    r=capture('bridge_perf_availability',['sh','-c','command -v perf && perf stat -e cycles,instructions -- true']);save(HERE/'bridge_check/perf.json',dict(available=r['exit_code']==0,events=['cycles','instructions'],privileged_changes=False,log='raw/build/bridge_perf_availability.1.json',hardware_counts='UNKNOWN' if r['exit_code'] else 'capability only, not workload profile'))
    # Actual formal handler and complete JS_CallInternal disassembly, not diagnostic timings.
    for v in ['M','SW']:
        exe=m['artifacts'][v]['path']
        for name,cmd in [('size',['size',exe]),('nm',['nm','-S','--defined-only',exe]),('sections',['objdump','-h',exe])]:capture('bridge_'+v+'_'+name,cmd)
        text=subprocess.check_output(['objdump','-d','-l','-M','intel','--disassemble=JS_CallInternal',exe],text=True)
        save(HERE/'bridge_check/machinecode'/f'{v}_JS_CallInternal.asm',text)
    print('BRIDGE_DISPATCH_GATE_PASS',flush=True)
def timing():
    import run
    assert read(HERE/'bridge_check/dispatch_gate.json')['status']=='PASS';m=read(HERE/'bridge_check/manifest.json');rng=random.Random(SEED);schedule=[]
    orders={c:['M/ON']*6+['ON/M']*6 for c in BRIDGE_CASES}
    for o in orders.values():rng.shuffle(o)
    for rep in range(12):
        cs=BRIDGE_CASES.copy();rng.shuffle(cs)
        for c in cs:
            n=read(ABLATION/'selected'/f'{c}.json')['N']
            for pos,v in enumerate(orders[c][rep].split('/')):schedule.append(dict(case=c,N=n,rep=rep,order=pos,variant=v))
    save(HERE/'bridge_check/schedule.json',schedule);rows=[]
    for s in schedule:
        c,n,v=s['case'],s['N'],s['variant'];src='SW' if v=='ON' else 'M';a=m['artifacts'][src];assert sha(a['path'])==a['sha256']
        path=HERE/'bridge_check/raw'/f'{c}.rep{s["rep"]}.{v}.json'
        if path.exists():
            old=read(path);assert old['environment'].get('QJS_READ_IC_MODE')=='1','old bridge environment differs; preserve it and use bridge_matched.py, never overwrite'
            rows.append(old);continue
        p=run.script(c,n);e=clean_env();e['QJS_READ_IC_MODE']='1'
        start=time.perf_counter_ns();x=subprocess.run([a['path'],str(p)],env=e,capture_output=True,text=True,timeout=300);stop=time.perf_counter_ns()
        r=dict(**s,stage='bridge_only',command=[a['path'],str(p)],binary_sha256=a['sha256'],script_sha256=sha(p),environment=e,exit_code=x.returncode,stdout=x.stdout,stderr=x.stderr,outer_start_ns=start,outer_stop_ns=stop,timestamp=stamp(),valid=False)
        try:
            assert x.returncode==0 and not x.stderr;payload=json.loads(re.findall(r'^TEB_RESULT:(.*)$',x.stdout,re.M)[0]);elapsed=payload['stop_ms']-payload['start_ms']
            assert elapsed==payload['elapsed_ms'] and elapsed>0 and math.isfinite(elapsed) and payload['correctness']=='PASS' and payload['warmup_calls']==0
            assert start/1e6-1<=payload['start_ms']<payload['stop_ms']<=stop/1e6+1
            r.update(valid=True,payload=payload,elapsed_ms=elapsed,ms_per_Run=elapsed/n)
        except (AssertionError,IndexError,ValueError,KeyError):r['error']='identity_or_clock_or_correctness'
        save(path,r);assert r['valid'],'BLOCKED_TIMER_OR_CORRECTNESS bridge record preserved';rows.append(r);print('BRIDGE',c,v,s['rep'],'PASS',flush=True)
    out=[]
    for c in BRIDGE_CASES:
        ms={v:st.median(r['ms_per_Run'] for r in rows if r['case']==c and r['variant']==v) for v in ['M','ON']}
        out.append(dict(case=c,pairs=12,M_ms=ms['M'],ON_ms=ms['ON'],M_ON=ms['M']/ms['ON'],ON_time_change_pct=(ms['ON']/ms['M']-1)*100,under_1000ms=sum(r['elapsed_ms']<1000 for r in rows if r['case']==c)))
    csvout(HERE/'bridge_check/summary.csv',out);save(HERE/'bridge_check/audit.json',dict(status='PASS',expected=48,actual=len(rows),valid=sum(r['valid'] for r in rows),main_formal=False,orders='M/ON and ON/M six each per case',no_tuning=True))
    print('BRIDGE_48_PASS',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['diag_build','collect','timing']);a=p.parse_args();globals()[a.stage]()
