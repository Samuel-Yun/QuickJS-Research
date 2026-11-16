from common import *
import shutil,gzip,sys,difflib
import diagnose
def build():
    ids={}
    for label,old in read(HERE/'diagnostic_v3_manifest.json').items():
        src=Path(old['source']);dst=STORE/(label+'_focused');assert not dst.exists()
        dst.mkdir(parents=True)
        for p in src.iterdir():
            if p.is_file() and (p.suffix in ['.c','.h','.inc','.js','.mjs'] or p.name in ['Makefile','VERSION','LICENSE']):shutil.copyfile(p,dst/p.name)
        p=dst/'audit_tail.inc';s=p.read_text();a=s.index('static void sp_receiver(');z=s.index('static void sp_reason(',a)
        s=s[:a]+(HERE/'diagnostic/focus.inc').read_text()+'\n'+s[z:]
        s=one(s,'    fprintf(out,"]}\\n");fclose(out);','    fprintf(out,"],\\\"shape_focus\\\":");sp_focus_report(out);fprintf(out,"}\\n");fclose(out);')
        s='static void sp_focus_report(FILE *out);\n'+s;p.write_text(s)
        r=capture(['make','-j2','qjs'],label+' focused build',cwd=dst,timeout=300);save(HERE/'raw/build'/f'{label}.focused.json',r)
        assert r['exit_code']==0,r['stderr'][-3500:]
        ids[label]=dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),formal=False)
    save(HERE/'focused_manifest.json',ids)
def collect():
    for label,art in read(HERE/'focused_manifest.json').items():
        for n in [1,2]:
            name=f'Splay.Splay.{label}.N{n}';p=diagnose.script('Splay.Splay',n);report=STORE/'reports'/(name+'.focused.json')
            r=capture([art['path'],p],name,env=dict(os.environ,IC_MECHANISM_REPORT=str(report)))
            r.update(script_sha256=sha(p),binary_sha256=art['sha256'],performance_sample=False)
            save(HERE/'focused/raw'/(name+'.process.json'),r);assert r['exit_code']==0 and not r['stderr']
            data=report.read_bytes();out=HERE/'focused/raw'/(name+'.json.gz');save(out,gzip.compress(data,mtime=0));d=json.loads(data)
            save(HERE/'focused'/(name+'.shapes.json'),dict(raw_sha256=hashlib.sha256(data).hexdigest(),compressed_sha256=sha(out),shape_focus=d['shape_focus']))
            assert all(x['overflow_events']==0 for x in d['shape_focus'])
            print('FOCUSED',label,n,[(s['pc'],s['distinct_shape_generations'],s['transitions']) for s in d['shape_focus']],flush=True)
if __name__=='__main__':globals()[sys.argv[1]]()
