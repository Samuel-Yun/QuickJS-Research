"""Portable result tables and an explicit, negative overall search decision."""
import csv
from collections import Counter
import hashlib
import json
from pathlib import Path

H = Path(__file__).resolve().parent


def load(name):
    return json.loads((H / name).read_text(encoding='utf-8'))


def table(name):
    with (H / name).open(encoding='utf-8', newline='') as stream:
        return list(csv.DictReader(stream))


def save(name, value):
    data = (json.dumps(value, ensure_ascii=False, indent=2) + '\n').encode() if not isinstance(value, str) else value.encode()
    path = H / name
    if path.exists():
        assert path.read_bytes() == data, 'Preserve the existing frozen result'
    else:
        path.write_bytes(data)


def csvfile(name, rows):
    columns = list(dict.fromkeys(key for row in rows for key in row))
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, columns, lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


def main():
    audit = load('exploration.audit.json')
    assert audit['record_integrity'] == 'PASS' and audit['samples'] == audit['valid'] == 9791
    states = load('state.json')
    seeds = [json.loads(line) for line in (H / 'candidate_seeds.jsonl').read_text().splitlines()]
    seed_ids = {row['id'] for row in seeds}
    assert len(seed_ids) == 288
    rows = [row for row in states if row['id'] in seed_ids]
    assert len(rows) == 288
    assert Counter(row['status'] for row in rows) == Counter(SCREENED=248, UNSUPPORTED=40)
    pointer = load('exploration.active_campaign.json')
    protocol = load(pointer['protocol'])
    covered = []
    for number, expected in enumerate(protocol['blocks']):
        checkpoint = load(protocol['file_prefix'] + '.block' + str(number) + '.complete.json')
        assert checkpoint['candidates'] == expected
        assert checkpoint['boot_id'] == pointer['boot_id']
        for trial in checkpoint['trials']:
            block = load(trial)
            assert {entry['candidate'] for entry in block['results']} == set(expected) | {'CTRL000'}
            for entry in block['results']:
                for kind in ['sunspider', 'octane']:
                    cases = {case for category, case in protocol['short_cases'] if category == kind}
                    for baseline in ['A', 's001']:
                        assert {case['case'] for case in entry['ratios'][kind + '/' + baseline]['cases']} == cases
        covered.extend(expected)
    assert len(covered) == len(set(covered)) == 248
    level2 = load('exploration.level2.selection.json')['selected']
    level3 = load('exploration.level3.selection.json')['selected']
    summary = table('exploration.level3.summary.csv')
    per_case = table('exploration.level3.ratios.csv')
    statistics = table('exploration.level3.statistics.csv')
    layouts = {row['candidate']: row for row in load('selected_mechanism.json')['layouts']}
    best = min((row for row in summary if row['kind'] == 'octane' and row['scope'] == 'core16' and row['denominator'] == 's001'),
               key=lambda row: float(row['ratio']))
    assert best['candidate'] == 'L030' and float(best['ratio']) > 1 and float(best['high95']) > 1
    output = []
    for row in rows:
        cid = row['id']
        identity = H / 'identities' / (('candidate_S001' if cid == 'S001' else cid) + '.json')
        art = json.loads(identity.read_text()) if row['status'] == 'SCREENED' else {}
        output.append(dict(id=cid, family=row['family'], parent=row.get('parent'),
            status='UNSUPPORTED' if row['status'] == 'UNSUPPORTED' else 'RECHECKED' if cid in level3 else 'SCREENED',
            short_screen=cid in covered, full_suite=cid in level2, independent_rounds=4 if cid in level3 else 0,
            formal_processes=0, decision='RETAIN_LOCAL_SIGNAL_NOT_NEW_BASE' if cid == 'L030' else 'NOT_PROMOTED',
            reason=row.get('reason', ''), binary_sha256=art.get('sha256'), identity_file=str(identity.relative_to(H)) if art else '',
            config=json.dumps(row.get('effective_config'), sort_keys=True), classification=row.get('classification')))
    csvfile('exploration.candidates.csv', output)
    coverage = []
    for family in ['P', 'L', 'T', 'Q', 'H', 'F', 'S']:
        group = [row for row in output if row['family'] == family]
        coverage.append(dict(family=family, requested=len(group), screened=sum(row['short_screen'] for row in group),
                             unsupported=sum(row['status'] == 'UNSUPPORTED' for row in group),
                             full_suite=sum(row['full_suite'] for row in group),
                             independent_rechecked=sum(row['independent_rounds'] > 0 for row in group), confirmed=0))
    csvfile('exploration.coverage.csv', coverage)
    overview = []
    for cid in level3:
        data = dict(candidate=cid, site_bytes=layouts[cid]['site_bytes'], shape_bytes=layouts[cid]['shape_bytes'], rounds=4)
        for row in summary:
            if row['candidate'] != cid or row['denominator'] not in ['A', 's001']:
                continue
            key = row['kind'] + '_' + row['scope'] + '_over_' + row['denominator']
            for field in ['ratio', 'low95', 'high95']:
                data[key + '_' + field] = float(row[field])
        overview.append(data)
    csvfile('exploration.recheck_overview.csv', overview)
    notable = [row for row in per_case if row['denominator'] == 's001' and (float(row['ratio']) <= .95 or float(row['ratio']) >= 1.10)]
    csvfile('exploration.notable_cases.csv', notable)
    save('exploration.decision.json', dict(status='SEARCH_COMPLETE_NO_SUPPORTED_OVERALL_ADVANTAGE_OVER_S001',
         initial_configurations=288, screened=248, unsupported=40, full_suite=28, independently_rechecked=4,
         independent_rounds=4, valid_measurements=9791, formal_measurements=0, final_candidate=None,
         local_signal='L030 RayTrace; preserve with nbody regression',
         combinations_added=0, combinations_reason='No complementary single-mechanism advantages established by independent full-suite data',
         formal_reason='No candidate improved overall on s001 in independent recheck. Do not upgrade a local result into a new overall baseline.',
         V8_new_same_batch_comparison=False, full_test262=False, final_ASan_UBSan=False,
         unknown=['Actual RayTrace cache hit changes', 'Cause of nbody regression', 'RSS and indirect shape retention'],
         archive_only_audit='PASS', old_campaign_retained=True))
    lines = ['# 248个配置初筛后的结果', '',
             '本轮实际完成248个可执行配置的8项短测，另40个配置标为不支持，其中24个runtime共享表配置缺少已验证的GC/隔离方案，16个融合配置缺少必要的语义证明。288是参数配置数。28个候选完成26项SunSpider和17项Octane各一次同批测试，L030、P013、H015、Q005另做4轮独立复筛。新campaign共9791条有效计时记录，完整性和压缩原始记录离线审计均通过。', '',
             '内部时钟为冻结的native CLOCK_MONOTONIC，首次Run计入，无计时前workload预跑，初始Setup在计时外。构建和采样串行，CPU2亲和性，A/M/s001及输入保持冻结。Crypto沿用原N及确定性密文门禁。', '',
             '下表是候选耗时除以同批分母，低于1表示候选更快。Octane先在suite内聚合，再对13或14个suite等权，SunSpider对26个case等权。', '',
             '|候选|核心16/A|核心16/s001|扩展17/s001|Sun26/s001|',
             '|---|---:|---:|---:|---:|']
    for row in overview:
        lines.append('|{candidate}|{octane_core16_over_A_ratio:.4f}|{octane_core16_over_s001_ratio:.4f}|{octane_expanded17_over_s001_ratio:.4f}|{sunspider_all26_over_s001_ratio:.4f}|'.format(**row))
    lines += ['', 'L030的Octane核心/s001为1.0038，探索性95%区间[0.9975,1.0059]。它的核心/A为0.9900，说明对照必须写清。独立数据没有支持把它替换为比s001更好的整体底座。其余三个候选的核心点估计也更慢。区间来自10000次整轮配对bootstrap，seed20261105，只有4轮，未作多重比较校正。', '',
              '保留的局部发现是L030的RayTrace/s001为0.9221，区间[0.9159,0.9361]，耗时约下降7.79%。P013该项为0.9410。另一方面，L030的access-nbody/s001为1.1180，区间[1.0951,1.1448]。不能用局部改善掩盖退化，短测中的优势也未保持为全套优势。完整逐项中位数、Q1/Q3、标准差和区间见exploration.level3.statistics.csv和exploration.level3.ratios.csv。', '',
              'L030使用PC相对寻址、6槽分离shape数组和受检uint16下标。独立诊断实测1/2/3/4/6种shape占用1/2/3/4/6槽，8/17种shape仍最多6槽，且通过删除时native finalizer重入读取。实际ELF的ReadICSite为72B，冻结s001为16B，通用单槽模板控制为24B。这里确认了空间和机制，没有测出RayTrace的实际命中变化或nbody退化的原因。RSS、间接保活和最终安全门禁仍未知。', '',
              '停止搜索，不增加组合，不启动30进程正式确认。当前没有复筛支持的整体改进，也没有足够依据把多个方向组合。保留L030作为局部研究材料，正式确认数为0。本轮没有重测V8，没有新的同批V8差距结论，也未运行完整test262或最终ASan/UBSan。', '',
              '过程中的两个变化已单独保存。15%漂移从探索性全局停止改为质量标记和一次有界复测，见protocol_amendment02_exploration.json。早期96个配置后发生S001/s001文件名冲突，守卫在覆盖前停止，随后WSL boot变化。修复命名并启用独立新campaign后，全248配置重新采集同批时间，见protocol_amendment03_new_boot.json。当前42块中37块直接通过、5块复测通过，旧记录与旧STOP保持原样。', '',
              '当前数据来自WSL2 Ubuntu24.04.2/x86_64和GCC13.3，-O2 -g -fwrapv -DHAVE_CLOSEFROM。功耗/频率实际控制与温度为UNKNOWN。两项SunSpider随机输入既有限制及Box2D/官方latency未覆盖边界保留。', '']
    save('exploration_results.md', '\n'.join(lines))
    save('exploration.materials.json', dict(archive=load('current_raw_archive.json'),
         diagnostic_files=['selected_mechanism.json', 'selected_mechanism.jsonl', 'L030.selected_mechanism.c'],
         sources=['seed_A.tar.gz', 'seed_M.tar.gz', 'build_support.tar.gz', 'generate.py', 'templates', 'patches', 'runners', 'identities'],
         large_local_only=['active', 'artifacts', 'runs.jsonl'], private_JWST_included=False))
    print(json.dumps(load('exploration.decision.json'), ensure_ascii=False))


if __name__ == '__main__':
    main()
