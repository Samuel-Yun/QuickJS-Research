from build import *
from measure import EXTERNAL_N,next_out
out=next_out(HERE,'installation');out.mkdir();d=transform(base(),'SITE','counts');m=build('SITE',d,'counts',out)
rows=[]
for case in ['Acorn','MarkdownIt']:
 env=dict(ENV,QJS_BUILTIN_MODE='site');cmd=['taskset','-c','1',m['binary'],'--std',str(HERE/'external/scripts'/(case+'.js')),str(EXTERNAL_N[case])];r=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=180);row=dict(case=case,command=cmd,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,binary_sha256=m['binary_sha256']);save(out/(case+'.json'),row);assert not r.returncode,row
 c=json.loads(next(l.split(':',1)[1]for l in r.stderr.splitlines()if l.startswith('BIC_COUNTS:')));pub=[s for s in c['sites']if s['published_hex']];assert pub and all(len(s['published_hex'])==6 and s['published_hex'].startswith('fa')for s in pub);assert all(s['live_hex']==s['published_hex']for s in pub if s['live_hex']is not None);save(out/(case+'.installations.json'),pub);print('EXECUTION_BUFFER_PROOF',case,len(pub),flush=True);rows.append(dict(case=case,installed_Run_sites=len(pub)))
save(out/'gate.json',dict(status='PASS',actual_private_buffer_copied_at_publish=True,records=rows,diagnostic_only=True))
