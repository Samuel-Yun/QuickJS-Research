"""Independent eight-process counts/order/descriptive-statistics check, no ELF."""
import csv,json,hashlib,math,statistics
from pathlib import Path
from collections import Counter,defaultdict
BASE=Path(__file__).resolve().parent
def read(p):return json.loads(p.read_text(encoding='utf8'))
def main():
    rs=[read(p) for p in (BASE/'raw/formal').rglob('*.json')];errors=[]
    def check(v,s):
        if not v:errors.append(s)
    groups=defaultdict(list);rounds=defaultdict(list);position=Counter();casefirst=Counter()
    for r in rs:
        groups[(r['case'],r['condition'])].append(r);rounds[r['rep']].append(r);position[(r['case'],r['condition'],r['order'])]+=1
        d=json.loads(r['stdout'].split('TEB_RESULT:',1)[1]);check(r['valid'] and r['exit_code']==0 and not r['stderr'] and d['last']==8390656 and d['checksum']==8390656*r['N'] and d['warmup_calls']==0,'correctness')
        check(d['elapsed_ms']==r['elapsed_ms'] and 0<r['elapsed_ms']<=r['outer_wall_ns']/1e6+5,'clock enclosure')
        check(hashlib.sha256((BASE/r['script_relative']).read_bytes()).hexdigest()==r['script_sha256'],'script SHA')
    check(len(rs)==240 and len(groups)==8 and len(rounds)==30,'counts')
    expected={(case,c) for case in ['own_method_control','inherited_method'] for c in ['QJS_A','QJS_M','V8_ON','V8_OFF']}
    for rep,rr in rounds.items():
        check(len(rr)==8 and {(r['case'],r['condition']) for r in rr}==expected,'complete8 round')
        rr.sort(key=lambda r:r['outer_start_ns']);casefirst[rr[0]['case']]+=1
        check(len({r['case'] for r in rr[:4]})==len({r['case'] for r in rr[4:]})==1,'adjacent four-condition block')
    check(sorted(casefirst.values())==[15,15],'case15/15')
    for key,g in groups.items():
        check(len(g)==30 and len({r['rep'] for r in g})==30,'group30')
        check(sorted(position[(*key,i)] for i in range(4))==[7,7,8,8],'condition7/8')
    for s in csv.DictReader((BASE/'analysis/summary.csv').open()):
        g=groups[(s['case'],s['condition'])];v=sorted(r['elapsed_ms']/r['N'] if s['metric']=='execution' else r['outer_wall_ns']/1e6 for r in g)
        for key,value in [('median',statistics.median(v)),('mean',sum(v)/len(v)),('sample_stddev',statistics.stdev(v)),('Q1',statistics.median(v[:15])),('Q3',statistics.median(v[15:])),('min',min(v)),('max',max(v))]:check(math.isclose(value,float(s[key]),rel_tol=1e-12,abs_tol=1e-12),'stat '+key)
    for s in csv.DictReader((BASE/'analysis/ratios.csv').open()):
        a=statistics.median(r['elapsed_ms']/r['N'] for r in groups[(s['numerator_case'],s['numerator_condition'])]);b=statistics.median(r['elapsed_ms']/r['N'] for r in groups[(s['denominator_case'],s['denominator_condition'])]);check(math.isclose(a/b,float(s['ratio']),rel_tol=1e-12),'ratio')
    ordered=sorted(rs,key=lambda r:r['outer_start_ns']);check(all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(ordered,ordered[1:])),'serial');check(len({r['boot_id'] for r in rs})==1,'single boot')
    result=dict(status='PASS' if not errors else 'FAILED',records=len(rs),complete_rounds=len(rounds),groups=len(groups),errors=errors,old_binary_paths_opened=False,bootstrap_independently_reimplemented=False)
    p=BASE/'analysis/independent_audit.json';assert not p.exists();p.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result));assert not errors
if __name__=='__main__':main()
