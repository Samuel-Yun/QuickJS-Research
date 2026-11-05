"""Small pre-confirmation inventory; no workload or compiler launched."""
import os,platform,time
from pathlib import Path
import run
H=run.HERE;lab=run.lab
def main():
    assert lab.load(H/'final_pilot.json')['status']=='PASS_FIXED_N'
    assert not (H/'final_environment.json').exists()
    os.sched_setaffinity(0,{2});ps=lab.capture(['ps','-eo','pid,ppid,comm,args'],'final_inventory','processes')
    suspicious=[]
    for line in ps['stdout'].splitlines()[1:]:
        f=line.split(None,3)
        if len(f)==4 and (f[2] in ['qjs','qjsc','d8','gcc','cc1','make'] or '/artifacts/' in f[3]):suspicious.append(line)
    assert not suspicious,dict(other_engine_compiler=suspicious)
    deps={};hashes={}
    for label in ['A','M',lab.load(H/'decision.json')['candidate'],'V8_ON']:
        art=run.measure.artifact(label);assert lab.sha(art['path'])==art['sha256']
        r=lab.capture(['ldd',art['path']],'final_inventory','ldd/'+label,15,dict(binary_sha256=art['sha256']))
        assert r['exit_code']==0 and not r['stderr'];deps[label]=r['stdout']
        for token in r['stdout'].split():
            if token.startswith('/') and Path(token).is_file():hashes[token]=lab.sha(token)
    lab.save(H/'final_environment.json',dict(boot_id=lab.boot(),timestamp=lab.stamp(),platform=platform.uname()._asdict(),
        OS=Path('/etc/os-release').read_text(),affinity=sorted(os.sched_getaffinity(0)),
        meminfo=Path('/proc/meminfo').read_text(),load_average=os.getloadavg(),
        reported_monotonic_clock=vars(time.get_clock_info('monotonic')),ldd=deps,dynamic_library_sha256=hashes,
        idle_helper=lab.load(H/'final_idle.json'),process_inventory_token=ps['token'],
        temperature='UNKNOWN',power_frequency_control='UNKNOWN',background_load_control='UNKNOWN',
        note='preformal after all builds/diagnostics; no full-cold-state or frequency-isolation claim'))
    print('FINAL_ENVIRONMENT_SAVED',lab.boot(),flush=True)
if __name__=='__main__':main()
