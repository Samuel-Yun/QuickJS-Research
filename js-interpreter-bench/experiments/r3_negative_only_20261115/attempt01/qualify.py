import json,os,importlib.util,subprocess,re
from pathlib import Path
from build import H,ROOT,sha
spec=importlib.util.spec_from_file_location('neg_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py');b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
def main():
 out=H/'qualification';out.mkdir(exist_ok=True);b.H=out;os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C',ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1');os.sched_setaffinity(0,{2})
 def cap(name,cmd):
  token=name+('.'+sha(H/'internal.c')[:10] if '.internal' in name else '')
  old=[z for z in b.records() if z['event']=='process_result' and z['token']=='qualify/'+token and z['exit_code']==0 and z['command']==list(map(str,cmd))]
  z=old[-1] if old else b.capture(cmd,'qualify',token,timeout=180);assert z['exit_code']==0 and (name.endswith('.build') or not z['stderr']),z;return z

 modes=[('R3','release'),('SPARSE','release'),('LAYOUT_OFF','release'),('NEGATIVE_ONLY','release'),('NEGATIVE_ONLY','counts'),('NEGATIVE_ONLY','san')];outputs=[];layouts={}
 for label,mode in modes:
  m=json.loads((H/label/(mode+'.manifest.json')).read_text());assert sha(m['elf'])==m['elf_sha256'];z=cap(label+'.'+mode+'.safety',[m['elf'],H/'safety.js']);outputs.append(z['stdout'])
  w=Path(m['elf']).parent;o=w/('.obj/asan/ubsan' if mode=='san' else '.obj');flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='san' else []
  # Internal test compiles the exact candidate .c; direct helpers test temporary guards without changing benchmarks.
  if label!='SPARSE' and mode!='counts':
   target=out/(label+'.'+mode+'.internal.elf');cmd=['gcc','-O2','-g','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"',*(['-DTEST_NEGATIVE'] if label=='NEGATIVE_ONLY' else []),*flags,'-I'+str(w),H/'internal.c',*[o/(n+'.o') for n in ['dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',target];cap(label+'.'+mode+'.internal.build',cmd);cap(label+'.'+mode+'.internal',[target])
  if label in ['R3','NEGATIVE_ONLY']:
   target=out/(label+'.'+mode+'.serialization.elf');cap(label+'.'+mode+'.serialize.build',['gcc','-O2','-g',*flags,'-I'+str(w),H/'serialization.c',*[o/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',target]);cap(label+'.'+mode+'.serialize',[target])
  if mode=='release':
   exprs=['sizeof(JSObject)','sizeof(JSRuntime)','sizeof(JSFunctionBytecode)','sizeof(FourSite)']
   if label!='SPARSE':exprs+=['(long)&((FourSite*)0)->callee','(long)&((FourSite*)0)->initial','(long)&((FourSite*)0)->final','(long)&((FourSite*)0)->recipe','(long)&((FourSite*)0)->pc','(long)&((FourSite*)0)->argc']
   if label in ['NEGATIVE_ONLY','LAYOUT_OFF']:exprs+=['(long)&((FourSite*)0)->negative_index','sizeof(R3NegativeEntry)']
   cmd=['gdb','-batch'];[cmd.extend(['-ex','p '+e]) for e in exprs];z=subprocess.run([*cmd,m['elf']],text=True,capture_output=True,check=True);vals=re.findall(r'\$\d+ = (\d+)',z.stdout);assert len(vals)==len(exprs);layouts[label]=dict(zip(exprs,map(int,vals)))
 assert len(set(outputs))==1
 for label in ['NEGATIVE_ONLY','LAYOUT_OFF']:
  assert layouts[label]['sizeof(FourSite)']==layouts['R3']['sizeof(FourSite)']==96
  for e,v in layouts['R3'].items():
   if e!='sizeof(JSRuntime)':assert layouts[label][e]==v,(label,e)
 assert layouts['NEGATIVE_ONLY']==layouts['LAYOUT_OFF']
 b.save('layout.json',layouts);b.save('gate.json',dict(status='PASS',differential=True,positive_plan_survives_negative=True,temporary_guard_recovery=True,GC_cycles=True,prepared_normal_ROM=True,ASan_UBSan=True,positive_record_size=96,positive_field_offsets_identical=True,new_index_offset=layouts['NEGATIVE_ONLY']['(long)&((FourSite*)0)->negative_index'],frozen_files={str(p):sha(p) for p in [H/'safety.js',H/'internal.c',H/'serialization.c',Path(__file__)]}));print('QUALIFY_PASS',flush=True)
if __name__=='__main__':main()
