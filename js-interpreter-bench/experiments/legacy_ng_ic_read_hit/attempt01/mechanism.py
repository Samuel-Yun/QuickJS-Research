"""Micro target bytecode and separate rewritten-unit counter evidence."""
import re,shutil
from common import *
from micros import TARGETS
def main():
    import run,diagnostic
    run.verify();dst=STORE/'C_bytecode'
    if not dst.exists():
        shutil.copytree(STORE/'C',dst,ignore=shutil.ignore_patterns('.obj','qjs','qjsc','run-test262','libquickjs.a','*.so','roundtrip_slots','multislot_embedded'))
        p=dst/'quickjs.c';s=p.read_text();assert s.count('//#define DUMP_BYTECODE')==1
        p.write_text(re.sub(r'^//#define DUMP_BYTECODE.*$','#define DUMP_BYTECODE 1',s,flags=re.M))
        r=capture('bytecode_build',['make','-j2','qjs'],dst);assert r['exit_code']==0
    rows=[];full=[]
    for case in MICRO_CASES:
        script=run.script(case,2,True)
        r=capture('bytecode_'+case,[dst/'qjs',script]);assert r['exit_code']==0 and not r['stderr'] and 'TEB_RESULT:' in r['stdout']
        save(HERE/'bytecode'/f'{case}.raw.txt',r['stdout'])
        # Dump is final pass (&1), not mid-compiler IR. Retain full raw plus target sections.
        targettext=[]
        for name in TARGETS[case]:
            match=re.search(r'^.*:.*'+re.escape(name)+r'.*$',r['stdout'],re.M)
            # Raw dump headings are inspected separately; do not invent a parser.
            lines=r['stdout'].splitlines();starts=[i for i,l in enumerate(lines) if re.match(r'^function:\s*'+re.escape(name)+r'\s*$',l)]
            if not starts:
                starts=[i for i,l in enumerate(lines) if re.match(r'^.*function:.*\b'+re.escape(name)+r'\b',l)]
            if starts:
                i=starts[0];j=next((j for j in range(i+1,len(lines)) if lines[j].startswith('function:')),len(lines))
                targettext.extend(lines[i:j])
        if targettext:save(HERE/'bytecode'/f'{case}.targets.txt','\n'.join(targettext)+'\n')
        for v in ['C','D']:
            d=diagnostic.collect('mechanism_'+case,v,script)
            for u in d['units_detail']:
                fn=bytes.fromhex(u['function_hex']).decode(errors='replace')
                atom=bytes.fromhex(u['atom_hex']).decode(errors='replace')
                if fn in TARGETS[case]:rows.append(dict(case=case,variant=v,function=fn,atom=atom,**{k:u[k] for k in ['read_queries','read_hits','read_fallback','write_queries','write_hits','write_fallback','probes','max_filled_slots']}))
            tu=[u for u in d['units_detail'] if bytes.fromhex(u['function_hex']).decode(errors='replace') in TARGETS[case]]
            if case.startswith(('M1.','M2.')):
                x=[u for u in tu if bytes.fromhex(u['atom_hex'])==b'x'];assert len(x)==1 and x[0]['read_queries']==8191 and x[0]['read_hits']==8191
            if case.startswith('M3.'):
                step=[u for u in tu if bytes.fromhex(u['atom_hex'])==b'step'];assert len(step)==1 and step[0]['read_queries']==8191 and step[0]['read_hits']==8191
            if case.startswith('M4.'):assert not tu
            if case.startswith('M5.'):
                x=[u for u in tu if bytes.fromhex(u['atom_hex'])==b'x'];assert len(x)==1 and x[0]['read_queries']==0 and x[0]['write_queries']==8191 and x[0]['write_hits']==8191
    csvout(HERE/'correctness/target_units.csv',rows)
    save(HERE/'correctness/mechanism_gate.json',dict(status='PASS',N=2,inner_iterations=4096,versions=['C','D'],target_read_units_stable_hits=True,
      M4_no_target_property_units=True,M5_target_write_only=True,scope='target function+atom; driver units excluded; first normal opcode excluded from query denominator',
      bytecode_binary_sha256=sha(dst/'qjs'),bytecode_formal_binary=False,final_dump_flag=1))
    print('MICRO_MECHANISM_PASS',flush=True)
if __name__=='__main__':main()
