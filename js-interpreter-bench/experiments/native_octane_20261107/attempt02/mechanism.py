"""Independent counter build, not used for performance measurements."""
import shutil
from pathlib import Path


def run(b,source):
    here=Path(__file__).resolve().parent
    diag=here/'work/mechanism'
    shutil.copytree(source,diag,ignore=shutil.ignore_patterns('.obj','qjs','qjsc'))
    q=(diag/'quickjs.c').read_bytes().decode()
    anchor='            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
    assert q.count(anchor)==1
    q=q.replace(anchor,'            combo_fused_hits++; '+anchor.lstrip(),1)
    (diag/'quickjs.c').write_bytes(q.encode())
    p=diag/'read_ic_opcodes.inc';op=p.read_bytes().decode()
    anchor='                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);'
    assert op.count(anchor)==1
    p.write_bytes(op.replace(anchor,'                        combo_proto_hits++; '+anchor.lstrip(),1).encode())
    objects=[source/'.obj'/(n+'.o') for n in ['dtoa','libregexp','libunicode','cutils']]
    cmd=['gcc','-O2','-g','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"','-I'+str(diag),here/'mechanism.c',*objects,'-lm','-lpthread','-ldl','-o',diag/'probe']
    build=b.capture(cmd,'mechanism_build','both_paths',180);assert build['exit_code']==0,build['stderr']
    result=b.capture([diag/'probe'],'mechanism_run','both_paths',30)
    assert result['exit_code']==0 and not result['stderr'],result
    assert 'COMBINATION_MECHANISM_PASS' in result['stdout']
    b.save('mechanism.json',dict(status='PASS',stdout=result['stdout'],token=result['token'],performance_sample=False))

