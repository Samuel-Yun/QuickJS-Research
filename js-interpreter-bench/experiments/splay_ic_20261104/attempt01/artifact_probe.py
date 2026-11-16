from common import *
import sys
def main():
    records=[]
    values=[dict(label=k,**v) for k,v in runtime()['artifacts'].items()]
    for f in [HERE/'diagnostic_v2/A.build.json',HERE/'diagnostic_v2/M.build.json']:
        if f.exists():values.append(dict(label=f.parent.name+'/'+f.name,**read(f)))
    for x in values:
        p=Path(x['path']);r=dict(label=x['label'],path=str(p),exists=p.exists(),expected=x['sha256'])
        if p.exists():
            r.update(size=p.stat().st_size,sha256=sha(p),first_64_bytes=p.open('rb').read(64).hex())
            try:r['process']=capture([p,*(runtime()['v8_flags'] if x['label']=='V8_ON' else []),'-e','console.log(123)'],'bounded artifact smoke',timeout=15)
            except OSError as e:r['process_error']=repr(e)
        records.append(r)
    source_checks=[]
    for label,x in runtime()['sources'].items():
        for name,expected in x['files'].items():source_checks.append(dict(condition=label,path=str(Path(x['path'])/name),expected_sha256=expected,actual_sha256=sha(Path(x['path'])/name)))
    dependencies=[dict(path=x['path'],expected_sha256=x['sha256'],actual_sha256=sha(x['path'])) for x in runtime()['dependencies']]
    save(HERE/(sys.argv[1] if len(sys.argv)>1 else 'artifact_probe.json'),dict(boot_id=boot(),timestamp=stamp(),records=records,source_checks=source_checks,dependencies=dependencies))
    print(json.dumps(records,ensure_ascii=False,indent=2),flush=True)
if __name__=='__main__':main()
