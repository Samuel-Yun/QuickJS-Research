"""Offline mapping. Frequencies, native-PC regions and operation contexts stay distinct."""
import collections
import csv
import hashlib
import json
import re
import statistics
import struct
import sys
from pathlib import Path
import run as r
HERE,ROOT,save,read,sha,export=r.HERE,r.ROOT,r.save,r.read,r.sha,r.export
UP=r.UP

def rows(path):
    with path.open(newline='',encoding='utf-8') as f:return list(csv.DictReader(f))

def integerize(d):
    strings={'bytecode_hex','filename','name','source','opcode_name','property','tags'}
    return {k:int(v) if k not in strings and re.fullmatch(r'-?\d+',v or '') else v for k,v in d.items()}

def identity(label):
    funcs={int(x['id']):integerize(x) for x in rows(HERE/'raw'/f'{label}.functions.csv')}
    sites={int(x['id']):integerize(x) for x in rows(HERE/'raw'/f'{label}.sites.csv')}
    original=(UP/'richards.js').read_bytes();script=r.source(1)
    shift=script[:script.index(original)].count(b'\n')
    defs={}
    for line,text in enumerate(original.decode().splitlines(),1):
        m=re.search(r'([\w.]+)\s*=\s*function\s*\(',text)
        if not m:m=re.search(r'function\s+(\w+)\(',text)
        if m:defs[line]=m[1]
    for f in funcs.values():
        f['richards_line']=f['line']-shift if '/scripts/original.' in f['filename'] else None
        f['label']=defs.get(f['richards_line'],f['name'] or '<anonymous>')
        raw=bytes.fromhex(f['bytecode_hex']);assert len(raw)==f['byte_length']
        f['bytecode_sha256']=hashlib.sha256(raw).hexdigest()
        f['stable_id']=hashlib.sha256((str(f['line'])+':'+str(f['col'])+':'+f['source']+':'+f['bytecode_sha256']).encode()).hexdigest()
        # File and source content are retained, not just function names/addresses.
    for s in sites.values():
        f=funcs[s['fid']];s['function']=f['label'];s['function_stable_id']=f['stable_id']
        s['site_key']=f['stable_id']+':'+str(s['offset'])
        s['source_line']=s['line']-shift if f['richards_line'] in defs else None
    return funcs,sites

def counts():
    f1,s1=identity('counts_N1');f2,s2=identity('counts_N2')
    keyed2={s['site_key']:s for s in s2.values()}
    active=[s for s in s1.values() if s['ops']]
    cols=['ops','probes','probe_hit','probe_miss','own','prototype','missing','fallback','fast_write']+[f'depth{i}' for i in range(7)]+['depth7plus']
    for s in active:
        assert s['site_key'] in keyed2,s
        for k in cols:assert keyed2[s['site_key']][k]==2*s[k],(s,k,keyed2[s['site_key']][k])
    for fn in ('Scheduler.prototype.schedule','TaskControlBlock.prototype.run'):
        found=[s for s in active if s['function']==fn and s['property']=='run' and s['opcode_name']=='get_field2']
        assert len(found)==1 and found[0]['ops']==6573 and found[0]['depth1']==6573 and found[0]['probes']==13146,found
    origins=[integerize(x) for x in rows(HERE/'raw/counts_N1.origins.csv')]
    origins2=[integerize(x) for x in rows(HERE/'raw/counts_N2.origins.csv')]
    assert {o['diagnostic_source_line']:o['probes']*2 for o in origins}=={o['diagnostic_source_line']:o['probes'] for o in origins2}
    src=(r.BUILD/'quickjs.c').read_text().splitlines()
    for o in origins:o['diagnostic_source_text']=src[o['diagnostic_source_line']-1].strip()
    export(HERE/'mapping/find_own_origins.csv',origins)
    export(HERE/'mapping/functions.csv',[{k:v for k,v in f.items() if k!='source'} for f in f1.values()])
    export(HERE/'mapping/sites.csv',list(s1.values()))
    export(HERE/'summary/site_frequencies.csv',sorted(active,key=lambda s:s['probes'],reverse=True))
    agg=collections.defaultdict(lambda:collections.Counter())
    for s in active:
        for k in cols:agg[s['opcode_name']][k]+=s[k]
    export(HERE/'summary/frequency_by_operation.csv',[dict(operation=k,**v) for k,v in agg.items()])
    total=sum(o['probes'] for o in origins);mapped=sum(o['with_site'] for o in origins)
    save(HERE/'summary/count_audit.json',dict(status='PASS',active_property_sites=len(active),
       N1_N2_exact_scaling=True,run_lookups_each_per_Run=6573,all_find_own_probes=total,
       probes_with_site=mapped,probes_without_site=total-mapped,
       operation_counts=sum(s['ops'] for s in active),site_probe_sum=sum(s['probes'] for s in active),
       scope='native counters gated to runRichards entry/exit; frequencies NOT times'))
    # Save every active original function and exact offset decode, not an IR.
    text=(HERE/'bytecode/quickjs.full.txt').read_text()
    headers=list(re.finditer(r'(?m)^(.+):(\d+):(\d+): function:.*$',text))
    widths={m[0]:int(m[1]) for m in re.findall(r'^DEF\(\s*(\w+),\s*(\d+),',(ROOT/'engines/quickjs-upstream/quickjs-opcode.h').read_text(),re.M)}
    blocks={}
    for i,m in enumerate(headers):blocks[(m[1],int(m[2]),int(m[3]))]=text[m.start():headers[i+1].start() if i+1<len(headers) else len(text)]
    for fid in {s['fid'] for s in active}:
        f=f1[fid];block=blocks[(f['filename'],f['line'],f['col'])];pc=0;ins=[]
        for line in block.splitlines():
            m=re.match(r'^\s*(?:(\d+):\s+)?(\w+)(?:\s+(.*))?$',line)
            if m and m[2] in widths:
                if m[1]:assert int(m[1])==pc,(f['label'],line,pc)
                ins.append(dict(offset=pc,opcode=m[2],operands=m[3] or '',size=widths[m[2]]));pc+=widths[m[2]]
        assert pc==f['byte_length'],(f['label'],pc,f['byte_length'])
        byoffset={i['offset']:i for i in ins}
        for s in active:
            if s['fid']==fid:
                assert byoffset[s['offset']]['opcode']==s['opcode_name']
                if s['opcode_name']!='get_length':assert byoffset[s['offset']]['operands']==s['property']
        save(HERE/'bytecode/quickjs'/(f['label']+'.txt'),block)
        save(HERE/'bytecode/quickjs'/(f['label']+'.decoded.json'),ins)
    save(HERE/'summary/offset_audit.json',dict(status='PASS',active_sites_checked=len(active),
        all_offsets_are_final_dump_instruction_starts=True,all_properties_match_dump_operands=True))

def native_symbols(label,binary,pcs):
    unique=sorted(set(pcs));result={}
    if not unique:return result
    rr=r.capture(HERE/'mapping'/f'{label}.symbols.json',['addr2line','-a','-i','-f','-C','-e',str(binary)]+[hex(p) for p in unique])
    assert rr['exit_code']==0
    parts=re.split(r'(?m)^(0x[0-9a-f]+)\n',rr['stdout'])
    for i in range(1,len(parts),2):
        ls=parts[i+1].strip().splitlines();assert len(ls)%2==0,ls
        stack=[dict(function=ls[j],source=ls[j+1]) for j in range(0,len(ls),2)]
        result[int(parts[i],16)]=stack
    assert set(result)==set(unique)
    return result

def parse_sample(label):
    funcs,sites=identity(label);payload=r.check(read(HERE/'raw'/f'{label}.json'))
    data=rows(HERE/'raw'/f'{label}.samples.csv')
    timed=[integerize(x) for x in data if payload['start_ms']*1e6<=int(x['monotonic_ns'])<=payload['stop_ms']*1e6]
    binary=r.BUILD/'qjs';maps=(HERE/'raw'/f'{label}.maps').read_text()
    mappings=[]
    for line in maps.splitlines():
        x=line.split()
        if len(x)>5 and x[-1]==str(binary):mappings.append((*[int(y,16) for y in x[0].split('-')],int(x[2],16)))
    image=binary.read_bytes();phoff=struct.unpack_from('<Q',image,32)[0];es,num=struct.unpack_from('<HH',image,54);loads=[]
    for i in range(num):
        typ,flags,off,va,_,fs,ms,align=struct.unpack_from('<IIQQQQQQ',image,phoff+i*es)
        if typ==1:loads.append((off,va))
    elfpcs=[]
    for x in timed:
        pc=int(x['pc'],16);mm=next((m for m in mappings if m[0]<=pc<m[1]),None);epc=None
        if mm:
            seg=next((p for p in loads if (p[0]&~4095)==mm[2]),None)
            if seg:epc=pc-mm[0]+(seg[1]&~4095)
        x['elf_pc']=epc
        if epc is not None:elfpcs.append(epc)
    symbols=native_symbols(label,binary,elfpcs)
    tally=collections.Counter();byfunc=collections.Counter();bykey=collections.defaultdict(collections.Counter)
    decoded=[]
    for x in timed:
        stack=symbols.get(x['elf_pc'],[]);inner=stack[0]['function'] if stack else 'EXTERNAL_OR_UNMAPPED'
        lookup=(inner=='find_own_property')
        # A separate conservative innermost-DWARF region, not wrapper time.
        s=sites.get(x['site']);valid=s is not None
        tally['internal_samples']+=1;byfunc[inner]+=1
        tally['lookup_region']+=lookup
        tally['lookup_with_site']+=lookup and valid
        tally['lookup_no_site']+=lookup and not valid
        tally['active_context_other_PC']+=valid and not lookup
        tally['transition_invalid']+=x['site']==-1
        tally['no_context']+=x['site']==0
        if valid:
            bykey[s['site_key']]['lookup_samples']+=lookup
            bykey[s['site_key']]['other_context_samples']+=not lookup
        decoded.append(dict(**x,native_function=inner,native_source=stack[0]['source'] if stack else '',
            inlined_stack=stack,lookup_region=lookup,site_valid=valid,function=s['function'] if s else None,
            offset=s['offset'] if s else None,property=s['property'] if s else None,opcode=s['opcode_name'] if s else None,
            site_key=s['site_key'] if s else None))
    export(HERE/'mapping'/f'{label}.samples.decoded.csv',decoded)
    export(HERE/'mapping'/f'{label}.site_samples.csv',[
        dict(site_key=key,function=next(s['function'] for s in sites.values() if s['site_key']==key),
             offset=next(s['offset'] for s in sites.values() if s['site_key']==key),
             property=next(s['property'] for s in sites.values() if s['site_key']==key),**cnt) for key,cnt in bykey.items()])
    times=[x['monotonic_ns']/1e6 for x in timed];spacing=[v-u for u,v in zip(times,times[1:])]
    result=dict(label=label,N=payload['N'],elapsed_ms=payload['elapsed_ms'],counts=dict(tally),
        native_functions=dict(byfunc.most_common()),median_spacing_ms=statistics.median(spacing) if spacing else None,
        min_spacing_ms=min(spacing) if spacing else None,max_spacing_ms=max(spacing) if spacing else None,
        requested_interval_us=read(HERE/'raw'/f'{label}.settings.json')['interval_us'],
        sampled_binary_sha256=sha(binary),dropped_samples=int(re.search(r'dropped=(\d+)',(HERE/'raw'/f'{label}.meta.txt').read_text())[1]))
    save(HERE/'summary'/f'{label}.json',result)
    print(label,dict(tally),'spacing',result['median_spacing_ms'],flush=True)
    return result,bykey

def samples():
    f,s=identity('counts_N1');reference={x['site_key']:x for x in s.values()};pooled=collections.defaultdict(collections.Counter)
    summaries=[]
    for rep in range(1,4):
        for context in (0,1):
            label=f'sample_ctx{context}_rep{rep}'
            summary,tally=parse_sample(label);summaries.append(summary)
            if context:
                for key,v in tally.items():pooled[key].update(v)
    alt,_=parse_sample('sample_ctx1_20ms')
    combined=[]
    denom=sum(x['counts']['internal_samples'] for x in summaries if 'ctx1' in x['label'])
    lookupdenom=sum(x['counts']['lookup_with_site'] for x in summaries if 'ctx1' in x['label'])
    for key,t in pooled.items():
        x=reference.get(key)
        if x is None:continue # Main driver includes N in its bytecode; retain those in individual mapping, not pooled Richards sites.
        combined.append(dict(function=x['function'],offset=x['offset'],source_line=x['source_line'],
            property=x['property'],operation=x['opcode_name'],ops_per_Run=x['ops'],probes_per_Run=x['probes'],
            own_hits=x['own'],prototype_hits=x['prototype'],fallback=x['fallback'],
            lookup_samples=t['lookup_samples'],other_context_samples=t['other_context_samples'],
            fraction_all_internal=t['lookup_samples']/denom,fraction_mapped_lookup=t['lookup_samples']/lookupdenom,
            site_key=key))
    combined.sort(key=lambda x:x['lookup_samples'],reverse=True)
    export(HERE/'summary/site_samples.csv',combined)
    save(HERE/'summary/sampling_summary.json',dict(runs=summaries,alternative=alt,pooled_context_on_internal=denom,
         pooled_context_on_mapped_lookup=lookupdenom,pooled_richards_lookup=sum(x['lookup_samples'] for x in combined)))
    controls=[]
    for rep in range(1,4):
        for context in (0,1):
            label=f'control_nosignal_ctx{context}_rep{rep}';p=r.check(read(HERE/'raw'/f'{label}.json'))
            controls.append(dict(label=label,context=context,rep=rep,N=p['N'],elapsed_ms=p['elapsed_ms'],per_Run_ms=p['elapsed_ms']/p['N']))
    export(HERE/'summary/no_signal_controls.csv',controls)
    export(HERE/'summary/sampling_runs.csv',[dict(label=x['label'],elapsed_ms=x['elapsed_ms'],
        median_spacing_ms=x['median_spacing_ms'],**x['counts']) for x in summaries]+[dict(label=alt['label'],elapsed_ms=alt['elapsed_ms'],median_spacing_ms=alt['median_spacing_ms'],**alt['counts'])])

if __name__=='__main__':
    stage=sys.argv[1] if len(sys.argv)>1 else 'all'
    if stage in ('counts','all'):counts()
    if stage in ('samples','all'):samples()
