JSValue wb_begin(JSContext*c,JSValueConst t,int n,JSValueConst*v){
 JSFunctionBytecode*b=JS_GetFunctionBytecode(v[0]);const char*kind=JS_ToCString(c,v[1]);assert(b && kind && b->read_ic_ready);
 memset(wb_read,0,sizeof(wb_read));memset(wb_ctor,0,sizeof(wb_ctor));memset(wb_sparse,0,sizeof(wb_sparse));
 wb_kind=!strcmp(kind,"read")?1:2;
 if(wb_kind==1){assert(b->read_ic_count==1);wb_read_site=&b->read_ic_sites[0];const char*a=JS_AtomToCString(c,wb_read_site->atom);assert(!strcmp(a,"x"));JS_FreeCString(c,a);}
 else assert(b->four_count==1);
 JS_FreeCString(c,kind);wb_active=1;return JS_UNDEFINED;
}
JSValue wb_end(JSContext*c,JSValueConst t,int n,JSValueConst*v){
 wb_active=0;fprintf(stderr,"WHITEBOX_COUNTS:{\"read\":[");for(int i=0;i<8;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)wb_read[i]);fprintf(stderr,"],\"ctor\":[");for(int i=0;i<12;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)wb_ctor[i]);fprintf(stderr,"],\"sparse\":[");for(int i=0;i<24;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)wb_sparse[i]);fprintf(stderr,"]}\n");return JS_UNDEFINED;
}
