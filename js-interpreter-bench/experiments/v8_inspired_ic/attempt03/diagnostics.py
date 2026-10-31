"""Only after collection ends: separate counter build, bounded representative sites.
Never run concurrently with formal/pilot samples; no diagnostic time is a result.
"""
import argparse,shutil
from common import *
SITE_CODE=r'''
static unsigned eic_printed_sites;
static void eic_json_string(const char *s, int len) {
    fputc('"',stderr);
    for(int i=0;i<len;i++){unsigned char c=s[i];
        if(c=='"'||c==0x5c){fputc(0x5c,stderr);fputc(c,stderr);}
        else if(c<32){fputc(0x5c,stderr);fprintf(stderr,"u%04x",c);}
        else fputc(c,stderr);
    }fputc('"',stderr);
}
static void eic_emit_sites(JSRuntime *rt,JSFunctionBytecode *b) {
    if(!b->eic_diag_counts)return;
    for(unsigned i=0;i<b->eic_count&&eic_printed_sites<32;i++) {
        EICDiagCounts *c=&b->eic_diag_counts[i];
        if(c->q<1000)continue;
        eic_printed_sites++;
        char tmp[512];const char *name=JS_AtomGetStrRT(rt,tmp,sizeof(tmp),b->func_name);
        fprintf(stderr,"EIC_SITE:{\"instance\":%" PRIu64 ",\"pc\":%u,\"function\":",b->eic_diag_id,b->eic_meta[i].pc);
        eic_json_string(name,strlen(name));
        fprintf(stderr,",\"property\":");name=JS_AtomGetStrRT(rt,tmp,sizeof(tmp),b->eic_meta[i].atom);eic_json_string(name,strlen(name));
        int op=b->byte_code_buf[b->eic_meta[i].pc];
        fprintf(stderr,",\"opcode\":\"%s\",\"queries\":%" PRIu64 ",\"hits\":%" PRIu64 ",\"proto_hits\":%" PRIu64 ",\"store_hits\":%" PRIu64 ",\"state_at_free\":%d,\"source_length\":%d,\"source_truncated\":%s,\"source\":",
            op==OP_put_field_eic?"put_field":op==OP_get_field2_eic?"get_field2":"get_field",c->q,c->h,c->p,c->s,b->eic_sites?b->eic_sites[i].state:0,b->has_debug?b->debug.source_len:0,
            b->has_debug&&b->debug.source_len>8192?"true":"false");
        if(b->has_debug&&b->debug.source)eic_json_string(b->debug.source,min_int(b->debug.source_len,8192));else fprintf(stderr,"null");
        fprintf(stderr,"}\n");
    }
}
'''
def build():
    assert (HERE/'collection_end.json').exists() or (HERE/'campaign_stop.json').exists(),'collection must stop before diagnostics'
    src=BUILD/'E';dst=BUILD/'E_diag_sites';assert not dst.exists()
    files=read(HERE/'raw/build/E.json')['base_files']
    for f in list(files)+[p.name for p in (HERE/'engine').glob('eic_*')]:
        p=dst/f;p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src/f,p)
    def edit(name,callback):
        p=dst/name;text=p.read_text();p.write_text(callback(text))
    def qjsc(s):
        s=s.replace('    uint8_t eic_heat;','    uint8_t eic_heat;\n    EICDiagCounts *eic_diag_counts;\n    uint64_t eic_diag_id;')
        s=s.replace('#include "eic_runtime.inc"',SITE_CODE+'\n#include "eic_runtime.inc"')
        s=s.replace('CASE(OP_get_var_undef):\n            EIC_COUNT(global_read);','CASE(OP_get_var_undef):')
        s=s.replace('CASE(OP_put_var):\n            EIC_COUNT(global_store);\n        CASE(OP_put_var_init):','CASE(OP_put_var):\n        CASE(OP_put_var_init):\n            EIC_COUNT(global_store);')
        s=s.replace('CASE(OP_get_length):','CASE(OP_get_length):\n            EIC_COUNT(named_read); EIC_COUNT(get_length_reads);')
        s=s.replace('CASE(OP_get_array_el3):','CASE(OP_get_array_el3):\n            EIC_COUNT(keyed_read);')
        s=s.replace('EIC_COUNT(global_read)','EIC_COUNT(binding_varref_read)').replace('EIC_COUNT(global_store)','EIC_COUNT(binding_varref_store)')
        return s
    edit('quickjs.c',qjsc)
    edit('eic_types.h',lambda s:s.replace('typedef struct EICStats {','typedef struct EICDiagCounts { uint64_t q,h,p,s; } EICDiagCounts;\ntypedef struct EICStats {').replace('uint64_t named_read,','uint64_t get_length_reads, proto_guard_fail, store_refresh, store_refresh_inactive;\n    uint64_t named_read,').replace('global_read','binding_varref_read').replace('global_store','binding_varref_store'))
    edit('eic_diag.inc',lambda s:s.replace('    PRINT(named_read);','    PRINT(get_length_reads); PRINT(proto_guard_fail); PRINT(store_refresh); PRINT(store_refresh_inactive);\n    PRINT(named_read);').replace('PRINT(global_read)','PRINT(binding_varref_read)').replace('PRINT(global_store)','PRINT(binding_varref_store)'))
    edit('eic_prepare.inc',lambda s:s.replace('    EIC_COUNT(metadata);','    b->eic_diag_counts=js_mallocz_rt(ctx->rt,count*sizeof(EICDiagCounts));\n    b->eic_diag_id=eic_stats.metadata+1;\n    EIC_COUNT(metadata);'))
    def runtime_edit(s):
        s=s.replace('if (!p || !eic_ordinary(p) || p->shape != c->shapes[i]) return NULL;','if (!p || !eic_ordinary(p) || p->shape != c->shapes[i]) { EIC_COUNT(proto_guard_fail); return NULL; }')
        s=s.replace('static void eic_free(JSRuntime *rt, JSFunctionBytecode *b)\n{','static void eic_free(JSRuntime *rt, JSFunctionBytecode *b)\n{\n    eic_emit_sites(rt,b);\n    js_free_rt(rt,b->eic_diag_counts);b->eic_diag_counts=NULL;')
        return s
    edit('eic_runtime.inc',runtime_edit)
    def opedit(s):
        prefix='''#define EIC_SQ() do {if(b->eic_diag_counts)b->eic_diag_counts[index].q++;}while(0)
#define EIC_SH() do {if(b->eic_diag_counts)b->eic_diag_counts[index].h++;}while(0)
#define EIC_SP() do {if(b->eic_diag_counts)b->eic_diag_counts[index].p++;}while(0)
#define EIC_SS() do {if(b->eic_diag_counts)b->eic_diag_counts[index].s++;}while(0)
'''
        s=s.replace('EIC_COUNT(queries);','EIC_COUNT(queries); EIC_SQ();').replace('EIC_COUNT(hits);','EIC_COUNT(hits); EIC_SH();').replace('if (entry->chain) EIC_COUNT(proto_hits); else EIC_COUNT(own_hits);','if (entry->chain) {EIC_COUNT(proto_hits); EIC_SP();} else EIC_COUNT(own_hits);').replace('EIC_COUNT(store_hits);','EIC_COUNT(store_hits); EIC_SS();')
        s=s.replace('                        prs=find_own_property(&pr,p,atom);',
            '                        EIC_COUNT(store_refresh);\n                        if(!site || site->state==EIC_GENERIC) EIC_COUNT(store_refresh_inactive);\n                        prs=find_own_property(&pr,p,atom);')
        return prefix+s+'\n#undef EIC_SQ\n#undef EIC_SH\n#undef EIC_SP\n#undef EIC_SS\n'
    edit('eic_opcodes.inc',opedit)
    edit('qjs.c',lambda s:s.replace('    JS_FreeRuntime(rt);','    JS_FreeRuntime(rt);\n    extern void JS_EICDumpStats(void);JS_EICDumpStats();'))
    command=['make','-j2','qjs','DEFINES=-D_GNU_SOURCE -DCONFIG_VERSION=\\"2026-06-04\\" -DHAVE_CLOSEFROM -DEIC_DIAGNOSTIC']
    r=capture(command,'diagnostic site build',timeout=600,cwd=dst);save(HERE/'raw/diagnostic/build.json',r);assert r['exit_code']==0
    changes={f:sha(dst/f) for f in list(files)+[p.name for p in (HERE/'engine').glob('eic_*')] if sha(dst/f)!=sha(src/f)}
    save(HERE/'diagnostic_manifest.json',dict(binary=str(dst/'qjs'),sha256=sha(dst/'qjs'),release_sha256=sha(src/'qjs'),source_changes=changes,direct_cache_struct_sizes_same=True,counter_memory_excluded_from_direct_cache_accounting=True,representative_limit=32,representative_rule='first32 freed site records with >=1000 queries, not a hottest-time ranking',whole_process=True,formal_performance=False))
def collect():
    from run import script
    m=read(HERE/'diagnostic_manifest.json');binary=m['binary'];assert sha(binary)==m['sha256']
    rows=[];sites=[]
    for case in CASES:
        p=script(case,1,'correctness');cmd=[binary]
        if case=='zlib.zlib':cmd+=['--std','-I',str(HERE/'inputs/zlib_read.js')]
        cmd+=[str(p)];dest=HERE/'raw/diagnostic'/f'{case}.N1.json'
        r=read(dest) if dest.exists() else capture(cmd,'diagnostic '+case)
        if not dest.exists():save(dest,r)
        assert r['exit_code']==0 and 'OCTANE_IC_RESULT:' in r['stdout'],case
        payloads=re.findall(r'^OCTANE_IC_RESULT:(.*)$',r['stdout'],re.M);assert len(payloads)==1
        payload=json.loads(payloads[0]);assert payload['case']==case and payload['N']==1 and payload['phase']=='correctness' and payload['correctness']=='PASS' and payload['warmup_calls']==0 and payload['mode']==MODE,case
        stats=[json.loads(x[len('EIC_STATS:'):]) for x in r['stderr'].splitlines() if x.startswith('EIC_STATS:')];assert len(stats)==1
        d=stats[0];assert d['queries']==d['hits']+d['fallback'] and d['live_bytes']==0 and d['shape_refs']==d['shape_frees'] and d['requested_bytes']==d['released_bytes'],case
        assert d['hits']==d['own_hits']+d['proto_hits']+d['store_hits'],case
        assert d['queries']==d['named_read']-d['get_length_reads']+d['named_store'],case
        assert 0<=d['store_refresh_inactive']<=d['store_refresh'],case
        assert all(x.startswith(('EIC_SITE:','EIC_STATS:')) for x in r['stderr'].splitlines())
        rows.append(dict(case=case,**d))
        for line in r['stderr'].splitlines():
            if not line.startswith('EIC_SITE:'):continue
            d=json.loads(line[len('EIC_SITE:'):]);s=d.pop('source');d.update(case=case,source_sha256=hashlib.sha256(s.encode()).hexdigest() if s is not None and not d['source_truncated'] else None,source_identity_scope='debug function source, compiled instance within process + opcode-start PC',raw=dest.relative_to(HERE).as_posix());sites.append(d)
    csvout(HERE/'diagnostic_summary.csv',rows);csvout(HERE/'diagnostic_sites.csv',sites)
    save(HERE/'diagnostic_gate.json',dict(status='PASS',N=1,processes=len(rows),all_queries_equals_hits_plus_fallback=True,all_direct_bytes_released=True,all_shape_edges_balanced=True,counters_whole_process=True,site_counters_scope='all targeted named opcodes, first7 included because independent counter metadata is eager',max_sites_per_process=32,diagnostic_timing_not_performance=True))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('phase',choices=['build','collect']);args=p.parse_args();globals()[args.phase]()
