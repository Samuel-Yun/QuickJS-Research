"""Count actual Run events of the pinned Octane scripts using a diagnostic qjs."""
import argparse, csv, json, os, subprocess, tempfile
from pathlib import Path

def main():
    parser=argparse.ArgumentParser()
    for key in ['engine','scripts','zlib-preload','out']:
        parser.add_argument('--'+key,type=Path,required=True)
    parser.add_argument('--kind',choices=['census','instance','calls'],default='census')
    opt=parser.parse_args()
    names=['instanceof_opcode','instanceof_helper','default_hook','default_primitive_lhs','default_direct_proto',
           'builtin_call_all','call_method_target_JS','call_method_builtin_call']
    if opt.kind=='instance':
        names=['primitive_fast','object_fast','slot_hits','slot_fills']
    if opt.kind=='calls':
        names=['source_line','column','pc','argc_with_thisArg','calls_to_JS_through_builtin_call']
    with tempfile.TemporaryDirectory() as tmp, opt.out.open('w') as f:
        w=csv.writer(f); w.writerow(['case','N',*names])
        for p in sorted(opt.scripts.glob('octane.*.measure.js')):
            if opt.kind=='calls' and not ('DeltaBlue' in p.name or 'Typescript' in p.name): continue
            if opt.kind=='instance' and not ('EarleyBoyer' in p.name or 'PdfJS' in p.name): continue
            src=p.read_text()
            first='var started=now();'; last='var stopped=now();'
            assert src.count(first)==src.count(last)==1
            q=Path(tmp)/p.name
            q.write_text(src.replace(first,first+'__roundCensus(true);').replace(last,'__roundCensus(false);'+last))
            flags=['--std','-I',str(opt.zlib_preload.resolve())] if '.zlib.' in p.name else []
            run=subprocess.run([str(opt.engine.resolve()),*flags,'--script',str(q)],env=dict(os.environ,QJS_INSTANCE_MODE='cached'),
                               capture_output=True,text=True,check=True)
            result=json.loads(run.stdout.split('OCTANE_IC_RESULT:')[-1]); assert result['correctness']=='PASS'
            if opt.kind=='calls':
                calls=[l.split(',')[1:] for l in run.stderr.splitlines() if l.startswith('CALLSITE,')]
                for fields in sorted(calls,key=lambda line:-int(line[-1])):w.writerow([result['case'],result['N'],*fields])
                continue
            prefix='ROUND,'  if opt.kind=='census' else 'IC_HITS,'
            counts=next(l for l in run.stderr.splitlines() if l.startswith(prefix)).split(',')[1:]
            assert len(counts)==len(names);w.writerow([result['case'],result['N'],*counts]);f.flush()
if __name__=='__main__':main()
