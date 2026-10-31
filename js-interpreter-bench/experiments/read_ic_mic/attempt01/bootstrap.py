"""Mechanical reuse of fixed measurement tools into an independent campaign."""
import ast
from pathlib import Path
H=Path(__file__).resolve().parent;P=H.parents[1]/'legacy_ng_ic_read_hit/attempt01'
def put(name,s):
    p=H/name;p.parent.mkdir(parents=True,exist_ok=True);data=s.encode() if isinstance(s,str) else s
    if p.exists():assert p.read_bytes()==data,p
    else:p.write_bytes(data)
def reuse(name,changes=()):
    s=(P/name).read_text(encoding='utf-8')
    for a,b in changes:assert a in s,(name,a);s=s.replace(a,b)
    put(name,s)
reuse('common.py',[("IC_READ_STORE','/home/mzyx/legacy_ng_ic_read_hit_attempt01","IC_MIC_STORE','/home/mzyx/read_ic_mic_attempt01"),
 ("VERSIONS=['A','C','D']","VERSIONS=['A','P','M']"),("SEED=20261023","SEED=20261024"),("LEGACY_NG_IC_READ_WRAPPER_INLINE_V1","READ_IC_MIC_MONOTONIC_V1"),
 ("'M5.write_control']","'M5.write_control','M6.poly2','M7.poly4','M8.poly8']"),
 ("PREVIOUS=ROOT/'experiments/legacy_ng_ic_slotfix/attempt01'","PREVIOUS=ROOT/'experiments/legacy_ng_ic_read_hit/attempt01'\nBASE_MATERIALS=ROOT/'experiments/legacy_ng_ic_slotfix/attempt01'")])
for name in ['adapter.js','driver.js']:put('inputs/'+name,(P/'inputs'/name).read_bytes())
put('recovery/workload_line_endings.json',(P/'recovery/workload_line_endings.json').read_bytes())
for name in ['legacy_regression.js','multislot.js','read_semantics.js','legacy_timer.js','roundtrip_slots.c','read_roundtrip.c']:
    put('correctness/'+name,(P/'correctness'/name).read_bytes())
for f in (P/'cases').glob('*.js'):put('cases/'+f.name,f.read_bytes())
reuse('micros.py',[("'M5.write_control':['m5Write']}","'M5.write_control':['m5Write'],'M6.poly2':['polyRead2'],'M7.poly4':['polyRead4'],'M8.poly8':['polyRead8']}"),
 ("last:last,elapsed_ms:","last:last,start_ms:start,stop_ms:stop,elapsed_ms:"),
 ("[12288,4096,8398848,8386560,4096]","[12288,4096,8398848,8386560,4096,6144,10240,18432]")])
reuse('run.py',[("126","144"),("['ACD','CDA','DAC']","['APM','PMA','MAP']"),("ACD","APM"),("C/D-only","P/M-only"),("five separate","eight separate"),("20261023","20261024"),
 ("start=time.perf_counter_ns()","start=time.perf_counter_ns()"),
 ("    with Path(str(stem)+'.stdout').open('xb') as out,Path(str(stem)+'.stderr').open('xb') as err:\n        try:","    with Path(str(stem)+'.stdout').open('xb') as out,Path(str(stem)+'.stderr').open('xb') as err:\n        start=time.perf_counter_ns()\n        r['outer_start_ns']=start\n        try:"),
 ("    r.update(outer_wall_ns=time.perf_counter_ns()-start,", "    stop=time.perf_counter_ns();r['outer_stop_ns']=stop\n    r.update(outer_wall_ns=stop-start,"),
 ("            r.update(elapsed_ms=e,elapsed_per_call_ms=e/n)", "            assert payload['stop_ms']-payload['start_ms']==e\n            assert start/1e6-1<=payload['start_ms']<=payload['stop_ms']<=stop/1e6+1\n            r.update(elapsed_ms=e,elapsed_per_call_ms=e/n)"),
 ("assert read(HERE/'machinecode/gate.json')['status']=='EFFECTIVE_INTERVENTION'","assert read(HERE/'machinecode/gate.json')['status']=='EFFECTIVE_INTERVENTION'\n    assert read(HERE/'correctness/timer_gate.json')['status']=='PASS'\n    assert read(HERE/'correctness/mechanism_gate.json')['status']=='PASS'"),
 ("for r in read(HERE/'schedule.json'):invoke('formal',r['case'],r['variant'],r['N'],r['rep'],r['order'])","last_stop=0\n    for row in read(HERE/'schedule.json'):\n        r=invoke('formal',row['case'],row['variant'],row['N'],row['rep'],row['order'])\n        if r.get('error')=='EXIT_STDERR_PAYLOAD_CLOCK':\n            save(HERE/'BLOCKED_TIMER.json',dict(status='BLOCKED_TIMER_OR_PAYLOAD',record=r));raise RuntimeError('timer/payload gate failed, raw preserved')\n        assert r['outer_start_ns']>=last_stop\n        last_stop=r['outer_stop_ns']")])
# Stats only, remove obsolete old B/C helpers and unreachable Markdown block.
s=(P/'analyze.py').read_text(encoding='utf-8');tree=ast.parse(s);lines=s.splitlines(True)
for node in sorted([n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name in ['legacy','extras','diagnostics']],key=lambda n:n.lineno,reverse=True):del lines[node.lineno-1:node.end_lineno]
s=''.join(lines);i=s.index('    return\n    lines=');j=s.index("if __name__=='__main__':",i);s=s[:i]+s[j:]
s=s.replace("PAIRS=[('A','C'),('C','D'),('A','D')]","PAIRS=[('A','M'),('P','M'),('A','P')]").replace('1890','2160').replace("['formal','diagnostics']","['formal']")
put('analyze.py',s)
reuse('aggregate_ci.py')
reuse('memory.py',[("['ACD','CDA','DAC']","['APM','PMA','MAP']")])
put('.gitignore','generated/\nartifacts/\n__pycache__/\n*.partial\n')
put('.gitattributes','* text=auto eol=lf\n*.gz binary\n')
print('NEW_CAMPAIGN_TOOLS_CREATED')
