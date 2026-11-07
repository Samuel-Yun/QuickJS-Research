"""Remaining frozen P1 rounds, bounded signal rechecks, and portable final outputs."""
import importlib
import json
import csv
import gzip
import hashlib
from pathlib import Path
import statistics as st
import sys

r=sys.modules.get('__main__')
if not r or not hasattr(r,'H'): r=importlib.import_module('run')
import builder
e,H=r.e,r.H
LABELS=['IO2_LAYOUT','IO2_DIRECT','IO4_LAYOUT','IO4_DIRECT','AQ1','AP1','ST1']


def analysis():
    e.load_module('v7_finish_analysis',H/'analyze.py').analyze()


def readcsv(name):
    return list(csv.DictReader((H/name).open(encoding='utf-8')))


def rechecks():
    analysis()
    path=H/('recheck_selection.'+e.EPOCH+'.json')
    if path.exists(): return e.lab.load(path)
    tables=readcsv('comparison_octane.csv')+readcsv('comparison_sunspider.csv')
    aggregates=readcsv('aggregate.csv')
    evaluations=[]
    for label in LABELS:
        campaign='screen_'+label+'_'+e.EPOCH
        rows=[x for x in tables if x['campaign']==campaign and x['condition']==label]
        complete=len(rows)==43 and all(x['rounds']=='1' for x in rows)
        gains=[x['benchmark']+'/'+x['case'] for x in rows if x.get('over_parent') and float(x['over_parent'])<=0.95]
        agg=[x for x in aggregates if x['campaign']==campaign and x['condition']==label and x['denominator']==builder.variants.PARENTS[label]]
        suite_signal=any(float(x['time_ratio'])<=0.98 for x in agg)
        rank=next((float(x['time_ratio']) for x in aggregates if x['campaign']==campaign and x['condition']==label and
                   x['denominator']=='s001' and x['subset']=='expanded17_14suite'),None)
        evaluations.append(dict(label=label,complete=complete,case_signals=gains,suite_signal=suite_signal,
             qualifies=complete and bool(gains or suite_signal),selection_rank_expanded_octane_over_s001=rank))
    selected=[]
    for direction in [['IO2_LAYOUT','IO2_DIRECT','IO4_LAYOUT','IO4_DIRECT'],['AQ1'],['AP1'],['ST1']]:
        eligible=[x for x in evaluations if x['label'] in direction and x['qualifies']]
        if eligible:
            selected.append(min(eligible,key=lambda x:x['selection_rank_expanded_octane_over_s001'])['label'])
    value=dict(selected=selected,evaluations=evaluations,rounds=3,maximum=4,
       rule='any case/parent <=.95 or suite GM/parent <=.98; one per direction; IO chooses lowest expanded Octane/s001 point',
       timing_quality='EXPLORATORY_CLOCK_LIMITED',not_statistical_significance=True)
    r.save(path.name,value);return value


def memory():
    if (H/('memory_counts.'+e.EPOCH+'.json')).exists() and (H/('memory_rss.'+e.EPOCH+'.json')).exists():
        return
    results=[]
    info=e.lab.load(H/'octane.inputs.json')
    for label in ([] if (H/('memory_counts.'+e.EPOCH+'.json')).exists() else ['IO_BASE_STATS','IO2_STATS','IO4_STATS']):
        if not (H/'identities'/(label+'.json')).exists(): builder.build(label)
        for case in ['Richards.Richards','Splay.Splay','CodeLoad.CodeLoadClosure']:
            script=e.measure.script(info,case,1,'v7_memory')
            out=e.capture([e.measure.artifact(label)['path'],script],'memory_probe',label+'/'+case,90)
            assert out['exit_code']==0 and '"correctness":"PASS"' in out['stdout']
            record=json.loads(next(x[len('V7_IO_STATS '):] for x in out['stderr'].splitlines() if x.startswith('V7_IO_STATS ')))
            coverage=next((x.split()[1:] for x in out['stderr'].splitlines() if x.startswith('V7_IO_COVERAGE ')),None)
            if coverage:
                record.update(own_ic_hits=int(coverage[0]),inline_own_ic_hits=int(coverage[1]))
            policy=next((x.split()[2:] for x in out['stderr'].splitlines() if x.startswith('V7_POLICY ')),None)
            if policy: record['read_activity']={key:int(value) for key,value in (t.split('=') for t in policy)}
            results.append(dict(label=label,case=case,counts=record,token=out['token'],scope='whole process N1; includes setup/validation/cleanup'))
    if results: r.save('memory_counts.'+e.EPOCH+'.json',results)
    rss=[]
    for label in ['A','s001','IO2_LAYOUT','IO4_LAYOUT']:
        for case in ['Richards.Richards','Splay.Splay']:
            for rep in range(3):
                script=e.measure.script(info,case,1,'v7_memory')
                out=e.capture(['/usr/bin/time','-f','V7_RSS:%M',e.measure.artifact(label)['path'],script],
                              'memory_probe',label+'/'+case+'/'+str(rep),90)
                assert out['exit_code']==0 and '"correctness":"PASS"' in out['stdout']
                kib=int(next(x.split(':')[1] for x in out['stderr'].splitlines() if x.startswith('V7_RSS:')))
                rss.append(dict(label=label,case=case,rep=rep,peak_rss_kib=kib if kib>0 else None,
                                raw_gnu_time_value=kib,valid=kib>0,token=out['token']))
    r.save('memory_rss.'+e.EPOCH+'.json',rss)


def mechanisms():
    if (H/('mechanism_counts.'+e.EPOCH+'.json')).exists(): return
    rows=[];info=e.lab.load(H/'octane.inputs.json')
    for parent in ['AQ1','AP1','ST1']:
        if not (H/('sanitizer.'+parent+'.json')).exists() or e.lab.load(H/('sanitizer.'+parent+'.json'))['status']!='PASS': continue
        label=parent+'_STATS'
        try:
            # Exact formal source is verified before adding diagnostic-only counters.
            expected=e.lab.load(H/'identities'/(parent+'.json'))['source_sha256']
            assert {n:hashlib.sha256(v.encode()).hexdigest() for n,v in builder.files(parent).items()}==expected
            if not (H/'identities'/(label+'.json')).exists(): builder.build(label)
            for case in ['Richards.Richards','Splay.Splay','CodeLoad.CodeLoadClosure']:
                script=e.measure.script(info,case,1,'v7_memory')
                out=e.capture([e.measure.artifact(label)['path'],script],'memory_probe',label+'/'+case,90)
                assert out['exit_code']==0 and '"correctness":"PASS"' in out['stdout']
                words=next(s.split()[2:] for s in out['stderr'].splitlines() if s.startswith('V7_POLICY '))
                counts={k:int(v) for k,v in (word.split('=') for word in words)}
                assert counts['read_queries']==counts['read_hits']+counts['read_fallback']
                if parent=='AP1': assert counts['mono_active']==counts['live_bytes']==counts['blocks_live']==0
                if parent=='ST1': assert counts['store_queries']==sum(counts[k] for k in ['transition_hits','transition_oom','existing_own_fast','generic_set'])
                rows.append(dict(parent=parent,label=label,case=case,counts=counts,status='PASS',token=out['token'],
                                  scope='whole process N1 including setup/validation/cleanup; not timed-region counts'))
        except Exception as error:
            rows.append(dict(parent=parent,label=label,status='DIAGNOSTIC_INCOMPLETE',error=str(error)))
            e.gate()
    r.save('mechanism_counts.'+e.EPOCH+'.json',rows)


def upstream():
    if (H/('upstream.'+e.EPOCH+'.json')).exists():
        assert all(x['pass_'] for x in e.lab.load(H/('upstream.'+e.EPOCH+'.json')))
        return
    results=[]
    for label in LABELS:
        if not (H/('sanitizer.'+label+'.json')).exists() or e.lab.load(H/('sanitizer.'+label+'.json'))['status']!='PASS': continue
        for name in ['test_language.js','test_builtin.js']:
            source=e.lab.ROOT/'engines/quickjs-upstream/tests'/name
            out=e.capture([e.measure.artifact(label)['path'],'--std',source],'upstream_test',label+'/'+name,90,
                           dict(test_sha256=e.lab.sha(source)))
            results.append(dict(label=label,test=name,pass_=out['exit_code']==0 and not out['stderr'],token=out['token']))
    r.save('upstream.'+e.EPOCH+'.json',results)
    assert all(x['pass_'] for x in results)


def oom_pressure():
    name='oom_pressure.'+e.EPOCH+'.json'
    if (H/name).exists():
        if e.lab.load(H/name)['status']!='PASS':
            followup=H/('oom_followup.'+e.EPOCH+'.json')
            assert followup.exists(),'Original OOM failure retained; complete its bounded followup first'
            evidence=e.lab.load(followup)
            assert evidence['complete_oom_safety_proven'] is False
            # All performance is already complete; this continues only descriptive
            # diagnostics/reporting, not acceptance or another performance campaign.
            assert not e.lab.load(H/('keeper_selection.'+e.EPOCH+'.json'))['nominal_candidates']
            print('OOM_LIMITATION_RETAINED_NO_CANDIDATE_PROMOTION',evidence['status'],flush=True)
        return
    rows=[]
    for label in LABELS:
        path=H/'artifacts'/(label+'.sanitized.qjs')
        if not path.exists(): continue
        for limit in [524288,1048576]:
            out=e.capture(['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1',
                'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1',path,'--std',
                '--memory-limit',str(limit),H/'oom_pressure.js'],
                'allocation_pressure',label+'/'+str(limit),30)
            rows.append(dict(label=label,limit_bytes=limit,token=out['token'],
                pass_=out['exit_code']==0 and not out['stderr'] and out['stdout']=='V7_OOM_PRESSURE_PASS\n'))
    status='PASS' if len(rows)==14 and all(x['pass_'] for x in rows) else 'FAIL'
    r.save(name,dict(status=status,checks=rows,
        scope='bounded memory pressure and recovery; not exhaustive per-allocation fault injection',
        added_after_initial_screens=True,performance_result=False))
    assert status=='PASS','Allocation-pressure evidence saved; review failures'


def native():
    if (H/('native.'+e.EPOCH+'.json')).exists(): return
    import subprocess
    rows=[]
    for label in ['s001','IO2_LAYOUT','IO2_DIRECT']:
        art=e.measure.artifact(label)
        out=e.capture(['objdump','-d','-Mintel','--disassemble=JS_CallInternal',art['path']],
                       'native_inspection',label+'/JS_CallInternal',60,dict(binary_sha256=art['sha256']))
        assert out['exit_code']==0
        payload=out['stdout'].encode();packed=gzip.compress(payload,mtime=0)
        name='raw/'+label+'.JS_CallInternal.asm.gz'
        r.save(name,packed)
        rows.append(dict(label=label,file=name,binary_sha256=art['sha256'],
              uncompressed_sha256=hashlib.sha256(payload).hexdigest(),native_path_execution='UNKNOWN'))
    r.save('native.'+e.EPOCH+'.json',rows)


def run():
    assert r.WARN_CLOCK
    keeper=H/('keeper_selection.'+e.EPOCH+'.json')
    if keeper.exists() and not e.lab.load(keeper)['nominal_candidates']:
        audits=e.lab.load(H/'audit.json')
        current=[a for a in audits if a['timing_quality']=='EXPLORATORY_CLOCK_LIMITED']
        assert current and all(a['status']=='COMPLETE' and not a['failed_measurements'] for a in current)
        final_stages()
        return
    # P1 protocol was frozen before its first sample. Resume only valid positions.
    r.sample('p1_'+e.EPOCH,['A','s001','P1'],5,5)
    analysis()
    selection=rechecks()
    for label in selection['selected']:
        labels=list(dict.fromkeys(['A','s001',builder.variants.PARENTS[label],label]))
        if label=='AP1' and (H/'identities/a02.json').exists(): labels.append('a02')
        r.sample('recheck_'+label+'_'+e.EPOCH,labels,3,3)
        analysis()
    # Clock-limited data cannot establish a credible keeper: no 30-process promotion.
    # Five extra rounds are conditional on a clearly broad, repeatable nominal improvement.
    aggregates=readcsv('aggregate.csv')
    keep=[]
    for label in selection['selected']:
        case='recheck_'+label+'_'+e.EPOCH
        octane=next((x for x in aggregates if x['campaign']==case and x['condition']==label and x['denominator']=='s001' and x['subset']=='expanded17_14suite'),None)
        sun=next((x for x in aggregates if x['campaign']==case and x['condition']==label and x['denominator']=='s001' and x['subset']=='26cases'),None)
        if octane and sun and float(octane['time_ratio'])<=.98 and float(sun['time_ratio'])<=1:
            keep.append((float(octane['time_ratio']),label))
    r.save('keeper_selection.'+e.EPOCH+'.json',dict(nominal_candidates=keep,
          reliable_speedup_confirmed=False,reason='clock-limited exploration; any extra batch remains exploratory'))
    if keep:
        label=min(keep)[1]
        labels=list(dict.fromkeys(['A','s001',builder.variants.PARENTS[label],label]))
        r.sample('independent_'+label+'_'+e.EPOCH,labels,5,5)
    final_stages()


def final_stages():
    upstream()
    oom_pressure()
    memory()
    mechanisms()
    native()
    analysis()
    e.load_module('v7_final_report',H/'report.py').write()
    print('FINISH_REQUESTED_STAGES_COMPLETE',flush=True)
