/* Diagnostic ONLY. Included after JSObject/shape and find_own_property declarations.
 * No clock, output, Setup or postcondition counts while ml_active == 0. */
static int ml_active;
static JSObject *ml_proto[5], *ml_target, *ml_call;
static JSAtom ml_run_atom, ml_call_atom;
static unsigned long long ml_look[3], ml_own[3], ml_prototype[3], ml_hist[3][8];
static unsigned long long ml_fallback[3], ml_helper[3], ml_entries, ml_native_call;
static unsigned long long ml_method_direct, ml_method_builtin;
static unsigned long long ml_opcode[3][2];

static int ml_kind(JSValueConst obj, JSAtom atom) {
    JSObject *p; int i;
    if (!ml_active || !JS_IsObject(obj)) return -1;
    p = JS_VALUE_GET_OBJ(obj);
    if (atom == ml_call_atom && p == ml_target) return 2;
    if (atom != ml_run_atom) return -1;
    if (p->shape->proto == ml_proto[0]) return 0;
    for (i=1;i<5;i++) if (p->shape->proto == ml_proto[i]) return 1;
    return -1;
}
static void ml_hit(int k, int depth) {
    if (k < 0) return;
    if (!depth) ml_own[k]++; else ml_prototype[k]++;
    ml_hist[k][depth < 7 ? depth : 7]++;
}
static void ml_entry(JSValueConst fn) {
    if (ml_active && JS_IsObject(fn) && JS_VALUE_GET_OBJ(fn)==ml_target) ml_entries++;
}
static void ml_method(JSValueConst fn, JSValueConst recv) {
    if (!ml_active || !JS_IsObject(fn)) return;
    if (JS_VALUE_GET_OBJ(fn)==ml_target) ml_method_direct++;
    if (JS_VALUE_GET_OBJ(fn)==ml_call && JS_IsObject(recv) && JS_VALUE_GET_OBJ(recv)==ml_target) ml_method_builtin++;
}
static JSValue ml_begin(JSContext *ctx, JSValueConst this_val, int argc, JSValueConst *argv) {
    int i;
    if (argc!=7) return JS_ThrowTypeError(ctx,"diagnostic begin arguments");
    for (i=0;i<7;i++) if (!JS_IsObject(argv[i])) return JS_ThrowTypeError(ctx,"diagnostic identity object required");
    ml_proto[0]=JS_VALUE_GET_OBJ(argv[0]); ml_target=JS_VALUE_GET_OBJ(argv[1]);
    for (i=1;i<5;i++) ml_proto[i]=JS_VALUE_GET_OBJ(argv[i+1]);
    ml_call=JS_VALUE_GET_OBJ(argv[6]);
    if (!ml_run_atom) ml_run_atom=JS_NewAtom(ctx,"run");
    if (!ml_call_atom) ml_call_atom=JS_NewAtom(ctx,"call");
    memset(ml_look,0,sizeof(ml_look)); memset(ml_own,0,sizeof(ml_own));
    memset(ml_prototype,0,sizeof(ml_prototype)); memset(ml_hist,0,sizeof(ml_hist));
    memset(ml_fallback,0,sizeof(ml_fallback)); memset(ml_helper,0,sizeof(ml_helper));
    memset(ml_opcode,0,sizeof(ml_opcode));
    ml_entries=ml_native_call=ml_method_direct=ml_method_builtin=0; ml_active=1;
    return JS_UNDEFINED;
}
static JSValue ml_end(JSContext *ctx, JSValueConst this_val, int argc, JSValueConst *argv) {
    char out[4096]; int pos=0,k,d;
    ml_active=0;
    pos+=snprintf(out+pos,sizeof(out)-pos,"{\"scope\":\"explicit_Run_loop\",\"categories\":[");
    for(k=0;k<3;k++) {
        pos+=snprintf(out+pos,sizeof(out)-pos,"%s{\"kind\":%d,\"lookups\":%llu,\"own_hit\":%llu,\"prototype_hit\":%llu,\"fallback\":%llu,\"helper_entries\":%llu,\"get_field\":%llu,\"get_field2\":%llu,\"hops\":[",k?",":"",k,ml_look[k],ml_own[k],ml_prototype[k],ml_fallback[k],ml_helper[k],ml_opcode[k][0],ml_opcode[k][1]);
        for(d=0;d<8;d++) pos+=snprintf(out+pos,sizeof(out)-pos,"%s%llu",d?",":"",ml_hist[k][d]);
        pos+=snprintf(out+pos,sizeof(out)-pos,"]}");
    }
    snprintf(out+pos,sizeof(out)-pos,"],\"selected_entries\":%llu,\"selected_native_call_helper\":%llu,\"selected_direct_call_method\":%llu,\"selected_builtin_call_method\":%llu}",ml_entries,ml_native_call,ml_method_direct,ml_method_builtin);
    return JS_NewString(ctx,out);
}
void ml_install(JSContext *ctx) {
    JSValue global=JS_GetGlobalObject(ctx);
    JS_SetPropertyStr(ctx,global,"__mlDiagBegin",JS_NewCFunction(ctx,ml_begin,"__mlDiagBegin",7));
    JS_SetPropertyStr(ctx,global,"__mlDiagEnd",JS_NewCFunction(ctx,ml_end,"__mlDiagEnd",0));
    JS_FreeValue(ctx,global);
}
