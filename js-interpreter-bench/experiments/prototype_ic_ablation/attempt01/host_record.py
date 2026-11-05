"""One read-only Windows host/worktree snapshot. No power setting changes."""
import subprocess
from common import HERE,save,stamp,sha,OLD

def main():
    repo=HERE.parents[3];records=[]
    for name,cmd in [
      ('HEAD',['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),'rev-parse','HEAD']),
      ('branch',['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),'branch','--show-current']),
      ('status',['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),'status','--short']),
      ('power_scheme',['powercfg','/getactivescheme']),
      ('battery',['powershell','-NoProfile','-Command','Get-CimInstance Win32_Battery | Select-Object BatteryStatus,EstimatedChargeRemaining | ConvertTo-Json -Compress']),
      ('processes',['powershell','-NoProfile','-Command','Get-Process | Sort-Object CPU -Descending | Select-Object -First 8 ProcessName,CPU | ConvertTo-Json -Compress'])]:
        try:
            r=subprocess.run(cmd,capture_output=True,timeout=20)
            records.append(dict(name=name,command=cmd,exit_code=r.returncode,stdout=r.stdout.decode(errors='replace'),stderr=r.stderr.decode(errors='replace')))
        except (OSError,subprocess.TimeoutExpired) as e:records.append(dict(name=name,command=cmd,status='UNKNOWN',error=str(e)))
    save(HERE/'host_windows.json',dict(timestamp=stamp(),read_only=True,power_control_not_changed=True,foreground_or_thermal_control='UNKNOWN',records=records,
        referenced_old_files={name:sha(OLD/name) for name in ['README.md','H_manifest.json','patches/M_to_H.patch','mechanism_sites.csv','correctness/semantic_gate.json','analysis_performance/summary.csv','analysis_performance/ratios.csv']}))
if __name__=='__main__':main()
