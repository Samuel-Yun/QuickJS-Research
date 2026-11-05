"""Compare durable records with pre-resume CSV exports; no engine invocation."""
import csv,json,hashlib
from pathlib import Path
BASE=Path(__file__).resolve().parents[1]
checked=0
for stage in ('correctness','calibration','selected_correctness','formal'):
    with (BASE/'raw'/f'{stage}.csv').open(encoding='utf-8',newline='') as f:rows=list(csv.DictReader(f))
    files=list((BASE/'records'/stage).rglob('*.json'))
    assert len(files)==len(rows),'new/replacement invocation record after resume'
    for row in rows:
        r=json.loads((BASE/row['record']).read_text())
        for key,value in r.items():
            text=row[key]
            if value is None:assert text==''
            elif isinstance(value,(dict,list)):assert json.loads(text)==value
            elif isinstance(value,bool):assert text==str(value)
            elif isinstance(value,int):assert int(text)==value
            elif isinstance(value,float):assert float(text)==value
            else:assert text==value
        checked+=1
result={'status':'PASS','records_unchanged_against_pre_resume_exports':checked,'new_invocation_records':0,
        'scope':'same frozen protocol all command resumes existing valid positions',
        'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
path=BASE/'summary/resume_audit.json';data=json.dumps(result,indent=2)+'\n'
if path.exists():assert path.read_text()==data
else:
    with path.open('x') as f:f.write(data)
print(data)
