"""New output directory, raw-only statistics; numeric rel/abs tolerance 1e-12."""
import argparse,math,tempfile
import analyze
from common import *
def comparable(p):
 if p.suffix=='.csv':
  with p.open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
 return p.read_text(encoding='utf-8')
def same(a,b):
 if isinstance(a,list):return isinstance(b,list) and len(a)==len(b) and all(same(x,y) for x,y in zip(a,b))
 if isinstance(a,dict):return a.keys()==b.keys() and all(same(a[k],b[k]) for k in a)
 try:return math.isclose(float(a),float(b),rel_tol=1e-12,abs_tol=1e-12)
 except (ValueError,TypeError):return a==b
def main():
 snapshot={p.relative_to(HERE).as_posix():sha(p) for root in ['raw','analysis','diagnostic/raw'] for p in sorted((HERE/root).rglob('*')) if p.is_file()}
 target=Path(tempfile.mkdtemp(prefix='replay_',dir=HERE/'replays'));analyze.analyze(target)
 checks=[]
 for p in sorted(target.iterdir()):
  assert same(comparable(p),comparable(HERE/'analysis'/p.name)),p.name;checks.append(dict(file=p.name,status='PASS'))
 for p,h in snapshot.items():assert sha(HERE/p)==h,p
 save(target/'audit.json',dict(status='PASS',outputs=checks,rel_tol=1e-12,abs_tol=1e-12,raw_and_published_outputs_unchanged=True,requires_old_ELF=False,replayed_at=stamp()))
 print('PORTABLE_REPLAY_PASS',target,len(checks))
if __name__=='__main__':
 (HERE/'replays').mkdir(exist_ok=True);main()
