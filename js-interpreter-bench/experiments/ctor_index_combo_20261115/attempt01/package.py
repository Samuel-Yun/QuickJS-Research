"""Audit the one pass, and produce patches/source exactly matching measured ELF."""
import collections,difflib,gzip,hashlib,io,json,subprocess,tarfile,tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def load(p):return json.loads(p.read_text())
def unpack(a,prefix):
 with tarfile.open(a) as t:return {m.name.removeprefix(prefix):t.extractfile(m).read() for m in t.getmembers() if m.isfile()}
def main():
 m=load(HERE/'release.manifest.json');w=Path(m['elf']).parent;assert sha(m['elf'])==m['elf_sha256']
 data={n:(w/n).read_bytes() for n in m['sources']}
 for n,v in data.items():assert hashlib.sha256(v).hexdigest()==m['sources'][n]
 parent=ROOT/'experiments/execution_paths_20261114/attempt01/candidates/TRANSITION_EDGE_STRONG-source.tar.gz';assert sha(parent)==m['parent_archive_sha256']
 c=unpack(parent,'quickjs-transition-edge/')
 first=m['frozen_candidates']['03_constructor_plan'];assert sha(first['archive'])==first['sha256'];r3=unpack(Path(first['archive']),'quickjs-03_constructor_plan/')
 second=m['frozen_candidates']['04_index_consume'];assert sha(second['archive'])==second['sha256']
 assert data['four_runtime.inc']==r3['four_runtime.inc'] and data['four_prepare.inc']==r3['four_prepare.inc']
 delta=''.join(line for n,v in data.items() if r3.get(n)!=v for line in difflib.unified_diff(r3.get(n,b'').decode().splitlines(True),v.decode().splitlines(True),fromfile='a/'+n,tofile='b/'+n))
 (HERE/'R3_to_combo.patch').write_text(delta)
 for original,patch in [(c,HERE/'release.patch'),(r3,HERE/'R3_to_combo.patch')]:
  with tempfile.TemporaryDirectory(prefix='qjs-combo-patch-') as tmp:
   tmp=Path(tmp)
   for n,v in original.items():p=tmp/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(v)
   result=subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(patch)],cwd=tmp,capture_output=True,text=True);assert not result.returncode,result.stdout+result.stderr
   for n,v in data.items():assert (tmp/n).read_bytes()==v,n
 raw=io.BytesIO()
 with tarfile.open(fileobj=raw,mode='w',format=tarfile.USTAR_FORMAT) as t:
  for n,v in sorted(data.items()):info=tarfile.TarInfo('quickjs-ctor-index-combo/'+n);info.size=len(v);info.mode=0o644;info.mtime=0;t.addfile(info,io.BytesIO(v))
 with (HERE/'source.tar.gz').open('wb') as f:
  with gzip.GzipFile(fileobj=f,filename='',mode='wb',mtime=0) as z:z.write(raw.getvalue())
 (HERE/'source.sha256').write_text(sha(HERE/'source.tar.gz')+'  source.tar.gz\n')
 total=0
 for mode in ['release','counts']:
  bm=load(HERE/(mode+'.manifest.json'));assert sha(bm['elf'])==bm['elf_sha256']
  for n,digest in bm['sources'].items():assert sha(Path(bm['elf']).parent/n)==digest,n
  for suite,n in [('octane',17),('sunspider',26)]:
   folder=HERE/'runs'/mode/suite;p=load(folder/'protocol.json');assert p['CPU']==2 and p['warmup_calls']==0 and not p['C_formal_retest']
   for f,digest in p['frozen_files'].items():assert sha(f)==digest,f
   for s in p['scripts'].values():assert sha(s['path'])==s['sha256']
   for f,digest in p['input_files'].items():assert sha(ROOT/f)==digest
   events=[json.loads(l) for l in (folder/'runs.jsonl').read_text().splitlines()]
   assert collections.Counter(r['event'] for r in events)=={'process_start':n,'process_result':n,'sample':n}
   assert len({r['token'] for r in events if r['event']=='process_start'})==n
   assert all(r['valid'] for r in events if r['event']=='sample')
   if mode=='release':total+=n
 gate=load(HERE/'qualification/gate.json');assert gate['status']=='PASS'
 for f,digest in gate['frozen_files'].items():assert sha(f)==digest
 assert total==43
 refs={}
 for name in ['03_constructor_plan','04_index_consume']:
  base=ROOT/'experiments/ic_four_rounds_20261115/attempt01'/name
  for suite in ['octane','sunspider']:p=base/'analysis'/(suite+'.csv');refs[str(p)]=sha(p)
 (HERE/'references.json').write_text(json.dumps(refs,indent=2)+'\n')
 result=dict(status='PASS',formal_release_processes=total,independent_counter_processes=43,formal_control_retests=0,both_patches_exactly_verified=True,constructor_helpers_unchanged=True,source_archive_sha256=sha(HERE/'source.tar.gz'),measured_elf_sha256=m['elf_sha256'])
 (HERE/'audit.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
