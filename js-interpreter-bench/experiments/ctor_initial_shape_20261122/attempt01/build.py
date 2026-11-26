"""Build from the 7c941da round-two source definitions; keep parents intact."""
import argparse
import difflib
import importlib.util
import json
from pathlib import Path
import shutil
import subprocess

import candidates
from run import HERE,ROOT,PACKAGE,sha,save

PREV=ROOT/'experiments/ic_screen_round2_20261122/attempt01'


def load(name,path):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m


previous=load('initial_round2_build',PREV/'build.py')
previous.candidates=load('initial_round2_candidates',PREV/'candidates.py')
diagnostic=load('initial_diagnostic',HERE/'diagnostic.py')
PARENTS={'SPARSE':'SPARSE','P2':'OLD_P2','P2_COLD':'P2_COLD','INIT_FREE':'SPARSE',
         'P2_COLD_INIT':'P2_COLD','P2_KEEP_PRIMARY':'OLD_P2'}
LABELS=['INIT_FREE','P2_COLD_INIT','P2_KEEP_PRIMARY']


def source(label,mode):
    base,d,identity=previous.source(PARENTS[label],'release')
    parent=dict(d)
    if label in ['INIT_FREE','P2_COLD_INIT']:candidates.init_free(d)
    if label=='P2_KEEP_PRIMARY':candidates.keep_primary(d)
    if mode=='diag':diagnostic.instrument(d,HERE,label)
    return base,parent,d,identity


def main():
    p=argparse.ArgumentParser();p.add_argument('--labels',nargs='+',default=['SPARSE','P2','P2_COLD'])
    p.add_argument('--modes',nargs='+',default=['release','diag']);args=p.parse_args()
    (HERE/'patches').mkdir(exist_ok=True)
    for label in args.labels:
        for mode in args.modes:
            manifest=HERE/(label+'.'+mode+'.manifest.json')
            if manifest.exists():
                m=json.loads(manifest.read_text());assert sha(m['binary'])==m['binary_sha256'];print('EXISTS',label,mode,flush=True);continue
            try:
                base,parent,d,identity=source(label,mode);target=HERE/'work'/(label+'.'+mode)
                if target.exists():shutil.rmtree(target)
                target.mkdir(parents=True)
                for n,s in d.items():
                    q=target/n;q.parent.mkdir(parents=True,exist_ok=True)
                    q.write_bytes(s.replace('\n','\r\n' if identity['modified_line_endings'].get(n)=='CRLF' else '\n').encode())
                if mode=='release' and label not in ['SPARSE','P2','P2_COLD']:
                    for title,before in [('SPARSE-to-'+label,base),(PARENTS[label]+'-to-'+label,parent)]:
                        patch=''.join(''.join(difflib.unified_diff(before.get(n,'').splitlines(True),d[n].splitlines(True),
                            fromfile='a/'+n if n in before else '/dev/null',tofile='b/'+n)) for n in d if before.get(n)!=d[n])
                        (HERE/'patches'/(title+'.patch')).write_text(patch)
                cmd=['make','-j2','-o','repl.c','qjs','qjsc']
                with (HERE/(label+'.'+mode+'.build.log')).open('w') as log:
                    subprocess.run(cmd,cwd=target,stdout=log,stderr=subprocess.STDOUT,check=True)
                save(manifest,dict(label=label,mode=mode,parent=PARENTS[label],instrumented=mode!='release',
                    binary=str(target/'qjs'),binary_sha256=sha(target/'qjs'),command=cmd,
                    sources={n:sha(target/n) for n in d}))
                print('BUILD_PASS',label,mode,flush=True)
            except Exception as e:
                save(HERE/(label+'.'+mode+'.failure.json'),dict(error=repr(e)))
                print('BUILD_FAIL',label,mode,repr(e),flush=True)


if __name__=='__main__':main()
