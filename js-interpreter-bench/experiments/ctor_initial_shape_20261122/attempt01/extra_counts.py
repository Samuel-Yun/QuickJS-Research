import json
import os

from run import HERE,ROOT,PACKAGE,TREE,b,v,sha,save


def main():
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C');os.sched_setaffinity(0,{2})
    out=HERE/'extra_counts';out.mkdir(exist_ok=False);b.H=out
    micros=[]
    for label in ['P2','P2_KEEP_PRIMARY']:
        m=json.loads((HERE/(label+'.diag.manifest.json')).read_text())
        for pattern in ['all','alternate','rotate3','c_then_e','ccdd_c_e']:
            r=b.capture([m['binary'],str(HERE/'micro.js'),pattern,'65536'],'micro',label+'.'+pattern,timeout=120)
            assert r['exit_code']==0 and not r['timeout'],r['stderr'][-2000:]
            payload=json.loads(r['stdout']);assert payload['checksum']==655360
            trace=json.loads(r['stderr'].removeprefix('CTOR_TRACE:'));assert not trace['overflow']
            keys=[k for k in trace['rows'][0] if k not in ['site_id','bytecode_id','pc','function','filename','ctor_id','ctor_address','constructor']]
            total={k:sum(x[k] for x in trace['rows']) for k in keys}
            micros.append(dict(label=label,pattern=pattern,totals=total,rows=trace['rows']))
    save(out/'micros.json',micros)
    old=ROOT/'experiments/ic_screen_round2_20261122/attempt01';light={}
    for label,src in [('SPARSE','SPARSE'),('P2','OLD_P2'),('P2_COLD','P2_COLD')]:
        m=json.loads((old/(src+'.counts.manifest.json')).read_text());assert sha(m['binary'])==m['binary_sha256']
        r=b.capture([m['binary'],str(PACKAGE/'tests'/TREE['path'])],'light',label,timeout=600)
        assert r['exit_code']==0 and not r['timeout'],r['stderr'][-2000:]
        c=json.loads(r['stderr'].removeprefix('SCREEN_COUNTS:'))
        detailed=json.loads((HERE/'diagnostics/summary.json').read_text())[label]['totals']
        values=dict(primary_hits=c['positive_hits']-c['second_hits'],secondary_hits=c['second_hits'],published=c['plan_publications'])
        light[label]=dict(light=values,detailed={k:detailed[k] for k in values},same_distribution=all(values[k]==detailed[k] for k in values))
        print('LIGHT_COMPARE',label,light[label],flush=True)
    save(out/'light_comparison.json',light);save(out/'complete.json',dict(status='PASS'))


if __name__=='__main__':main()
