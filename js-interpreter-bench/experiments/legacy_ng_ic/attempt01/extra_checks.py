"""Extra correctness only: timers, warmed bytecode roundtrip and OOM."""
from build import A,B,STORE,capture
from prepare_sources import HERE,ROOT,save
import json
import shutil

rows=[]
for name,src in [('A',A),('B',B)]:
    r=capture(name+'_timer',[src/'qjs',HERE/'correctness/timer.js'])
    payload=json.loads(r['stdout']);assert r['exit_code']==0 and payload['positive_steps']>0 and payload['busy_interval_ms']>=150
    assert payload['busy_interval_ms']<r['wall_ns']/1e6+5
    rows.append(dict(variant=name,**payload,outer_wall_ms=r['wall_ns']/1e6))
    for flavor,dest in [('release',src),('sanitizer',STORE/(name+'_sanitizer'))]:
        objs=['quickjs','dtoa','libregexp','libunicode','cutils']
        objdir=dest/('.obj/asan/ubsan' if flavor=='sanitizer' else '.obj')
        out=dest/'roundtrip'
        cmd=['gcc','-g','-O2','-I'+str(dest),str(HERE/'correctness/roundtrip.c')]
        if flavor=='sanitizer':cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
        cmd += [str(objdir/(o+'.o')) for o in objs]+['-lm','-lpthread','-ldl','-o',str(out)]
        r=capture(name+'_'+flavor+'_roundtrip_build',cmd);assert r['exit_code']==0
        r=capture(name+'_'+flavor+'_roundtrip',[out]);assert r['exit_code']==0 and 'PASS' in r['stdout'] and not r['stderr']
    # qjsc executable/C embedding path (normal source -> serialized -> embedded).
    r=capture(name+'_embedding_library',['make','-j2','libquickjs.a'],src)
    assert r['exit_code']==0
    out=src/'regression_embedded'
    r=capture(name+'_qjsc_executable',[src/'qjsc','-o',out,HERE/'correctness/regression.js'],src)
    assert r['exit_code']==0
    r=capture(name+'_embedded_execution',[out]);assert r['exit_code']==0 and 'IC_REGRESSION_PASS' in r['stdout']
save(HERE/'correctness/timer.json',rows)
save(HERE/'correctness/extra.json',dict(status='PASS',warmed_serialization=True,load_execute=True,
    qjsc_executable=True,allocation_failure=True,allocation_method='192 heap limits, 128-byte increments, existing compile API',
    sanitized_roundtrip=True,full_test262=False))
print('EXTRA_CHECKS_PASS',flush=True)
