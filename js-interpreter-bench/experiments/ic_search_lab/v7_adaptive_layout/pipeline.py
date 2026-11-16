"""Serial bounded continuation. Invoked through run.py, never parallel builds/timing."""
import csv
import importlib
import json
from pathlib import Path
import sys
import traceback

r=sys.modules.get('__main__')
if not r or not hasattr(r,'H'): r=importlib.import_module('run')
import builder
e,H=r.e,r.H


def note(label,status,**extra):
    e.lab.append(dict(event='candidate_progress',epoch=e.EPOCH,label=label,status=status,
                      timestamp=e.lab.stamp(),**extra))
    print('CANDIDATE',label,status,json.dumps(extra),flush=True)


def diagnostic_io():
    label='IO_DIAG'
    if not (H/'identities'/f'{label}.json').exists(): builder.build(label)
    info=e.lab.load(H/'octane.inputs.json')
    rows=[]
    for case in ['Richards.Richards','Splay.Splay']:
        script=e.measure.script(info,case,1,'v7_io_hist')
        result=e.capture([e.measure.artifact(label)['path'],script],'memory_probe',label+'/'+case,60)
        assert result['exit_code']==0,result['stderr']
        assert '"correctness":"PASS"' in result['stdout']
        line=next(s[len('V7_IO_HIST '):] for s in result['stderr'].splitlines() if s.startswith('V7_IO_HIST '))
        hist=json.loads(line)
        rows.append(dict(case=case,scope='whole process including setup/validation/cleanup; N1',
                         token=result['token'],histogram=hist,performance_result=False))
    r.save('io_histogram.json',rows)
    print('IO_HISTOGRAM_COMPLETE',flush=True)


def candidate(label):
    campaign='screen_'+label+'_'+e.EPOCH
    if not (H/'identities'/(label+'.json')).exists():
        note(label,'BUILD_BEGIN')
        builder.build(label)
    assert e.lab.load(H/('correctness.'+label+'.json'))['status']=='PASS'
    if not (H/('sanitizer.'+label+'.json')).exists(): builder.safety(label)
    assert e.lab.load(H/('sanitizer.'+label+'.json'))['status']=='PASS'
    labels=list(dict.fromkeys(['A','s001',builder.variants.PARENTS[label],label]))
    if label=='AP1':
        identity_path=H.parent/'v5_structural/identities/a02.json'
        if identity_path.exists():
            ident=e.lab.load(identity_path)
            if Path(ident['path']).exists() and e.lab.sha(ident['path'])==ident['sha256']:
                r.save('identities/a02.json',ident);labels.append('a02')
    r.sample(campaign,labels,1,1)
    # Analysis does not load a runtime or affect the next process's workload.
    analysis=e.load_module('v7_pipeline_analysis',H/'analyze.py')
    analysis.analyze()
    note(label,'SCREEN_COMPLETE',samples=43*len(labels),campaign=campaign)


def run(labels):
    assert r.WARN_CLOCK
    if labels==['all']:
        labels=['IO2_LAYOUT','IO2_DIRECT','IO4_LAYOUT','IO4_DIRECT','AQ1','AP1','ST1']
    for label in labels:
        try:
            if label=='IO2_LAYOUT' and not (H/'io_histogram.json').exists(): diagnostic_io()
            candidate(label)
        except Exception as error:
            note(label,'FAILED_PRESERVED',error=str(error),traceback=traceback.format_exc())
            # Identity/boot corruption stops the entire batch, not merely one candidate.
            e.gate()
            if 'BOOT_CHANGED' in str(error): raise
    print('PIPELINE_REQUESTED_CANDIDATES_FINISHED',flush=True)
