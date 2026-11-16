"""One selected candidate only: existing upstream and targeted safety tests, no timings."""
import hashlib,json,os,shutil
from pathlib import Path
import run
H=run.HERE;lab=run.lab

def main():
    d=lab.load(H/'decision.json');cid=d['candidate']
    assert d['status']=='SELECTED_PENDING_FULL_SAFETY' and cid
    assert not (H/'final_safety.json').exists()
    assert lab.boot()==d['boot_id'];os.sched_setaffinity(0,{2})
    active=H/'active';base=lab.reconstructed_sources('M');target=lab.reconstructed_sources(cid)
    assert {n:lab.sha(active/n) for n in base}=={n:hashlib.sha256(v).hexdigest() for n,v in base.items()},'unrecorded active edit'
    # Mechanical restoration of the already reviewed exact candidate, not a new design.
    for n,data in target.items():
        if (active/n).read_bytes()!=data:(active/n).write_bytes(data)
    upstream=lab.ROOT/'engines/quickjs-upstream'
    revision=lab.capture(['git','-c','safe.directory='+str(upstream),'-C',upstream,'rev-parse','HEAD'],'final_safety_source','upstream_commit')
    assert revision['exit_code']==0 and revision['stdout'].strip()=='04be246001599f5995fa2f2d8c91a0f198d3f34c'
    status=lab.capture(['git','-c','safe.directory='+str(upstream),'-C',upstream,'status','--porcelain','--','tests'],'final_safety_source','upstream_tests_status')
    assert status['exit_code']==0 and not status['stdout'],'local upstream tests modified'
    assert not (active/'tests').exists()
    shutil.copytree(upstream/'tests',active/'tests')
    upstream_hash={str(p.relative_to(active)):lab.sha(p) for p in (active/'tests').rglob('*') if p.is_file()}
    results=[]
    def checked(cmd,name,timeout=120,cwd=active,allow_stderr=False):
        r=lab.capture(cmd,'final_safety',name,timeout,dict(candidate=cid,source_sha256=lab.load(H/(cid+'.matched.json'))['source_sha256_after_build']),cwd)
        results.append(dict(name=name,token=r['token'],exit_code=r['exit_code'],stdout=r['stdout'],stderr=r['stderr']))
        if r['exit_code'] or (r['stderr'] and not allow_stderr):
            lab.save(H/'final_safety_failure.json',dict(status='BLOCKED_SAFETY',candidate=cid,failed=results[-1],completed=results,meaning='no formal performance conclusion'))
            raise AssertionError('safety failure retained: '+name)
        return r
    built=lab.capture(['make','-B','-j1','qjs','qjsc'],'final_safety_build','selected_release',340,
        dict(candidate=cid,source_sha256=lab.load(H/(cid+'.matched.json'))['source_sha256_after_build']),active)
    assert built['exit_code']==0,built['stderr']
    commands=lambda s:sorted(x.strip() for x in s.splitlines() if x.startswith('gcc '))
    assert commands(built['stdout'])==lab.load(H/(cid+'.matched.json'))['compile_link_commands']
    rebuilt=lab.sha(active/'qjs');official=run.measure.artifact(cid)
    # The frozen official artifact remains untouched even if build metadata differs.
    release_identity=dict(rebuilt_sha256=rebuilt,frozen_sha256=official['sha256'],same_bytes=rebuilt==official['sha256'],
        semantics='same32source and compiler/link commands; tests below launch frozen artifact')
    q=official['path']
    names=['test_closure.js','test_language.js','test_builtin.js','test_loop.js','test_bigint.js','test_cyclic_import.js','test_worker.js','test_std.js','test_rw_handler.js']
    for name in names:checked([q,*(['--std'] if name=='test_builtin.js' else []),active/'tests'/name],'upstream_release/'+name)
    checked([q,H/'checks.js'],'release7020')
    checked([q,H/'semantic_extra.js'],'release_semantic_extra')
    objects=[active/'.obj'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    targeted=[lab.ROOT/'experiments/read_ic_mic/attempt01/correctness'/(n+'.c') for n in ['read_roundtrip','roundtrip_slots','gc_cycles']]+[H/'first_entry_roundtrip.c']
    if cid=='s004':targeted.append(H/'delete_reentry.c')
    # ASan+UBSan use the official Makefile configuration and separate object directory.
    asan=lab.capture(['make','-B','-j1','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],'final_safety_build','selected_asan_ubsan',480,
        dict(candidate=cid,source_sha256=lab.load(H/(cid+'.matched.json'))['source_sha256_after_build']),active)
    assert asan['exit_code']==0,asan['stderr']
    sanitized=H/'artifacts'/(cid+'.final.asan_ubsan.qjs');assert not sanitized.exists();shutil.copyfile(active/'qjs',sanitized);sanitized.chmod(0o755)
    checked([sanitized,H/'checks.js'],'asan_ubsan7020')
    checked([sanitized,H/'semantic_extra.js'],'asan_ubsan_semantics')
    for name in names[:5]:checked([sanitized,*(['--std'] if name=='test_builtin.js' else []),active/'tests'/name],'upstream_asan_ubsan/'+name)
    flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'];sobj=[active/'.obj/asan/ubsan'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    assert all(p.exists() for p in sobj)
    for source in targeted:
        out=H/'artifacts'/(cid+'.final.san.'+source.stem)
        checked(['gcc','-O2','-g',*flags,'-I'+str(active),source,*sobj,'-lm','-lpthread','-ldl','-o',out],'san_build/'+source.stem,allow_stderr=True)
        checked([out],'san_run/'+source.stem)
    generated=active/'final.embedded.c';embed=H/'artifacts'/(cid+'.final.san.embedded')
    checked([active/'qjsc','-e','-o',generated,H/'checks.js'],'san_qjsc_compile')
    checked(['gcc','-O2','-g',*flags,'-I'+str(active),generated,*sobj,active/'.obj/asan/ubsan/quickjs-libc.o','-lm','-lpthread','-ldl','-o',embed],'san_embedding_build',allow_stderr=True)
    checked([embed],'san_embedding_run')
    assert lab.sha(official['path'])==official['sha256']
    assert {n:lab.sha(active/n) for n in target}==lab.load(H/(cid+'.matched.json'))['source_sha256_after_build']
    lab.save(H/'final_safety.json',dict(status='PASS_SELECTED_NARROW_SAFETY_AND_UPSTREAM',candidate=cid,
        frozen_binary_sha256=official['sha256'],release_rebuild=release_identity,sanitizer_binary_sha256=lab.sha(sanitized),
        upstream_commit=revision['stdout'].strip(),upstream_test_sha256=upstream_hash,results=results,
        full_test262=False,ASan_UBSan=True,boot_id=lab.boot(),
        limitations='targeted plus9 upstream Release/5 sanitizer entries; not all test262 or all native paths; OOM limits are scenarios not192independent semantic features'))
    print('FINAL_SAFETY_PASS',cid,flush=True)
if __name__=='__main__':main()
