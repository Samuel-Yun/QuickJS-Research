"""A second bounded correction set; earlier data remain immutable."""
import json
from pathlib import Path
import time

import refine as r

H = r.H
lab = r.lab


def main():
    r.gate()
    assert (H / 'first.complete.json').exists()
    new_ids = list(r.variants.EXACT) + ['rf018', 'rf019']
    frozen = dict(status='FROZEN_BEFORE_SECOND_CORRECTION_DATA', ids=new_ids,
                  reason='Separate rf001 safety adaptation from the six source changes; add two narrow cleanup/update changes',
                  first_stage_results='first.complete.json', boot_id=lab.boot(),
                  same_N=True, benchmark_changed=False, no_old_time_denominators=True)
    lab.save(H / 'extension.protocol.json', frozen)
    rows = lab.load(H / 'state.json')
    for cid in new_ids:
        if not any(row['id'] == cid for row in rows):
            rows.append(dict(next(row for row in r.variants.DESIGNS if row['id'] == cid), status='PLANNED'))
    r.atomic('state.json', rows)
    r.snapshot()
    for cid in new_ids:
        r.screen(cid)
        r.atomic('progress.json', dict(stage='exact_s001_corrections', last_candidate=cid,
                                     timestamp=lab.stamp(), boot_id=lab.boot()))
    lab.save(H / 'extension.complete.json', dict(status='SECOND_CORRECTIONS_COMPLETE', ids=new_ids,
             boot_id=lab.boot()))
    print('SECOND_CORRECTIONS_COMPLETE', flush=True)


if __name__ == '__main__':
    main()
