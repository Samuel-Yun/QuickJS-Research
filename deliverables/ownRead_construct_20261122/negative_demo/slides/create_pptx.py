"""Append negative-cache explanation to the user's edited, footer-free deck."""
import hashlib,json,re,sys,zipfile,textwrap
from copy import deepcopy
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
ROOT=next(p for p in H.parents if (p/'js-interpreter-bench/on_demand_ctor_cache/manifest.json').exists())
PACKAGE=ROOT/'js-interpreter-bench/on_demand_ctor_cache'
BASE=H/'input/ownRead与new_源码展开版.pptx'
OUT=H/'ownRead与new_源码展开版_补充负缓存.pptx'
BLUE=INK=GRAY='000000';LINE='D5D5D5';PALE='F5F5F5';WHITE='FFFFFF'
CN='KaiTi';EN='Times New Roman';MONO='DejaVu Sans Mono'
P=Presentation(BASE)
assert len(P.slides)==12
P.core_properties.title='ownRead、new 与负缓存：源码展开版'
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


input_identity=json.loads((H/'input_manifest.json').read_text())
assert hashlib.sha256(BASE.read_bytes()).hexdigest()==input_identity['sha256']
frozen=json.loads((PACKAGE/'manifest.json').read_text())
for group in ['original','modified']:
    for name,digest in frozen[group].items():
        assert hashlib.sha256((PACKAGE/group/name).read_bytes()).hexdigest()==digest
NEG=H.parent
run_identity=json.loads((NEG/'bytecode/run.json').read_text())
demo=NEG/'bytecode_demo_with_negative.js'
assert run_identity['script_sha256']==hashlib.sha256(demo.read_bytes()).hexdigest()
assert json.loads((NEG/'check.json').read_text())['status']=='PASS'
snap={}
for engine in ['A','method']:
    assert (NEG/'bytecode'/(engine+'.stdout')).read_text()=='sum=700, negativeSum=400\n'
    rows=[json.loads(l) for l in (NEG/'bytecode'/(engine+'.snapshots.jsonl')).read_text().splitlines()]
    snap[engine]={r['function']:r for r in rows if r['function'] in ['construct','Unsupported','constructUnsupported']}
assert snap['A']['Unsupported']['opcodes']==snap['method']['Unsupported']['opcodes']
state=snap['method']['constructUnsupported']['constructor_sites'][0]
assert not state['positive_plan'] and state['negative_target']
assert state['pc']==5 and state['argc']==1
positive=snap['method']['construct']['constructor_sites'][0]
assert positive['positive_plan'] and not positive['negative_target']
extra=demo.read_text()[demo.read_text().index('function Unsupported'):demo.read_text().index("print('sum='")].rstrip()
js_lines=extra.splitlines()


def disasm(fun):
    import importlib.util
    spec=importlib.util.spec_from_file_location('negative_viewer',PACKAGE/'tools/bytecode.py')
    v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v)
    result=[]
    for op in snap['method'][fun]['opcodes']:
        operand=v.operand(op)
        if 'binding' in op:operand+=' ('+op['binding']+')'
        result.append(f'{op["pc"]:06d}  {op["name"]:<14}  {operand}')
    return result


def notes_frame(s):
    ns=s.notes_slide
    if ns.notes_text_frame is None:
        # The uploaded file has an empty notes master. Reuse its existing
        # notes-body shape for appended pages without changing any old page.
        template=next(old.notes_slide.notes_placeholder for old in list(P.slides)[:12]
                      if old.notes_slide.notes_placeholder is not None)
        body=deepcopy(template._element)
        nv=body.find('{http://schemas.openxmlformats.org/presentationml/2006/main}nvSpPr/{http://schemas.openxmlformats.org/presentationml/2006/main}cNvPr')
        nv.set('id','2');nv.set('name','Notes Text')
        ns.shapes._spTree.append(body)
    assert ns.notes_text_frame is not None
    return ns.notes_text_frame


runtime=(PACKAGE/'modified/sparse_runtime.inc').read_text()
same,line_same=extract(runtime,'static int sparse_same(','\nstatic int four_ctor_try')
eligible,line_eligible=extract(runtime,'static int four_ctor_slow_eligible(','\nstatic void four_ctor_learn')
remember,line_remember=extract(runtime,'static void sparse_remember(', '\n}',runtime.index('static void sparse_remember'))
# Include the terminating brace in the complete final function.
remember+='\n}'
for name,value in [('sparse_same',same),('four_ctor_slow_eligible',eligible),('sparse_remember',remember)]:
    (H/(name+'.c.txt')).write_text(value+'\n')


# 13 — Additional JS only; full original example remains on the user's page 1.
s=slide('再加一个不符合模板的构造器，让同一 new 位点反复遇到它。',13)
text(s,'追加的 JS：独立的 new 位点',.85,1.18,7.0,.4,20,bold=True)
text(s,'Unsupported：两版相同，12 字节',8.25,1.18,7.0,.4,20,bold=True)
rect(s,.8,1.79,7.02,4.70)
code(s,js_lines,1.02,1.98,6.58,4.30,size=15.1,spacing=20.0,
     high=(1,4,9))
rect(s,8.18,1.79,7.02,2.65)
code(s,disasm('Unsupported'),8.38,1.98,6.62,2.27,size=15.7,spacing=18.5,
     high=tuple(i for i,o in enumerate(snap['method']['Unsupported']['opcodes']) if o['name'] in ['push_1','add']))
text(s,'SPARSE · constructUnsupported · 9 字节',8.25,4.69,7.0,.4,19,bold=True)
rect(s,8.18,5.25,7.02,1.72,WHITE,LINE)
code(s,disasm('constructUnsupported'),8.38,5.43,6.62,1.35,size=15.0,spacing=18.0,
     high=(3,))
text(s,'校验结果：negativeSum = 400',.85,6.88,7.0,.4,21,bold=True)
text(s,'get_arg0 后多了 push_1 和 add，\n不符合“实参直接写入字段”的模板。',.85,7.52,7.0,.9,19.5,spacing=27)
text(s,'record[0] pc=5, argc=1',8.38,7.28,6.62,.4,18,face=MONO)
text(s,'正计划=False，负目标=True',8.38,7.93,6.62,.4,21,bold=True)
notes_frame(s).text=(
 '继续保留前面的 Pair 正计划例子，另外用 constructUnsupported 中独立的 new 位点反复调用 Unsupported。'
 'Unsupported 的参数后面还有加一，实际字节码里多了 push_1 和 add，不能匹配当前的直接赋值模板。'
 '两版都算出 negativeSum=400，冻结版快照显示这个位点没有正计划，但已经记住负目标。'
 '这里的快照只证明记录已建立，我们没有统计逐次命中数，也没有据此声称提速。')


# 14 — Complete negative-cache functions, with no source footnotes.
s=slide('负缓存记住“不支持的目标”，省重复判型，普通构造照常执行。',14)
text(s,'身份判断与学习资格入口',.85,1.18,7.0,.4,20,bold=True)
text(s,'sparse_remember：记住确定不支持的目标',8.25,1.18,7.0,.4,20,bold=True)
left=wrapped(separate_statements(same+'\n\n'+eligible),57)
right=wrapped(separate_statements(remember),57)
for x,part in [(.8,left),(8.18,right)]:
    rect(s,x,1.79,7.02,4.73)
    show_source(s,part,x+.15,1.99,6.72,4.33,size=13.4,spacing=16.0,
       needles=('s->negative','sparse_same(s,c)','return plan_slow_eligible','COLD_BYTECODE_FUNCTION','plan_recipe','JS_DupValue'))
text(s,'首次遇到',.85,6.98,2.0,.4,21,bold=True)
text(s,'模板不匹配 → 普通构造成功 → 保存这个目标的身份。',3.00,6.98,12.1,.45,20)
text(s,'再次同目标',.85,7.81,2.0,.4,21,bold=True)
text(s,'身份匹配 → 跳过模板解析 → 仍然普通构造、计算 x + 1。',3.00,7.81,12.1,.45,20)
notes_frame(s).text=(
 '左边先用对象身份比较当前构造目标和保存的负目标，匹配就从资格入口返回零，普通构造仍会执行。'
 '首次不支持时，右边在普通构造成功后确认目标确实不符合模板，再持有它的引用并释放旧目标。'
 '后续右边的 sparse_remember 仍会进入，不过开头再次比较身份后就立即返回，冻结版还有这笔检查成本。'
 '它只记稳定的模板或类别不支持，冷函数和参数数量、原型、GC 等临时条件失败都不能直接当成不支持缓存。')


assert len(P.slides)==14
P.save(OUT)
with zipfile.ZipFile(BASE) as old,zipfile.ZipFile(OUT) as new:
    files={name:new.read(name) for name in new.namelist()};preserved={}
    for i in range(1,13):
        for part in [f'ppt/slides/slide{i}.xml',f'ppt/notesSlides/notesSlide{i}.xml']:
            canonical=lambda value:ET.tostring(ET.fromstring(value),method='c14n')
            assert canonical(old.read(part))==canonical(new.read(part)),part
            files[part]=old.read(part)
            preserved[part]=hashlib.sha256(files[part]).hexdigest()
with zipfile.ZipFile(OUT,'w',zipfile.ZIP_DEFLATED) as z:
    for name,value in files.items():z.writestr(name,value)
(H/'讲稿备注.md').write_text('\n\n'.join(f'第 {i} 页\n\n{s.notes_slide.notes_text_frame.text}' for i,s in enumerate(P.slides,1))+'\n')
source_proof=dict(file='modified/sparse_runtime.inc',sha256=hashlib.sha256((PACKAGE/'modified/sparse_runtime.inc').read_bytes()).hexdigest(),
    lines=dict(sparse_same=line_same,four_ctor_slow_eligible=line_eligible,sparse_remember=line_remember))
(H/'source_evidence.json').write_text(json.dumps(source_proof,ensure_ascii=False,indent=2)+'\n')
report=dict(status='PASS',slides=14,new_slides=2,user_uploaded_base_sha256=input_identity['sha256'],
    original_12_slides_and_notes_exactly_preserved=preserved,source_footer_added=False,
    new_slides_page_numbers_match_input=True,all_appended_C_functions_complete=True,
    C_tokens_verified=True,actual_negative_snapshot=True,negative_target_present=True,
    positive_plan_for_Unsupported=False,no_hit_count_claim=True,
    PPTX_sha256=hashlib.sha256(OUT.read_bytes()).hexdigest())
(H/'content_check.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(OUT)


