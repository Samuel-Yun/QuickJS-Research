"""Read existing diagnostic profiles only; never run an engine or infer C from B."""
import json
import statistics
import run as r

H=r.HERE
identity=r.read(H/'diagnostics/C_profile_source_identity.json')
rows=[]
for tag in ('rep1','rep2','rep3','interval2000'):
    rec=r.read(H/'raw/C'/('api_on_'+tag+'.json'))
    lines=rec['stdout'].splitlines()
    p=json.loads(next(x[12:] for x in lines if x.startswith('CPU_PROFILE ')))
    w=json.loads(next(x[9:] for x in lines if x.startswith('C_WINDOW ')))
    a=json.loads(next(x[9:] for x in lines if x.startswith('RICHARDS ')))
    nodes={n['id']:n for n in p['nodes']}
    target=[n for n in p['nodes'] if n['callFrame']['url']==identity['diagnostic_script']
            and n['callFrame']['lineNumber']==identity['target_line_zero_based']]
    assert len(target)==1, 'must map exact file and original function line, not anonymous name'
    t=target[0];assert t['callFrame']['columnNumber']==56
    assert len(p['samples'])==len(p['timeDeltas']) and all(x>=0 for x in p['timeDeltas'])
    parent={child:n['id'] for n in p['nodes'] for child in n.get('children',[])}
    def includes_target(node):
        while node in nodes:
            if node==t['id']:return True
            node=parent.get(node)
        return False
    ids={n for n in nodes if includes_target(n)}
    # Clock origins are different. These are relative-bracketing bounds only;
    # do NOT align absolute profile timestamps to performance.now by assumption.
    profile_us=p['endTime']-p['startTime']
    batch_us=a['elapsed_ms']*1000
    pre_us=(w['workload_start_ms']-w['before_profile_ms'])*1000
    post_us=(w['callback_ms']-w['workload_stop_ms'])*1000
    assert 0<=profile_us-batch_us<=pre_us+post_us+50
    elapsed=0; target_full=0;target_interior=0;interior_us=0;special=0
    for sid,delta in zip(p['samples'],p['timeDeltas']):
        previous=elapsed;elapsed+=delta
        assert sid in nodes
        if sid in ids:target_full+=delta
        lo=max(previous,pre_us);hi=min(elapsed,profile_us-post_us)
        overlap=max(0,hi-lo)
        interior_us+=overlap
        if sid in ids:target_interior+=overlap
        if nodes[sid]['callFrame']['scriptId']==0:special+=1
    assert elapsed<=profile_us+50
    if tag!='interval2000':
        off=r.read(H/'raw/C'/('api_off_'+tag+'.json'))
        base=json.loads(next(x[9:] for x in off['stdout'].splitlines() if x.startswith('RICHARDS ')))
        off_elapsed=base['elapsed_ms'];perturbation=a['elapsed_ms']/off_elapsed-1
    else:off_elapsed=None;perturbation=None
    unknown=[n['id'] for n in nodes.values() if not n['callFrame']['url'] and n['callFrame']['scriptId']!=0]
    row=dict(run=tag,N=a['N'],requested_interval_us=2000 if tag=='interval2000' else 1000,
        batch_ms=a['elapsed_ms'],profile_ms=profile_us/1000,
        profile_excess_ms=(profile_us-batch_us)/1000,
        before_bound_ms=pre_us/1000,after_bound_ms=post_us/1000,
        samples=len(p['samples']),target_samples=sum(s in ids for s in p['samples']),
        self_samples=sum(s==t['id'] for s in p['samples']),
        target_sample_fraction=sum(s in ids for s in p['samples'])/len(p['samples']),
        special_samples=special,missing_function_identity_nodes=unknown,
        median_delta_us=statistics.median(p['timeDeltas']),
        q1_delta_us=r.quantile(p['timeDeltas'],.25),q3_delta_us=r.quantile(p['timeDeltas'],.75),
        min_delta_us=min(p['timeDeltas']),max_delta_us=max(p['timeDeltas']),
        max_5ms_deltas=sum(x>5000 for x in p['timeDeltas']),
        profile_tail_without_sample_us=profile_us-elapsed,
        target_weighted_full_ms=target_full/1000,
        target_weighted_interior_ms=target_interior/1000,
        interior_denominator_ms=interior_us/1000,
        target_weighted_interior_fraction=target_interior/interior_us,
        diagnostic_interval_assigned_ms_per_Run=target_interior/1000/a['N'],
        adjacent_unprofiled_batch_ms=off_elapsed,profile_on_over_off_minus_1=perturbation,
        boot_id=rec['boot_id'],target_callFrame=t['callFrame'],
        target_children=t.get('children',[]),profile_sha256=None)
    out=H/'diagnostics'/('cpu_profile.'+tag+'.json');r.save(out,p);row['profile_sha256']=r.sha(out)
    rows.append(row)
r.save(H/'diagnostics/C_profile_analysis.json',dict(
    rows=rows,
    basis='DIAGNOSTIC ONLY. Deltas label intervals by their endpoint sample; not stopwatch function self-time.',
    window='profile brackets original internal batch; exclude conservative boundary bands, no mixing with formal A',
    unresolved='sampling loss/throttling and precise profiler-to-clock rate attestation not independently measured',
    whole_function_dispatch='caller method lookup/call dispatch before JS frame appears is excluded',
    gc_helper='root GC/special nodes outside target ancestry not charged; native helper attribution follows profiler stack',
    no_B_times_frequency=True))
r.export(H/'diagnostics/C_profile_summary.csv',rows)
for row in rows:
    print(json.dumps({k:row[k] for k in ('run','batch_ms','profile_excess_ms','samples','target_samples',
        'target_sample_fraction','median_delta_us','max_delta_us','special_samples',
        'target_weighted_interior_fraction','diagnostic_interval_assigned_ms_per_Run',
        'profile_on_over_off_minus_1','target_children')}))
