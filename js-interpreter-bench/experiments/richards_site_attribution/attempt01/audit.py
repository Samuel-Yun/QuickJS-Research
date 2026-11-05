"""Independent read-only arithmetic/content audit; no rerun or correction of samples."""
import collections
import hashlib
import json
import re
import statistics
from pathlib import Path
import run as r
import analyze as a
H=r.HERE

def main():
    r.audit_preservation()
    ident=r.read(H/'source_evidence/diagnostic_identity.json')
    assert r.sha(r.BUILD/'qjs')==ident['sha256']
    assert r.sha(r.BUILD/'quickjs.c')==ident['patched_quickjs_c_sha256']
    for name in ('site_hooks.h','site_metadata.h'):assert r.sha(H/'probes'/name)==r.sha(r.BUILD/name)
    r.save(H/'source_evidence/build_inputs.json',{name:dict(path=str(r.BUILD/name),sha256=r.sha(r.BUILD/name))
       for name in ('site_hooks.h','site_metadata.h','quickjs.c','quickjs-opcode.h','Makefile','qjs','qjsc')})
    sites=a.rows(H/'summary/site_frequencies.csv')
    assert len(sites)==189 and sum(int(x['probes']) for x in sites)==293317
    assert sum(int(x['ops']) for x in sites)==252558
    assert sum(int(x['ops']) for x in sites if x['property']=='run' and x['opcode_name']=='get_field2')==13146
    report=r.read(H/'summary/sampling_summary.json');on=[];raw_correct=0
    perprocess=[]
    for rep in range(1,4):
        name=f'sample_ctx1_rep{rep}';record=r.read(H/'raw'/f'{name}.json');p=r.check(record)
        raw=a.rows(H/'raw'/f'{name}.samples.csv')
        timed=[x for x in raw if p['start_ms']*1e6<=int(x['monotonic_ns'])<=p['stop_ms']*1e6]
        decoded=a.rows(H/'mapping'/f'{name}.samples.decoded.csv')
        assert len(timed)==len(decoded)
        counts=collections.Counter()
        for x in decoded:
            if x['native_function']=='find_own_property':
                counts['lookup']+=1
                assert x['site_valid']=='True' and x['site_key'],x
            elif x['site_valid']=='True':counts['active_other']+=1
            elif x['site']=='-1':counts['invalid']+=1
            elif x['site']=='0':counts['no_context']+=1
            else:raise AssertionError(x)
        assert sum(counts.values())==len(decoded)
        counts['all_internal']=len(decoded);perprocess.append(dict(rep=rep,**counts));on+=decoded
    assert len(on)==5393
    assert sum(x['native_function']=='find_own_property' for x in on)==1229
    pooled=a.rows(H/'summary/site_samples.csv')
    assert sum(int(x['lookup_samples']) for x in pooled)==1229
    assert all(float(x['fraction_all_internal'])==int(x['lookup_samples'])/5393 for x in pooled)
    assert all(float(x['fraction_mapped_lookup'])==int(x['lookup_samples'])/1229 for x in pooled)
    for path in (H/'raw').glob('*.json'):
        rec=r.read(path)
        if isinstance(rec,dict) and isinstance(rec.get('stdout'),str) and re.search(r'^RICHARDS ',rec['stdout'],re.M):
            r.check(rec);raw_correct+=1
    controls={}
    for mode in ('frozen','ctx0','ctx1'):
        vals=[]
        for rep in range(1,4):
            label=f'control_frozen_nosignal_rep{rep}' if mode=='frozen' else f'control_nosignal_{mode}_rep{rep}'
            p=r.check(r.read(H/'raw'/f'{label}.json'));vals.append(p['elapsed_ms'])
        controls[mode]=dict(elapsed_ms=vals,median_ms=statistics.median(vals))
    controls['context_on_over_off_point_estimate']=controls['ctx1']['median_ms']/controls['ctx0']['median_ms']
    controls['context_on_over_frozen_point_estimate']=controls['ctx1']['median_ms']/controls['frozen']['median_ms']
    controls['not_causal_time_decomposition']='separate diagnostic batches, not randomized formal performance samples'
    r.save(H/'summary/perturbation.json',controls)
    selected=r.read(H/'summary/v8_selected_site.json');assert len(selected['transitions'])==2
    assert r.read(H/'summary/context_safety.json')['status']=='PASS'
    r.save(H/'summary/audit.json',dict(status='PASS_WITH_SAMPLING_AND_V8_PATH_LIMITS',
        frozen_binaries_dependencies_and_old_attempt_unchanged=True,diagnostic_binary_sha256=ident['sha256'],
        original_Richards_successful_runs=raw_correct,formal_new_samples=0,
        native_count_active_sites=189,final_dump_offsets_and_atoms_checked=189,
        N1_N2_exact_scaling=True,lookup_context_counts=dict(total=293356,mapped=293317,unknown=39),
        perprocess=perprocess,lookup_samples_mapped=1229,lookup_samples_unmapped=0,
        other_active_context_samples=1071,invalid_transition_samples=316,no_property_context_samples=2777,
        signal_drops=0,v8_selected_same_process_IC_offset_join='PASS',
        v8_selected_IC_hit_rate=None,v8_selected_executed_branch=None,
        limitations=['WSL actual 10ms / one alternative 20ms','periodic aliasing and optimization DWARF boundaries',
        'diagnostic build perturbs timings/distribution','39 native lookup probes have no JS site',
        'V8 source/build attestation absent; IC state transitions do not count hits']))
    print('AUDIT PASS_WITH_SAMPLING_AND_V8_PATH_LIMITS',raw_correct,'original Richards runs',flush=True)

if __name__=='__main__':main()
