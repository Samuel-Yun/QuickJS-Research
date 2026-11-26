"""Read-only collection progress, no performance analysis."""
import json
from pathlib import Path
p=Path(__file__).resolve().parent
rows=[json.loads(f.read_text(encoding='utf-8')) for f in (p/'raw/formal').rglob('*.json')]
print(json.dumps(dict(completed=len(rows),valid=sum(r['valid'] for r in rows),planned=1530,common_complete_rounds=[rep for rep in range(30) if len([r for r in rows if r['rep']==rep and r['valid']])==51],collection_end=(p/'collection_end.json').exists(),stop=(p/'campaign_stop.json').exists())))
