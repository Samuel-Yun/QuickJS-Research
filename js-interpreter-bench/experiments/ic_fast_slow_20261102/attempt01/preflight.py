"""Inspect frozen public runtimes/tools and archive small public source excerpts."""
from common import *
def main():
    old=read(ROOT/'experiments/v8_qjs_ic_source_compare/attempt01/runtime_before.json')
    artifacts={'A':old['artifacts']['QJS_A'],'M':old['artifacts']['QJS_M'],'V8_ON':old['artifacts']['V8_ON']}
    validate_artifacts([*artifacts.values(),*old['dependencies']])
    checks=[]
    for label,entry in old['sources'].items():
        for name,h in entry['files'].items():
            p=Path(entry['path'])/name
            checks.append(dict(condition=label,file=name,sha256=sha(p),valid=sha(p)==h))
    assert all(r['valid'] for r in checks)
    compiler=capture(['gcc','--version'],'compiler');save(HERE/'raw/preflight/compiler.json',compiler)
    assert '13.3.0' in compiler['stdout']
    environment=capture(['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu,args --sort=-pcpu | head -20; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null; true'],'environment')
    save(HERE/'raw/preflight/environment.json',environment)
    save(HERE/'environment.txt',environment['stdout']+'\nFrequency/temperature/continuous host background control: UNKNOWN. No system settings changed.\n')
    tool=capture(['sh','-c','command -v make; command -v gcc; command -v gdb; command -v objdump; command -v perf; command -v ninja; python3 --version'],'tools');save(HERE/'raw/preflight/tools.json',tool)
    perf=capture(['sh','-c','if command -v perf >/dev/null; then perf stat -e cycles,instructions,branches,branch-misses -- true; else exit 127; fi'],'one perf capability check')
    save(HERE/'raw/preflight/perf.json',perf)
    m=dict(host=platform.node(),kernel=platform.release(),architecture=platform.machine(),boot_id=boot(),affinity=[2],
           artifacts=artifacts,dependencies=old['dependencies'],sources=old['sources'],compiler=compiler['stdout'].splitlines()[0],
           flags='-O2 -g -fwrapv, official Makefile; no new LTO/PGO/NDEBUG',
           v8_flags=['--jitless','--no-lazy','--use-ic'],V8_actual_build_commit=None,
           public_source_checks=checks,store=str(STORE),power=None,frequency=None,temperature=None)
    save(HERE/'runtime.json',m)
    for name in ['read_ic_types.h','read_ic_prepare.inc','read_ic_runtime.inc','read_ic_opcodes.inc','read_ic_config.h']:
        src=Path(old['sources']['M']['path'])/name
        save(HERE/'source_reference/M'/name,src.read_bytes())
    a=Path(old['sources']['A']['path']);s=(a/'quickjs.c').read_text()
    for name,begin,end in [('find_own_property','static force_inline JSShapeProperty *find_own_property(', '\nstatic '),
                           ('GET_FIELD_INLINE','#define GET_FIELD_INLINE(', '        CASE(OP_get_field):')]:
        i=s.index(begin);j=s.index(end,i+len(begin));save(HERE/'source_reference/A'/(name+'.txt'),s[i:j])
    save(HERE/'source_reference/LICENSE.QuickJS',(a/'LICENSE').read_bytes())
    print('PREFLIGHT_PASS: A/M/d8 identity and source checked; perf check',perf['exit_code'],flush=True)
if __name__=='__main__':main()
