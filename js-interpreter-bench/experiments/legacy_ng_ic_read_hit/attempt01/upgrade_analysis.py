"""Mechanical analysis reuse, with ACD naming and micro separation."""
from pathlib import Path
H=Path(__file__).resolve().parent;P=H.parents[1]/'legacy_ng_ic_slotfix/attempt01'
s=(P/'analyze.py').read_text(encoding='utf-8')
s=s.replace("PAIRS=[('A','B'),('B','C'),('A','C')]","PAIRS=[('A','C'),('C','D'),('A','D')]")
s=s.replace("vals['A']","vals['A']")
s=s.replace("len(rows)==1440","len(rows)==1890").replace("expected=1440","expected=1890")
s=s.replace("main_aggregate=not case.startswith('Crypto.')","main_aggregate=case in OCTANE_CASES and not case.startswith('Crypto.')")
s=s.replace("if include_crypto or r['main_aggregate']","if r['case'] in OCTANE_CASES and (include_crypto or r['main_aggregate'])")
s=s.replace("for v in ['B','C']:","for v in ['C','D']:")
s=s.replace("    lines=['# 同批次ABC正式时间'", "    return\n    lines=['# 同批次ABC正式时间'")
s=s.replace("    for r in rows:\n        assert", "    script_hashes=read(HERE/'script_hashes.json')\n    assert sha(HERE/'script_hashes.json')==frozen['script_hashes_sha256']\n    for name,h in frozen['selected'].items():assert sha(HERE/'selected'/name)==h\n    for r in rows:\n        assert r['script_sha256']==script_hashes[r['case']]\n        assert")
s=s.replace("    csvout(HERE/'analysis/summary.csv',summaries);", "    csvout(HERE/'analysis/summary.csv',summaries);\n    csvout(HERE/'analysis/octane_summary.csv',[r for r in summaries if r['case'] in OCTANE_CASES]);\n    csvout(HERE/'analysis/micro_summary.csv',[r for r in summaries if r['case'] in MICRO_CASES]);")
s=s.replace("    aggregate['official_Octane_score']=False", "    from aggregate_ci import intervals\n    intervals(aggregate,rows,PAIRS)\n    aggregate['official_Octane_score']=False")
# Old legacy()/extras() not relevant and are deliberately not exposed as new commands.
s=s[:s.index("if __name__=='__main__':")]+'''if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['formal','diagnostics']);a=p.parse_args();globals()[a.stage]()
'''
p=H/'analyze.py';assert not p.exists();p.write_bytes(s.encode())
print('ANALYSIS_CREATED')
