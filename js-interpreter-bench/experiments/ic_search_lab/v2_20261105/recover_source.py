"""Recover exact public seed+patch sources; never execute a runtime or overwrite files."""
import argparse,hashlib,json,sys
from pathlib import Path
import run
HERE=run.HERE

def main():
    p=argparse.ArgumentParser()
    p.add_argument('candidate',choices=['M','s001','s002','s003','s004'])
    p.add_argument('destination',type=Path)
    a=p.parse_args();dest=a.destination.resolve()
    assert not dest.exists(),'destination must not exist; old data is never overwritten'
    ws=run.lab.load(HERE/'workspace.json')
    assert run.lab.sha(HERE/'seed_M.tar.gz')==ws['seed_archive_sha256']
    src=run.lab.reconstructed_sources(a.candidate)
    expected=ws['source_files'] if a.candidate=='M' else run.lab.load(HERE/(a.candidate+'.matched.json'))['source_sha256_after_build']
    assert {n:hashlib.sha256(v).hexdigest() for n,v in src.items()}==expected
    if a.candidate!='M':
        m=run.lab.load(HERE/(a.candidate+'.matched.json'))
        assert run.lab.sha(HERE/'patches'/(a.candidate+'.patch'))==m['patch_sha256']
    support=(run.PREV/'build_support/test-closefrom.c').read_bytes().replace(b'\r\n',b'\n').replace(b'\n',b'\r\n')
    assert hashlib.sha256(support).hexdigest()=='6cd3fc4b77a33b7d496d9d51f32e7a2d62ab00cd604462fd2a8f70ceba52b813'
    dest.mkdir(parents=True)
    for n,data in {**src,'compat/test-closefrom.c':support}.items():
        target=(dest/n).resolve()
        assert dest in target.parents,'archive name escapes destination'
        target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
    print(json.dumps(dict(status='RECOVERED_SOURCES_ONLY',candidate=a.candidate,destination=str(dest),
          files=len(src)+1,build_command='make -B -j1 qjs qjsc',
          compiler='recorded GCC 13.3.0; rebuild on another host may not be byte-identical',
          warning='A is never reconstructed/relabelled as the frozen A binary; no experiments started'),indent=2))
if __name__=='__main__':main()
