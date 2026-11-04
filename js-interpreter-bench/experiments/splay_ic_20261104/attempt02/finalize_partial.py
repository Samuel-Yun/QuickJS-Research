"""Portable read-only analysis of saved records. No engines/Linux/private code.
The generated summary is explicitly partial, never fake performance output.
"""
import csv,gzip,hashlib,io,json
from pathlib import Path

HERE=Path(__file__).resolve().parent
OLD=HERE.parent/'attempt01'
def read(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,x):
    p.parent.mkdir(parents=True,exist_ok=True)
    data=(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==data;return
    with p.open('xb') as f:f.write(data)
def csvout(p,rows):
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())

def main():
    out=HERE/'summary';hosts=[]
    for p in sorted((HERE/'recovery').glob('*/host.json')):
        d=read(p);hosts.append(dict(task=p.parent.name,host_exit=d['wsl_exit_code'],host_terminated=d['host_terminated_client'],wall_ms=d['external_wall_ms'],C_free_bytes=d['disk']['C:/']['free'],F_free_bytes=d['disk']['F:/']['free'],stdout=d['stdout']['text'],stderr=d['stderr']['text'],evidence=p.relative_to(HERE).as_posix()))
    csvout(out/'execution_tasks.csv',hosts)
    # Separate Linux child rows; each CPU/maxrss belongs to the wait4 child.
    child_rows=[]
    for root in [HERE/'splay_recovery',HERE/'last_recovery',HERE/'builds',HERE/'mechanism/raw']:
        for p in sorted(root.rglob('*.json')):
            d=read(p)
            if not isinstance(d,dict) or 'single_child_peak_rss_kib' not in d:continue
            child_rows.append(dict(record=p.relative_to(HERE).as_posix(),exit_code=d['exit_code'],signal=d['signal'],timeout=d['timeout'],wall_ms=d['external_wall_ms'],user_ms=d['child_user_ms'],system_ms=d['child_system_ms'],peak_rss_kib=d['single_child_peak_rss_kib'],boot=d['boot_id'],same_boot=d['boot_id']==d['boot_id_after']))
    csvout(out/'linux_children.csv',child_rows)
    actual=read(HERE/'preflight/check02/artifacts.json');ars=[]
    for name,r in actual['artifacts'].items():ars.append(dict(artifact=name,path=r['path'],size=r.get('size'),ELF=r.get('ELF'),sha256=r.get('sha256'),identity_matches=r.get('identity_matches'),smoke_valid=r.get('smoke_valid'),scope='initial actual preflight, not a post-interruption recheck'))
    for name,r in read(HERE/'builds/build04/manifest.json').items():ars.append(dict(artifact=name,path=r['path'],size=r['size'],ELF=True,sha256=r['sha256'],identity_matches=True,smoke_valid=True,scope='publish-time verification; after interruption actual state UNKNOWN'))
    csvout(out/'artifacts.csv',ars)
    recovery_counts=[]
    for p in sorted((HERE/'splay_recovery').glob('*.json.gz')):
        d=json.loads(gzip.decompress(p.read_bytes()));n=int(p.name.split('.N')[1].split('.')[0]);label=p.name.split('.')[1];totals={}
        for f in d['functions']:
            for op in f['opcodes']:
                if not ('get_field' in op['before_op'] or op['before_op']=='get_length'):continue
                for phase in op.get('phases',[]):
                    if phase['phase']==2:
                        for key in ['operations','ic_queries','hits','misses','updates','replacements','find_normal']:
                            totals[key]=totals.get(key,0)+phase[key]
        if n==2:
            assert totals['operations']==45664
            assert totals['find_normal']==(48864 if label=='A' else 25863)
            if label=='M':assert (totals['hits'],totals['misses'],totals['updates'],totals['replacements'])==(23001,22663,18343,18324)
        recovery_counts.append(dict(condition=label,N=n,**totals))
    csvout(out/'splay_recovery_counts.csv',recovery_counts)
    sites=[];layouts=[];matches=[]
    for n in [1,2]:
        d=read(HERE/'last_recovery'/f'Splay.M.N{n}.counters.json');phase=d['phases'][2]
        assert d['target_instances']==1 and d['shape_birth_overflow']==0 and d['live_shapes']==0
        for shape,s in zip(d['shape_focus'],phase['sites']):
            assert s['ic_queries']==s['hits']+s['misses'] and s['updates']==s['insertions']+s['replacements']+s['same_shape_updates']
            assert s['operations']==sum(x['count'] for x in shape['layouts'])+shape['unknown_events']+shape['overflow_events']
            assert shape['unknown_events']==shape['overflow_events']==0
            sites.append(dict(repetitions=n,phase='run',pc=shape['pc'],property='right' if shape['pc']==147 else 'key',operations=s['operations'],queries=s['ic_queries'],hits=s['hits'],fallback=s['misses'],find=s['find_normal'],updates=s['updates'],replacements=s['replacements'],retains=s['retains'],releases=s['releases'],observed_shape_generations=len(shape['layouts']),transitions=shape['transitions'],sequence_truncated=shape['sequence_truncated'],unknown_events=shape['unknown_events'],overflow_events=shape['overflow_events']))
            for l in shape['layouts']:
                layout=';'.join(str(v['index'])+':'+bytes.fromhex(v['name_hex']).decode()+':flags'+str(v['flags']) for v in l['layout'])
                layouts.append(dict(repetitions=n,pc=shape['pc'],generation=l['generation'],frequency=l['count'],hashed=l['hashed'],class_id=l['class_id'],exotic=l['exotic'],holder_depth=l['holder_depth'],property_index=l['property_index'],property_byte_offset=l['property_byte_offset'],property_flags=l['property_flags'],layout=layout,layout_truncated=l['layout_truncated']))
        if n==2:
            rr=phase['reads'];assert (rr['operations'],rr['hits'],rr['misses'],rr['updates'],rr['replacements'])==(45664,23001,22663,18343,18324)
            assert [s['operations'] for s in phase['sites']]==[4608,2676,2356]
            assert [s['hits'] for s in phase['sites']]==[2432,1347,1209]
            assert [s['replacements'] for s in phase['sites']]==[2176,1329,1147]
        matches.append(dict(N=n,source_sha256='138762086ed599b42111191883e57a62e65533df210601253b636eddb39abd43',live_shapes_after_destroy=d['live_shapes'],peak_live_shapes=d['peak_live_shapes'],Run=phase['reads']))
    csvout(out/'splay_sites.csv',sites);csvout(out/'splay_layouts.csv',layouts);save(out/'splay_count_checks.json',matches)
    correctness=[]
    for p in sorted((HERE/'mechanism/raw/correctness').rglob('*.json')):
        r=read(p);correctness.append(dict(case=r['case'],condition=r['condition'],N=r['N'],valid=r['valid'],exit_code=r['exit_code'],stderr=r['stderr'],binary_sha256=r['binary_sha256'],script_sha256=r['script_sha256'],evidence=p.relative_to(HERE).as_posix()))
    assert len(correctness)==16 and all(r['valid'] for r in correctness)
    csvout(out/'correctness.csv',correctness)
    orphan=[]
    for p in sorted((HERE/'mechanism/started').rglob('*.json')):
        raw=HERE/'mechanism/raw'/p.relative_to(HERE/'mechanism/started')
        if not raw.exists():orphan.append(dict(marker=p.relative_to(HERE).as_posix(),record=read(p),linux_child_start_confirmed=None,linux_child_exit=None,reason='parent marker exists; no completed process record; not an engine correctness failure'))
    save(out/'incomplete_positions.json',orphan)
    assert len(orphan)==1 and orphan[0]['record']['command'][0].endswith('/C_light/qjs')
    mechanism=[]
    for case in ['Splay.Splay','M4.numeric_control']:
        for c in ['A','M','C_ON','C_OFF']:mechanism.append(dict(case=case,condition=c,formal_valid=0,formal_expected=30,median_ms_per_Run=None,ratio_OFF_ON=None,ratio_ON_M=None,status='BLOCKED_DIAGNOSTIC_GATE'))
    csvout(out/'mechanism_pending.csv',mechanism)
    octane=[]
    catalog=read(OLD/'inputs/case_catalog.json')
    for r in catalog:
        if r['suite']=='Box2D':continue
        octane.append(dict(case=r['case'],A_median_ms_per_Run=None,M_median_ms_per_Run=None,V8_ON_median_ms_per_Run=None,M_over_A=None,M_over_V8=None,A_over_V8=None,formal_valid=0,formal_expected=90,status='NOT_STARTED_BLOCKED_EXECUTION'))
    assert len(octane)==17;csvout(out/'octane_pending.csv',octane)
    assert not list((HERE/'mechanism/raw/formal').glob('**/*.json'))
    assert not list((HERE/'octane/raw/formal').glob('**/*.json'))
    # Compare replay outputs, rather than trusting a prior success claim.
    original=OLD/'summary_v2';replay=HERE/'legacy_replay';replay_check={p.name:sha(p)==sha(replay/p.name) for p in original.iterdir() if p.is_file()}
    assert len(replay_check)==12 and all(replay_check.values())
    save(out/'legacy_replay_check.json',replay_check)
    count_raw=list((HERE/'mechanism/raw/light_diagnostic').rglob('*.counters.json'))
    audit=dict(status='BLOCKED_EXECUTION_UNRELIABLE',old_sparse_valid=44,old_sparse_expected=68,old_dense_separate=41,
        legacy_replay='PASS_12_BYTE_IDENTICAL_FILES',new_legacy_style_Splay_diagnostics=4,new_light_Splay_diagnostics=2,
        controller_correctness_valid=16,controller_correctness_expected=16,controller_counter_gate_valid=len(count_raw),controller_counter_gate_expected=6,
        OFF_ordinary_read_counters_verified=None,controller_gate='INCOMPLETE',mechanism_formal_valid=0,mechanism_formal_expected=240,
        octane_formal_valid=0,octane_formal_expected_without_OPT=1530,replication_formal_valid=0,replication_expected_without_OPT=120,
        OPT='NOT_IMPLEMENTED_WITH_REASON',OPT_reason='mechanism not complete after repeated unclassified WSL/client interruption; no effect-based candidate chosen',
        shapes_observed_in_saved_Splay_Run=2,shape_detail_truncation='first128 transitions only; frequencies/layouts complete for this workload',
        success_of_final_counterpart_process=None,orphaned_positions=len(orphan),root_cause='UNKNOWN',OOM='UNKNOWN',engine_crash='UNKNOWN',
        last_host_observation='Ubuntu Stopped; host query only, no restart',post_interruption_artifact_identity='UNKNOWN_NOT_RECHECKED',
        WSL_or_security_settings_changed=False,old_worker_restarted=False,private_source_required=False)
    save(out/'audit.json',audit)
    save(HERE/'progress.json',audit)
    # Hash the actual saved evidence; later analysis can verify it offline.
    paths=[p for root in [HERE/'recovery',HERE/'splay_recovery',HERE/'last_recovery',HERE/'mechanism/raw',HERE/'builds'] for p in root.rglob('*') if p.is_file()]
    save(out/'evidence_hashes.json',{p.relative_to(HERE).as_posix():sha(p) for p in sorted(paths)})
    print(json.dumps(dict(status=audit['status'],correctness=len(correctness),shape_detail_processes=2,controller_counter_gate=len(count_raw),mechanism_formal=0,octane_formal=0,legacy_replay='12/12 byte-identical'),ensure_ascii=True))

if __name__=='__main__':main()
