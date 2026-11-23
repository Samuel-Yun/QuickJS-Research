"""Four editable slides, using the frozen source and an actual ownRead snapshot."""
import hashlib
import json
from pathlib import Path
import re
import sys
import zipfile

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
OUT=H/'ownRead_A与SPARSE_执行过程.pptx'
BLUE='236EA5';INK='17212B';GRAY='64717D';LINE='D9E2E9';PALE='F3F7FA';WHITE='FFFFFF'
CN='KaiTi';EN='Times New Roman';MONO='DejaVu Sans Mono'


def check_sources():
    manifest=json.loads((PACKAGE/'manifest.json').read_text())
    for group in ['original','modified']:
        for n,digest in manifest[group].items():
            assert hashlib.sha256((PACKAGE/group/n).read_bytes()).hexdigest()==digest,(group,n)
    snaps={}
    for engine in ['A','method']:
        all_snaps=[json.loads(l) for l in (H/'bytecode'/(engine+'.snapshots.jsonl')).read_text().splitlines()]
        selected=[r for r in all_snaps if r['function']=='ownRead'];assert len(selected)==1
        d=selected[0];assert d['byte_code_len']==7
        assert [o['pc'] for o in d['opcodes']]==[0,1,6]
        assert [o['size'] for o in d['opcodes']]==[1,5,1]
        assert (H/'bytecode'/(engine+'.stdout')).read_text()=='7\n7\n'
        snaps[engine]=d
    assert snaps['A']['opcodes'][0]['name']=='get_arg0'
    d=snaps['method'];assert d['opcodes'][0]['name']=='v6_get_arg0'
    assert d['opcodes'][1]['delta']==6 and d['opcodes'][1]['site_index']==0
    assert d['read_sites'][0]['offset']==0 and d['read_sites'][0]['shape']
    return snaps


SNAPS=check_sources()
P=Presentation();P.slide_width=Inches(16);P.slide_height=Inches(9)
P.core_properties.title='ownRead：原版 A 与冻结 SPARSE 的读取过程'
P.core_properties.author='';P.core_properties.subject='实际字节码与冻结 C 源码'


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


def original_tokens(s):
    s=re.sub(r'/\*.*?\*/','',s,flags=re.S)
    return re.findall(r'[A-Za-z_][A-Za-z_0-9]*|\d+|\S',s.replace('\\\n','\n'))


def is_subsequence(needle,haystack):
    it=iter(haystack);return all(any(v==n for v in it) for n in needle)


# Source excerpts: only layout/continuation backslashes are changed.
a_arg=['CASE(OP_get_arg0):','    *sp++ = JS_DupValue(ctx,','        arg_buf[0]);','    BREAK;']
a_field=[
    'atom = get_u32(pc);',
    'pc += 4;',
    '/* ... */',
    'obj = sp[-1];',
    '/* ... */',
    'p = JS_VALUE_GET_OBJ(obj);',
    '/* ... */',
    'prs = find_own_property(&pr, p, atom);',
    '/* ... */',
    'val = JS_DupValue(ctx, pr->u.value);',
    '/* ... */',
    'JS_FreeValue(ctx, sp[-1]);',
    'sp[-1] = val;',
]
m_entry=['CASE(OP_v6_get_arg0): V6_PREPARED_BORROW(arg_buf[0]); BREAK;']
m_front=[
    '#define V6_PREPARED_BORROW(slot) do {',
    '    JSValueConst receiver = (slot);',
    '    if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {',
    '        JSObject *object = JS_VALUE_GET_OBJ(receiver);',
    '        ReadICSite *site =',
    '            (ReadICSite *)(pc + 1 + get_u32(pc + 1));',
    '        if (object->class_id == JS_CLASS_OBJECT &&',
    '            !object->is_exotic &&',
    '            site->shape == object->shape) {',
    '            /* ... */',
]
m_back=[
    '            *sp++ = JS_DupValue(ctx,',
    '                object->prop[',
    '                    site->prop_offset].u.value);',
    '            pc += 5;',
    '            break;',
    '        }',
    '    }',
    '    *sp++ = JS_DupValue(ctx, receiver);',
    '} while (0)',
]
assert original_tokens('\n'.join(a_arg))==original_tokens((H/'A_get_arg0.c.txt').read_text())
assert is_subsequence(original_tokens('\n'.join(a_field)),original_tokens((H/'A_GET_FIELD_INLINE.c.txt').read_text()))
assert original_tokens('\n'.join(m_entry))==original_tokens((H/'SPARSE_get_arg0.c.txt').read_text())
assert original_tokens('\n'.join(m_front+m_back))==original_tokens((H/'SPARSE_V6_PREPARED_BORROW.c.txt').read_text())


# 1 — Same JS, actual runtime bytecode, three different meanings of zero/six.
s=slide('同一个 ownRead，前两条指令变了；函数仍是 7 字节。',1)
rect(s,.8,1.17,9.55,1.57)
code(s,(H/'own_read.js').read_text().splitlines(),1.05,1.35,9.0,1.25,size=20,high=(0,),spacing=23)
text(s,'两版都打印：\n7\n7',11.08,1.38,3.5,1.18,22,spacing=27)
text(s,'原版 A',.85,3.02,5.6,.35,22,bold=True)
text(s,'冻结 SPARSE_CTOR_IC',8.22,3.02,6.7,.35,22,BLUE,bold=True)
for x in [.8,8.18]:rect(s,x,3.56,7.02,1.63,WHITE,LINE)
for engine,x in [('A',1.0),('method',8.38)]:
    # Same printed fields; only excess column padding is tightened.
    raw=[]
    for v in (H/'bytecode'/(engine+'.txt')).read_text().splitlines():
        if v.startswith('000'):
            parts=v.split(None,2);raw.append(f'{parts[0]}  {parts[1]:<14}  '+(parts[2] if len(parts)>2 else ''))
    code(s,raw,x,3.87,6.73,1.05,size=18.7,high=(0,1),spacing=26)
text(s,'实际输出节选 · 只收紧列间空白',.85,5.37,7.0,.3,16,GRAY)
text(s,'IC[0] x: 自有字段, offset=0',8.38,5.37,6.7,.32,17,face=MONO)
definitions=[
    (.85,'IC[0]','查看工具显示的记录编号。'),
    (5.85,'delta = 6','从操作数字段到 IC 记录的字节距离。'),
    (10.8,'prop_offset = 0','x 在对象属性数组中的槽号。'),
]
for x,label,desc in definitions:
    text(s,label,x,6.17,4.4,.35,22,BLUE,bold=True,face=MONO if label!='IC[0]' else EN)
    # Manual break keeps the third definition in its own column.
    if label=='delta = 6':desc='从操作数字段到 IC 记录\n的字节距离。'
    text(s,desc,x,6.75,4.65,.83,19,spacing=26)
rect(s,.8,7.92,14.4,.025,LINE)
text(s,'指令前的偏移量以字节计；7 字节 = 1 + 5 + 1，不含旁边的 IC 记录。',.85,8.08,14.1,.35,20)
source_footer(s,'实测：tools/bytecode.py own_read.js --engine both --function ownRead；完整输出保存在 bytecode/。')
s.notes_slide.notes_text_frame.text=(
    '这段程序调用了两次 ownRead，两版都打印 7，这里只放这个函数的实际字节码。'
    'IC[0] 是记录编号，delta=6 是找这条记录要跨过的字节数，prop_offset=0 才是 x 的属性槽号。'
    '函数指令本身都是七字节，旁边额外分配的 IC 记录不算在这七字节里。')


# 2 — Original inline lookup, with ownership and stack transitions.
s=slide('A 先把 obj 压栈，再按属性名找到 x。',2)
text(s,'OP_get_arg0',.85,1.22,5,.35,21,bold=True,face=MONO)
rect(s,.8,1.84,5.48,2.0)
code(s,a_arg,1.02,2.06,5.05,1.65,size=18.6,high=(1,2),spacing=28)
text(s,'先给 obj 增加一份临时引用，\n再把它压到操作数栈。',.88,3.89,5.3,1.0,22,spacing=31)
text(s,'这里的 atom 是属性名 x 的标识。',.88,5.25,5.4,.45,20)
text(s,'GET_FIELD_INLINE · 普通对象自有字段路径',6.76,1.22,8.4,.4,21,bold=True)
rect(s,6.72,1.84,8.48,4.96)
code(s,a_field,6.98,2.03,7.94,4.48,size=19.2,high=(7,9,11,12),spacing=24)
text(s,'原始 C 节选：/* ... */ 标出省略的分支与循环；宏续行符省略。',6.78,6.94,8.55,.3,15,GRAY)
text(s,'A 已有内联属性查找快路；\n这里仍调用 find_own_property。',.88,6.32,5.4,.8,18,spacing=25)
states=[(.85,'空栈'),(4.35,'[obj]'),(7.85,'[7]'),(11.52,'返回 7')]
for x,value in states:
    rect(s,x,7.74,2.68,.55,PALE)
    text(s,value,x+.1,7.83,2.48,.34,23,BLUE,bold=True)
for x in [3.68,7.18,10.7]:text(s,'→',x,7.8,.55,.4,25,GRAY)
text(s,'取参数',3.28,7.28,1.6,.33,17,GRAY)
text(s,'查找并替换栈顶',6.24,7.28,2.8,.33,17,GRAY)
text(s,'return',10.43,7.28,1.7,.33,17,GRAY,face=MONO)
source_footer(s,'原始源码节选：original/quickjs.c:18601、19107–19162；仅做排版换行，/* ... */ 为省略标记。')
s.notes_slide.notes_text_frame.text=(
    '先看 get_arg0，它把参数里的 obj 增加一份临时引用后压栈，所以这时栈上是 obj，还不是 7。'
    'get_field 已经在解释器内部做了内联查找，find_own_property 按 x 的 atom 找到属性，再复制出值 7。'
    '最后释放栈上临时的 obj 引用，用 7 替换栈顶，return 再把 7 返回。'
    '后面优化要省的就是这次查找和中间对象引用的操作。')


# 3 — Half one of the actual macro: borrowing, record addressing, guards.
s=slide('SPARSE 借用参数里的 obj，先检查这个读点的缓存。',3)
text(s,'冻结版入口',.85,1.22,3,.34,20,GRAY)
code(s,m_entry,3.0,1.23,12.1,.4,size=18.3,high=(),spacing=25)
rect(s,.8,2.05,10.02,4.59)
code(s,m_front,1.0,2.30,9.60,4.10,size=19.4,high=(1,5,8),spacing=27)
text(s,'① 借用 arg_buf[0]',11.14,2.17,4.0,.4,23,BLUE,bold=True)
text(s,'借用参数里的对象，\n不先压入 obj。',11.16,2.78,3.95,.9,22,spacing=30)
text(s,'② 找到 ReadICSite',11.14,3.95,4.0,.4,23,BLUE,bold=True)
text(s,'此时 pc 在偏移 1；\n操作数字段在偏移 2。\n本例：2 + delta 6 = 8。',11.16,4.55,4.0,1.3,21,spacing=29)
text(s,'③ 检查普通对象及 shape',.88,7.10,7.4,.4,23,BLUE,bold=True)
text(s,'通过后才直接读槽；不符合就走原回退。',.88,7.72,9.8,.4,22)
text(s,'此时栈仍为空。',11.16,7.46,3.9,.4,22,BLUE)
source_footer(s,'原始 C 前半节选：modified/quickjs.c:18761、17872–17880；宏续行符省略，命中体见下一页。')
s.notes_slide.notes_text_frame.text=(
    '入口传进来的是 arg_buf[0]，receiver 只是借用参数里的对象，参数本身还持有它，所以此时没有把 obj 压栈。'
    '读完偏移零的 opcode 后 pc 已经在一，pc+1 指向偏移二的操作数字段，从那里加 delta 六，就找到偏移八的记录。'
    '接着检查普通对象类别和 shape，满足这些条件才进入下一页的直接读取。')


# 4 — Half two, exact PC arithmetic and first-call fallback.
s=slide('命中后只把 obj.x 压栈，pc 从 1 前进到 6。',4)
text(s,'V6_PREPARED_BORROW · 接上一页的 if 命中体',.85,1.26,10.0,.4,21,bold=True)
rect(s,.8,1.92,9.66,3.84)
# Continue the original indentation; only the long expression is line-wrapped.
code(s,m_back,1.04,2.20,9.12,3.26,size=20,high=(0,1,2,3,7),spacing=27)
text(s,'pc += 5 越过一整条指令',10.92,1.96,4.28,.45,23,BLUE,bold=True)
text(s,'get_field_rdi 占 5 字节：',10.94,2.66,4.2,.4,21)
for x,w,label in [(10.94,1.14,'1'),(12.18,1.47,'2–5'),(13.78,1.35,'6')]:
    rect(s,x,3.35,w,.57,PALE)
    text(s,label,x+.12,3.48,w-.2,.3,20,BLUE,bold=True,face=MONO)
text(s,'opcode     delta     return',10.94,4.08,4.3,.34,17,face=MONO)
text(s,'1 + 5 = 6',11.30,4.76,3.8,.5,27,BLUE,bold=True,face=MONO)
text(s,'字节码表里仍有 get_field_rdi；\n命中时跳过它的执行。',.88,6.08,14.1,.84,22,spacing=30)
line(s,.8,7.03,15.2,7.03)
text(s,'第一次：缓存为空',.88,7.24,3.3,.35,21,BLUE,bold=True)
text(s,'压入 obj → get_field_rdi 正常查找 → 填入 shape 和槽号。',4.15,7.24,11.0,.4,20)
text(s,'后续同布局命中',.88,7.87,3.3,.35,21,BLUE,bold=True)
text(s,'只压入 7，省查找、临时 obj 引用增减和一次字节码分发。',4.15,7.87,11.0,.4,20)
source_footer(s,'原始宏后半：modified/quickjs.c:17881–17886；快照中“自有字段，offset=0”只说明已填充，不是逐次命中日志。')
s.notes_slide.notes_text_frame.text=(
    '命中体用 prop_offset 直接取出当前的属性值，并把值 7 压栈，整个过程没有把 obj 压栈。'
    '此时 pc 在一，后面的 get_field_rdi 是一字节 opcode 加四字节操作数，一共五字节，因此加五正好到偏移六的 return。'
    '第一次缓存为空时会落到底部那行，把 obj 压栈，再由 get_field_rdi 正常查找并填缓存；后续同布局命中就少一次查找、一次分发和临时 obj 引用的增减。'
    '快照里的 offset=0 只说明记录已经填上了，我们没有逐次命中计数，所以这里不写实测命中次数。')


# Give notes and the theme the same Chinese/Latin font preferences.
P.save(OUT)
with zipfile.ZipFile(OUT) as z:files={n:z.read(n) for n in z.namelist()}
NS={'a':'http://schemas.openxmlformats.org/drawingml/2006/main'}
for name,blob in list(files.items()):
    if not name.startswith('ppt/') or not name.endswith('.xml'):continue
    root=ET.fromstring(blob)
    for rpr in root.findall('.//a:rPr',NS)+root.findall('.//a:defRPr',NS):
        if rpr.find('a:latin',NS) is None:
            e=ET.SubElement(rpr,'{'+NS['a']+'}latin');e.set('typeface',EN)
        if rpr.find('a:ea',NS) is None:
            e=ET.SubElement(rpr,'{'+NS['a']+'}ea');e.set('typeface',CN)
    if 'theme' in name:
        for e in root.findall('.//a:fontScheme//a:latin',NS):e.set('typeface',EN)
        for e in root.findall('.//a:fontScheme//a:ea',NS):e.set('typeface',CN)
    files[name]=ET.tostring(root,xml_declaration=True,encoding='UTF-8',standalone=True)
with zipfile.ZipFile(OUT,'w',zipfile.ZIP_DEFLATED) as z:
    for name,blob in files.items():z.writestr(name,blob)

verification={'status':'PASS','slides':4,'ownRead_actual_bytes':[7,7],
    'actual_offsets':[0,1,6],'IC_index':0,'delta':6,'prop_offset':0,
    'frozen_sources_verified':True,'C_excerpt_tokens_verified':True,
    'editable_native_text_and_shapes':True,'raster_pictures_in_deck':0,
    'code_font':MONO,'Chinese_font':CN,'English_font':EN,
    'PPTX_sha256':hashlib.sha256(OUT.read_bytes()).hexdigest()}
(H/'content_check.json').write_text(json.dumps(verification,ensure_ascii=False,indent=2)+'\n')
print(OUT)
