"""All builds/checks serial. A failed axis is recorded, not performance-ranked."""
import traceback
import experiment as e
import safety

ideas={
 'ID_CTRL':'Wide runtime-local layout version maintenance; original strong pointer IC retained.',
 'ID_READ':'Same wide version maintenance, numeric16B record, remove only own-read IC shape edges.',
 'W1':'Only named put_field, existing writable own data; publish before free and refresh after reentry.',
 'P1':'Only get_field2 one-direct-prototype data cache, strong receiver+holder shape guards.',
 'L1':'Prepare at third safe ordinary entry, no live image migration, optional RT allocation.',
 'K1':'Mechanism reproduction of c011 on s001 parent: only rdi_update no_inline, ordinary GCC ABI.'}
e.save('axes_before_build.json',ideas)
results=[]
for cid,description in ideas.items():
    print('AXIS_BEGIN',cid,description,flush=True)
    try:
        e.build(cid)
        safety.run(cid,'02')
        result=dict(id=cid,status='CHECKED_TARGETED',description=description)
    except Exception as exc:
        result=dict(id=cid,status='BLOCKED_CORRECTNESS_OR_BUILD',reason=str(exc),traceback=traceback.format_exc())
        print('AXIS_BLOCKED',cid,str(exc),flush=True)
        if (e.H/'STOP.json').exists():
            e.save('axis.'+cid+'.json',result)
            raise
    e.save('axis.'+cid+'.json',result);results.append(result)
e.save('build_phase.json',results)
print('BUILD_PHASE_COMPLETE',flush=True)
