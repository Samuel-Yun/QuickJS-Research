"""Read-only Windows 1s system CPU delta and power status; run before Linux campaign."""
import argparse,ctypes,subprocess,time,platform
from common import *
class Power(ctypes.Structure):
    _fields_=[('ACLineStatus',ctypes.c_ubyte),('BatteryFlag',ctypes.c_ubyte),('BatteryLifePercent',ctypes.c_ubyte),('SystemStatusFlag',ctypes.c_ubyte),('BatteryLifeTime',ctypes.c_ulong),('BatteryFullLifeTime',ctypes.c_ulong)]
def ticks():
    v=[ctypes.c_ulonglong() for _ in range(3)]
    ok=ctypes.windll.kernel32.GetSystemTimes(*[ctypes.byref(x) for x in v])
    assert ok;return [x.value for x in v]
if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--output',help='new filename in this attempt');args=parser.parse_args()
    p=Power();ok=ctypes.windll.kernel32.GetSystemPowerStatus(ctypes.byref(p))
    a=ticks();t=time.perf_counter();time.sleep(1);b=ticks();d=[y-x for x,y in zip(a,b)];total=d[1]+d[2]
    plan=subprocess.run(['powercfg','/getactivescheme'],capture_output=True)
    if args.output:assert Path(args.output).name==args.output
    dest=HERE/(args.output or ('host_windows.json' if not (HERE/'host_windows.json').exists() else 'host_windows_retry.json'))
    save(dest,dict(timestamp=stamp(),platform=platform.platform(),host=platform.node(),logical_cpus=os.cpu_count(),system_CPU_observation_seconds=time.perf_counter()-t,system_busy_fraction=(total-d[0])/total if total else None,method='GetSystemTimes interval delta, not accumulated per-process CPU',ACLineStatus=p.ACLineStatus if ok else 'UNKNOWN',AC_meaning='0 offline,1 online,255 unknown',battery_percent=p.BatteryLifePercent if ok and p.BatteryLifePercent!=255 else 'UNKNOWN',power_plan=plan.stdout.decode('utf-8',errors='replace'),power_query_exit=plan.returncode,frequency='UNKNOWN',temperature='UNKNOWN',background_process_attribution='UNKNOWN',system_configuration_changed=False))
