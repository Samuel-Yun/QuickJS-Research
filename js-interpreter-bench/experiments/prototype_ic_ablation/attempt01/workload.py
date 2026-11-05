"""Exact archived H scripts; only common repetition literal may change."""
from common import *
EXPECTED=dict(prototype_method=8390656,own_integer=12288,numeric_control=8386560)
PAYLOAD_MODE='H_FIRST_CALL_INCLUSIVE_MONOTONIC_V1'

def script(case,n,check=False):
    phase='correctness' if check else 'measure'
    source=OLD/'scripts/workloads'/case/f'N{n}.{phase}.js'
    base=n
    if not source.exists():
        base=START_N[case];source=OLD/'scripts/workloads'/case/f'N{base}.{phase}.js'
    raw=source.read_bytes();data=raw
    if n!=base:
        before=(f'"N": {base}' if case=='Richards.Richards' else f'var count={base},').encode()
        after=(f'"N": {n}' if case=='Richards.Richards' else f'var count={n},').encode()
        assert raw.count(before)==1,(case,base,n);data=raw.replace(before,after,1)
    p=HERE/'scripts/workloads'/case/f'N{n}.{phase}.js';save(p,data)
    save(HERE/'scripts/identities'/case/f'N{n}.{phase}.json',dict(origin_relative=source.relative_to(ROOT).as_posix(),origin_sha256=sha(source),script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),original_N=base,N=n,change='none; exact byte copy' if n==base else 'common outer repetition literal only; core/adapter unchanged'))
    return p

def valid_payload(r,case,n,check):
    assert r['exit_code']==0 and not r['stderr'] and not r['timeout']
    lines=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M);assert len(lines)==1
    d=json.loads(lines[0]);assert d['case']==case and d['N']==n and d['mode']==PAYLOAD_MODE and d['correctness']=='PASS' and d['warmup_calls']==0
    if case!='Richards.Richards':assert d['last']==EXPECTED[case] and d['checksum']==n*EXPECTED[case] and n*EXPECTED[case]<2**53
    if not check:
        e=d['elapsed_ms'];assert e>0 and __import__('math').isfinite(e) and e==d['stop_ms']-d['start_ms'] and e<=r['outer_wall_ns']/1e6+5
    return d
