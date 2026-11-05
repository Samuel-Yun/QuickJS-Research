"""Read-only post-campaign identity check; only writes new closing evidence."""
import gzip
import hashlib
import platform
import subprocess
import time
from pathlib import Path
from run import HERE,STORE,read,save,sha,stamp,verify


def main():
    verify();h=read(HERE/'H_manifest.json');assert sha(h['binary'])==h['sha256']
    for name,expected in h['source_files'].items():assert sha(Path(h['source'])/name)==expected,name
    diagnostics=read(HERE/'mechanism_manifest.json')
    for label,m in diagnostics.items():
        assert sha(m['path'])==m['sha256']
        for name,expected in m['source_files'].items():assert sha(Path(m['source'])/name)==expected
    extra=[STORE/'H_sanitizer/qjs',STORE/'H_mechanism/internal_check',STORE/'H_mechanism/cow_oom_check']
    save(HERE/'identity_closing.json',dict(status='PASS',timestamp=stamp(),host=platform.node(),kernel=platform.release(),
      boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),monotonic_ns=time.perf_counter_ns(),
      A_M_sources_and_binaries='unchanged',H_source_and_binary='unchanged',mechanism_binaries_and_sources='unchanged',
      extra_test_artifacts=[dict(path=str(p),sha256=sha(p),size=p.stat().st_size,formal=False,hash_observed_at='closing') for p in extra],
      H_ELF_size=Path(h['binary']).stat().st_size,H_SHA256=h['sha256']))
    norms={name:dict(original_M_raw_sha256=expected,LF_normalized_sha256=hashlib.sha256((Path('/home/mzyx/ic_mechanism_audit_attempt01/M')/name).read_bytes().replace(b'\r\n',b'\n')).hexdigest()) for name,expected in read(HERE/'manifest.json')['M_source']['files'].items()}
    save(HERE/'M_source_line_endings.json',norms)
    special=[]
    for p in [HERE/'raw/mechanism/H.internal.json.gz',HERE/'correctness/H.hot.bytecode.gz']:
        raw=gzip.decompress(p.read_bytes());special.append(dict(path=p.relative_to(HERE).as_posix(),compressed_sha256=sha(p),raw_sha256=hashlib.sha256(raw).hexdigest(),raw_bytes=len(raw)))
    save(HERE/'raw/special_archives.json',special)
    print('IDENTITY_CLOSING_PASS',flush=True)


if __name__=='__main__':main()
