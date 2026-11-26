import json,collections,subprocess,tempfile,gzip,tarfile
from pathlib import Path
from build import H,ROOT,parent,source,sha

def main():
 original,digest=parent();checks={}
 for label in ['R3','NEGATIVE_ONLY','SPARSE','LAYOUT_OFF']:
  for mode in ['release','counts']+(['san'] if label=='NEGATIVE_ONLY' else []):
   _,d,_=source(label,mode);m=json.loads((H/label/(mode+'.manifest.json')).read_text());w=Path(m['elf']).parent;assert sha(w/'qjs')==m['elf_sha256']
   for n,s in m['sources'].items():assert sha(w/n)==s
   assert {n:__import__('hashlib').sha256(s.encode()).hexdigest() for n,s in d.items()}==m['sources']
   if label=='R3' and mode=='release':assert d==original
   if label=='NEGATIVE_ONLY' and mode=='release':
    with tempfile.TemporaryDirectory(prefix='negative-patch-') as z:
     z=Path(z)
     for n,s in original.items():(z/n).parent.mkdir(parents=True,exist_ok=True);(z/n).write_text(s)
     p=subprocess.run(['patch','--batch','-p1','-i',str(H/label/'release.patch')],cwd=z,text=True,capture_output=True);assert p.returncode==0,p.stdout+p.stderr
     for n,s in d.items():assert (z/n).read_bytes()==s.encode()
   checks[label+'.'+mode]=True
 gate=json.loads((H/'qualification/gate.json').read_text());assert gate['status']=='PASS'
 growth=json.loads((H/'qualification/growth_gate.json').read_text());assert growth['status']=='PASS'
 for f,s in growth['frozen'].items():assert sha(f)==s
 assert all(x['executable_text_exact'] for x in json.loads((H/'qualification/reference_equivalence.json').read_text()).values())
 for f,s in gate['frozen_files'].items():assert sha(f)==s
 for phase,mode,total in [('target','release',60),('target','counts',60),('full','release',86)]:
  p=H/'runs'/phase/mode;f=p/'runs.jsonl';text=f.read_text() if f.exists() else gzip.open(str(f)+'.gz','rt').read();es=[json.loads(l) for l in text.splitlines()];assert collections.Counter(e['event'] for e in es)=={'sample':total,'process_start':total,'process_result':total};assert all(r['valid'] for r in es if r['event']=='sample')
  proto=json.loads((p/'protocol.json').read_text());assert proto['CPU']==2 and proto['warmup_calls']==0
  for f,s in proto['frozen_files'].items():assert sha(f)==s
  for s in proto['scripts'].values():assert sha(s['path'])==s['sha256']
  for f,s in proto['input_files'].items():assert sha(ROOT/f)==s
  if phase=='full':assert {e['label'] for e in es if e['event']=='sample'}=={'R3','NEGATIVE_ONLY'}
 assert sha(H/'NEGATIVE_ONLY/source.tar.gz')==(H/'NEGATIVE_ONLY/source.sha256').read_text().split()[0]
 with tarfile.open(H/'NEGATIVE_ONLY/source.tar.gz') as t:
  m=json.loads((H/'NEGATIVE_ONLY/release.manifest.json').read_text());d={x.name.split('/',1)[1]:__import__('hashlib').sha256(t.extractfile(x).read()).hexdigest() for x in t.getmembers() if x.isfile()};assert d==m['sources']
 (H/'audit.json').write_text(json.dumps(dict(status='PASS',R3_parent_sha256=digest,checks=checks,source_patch_exact=True,full_processes=86,target_release_processes=60,target_count_processes=60,new_A_C_V8=0,positive_layout_preserved=True,positive_fast_path_exact=True),indent=2));print('AUDIT_PASS',flush=True)
if __name__=='__main__':main()
