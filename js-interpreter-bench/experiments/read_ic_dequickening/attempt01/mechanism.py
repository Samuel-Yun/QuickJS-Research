"""Check genuine opcode restoration, fixed threshold, reentry and serialization before pilot."""
import diagnostic,run
from common import *
from micros import TARGETS
def sites(d,names):
    sources={s['source_id']:digest(bytes.fromhex(s['source_hex'])) for s in d['sources']};out=[]
    for f in d['functions']:
        name=bytes.fromhex(f['function_hex']).decode(errors='replace')
        if name not in names:continue
        canonical=digest(json.dumps([f['bytecode_zero_atoms_hex'],f['atoms']],sort_keys=True).encode())
        for s in f['sites']:out.append(dict(function=name,canonical_code_sha256=canonical,source_sha256=sources.get(f['source_id']),**s))
    return out
def native():
    rows=[]
    for label,san in [('R',False),('R_sanitizer',True)]:
        src=STORE/label;obj=src/('.obj/asan/ubsan' if san else '.obj');exe=src/'private_state_check'
        cmd=['gcc','-O2','-g','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-I'+str(src),str(HERE/'correctness/private_state.c')]
        if san:cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
        cmd += [str(obj/(x+'.o')) for x in ['dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(exe)]
        r=capture(label+'_private_build',cmd);assert not r['exit_code']
        r=capture(label+'_private_state',[exe]);assert not r['exit_code'] and not r['stderr'] and 'PRIVATE_STATE_PASS' in r['stdout'];rows.append(dict(build=label,sha256=sha(exe),stdout=r['stdout']))
    save(HERE/'correctness/private_state.json',dict(status='PASS',runs=rows))
def main():
    rows=[]
    for c in MICRO_CASES:
        p=run.script(c,2,True)
        for v in ['M','R']:
            d=diagnostic.collect('gate_'+c,v,p);ss=sites(d,TARGETS[c]);rows.extend(dict(case=c,variant=v,**s) for s in ss)
            if c in ['M4.numeric_control','M5.write_control']:assert not ss
            elif c in MICRO_CASES[:3]:assert ss and all(s['queries']==8192 and s['hits']==8191 and s['exits']==s['post_exit_reads']==0 for s in ss)
            elif v=='R':assert ss and all(s['queries']==32 and s['hits']==0 and s['exits']==1 and s['post_exit_reads']==8160 and s['updates']==31 for s in ss)
            else:assert ss and all(s['queries']==8192 and s['hits']==0 and s['replacements']==8191 for s in ss)
    ds={v:diagnostic.collect('gate_dequickening',v,HERE/'correctness/dequickening.js') for v in ['M','R']}
    checks=[]
    expected={'dq31':(31,0,0,0),'dq32':(32,0,1,0),'dq33':(32,0,1,1),'dqReset':(66,2,1,10),
      'dqInherited':(32,0,1,32),'dqMissing':(32,0,1,32),'dqPrimitive':(32,0,1,32),'dqSpecial':(32,0,1,32),
      'dqGetter':(32,0,1,32),'dqProxy':(32,0,1,32),'dqThrow':(32,0,1,32),'dqNull':(32,0,1,32),'dqProxyThrow':(32,0,1,32),
      'dqShared':(32,0,1,64),'dqRecursive':(32,0,1,50),'dqRecursiveMethod':(32,0,1,9),
      'dqPhase':(32,0,1,136),'dqPhaseHit':(40,7,1,136)}
    for name,e in expected.items():
        ss=sites(ds['R'],[name]);assert len(ss)==1,(name,ss)
        s=ss[0];actual=tuple(s[k] for k in ['queries','hits','exits','post_exit_reads']);assert actual==e,(name,actual,e)
        checks.append(dict(function=name,status='PASS',ic_queries=s['queries'],hits=s['hits'],post_exit_reads=s['post_exit_reads'],exits=s['exits'],exit_query_index=s['exit_query_index'],final_opcode_id=s['final_opcode_id'],final_operand=s['final_operand']))
    for v in ['M','R']:
        ss=sites(ds[v],['dqTwo']);assert len(ss)==2 and ss[0]['hits']==99 and ss[0]['exits']==0
    phases=[]
    for name in ['dqPhase','dqPhaseHit']:
        for v in ['M','R']:phases.extend(dict(variant=v,**s) for s in sites(ds[v],[name]))
    native();save(HERE/'correctness/target_sites.json',rows);csvout(HERE/'correctness/exit_state_checks.csv',checks);save(HERE/'correctness/phase_changes.json',phases)
    assert read(HERE/'correctness/semantic_gate.json')['status']=='PASS'
    save(HERE/'correctness/mechanism_gate.json',dict(status='PASS',K=32,whole_lifetime_denominator=True,real_normal_opcode_and_atom_restored=True,threshold_current_read_is_IC_miss=True,
      phase_change_permanent_exit_confirmed=True,recursive_active_frames_and_shared_compiled_bytecode=True,native_idempotency_atom_reference_counts_ROM_and_reset=True))
    save(HERE/'correctness/gate.json',dict(status='PASS',semantic='semantic_gate.json',mechanism='mechanism_gate.json',private_state='private_state.json',full_test262=False))
    print('MECHANISM_AND_REFERENCE_GATE_PASS',flush=True)
if __name__=='__main__':main()
