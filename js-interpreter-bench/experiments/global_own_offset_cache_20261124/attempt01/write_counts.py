"""Supplementary Splay mechanism count; never modifies/times a Release binary."""
import difflib
import json
import os
from pathlib import Path
import shutil
import subprocess

from build import HERE,LABELS,save,sha,once
from run import TESTS,CATALOG,ENV,validator


def main():
    os.sched_setaffinity(0,{2});out=HERE/'write_counts';out.mkdir(exist_ok=False)
    result=[];case=next(c for c in CATALOG['cases']['octane'] if c['name']=='Splay')
    for label in LABELS:
        parent=json.loads((HERE/f'{label}.counts.manifest.json').read_text());src=Path(parent['binary']).parent
        dest=out/label;dest.mkdir()
        for n,h in parent['sources'].items():
            assert sha(src/n)==h,n
            p=dest/n;p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src/n,p)
        before={n:(dest/n).read_text() for n in ['quickjs.c','global_own_diag.inc']}
        q=before['quickjs.c'];start=q.index('        CASE(OP_put_field_shared):');end=q.index('        CASE(OP_put_field):',start)
        part=q[start:end]
        part=once(part,'            {','            {\n                go_shared_writes[0]++;')
        part=once(part,'                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);',
            '                            go_shared_writes[1]++;\n                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);')
        part=once(part,'                sf->cur_pc = pc;',
            '                go_shared_writes[2]++;\n                sf->cur_pc = pc;')
        q=q[:start]+part+q[end:]
        h=once(before['global_own_diag.inc'],'static uint64_t go_totals[GO_EVENT_END];',
            'static uint64_t go_shared_writes[3];\nstatic uint64_t go_totals[GO_EVENT_END];')
        anchor='    fprintf(out,",\\"layout\\":{\\"JSRuntime\\":%zu'
        pos=h.index(anchor)
        h=h[:pos]+'''    fprintf(out,",\\"shared_write\\":{\\"attempts\\":%" PRIu64 ",\\"hits\\":%" PRIu64 ",\\"fallbacks\\":%" PRIu64 "}",
        go_shared_writes[0],go_shared_writes[1],go_shared_writes[2]);
'''+h[pos:]
        after={'quickjs.c':q,'global_own_diag.inc':h}
        for n,text in after.items():(dest/n).write_text(text)
        (out/(label+'.diagnostic.patch')).write_text(''.join(''.join(difflib.unified_diff(before[n].splitlines(True),after[n].splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in after))
        cmd=['make','-j2','-o','repl.c','qjs']
        with (out/(label+'.build.log')).open('w') as log:subprocess.run(cmd,cwd=dest,stdout=log,stderr=subprocess.STDOUT,check=True)
        env=dict(ENV,GO_OUTPUT=str(out/(label+'.counts.json')))
        cmd=[str(dest/'qjs'),str(TESTS/case['path'])]
        r=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=300)
        row=dict(label=label,command=cmd,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,diagnostic_only=True)
        save(out/(label+'.run.json'),row);assert r.returncode==0 and not r.stderr,row
        ps=[json.loads(s[len('OCTANE_IC_RESULT:'):]) for s in r.stdout.splitlines() if s.startswith('OCTANE_IC_RESULT:')]
        assert len(ps)==1;validator.validate(ps[0],'octane',case)
        d=json.loads((out/(label+'.counts.json')).read_text());w=d['shared_write'];assert w['attempts']==w['hits']+w['fallbacks']
        result.append(dict(label=label,shared_write=w,read_totals=d['totals'],binary_sha256=sha(dest/'qjs')))
        print('SHARED_WRITE_COUNTS',label,w,flush=True)
    save(out/'summary.json',dict(status='PASS',case='Splay',rows=result,not_a_performance_measurement=True,
        Release_files_unchanged=True,VM_and_diagnostic_record_sizes_unchanged=True))


if __name__=='__main__':main()
