"""Two bounded diagnostic runs, after all formal samples; no algorithm changes."""
import difflib,shutil
from common import *
from run import script
def main():
    assert read(HERE/'identity_after.json')['status']=='PASS'
    m=verify_runtime();src=Path(m['M_source']);dst=STORE/'M_prepare_snapshot'
    assert not dst.exists()
    for name,h in read(HERE/'sources.json')['M_source_files'].items():
        assert sha(src/name)==h
        target=dst/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/name,target)
    shutil.copy2(HERE/'diagnostic/prepare_probe.h',dst/'prepare_probe.h')
    p=dst/'quickjs.c';original=p.read_text();p.write_text('#define DUMP_BYTECODE 0\n'+original)
    p=dst/'read_ic_prepare.inc';s=p.read_text();t='#include "prepare_probe.h"\n'+s
    a='    uint32_t count = 0, index = 0;';assert t.count(a)==1;t=t.replace(a,'    prepare_snapshot(ctx,b,0);\n'+a)
    a='    assert(index == count);';assert t.count(a)==1;t=t.replace(a,'    prepare_snapshot(ctx,b,1);\n'+a);p.write_text(t)
    patch=''.join(difflib.unified_diff(original.splitlines(True),('#define DUMP_BYTECODE 0\n'+original).splitlines(True),fromfile='a/quickjs.c',tofile='b/quickjs.c'))
    patch+=''.join(difflib.unified_diff(s.splitlines(True),t.splitlines(True),fromfile='a/read_ic_prepare.inc',tofile='b/read_ic_prepare.inc'))
    save(HERE/'diagnostic/M_prepare_snapshot.patch',patch)
    r=capture('M_prepare_snapshot_build',['make','-j2','qjs'],dst);assert r['exit_code']==0
    artifact=dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),formal=False,header_sha256=sha(dst/'prepare_probe.h'),read_ic_prepare_sha256=sha(p),quickjs_sha256=sha(dst/'quickjs.c'))
    snapshots=[]
    for case in [CASES[0],CASES[2]]:
        report=STORE/'reports'/f'M_prepare.{case}.jsonl';assert not report.exists()
        env=os.environ.copy();env['IC_PREPARE_REPORT']=str(report);js=script(case,1,True)
        r=capture('M_prepare_'+case,[dst/'qjs',js],env=env);assert r['exit_code']==0 and not r['stderr'] and 'TEB_RESULT:' in r['stdout']
        data=report.read_bytes();save(HERE/'raw/diagnostic'/f'{report.name}.gz',gzip.compress(data,mtime=0))
        rows=[json.loads(l) for l in data.splitlines()];assert len(rows)==2 and [x['stage'] for x in rows]==[0,1]
        a,b=rows;assert a['source_hex']==b['source_hex']
        changes=[]
        for x,y in zip(a['opcodes'],b['opcodes']):
            assert x['pc']==y['pc'] and x['size']==y['size']
            if x!=y:
                assert x['op'] in ['get_field','get_field2'] and y['op']==x['op']+'_rdi' and x['atom_hex']==y['atom_hex']
                changes.append(dict(pc=x['pc'],property=bytes.fromhex(x['atom_hex']).decode(),before=x['op'],atom32=x['operand32'],after=y['op'],site_index32=y['operand32']))
        assert len(changes)==(1 if case==CASES[0] else 2)
        snapshots.append(dict(case=case,source_sha256=hashlib.sha256(bytes.fromhex(a['source_hex'])).hexdigest(),changes=changes,compressed_path='raw/diagnostic/'+report.name+'.gz',compressed_sha256=sha(HERE/'raw/diagnostic'/f'{report.name}.gz'),uncompressed_sha256=hashlib.sha256(data).hexdigest(),script_sha256=sha(js)))
    save(HERE/'prepare_snapshot_gate.json',dict(status='PASS',artifact=artifact,snapshots=snapshots,stage0='final compiler passes complete; before rdi_prepare allocation/rewrite',stage1='immediately after rdi_prepare rewrite; before any workload call',formal_timing=False))
    print('ACTUAL_PREPARE_BEFORE_AFTER_PASS',flush=True)
if __name__=='__main__':main()
