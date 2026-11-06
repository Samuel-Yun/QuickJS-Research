"""Small separate layout/path probes. Never run alongside performance sampling."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import re
import sys
import run
import recover

H = run.H


def restore_active(files):
    active = H/'active'
    prior = run.lab.load(H/'active_inventory.json')
    assert all(run.lab.sha(active/n)==sha for n,sha in prior.items()), 'unrecorded edit'
    for name,text in files.items():
        if (active/name).read_bytes() != text.encode():
            (active/name).write_bytes(text.encode())
    run.write_json('active_inventory.json',{n:run.lab.sha(active/n) for n in files})


def probe(cid):
    run.gate()
    base = recover.restore(cid)
    files = dict(base)
    if cid in ['d03','d04']:
        anchor='            pc += 5;                                                    \\\n'
        files['quickjs.c'] = run.designs.once(files['quickjs.c'], anchor,
                                            anchor.replace('pc += 5;', '++fused_hits; pc += 5;'))
    if cid in ['c01','c02']:
        s='val = JS_DupValue(ctx, holder->prop[side->offset].u.value);'
        files['read_ic_opcodes.inc'] = run.designs.once(files['read_ic_opcodes.inc'],s,'++proto_hits; '+s)
    restore_active(files)
    active=H/'active'
    target=H/'artifacts'/('probe.'+cid)
    assert not target.exists()
    flags=['-O2','-g','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"']
    if cid.startswith('c'):
        flags+=['-DPROBE_PROTO']
    if cid=='d04':
        flags+=['-DPROBE_PREPARED']
    if cid in ['e01','e02']:
        flags+=['-DPROBE_RESULT=OP_rdi_integer' if cid=='e01' else '-DPROBE_RESULT=OP_rdi_immediate']
    if cid=='f01':
        flags+=['-DPROBE_FRAME']
    objects=[active/'.obj'/(n+'.o') for n in ['dtoa','libregexp','libunicode','cutils']]
    command=['gcc',*flags,'-I',str(active),str(H/'mechanism_probe.c'),*map(str,objects),'-lm','-ldl','-lpthread','-o',str(target)]
    identity=dict(parent=cid,parent_source_sha256=run.lab.load(H/'identities'/(cid+'.json'))['source_sha256'],
        diagnostic_source_sha256=run.lab.load(H/'active_inventory.json'),probe_sha256=run.lab.sha(H/'mechanism_probe.c'),
        object_sha256={str(p):run.lab.sha(p) for p in objects},performance_sample=False)
    build=run.capture(command,'narrow_diagnostic_build',cid,300,identity)
    assert build['exit_code']==0,build['stderr']
    result=run.capture([target],'narrow_diagnostic',cid,30,dict(identity,binary_sha256=run.lab.sha(target)))
    run.lab.save(H/('probe.'+cid+'.json'),dict(command=command,identity=identity,binary_sha256=run.lab.sha(target),
         exit_code=result['exit_code'],stdout=result['stdout'],stderr=result['stderr'],process_token=result['token']))
    assert result['exit_code']==0 and 'MECHANISM_PASS' in result['stdout'] and not result['stderr']
    print(cid,result['stdout'],flush=True)
    restore_active(base)


def fusion_counts(cid):
    """Whole-process branch entries on unchanged workload, separate diagnostic ELF."""
    base=recover.restore(cid)
    files=dict(base)
    q=files['quickjs.c']
    # Definitions precede the interpreter and every normal native return path.
    marker='static JSValue JS_CallInternal(JSContext *caller_ctx, JSValueConst func_obj,'
    assert q.count(marker)==1
    prefix='''static unsigned long long diagnostic_fusions;
static void __attribute__((destructor)) report_diagnostic_fusions(void)
{
    fprintf(stderr, "FUSION_COUNTS:%llu\\n", diagnostic_fusions);
}
'''
    q=run.designs.once(q,marker,prefix+marker)
    anchor='            pc += 5;                                                    \\\n'
    q=run.designs.once(q,anchor,anchor.replace('pc += 5;','++diagnostic_fusions; pc += 5;'))
    files['quickjs.c']=q
    restore_active(files)
    active=H/'active'
    obj=H/'artifacts'/('count.'+cid+'.o')
    target=H/'artifacts'/('count.'+cid+'.qjs')
    assert not obj.exists() and not target.exists()
    flags=['-O2','-g','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"']
    build=run.capture(['gcc',*flags,'-c',str(active/'quickjs.c'),'-o',str(obj)],
                      'narrow_count_build',cid,300,dict(parent=cid,diagnostic_source_sha256=run.lab.load(H/'active_inventory.json')))
    assert build['exit_code']==0,build['stderr']
    others=[active/'.obj'/(n+'.o') for n in ['qjs','repl','quickjs-libc','dtoa','libregexp','libunicode','cutils']]
    linked=run.capture(['gcc','-g',str(obj),*map(str,others),'-lm','-lpthread','-ldl','-o',str(target)],
                       'narrow_count_link',cid,60,dict(objects_sha256={str(p):run.lab.sha(p) for p in others}))
    assert linked['exit_code']==0,linked['stderr']
    info=run.measure.inputs('octane')
    source=run.measure.script(info,'Richards.Richards',info['N']['Richards.Richards'],'independent')
    values=[]
    for label,path in [('unchanged_Richards',source),('numeric_control',H/'numeric_control.js')]:
        r=run.capture([target,path],'narrow_fusion_count',cid+'/'+label,120,
             dict(binary_sha256=run.lab.sha(target),script_sha256=run.lab.sha(path),scope='whole process',performance_sample=False))
        match=re.fullmatch(r'FUSION_COUNTS:(\d+)\n',r['stderr'])
        assert r['exit_code']==0 and match,(r['stdout'],r['stderr'])
        if label=='unchanged_Richards':
            payload=json.loads(next(x[len('OCTANE_IC_RESULT:'):] for x in r['stdout'].splitlines() if x.startswith('OCTANE_IC_RESULT:')))
            assert payload['correctness']=='PASS'
        else:
            assert r['stdout']=='NUMERIC_CONTROL_PASS\n' and int(match[1])==0
        values.append(dict(label=label,successful_fusions=int(match[1]),process_token=r['token'],script_sha256=run.lab.sha(path)))
    run.lab.save(H/('fusion_count.'+cid+'.json'),dict(parent=cid,binary_sha256=run.lab.sha(target),values=values,
         scope='Whole process, includes script/setup/driver; counter time never used for performance'))
    restore_active(base)


if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('ids',nargs='+')
    args=p.parse_args()
    for cid in args.ids:
        probe(cid)
    for cid in args.ids:
        if cid in ['d03','d04']:
            fusion_counts(cid)
    run.write_json('active_status.json',dict(source_only_restored=True,
        source_candidate=args.ids[-1],active_qjs_not_rebuilt=True,frozen_performance_artifacts_unchanged=True))
    if all((H/('probe.'+cid+'.json')).exists() for cid in ['d03','d04']):
        subprocess.run([sys.executable,str(H/'native_entry.py')],cwd=H,check=True)
