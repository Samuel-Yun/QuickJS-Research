"""C1 follows observed P1 inherited hits, not a guessed hotspot."""
import experiment as e
import safety
records=e.lab.load(e.H/'diagnostics/P1.01.json')
record=next(r for r in records if r['case']=='Richards.Richards')
assert record['counters']['proto_hits']>=1000
e.save('C1.admission.json',dict(parent='P1',whole_process_Richards_N1_proto_hits=record['counters']['proto_hits'],
    hypothesis='Keep all original call ownership/checks; bypass one dispatch only for inherited-data-hit followed by no-argument call_method',
    excluded='arguments, tail calls, getters/Proxy, own hits; no raw callee pointer cache'))
e.build('C1');safety.run('C1','02')
test=e.H/'call_targeted.js';rows=[]
for cid in ['A','s001','P1','C1']:
    a=e.measure.artifact(cid)
    r=e.capture([a['path'],test],'correctness','call_specific/'+cid,45,dict(binary_sha256=a['sha256'],source_sha256=e.lab.sha(test)))
    rows.append(dict(condition=cid,pass_=r['exit_code']==0 and r['stdout']=='V6_CALL_TARGETED_PASS\n' and not r['stderr'],token=r['token']))
e.save('C1.call_gate.json',rows)
assert all(r['pass_'] for r in rows)
