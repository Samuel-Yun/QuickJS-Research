from common import *
def main():
    old=ROOT/'experiments/read_ic_hit_ablation/attempt01'
    pieces=[]
    for case in ['M1.own_integer','M2.own_reference','M4.numeric_control','M6.poly2']:
        src=old/'cases'/(case+'.js');save(HERE/'cases'/(case+'.js'),src.read_bytes());pieces.append(src.read_bytes())
    p=HERE/'mechanism/selector_probe_all.js';save(p,b'\n;\n'.join(pieces)+b'\nconsole.log("SELECTOR_OK");\n')
    output=HERE/'mechanism/target_sites_all.json';env=dict(os.environ,FS_SELECTOR_OUTPUT=str(output))
    r=capture(['gdb','-q','-batch','-ex','source '+str(HERE/'selector_gdb.py'),'--args',runtime()['artifacts']['M']['path'],p],'selector',env=env)
    save(HERE/'raw/preflight/selector_all.json',r);assert r['exit_code']==0 and 'SELECTOR_OK' in r['stdout']
    result=read(output);assert not result['errors'] and {r['function'] for r in result['targets']}=={'m1Read','m2Read','polyRead2'}
    header='/* Public QuickJS workload selector; independently read from frozen M. */\n'
    for i,row in enumerate(sorted(result['targets'],key=lambda r:r['function']),1):
        header+='static const char fs_source_'+str(i)+'[]='+json.dumps(row['source'])+';\n'
        header+='/* SHA256 '+row['source_sha256']+'; true PC '+str(row['target_pc'])+' */\n'
    save(HERE/'implementation/fs_selectors_all.inc',header)
    print('SELECTORS_PASS',flush=True)
if __name__=='__main__':main()
