"""Capability first; no benchmark or implicit downgrade to max-opt."""
from common import *
def main():
 old=read(ROOT/'experiments/three_engine_baseline/manifest.json');q=read(OLD/'manifest.json')['artifacts']['A'];ids=read(OLD/'sources/identities.json')['files']['A']
 assert sha(q['path'])==q['sha256'];assert all(sha(Path(q['source'])/p)==h for p,h in ids.items())
 v=old['engines']['v8'];assert sha(v['binary']['path'])==v['binary']['sha256']
 for a in v['dependencies']:assert sha(a['path'])==a['sha256']
 save(HERE/'runtime.json',dict(quickjs=dict(engine='upstream QuickJS',version='2026-06-04',commit=read(OLD/'manifest.json')['base'],binary=dict(path=q['path'],sha256=q['sha256'],size_bytes=q['size']),source=q['source'],source_files=ids,compiler=read(OLD/'manifest.json')['compiler'],flags='-O2 -g -fwrapv',NDEBUG=False,LTO=False,PGO=False,prior_build_log='experiments/read_ic_dequickening/attempt01/raw/build/bridge_A_clean_build.1.json'),v8=v,cohort='WSL2-'+platform.node()+'-'+platform.machine()+'-20261025',host=platform.node(),kernel=platform.release(),started_at=stamp(),capability_budget_seconds=3600))
 p=prefixes();d=v['binary']['path']
 for name,cmd in [('version',[d,'--version']),('help',[d,'--help']),('default_flags',[d,'--print-flag-values'])]:capture(name,cmd)
 probe=HERE/'probes/basic.js';save(probe,'function ownProbe(obj) { return obj.x + 1; }\nvar o={x:3}, answer=0; for(var i=0;i<10000;i++)answer+=ownProbe(o);\nif(answer!==40000)throw Error("checksum"); console.log("PROBE_PASS "+answer);\n')
 for c in CONDITIONS[1:]:
  capture(c+'_basic',p[c]+[probe]);capture(c+'_flags',p[c]+['--print-flag-values',probe])
 capture('QJS_version',[q['path'],'--help'])
 capture('environment',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; uptime; true'])
 print('CAPABILITY_OUTPUTS_SAVED',flush=True)
if __name__=='__main__':main()
