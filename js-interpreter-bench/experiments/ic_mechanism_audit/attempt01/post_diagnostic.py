"""After formal collection only: reuse original M reason counters; static excerpts."""
import difflib
from common import *
from run import script
from diagnostic_run import function_name
REASONS=['own_miss','descriptor','special','unhashed','inherited','missing','primitive']
def main():
    assert (HERE/'identity_after.json').exists(),'never run diagnostic concurrently with formal'
    verify_runtime();original=read(MIC/'diagnostic_manifest.json')['versions']['M'];binary=Path(original['binary'])
    assert sha(binary)==original['sha256']
    # Reused counter build has original M algorithms; matching opcodes are exact.
    for name,h in original['source_hashes'].items():assert sha(binary.parent/name)==h
    assert sha(binary.parent/'read_ic_opcodes.inc')==read(HERE/'sources.json')['M_source_files']['read_ic_opcodes.inc']
    reasons=[]
    for n in [1,2]:
        js=script(CASES[2],n,True);report=STORE/'reports'/f'M_reasons.N{n}.json'
        env=os.environ.copy();env['READ_IC_REPORT']=str(report)
        cached=HERE/'raw/build'/f'M_original_reason_diagnostic_N{n}.json'
        r=read(cached) if cached.exists() else capture(f'M_original_reason_diagnostic_N{n}',[binary,js],env=env,timeout=180)
        assert r['command']==[str(binary),str(js)]
        assert r['exit_code']==0 and not r['stderr'] and 'TEB_RESULT:' in r['stdout']
        data=report.read_bytes();dest=HERE/'raw/diagnostic'/f'M_reasons.N{n}.json.gz';save(dest,gzip.compress(data,mtime=0))
        save(HERE/'raw/diagnostic'/f'M_reasons.N{n}.identity.json',dict(binary=original,script_sha256=sha(js),compressed_sha256=sha(dest),uncompressed_sha256=hashlib.sha256(data).hexdigest(),scope='whole correctness process, separate diagnostic layout; no timing inference'))
        d=json.loads(data);assert d['capacity']==1 and d['shape_refs_after_free']==0 and d['live_direct_after_free']==0
        src={x['source_id']:x['source_hex'] for x in d['sources']}
        for f in d['functions']:
            source=src.get(f['source_id'],'');name=function_name(dict(function_hex=f['function_hex'],source_hex=source))
            for s in f['sites']:
                assert s['queries']==s['hits']+s['fallback'] and s['fallback']==sum(s[k] for k in REASONS)
                reasons.append(dict(N=n,function=name,instance_id=f['instance_id'],source_known=bool(source),source_sha256=hashlib.sha256(bytes.fromhex(source)).hexdigest(),pc=s['pc'],atom=bytes.fromhex(s['atom_hex']).decode(errors='replace'),**{k:v for k,v in s.items() if k not in ['pc','atom_hex']}))
    csvout(HERE/'diagnostic_reasons.csv',reasons)
    current=list(csv.DictReader((HERE/'diagnostic_sites.csv').open(encoding='utf8')));coverage=[]
    rr={(x['N'],x['source_sha256'],x['pc']):x for x in reasons if x['source_known']}
    for s in current:
        if s['variant']!='M' or s['case']!=CASES[2] or s['N']!='1':continue
        reason=rr.get((1,s['source_sha256'],int(s['pc'])))
        if s['ic_read_stats_instrumented']=='True' and reason:
            assert reason and int(s['operations'])==reason['queries'] and int(s['hits'])==reason['hits'] and int(s['misses'])==reason['fallback'],(s,reason)
        if not (s['function'].startswith('Scheduler.prototype.') or s['function'].startswith('TaskControlBlock.prototype.') or s['function'].endswith('Task.prototype.run')):continue
        if s['ic_read_stats_instrumented']=='True':assert reason,'selected original Richards source must map'
        readop=s['ic_read_stats_instrumented']=='True'
        coverage.append(dict(function=s['function'],source_sha256=s['source_sha256'],pc=s['pc'],property=s['atom'],opcode=s['before_op'],access='named read' if readop else 'named write',candidate_read_opcode=readop,own_cached_observed=int(s['hits'])>0 if readop else False,operations=s['operations'],queries=s['ic_queries'] if readop else None,hits=s['hits'] if readop else None,misses=s['misses'] if readop else None,find_normal=s['find_normal'],bucket_loads=s['bucket_loads'],chain_probes=s['chain_probes'],reason_counts=json.dumps({k:reason[k] for k in REASONS}) if reason else None,scope='N1 whole correctness process; own count and original-M reason diagnostic independently matched by source SHA+PC',source='diagnostic_sites.csv + diagnostic_reasons.csv',unknown='no time share; no V8 per-site hit rate'))
    for category in ['keyed get/set','global get/set','non-field helpers']:
        coverage.append(dict(function='UNKNOWN',source_sha256=None,pc=None,property=category,opcode=None,access=category,candidate_read_opcode=False,own_cached_observed=False,operations=None,queries=None,hits=None,misses=None,find_normal=None,bucket_loads=None,chain_probes=None,reason_counts=None,scope='not instrumented by current narrow hooks; opcode existence is not frequency',source='M design and opcode coverage',unknown='dynamic count UNKNOWN; not zero'))
    csvout(HERE/'coverage.csv',coverage)
    save(HERE/'reason_gate.json',dict(status='PASS',N1_N2_correspondence=True,cache_release_verified=True,reused_original_diagnostic=original,formal_timing=False))
    # Keep actual source excerpts, line numbers, and complete original-source identities.
    manifest=read(HERE/'manifest.json');paths=[('A',Path(manifest['A_source'])/'quickjs.c'),('B',Path(read(OLD/'build_manifest.json')['artifacts']['B']['source'])/'quickjs.c'),('M',Path(manifest['M_source'])/'quickjs.c')]
    needles=['static force_inline JSShapeProperty *find_own_property','#define GET_FIELD_INLINE','static uint32_t get_ic_prop_offset','static JSValue JS_GetPropertyInternalWithIC','static void rewrite_ic']
    evidence=[]
    for label,p in paths:
        text=p.read_text();lines=text.splitlines();chunks=[]
        for needle in needles:
            hits=[i for i,s in enumerate(lines) if needle in s]
            for i in hits:
                width=90 if needle=='#define GET_FIELD_INLINE' else 32
                chunks += [f'## {needle}, original line {i+1}', '```c']+[f'{j+1:5}: {lines[j]}' for j in range(i,min(i+width,len(lines)))]+['```']
        save(HERE/'source_evidence'/f'{label}_quickjs_excerpts.md','\n'.join(chunks)+'\n')
        evidence.append(dict(label=label,original=str(p),sha256=sha(p),excerpt=f'source_evidence/{label}_quickjs_excerpts.md'))
    for name in ['read_ic_runtime.inc','read_ic_opcodes.inc','read_ic_prepare.inc','read_ic_types.h']:
        p=Path(manifest['M_source'])/name;save(HERE/'source_evidence'/name,p.read_bytes());evidence.append(dict(label='M',original=str(p),sha256=sha(p),excerpt='source_evidence/'+name))
    for c in ['QJS_A','QJS_M']:
        r=capture(c+'_actual_CallInternal',['objdump','-d','-Mintel','--disassemble=JS_CallInternal',manifest['artifacts'][c]['path']]);assert r['exit_code']==0 and 'jmp' in r['stdout']
        save(HERE/'source_evidence'/f'{c}_JS_CallInternal.asm',r['stdout'])
    r=capture('V8_actual_GetNamedProperty_objdump',['objdump','-d','-Mintel','--disassemble=Builtins_GetNamedPropertyHandler',manifest['artifacts']['V8_ON']['path']])
    assert r['exit_code']==0 and '<Builtins_GetNamedPropertyHandler>:' in r['stdout']
    save(HERE/'source_evidence/V8_GetNamedProperty_actual.asm',r['stdout'])
    save(HERE/'source_evidence/identities.json',evidence)
    print('COVERAGE_REASONS_AND_ACTUAL_NATIVE_EVIDENCE_SAVED',flush=True)
if __name__=='__main__':main()
