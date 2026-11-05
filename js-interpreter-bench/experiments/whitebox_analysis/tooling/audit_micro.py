"""Independent raw-position, checksum, clock, preservation and statistics audit."""
import collections, csv, itertools, json, math, statistics
from datetime import datetime,timedelta
from pathlib import Path
import common as c

VARIANTS=('richards_fields','richards_cached','navier_array','navier_f64')
PAIRS={'V8/QJS':('v8','quickjs'),'JSC/QJS':('jsc','quickjs'),'JSC/V8':('jsc','v8')}

def records(stage):
    return [c.read(p) for p in sorted((c.ATTEMPT/'raw/records'/stage).glob('*.json'))]

def stats(xs):
    x=sorted(xs);mid=len(x)//2
    return {'samples':len(x),'median_ms':statistics.median(x),'mean_ms':statistics.mean(x),
        'sample_stddev_ms':statistics.stdev(x),'IQR_ms':statistics.median(x[-mid:])-statistics.median(x[:mid]),
        'min_ms':min(x),'max_ms':max(x)}

def main():
    c.verify(check_preservation=True)
    design=c.read(c.ATTEMPT/'microbench/design.json');manifest=c.manifest()
    oracle=c.read(c.ATTEMPT/'microbench/oracle_manifest.json')
    if c.sha(c.ATTEMPT/'microbench/oracle')!=oracle['binary_sha256'] or c.sha(c.BASE/'tooling/oracle.c')!=oracle['source_sha256']:
        raise RuntimeError('independent oracle changed')
    for path,expected in design['inputs'].items():
        if c.sha(c.ROOT/path)!=expected:raise RuntimeError('frozen input changed '+path)
    jobs=c.read(c.ATTEMPT/'microbench/schedule.json')
    expected={(j['variant'],e,j['rep'],pos) for j in jobs for pos,e in enumerate(j['permutation'],1)}
    allrows=records('formal');positions=collections.Counter((r['variant'],r['engine'],r['rep'],r['order']) for r in allrows)
    errors=[]
    if set(positions)!=expected or any(n!=1 for n in positions.values()):errors.append('formal positions missing/duplicate')
    pergroup=collections.Counter((r['variant'],r['engine']) for r in allrows if r['valid'])
    for v in VARIANTS:
        for e in c.ENGINES:
            if pergroup[v,e]!=30:errors.append('group not 30 '+v+'/'+e)
    permutations={v:collections.Counter(tuple(j['permutation']) for j in jobs if j['variant']==v) for v in VARIANTS}
    if any(set(p)!=set(itertools.permutations(c.ENGINES)) or set(p.values())!={5} for p in permutations.values()):errors.append('permutation imbalance')
    for v in VARIANTS:
        for e in c.ENGINES:
            if [sum(r['variant']==v and r['engine']==e and r['order']==pos for r in allrows) for pos in (1,2,3)]!=[10,10,10]:errors.append('position imbalance')
    checks=records('correctness');selectedchecks=records('selected_correctness');cal=records('calibration')
    if len(checks)!=24 or not all(r['valid'] for r in checks):errors.append('N1/2 correctness gate')
    if len(selectedchecks)!=12 or not all(r['valid'] for r in selectedchecks):errors.append('selected correctness gate')
    selected=c.read(c.ATTEMPT/'microbench/selected_n.json')
    for group,n in selected.items():
        relevant=[r for r in cal if r['case']==group]
        powers=sorted(set(r['N'] for r in relevant))
        if powers!=[2**k for k in range(int(math.log2(n))+1)]:errors.append('calibration powers')
        for k in powers:
            rr=[r for r in relevant if r['N']==k]
            if len(rr)!=6 or not all(r['valid'] for r in rr):errors.append('calibration group incomplete')
            if all(r['elapsed_ms']>=1000 for r in rr)!=(k==n):errors.append('not first qualifying common N')
    # Recheck actual stdout, script bytes, exact frozen command, oracle and clocks.
    byvariant_hash={};boots=set();below=0
    for r in checks+selectedchecks+cal+allrows:
        import re
        matches=re.findall(r'^WB_RESULT:(.*)$',r['stdout'],re.M)
        if len(matches)!=1:errors.append('nonunique payload');continue
        p=json.loads(matches[0]);script=c.ATTEMPT/'microbench/generated'/f"{r['variant']}.N{r['N']}.js"
        checksum=(163840*r['N'])&0xffffffff if r['case']=='richards' else int(c.read(c.ATTEMPT/'raw'/f"oracle.N{r['N']}.json")['stdout'].strip())
        if p['checksum']!=checksum or p['correctness']!='PASS':errors.append('independent checksum mismatch')
        ms=p['elapsed_ms']
        if not math.isfinite(ms) or ms<=0 or ms>r['outer_wall_ns']/1e6+5:errors.append('clock chain')
        if r['outer_stop_ns']-r['outer_start_ns']!=r['outer_wall_ns']:errors.append('outer subtraction')
        if not math.isclose(p['stop_ms']-p['start_ms'],ms,rel_tol=0,abs_tol=1e-9):errors.append('inner subtraction')
        if r['script_sha256']!=c.sha(script) or r['command']!=c.command(r['engine'],script):errors.append('script/command mismatch')
        if r['binary_sha256']!=manifest['runtime']['engines'][r['engine']]['binary']['sha256'] or r['flags']!=manifest['runtime']['engines'][r['engine']]['runtime_flags']:errors.append('runtime/flags mismatch')
        if r['adapters']!=manifest['adapters'][r['engine']] or r['design_sha256']!=c.sha(c.ATTEMPT/'microbench/design.json'):errors.append('adapter/design mismatch')
        byvariant_hash.setdefault((r['variant'],r['N']),set()).add(r['script_sha256']);boots.add(r['boot_id'])
        if r['stage']=='formal' and ms<1000:below+=1
    if any(len(h)!=1 for h in byvariant_hash.values()):errors.append('engine script not identical')
    # Diagnostic and formal process spans must not overlap within a boot.
    diagnostics=[c.read(p) for p in (c.ATTEMPT/'raw').glob('*.json') if not p.name.startswith('sample.')]
    overlap=[]
    for r in allrows:
        for d in diagnostics:
            if d.get('boot_id')==r['boot_id'] and max(d['outer_start_ns'],r['outer_start_ns'])<min(d['outer_stop_ns'],r['outer_stop_ns']):overlap.append(d['command'])
    if overlap:errors.append('diagnostic/formal overlap')
    for stage,rows in [('formal',allrows),('correctness',checks+selectedchecks),('calibration',cal)]:
        c.export(c.ATTEMPT/'raw'/(stage+'.csv'),rows)
    if errors:
        print(json.dumps({'status':'FAIL','errors':errors,'formal_count':len(allrows)},indent=2));raise RuntimeError('independent audit failed; no success report written')
    table=[];med={}
    for v in VARIANTS:
        for e in c.ENGINES:
            x=[r['elapsed_ms']/r['N'] for r in allrows if r['variant']==v and r['engine']==e]
            result=stats(x);med[v,e]=result['median_ms'];table.append({'variant':v,'engine':e,'N':selected['richards' if v.startswith('richards') else 'navier'],**result})
    c.export(c.ATTEMPT/'summary/per_variant.csv',table)
    ratios=[{'variant':v,**{p:med[v,a]/med[v,b] for p,(a,b) in PAIRS.items()}} for v in VARIANTS]
    contrasts=[{'group':g,'engine':e,'A':a,'B':b,'B/A':med[b,e]/med[a,e]} for g,a,b in
        [('richards','richards_fields','richards_cached'),('navier','navier_array','navier_f64')] for e in c.ENGINES]
    c.export(c.ATTEMPT/'summary/engine_ratios.csv',ratios);c.export(c.ATTEMPT/'summary/contrasts.csv',contrasts)
    # Independently read the serialized CSV and recompute statistics again.
    with (c.ATTEMPT/'raw/formal.csv').open(newline='') as f:csvrows=list(csv.DictReader(f))
    with (c.ATTEMPT/'summary/per_variant.csv').open(newline='') as f:saved=list(csv.DictReader(f))
    for rr in saved:
        vals=stats([float(r['elapsed_ms'])/int(r['N']) for r in csvrows if r['variant']==rr['variant'] and r['engine']==rr['engine']])
        for k,v in vals.items():
            if not math.isclose(float(rr[k]),v,rel_tol=1e-12,abs_tol=1e-12):raise RuntimeError('CSV statistics roundtrip failed')
    if not (c.ATTEMPT/'environment.after.json').exists():
        c.baseline.environment(c.ATTEMPT/'environment.after.json')
    c.save(c.ATTEMPT/'summary/formal_audit.json',{'status':'PASS','formal_valid':len(allrows),'formal_expected':360,
        'correctness_N1_N2':24,'selected_correctness':12,'calibration_count':len(cal),'selected_N':selected,
        'six_permutations_each_five':True,'engine_each_position_ten':True,'same_variant_N_bytes':True,
        'old_data_preservation':'PASS','runtime_flags_dependencies_hashes':'PASS','monotonic_consistency':'PASS',
        'statistics_CSV_independently_recomputed':'PASS','diagnostic_formal_separation':'PASS',
        'below_calibration_threshold_retained':below,'boot_ids':sorted(boots),'failures':[]})
    print(json.dumps({'status':'FORMAL_AUDIT_PASS','samples':len(allrows),'contrasts':contrasts,'ratios':ratios},indent=2),flush=True)

if __name__=='__main__':main()
