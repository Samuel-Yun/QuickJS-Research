"""Execute or resume the user-authorized same-cohort SunSpider campaign."""
import argparse
import json
import traceback
import experiment as x

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('action', choices=('all', 'verify', 'correctness', 'calibrate', 'measure', 'summarize'))
    p.add_argument('--main-only', action='store_true', help='omit the predeclared independent warmup diagnostic')
    args = p.parse_args()
    if not (x.HERE / 'config.json').exists():
        x.setup()
    x.verified()
    if args.action == 'verify':
        print('VERIFIED: frozen cohort, benchmark and harness')
        return
    if not (x.HERE / 'environment/before.json').exists():
        x.environment_snapshot('before')
    if args.action in ('all', 'correctness'):
        rows = x.complete_correctness('MAIN', x.CASES)
        included = x.compatibility(rows)
        print(f'MAIN compatibility: {len(included)}/26; correctness: {sum(r["valid"] for r in rows)}/{len(rows)}')
    else:
        included = [r['case'] for r in x.read(x.HERE / 'compatibility.json') if r['included']]
    if args.action == 'correctness':
        return
    modes = [('MAIN', included)]
    if not args.main_only:
        diagnostic_cases = [c for c in x.DIAGNOSTIC_CASES if c in included]
        modes.append((x.MODES[1], diagnostic_cases))
    for mode, cases in modes:
        if not cases:
            raise RuntimeError('no compatible cases: ' + mode)
        if mode != 'MAIN' and args.action == 'all':
            checks = x.complete_correctness(mode, cases)
            if not all(r['valid'] for r in checks):
                raise RuntimeError('DIAGNOSTIC correctness failed')
        if args.action in ('all', 'calibrate'):
            selected = x.calibrate(mode, cases)
            checks = x.complete_correctness(mode, cases, selected, 'selected_n_correctness')
            if not all(r['valid'] for r in checks):
                raise RuntimeError('selected-N all-call correctness failed: ' + mode)
        else:
            selected = {c: x.read(x.HERE / 'calibration' / mode / (c + '.selected.json')) for c in cases}
        if args.action in ('all', 'measure'):
            checks = x.all_records('selected_n_correctness', mode)
            if not all(any(r['case'] == c and r['engine'] == e and r['N'] == selected[c]['N']
                           and r['valid'] for r in checks) for c in cases for e in x.ENGINES):
                raise RuntimeError('missing selected-N correctness gate')
            x.measure(mode, cases, selected)
        if args.action in ('all', 'summarize'):
            x.summarize(mode, cases)
    if args.action in ('all', 'summarize'):
        x.verified()
        if not (x.HERE / 'environment/after.json').exists():
            x.environment_snapshot('after')
        import audit
        audit.main()

if __name__ == '__main__':
    try:
        main()
    except Exception as exc:
        diagnostic = {'timestamp_utc': x.now(), 'type': type(exc).__name__,
                      'message': str(exc), 'traceback': traceback.format_exc()}
        x.save(x.HERE / 'failures' / (x.now().replace(':', '-') + '.json'), diagnostic)
        raise
