"""After formal only: live identities, original inputs, archives and portable support."""
import argparse,shutil
import run
from common import *
def main():
 assert read(HERE/'analysis/audit.json')['status']=='PASS';m=run.verify();ids=read(HERE/'sources/identities.json');checks=[]
 for v in 'MR':
  src=STORE/(v+'_base');assert all(sha(src/p)==h for p,h in ids['files'][v].items())
  for p,h in m['objects'][v].items():assert sha(src/p)==h
  for a in m['artifacts'].values():
   if a['variant']==v and a['stage']=='layout':assert sha(Path(a['path']).parent/'pad.o')==a['padding_object_sha256']
  for item in read(HERE/'links/inputs.json')['links'][v]['ordered_link_inputs']:
   p=Path(item['path']);p=p if p.is_absolute() else src/p;assert sha(p)==item['sha256']
  checks.append(dict(variant=v,source_files=len(ids['files'][v]),source_objects_libraries_and_padding_unchanged=True))
 save(HERE/'analysis/post_identity.json',dict(status='PASS',checks=checks,artifacts=m['artifacts'],timestamp=stamp()))
 save(HERE/'artifact_identity_index.json',{c:dict(manifest_sha256=sha(HERE/'manifest.final.json'),binary_sha256=a['sha256'],source_identity_sha256=a['source_identity_sha256'],padding_object_sha256=a.get('padding_object_sha256'),original_inputs_sha256=m['link_inputs_sha256']) for c,a in m['artifacts'].items()})
 archives=[]
 for p in sorted(HERE.rglob('*.gz')):
  if 'generated' in p.parts:continue
  h=hashlib.sha256();n=0
  with gzip.open(p,'rb') as z:
   for b in iter(lambda:z.read(1048576),b''):h.update(b);n+=len(b)
  archives.append(dict(archive=p.relative_to(HERE).as_posix(),compressed_sha256=sha(p),original_sha256=h.hexdigest(),original_bytes=n,compressed_bytes=p.stat().st_size))
 save(HERE/'delivery_archives.json',archives)
 envr=read(HERE/'raw/environment/before_build.json');save(HERE/'environment.txt',envr['stdout']+'\nCompiler/tools: '+json.dumps(m['tools'],ensure_ascii=False)+'\nflags: -O2 -g -fwrapv; asserts on; no LTO/PGO; PIE/ASLR retained.\nPower/frequency/Windows-host background: UNKNOWN/uncontrolled.\nMeasured affinity: '+json.dumps(envr['affinity'])+'\nFrozen relevant subprocess environment: environment.json (whitelist; no unrelated session secrets).\n')
 save(HERE/'sources/LICENSE',(STORE/'M_base/LICENSE').read_bytes())
 print('POST_IDENTITIES_AND_ARCHIVES_PASS',len(archives))
if __name__=='__main__':main()
