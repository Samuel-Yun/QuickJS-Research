"""Use existing vector logging only; do not force feedback allocation."""
from common import *
def main():
 for c in CONDITIONS[1:]:
  log=HERE/'raw/ic'/(c+'.vectors.log');assert not log.exists(),'preserve old log; use a new attempt';cmd=prefixes()[c]+['--allow-natives-syntax','--print-bytecode','--print-bytecode-filter=stableOwn','--log-ic','--log-code','--log-feedback-vector','--no-logfile-per-isolate','--logfile='+str(log),HERE/'probes/own_debug.js']
  r=capture(c+'_vector_log',cmd);print(r['stdout'][-600:],r['stderr'][-300:])
 d=read(HERE/'runtime.json')['v8']['binary']['path'];nm=subprocess.check_output(['nm','--defined-only',d],text=True)
 names=[s.split()[-1] for s in nm.splitlines() if 'Runtime_GetFeedback' in s or 'Runtime_DebugPrintE' in s]
 for name in names:
  r=capture('native_'+('GetFeedback' if 'GetFeedback' in name else 'DebugPrint'),['objdump','-d','-M','intel','--disassemble='+name,d]);assert not r['exit_code']
if __name__=='__main__':main()
