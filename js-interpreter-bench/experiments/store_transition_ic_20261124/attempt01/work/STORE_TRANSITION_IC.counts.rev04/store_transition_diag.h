/* Diagnostic only: detached C allocations do not retain JS objects/shapes. */
#include <stdio.h>
#include <stdlib.h>
#define ST_FIELDS(X) X(writes) X(shared_writes) X(ordinary_writes) X(existing_fast) \
 X(slow_calls) X(own_existing_slow) X(new_own) X(add_calls) X(reuse_shape) \
 X(reuse_no_resize) X(needs_resize) X(learn_candidates) X(publications) X(replacements) \
 X(transition_hits) X(miss_empty) X(miss_shape) X(miss_not_object) X(miss_receiver) \
 X(miss_capacity) X(miss_proto) X(reject_transition) X(reject_deep) \
 X(reject_proto_class) X(reject_proto_unhashed) X(reject_descriptor)
#define ST_FIELD(n) uint64_t n;
typedef struct StCounts { ST_FIELDS(ST_FIELD) } StCounts;
#undef ST_FIELD
struct StDiag { const JSFunctionBytecode *owner; uint32_t pc, id; int shared;
 JSAtom atom; char *function, *property; StCounts counts; StDiag *next, *allnext; };
static StDiag *st_map[4096], *st_all;
static uint32_t st_next_id;
static uint64_t st_ctor_attempts,st_ctor_hits;
#define ST_CTOR(fast) do { st_ctor_attempts++;st_ctor_hits+=!!(fast); } while(0)
static uint64_t st_code_copy_bytes, st_skipped_ctor_functions;
#define ST_SKIP_CTOR() (st_skipped_ctor_functions++)
#define ST_CODE_COPY(n) (st_code_copy_bytes+=(n))
static uint64_t st_requested_bytes, st_released_bytes, st_max_live_bytes;
static void st_dump(void);
static StDiag *st_point(JSContext *ctx, JSFunctionBytecode *b, uint32_t pc, JSAtom atom, int shared)
{
    uint32_t h = (((uintptr_t)b >> 4) ^ pc) & 4095;
    StDiag *d;
    for (d = st_map[h]; d; d = d->next) if (d->owner == b && d->pc == pc) return d;
    d = calloc(1, sizeof(*d)); if (!d) abort();
    if (!st_next_id) atexit(st_dump);
    d->owner = b; d->pc = pc; d->atom = atom; d->shared = shared; d->id = ++st_next_id;
    char buf[256]; d->function = strdup(JS_AtomGetStr(ctx,buf,sizeof(buf),b->func_name));
    d->property = strdup(JS_AtomGetStr(ctx,buf,sizeof(buf),atom));
    d->next = st_map[h]; st_map[h] = d; d->allnext = st_all; st_all = d;
    return d;
}
static void st_detach(JSFunctionBytecode *b)
{
    for (unsigned i=0;i<4096;i++) {
        StDiag **p=&st_map[i]; while(*p) { if((*p)->owner==b) { (*p)->owner=NULL; *p=(*p)->next; } else p=&(*p)->next; }
    }
}
#define ST_POINT(b, pc, atom, shared) st_point(ctx,b,pc,atom,shared)
#define ST_EVENT(d, event) do { if (d) (d)->counts.event++; } while (0)
#define ST_PREPARE(n) do { st_requested_bytes+=(uint64_t)(n)*sizeof(StoreSite); \
 uint64_t live=st_requested_bytes-st_released_bytes; if(live>st_max_live_bytes)st_max_live_bytes=live; } while(0)
#define ST_RELEASE(n) (st_released_bytes+=(uint64_t)(n)*sizeof(StoreSite))
static void st_quote(FILE *f,const char *s) {
 fputc('"',f); for(;*s;s++) { unsigned char c=*s; if(c=='"'||c=='\\')fputc('\\',f); 
 if(c<32)fprintf(f,"\\u%04x",c); else fputc(c,f); } fputc('"',f);
}
static void st_dump_counts(FILE *f,StCounts *c) {
 fputc('{',f);int first=1;
#define ST_PRINT(n) if(!first)fputc(',',f);first=0;fprintf(f,"\"" #n "\":%llu",(unsigned long long)c->n);
 ST_FIELDS(ST_PRINT)
#undef ST_PRINT
 fputc('}',f);
}
static void st_dump(void) {
 const char *path=getenv("ST_OUTPUT"); if(!path)return;FILE *f=fopen(path,"w");if(!f)abort();
 StCounts total={0}; for(StDiag*d=st_all;d;d=d->allnext) {
#define ST_SUM(n) total.n+=d->counts.n;
 ST_FIELDS(ST_SUM)
#undef ST_SUM
 }
 fprintf(f,"{\"constructors\":{\"attempts\":%llu,\"hits\":%llu},\"totals\":",(unsigned long long)st_ctor_attempts,(unsigned long long)st_ctor_hits);st_dump_counts(f,&total);
 fprintf(f,",\"memory\":{\"skipped_ctor_functions\":%llu,\"code_copy_bytes\":%llu,\"site_bytes\":%zu,\"requested_bytes\":%llu,\"released_bytes\":%llu,\"max_live_bytes\":%llu},\"sites\":[",(unsigned long long)st_skipped_ctor_functions,(unsigned long long)st_code_copy_bytes,sizeof(StoreSite),(unsigned long long)st_requested_bytes,(unsigned long long)st_released_bytes,(unsigned long long)st_max_live_bytes);
 int first=1; for(StDiag*d=st_all;d;d=d->allnext) { if(!first)fputc(',',f);first=0;
 fprintf(f,"{\"id\":%u,\"pc\":%u,\"shared\":%d,\"function\":",d->id,d->pc,d->shared);st_quote(f,d->function);
 fputs(",\"atom\":",f);st_quote(f,d->property);fputs(",\"counts\":",f);st_dump_counts(f,&d->counts);fputc('}',f); }
 fputs("]}\n",f);fclose(f);
}
