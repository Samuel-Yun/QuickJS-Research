"""A/B correctness first; upstream tests and sanitizers are separate builds."""
import argparse
import json
from pathlib import Path
import subprocess
from build import A,B,STORE,capture
from prepare_sources import HERE,ROOT,save,sha

def main():
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['regression','sanitizer']);args=ap.parse_args()
    if args.stage=='regression':
        rows=[]
        for name,src in [('A',A),('B',B)]:
            r=capture(name+'_regression',[src/'qjs',HERE/'correctness/regression.js'])
            assert r['exit_code']==0 and 'IC_REGRESSION_PASS' in r['stdout'],r
            rows.append(dict(version=name,kind='mechanism',valid=True,stdout=r['stdout']))
            for p in sorted((ROOT/'benchmarks/smoke').glob('*.js')):
                r=capture(name+'_smoke_'+p.stem,[src/'qjs',p])
                assert r['exit_code']==0
                rows.append(dict(version=name,kind=p.stem,valid=True,stdout=r['stdout']))
        for kind in {r['kind'] for r in rows}:
            rs=[r for r in rows if r['kind']==kind];assert len(rs)==2 and rs[0]['stdout']==rs[1]['stdout']
        save(HERE/'correctness/regressions.json',rows)
    else:
        import shutil
        for name,src in [('A',A),('B',B)]:
            dest=STORE/(name+'_sanitizer')
            if not dest.exists():
                shutil.copytree(HERE/'sources/base',dest)
                if name=='B':
                    for f in ['quickjs.c','quickjs-opcode.h','LICENSE.NG']:shutil.copyfile(src/f,dest/f)
            r=capture(name+'_sanitizer_build',['make','-j2','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],dest)
            assert r['exit_code']==0
            r=capture(name+'_sanitizer_regression',[dest/'qjs',HERE/'correctness/regression.js'])
            assert r['exit_code']==0 and 'IC_REGRESSION_PASS' in r['stdout'] and not r['stderr']
        save(HERE/'correctness/sanitizer.json',dict(status='PASS',tools=['GCC AddressSanitizer','UndefinedBehaviorSanitizer'],
            scope='targeted mechanism regression, A and B; not full test262 or Octane sanitizer campaign',
            allocation_failure_injection='NOT_YET_TESTED'))

if __name__=='__main__':main()
