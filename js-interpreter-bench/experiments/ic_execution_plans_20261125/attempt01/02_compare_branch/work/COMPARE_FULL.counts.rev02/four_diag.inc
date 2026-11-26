#ifdef FOUR_DIAG
#pragma push_macro("free")
#undef free
typedef struct FourDiag {
    uint64_t q,h,eligible,fill,guard,overflow;
    uint64_t work1,work2,work3,work4,work5,work6;
    int ep_line,ep_col;char ep_file[256];
    unsigned pc;
    char *name,*target;
    char bytes[257];
    struct FourDiag *next;
} FourDiag;
static FourDiag *four_dlist;
static int four_active;
static uint64_t follow_stats[24];
#define FOLLOW(i) do{if(four_active)follow_stats[i]++;}while(0)
#define FOLLOW_ADD(i,n) do{if(four_active)follow_stats[i]+=(n);}while(0)
static FourDiag *four_dnew(JSContext *ctx,JSFunctionBytecode *b,unsigned pc)
{
    FourDiag *d=calloc(1,sizeof(*d));assert(d);d->pc=pc;
    const char *n=JS_AtomToCString(ctx,b->func_name);assert(n);
    d->name=strdup(n);assert(d->name);JS_FreeCString(ctx,n);
    d->ep_line=find_line_num(ctx,b,pc,&d->ep_col);
    if(b->has_debug){char tmp[256];snprintf(d->ep_file,sizeof(d->ep_file),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->debug.filename));}
    unsigned count=min_int(128,b->byte_code_len-pc);
    for(unsigned i=0;i<count;i++)snprintf(d->bytes+2*i,3,"%02x",b->byte_code_buf[pc+i]);
    d->next=four_dlist;four_dlist=d;return d;
}
#define FOUR_COUNT(s,k) do{if(four_active)(s)->diag->k++;}while(0)
#define FOUR_ADD(s,k,n) do{if(four_active)(s)->diag->k+=(n);}while(0)
static void four_json_string(const char *s)
{
    fputc('"',stderr);
    for(const unsigned char *p=(const unsigned char*)s;*p;p++) {
        if(*p=='"'||*p=='\\'){fputc('\\',stderr);fputc(*p,stderr);}
        else if(*p<32)fprintf(stderr,"\\u%04x",*p);else fputc(*p,stderr);
    }
    fputc('"',stderr);
}
void four_begin(void){four_active=1;}
void four_end(void)
{
    four_active=0;uint64_t q=0,h=0,e=0,f=0,g=0,o=0;
    for(FourDiag*d=four_dlist;d;d=d->next){q+=d->q;h+=d->h;e+=d->eligible;f+=d->fill;g+=d->guard;o+=d->overflow;}
    fprintf(stderr,"FOUR_COUNTS:{\"attempts\":%llu,\"hits\":%llu,\"eligible\":%llu,\"fills\":%llu,\"fallbacks\":%llu,\"overflow\":%llu,\"sites\":[",
        (unsigned long long)q,(unsigned long long)h,(unsigned long long)e,(unsigned long long)f,(unsigned long long)g,(unsigned long long)o);
    unsigned k=0;for(FourDiag*d=four_dlist;d;d=d->next)if(d->q){
        fprintf(stderr,"%s{\"function\":",k++?",":"");four_json_string(d->name);
        fprintf(stderr,",\"source_line\":%d,\"source_column\":%d,\"source_file\":",d->ep_line,d->ep_col);four_json_string(d->ep_file);
        if(d->target){fprintf(stderr,",\"target\":");four_json_string(d->target);}
        fprintf(stderr,",\"site_id\":%u,\"work\":[%llu,%llu,%llu,%llu,%llu,%llu]",k-1,
            (unsigned long long)d->work1,(unsigned long long)d->work2,(unsigned long long)d->work3,(unsigned long long)d->work4,(unsigned long long)d->work5,(unsigned long long)d->work6);
        fprintf(stderr,",\"pc\":%u,\"attempts\":%llu,\"hits\":%llu,\"eligible\":%llu,\"fills\":%llu,\"fallbacks\":%llu,\"overflow\":%llu,\"bytecode_hex\":\"%s\"}",d->pc,
            (unsigned long long)d->q,(unsigned long long)d->h,(unsigned long long)d->eligible,(unsigned long long)d->fill,(unsigned long long)d->guard,(unsigned long long)d->overflow,d->bytes);
    }fprintf(stderr,"],\"follow\":[");for(int i=0;i<24;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)follow_stats[i]);fprintf(stderr,"]}\n");
}
#pragma pop_macro("free")
#else
#define FOLLOW(i) ((void)0)
#define FOLLOW_ADD(i,n) ((void)0)
#define FOUR_COUNT(s,k) ((void)0)
#define FOUR_ADD(s,k,n) ((void)0)
#endif
