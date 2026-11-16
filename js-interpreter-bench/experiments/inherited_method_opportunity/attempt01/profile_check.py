"""Bounded no-sudo availability check. No replacement signal profiler."""
from common import *
def main():
    verify();r=capture('perf_availability',['sh','-c','command -v perf; perf stat -e cycles -- true'],timeout=20)
    if r['exit_code']!=0:
        save(HERE/'profiling_gate.json',dict(status='UNAVAILABLE',attempts=1,error=r['stderr'],exit_code=r['exit_code'],no_sudo=True,no_install=True,no_signal_profiler=True,Richards_site_time_share=None))
        save(HERE/'profiling_status.md','# 采样未执行\n\n只做一次已有perf可用性检查：`command -v perf; perf stat -e cycles -- true`。\n\n```text\n'+r['stdout']+r['stderr']+'\n```\n\n原始命令/返回码见raw/commands/perf_availability.json。没有sudo、修改权限、安装/编译内核工具，也未改用有扰动的SIGPROF或每字段时钟。Richards三处的耗时贡献UNKNOWN；现有位置计数是频率，不是耗时排名。正式240条不含采样。\n')
    else:
        save(HERE/'profiling_gate.json',dict(status='AVAILABLE_NEEDS_BOUNDED_RECORD',attempts=1,no_sudo=True))
    print('PROFILE_CHECK_DONE',flush=True)
if __name__=='__main__':main()
