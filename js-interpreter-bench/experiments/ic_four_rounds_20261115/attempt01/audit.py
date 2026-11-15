"""Offline delivery audit. Never executes a benchmark or changes old evidence."""
import collections,gzip,hashlib,json,subprocess,tarfile,tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
ROUNDS=['01_group_load','02_call_recipe','03_constructor_plan','04_index_consume']
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for block in iter(lambda:f.read(1024*1024),b''):h.update(block)
 return h.hexdigest()
def load(p):return json.loads(p.read_text())
def main():
 parent=ROOT/'experiments/execution_paths_20261114/attempt01/candidates';pm=load(parent/'manifest.json');archive=parent/'TRANSITION_EDGE_STRONG-source.tar.gz'
 assert sha(archive)==pm['source_archive_sha256'];total=0;results={}
 with tarfile.open(archive) as t:
  data={x.name.removeprefix('quickjs-transition-edge/'):t.extractfile(x).read() for x in t.getmembers() if x.isfile()}
 for name in ROUNDS:
  h=HERE/name;result={}
  for mode in ['release','counts','san']:
   m=load(h/(mode+'.manifest.json'));w=Path(m['elf']).parent
   assert m['parent_archive_sha256']==pm['source_archive_sha256'] and sha(m['elf'])==m['elf_sha256']
   for p,digest in m['sources'].items():assert sha(w/p)==digest,(name,mode,p)
  gate=load(h/'qualification/gate.json');assert gate['status']=='PASS'
  for p,digest in gate['frozen_files'].items():assert sha(p)==digest
  active=load(h/'qualification/active_safety.json');assert active['status']=='PASS' and active['counts']['hits'] and active['counts']['fallbacks']
  for mode in ['release','counts']:
   for suite,n in [('octane',17),('sunspider',26)]:
    folder=h/'runs'/mode/suite;protocol=load(folder/'protocol.json');assert protocol['CPU']==2 and not protocol['warmup_calls'] and not protocol['C_formal_retest']
    for p,digest in protocol['frozen_files'].items():assert sha(p)==digest,p
    for info in protocol['scripts'].values():assert sha(info['path'])==info['sha256']
    for p,digest in protocol['input_files'].items():assert sha(ROOT/p)==digest
    counter=collections.Counter();tokens=set();cases=set()
    with (folder/'runs.jsonl').open() as f:
     for line in f:
      r=json.loads(line);counter[r['event']]+=1
      if r['event']=='process_start':assert r['token'] not in tokens;tokens.add(r['token'])
      if r['event']=='process_result':assert not r['timeout'] and r['exit_code']==0
      if r['event']=='sample':
       assert r['case'] not in cases and r['valid'];cases.add(r['case'])
       assert r['N']==protocol['scripts'][r['case']]['N']
       assert r['payload']['correctness']=='PASS' and not r['payload']['warmup_calls']
    assert counter=={'process_start':n,'process_result':n,'sample':n}
    if mode=='release':total+=n
  m=load(h/'release.manifest.json');measured=Path(m['elf']).parent
  with tempfile.TemporaryDirectory(prefix='qjs-four-patch-') as temp:
   temp=Path(temp)
   for p,value in data.items():target=temp/p;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(value)
   proc=subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(h/'release.patch')],cwd=temp,capture_output=True,text=True)
   assert proc.returncode==0,proc.stdout+proc.stderr
   for p,digest in m['sources'].items():assert sha(temp/p)==digest,(name,p)
   (h/'patch-application.log').write_text(proc.stdout+proc.stderr)
  with tarfile.open(h/'source.tar.gz') as t:
   for member in t.getmembers():
    relative=member.name.split('/',1)[1]
    assert hashlib.sha256(t.extractfile(member).read()).hexdigest()==m['sources'][relative]
  result.update(status='PASS',release_processes=43,final_counter_processes=43,source_archive_sha256=sha(h/'source.tar.gz'),patch_applies_exactly=True)
  results[name]=result;print('AUDIT_PASS',name,flush=True)
 # Preserve every byte locally, additionally archive large diagnostic logs in
 # lossless gzip for source-control delivery. Originals are merely ignored.
 storage={}
 for name in ROUNDS:
  for raw in sorted((HERE/name/'runs').glob('*/*/runs.jsonl')):
   if raw.parent.parent.name=='release':continue
   compressed=Path(str(raw)+'.gz')
   if not compressed.exists():
    with raw.open('rb') as src,compressed.open('wb') as dst:
     with gzip.GzipFile(fileobj=dst,filename='',mode='wb',mtime=0,compresslevel=6) as z:
      for block in iter(lambda:src.read(1024*1024),b''):z.write(block)
   digest=hashlib.sha256();size=0
   with gzip.open(compressed,'rb') as f:
    for block in iter(lambda:f.read(1024*1024),b''):digest.update(block);size+=len(block)
   assert digest.hexdigest()==sha(raw) and size==raw.stat().st_size
   storage[str(raw.relative_to(HERE))]=dict(raw_sha256=digest.hexdigest(),raw_bytes=size,gzip_sha256=sha(compressed),gzip_bytes=compressed.stat().st_size)
 assert total==172
 (HERE/'raw_storage.json').write_text(json.dumps(storage,indent=2)+'\n')
 (HERE/'audit.json').write_text(json.dumps(dict(status='PASS',formal_release_processes=total,C_formal_retests=0,all_original_validations_pass=True,rounds=results,parent_archive_sha256=pm['source_archive_sha256'],raw_gzip_roundtrip_verified=True),indent=2)+'\n')
 print('ALL_FOUR_ROUNDS_AUDIT_PASS',total,flush=True)
if __name__=='__main__':main()
