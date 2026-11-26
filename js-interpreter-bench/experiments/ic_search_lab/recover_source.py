"""Recover ONE source version into an explicitly supplied empty directory.

No runtime launch, download, old-home dependency, deletion, branch or Git write.
Newly built ELF hashes must be recorded; a different DWARF cwd may change them.
"""
import argparse,hashlib,json
from pathlib import Path
import lab

def main():
    p=argparse.ArgumentParser();p.add_argument('version',help='M or c001..c012');p.add_argument('destination');p.add_argument('--profile',choices=['matched','legacy'],default='matched');a=p.parse_args()
    assert a.version=='M' or a.version in [f'c{i:03d}' for i in range(1,13)]
    target=Path(a.destination).resolve()
    assert target not in [lab.HERE.resolve(),lab.ROOT.resolve(),Path(target.anchor)],'do not use lab/repository/drive root'
    assert not target.exists() or (target.is_dir() and not any(target.iterdir())),'destination must be empty; no overwriting'
    source=lab.reconstructed_sources(a.version)
    if a.profile=='matched':
        data=(lab.HERE/'build_support/test-closefrom.c').read_bytes().replace(b'\r\n',b'\n').replace(b'\n',b'\r\n')
        assert hashlib.sha256(data).hexdigest()=='6cd3fc4b77a33b7d496d9d51f32e7a2d62ab00cd604462fd2a8f70ceba52b813'
        source['compat/test-closefrom.c']=data
    target.mkdir(parents=True,exist_ok=True)
    for name,data in source.items():
        out=target/name;assert out.resolve().is_relative_to(target)
        out.parent.mkdir(parents=True,exist_ok=True)
        with out.open('xb') as f:f.write(data)
    manifest=dict(version=a.version,profile=a.profile,files={n:hashlib.sha256(v).hexdigest() for n,v in source.items()},
        seed_archive_sha256=lab.sha(lab.HERE/'seed_M.tar.gz'),
        build_command='make -B -j1 qjs qjsc',toolchain='fixed GCC13.3.0 reference; use Linux/WSL x86_64',
        caveat='This restores source, not old performance or original ELF bits; record new compiler/flags/hash and new campaign. Legacy is deliberately confounded, only for audit.')
    with (target/'recovered_from.json').open('x',encoding='utf-8') as f:json.dump(manifest,f,ensure_ascii=False,indent=2)
    print(json.dumps(dict(status='SOURCE_RESTORED',version=a.version,profile=a.profile,destination=str(target),files=len(source)),ensure_ascii=False))
if __name__=='__main__':main()
