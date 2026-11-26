"""Read-only progress from complete raw lines, not a timing/profiling program."""
import json
from pathlib import Path
H=Path(__file__).resolve().parent
counts={k:dict(valid=0,invalid=0,unique=0,expected=n) for k,n in [('octane',2040),('sunspider',2340)]};seen=set();last=None
with (H/'runs.jsonl').open('rb') as f:
    for line in f:
        if not line.endswith(b'\n') or not line.startswith(b'{"event": "measurement"'):continue
        r=json.loads(line)
        if r['stage']!='formal':continue
        c=counts[r['kind']];c['valid' if r['valid'] else 'invalid']+=1
        key=(r['campaign'],r['case'],r['condition'],r['rep'],r['order'])
        if key not in seen:c['unique']+=1;seen.add(key)
        last={k:r[k] for k in ['kind','case','condition','rep','order','completed_at','valid']}
print(json.dumps(dict(counts=counts,last=last)))
