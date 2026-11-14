#ifdef EX_RMW
#ifdef EX_RMW_UPDATE
        CASE(OP_field_rmw_update):
        {
            ReadICSite *site=(ReadICSite *)(pc+get_u32(pc));
            JSValue receiver=sp[-1];JSObject *object;JSShapeProperty *descriptor;JSProperty *property;
            const uint8_t *next=pc+4;int32_t constant=1;int k=0;int64_t value;
            EX_COUNT(rmw_attempts);
            if(*next==OP_inc) next++;
            else { k=ex_integer(next,&constant);next+=k+1; }
#ifdef EX_DIAGNOSTIC
            if(ex_active) ex_rmw_constants[(constant>=-16 && constant<=15)?constant+16:32]++;
#endif
            if(constant!=1) { EX_COUNT(rmw_const_other);goto ex_rmw_field2_fallback; }
            if(JS_VALUE_GET_TAG(receiver)!=JS_TAG_OBJECT) { EX_COUNT(rmw_guard);goto ex_rmw_field2_fallback; }
            object=JS_VALUE_GET_OBJ(receiver);
            if(object->class_id!=JS_CLASS_OBJECT || object->is_exotic || site->holder_shape || site->shape!=object->shape) {
                EX_COUNT(rmw_guard);goto ex_rmw_field2_fallback;
            }
            descriptor=&get_shape_prop(object->shape)[site->prop_offset];
            if((descriptor->flags&(JS_PROP_TMASK|JS_PROP_WRITABLE|JS_PROP_LENGTH))!=JS_PROP_WRITABLE) {
                EX_COUNT(rmw_guard);goto ex_rmw_field2_fallback;
            }
            property=&object->prop[site->prop_offset];
            if(JS_VALUE_GET_TAG(property->u.value)!=JS_TAG_INT) { EX_COUNT(rmw_type);goto ex_rmw_field2_fallback; }
            value=(int64_t)JS_VALUE_GET_INT(property->u.value)+constant;
            if(value<INT32_MIN || value>INT32_MAX) { EX_COUNT(rmw_overflow);goto ex_rmw_field2_fallback; }
            property->u.value=JS_NewInt32(ctx,(int32_t)value);
            pc=next+5;sp--;
            EX_COUNT(rmw_hits);
            JS_FreeValue(ctx,receiver); /* original initial receiver ownership */
            BREAK;
        }
#endif
        CASE(OP_field_rmw_i32):
        CASE(OP_field_rmw_i32_wide):
        {
            int n=pc[-1]==OP_field_rmw_i32?1:3,a=0,i=0,k;
            const uint8_t *load=pc+n-1,*read=load+n;
            ReadICSite *site=(ReadICSite *)(read+1+get_u32(read+1));
            JSValue receiver; JSObject *object; JSShapeProperty *descriptor; JSProperty *property;
            int32_t constant; int64_t result;
            ex_load(load,&a,&i);
            receiver=a?arg_buf[i]:var_buf[i];
            k=ex_integer(read+5,&constant);
            EX_COUNT(rmw_attempts);
#ifdef EX_DIAGNOSTIC
            if(ex_active) ex_rmw_constants[(constant>=-16 && constant<=15)?constant+16:32]++;
#endif
#ifndef EX_RMW_CONST
            if(constant!=1) { EX_COUNT(rmw_const_other); goto rmw_fallback; }
#endif
            if(JS_VALUE_GET_TAG(receiver)!=JS_TAG_OBJECT) { EX_COUNT(rmw_guard); goto rmw_fallback; }
            object=JS_VALUE_GET_OBJ(receiver);
            if(object->class_id!=JS_CLASS_OBJECT || object->is_exotic || site->holder_shape || site->shape!=object->shape) {
                EX_COUNT(rmw_guard); goto rmw_fallback;
            }
            descriptor=&get_shape_prop(object->shape)[site->prop_offset];
            if((descriptor->flags&(JS_PROP_TMASK|JS_PROP_WRITABLE|JS_PROP_LENGTH))!=JS_PROP_WRITABLE) {
                EX_COUNT(rmw_guard); goto rmw_fallback;
            }
            property=&object->prop[site->prop_offset];
            if(JS_VALUE_GET_TAG(property->u.value)!=JS_TAG_INT) { EX_COUNT(rmw_type); goto rmw_fallback; }
            result=(int64_t)JS_VALUE_GET_INT(property->u.value)+constant;
            if(result<INT32_MIN || result>INT32_MAX) { EX_COUNT(rmw_overflow); goto rmw_fallback; }
            /* Only int32 values: no finalizer/callback or allocation. No stack
             * changes before this commit. All original interior entries remain.
             */
            property->u.value=JS_NewInt32(ctx,(int32_t)result);
            pc=read+5+k+1+5;
            EX_COUNT(rmw_hits);
            BREAK;
rmw_fallback:
            *sp++=JS_DupValue(ctx,receiver); /* original first load only */
            pc=load;
        }
        BREAK;
#endif

#ifdef EX_LOOP
        CASE(OP_int_loop_kernel):
        {
            ExLoop loop; const uint8_t *head=pc-1; JSValue bound;
            int32_t counter,sum,limit; int64_t result;
            int matched=ex_loop_match(b,head,&loop);
            assert(matched);
            EX_COUNT(loop_entries);
            bound=loop.barg==2?JS_NewInt32(ctx,loop.bound):(loop.barg?arg_buf[loop.bi]:var_buf[loop.bi]);
            if(JS_VALUE_GET_TAG(var_buf[loop.i])!=JS_TAG_INT ||
               JS_VALUE_GET_TAG(var_buf[loop.s])!=JS_TAG_INT || JS_VALUE_GET_TAG(bound)!=JS_TAG_INT) {
                EX_COUNT(loop_guard);
                /* Deopt this optional entry permanently; remaining bytecode is
                 * untouched, including every legal interior branch target. */
                b->byte_code_buf[head-b->byte_code_buf]=OP_get_loc0+loop.i;
                *sp++=JS_DupValue(ctx,var_buf[loop.i]);
                BREAK;
            }
            counter=JS_VALUE_GET_INT(var_buf[loop.i]);sum=JS_VALUE_GET_INT(var_buf[loop.s]);limit=JS_VALUE_GET_INT(bound);
            for(;;) {
                int condition=counter<limit;
                /* Original if_false8 polls on BOTH true and false conditions. */
                if(unlikely(ctx->interrupt_counter<=1)) {
                    var_buf[loop.i]=JS_NewInt32(ctx,counter);var_buf[loop.s]=JS_NewInt32(ctx,sum);
                    pc=condition?loop.body:loop.end;
                    EX_COUNT(loop_checkpoints);
                    if(js_poll_interrupts(ctx)) goto exception;
                    BREAK;
                }
                --ctx->interrupt_counter;
                if(!condition) {
                    var_buf[loop.i]=JS_NewInt32(ctx,counter);var_buf[loop.s]=JS_NewInt32(ctx,sum);
                    pc=loop.end;
                    BREAK;
                }
                result=(int64_t)sum+counter;
                if(result<INT32_MIN || result>INT32_MAX) {
                    var_buf[loop.i]=JS_NewInt32(ctx,counter);var_buf[loop.s]=JS_NewInt32(ctx,sum);
                    pc=loop.body; /* condition was already consumed and polled */
                    EX_COUNT(loop_overflow);
                    BREAK;
                }
                sum=(int32_t)result;
                /* Strict counter<an int32 bound proves increment cannot overflow. */
                ++counter;
                EX_COUNT(loop_iters);
                /* Original backward goto8 also polls once per iteration. */
                if(unlikely(ctx->interrupt_counter<=1)) {
                    var_buf[loop.i]=JS_NewInt32(ctx,counter);var_buf[loop.s]=JS_NewInt32(ctx,sum);
                    pc=head;
                    EX_COUNT(loop_checkpoints);
                    if(js_poll_interrupts(ctx)) goto exception;
                    BREAK;
                }
                --ctx->interrupt_counter;
            }
        }
        BREAK;
#endif
