"""Check the missing --std test invocation on the unmodified frozen A too."""
import experiment as e
src=e.lab.ROOT/'engines/quickjs-upstream/tests/test_builtin.js'
rows=[]
for label in ['A','B2']:
    art=e.measure.artifact(label)
    for flags in [[],['--std']]:
        r=e.capture([art['path'],*flags,src],'upstream_invocation_control',label+'/'+str(flags),60,
                    dict(binary_sha256=art['sha256'],script_sha256=e.lab.sha(src)))
        rows.append(dict(condition=label,flags=flags,exit_code=r['exit_code'],stdout=r['stdout'],stderr=r['stderr'],token=r['token']))
e.save('upstream_invocation_control.json',rows)
assert all(r['exit_code']==0 and not r['stderr'] for r in rows if r['flags'])
print('UPSTREAM_STD_CONTROL_PASS',flush=True)
