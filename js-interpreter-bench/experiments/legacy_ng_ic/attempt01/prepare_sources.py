"""Acquire immutable source/history evidence; run on Windows or Linux."""
import hashlib
import json
from pathlib import Path
import subprocess
import tarfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BASE = '04be246001599f5995fa2f2d8c91a0f198d3f34c'
PARENT = 'e1b5978775f75f9637c624fc45e69b92d2c15f42'
REMOVE = '7de6d467ebc3598b5e10169f7be3de5b46ff0245'

def save(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    if not isinstance(value, bytes):
        value = (value if isinstance(value, str) else json.dumps(value, indent=2, ensure_ascii=False)+'\n').encode()
    if path.exists():
        assert path.read_bytes() == value, str(path)
    else:
        with path.open('xb') as f: f.write(value)

def git(repo, *args):
    p = subprocess.run(['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),*args],
                       capture_output=True, check=True)
    return p.stdout

def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def main():
    ng = HERE/'source_history.git'
    base = ROOT/'engines/quickjs-upstream'
    assert git(base,'rev-parse','HEAD').decode().strip() == BASE
    assert not git(base,'status','--porcelain').strip()
    assert git(ng,'rev-parse',REMOVE+'^1').decode().strip() == PARENT
    assert git(ng,'rev-list','--parents','-1',REMOVE).decode().split() == [REMOVE,PARENT]
    for label, repo, rev in [('base',base,BASE),('ng_parent',ng,PARENT),('ng_removed',ng,REMOVE)]:
        archive = HERE/'sources'/(label+'.tar')
        if not archive.exists():
            save(archive,git(repo,'archive','--format=tar',rev))
        dest = HERE/'sources'/label
        if not dest.exists():
            dest.mkdir()
            with tarfile.open(archive) as tf:
                for member in tf.getmembers():
                    assert (dest/member.name).resolve().is_relative_to(dest.resolve())
                    assert not member.issym() and not member.islnk()
                tf.extractall(dest)
        save(HERE/'source_evidence'/(label+'_identity_v2.txt'),git(repo,'show','-s','--format=fuller',rev)
             +git(repo,'show','-s','--format=%H%n%P%n%aI%n%cI',rev))
        files={p.relative_to(dest).as_posix():sha(p) for p in sorted(dest.rglob('*')) if p.is_file()}
        manifest=HERE/'source_evidence'/(label+'_files.json')
        if manifest.exists():
            # Original acquisition was on Windows. Preserve those raw bytes,
            # but compare path identities portably when checking from Linux.
            previous=json.loads(manifest.read_text())
            assert {p.replace('\\','/'):h for p,h in previous.items()}==files
        else:
            save(manifest,files)
    save(HERE/'source_evidence/removal.diff',git(ng,'diff',PARENT,REMOVE))
    save(HERE/'source_evidence/ic_history.txt',git(ng,'log','--format=fuller','--reverse',PARENT,
         '-G','InlineCache|_ic|inline cache|emit_ic','--','quickjs.c','quickjs-opcode.h'))
    save(HERE/'source_evidence/source_identity.json',dict(base_commit=BASE,ng_parent=PARENT,
         ng_removal=REMOVE,repository='https://github.com/quickjs-ng/quickjs.git',
         base_repository='https://github.com/bellard/quickjs.git',
         archives={p.name:sha(p) for p in (HERE/'sources').glob('*.tar')}))
    print('SOURCE_IDENTITY_VERIFIED')

if __name__ == '__main__': main()
