"""Replace the old partial page 4 with the complete read-IC macro and helpers."""
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
BASE=H.parent/'ownRead与new_源码展开版_补充负缓存.pptx'
OUT=H/'ownRead与new_源码展开版_读IC完整.pptx'
BLUE=INK=GRAY='000000';LINE='D5D5D5';PALE='F5F5F5';WHITE='FFFFFF'
CN='KaiTi';EN='Times New Roman';MONO='DejaVu Sans Mono'
P=Presentation(BASE)
assert len(P.slides)==14
ORIGINAL=list(P.slides)
P.core_properties.title='ownRead、new 与负缓存：完整读取 IC 代码'
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


def two_columns(s,rows,top=1.65,size=13.4,spacing=15.4,needles=(),split=None,min_height=5.8):
    split=split or (len(rows)+1)//2
    for x,part in [(.8,rows[:split]),(8.18,rows[split:])]:
        height=max(len(part)*spacing/72+.25,min_height)
        rect(s,x,top-.15,7.02,height)
        show_source(s,part,x+.13,top,6.78,height-.1,size,spacing,needles)


def notes_frame(s):
    ns=s.notes_slide
    if ns.notes_text_frame is None:
        template=next(old.notes_slide.notes_placeholder for old in ORIGINAL
                      if old.notes_slide.notes_placeholder is not None)
        body=deepcopy(template._element)
        body.find('{http://schemas.openxmlformats.org/presentationml/2006/main}nvSpPr/{http://schemas.openxmlformats.org/presentationml/2006/main}cNvPr').set('id','2')
        ns.shapes._spTree.append(body)
    assert ns.notes_text_frame is not None
    return ns.notes_text_frame


manifest=json.loads((PACKAGE/'manifest.json').read_text())
for group in ['original','modified']:
    for name,digest in manifest[group].items():
        assert hashlib.sha256((PACKAGE/group/name).read_bytes()).hexdigest()==digest
op=(PACKAGE/'modified/read_ic_opcodes.inc').read_text()
runtime=(PACKAGE/'modified/read_ic_runtime.inc').read_text()
types=(PACKAGE/'modified/read_ic_types.h').read_text()
config=(PACKAGE/'modified/read_ic_config.h').read_text()
quickjs=(PACKAGE/'modified/quickjs.c').read_text()
raw_lines=op.splitlines()
assert len(raw_lines)==90
raw_front='\n'.join(raw_lines[:38])
raw_back='\n'.join(raw_lines[38:])


def display_macro(raw):
    # Keep every original statement, branch, label, diagnostic macro and comment.
    lines=[]
    for line in raw.splitlines():
        line=line.rstrip().removesuffix('\\').rstrip()
        if line.startswith('    '):line=line[4:]
        if line:lines.append(line)
    normalized='\n'.join(lines)
    expected=re.sub(r'\\\n','\n',raw+'\n')
    assert ctokens(normalized)==ctokens(expected)
    return wrapped(normalized,61)


front=display_macro(raw_front);back=display_macro(raw_back)
assert ctokens('\n'.join(front+back))==ctokens(re.sub(r'\\\n','\n',op))
probe,line_probe=extract(runtime,'static force_inline uint32_t rdi_probe(','\nstatic force_inline void rdi_update')
update,line_update=extract(runtime,'static force_inline void rdi_update(','\nstatic void v6_proto_update')
proto,line_proto=extract(runtime,'static void v6_proto_update(','\nstatic void rdi_free')
record,line_record=extract(types,'typedef struct ReadICSite {','\n#elif RDI_CAPACITY == 4')
return_handler,line_return=extract(quickjs,'        CASE(OP_return):','        CASE(OP_return_undef):')
assert config.strip()=='#define RDI_CAPACITY 1'
left_helpers=wrapped(config+'\n'+record+'\n'+probe,60)
right_helpers=wrapped(update+'\n'+proto+'\n'+textwrap.dedent(return_handler),60)
source_parts={'GET_READ_IC_full':op,'rdi_probe_full':probe,'rdi_update_full':update,
              'v6_proto_update_full':proto,'ReadICSite_single':record,'return_handler':return_handler}
for name,value in source_parts.items():(H/(name+'.c.txt')).write_text(value+'\n')


# New page 4: complete opening of GET_READ_IC, through fallback atom selection.
s=slide('GET_READ_IC（1/2）：先定位记录，再探测缓存；命中就直接读槽。',4)
text(s,'入口：GET_READ_IC(get_field_rdi, 0)，其中 0 表示 keep=0。',.85,1.16,14.1,.4,20)
needles=('delta = get_u32','ReadICSite *site','JSValue obj','pc += 4','rdi_probe(',
         'offset != UINT32_MAX','p->prop[offset]','goto name ## _done','atom = site->atom')
split=next(i for i,l in enumerate(front) if 'offset = UINT32_MAX' in l)
two_columns(s,front,top=1.88,size=13.0,spacing=15.3,needles=needles,split=split)
text(s,'进入本 handler 时 pc 在偏移 2；读取 delta 后定位同一条 IC，再把 pc 推进到偏移 6。',.85,8.08,14.1,.4,18.5)
notes_frame(s).text=(
 '前一页的融合入口失配时先把 obj 压栈，这里才开始执行普通的读 IC 指令，它自己仍会探测一次缓存。'
 '此时 get_field_rdi 的 opcode 已经读过，pc 在二，读出 delta 六后从二加六找到记录，再把 pc 加四推进到六。'
 '本例 keep 为零，表示最后把对象替换成属性值，代码里的直接原型分支仍完整放出，但 keep 为零时不会进入它。'
 '布局匹配就按槽号读值并跳到共同收尾，失配才继续下一页的正常查找。')


# New page 5: every remaining line, including inherited/special-object paths.
s=slide('GET_READ_IC（2/2）：失配后正常查找、更新缓存，最后统一处理栈。',5)
text(s,'接上一页的 atom = site->atom；以下连续展示宏的后半及两个 opcode 入口。',.85,1.10,14.1,.4,18.5)
needles=('find_own_property','JS_PROP_TMASK','v6_proto_update','rdi_update(',
         'JS_GetPropertyInternal','name ## _done','if (keep)','JS_FreeValue(ctx, sp[-1])','GET_READ_IC(get_field_rdi, 0)')
split=(len(back)+1)//2
two_columns(s,back,top=1.70,size=12.5,spacing=14.2,needles=needles,split=split,min_height=6.2)
text(s,'keep=0：[obj] → [属性值]；keep=1：[obj] → [obj, 属性值]，保留对象供方法调用作为 this。',.85,8.08,14.1,.4,18)
notes_frame(s).text=(
 '失配后从记录里取回 atom，像 A 一样查自有属性和原型链，特殊属性及对象则进入通用读取路径。'
 '普通自有数据字段满足条件时更新 shape 和槽号，直接原型缓存所需的条件及其他回退也都保留在代码里。'
 '命中和失配最后都到 name 拼出来的 done 标签，本例 keep 为零，释放临时 obj 引用并用属性值替换栈顶。'
 '这两页连起来就是冻结版 read_ic_opcodes.inc 的完整内容，没有删分支或用省略号代替代码，仅把宏行尾续行符去掉并换行排版。')


# New page 6: complete record/probe/update definitions and actual return handler.
s=slide('记录保存布局和槽号；探测、更新与 return 的辅助代码也完整保留。',6)
text(s,'当前单槽结构与完整 rdi_probe',.85,1.16,7.0,.4,20,bold=True)
text(s,'完整更新函数与 return 入口',8.25,1.16,7.0,.4,20,bold=True)
for x,part in [(.8,left_helpers),(8.18,right_helpers)]:
    rect(s,x,1.77,7.02,6.51)
    show_source(s,part,x+.14,1.95,6.74,6.12,size=12.4,spacing=14.2,
                needles=('prop_offset','s->shape == shape','return UINT32_MAX','s->shape = shape',
                         's->holder_shape = holder','ret_val = *--sp'))
notes_frame(s).text=(
 '左边先给出当前启用的单槽配置和记录结构，再完整展示 rdi_probe，shape 相同才返回槽号，失败用 UINT32_MAX，零本身是合法槽号。'
 'rdi_probe 的四槽条件编译分支也原样保留，但冻结版容量是一个槽，所以那个分支不启用。'
 '右边完整保留自有字段和直接原型记录的更新函数，包括 shape 引用的持有和释放，末尾仍由 return 取出栈顶的属性值。'
 '诊断计数宏在未插桩 Release 中为空操作，这里没有增加运行次数或性能结论。')


# Replace the old partial fourth page in the logical slide order.
ids=P.slides._sldIdLst
old_id=list(ids)[3];old_rid=old_id.rId
new_ids=list(ids)[-3:]
ids.remove(old_id);P.part.drop_rel(old_rid)
for item in new_ids:ids.remove(item)
for offset,item in enumerate(new_ids):ids.insert(3+offset,item)
assert len(P.slides)==16

# Existing pages 5..14 shift by two; preserve every other piece of user content.
for old_index,old_slide in enumerate(ORIGINAL,1):
    if old_index<5:continue
    for sh in old_slide.shapes:
        if sh.has_text_frame and sh.text==str(old_index) and sh.top/914400>=8.35:
            ts=sh._element.findall('.//{http://schemas.openxmlformats.org/drawingml/2006/main}t')
            assert ts;ts[0].text=str(old_index+2)
            for t in ts[1:]:t.text=''

expected_old={old_index:(old_slide.part.blob,old_slide.notes_slide.part.blob)
              for old_index,old_slide in enumerate(ORIGINAL,1) if old_index!=4}
P.part.rename_slide_parts(item.rId for item in ids)
P.save(OUT)


def rel_target(z,rels_file,suffix):
    import posixpath
    root=ET.fromstring(z.read(rels_file))
    for child in root:
        if child.get('Type','').endswith(suffix):
            target=child.get('Target')
            if target.startswith('/'):return target.lstrip('/')
            return posixpath.normpath(posixpath.join('ppt/slides',target))
    raise AssertionError(rels_file)


# Preserve all retained slide and note XML; only their displayed page numbers change.
with zipfile.ZipFile(BASE) as basezip,zipfile.ZipFile(OUT) as newzip:
    files={n:newzip.read(n) for n in newzip.namelist()};preserved={}
    canonical=lambda value:ET.tostring(ET.fromstring(value),method='c14n')
    for old_index,(slide_xml,notes_xml) in expected_old.items():
        new_index=old_index if old_index<=3 else old_index+2
        part=f'ppt/slides/slide{new_index}.xml'
        assert canonical(files[part])==canonical(slide_xml),part
        if old_index<=3:slide_xml=basezip.read(f'ppt/slides/slide{old_index}.xml')
        files[part]=slide_xml
        target=rel_target(newzip,f'ppt/slides/_rels/slide{new_index}.xml.rels','/notesSlide')
        assert canonical(files[target])==canonical(notes_xml),target
        old_note=rel_target(basezip,f'ppt/slides/_rels/slide{old_index}.xml.rels','/notesSlide')
        files[target]=basezip.read(old_note)
        preserved[str(old_index)]=dict(new_page=new_index,slide_sha256=hashlib.sha256(slide_xml).hexdigest(),
                                      notes_sha256=hashlib.sha256(files[target]).hexdigest())
with zipfile.ZipFile(OUT,'w',zipfile.ZIP_DEFLATED) as z:
    for name,value in files.items():z.writestr(name,value)

(H/'讲稿备注.md').write_text('\n\n'.join(f'第 {i} 页\n\n{s.notes_slide.notes_text_frame.text}' for i,s in enumerate(P.slides,1))+'\n')
proof=dict(status='PASS',total_slides=16,replaced_input_page=4,new_read_IC_pages=[4,5,6],
           complete_GET_READ_IC_file=True,all_C_tokens_match_frozen_source=True,
           complete_helpers=['rdi_probe','rdi_update','v6_proto_update'],current_ReadICSite=True,
           retained_user_pages=preserved,source_footer_added=False,all_text_black=True,
           frozen_source_hashes_verified=True,source_sha256=hashlib.sha256((PACKAGE/'modified/read_ic_opcodes.inc').read_bytes()).hexdigest(),
           PPTX_sha256=hashlib.sha256(OUT.read_bytes()).hexdigest(),
           code_line_counts=dict(front=len(front),back=len(back),left_helpers=len(left_helpers),right_helpers=len(right_helpers)))
(H/'content_check.json').write_text(json.dumps(proof,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(proof['code_line_counts'],ensure_ascii=False));print(OUT)


