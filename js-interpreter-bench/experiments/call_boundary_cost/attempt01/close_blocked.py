"""Close pre-fixed failed perturbation gates; no new performance or profiling runs."""
from common import *
from static_map import elf_segments,parse_instructions
from analyze_profiles import maps,normalize
def main():
    m=verify();assert read(HERE/'validation_p23000_done.json')['status']=='COLLECTED'
    gate=read(HERE/'validation_analysis_p23000/perturbation_gate.json');assert not any(g['accepted'] for g in gate['cases'].values())
    save(HERE/'perturbation_gate.json',gate)
    save(HERE/'long_window_gate.json',dict(status='BLOCKED_PERTURBATION',eligible_cases=[],planned_windows=9,actual_windows=0,reason='exactly one fallback validation exhausted; no workload passes both unchanged thresholds; no cherry-pick first7ms campaign',timestamp=stamp()))
    primary=m['artifacts']['SHIM_ON']['path'];segments=elf_segments(primary);save(HERE/'mapping/elf_segments.json',dict(SHIM_ON=segments,BASE=elf_segments(m['artifacts']['BASE']['path'])))
    # Only five-PC tool smoke: not a hotspot ranking or a cost partition.
    r=read(HERE/'raw/validation_p7000/local_function_call/rep0.SHIM_ON.N32768.p7000.json')
    data=gzip.decompress((HERE/r['sampler_archives']['samples.bin']['path']).read_bytes());mp=maps(gzip.decompress((HERE/r['sampler_archives']['begin.maps']['path']).read_bytes()).decode());pcrows=[]
    import struct
    for rip,t in list(struct.iter_unpack('<QQ',data))[:5]:
        n=normalize(rip,mp,{primary:segments});pcrows.append(dict(rip=hex(rip),monotonic_ns=t,link_pc=hex(n['link_pc']) if n['link_pc'] is not None else None,load_bias=hex(n['load_bias']) if n['load_bias'] is not None else None,status=n['status'],module=n['path']))
    csvout(HERE/'mapping/five_PC_mapping_smoke.csv',pcrows)
    linked=[p['link_pc'] for p in pcrows if p['link_pc']];capture('five_PC_dwarf_smoke',['addr2line','-a','-f','-i','-e',primary],input=''.join(x+'\n' for x in linked))
    capture('sampler_handler_disasm',['objdump','-d','-Mintel','--disassemble=handler',primary])
    capture('shim_program_headers',['readelf','-lW',primary])
    # Clearly state that all native categories are unknown, rather than turn
    # JS_CallInternal (whole interpreter) into CALL_ENTRY time.
    ins=parse_instructions(read(HERE/'raw/commands/shim_call_disasm.json')['stdout']);lo=ins[0]['pc'];hi=ins[-1]['pc']+5
    csvout(HERE/'address_categories.csv',[dict(start=hex(lo),end=hex(hi),category='SHIM_UNKNOWN',basis='NOT_ATTRIBUTED: perturbation gate failed before long windows; whole JS_CallInternal includes interpreter, not equivalent to call boundary',status='BLOCKED_PERTURBATION')])
    save(HERE/'mapping/status.json',dict(status='BLOCKED_PERTURBATION_NOT_CLASSIFIED',five_PC_smoke_only=True,ASLR_disabled=False,ELF_SHA256=m['artifacts']['SHIM_ON']['sha256'],source_commit=m['A_source_commit'],unknown_does_not_mean_zero_cost=True))
    for a in m['objects']:
        assert sha(a['path'])==a['sha256']
    for rel,h in m['A_source_files'].items():assert sha(Path(m['A_source'])/rel)==h
    verify();save(HERE/'final_identity.json',dict(status='PASS',timestamp=stamp(),BASE_unchanged=True,SHIM_ON_OFF_same_ELF=True,VM_and_repl_object_hashes_unchanged=True,A_source_files_unchanged=True,normalization_only_no_VM_optimization=True))
    capture('environment_after',['sh','-c','uname -a; uptime; ps -eo pid,stat,comm,pcpu,args; true'])
    print('CLOSED_BLOCKED_PERTURBATION_NO_LONG_RUNS',flush=True)
if __name__=='__main__':main()
