        CASE(OP_int_loop_bits):
        {
            ExBits loop;const uint8_t *head=pc-1;int matched=ex_bits_match(b,head,&loop);
            int32_t mask,count,input;JSValue value;
            assert(matched);EX_COUNT(loop_entries);
            value=loop.a?arg_buf[loop.idx]:var_buf[loop.idx];
            if(JS_VALUE_GET_TAG(var_buf[loop.m])!=JS_TAG_INT || JS_VALUE_GET_TAG(var_buf[loop.c])!=JS_TAG_INT || JS_VALUE_GET_TAG(value)!=JS_TAG_INT) {
                EX_COUNT(loop_guard);
                b->byte_code_buf[head-b->byte_code_buf]=OP_get_loc0+loop.m;
                *sp++=JS_DupValue(ctx,var_buf[loop.m]);
                BREAK;
            }
            mask=JS_VALUE_GET_INT(var_buf[loop.m]);count=JS_VALUE_GET_INT(var_buf[loop.c]);input=JS_VALUE_GET_INT(value);
            for(;;) {
                int condition=mask<loop.bound,bit;
                if(unlikely(ctx->interrupt_counter<=1)) {
                    var_buf[loop.m]=JS_NewInt32(ctx,mask);var_buf[loop.c]=JS_NewInt32(ctx,count);
                    pc=condition?loop.body:loop.end;EX_COUNT(loop_checkpoints);
                    if(js_poll_interrupts(ctx)) goto exception;
                    BREAK;
                }
                --ctx->interrupt_counter;
                if(!condition) {
                    var_buf[loop.m]=JS_NewInt32(ctx,mask);var_buf[loop.c]=JS_NewInt32(ctx,count);pc=loop.end;
                    BREAK;
                }
                bit=((uint32_t)input&(uint32_t)mask)!=0;
                if(unlikely(ctx->interrupt_counter<=1)) {
                    var_buf[loop.m]=JS_NewInt32(ctx,mask);var_buf[loop.c]=JS_NewInt32(ctx,count);
                    pc=bit?loop.inc:loop.shift;EX_COUNT(loop_checkpoints);
                    if(js_poll_interrupts(ctx)) goto exception;
                    BREAK;
                }
                --ctx->interrupt_counter;
                if(bit) {
                    if(count==INT32_MAX) {
                        var_buf[loop.m]=JS_NewInt32(ctx,mask);var_buf[loop.c]=JS_NewInt32(ctx,count);
                        pc=loop.inc;EX_COUNT(loop_overflow);
                        BREAK;
                    }
                    ++count;
                }
                mask=(int32_t)((uint32_t)mask<<1);
                EX_COUNT(loop_iters);
                if(unlikely(ctx->interrupt_counter<=1)) {
                    var_buf[loop.m]=JS_NewInt32(ctx,mask);var_buf[loop.c]=JS_NewInt32(ctx,count);
                    pc=head;EX_COUNT(loop_checkpoints);
                    if(js_poll_interrupts(ctx)) goto exception;
                    BREAK;
                }
                --ctx->interrupt_counter;
            }
        }
        BREAK;
