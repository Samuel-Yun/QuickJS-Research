"""Callgrind counts, kept separate from all wall-clock measurements."""
import json,os,re,subprocess
from pathlib import Path
from build import HERE,LABELS,save,sha
from run import ENV,binary

def main():
 os.sched_setaffinity(0,{2});out=HERE/'callgrind';out.mkdir(exist_ok=False);rows=[]
 assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
 for mode in ['fused','plain']:
  for label in LABELS:
   dest=out/f'{label}.{mode}.out';exe=binary(label,'release')
   cmd=['valgrind','--tool=callgrind','--cache-sim=no','--branch-sim=no',f'--callgrind-out-file={dest}',exe,str(HERE/'micro.js'),'object',mode,'65536']
   r=subprocess.run(cmd,env=ENV,capture_output=True,text=True,timeout=300)
   row=dict(label=label,mode=mode,command=cmd,binary_sha256=sha(exe),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr)
   save(out/f'{label}.{mode}.run.json',row);assert r.returncode==0,row
   assert json.loads(r.stdout)['checksum']==3*65536
   data=dest.read_text();events=re.search(r'^events: (.+)$',data,re.M)[1].split();totals=re.search(r'^summary: (.+)$',data,re.M)[1].split()
   row['events']=dict(zip(events,map(int,totals)));rows.append(row)
   a=subprocess.run(['callgrind_annotate','--inclusive=yes','--threshold=99',str(dest)],capture_output=True,text=True,env=ENV)
   (out/f'{label}.{mode}.annotate.txt').write_text(a.stdout);assert a.returncode==0
   print('INSTRUCTIONS',label,mode,row['events'],flush=True)
 save(HERE/'instructions.json',dict(rows=rows,note='Ir is whole process, including setup/compiler/runtime; Callgrind elapsed is not used as Release timing.'))
if __name__=='__main__':main()
