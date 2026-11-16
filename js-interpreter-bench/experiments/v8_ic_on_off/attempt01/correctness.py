"""Only N1/N2 and clock capability. No pilot, calibration, or formal time table."""
import shutil
from common import *
ADAPTER='''// Captured before benchmark loading. No engine-dependent target branch.
;(function () {
  var clockObject=performance, clockFunction=performance.now;
  if(typeof clockFunction!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icNow",{value:clockFunction.bind(clockObject)});
})();
'''
def script(case,n):
 if case=='Richards':
  files=[ROOT/'benchmarks/octane/upstream'/s for s in ['base.js','richards.js']];body=b'\n;\n'.join(p.read_bytes() for p in files)
  setup='var suite=BenchmarkSuite.suites[0], test=suite.benchmarks[0]; if(test.run!==runRichards)throw Error("Run identity"); BenchmarkSuite.ResetRNG(); test.Setup(); var run=test.run;'
  validation='test.TearDown();';expected='null'
 else:
  key='M1.own_integer' if case=='own_integer' else 'M4.numeric_control';body=(HERE/'cases'/(key+'.js')).read_bytes();setup='var run=microRun;';validation='microValidate(last);if(checksum!==count*'+str(12288 if case=='own_integer' else 8386560)+')throw Error("checksum");';expected='checksum'
 driver='''
;(function(){var count=__N__,last,checksum=0;__SETUP__
 for(var i=0;i<count;i++){last=run();__SUM__}
 __VALIDATE__
 console.log("CORRECTNESS:"+JSON.stringify({case:__CASE__,N:count,correctness:"PASS",checksum:__CHECKSUM__,warmup_calls:0,timing_sample:false}));
})();
'''.replace('__N__',str(n)).replace('__SETUP__',setup).replace('__SUM__','' if case=='Richards' else 'checksum+=last;microValidate(last);').replace('__VALIDATE__',validation).replace('__CASE__',json.dumps(case)).replace('__CHECKSUM__',expected)
 p=HERE/'probes/correctness'/f'{case}.N{n}.js';save(p,ADAPTER.encode()+body+driver.encode());return p
def main():
 ids=read(NATIVE/'manifest.final.json')['inputs']
 for key in ['M1.own_integer','M4.numeric_control']:
  p=NATIVE/'cases'/(key+'.js');assert sha(p)==ids[p.relative_to(ROOT).as_posix()];dest=HERE/'cases'/p.name;dest.parent.mkdir(exist_ok=True);shutil.copy2(p,dest)
 old=read(OLD/'manifest.json')['inputs'];sources={}
 for name in ['base.js','richards.js','LICENSE']:
  p=ROOT/'benchmarks/octane/upstream'/name;assert sha(p)==old[p.relative_to(ROOT).as_posix()];sources[name]=sha(p)
 # Source review: runRichards itself (not its nested constructors/methods) never reads this.
 text=(ROOT/'benchmarks/octane/upstream/richards.js').read_text();runbody=text[text.index('function runRichards()'):text.index('\nvar COUNT =')];assert not re.search(r'\bthis\b',runbody)
 save(HERE/'inputs.json',dict(octane_revision='570ad1ccfe86e3eecba0636c8f932ac08edec517',octane_files=sources,micro_files={p.name:sha(p) for p in (HERE/'cases').glob('*.js')},captured_run='local run reference; no repeated test.run property access',Richards_this_review='runRichards body contains no this access; Setup/TearDown keep test receiver',Richards_original_assertions=dict(queueCount=2322,holdCount=928),formal_scripts_frozen=False,formal_N=None))
 rows=[];commands=prefixes()
 for case in CASES:
  for n in [1,2]:
   p=script(case,n)
   for c in CONDITIONS:
    r=capture(f'correctness_{case}_N{n}_{c}',commands[c]+[p]);found=re.findall(r'^CORRECTNESS:(.*)$',r['stdout'],re.M);valid=r['exit_code']==0 and not r['stderr'] and len(found)==1
    payload=json.loads(found[0]) if found else {};valid=valid and payload.get('correctness')=='PASS'
    rows.append(dict(case=case,N=n,condition=c,valid=valid,exit_code=r['exit_code'],script_sha256=sha(p),checksum=payload.get('checksum')))
 save(HERE/'correctness/results.json',rows);assert len(rows)==18 and all(r['valid'] for r in rows)
 clock=HERE/'probes/clock.js';save(clock,ADAPTER+'''
var values=[],t0=__icNow(),t=t0; for(var i=0;i<10000;i++){var next=__icNow();if(next<t)throw Error("nonmonotonic");t=next;} var stop=__icNow();
console.log("CLOCK:"+JSON.stringify({start_ms:t0,stop_ms:stop,elapsed_ms:stop-t0,calls:10002,timing_sample:false}));
''')
 for c in CONDITIONS:
  r=capture('clock_'+c,commands[c]+[clock]);assert r['exit_code']==0 and not r['stderr']
 print('CORRECTNESS_18_AND_CLOCK_3_PASS',flush=True)
if __name__=='__main__':main()
