"""Raw-only capability/correctness review. Never fabricates performance statistics."""
import argparse,collections,math
from common import *
def flags(text):
 result={}
 for line in text.splitlines():
  if not line.startswith('--'):continue
  name=line[2:]
  if '=' in name:k,v=name.split('=',1);result[k]=v
  elif name.startswith('no-'):result[name[3:]]=False
  else:result[name]=True
 return result
def main(output=None):
 out=Path(output) if output else HERE/'summary';path=HERE/'raw/capability';values={k:flags(read(path/(f'{v}.1.json'))['stdout']) for k,v in [('default','default_flags'),('ON','V8_IC_ON_flags'),('OFF','V8_IC_OFF_flags')]}
 assert values['ON']['jitless']==values['OFF']['jitless']==True
 assert values['ON']['lazy']==values['OFF']['lazy']==False
 assert values['ON']['use-ic']==True and values['OFF']['use-ic']==False
 for key in ['sparkplug','maglev','turbofan']:assert not values['ON'][key] and not values['OFF'][key]
 diff=[k for k in values['ON'] if values['ON'][k]!=values['OFF'][k]];assert diff==['use-ic'],diff
 for c in CONDITIONS[1:]:
  for label in ['basic','flags']:
   r=read(path/(c+'_'+label+'.1.json'));assert r['exit_code']==0 and not r['stderr'] and 'PROBE_PASS 40000' in r['stdout']
 flagrows=[dict(flag=k,default=values['default'].get(k),ON=values['ON'].get(k),OFF=values['OFF'].get(k)) for k in sorted(values['ON'])];csvout(out/'effective_flags.csv',flagrows)
 csvout(out/'jitless_implicit_changes.csv',[r for r in flagrows if r['ON']!=r['default']])
 transitions=[];observations=[]
 for c in CONDITIONS[1:]:
  record=read(path/(c+'_debug.1.json'));text=record['stdout'];match=re.search(r'(0x[0-9a-f]+)\s+@\s*0\s*:\s*33 03 00 00\s+GetNamedProperty a0, \[0:"x"\], FBV\[0\]',text);assert match
  address=int(match[1],16);events=[]
  with (HERE/'raw/ic'/(c+'.debug.log')).open(encoding='utf-8',newline='') as f:
   for row in csv.reader(f):
    if row and row[0]=='LoadIC' and int(row[1],16)==address:
     assert row[8]=='x';event=dict(condition=c,target='stableOwn',bytecode_PC=0,feedback_slot=0,bytecode_address=match[1],old_state_code=row[5],new_state_code=row[6],receiver_map=row[7],property=row[8]);events.append(event);transitions.append(event)
  if c=='V8_IC_ON':assert len(events)==1 and events[0]['old_state_code']=='0' and events[0]['new_state_code']=='1'
  observations.append(dict(condition=c,target_body='function stableOwn(obj) { return obj.x; }',body_sha256=hashlib.sha256(b'function stableOwn(obj) { return obj.x; }').hexdigest(),checksum=30000,observed_IC_transitions=len(events),target_feedback_snapshot=None,hit_rate=None,interpretation='positive selected-site transition' if events else 'absence only; NOT proof of uninitialized/no-cache state'))
 csvout(out/'selected_site_transitions.csv',transitions);save(out/'selected_site_observations.json',observations)
 checks=[]
 for p in sorted(path.glob('correctness_*.json')):
  r=read(p);payload=json.loads(re.findall(r'^CORRECTNESS:(.*)$',r['stdout'],re.M)[0]);assert r['exit_code']==0 and not r['stderr'] and payload['correctness']=='PASS';checks.append(dict(condition=p.stem.split('_N')[1].split('_',1)[1].rsplit('.',1)[0],case=payload['case'],N=payload['N'],valid=True,exit_code=r['exit_code'],checksum=payload['checksum'],script_sha256=sha(Path(r['command'][-1])) if Path(r['command'][-1]).exists() else sha(HERE/'probes/correctness'/Path(r['command'][-1]).name)))
 assert len(checks)==18;csvout(out/'correctness.csv',checks)
 clocks=[]
 for c in CONDITIONS:
  r=read(path/('clock_'+c+'.1.json'));p=json.loads(re.findall(r'^CLOCK:(.*)$',r['stdout'],re.M)[0]);wall=(r['outer_stop_ns']-r['outer_start_ns'])/1e6
  assert r['exit_code']==0 and not r['stderr'] and p['stop_ms']>=p['start_ms'] and p['elapsed_ms']==p['stop_ms']-p['start_ms'] and 0<=p['elapsed_ms']<=wall+5
  clocks.append(dict(condition=c,child_start_ms=p['start_ms'],child_stop_ms=p['stop_ms'],elapsed_ms=p['elapsed_ms'],outer_elapsed_ms=wall,duration_enclosure=True,parent_child_absolute_origin_verified=False,timing_sample=False))
 csvout(out/'clock_capability.csv',clocks)
 save(out/'audit.json',dict(status='BLOCKED_IC_INTERVENTION',capability_records_reviewed=True,v8_jitless_flag_accepted=True,effective_jitless_ON=True,effective_jitless_OFF=True,mode_corresponding_source_verified=None,only_effective_flag_difference=diff,selected_ON_transition_observed=True,selected_OFF_no_cache_state_verified=None,ic_intervention_verified=None,formal_authorized=False,correctness_expected=18,correctness_actual=18,correctness_valid=18,formal_target=270,formal_actual=0,formal_valid=0,formal_failed=0,pilot_actual=0,formal_N=None,performance_statistics_available=False,source_status='UNAVAILABLE_TLS_CERTIFICATE_CHAIN',statistics_GM=False))
 print('CAPABILITY_REVIEW_COMPLETE_BLOCKED_IC_INTERVENTION',len(checks))
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--output');a=p.parse_args();main(a.output)
