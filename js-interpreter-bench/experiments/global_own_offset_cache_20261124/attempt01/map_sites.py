"""Map counted static points to actual frozen-base bytecode snapshots."""
import importlib.util
import json
import os
import subprocess
from pathlib import Path

from build import HERE,PACKAGE,save
from run import TARGETS,TESTS,ENV


def main():
    out=HERE/'site_mapping';out.mkdir(exist_ok=False)
    counted=json.loads((HERE/'target_counts.json').read_text())
    spec=importlib.util.spec_from_file_location('go_site_bytecode',PACKAGE/'tools/bytecode.py')
    tool=importlib.util.module_from_spec(spec);spec.loader.exec_module(tool)
    records=[]
    for c in TARGETS:
        folder=out/c['name']
        command=['python3',str(PACKAGE/'tools/bytecode.py'),str(TESTS/c['path']),'--engine','method','--output',str(folder)]
        r=subprocess.run(command,capture_output=True,text=True,env=ENV,timeout=600)
        (out/(c['name']+'.inspection.log')).write_text(r.stdout+r.stderr);assert r.returncode==0
        snapshots=[json.loads(s) for s in (folder/'method.snapshots.jsonl').read_text().splitlines()]
        row=next(r for r in counted if r['case']==c['case'] and r['label']=='GLOBAL_OWN_OFFSET_CACHE')
        for site in row['top'][:5]:
            name='' if site['function']=='<null>' else site['function'];matches=[]
            for b in snapshots:
                if b['function']!=name:continue
                for i,op in enumerate(b['opcodes']):
                    if op['name']=='get_field_rdi' and op['pc']==site['pc'] and op['site_index']==site['index'] and op['atom']==site['atom']:
                        previous=b['opcodes'][i-1] if i else None
                        matches.append(dict(bytecode_function_id=b['id'],bytecode_len=b['byte_code_len'],previous=previous))
            assert matches,(c['name'],site)
            records.append(dict(case=c['case'],site=site,matches=matches))
        print('SITES_MAPPED',c['name'],flush=True)
    save(HERE/'site_mapping.json',dict(status='PASS',records=records,
        snapshot_engine='frozen original SPARSE inspection build; candidate has identical instruction encoding/preparation',
        times_not_performance_samples=True))


if __name__=='__main__':main()
