"""Portable raw/mappings-only profile replay, with every window sample in denominator."""
import argparse,bisect,csv,gzip,hashlib,io,json,math,statistics,struct
from pathlib import Path
from collections import Counter,defaultdict
P=Path(__file__).resolve().parent
CATS=['CALL_ENTRY','CALLER_CALL','CALLEE_EXIT','PROPERTY','LOOP_VALUE','HELPER_OTHER','SHIM_UNKNOWN']
def j(p):return json.loads(p.read_text(encoding='utf8'))
def sha(b):return hashlib.sha256(b).hexdigest()
def write(p,x):
    p.parent.mkdir(parents=True,exist_ok=True);b=(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode('utf8')
    if p.exists():assert p.read_bytes()==b,'no overwrite '+str(p)
    else:p.write_bytes(b)
def csvwrite(p,rr):
    if not rr:return
    s=io.StringIO();w=csv.DictWriter(s,list(rr[0]),lineterminator='\n');w.writeheader();w.writerows(rr);write(p,s.getvalue())
def archive(r,key):
    a=r['sampler_archives'][key];b=(P/a['path']).read_bytes();assert sha(b)==a['sha256'];data=gzip.decompress(b);assert sha(data)==a['uncompressed_sha256'];return data
def maps(text):
    result=[]
    for line in text.splitlines():
        a=line.split(None,5)
        if len(a)<5:continue
        start,end=(int(x,16) for x in a[0].split('-'));result.append(dict(start=start,end=end,perms=a[1],offset=int(a[2],16),path=a[5] if len(a)>5 else ''))
    return result
def normalize(pc,mp,catalog):
    for m in mp:
        if m['start']<=pc<m['end']:
            path=m['path'];module=catalog.get(path)
            if not module:return dict(path=path,link_pc=None,load_bias=None,mapping=m,status='MODULE_UNKNOWN')
            # Match file-page to its PT_LOAD and preserve ELF offset-vaddr relation.
            matching=[s for s in module['segments'] if s['offset']//4096*4096<=m['offset']<(s['offset']+max(s['filesz'],1)+4095)//4096*4096]
            if not matching:return dict(path=path,link_pc=None,load_bias=None,mapping=m,status='SEGMENT_UNKNOWN')
            biases={m['start']-((s['vaddr']//4096*4096)+(m['offset']-s['offset']//4096*4096)) for s in matching}
            if len(biases)!=1:return dict(path=path,link_pc=None,load_bias=None,mapping=m,status='AMBIGUOUS_LOAD_BIAS')
            bias=biases.pop();return dict(path=path,link_pc=pc-bias,load_bias=bias,mapping=m,status='NORMALIZED')
    return dict(path=None,link_pc=None,load_bias=None,mapping=None,status='UNMAPPED')
def describe(x):
    if not x:return dict(count=0,min=None,median=None,mean=None,p10=None,p90=None,max=None)
    x=sorted(x)
    def q(p):
        z=(len(x)-1)*p;i=int(z);return x[i]+(x[min(i+1,len(x)-1)]-x[i])*(z-i)
    return dict(count=len(x),min=x[0],median=statistics.median(x),mean=statistics.mean(x),p10=q(.1),p90=q(.9),max=x[-1])
def main(out):
    manifest=j(P/'manifest.json');catalog=j(P/'mapping/modules.json');ranges=list(csv.DictReader((P/'address_categories.csv').open(encoding='utf8')));ranges.sort(key=lambda x:int(x['start'],16));starts=[int(x['start'],16) for x in ranges]
    assert all(int(a['end'],16)<=int(b['start'],16) for a,b in zip(ranges,ranges[1:]));symbols=list(csv.DictReader((P/'mapping/symbols.csv').open(encoding='utf8')));symbols.sort(key=lambda x:int(x['start']));ss=[int(x['start']) for x in symbols]
    primary=manifest['artifacts']['SHIM_ON']['path'];summ=[];timing=[];details=[];biasrows=[];aggregates=defaultdict(Counter);pcgroups=Counter();allerrors=[]
    for path in sorted((P/'raw/profile').rglob('*.json')):
        r=j(path);m=r.get('sampler');assert r['valid'] and m and r['binary_sha256']==manifest['artifacts']['SHIM_ON']['sha256'];assert m['overflow']==m['clock_errors']==0 and m['threads_before']==m['threads_after']==1
        mp=maps(archive(r,'begin.maps').decode());endmp=maps(archive(r,'end.maps').decode());data=archive(r,'samples.bin');assert len(data)==m['retained']*16
        counts=Counter();unknown=Counter();window=[];outside=0
        for rip,ns in struct.iter_unpack('<QQ',data):
            if not (m['window_start_ns']<=ns<=m['window_stop_ns']):outside+=1;continue
            window.append(ns);n=normalize(rip,mp,catalog);pc=n['link_pc'];category='SHIM_UNKNOWN';reason=n['status'];symbol='UNKNOWN'
            if n['path']==primary and pc is not None:
                si=bisect.bisect_right(ss,pc)-1
                if si>=0 and pc<int(symbols[si]['end']):symbol=symbols[si]['symbol']
                k=bisect.bisect_right(starts,pc)-1
                if k>=0 and pc<int(ranges[k]['end'],16):category=ranges[k]['category'];reason=ranges[k]['basis']
                elif symbol not in ['UNKNOWN','handler','begin','end','copy_maps','thread_count','call_boundary_register']:category='HELPER_OTHER';reason='main ELF helper symbol, calling source unknown'
                else:reason='shim or unresolved main ELF region'
            elif pc is not None:category='HELPER_OTHER';reason='other ELF/module; no JS caller stack available'
            counts[category]+=1;pcgroups[(r['case'],r['rep'],r['period_us'],n['path'] or 'UNMAPPED',hex(pc) if pc is not None else 'UNKNOWN',category,symbol)]+=1
            if category=='SHIM_UNKNOWN':unknown[reason]+=1
            details.append(dict(case=r['case'],rep=r['rep'],period_us=r['period_us'],rip=hex(rip),monotonic_ns=ns,module=n['path'],load_bias=hex(n['load_bias']) if n['load_bias'] is not None else None,link_pc=hex(pc) if pc is not None else None,category=category,symbol=symbol))
        total=len(window);assert total==sum(counts.values());aggregates[r['case']].update(counts)
        merged=dict(case=r['case'],rep=r['rep'],period_us=r['period_us'],N=r['N'],total_window_samples=total,**{c:counts[c] for c in CATS},boundary_samples=sum(counts[c] for c in CATS[:3]),boundary_pct=100*sum(counts[c] for c in CATS[:3])/total if total else None,unknown_pct=100*counts['SHIM_UNKNOWN']/total if total else None)
        summ.append(merged)
        deltas=[(b-a)/1e6 for a,b in zip(window,window[1:])];negative=sum(b<a for a,b in zip(window,window[1:]));assert negative==0
        cpu=(m['window_cpu_stop_ns']-m['window_cpu_start_ns'])/1e9;wall=(m['window_stop_ns']-m['window_start_ns'])/1e9
        timing.append(dict(case=r['case'],rep=r['rep'],requested_period_ms=r['period_us']/1000,N=r['N'],internal_elapsed_ms=r['elapsed_ms'],sampler_window_seconds=wall,window_cpu_seconds=cpu,CPU_utilization=cpu/wall,window_samples=total,samples_per_CPU_second=total/cpu,outside_window_retained_in_raw=outside,overflow=m['overflow'],drained_pending=m['drained_pending'],below30s=r['elapsed_ms']<30000,negative_intervals=negative,**{'interval_'+k+'_ms':v for k,v in describe(deltas).items()}))
        for mm in mp:
            if mm['path']==primary and 'x' in mm['perms']:
                norm=normalize(mm['start'],mp,catalog);biasrows.append(dict(case=r['case'],rep=r['rep'],runtime_start=hex(mm['start']),runtime_end=hex(mm['end']),file_offset=hex(mm['offset']),load_bias=hex(norm['load_bias']) if norm['load_bias'] is not None else None,status=norm['status']))
        if mp!=endmp:allerrors.append(dict(case=r['case'],rep=r['rep'],issue='maps changed; classification uses begin snapshot and unresolved remains unknown'))
    for case,count in sorted(aggregates.items()):
        total=sum(count.values());summ.append(dict(case=case,rep='MERGED',period_us='MIXED',N='same within workload',total_window_samples=total,**{c:count[c] for c in CATS},boundary_samples=sum(count[c] for c in CATS[:3]),boundary_pct=100*sum(count[c] for c in CATS[:3])/total,unknown_pct=100*count['SHIM_UNKNOWN']/total))
    csvwrite(out/'profile_summary.csv',summ);csvwrite(out/'timing_and_delivery.csv',timing);csvwrite(out/'load_bias.csv',biasrows)
    csvwrite(out/'PC_counts.csv',[dict(case=k[0],rep=k[1],period_us=k[2],module=k[3],link_pc=k[4],category=k[5],symbol=k[6],samples=v) for k,v in pcgroups.most_common()])
    if details:
        s=io.StringIO();w=csv.DictWriter(s,list(details[0]),lineterminator='\n');w.writeheader();w.writerows(details);b=gzip.compress(s.getvalue().encode(),mtime=0)
        q=out/'samples_decoded.csv.gz';q.parent.mkdir(parents=True,exist_ok=True)
        if q.exists():assert q.read_bytes()==b
        else:q.write_bytes(b)
    write(out/'audit.json',dict(status='PASS' if not allerrors else 'MAPPING_LIMITATIONS',windows=len(timing),total_window_samples=sum(t['window_samples'] for t in timing),overflow=0,clock_intervals_monotonic=True,raw_only_no_ELF_open=True,partition_denominator='all valid window PC samples, including unknown/helpers',module_or_mapping_errors=allerrors,cases_reaching3000={k:sum(v.values())>=3000 for k,v in aggregates.items()},address_categories_sha256=sha((P/'address_categories.csv').read_bytes())))
    print(json.dumps(dict(windows=len(timing),totals={k:sum(v.values()) for k,v in aggregates.items()}),indent=2))
if __name__=='__main__':
    a=argparse.ArgumentParser();a.add_argument('--output',type=Path,required=True);x=a.parse_args();main(x.output)
