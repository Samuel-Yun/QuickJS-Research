/* Included before all three property-array resize sites. No read handler
 * tests this representation. Transfers values; it does not duplicate refs. */
static JSProperty*co_realloc(JSContext*ctx,JSObject*p,size_t bytes){
 co_resize_event(p,bytes);
 if(!p->co_props)return js_realloc(ctx,p->prop,bytes);
 JSProperty*n=js_malloc(ctx,bytes);if(!n)return NULL;
 size_t old_bytes=sizeof(JSProperty)*(size_t)p->co_capacity;
 memcpy(n,p->prop,bytes<old_bytes?bytes:old_bytes);
 co_moved(bytes);
 p->prop=n;p->co_props=0;
 return n;
}
