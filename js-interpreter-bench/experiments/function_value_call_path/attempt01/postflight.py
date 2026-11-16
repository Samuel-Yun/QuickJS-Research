"""After formal collection only: identity, source excerpts, bounded static assembly."""
from common import *
from diagnostics import TARGET,NAMES,name,canonical
from supplement_source import main as supplement
def main():
    assert read(HERE/'identity_after.json')['status']=='PASS';verify();supplement();m=read(HERE/'manifest.json')
    for v in ['A','M']:
        for rel,h in m[v+'_source_files'].items():assert sha(Path(m[v+'_source'])/rel)==h,(v,rel)
    matches=[]
    for v in ['A','M']:
        for case in CASES:
            data=read(HERE/'raw/call_diagnostic'/f'{v}.{case}.N1.json.gz')
            for fname in [TARGET[case],'step','microRun']:
                f=[f for f in data['functions'] if name(f)==fname];assert len(f)==1
                base=read(HERE/'bytecode'/case/f'{v}.{fname}.json')
                assert canonical(f[0])==base['canonical'];matches.append(dict(variant=v,case=case,function=fname,source_sha256=base['source_sha256'],call_diagnostic_encoding_matches_property_diagnostic=True))
    csvout(HERE/'diagnostic/encoding_crosscheck.csv',matches)
    native=[]
    for symbol in ['Builtins_CallFunction_ReceiverIsNullOrUndefined','Builtins_CallFunction_ReceiverIsNotNullOrUndefined']:
        p=HERE/'raw/commands'/(symbol+'.json');r=read(p) if p.exists() else capture(symbol,['objdump','-d','-Mintel','--disassemble='+symbol,m['artifacts']['V8_ON']['path']])
        present=('<'+symbol+'>:') in r['stdout'] and bool(re.search(r'^\s+[0-9a-f]+:\s+[0-9a-f]{2}',r['stdout'],re.M))
        if present:save(HERE/'source_evidence'/(symbol+'.asm'),r['stdout'])
        native.append(dict(symbol=symbol,status='STATIC_CODE_PRESENT' if present else 'UNKNOWN',binary_sha256=m['artifacts']['V8_ON']['sha256'],per_site_executed_branch=None,raw=('raw/commands/'+symbol+'.json')))
    save(HERE/'source_evidence/native_identity.json',native)
    verify();save(HERE/'final_identity.json',dict(status='PASS',timestamp=stamp(),formal_binaries_and_dependencies_unchanged=True,A_M_all_source_files_unchanged=True,call_diagnostic_encoding_pairs=len(matches),native=native))
    save(HERE/'checkpoints/04_identity.json',dict(status='PASS',timestamp=stamp()));print('FINAL_IDENTITIES_AND_ENCODING_PASS',flush=True)
if __name__=='__main__':main()
