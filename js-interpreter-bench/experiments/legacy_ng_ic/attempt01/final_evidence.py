"""Read-only final provenance checks and copies; no performance runs."""
import json
import platform
import resource
import subprocess
import sys
from pathlib import Path
from prepare_sources import HERE,ROOT,save,sha
from build import capture
import run


def main():
    m=run.verify()
    base=json.loads((HERE/'source_evidence/base_files.json').read_text())
    port=json.loads((HERE/'source_evidence/port_source_hashes.v2.json').read_text())
    checks={}
    for v,art in m['artifacts'].items():
        src=Path(art['source'])
        expected=base if v=='A' else port
        bad=[p for p,h in expected.items() if sha(src/p.replace('\\','/'))!=h]
        assert not bad,bad
        checks[v]=dict(source_files_checked=len(expected),mismatches=bad,
                       binary_sha256=sha(art['path']))
        for name in ['qjs','qjsc','quickjs.c','quickjs-opcode.h','Makefile']:
            save(HERE/'artifacts'/v/name,(src/name).read_bytes())
        if v=='B':save(HERE/'artifacts/B/LICENSE.NG',(src/'LICENSE.NG').read_bytes())
    changed=[p for p,h in base.items() if sha(Path(m['artifacts']['B']['source'])/p.replace('\\','/'))!=h]
    assert sorted(changed)==['quickjs-opcode.h','quickjs.c'],changed
    checks['B_changed_original_files']=changed
    # Static disassembly only: it is not a dynamic branch frequency measurement.
    b=m['artifacts']['B']['path']
    for label,symbol in [('B_IC_get','JS_GetPropertyInternalWithIC.constprop.0'),
                         ('B_IC_probe','get_ic_prop_offset.isra.0')]:
        r=capture(label,['objdump','-d','-M','intel','--disassemble='+symbol,b])
        assert r['exit_code']==0 and '<'+symbol+'>:' in r['stdout']
    for v in ['A','B']:
        r=capture(v+'_interpreter_asm',['objdump','-d','-M','intel','--disassemble=JS_CallInternal',m['artifacts'][v]['path']])
        assert r['exit_code']==0 and '<JS_CallInternal>:' in r['stdout']
    deps={str(p.resolve()):sha(p) for p in map(Path,[
        '/usr/bin/gcc','/usr/bin/ld','/usr/bin/python3',
        '/lib/x86_64-linux-gnu/libm.so.6','/lib/x86_64-linux-gnu/libc.so.6',
        '/lib64/ld-linux-x86-64.so.2'])}
    checks['dependencies_sha256']=deps
    save(HERE/'source_evidence/final_identity.json',checks)
    run.capture_environment('completion')
    # Small diagnostic of the RSS method, not an execution-performance sample.
    child_code=r'''
import json,os,resource,subprocess,sys,tempfile
inflate=int(sys.argv[2]);padding=bytearray(inflate*1024*1024)
parent=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
p=subprocess.Popen([sys.argv[1],'-e',"console.log('RSS_METHOD_PASS')"],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
_,status,usage=os.wait4(p.pid,0);p.returncode=os.waitstatus_to_exitcode(status)
out,err=p.communicate();assert p.returncode==0 and b'RSS_METHOD_PASS' in out and not err
with tempfile.TemporaryDirectory(prefix='legacy_rss_') as tmp:
    path=tmp+'/maxrss'
    q=subprocess.run(['/usr/bin/time','-f','%M','-o',path,'--',sys.argv[1],'-e',"console.log('RSS_METHOD_PASS')"],capture_output=True)
    assert q.returncode==0 and not q.stderr
    small=int(open(path).read())
print(json.dumps(dict(parent_inflate_MiB=inflate,parent_peak_KiB=parent,
    popen_wait4_child_peak_KiB=usage.ru_maxrss,gnu_time_qjs_peak_KiB=small)))
'''
    controls=[]
    for inflate in [0,64]:
        r=capture('RSS_floor_control_'+str(inflate),[sys.executable,'-c',child_code,m['artifacts']['A']['path'],str(inflate)])
        assert r['exit_code']==0
        controls.append(json.loads(r['stdout']))
    save(HERE/'analysis/rss_floor_control.json',dict(
        controls=controls,
        scope='small -e shell control only; diagnostic of measurement mechanism',
        formal_records_unchanged=True,
        interpretation='Popen/wait4 peak includes fork/pre-exec footprint; GNU time launches qjs after its own small exec. Do not interpret formal floor as qjs live memory.'))
    print('FINAL_EVIDENCE_PASS',flush=True)


if __name__=='__main__':main()
