"""A new epoch, never a continuation of the stopped initial cohort."""
import experiment as e
import internal_checks
assert e.EPOCH=='recovery01'
e.preflight()
for cid in ['ID_CTRL','ID_READ','L1']:
    internal_checks.run(cid)
rows=[]
test=e.H/'targeted.js'
for cid in ['A','s001','d03','d05','B2','ID_CTRL','ID_READ','W1','P1','L1','K1']:
    art=e.measure.artifact(cid)
    r=e.capture([art['path'],test],'join_semantic_gate',cid,45,
                dict(binary_sha256=art['sha256'],test_sha256=e.lab.sha(test)))
    rows.append(dict(id=cid,pass_=r['exit_code']==0 and r['stdout']=='V6_TARGETED_PASS\n' and not r['stderr'],token=r['token']))
e.save('join_gate.recovery01.json',rows)
assert all(r['pass_'] for r in rows)
print('RECOVERY_INTERNAL_COMPLETE',flush=True)
