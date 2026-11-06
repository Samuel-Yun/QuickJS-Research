"""Independent GNU time RSS observations, not performance samples."""
import json
import random
import experiment as e
assert e.DIAGNOSTIC_ONLY
e.os.sched_setaffinity(0,{2})
labels=['A','s001','ID_CTRL','ID_READ','W1','P1','L1']
cases=['Splay.Splay','CodeLoad.CodeLoadClosure','Typescript.Typescript']
rows=[];rng=random.Random(e.SEED)
info=e.lab.load(e.H/'octane.inputs.json')
for case in cases:
    path=e.measure.script(info,case,1,'memory_only')
    for rep in range(3):
        order=list(labels);rng.shuffle(order)
        for label in order:
            a=e.measure.artifact(label)
            r=e.capture(['/usr/bin/time','-f','V6_RSS:%M',a['path'],path],'memory_probe',
                case+'/'+label+'/'+str(rep),120,dict(binary_sha256=a['sha256'],script_sha256=e.lab.sha(path),N=1,performance_sample=False))
            line=[s for s in r['stderr'].splitlines() if s.startswith('V6_RSS:')]
            assert r['exit_code']==0 and len(line)==1,r['stderr']
            payload=json.loads(next(s[len('OCTANE_IC_RESULT:'):] for s in r['stdout'].splitlines() if s.startswith('OCTANE_IC_RESULT:')))
            assert payload['correctness']=='PASS'
            rows.append(dict(case=case,condition=label,rep=rep,N=1,peak_rss_kib=int(line[0].split(':')[1]),token=r['token']))
        print('MEMORY',case,rep,'complete',flush=True)
e.csvout('memory_raw.csv',rows)
summary=[]
for case in cases:
    for label in labels:
        values=[r['peak_rss_kib'] for r in rows if r['case']==case and r['condition']==label]
        summary.append(dict(case=case,condition=label,n=3,N=1,median_peak_rss_kib=e.statistics.median(values),
                            min_kib=min(values),max_kib=max(values),values_kib=json.dumps(values)))
e.csvout('memory_summary.csv',summary)
e.save('memory_complete.json',dict(status='COMPLETE',valid=len(rows),unit='KiB',
    method='/usr/bin/time %M, not wait4 wrapper value',scope='whole new process N1',
    limitations='3 samples, not formal selected N, includes all VM/benchmark allocations and indirect retention'))
