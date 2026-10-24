"""Independent shared switch ELF: real candidate, maintenance and hash counters."""
import argparse,collections,shutil
from common import *
FIELDS=['queries','hits','fallback','candidate_hit','candidate_miss','direct_returns','forced_lookup_on_candidate_hit','comparisons','shape_misses','updates','update_comparisons','insertions','replacements','own_miss','descriptor','special','unhashed','inherited','missing','primitive','hash_find_calls','hash_bucket_loads','hash_chain_probes']
STATE=['queries','hits','fallback','candidate_hit','candidate_miss','candidate_sequence_hash','comparisons','shape_misses','updates','update_comparisons','insertions','replacements','max_occupied','own_miss','descriptor','special','unhashed','inherited','missing','primitive']
def one(s,a,b):assert s.count(a)==1,(a[:70],s.count(a));return s.replace(a,b,1)
def build():
    src=STORE/'SW_diagnostic';assert not src.exists()
    ids=read(HERE/'sources/identities.json')['files']['SW']
    for n in ids:
        d=src/n;d.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(STORE/'SW'/n,d)
    for n in ['read_ic_diag.h','read_ic_diag_prepare.inc']:shutil.copy2(PREVIOUS/'implementation'/n,src/n)
    p=src/'quickjs.c';s=p.read_text();s='#define READ_IC_DIAGNOSTIC 1\n'+s
    a=s.index('static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,');z=s.index('\n}',a)+2;body=s[a:z]
    body=one(body,'    sh = p->shape;','    rdi_all_hash[0]++; if (rdi_hash_context) rdi_hash_context[0]++;\n    sh = p->shape;')
    body=one(body,'    h = sh->hash_table[h];','    rdi_all_hash[1]++; if (rdi_hash_context) rdi_hash_context[1]++;\n    h = sh->hash_table[h];')
    body=one(body,'    while (h) {','    while (h) {\n        rdi_all_hash[2]++; if (rdi_hash_context) rdi_hash_context[2]++;')
    s=s[:a]+'static _Thread_local unsigned long long *rdi_hash_context;\nstatic unsigned long long rdi_all_hash[3];\n'+body+s[z:];p.write_text(s)
    p=src/'read_ic_prepare.inc';p.write_text('#include "read_ic_diag_prepare.inc"\n'+p.read_text())
    p=src/'read_ic_diag.h';s=p.read_text()
    s=one(s,'    unsigned occupied,max_occupied,pc,op;', '''    unsigned long long candidate_hit,candidate_miss,direct_returns,forced_lookup_on_candidate_hit;
    unsigned long long candidate_sequence_hash,hash_counts[3];
    unsigned occupied,max_occupied,pc,op;''')
    s=one(s,'    if(!d->queries)rdi_diag_used++;','    if(!d->queries){rdi_diag_used++;d->candidate_sequence_hash=UINT64_C(14695981039346656037);}')
    s=one(s,'static void rdi_diag_occupy(RDICounters *d) {', '''static void rdi_diag_candidate(RDICounters *d,int valid) {
    if(valid)d->candidate_hit++;else d->candidate_miss++;
    d->candidate_sequence_hash^=valid?1:0;
    d->candidate_sequence_hash*=UINT64_C(1099511628211);
}
static force_inline JSShapeProperty *rdi_counted_find(JSProperty **pr,JSObject *p,JSAtom atom,RDICounters *d) {
    unsigned long long *saved=rdi_hash_context;rdi_hash_context=d->hash_counts;
    JSShapeProperty *result=find_own_property(pr,p,atom);
    rdi_hash_context=saved;return result;
}
static void rdi_diag_occupy(RDICounters *d) {''')
    needle='            fprintf(out,"\\\",\\\"queries\\\":%llu,'
    assert needle in s
    insert='''            fprintf(out,"\\\",\\\"candidate_hit\\\":%llu,\\\"candidate_miss\\\":%llu,\\\"direct_returns\\\":%llu,\\\"forced_lookup_on_candidate_hit\\\":%llu,\\\"candidate_sequence_hash\\\":\\\"%016llx\\\",\\\"hash_find_calls\\\":%llu,\\\"hash_bucket_loads\\\":%llu,\\\"hash_chain_probes\\\":%llu,",
              d->candidate_hit,d->candidate_miss,d->direct_returns,d->forced_lookup_on_candidate_hit,d->candidate_sequence_hash,d->hash_counts[0],d->hash_counts[1],d->hash_counts[2]);
'''
    s=s.replace(needle,insert+'            fprintf(out,"\\\"queries\\\":%llu,',1)
    s=one(s,'    fprintf(out,"]}\\n");fclose(out);', '''    fprintf(out,"],\\\"native_mode\\\":%d,\\\"runtime_initializations\\\":%llu,\\\"all_find_own_property_calls\\\":%llu,\\\"all_find_hash_bucket_loads\\\":%llu,\\\"all_find_hash_chain_probes\\\":%llu}\\n",rdi_process_mode,rdi_mode_runtime_inits,rdi_all_hash[0],rdi_all_hash[1],rdi_all_hash[2]);fclose(out);''')
    p.write_text(s)
    p=src/'read_ic_runtime.inc';s=p.read_text();s=one(s,'#if RDI_CAPACITY == 1\n    if (s->shape == shape)', '#if RDI_CAPACITY == 1\n    RDI_COUNT(update_comparisons);\n    if (s->shape == shape)');p.write_text(s)
    p=src/'qjs.c';s=p.read_text();s=one(s,'int main(int argc, char **argv)','extern void read_ic_report(void);\nint main(int argc, char **argv)');s=one(s,'    return 0;\n fail:','    read_ic_report();\n    return 0;\n fail:');s=one(s,'    JS_FreeRuntime(rt);\n    return 1;','    JS_FreeRuntime(rt);\n    read_ic_report();\n    return 1;');p.write_text(s)
    r=capture('SW_diagnostic_build',['make','-j2','qjs','libquickjs.a'],src,env=mode_env('ON'));assert not r['exit_code']
    save(HERE/'diagnostic_manifest.json',dict(path=str(src/'qjs'),source=str(src),sha256=sha(src/'qjs'),shared_ELF=True,scope='whole process; eagerly rewritten queries including first cold access',hash_scope='all original find_own_property plus per-IC explicit wrapper context; helper searches outside this function not counted',source_hashes={p.name:sha(p) for p in src.iterdir() if p.is_file() and (p.name.startswith('read_ic') or p.name in ['quickjs.c','qjs.c'])}))
    print('DIAGNOSTIC_BUILD_PASS',flush=True)
def validate(d,v):
    assert d['capacity']==1 and d['site_bytes']==16 and d['native_mode']==int(config(v))
    assert d['live_direct_after_free']==d['functions_live_after_free']==d['shape_refs_after_free']==0 and d['shape_ref_increments']==d['shape_ref_decrements']
    ss=[s for f in d['functions'] for s in f['sites']];assert len(ss)==d['sites_created'] and sum(s['queries']>0 for s in ss)==d['sites_used']
    for f in d['functions']:
        assert f['freed']==1
        for s in f['sites']:
            assert s['queries']==s['hits']+s['fallback']==s['direct_returns']+s['forced_lookup_on_candidate_hit']+s['candidate_miss']
            assert s['candidate_hit']==s['hits']==s['direct_returns']+s['forced_lookup_on_candidate_hit']
            assert s['candidate_miss']==s['fallback'] and s['max_occupied']<=1
            assert sum(s[k] for k in ['own_miss','descriptor','special','unhashed','inherited','missing','primitive'])==s['fallback']
            assert s['hash_find_calls']==s['hash_bucket_loads']
            if v=='ON':assert not s['forced_lookup_on_candidate_hit']
            else:assert not s['direct_returns'] and s['forced_lookup_on_candidate_hit']==s['candidate_hit']
    return d
def collect(label,v,path,binary=None):
    m=read(HERE/'diagnostic_manifest.json');exe=binary or m['path'];gz=HERE/'raw/diagnostic'/f'{label}.{v}.json.gz'
    if not gz.exists():
        plain=STORE/'reports'/f'{label}.{v}.json';plain.parent.mkdir(exist_ok=True);e=mode_env(v);e['READ_IC_REPORT']=str(plain)
        cmd=[str(exe)]+([str(path)] if path is not None else [])
        r=capture(v+'_diag_'+label,cmd,env=e,timeout=900);assert not r['exit_code'] and not r['stderr'] and ('PASS' in r['stdout'] or 'TEB_RESULT:' in r['stdout'])
        meta=compress(plain,gz);meta.update(case=label,variant=v,binary_sha256=sha(exe),script_sha256=sha(path) if path is not None else None,native_source_sha256=sha(HERE/'correctness/native_latch.c') if path is None else None,mode_value=config(v),command=cmd,performance_sample=False);save(str(gz)+'.metadata.json',meta)
    return validate(read(gz),v)
def site_groups(d,fields=STATE):
    sources={s['source_id']:digest(bytes.fromhex(s['source_hex'])) for s in d['sources']};out=collections.defaultdict(list)
    for f in d['functions']:
        canonical=digest(json.dumps([f['bytecode_zero_atoms_hex'],f['atoms']],sort_keys=True).encode())
        for s in f['sites']:
            key=(f['function_hex'],f['filename_hex'],sources.get(f['source_id']),canonical,s['pc'],s['opcode'],s['atom_hex'])
            out[key].append(tuple(s[k] for k in fields))
    return {k:sorted(v) for k,v in out.items()}
def match(a,b):
    keys=['finalized_functions','sites_created','sites_used','requested_direct_bytes','peak_live_direct_bytes','shape_ref_increments','shape_ref_decrements','shape_refs_peak','shape_refs_after_free','runtime_initializations']
    assert all(a[k]==b[k] for k in keys),[(k,a[k],b[k]) for k in keys if a[k]!=b[k]]
    assert site_groups(a)==site_groups(b),'site candidate sequence / maintenance mismatch'
    return True
def run():
    import run as runner
    assert read(HERE/'analysis/formal_audit.json')['status']=='PASS';runner.verify()
    plan={c:dict(formal_N=read(HERE/'selected'/f'{c}.json')['N'],diagnostic_N=min(8,read(HERE/'selected'/f'{c}.json')['N']) if c.startswith('CodeLoad.') else read(HERE/'selected'/f'{c}.json')['N']) for c in CASES}
    save(HERE/'diagnostic_plan.json',dict(scope='whole process, not timed-region counters',cases=plan,CodeLoad_cap=8))
    for c in CASES:
        p=runner.script(c,plan[c]['diagnostic_N']);a=collect(c,'ON',p);b=collect(c,'LOOKUP',p);match(a,b)
    print('SELECTED_DIAGNOSTICS_16_PASS',flush=True)
def summarize():
    rows=[];matched=[]
    for c in CASES:
        ds={v:validate(read(HERE/'raw/diagnostic'/f'{c}.{v}.json.gz'),v) for v in ['ON','LOOKUP']};match(ds['ON'],ds['LOOKUP'])
        matched.append(dict(case=c,cache_state_match=True,unique_function_site_keys=len(site_groups(ds['ON']))))
        for v,d in ds.items():
            ss=[s for f in d['functions'] for s in f['sites']];r=dict(case=c,variant=v,**read(HERE/'diagnostic_plan.json')['cases'][c],**{k:sum(s[k] for s in ss) for k in FIELDS})
            r['normal_fallback']=r['fallback'] # exact raw-counter alias, not inferred time
            r['candidate_hit_fraction']=r['candidate_hit']/r['queries'] if r['queries'] else None
            r.update({k:d[k] for k in ['sites_created','sites_used','requested_direct_bytes','peak_live_direct_bytes','shape_refs_peak','shape_ref_increments','shape_ref_decrements','shape_refs_after_free','live_direct_after_free','all_find_own_property_calls','all_find_hash_bucket_loads','all_find_hash_chain_probes']});rows.append(r)
    csvout(HERE/'analysis/diagnostic_summary.csv',rows);csvout(HERE/'analysis/cache_state_match.csv',matched)
    print('DIAGNOSTIC_REPLAY_PASS',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','run','summarize']);a=p.parse_args();globals()[a.stage]()
