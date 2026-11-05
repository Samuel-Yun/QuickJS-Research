"""Final deliverable/runtime/history/frozen-byte audit; no engine execution."""
import ast, collections, json, re
from datetime import datetime, timedelta
from pathlib import Path
import common as c

def main():
    c.verify(True);audit=c.read(c.HERE/'summary/formal_audit.json');design=c.read(c.HERE/'microbench/design.json')
    for path,h in design['inputs'].items():
        if c.sha(c.HERE/path)!=h: raise RuntimeError('frozen input changed')
    outputs=['README.md','scope.md','manifest.json','protocol.md','capabilities.json','environment.txt','results.md','audit.json','meeting_notes.md','next_commands.md','raw/journal.jsonl','raw/formal.csv','raw/calibration.csv','raw/correctness.csv','summary/per_variant.csv','summary/engine_ratios.csv','summary/contrasts.csv','diagnostics/audit.json','source_evidence/prior_art.md','source_evidence/byte_audit.json','source_evidence/archive_audit.windows.json','source_evidence/archive_audit.linux.json','source_evidence/quickjs_diagnostic.patch','source_evidence/ml_counters.h','source_evidence/diagnostic_build.json','microbench/design_bytes.zip','microbench/formal_bytes.zip','source_evidence/historical_bytes.zip']
    for p in outputs:
        if not (c.HERE/p).is_file(): raise RuntimeError('missing '+p)
    for p in c.HERE.glob('*.py'): ast.parse(p.read_text())
    with (c.HERE/'raw/journal.jsonl').open() as f: ledger=[json.loads(line) for line in f]
    if collections.Counter(r['stage'] for r in ledger)!={'correctness':12,'calibration':60,'selected_correctness':6,'formal':180}: raise RuntimeError('journal completeness')
    formal=[r for r in ledger if r['stage']=='formal']
    # Additional seriality check across guest reboot boundaries by UTC intervals.
    diagnostic=[c.read(p) for p in (c.HERE/'diagnostics/records').glob('*.json') if not p.name.startswith('sample.') and not p.name.startswith('audit.') and not p.name.startswith('reference.')]
    start=min(datetime.fromisoformat(r['timestamp_utc']) for r in formal)
    stop=max(datetime.fromisoformat(r['timestamp_utc'])+timedelta(microseconds=r['outer_wall_ns']/1000) for r in formal)
    overlaps=[]
    for d in diagnostic:
        a=datetime.fromisoformat(d['timestamp_utc']);b=a+timedelta(microseconds=d['outer_wall_ns']/1000)
        if max(a,start)<min(b,stop): overlaps.append(d['command'])
    if overlaps: raise RuntimeError('diagnostic/formal UTC overlap '+str(overlaps))
    linux=c.read(c.HERE/'source_evidence/archive_audit.linux.json');windows=c.read(c.HERE/'source_evidence/archive_audit.windows.json')
    if linux['archives_sha256']!=windows['archives_sha256'] or linux['entry_hashes_after_git_export']!=windows['entry_hashes_after_git_export']: raise RuntimeError('archive cross-platform mismatch')
    boot_counts=collections.Counter(r['boot_id'] for r in formal)
    for stage in ('correctness','calibration','selected_correctness'):
        if set(r['boot_id'] for r in ledger if r['stage']==stage)!=set(boot_counts): raise RuntimeError('performance/gate boot changed')
    build=c.read(c.HERE/'source_evidence/diagnostic_build.json')
    if c.sha(build['binary'])!=build['binary_sha256'] or c.sha(c.HERE/'source_evidence/quickjs_diagnostic.patch')!=build['patch_sha256'] or c.sha(c.HERE/'source_evidence/ml_counters.h')!=build['counter_header_sha256']: raise RuntimeError('diagnostic evidence changed')
    c.save(c.HERE/'summary/completion_audit.json',{'status':'PASS','formal_samples':180,'cohort':c.manifest()['cohort'],'required_outputs_present':True,'runtime_dependencies_adapters_actual_final_sha':'PASS','historical_current_byte_inventory_preserved':'PASS','frozen_design':'PASS','journal_reparsed_counts':'PASS','cross_boot_diagnostic_vs_formal_UTC_seriality':'PASS','formal_gate_pilot_single_boot_counts':dict(boot_counts),'archive_windows_linux_git_export':'PASS','new_scripts_python_AST':'PASS','diagnostic_artifact_patch_hash':'PASS','deliverable_hashes':{p:c.sha(c.HERE/p) for p in outputs},'tooling_hashes':{p.name:c.sha(p) for p in c.HERE.glob('*.py')},'remaining_partial':'local full NG source artifact/40-digit v0.8 commit provenance; no effect on successful formal audit','new_VM_optimization_implemented':False,'canonical_git_branch_index_modified':False})
    print('FINAL_COMPLETION_AUDIT_PASS 180/180',flush=True)

if __name__=='__main__': main()
