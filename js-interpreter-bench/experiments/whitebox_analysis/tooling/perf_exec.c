#define _GNU_SOURCE
#include <linux/perf_event.h>
#include <sys/syscall.h>
#include <sys/ioctl.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <stdint.h>
#include <string.h>
/* Whole-process diagnostic counters, not timed-Run-only attribution. */
int main(int argc,char **argv) {
  if(argc<2)return 2;
  int barrier[2];if(pipe(barrier))return 3;
  pid_t child=fork();if(child<0)return 4;
  if(!child){close(barrier[1]);char b;if(read(barrier[0],&b,1)!=1)_exit(5);close(barrier[0]);execvp(argv[1],argv+1);_exit(127);}
  close(barrier[0]);
  const char *names[]={"cycles","instructions","branches","branch-misses","task-clock"};
  unsigned types[]={0,0,0,0,1},configs[]={0,1,4,5,1};int fd[5],err[5];
  for(int i=0;i<5;i++) {
    struct perf_event_attr a;memset(&a,0,sizeof(a));a.size=sizeof(a);
    a.type=types[i];a.config=configs[i];a.disabled=1;a.inherit=1;a.exclude_kernel=1;a.exclude_hv=1;
    a.read_format=PERF_FORMAT_TOTAL_TIME_ENABLED|PERF_FORMAT_TOTAL_TIME_RUNNING;
    fd[i]=syscall(SYS_perf_event_open,&a,child,-1,-1,0);err[i]=fd[i]<0?errno:0;
    if(fd[i]>=0)ioctl(fd[i],PERF_EVENT_IOC_ENABLE,0);
  }
  if(write(barrier[1],"x",1)!=1)return 6;close(barrier[1]);int status;waitpid(child,&status,0);
  for(int i=0;i<5;i++) {
    uint64_t v[3]={0,0,0};long bytes=-1;
    if(fd[i]>=0){bytes=read(fd[i],v,sizeof(v));close(fd[i]);}
    fprintf(stderr,"WB_PERF %s errno=%d bytes=%ld raw=%llu enabled_ns=%llu running_ns=%llu\n",
      names[i],err[i],bytes,(unsigned long long)v[0],(unsigned long long)v[1],(unsigned long long)v[2]);
  }
  return WIFEXITED(status)?WEXITSTATUS(status):128+WTERMSIG(status);
}
