"""Record the externally interrupted measurement boot; never fill old positions."""
import json
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
rt=json.loads((HERE/'campaign_runtime.json').read_text(encoding='utf-8'))
rows=[json.loads(p.read_text(encoding='utf-8')) for p in (HERE/'raw/formal').rglob('*.json')]
value=dict(status='INTERRUPTED_EXTERNAL_BOOT_CHANGED',timestamp=datetime.now(timezone.utc).isoformat(),
    measurement_boot_id=rt['boot_id'],formal_completed=len(rows),planned=1530,valid=sum(r['valid'] for r in rows),
    complete_common_rounds=[i for i in range(30) if sum(r['rep']==i and r['valid'] for r in rows)==51],
    source='client turn-aborted; subsequent read-only inspection found no collector and a different WSL boot',
    old_measurements_not_resumed=True,engine_correctness_regression=False,
    exploratory_use='only fixed all-case common complete rounds; not n30 primary results')
p=HERE/'campaign_stop.json';assert not p.exists();p.write_text(json.dumps(value,indent=2)+'\n',encoding='utf-8');print(json.dumps(value))
