"""One independent diagnostic, never a formal Release sample."""
import json,shutil,subprocess,os
from pathlib import Path
H=Path(__file__).resolve().parent/'02_proto_ticket';src=H/'work/lean_counts';w=H/'work/lean_reasons';shutil.copytree(src,w)
p=w/'four_runtime.inc';s=p.read_text();a=s.index('    JSObject*f,*proto;FourRecipe r;');b=s.index('\n}',a)
s=s[:a]+'''    JSObject*f,*proto;FourRecipe r;
    if(!four_ctor_base(ctx,callee,target,argc,&f)){FOLLOW(13);return 0;}
    if(!four_ctor_recipe(f->u.func.function_bytecode,&r)){FOLLOW(14);return 0;}
    if(!(proto=four_ctor_proto(f))){FOLLOW(15);return 0;}
    if(!find_hashed_shape_proto(ctx->rt,proto)){FOLLOW(16);return 0;}
    FOLLOW(17);return four_ctor_chain(proto,&r);'''+s[b:];p.write_text(s)
with (H/'lean_reasons.build.log').open('w') as log:subprocess.run(['make','-j2','-o','repl.c','qjs'],cwd=w,check=True,stdout=log,stderr=subprocess.STDOUT)
p=json.loads((H/'runs/counts/sunspider/protocol.json').read_text())['scripts']['access-binary-trees']['path'];z=subprocess.run(['taskset','-c','2',str(w/'qjs'),p],text=True,capture_output=True,env=dict(os.environ,TZ='Asia/Shanghai',LC_ALL='C'));assert z.returncode==0,z.stderr
(H/'qualification/lean_tree_reasons.json').write_text(json.dumps(dict(diagnostic_only=True,stdout=z.stdout,stderr=z.stderr,counts=json.loads(z.stderr.removeprefix('LEAN_COUNTS:')),reason_slots={'12':'GCbudget base rejects (all calls)','13':'slow base rejected','14':'slow recipe rejected','15':'slow prototype rejected','16':'empty hashed shape missing','17':'slow chain check entered'}),indent=2));print(z.stderr[:1000],flush=True)
