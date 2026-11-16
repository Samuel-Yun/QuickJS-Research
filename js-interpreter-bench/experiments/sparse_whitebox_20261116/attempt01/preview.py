"""Layout preview from the same editable slide model; no plot screenshots in PPTX."""
import sys,json,math
from pathlib import Path
sys.path.insert(0,'/tmp/quickjs-whitebox-slide-deps')
from PIL import Image,ImageDraw,ImageFont
from build import H
OUT=H/'slides';models=json.loads((OUT/'layout.json').read_text());SCALE=120
KAI='/usr/share/fonts/truetype/arphic/ukai.ttc';ROM='/usr/share/fonts/truetype/liberation2/LiberationSerif-Regular.ttf'
if not Path(ROM).exists():ROM='/usr/share/fonts/truetype/liberation/LiberationSerif-Regular.ttf'
fonts={}
def font(n,ch):
 key=(n,ord(ch)>255)
 if key not in fonts:fonts[key]=ImageFont.truetype(KAI if key[1] else ROM,round(n*SCALE/72))
 return fonts[key]
def width(text,n):return sum(font(n,c).getlength(c) for c in text)
def txt(d,t,x,y,w,h,n=16,color='1C2430',align='left'):
 lines=[]
 for line in str(t).split('\n'):
  cur=''
  for ch in line:
   if width(cur+ch,n)>w and cur:lines.append(cur);cur=''
   cur+=ch
  lines.append(cur)
 for i,l in enumerate(lines):
  xx=x+(w-width(l,n))/2 if align=='center' else (x+w-width(l,n) if align=='right' else x)
  yy=y+i*n*SCALE/72*1.15
  for c in l:d.text((xx,yy),c,font=font(n,c),fill='#'+color);xx+=font(n,c).getlength(c)
 return len(lines)*n*SCALE/72*1.15
for idx,items in enumerate(models):
 im=Image.new('RGB',(1600,900),'white');d=ImageDraw.Draw(im)
 for m in items:
  x,y,w,h=[m[k]*SCALE for k in ['x','y','w','h']]
  if m['type']=='box':d.rectangle((x,y,x+w,y+h),fill='#'+m['fill'])
  elif m['type']=='text':txt(d,m['text'],x,y,w,h,m['size'],m['color'],m['align'])
  elif m['type']=='table':
   for i,row in enumerate(m['rows']):
    xx=x;rh=m['row_h']*SCALE
    for j,(cell,ww) in enumerate(zip(row,m['widths'])):
     ww*=SCALE;d.rectangle((xx,y+i*rh,xx+ww,y+(i+1)*rh),fill='#F2F6FA' if i==0 else 'white',outline='#D9E1E8');txt(d,cell,xx+7,y+i*rh+7,ww-14,rh-10,m['size'],align='left' if j==0 else 'center');xx+=ww
  elif m['type']=='chart':
   left=x+60;right=x+w-25;top=y+15;bottom=y+h-65;maxy=m['max_y']
   for tick in range(0,int(maxy)+1,max(1,math.ceil(maxy/5))):
    yy=bottom-(bottom-top)*tick/maxy;d.line((left,yy,right,yy),fill='#D9E1E8');txt(d,str(tick),x,yy-9,45,20,12,align='right')
   d.line((left,top,left,bottom,right,bottom),fill='#B0B6BE',width=1)
   for j,(label,values) in enumerate(m['values'].items()):
    color='#9098A3' if label=='A' else '#2468A0'
    if m['kind']=='read':
     pts=[(left+(right-left)*r/100,bottom-(bottom-top)*v/maxy) for r,v in zip(m['rates'],values)];d.line(pts,fill=color,width=3)
     for xx,yy in pts:d.ellipse((xx-4,yy-4,xx+4,yy+4),fill=color)
    else:
     step=(right-left)/3;bw=step*.27
     for i,v in enumerate(values):
      xx=left+step*(i+.5)+(j-.5)*bw;yy=bottom-(bottom-top)*v/maxy;d.rectangle((xx-bw/2,yy,xx+bw/2,bottom),fill=color)
   ticks=[0,25,50,75,100] if m['kind']=='read' else m['rates']
   for i,t in enumerate(ticks):
    xx=left+(right-left)*t/100 if m['kind']=='read' else left+(right-left)*(i+.5)/3;txt(d,f'{t:.0f}%',xx-35,bottom+8,70,25,12,align='center')
   txt(d,'原版 A',left+80,bottom+40,130,30,14,'9098A3');txt(d,'按需构造缓存',left+260,bottom+40,210,30,14,'2468A0')
 im.save(OUT/f'preview_{idx+1}.png')
contact=Image.new('RGB',(1600,1350),'#D9E1E8')
for i in range(6):contact.paste(Image.open(OUT/f'preview_{i+1}.png').resize((800,450)),((i%2)*800,(i//2)*450))
contact.save(OUT/'contact.png');print(OUT/'contact.png')
