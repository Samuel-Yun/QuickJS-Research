"""Replay evidence only: this blocked attempt has no performance data to bootstrap."""
import tempfile
import review
from common import *
def main():
 before={p.relative_to(HERE).as_posix():sha(p) for sub in ['raw','summary','source','correctness'] for p in (HERE/sub).rglob('*') if p.is_file()};(HERE/'replays').mkdir(exist_ok=True)
 dest=Path(tempfile.mkdtemp(prefix='evidence_',dir=HERE/'replays'));review.main(dest);files=[]
 for p in sorted(dest.iterdir()):
  assert p.read_bytes()==(HERE/'summary'/p.name).read_bytes(),p.name;files.append(p.name)
 for p,h in before.items():assert sha(HERE/p)==h
 save(dest/'replay_audit.json',dict(status='PASS',scope='capability and correctness evidence ONLY; no performance statistics exist',outputs=files,comparison='byte identical; therefore also within numeric rel/abs 1e-12',raw_and_published_outputs_unchanged=True,requires_old_ELF=False,performance_samples_started=False))
 print('EVIDENCE_REPLAY_PASS',dest,len(files))
if __name__=='__main__':main()
