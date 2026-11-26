"""Read-only diagnosis of the unexpectedly interrupted preparation frontend."""
from common import *
if __name__=='__main__':
    folder=STORE/'sanitizer'
    procs=subprocess.run(['ps','-eo','pid,ppid,stat,comm,pcpu,args'],capture_output=True,text=True)
    memory=Path('/proc/meminfo').read_text()
    evidence=dict(timestamp=stamp(),boot_id=boot(),sanitizer_source_exists=folder.exists(),sanitizer_binary_exists=(folder/'qjs').exists(),
       objects=[dict(path=str(p),bytes=p.stat().st_size) for p in folder.glob('.obj/asan/ubsan/*.o')],memory=memory,processes=procs.stdout,
       prior_frontend_exit=1,prior_frontend_stderr='',cause='UNKNOWN; no sanitizer build completion record yet')
    save(HERE/'interrupted_prepare_inspection.json',evidence)
    print(json.dumps({k:v for k,v in evidence.items() if k not in ['memory','processes']},indent=2));print(procs.stdout,flush=True)
