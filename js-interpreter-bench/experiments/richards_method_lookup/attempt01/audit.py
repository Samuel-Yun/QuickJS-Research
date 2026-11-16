"""Independent parsing/statistics/order audit; does not import runner validation."""
import ast, collections, csv, itertools, json, math, re, statistics, zipfile
from datetime import datetime
from pathlib import Path
import common as c

def rows(stage): return [c.read(p) for p in sorted((c.HERE/'raw/records'/stage).glob('*.json'))]
def parse(stdout,prefix):
    hits=re.findall('^'+prefix+':(.*)$',stdout,re.M)
    if len(hits)!=1: raise RuntimeError('nonunique '+prefix)
    return json.loads(hits[0])
def stats(xs):
    s=sorted(xs); half=len(s)//2
    return {'samples':len(s),'median_ms_per_Run':statistics.median(s),'mean_ms_per_Run':statistics.mean(s),'sample_stddev':statistics.stdev(s),'tukey_halves_IQR':statistics.median(s[-half:])-statistics.median(s[:half]),'min':min(s),'max':max(s)}

def diagnostics():
    seq=[parse(c.read(p)['stdout'],'ML_SEQUENCE') for p in sorted((c.HERE/'diagnostics/records').glob('sequence.*.json'))]
    if len(seq)!=27 or any(s!=seq[0] for s in seq) or seq[0]['count']!=6573*512: raise RuntimeError('semantic sequence mismatch')
    records=[];over=[]
    for name,v in [('original.overhead.counter','original'),('counter.A','A'),('counter.B','B')]:
        for rep in range(1,4):
            r=c.read(c.HERE/f'diagnostics/records/{name}.{rep}.json');m=parse(r['stdout'],'ML_COUNTERS');p=parse(r['stdout'],'ML_RESULT')
            if r['exit_code']!=0 or p['correctness']!='PASS': raise RuntimeError('diagnostic correctness')
            selected=m['categories'][0];expected=512 if v=='B' else 6573*512
            if selected['lookups']!=expected or selected['prototype_hit']!=expected or selected['hops'][1]!=expected or selected['fallback']!=0 or selected['helper_entries']!=0 or m['selected_entries']!=6573*512: raise RuntimeError('selected path counter mismatch')
            if v!='original' and (m['selected_native_call_helper']!=6573*512 or m['selected_builtin_call_method']!=6573*512): raise RuntimeError('A/B call helpers differ')
            if m['categories'][1]['lookups']!=6573*512: raise RuntimeError('task run attribution')
            records.append({'variant':v,'rep':rep,**m})
    for rep in range(1,4):
        f=parse(c.read(c.HERE/f'diagnostics/records/original.overhead.frozen.{rep}.json')['stdout'],'ML_RESULT')['elapsed_ms']
        d=parse(c.read(c.HERE/f'diagnostics/records/original.overhead.counter.{rep}.json')['stdout'],'ML_RESULT')['elapsed_ms']
        over.append({'rep':rep,'N':512,'frozen_elapsed_ms':f,'diagnostic_elapsed_ms':d,'diagnostic_over_frozen':d/f,'not_formal':True})
    c.export(c.HERE/'diagnostics/counter_summary.csv',records);c.export(c.HERE/'diagnostics/overhead_summary.csv',over)
    bytecodes={}
    for v in ('A','B'):
        info={}
        for e in c.ENGINES:
            text=(c.HERE/f'diagnostics/bytecode/{v}.{e}.txt').read_text()
            if e=='v8':
                if 'mlSchedule' not in text or 'CallProperty1' not in text: raise RuntimeError('V8 bytecode missing')
                info[e]={'schedule_length':int(re.search(r'Bytecode length: (\d+)',text).group(1)),'call_opcode':'CallProperty1 (same A/B)','evidence':f'diagnostics/bytecode/{v}.{e}.txt'}
            elif e=='quickjs':
                block=text[text.index('function: mlSchedule'):]
                end=block.find('\n/mnt/'); block=block[:end] if end>=0 else block
                if 'get_field2 call' not in block or 'call_method 1' not in block: raise RuntimeError('QuickJS call bytecode missing')
                info[e]={'call_opcode':'get_field2 call -> call_method 1 -> js_function_call -> JS_CallInternal','evidence':f'diagnostics/bytecode/{v}.{e}.txt'}
            else:
                if 'mlSchedule#' not in text or 'call' not in text: raise RuntimeError('JSC schedule bytecode missing')
                if 'jneq_ptr' not in text: raise RuntimeError('JSC intrinsic call branch missing')
                info[e]={'call_opcode':'op_call; both mlSchedule functions use jneq_ptr identity guard/direct-call fast branch plus .call fallback. Do NOT assume native .call helper actually called.','evidence':f'diagnostics/bytecode/{v}.{e}.txt'}
        bytecodes[v]=info
    c.save(c.HERE/'diagnostics/audit.json',{'status':'PASS','explicit_Run_loop_counters':True,'sequence_processes':27,'sequence':seq[0],'selected_calls_per_Run':6573,'bytecodes':bytecodes,'per_engine_exact_self_time':'UNKNOWN','sequence_checksum_is_collision_free_proof':False,'counter_build_overhead':'overhead_summary.csv; three paired original processes, not formal/no self-time'})

def main():
    c.verify(True);m=c.manifest();design=c.read(c.HERE/'microbench/design.json')
    for name,h in design['inputs'].items():
        if c.sha(c.HERE/name)!=h: raise RuntimeError('frozen input changed '+name)
    for p in c.HERE.glob('*.py'): ast.parse(p.read_text())
    schedules=c.read(c.HERE/'microbench/schedule.json');selected=c.read(c.HERE/'microbench/selected_n.json')['N']
    formal=rows('formal');gates=rows('correctness');gateN=rows('selected_correctness');pilots=rows('calibration')
    errors=[];below=0;boots=set(); hashes=collections.defaultdict(set)
    expected={(j['variant'],e,j['rep'],pos) for j in schedules for pos,e in enumerate(j['permutation'],1)}
    actual=collections.Counter((r['variant'],r['engine'],r['rep'],r['order']) for r in formal)
    if len(expected)!=180 or set(actual)!=expected or set(actual.values())!={1}: errors.append('formal positions')
    counts=collections.Counter((r['variant'],r['engine']) for r in formal if r['valid'])
    if len(counts)!=6 or set(counts.values())!={30}: errors.append('valid group counts')
    if len(gates)!=12 or len(gateN)!=6: errors.append('correctness counts')
    if {(r['variant'],r['engine'],r['N']) for r in gates}!=set(itertools.product(('A','B'),c.ENGINES,(1,2))): errors.append('correctness combinations')
    for v in ('A','B'):
        pc=collections.Counter(tuple(j['permutation']) for j in schedules if j['variant']==v)
        if set(pc)!=set(itertools.permutations(c.ENGINES)) or set(pc.values())!={5}: errors.append('permutation distribution')
        for e in c.ENGINES:
            if [sum(r['variant']==v and r['engine']==e and r['order']==i for r in formal) for i in (1,2,3)]!=[10]*3: errors.append('engine position distribution')
    if collections.Counter(j['block_variant_order'][0] for j in schedules)!= {'A':30,'B':30}: errors.append('A-first/B-first balance')
    for rep in range(1,31):
        jobs=[j for j in schedules if j['rep']==rep]
        if len(jobs)!=2 or [j['variant'] for j in jobs]!=jobs[0]['block_variant_order']: errors.append('not A/B interleaved')
    for n in [2**i for i in range(int(math.log2(selected))+1)]:
        rr=[r for r in pilots if r['N']==n]
        if len(rr)!=6 or {(r['variant'],r['engine']) for r in rr}!=set(itertools.product(('A','B'),c.ENGINES)): errors.append('pilot incomplete')
        if all(r['elapsed_ms']>=1000 for r in rr)!=(n==selected): errors.append('not first common qualifying N')
    for r in gates+pilots+gateN+formal:
        p=parse(r['stdout'],'ML_RESULT');path=Path(r['script_path']);rt=m['runtime']['engines'][r['engine']]
        aa=[a['path'] for a in m['adapters'][r['engine']]]
        cmd=rt['command_prefix']+(['-I',aa[0],'-I',aa[1],str(path)] if r['engine']=='quickjs' else aa+[str(path)])
        if not r['valid'] or r['exit_code']!=0 or p['checksum']!=str(r['N'])+':2322:928' or p['correctness']!='PASS' or p['original_assertions_per_run']!=1: errors.append('correctness/stdout')
        if r['command']!=cmd or r['flags']!=rt['runtime_flags'] or r['binary_sha256']!=rt['binary']['sha256'] or r['design_sha256']!=c.sha(c.HERE/'microbench/design.json'): errors.append('command/flags/artifact/design')
        if r['dependency_hashes']!={a['path']:a['sha256'] for a in rt['dependencies']+rt['dynamic_libraries']} or r['adapter_hashes']!={a['path']:a['sha256'] for a in m['adapters'][r['engine']]}: errors.append('deps/adapter')
        if c.sha(path)!=r['script_sha256']: errors.append('script bytes')
        ms=p['stop_ms']-p['start_ms']
        if not math.isfinite(ms) or ms<=0 or not math.isclose(ms,p['elapsed_ms'],abs_tol=1e-8,rel_tol=0) or p['elapsed_ms']!=r['elapsed_ms'] or not math.isclose(ms/r['N'],r['elapsed_per_call_ms'],abs_tol=1e-8,rel_tol=0): errors.append('inner clock/arithmetic')
        if r['outer_stop_ns']-r['outer_start_ns']!=r['outer_wall_ns'] or ms>r['outer_wall_ns']/1e6+5: errors.append('outer clock chain')
        if r.get('LD_PRELOAD') or 'ML_COUNTERS:' in r['stdout'] or p['warmup_calls']!=0 or p['mode']!=c.MODE: errors.append('diagnostic contamination')
        hashes[r['variant'],r['N']].add(r['script_sha256']);boots.add(r['boot_id'])
        if r['stage']=='formal' and ms<1000: below+=1
    if any(len(h)!=1 for h in hashes.values()): errors.append('engine input bytes differ')
    if len(boots)!=1: errors.append('boot changed within campaign')
    ordered=sorted(formal,key=lambda r:(r['schedule_index'],r['order']))
    if any(a['outer_stop_ns']>b['outer_start_ns'] for a,b in zip(ordered,ordered[1:])): errors.append('execution order/serial overlap')
    if datetime.fromisoformat(design['created_utc'])>=min(datetime.fromisoformat(r['timestamp_utc']) for r in gates): errors.append('freeze too late')
    other=[c.read(p) for p in (c.HERE/'diagnostics/records').glob('*.json') if not p.name.startswith('sample.')]
    if any(a['boot_id']==b['boot_id'] and max(a['outer_start_ns'],b['outer_start_ns'])<min(a['outer_stop_ns'],b['outer_stop_ns']) for a in formal for b in other): errors.append('diagnostic/formal overlap')
    if errors:
        c.save(c.HERE/'summary/formal_audit.json',{'status':'FAIL','errors':errors,'formal_records':len(formal)});raise RuntimeError(str(errors))
    for stage,rr in [('formal',formal),('correctness',gates+gateN),('calibration',pilots)]: c.export(c.HERE/f'raw/{stage}.csv',rr)
    table=[];med={}
    for v in ('A','B'):
        for e in c.ENGINES:
            s=stats([r['elapsed_ms']/r['N'] for r in formal if (r['variant'],r['engine'])==(v,e)])
            med[v,e]=s['median_ms_per_Run'];table.append({'variant':v,'engine':e,'N':selected,**s})
    c.export(c.HERE/'summary/per_variant.csv',table)
    contrasts=[{'engine':e,'A_median_ms':med['A',e],'B_median_ms':med['B',e],'B_over_A':med['B',e]/med['A',e]} for e in c.ENGINES]
    ratios=[{'variant':v,'V8_over_QJS':med[v,'v8']/med[v,'quickjs'],'JSC_over_QJS':med[v,'jsc']/med[v,'quickjs'],'JSC_over_V8':med[v,'jsc']/med[v,'v8']} for v in ('A','B')]
    c.export(c.HERE/'summary/contrasts.csv',contrasts);c.export(c.HERE/'summary/engine_ratios.csv',ratios)
    with (c.HERE/'raw/formal.csv').open(newline='') as f: reread=list(csv.DictReader(f))
    for r in table:
        s=stats([float(x['elapsed_ms'])/int(x['N']) for x in reread if (x['variant'],x['engine'])==(r['variant'],r['engine'])])
        if any(not math.isclose(s[k],r[k],abs_tol=1e-12,rel_tol=1e-12) for k in s): raise RuntimeError('CSV statistics roundtrip')
    with zipfile.ZipFile(c.HERE/'microbench/formal_bytes.zip') as z:
        for v in ('A','B'):
            if z.read(f'{v}.N{selected}.js')!=(c.HERE/f'microbench/generated/{v}.N{selected}.js').read_bytes(): raise RuntimeError('archive mismatch')
    diagnostics()
    c.save(c.HERE/'summary/formal_audit.json',{'status':'PASS','formal_valid':180,'formal_expected':180,'correctness_N1_N2':12,'selected_N_correctness':6,'pilot_count':len(pilots),'selected_N':selected,'script_bytes_identical_across_engines':True,'six_permutations_each_five':True,'each_engine_position_ten':True,'A_first_B_first_blocks':[15,15],'frozen_design_before_first_pilot':True,'old_data_preservation':'PASS current bytes before/after; historical restoration scope separate','runtime_dependencies_adapters_before_after':'PASS','independent_stdout_clock_and_statistics':'PASS','diagnostic_formal_serial_separation':'PASS','below_threshold_retained':below,'boot_ids':list(boots),'errors':[]})
    print(json.dumps({'status':'PASS','contrasts':contrasts,'ratios':ratios},indent=2),flush=True)

if __name__=='__main__': main()
