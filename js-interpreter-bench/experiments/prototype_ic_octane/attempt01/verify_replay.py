"""Verify replay values, explicitly reporting JSON key-order byte differences."""
from common import *
files=[p for p in (HERE/'replay_check').rglob('*') if p.is_file()]
assert files
identical=[];json_order=[]
for p in files:
    name=p.relative_to(HERE/'replay_check').as_posix();q=HERE/'summary'/name
    if p.read_bytes()==q.read_bytes():identical.append(name)
    else:
        assert p.suffix=='.json' and read(p)==read(q),name
        canonical=lambda f:hashlib.sha256(json.dumps(read(f),ensure_ascii=False,sort_keys=True,separators=(',',':')).encode()).hexdigest()
        assert canonical(p)==canonical(q)
        json_order.append(dict(file=name,canonical_sha256=canonical(p),difference='JSON object key serialization order only; numerical values identical'))
save(HERE/'replay_verification.json',dict(status='PASS_VALUES_NOT_ALL_BYTES',timestamp=stamp(),outputs_checked=len(files),byte_identical=len(identical),byte_identical_files=identical,JSON_order_only=json_order,all_values_identical=True,runtime_paths_opened=False,engine_processes_started=0))
print('REPLAY_VALUES_PASS',len(files),'byte_identical',len(identical),'JSON_order_only',len(json_order))
