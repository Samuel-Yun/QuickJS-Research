"""Offline audit, exact-source recovery checks, portable raw and result tables."""
from collections import Counter
import csv
import gzip
import hashlib
import json
import math
from pathlib import Path
import sys

import variants
import combinations

H = Path(__file__).resolve().parent


def load(name):
    return json.loads((H / name).read_text(encoding='utf-8'))


def sha(path):
    digest = hashlib.sha256()
    with Path(path).open('rb') as stream:
        while chunk := stream.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def local(path):
    return Path('C:/' + path[7:]) if sys.platform == 'win32' and path.startswith('/mnt/c/') else Path(path)


def save(name, value):
    data = (json.dumps(value, ensure_ascii=False, indent=2) + '\n').encode() if not isinstance(value, str) else value.encode()
    path = H / name
    if path.exists():
        assert path.read_bytes() == data, 'Preserve frozen output'
    else:
        path.write_bytes(data)


def csvfile(name, rows):
    if not rows:
        return
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, list(dict.fromkeys(key for row in rows for key in row)), lineterminator='\n')
        writer.writeheader(); writer.writerows(rows)


def readcsv(name):
    with (H / name).open(encoding='utf-8', newline='') as stream:
        return list(csv.DictReader(stream))


def main():
    assert (H / 'recheck.octane.complete.json').exists()
    raw_path = H / 'runs.jsonl'
    with raw_path.open(encoding='utf-8') as stream:
        raw = [json.loads(line) for line in stream]
    starts = {row['token']: row for row in raw if row.get('event') == 'process_start'}
    results = {row['token']: row for row in raw if row.get('event') == 'process_result'}
    assert len(starts) == sum(row.get('event') == 'process_start' for row in raw)
    assert len(results) == sum(row.get('event') == 'process_result' for row in raw)
    assert starts.keys() == results.keys()
    samples = [row for row in raw if row.get('event') == 'measurement']
    boot = load('environment.json')['boot_id']
    keys = set()
    for row in samples:
        assert row['valid'] and row['exit_code'] == 0
        assert row['boot_id'] == row['boot_id_after'] == boot
        assert math.isfinite(row['elapsed_ms']) and row['elapsed_ms'] > 0
        assert abs(row['elapsed_per_Run_ms'] * row['N'] - row['elapsed_ms']) < 1e-7
        key = (row['campaign'], row['case'], row['condition'], row['rep'], row['order'])
        assert key not in keys
        keys.add(key)
        outcome = results[row['process_token']]
        assert outcome['exit_code'] == 0 and not outcome['stderr']
        assert outcome['identity']['binary_sha256'] == row['identity']['binary_sha256']
        assert outcome['identity']['script_sha256'] == row['identity']['script_sha256']
        assert row['identity']['warmup_calls'] == 0
    states = load('state.json')
    assert len(states) == 65 and sum(row['status'] == 'DUPLICATE' for row in states) == 6
    artifacts = []
    recovery = []
    for state in states:
        cid = state['id']
        if state['status'] == 'DUPLICATE':
            continue
        metadata = load('identities/' + cid + '.json')
        assert sha(local(metadata['path'])) == metadata['sha256']
        assert sha(H / 'patches' / (cid + '.patch')) == metadata['patch_sha256']
        source = combinations.render(cid) if cid.startswith('mx') else variants.render(cid)
        actual = {name: hashlib.sha256(text.encode()).hexdigest() for name, text in source.items()}
        assert actual == metadata['source_sha256'], cid
        recovery.append(dict(candidate=cid, exact_source_files=len(actual), status='PASS'))
        for name, digest in metadata['controller_sha256'].items():
            snapshot = H / 'runners' / (name[:-3] + '.' + digest + '.py')
            assert sha(snapshot) == digest, (cid, snapshot)
        artifacts.append(dict(candidate=cid, binary_sha256=metadata['sha256'], binary_size=metadata['size'],
                              parent=state['parent'], exact_source_recovery=True))
    assert len(artifacts) == 59
    for label, artifact in load('workspace.json')['artifacts'].items():
        assert sha(local(artifact['path'])) == artifact['sha256'], label
    targeted = [row for row in results.values() if row.get('stage') == 'correctness' and row['label'].endswith('/targeted.js')]
    assert len(targeted) == 59
    expected_target = next(row['stdout'] for row in targeted if row['label'] == 'rf000/targeted.js')
    for row in results.values():
        if row.get('stage') != 'correctness':
            continue
        expected = expected_target if row['label'].endswith('/targeted.js') else 'CHECKS_PASS:7020\n' if row['label'].endswith('/checks.js') else 'MASS_SEMANTIC_PASS:9013\n'
        assert row['exit_code'] == 0 and not row['stderr'] and row['stdout'] == expected, row['label']
    selection = load('selection.json')
    for cid in selection['selected']:
        protocol = load(cid + '.recheck.octane.protocol.json')
        observed = [row for row in samples if row['campaign'] == protocol['campaign']]
        assert len(observed) == 425
        assert {(row['case'], row['condition'], row['rep'], row['order']) for row in observed} == {
            (row['case'], row['condition'], row['rep'], row['order']) for row in protocol['positions']}
        for case in load('octane.inputs.json')['cases']:
            for label in protocol['labels']:
                distribution = Counter(row['order'] for row in observed if row['case'] == case and row['condition'] == label)
                assert distribution == Counter({0: 1, 1: 1, 2: 1, 3: 1, 4: 1})
    csvfile('source_recovery.csv', recovery)
    csvfile('artifacts.csv', artifacts)
    screen_rows = []
    case_rows = []
    for path in sorted(H.glob('*.screen.json')):
        result = load(path.name)
        cid = result['candidate']
        screen_rows.append(dict(candidate=cid, core_ratio=result['core_over_s001'],
                                expanded_ratio=result['expanded_over_s001'],
                                local5=';'.join(result['local5']), regressions10=';'.join(result['regressions10']),
                                quality=json.dumps(result['quality_counts']), CI='not estimated, one candidate process per case'))
        for group in result['groups']:
            case_rows.append(dict(candidate=cid, case=group['case'], N=group['N'],
                                 ms_per_Run=group['candidate_ms_per_Run'], s001_reference_ms_per_Run=group['s001_reference_ms_per_Run'],
                                 ratio=group['over_s001'], ratio_over_A=group['over_A'], quality=group['quality'],
                                 attempts=len(group['attempts'])))
    assert len(screen_rows) == 21 and len(case_rows) == 21 * 17
    csvfile('screen.summary.csv', screen_rows); csvfile('screen.per_case.csv', case_rows)
    summary = readcsv('recheck.summary.csv')
    core = next(row for row in summary if row['scope'] == 'core16' and row['denominator'] == 's001')
    null = next(row for row in summary if row['scope'] == 'core16' and row['denominator'] == 'rf000')
    assert float(core['high95']) > 1 and float(null['high95']) > 1
    archive = H / 'runs.jsonl.gz'
    digest = hashlib.sha256()
    assert not archive.exists()
    with raw_path.open('rb') as incoming, archive.open('xb') as outgoing:
        with gzip.GzipFile(fileobj=outgoing, filename='', mode='wb', mtime=0) as compressed:
            while chunk := incoming.read(1024 * 1024):
                digest.update(chunk); compressed.write(chunk)
    save('raw_archive.json', dict(file=archive.name, compressed_sha256=sha(archive),
         uncompressed_sha256=digest.hexdigest(), compressed_bytes=archive.stat().st_size,
         uncompressed_bytes=raw_path.stat().st_size, encoding='UTF-8/LF',
         restore='python -c "import gzip,pathlib;pathlib.Path(\'runs.restored.jsonl\').write_bytes(gzip.decompress(pathlib.Path(\'runs.jsonl.gz\').read_bytes()))"',
         license='Project research records; benchmark licenses remain with frozen upstream inputs'))
    save('audit.json', dict(status='PASS', measurements=len(samples), valid=sum(row['valid'] for row in samples),
         phases=dict(Counter(row['stage'] for row in samples)), process_starts=len(starts), process_results=len(results),
         unmatched_starts=0, duplicate_positions=0, boots=[boot], own_artifacts=59,
         exact_source_reconstructions=59, targeted_stdout=expected_target.strip(), correctness_assertions_not_scenarios=True,
         original_versions=17, interaction_configurations=48, duplicate_sources=6, new_interactions_measured=42,
         full_suite_screened=21, independent_recheck_candidate='mx019', independent_recheck_samples=425,
         independent_positions_balanced=True, formal30=False, full_test262=False, sanitizer=False,
         old_data_modified=False, old_times_used_as_denominators=False))
    save('decision.json', dict(status='COMPLETE_EXPLORATORY_REFINEMENT_NO_CONFIRMED_ADVANTAGE', candidate='mx019',
         core_ratio=float(core['ratio']), core_low95=float(core['low95']), core_high95=float(core['high95']),
         over_same_text_control=float(null['ratio']), over_same_text_control_high95=float(null['high95']),
         promoted_to_baseline=False, more_search_scheduled=False, full_sunspider_not_run=True,
         reasons=['No clear first-stage overall gain', 'One predeclared small-signal reserve rechecked',
                  'Independent interval crosses1 against both frozen s001 and identical-text rebuild control'],
         limitations=['Exploratory5-round intervals', 'Power/frequency/background load UNKNOWN',
                      'No complete test262 or final ASan/UBSan', 'Machine-code contribution of individual changes UNKNOWN'],
         field_note='In frozen *.screen.json, source_sha256 is a mislabeled binary hash. True source-file hashes are identities/*.json source_sha256. No original field/hash was rewritten.'))
    lines = ['# s001修正搜索结果', '',
      '本轮先做小修正，单次完整Octane出现信号后才增加重复。实际完成17个源码版本，其中3个为控制、14个为修正或同一修正在不同parent上的对照。必要正确性全部通过。没有出现约1.5%以上的清楚整体改善后，再做48配置的有界交互搜索，其中6个与已测源码完全重复，42个完成8项短测，4个补测完整Octane。', '',
      '完整17项Octane单次筛选共21个版本。源码、补丁、工具链、命令、工作量、stdout/stderr和时间均保留。源文件可精确恢复的实际制品为59个。配置数与算法数分开统计。', '',
      '## 最接近目标的版本', '',
      'mx019组合了两项修正，复用16B记录中的已有字段下标作受检预测，并在精确shape命中后用已知object标签释放同一个receiver。预测仍检查当前hashed shape、字段范围、atom和普通数据descriptor，读取对象当前值。没有增加缓存槽、存储旧JS值或修改benchmark。', '',
      '单次完整Octane核心/s001为0.9955，耗时点估计下降约0.45%。没有达到主晋级阈值，使用预先定义的一个小信号保留名额，单独对它做5轮Octane复核。五个条件为A、s001、同.text重建控制rf000、mx019和通用模板单槽控制CTRL000，每case每条件5个新进程，共425条，五种位置各一次。', '',
      '|对照|核心16项/13suite耗时比|探索性95%区间|',
      '|---|---:|---:|']
    for denominator in ['A', 's001', 'rf000', 'CTRL000']:
        row = next(row for row in summary if row['scope'] == 'core16' and row['denominator'] == denominator)
        lines.append('|mx019/'+denominator+'|'+format(float(row['ratio']), '.6f')+'|['+format(float(row['low95']), '.6f')+', '+format(float(row['high95']), '.6f')+']|')
    lines += ['', '相对s001，核心点估计下降约0.36%，但区间跨1。相对同机器码重建控制，点估计下降约0.13%，区间同样跨1。当前不能认定已经稳定超过s001，保留候选及材料，不升级工作底座，不补样本到出现想要的方向。', '',
      '## 这次看到什么', '',
      '源码完全相同、.text相同的rf000，单次筛选也出现约1.36%的表面改善。它说明当前单次筛选中的百分之一量级信号需要独立复核。rf001仅改变发布/释放顺序，单次核心点估计反而约慢1.38%。初轮将此适配作为共同parent，随后补齐了直接基于原s001的六项对照，避免把这项改变混入每个修正。', '',
      '把通用模板恢复16B的rf008没有获得整体收益，单次核心约慢3.24%。noinline失配helper、likely标注、提前shape比较、延后site解码、字段下标预测及已知object释放分别保留正负结果。生成机器码、寄存器分配和代码布局的具体贡献尚为UNKNOWN，不能把全部时间差归为某个检查或hash查找的独立成本。', '',
      '本轮没有明显整体赢家。42个交互配置的短测最好点也未保持为较大的完整套件收益。mx019保留为微小信号，后续是否值得继续，优先取决于能否解释它与同代码控制之间的差异。', '',
      '## 口径与限制', '',
      'WSL2 Ubuntu24.04.2/x86_64，GCC13.3，-O2 -g -fwrapv -DHAVE_CLOSEFROM。原A/M/s001哈希核验通过，未修改旧数据。native CLOCK_MONOTONIC内部计时，首次Run包含，无额外workload预跑，初始Setup在计时外，GC/helper/builtin/RegExp/Run内动态编译按原协议计入。Crypto保留原N及确定性密文门禁。', '',
      '初筛每项一个候选进程，s001前后端点加同批A，漂移超过15%只重试一次，数据全部保留。复核使用10000次整轮配对bootstrap，seed2026110602，5轮、探索性、未多重校正。未跑30进程正式确认、完整test262或最终sanitizer。SunSpider只使用固定4项短测，没有全量SunSpider结论；没有新增V8对比。', '',
      '原screen.json中的source_sha256字段实际保存binary SHA，已在decision.json说明，源文件身份以identities内的source_sha256文件清单为准，旧文件及旧哈希保持原样。', '',
      '完整表见screen.summary.csv、screen.per_case.csv、recheck.statistics.csv、recheck.per_case.csv和recheck.summary.csv，原始记录见runs.jsonl.gz及raw_archive.json。audit.json核对计数、boot、位置、正确性、制品和源码恢复。', '']
    save('results.md', '\n'.join(lines))
    print(json.dumps(load('audit.json'), ensure_ascii=False))
    print(json.dumps(load('decision.json'), ensure_ascii=False))


if __name__ == '__main__':
    main()
