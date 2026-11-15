"""Small semantic differential plus prepared-bytecode and ownership checks."""
import argparse,hashlib,importlib.util,json,os,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
spec=importlib.util.spec_from_file_location('four_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
def main():
 p=argparse.ArgumentParser();p.add_argument('round');a=p.parse_args();rdir=HERE/a.round
 out=rdir/'qualification';out.mkdir(exist_ok=False);b.H=out
 os.environ.update(ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1',TZ='Asia/Shanghai',LC_ALL='C',LANG='C');os.sched_setaffinity(0,{2})
 parent=b.load(ROOT/'experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan/release.manifest.json')
 modes=[('R3',parent),*((m,b.load(rdir/(m+'.manifest.json'))) for m in ['release','counts','san'])]
 def capture(label,cmd):
  z=b.capture(cmd,'qualify',label,timeout=120);assert z['exit_code']==0 and not z['timeout'],z;return z
 outputs={}
 for mode,m in modes:
  assert b.sha(m['elf'])==m['elf_sha256']
  z=capture(mode+'.safety',[m['elf'],rdir/'safety.js']);assert not z['stderr'];outputs[mode]=z['stdout']
  if (rdir/'serialization.c').exists():
   w=Path(m['elf']).parent;obj=w/('.obj/asan/ubsan' if mode=='san' else '.obj');target=out/(mode+'.serialization.elf')
   flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='san' else []
   capture(mode+'.serialize.build',['gcc','-O2','-g',*flags,'-I'+str(w),rdir/'serialization.c',*[obj/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',target])
   z=capture(mode+'.serialize',[target]);assert not z['stderr']
 assert len(set(outputs.values()))==1,outputs
 # Diagnostic process proves actual hits, independently of Release timing.
 s=(rdir/'micro.js').read_text().replace('var t=performance.now();','__four_begin();var t=performance.now();').replace('print(JSON.stringify','__four_end();print(JSON.stringify')
 (out/'count_micro.js').write_text(s)
 m=dict(modes)['counts'];z=capture('micro.counts',[m['elf'],out/'count_micro.js'])
 assert z['stderr'].startswith('FOUR_COUNTS:');counts=json.loads(z['stderr'][len('FOUR_COUNTS:'):]);assert counts['hits']>0,counts
 b.save('micro.counts.json',counts)
 micros={}
 for mode,m in modes[:2]:
  z=capture('micro.'+mode,[m['elf'],rdir/'micro.js']);assert not z['stderr'];micros[mode]=json.loads(z['stdout'])
 assert micros['R3']['sum']==micros['release']['sum']
 b.save('gate.json',dict(status='PASS',differential_builds=list(outputs),outputs_equal=True,counts_micro_hits=counts['hits'],micro=micros,micro_vs_R3_pct=100*(micros['release']['elapsed_ms']/micros['R3']['elapsed_ms']-1),frozen_files={str(p):b.sha(p) for p in [rdir/'safety.js',rdir/'micro.js',Path(__file__)]}))
 print('QUALIFICATION_PASS',a.round,flush=True)
if __name__=='__main__':main()
