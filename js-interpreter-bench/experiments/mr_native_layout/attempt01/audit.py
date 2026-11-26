"""Independent raw-clock/order/identity audit; no executable needed for replay."""
import collections,math
from common import *
def main():
 m=read(HERE/'manifest.final.json');schedule=read(HERE/'schedule.json');records=[];problems=[];seen=set();last=0
 for s in schedule:
  path=HERE/'raw'/s['stage']/s['case']/f'b{s["block"]}.rep{s["rep"]}.pos{s["order"]}.{s["condition"]}.N{s["N"]}.json'
  if not path.exists():problems.append('MISSING '+str(path));continue
  r=read(path);records.append(r);key=(r['case'],r['stage'],r['rep'],r['condition']);assert key not in seen;seen.add(key)
  assert all(r[k]==s[k] for k in ['stage','case','condition','N','rep','order','block'])
  a=m['artifacts'][r['condition']];assert r['binary_sha256']==a['sha256'] and r['source_identity_sha256']==a['source_identity_sha256'] and r['objects']==m['objects'][a['variant']]
  assert r['environment']==read(HERE/'environment.json') and not any(k in r['environment'] for k in ['QJS_READ_IC_MODE','LD_PRELOAD','LD_AUDIT'])
  assert r['command'][0]==a['path'] and r['flags']==[] and r['cwd'].endswith('/js-interpreter-bench')
  assert r['outer_start_ns']>=last;last=r['outer_stop_ns'];assert r['outer_wall_ns']==r['outer_stop_ns']-r['outer_start_ns']
  if not r['valid']:problems.append('INVALID '+str(path));continue
  p=r['payload'];assert p['stop_ms']-p['start_ms']==r['elapsed_ms'] and r['elapsed_ms']/r['N']==r['elapsed_per_Run_ms']
  assert r['outer_start_ns']/1e6-1<=p['start_ms']<p['stop_ms']<=r['outer_stop_ns']/1e6+1
  assert r['exit_code']==0 and not r['stderr'] and p['warmup_calls']==0 and p['correctness']=='PASS'
  assert sha(HERE/r['script_relative'])==r['script_sha256']
 for case in CASES:
  for stage in ['base_pre','base_post']:
   rr=[r for r in records if r['case']==case and r['stage']==stage];assert len(rr)==24
   assert collections.Counter(r['condition'] for r in rr if r['order']==0)==dict(M_base=6,R_base=6)
  rr=[r for r in records if r['case']==case and r['stage']=='layout']
  if rr:
   assert len(rr)==128 and set(collections.Counter((r['condition'],r['order']) for r in rr).values())=={2}
   adj=collections.Counter()
   for b in range(16):
    seq=sorted([r for r in rr if r['block']==b],key=lambda r:r['order']);assert len(seq)==8
    adj.update((x['condition'],y['condition']) for x,y in zip(seq,seq[1:]))
   assert len(adj)==56 and set(adj.values())=={2}
 counts=collections.Counter(r['stage'] for r in records);assert counts['base_pre']==counts['base_post']==96
 expected=len(schedule);assert len(records)==expected<=704
 save(HERE/'analysis/audit.json',dict(status='PASS' if not problems else 'FAIL',expected=expected,actual=len(records),valid=sum(r['valid'] for r in records),stages=counts,problems=problems,below_1000_ms=sum(r.get('elapsed_ms',0)<1000 for r in records),unique_positions=len(seen),boot_ids=sorted(set(r['boot_id'] for r in records)),base_pair_balance=True,layout_position_and_directed_adjacency_balance=True,clock_enclosure_and_serial=True,no_outlier_removal=True,diagnostic_time_excluded=True,GM='not calculated'))
 assert not problems;print('INDEPENDENT_AUDIT_PASS',len(records),flush=True)
if __name__=='__main__':main()
