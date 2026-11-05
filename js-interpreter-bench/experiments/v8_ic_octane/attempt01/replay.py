"""Two fresh raw-only output directories; no ELF and no sampling."""
import tempfile
from common import *
from analyze import main as analyze
def inventory():return {p.relative_to(HERE).as_posix():sha(p) for d in ['raw','summary','scripts','inputs','crypto','selected'] for p in (HERE/d).rglob('*') if p.is_file()}
def main():
    before=inventory();destinations=[];(HERE/'replays').mkdir(exist_ok=True)
    for _ in range(2):
        dest=Path(tempfile.mkdtemp(prefix='raw_stats_',dir=HERE/'replays'));out=dest/'summary';analyze(out)
        names=sorted(p.name for p in (HERE/'summary').iterdir() if p.is_file());assert names==sorted(p.name for p in out.iterdir())
        for name in names:assert sha(out/name)==sha(HERE/'summary'/name),name
        save(dest/'replay_audit.json',dict(status='PASS',outputs=names,byte_identical=True,requires_old_ELF=False,starts_engine=False));destinations.append(dest.relative_to(HERE).as_posix())
    assert before==inventory();save(HERE/'replay_audit.json',dict(status='PASS',directories=destinations,raw_and_published_results_unchanged=True,comparison='byte identical',starts_engine=False));print('TWO_RAW_STATISTICS_REPLAYS_PASS',flush=True)
if __name__=='__main__':main()
