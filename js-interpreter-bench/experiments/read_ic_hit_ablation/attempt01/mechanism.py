"""Untimed intervention/state gates before any pilot/formal collection."""
import diagnostic,run
from common import *
from micros import TARGETS
def targets(d,names):
    return [dict(function=bytes.fromhex(f['function_hex']).decode(errors='replace'),**s) for f in d['functions'] if bytes.fromhex(f['function_hex']).decode(errors='replace') in names for s in f['sites']]
def main():
    rows=[];checks=[]
    for c in MICRO_CASES:
        p=run.script(c,2,True);ds={v:diagnostic.collect('gate_'+c,v,p) for v in ['ON','LOOKUP']};diagnostic.match(ds['ON'],ds['LOOKUP'])
        for v,d in ds.items():
            ss=targets(d,TARGETS[c]);rows.extend(dict(case=c,variant=v,**s) for s in ss)
            if c=='M4.numeric_control':assert not ss
            else:
                assert len(ss)==1 and ss[0]['queries']==8192;s=ss[0]
                if c=='M6.poly2':assert s['candidate_hit']==0 and s['hash_find_calls']==8192
                else:
                    assert s['candidate_hit']==8191 and s['updates']==1
                    assert s['hash_find_calls']==(1 if v=='ON' else 8192) and s['hash_chain_probes']==s['hash_find_calls']
            checks.append(dict(case=c,variant=v,target_sites=len(ss),status='PASS'))
    p=HERE/'correctness/site_independence.js'
    for v in ['ON','LOOKUP']:diagnostic.collect('gate_independent_sites',v,p)
    a=read(HERE/'raw/diagnostic/gate_independent_sites.ON.json.gz');b=read(HERE/'raw/diagnostic/gate_independent_sites.LOOKUP.json.gz');diagnostic.match(a,b)
    for v in ['ON','LOOKUP']:
        src=Path(read(HERE/'diagnostic_manifest.json')['source']);obj=src/'.obj';exe=src/'native_latch'
        if not exe.exists():
            cmd=['gcc','-O2','-g','-I'+str(src),str(HERE/'correctness/native_latch.c')]+[str(obj/(x+'.o')) for x in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(exe)]
            r=capture('native_latch_build',cmd);assert not r['exit_code']
        # collector invokes the native program; no JS arguments consumed by it.
        d=diagnostic.collect('gate_native_latch',v,None,binary=exe);assert d['runtime_initializations']==2
    save(HERE/'correctness/target_gate_sites.json',rows)
    save(HERE/'correctness/mechanism_gate.json',dict(status='PASS',checks=checks,candidate_sequences_and_maintenance_match=True,
      own_hash_eliminated_ON_and_retained_LOOKUP=True,numeric_target_read_sites=0,process_configuration_latched=True,
      identity='source SHA + canonical final bytecode/atom map + final pc; duplicate compiled instances compared as multiset, not ID'))
    print('MECHANISM_GATE_PASS',flush=True)
if __name__=='__main__':main()
