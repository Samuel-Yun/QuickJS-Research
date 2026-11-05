"""Separate M/R diagnostics: actual exits, post-exit ordinary handlers and hash work."""
import argparse,collections,shutil
from common import *
FIELDS=['queries','hits','fallback','comparisons','shape_misses','updates','update_comparisons','insertions','replacements','own_miss','descriptor','special','unhashed','inherited','missing','primitive','post_exit_reads','exits','exit_shape_releases','streak_reads','streak_writes','streak_resets','hash_find_calls','hash_bucket_loads','hash_chain_probes']
def one(s,a,b):assert s.count(a)==1,(a[:100],s.count(a));return s.replace(a,b,1)
def build():
    result={}
    for v in ['M','R']:
        src=STORE/(v+'_diagnostic');assert not src.exists()
        for n in read(HERE/'sources/identities.json')['files'][v]:
            p=src/n;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(STORE/v/n,p)
        for n in ['read_ic_diag.h','read_ic_diag_prepare.inc']:shutil.copy2(PREVIOUS/'implementation'/n,src/n)
        p=src/'quickjs.c';s=p.read_text();s='#define READ_IC_DIAGNOSTIC 1\n#define RDI_DEQUICKEN '+str(int(v=='R'))+'\n'+s
        a=s.index('static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,');z=s.index('\n}',a)+2;body=s[a:z]
        body=one(body,'    sh = p->shape;','    rdi_all_hash[0]++; if(rdi_hash_context)rdi_hash_context[0]++;\n    sh = p->shape;')
        body=one(body,'    h = sh->hash_table[h];','    rdi_all_hash[1]++; if(rdi_hash_context)rdi_hash_context[1]++;\n    h = sh->hash_table[h];')
        body=one(body,'    while (h) {','    while (h) {\n        rdi_all_hash[2]++; if(rdi_hash_context)rdi_hash_context[2]++;')
        s=s[:a]+'static _Thread_local unsigned long long *rdi_hash_context;\nstatic unsigned long long rdi_all_hash[3];\n'+body+s[z:]
        a=s.index('#define GET_FIELD_INLINE(');z=s.index('#include "read_ic_opcodes.inc"',a);body=s[a:z]
        body=one(body,'                JSValue val, obj;','                RDICounters *dn=rdi_diag_post_read(b,pc-1);             \\\n                JSValue val, obj;')
        body=one(body,'prs = find_own_property(&pr, p, atom);','prs = dn ? rdi_counted_find(&pr,p,atom,dn) : find_own_property(&pr,p,atom);')
        s=s[:a]+body+s[z:];p.write_text(s)
        p=src/'read_ic_prepare.inc';p.write_text('#include "read_ic_diag_prepare.inc"\n'+p.read_text())
        p=src/'read_ic_opcodes.inc';s=p.read_text();s=one(s,'prs = find_own_property(&pr, p, atom);','prs = rdi_counted_find(&pr,p,atom,d);');p.write_text(s)
        p=src/'read_ic_runtime.inc';s=p.read_text();s=one(s,'#if RDI_CAPACITY == 1\n    if (s->shape == shape)','#if RDI_CAPACITY == 1\n    RDI_COUNT(update_comparisons);\n    if (s->shape == shape)');p.write_text(s)
        p=src/'read_ic_diag.h';s=p.read_text()
        s=one(s,'    unsigned occupied,max_occupied,pc,op;', '''    unsigned long long post_exit_reads,exits,exit_shape_releases,streak_reads,streak_writes,streak_resets;
    unsigned long long exit_query_index,hash_counts[3];
    unsigned final_opcode,final_operand,final_streak,exit_atom;
    unsigned occupied,max_occupied,pc,op;''')
        s=one(s,'static void rdi_diag_occupy(RDICounters *d) {', '''static void rdi_diag_exit(RDICounters *d,uint8_t *pc,int had_shape) {
    assert(!d->exits);d->exits++;d->exit_query_index=d->queries;d->exit_atom=get_u32(pc+1);
    if(had_shape){assert(d->occupied==1);d->occupied=0;d->exit_shape_releases++;rdi_diag_shape_unref++;assert(rdi_diag_shape_live);rdi_diag_shape_live--;}
}
static RDICounters *rdi_diag_post_read(JSFunctionBytecode *b,const uint8_t *pc) {
    if(!b->read_ic_diag)return NULL;
    unsigned offset=pc-b->byte_code_buf;
    for(unsigned i=0;i<b->read_ic_diag->site_count;i++) {
        RDICounters *d=&b->read_ic_diag->sites[i];
        if(d->pc==offset && d->exits){d->post_exit_reads++;return d;}
    }
    return NULL;
}
static force_inline JSShapeProperty *rdi_counted_find(JSProperty **pr,JSObject *p,JSAtom atom,RDICounters *d) {
    unsigned long long *saved=rdi_hash_context;rdi_hash_context=d->hash_counts;
    JSShapeProperty *res=find_own_property(pr,p,atom);rdi_hash_context=saved;return res;
}
static void rdi_diag_occupy(RDICounters *d) {''')
        s=one(s,'            unsigned n=f->sites[i].occupied;', '''            RDICounters *d=&f->sites[i];
            d->final_opcode=b->byte_code_buf[d->pc];d->final_operand=get_u32(b->byte_code_buf+d->pc+1);
#if RDI_DEQUICKEN
            d->final_streak=b->read_ic_sites[i].miss_streak;
#endif
            unsigned n=f->sites[i].occupied;''')
        needle='            fprintf(out,"\\\",\\\"queries\\\":%llu,'
        assert s.count(needle)==1
        fields='post_exit_reads exits exit_shape_releases streak_reads streak_writes streak_resets exit_query_index'.split()
        fmt=','.join('\\\"'+k+'\\\":%llu' for k in fields)+',\\\"hash_find_calls\\\":%llu,\\\"hash_bucket_loads\\\":%llu,\\\"hash_chain_probes\\\":%llu,\\\"final_opcode_id\\\":%u,\\\"final_operand\\\":%u,\\\"final_streak\\\":%u,\\\"exit_atom_operand\\\":%u,\\\"original_opcode_id\\\":%u,'
        args=','.join('d->'+k for k in fields)+',d->hash_counts[0],d->hash_counts[1],d->hash_counts[2],d->final_opcode,d->final_operand,d->final_streak,d->exit_atom,d->op'
        s=s.replace(needle,'            fprintf(out,"\\\",'+fmt+'",'+args+');\n            fprintf(out,"\\\"queries\\\":%llu,',1)
        s=one(s,'    fprintf(out,"]}\\n");fclose(out);','    fprintf(out,"],\\\"all_find_own_property_calls\\\":%llu,\\\"all_hash_bucket_loads\\\":%llu,\\\"all_hash_chain_probes\\\":%llu}\\n",rdi_all_hash[0],rdi_all_hash[1],rdi_all_hash[2]);fclose(out);');p.write_text(s)
        p=src/'qjs.c';s=p.read_text();s=one(s,'int main(int argc, char **argv)','extern void read_ic_report(void);\nint main(int argc, char **argv)');s=one(s,'    return 0;\n fail:','    read_ic_report();\n    return 0;\n fail:');s=one(s,'    JS_FreeRuntime(rt);\n    return 1;','    JS_FreeRuntime(rt);\n    read_ic_report();\n    return 1;');p.write_text(s)
        r=capture(v+'_diagnostic_build',['make','-j2','qjs'],src);assert not r['exit_code']
        result[v]=dict(path=str(src/'qjs'),source=str(src),sha256=sha(src/'qjs'),source_hashes={p.name:sha(p) for p in src.iterdir() if p.is_file() and (p.name.startswith('read_ic') or p.name in ['quickjs.c','qjs.c'])})
    save(HERE/'diagnostic_manifest.json',dict(artifacts=result,scope='whole process; final static site identity retained; cold reads included',ordinary_post_mapping='diagnostic only, linear final-PC lookup; absent in formal handler',hash_scope='actual original find_own_property, global and IC/post-exit context; other helpers not universally covered',indirect_retained_bytes=None))
    print('MR_DIAGNOSTIC_BUILD_PASS',flush=True)
def validate(d,v):
    assert d['site_bytes']==(24 if v=='R' else 16)
    assert d['live_direct_after_free']==d['functions_live_after_free']==d['shape_refs_after_free']==0
    assert d['shape_ref_increments']==d['shape_ref_decrements']
    ss=[s for f in d['functions'] for s in f['sites']];assert len(ss)==d['sites_created']
    for f in d['functions']:
        assert f['freed']==1
        for s in f['sites']:
            assert s['queries']==s['hits']+s['fallback'] and s['exits']<=1 and s['max_occupied']<=1
            assert sum(s[k] for k in ['own_miss','descriptor','special','unhashed','inherited','missing','primitive'])==s['fallback']
            assert s['hash_find_calls']==s['hash_bucket_loads']
            if v=='M':assert s['exits']==s['post_exit_reads']==s['streak_reads']==0
            if s['exits']:
                assert s['final_opcode_id']==s['original_opcode_id'] and s['final_operand']==s['exit_atom_operand'] and s['final_streak']==32
                assert s['exit_query_index']==s['queries']
            else:assert not s['post_exit_reads'] and s['final_streak']<32
    return d
def collect(label,v,path):
    m=read(HERE/'diagnostic_manifest.json')['artifacts'][v];gz=HERE/'raw/diagnostic'/f'{label}.{v}.json.gz'
    if not gz.exists():
        dst=STORE/'reports'/f'{label}.{v}.json';dst.parent.mkdir(exist_ok=True);e=clean_env();e['READ_IC_REPORT']=str(dst)
        r=capture('diagnostic_'+label+'_'+v,[m['path'],path],env=e,timeout=1800);assert not r['exit_code'] and not r['stderr'] and ('PASS' in r['stdout'] or 'TEB_RESULT:' in r['stdout'])
        save(str(gz)+'.metadata.json',dict(**compress(dst,gz),case=label,variant=v,command=[m['path'],str(path)],binary_sha256=m['sha256'],script_sha256=sha(path),scope='whole process, not formal branch trace',timestamp=stamp(),performance_sample=False))
    return validate(read(gz),v)
def run():
    import run as runner
    assert read(HERE/'analysis/formal_audit.json')['status']=='PASS';runner.verify()
    plan={c:dict(formal_N=read(HERE/'selected'/f'{c}.json')['N'],diagnostic_N=min(8,read(HERE/'selected'/f'{c}.json')['N']) if c.startswith('CodeLoad.') else read(HERE/'selected'/f'{c}.json')['N']) for c in CASES}
    save(HERE/'diagnostic_plan.json',dict(scope='whole process, not timed-region',cases=plan,CodeLoad_cap=8))
    for c in CASES:
        p=runner.script(c,plan[c]['diagnostic_N'])
        for v in ['M','R']:collect(c,v,p)
    print('SELECTED_DIAGNOSTICS_48_PASS',flush=True)
def summarize():
    rows=[]
    for c in CASES:
        for v in ['M','R']:
            d=validate(read(HERE/'raw/diagnostic'/f'{c}.{v}.json.gz'),v);ss=[s for f in d['functions'] for s in f['sites']]
            row=dict(case=c,variant=v,**read(HERE/'diagnostic_plan.json')['cases'][c],**{k:sum(s[k] for s in ss) for k in FIELDS})
            total=row['queries']+row['post_exit_reads'];row.update(total_site_reads=total,ic_hit_fraction=row['hits']/row['queries'] if row['queries'] else None,lifetime_hit_fraction=row['hits']/total if total else None,
              exit_trigger='32 consecutive guard failures including unqualified receiver, not result-based',**{k:d[k] for k in ['site_bytes','finalized_functions','sites_created','sites_used','requested_direct_bytes','peak_live_direct_bytes','live_direct_after_free','shape_ref_increments','shape_ref_decrements','shape_refs_peak','shape_refs_after_free','all_find_own_property_calls','all_hash_bucket_loads','all_hash_chain_probes']})
            rows.append(row)
    csvout(HERE/'analysis/diagnostic_summary.csv',rows);print('DIAGNOSTIC_REPLAY_PASS',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','run','summarize']);a=p.parse_args();globals()[a.stage]()
