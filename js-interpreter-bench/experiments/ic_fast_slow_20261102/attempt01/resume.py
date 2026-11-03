"""Explicit same-boot resume without rewriting frozen timestamps or orphan raw.

Never run while worker is sampling. No cross-boot fill and no automatic retries.
"""
from common import *
import sys
def main():
    kind=sys.argv[1];assert kind in ['mechanism','sunspider','micro','octane']
    root=HERE/kind
    if (root/'collected.json').exists():
        print('ALREADY_COLLECTED: use raw-only analyze with a NEW output directory');return
    frozen=read(root/'frozen.json');assert boot()==frozen['boot_id'],'cross-boot resume forbidden'
    def preserved_save(path,value):
        if Path(path)==root/'frozen.json':
            normalized=json.loads(json.dumps(value));original=read(path)
            normalized.pop('timestamp');comparison=dict(original);comparison.pop('timestamp')
            assert normalized==comparison,'frozen identity/schedule/config changed; no resume'
            return
        return save(path,value)
    save(root/'resume_checks'/(str(time.time_ns())+'.json'),dict(timestamp=stamp(),boot_id=boot(),
      action='explicit same-boot resume; existing valid raw skipped; started-without-raw rejected; frozen timestamp preserved'))
    if kind=='mechanism':
        import mechanism
        mechanism.save=preserved_save;mechanism.campaign()
    else:
        import benchmark
        benchmark.save=preserved_save;benchmark.Campaign(kind).run()
if __name__=='__main__':main()
