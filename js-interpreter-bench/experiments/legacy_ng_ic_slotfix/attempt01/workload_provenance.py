"""Supplement raw-vs-LF workload identities; never changes frozen manifests/workloads."""
from common import *
def main():
    m=read(HERE/'manifest.json');rows={}
    for p,h in m['inputs'].items():
        if not p.startswith('benchmarks/octane/upstream/'):continue
        raw=(ROOT/p).read_bytes();assert digest(raw)==h
        normalized=raw.replace(b'\r\n',b'\n')
        rows[p]=dict(original_raw_sha256=h,LF_normalized_sha256=digest(normalized),CRLF_count=raw.count(b'\r\n'))
    save(HERE/'recovery/workload_line_endings.json',rows)
    save(HERE/'recovery/workload_provenance.json',dict(repository='https://github.com/chromium/octane.git',commit='570ad1ccfe86e3eecba0636c8f932ac08edec517',
      old_raw_hashes_preserved=True,current_campaign_uses_original_raw_bytes=True,
      future_campaign='LF-only checkout can be accepted only by matching normalized hashes, recording its actual new hashes; never silently overwrite old hashes',
      source='original frozen manifest plus local raw byte verification; official submodule HEAD checked separately'))
    print('WORKLOAD_RAW_LF_PROVENANCE_SAVED',len(rows),flush=True)
if __name__=='__main__':main()
