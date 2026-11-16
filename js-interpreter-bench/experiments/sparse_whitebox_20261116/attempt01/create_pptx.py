"""Six editable slides. All plots use measured data; charts embed editable workbooks."""
import sys,json,math,zipfile
from pathlib import Path
sys.path.insert(0,'/tmp/quickjs-whitebox-slide-deps')
from lxml import etree as ET
from pptx import Presentation
from pptx.util import Inches,Pt
from pptx.dml.color import RGBColor
from pptx.chart.data import XyChartData,CategoryChartData
from pptx.enum.chart import XL_CHART_TYPE,XL_LEGEND_POSITION,XL_MARKER_STYLE,XL_TICK_MARK
from pptx.enum.text import PP_ALIGN,MSO_ANCHOR
from pptx.enum.shapes import MSO_SHAPE
from build import H
D=json.loads((H/'analysis/data.json').read_text());S=D['statistics'];C=D['counts'];M=D['metrics'];OUT=H/'slides';OUT.mkdir(exist_ok=True)
P=Presentation();P.slide_width=Inches(13.333333);P.slide_height=Inches(7.5)
P.core_properties.title='按需构造缓存：命中率、字节码和耗时';P.core_properties.author='';P.core_properties.subject='06aada4 固定版本白盒实验'
BLUE='2468A0';INK='1C2430';GRAY='9098A3';LIGHT='F2F6FA';LINE='D9E1E8';WHITE='FFFFFF';F='Times New Roman';models=[];current=[]
def box(s,x,y,w,h,fill=LIGHT,line=None):
 q=s.shapes.add_shape(MSO_SHAPE.RECTANGLE,Inches(x),Inches(y),Inches(w),Inches(h));q.fill.solid();q.fill.fore_color.rgb=RGBColor.from_string(fill);q.line.fill.background() if line is None else None
 if line:q.line.color.rgb=RGBColor.from_string(line)
 current.append(dict(type='box',x=x,y=y,w=w,h=h,fill=fill,line=line));return q

def text(s,t,x,y,w,h,size=18,color=INK,bold=False,align='left'):
 q=s.shapes.add_textbox(Inches(x),Inches(y),Inches(w),Inches(h));tf=q.text_frame;tf.clear();tf.margin_left=0;tf.margin_right=0;tf.margin_top=0;tf.margin_bottom=0
 for i,line in enumerate(t.split('\n')):
  p=tf.paragraphs[0] if i==0 else tf.add_paragraph();p.text=line;p.font.name=F;p.font.size=Pt(size);p.font.bold=bold;p.font.color.rgb=RGBColor.from_string(color);p.space_after=Pt(3);p.alignment={'left':PP_ALIGN.LEFT,'center':PP_ALIGN.CENTER,'right':PP_ALIGN.RIGHT}[align]
 current.append(dict(type='text',text=t,x=x,y=y,w=w,h=h,size=size,color=color,bold=bold,align=align));return q

def slide(title,subtitle=''):
 global current
 current=[];models.append(current);s=P.slides.add_slide(P.slide_layouts[6]);s.background.fill.solid();s.background.fill.fore_color.rgb=RGBColor(255,255,255)
 box(s,.45,.43,.07,.38,BLUE);text(s,title,.66,.37,12.0,.52,27,bold=True)
 if subtitle:text(s,subtitle,.66,.99,12,.42,14,GRAY)
 text(s,str(len(P.slides)),12.1,7.12,.55,.18,10,GRAY,align='right');return s

def table(s,rows,x,y,widths,row_h=.4,size=14):
 w=sum(widths);q=s.shapes.add_table(len(rows),len(widths),Inches(x),Inches(y),Inches(w),Inches(row_h*len(rows)));tb=q.table
 for i,v in enumerate(widths):tb.columns[i].width=Inches(v)
 for i,row in enumerate(rows):
  tb.rows[i].height=Inches(row_h)
  for j,value in enumerate(row):
   c=tb.cell(i,j);c.text=str(value);c.margin_left=Inches(.08);c.margin_right=Inches(.06);c.margin_top=Inches(.05);c.margin_bottom=Inches(.03);c.vertical_anchor=MSO_ANCHOR.MIDDLE;c.fill.solid();c.fill.fore_color.rgb=RGBColor.from_string(LIGHT if i==0 else WHITE)
   for p in c.text_frame.paragraphs:
    p.font.name=F;p.font.size=Pt(size);p.font.bold=i==0;p.font.color.rgb=RGBColor.from_string(INK);p.alignment=PP_ALIGN.LEFT if j==0 else PP_ALIGN.CENTER
 current.append(dict(type='table',rows=rows,x=x,y=y,w=w,h=row_h*len(rows),widths=widths,row_h=row_h,size=size));return q

def stat(kind,label,rate):return next(r for r in S if r['kind']==kind and r['label']==label and r['target']==rate)
def count(kind,rate):return next(r for r in C if r['kind']==kind and r['target']==rate)
def sec(kind,label,rate):return stat(kind,label,rate)['median_ms']/1000
def ratefmt(n):return '≈100%' if n>99.99999 else (f'{n:.4f}%' if abs(n-round(n))>0.00001 else f'{n:.0f}%')
def chart(s,kind,x,y,w,h):
 rates=[0,25,50,75,90,99,100] if kind=='read' else [0,50,100]
 actual=[count(kind,r)['actual_hit_percent'] for r in rates];vals={label:[sec(kind,label,r) for r in rates] for label in ['A','SPARSE']}
 if kind=='read':
  data=XyChartData()
  for label,name in [('A','原版 A'),('SPARSE','按需构造缓存')]:
   ds=data.add_series(name)
   for r,v in zip(actual,vals[label]):ds.add_data_point(r,v)
  typ=XL_CHART_TYPE.XY_SCATTER_LINES
 else:
  data=CategoryChartData();data.categories=[ratefmt(n) for n in actual]
  data.add_series('原版 A',vals['A']);data.add_series('按需构造缓存',vals['SPARSE']);typ=XL_CHART_TYPE.COLUMN_CLUSTERED
 ch=s.shapes.add_chart(typ,Inches(x),Inches(y),Inches(w),Inches(h),data).chart;ch.has_legend=True;ch.legend.position=XL_LEGEND_POSITION.BOTTOM;ch.legend.include_in_layout=False;ch.legend.font.name=F;ch.legend.font.size=Pt(14)
 ch.font.name=F;ch.font.size=Pt(13);ch.value_axis.minimum_scale=0;ch.value_axis.maximum_scale=math.ceil(max(sum(vals.values(),[]))*1.15);ch.value_axis.tick_labels.number_format='0.0';ch.value_axis.major_tick_mark=XL_TICK_MARK.NONE;ch.category_axis.major_tick_mark=XL_TICK_MARK.NONE;ch.category_axis.tick_labels.font.size=Pt(12)
 ch.value_axis.has_title=True;ch.value_axis.axis_title.text_frame.text='循环耗时（秒）';ch.category_axis.has_title=True;ch.category_axis.axis_title.text_frame.text='实测命中率（%）' if kind=='read' else '正计划实测命中率'
 if kind=='read':ch.category_axis.minimum_scale=0;ch.category_axis.maximum_scale=100;ch.category_axis.major_unit=25;ch.category_axis.tick_labels.number_format='0"%"'
 for i,series in enumerate(ch.series):
  color=GRAY if i==0 else BLUE;series.format.fill.solid();series.format.fill.fore_color.rgb=RGBColor.from_string(color);series.format.line.color.rgb=RGBColor.from_string(color)
  if kind=='read':series.format.line.width=Pt(2);series.marker.style=XL_MARKER_STYLE.CIRCLE;series.marker.size=6;series.marker.format.fill.solid();series.marker.format.fill.fore_color.rgb=RGBColor.from_string(color);series.marker.format.line.color.rgb=RGBColor.from_string(color)
 current.append(dict(type='chart',kind=kind,x=x,y=y,w=w,h=h,rates=actual,values=vals,max_y=ch.value_axis.maximum_scale));return ch

def snapshot(stem):return json.loads((H/'snapshots'/(stem+'.json')).read_text())
def code_rows(snap,names=None,around=None):
 ops=snap['opcodes']
 if around is not None:ops=ops[max(0,around-4):around+2]
 elif names is not None:ops=[i for i in ops if i['name'] in names]
 rows=[['offset','opcode','操作数']]
 for i in ops:
  operand=i.get('atom','')
  if 'site_index'in i:operand=f"delta={i['site_delta']} → IC{i['site_index']}"
  elif 'constructor_index'in i:operand=f"记录{i['constructor_index']}；参数{i['argc']}"
  elif i['format'] in ['u8','u16','i32','npop']:operand=str(int.from_bytes(bytes.fromhex(i['raw'])[1:],'little'))
  rows.append([str(i['pc']).zfill(4),i['name'],operand])
 return rows

# 1 — What changes, what stays identical.
s=slide('只改切换频率，循环里的工作不变','按需构造缓存｜固定版本 06aada4｜与原版 QuickJS A 对照')
text(s,'属性读取：同一个 obj.x',.7,1.55,6,.35,22,bold=True)
box(s,.68,2.03,6.05,1.24);text(s,'obj = sequence[i & mask];\nsum += obj.x;',.91,2.23,5.6,.85,20)
text(s,'两种布局：{x:3,a:0} 和 {x:3,b:0}\nx 的位置相同，读到的值一直是 3。',.75,3.49,6,1,18)
text(s,'构造：同一个 new 位点',.7,4.65,6,.35,22,bold=True)
box(s,.68,5.13,6.05,1.33);text(s,'C = sequence[i & mask];\nobj = new C(3, 0);\nsum += obj.x;',.91,5.28,5.65,1.1,18)
text(s,'重复越多，越容易命中；切换越勤，越容易失配。',7.15,1.61,5.4,.95,21,bold=True)
for j,(label,seq) in enumerate([('低命中','① ② ① ② ① ②'),('中命中','① ① ② ② ① ①'),('高命中','① ① ① ① ① ①')]):
 y=2.92+j*.76;text(s,label,7.2,y,1.25,.35,18);text(s,seq,8.54,y,4,.45,23,BLUE)
text(s,'读取时，①②是两种布局。\n构造时，①②是身份不同、赋值相同的函数。',7.15,5.38,5.3,.85,17)
text(s,'序列提前生成，不计时。读取 2.01 亿次；构造 6,711 万次。每档、每版各 5 个新进程。',.7,6.91,11.4,.27,12,GRAY)

# 2 — Read timing curve with actual measured hits, and median/range at key points.
a=M['read'];s=slide(f"属性读取：高命中降到低命中，耗时增加 {a['method_low_vs_high_pct']:.1f}%",'A 跑同一份序列；横轴是按需构造缓存的实际命中率，不是 A 的命中率')
chart(s,'read',.58,1.52,8.05,4.77)
for j,r in enumerate([0,50,100]):
 y=1.68+j*1.48;text(s,ratefmt(count('read',r)['actual_hit_percent'])+' 实测命中',9.0,y,3.6,.35,20,BLUE,bold=True)
 for k,(label,name) in enumerate([('A','A'),('SPARSE','按需')]):
  t=stat('read',label,r);text(s,f"{name}：{t['median_ms']/1000:.3f} 秒\n范围 {t['min_ms']/1000:.3f}–{t['max_ms']/1000:.3f}",9.02,y+.43+k*.47,3.7,.52,14)
rows=[['目标档位']+[str(r)+'%' for r in [0,25,50,75,90,99,100]],['实测']+[ratefmt(count('read',r)['actual_hit_percent']) for r in [0,25,50,75,90,99,100]]]
table(s,rows,.82,6.34,[1.14]+[1.03]*7,.29,11)
text(s,f"A 在低/高档的耗时变化为 {a['A_low_vs_high_pct']:+.2f}%；≈100% 档仅首次读取未命中。图为 5 次中位数。",.75,7.02,11.1,.22,11,GRAY)

# 3 — Positive plans dominate; negative only removes template checks.
lo=sec('positive','SPARSE',0);hi=sec('positive','SPARSE',100)
s=slide(f'正计划：命中从≈100%降到0%，{hi:.2f}秒 → {lo:.2f}秒','两个构造器共用原型、赋相同字段；先保留一个空布局对象，让两者都符合现有计划条件')
chart(s,'positive',.58,1.57,7.3,4.72)
text(s,'负缓存：普通构造还在',8.2,1.78,4.4,.4,21,bold=True)
rr=[['负命中率','判型入口','按需耗时']]
for r in [0,50,100]:
 c=count('negative',r);n=c['template_entries'];nstr=f'{n/1e8:.2f}亿' if n>=1e8 else (f'{n/1e4:.1f}万' if n>=10000 else str(n))
 rr.append([ratefmt(c['actual_hit_percent']),nstr,f"{sec('negative','SPARSE',r):.3f}秒"])
table(s,rr,8.17,2.43,[1.25,1.45,1.42],.47,14)
text(s,'这三档都做了 6,711 万次普通构造。',8.2,4.57,4.3,.65,17)
text(s,f"A各档中位数：{min(sec('negative','A',r) for r in [0,50,100]):.3f}–{max(sec('negative','A',r) for r in [0,50,100]):.3f}秒\n负命中从高降到低，按需耗时增加\n{M['negative']['method_low_vs_high_pct']:.1f}%。",8.2,5.37,4.35,1.1,16)
text(s,f"低命中比 A 慢 {M['positive']['method_low_vs_A_pct']:.1f}%；高命中比 A 快 {-M['positive']['method_high_vs_A_pct']:.1f}%。",.92,6.4,7.1,.32,16,BLUE)
text(s,'正命中省掉构造函数执行和逐条加字段；负命中只省重复判型。时间均为 5 次 Release 中位数。',.75,6.92,11.4,.3,12,GRAY)

# 4 — Runtime bytecode, both simple helper and actual loop.
a=snapshot('short.read.A.ownRead_live');b=snapshot('short.read.SPARSE.ownRead_live')
s=slide('属性读取：命中后，按记录好的槽号取值','ownRead(o) { return o.x; }｜读取执行后的字节码缓冲区')
text(s,'原版 A',.78,1.58,5.8,.35,22,bold=True);text(s,'按需构造缓存',7.02,1.58,5.8,.35,22,BLUE,bold=True)
table(s,code_rows(a),.72,2.12,[.72,2.65,2.72],.46,14)
table(s,code_rows(b),6.94,2.12,[.72,2.75,2.22],.46,14)
text(s,'get_field：按属性名 x 查找，再读取值。\n循环里每次都会做这一步。',.8,4.26,5.7,.8,18)
text(s,'IC0记住：x在这类布局的第0个属性槽。\n布局相同就直接取值；融合入口还越过\n后面的 get_field_rdi。',7.02,4.26,5.65,.85,18)
ra=snapshot('short.read.A.readLoop_live');rb=snapshot('read.100.SPARSE.readLoop_live');ia=next(i for i in ra['opcodes'] if i.get('atom')=='x');ib=next(i for i in rb['opcodes'] if i.get('atom')=='x')
box(s,.72,5.41,12.1,1.17);text(s,'正式循环里的 obj.x',.92,5.57,3,.3,17,bold=True)
pa=ra['opcodes'][ra['opcodes'].index(ia)-1];pb=rb['opcodes'][rb['opcodes'].index(ib)-1]
text(s,f"A：{pa['pc']:04d} {pa['name']} → {ia['pc']:04d} get_field x\n按需：{pb['pc']:04d} {pb['name']} → {ib['pc']:04d} get_field_rdi [IC0]",4.0,5.57,8.5,.8,15)
text(s,'命中少做按名查找；融合还少一次分派和接收者的临时引用。失配时照旧查找，再更新记录。',.78,6.91,11.6,.28,12,GRAY)

# 5 — Constructor opcode entry and C path.
a=snapshot('short.positive.A.ctorLoop_live');b=snapshot('positive.100.SPARSE.ctorLoop_live');ai=next(i for i,x in enumerate(a['opcodes']) if x['name']=='call_constructor');bi=next(i for i,x in enumerate(b['opcodes']) if x['name']=='four_ctor')
s=slide('构造正命中：直接初始化属性槽，不再解释构造函数','同一个 new C(3, 0) 位点｜缓存编号和参数个数不是一回事')
text(s,'原版 A',.78,1.52,5.7,.35,22,bold=True);text(s,'按需构造缓存',7.02,1.52,5.7,.35,22,BLUE,bold=True)
table(s,code_rows(a,around=ai),.72,2.03,[.72,2.6,2.77],.35,13)
table(s,code_rows(b,around=bi),6.94,2.03,[.72,2.65,2.32],.35,13)
paths=[('A','普通分配 → 调用构造函数 → 逐条加字段',INK),('正命中','检查计划 → 按最终布局分配 → C代码写槽',BLUE),('负命中','记得模板不合适 → 仍走普通构造',INK)]
for j,(name,detail,color) in enumerate(paths):
 y=4.72+j*.57;text(s,name,.92,y,1.5,.36,18,color,bold=True);text(s,detail,2.58,y,9.4,.4,19,color)
text(s,'正命中仍分配对象和属性存储。负命中只跳过判型，不跳过构造函数，也不省对象分配。',.78,6.9,11.65,.3,12,GRAY)

# 6 — Historical full suites, never rerun this round.
s=slide('已有全集：Octane -7.86%，SunSpider -4.45%','相对历史原版 QuickJS A｜跨批次单轮筛选｜本轮未重跑全集')
sets=[('octane','Octane 17 项',.73,['EarleyBoyer.Boyer','DeltaBlue.DeltaBlue','CodeLoad.CodeLoadClosure','RegExp.RegExp']),('sunspider','SunSpider 26 项',6.98,['access-binary-trees','bitops-nsieve-bits','bitops-bits-in-byte','date-format-xparb'])]
for suite,title,x,cases in sets:
 text(s,title,x,1.65,5.6,.4,24,BLUE,bold=True);rows=[['子项','A / ms','按需 / ms','变化']]
 lookup={r['case']:r for r in D['historical'][suite]}
 for case in cases:
  r=lookup[case];name=case.replace('EarleyBoyer.','').replace('DeltaBlue.','').replace('CodeLoad.CodeLoad','CodeLoad.').replace('RegExp.RegExp','RegExp');rows.append([name,f"{float(r['A_ms']):.3f}",f"{float(r['candidate_ms']):.3f}",f"{float(r['vs_A_pct']):+.2f}%"])
 table(s,rows,x,2.34,[2.52,1.05,1.05,1.05],.59,13)
text(s,'Boyer、DeltaBlue 和 Tree 有较大改善；Closure、RegExp 等项也有退化。',.8,5.83,11.8,.6,21)
text(s,'上面的小程序用来解释快路；这里的旧全集结果用来说明真实负载的总体表现。',.8,6.6,11.7,.4,16,GRAY)

# Speaker notes link data and source evidence without filling slide surfaces.
for i,s in enumerate(P.slides):s.notes_slide.notes_text_frame.text=f'数据来源：analysis/data.json；原始5次时间 raw/measure/runs.jsonl；计数 raw/counts/runs.jsonl；真实缓冲区 snapshots/。固定源包06aada4/03_sparse_ctor。第{i+1}页图表和表格均为PowerPoint原生可编辑对象。'
path=OUT/'按需构造缓存_命中率白盒实验.pptx';P.save(path)
# Explicit EA font selection, including native charts and themes.
NS={'a':'http://schemas.openxmlformats.org/drawingml/2006/main'}
with zipfile.ZipFile(path) as z:files={n:z.read(n) for n in z.namelist()}
for name,blob in list(files.items()):
 if not name.startswith('ppt/') or not name.endswith('.xml'):continue
 root=ET.fromstring(blob)
 for tag in ['rPr','defRPr','endParaRPr','majorFont','minorFont']:
  for node in root.findall('.//a:'+tag,NS):
   for child,face in [('latin','Times New Roman'),('ea','楷体'),('cs','Times New Roman')]:
    n=node.find('a:'+child,NS)
    if n is None:n=ET.SubElement(node,'{'+NS['a']+'}'+child)
    n.set('typeface',face)
 for n in root.findall('.//a:font',NS):
  if n.get('script') in ['Hans','Hant']:n.set('typeface','楷体')
 files[name]=ET.tostring(root,encoding='utf-8',xml_declaration=True)
with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
 for n,b in files.items():z.writestr(n,b)
(OUT/'layout.json').write_text(json.dumps(models,ensure_ascii=False,indent=2));print(path)
