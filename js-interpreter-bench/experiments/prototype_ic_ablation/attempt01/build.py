"""Independent H copy; no original runtime/source is modified."""
import argparse,difflib,shutil
from common import *

def apply_switch(dst):
    p=dst/'quickjs.c';s=p.read_text();s=one(s,'#include "quickjs.h"','#include "quickjs.h"\n\n'+(HERE/'switch_init.inc').read_text());p.write_text(s)
    p=dst/'qjs.c';s=p.read_text();s=one(s,'int main(int argc, char **argv)','extern int qjs_experiment_proto_ic_init(void);\nint main(int argc, char **argv)')
    s=one(s,'int main(int argc, char **argv)\n{','int main(int argc, char **argv)\n{\n    if (qjs_experiment_proto_ic_init() < 0) {\n        fputs("QJS_EXPERIMENT_PROTO_IC must be 0 or 1\\n", stderr);\n        return 2;\n    }');p.write_text(s)
    p=dst/'read_ic_opcodes.inc';s=p.read_text();s=one(s,'origin->shape->is_hashed && p->shape->is_hashed)', 'origin->shape->is_hashed && p->shape->is_hashed && qjs_experiment_proto_ic_enabled)');p.write_text(s)

def build():
    h,m=verify_old();dst=STORE/'switch';assert not dst.exists()
    save(HERE/'started.json',dict(timestamp=stamp(),budget_seconds=14400,reference_commit=read(HERE/'protocol.json')['reference_commit']))
    r=capture('environment',['sh','-c','uname -a; cat /etc/os-release; gcc --version; lscpu; uptime; ps -eo pid,stat,comm,pcpu,args']);assert r['exit_code']==0
    src=Path(h['source'])
    for name in h['source_files']:
        p=dst/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/name,p)
    originals={name:(dst/name).read_text() for name in ['quickjs.c','qjs.c','read_ic_opcodes.inc']}
    apply_switch(dst)
    changed=[name for name in h['source_files'] if sha(dst/name)!=h['source_files'][name]]
    assert sorted(changed)==sorted(originals),changed
    patch=''.join(''.join(difflib.unified_diff(old.splitlines(True),(dst/name).read_text().splitlines(True),fromfile='a/'+name,tofile='b/'+name)) for name,old in originals.items())
    save(HERE/'patches/H_to_switch.patch',patch)
    r=capture('switch_release_build',['make','-j2','qjs','qjsc'],dst,timeout=600);assert r['exit_code']==0
    save(HERE/'manifest.json',dict(timestamp=stamp(),M=m,H=dict(path=h['binary'],sha256=h['sha256']),
      switch=dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),size=(dst/'qjs').stat().st_size),
      source_files={name:sha(dst/name) for name in h['source_files']},changed_source_files=changed,patch_sha256=sha(HERE/'patches/H_to_switch.patch'),
      compiler='GCC13.3.0; actual banner in environment.json',flags='unchanged -O2 -g -fwrapv; no LTO/PGO/NDEBUG/padding',
      runtime_structure_fields_changed=False,ReadICSite_bytes=24,ReadICSite_bytes_evidence='unchanged type SHA; measured separately in new diagnostic',
      option_storage='file-static ints in quickjs.c; qjs main calls initializer before runtime; private extern, not in quickjs.h or JS',
      initialized_once=True,check_location='qualified inherited fill only; no explicit option check in own hit',
      H_reference_manifest_sha256=sha(OLD/'H_manifest.json')))
    print('SWITCH_RELEASE_READY',flush=True)

def diagnostic():
    artifacts();old=read(OLD/'mechanism_manifest.json')['H'];src=Path(old['source']);dst=STORE/'diagnostic';assert not dst.exists()
    h=read(OLD/'H_manifest.json')
    for name in h['source_files']:
        p=dst/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/name,p)
    for name in ['audit_hooks.h','audit_tail.inc']:shutil.copy2(src/name,dst/name)
    for name,digest in old['source_files'].items():assert sha(dst/name)==digest,name
    originals={name:(dst/name).read_text() for name in ['quickjs.c','qjs.c','read_ic_opcodes.inc','audit_hooks.h']}
    apply_switch(dst)
    p=dst/'audit_hooks.h';s=p.read_text();s=one(s,'static void hglobal_json(FILE *out) {','static void hglobal_json(FILE *out) {\n    fprintf(out,",\\\"proto_option\\\":%d",qjs_experiment_proto_ic_enabled);');p.write_text(s)
    patch=''.join(''.join(difflib.unified_diff(oldtext.splitlines(True),(dst/name).read_text().splitlines(True),fromfile='a/'+name,tofile='b/'+name)) for name,oldtext in originals.items())
    save(HERE/'patches/old_H_diagnostic_to_switch_diagnostic.patch',patch)
    r=capture('switch_diagnostic_build',['make','-j2','qjs'],dst,timeout=600);assert r['exit_code']==0
    save(HERE/'diagnostic_manifest.json',dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),source_files={name:sha(dst/name) for name in [*h['source_files'],'audit_hooks.h','audit_tail.inc']},formal=False,old_H_diagnostic=old))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','diagnostic']);a=p.parse_args();globals()[a.stage]()
