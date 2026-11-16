"""Second implementation of counts/order/checksum/summary checks, no runtime."""
import csv,hashlib,json,math,statistics
from collections import Counter,defaultdict
from pathlib import Path
BASE=Path(__file__).resolve().parent
def read(p):return json.loads(p.read_text(encoding='utf8'))
def main():
    records=[read(p) for p in (BASE/'raw/formal').rglob('*.json')]
    groups=defaultdict(list);quads=defaultdict(list);position=Counter();errors=[]
    def check(v,s):
        if not v:errors.append(s)
    for r in records:
        groups[(r['case'],r['condition'])].append(r);quads[(r['case'],r['rep'])].append(r);position[(r['case'],r['condition'],r['order'])]+=1
        d=json.loads(r['stdout'].split('TEB_RESULT:',1)[1]);check(r['exit_code']==0 and not r['stderr'] and d['correctness']=='PASS','correctness')
        check(d['N']==r['N'] and d['warmup_calls']==0 and d['elapsed_ms']==r['elapsed_ms'],'payload')
        check(0<d['elapsed_ms']<=r['outer_wall_ns']/1e6+5,'clock enclosure')
    check(len(records)==360 and len(groups)==12 and len(quads)==90,'counts')
    expected={'QJS_A','QJS_M','V8_ON','V8_OFF'}
    for key,rs in quads.items():
        check(len(rs)==4 and {r['condition'] for r in rs}==expected,'quad completeness')
        check(len({r['script_sha256'] for r in rs})==len({r['N'] for r in rs})==1,'common script/N')
        check(sorted(r['order'] for r in rs)==[0,1,2,3],'order')
    for (case,c),rs in groups.items():
        check(len(rs)==30 and len({r['rep'] for r in rs})==30,'group30')
        check(sorted(position[(case,c,i)] for i in range(4))==[7,7,8,8],'position 7/8')
    for s in csv.DictReader((BASE/'analysis/statistics.csv').open()):
        rs=groups[(s['case'],s['condition'])]
        vals=[r['elapsed_ms']/r['N'] if s['metric']=='execution' else r['outer_wall_ns']/1e6 for r in rs];vals.sort()
        for key,value in [('median',statistics.median(vals)),('mean',sum(vals)/len(vals)),('sample_sd',statistics.stdev(vals)),('Q1',statistics.median(vals[:15])),('Q3',statistics.median(vals[15:])),('min',min(vals)),('max',max(vals))]:check(math.isclose(value,float(s[key]),rel_tol=1e-12,abs_tol=1e-12),'statistic '+key)
    for s in csv.DictReader((BASE/'analysis/ratios.csv').open()):
        a=statistics.median(r['elapsed_ms']/r['N'] for r in groups[(s['case'],s['numerator'])]);b=statistics.median(r['elapsed_ms']/r['N'] for r in groups[(s['case'],s['denominator'])]);check(math.isclose(a/b,float(s['ratio']),rel_tol=1e-12),'ratio')
    ordered=sorted(records,key=lambda r:r['outer_start_ns']);check(all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(ordered,ordered[1:])),'serial')
    check(len({r['boot_id'] for r in records})==1,'single formal boot')
    for r in records:
        check(hashlib.sha256((BASE/r['script_relative']).read_bytes()).hexdigest()==r['script_sha256'],'actual script SHA')
    result=dict(status='PASS' if not errors else 'FAILED',formal=len(records),groups=len(groups),quadruples=len(quads),errors=errors,old_binary_paths_opened=False,bootstrap_reimplemented=False,note='independent descriptive/count/schedule check; bootstrap audited by portable replay not independent CI algorithm')
    p=BASE/'analysis/independent_audit.json';assert not p.exists();p.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
    assert not errors
if __name__=='__main__':main()
