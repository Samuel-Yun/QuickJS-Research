"""Recover exact source bytes, one clean compilation per formal version, link-only pads."""
import argparse,re,shlex,shutil,tarfile
from common import *
def extract(p,d):
 with tarfile.open(p) as t:
  assert all(not x.issym() and not x.islnk() and (d/x.name).resolve().is_relative_to(d.resolve()) for x in t.getmembers());t.extractall(d)
def restore():
 assert not STORE.exists();STORE.mkdir(parents=True)
 arc=ROOT/'experiments/read_ic_hit_ablation/attempt01/recovery/baseline_M.tar.gz';meta=read(arc.parent/'baseline_M.json');assert sha(arc)==meta['sha256']
 ids=read(OLD/'sources/identities.json');extract(arc,STORE/'M_base');extract(arc,STORE/'R_base')
 r=capture('restore_R',['patch','-p1','-i',OLD/'patches/M_to_R.patch'],STORE/'R_base');assert r['exit_code']==0
 for v in 'MR':assert all(sha(STORE/(v+'_base')/p)==h for p,h in ids['files'][v].items()),v
 save(HERE/'sources/identities.json',dict(base=ids['base'],files={v:ids['files'][v] for v in 'MR'},archive_sha256=sha(arc)))
 for p in ['patches/A_to_M.patch','patches/M_to_R.patch']:
  (HERE/p).parent.mkdir(parents=True,exist_ok=True);shutil.copy2(OLD/p,HERE/p)
 for p in ['inputs/adapter.js','inputs/driver.js']+['cases/'+c+'.js' for c in CASES[:3]]:
  dst=HERE/p;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(OLD/p,dst)
 save(HERE/'origin.json',dict(HEAD=subprocess.check_output(['git','-c','safe.directory='+str(ROOT.parent),'rev-parse','HEAD'],cwd=ROOT,text=True).strip(),old_manifest_sha256=sha(OLD/'manifest.json'),design_sha256=sha(HERE/'design.md'),timestamp=stamp()))
def build():
 ids=read(HERE/'sources/identities.json');tools={}
 for t in ['gcc','as','ld','ar','make','objdump','gdb']:
  r=capture(t+'_version',[t,'--version']);assert not r['exit_code'];tools[t]=r['stdout'].splitlines()[0]
 assert '13.3.0' in tools['gcc'];snapshot('before_build')
 r=capture('perf_capability',['sh','-c','command -v perf && perf stat -e cycles:u,instructions:u,branches:u,branch-misses:u -- true'])
 save(HERE/'capabilities.json',dict(perf='AVAILABLE' if r['exit_code']==0 else 'NOT_AVAILABLE',attempt_log='raw/build/perf_capability.1.json',events=['cycles:u','instructions:u','branches:u','branch-misses:u'],privilege_changes=False,PMU=None,time_enabled=None,time_running=None,profiles=None))
 artifacts={};objects={};links={}
 for v in 'MR':
  src=STORE/(v+'_base');assert not (src/'qjs').exists()
  r=capture(v+'_clean_build',['make','-j2','qjs','qjsc'],src);assert not r['exit_code']
  assert all(sha(src/p)==h for p,h in ids['files'][v].items())
  lines=r['stdout'].splitlines();link=next(shlex.split(s) for s in lines if s.startswith('gcc ') and '-rdynamic -o qjs ' in s)
  objects[v]={a:sha(src/a) for a in link if a.endswith('.o')};links[v]=link
  original_sha=sha(src/'qjs')
  # Map/trace options have no code-generation effect; verify ELF itself unchanged.
  rr=capture(v+'_base_link_map',link+['-Wl,-Map='+str(STORE/(v+'_base.map')),'-Wl,-t'],src);assert not rr['exit_code'] and sha(src/'qjs')==original_sha
  save(HERE/'links'/(v+'_base.map'),(STORE/(v+'_base.map')).read_bytes())
  ordered=[]
  for ln in rr['stdout'].splitlines():
   p=Path(ln);p=p if p.is_absolute() else src/p
   if p.is_file():ordered.append(dict(path=ln,sha256=sha(p),bytes=p.stat().st_size))
  links[v]=dict(original_command=link,map_command=rr['command'],ordered_link_inputs=ordered)
  artifacts[v+'_base']=artifact(src/'qjs',v,0,'base')
  for pad in [0,16,32,48]:
   condition=v+'_p'+str(pad).zfill(3);dest=STORE/condition;dest.mkdir()
   assembly='.section .text\n.balign 1\n.type mr_unexecuted_padding,@object\nmr_unexecuted_padding:\n.fill '+str(pad)+',1,0x90\n.size mr_unexecuted_padding,.-mr_unexecuted_padding\n.section .note.GNU-stack,"",@progbits\n'
   ap=HERE/'padding'/f'p{pad:03}.s';save(ap,assembly);obj=dest/'pad.o'
   if not obj.exists():rr=capture(condition+'_assemble',['as',ap,'-o',obj]);assert not rr['exit_code']
   command=link.copy();command[command.index('qjs')]=str(dest/'qjs');command.insert(command.index('.obj/quickjs.o'),str(obj))
   command+=['-Wl,-Map='+str(dest/'link.map'),'-Wl,-t']
   rr=capture(condition+'_link',command,src);assert not rr['exit_code']
   save(HERE/'links'/(condition+'.map'),(dest/'link.map').read_bytes())
   text=subprocess.check_output(['objcopy','--dump-section','.text=/dev/stdout',str(obj)])
   assert text==bytes([0x90])*pad
   artifacts[condition]=artifact(dest/'qjs',v,pad,'layout');artifacts[condition].update(padding_object_sha256=sha(obj),padding_bytes_hex=text.hex(),command=command)
  assert all(sha(src/p)==h for p,h in objects[v].items())
  capture(v+'_ldd',['ldd',src/'qjs'])
 save(HERE/'links/inputs.json',dict(objects=objects,links=links,tools=tools))
 inputs={p.relative_to(ROOT).as_posix():sha(p) for p in [HERE/'design.md',HERE/'inputs/adapter.js',HERE/'inputs/driver.js',*sorted((HERE/'cases').glob('*.js')),ROOT/'benchmarks/octane/upstream/base.js',ROOT/'benchmarks/octane/upstream/richards.js']}
 save(HERE/'manifest.json',dict(cohort='wsl2-'+platform.node()+'-mr-native-layout',host=platform.node(),kernel=platform.release(),architecture=platform.machine(),tools=tools,optimization='-O2 -g -fwrapv',NDEBUG=False,LTO=False,PGO=False,formal_instrumentation=False,mode_switch=False,source_identities_sha256=sha(HERE/'sources/identities.json'),inputs=inputs,artifacts=artifacts,objects=objects,link_inputs_sha256=sha(HERE/'links/inputs.json'),ASLR=Path('/proc/sys/kernel/randomize_va_space').read_text().strip(),power=None,frequency=None,background='WSL host uncontrolled'))
 print('FORMAL_BUILDS_LINKS_COMPLETE',flush=True)
def artifact(p,v,pad,stage):return dict(path=str(p),sha256=sha(p),bytes=p.stat().st_size,variant=v,padding_request=pad,stage=stage,source_identity_sha256=digest(json.dumps(read(HERE/'sources/identities.json')['files'][v],sort_keys=True).encode()))
if __name__=='__main__':
 ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['restore','build']);a=ap.parse_args();globals()[a.stage]()
