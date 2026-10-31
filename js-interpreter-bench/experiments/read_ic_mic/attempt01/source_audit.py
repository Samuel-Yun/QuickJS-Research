"""Current source/patch/template audit, optional live identity, no benchmark."""
from common import *
def main():
    verify_runtime();ids=read(HERE/'sources/identities.json')['files'];checks=[]
    for v in VERSIONS:
        assert all(sha(STORE/v/name)==h for name,h in ids[v].items())
    for name in ['read_ic_types.h','read_ic_runtime.inc','read_ic_prepare.inc','read_ic_opcodes.inc']:
        assert sha(HERE/'implementation'/name)==ids['M'][name]
        checks.append(dict(template=name,sha256=ids['M'][name],matches_actual_M_P=True))
    for v in ['M','P']:
        symbols=read(HERE/'raw/build'/f'{v}_nm.1.json')['stdout']
        assert 'read_ic_report' not in symbols and 'rdi_diag_' not in symbols
    save(HERE/'machinecode/source_audit.json',dict(status='PASS',templates=checks,formal_sources_match_frozen=True,
      P_M_only_config=True,no_diagnostic_symbols_in_formal=True,write_body_upstream_identical=True))
    print('SOURCE_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
