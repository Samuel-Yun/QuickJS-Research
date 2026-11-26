"""Append the new/construct explanation to the four approved ownRead slides."""
import hashlib,json,re,sys,zipfile,textwrap
from pathlib import Path
try:
    import pptx
except ImportError:
    sys.path.insert(0,'/tmp/quickjs-whitebox-slide-deps')
from pptx import Presentation
from pptx.dml.color import RGBColor
from pptx.enum.shapes import MSO_SHAPE
from pptx.enum.text import MSO_AUTO_SIZE
from pptx.oxml.xmlchemy import OxmlElement
from pptx.util import Inches,Pt
from lxml import etree as ET
H=Path(__file__).resolve().parent
ROOT=H.parents[1]
PACKAGE=ROOT/'js-interpreter-bench/on_demand_ctor_cache'
BASE=H.parent/'ownRead_A_vs_SPARSE_20261122_v2/ownRead_源码展开版.pptx'
OUT=H/'ownRead与new_源码展开版.pptx'
BLUE=INK=GRAY='000000';LINE='D5D5D5';PALE='F5F5F5';WHITE='FFFFFF'
CN='KaiTi';EN='Times New Roman';MONO='DejaVu Sans Mono'
P=Presentation(BASE)
assert len(P.slides)==4
P.core_properties.title='ownRead 与 new：A 和冻结 SPARSE 的执行过程'
P.core_properties.author=''

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


CLEX=re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*[\s\S]*?\*/|//[^\n]*|\s+|>>=|<<=|\.\.\.|->|\+\+|--|<=|>=|==|!=|&&|\|\||<<|>>|\+=|-=|\*=|/=|%=|&=|\^=|\|=|##|[A-Za-z_]\w*|\d+|\S')


def ctokens(s):
    return [m.group() for m in CLEX.finditer(s) if not m.group().isspace() and not m.group().startswith(('/*','//'))]


def separate_statements(raw):
    """Separate packed statements; retain for-header semicolons and all tokens."""
    out=[];depth=0
    for line in raw.splitlines():
        if not line.strip():continue
        prefix=line[:len(line)-len(line.lstrip())];last=0
        for match in CLEX.finditer(line):
            value=match.group()
            if value=='(':depth+=1
            elif value==')':depth-=1
            elif value==';' and depth==0:
                rest=line[match.end():]
                if rest.strip() and not rest.lstrip().startswith(('}','/*','//')):
                    out.append(line[last:match.end()] if last==0 else prefix+line[last:match.end()].lstrip())
                    last=match.end()
        if line[last:].strip():out.append(line[last:] if last==0 else prefix+line[last:].lstrip())
    result='\n'.join(out)
    assert ctokens(result)==ctokens(raw)
    return result


def extract(text,start,end,after=0):
    i=text.index(start,after);j=text.index(end,i)
    return text[i:j].rstrip(),text[:i].count('\n')+1


def wrapped(raw,width=64):
    """Whitespace-only wrapping, never break a C string or char literal."""
    rows=[]
    for line0 in raw.splitlines():
        if not line0.strip():continue
        line=line0.rstrip();base=len(line)-len(line.lstrip())
        # Historic aligned parameter declarations needlessly repeat huge indents.
        if base>20 and not line.lstrip().startswith(('*','and ')):
            line=' '*8+line.lstrip();base=8
        while len(line)>width:
            if line.lstrip().startswith('#'):break
            points=[];preferred=[]
            for token in CLEX.finditer(line):
                value=token.group()
                if value.isspace():preferred.append(token.start())
                if value.startswith('/*'):
                    preferred.extend(token.start()+i for i,c in enumerate(value) if c.isspace())
                # A lexical boundary also works for dense historic C lines.
                # The lexer keeps strings and multi-character operators whole.
                points.extend([token.start(),token.end()])
            choices=[p for p in preferred if base+12<p<=width]
            if not choices:choices=[p for p in points if base+4<p<=width]
            if not choices:break
            cut=max(choices);rows.append(line[:cut].rstrip())
            line=' '*(min(base+4,16))+line[cut:].lstrip()
        rows.append(line)
    assert ctokens('\n'.join(rows))==ctokens(raw)
    return rows


def show_source(s,rows,x,y,w,h,size=13.5,spacing=15.6,needles=()):
    high=[i for i,l in enumerate(rows) if any(n in l for n in needles)]
    return code(s,rows,x,y,w,h,size=size,spacing=spacing,high=high)


def two_columns(s,rows,top=1.65,size=13.4,spacing=15.4,needles=(),split=None):
    split=split or (len(rows)+1)//2
    for x,part in [(.8,rows[:split]),(8.18,rows[split:])]:
        height=max(len(part)*spacing/72+.25,6.42)
        rect(s,x,top-.15,7.02,height)
        show_source(s,part,x+.13,top,6.78,height-.1,size,spacing,needles)


manifest=json.loads((PACKAGE/'manifest.json').read_text())
for group in ['original','modified']:
    for n,digest in manifest[group].items():
        assert hashlib.sha256((PACKAGE/group/n).read_bytes()).hexdigest()==digest,(group,n)
assert (H/'bytecode_demo.js').read_bytes()==(PACKAGE/'tests/bytecode_demo.js').read_bytes()
a=(PACKAGE/'original/quickjs.c').read_text();m=(PACKAGE/'modified/quickjs.c').read_text()
fr=(PACKAGE/'modified/four_runtime.inc').read_text()
sr=(PACKAGE/'modified/sparse_runtime.inc').read_text()
sources={}
def source(name,text,start,end,file,after=0):
    raw,line0=extract(text,start,end,after)
    sources[name]=dict(file=file,first_line=line0,raw=raw)
    (H/(name+'.c.txt')).write_text(raw+'\n')
    return raw


acall=source('A_call_constructor',a,'        CASE(OP_call_constructor):','        CASE(OP_call_method):','original/quickjs.c')
acreate=source('A_create_from_ctor',a,'static JSValue js_create_from_ctor(JSContext *ctx,','\n/* argv[] is modified','original/quickjs.c')
ainternal=source('A_CallConstructorInternal',a,'static JSValue JS_CallConstructorInternal(JSContext *ctx,',
                 '\nJSValue JS_CallConstructor2','original/quickjs.c',a.index('static JSValue js_create_from_ctor'))
handler=source('SPARSE_four_ctor',m,'        CASE(OP_four_ctor):','        CASE(OP_call_constructor):','modified/quickjs.c')
recipe=source('plan_recipe',fr,'static int plan_recipe(','\nstatic JSObject*plan_proto','modified/four_runtime.inc')
proto=source('plan_proto',fr,'static JSObject*plan_proto(','\n/* Unhashed prototypes','modified/four_runtime.inc')
chain=source('plan_chain',fr,'static int plan_chain(','\nstatic int plan_base','modified/four_runtime.inc')
base=source('plan_base',fr,'static int plan_base(','\nstatic int plan_slow_eligible','modified/four_runtime.inc')
eligible=source('plan_slow_eligible',fr,'static int plan_slow_eligible(','\nstatic void plan_learn','modified/four_runtime.inc')
learn=source('plan_learn',fr,'static void plan_learn(','\nstatic int plan_try','modified/four_runtime.inc')
attempt=source('plan_try',fr,'static int plan_try(','\n#include "sparse_runtime.inc"','modified/four_runtime.inc')
records=source('Four_records',fr,'typedef struct FourRecipe','\nstatic inline __exception int js_poll_interrupts','modified/four_runtime.inc')
try_wrapper=source('four_ctor_try',sr,'static int four_ctor_try(','\nstatic int four_ctor_slow_eligible','modified/sparse_runtime.inc')
data={}
for engine in ['A','method']:
    assert (H/'bytecode'/(engine+'.stdout')).read_text()=='sum=700\n'
    ss=[json.loads(v) for v in (H/'bytecode'/(engine+'.snapshots.jsonl')).read_text().splitlines()]
    data[engine]={v['function']:v for v in ss if v['function'] in ['ownRead','Pair','construct']}
assert data['A']['Pair']['opcodes']==data['method']['Pair']['opcodes']
for engine in data:
    assert data[engine]['construct']['byte_code_len']==10
    assert [o['pc'] for o in data[engine]['construct']['opcodes']]==[0,3,4,5,6,9]
    assert data[engine]['Pair']['byte_code_len']==17
cs=data['method']['construct']['constructor_sites'][0]
assert cs['pc']==6 and cs['argc']==2 and cs['positive_plan'] and not cs['negative_target']


def disasm(engine,fun):
    # Reuse the repository viewer's actual operand formatter.
    import importlib.util
    spec=importlib.util.spec_from_file_location('ctor_viewer',PACKAGE/'tools/bytecode.py')
    v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v)
    rows=[]
    for op in data[engine][fun]['opcodes']:
        operand=v.operand(op)
        if 'binding' in op:operand+=' ('+op['binding']+')'
        rows.append(f'{op["pc"]:06d}  {op["name"]:<17} {operand}')
    return rows


# 5: Actual entry difference and the unchanged constructor body.
s=slide('接着看 new：construct 的入口变了，Pair 的函数体没有变。',5)
text(s,'construct(3, 4)  →  new Pair(3, 4)',.85,1.16,14.1,.45,23,face=MONO)
for x,label in [(.85,'原版 A · construct · 10 字节'),(8.24,'冻结 SPARSE · construct · 10 字节')]:
    text(s,label,x,1.89,7.0,.35,20,bold=True)
for engine,x in [('A',.8),('method',8.18)]:
    rect(s,x,2.42,7.02,2.13,WHITE,LINE)
    code(s,disasm(engine,'construct'),x+.13,2.62,6.76,1.8,size=16.4,spacing=21,high=(4,))
text(s,'Pair：两版相同，17 字节',.85,4.92,7.0,.35,20,bold=True)
rect(s,.8,5.44,7.02,2.82)
code(s,disasm('A','Pair'),.95,5.59,6.70,2.55,size=15.7,spacing=19.2,high=(4,7))
text(s,'new 之前的栈：',8.38,5.08,6.6,.35,21,bold=True)
code(s,['[Pair, Pair, 3, 4]'],8.38,5.65,6.6,.45,size=22,spacing=28)
text(s,'前两个分别是 callee 和 new.target；\n后两个是实参。完成后栈上只留新对象。',8.38,6.30,6.6,.9,19.5,spacing=27)
text(s,'record[0] 是构造记录编号；argc=2 才是实参数量。\n这条指令两版均为 3 字节，读完操作数后 pc 到 9。',8.38,7.42,6.6,.9,18,spacing=25)
source_footer(s,'实测 bytecode_demo.js；只筛选 ownRead / construct / Pair。正计划=True 仅说明已学成，不代表测过命中次数。')
s.notes_slide.notes_text_frame.text=(
 '沿用前四页的同一段例子，现在看 construct 里的 new，实际传入的参数是三和四。'
 'get_var 取出 Pair，dup 再复制一份作为 new.target，所以调用前是两个 Pair 加两个参数。'
 '两版 construct 都是十字节，只有偏移六的调用入口不同，record 零是记录编号，参数数量仍是二。'
 'Pair 自己的十七字节完全相同，命中时直接由 C 路径完成构造，失配仍可执行这份函数体。')


# 6: Complete upstream opcode and object/prototype creation helper.
s=slide('A 的 new：先沿普通构造入口走，准备 this 对象。',6)
text(s,'OP_call_constructor · 完整 handler',.85,1.19,7.0,.4,20,bold=True)
text(s,'js_create_from_ctor · 完整函数',8.25,1.19,7.0,.4,20,bold=True)
left=wrapped(textwrap.dedent(acall),60);right=wrapped(acreate,60)
for x,rows in [(.8,left),(8.18,right)]:
    rect(s,x,1.79,7.02,5.78)
    show_source(s,rows,x+.14,1.98,6.74,5.38,size=13.0,spacing=15.0,
                needles=('JS_CallConstructorInternal','JS_FreeValue','JS_NewObjectProtoClass','JS_GetProperty'))
text(s,'读取 new.target.prototype → 创建 this → 调用 Pair；完成后释放调用操作数。',.85,7.97,14.1,.4,21)
source_footer(s,'original/quickjs.c：OP_call_constructor、js_create_from_ctor；两段均完整保留，仅排版换行。')
s.notes_slide.notes_text_frame.text=(
 '左边是原版 A 的完整 new handler，它从字节码读出 argc，再把 callee、new.target 和参数交给普通构造入口。'
 '右边的 helper 用 new.target 的 prototype 创建 this；原型不是对象时，还会走原本的 realm 和默认原型处理。'
 '普通调用成功后，左边释放两个目标引用和实参，在栈上留下新对象。'
 '这一页先看对象从哪里来，下一页看 Pair 函数体怎样被调用。')


# 7: Complete ordinary constructor dispatcher, not just a pseudocode summary.
s=slide('A 创建 this 后，进入 JS_CallInternal，逐条执行 Pair。',7)
rows=wrapped(ainternal,62)
two_columns(s,rows,top=1.66,size=13.1,spacing=15.6,
            needles=('js_create_from_ctor','ret = JS_CallInternal','return obj','return ret'),
            split=next(i for i,l in enumerate(rows) if 'b = p->u.func.function_bytecode' in l))
text(s,'本例 Pair 返回 undefined，普通构造入口因此返回先前创建的 this 对象。',.85,8.05,14.1,.38,20)
source_footer(s,'original/quickjs.c:20809 起；JS_CallConstructorInternal 完整函数，左右两列连续阅读。')
s.notes_slide.notes_text_frame.text=(
 '这是原版 A 的完整普通构造分发函数，类型、中断、派生构造器和异常分支都保留了。'
 'Pair 走 legacy constructor 分支，先创建 this，再用 JS_CallInternal 执行 Pair 的字节码。'
 'Pair 内部依次写 x 和 y，最后返回 undefined，所以这个函数会把刚创建的 this 返回给 construct。'
 'A 本来也会复用 shape；后面的收益主要来自省掉解释构造器和逐次添加字段的工作。')


# 8: Complete frozen opcode, including learning, exception and cleanup branches.
s=slide('SPARSE 的 new：先试计划；失配仍走普通构造，成功后再学习。',8)
rows=wrapped(separate_statements(textwrap.dedent(handler)),60)
two_columns(s,rows,top=1.56,size=13.2,spacing=15.0,
            needles=('FourSite*s=','four_ctor_try','JS_CallConstructorInternal','four_ctor_learn','sparse_remember','sp-=call_argc'),
            split=next(i for i,l in enumerate(rows) if 'if(eligible' in l))
text(s,'fast=1：使用快路结果；fast=0：执行普通构造。两条路径最后共用参数释放与结果压栈。',.85,8.08,14.1,.35,18.5)
source_footer(s,'modified/quickjs.c:18329 起；OP_four_ctor 完整 handler，含诊断条件编译、异常处理和栈清理。')
s.notes_slide.notes_text_frame.text=(
 '冻结版先用两字节记录编号找到这个 new 位点，再从记录里拿到原来的参数个数。'
 'four_ctor_try 成功就使用新对象；失败仍执行原来的普通构造，不能跳过构造器应该产生的行为。'
 '普通构造成功且适合学习时，才用真实结果建立计划，否则可能记住明确不支持的目标来减少下次判型。'
 '异常处理和最后的值释放都保留，缓存计划也不会让每次 new 返回同一个对象。')


# 9: Complete recipe recognizer and original record layouts.
s=slide('学到的计划是：x 来自参数 0，y 来自参数 1，结果使用这个布局。',9)
text(s,'plan_recipe：按最终字节码识别模板',.85,1.18,10.0,.4,20,bold=True)
text(s,'实际记录结构',11.15,1.18,4.0,.4,20,bold=True)
rect(s,.8,1.78,10.02,6.46)
rr=wrapped(recipe,83)
show_source(s,rr,1.0,1.96,9.62,6.09,size=13.25,spacing=15.1,
            needles=('OP_push_this','OP_put_field','r->atom','r->arg','OP_return_undef'))
structrows=wrapped(records,43)
rect(s,11.03,1.78,4.17,5.34)
show_source(s,structrows,11.15,1.96,3.93,4.99,size=11.6,spacing=13.5,
            needles=('atom[8]','arg[8]','FullPlan *plan','initial,*final','FourRecipe recipe'))
text(s,'本例 recipe.n = 2\nx ← args[0] = 3\ny ← args[1] = 4',11.16,7.30,3.93,.95,18,spacing=25)
source_footer(s,'modified/four_runtime.inc：plan_recipe 与 FourRecipe / FourSite / FullPlan，完整源码；展示映射是本例的解释。')
s.notes_slide.notes_text_frame.text=(
 '这里检查实际字节码，不按函数名或属性名特判，Pair 恰好符合直接把实参写进不同字段的模板。'
 '识别结果记住字段的 atom 和参数下标，本例是 x 对参数零、y 对参数一。'
 '右边是冻结版的实际结构：new 位点的小记录指向可选的完整计划，完整计划保留目标、shape 和映射。'
 '空位点是三十二字节，真正学成后另分配九十六字节计划；这是当前 x86-64 Release 的大小。')


# 10: Both pre-construction eligibility and post-construction publication.
s=slide('第一次先正常构造，再核对真实结果，合格才发布计划。',10)
combined=eligible+'\n\n'+separate_statements(learn)
rows=wrapped(combined,63)
two_columns(s,rows,top=1.55,size=12.3,spacing=13.8,
            needles=('find_hashed_shape_proto','o->shape->prop_count','d[i].flags','js_mallocz_rt','slot->plan=s','s->callee=','s->recipe=r','JS_FreeValue(ctx,old)'))
text(s,'冻结版学习前后都要求找到 initial 空 shape；例子中的 empty 保留了这项前置条件。',.85,8.08,14.1,.4,18.5)
source_footer(s,'modified/four_runtime.inc：plan_slow_eligible、plan_learn 完整函数。普通构造成功后学习，不重放构造器。')
s.notes_slide.notes_text_frame.text=(
 '学习前先做资格检查，随后仍然正常执行一次 Pair，再用实际返回对象确认原型、字段顺序、描述符和最终 shape。'
 '确认无误才按需分配完整计划，保存构造目标、initial、final 和参数映射；代码也保留旧引用的释放。'
 '冻结版前后都要求能找到同原型的空 shape，所以示例先创建 empty 并一直保留它。'
 '学习不需要再跑一遍 Pair，分配缓存失败也不会把已经成功的普通构造结果改成失败。')


# 11: Complete guards, to show the work that remains on positive hits.
s=slide('有计划也要检查：目标、原型、字段写入条件，以及栈和 GC 状态。',11)
left=wrapped(base,60);right=wrapped(proto+'\n\n'+chain,60)
for x,part in [(.8,left),(8.18,right)]:
    rect(s,x,1.38,7.02,6.56)
    show_source(s,part,x+.14,1.55,6.74,6.19,size=12.7,spacing=14.2,
                needles=('JS_VALUE_GET_OBJ(callee)!=','is_constructor','argc<b->arg_count','js_check_stack_overflow',
                         'malloc_gc_threshold','JS_ATOM_prototype','find_own_property','JS_PROP_WRITABLE'))
text(s,'这些检查每次命中仍会执行；原型上出现 setter、只读属性或特殊对象时，会退回普通构造。',.85,8.12,14.1,.35,18)
source_footer(s,'modified/four_runtime.inc：plan_base、plan_proto、plan_chain 三个完整函数。没有加入原型票据或全局失效版本。')
s.notes_slide.notes_text_frame.text=(
 '有计划并不等于随时能直接写槽，目标函数、new.target、参数数量和原型仍要符合要求。'
 '右边沿当前原型链检查相关字段，最近一层描述符决定能不能直接初始化，setter 或只读属性都会让它回退。'
 '左边还保留栈空间、中断和 GC 预算条件，可能触发可观察行为时继续走普通路径。'
 '所以命中有固定成本，不能把它描述成完全没有检查的裸写内存。')


# 12: Complete positive-hit execution, with what is actually saved.
s=slide('命中：直接创建最终布局的新对象，再把两个实参填进槽里。',12)
text(s,'plan_try · 完整函数',.85,1.18,10.0,.4,20,bold=True)
rect(s,.8,1.77,10.04,6.52)
ar=wrapped(separate_statements(attempt),84)
show_source(s,ar,1.0,1.96,9.64,6.12,size=13.15,spacing=14.8,
            needles=('JS_VALUE_GET_OBJ(s->callee)==','plan_proto(f)==','js_poll_interrupts','JS_NewObjectFromShape',
                     'JS_IsException(*out)','o->prop[i].u.value=JS_DupValue','return 1','return 0'))
for y,label,desc in [
 (1.96,'创建新的对象','用 final shape 分配对象；\n每次 new 都得到新的身份。'),
 (3.69,'按映射填槽','prop[0] ← args[0] = 3\nprop[1] ← args[1] = 4'),
 (5.42,'省掉的步骤','Pair 的解释帧、逐条分派，\n以及逐次新增字段的工作。'),
 (7.15,'仍然要做','守卫、对象和属性数组分配，\n以及值的引用管理。')]:
    text(s,label,11.16,y,4.0,.35,20,bold=True)
    text(s,desc,11.16,y+.52,4.0,.92,18.5,spacing=25)
source_footer(s,'modified/four_runtime.inc：plan_try 完整函数；分配失败直接返回异常，不重新普通构造。字节码快照未提供逐次命中数。')
s.notes_slide.notes_text_frame.text=(
 '检查通过后，先按 final shape 创建一个新对象，再根据 recipe 把参数三和四复制到 x、y 对应的属性槽。'
 '这里没有进入 Pair 的解释器帧，也没有逐条执行 Pair 的 put_field；Pair 字节码仍保留供回退使用。'
 '对象和属性数组仍要分配，参数引用也仍要管理，不能把命中解释成省掉所有分配。'
 '分配失败会直接带着原异常退出，不再普通构造一次；这份快照只证明计划已学成，没有提供具体命中次数或耗时。')


assert len(P.slides)==12
P.save(OUT)
with zipfile.ZipFile(BASE) as z1,zipfile.ZipFile(OUT) as z2:
    preserved={};files={n:z2.read(n) for n in z2.namelist()}
    for i in range(1,5):
        for part in [f'ppt/slides/slide{i}.xml',f'ppt/notesSlides/notesSlide{i}.xml']:
            # python-pptx normalizes empty XML tags; confirm equivalence, then
            # retain the user's approved XML bytes exactly.
            canonical=lambda b:ET.tostring(ET.fromstring(b),method='c14n')
            assert canonical(z1.read(part))==canonical(z2.read(part)),part
            files[part]=z1.read(part)
            preserved[part]=hashlib.sha256(files[part]).hexdigest()
with zipfile.ZipFile(OUT,'w',zipfile.ZIP_DEFLATED) as z:
    for name,value in files.items():z.writestr(name,value)
(H/'讲稿备注.md').write_text('\n\n'.join(f'第 {i} 页\n\n{s.notes_slide.notes_text_frame.text}' for i,s in enumerate(P.slides,1))+'\n')
source_info={n:{k:v for k,v in d.items() if k!='raw'} for n,d in sources.items()}
for n,d in source_info.items():d['source_sha256']=hashlib.sha256((PACKAGE/d['file']).read_bytes()).hexdigest()
(H/'source_evidence.json').write_text(json.dumps(source_info,ensure_ascii=False,indent=2)+'\n')
report=dict(status='PASS',slides=12,new_slides=8,first_four_slides_and_notes_preserved=preserved,
    frozen_source_hashes_verified=True,all_appended_C_functions_complete=True,C_tokens_verified=True,
    actual_construct_bytes=10,actual_Pair_bytes=17,actual_new_offset=6,constructor_index=0,argc=2,
    positive_plan_present=True,negative_target_present=False,no_measured_hit_count_claim=True,
    PPTX_sha256=hashlib.sha256(OUT.read_bytes()).hexdigest(),
    wrapped_lines={k:len(wrapped(v['raw'],63)) for k,v in sources.items()})
(H/'content_check.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['slides','new_slides','wrapped_lines']},ensure_ascii=False,indent=2))
print(OUT)


