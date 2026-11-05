"""Additional knowable environment/PMU facts, not a timing run."""
import shutil
from common import *
def main():
    info={}
    for name,p in [('perf_event_paranoid','/proc/sys/kernel/perf_event_paranoid'),('scaling_governor','/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'),('scaling_driver','/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver'),('AC_power','/sys/class/power_supply/AC/online')]:
        try:info[name]=Path(p).read_text().strip()
        except (OSError,FileNotFoundError):info[name]=None
    info.update(perf_executable=shutil.which('perf'),cpu_PMU_available=Path('/sys/bus/event_source/devices/cpu').exists(),PMU_counts=None,multiplex_ratio=None,
      PMU_cases_predeclared=['M1.own_integer','M4.numeric_control','Richards.Richards','RayTrace.RayTrace'],
      PMU_status='UNKNOWN: perf not installed; no PMU experiment, no substitute diagnostic time',power_control=None,background_control=None)
    save(HERE/'raw/environment/additional.json',info);print(json.dumps(info),flush=True)
if __name__=='__main__':main()
