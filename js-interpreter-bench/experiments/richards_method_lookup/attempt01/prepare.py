"""Audit old bytes first, archive exact SHA-matching reconstructions, then freeze new inputs."""
import csv, difflib, hashlib, json, platform, subprocess, zipfile
from pathlib import Path
import common as c

def byte_audit():
    rows=[]; members={}; prefix=c.ROOT/'experiments/code_cache_validation/attempt01'
    unique={}
    for file in (prefix/'raw').glob('*.csv'):
        with file.open(newline='') as f:
            for r in csv.DictReader(f):
                if r.get('script_path'): unique[(r['script_path'],r['script_sha256'])]=r
    files={'Richards.Richards':'richards.js','NavierStokes.NavierStokes':'navier-stokes.js','Splay.Splay':'splay.js','RegExp.RegExp':'regexp.js'}
    for (path,expected),r in sorted(unique.items()):
        p=Path(path); data=p.read_bytes(); actual=hashlib.sha256(data).hexdigest()
        rel=str(p.relative_to(c.ROOT)); members['current/'+rel]=data
        blob=subprocess.run(['git','-c','safe.directory='+str(c.ROOT.parent),'show','HEAD:js-interpreter-bench/'+rel],cwd=c.ROOT,capture_output=True)
        blob_sha=hashlib.sha256(blob.stdout).hexdigest() if blob.returncode==0 else None
        recovered=None;method=None
        if actual==expected: recovered=data;method='existing exact bytes'
        else:
            # Targeted hypothesis ONLY for the documented two Octane source chunks.
            # No replacement is accepted unless the complete recorded SHA256 matches.
            names=('base.js',files[r['case']]); source=[(c.ROOT/'benchmarks/octane/upstream'/x).read_bytes().replace(b'\r\n',b'\n') for x in names]
            lf=b'\n;\n'.join(source)+b'\n;\n'
            if data.startswith(lf):
                candidate=b'\n;\n'.join(s.replace(b'\n',b'\r\n') for s in source)+b'\n;\n'+data[len(lf):]
                if hashlib.sha256(candidate).hexdigest()==expected: recovered=candidate;method='two known source segments CRLF; unchanged driver; exact whole-file SHA match'
        if recovered is not None: members['recorded/'+rel]=recovered
        rows.append({'path':rel,'recorded_sha256':expected,'actual_sha256':actual,'git_blob_sha256':blob_sha,'matches_recorded':actual==expected,'recovery':'EXACT' if recovered is not None else 'UNKNOWN','recovery_method':method})
    # Include original Richards profile input separately (not a performance rerun).
    for p in (c.ROOT/'experiments/whitebox_analysis/attempt01/profiles').glob('*original.js'):
        members['current/'+str(p.relative_to(c.ROOT))]=p.read_bytes()
    archive=c.HERE/'source_evidence/historical_bytes.zip'
    if not archive.exists():
        with zipfile.ZipFile(archive,'w',zipfile.ZIP_STORED) as z:
            for name,data in sorted(members.items()): z.writestr(zipfile.ZipInfo(name,(2026,10,8,0,0,0)),data)
    c.save(c.HERE/'source_evidence/byte_audit.json',{'scope':'all unique code_cache_validation raw CSV script identities; original whitebox profile current inputs archived; not a claim to restore all repository history','records':rows,'archive_sha256':c.sha(archive),'current_bytes_preserved':True,'exact_recovered':sum(r['recovery']=='EXACT' for r in rows),'unknown':sum(r['recovery']=='UNKNOWN' for r in rows)})

def main():
    if not (c.HERE/'source_evidence/preservation_before.json').exists(): c.save(c.HERE/'source_evidence/preservation_before.json',c.inventory())
    byte_audit()
    runtime=c.read(c.ROOT/'experiments/timer_recovery/manifest.json'); adapters={}
    for e in c.ENGINES:
        adapters[e]=[]
        for folder in ('three_engine_baseline','timer_recovery'):
            p=c.ROOT/'experiments'/folder/'adapters'/(e+'.js')
            adapters[e].append({'path':str(p),'sha256':c.sha(p)})
    c.save(c.HERE/'manifest.json',{'cohort':runtime['cohort_id'],'runtime':runtime,'adapters':adapters,'host':platform.node(),'kernel':platform.release(),'architecture':platform.machine(),'mode':c.MODE,'created_utc':c.stamp()}) if not (c.HERE/'manifest.json').exists() else None
    c.verify(True)
    for label,cmd in [('host',['uname','-a']),('cpu',['lscpu']),('memory',['free','-b']),('disk',['df','-h']),('compiler',['gcc','--version']),('background',['ps','-eo','pid,comm,pcpu,pmem']),('os',['cat','/etc/os-release']),('power',['sh','-c','for p in /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq; do if test -f "$p"; then printf "%s " "$p"; cat "$p"; else printf "%s UNKNOWN\n" "$p"; fi; done'])]: c.capture('environment.'+label,cmd)
    source=c.ROOT/'benchmarks/octane/upstream/richards.js'
    c.save(c.HERE/'source_evidence/original.richards.js',source.read_bytes())
    original=source.read_text(); start=original.index('Scheduler.prototype.schedule = function () {'); end=original.index('\n};',start)+3
    c.save(c.HERE/'source_evidence/original.schedule.js',original[start:end]+'\n')
    base=(c.ROOT/'benchmarks/octane/upstream/base.js').read_bytes()
    for variant in ('A','B'):
        part=original[start:end].replace('function ()','function mlSchedule()')
        part=part.replace('this.currentTcb = this.list;','this.currentTcb = this.list;\n  var __mlMethod;'+('\n  __mlMethod = this.currentTcb.run;' if variant=='B' else ''))
        needle='this.currentTcb = this.currentTcb.run();'
        assert part.count(needle)==1
        part=part.replace(needle,(' __mlMethod = this.currentTcb.run;\n      ' if variant=='A' else '')+'this.currentTcb = __mlMethod.call(this.currentTcb);')
        body=original[:start]+part+original[end:]
        c.save(c.HERE/f'microbench/{variant}.schedule.js',part+'\n')
        c.save(c.HERE/f'microbench/{variant}.source.js',base+b'\n;\n'+body.encode()+b'\n;\n')
        patch=''.join(difflib.unified_diff(original.splitlines(True),body.splitlines(True),fromfile='original/richards.js',tofile=variant+'/richards.js'))
        c.save(c.HERE/f'source_evidence/{variant}.workload.patch',patch)
    c.save(c.HERE/'microbench/original.source.js',base+b'\n;\n'+original.encode()+b'\n;\n')
    print('PREPARE_OK exact historical scripts',c.read(c.HERE/'source_evidence/byte_audit.json')['exact_recovered'],flush=True)

if __name__=='__main__': main()
