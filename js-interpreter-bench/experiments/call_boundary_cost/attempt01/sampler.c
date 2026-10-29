#define _GNU_SOURCE
#include <stdatomic.h>
#include <stdint.h>
#include <signal.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <ucontext.h>
#include <time.h>
#include <errno.h>
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "quickjs.h"

/* Only signal-safe numeric recording in handler; single-thread is checked. */
_Static_assert(ATOMIC_INT_LOCK_FREE == 2, "lock-free unsigned int required");
typedef struct { uint64_t rip,ns; } Sample;
enum { CAPACITY=131072 };
static Sample *buffer;
static _Atomic unsigned used,overflow,clock_errors;
static volatile sig_atomic_t active;
static int begun,ended,enabled,period_us,threads_before,threads_after;
static struct sigaction old_action;
static sigset_t old_mask,prof_mask;
static struct itimerval old_timer;
static struct timespec window_start,window_stop,cpu_start,cpu_stop;
static struct rusage ru_start,ru_stop;
static const char *output;

static uint64_t ns(struct timespec t) { return (uint64_t)t.tv_sec*1000000000ULL+t.tv_nsec; }
static void handler(int sig,siginfo_t *info,void *context) {
    int saved_errno=errno;(void)sig;(void)info;
    if(active){
        unsigned i=atomic_fetch_add_explicit(&used,1,memory_order_relaxed);
        if(i<CAPACITY){
            struct timespec t;
            if(clock_gettime(CLOCK_MONOTONIC,&t)==0){
                buffer[i].rip=(uint64_t)((ucontext_t*)context)->uc_mcontext.gregs[REG_RIP];
                buffer[i].ns=(uint64_t)t.tv_sec*1000000000ULL+t.tv_nsec;
            }else{buffer[i].rip=0;buffer[i].ns=0;atomic_fetch_add_explicit(&clock_errors,1,memory_order_relaxed);}
        }else atomic_fetch_add_explicit(&overflow,1,memory_order_relaxed);
    }
    errno=saved_errno;
}
static int thread_count(void){
    DIR *d=opendir("/proc/self/task");if(!d)return -1;
    struct dirent *e;int n=0;while((e=readdir(d)))if(e->d_name[0]!='.')n++;
    closedir(d);return n;
}
static int copy_maps(const char *suffix){
    char path[4096],data[8192];snprintf(path,sizeof(path),"%s.%s.maps",output,suffix);
    FILE *in=fopen("/proc/self/maps","r"),*out=fopen(path,"wx");
    if(!in||!out){if(in)fclose(in);if(out)fclose(out);return -1;}
    size_t n;while((n=fread(data,1,sizeof(data),in)))if(fwrite(data,1,n,out)!=n){fclose(in);fclose(out);return -1;}
    fclose(in);return fclose(out);
}
static JSValue begin(JSContext *ctx,JSValueConst th,int argc,JSValueConst *argv){
    (void)th;(void)argc;(void)argv;
    if(begun)return JS_ThrowInternalError(ctx,"sampler begin twice");
    output=getenv("CALL_BOUNDARY_REPORT");if(!output)return JS_ThrowInternalError(ctx,"sampler output missing");
    enabled=getenv("CALL_BOUNDARY_ON")&&strcmp(getenv("CALL_BOUNDARY_ON"),"1")==0;
    period_us=getenv("CALL_BOUNDARY_PERIOD_US")?atoi(getenv("CALL_BOUNDARY_PERIOD_US")):7000;
    if(period_us<1000||period_us>1000000)return JS_ThrowInternalError(ctx,"invalid period");
    threads_before=thread_count();if(threads_before!=1)return JS_ThrowInternalError(ctx,"sampler requires one thread");
    if(sigaction(SIGPROF,NULL,&old_action)||getitimer(ITIMER_PROF,&old_timer))return JS_ThrowInternalError(ctx,"cannot inspect SIGPROF");
    if(old_action.sa_handler!=SIG_DFL || old_timer.it_value.tv_sec || old_timer.it_value.tv_usec || old_timer.it_interval.tv_sec || old_timer.it_interval.tv_usec)
        return JS_ThrowInternalError(ctx,"existing SIGPROF owner/timer: refuse overwrite");
    sigemptyset(&prof_mask);sigaddset(&prof_mask,SIGPROF);
    if(sigprocmask(SIG_BLOCK,&prof_mask,&old_mask))return JS_ThrowInternalError(ctx,"mask failure");
    sigset_t pending;sigpending(&pending);
    if(sigismember(&old_mask,SIGPROF)||sigismember(&pending,SIGPROF)){
        sigprocmask(SIG_SETMASK,&old_mask,NULL);return JS_ThrowInternalError(ctx,"SIGPROF blocked/pending before begin");
    }
    buffer=calloc(CAPACITY,sizeof(*buffer));if(!buffer){sigprocmask(SIG_SETMASK,&old_mask,NULL);return JS_ThrowOutOfMemory(ctx);}
    volatile unsigned char *touch=(volatile unsigned char*)buffer;
    for(size_t i=0;i<CAPACITY*sizeof(*buffer);i+=4096)touch[i]=0;
    touch[CAPACITY*sizeof(*buffer)-1]=0; /* volatile pre-touch, not optimized away */
    if(!atomic_is_lock_free(&used)||!atomic_is_lock_free(&overflow)||!atomic_is_lock_free(&clock_errors))abort();
    atomic_store(&used,0);atomic_store(&overflow,0);atomic_store(&clock_errors,0);
    if(copy_maps("begin"))abort();
    struct sigaction sa={0};sa.sa_sigaction=handler;sa.sa_flags=SA_SIGINFO;sigemptyset(&sa.sa_mask);
    if(enabled && sigaction(SIGPROF,&sa,NULL))abort();
    clock_gettime(CLOCK_MONOTONIC,&window_start);clock_gettime(CLOCK_PROCESS_CPUTIME_ID,&cpu_start);getrusage(RUSAGE_SELF,&ru_start);
    begun=1;active=enabled;
    if(enabled){struct itimerval timer={0};timer.it_interval.tv_sec=period_us/1000000;timer.it_interval.tv_usec=period_us%1000000;timer.it_value=timer.it_interval;if(setitimer(ITIMER_PROF,&timer,NULL))abort();}
    if(sigprocmask(SIG_SETMASK,&old_mask,NULL))abort();return JS_UNDEFINED;
}
static JSValue end(JSContext *ctx,JSValueConst th,int argc,JSValueConst *argv){
    (void)th;(void)argc;(void)argv;
    if(!begun||ended)return JS_ThrowInternalError(ctx,"sampler end without begin / twice");
    clock_gettime(CLOCK_MONOTONIC,&window_stop);clock_gettime(CLOCK_PROCESS_CPUTIME_ID,&cpu_stop);getrusage(RUSAGE_SELF,&ru_stop);
    if(sigprocmask(SIG_BLOCK,&prof_mask,NULL))abort();active=0;
    if(enabled){struct itimerval zero={0};if(setitimer(ITIMER_PROF,&zero,NULL))abort();}
    /* Drain coalesced pending signal while blocked, before restoring SIG_DFL. */
    struct timespec zero_wait={0};unsigned drained=0;
    while(sigtimedwait(&prof_mask,NULL,&zero_wait)>=0)drained++;
    if(enabled && sigaction(SIGPROF,&old_action,NULL))abort();
    if(setitimer(ITIMER_PROF,&old_timer,NULL)||sigprocmask(SIG_SETMASK,&old_mask,NULL))abort();
    ended=1;threads_after=thread_count();if(threads_after!=1)return JS_ThrowInternalError(ctx,"thread count changed");
    if(copy_maps("end"))abort();
    unsigned total=atomic_load(&used),kept=total<CAPACITY?total:CAPACITY;
    char path[4096];snprintf(path,sizeof(path),"%s.samples.bin",output);FILE *f=fopen(path,"wx");if(!f)abort();
    if(fwrite(buffer,sizeof(*buffer),kept,f)!=kept || fclose(f))abort();
    snprintf(path,sizeof(path),"%s.meta.json",output);f=fopen(path,"wx");if(!f)abort();
    fprintf(f,"{\"schema\":\"little-endian uint64 rip,uint64 CLOCK_MONOTONIC_ns\",\"sample_bytes\":16,\"pid\":%d,\"enabled\":%s,\"period_us\":%d,\"capacity\":%u,\"delivered\":%u,\"retained\":%u,\"overflow\":%u,\"clock_errors\":%u,\"drained_pending\":%u,\"threads_before\":%d,\"threads_after\":%d,\"atomics_lock_free\":true,\"old_handler_default\":true,\"old_timer_zero\":true,\"window_start_ns\":%llu,\"window_stop_ns\":%llu,\"window_cpu_start_ns\":%llu,\"window_cpu_stop_ns\":%llu,\"voluntary_switches\":%ld,\"involuntary_switches\":%ld}\n",getpid(),enabled?"true":"false",period_us,CAPACITY,total,kept,atomic_load(&overflow),atomic_load(&clock_errors),drained,threads_before,threads_after,(unsigned long long)ns(window_start),(unsigned long long)ns(window_stop),(unsigned long long)ns(cpu_start),(unsigned long long)ns(cpu_stop),ru_stop.ru_nvcsw-ru_start.ru_nvcsw,ru_stop.ru_nivcsw-ru_start.ru_nivcsw);
    if(fclose(f))abort();free(buffer);buffer=NULL;return JS_UNDEFINED;
}
void call_boundary_register(JSContext *ctx){
    JSValue global=JS_GetGlobalObject(ctx);
    JS_SetPropertyStr(ctx,global,"__cbBegin",JS_NewCFunction(ctx,begin,"__cbBegin",0));
    JS_SetPropertyStr(ctx,global,"__cbEnd",JS_NewCFunction(ctx,end,"__cbEnd",0));
    JS_FreeValue(ctx,global);
}
