"""Read-only OS process/boot status after a client disconnect."""
import json
from pathlib import Path
HERE=Path(__file__).resolve().parent
rows=[]
for d in Path('/proc').iterdir():
    if not d.name.isdigit():continue
    try:
        cmd=(d/'cmdline').read_bytes().replace(b'\0',b' ').decode(errors='replace')
        if 'v8_inspired_ic_attempt02' in cmd or ('attempt02' in cmd and any(x in cmd for x in ['execute.py','campaign.py'])):
            stat=(d/'stat').read_text().split(') ',1)[1].split()
            rows.append(dict(pid=int(d.name),state=stat[0],ppid=int(stat[1]),command=cmd))
    except OSError:pass
expected=json.loads((HERE/'campaign_runtime.json').read_text())['boot_id']
print(json.dumps(dict(boot=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),expected_boot=expected,processes=rows),indent=2))
