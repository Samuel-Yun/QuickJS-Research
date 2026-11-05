"""Post-campaign identity checks, without requiring the preparation boot to persist.
Formal raw/end independently establish the measurement boot. No runtime rebuild.
"""
from common import *
def main():
    assert (HERE/'collection_end.json').exists()
    m=runtime();checks=[]
    for c,a in m['artifacts'].items():
        h=sha(a['path']);checks.append(dict(kind='binary',condition=c,path=a['path'],sha256=h,valid=h==a['sha256']))
    for a in m['v8']['dependencies']+m['dynamic_dependencies']:
        h=sha(a['path']);checks.append(dict(kind='dependency',path=a['path'],sha256=h,valid=h==a['sha256']))
    original=read(SOURCE/'runtime.json')['quickjs'];base=Path(original['source'])
    for f,h in m['E_build']['base_files'].items():
        checks.append(dict(kind='frozen_A_source',path=str(base/f),sha256=sha(base/f),valid=sha(base/f)==h))
    for f,h in m['E_build']['modified_source_hashes'].items():
        checks.append(dict(kind='E_source',path=str(BUILD/'E'/f),sha256=sha(BUILD/'E'/f),valid=sha(BUILD/'E'/f)==h))
    assert all(c['valid'] for c in checks)
    symbols=capture(['nm','-a',str(BUILD/'E/qjs')],'release symbols');save(HERE/'raw/capability/release_symbols.json',symbols)
    assert symbols['exit_code']==0 and not re.search(r'\beic_stats\b',symbols['stdout'])
    size_records=[]
    if __import__('shutil').which('gdb'):
        for c in ['A','E']:
            r=capture(['gdb','-q','-batch','-ex','p sizeof(JSFunctionBytecode)',m['artifacts'][c]['path']],c+' bytecode header sizeof')
            save(HERE/'raw/capability'/f'{c}_header_size.json',r)
            values=re.findall(r'\$1 = (\d+)',r['stdout'])
            size_records.append(dict(condition=c,bytes=int(values[0]) if r['exit_code']==0 and values else None))
    save(HERE/'post_identity.json',dict(status='PASS',timestamp=stamp(),measurement_boot_id=m['boot_id'],post_check_boot_id=boot(),checks=checks,
        release_no_diagnostic_stats_symbol=True,bytecode_header_sizes=size_records or None,unchanged_A_and_V8=True,
        Python_version=platform.python_version(),perf_counter_clock=vars(time.get_clock_info('perf_counter')),
        monotonic_clock=vars(time.get_clock_info('monotonic')),UTC_is_provenance_not_measurement=True))
if __name__=='__main__':main()
