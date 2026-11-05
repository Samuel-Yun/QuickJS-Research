"""Two new independent raw-only outputs; never runs or locates an engine ELF."""
import tempfile
from analyze import main as analyze
from common import *
def inventory():
    return {p.relative_to(HERE).as_posix():sha(p) for d in ['raw','summary','scripts','cases','materials'] for p in (HERE/d).rglob('*') if p.is_file()}
def main():
    before=inventory();destinations=[];(HERE/'replays').mkdir(exist_ok=True)
    for _ in range(2):
        root=Path(tempfile.mkdtemp(prefix='stats_',dir=HERE/'replays'));out=root/'summary';analyze(out)
        names=sorted(p.name for p in (HERE/'summary').iterdir() if p.is_file())
        assert names==sorted(p.name for p in out.iterdir())
        for name in names:assert sha(out/name)==sha(HERE/'summary'/name),name
        save(root/'replay_audit.json',dict(status='PASS',scope='formal performance statistics and audit from public raw',outputs=names,byte_identical=True,requires_old_ELF=False,performance_samples_started=False))
        destinations.append(root.relative_to(HERE).as_posix())
    assert inventory()==before
    save(HERE/'replay_audit.json',dict(status='PASS',directories=destinations,raw_inputs_and_published_summaries_unchanged=True,numeric_tolerance='byte-identical, stronger than 1e-12',performance_samples_started=False))
    print('TWO_STATISTICS_REPLAYS_PASS',destinations,flush=True)
if __name__=='__main__':main()
