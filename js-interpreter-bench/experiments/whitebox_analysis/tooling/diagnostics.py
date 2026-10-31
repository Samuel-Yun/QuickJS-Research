"""Diagnostic-only profiles/counts. Never consumed by formal statistics."""
import difflib, json, re, subprocess
from pathlib import Path
import common as c

CASES={'Richards.Richards':('richards.js',512), 'NavierStokes.NavierStokes':('navier-stokes.js',32)}

def original_source(case,n):
    p=c.ATTEMPT/'profiles'/f'{case}.N{n}.original.js'
    c.save(p,c.baseline.Campaign('Octane').source(case,n,False))
    return p

def instrument(case,n):
    original=original_source(case,n)
    source=original.read_text()
    prefix="var __wbCounts = Object.create(null); function __wbCount(k) { __wbCounts[k] = (__wbCounts[k] || 0) + 1; }\n"
    if case.startswith('Richards'):
        regex=r'([A-Za-z]+\.prototype\.[A-Za-z]+)\s*=\s*function\s*\([^)]*\)\s*\{'
        source=re.sub(regex,lambda m:m.group(0)+" __wbCount("+json.dumps(m.group(1))+");",source)
        for name in ('runRichards',):
            source,count=re.subn(r'function '+name+r'\s*\([^)]*\)\s*\{',lambda m:m.group(0)+" __wbCount('"+name+"');",source)
            if count!=1:raise RuntimeError('instrumentation anchor count '+name)
    else:
        for name in ('lin_solve','lin_solve2','advect','project','diffuse','diffuse2','vel_step','dens_step','set_bnd'):
            source,count=re.subn(r'function '+name+r'\s*\([^)]*\)\s*\{',lambda m:m.group(0)+" __wbCount('"+name+"');",source)
            if count!=1:raise RuntimeError('instrumentation anchor count '+name+': '+str(count))
    source=prefix+source+"\nconsole.log('WB_COUNTS:'+JSON.stringify(__wbCounts));\n"
    p=c.ATTEMPT/'profiles'/f'{case}.N{n}.count.js';c.save(p,source)
    c.save(p.with_suffix('.diff'),''.join(difflib.unified_diff(original.read_text().splitlines(True),source.splitlines(True),fromfile=str(original),tofile=str(p))))
    return p

def check(result):
    rows=re.findall(r'^TEB_RESULT:(.*)$',result['stdout'],re.M)
    if result['exit_code']!=0 or len(rows)!=1 or json.loads(rows[0])['correctness']!='PASS':
        raise RuntimeError('diagnostic correctness failed: '+str(result['command']))
    return json.loads(rows[0])

def main():
    c.verify()
    binary=c.ATTEMPT/'profiles/perf_probe'
    c.capture('perf_probe.build',['gcc','-O2','-Wall',str(c.BASE/'tooling/perf_probe.c'),'-o',str(binary)])
    c.capture('perf_probe.events',[str(binary)])
    counterrows=[]
    for case,(filename,n) in CASES.items():
        # Original, uninstrumented driver/N; independent diagnostic processes.
        original=original_source(case,n)
        for e in ('v8','jsc'):
            for rep in range(1,4):
                folder=c.ATTEMPT/'profiles'/f'{case}.{e}.{rep}';folder.mkdir(parents=True,exist_ok=True)
                flags=['--prof','--no-logfile-per-isolate','--logfile='+str(folder/'v8.log')] if e=='v8' else ['--sample']
                r=c.capture(f'profile.{case}.{e}.{rep}',c.command(e,original,flags),120,cwd=folder)
                check(r)
                c.save(folder/'stdout.txt',r['stdout']);c.save(folder/'stderr.txt',r['stderr'])
                print('PROFILE',case,e,rep,flush=True)
        for countn in (1,2,n):
            script=instrument(case,countn)
            for e in c.ENGINES:
                for rep in range(1,4) if countn==n else (1,):
                    r=c.capture(f'counts.{case}.N{countn}.{e}.{rep}',c.command(e,script),180)
                    result=check(r);counts=json.loads(re.search(r'^WB_COUNTS:(.*)$',r['stdout'],re.M).group(1))
                    counterrows.extend({'case':case,'engine':e,'N':countn,'rep':rep,'function':k,'calls':v,
                        'extra_validation_calls':result['extra_validation_calls'],'script_sha256':c.sha(script),'mode':'DIAGNOSTIC_COUNT'} for k,v in counts.items())
                    print('COUNTS',case,e,countn,rep,flush=True)
    c.export(c.ATTEMPT/'summary/function_counts.csv',counterrows)
    script=original_source('RegExp.RegExp',1)
    for flags,label in [(['--trace-regexp-tier-up','--trace-regexp-exec'],'trace'),
                        (['--prof','--no-logfile-per-isolate','--logfile='+str(c.ATTEMPT/'profiles/regexp.v8.log')],'profile')]:
        r=c.capture('regexp.v8.'+label,c.command('v8',script,flags),90)
        if label!='trace':check(r)
    r=c.capture('regexp.jsc.sample',c.command('jsc',script,['--sample','--dumpOptions']),90);check(r)
    r=c.capture('regexp.quickjs.normal',c.command('quickjs',script),90);check(r)
    print('DIAGNOSTICS_DONE',flush=True)

if __name__=='__main__':main()
