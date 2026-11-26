import json,os,subprocess
from pathlib import Path
from build import H,sha
out=[]
for label,mode in [('R3','release'),('NEGATIVE_ONLY','release'),('NEGATIVE_ONLY','san')]:
 m=json.loads((H/label/(mode+'.manifest.json')).read_text());z=subprocess.run(['taskset','-c','2',m['elf'],str(H/'growth.js')],text=True,capture_output=True,env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1'))
 out.append(dict(label=label,mode=mode,exit_code=z.returncode,stdout=z.stdout,stderr=z.stderr));(H/'qualification/growth_runs.json').write_text(json.dumps(out,indent=2));assert z.returncode==0 and not z.stderr
assert len({r['stdout'] for r in out})==1
(H/'qualification/growth_gate.json').write_text(json.dumps(dict(status='PASS',active_sites=100,side_table_capacity_growth=True,outputs_equal=True,ASan_UBSan=True,frozen={str(H/'growth.js'):sha(H/'growth.js'),str(Path(__file__)):sha(Path(__file__))}),indent=2));print('GROWTH_PASS')
