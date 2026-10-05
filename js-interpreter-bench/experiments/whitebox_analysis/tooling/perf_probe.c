#define _GNU_SOURCE
#include <linux/perf_event.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <stdint.h>
int main(void) {
  const char *names[]={"cycles","instructions","branches","branch-misses","cpu-clock","task-clock"};
  unsigned types[]={0,0,0,0,1,1};
  unsigned configs[]={PERF_COUNT_HW_CPU_CYCLES,PERF_COUNT_HW_INSTRUCTIONS,
    PERF_COUNT_HW_BRANCH_INSTRUCTIONS,PERF_COUNT_HW_BRANCH_MISSES,
    PERF_COUNT_SW_CPU_CLOCK,PERF_COUNT_SW_TASK_CLOCK};
  for(int i=0;i<6;i++) {
    struct perf_event_attr a; memset(&a,0,sizeof(a)); a.size=sizeof(a);
    a.type=types[i];a.config=configs[i];a.exclude_kernel=1;a.exclude_hv=1;
    int fd=syscall(SYS_perf_event_open,&a,0,-1,-1,0);int err=errno;
    uint64_t value=0;long got=-1;
    if(fd>=0){volatile unsigned j;for(j=0;j<100000;j++);got=read(fd,&value,sizeof(value));close(fd);}
    printf("%s fd=%d errno=%d error=%s read_bytes=%ld value=%llu\n",names[i],fd,fd<0?err:0,
      fd<0?strerror(err):"none",got,(unsigned long long)value);
  }
  return 0;
}
