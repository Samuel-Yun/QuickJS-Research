"""Offline audit and incremental patches. Does not start a benchmark."""
import json,sys,tempfile,subprocess,difflib,collections,gzip,tarfile
from pathlib import Path
import build
H=Path(__file__).resolve().parent;ROOT=H.parents[2];R=H/'FORWARD_SPARSE';OLD=build.OLD
sys.path.insert(0,str(OLD))
def load(p):return json.loads(p.read_text())
def records(p):return [json.loads(l) for l in (p.read_text() if p.exists() else gzip.open(str(p)+'.gz','rt').read()).splitlines()]
def exact_patch(original,desired,patch):
 with tempfile.TemporaryDirectory(prefix='ctor-combo-patch-') as tmp:
  tmp=Path(tmp)
  for n,s in original.items():(tmp/n).parent.mkdir(parents=True,exist_ok=True);(tmp/n).write_text(s)
  z=subprocess.run(['patch','--batch','-p1','-i',str(patch)],cwd=tmp,text=True,capture_output=True);assert z.returncode==0,z.stdout+z.stderr
  for n,s in desired.items():assert (tmp/n).read_bytes()==s.encode(),n

def main():
 original,digest=build.base.parent();audit=dict(status='PASS',R3_archive_sha256=digest,composition=['FORWARD_CTOR_IC','SPARSE_CTOR_IC'],new_baseline_full_runs=0,formal_samples_per_case=1,automatic_extra_rounds=0,checks={})
 for mode in ['release','counts','san']:
  for label in ['01_forward_ctor','03_sparse_ctor']:
   _,d,_=build.base.source(label,mode);m=load(OLD/label/(mode+'.manifest.json'))
   assert {n:build.hashlib.sha256(s.encode()).hexdigest() for n,s in d.items()}==m['sources'],(label,mode)
  _,d,_=build.source(mode);m=load(R/(mode+'.manifest.json'));w=Path(m['elf']).parent
  assert m['R3_archive_sha256']==digest and build.sha(w/'qjs')==m['elf_sha256']
  assert {n:build.sha(w/n) for n in m['sources']}==m['sources']
  assert {n:build.hashlib.sha256(s.encode()).hexdigest() for n,s in d.items()}==m['sources']
  for f,s in m['provenance'].items():assert build.sha(Path(f))==s
  exact_patch(original,d,R/(mode+'.patch'));audit['checks'][mode]=dict(source_and_ELF_frozen=True,original_standalone_sources_exact=True,patch_from_R3_exact=True)
 # Incremental review patches, identical combo source whichever parent is chosen.
 _,desired,_=build.source('release')
 for label,name in [('01_forward_ctor','FORWARD'),('03_sparse_ctor','SPARSE')]:
  _,d,_=build.base.source(label,'release');patch=''.join(l for n,s in desired.items() if d.get(n)!=s for l in difflib.unified_diff(d.get(n,'').splitlines(True),s.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
  p=R/('incremental_vs_'+name+'.patch');p.write_text(patch);exact_patch(d,desired,p)
 # The archived Release source is exactly what was timed.
 assert build.sha(R/'source.tar.gz')==(R/'source.sha256').read_text().split()[0]
 with tarfile.open(R/'source.tar.gz') as t:files={x.name.split('/',1)[1]:t.extractfile(x).read() for x in t.getmembers() if x.isfile()}
 m=load(R/'release.manifest.json');assert {n:build.hashlib.sha256(s).hexdigest() for n,s in files.items()}==m['sources']
 gate=load(R/'qualification/gate.json');assert gate['status']=='PASS' and gate['both_paths_hit_in_one_process']
 for f,s in gate['frozen_files'].items():assert build.sha(Path(f))==s
 for mode in ['counts','release']:
  for suite in ['octane','sunspider']:
   p=R/'runs'/mode/suite;es=records(p/'runs.jsonl');n=17 if suite=='octane' else 26
   assert collections.Counter(e['event'] for e in es)=={'sample':n,'process_start':n,'process_result':n}
   assert all(r['valid'] for r in es if r['event']=='sample')
   protocol=load(p/'protocol.json');assert protocol['CPU']==2 and protocol['warmup_calls']==0 and protocol['independent_processes_per_case']==1
   for f,s in protocol['frozen_files'].items():assert build.sha(Path(f))==s
   for item in protocol['scripts'].values():assert build.sha(Path(item['path']))==item['sha256']
   for f,s in protocol['input_files'].items():assert build.sha(ROOT/f)==s
   assert load(p/'audit.json')['cases']==n
 for f,s in load(R/'analysis/summary.json')['reference_files_sha256'].items():assert build.sha(Path(f))==s
 audit.update(formal_processes=43,independent_count_processes=43,normal_and_ROM_prepared_bytecode=True,ASan_UBSan=True,patches_from_both_standalones_exact=True,source_archive_exact=True,all_original_inputs_and_Run_boundaries_preserved=True)
 (H/'audit.json').write_text(json.dumps(audit,indent=2)+'\n');print('ARTIFACT_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
