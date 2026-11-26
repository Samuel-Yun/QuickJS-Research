"""Fault only the optional full-plan allocation, retaining the normal JS allocation path."""
import subprocess,shutil,json,os
from pathlib import Path
H=Path(__file__).resolve().parent/'03_sparse_ctor';w=H/'work/alloc_fail_san'
shutil.copytree(H/'work/san',w)
p=w/'four_runtime.inc';s=p.read_text();assert s.count('s=js_mallocz_rt(ctx->rt,sizeof(*s));')==1;s=s.replace('s=js_mallocz_rt(ctx->rt,sizeof(*s));','s=NULL; /* test-only optional plan allocation failure */');p.write_text(s)
with (H/'alloc_fail_san.build.log').open('w') as f:subprocess.run(['make','-j2','-o','repl.c','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs'],cwd=w,stdout=f,stderr=subprocess.STDOUT,check=True)
env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
a=subprocess.run([H/'work/release/qjs',H/'safety.js'],capture_output=True,text=True,check=True)
b=subprocess.run([w/'qjs',H/'safety.js'],capture_output=True,text=True,env=env)
(H/'qualification/optional_alloc_failure.json').write_text(json.dumps(dict(diagnostic_only=True,exit_code=b.returncode,stderr=b.stderr,output_matches=a.stdout==b.stdout),indent=2))
assert b.returncode==0 and not b.stderr and a.stdout==b.stdout
print('OPTIONAL_ALLOC_FAIL_SEMANTICS_ASAN_UBSAN_PASS',flush=True)
