#define _GNU_SOURCE
/* Independent diagnostic LD_PRELOAD sampler, never used for formal timing.
 * ITIMER_PROF top-PC only; no stack reconstruction and no exact self-time. */
#include <signal.h>
#include <sys/time.h>
#include <ucontext.h>
#include <time.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#define CAP 200000
struct sample { uintptr_t pc; uint64_t ns; };
static struct sample samples[CAP];
static unsigned used;
static void sample_pc(int sig, siginfo_t *info, void *context) {
    (void)sig; (void)info;
    unsigned i = __atomic_fetch_add(&used,1,__ATOMIC_RELAXED);
    if(i<CAP) {
        struct timespec ts;
        clock_gettime(CLOCK_MONOTONIC,&ts);
        samples[i].pc=((ucontext_t*)context)->uc_mcontext.gregs[REG_RIP];
        samples[i].ns=(uint64_t)ts.tv_sec*1000000000ull+ts.tv_nsec;
    }
}
__attribute__((constructor)) static void start_sampler(void) {
    struct sigaction action={0};
    action.sa_sigaction=sample_pc; action.sa_flags=SA_SIGINFO|SA_RESTART;
    sigemptyset(&action.sa_mask);
    sigaction(SIGPROF,&action,NULL);
    struct itimerval timer={.it_interval={0,1000},.it_value={0,1000}};
    setitimer(ITIMER_PROF,&timer,NULL);
}
__attribute__((destructor)) static void finish_sampler(void) {
    struct itimerval timer={0}; setitimer(ITIMER_PROF,&timer,NULL);
    const char *path=getenv("CF_SAMPLE_PATH"); if(!path) return;
    FILE *f=fopen(path,"w"); if(!f) return;
    unsigned n=used<CAP?used:CAP;
    fprintf(f,"monotonic_ns,pc\n");
    for(unsigned i=0;i<n;i++) fprintf(f,"%llu,0x%llx\n",(unsigned long long)samples[i].ns,(unsigned long long)samples[i].pc);
    fclose(f);
    char buf[8192],target[4096];
    snprintf(target,sizeof(target),"%s.maps",path);
    int in=open("/proc/self/maps",O_RDONLY),out=open(target,O_WRONLY|O_CREAT|O_TRUNC,0644);
    ssize_t length;
    if(in>=0 && out>=0) while((length=read(in,buf,sizeof(buf)))>0) {
        ssize_t offset=0,w;
        while(offset<length && (w=write(out,buf+offset,length-offset))>0) offset+=w;
    }
    if(in>=0) close(in); if(out>=0) close(out);
}
