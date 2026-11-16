"""Check both isolated semantics and both opcodes inside the same function."""
import hashlib,importlib.util,json,os,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
spec=importlib.util.spec_from_file_location('combo_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py');b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
def split(c):
 totals={name:dict(attempts=0,hits=0,fallbacks=0,fills=0) for name in ['constructor','index']}
 for s in c['sites']:
  op=int(s['bytecode_hex'][:2],16);assert op in [33,67],s
  label='constructor' if op==33 else 'index'
  for k in totals[label]:totals[label][k]+=s[k]
 assert sum(t['hits'] for t in totals.values())==c['hits'];return totals
def main():
 out=HERE/'qualification';out.mkdir(exist_ok=False);b.H=out
 os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C',ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1');os.sched_setaffinity(0,{2})
 parent=b.load(ROOT/'experiments/execution_paths_20261114/attempt01/TRANSITION_EDGE_STRONG.release.manifest.json')
 manifests={m:b.load(HERE/(m+'.manifest.json')) for m in ['release','counts','san']}
 def capture(name,command):
  r=b.capture(command,'qualification',name,timeout=120);assert r['exit_code']==0 and not r['timeout'],r;return r
 outputs={};coexist={};native={}
 for label,m in [('C',parent),*manifests.items()]:
  assert b.sha(m['elf'])==m['elf_sha256'];outputs[label]={}
  for fixture in ['ctor_safety.js','index_safety.js']:
   r=capture(label+'.'+fixture,[m['elf'],HERE/fixture]);assert not r['stderr'];outputs[label][fixture]=r['stdout']
  r=capture(label+'.coexist',[m['elf'],HERE/'coexist.js']);assert not r['stderr'];coexist[label]=json.loads(r['stdout'])
  w=Path(m['elf']).parent;obj=w/('.obj/asan/ubsan' if label=='san' else '.obj');native[label]={}
  for source in ['serialization.c','ownership.c','interrupt.c']:
   target=out/(label+'.'+source+'.elf');flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if label=='san' else []
   if label=='counts' and source=='ownership.c':flags+=['-DFOUR_NATIVE_COUNT']
   command=['gcc','-O2','-g',*flags,'-I'+str(w),HERE/source,*[obj/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',target]
   capture(label+'.'+source+'.build',command);r=capture(label+'.'+source,[target]);native[label][source]=r['stdout']
   if label=='counts' and source=='ownership.c':
    assert r['stderr'].startswith('FOUR_COUNTS:');c=json.loads(r['stderr'][len('FOUR_COUNTS:'):]);assert c['hits']>0 and c['overflow']==1
   else:assert not r['stderr']
 assert len({json.dumps(o,sort_keys=True) for o in outputs.values()})==1
 assert len({json.dumps(o,sort_keys=True) for o in native.values()})==1
 assert len({o['sum'] for o in coexist.values()})==1
 ctext=(HERE/'coexist.js').read_text().replace("'use strict';","'use strict';\n__four_begin();",1)+'\n__four_end();\n'
 b.save('active_coexist.js',ctext);r=capture('counts.active_coexist',[manifests['counts']['elf'],out/'active_coexist.js'])
 assert r['stderr'].startswith('FOUR_COUNTS:');c=json.loads(r['stderr'][len('FOUR_COUNTS:'):]);s=split(c)
 assert s['constructor']['hits']>1000000 and s['index']['hits']>1000000,s
 b.save('coexist.counts.json',dict(totals=s,raw=c))
 for fixture in ['ctor_safety.js','index_safety.js']:
  text=(HERE/fixture).read_text().replace("'use strict';","'use strict';\n__four_begin();",1)+'\n__four_end();\n'
  b.save('active_'+fixture,text);r=capture('counts.active_'+fixture,[manifests['counts']['elf'],out/('active_'+fixture)])
  assert r['stdout']==outputs['C'][fixture];c=json.loads(r['stderr'][len('FOUR_COUNTS:'):]);assert c['hits']>0 and c['fallbacks']>0
  b.save(fixture+'.counts.json',c)
 gate=dict(status='PASS',both_semantics_equal_to_C=True,both_handlers_active_in_same_function=s,native_ownership_oom_interrupt_rom_pass=True,sanitizer_leak_detection=False,coexist=coexist,
           frozen_files={str(p):b.sha(p) for p in [HERE/'ctor_safety.js',HERE/'index_safety.js',HERE/'coexist.js',HERE/'serialization.c',HERE/'ownership.c',HERE/'interrupt.c',Path(__file__)]})
 b.save('gate.json',gate);print('COMBINED_QUALIFICATION_PASS',json.dumps(s),flush=True)
if __name__=='__main__':main()
