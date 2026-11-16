"""Bounded existing aggregate counters, no sampler or diagnostic timings."""
import argparse
from common import *
from workload import script,valid_payload

def run():
    a=read(HERE/'diagnostic_manifest.json');assert sha(a['path'])==a['sha256'];rows=[];memory=[];reports={}
    for case in CASES:
        for n in [1,2]:
            p=script(case,n,True)
            for c in ['OFF','ON']:
                report=STORE/'reports'/f'{case}.N{n}.{c}.json';report.parent.mkdir(parents=True,exist_ok=True);assert not report.exists()
                env=environment(option(c));env['IC_MECHANISM_REPORT']=str(report)
                name=f'{case}.N{n}.{c}';r=capture('diagnostic.'+name,[a['path'],p],env=env);valid_payload(r,case,n,True)
                data=report.read_bytes();dest=HERE/'raw/diagnostic'/(name+'.json.gz');save(dest,gzip.compress(data,mtime=0))
                save(HERE/'raw/diagnostic'/(name+'.identity.json'),dict(binary=a,option=option(c),script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),compressed_sha256=sha(dest),raw_sha256=hashlib.sha256(data).hexdigest()))
                d=json.loads(data);reports[case,n,c]=d;assert d['proto_option']==int(option(c))
                g=d['cache_lifecycle'];assert g['site_sizeof']==24 and not g['final_requested_live_bytes'] and g['shape_retains']==g['shape_releases']
                memory.append(dict(case=case,N=n,condition=c,**g))
                for f in d['functions']:
                    source_sha=hashlib.sha256(bytes.fromhex(f['source_hex'])).hexdigest()
                    for op in f['opcodes']:
                        if not op['ic_queries']:continue
                        assert op['ic_queries']==op['hits']+op['misses'] and op['hits']==op['h_own_hits']+op['h_proto_hits']
                        if c=='OFF':assert not op['h_proto_hits'] and not op['h_proto_fills']
                        rows.append(dict(case=case,N=n,condition=c,source_sha256=source_sha,instance_id=f['instance_id'],function=bytes.fromhex(f['function_hex']).decode(errors='replace'),pc=op['pc'],opcode=op['before_op'],atom=bytes.fromhex(op['atom_hex']).decode(errors='replace'),queries=op['ic_queries'],hits=op['hits'],fallback=op['misses'],own_hits=op['h_own_hits'],prototype_hits=op['h_proto_hits'],own_fills=op['h_own_fills'],prototype_fills=op['h_proto_fills'],replacements=op['replacements'],normal_find=op['find_normal']))
    comparisons=[]
    for case in CASES:
        for n in [1,2]:
            off=reports[case,n,'OFF'];on=reports[case,n,'ON']
            def index(d):return {(f['instance_id'],f['function_hex'],f['source_hex']):f for f in d['functions']}
            aa,bb=index(off),index(on);assert set(aa)==set(bb)
            for k in aa:assert aa[k]['code_before_hex']==bb[k]['code_before_hex']
            if case=='numeric_control':
                target=[f for f in on['functions'] if bytes.fromhex(f['function_hex']).decode()=='m4Loop'];assert len(target)==1
                assert not any(op['ic_queries'] or 'get_field' in op['before_op'] for op in target[0]['opcodes'])
            assert off['cache_lifecycle']['created_sites']==on['cache_lifecycle']['created_sites']
            comparisons.append(dict(case=case,N=n,compiled_functions=len(aa),final_bytes_equal=True,site_count_equal=True))
    # Specific new-run evidence; source and PC, not atom name alone.
    target={('prototype_method','step'):'f89a684f97c9dfbb9fe6d27f22dc40eb779d48aa3534ba99bb33978cc467c804',
      ('Richards.Richards','isHeldOrSuspended'):'927f4561195466f7b1ddc4deed5c9deb70cb1ee6cc095a49059e499c5cb59f79'}
    selected=[]
    for r in rows:
        wanted=(r['case']=='prototype_method' and r['source_sha256']==target['prototype_method','step'] and r['pc']==13) or (r['case']=='own_integer' and r['function']=='m1Read' and r['pc']==13) or (r['case']=='Richards.Richards' and ((r['source_sha256']==target['Richards.Richards','isHeldOrSuspended'] and r['pc'] in [30,83]) or (r['source_sha256']=='10a938963415dedb8156eb5cfab58f0ef58498c0a7a998de96c456442aba2268' and r['pc']==73)))
        if not wanted:continue
        selected.append(r)
        if r['case']=='own_integer':assert r['own_hits']==4096*r['N']-1 and r['own_fills']==1
        elif r['condition']=='ON':assert r['prototype_hits']>0 and r['prototype_fills']>0
        else:assert r['hits']==0 and r['normal_find']==2*r['queries']
    assert len(selected)==20
    # New ON must reproduce the archived H target mechanism, not old timings.
    import csv
    with (OLD/'mechanism_sites.csv').open(encoding='utf-8',newline='') as f:previous=list(csv.DictReader(f))
    for r in selected:
        if r['condition']!='ON':continue
        x=[x for x in previous if x['variant']=='H' and x['case']==r['case'] and int(x['N'])==r['N'] and x['source_sha256']==r['source_sha256'] and int(x['pc'])==r['pc']]
        assert len(x)==1,(r,x)
        for new,old in [('queries','queries'),('hits','hits'),('fallback','fallback'),('prototype_hits','proto_hits'),('prototype_fills','proto_fills'),('replacements','replacements'),('normal_find','normal_find')]:assert r[new]==int(x[0][old]),(new,r,x)
    csvout(HERE/'mechanism_sites.csv',rows);csvout(HERE/'target_sites.csv',selected);csvout(HERE/'cache_memory.csv',memory)
    save(HERE/'bytecode_comparison.json',comparisons)
    save(HERE/'gates/mechanism.json',dict(status='PASS',processes=16,same_diagnostic_ELF=True,OFF_no_inherited_fills_or_hits=True,own_IC_preserved=True,bytecode_and_site_count_equal=True,site_sizeof=24,cache_edges_balanced=True,numeric_control='no target field in m4Loop; driver has IC',scope='whole process; no performance inference'))
    print('MECHANISM_PASS',flush=True)

if __name__=='__main__':run()
