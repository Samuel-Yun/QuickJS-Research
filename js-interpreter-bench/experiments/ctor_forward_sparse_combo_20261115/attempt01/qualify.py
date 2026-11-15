"""Targeted differential, both paths, prepared save/load, and ownership."""
import json,importlib.util,os
from pathlib import Path
H=Path(__file__).resolve().parent;ROOT=H.parents[2];OLD=ROOT/'experiments/ctor_ic_followups_20261115/attempt01';R=H/'FORWARD_SPARSE'
spec=importlib.util.spec_from_file_location('combo_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py');b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
def main():
 out=R/'qualification';out.mkdir(exist_ok=False);b.H=out
 os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C',ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1');os.sched_setaffinity(0,{2})
 controls=[('R3',ROOT/'experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan/release.manifest.json'),('FORWARD',OLD/'01_forward_ctor/release.manifest.json'),('SPARSE',OLD/'03_sparse_ctor/release.manifest.json')]
 modes=[(n,b.load(p)) for n,p in controls]+[(n,b.load(R/(n+'.manifest.json'))) for n in ['release','counts','san']]
 def capture(name,cmd):
  z=b.capture(cmd,'qualify',name,timeout=120);assert z['exit_code']==0 and not z['timeout'],z;return z
 fixture_outputs={}
 for name,m in modes:
  assert b.sha(m['elf'])==m['elf_sha256']
  for fixture in ['forward','sparse','interaction']:
   z=capture(name+'.'+fixture,[m['elf'],R/(fixture+'.safety.js')]);assert not z['stderr'];fixture_outputs.setdefault(fixture,{})[name]=z['stdout']
 for fixture,values in fixture_outputs.items():assert len(set(values.values()))==1,(fixture,values)
 # Actual coexistence, in one process, not just two separate microbenchmarks.
 s=(R/'interaction.micro.js').read_text().replace('var t=performance.now();','__four_begin();var t=performance.now();').replace('print(JSON.stringify','__four_end();print(JSON.stringify');(out/'count_micro.js').write_text(s)
 z=capture('interaction.counts',[dict(modes)['counts']['elf'],out/'count_micro.js']);assert z['stderr'].startswith('FOUR_COUNTS:');c=json.loads(z['stderr'].removeprefix('FOUR_COUNTS:'));b.save('interaction.counts.json',c)
 assert c['follow'][14]>0 and c['hits']>c['follow'][14],c
 # Keep original C ownership checks, and exercise both prepared opcodes through writer/reader.
 for name,m in [(n,m) for n,m in modes if n in ['R3','release','counts','san']]:
  w=Path(m['elf']).parent;obj=w/('.obj/asan/ubsan' if name=='san' else '.obj');flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if name=='san' else []
  for fixture,path in [('serialization',R/'serialization.c'),('ownership',H/'ownership_realms.c')]:
   target=out/(name+'.'+fixture+'.elf');cmd=['gcc','-O2','-g',*flags,'-I'+str(w),path,*[obj/(s+'.o') for s in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',target]
   capture(name+'.'+fixture+'.build',cmd);z=capture(name+'.'+fixture,[target]);assert not z['stderr']
 micros={}
 for fixture in ['forward','sparse','interaction']:
  values={}
  for name,m in modes[:4]:
   z=capture('micro.'+fixture+'.'+name,[m['elf'],R/(fixture+'.micro.js')]);assert not z['stderr'];values[name]=json.loads(z['stdout'])
  assert len({x['sum'] for x in values.values()})==1;micros[fixture]=values
 frozen=[Path(__file__),H/'ownership_realms.c',R/'serialization.c',*[R/(n+'.'+suffix+'.js') for n in ['forward','sparse','interaction'] for suffix in ['safety','micro']]]
 b.save('gate.json',dict(status='PASS',differential_builds=[n for n,m in modes],both_paths_hit_in_one_process=True,forward_hits=c['follow'][14],constructor_plan_hits=c['hits']-c['follow'][14],negative_cache_hits=c['follow'][2],prepared_normal_ROM=True,ASan_UBSan_GC_two_realms=True,micro=micros,frozen_files={str(p):b.sha(p) for p in frozen}))
 print('QUALIFICATION_PASS',flush=True)
if __name__=='__main__':main()
