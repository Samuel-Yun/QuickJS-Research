"""Bounded independent IC observation; never performance sampling."""
import concurrent.futures,urllib.request
from common import *
REV='37fb84941c9be9f9914ee50b1ad366f06a1bd764'
def fetch():
 paths=['src/flags/flag-definitions.h','src/ic/ic.cc','src/runtime/runtime-test.cc','src/ic/accessor-assembler.cc','src/interpreter/interpreter-generator.cc']
 def one(path):
  url='https://raw.githubusercontent.com/v8/v8/'+REV+'/'+path;r=dict(url=url,reference_commit=REV,artifact_commit_proven=False,timestamp=stamp())
  try:
   with urllib.request.urlopen(url,timeout=20) as response:b=response.read()
   dest=HERE/'source'/path;save(dest,b);r.update(status='PASS',sha256=sha(dest),bytes=len(b))
  except Exception as e:r.update(status='UNAVAILABLE',error=repr(e))
  return r
 with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:rows=list(pool.map(one,paths))
 save(HERE/'source/fetch.json',rows);print('SOURCE_FETCH',[(x['url'].split('/')[-1],x['status']) for x in rows],flush=True)
def probe():
 p=prefixes();body='function stableOwn(obj) { return obj.x; }\nvar stableObject={x:3}, sum=0;for(var i=0;i<10000;i++)sum+=stableOwn(stableObject);\nif(sum!==30000)throw Error("checksum");console.log("OWN_PASS "+sum);\n'
 for kind,inspection in [('feedback','console.log("FEEDBACK "+JSON.stringify(%GetFeedback(stableOwn)));'),('debug','%DebugPrint(stableOwn);'),('status','console.log("STATUS "+%GetOptimizationStatus(stableOwn));')]:
  script=HERE/'probes'/('own_'+kind+'.js');save(script,body+inspection+'\n')
  for c in CONDITIONS[1:]:
   log=HERE/'raw/ic'/(c+'.'+kind+'.log');log.parent.mkdir(parents=True,exist_ok=True);assert not log.exists(),'preserve old log; use a new attempt'
   cmd=p[c]+['--allow-natives-syntax','--print-bytecode','--print-bytecode-filter=stableOwn','--log-ic','--log-code','--no-logfile-per-isolate','--logfile='+str(log),script]
   r=capture(c+'_'+kind,cmd)
   print(r['stdout'][-1000:],r['stderr'][-1000:],flush=True)
if __name__=='__main__':fetch();probe()
