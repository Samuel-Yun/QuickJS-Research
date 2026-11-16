"""Mechanical tool reuse into a NEW campaign; never writes the previous attempt."""
from pathlib import Path
import shutil
H=Path(__file__).resolve().parent
P=H.parents[1]/'legacy_ng_ic_slotfix/attempt01'
def put(name,s):
    p=H/name;p.parent.mkdir(parents=True,exist_ok=True)
    data=s.encode() if isinstance(s,str) else s
    if p.exists():assert p.read_bytes()==data,p
    else:p.write_bytes(data)
def transform(name,changes):
    s=(P/name).read_text(encoding='utf-8')
    for a,b in changes:
        assert a in s,(name,a);s=s.replace(a,b)
    put(name,s)
transform('common.py',[
 ("VERSIONS=['A','B','C']","VERSIONS=['A','C','D']"),
 ("IC_SLOT_STORE','/home/mzyx/legacy_ng_ic_slotfix_attempt01","IC_READ_STORE','/home/mzyx/legacy_ng_ic_read_hit_attempt01"),
 ("LEGACY_NG_IC_SLOTFIX_MONOTONIC_V1","LEGACY_NG_IC_READ_WRAPPER_INLINE_V1"),
 ("w=csv.DictWriter(out,list(rows[0]))","w=csv.DictWriter(out,list(rows[0]),lineterminator='\\n')"),
 ("def stamp():", "OCTANE_CASES=CASES.copy()\nMICRO_CASES=['M1.own_integer','M2.own_reference','M3.own_method','M4.numeric_control','M5.write_control']\nCASES+=MICRO_CASES\nPREVIOUS=ROOT/'experiments/legacy_ng_ic_slotfix/attempt01'\ndef stamp():")])
transform('build.py',[
 ("IC_SLOT_COHORT","IC_READ_COHORT"),
 ("patches/B_to_C.patch","patches/C_to_D.patch"),
 ("'C_sanitizer'","'D_sanitizer'"),
 ("STORE/'C'/name","STORE/'D'/name"),
 ("[('C',dst,'sanitizer')]","[('D',dst,'sanitizer')]"),
 ("['legacy_regression.js','multislot.js']","['legacy_regression.js','multislot.js','read_semantics.js']"),
 ("'C_sanitizer_","'D_sanitizer_"),
 ("C_ASan_UBSan=True","D_ASan_UBSan=True")])
transform('run.py',[
 ("['ABC','BCA','CAB']","['ACD','CDA','DAC']"),
 ("assert len(rows)==96","assert len(rows)==126"),
 ("n=read(OLD/'selected'/f'{case}.json')['N']","n=1 if case in MICRO_CASES else read(PREVIOUS/'selected'/f'{case}.json')['N']"),
 ("suite,bench=case.split('.')", "if case in MICRO_CASES:\n        from micros import make_script\n        return make_script(case,n,correctness)\n    suite,bench=case.split('.')"),
 ("main_aggregate=not c.startswith('Crypto.')","main_aggregate=c in OCTANE_CASES and not c.startswith('Crypto.')"),
 ("GM='geomean", "GM_interval='10000 bootstrap complete rep-round blocks shared across all cases, ratio of medians then suite weights; seed 20261023; percentile 95%',\n      micro_aggregation='none; five separate mechanisms, not an engine ranking',\n      GM='geomean"),
 ("save(HERE/'measurement_manifest.json',m)","for p in [HERE/'micros.py',*sorted((HERE/'cases').glob('*.js'))]:\n        m['inputs'][p.relative_to(ROOT).as_posix()]=sha(p)\n    save(HERE/'measurement_manifest.json',m)"),
 ("assert not any(s in", "assert read(HERE/'machinecode/gate.json')['status']=='EFFECTIVE_INTERVENTION'\n    assert not any(s in"),
 ("environment('pre_formal')", "environment('pre_formal' if not (HERE/'raw/environment/pre_formal.json').exists() else 'resume_'+str(time.time_ns()))")])
transform('diagnostic.py',[
 ("HERE/'recovery/sources/base.tar.gz'","PREVIOUS/'recovery/sources/base.tar.gz'"),
 ("for v in ['B','C']:","for v in ['C','D']:"),
 ("exec(compile(source,", "actual_source=source.replace('static JSValue JS_GetPropertyInternalWithIC(', 'static force_inline JSValue JS_GetPropertyInternalWithIC(') if v=='D' else source\n        exec(compile(actual_source,"),
 ("counter_layout_same_B_C=True","counter_layout_same_C_D=True"),
 ("campaign='slotfix_attempt01'","campaign='read_hit_attempt01'"),
 ("assert 'PASS' in r['stdout'] or 'TEB_RESULT:' in r['stdout']","assert 'PASS' in r['stdout'] or 'TEB_RESULT:' in r['stdout']"),
 ("save(HERE/'diagnostic_manifest.json',", "save(HERE/'diagnostic_manifest.json',"),
 ("for case in CASES:","for case in CASES:")])
# Only octane()/all() collector used here; old micros() describes B vs C and is NOT an entry.
transform('memory.py',[("for case in CASES:","for case in OCTANE_CASES:"),("['ABC','BCA','CAB']","['ACD','CDA','DAC']")])
for name in ['legacy_regression.js','multislot.js','roundtrip_slots.c','legacy_timer.js']:
    put('correctness/'+name,(P/'correctness'/name).read_bytes())
for name in ['adapter.js','driver.js']:put('inputs/'+name,(P/'inputs'/name).read_bytes())
put('recovery/workload_line_endings.json',(P/'recovery/workload_line_endings.json').read_bytes())
put('.gitignore','generated/\nartifacts/\n__pycache__/\n*.partial\n')
put('.gitattributes','* text=auto eol=lf\n*.gz binary\n*.png binary\n')
print('NEW_TOOLS_CREATED')
