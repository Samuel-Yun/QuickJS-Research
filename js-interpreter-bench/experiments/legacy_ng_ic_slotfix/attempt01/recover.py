"""Verify/restore portable material; does not start runtimes or rewrite old records."""
import argparse,hashlib,shutil
from common import *
def verify():
    rows=read(HERE/'recovery/archives.json')
    for row in rows:
        if row['status']=='MISSING':print('MISSING',row['original_path']);continue
        archive=HERE/row['archive'];assert sha(archive)==row['compressed_sha256']
        h=hashlib.sha256()
        with gzip.open(archive,'rb') as inp:
            for b in iter(lambda:inp.read(1024*1024),b''):h.update(b)
        assert h.hexdigest()==row['original_sha256']
    print('RECOVERY_ARCHIVES_VERIFIED',len(rows),flush=True)
def main():
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['verify','restore','old-diagnostics']);ap.add_argument('--destination',type=Path);a=ap.parse_args()
    if a.stage=='verify':verify();return
    if a.stage=='restore':
        assert a.destination is not None and not a.destination.exists(),'new explicit destination required'
        verify();a.destination.mkdir(parents=True)
        for row in read(HERE/'recovery/archives.json'):
            if row['status']=='MISSING':continue
            name=Path(row['archive']).name[:-3];dest=a.destination/name
            with gzip.open(HERE/row['archive'],'rb') as inp,dest.open('xb') as out:shutil.copyfileobj(inp,out)
            assert sha(dest)==row['original_sha256']
        print('RESTORED',a.destination);return
    # Execute only data aggregation functions from the original checked source,
    # never its main() or source/binary verification imports.
    import ast
    script=(OLD/'diagnostic_analysis.py').read_text(encoding='utf-8');tree=ast.parse(script)
    nodes=[n for n in tree.body if (isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='FIELDS' for t in n.targets)) or (isinstance(n,ast.FunctionDef) and n.name=='summarize')]
    import tempfile
    ns=dict(json=json);exec(compile(ast.Module(body=nodes,type_ignores=[]),'old_data_summarize','exec'),ns)
    totals=[];units=[]
    with tempfile.TemporaryDirectory(prefix='old_ic_restore_') as folder:
        for case in CASES:
            p=OLD/'raw/diagnostic'/f'{case}.counters.json'
            if case.startswith('CodeLoad.'):
                gz=HERE/'recovery/legacy_attempt01'/f'{case}.counters.json.gz'
                if not gz.exists():raise FileNotFoundError('MISSING original old counters '+case)
                p=Path(folder)/(case+'.json')
                with gzip.open(gz,'rb') as inp,p.open('xb') as out:shutil.copyfileobj(inp,out)
            if not p.exists():raise FileNotFoundError('MISSING original old counters '+case)
            row,us=ns['summarize'](p,case);totals.append(row);units+=us
    csvout(HERE/'recovery/old_diagnostic_summary_rebuilt.csv',totals)
    # Rebuild large derived CSV only as gzip, with no >100MiB plain output.
    out=io.StringIO(newline='');w=csv.DictWriter(out,list(units[0]));w.writeheader();w.writerows(units)
    raw=out.getvalue().encode()
    expected=next(r for r in read(HERE/'recovery/archives.json') if r.get('archive','').endswith('diagnostic_units.csv.gz'))
    assert digest(raw)==expected['original_sha256']
    derived=HERE/'recovery/old_diagnostic_units_rebuilt.csv.gz'
    if derived.exists():
        # zlib/Python/OS versions can encode different, equally valid gzip
        # streams. Check exact decompressed CSV identity; never overwrite it.
        with gzip.open(derived,'rb') as f:assert f.read()==raw
    else:
        save(derived,gzip.compress(raw,compresslevel=6,mtime=0))
    save(HERE/'recovery/diagnostic_replay_audit.json',dict(status='PASS',units=len(units),raw_sha256=digest(raw),derived_csv_matches_original=True,binaries_required=False))
    print('OLD_DIAGNOSTIC_REPLAY_PASS',len(units),flush=True)
if __name__=='__main__':main()
