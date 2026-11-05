from common import *
import shutil
def main():
    pin();old=read(PREV/'runtime.json');art={k:old['artifacts'][k] for k in ['A','M','V8_ON']}
    for a in list(art.values())+old['dependencies']:assert sha(a['path'])==a['sha256'],a['path']
    for info in old['sources'].values():
        for f,h in info['files'].items():assert sha(Path(info['path'])/f)==h
    out=dict(timestamp=stamp(),host=platform.node(),architecture=platform.machine(),kernel=platform.release(),
      boot_id=boot(),affinity=sorted(os.sched_getaffinity(0)),os_release=Path('/etc/os-release').read_text(),
      cpu=Path('/proc/cpuinfo').read_text(),memory=Path('/proc/meminfo').read_text(),
      artifacts=art,dependencies=old['dependencies'],sources=old['sources'],compiler=old['compiler'],flags=old['flags'],
      v8_flags=['--jitless','--no-lazy','--use-ic'],actual_V8_build_commit=None,
      power_frequency_temperature_control=None,windows_host_background_control=None,
      prior_boot_is_not_current=True,prior_head='894e0a35ff331d4235370dc26112e5916c27c567')
    save(HERE/'runtime.json',out)
    save(HERE/'environment.txt',json.dumps({k:v for k,v in out.items() if k not in ['cpu','memory','artifacts','sources','dependencies']},indent=2)+'\n'+out['cpu']+out['memory'])
    for c in ['A','M']:
        src=Path(old['sources'][c]['path'])
        s=(src/'quickjs.c').read_text()
        for anchor in ['#define GET_FIELD_INLINE','static void js_free_shape0','static JSShape *js_new_shape','static JSValue JS_CallInternal']:
            pos=s.find(anchor)
            save(HERE/'source_inspect'/f'{c}.{anchor.split()[-1].replace("*","")}.txt',s[max(0,pos-100):pos+6500] if pos>=0 else 'ANCHOR_NOT_FOUND')
    tools={k:shutil.which(k) for k in ['gcc','g++','make','ninja','clang','gn','gdb','perf','git','python3']}
    save(HERE/'tool_availability.json',dict(tools=tools,home_entries=[p.name for p in Path('/home/mzyx').iterdir() if any(t in p.name.lower() for t in ['v8','depot','cipd'])]))
    h=capture([art['V8_ON']['path'],'--help'],'d8 actual help');save(HERE/'raw/preflight/d8_help.json',h)
    f=capture([art['V8_ON']['path'],*out['v8_flags'],'--print-flag-values','-e','print(1)'],'d8 actual effective flags');save(HERE/'raw/preflight/d8_flags.json',f)
    assert h['exit_code']==f['exit_code']==0
    print('PREFLIGHT_PASS',boot(),flush=True)
if __name__=='__main__':main()
