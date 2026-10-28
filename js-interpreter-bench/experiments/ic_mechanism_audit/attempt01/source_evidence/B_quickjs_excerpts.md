## static force_inline JSShapeProperty *find_own_property, original line 6189
```c
 6189: static force_inline JSShapeProperty *find_own_property1(JSObject *p,
 6190:                                                         JSAtom atom)
 6191: {
 6192:     JSShape *sh;
 6193:     JSShapeProperty *pr, *prop;
 6194:     intptr_t h;
 6195:     sh = p->shape;
 6196:     h = (uintptr_t)atom & sh->prop_hash_mask;
 6197:     h = sh->hash_table[h];
 6198:     prop = get_shape_prop(sh);
 6199:     while (h) {
 6200:         pr = &prop[h - 1];
 6201:         if (likely(pr->atom == atom)) {
 6202:             return pr;
 6203:         }
 6204:         h = pr->hash_next;
 6205:     }
 6206:     return NULL;
 6207: }
 6208: 
 6209: static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,
 6210:                                                        JSObject *p,
 6211:                                                        JSAtom atom)
 6212: {
 6213:     JSShape *sh;
 6214:     JSShapeProperty *pr, *prop;
 6215:     intptr_t h;
 6216:     sh = p->shape;
 6217:     h = (uintptr_t)atom & sh->prop_hash_mask;
 6218:     h = sh->hash_table[h];
 6219:     prop = get_shape_prop(sh);
 6220:     while (h) {
```
## static force_inline JSShapeProperty *find_own_property, original line 6209
```c
 6209: static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,
 6210:                                                        JSObject *p,
 6211:                                                        JSAtom atom)
 6212: {
 6213:     JSShape *sh;
 6214:     JSShapeProperty *pr, *prop;
 6215:     intptr_t h;
 6216:     sh = p->shape;
 6217:     h = (uintptr_t)atom & sh->prop_hash_mask;
 6218:     h = sh->hash_table[h];
 6219:     prop = get_shape_prop(sh);
 6220:     while (h) {
 6221:         pr = &prop[h - 1];
 6222:         if (likely(pr->atom == atom)) {
 6223:             *ppr = &p->prop[h - 1];
 6224:             /* the compiler should be able to assume that pr != NULL here */
 6225:             return pr;
 6226:         }
 6227:         h = pr->hash_next;
 6228:     }
 6229:     *ppr = NULL;
 6230:     return NULL;
 6231: }
 6232: 
 6233: static force_inline JSShapeProperty* find_own_property_ic(JSProperty** ppr, JSObject* p,
 6234:                                                           JSAtom atom, uint32_t* offset)
 6235: {
 6236:     JSShape* sh;
 6237:     JSShapeProperty *pr, *prop;
 6238:     intptr_t h, i;
 6239:     sh = p->shape;
 6240:     h = (uintptr_t)atom & sh->prop_hash_mask;
```
## #define GET_FIELD_INLINE, original line 19279
```c
19279: #define GET_FIELD_INLINE(name, keep, is_length)                         \
19280:             {                                                           \
19281:                 JSValue val, obj;                                       \
19282:                 JSAtom atom;                                            \
19283:                 JSObject *p;                                            \
19284:                 JSProperty *pr;                                         \
19285:                 uint32_t prop_offset = 0, proto_depth = 0;            \
19286:                 JSInlineCacheUpdate icu = { is_length ? NULL : b->ic, INLINE_CACHE_MISS }; \
19287:                 JSShapeProperty *prs;                                   \
19288:                                                                         \
19289:                 if (is_length) {                                        \
19290:                     atom = JS_ATOM_length;                              \
19291:                 } else {                                                \
19292:                     atom = get_u32(pc);                                 \
19293:                     pc += 4;                                            \
19294:                 }                                                       \
19295:                                                                         \
19296:                 obj = sp[-1];                                           \
19297:                 if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {   \
19298:                     p = JS_VALUE_GET_OBJ(obj);                          \
19299:                     for(;;) {                                           \
19300:                         prs = is_length ? find_own_property(&pr, p, atom) :    \
19301:                             find_own_property_ic(&pr, p, atom, &prop_offset);          \
19302:                         if (prs) {                                      \
19303:                             /* found */                                 \
19304:                             if (unlikely(prs->flags & JS_PROP_TMASK))   \
19305:                                     goto name ## _slow_path;            \
19306:                             if (!is_length && proto_depth == 0)         \
19307:                                 add_ic_slot(ctx, &icu, atom, p, prop_offset); \
19308:                             val = JS_DupValue(ctx, pr->u.value);        \
19309:                             break;                                      \
19310:                         }                                               \
19311:                         if (unlikely(p->is_exotic)) {                   \
19312:                             /* XXX: should avoid the slow path for arrays \
19313:                                and typed arrays by ensuring that 'prop' is \
19314:                                not numeric */                           \
19315:                             obj = JS_MKPTR(JS_TAG_OBJECT, p);           \
19316:                             goto name ## _slow_path;                    \
19317:                         }                                               \
19318:                         proto_depth++;                                 \
19319:                         p = p->shape->proto;                            \
19320:                         if (!p) {                                       \
19321:                             val = JS_UNDEFINED;                         \
19322:                             break;                                      \
19323:                         }                                               \
19324:                     }                                                   \
19325:                 } else {                                                \
19326:                 name ## _slow_path:                                     \
19327:                     sf->cur_pc = pc;                                    \
19328:                     val = JS_GetPropertyInternalIC(ctx, obj, atom, sp[-1], 0, proto_depth ? NULL : &icu); \
19329:                     if (unlikely(JS_IsException(val)))                  \
19330:                         goto exception;                                 \
19331:                 }                                                       \
19332:                 if (!is_length)                                        \
19333:                     rewrite_ic(ctx, pc, &icu, keep ? OP_get_field2_ic : OP_get_field_ic, atom); \
19334:                 if (keep) {                                             \
19335:                     *sp++ = val;                                        \
19336:                 } else {                                                \
19337:                     JS_FreeValue(ctx, sp[-1]);                          \
19338:                     sp[-1] = val;                                       \
19339:                 }                                                       \
19340:             }
19341: 
19342:             
19343:         CASE(OP_get_field):
19344:             GET_FIELD_INLINE(get_field, 0, 0);
19345:             BREAK;
19346: 
19347:         CASE(OP_get_field2):
19348:             GET_FIELD_INLINE(get_field2, 1, 0);
19349:             BREAK;
19350: 
19351: #if SHORT_OPCODES
19352:         CASE(OP_get_length):
19353:             GET_FIELD_INLINE(get_length, 0, 1);
19354:             BREAK;
19355: #endif
19356:             
19357:         CASE(OP_put_field):
19358:             {
19359:                 int ret;
19360:                 JSValue obj;
19361:                 JSAtom atom;
19362:                 JSObject *p;
19363:                 JSProperty *pr;
19364:                 uint32_t prop_offset;
19365:                 JSInlineCacheUpdate icu = { b->ic, INLINE_CACHE_MISS };
19366:                 JSShapeProperty *prs;
19367: 
19368:                 atom = get_u32(pc);
```
## static uint32_t get_ic_prop_offset, original line 726
```c
  726: static uint32_t get_ic_prop_offset(const JSInlineCacheUpdate *icu,
  727:                                    JSShape *shape)
  728: {
  729:     uint32_t i, cache_offset = icu->offset;
  730:     JSInlineCache *ic = icu->ic;
  731:     JSInlineCacheRingSlot *cr;
  732:     JSShape *shape_slot;
  733:     assert(cache_offset < ic->capacity);
  734:     cr = ic->cache + cache_offset;
  735:     i = cr->index;
  736:     for (;;) {
  737:         shape_slot = *(cr->shape + i);
  738:         if (likely(shape_slot == shape)) {
  739:             cr->index = i;
  740:             return cr->prop_offset[i];
  741:         }
  742: 
  743:         i = (i + 1) % countof(cr->shape);
  744:         if (unlikely(i == cr->index)) {
  745:             break;
  746:         }
  747:   }
  748: 
  749:   return INLINE_CACHE_MISS;
  750: }
  751: 
  752: static force_inline JSAtom get_ic_atom(JSInlineCache *ic, uint32_t cache_offset)
  753: {
  754:     assert(cache_offset < ic->capacity);
  755:     return ic->cache[cache_offset].atom;
  756: }
  757: 
```
## static JSValue JS_GetPropertyInternalWithIC, original line 8482
```c
 8482: static JSValue JS_GetPropertyInternalWithIC(JSContext *ctx, JSValue obj,
 8483:                                             JSAtom prop, JSValue this_obj,
 8484:                                             JSInlineCacheUpdate *icu,
 8485:                                             BOOL throw_ref_error)
 8486: {
 8487:     uint32_t tag, offset;
 8488:     JSObject *p;
 8489:     tag = JS_VALUE_GET_TAG(obj);
 8490:     if (unlikely(tag != JS_TAG_OBJECT))
 8491:         goto slow_path;
 8492:     p = JS_VALUE_GET_OBJ(obj);
 8493:     offset = get_ic_prop_offset(icu, p->shape);
 8494:     if (likely(offset != INLINE_CACHE_MISS))
 8495:         return JS_DupValue(ctx, p->prop[offset].u.value);
 8496: slow_path:
 8497:     return JS_GetPropertyInternalIC(ctx, obj, prop, this_obj, throw_ref_error, icu);
 8498: }
 8499: 
 8500: static JSValue JS_ThrowTypeErrorPrivateNotFound(JSContext *ctx, JSAtom atom)
 8501: {
 8502:     return JS_ThrowTypeErrorAtom(ctx, "private class field '%s' does not exist",
 8503:                                  atom);
 8504: }
 8505: 
 8506: /* Private fields can be added even on non extensible objects or
 8507:    Proxies */
 8508: static int JS_DefinePrivateField(JSContext *ctx, JSValueConst obj,
 8509:                                  JSValueConst name, JSValue val)
 8510: {
 8511:     JSObject *p;
 8512:     JSShapeProperty *prs;
 8513:     JSProperty *pr;
```
## static void rewrite_ic, original line 10108
```c
10108: static void rewrite_ic(JSContext *ctx, const uint8_t *pc,
10109:                        const JSInlineCacheUpdate *icu, int opcode, JSAtom atom)
10110: {
10111:     if (icu->offset != INLINE_CACHE_MISS) {
10112:         *((uint8_t *)pc - 5) = opcode;
10113:         put_u32((uint8_t *)pc - 4, icu->offset);
10114:         JS_FreeAtom(ctx, atom);
10115:     }
10116: }
10117: 
10118: /* flags can be JS_PROP_THROW or JS_PROP_THROW_STRICT */
10119: static int JS_SetPropertyValue(JSContext *ctx, JSValueConst this_obj,
10120:                                JSValue prop, JSValue val, int flags)
10121: {
10122:     if (likely(JS_VALUE_GET_TAG(this_obj) == JS_TAG_OBJECT &&
10123:                JS_VALUE_GET_TAG(prop) == JS_TAG_INT)) {
10124:         JSObject *p;
10125:         uint32_t idx;
10126:         double d;
10127:         int32_t v;
10128: 
10129:         /* fast path for array access */
10130:         p = JS_VALUE_GET_OBJ(this_obj);
10131:         idx = JS_VALUE_GET_INT(prop);
10132:         switch(p->class_id) {
10133:         case JS_CLASS_ARRAY:
10134:             if (unlikely(idx >= (uint32_t)p->u.array.count)) {
10135:                 /* fast path to add an element to the array */
10136:                 if (unlikely(idx != (uint32_t)p->u.array.count ||
10137:                              !p->fast_array ||
10138:                              !can_extend_fast_array(p))) {
10139:                     goto slow_path;
```
