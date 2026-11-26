from common import *
rows=[]
for cmd in [['git','branch','--show-current'],['git','rev-parse','HEAD'],['gcc','--version'],['uname','-a'],['lscpu'],['valgrind','--version']]:
 r=subprocess.run(cmd,capture_output=True,text=True);rows.append(dict(command=cmd,returncode=r.returncode,stdout=r.stdout,stderr=r.stderr))
save(HERE/'environment_after_run.json',dict(note='Environment captured after measurement; binary, command, input and CPU binding are pinned in the individual protocols.',commands=rows))
save(HERE/'provenance.json',dict(requested_repository_commit='967e3cae0016a81972f9728750172321cbf9299d',actual_repository_commit=rows[1]['stdout'].strip(),branch=rows[0]['stdout'].strip(),parent='frozen SPARSE_CTOR_IC 06aada4',frozen_manifest_sha256=sha(PACKAGE/'manifest.json'),external_manifest_sha256=sha(HERE/'external/manifest.json'),no_JIT=True,full_repeats=1,full_parent_remeasured=True,source_design='new implementation of builtin-owned learning and per-call-PC specialization; no benchmark or builtin algorithm changes in SITE; BODY is the separately requested C-body control'))
