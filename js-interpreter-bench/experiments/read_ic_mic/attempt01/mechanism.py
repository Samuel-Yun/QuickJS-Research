"""Small untimed mechanism runs; per-final-offset identities, not atom sharing."""
import diagnostic,run
from common import *
from micros import TARGETS
def sites(d,names):
    out=[];sources={s['source_id']:bytes.fromhex(s['source_hex']) for s in d.get('sources',[])}
    for f in d['functions']:
        name=bytes.fromhex(f['function_hex']).decode(errors='replace')
        if name not in names:continue
        source=sources.get(f.get('source_id'))
        canonical=digest(json.dumps([f['bytecode_zero_atoms_hex'],f['atoms']],sort_keys=True).encode())
        for s in f['sites']:
            out.append(dict(function=name,function_instance=f['instance_id'],canonical_code_sha256=canonical,
              source_sha256=digest(source) if source is not None else None,**s))
    return out
def main():
    rows=[];checks=[]
    for c in MICRO_CASES:
        p=run.script(c,2,True)
        for v in ['M','P']:
            d=diagnostic.collect('mechanism_'+c,v,p);ss=sites(d,TARGETS[c]);rows.extend(dict(case=c,variant=v,**s) for s in ss)
            if c in ['M4.numeric_control','M5.write_control']:assert not ss
            else:
                assert ss and all(s['queries']==8192 for s in ss)
                cap=1 if v=='M' else 4
                if c in MICRO_CASES[:3]:assert all(s['max_occupied']==1 and s['hits']==8191 for s in ss)
                elif c=='M6.poly2' and v=='P':assert ss[0]['max_occupied']==2 and ss[0]['hits']==8190
                elif c=='M7.poly4' and v=='P':assert ss[0]['max_occupied']==4 and ss[0]['hits']==8188
                else:assert all(s['max_occupied']<=cap for s in ss)
            checks.append(dict(case=c,variant=v,status='PASS',target_sites=len(ss)))
    p=HERE/'correctness/site_independence.js';save(p,'''function twoSites(a,b){return a.x+b.x;}
var a={x:2,z:0},b={z:0,x:3},sum=0;
for(var i=0;i<4096;i++)sum+=twoSites(a,b);
if(sum!==20480)throw Error('sum');console.log('PASS independent sites');
''')
    for v in ['M','P']:
        d=diagnostic.collect('site_independence',v,p);ss=sites(d,['twoSites'])
        assert len(ss)==2 and len({s['pc'] for s in ss})==2
        assert all(s['queries']==4096 and s['hits']==4095 and s['max_occupied']==1 for s in ss)
        rows.extend(dict(case='same_atom_two_sites',variant=v,**s) for s in ss)
    for label,source in [('many_functions_once',"var z=0;for(var i=0;i<200;i++){var f=Function('o','return o.x');z+=f({x:3});}if(z!==600)throw Error('z');console.log('PASS');"),
      ('one_function_many',"function once(o){return o.x;}var z=0,o={x:3};for(var i=0;i<200;i++)z+=once(o);if(z!==600)throw Error('z');console.log('PASS');")]:
        p=HERE/'correctness'/f'{label}.js';save(p,source)
        for v in ['M','P']:diagnostic.collect(label,v,p)
    save(HERE/'correctness/target_sites.json',rows)
    save(HERE/'correctness/mechanism_gate.json',dict(status='PASS',checks=checks,same_atom_independent_sites=True,first_queries_in_denominator=True,
      key='compiled function canonical code + atom operand map + source SHA256 when available + final bytecode offset; instance_id process-local only',
      M_max_capacity=1,P_max_capacity=4))
    print('MECHANISM_GATE_PASS',flush=True)
if __name__=='__main__':main()
