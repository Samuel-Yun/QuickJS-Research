"""Offline full-suite comparison to frozen historical controls."""
import argparse,collections,csv,json,math,hashlib,tarfile,io,gzip
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def load(p):return json.loads(p.read_text())
def gm(a):return math.exp(sum(map(math.log,a))/len(a))
def main():
 p=argparse.ArgumentParser();p.add_argument('round');args=p.parse_args();h=HERE/args.round;out=h/'analysis';out.mkdir(exist_ok=True)
 old=ROOT/'experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan'
 refs={'octane':(old/'analysis/octane.csv','candidate_ms'),'sunspider':(old/'analysis/sunspider.csv','candidate_ms')}
 stats=list(csv.DictReader((ROOT/'experiments/native_confirmation_20261108/attempt02/statistics.csv').open()))
 m=load(h/'release.manifest.json');w=Path(m['elf']).parent;assert sha(w/'qjs')==m['elf_sha256']
 for n,v in m['sources'].items():assert sha(w/n)==v
 summaries={};tables=[];coverage=[]
 for suite,(ref,col) in refs.items():
  both={}
  for mode in ['release','counts']:
   folder=h/'runs'/mode/suite;path=folder/'runs.jsonl'
   text=path.read_text() if path.exists() else gzip.open(str(path)+'.gz','rt').read()
   events=[json.loads(l) for l in text.splitlines()]
   n=17 if suite=='octane' else 26
   assert collections.Counter(r['event'] for r in events)=={'sample':n,'process_start':n,'process_result':n}
   both[mode]={r['case']:r for r in events if r['event']=='sample'};assert len(both[mode])==n
   assert all(r['valid'] for r in both[mode].values())
   protocol=load(folder/'protocol.json')
   for info in protocol['scripts'].values():assert sha(info['path'])==info['sha256']
  oldrows=list(csv.DictReader(ref.open()));rows=[]
  assert {r['case'] for r in oldrows}==set(both['release'])==set(both['counts'])
  for r in oldrows:
   c=r['case'];z=both['release'][c];q=both['counts'][c]['counts'];assert z['N']==both['counts'][c]['N'];assert q['attempts']==q['hits']+q['fallbacks']
   v8=next(float(s['median_ms']) for s in stats if s['case']==c and s['condition']=='V8_ON' and s['kind']==suite)
   x=dict(case=c,N=z['N'],A_ms=float(r['A_ms']),EVAL_COLD_ms=float(r['EVAL_COLD_ms']),C_ms=float(r['C_ms']),R3_ms=float(r[col]),candidate_ms=z['ms_per_Run'],V8_ON_ms=v8,attempts=q['attempts'],hits=q['hits'],fallbacks=q['fallbacks'],fills=q['fills'])
   for refname in ['A','EVAL_COLD','C','R3','V8_ON']:x['vs_'+refname+'_pct']=100*(x['candidate_ms']/x[refname+'_ms']-1)
   rows.append(x);coverage.append(dict(suite=suite,case=c,**{k:v for k,v in q.items() if k!='sites'}))
  groups=collections.defaultdict(list)
  for r in rows:groups[r['case'].split('.')[0] if suite=='octane' else r['case']].append(r)
  assert len(groups)==(14 if suite=='octane' else 26)
  s={refname:100*(gm([gm([r['candidate_ms']/r[refname+'_ms'] for r in g]) for g in groups.values()])-1) for refname in ['A','EVAL_COLD','C','R3','V8_ON']}
  s['max_regression']=max(rows,key=lambda r:r['vs_R3_pct'])
  s['hits']=sum(r['hits'] for r in rows);s['attempts']=sum(r['attempts'] for r in rows)
  if True:s['sum_ms']={name:sum(r[name+'_ms'] for r in rows) for name in ['A','EVAL_COLD','C','R3','candidate','V8_ON']}
  summaries[suite]=s
  with (out/(suite+'.csv')).open('w') as f:wr=csv.DictWriter(f,fieldnames=list(rows[0]));wr.writeheader();wr.writerows(rows)
  table=[f'### {suite}', '', '| 表项 | A 旧中位数 | EVAL_COLD 旧中位数 | R3 旧单轮 | 候选新单轮 | 相对 R3 | 相对 A | V8_ON --jitless 旧中位数 | 命中 / 尝试 |', '|---|---:|---:|---:|---:|---:|---:|---:|---:|']
  for r in rows:table.append(f"| {r['case']} | {r['A_ms']:.4f} | {r['EVAL_COLD_ms']:.4f} | {r['R3_ms']:.4f} | {r['candidate_ms']:.4f} | {r['vs_R3_pct']:+.2f}% | {r['vs_A_pct']:+.2f}% | {r['V8_ON_ms']:.4f} | {r['hits']:,} / {r['attempts']:,} |")
  table+=['','几何平均变化：'+'；'.join(f'相对 {name} {s[name]:+.4f}%' for name in ['R3','C','A','EVAL_COLD','V8_ON'])+'。','']
  if True:table+=[str(len(rows))+' 项耗时之和（ms）：'+json.dumps(s['sum_ms'])+'。','']
  (out/(suite+'.md')).write_text('\n'.join(table));tables+=table
 with (out/'coverage.csv').open('w') as f:wr=csv.DictWriter(f,fieldnames=list(coverage[0]));wr.writeheader();wr.writerows(coverage)
 summary=dict(status='PASS',round=args.round,aggregates=summaries,samples=43,independent_counter_processes=43,R3_formal_retests=0,C_formal_retests=0,unit='ms/complete Run',comparison='cross-batch single screening vs historical standalone R3 (not combination); A/EVAL_COLD/V8_ON historical 30 medians')
 (out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
 notes=(h/'method.md').read_text() if (h/'method.md').exists() else ''
 (h/'results.md').write_text(notes+'\n\n'+ '\n'.join(tables))
 raw=io.BytesIO()
 with tarfile.open(fileobj=raw,mode='w',format=tarfile.USTAR_FORMAT) as t:
  for n in sorted(m['sources']):
   v=(w/n).read_bytes();info=tarfile.TarInfo('quickjs-'+args.round+'/'+n);info.size=len(v);info.mode=0o644;info.mtime=0;t.addfile(info,io.BytesIO(v))
 with (h/'source.tar.gz').open('wb') as f:
  with gzip.GzipFile(fileobj=f,mode='wb',mtime=0,filename='') as z:z.write(raw.getvalue())
 (h/'source.sha256').write_text(sha(h/'source.tar.gz')+'  source.tar.gz\n')
 print(json.dumps(summary,indent=2))
if __name__=='__main__':main()
