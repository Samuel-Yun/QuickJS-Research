import json,subprocess,os
from pathlib import Path
from build import H,sha
from analyze import decode,csvout
out=H/'snapshots';out.mkdir(exist_ok=True)
s=(H/'own_read.js').read_text();a=s.index('function readLoop(');b=s.index('\nfunction selfTest',a);read=s[a:b]
src='"use strict";\n'+read+'''\nfunction ownRead(o){return o.x;}
var a={x:3,a:0},b={x:3,b:0};for(var i=0;i<8;i++)ownRead(a);__snapshot(ownRead,"ownRead_live",a);readLoop([a,a],16,1);__snapshot(readLoop,"readLoop_live",a);
'''
(H/'snapshot_read.js').write_text(src)
cs=(H/'ctor.js').read_text().replace('    var elapsed=performance.now()-start;','    var elapsed=performance.now()-start;\n    __snapshot(ctorLoop,"ctorLoop_live",empty);\n    __snapshot(A,"constructor_A_live",empty);');(H/'snapshot_ctor.js').write_text(cs)
rs=[]
for label in ['A','SPARSE']:
 m=json.loads((H/(label+'.diagnostic.json')).read_text());assert sha(m['elf'])==m['elf_sha256']
 for kind in ['read','positive','negative']:
  cmd=[m['elf'],str(H/('snapshot_read.js' if kind=='read' else 'snapshot_ctor.js')),*([] if kind=='read' else [kind,'100','65536'])];z=subprocess.run(['taskset','-c','2',*cmd],capture_output=True,text=True,env=dict(os.environ,TZ='Asia/Shanghai',LC_ALL='C'));assert z.returncode==0 and not z.stderr,z.stderr
  (out/(kind+'.'+label+'.raw.jsonl')).write_text(z.stdout);rs.append(dict(label=label,kind=kind,command=cmd,exit_code=z.returncode))
  for line in z.stdout.splitlines():
   if not line.startswith('BYTECODE_SNAPSHOT:'):continue
   snap=json.loads(line.removeprefix('BYTECODE_SNAPSHOT:'));stem='short.'+kind+'.'+label+'.'+snap['label'];(out/(stem+'.json')).write_text(json.dumps(snap,indent=2));d=decode(snap);csvout(out/(stem+'.csv'),d);(out/(stem+'.txt')).write_text('\n'.join(f"{i['pc']:04d}  {i['opcode']:<22} {i['operand']}" for i in d)+'\n')
(H/'snapshot_runs.json').write_text(json.dumps(rs,indent=2));print('LIVE_SNAPSHOTS_PASS')
