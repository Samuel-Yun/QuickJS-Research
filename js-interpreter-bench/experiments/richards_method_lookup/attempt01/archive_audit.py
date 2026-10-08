"""Cross-platform exact-byte and real Git-export test in an ISOLATED fixture repo.
No canonical .git/index/refs/branches are written; no commit is created.
"""
import hashlib, io, json, platform, shutil, subprocess, tarfile, zipfile
from pathlib import Path
import common as c

def main():
    system=platform.system().lower();result=c.HERE/f'source_evidence/archive_audit.{system}.json'
    if result.exists(): print(result.read_text());return
    fixture=c.HERE/f'source_evidence/git_export_fixture_{system}'
    fixture.mkdir(parents=True,exist_ok=False)
    files={'historical_bytes.zip':c.HERE/'source_evidence/historical_bytes.zip','design_bytes.zip':c.HERE/'microbench/design_bytes.zip','formal_bytes.zip':c.HERE/'microbench/formal_bytes.zip'}
    for name,p in files.items(): shutil.copyfile(p,fixture/name)
    shutil.copyfile(c.HERE/'.gitattributes',fixture/'.gitattributes')
    trace=[]
    def run(args):
        cmd=['git','-c','safe.directory='+fixture.as_posix()]+args
        r=subprocess.run(cmd,cwd=fixture,capture_output=True)
        trace.append({'command':cmd,'exit_code':r.returncode,'stdout':r.stdout.decode(errors='replace') if args[0]!='archive' else '(binary TAR preserved separately)','stderr':r.stderr.decode(errors='replace')})
        if r.returncode: raise RuntimeError(str(trace[-1]))
        return r.stdout
    run(['init']);run(['-c','core.autocrlf=true','add','--','.gitattributes']+list(files))
    tree=run(['write-tree']).decode().strip(); exported=run(['archive','--format=tar',tree])
    c.save(c.HERE/f'source_evidence/git_export.{system}.tar',exported)
    recovered={}
    with tarfile.open(fileobj=io.BytesIO(exported)) as t:
        for name,path in files.items():
            data=t.extractfile(name).read()
            if hashlib.sha256(data).hexdigest()!=c.sha(path): raise RuntimeError('Git export changed zip')
            with zipfile.ZipFile(io.BytesIO(data)) as z:
                recovered[name]={n:hashlib.sha256(z.read(n)).hexdigest() for n in z.namelist()}
    historical=c.read(c.HERE/'source_evidence/byte_audit.json')
    for r in historical['records']:
        if r['recovery']=='EXACT' and recovered['historical_bytes.zip']['recorded/'+r['path']]!=r['recorded_sha256']: raise RuntimeError('historical input restoration changed')
    selected=c.read(c.HERE/'microbench/selected_n.json')['N']
    for v in ('A','B'):
        if recovered['formal_bytes.zip'][f'{v}.N{selected}.js']!=c.sha(c.HERE/f'microbench/generated/{v}.N{selected}.js'): raise RuntimeError('formal source export changed')
    c.save(result,{'status':'PASS','system':platform.system(),'python':platform.python_version(),'isolated_repo':str(fixture),'canonical_git_modified':False,'commit_created':False,'core_autocrlf_tested':True,'tree':tree,'archives_sha256':{name:c.sha(p) for name,p in files.items()},'entry_hashes_after_git_export':recovered,'historical_exact_identities_verified':len(historical['records']),'commands':trace})
    print('ARCHIVE_GIT_EXPORT_PASS',system,flush=True)

if __name__=='__main__': main()
