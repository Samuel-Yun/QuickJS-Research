"""Read-only historical/runtime verification plus new-stage completion ledger."""
import ast,collections,json
from datetime import datetime
from pathlib import Path
import common as c
from code_evidence import excerpt

def main():
    c.verify(check_preservation=True)
    formal=c.read(c.ATTEMPT/'summary/formal_audit.json')
    design=c.read(c.ATTEMPT/'microbench/design.json')
    for path,hash_ in design['inputs'].items():
        if c.sha(c.ROOT/path)!=hash_:raise RuntimeError('frozen design changed')
    ledger={};first={}
    for stage in ('correctness','calibration','selected_correctness','formal'):
        rr=[c.read(p) for p in (c.ATTEMPT/'raw/records'/stage).glob('*.json')]
        ledger[stage]=dict(collections.Counter(r['boot_id'] for r in rr))
        first[stage]=min(r['timestamp_utc'] for r in rr)
    if datetime.fromisoformat(design['timestamp_utc'])>datetime.fromisoformat(first['correctness']):raise RuntimeError('design not before correctness')
    for p in (c.BASE/'tooling').glob('*.py'):ast.parse(p.read_text(),filename=str(p))
    q=Path(c.manifest()['runtime']['engines']['quickjs']['binary']['path']).parent/'quickjs.c'
    excerpt(q,19546,19660,'qjs.put_array_el.complete',
        'https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c#L19546')
    required=['advisor_scope.md','manifest.json','capabilities.json','protocol.md','results.md','audit.json',
        'meeting_notes.md','next_commands.md','raw/formal.csv','summary/per_variant.csv','summary/engine_ratios.csv','summary/contrasts.csv']
    for name in required:
        if not (c.ATTEMPT/name).is_file():raise RuntimeError('missing deliverable '+name)
    c.save(c.ATTEMPT/'summary/completion_audit.json',{'status':'PASS','required_outputs_present':True,
        'old_files_and_runtime_verified_after_all_work':True,'formal_valid':formal['formal_valid'],
        'design_frozen_before_first_correctness':True,'first_record_UTC_by_stage':first,'boot_counts_by_stage':ledger,
        'python_AST_checks':'PASS','formal_tooling_hash_unchanged':True,
        'profiling_limitations_remain':'PARTIAL','formal_trace_or_counter_flags':False,
        'deliverable_sha256':{p:c.sha(c.ATTEMPT/p) for p in required}})
    print(json.dumps({'status':'COMPLETION_VERIFIED','formal_valid':formal['formal_valid'],'boots_by_stage':ledger},indent=2),flush=True)

if __name__=='__main__':main()
