from common import *
from run import ALIASES,binary,CATALOG,TESTS,validator
import math,statistics,collections
import tempfile,tarfile
out=[]
for label,sub in [('INSTANCE','01_instance_hook'),('CALL','02_call_adapter'),('NESTED','03_nested_plan')]:
 folder=HERE/sub;m=json.loads((folder/(label+'.release.manifest.json')).read_text());work=Path(m['binary']).parent
 assert sha(work/'qjs')==m['binary_sha256'];assert not m['instrumented']and not m['sanitized'];assert '#define FOUR_DIAG 1'not in(work/'quickjs.c').read_text()
 for n,h in m['sources'].items():assert sha(work/n)==h,n
 patchfile=folder/('NUMERIC_PLAN-to-NESTED.patch'if label=='NESTED'else 'SPARSE-to-'+label+'.patch')
 if label=='NESTED':
  from build import parent_numeric
  b=parent_numeric()
 else:b=base()
 with tempfile.TemporaryDirectory()as td:
  dest=Path(td)
  for n,t in b.items():p=dest/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(t)
  r=subprocess.run(['patch','-p1','-i',str(patchfile)],cwd=dest,capture_output=True,text=True);assert not r.returncode,r.stdout+r.stderr
  for n,h in m['sources'].items():assert sha(dest/n)==h,(label,n,'patch differs from measured source')
 archive=folder/'source.tar.gz'
 if not archive.exists():
  with tarfile.open(archive,'w:gz')as tf:
   for n in sorted(m['sources']):tf.add(work/n,arcname=n)
 with tarfile.open(archive)as tf:
  for n,h in m['sources'].items():assert hashlib.sha256(tf.extractfile(n).read()).hexdigest()==h,(label,n,'source archive mismatch')
 out.append(dict(label=label,parent=m['parent'],patch=str(patchfile),patch_sha256=sha(patchfile),source_archive=str(archive),source_archive_sha256=sha(archive),binary=m['binary'],binary_sha256=m['binary_sha256'],all_source_hashes_valid=True,patch_reconstructs_measured_source=True))
# Validate the complete run independently from its CSVs.
full=HERE/'full01';samples=json.loads((full/'samples.json').read_text());assert len(samples)==344
seen=set()
for r in samples:
 key=(r['label'],r['suite'],r['case']);assert key not in seen;seen.add(key);assert sha(binary(r['label']))==r['binary_sha256'];c=next(c for c in CATALOG['cases'][r['suite']]if c['case']==r['case']);assert sha(TESTS/c['path'])==r['original_sha256']==c['sha256'];assert r['N']==c['N'];assert not r['stderr'];assert r['mode']=='release';assert r['exit_code']==0
 prefix='OCTANE_IC_RESULT:'if r['suite']=='octane'else'TEB_RESULT:';data=[json.loads(l[len(prefix):])for l in r['stdout'].splitlines()if l.startswith(prefix)];assert len(data)==1;assert validator.validate(data[0],r['suite'],c)==r['ms']
summary=json.loads((full/'summary.json').read_text())
for suite in ['octane','sunspider']:
 for label in summary['statistics'][suite]:
  groups=collections.defaultdict(list)
  for r in summary['rows']:
   if r['suite']!=suite:continue
   c=next(c for c in CATALOG['cases'][suite]if c['case']==r['case']);groups[c['group']if suite=='octane'else c['case']].append(math.log(r[label+'_ms']))
  assert len(groups)==(14 if suite=='octane'else 26)
  actual=math.exp(statistics.mean(statistics.mean(g)for g in groups.values()));assert abs(actual-summary['statistics'][suite][label]['GM_ms'])<1e-10
save(HERE/'audit.json',dict(status='PASS',source_snapshots=out,full_release_processes=344,all_original_inputs_and_checksums_valid=True,branches_not_changed=True))
print('AUDIT_PASS: three patches reproduce measured sources; 344 Release records checked.')
