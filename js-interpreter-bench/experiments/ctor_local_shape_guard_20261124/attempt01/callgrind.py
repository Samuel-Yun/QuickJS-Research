"""Profile the same Release script and attribute prototype-check instructions."""
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

from build import HERE,LABELS,save,sha
from run import binary,ENV


def main():
    os.sched_setaffinity(0,{2})
    out=HERE/'callgrind';out.mkdir(exist_ok=False)
    if not shutil.which('valgrind'):
        save(out/'summary.json',dict(status='UNAVAILABLE',reason='valgrind not installed'));return
    rows=[]
    for label in LABELS:
        exe=binary(label,'release')
        symbols=subprocess.check_output(['nm','-an',exe],text=True)
        (out/(label+'.symbols.txt')).write_text(symbols)
        path=out/(label+'.out')
        cmd=['valgrind','--tool=callgrind','--collect-atstart=yes',
             '--error-exitcode=97','--callgrind-out-file='+str(path),exe,str(HERE/'ctor.js'),'positive','100','65536']
        start=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True,env=ENV,timeout=300)
        row=dict(label=label,command=cmd,binary_sha256=sha(exe),exit_code=r.returncode,stdout=r.stdout,
            stderr=r.stderr,external_wall_ms=1000*(time.monotonic()-start),wall_time_not_a_performance_result=True)
        save(out/(label+'.run.json'),row)
        assert r.returncode==0,row
        payload=json.loads(r.stdout);assert payload['checksum']==3*65536
        data=path.read_text();events=next(s.split()[1:] for s in data.splitlines() if s.startswith('events:'))
        summary=next([int(x) for x in s.split()[1:]] for s in data.splitlines() if s.startswith('summary:'))
        counts=dict(zip(events,summary));assert 'Ir' in counts and counts['Ir']>0
        row=dict(label=label,instructions_Ir=counts['Ir'],scope='whole script; target functions separately attributed',
                 iterations=65536,positive_hits_expected=65534)
        annotation=subprocess.run(['callgrind_annotate','--auto=no','--threshold=100',str(path)],capture_output=True,text=True,check=True)
        (out/(label+'.annotated.txt')).write_text(annotation.stdout)
        row['target_function_lines']=[s for s in annotation.stdout.splitlines() if any(n in s for n in ['plan_proto','plan_chain','plan_try','JS_CallInternal'])]
        rows.append(row);print('CALLGRIND',row,flush=True)
    pct=100*(rows[1]['instructions_Ir']/rows[0]['instructions_Ir']-1)
    save(out/'summary.json',dict(status='PASS',rows=rows,instruction_change_percent=pct,
        scope='whole script plus plan_proto/plan_chain source attribution; native SPARSE plan_try is inlined, so no common native toggle entry',
        instructions_not_native_elapsed_time=True))


if __name__=='__main__':main()
