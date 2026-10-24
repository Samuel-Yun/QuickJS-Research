/* Diagnostic only. Included before find_own_property, not in frozen binaries.
 * One sig_atomic_t is the ENTIRE published context. Metadata is immutable after
 * publication; handler never dereferences VM pointers or metadata. -1=transition.
 * GCC cleanup scopes restore on ordinary exit, goto-out, return, and exceptions
 * propagated by QuickJS's return/goto mechanism (not C++ exceptions/longjmp).
 */
#include <signal.h>
#include <sys/time.h>
#include <ucontext.h>
#include <time.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#define SA_NFUN 1024
#define SA_NSITE 16384
#define SA_NORIGIN 65536
#define SA_NSAMPLE 200000
typedef struct {
    const JSFunctionBytecode *ptr;
    unsigned id, len, *sites;
    char *filename, *name, *hex, *source;
    int line, col, is_run;
} SAFunc;
typedef struct {
    unsigned id, fid, offset, opcode;
    int line, col;
    char *name, *property;
    uint64_t ops, probes, probe_hit, probe_miss, own, proto, missing, fallback;
    uint64_t depth[8], tags[32], fast_write;
} SASite;
typedef struct { uintptr_t pc; uint64_t ns; int site; } SASample;
static SAFunc sa_fun[SA_NFUN];
static SASite sa_site[SA_NSITE];
static unsigned sa_nfun, sa_nsite;
static unsigned sa_fslots[2048];
static uint64_t sa_origins[SA_NORIGIN][3]; /* total, context known, hit */
static SASample sa_samples[SA_NSAMPLE];
static volatile sig_atomic_t sa_current, sa_used, sa_dropped;
static int sa_enabled, sa_context, sa_count, sa_run_depth, sa_interval;
static const char *sa_out;
static unsigned sa_register(JSContext *, JSFunctionBytecode *);
static unsigned sa_fid(const JSFunctionBytecode *b) {
    unsigned slot=((uintptr_t)b >> 4)&2047, i;
    while((i=sa_fslots[slot])) {
        if(sa_fun[i].ptr==b) return i;
        slot=(slot+1)&2047;
    }
    return 0;
}
typedef struct { int previous; int run; } SAFrame;
static SAFrame sa_frame_begin(void) {
    SAFrame s={sa_current,0};
    if(sa_context) sa_current=0;
    return s;
}
static void sa_frame_end(SAFrame *s) {
    if(s->run) sa_run_depth--;
    if(sa_context) sa_current=s->previous;
}
static void sa_function_enter(SAFrame *s, unsigned fid) {
    if(fid && sa_fun[fid].is_run) { s->run=1; sa_run_depth++; }
}
typedef struct { int previous; } SAScope;
static SAScope sa_begin(unsigned fid, const uint8_t *op, JSFunctionBytecode *b) {
    SAScope s={sa_current};
    unsigned sid=0;
    if(sa_context) {
        sa_current=-1;
        if(fid && op>=b->byte_code_buf && op<b->byte_code_buf+b->byte_code_len)
            sid=sa_fun[fid].sites[op-b->byte_code_buf];
        if(sid && sa_count && sa_run_depth) sa_site[sid].ops++;
        sa_current=(sig_atomic_t)sid;
    }
    return s;
}
static void sa_end(SAScope *s) { if(sa_context) sa_current=s->previous; }
#define SA_PROP_SCOPE() SAScope sa_ps __attribute__((cleanup(sa_end))) = sa_begin(sa_fnid, pc-1, b)
static void sa_probe(unsigned origin, int hit) {
    int sid=sa_current;
    if(sa_count && sa_run_depth) {
        if(origin>=SA_NORIGIN) abort();
        sa_origins[origin][0]++; sa_origins[origin][1]+=(sid>0);
        sa_origins[origin][2]+=hit;
        if(sid>0) {
            SASite *s=&sa_site[sid]; s->probes++; s->probe_hit+=hit; s->probe_miss+=!hit;
        }
    }
}
static void sa_hit(int depth, JSValueConst val, int flags) {
    int sid=sa_current;
    if(sa_count && sa_run_depth && sid>0) {
        SASite *s=&sa_site[sid];
        s->own+=(depth==0); s->proto+=(depth>0);
        s->depth[depth<7?depth:7]++;
        /* Data-value tags only. Other union variants are never read as values. */
        if(!(flags & JS_PROP_TMASK)) {
            int tag=JS_VALUE_GET_TAG(val)+16;
            if(tag>=0 && tag<32) s->tags[tag]++;
        }
    }
}
static void sa_flag(int which) {
    if(sa_count && sa_run_depth && sa_current>0) {
        SASite *s=&sa_site[sa_current];
        if(which==0) s->fallback++;
        if(which==1) s->missing++;
        if(which==2) s->fast_write++;
    }
}
static void sa_signal(int sig, siginfo_t *info, void *ctx) {
    int saved=errno;
    sig_atomic_t ix=sa_used;
    struct timespec ts;
    (void)sig; (void)info;
    if(ix<SA_NSAMPLE) {
        /* CLOCK_MONOTONIC clock_gettime is async-signal-safe on this platform. */
        clock_gettime(CLOCK_MONOTONIC,&ts);
        sa_samples[ix].ns=(uint64_t)ts.tv_sec*1000000000ULL+ts.tv_nsec;
        sa_samples[ix].pc=((ucontext_t *)ctx)->uc_mcontext.gregs[REG_RIP];
        sa_samples[ix].site=sa_current;
        sa_used=ix+1;
    } else sa_dropped++;
    errno=saved;
}
static void __attribute__((constructor)) sa_init(void) {
    const char *x;
    sa_out=getenv("SA_OUT"); sa_enabled=(sa_out!=NULL);
    x=getenv("SA_CONTEXT"); sa_context=x && atoi(x);
    x=getenv("SA_COUNT"); sa_count=x && atoi(x);
    x=getenv("SA_INTERVAL_US"); sa_interval=x?atoi(x):0;
    if(sa_interval>0) {
        struct sigaction act={0}; struct itimerval timer={0};
        act.sa_sigaction=sa_signal; act.sa_flags=SA_SIGINFO|SA_RESTART;
        sigemptyset(&act.sa_mask);
        if(sigaction(SIGPROF,&act,NULL)) abort();
        timer.it_interval.tv_sec=sa_interval/1000000;
        timer.it_interval.tv_usec=sa_interval%1000000;
        timer.it_value=timer.it_interval;
        if(setitimer(ITIMER_PROF,&timer,NULL)) abort();
    }
}
static FILE *sa_file(const char *suffix) {
    char path[4096]; FILE *f;
    snprintf(path,sizeof(path),"%s.%s",sa_out,suffix);
    /* Refuse accidental overwrite of an earlier diagnostic artifact. */
    int fd=open(path,O_WRONLY|O_CREAT|O_EXCL,0600);
    if(fd<0 || !(f=fdopen(fd,"w"))) abort();
    return f;
}
static void sa_csv(FILE *f,const char *s) {
    fputc('"',f); for(;*s;s++) { if(*s=='"') fputc('"',f); fputc(*s,f); } fputc('"',f);
}
static void __attribute__((destructor)) sa_finish(void) {
    struct itimerval zero={0}; FILE *f; unsigned i,j;
    setitimer(ITIMER_PROF,&zero,NULL);
    if(!sa_enabled) return;
    f=sa_file("functions.csv");
    fputs("id,filename,name,line,col,byte_length,bytecode_hex,source\n",f);
    for(i=1;i<=sa_nfun;i++) {
        SAFunc *p=&sa_fun[i]; fprintf(f,"%u,",i); sa_csv(f,p->filename); fputc(',',f);
        sa_csv(f,p->name); fprintf(f,",%d,%d,%u,",p->line,p->col,p->len);
        sa_csv(f,p->hex); fputc(',',f); sa_csv(f,p->source); fputc('\n',f);
    } fclose(f);
    f=sa_file("sites.csv");
    fputs("id,fid,offset,opcode,opcode_name,property,line,col,ops,probes,probe_hit,probe_miss,own,prototype,missing,fallback,fast_write,depth0,depth1,depth2,depth3,depth4,depth5,depth6,depth7plus,tags\n",f);
    for(i=1;i<=sa_nsite;i++) {
        SASite *s=&sa_site[i];
        fprintf(f,"%u,%u,%u,%u,",s->id,s->fid,s->offset,s->opcode); sa_csv(f,s->name);
        fputc(',',f);sa_csv(f,s->property);
        fprintf(f,",%d,%d,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu",s->line,s->col,
          (unsigned long long)s->ops,(unsigned long long)s->probes,(unsigned long long)s->probe_hit,
          (unsigned long long)s->probe_miss,(unsigned long long)s->own,(unsigned long long)s->proto,
          (unsigned long long)s->missing,(unsigned long long)s->fallback,(unsigned long long)s->fast_write);
        for(j=0;j<8;j++)fprintf(f,",%llu",(unsigned long long)s->depth[j]);
        fputs(",\"",f);for(j=0;j<32;j++)if(s->tags[j])fprintf(f,"%d:%llu;",(int)j-16,(unsigned long long)s->tags[j]);fputs("\"\n",f);
    } fclose(f);
    f=sa_file("origins.csv"); fputs("diagnostic_source_line,probes,with_site,hits\n",f);
    for(i=0;i<SA_NORIGIN;i++)if(sa_origins[i][0])fprintf(f,"%u,%llu,%llu,%llu\n",i,
       (unsigned long long)sa_origins[i][0],(unsigned long long)sa_origins[i][1],(unsigned long long)sa_origins[i][2]);
    fclose(f);
    f=sa_file("samples.csv"); fputs("monotonic_ns,pc,site\n",f);
    for(i=0;i<(unsigned)sa_used;i++)fprintf(f,"%llu,0x%lx,%d\n",(unsigned long long)sa_samples[i].ns,(unsigned long)sa_samples[i].pc,sa_samples[i].site);
    fclose(f);
    f=sa_file("maps"); FILE *in=fopen("/proc/self/maps","r");char buf[4096];
    if(in) { while(fgets(buf,sizeof(buf),in))fputs(buf,f);fclose(in); } fclose(f);
    f=sa_file("meta.txt");fprintf(f,"context=%d\ncount=%d\ninterval_us=%d\nsamples=%d\ndropped=%d\n",sa_context,sa_count,sa_interval,sa_used,sa_dropped);fclose(f);
}
