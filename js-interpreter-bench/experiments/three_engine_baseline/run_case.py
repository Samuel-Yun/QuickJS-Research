#!/usr/bin/env python3
"""One explicit case invocation; never launches a formal benchmark campaign."""
import argparse
import json
from cohort import ENGINES, SUNSPIDER, OCTANE, command, generate, run, validated_payload, verify

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--verify-only', action='store_true')
    parser.add_argument('--engine', choices=(*ENGINES, 'all'), default='all')
    parser.add_argument('--benchmark', choices=('SunSpider', 'Octane'), default='SunSpider')
    parser.add_argument('--case', default='bitops-bitwise-and')
    parser.add_argument('--n', type=int, default=1)
    parser.add_argument('--mode', choices=('correctness', 'main', 'diagnostic'), default='correctness')
    args = parser.parse_args()
    m = verify()
    if args.verify_only:
        print(json.dumps({'status': 'VERIFIED', 'cohort_id': m['cohort_id']}))
        return
    cases = SUNSPIDER if args.benchmark == 'SunSpider' else OCTANE
    if args.case not in cases:
        parser.error('case not supported by this preparation harness')
    script = generate(args.benchmark, args.case, args.n, args.mode)
    engines = ENGINES if args.engine == 'all' else (args.engine,)
    for engine in engines:
        result = run(command(engine, script))
        payload = validated_payload(result, args.benchmark, args.case, args.n, args.mode)
        print(json.dumps({'engine': engine, 'command': result['command'], 'result': payload}))

if __name__ == '__main__': main()
