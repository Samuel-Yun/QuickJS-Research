"""Broad low-budget exploration with explicit timing-quality labels."""
import argparse
import csv
import itertools
import json
import math
import os
import random
import subprocess
import sys
import time
import traceback
from pathlib import Path

import search as s
import stages as st
import generate

H = s.HERE
lab = s.lab
CONTROL = 'CTRL000'


def current_protocol():
    pointer = H / 'exploration.active_campaign.json'
    path = lab.load(pointer)['protocol'] if pointer.exists() else 'exploration.protocol.json'
    return lab.load(H / path)


def prefix(protocol):
    return protocol.get('file_prefix', 'exploration')


def prepare():
    if (H / 'exploration.protocol.json').exists():
        return current_protocol()
    states = st.all_rows()
    lab.save(H / 'state.before_exploration_20261106.json', states)
    if not any(row['id'] == CONTROL for row in states):
        states.append(dict(id=CONTROL, family='CONTROL', parent='s001', status='PLANNED',
                           config={}, classification='MATCHED_AOS_SINGLE_SLOT_TEMPLATE_CONTROL'))
        st.atomic_json(H / 'state.json', states)
        lab.append(dict(event='control_registered', timestamp=lab.stamp(), id=CONTROL,
                        classification='CONTROL', initial_seed_ids_unchanged=True))
    lab.save(H / 'protocol_amendment02_exploration.json', dict(
        status='FROZEN_BEFORE_BROAD_EXPLORATION', date='2026-11-06',
        reason='The agent-selected15% drift limit stopped all exploration. The user asked whether broad search can proceed.',
        applies_to=['layer1 exploratory screening', 'layer2 budget allocation'],
        old_gate='Original STOP and failed recovery certificates remain historical records',
        new_rule='15% is a quality label in exploration. Repeat an unstable block once, retain both trials, then continue other configurations even when both drift.',
        runtime_failures='Source/binary/boot/timer contradictions and baseline failures remain fatal; no invalid measurements enter summaries',
        correctness='Every configuration must pass existing minimal checks; invalid configurations cannot be promoted',
        inference='Short points allocate budget only. No CI, confirmed speedup, or official suite score from layer1.',
        formal='A final candidate still needs independent longer repeated data, safety gates and timing-quality review',
        short_N='Reuse the original pre-candidate short_n.json repetition counts for this new low-budget campaign; no historical elapsed values',
        template_control='CTRL000 measures the common AoS single-slot template, whose record is24B versus16B in frozen s001',
        bootstrap_seed=20261105, order_seed=20261106))
    configs = [row['id'] for row in states if row['family'] != 'CONTROL' and generate.resolve(row)[2] is None]
    assert len(configs) == 248
    random.Random(20261106).shuffle(configs)
    protocol = dict(status='FROZEN_BEFORE_BROAD_EXPLORATION', tag=str(time.time_ns()),
                    seed=20261106, configs=configs, original_seeds=288, supported_initial=248,
                    unsupported_initial=40, matched_control=CONTROL,
                    blocks=[configs[start:start + 6] for start in range(0, len(configs), 6)],
                    N=lab.load(H / 'short_n.json')['N'], short_cases=s.SHORT,
                    drift_limit=1.15, drift_retries=1, stage_budget_seconds=18000,
                    partial_policy='Preserve every completed sample; no complete GM from a partial block',
                    selection='Use complete blocks only; quality flags preserved; mechanisms keep explicit exploration quotas')
    lab.save(H / 'exploration.protocol.json', protocol)
    return protocol


def install_gate(protocol):
    boot = lab.boot()
    workspace = lab.load(H / 'workspace.json')
    for artifact in workspace['artifacts'].values():
        assert lab.sha(artifact['path']) == artifact['sha256']
    def gate():
        assert lab.boot() == boot, 'BOOT_CHANGED'
        if (H / 'STOP_EXPLORATION').exists():
            raise RuntimeError('Explicit exploration stop requested; checkpoint preserved')
    s.gate = gate
    lab.execution_gate = gate
    return boot


def summarize(protocol):
    name = prefix(protocol)
    descriptions = []
    details = []
    for number, group in enumerate(protocol['blocks']):
        checkpoint = H / (name + '.block' + str(number) + '.complete.json')
        if not checkpoint.exists(): continue
        check = lab.load(checkpoint)
        for trial, filename in enumerate(check['trials']):
            block = lab.load(H / filename)
            for result in block['results']:
                cid = result['candidate']
                for kind in ['sunspider', 'octane']:
                    for denominator in ['A', 's001']:
                        data = result['ratios'][kind + '/' + denominator]
                        descriptions.append(dict(candidate=cid, family='CONTROL' if cid == CONTROL else st.row_for(cid)['family'],
                            kind=kind, denominator=denominator, subset_gm=data['gm'], trial=trial,
                            timing_quality=block['status'], block=number, official_score=False, CI='not estimated'))
                        for case in data['cases']:
                            details.append(dict(candidate=cid, kind=kind, denominator=denominator,
                                case=case['case'], ratio=case['ratio'], trial=trial, block=number,
                                timing_quality=block['status']))
    for filename, data in [(name + '.summary.csv', descriptions), (name + '.per_case.csv', details)]:
        if not data: continue
        with (H / filename).open('w', encoding='utf-8', newline='') as stream:
            writer = csv.DictWriter(stream, list(data[0]), lineterminator='\n')
            writer.writeheader(); writer.writerows(data)


def collect():
    lab.save(H / 'runners' / ('explore_20261106.' + lab.sha(Path(__file__)) + '.py'), Path(__file__).read_bytes())
    protocol = prepare()
    name = prefix(protocol)
    boot = install_gate(protocol)
    os.sched_setaffinity(0, {2})
    inventory = subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    for line in inventory.splitlines()[1:]:
        fields = line.split(None, 2)
        assert not (len(fields) >= 2 and (fields[1] in ['qjs', 'd8', 'gcc', 'cc1', 'make'] or fields[1].endswith('.qjs'))), 'Existing workload/compiler ' + line
    environment = H / ('exploration.environment.' + protocol['tag'] + '.json')
    if environment.exists():
        assert lab.load(environment)['boot_id'] == boot, 'A new boot requires a new exploration campaign, not mixed blocks'
    else:
        lab.save(environment, dict(boot_id=boot, timestamp=lab.stamp(), affinity=[2],
                 uname=os.uname(), cpuinfo=Path('/proc/cpuinfo').read_text(), meminfo=Path('/proc/meminfo').read_text(),
                 process_inventory=inventory, temperature='UNKNOWN', power_frequency_control='UNKNOWN',
                 controller_sha256=lab.sha(Path(__file__))))
    started = time.monotonic()
    control = st.build(CONTROL, lifecycle=True)
    assert control is not None
    for number, group in enumerate(protocol['blocks']):
        checkpoint = H / (name + '.block' + str(number) + '.complete.json')
        if checkpoint.exists(): continue
        if time.monotonic() - started > protocol['stage_budget_seconds']:
            lab.save(H / (name + '.budget_stop.json'), dict(status='PARTIAL_BUDGET', next_block=number, elapsed_s=time.monotonic() - started))
            return
        eligible = []
        for cid in group:
            state = st.row_for(cid)
            if state['status'] in ['INVALID', 'BUILD_FAILED', 'UNSUPPORTED', 'DUPLICATE']: continue
            artifact = st.build(cid)
            if artifact is not None: eligible.append(cid)
        trials = []
        if eligible:
            for attempt in range(2):
                block_name = 'explore.' + protocol['tag'] + '.block' + str(number) + '.trial' + str(attempt)
                result = st.quick_block(eligible + [CONTROL], block_name, 'exploratory_screen', protocol['N'])
                trials.append(block_name + '.json')
                if not result['endpoint_drift']: break
            quality = 'UNSTABLE' if result['endpoint_drift'] else ('DRIFT_RECOVERED' if len(trials) == 2 else 'OK')
            for cid in eligible:
                s.update(cid, exploration_block=number, exploration_quality=quality,
                         decision='exploratory budget allocation only; no confirmed performance claim')
        else:
            quality = 'NO_VALID_CONFIGURATIONS'
        lab.save(checkpoint, dict(status='COMPLETE_EXPLORATORY_BLOCK', block=number, candidates=eligible,
                 originally_scheduled=group, trials=trials, quality=quality, boot_id=boot))
        summarize(protocol)
        complete = sum(len(lab.load(p)['candidates']) for p in H.glob(name + '.block*.complete.json'))
        st.atomic_json(H / (name + '.progress.json'), dict(timestamp=lab.stamp(), boot_id=boot,
                       actual_complete_configurations=complete, expected_supported=248, completed_block=number,
                       timing_quality=quality, elapsed_s=time.monotonic() - started))
        print('BROAD_SEARCH_CHECKPOINT', complete, '/248', 'block', number, quality, flush=True)
    lab.save(H / (name + '.complete.json'), dict(status='COMPLETE_SUPPORTED_INITIAL_EXPLORATORY_SCREEN',
               expected_supported=248, initial_seeds=288, additional_controls=1, boot_id=boot,
               elapsed_s=time.monotonic() - started, data_scope='new campaign only; quality labels retained'))
    print('BROAD_SEARCH_INITIAL_LAYER_COMPLETE', flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['collect', 'summarize'])
    args = parser.parse_args()
    try:
        if args.action == 'collect': collect()
        else: summarize(current_protocol())
    except Exception as exc:
        lab.append(dict(event='exploration_controller_error', timestamp=lab.stamp(),
                        error_type=type(exc).__name__, error=str(exc), traceback=traceback.format_exc()))
        raise
