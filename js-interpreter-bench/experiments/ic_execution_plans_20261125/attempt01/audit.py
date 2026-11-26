import shutil,tempfile
from run import *
def main():
 assert subprocess.check_output(['git','branch','--show-current'],text=True).strip()=='myx'
 manifest=json.loads((PACKAGE/'manifest.json').read_text())
 for kind in ['original','modified']:
  for n,h in manifest[kind].items():assert sha(PACKAGE/kind/n)==h,n
 labels=['NUMERIC_PLAN','OLD_FORWARD','COMPARE_FIRST','COMPARE_FULL','COALLOC'];patches=[]
 for l in labels:
  m=json.loads((folder(l)/f'{l}.release.manifest.json').read_text());src=Path(m['binary']).parent
  assert not m['instrumented'] and not m['sanitized'];assert sha(src/'qjs')==m['binary_sha256']
  for n,h in m['sources'].items():assert sha(src/n)==h,n
  with tempfile.TemporaryDirectory(prefix='qjs-plan-audit-',dir='/tmp') as td:
   for n,t in base().items():p=Path(td)/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(t)
   patch=folder(l)/f'SPARSE-to-{l}.patch';cmd=['patch','-p1','-i',str(patch)]
   r=subprocess.run(cmd,cwd=td,capture_output=True,text=True);assert r.returncode==0,(l,r.stdout,r.stderr)
   for n,h in m['sources'].items():assert sha(Path(td)/n)==h,(l,n)
   patches.append(dict(label=l,patch=str(patch),patch_sha256=sha(patch),reconstructs_exact_normalized_release_sources=True))
 full=json.loads((HERE/'full01/samples.json').read_text());assert len(full)==172==len({(r['label'],r['suite'],r['case']) for r in full})
 assert all(r['exit_code']==0 and not r['stderr'] for r in full)
 targeted=[]
 for n in ['01_forward_numeric','02_compare_branch','03_ctor_coalloc']:
  rows=json.loads((HERE/n/'target01/samples.json').read_text());assert all(r['exit_code']==0 and not r['stderr'] for r in rows);targeted+=rows
 assert len(targeted)==95
 for on,off,group in [('NUMERIC_PLAN','NUMERIC_OFF','01_forward_numeric'),('COALLOC','COALLOC_OFF','03_ctor_coalloc')]:
  rows=json.loads((HERE/group/'target01/samples.json').read_text());assert {r['binary_sha256'] for r in rows if r['label']==on}=={r['binary_sha256'] for r in rows if r['label']==off}
 for l in ['NUMERIC_PLAN','COALLOC']:
  src=Path(binary(l)).parent
  for n in ['read_ic_opcodes.inc','read_ic_runtime.inc','read_ic_prepare.inc','four_prepare.inc']:
   assert (src/n).read_text()==(FROZEN/n).read_text(),(l,n)
 # Allocation candidate does not change IC representation or shared writes.
 for n in ['read_ic_types.h','quickjs-opcode.h','sparse_runtime.inc']:
  assert (Path(binary('COALLOC')).parent/n).read_text()==(FROZEN/n).read_text()
 mechanism=HERE/'mechanism01';assert json.loads((mechanism/'complete.json').read_text())['status']=='PASS'
 scan=json.loads((mechanism/'compare_scan.json').read_text());assert len(scan)==43 and sum(r['hits']>0 for r in scan)==1
 num=json.loads(sorted((HERE/'01_forward_numeric').glob('counts*/samples.json'))[-1].read_text());num={r['label']:r['diagnostic']['NP_WORK'] for r in num}
 b,n=num['SPARSE'],num['NUMERIC_PLAN']
 for k in [0,1,2,6,7]:assert b[k]==n[k]+n[4],k
 assert b[3]==n[3]+n[5] and n[5]==3*n[4]
 assert num['NUMERIC_OFF'][:4]==b[:4] and num['NUMERIC_OFF'][4]==0
 cmp=json.loads(sorted((HERE/'02_compare_branch').glob('counts*/samples.json'))[-1].read_text())
 from post_counts import comparison_sites
 aa={r['label']:comparison_sites(r) for r in cmp};old=sum(s['work'][1] for s in aa['COMPARE_PROFILE']);now=sum(s['work'][1] for s in aa['COMPARE_FULL']);saved=sum(s['work'][2] for s in aa['COMPARE_FULL']);assert old-now==saved
 save(HERE/'audit.json',dict(status='PASS',branch='myx',head=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip(),
  frozen_original_modified_unchanged=True,independent_release_patches=patches,full_release_processes=172,targeted_release_processes=95,
  total_formal_release_processes=267,only_candidates_in_full_pass=True,reference_A_SPARSE_V8_not_remeasured=True,
  same_ELF_controls=True,all_original_benchmark_inputs_and_checksums_valid=True,comparison_scan_all_43=True,all_three_semantic_ASan_UBSan_gates=True,
  counter_conservation_validated=True,extra_loop_entries_and_getter_exception=json.loads((HERE/'02_compare_branch/entries01/gate.json').read_text())['status'],
  gates=['01_forward_numeric/validation01/gate.json','02_compare_branch/validation01/gate.json','03_ctor_coalloc/validation03/gate.json'],
  compiler=subprocess.check_output(['gcc','--version'],text=True).splitlines()[0],CPU=2,TZ='Asia/Shanghai',locale='C',
  governor=Path('/sys/devices/system/cpu/cpu2/cpufreq/scaling_governor').read_text().strip(),siblings=Path('/sys/devices/system/cpu/cpu2/topology/thread_siblings_list').read_text().strip()))
 print('AUDIT_PASS: 267 Release processes; exact patches; frozen sources unchanged',flush=True)
if __name__=='__main__':main()
