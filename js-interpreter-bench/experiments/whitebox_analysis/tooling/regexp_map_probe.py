"""Diagnostic-only live executable-map corroboration of RegExp tick PCs."""
import bisect,csv,json,subprocess,time
from pathlib import Path
import common as c
from diagnostics import original_source,check

def main():
    c.verify()
    path=c.ATTEMPT/'raw/regexp.v8.mapped_profile.json'
    folder=c.ATTEMPT/'profiles/regexp.mapped';folder.mkdir(parents=True,exist_ok=True)
    if not path.exists():
        script=original_source('RegExp.RegExp',64)
        cmd=c.command('v8',script,['--prof','--no-logfile-per-isolate','--logfile='+str(folder/'v8.log')])
        start=time.perf_counter_ns();p=subprocess.Popen(cmd,stdout=subprocess.PIPE,stderr=subprocess.PIPE,cwd=folder)
        snapshots=[]
        while p.poll() is None:
            try:snapshots.append({'at_ns':time.perf_counter_ns(),'maps':Path(f'/proc/{p.pid}/maps').read_text()})
            except OSError:pass
            if time.perf_counter_ns()-start>120_000_000_000:p.kill();break
            time.sleep(.05)
        stdout,stderr=p.communicate()
        r={'command':cmd,'exit_code':p.returncode,'stdout':stdout.decode(errors='replace'),'stderr':stderr.decode(errors='replace'),
            'outer_start_ns':start,'outer_stop_ns':time.perf_counter_ns(),'boot_id':Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
            'timestamp_utc':c.stamp(),'snapshots':snapshots,'pid':p.pid,'mode':'DIAGNOSTIC_PROFILE_MAPS',
            'script_sha256':c.sha(script),'binary_sha256':c.manifest()['runtime']['engines']['v8']['binary']['sha256']}
        r['outer_wall_ns']=r['outer_stop_ns']-start;c.save(path,r);check(r)
    r=c.read(path);executable=[]
    for snap in r['snapshots']:
        for line in snap['maps'].splitlines():
            cols=line.split();lo,hi=(int(x,16) for x in cols[0].split('-'))
            if 'x' in cols[1]:executable.append((lo,hi,cols[1],snap['at_ns']))
    ranges={};proof=[]
    csv.field_size_limit(20000000)
    with (folder/'v8.log').open(newline='',errors='replace') as f:
        for row in csv.reader(f):
            if not row:continue
            if row[0]=='code-creation':ranges[int(row[4],16)]=(int(row[5]),row[1],row[6],row)
            elif row[0]=='code-move' and int(row[1],16) in ranges:ranges[int(row[2],16)]=ranges.pop(int(row[1],16))
            elif row[0]=='code-delete':ranges.pop(int(row[1],16),None)
            elif row[0]=='tick':
                pc=int(row[1],16);starts=sorted(ranges);ix=bisect.bisect_right(starts,pc)-1
                if ix<0:continue
                addr=starts[ix];size,kind,name,creation=ranges[addr]
                if kind=='RegExp' and pc<addr+size:
                    maps=[{'lo':hex(lo),'hi':hex(hi),'permissions':perms,'snapshot_ns':when} for lo,hi,perms,when in executable if lo<=pc<hi]
                    proof.append({'tick':row,'code_creation':creation,'pattern':name,'executable_map_observed':bool(maps),
                        'map_example':maps[0] if maps else None})
    c.save(folder/'execution_evidence.json',{'regex_ticks':len(proof),'ticks_in_observed_executable_mapping':sum(p['executable_map_observed'] for p in proof),
        'evidence':proof,'maps_snapshots':len(r['snapshots']),'log_sha256':c.sha(folder/'v8.log'),
        'parser_sha256':c.sha(__file__),'scope':'whole process; executable mapping observed during lifetime, not instruction-level simultaneous mapping proof',
        'artifact_source_commit':None,'exact_regex_time_fraction':None})
    print('REGEXP_MAPPED',len(proof),sum(p['executable_map_observed'] for p in proof),flush=True)

if __name__=='__main__':main()
