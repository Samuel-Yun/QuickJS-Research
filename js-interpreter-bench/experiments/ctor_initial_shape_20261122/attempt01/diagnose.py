"""Aggregate per-site/per-constructor traces; never use trace timings."""
import argparse
import collections
import json
import os

from run import HERE,PACKAGE,TREE,b,v,sha,save


def main():
    p=argparse.ArgumentParser();p.add_argument('--labels',nargs='+',default=['SPARSE','P2','P2_COLD'])
    p.add_argument('--output',default='diagnostics');args=p.parse_args()
    out=HERE/args.output;out.mkdir(exist_ok=False);b.H=out
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C');os.sched_setaffinity(0,{2})
    summaries={}
    for label in args.labels:
        m=json.loads((HERE/(label+'.diag.manifest.json')).read_text());assert sha(m['binary'])==m['binary_sha256']
        r=b.capture([m['binary'],str(PACKAGE/'tests'/TREE['path'])],'diagnostic',label,timeout=600,
            identity=dict(label=label,binary_sha256=m['binary_sha256'],N=TREE['N']))
        assert r['exit_code']==0 and not r['timeout'],r['stderr'][-3000:]
        data=[json.loads(s.removeprefix('TEB_RESULT:')) for s in r['stdout'].splitlines() if s.startswith('TEB_RESULT:')]
        assert len(data)==1;v.validate(data[0],'sunspider',TREE)
        lines=[s.removeprefix('CTOR_TRACE:') for s in r['stderr'].splitlines() if s.startswith('CTOR_TRACE:')]
        assert len(lines)==1 and len(r['stderr'].splitlines())==1
        trace=json.loads(lines[0]);assert not trace['overflow']
        save(out/(label+'.trace.json'),trace)
        keys=[k for k in trace['rows'][0] if k not in ['site_id','bytecode_id','pc','function','filename','ctor_id','ctor_address','constructor']]
        total={k:sum(r[k] for r in trace['rows']) for k in keys}
        assert total['calls']==10770432
        assert total['primary_hits']+total['secondary_hits']<=total['calls']
        sites=collections.defaultdict(list)
        for row in trace['rows']:sites[row['site_id']].append(row)
        aggregate=[]
        for sid,rows in sites.items():
            a=rows[0];s=dict(site_id=sid,function=a['function'],pc=a['pc'],bytecode_id=a['bytecode_id'])
            s.update({k:sum(r[k] for r in rows) for k in keys})
            s['constructor_identities']=len(rows)
            s['top_constructors']=sorted(rows,key=lambda r:r['calls'],reverse=True)[:2]
            aggregate.append(s)
        aggregate.sort(key=lambda r:r['calls'],reverse=True)
        summaries[label]=dict(totals=total,sites=aggregate,top_sites=aggregate[:2])
        print(label,json.dumps(total),flush=True)
        for a in aggregate[:2]:print('TOP',label,a['function'],a['pc'],'calls',a['calls'],'before-initial',a['before_initial_missing'],'pub',a['published'],flush=True)
    save(out/'summary.json',summaries);save(out/'complete.json',dict(status='PASS',labels=args.labels))


if __name__=='__main__':main()
