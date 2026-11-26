"""Independent post-formal counters. Never used to time the port benefit."""
import argparse
import difflib
import json
from pathlib import Path
import shutil
import subprocess
from build import B,STORE,capture
from port import one
from prepare_sources import HERE,ROOT,save,sha

DEST=STORE/'B_diagnostic'

HEADER=r'''
typedef struct LegacyDUnit {
    struct LegacyDUnit *next;
    unsigned long long cache_id;
    unsigned slot;
    char function[120], atom[120];
    unsigned long long query[2],hit[2],fallback[2],nonobject[2];
    unsigned long long probes,shape_hit,shape_miss,descriptor_fallback,update_probes;
    unsigned long long updates,replacements,insertions,mask,max_filled;
} LegacyDUnit;
static LegacyDUnit *legacy_d_head;
static unsigned long long legacy_d_init, legacy_d_units;
static unsigned long long legacy_d_requested,legacy_d_live,legacy_d_peak;
static void *legacy_d_alloc(JSContext *ctx,size_t n,int zero) {
    void *p;
    legacy_d_requested+=n;
    p=zero?js_mallocz(ctx,n):js_malloc(ctx,n);
    if(p){legacy_d_live+=n;if(legacy_d_live>legacy_d_peak)legacy_d_peak=legacy_d_live;}
    return p;
}
static void legacy_d_free(JSRuntime *rt,void *p,size_t n) {
    if(p){assert(legacy_d_live>=n);legacy_d_live-=n;}
    js_free_rt(rt,p);
}
static LegacyDUnit *legacy_d_new(JSContext *ctx,JSAtom atom,unsigned long long id,unsigned slot){
    LegacyDUnit *d=calloc(1,sizeof(*d));
    const char *s=JS_AtomToCString(ctx,atom);
    if(!d||!s)abort();
    snprintf(d->atom,sizeof(d->atom),"%s",s);JS_FreeCString(ctx,s);
    d->cache_id=id;d->slot=slot;d->next=legacy_d_head;legacy_d_head=d;legacy_d_units++;
    return d;
}
void legacy_ic_report(void) {
    LegacyDUnit *d;
    FILE *f;
    const char *p=getenv("LEGACY_IC_REPORT");
    if(!p)return;
    f=fopen(p,"wx");if(!f)abort();
    fprintf(f,"{\"initializations\":%llu,\"units\":%llu,\"requested_bytes_diagnostic_layout\":%llu,\"peak_live_bytes_diagnostic_layout\":%llu,\"live_bytes_after_runtime_free\":%llu,\"units_detail\":[",
        legacy_d_init,legacy_d_units,legacy_d_requested,legacy_d_peak,legacy_d_live);
    for(d=legacy_d_head;d;d=d->next){
        /* Names are hex to preserve every byte without JSON escaping hazards. */
        unsigned i;
        fprintf(f,"{\"cache_id\":%llu,\"slot\":%u,\"function_hex\":\"",d->cache_id,d->slot);
        for(i=0;d->function[i];i++)fprintf(f,"%02x",(unsigned char)d->function[i]);
        fprintf(f,"\",\"atom_hex\":\"");for(i=0;d->atom[i];i++)fprintf(f,"%02x",(unsigned char)d->atom[i]);
        fprintf(f,"\",\"read_queries\":%llu,\"write_queries\":%llu,\"read_hits\":%llu,\"write_hits\":%llu,\"read_fallback\":%llu,\"write_fallback\":%llu,\"read_nonobject\":%llu,\"write_nonobject\":%llu,\"probes\":%llu,\"shape_hits\":%llu,\"shape_misses\":%llu,\"descriptor_fallback\":%llu,\"updates\":%llu,\"replacements\":%llu,\"insertions\":%llu,\"ever_filled_slot_mask\":%llu,\"max_filled_slots\":%llu,\"update_probes\":%llu}%s",
            d->query[0],d->query[1],d->hit[0],d->hit[1],d->fallback[0],d->fallback[1],d->nonobject[0],d->nonobject[1],
            d->probes,d->shape_hit,d->shape_miss,d->descriptor_fallback,d->updates,d->replacements,d->insertions,d->mask,d->max_filled,d->update_probes,d->next?",":"");
    }
    fprintf(f,"]}\n");fclose(f);
}
'''

def build():
    if (DEST/'qjs').exists(): return
    assert not DEST.exists()
    original=(B/'quickjs.c').read_text();s=original
    s=one(s,'#define IC_CACHE_ITEM_CAPACITY 4',HEADER+'\n#define IC_CACHE_ITEM_CAPACITY 4')
    s=one(s,'    uint8_t index;\n} JSInlineCacheRingSlot;',
        '    uint8_t index;\n    LegacyDUnit *diag;\n} JSInlineCacheRingSlot;')
    s=one(s,'    JSInlineCacheRingSlot *cache;\n} JSInlineCache;',
        '    JSInlineCacheRingSlot *cache;\n    unsigned long long diag_id;\n} JSInlineCache;')
    s=one(s,'        shape_slot = *(cr->shape + i);','        cr->diag->probes++;\n        shape_slot = *(cr->shape + i);')
    s=one(s,'            cr->index = i;\n            return cr->prop_offset[i];',
        '            cr->diag->shape_hit++;\n            cr->index = i;\n            return cr->prop_offset[i];')
    s=one(s,'  return INLINE_CACHE_MISS;','  cr->diag->shape_miss++;\n  return INLINE_CACHE_MISS;')
    # Mark full IC opcode query + accepted hit/fallback by read/write separately.
    a=s.index('static JSValue JS_GetPropertyInternalWithIC(');z=s.index('static JSValue JS_ThrowTypeErrorPrivateNotFound',a)
    f=s[a:z]
    f=one(f,'    tag = JS_VALUE_GET_TAG(obj);','    LegacyDUnit *d=icu->ic->cache[icu->offset].diag;\n    d->query[0]++;\n    tag = JS_VALUE_GET_TAG(obj);')
    f=one(f,'    if (unlikely(tag != JS_TAG_OBJECT))\n        goto slow_path;',
        '    if (unlikely(tag != JS_TAG_OBJECT)) {d->nonobject[0]++;goto slow_path;}')
    f=one(f,'    if (likely(offset != INLINE_CACHE_MISS))\n        return JS_DupValue(ctx, p->prop[offset].u.value);',
        '    if (likely(offset != INLINE_CACHE_MISS)) {\n        d->hit[0]++;\n        return JS_DupValue(ctx, p->prop[offset].u.value);\n    }')
    f=one(f,'slow_path:\n    return JS_GetPropertyInternalIC','slow_path:\n    d->fallback[0]++;\n    return JS_GetPropertyInternalIC')
    s=s[:a]+f+s[z:]
    a=s.index('static int JS_SetPropertyInternalWithIC(');z=s.index('static void rewrite_ic(',a)
    f=s[a:z]
    f=one(f,'{\n    if (likely', '{\n    LegacyDUnit *d=icu->ic->cache[icu->offset].diag;\n    d->query[1]++;\n    if (likely')
    f=one(f,'                set_value(ctx, &p->prop[offset].u.value, val);',
        '                d->hit[1]++;\n                set_value(ctx, &p->prop[offset].u.value, val);')
    f=one(f,'                return TRUE;\n            }','                return TRUE;\n            }\n            d->descriptor_fallback++;')
    f=one(f,'    return JS_SetPropertyInternalIC',
        '    d->fallback[1]++;\n    if(JS_VALUE_GET_TAG(obj)!=JS_TAG_OBJECT)d->nonobject[1]++;\n    return JS_SetPropertyInternalIC')
    s=s[:a]+f+s[z:]
    # Track the legacy registry allocation requests and their lifetime, not RSS.
    s=one(s,'ic = js_mallocz(ctx, sizeof(JSInlineCache));','ic = legacy_d_alloc(ctx, sizeof(JSInlineCache), 1);')
    s=one(s,'    ic->count = 0;\n    ic->hash_bits = 2;','    ic->diag_id = ++legacy_d_init;\n    ic->count = 0;\n    ic->hash_bits = 2;')
    s=one(s,'ic->hash = js_mallocz(ctx, sizeof(ic->hash[0]) * ic->capacity);','ic->hash = legacy_d_alloc(ctx, sizeof(ic->hash[0]) * ic->capacity, 1);')
    s=one(s,'    js_free(ctx, ic);\n    return NULL;','    legacy_d_free(JS_GetRuntime(ctx), ic, sizeof(*ic));\n    return NULL;')
    s=one(s,'ic->cache = js_mallocz(ctx, sizeof(JSInlineCacheRingSlot) * ic->count);','ic->cache = legacy_d_alloc(ctx, sizeof(JSInlineCacheRingSlot) * ic->count, 1);')
    s=one(s,'            ic->cache[ch->index].index = 0;',
        '            ic->cache[ch->index].index = 0;\n            ic->cache[ch->index].diag = legacy_d_new(ctx,ch->atom,ic->diag_id,ch->index);')
    s=one(s,'new_hash = js_mallocz(ctx, sizeof(ic->hash[0]) * new_capacity);','new_hash = legacy_d_alloc(ctx, sizeof(ic->hash[0]) * new_capacity, 1);')
    s=one(s,'    js_free(ctx, ic->hash);','    legacy_d_free(JS_GetRuntime(ctx), ic->hash, sizeof(ic->hash[0])*ic->capacity);')
    s=one(s,'    ch = js_malloc(ctx, sizeof(*ch));','    ch = legacy_d_alloc(ctx, sizeof(*ch), 0);')
    s=one(s,'            js_free_rt(rt, ch);','            legacy_d_free(rt, ch, sizeof(*ch));')
    s=one(s,'        js_free_rt(rt, ic->cache);','        legacy_d_free(rt, ic->cache, sizeof(*ic->cache)*ic->count);')
    s=one(s,'    js_free_rt(rt, ic->hash);','    legacy_d_free(rt, ic->hash, sizeof(*ic->hash)*ic->capacity);')
    s=one(s,'    js_free_rt(rt, ic);','    legacy_d_free(rt, ic, sizeof(*ic));')
    # Keep per function/atom labels even after the original function is freed.
    s=one(s,'    if (rebuild_ic(ctx, fd->ic)) goto fail;', '''    if (rebuild_ic(ctx, fd->ic)) goto fail;
    {
        uint32_t j;
        const char *fn=JS_AtomToCString(ctx,fd->func_name);
        if(!fn)abort();
        for(j=0;j<fd->ic->count;j++)
            snprintf(fd->ic->cache[j].diag->function,120,"%s",fn);
        JS_FreeCString(ctx,fn);
    }''')
    s=one(s,'            cr->prop_offset[i] = prop_offset;\n            goto end;',
        '            cr->diag->updates++;\n            cr->prop_offset[i] = prop_offset;\n            goto end;')
    s=one(s,'    do {\n        if (sh == cr->shape[i]) {',
        '    do {\n        cr->diag->update_probes++;\n        if (sh == cr->shape[i]) {')
    s=one(s,'    js_free_shape_null(ctx->rt, cr->shape[i]);', '''    {
        unsigned k,filled=0;
        if(cr->shape[i])cr->diag->replacements++;else cr->diag->insertions++;
        cr->diag->mask |= 1ULL<<i;
        for(k=0;k<IC_CACHE_ITEM_CAPACITY;k++)if(cr->shape[k])filled++;
        if(!cr->shape[i])filled++;
        if(filled>cr->diag->max_filled)cr->diag->max_filled=filled;
    }
    js_free_shape_null(ctx->rt, cr->shape[i]);''')
    q=(B/'qjs.c').read_text()
    # Only normal program completion prints a separate JSON report; after freeing
    # runtime so live-byte invariant can detect leaked IC allocations.
    q=one(q,'int main(int argc, char **argv)','extern void legacy_ic_report(void);\n\nint main(int argc, char **argv)')
    # qjs may free runtimes in --quit / trace modes too; a single exit hook is safe.
    q=one(q,'    return 0;\n fail:', '    legacy_ic_report();\n    return 0;\n fail:')
    q=one(q,'    JS_FreeRuntime(rt);\n    return 1;', '    JS_FreeRuntime(rt);\n    legacy_ic_report();\n    return 1;')
    shutil.copytree(HERE/'sources/base',DEST)
    for f in ['quickjs-opcode.h','LICENSE.NG']:shutil.copyfile(B/f,DEST/f)
    (DEST/'quickjs.c').write_text(s)
    (DEST/'qjs.c').write_text(q)
    save(HERE/'patches/diagnostic_only.patch',''.join(difflib.unified_diff(original.splitlines(True),s.splitlines(True),fromfile='a/quickjs.c',tofile='b/quickjs.c')))
    r=capture('B_diagnostic_build',['make','-j2','qjs'],DEST);assert r['exit_code']==0
    save(HERE/'diagnostic_manifest.json',dict(binary=str(DEST/'qjs'),sha256=sha(DEST/'qjs'),
        source_sha256=sha(DEST/'quickjs.c'),qjs_source_sha256=sha(DEST/'qjs.c'),
        formal_binary=False,allocation_counters='actual diagnostic-layout requested and peak live bytes; not RSS; extra recording malloc excluded',
        shape_diversity=None,shape_diversity_reason='no unbounded lifetime-safe shape identity registry; no pointer-based diversity claim',
        names='UTF-8 prefix max119 bytes, encoded as hex; cache_id unique per compiled function within process, slot is atom-shared cache unit',
        counts='queries count rewritten IC opcodes only, not all property operations; cold normal ops can register cache without probe'))
    print('DIAGNOSTIC_BUILT',flush=True)

def run():
    import run as runner
    assert sha(DEST/'qjs')==json.loads((HERE/'diagnostic_manifest.json').read_text())['sha256']
    for unit in runner.SUPPORTED:
        n=json.loads((HERE/'selected'/f'{unit}.json').read_text())['N']
        report=HERE/'raw/diagnostic'/f'{unit}.counters.json'
        if report.exists():continue
        import os
        os.environ['LEGACY_IC_REPORT']=str(report)
        r=runner.invoke('diagnostic',unit,'B',n,0,0,binary=str(DEST/'qjs'))
        assert r['valid'] and report.exists()
        data=json.loads(report.read_text())
        assert data['live_bytes_after_runtime_free']==0
        for d in data['units_detail']:
            for kind in ['read','write']:assert d[kind+'_queries']==d[kind+'_hits']+d[kind+'_fallback']
            assert d['shape_hits']+d['shape_misses']==d['read_queries']+d['write_queries']-d['read_nonobject']-d['write_nonobject']
        del os.environ['LEGACY_IC_REPORT']
    print('DIAGNOSTIC_RUNS_PASS',flush=True)

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['build','run']);args=ap.parse_args()
    globals()[args.stage]()
