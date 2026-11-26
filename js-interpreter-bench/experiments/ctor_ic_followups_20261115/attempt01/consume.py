from pathlib import Path
HERE=Path(__file__).resolve().parent
def apply(d,q,once):
 s=d['four_runtime.inc'];s=once(s,'    uint16_t argc;','    uint16_t argc;\n    JSAtom consume_atom;\n    uint8_t consume_kind;')
 s+= '\n#include "consume_runtime.inc"\n';d['four_runtime.inc']=s
 group=Path('js-interpreter-bench/experiments/ic_four_rounds_20261115/attempt01/group_prepare.inc').read_text();a=group.index('static int four_interior_target(');b=group.index('static int four_group_match',a)
 d['four_prepare.inc']=group[a:b]+(HERE/'consume_prepare.inc').read_text()+d['four_prepare.inc']
 d['four_prepare.inc']=once(d['four_prepare.inc'],'*pc=OP_four_ctor;', 'consume_prepare(b,s);\n            *pc=OP_four_ctor;')
 d['consume_runtime.inc']=(HERE/'consume_runtime.inc').read_text()
 q=once(q,'                for(i=-2;i<call_argc;i++)JS_FreeValue(ctx,call_argv[i]);','                consume_observe(ctx,s,call_argv[-2],call_argv[-1],ret_val);\n                for(i=-2;i<call_argc;i++)JS_FreeValue(ctx,call_argv[i]);')
 return q
