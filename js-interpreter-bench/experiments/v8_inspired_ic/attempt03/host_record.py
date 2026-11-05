"""Standalone read-only Windows power/load recorder, no VM/runtime imports."""
import argparse,ctypes,json,os,platform,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
class Power(ctypes.Structure):
    _fields_=[('ACLineStatus',ctypes.c_ubyte),('BatteryFlag',ctypes.c_ubyte),('BatteryLifePercent',ctypes.c_ubyte),('SystemStatusFlag',ctypes.c_ubyte),('BatteryLifeTime',ctypes.c_ulong),('BatteryFullLifeTime',ctypes.c_ulong)]
def ticks():
    a=[ctypes.c_ulonglong() for _ in range(3)];assert ctypes.windll.kernel32.GetSystemTimes(*map(ctypes.byref,a));return [x.value for x in a]
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('filename');args=p.parse_args();dest=Path(__file__).parent/args.filename;assert not dest.exists()
    ps=Power();ok=ctypes.windll.kernel32.GetSystemPowerStatus(ctypes.byref(ps));a=ticks();time.sleep(1);b=ticks();d=[y-x for x,y in zip(a,b)];total=d[1]+d[2]
    plan=subprocess.run(['powercfg','/getactivescheme'],capture_output=True)
    row=dict(timestamp=datetime.now(timezone.utc).isoformat(),host=platform.node(),platform=platform.platform(),logical_cpus=os.cpu_count(),ACLineStatus=ps.ACLineStatus if ok else None,battery_percent=ps.BatteryLifePercent if ok else None,power_plan=plan.stdout.decode(errors='replace'),power_query_exit=plan.returncode,system_busy_fraction=(total-d[0])/total if total else None,frequency='UNKNOWN',temperature='UNKNOWN',background_attribution='UNKNOWN',changed_system_settings=False)
    dest.write_text(json.dumps(row,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');print(row)
