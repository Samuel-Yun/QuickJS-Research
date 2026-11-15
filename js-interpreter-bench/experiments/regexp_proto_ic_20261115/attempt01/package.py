"""Package exactly the measured Release sources; verify patch against frozen C."""
import gzip
import hashlib
import io
import json
from pathlib import Path
import subprocess
import tarfile
import tempfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    m = json.loads((HERE / 'release.manifest.json').read_text())
    parent = ROOT / 'experiments/execution_paths_20261114/attempt01/candidates/TRANSITION_EDGE_STRONG-source.tar.gz'
    assert sha(parent.read_bytes()) == m['parent_archive_sha256']
    assert sha(Path(m['elf']).read_bytes()) == m['elf_sha256']
    src = Path(m['elf']).parent
    data = {name:(src/name).read_bytes() for name in m['sources']}
    for name, value in data.items():
        assert sha(value) == m['sources'][name]
    changed = [n for n in m['sources'] if m['sources'][n] != m['parent_sources'][n]]
    assert sorted(changed) == ['read_ic_opcodes.inc','read_ic_runtime.inc']
    patch = HERE / 'release.feature.patch'
    with tempfile.TemporaryDirectory(prefix='qjs-3b-patch-') as temp:
        temp = Path(temp)
        with tarfile.open(parent) as t:
            for member in t.getmembers():
                if member.isfile():
                    relative = member.name.removeprefix('quickjs-transition-edge/')
                    assert relative in m['parent_sources']
                    target=temp/relative;target.parent.mkdir(parents=True,exist_ok=True)
                    value=t.extractfile(member).read()
                    assert sha(value)==m['parent_sources'][relative]
                    target.write_bytes(value)
        result=subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(patch)],cwd=temp,
                              text=True,capture_output=True,check=True)
        for name,value in data.items():
            assert (temp/name).read_bytes()==value
    out=HERE/'candidate';out.mkdir(exist_ok=True)
    archive=out/'3B_REGEXP_PROTO-source.tar.gz'
    raw=io.BytesIO()
    with tarfile.open(fileobj=raw,mode='w',format=tarfile.USTAR_FORMAT) as t:
        for name,value in sorted(data.items()):
            info=tarfile.TarInfo('quickjs-3b-regexp-proto/'+name)
            info.size=len(value);info.mode=0o644;info.mtime=0
            t.addfile(info,io.BytesIO(value))
    with archive.open('wb') as f:
        with gzip.GzipFile(fileobj=f,mode='wb',mtime=0,filename='') as z:
            z.write(raw.getvalue())
    with tarfile.open(archive) as t:
        assert len(t.getmembers())==34
        for member in t.getmembers():
            assert t.extractfile(member).read()==data[member.name.removeprefix('quickjs-3b-regexp-proto/')]
    manifest=dict(parent_archive_sha256=m['parent_archive_sha256'],
                  source_archive_sha256=sha(archive.read_bytes()),sources=m['sources'],
                  changed_files=changed,patch_sha256=sha(patch.read_bytes()),
                  patch_applies_exactly_to_C=True,measured_release_elf_sha256=m['elf_sha256'],
                  build_command=m['command'],bytecode_representation_changed=False,
                  read_ic_site_bytes=24)
    (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    (out/'patch-application.log').write_text(result.stdout+result.stderr)
    print('PACKAGE_AND_EXACT_PATCH_PASS',manifest['source_archive_sha256'])


if __name__=='__main__':
    main()
