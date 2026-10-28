## static force_inline JSShapeProperty *find_own_property, original line 6124
```c
 6124: static force_inline JSShapeProperty *find_own_property1(JSObject *p,
 6125:                                                         JSAtom atom)
 6126: {
 6127:     JSShape *sh;
 6128:     JSShapeProperty *pr, *prop;
 6129:     intptr_t h;
 6130:     sh = p->shape;
 6131:     h = (uintptr_t)atom & sh->prop_hash_mask;
 6132:     h = sh->hash_table[h];
 6133:     prop = get_shape_prop(sh);
 6134:     while (h) {
 6135:         pr = &prop[h - 1];
 6136:         if (likely(pr->atom == atom)) {
 6137:             return pr;
 6138:         }
 6139:         h = pr->hash_next;
 6140:     }
 6141:     return NULL;
 6142: }
 6143: 
 6144: static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,
 6145:                                                        JSObject *p,
 6146:                                                        JSAtom atom)
 6147: {
 6148:     JSShape *sh;
 6149:     JSShapeProperty *pr, *prop;
 6150:     intptr_t h;
 6151:     sh = p->shape;
 6152:     h = (uintptr_t)atom & sh->prop_hash_mask;
 6153:     h = sh->hash_table[h];
 6154:     prop = get_shape_prop(sh);
 6155:     while (h) {
```
## static force_inline JSShapeProperty *find_own_property, original line 6144
```c
 6144: static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,
 6145:                                                        JSObject *p,
 6146:                                                        JSAtom atom)
 6147: {
 6148:     JSShape *sh;
 6149:     JSShapeProperty *pr, *prop;
 6150:     intptr_t h;
 6151:     sh = p->shape;
 6152:     h = (uintptr_t)atom & sh->prop_hash_mask;
 6153:     h = sh->hash_table[h];
 6154:     prop = get_shape_prop(sh);
 6155:     while (h) {
 6156:         pr = &prop[h - 1];
 6157:         if (likely(pr->atom == atom)) {
 6158:             *ppr = &p->prop[h - 1];
 6159:             /* the compiler should be able to assume that pr != NULL here */
 6160:             return pr;
 6161:         }
 6162:         h = pr->hash_next;
 6163:     }
 6164:     *ppr = NULL;
 6165:     return NULL;
 6166: }
 6167: 
 6168: #include "read_ic_runtime.inc"
 6169: 
 6170: /* indicate that the object may be part of a function prototype cycle */
 6171: static void set_cycle_flag(JSContext *ctx, JSValueConst obj)
 6172: {
 6173: }
 6174: 
 6175: static void free_var_ref(JSRuntime *rt, JSVarRef *var_ref)
```
## #define GET_FIELD_INLINE, original line 19128
```c
19128: #define GET_FIELD_INLINE(name, keep, is_length)                         \
19129:             {                                                           \
19130:                 JSValue val, obj;                                       \
19131:                 JSAtom atom;                                            \
19132:                 JSObject *p;                                            \
19133:                 JSProperty *pr;                                         \
19134:                 JSShapeProperty *prs;                                   \
19135:                                                                         \
19136:                 if (is_length) {                                        \
19137:                     atom = JS_ATOM_length;                              \
19138:                 } else {                                                \
19139:                     atom = get_u32(pc);                                 \
19140:                     pc += 4;                                            \
19141:                 }                                                       \
19142:                                                                         \
19143:                 obj = sp[-1];                                           \
19144:                 if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {   \
19145:                     p = JS_VALUE_GET_OBJ(obj);                          \
19146:                     for(;;) {                                           \
19147:                         prs = find_own_property(&pr, p, atom);          \
19148:                         if (prs) {                                      \
19149:                             /* found */                                 \
19150:                             if (unlikely(prs->flags & JS_PROP_TMASK))   \
19151:                                     goto name ## _slow_path;            \
19152:                             val = JS_DupValue(ctx, pr->u.value);        \
19153:                             break;                                      \
19154:                         }                                               \
19155:                         if (unlikely(p->is_exotic)) {                   \
19156:                             /* XXX: should avoid the slow path for arrays \
19157:                                and typed arrays by ensuring that 'prop' is \
19158:                                not numeric */                           \
19159:                             obj = JS_MKPTR(JS_TAG_OBJECT, p);           \
19160:                             goto name ## _slow_path;                    \
19161:                         }                                               \
19162:                         p = p->shape->proto;                            \
19163:                         if (!p) {                                       \
19164:                             val = JS_UNDEFINED;                         \
19165:                             break;                                      \
19166:                         }                                               \
19167:                     }                                                   \
19168:                 } else {                                                \
19169:                 name ## _slow_path:                                     \
19170:                     sf->cur_pc = pc;                                    \
19171:                     val = JS_GetPropertyInternal(ctx, obj, atom, sp[-1], 0); \
19172:                     if (unlikely(JS_IsException(val)))                  \
19173:                         goto exception;                                 \
19174:                 }                                                       \
19175:                 if (keep) {                                             \
19176:                     *sp++ = val;                                        \
19177:                 } else {                                                \
19178:                     JS_FreeValue(ctx, sp[-1]);                          \
19179:                     sp[-1] = val;                                       \
19180:                 }                                                       \
19181:             }
19182: 
19183:             
19184: #include "read_ic_opcodes.inc"
19185: 
19186:         CASE(OP_get_field):
19187:             GET_FIELD_INLINE(get_field, 0, 0);
19188:             BREAK;
19189: 
19190:         CASE(OP_get_field2):
19191:             GET_FIELD_INLINE(get_field2, 1, 0);
19192:             BREAK;
19193: 
19194: #if SHORT_OPCODES
19195:         CASE(OP_get_length):
19196:             GET_FIELD_INLINE(get_length, 0, 1);
19197:             BREAK;
19198: #endif
19199:             
19200:         CASE(OP_put_field):
19201:             {
19202:                 int ret;
19203:                 JSValue obj;
19204:                 JSAtom atom;
19205:                 JSObject *p;
19206:                 JSProperty *pr;
19207:                 JSShapeProperty *prs;
19208: 
19209:                 atom = get_u32(pc);
19210:                 pc += 4;
19211: 
19212:                 obj = sp[-2];
19213:                 if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {
19214:                     p = JS_VALUE_GET_OBJ(obj);
19215:                     prs = find_own_property(&pr, p, atom);
19216:                     if (!prs)
19217:                         goto put_field_slow_path;
```
