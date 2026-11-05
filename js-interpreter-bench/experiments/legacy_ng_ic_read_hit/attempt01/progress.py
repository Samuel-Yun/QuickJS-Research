"""Cheap progress counts; does not analyze performance during sampling."""
from common import *
def main():
    stages=['correctness','calibration','pilot','selected_correctness','formal','memory']
    r={s:len(list((HERE/'raw'/s).glob('*/*.json'))) for s in stages}
    r.update(selected=len(list((HERE/'selected').glob('*.json'))),selected_target=21,
      formal_target=1890,formal_done=(HERE/'raw/environment/post_formal.json').exists(),diagnostic_archives=len(list((HERE/'raw/diagnostic').glob('*.gz'))))
    print(json.dumps(r),flush=True)
if __name__=='__main__':main()
