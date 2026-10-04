"""Independently audit and preserve a campaign blocked before formal sampling."""
from collections import Counter
import json
from pathlib import Path
import experiment as x

def main():
    x.verified()  # actual Linux executable/dependency/source verification after probes
    if x.all_records('formal'):
        raise RuntimeError('This finalizer is only for the observed pre-formal stop')
    cfg = x.read(x.HERE / 'config.json')
    runtime = x.read(x.HERE / 'runtime_manifest.json')
    errors = []
    correctness = x.all_records('correctness', 'MAIN')
    pilot = x.all_records('calibration', 'MAIN')
    for r in correctness + pilot:
        try:
            e = runtime['engines'][r['engine']]
            if r['command'] != x.cohort.command(r['engine'], Path(r['script_path'])):
                raise ValueError('command/flags/adapter differs')
            if r['flags'] != e['runtime_flags'] or r['binary_sha256'] != e['binary']['sha256']:
                raise ValueError('flags/binary identity differs')
            if x.sha(r['script_path']) != r['script_sha256']:
                raise ValueError('script hash differs')
            source = (x.old.STANDALONE_DIRECTORY / (r['case'] + '.js')).read_bytes()
            js_mode = 'correctness' if r['checks_each_call'] else 'main'
            config = json.dumps({'case': r['case'], 'N': r['N'], 'mode': js_mode}, separators=(',', ':'))
            driver = (x.PREP / 'sunspider_driver.js').read_text(encoding='utf-8')
            driver = driver.replace('__CONFIG__', config).replace('__CHECKSUMS__', json.dumps(cfg['allowed_checksums'][r['case']]))
            reconstructed = b'function __tebSunSpiderWorkload() {\n' + source
            reconstructed += ('\nreturn String(' + cfg['checksum_expressions'][r['case']] + ');\n}\n').encode()
            reconstructed += driver.encode()
            if Path(r['script_path']).read_bytes() != reconstructed:
                raise ValueError('standard source/driver differs from reconstruction')
            if r['valid']:
                if r['exit_code'] != 0 or r['stderr']:
                    raise ValueError('valid record exit/stderr mismatch')
                lines = r['stdout'].splitlines()
                if len(lines) != 1 or not lines[0].startswith('TEB_RESULT:'):
                    raise ValueError('valid record stdout mismatch')
                p = json.loads(lines[0][11:])
                for k, v in {'benchmark': 'SunSpider', 'case': r['case'], 'N': r['N'],
                             'mode': js_mode, 'timer': 'Date.now', 'correctness': 'PASS',
                             'warmup_calls': 0}.items():
                    if p.get(k) != v:
                        raise ValueError('payload differs: ' + k)
                if p['checksum'] not in cfg['allowed_checksums'][r['case']] or r['checksum'] != p['checksum']:
                    raise ValueError('frozen checksum gate failed')
                if not r['checks_each_call']:
                    if type(p['elapsed_ms']) is not int or p['elapsed_ms'] < 0:
                        raise ValueError('invalid elapsed in nominally valid pilot')
                    if p['elapsed_per_call_ms'] != p['elapsed_ms'] / r['N']:
                        raise ValueError('invalid normalization')
        except Exception as exc:
            errors.append(f'{r["stage"]}/{r["case"]}/{r["engine"]}/N{r["N"]}: {exc}')
    counts = Counter((r['case'], r['engine'], r['N']) for r in correctness if r['valid'])
    expected = {(c, e, n) for c in x.CASES for e in x.ENGINES for n in (1, 2)}
    if set(counts) != expected or any(v != 1 for v in counts.values()):
        errors.append('156-position correctness coverage/uniqueness failed')
    for c in x.CASES:
        for n in (1, 2):
            group = [r for r in correctness if r['case'] == c and r['N'] == n]
            if len({r['script_sha256'] for r in group}) != 1:
                errors.append('cross-engine byte identity failed: ' + c)
    stabilization = [x.read(p) for p in sorted((x.HERE / 'diagnostics/stabilization').glob('*.json'))]
    if len(stabilization) != 1 or stabilization[0]['pass']:
        raise RuntimeError('Expected the preserved failed clock-settling attempt')
    steps = [o for o in stabilization[0]['observations'] if abs(o['divergence_ms']) >= 5]
    contradictions = [r for r in pilot if r['valid'] and r['elapsed_ms'] > r['outer_wall_ns'] / 1e6 + 5]
    selections = [x.read(p) for p in sorted((x.HERE / 'calibration/MAIN').glob('*.selected.json'))]
    x.export_csv(x.HERE / 'raw/calibration.MAIN.csv', pilot, x.RAW_FIELDS)
    x.export_csv(x.HERE / 'selected_n/MAIN.partial.csv',
                 [dict(r, timing_quality='BLOCKED_TIMER', independent_selected_N_check='NOT_RUN') for r in selections])
    x.save(x.HERE / 'raw/formal.MAIN.csv', ','.join(x.RAW_FIELDS) + '\n')
    partial = [{'mode': 'MAIN', 'case': c, 'engine': e, 'samples': 0,
                'median_ms': None, 'mean_ms': None, 'sample_stddev_ms': None,
                'IQR_ms': None, 'min_ms': None, 'max_ms': None,
                'status': 'NOT_SAMPLED_CLOCK_GATE', 'reason': 'Date.now wall-clock quality failed'}
               for c in x.CASES for e in x.ENGINES]
    x.export_csv(x.HERE / 'summary/per_case.MAIN.csv', partial)
    x.export_csv(x.HERE / 'summary/pairwise.MAIN.csv',
                 [{'mode': 'MAIN', 'case': c, 'V8/QJS': None, 'JSC/QJS': None,
                   'JSC/V8': None, 'status': 'NOT_SAMPLED_CLOCK_GATE'} for c in x.CASES])
    x.export_csv(x.HERE / 'summary/pairwise_summary.MAIN.csv',
                 [{'mode': 'MAIN', 'subset': 'all_complete', 'pair': pair, 'case_count': 0,
                   'cases': [], 'GM': None, 'reason': 'no formal samples; clock gate failed'}
                  for pair in ('V8/QJS', 'JSC/QJS', 'JSC/V8')])
    x.environment_snapshot('after_blocked')
    audit = {'status': 'BLOCKED_TIMER', 'cohort': cfg['cohort'], 'metric': cfg['metric'],
             'timestamp_utc': x.now(), 'runtime_ready': True,
             'runtime_dependencies_benchmark_harness_hashes_before_after': True,
             'old_data_preserved': True, 'correctness_evidence_audit': 'PASS' if not errors else 'FAIL',
             'correctness_valid': len(counts), 'correctness_expected': 156,
             'compatibility_intersection': list(x.CASES),
             'calibration_attempts': len(pilot), 'pilot_payload_pass': sum(r['valid'] for r in pilot),
             'pilot_payload_fail': sum(not r['valid'] for r in pilot),
             'provisional_selected_cases': [r['case'] for r in selections],
             'selected_N_correctness': 'NOT_RUN', 'clock_gate': 'FAIL',
             'clock_stabilization_observations': len(stabilization[0]['observations']),
             'clock_divergence_steps_ms': [o['divergence_ms'] for o in steps],
             'internal_greater_than_external_clock_records': [
                 {'case': r['case'], 'engine': r['engine'], 'N': r['N'],
                  'elapsed_ms': r['elapsed_ms'], 'outer_wall_ms': r['outer_wall_ns'] / 1e6} for r in contradictions],
             'formal_valid': 0, 'formal_expected_if_all_compatible': 2340,
             'formal_missing_positions': 2340, 'formal_duplicate_positions': 0,
             'formal_permutation_audit': 'NOT_RUN', 'formal_command_hash_audit': 'NOT_RUN',
             'performance_intersection': [],
             'GM': {'V8/QJS': None, 'JSC/QJS': None, 'JSC/V8': None},
             'diagnostic_warmup_performance': 'NOT_RUN',
             'clock_cause': 'UNKNOWN: NTP / WSL / Windows host not isolated',
             'runtime_mode_frontend_unknown_is_blocker': False,
             'system_clock_or_services_modified': False, 'core_workload_or_flags_modified': False,
             'errors': errors,
             'recovery': ['Fix and verify Date.now clock quality, then start a fresh calibration attempt; do not reuse contaminated pilots',
                          'Alternatively authorize one uniform monotonic clock mode for all three engines; validate semantics/resolution and use independent mode/calibration/raw/statistics']}
    x.save(x.HERE / 'summary/audit.json', audit)
    x.save(x.HERE / 'diagnostics/input_manifest.json',
           {str(p.relative_to(x.ROOT)): x.sha(p) for p in sorted((x.HERE / 'diagnostics').rglob('*')) if p.is_file()})
    x.save(x.HERE / 'environment.txt',
           (x.HERE / 'baseline_environment.txt').read_text(encoding='utf-8') +
           '\nCampaign environment: environment/before.json, environment/after_blocked.json.\n' +
           'Date.now clock-quality gate failed; no formal performance sample was taken.\n' +
           'CPU actual frequency/temperature, exact clock-step source: UNKNOWN.\n')
    print(json.dumps({'status': audit['status'], 'correctness': len(counts),
                      'pilot_attempts': len(pilot), 'formal_valid': 0,
                      'clock_steps_ms': audit['clock_divergence_steps_ms'], 'errors': errors}, indent=2))
    if errors:
        raise RuntimeError('stored-evidence audit failed')

if __name__ == '__main__':
    main()
