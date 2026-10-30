"""Short serialization/GC, optional reused sanitizer and bounded disassembly."""
import argparse,shutil
from common import *

def serialization():
    m=read(HERE/'diagnostic_manifest.json');src=Path(m['source']);out=src/'serial_check'
    cmd=['gcc','-O2','-g','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-I'+str(src),HERE/'check_serial.c']
    cmd+=[src/'.obj'/(name+'.o') for name in ['dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',out]
    r=capture('serial_build2',cmd,timeout=600);assert r['exit_code']==0
    hot=STORE/'ON.hot.bytecode'
    for mode,c in [('write','ON'),('read','OFF'),('read','ON')]:
        r=capture('serial.'+mode+'.'+c,[out,mode,hot],env=environment(option(c)));assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
    save(HERE/'raw/ON.hot.bytecode.gz',gzip.compress(hot.read_bytes(),mtime=0))
    save(HERE/'gates/serialization.json',dict(status='PASS',processes=3,ON_hot_written=True,OFF_reload_zero_prototype_fill_hit=True,ON_reload_refills_and_hits=True,ROM_and_copy=True,option_immutable_after_environment_change=True,cache_edges_balanced=True,binary_sha256=sha(out),bytecode_sha256=sha(hot)))

def sanitizer():
    m=read(HERE/'manifest.json');src=Path(m['switch']['source']);dst=STORE/'sanitizer';assert not dst.exists()
    for name in m['source_files']:
        p=dst/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/name,p)
    r=capture('sanitizer_build',['make','-j2','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs'],dst,timeout=900);assert r['exit_code']==0
    p=HERE/'scripts/lifecycle_v2.js'
    for c in ['OFF','ON']:
        r=capture('sanitizer.lifecycle.'+c,[dst/'qjs',p],env=environment(option(c)));assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
    save(HERE/'gates/sanitizer.json',dict(status='PASS',short_processes=2,ASan=True,UBSan=True,sha256=sha(dst/'qjs'),formal=False,long_H_OOM_suite_not_repeated=True))

def assembly():
    m=read(HERE/'manifest.json');binary=m['switch']['path'];assert sha(binary)==m['switch']['sha256']
    cmd=['objdump','-d','-Mintel','--disassemble=JS_CallInternal',binary]
    r=subprocess.run(cmd,capture_output=True,timeout=60);assert r.returncode==0 and not r.stderr
    raw=r.stdout;save(HERE/'raw/JS_CallInternal.asm.gz',gzip.compress(raw,mtime=0));lines=raw.decode().splitlines();selected=[];refs=[]
    for i,line in enumerate(lines):
        if 'qjs_experiment_proto_ic_enabled' in line:
            refs.append(line)
            selected+=lines[max(0,i-10):min(len(lines),i+14)]+['']
    save(HERE/'switch_assembly_excerpt.txt','\n'.join(selected)+'\n')
    nm=subprocess.run(['nm','-S',binary],capture_output=True,text=True);assert nm.returncode==0
    helper=[x for x in nm.stdout.splitlines() if re.search(r'\b(rdi_probe|rdi_update)$',x)]
    save(HERE/'assembly.json',dict(command=cmd,binary_sha256=m['switch']['sha256'],compressed_sha256=sha(HERE/'raw/JS_CallInternal.asm.gz'),raw_sha256=hashlib.sha256(raw).hexdigest(),option_references=refs,probe_update_out_of_line_symbols=helper,source_check='only eligible inherited fill conditional uses option; own hit source block unchanged',cycle_claim=False,actual_own_branch_execution_trace=None))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['serialization','sanitizer','assembly']);a=p.parse_args();globals()[a.stage]()
