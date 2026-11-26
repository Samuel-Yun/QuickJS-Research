"""Prove semantic differential fixtures enter the actual learned paths."""
import json,subprocess,hashlib
from pathlib import Path
HERE=Path(__file__).resolve().parent
for name in ['01_group_load','02_call_recipe','03_constructor_plan','04_index_consume']:
 h=HERE/name;m=json.loads((h/'counts.manifest.json').read_text());out=h/'qualification'
 expected=next(json.loads(l)['stdout'] for l in (out/'runs.jsonl').read_text().splitlines()
               if json.loads(l)['event']=='process_result' and json.loads(l)['token']=='qualify/C.safety')
 script=out/'active_safety.js';text=(h/'safety.js').read_text();assert text.startswith("'use strict';")
 script.write_text(text.replace("'use strict';","'use strict';\n__four_begin();",1)+'\n__four_end();\n')
 z=subprocess.run([m['elf'],str(script)],capture_output=True,text=True,timeout=60)
 assert z.returncode==0 and z.stdout==expected,(name,z.returncode,z.stdout,z.stderr)
 assert z.stderr.startswith('FOUR_COUNTS:');c=json.loads(z.stderr[len('FOUR_COUNTS:'):]);assert c['hits']>0 and c['fallbacks']>0,c
 record=dict(status='PASS',source_sha256=hashlib.sha256(script.read_bytes()).hexdigest(),binary_sha256=m['elf_sha256'],counts=c,
             returncode=z.returncode,stdout=z.stdout,stderr=z.stderr,output_equal_to_parent_C=True)
 (out/'active_safety.json').write_text(json.dumps(record,indent=2)+'\n')
 print(name,c['attempts'],c['hits'],c['fallbacks'])
