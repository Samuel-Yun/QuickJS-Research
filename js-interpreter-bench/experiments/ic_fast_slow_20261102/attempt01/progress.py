"""Read-only progress; no VM/source access, no claim of complete by quota."""
import json
from pathlib import Path
HERE=Path(__file__).resolve().parent
out={}
for kind,target in [('mechanism',630),('sunspider',3120),('micro',270),('octane',2040)]:
    paths=list((HERE/kind/'raw/formal').rglob('*.json'));valid=0;invalid=0
    for p in paths:
        r=json.loads(p.read_text());valid+=bool(r['valid']);invalid+=not r['valid']
    selected=list((HERE/kind/'selected').glob('*.json'))
    out[kind]=dict(target=target,actual=len(paths),valid=valid,invalid=invalid,calibrated_cases=len(selected),
      collected=(HERE/kind/'collected.json').exists(),analyzed=(HERE/kind/'analysis/audit.json').exists())
print(json.dumps(out,indent=2))
