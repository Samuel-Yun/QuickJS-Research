"""One bounded inspection of existing binary interfaces; no build or perf samples."""
from common import *
def main():
 d=read(HERE/'runtime.json')['v8']['binary']['path'];r=capture('elf_sections',['readelf','-S',d]);assert r['exit_code']==0
 p=subprocess.run(['nm','-C','--defined-only',d],capture_output=True,text=True,env=env());lines=[s for s in p.stdout.splitlines() if any(k in s for k in ['Runtime_GetFeedback','Runtime_DebugPrint','FeedbackVector::','GetFunctionFeedback','PrintFeedback'])]
 save(HERE/'raw/capability/symbol_interfaces.json',dict(command=['nm','-C','--defined-only',d],exit_code=p.returncode,stderr=p.stderr,matching_symbols=lines,total_symbol_lines=len(p.stdout.splitlines())))
 p=subprocess.run(['strings','-a',d],capture_output=True,text=True,env=env());matches=[s for s in p.stdout.splitlines() if re.fullmatch(r'(Get|Print|DebugPrint|Clear|Collect|Log|Ensure|Has|Is|Feedback)[A-Za-z_]*(Feedback|IC)[A-Za-z_]*',s)]
 save(HERE/'raw/capability/string_interfaces.json',dict(command=['strings','-a',d],exit_code=p.returncode,stderr=p.stderr,matching_strings=sorted(set(matches))))
 script=HERE/'probes/interfaces.js';save(script,'console.log("D8 "+JSON.stringify(Object.getOwnPropertyNames(d8)));\nconsole.log("TEST "+JSON.stringify(Object.getOwnPropertyNames(d8.test||{})));\nconsole.log("DEBUG "+JSON.stringify(Object.getOwnPropertyNames(d8.debug||{})));\n')
 r=capture('shell_interfaces',prefixes()['V8_IC_ON']+[script]);print(r['stdout'],flush=True)
 print('SYMBOLS',len(lines),'STRINGS',sorted(set(matches)),flush=True)
if __name__=='__main__':main()
