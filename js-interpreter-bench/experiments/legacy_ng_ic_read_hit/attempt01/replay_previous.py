"""Previous analysis read-only, new output with LF; no JS runtime access."""
from common import *
def main():
    code=(PREVIOUS/'analyze.py').read_text(encoding='utf-8')
    ns={'__name__':'read_only_previous_analysis'};exec(compile(code,str(PREVIOUS/'analyze.py'),'exec'),ns)
    def output(p,v):save(HERE/'recovery/prior_replay'/Path(p).relative_to(PREVIOUS),v)
    def csvlf(p,rows):
        out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);output(p,out.getvalue())
    ns.update(HERE=PREVIOUS,VERSIONS=['A','B','C'],MODE=read(PREVIOUS/'manifest.json')['mode'],CASES=OCTANE_CASES,save=output,csvout=csvlf)
    ns['formal']();ns['legacy']()
    checks=[]
    for p in sorted((HERE/'recovery/prior_replay').rglob('*')):
        if not p.is_file():continue
        original=PREVIOUS/p.relative_to(HERE/'recovery/prior_replay')
        b=p.read_bytes();old=original.read_bytes();norm=old.replace(b'\r\n',b'\n')
        assert b==norm,(p,'normalized text differs')
        checks.append(dict(path=p.relative_to(HERE).as_posix(),original_sha256=digest(old),new_LF_sha256=digest(b),original_CRLF=old.count(b'\r\n'),normalized_equal=True))
    save(HERE/'recovery/previous_replay_audit.json',dict(status='PASS',data_only=True,old_records=1440,older_records=960,files=checks,old_files_modified=False))
    print('PREVIOUS_LF_REPLAY_PASS',len(checks),flush=True)
if __name__=='__main__':main()
