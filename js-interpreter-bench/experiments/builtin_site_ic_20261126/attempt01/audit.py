from measure import *
import tempfile,tarfile,hashlib
reports=[]
for label in ['SPARSE','BODY','SITE']:
 stamp=HERE/'candidate'/f'{label}.release.manifest.json';m=json.loads(stamp.read_text());work=Path(m['binary']).parent;assert sha(work/'qjs')==m['binary_sha256'];assert not m['instrumented']and not m['sanitized'];assert '#define BIC_DIAG 1'not in(work/'quickjs.c').read_text()
 for n,h in m['sources'].items():assert sha(work/n)==h,(label,n)
 patchfile=HERE/'candidate'/f'SPARSE-to-{label}.patch'
 with tempfile.TemporaryDirectory()as td:
  d=Path(td)
  for n,t in base().items():p=d/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(t)
  if patchfile.read_text():
   r=subprocess.run(['patch','-p1','-i',str(patchfile)],cwd=d,capture_output=True,text=True);assert not r.returncode,r.stdout+r.stderr
  for n,h in m['sources'].items():assert sha(d/n)==h,(label,n,'patch not measured source')
 archive=HERE/'candidate'/f'{label}-source.tar.gz'
 if not archive.exists():
  with tarfile.open(archive,'w:gz')as tf:
   for n in sorted(m['sources']):tf.add(work/n,arcname=n)
 with tarfile.open(archive)as tf:
  for n,h in m['sources'].items():assert hashlib.sha256(tf.extractfile(n).read()).hexdigest()==h
 reports.append(dict(label=label,source_archive=str(archive),source_archive_sha256=sha(archive),patch=str(patchfile),patch_sha256=sha(patchfile),binary=m['binary'],binary_sha256=m['binary_sha256'],patch_reconstructs_actual_source=True))
assert binary('SHAM')==binary('SITE')
# Every formal full-suite sample is checked again from its original stdout.
full=HERE/'full01';samples=json.loads((full/'samples.json').read_text());assert len(samples)==172;seen=set()
for r in samples:
 k=r['label'],r['suite'],r['case'];assert k not in seen;seen.add(k);c=native(r['suite'],r['case']);assert sha(TESTS/c['path'])==c['sha256']==r['original_sha256'];assert sha(r['command'][0])==r['binary_sha256'];assert r['N']==c['N'];assert not r['stderr'];assert r['mode']=='release'and not r['exit_code']
 prefix='OCTANE_IC_RESULT:'if r['suite']=='octane'else'TEB_RESULT:';d=[json.loads(l[len(prefix):])for l in r['stdout'].splitlines()if l.startswith(prefix)];assert len(d)==1;assert validator.validate(d[0],r['suite'],c)==r['ms']
for sub,expected in [('paired01',360),('focus01',160)]:
 rows=json.loads((HERE/sub/'samples.json').read_text());assert len(rows)==expected;assert len({(r['label'],r['suite'],r['case'],r['rep'])for r in rows})==expected
 for r in rows:
  assert r['mode']=='release'and not r['stderr']and not r['exit_code'];assert sha(r['command'][0])==r['binary_sha256']
  if r['suite']=='external':
   assert sha(r['command'][2])==r['script_sha256'];d=json.loads(next(x.split(':',1)[1]for x in r['stdout'].splitlines()if x.startswith('EXTERNAL_RESULT:')));assert d['ms']==r['ms']and d['N']==r['N']
  else:assert sha(TESTS/native(r['suite'],r['case'])['path'])==r['original_sha256']
# Independently recompute the GM from per-item measurements and suite weights.
summary=json.loads((full/'summary.json').read_text())
for suite in ['octane','sunspider']:
 for l in LABELS:
  g=collections.defaultdict(list)
  for r in summary['rows']:
   if r['suite']==suite:g[r['group']if suite=='octane'else r['case']].append(math.log(r[l+'_ms']))
  assert len(g)==(14 if suite=='octane'else 26);actual=math.exp(statistics.mean(statistics.mean(v)for v in g.values()));assert abs(actual-summary['statistics'][suite][l]['GM_ms'])<1e-10
for sub in ['validation03','c_validation01','installation01']:assert json.loads((HERE/sub/'gate.json').read_text())['status']=='PASS'
for r in json.loads((HERE/'external/manifest.json').read_text()):assert sha(HERE/'external'/f'{r["package"]}-{r["version"]}.tgz')==r['tarball_sha256']
save(HERE/'audit.json',dict(status='PASS',sources=reports,full_Release_processes=172,paired_Release_processes=520,SHAM_SITE_same_ELF=True,all_formal_inputs_N_checksums_valid=True,GM_recomputed=True,external_tarball_hashes_valid=True,source_patches_and_archives_verified=True))
print('AUDIT_PASS: 172 full-suite + 520 paired Release records; source/patch/archive/GM/input hashes verified.')
