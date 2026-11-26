static void mc_enter(JSContext*ctx,JSFunctionBytecode*b,FourSite*s)
{
    if(!mc_site){
        const char*wanted=getenv("CTOR_PROBE_FUNCTION");
        const char*name=JS_AtomToCString(ctx,b->func_name);
        int same=name && wanted && !strcmp(name,wanted);
        if(name)JS_FreeCString(ctx,name);
        if(same){
            assert(b->four_count==1);
            mc_site=s;mc_function=b;mc_pc=s->pc;mc_argc=s->argc;
            if(atexit(mc_report))abort();
        }
    }
    mc_active=mc_site==s && mc_function==b;
    mc_stage=0;
}
