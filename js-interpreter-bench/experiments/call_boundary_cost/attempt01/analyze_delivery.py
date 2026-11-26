"""Public raw-only delivery/integrity diagnostics, never performance attribution."""
import argparse,csv,gzip,hashlib,io,json,statistics,struct
from pathlib import Path
P=Path(__file__).resolve().parent
def j(p):return json.loads(p.read_text(encoding='utf8'))
def sha(b):return hashlib.sha256(b).hexdigest()
def write(p,x):
    p.parent.mkdir(parents=True,exist_ok=True);b=(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==b
    else:p.write_bytes(b)
def csvout(p,rr):
    s=io.StringIO();w=csv.DictWriter(s,list(rr[0]),lineterminator='\n');w.writeheader();w.writerows(rr);write(p,s.getvalue())
def desc(a):
    a=sorted(a)
    def q(p):
        x=(len(a)-1)*p;i=int(x);return a[i]+(a[min(i+1,len(a)-1)]-a[i])*(x-i)
    return dict(min=min(a),median=statistics.median(a),mean=statistics.mean(a),p10=q(.1),p90=q(.9),max=max(a)) if a else dict(min=None,median=None,mean=None,p10=None,p90=None,max=None)
def main(out):
    rr=[];integrity=[];cpu=[];utc=[]
    for batch in ['validation_p7000','validation_p23000']:
        records=[j(p) for p in sorted((P/'raw'/batch).rglob('*.json'))]
        for r in records:
            from datetime import datetime
            utc_ms=(datetime.fromisoformat(r['completed_at'])-datetime.fromisoformat(r['timestamp'])).total_seconds()*1000;diff=utc_ms-r['outer_wall_ns']/1e6
            utc.append(dict(batch=batch,case=r['case'],condition=r['condition'],rep=r['rep'],UTC_elapsed_ms=utc_ms,parent_monotonic_ms=r['outer_wall_ns']/1e6,UTC_minus_monotonic_ms=diff,used_for_performance=False))
            cpu.append(dict(batch=batch,case=r['case'],condition=r['condition'],rep=r['rep'],N=r['N'],internal_ms=r['elapsed_ms'],process_wall_ms=r['outer_wall_ns']/1e6,process_user_s=r['child_user_seconds'],process_system_s=r['child_system_seconds'],process_CPU_utilization=(r['child_user_seconds']+r['child_system_seconds'])/(r['outer_wall_ns']/1e9),voluntary_switches=r['child_voluntary_switches'],involuntary_switches=r['child_involuntary_switches']))
            if 'sampler_archives' not in r:continue
            for ext,a in r['sampler_archives'].items():
                b=(P/a['path']).read_bytes();assert sha(b)==a['sha256'];raw=gzip.decompress(b);assert sha(raw)==a['uncompressed_sha256'] and len(raw)==a['bytes'];integrity.append(dict(path=a['path'],compressed_sha256=sha(b),raw_sha256=sha(raw),bytes=len(raw),valid=True))
            meta=r['sampler'];b=gzip.decompress((P/r['sampler_archives']['samples.bin']['path']).read_bytes());assert len(b)==16*meta['retained']
            samples=list(struct.iter_unpack('<QQ',b));inside=[(pc,t) for pc,t in samples if meta['window_start_ns']<=t<=meta['window_stop_ns']];deltas=[(b[1]-a[1])/1e6 for a,b in zip(inside,inside[1:])];assert all(d>=0 for d in deltas)
            wall=(meta['window_stop_ns']-meta['window_start_ns'])/1e9;cpu_s=(meta['window_cpu_stop_ns']-meta['window_cpu_start_ns'])/1e9
            assert meta['overflow']==meta['clock_errors']==0 and meta['threads_before']==meta['threads_after']==1
            rr.append(dict(batch=batch,case=r['case'],condition=r['condition'],rep=r['rep'],requested_ms=meta['period_us']/1000,delivered=meta['delivered'],retained=meta['retained'],window_samples=len(inside),outside_window=len(samples)-len(inside),window_seconds=wall,window_CPU_seconds=cpu_s,window_CPU_utilization=cpu_s/wall,samples_per_CPU_second=len(inside)/cpu_s,overflow=meta['overflow'],drained_pending=meta['drained_pending'],**{'interval_'+k+'_ms':v for k,v in desc(deltas).items()},interpretation='delivery diagnostics only; not accepted original-A cost distribution'))
    csvout(out/'delivery.csv',rr);csvout(out/'CPU_and_switches.csv',cpu);csvout(out/'UTC_consistency.csv',utc);csvout(out/'archive_integrity.csv',integrity)
    write(out/'audit.json',dict(status='PASS',validation_records=len(cpu),sampler_records=len(rr),archive_files=len(integrity),archive_hashes_all_valid=True,overflow=0,monotonic_intervals=True,long_windows=0,profile_cost_attribution='BLOCKED_PERTURBATION',UTC_outliers_retained=[r for r in utc if abs(r['UTC_minus_monotonic_ms'])>1000]))
    print(json.dumps(dict(records=len(cpu),sampler_records=len(rr),archives=len(integrity)),indent=2))
if __name__=='__main__':
    a=argparse.ArgumentParser();a.add_argument('--output',type=Path,required=True);x=a.parse_args();main(x.output)
