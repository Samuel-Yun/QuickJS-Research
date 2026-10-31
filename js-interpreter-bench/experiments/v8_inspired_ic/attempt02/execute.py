"""One continuous process: clean build -> gates -> new collection -> diagnostics.
No old timing raw is reused. No retry/overwrite of a failed stage.
"""
from common import *
def step(script,*args):
    cmd=['python3','-u',str(HERE/script),*args]
    print('STEP',script,*args,flush=True)
    subprocess.run(cmd,cwd=HERE,check=True)
def main():
    assert not (HERE/'execution_started.json').exists(),'use a new attempt, not implicit rerun'
    save(HERE/'execution_started.json',dict(timestamp=stamp(),boot_id=boot(),source_attempt='attempt01',safety_repair=True))
    try:
        step('reuse_sources.py')
        for kind in ['release','diagnostic','sanitizer']:step('stage_engine.py',kind)
        step('prepare.py')
        step('validate.py','semantic');step('validate.py','lifecycle');step('validate.py','serialization')
        step('extra_gates.py')
        step('campaign.py')
        step('diagnostics.py','build');step('diagnostics.py','collect');step('host_diagnostic.py');step('post_identity.py')
        step('analyze.py','--output','summary');step('audit.py');step('plot.py')
        save(HERE/'execution_end.json',dict(timestamp=stamp(),boot_id=boot(),status='COLLECTED_AND_ANALYZED'))
    except Exception as e:
        save(HERE/'execution_stop.json',dict(timestamp=stamp(),boot_id=boot(),error=str(e)))
        raise
if __name__=='__main__':main()
