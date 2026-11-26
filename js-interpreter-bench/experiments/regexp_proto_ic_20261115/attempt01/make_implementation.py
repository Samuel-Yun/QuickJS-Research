"""Generate the two-file feature delta against the frozen C archive."""
from pathlib import Path
from build import load_parent,once

HERE=Path(__file__).resolve().parent


def lines(block):
    return ''.join(s.ljust(78)+'\\\n' for s in block.splitlines())


def main():
    data,_=load_parent();out=HERE/'implementation';out.mkdir(exist_ok=False)
    runtime=data['read_ic_runtime.inc'].decode()+'\n'+(HERE/'holder_admission.inc').read_text()
    (out/'read_ic_runtime.inc').write_text(runtime)
    op=data['read_ic_opcodes.inc'].decode()
    anchor='                RDI_COUNT(shape_misses);                               \\\n            }                                                           \\\n'
    replacement='''                RDI_COUNT(shape_misses);
            } else if (keep && p->class_id == JS_CLASS_REGEXP && !p->is_exotic) {
                if (site->shape == p->shape && site->holder_shape) {
                    JSObject *holder = p->shape->proto;
                    if (holder && holder->class_id == JS_CLASS_OBJECT &&
                        !holder->is_exotic && site->holder_shape == holder->shape) {
                        /* B3_NEW_HIT */
                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);
                        goto name ## _done;
                    }
                }
            }'''
    op=once(op,anchor,lines(replacement))
    anchor='                            v6_proto_update(ctx, site, origin->shape, p->shape, pr - p->prop); \\\n'
    replacement='''                            v6_proto_update(ctx, site, origin->shape, p->shape, pr - p->prop);
                        else if (keep && p == origin->shape->proto &&
                                 origin->class_id == JS_CLASS_REGEXP && !origin->is_exotic &&
                                 p->class_id == JS_CLASS_OBJECT && !p->is_exotic &&
                                 origin->shape->is_hashed && rdi_regexp_holder_admit(ctx,p))
                            v6_proto_update(ctx, site, origin->shape, p->shape, pr - p->prop);'''
    op=once(op,anchor,lines(replacement))
    (out/'read_ic_opcodes.inc').write_text(op)
    print('IMPLEMENTATION_READY')


if __name__=='__main__':main()
