"""Native Windows Git/CRLF audit; never edits old manifests or source files."""
import csv,hashlib,io,json,subprocess
from pathlib import Path
from datetime import datetime,timezone
P=Path(__file__).resolve().parent;ROOT=P.parents[2];OLD=ROOT/'experiments/function_value_call_path/attempt01'
def sha(b):return hashlib.sha256(b).hexdigest()
def write(p,x):
    p.parent.mkdir(parents=True,exist_ok=True);b=(x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode('utf8')
    if p.exists():assert p.read_bytes()==b
    else:p.write_bytes(b)
def main():
    cmd=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    outputs={k:subprocess.run(cmd+a,capture_output=True,text=True).stdout for k,a in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current']),('status',['status','--short']),('core.autocrlf',['config','--get','core.autocrlf']),('attributes',['check-attr','text','eol','--',str(P.relative_to(ROOT.parent)/'sampler.c')])]}
    assert outputs['branch'].strip()=='myx';assert outputs['HEAD'].strip()=='85857fbff949266958615991b388e44b448fef87'
    old=json.loads((OLD/'public_files_sha256.json').read_text(encoding='utf8'));rows=[]
    for rel,expected in old.items():
        p=OLD/rel
        if not p.exists():rows.append(dict(path=rel,expected_source_sha256=expected,current_sha256=None,LF_sha256=None,reconstructed_CRLF_sha256=None,status='MISSING'));continue
        b=p.read_bytes();actual=sha(b)
        if actual==expected and b'\r\n' not in b:continue
        lf=b.replace(b'\r\n',b'\n');crlf=lf.replace(b'\n',b'\r\n');rows.append(dict(path=rel,expected_source_sha256=expected,current_sha256=actual,LF_sha256=sha(lf),reconstructed_CRLF_sha256=sha(crlf),status='CURRENT_CRLF_SOURCE_MATCH_LF_DIFF' if actual==expected and sha(lf)!=expected else 'CRLF_SOURCE_LF_CHECKOUT_CONFIRMED' if sha(crlf)==expected else 'OTHER_MISMATCH'))
    s=io.StringIO();w=csv.DictWriter(s,['path','expected_source_sha256','current_sha256','LF_sha256','reconstructed_CRLF_sha256','status'],lineterminator='\n');w.writeheader();w.writerows(rows);write(P/'previous_hash_normalization.csv',s.getvalue())
    write(P/'host_git_initial.json',dict(timestamp=datetime.now(timezone.utc).isoformat(),outputs=outputs,first_tool_observed_worktree_clean=True,old_hash_list_not_changed=True))
    print('old byte mismatches',len(rows),[r['status'] for r in rows])
if __name__=='__main__':main()
