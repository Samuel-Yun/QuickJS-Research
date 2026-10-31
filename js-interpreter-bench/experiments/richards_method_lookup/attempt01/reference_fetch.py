"""Bounded official-source fetch; no certificate bypass/security changes."""
import common as c

def main():
    for version in ('v0.8.0','db870fd4619bf8c659cf85dd092101ea2a1a8a07'):
        url='https://raw.githubusercontent.com/quickjs-ng/quickjs/'+version+'/quickjs.c'
        r=c.capture('reference.ng.'+version,['curl','-fL','--connect-timeout','10','--max-time','20',url],25)
        if r['exit_code']==0: c.save(c.HERE/f'source_evidence/ng.{version}.quickjs.c',r['stdout'])
        print('OFFICIAL_REFERENCE_FETCH',version,r['exit_code'],r['stderr'][-500:],flush=True)

if __name__=='__main__': main()
