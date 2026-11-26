"""ownRead v2: full A macro and fused handler, all text black, original demo."""
import hashlib,json,re,sys,zipfile
from pathlib import Path
try:
    import pptx
except ImportError:
    sys.path.insert(0,'/tmp/quickjs-whitebox-slide-deps')
from lxml import etree as ET
from pptx import Presentation
from pptx.dml.color import RGBColor
from pptx.enum.shapes import MSO_SHAPE
from pptx.enum.text import MSO_AUTO_SIZE
from pptx.oxml.xmlchemy import OxmlElement
from pptx.util import Inches,Pt
H=Path(__file__).resolve().parent
ROOT=H.parents[1]
PACKAGE=ROOT/'js-interpreter-bench/on_demand_ctor_cache'
OUT=H/'ownRead_源码展开版.pptx'
BLUE=INK=GRAY='000000'
LINE='D5D5D5';PALE='F5F5F5';WHITE='FFFFFF'
CN='KaiTi';EN='Times New Roman';MONO='DejaVu Sans Mono'
P=Presentation();P.slide_width=Inches(16);P.slide_height=Inches(9)
P.core_properties.title='ownRead：原版 A 与冻结 SPARSE，源码展开版'
P.core_properties.author='';P.core_properties.subject='bytecode_demo.js 与冻结源码'

def color(hex):return RGBColor.from_string(hex)
def rect(s,x,y,w,h,fill=PALE,line=None):
    q=s.shapes.add_shape(MSO_SHAPE.RECTANGLE,Inches(x),Inches(y),Inches(w),Inches(h))
    q.fill.solid();q.fill.fore_color.rgb=color(fill)
    if line:q.line.color.rgb=color(line);q.line.width=Pt(.65)
    else:q.line.fill.background()
    return q


def fonts(run,size,face=EN,bold=False,hex=INK):
    run.font.name=face;run.font.size=Pt(size);run.font.bold=bold;run.font.color.rgb=color(hex)
    rp=run._r.get_or_add_rPr();rp.set('lang','zh-CN')
    for tag,value in [('a:latin',face),('a:ea',CN),('a:cs',face)]:
        e=rp.find('{http://schemas.openxmlformats.org/drawingml/2006/main}'+tag.split(':')[1])
        if e is None:e=OxmlElement(tag);rp.append(e)
        e.set('typeface',value)


def text(s,string,x,y,w,h,size=22,hex=INK,bold=False,face=EN,spacing=None,name=None):
    h=max(h,len(string.split('\n'))*(spacing or size*1.28)/72+.15)
    q=s.shapes.add_textbox(Inches(x),Inches(y),Inches(w),Inches(h))
    q.name=name or string[:70];tf=q.text_frame;tf.clear()
    tf.margin_left=tf.margin_right=tf.margin_top=tf.margin_bottom=0
    tf.word_wrap=False;tf.auto_size=MSO_AUTO_SIZE.NONE
    for i,line in enumerate(string.split('\n')):
        p=tf.paragraphs[0] if i==0 else tf.add_paragraph()
        p.space_before=Pt(0);p.space_after=Pt(0)
        p.line_spacing=Pt(spacing or size*1.28)
        run=p.add_run();run.text=line;fonts(run,size,face,bold,hex)
    return q


def code(s,lines,x,y,w,h,size=20.5,high=(),spacing=None):
    # Every line stays editable. Highlighting does not alter source tokens.
    h=max(h,len(lines)*(spacing or size*1.27)/72+.15)
    q=text(s,'',x,y,w,h,size=size,face=MONO,name='C or bytecode excerpt')
    tf=q.text_frame
    for i,line in enumerate(lines):
        p=tf.paragraphs[0] if i==0 else tf.add_paragraph()
        p.space_before=Pt(0);p.space_after=Pt(0);p.line_spacing=Pt(spacing or size*1.27)
        r=p.add_run();r.text=line
        fonts(r,size,MONO,i in high,BLUE if i in high else (GRAY if '/* ... */' in line else INK))
    return q


def slide(conclusion,index):
    s=P.slides.add_slide(P.slide_layouts[6]);s.background.fill.solid();s.background.fill.fore_color.rgb=color(WHITE)
    rect(s,.65,.48,.055,.37,BLUE)
    text(s,conclusion,.88,.40,14.2,.56,26)
    text(s,str(index),15.05,8.56,.3,.2,11,GRAY)
    return s


def source_footer(s,string):text(s,string,.8,8.56,13.9,.22,11,GRAY)


def line(s,x1,y1,x2,y2):
    # All connectors are native shapes too.
    q=s.shapes.add_connector(1,Inches(x1),Inches(y1),Inches(x2),Inches(y2))
    q.line.color.rgb=color(LINE);q.line.width=Pt(1)


def tokens(s):
    s=re.sub(r'/\*.*?\*/','',s,flags=re.S)
    return re.findall(r'[A-Za-z_][A-Za-z_0-9]*|\d+|\S',s.replace('\\\n','\n'))


def block(text,start,end):
    i=text.index(start);return text[i:text.index(end,i)].rstrip()


def macro_lines(raw,dedent=0):
    out=[]
    for i,l in enumerate(raw.splitlines()):
        l=l.rstrip().removesuffix('\\').rstrip()
        if i and dedent and l.startswith(' '*dedent):l=l[dedent:]
        if l:out.append(l)
    return out


def subseq(a,b):
    it=iter(b);return all(any(v==n for v in it) for n in a)


manifest=json.loads((PACKAGE/'manifest.json').read_text())
for group in ['original','modified']:
    for name,digest in manifest[group].items():
        assert hashlib.sha256((PACKAGE/group/name).read_bytes()).hexdigest()==digest
assert (H/'bytecode_demo.js').read_bytes()==(PACKAGE/'tests/bytecode_demo.js').read_bytes()
a=(PACKAGE/'original/quickjs.c').read_text();m=(PACKAGE/'modified/quickjs.c').read_text()
r=(PACKAGE/'modified/read_ic_runtime.inc').read_text()
op=(PACKAGE/'modified/read_ic_opcodes.inc').read_text()
afull=block(a,'#define GET_FIELD_INLINE(name, keep, is_length)','\n        CASE(OP_get_field):')
vfull=block(m,'#define V6_PREPARED_BORROW(slot)','\n#if !DIRECT_DISPATCH')
ufull=block(r,'static force_inline void rdi_update','\nstatic void v6_proto_update')
afmt=macro_lines(afull,12)
# Keep every statement, branch and comment; wrap just one long call.
where=afmt.index('        val = JS_GetPropertyInternal(ctx, obj, atom, sp[-1], 0);')
afmt[where:where+1]=['        val = JS_GetPropertyInternal(ctx, obj, atom,',
                     '                                     sp[-1], 0);']
assert tokens('\n'.join(afmt))==tokens(afull)
vfmt=[
 '#define V6_PREPARED_BORROW(slot) do {',
 '    JSValueConst receiver = (slot);',
 '    if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {',
 '        JSObject *object = JS_VALUE_GET_OBJ(receiver);',
 '        ReadICSite *site =',
 '            (ReadICSite *)(pc + 1 + get_u32(pc + 1));',
 '        if (object->class_id == JS_CLASS_OBJECT &&',
 '            !object->is_exotic &&',
 '            site->shape == object->shape) {',
 '            *sp++ = JS_DupValue(ctx,',
 '                object->prop[site->prop_offset].u.value);',
 '            pc += 5;',
 '            break;',
 '        }',
 '    }',
 '    *sp++ = JS_DupValue(ctx, receiver);',
 '} while (0)',
]
assert tokens('\n'.join(vfmt))==tokens(vfull)
ufmt=[
 'static force_inline void rdi_update(',
 '    JSContext *ctx, ReadICSite *s,',
 '    JSShape *shape, uint32_t offset RDI_DPARAM)',
 '{',
 '    RDI_COUNT(updates);',
 '    JSShape *old = s->shape,',
 '            *old_holder = s->holder_shape;',
 '    js_dup_shape(shape);',
 '    s->shape = shape;',
 '    s->holder_shape = NULL;',
 '    s->prop_offset = offset;',
 '    js_free_shape_null(ctx->rt, old_holder);',
 '    js_free_shape_null(ctx->rt, old);',
 '}',
]
assert tokens('\n'.join(ufmt))==tokens(ufull)
arg='CASE(OP_get_arg0): *sp++ = JS_DupValue(ctx, arg_buf[0]); BREAK;'
assert arg in a
getfield='CASE(OP_get_field): GET_FIELD_INLINE(get_field, 0, 0); BREAK;'
assert ''.join(tokens(getfield)) in ''.join(tokens(a))
entry='CASE(OP_v6_get_arg0): V6_PREPARED_BORROW(arg_buf[0]); BREAK;'
assert entry in m
return_lines=['CASE(OP_return):','    ret_val = *--sp;','    goto done;']
assert ''.join(tokens('\n'.join(return_lines))) in ''.join(tokens(a))
lookup=[
 'RDI_COUNT(fallback);',
 'atom = site->atom;',
 'if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {',
 '    p = origin = JS_VALUE_GET_OBJ(obj);',
 '    for (;;) {',
 '        prs = find_own_property(&pr, p, atom);',
 '        if (prs) {',
 '            if (unlikely(prs->flags & JS_PROP_TMASK)) {',
 '                RDI_REASON(descriptor);',
 '                goto name ## _slow;',
 '            }',
 '            val = JS_DupValue(ctx, pr->u.value);',
]
learn=[
 'else if (p->class_id != JS_CLASS_OBJECT ||',
 '         p->is_exotic) { RDI_REASON(special); }',
 'else if (!p->shape->is_hashed) { RDI_REASON(unhashed); }',
 'else {',
 '    RDI_REASON(own_miss);',
 '    rdi_update(ctx, site, p->shape,',
 '               pr - p->prop RDI_DARG(d));',
 '}',
]
cleanup=['else { JS_FreeValue(ctx, sp[-1]); sp[-1] = val; }']
assert subseq(tokens('\n'.join(lookup)),tokens(op))
assert subseq(tokens('\n'.join(learn)),tokens(op))
assert ''.join(tokens(cleanup[0])) in ''.join(tokens(op))
for name,raw in [('A_GET_FIELD_INLINE',afull),('SPARSE_V6_PREPARED_BORROW',vfull),
                 ('SPARSE_rdi_update',ufull),('SPARSE_GET_READ_IC',op)]:
    (H/(name+'.c.txt')).write_text(raw+'\n')
for engine in ['A','method']:
    assert (H/'bytecode'/(engine+'.stdout')).read_text()=='sum=700\n'
    snapshots=[json.loads(l) for l in (H/'bytecode'/(engine+'.snapshots.jsonl')).read_text().splitlines()]
    d=next(x for x in snapshots if x['function']=='ownRead')
    assert d['byte_code_len']==7 and [o['pc'] for o in d['opcodes']]==[0,1,6]
    if engine=='method':assert d['opcodes'][1]['delta']==6 and d['read_sites'][0]['offset']==0


# 1: the repository's complete example, then ownRead's actual bytecode only.
s=slide('从 bytecode_demo.js 开始，先分析 ownRead 的读取过程。',1)
rect(s,.8,1.12,11.02,3.79)
code(s,(H/'bytecode_demo.js').read_text().splitlines(),1.02,1.25,10.58,3.52,
     size=14.9,spacing=16.3,high=(1,10))
text(s,'本页放完整示例。',12.14,1.38,3.0,.4,21)
text(s,'construct 用来生成 obj，\n后续再单独分析。',12.14,2.25,3.0,.95,19,spacing=27)
text(s,'本例 obj.x = 3\n循环结束 sum = 700',12.14,3.68,3.0,.9,19,spacing=28)
text(s,'原版 A · ownRead',.85,5.10,7,.4,20,bold=True)
text(s,'冻结 SPARSE · ownRead',8.24,5.10,7,.4,20,bold=True)
for x in [.8,8.18]:rect(s,x,5.63,7.02,1.45,WHITE,LINE)
for engine,x in [('A',1.0),('method',8.38)]:
    rows=[]
    for l in (H/'bytecode'/(engine+'.txt')).read_text().splitlines():
        if l.startswith('000'):
            f=l.split(None,2);rows.append(f'{f[0]}  {f[1]:<14}  '+(f[2] if len(f)>2 else ''))
    code(s,rows,x,5.87,6.73,1.05,size=18.7,spacing=25,high=(0,1))
text(s,'指令区：7 字节 = 1 + 5 + 1，不含 IC 记录。',.85,7.24,7.1,.4,18)
text(s,'IC[0] x: 自有字段, offset=0',8.38,7.24,6.7,.4,17,face=MONO)
for x,label,desc in [(.85,'IC[0]','记录编号'),(5.85,'delta=6','到记录的字节距离'),
                     (10.8,'prop_offset=0','x 的属性槽号')]:
    text(s,label,x,7.86,4.5,.3,19,bold=True,face=MONO)
    text(s,desc,x,8.22,4.5,.3,17)
source_footer(s,'输入：tests/bytecode_demo.js 原样运行；工具 --engine both --function ownRead；字节码仅调整列间空白。')
s.notes_slide.notes_text_frame.text=(
 '这次直接用仓库的 bytecode_demo.js，construct 先负责生成对象，今天先看 ownRead。'
 '对象的 x 是 3、y 是 4，所以每轮加七，循环结束输出 sum=700。'
 '两版 ownRead 的指令区都是七字节，IC 编号、到记录的字节距离和属性槽号是三件不同的事。')


# 2: complete upstream macro, including every branch and comment.
s=slide('A：先压入 obj，再按 atom 查属性，最后把栈顶替换成 3。',2)
code(s,[arg],.85,1.18,14.3,.4,size=15.0,spacing=21,high=())
code(s,[getfield],.85,1.65,14.3,.4,size=15.0,spacing=21,high=())
text(s,'空栈 → [obj] → [3] → 返回 3；A 已有内联属性查找快路。',.85,2.17,14.1,.35,19)
for x in [.8,8.18]:rect(s,x,2.73,7.02,5.67)
split=26
for rows,x,start in [(afmt[:split],.91,0),(afmt[split:],8.29,split)]:
    high=[i for i,l in enumerate(rows) if any(t in l for t in ['atom = get_u32','obj = sp[-1]',
        'prs = find_own_property','val = JS_DupValue','JS_FreeValue(ctx, sp[-1])','sp[-1] = val'])]
    code(s,rows,x,2.85,6.86,5.40,size=13.15,spacing=14.2,high=high)
source_footer(s,'original/quickjs.c:18601、19107–19162；GET_FIELD_INLINE 完整展开，按从左到右阅读；只去掉续行符和空行。')
s.notes_slide.notes_text_frame.text=(
 '第一条 get_arg0 给 obj 增加临时引用并压栈，此时栈上还是对象。'
 'get_field 调用 GET_FIELD_INLINE，keep 和 is_length 都是零，所以按 x 的 atom 查找，最后走替换栈顶的分支。'
 'find_own_property 找到普通数据属性后取出 3，再释放临时 obj 引用，把栈顶换成 3。'
 '这里把宏的所有分支都放出来了，原型、特殊对象和异常分支也保留，按左列再右列看。')


# 3: complete frozen fused macro, without any omitted body or guard.
s=slide('SPARSE：同布局命中时，借用 obj，直接取 x，再跳到 return。',3)
code(s,[entry],.85,1.18,14.3,.4,size=16.8,spacing=23,high=())
rect(s,.8,1.90,10.03,6.38)
code(s,vfmt,1.02,2.10,9.59,5.99,size=17.8,spacing=23,
     high=(1,5,8,9,10,11,15))
steps=[
 (2.02,'① 借用参数','receiver 来自 arg_buf[0]，\n此时不把 obj 压栈。'),
 (3.62,'② 定位读 IC','pc 在 1，操作数字段在 2；\n本例 2 + delta 6 = 8。'),
 (5.22,'③ 检查并读取','普通对象且 shape 相同，\n用 prop_offset 读取当前 x。'),
 (6.82,'④ pc 加 5','越过偏移 1–5 的读取指令，\n到偏移 6 的 return。'),
]
for y,label,desc in steps:
    text(s,label,11.16,y,4.0,.4,21,bold=True)
    text(s,desc,11.16,y+.56,4.0,.95,18.5,spacing=26)
source_footer(s,'modified/quickjs.c:18761、17872–17886；V6_PREPARED_BORROW 完整代码，含命中体、回退与全部守卫；仅换行排版。')
s.notes_slide.notes_text_frame.text=(
 '这页把冻结版的整个融合宏都放出来，所有守卫、命中体和最后的回退都在。'
 '命中时只把属性值 3 压栈，没有先压 obj，所以省掉临时对象引用的增减。'
 '进入这个 handler 后 pc 在一，get_field_rdi 占五字节，加五就到六的 return，字节码表中那条读取指令仍在，只是这次不执行。'
 '缓存为空或布局不符时会落到最后一行，把 obj 压栈，交给下一条 get_field_rdi。')


# 4: actual lookup/learning path, plus complete update helper and return.
s=slide('首次没有命中：正常查找、填入 shape 和槽号，再返回 3。',4)
handler='CASE(OP_get_field_rdi): GET_READ_IC(get_field_rdi, 0); BREAK;'
assert ''.join(tokens(handler)) in ''.join(tokens(op))
code(s,[handler],.85,1.15,14.3,.4,size=15.5,spacing=22)
text(s,'GET_READ_IC：实际查找片段',.85,1.76,8.3,.4,20,bold=True)
rect(s,.8,2.30,8.34,2.95)
code(s,lookup,1.0,2.47,7.94,2.64,size=14.1,spacing=15.4,
     high=(1,5,11))
text(s,'同一宏中，自有字段的资格检查与填充',.85,5.34,8.3,.4,19,bold=True)
rect(s,.8,5.81,8.34,1.93)
code(s,learn,1.0,5.97,7.94,1.70,size=14.1,spacing=14.6,high=(4,5,6))
text(s,'keep=0：释放 obj，把属性值放回栈顶。',.85,7.83,8.25,.32,17)
code(s,cleanup,1.0,8.18,7.94,.3,size=12.6,spacing=15)
text(s,'rdi_update：完整函数',9.48,1.76,5.7,.4,20,bold=True)
rect(s,9.42,2.30,5.78,3.64)
code(s,ufmt,9.60,2.48,5.43,3.29,size=12.3,spacing=15.6,
     high=tuple(i for i,l in enumerate(ufmt) if 's->shape =' in l or 's->prop_offset =' in l))
text(s,'最后仍执行 return',9.48,6.22,5.7,.4,20,bold=True)
code(s,return_lines,9.60,6.85,5.43,1.0,size=17.8,spacing=24,high=(1,))
text(s,'取出栈顶的 3，作为返回值。',9.48,8.02,5.7,.4,18)
source_footer(s,'本页为普通自有字段路径节选；原型等分支未抄入。rdi_update 完整保留；快照不是逐次命中日志。')
s.notes_slide.notes_text_frame.text=(
 '第一次缓存为空，融合入口先把 obj 压栈，下一条 get_field_rdi 仍会探测缓存，然后进入这里的正常查找。'
 '找到 x 后，普通对象、稳定 shape 和普通数据属性这些条件符合，才调用右边完整的 rdi_update，把 shape 和槽号存起来。'
 '这个例子随后把栈顶 obj 换成属性值 3，return 再把 3 取出返回；后续同布局命中就走上一页的融合路径。'
 '这里只节选自有字段经过的分支，完整读取宏另存为源码文本，快照的 offset=0 表示已填充，不当作命中次数。')


P.save(OUT)
(H/'讲稿备注.md').write_text('\n\n'.join(f'第 {i} 页\n\n{s.notes_slide.notes_text_frame.text}' for i,s in enumerate(P.slides,1))+'\n')
proof=dict(status='PASS',slides=4,all_text_black=True,demo_sha256=hashlib.sha256((H/'bytecode_demo.js').read_bytes()).hexdigest(),
    original_demo_unchanged=True,A_macro_complete=True,V6_macro_complete=True,rdi_update_complete=True,
    source_tokens_verified=True,frozen_sources_verified=True,property_value_in_demo=3,
    pptx_sha256=hashlib.sha256(OUT.read_bytes()).hexdigest())
(H/'content_check.json').write_text(json.dumps(proof,ensure_ascii=False,indent=2)+'\n')
print(OUT)


