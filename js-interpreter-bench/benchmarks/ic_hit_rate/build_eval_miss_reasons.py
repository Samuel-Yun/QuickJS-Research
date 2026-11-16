"""Build a new isolated reason classifier, leaving previous diagnostics frozen."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re

HERE=Path(__file__).resolve().parent


def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',required=True,type=Path)
    args=parser.parse_args()
    spec=importlib.util.spec_from_file_location('aggregate_builder',HERE/'build_octane_eval_counts.py')
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    module.HELPERS=(HERE/'eval_miss_reasons.h').read_text()
    real=module.importlib.import_module('subprocess').run

    def finish(command,**kwargs):
        dest=kwargs['cwd']
        q=(dest/'quickjs.c').read_text()
        q=q.replace('micro_ic_hit(site, 1);','micro_ic_hit(ctx, site, 1);')
        assert 'micro_ic_hit(ctx, site, 1);' in q
        (dest/'quickjs.c').write_text(q)
        op=(dest/'read_ic_opcodes.inc').read_text()
        for old,new in [('micro_ic_regular_query(site);','micro_ic_regular_query(ctx, site);'),
                        ('micro_ic_hit(site, 0);','micro_ic_hit(ctx, site, 0);'),
                        ('micro_ic_miss(site);','micro_ic_miss(ctx, site, obj, keep);')]:
            assert old in op;op=op.replace(old,new)
        (dest/'read_ic_opcodes.inc').write_text(op)
        r=(dest/'read_ic_runtime.inc').read_text()
        anchor='static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)\n{'
        assert r.count(anchor)==1
        r=r.replace(anchor,anchor+'\n    reason_forget(b);')
        (dest/'read_ic_runtime.inc').write_text(r)
        enum=q[q.index('JS_CLASS_OBJECT = 1'):q.index('JS_CLASS_INIT_COUNT')]
        names=['NONE']+re.findall(r'^\s*(JS_CLASS_\w+)\s*(?:=\s*1)?\s*,',enum,re.M)
        assert names[1]=='JS_CLASS_OBJECT'
        header='static const char *reason_class_names[]={'+','.join(json.dumps(s) for s in names)+'};\n'
        (dest/'reason_class_names.h').write_text(header)
        return real(command,**kwargs)

    import subprocess
    subprocess.run=finish
    try:module.main()
    finally:subprocess.run=real
    out=args.output.resolve();dest=out/'work/EVAL_COLD_DIAG'
    p=out/'build_manifest.json';m=json.loads(p.read_text())
    for name in ['quickjs.c','read_ic_opcodes.inc','read_ic_runtime.inc','reason_class_names.h']:
        m['all_diagnostic_sources'][name]=sha(dest/name);m['changed_files'][name]=sha(dest/name)
    m['scope']='same read scope; first failed admission/descriptor/cold/shape reason plus per-live-site usage'
    m['reason_builder_sha256']=sha(Path(__file__));m['reason_helpers_sha256']=sha(HERE/'eval_miss_reasons.h')
    p.write_text(json.dumps(m,indent=2)+'\n')


if __name__=='__main__':main()
