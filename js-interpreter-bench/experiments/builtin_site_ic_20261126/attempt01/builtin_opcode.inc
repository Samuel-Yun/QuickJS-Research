        CASE(OP_builtin_method1):
            {
                BuiltinSite *s=b->builtin_sites->sites[get_u16(pc)];
                call_argc=1;pc+=2;call_argv=sp-1;sf->cur_pc=pc;
                BIC_C(ctx,b,s->pc,3);
                if(JS_VALUE_GET_TAG(call_argv[-1])==JS_TAG_OBJECT &&
                   JS_VALUE_GET_OBJ(call_argv[-1])==JS_VALUE_GET_OBJ(s->callee) &&
                   JS_VALUE_GET_TAG(call_argv[-2])==JS_TAG_STRING &&
                   JS_VALUE_GET_TAG(call_argv[0])==JS_TAG_INT){
                    JSString *str=JS_VALUE_GET_STRING(call_argv[-2]);
                    int index=JS_VALUE_GET_INT(call_argv[0]);
                    if((uint32_t)index<str->len &&
                       !js_check_stack_overflow(rt,4096)){
                        BIC_C(ctx,b,s->pc,4);
                        if(!rt->builtin_sham){
                            /* Same entry poll as JS_CallInternal, before any
                               native frame. Strings/indices are immutable. */
                            if(js_poll_interrupts(ctx))goto exception;
                            ret_val=JS_NewInt32(ctx,string_get(str,index));
                            if(s->misses)s->misses=0;
                            BIC_C(ctx,b,s->pc,9);BIC_G(6);
                            goto builtin_method1_done;
                        }
                        if(s->misses)s->misses=0;
                        goto builtin_method1_call;
                    }
                }
                bic_miss(ctx,b,s);
            builtin_method1_call:
                ret_val=JS_CallInternal(ctx,call_argv[-1],call_argv[-2],
                                        JS_UNDEFINED,1,call_argv,0);
                if(unlikely(JS_IsException(ret_val)))goto exception;
            builtin_method1_done:
                for(i=-2;i<1;i++)JS_FreeValue(ctx,call_argv[i]);
                sp-=3;*sp++=ret_val;
            }
            BREAK;
