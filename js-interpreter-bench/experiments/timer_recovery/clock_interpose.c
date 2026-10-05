// DIAGNOSTIC ONLY. Never loaded during correctness/calibration/formal measurements.
#define _GNU_SOURCE
#include <dlfcn.h>
#include <time.h>
#include <stdio.h>
#include <stdint.h>
static int (*real_clock)(clockid_t,struct timespec*);
static unsigned long counts[16];
__attribute__((constructor)) static void init_clock_audit(void) {
    real_clock=dlsym(RTLD_NEXT,"clock_gettime");
}
int clock_gettime(clockid_t id,struct timespec *ts) {
    int ret=real_clock(id,ts);
    if(id>=0 && id<16) __atomic_fetch_add(&counts[id],1,__ATOMIC_RELAXED);
    return ret;
}
__attribute__((destructor)) static void finish_clock_audit(void) {
    fprintf(stderr,"CLOCK_COUNTS:");
    for(int i=0;i<16;i++) fprintf(stderr,"%s%lu",i?",":"",counts[i]);
    fprintf(stderr,"\n");
}
