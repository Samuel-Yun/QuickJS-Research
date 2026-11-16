"""Read-only raw replay, including incomplete coverage. Standard library only.

python offline_audit.py --output summary
python offline_audit.py --output replay01
No runtime, WSL, private project or precomputed CSV is needed.
"""
import argparse,csv,gzip,hashlib,io,json,re
from pathlib import Path
from collections import defaultdict,Counter
HERE=Path(__file__).resolve().parent
PHASES=['load_compile','setup','run','validation','teardown','destroy']
FIELDS=['operations','ic_queries','hits','misses','cache_probes','updates','insertions','replacements','same_shape_updates','find_normal','bucket_loads','chain_probes','generic_get','value_int','value_object','value_other','retains','releases','own_miss','descriptor','special','unhashed','inherited','missing','primitive','other']
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def digest(x):return hashlib.sha256(x).hexdigest()
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def put(p,x):
    p.parent.mkdir(parents=True,exist_ok=True)
    with p.open('x',encoding='utf-8',newline='') as f:f.write(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def csvout(p,rows):
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);put(p,s.getvalue())
def name_from_source(fn,source,case):
    if fn:return fn
    original=HERE/'inputs'/('splay.js' if case=='Splay.Splay' else 'richards.js')
    if not original.exists() or not source:return 'UNKNOWN_ANONYMOUS'
    data=original.read_bytes();i=data.find(source)
    if i<0:return 'UNKNOWN_ANONYMOUS'
    if data.find(source,i+1)>=0:return 'UNKNOWN_SHARED_SOURCE'
    m=re.search(rb'([\w.$]+)\s*=\s*$',data[:i])
    return m[1].decode() if m else 'UNKNOWN_ANONYMOUS'
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--output',default='summary');args=ap.parse_args();out=HERE/args.output
    assert not out.exists(),'new output directory required'
    rawdir=HERE/'diagnostic_v3/raw';paths=sorted(rawdir.glob('*.json.gz'));before={p.relative_to(HERE).as_posix():sha(p) for p in paths}
    sites=[];mapping=[];coverage=[];phase_totals=[];errors=[];selected_dump=[]
    catalog=load(HERE/'inputs/case_catalog.json')
    cases=[r['case'] for r in catalog if r['suite']!='Box2D'];observed=set();boots=set()
    for p in paths:
        labelname=p.name[:-8];stem,ntext=labelname.rsplit('.N',1);case,condition=stem.rsplit('.',1);n=int(ntext)
        data=gzip.decompress(p.read_bytes());d=json.loads(data);identity=load(rawdir/(labelname+'.archive.json'));process=load(rawdir/(labelname+'.process.json'))
        assert digest(data)==identity['raw_sha256'] and sha(p)==identity['compressed_sha256']
        assert process['exit_code']==0 and not process['stderr'] and not process['timeout']
        payload=[json.loads(x.split(':',1)[1]) for x in process['stdout'].splitlines() if x.startswith('OCTANE_IC_RESULT:')]
        assert len(payload)==1 and payload[0]['correctness']=='PASS' and payload[0]['N']==n and payload[0]['warmup_calls']==0
        observed.add((case,condition,n));boots.add(process['boot_id']);totals=[Counter() for _ in PHASES]
        ids=set();by_source=Counter()
        for f in sorted(d['functions'],key=lambda x:x['instance_id']):
            assert f['instance_id'] not in ids;ids.add(f['instance_id'])
            source=bytes.fromhex(f['source_hex']);code=bytes.fromhex(f['code_before_hex']);fn=bytes.fromhex(f['function_hex']).decode(errors='replace');fn=name_from_source(fn,source,case)
            if b'dummy = left = right' in source:fn='SplayTree.prototype.splay_'
            source_sha=digest(source);canonical=[];end=0
            for op in f['opcodes']:
                pc=op['pc'];size=op['size'];assert pc==end and size>0 and pc+size<=len(code);end=pc+size
                atom=bytes.fromhex(op['atom_hex']).decode(errors='replace');opname=op['before_op'].replace('_rdi','')
                # Symbolic atom removes process-local IDs. Other operand bytes remain.
                operand=code[pc+5:pc+size].hex() if atom else code[pc+1:pc+size].hex()
                canonical.append([pc,size,opname,atom,operand])
                for st in op['phases']:
                    phase=st['phase'];assert phase in range(6)
                    if '_rdi' in op['before_op']:
                        assert st['operations']==st['ic_queries']==st['hits']+st['misses']
                        assert st['updates']==st['insertions']+st['replacements']+st['same_shape_updates']
                        assert st['misses']==sum(st.get(k,0) for k in ['own_miss','descriptor','special','unhashed','inherited','missing','primitive','other'])
                    counters={k:st.get(k,0) for k in FIELDS}
                    row=dict(case=case,condition=condition,repetitions=n,phase=PHASES[phase],function=fn,source_sha256=source_sha,instance_id=f['instance_id'],pc=pc,opcode=op['before_op'],atom=atom,**counters)
                    sites.append(row)
                    if 'get_field' in op['before_op'] or op['before_op']=='get_length':totals[phase].update(counters)
            assert end==len(code)
            canonical_sha=digest(json.dumps(canonical,separators=(',',':')).encode());key=(source_sha,canonical_sha);by_source[key]+=1
            mapping.append(dict(case=case,condition=condition,repetitions=n,instance_id=f['instance_id'],function=fn,source_sha256=source_sha,canonical_ops_sha256=canonical_sha,compilation_occurrence=by_source[key],raw_archive=p.relative_to(HERE).as_posix()))
            if case=='Splay.Splay' and n==2 and fn=='SplayTree.prototype.splay_':selected_dump.append((condition,f))
        for phase,name in enumerate(PHASES):phase_totals.append(dict(case=case,condition=condition,repetitions=n,phase=name,**{k:totals[phase][k] for k in FIELDS},all_context_find=d['global_by_phase'][phase]['all_find'],outside_property_context_find=d['global_by_phase'][phase]['outside_find']))
    for case in cases:
        for c in ['A','M']:
            for n in [1,2]:coverage.append(dict(case=case,condition=c,repetitions=n,status='PASS' if (case,c,n) in observed else 'MISSING',formal_exclusion=False,reason='' if (case,c,n) in observed else 'diagnostic campaign interrupted; no valid completion record'))
    targets=[r for r in sites if r['case']=='Splay.Splay' and r['condition']=='M' and r['repetitions']==2 and r['phase']=='run' and r['function']=='SplayTree.prototype.splay_']
    targets=sorted(targets,key=lambda x:x['replacements'],reverse=True)
    assert [r['pc'] for r in targets[:3]]==[43,138,147]
    legacy=load(HERE/'diagnostic/focus_plan.json')['targets']
    assert all((a['pc'],a['operations'],a['hits'],a['replacements'])==(b['pc'],b['operations'],b['hits'],b['replacements']) for a,b in zip(targets[:3],legacy))
    rich=sorted([r for r in sites if r['case']=='Richards.Richards' and r['condition']=='M' and r['repetitions']==2 and r['phase']=='run'],key=lambda r:r['operations'],reverse=True)
    csvout(out/'diagnostic_sites.csv',sites);csvout(out/'phase_totals.csv',phase_totals);csvout(out/'function_mapping.csv',mapping);csvout(out/'coverage.csv',coverage);csvout(out/'splay_top_maintenance.csv',targets);csvout(out/'richards_top_frequency.csv',rich)
    for condition,f in selected_dump:
        code=bytes.fromhex(f['code_before_hex']);lines=['# '+condition+' original SplayTree.prototype.splay_','Diagnostic export; final executable bytecode after compilation/prepare, before Run.','Source SHA256: '+digest(bytes.fromhex(f['source_hex'])),'```javascript',bytes.fromhex(f['source_hex']).decode(),'```','pc | opcode | property | raw operand bytes (not a complete operand decoder)','```text']
        for op in f['opcodes']:
            pc=op['pc'];lines.append(f'{pc:4} {op["before_op"]:24} {bytes.fromhex(op["atom_hex"]).decode(errors="replace"):16} {code[pc+1:pc+op["size"]].hex()}')
        lines+=['```','Full executable bytes: '+code.hex()];put(out/f'{condition}_splay_bytecode.md','\n'.join(lines)+'\n')
    v8=(HERE/'v8/N2.bytecode_feedback.txt').read_text(encoding='utf-8');start=v8.index('[generated bytecode for function: SplayTree.splay_ ');stop=v8.index('[generated bytecode for function:',start+1)
    put(out/'V8_splay_bytecode.txt',v8[start:stop])
    # Preserve before/after stage evidence verbatim; do not turn state into hits.
    snapshots=[]
    for part in re.split(r'SP_PHASE:',v8)[1:]:
        if part.startswith(('2\n','3\n','2\r','3\r')):snapshots.append('SP_PHASE:'+part.split('OCTANE_IC_RESULT:')[0])
    if snapshots:put(out/'V8_Run_boundary_debugprint.txt','\n'.join(snapshots))
    for k in ['A','M','V8_ON']:
        post=next(r for r in load(HERE/'post_artifact_probe.json')['records'] if r['label']==k)
        assert post['sha256']==post['expected'] and post['process']['exit_code']==0
    for r in load(HERE/'post_artifact_probe.json')['source_checks']+load(HERE/'post_artifact_probe.json')['dependencies']:assert r['actual_sha256']==r['expected_sha256']
    missing=[r for r in coverage if r['status']!='PASS'];assert before=={p.relative_to(HERE).as_posix():sha(p) for p in paths}
    put(out/'audit.json',dict(status='BLOCKED_ENVIRONMENT_PARTIAL',valid_diagnostic_processes=len(observed),expected_diagnostic_processes=68,missing=missing,
      initial_dense_diagnostics_separate_count=len(list((HERE/'diagnostic/raw').glob('*.json.gz'))),raw_integrity='PASS',counter_invariants='PASS_FOR_SAVED_RECORDS',
      Splay_selected_counts_reproduced_across_two_diagnostic_layouts=True,Run_counts_are_not_timings=True,diagnostic_boot_count=len(boots),formal_samples=0,
      control_samples=0,OPT='NOT_IMPLEMENTED_WITH_REASON',OPT_reason='shape-focused and controlled-effect gates not reached after repeated WSL disappearance; no safe effect-based choice',
      formal_expected_without_OPT=1530,formal_expected_with_OPT=2040,V8_Run_fast_hits=None,V8_Run_fallback_count=None,V8_direct_feedback_slot_snapshot=None,actual_V8_build_commit=None,
      frozen_artifact_and_source_postcheck='PASS',analysis_requires_runtimes=False,analysis_requires_private_project=False))
    put(out/'raw_hashes.json',before)
    print('OFFLINE_PARTIAL_AUDIT',len(observed),'/68, missing',len(missing),'formal=0; integrity/invariants PASS')
if __name__=='__main__':main()
