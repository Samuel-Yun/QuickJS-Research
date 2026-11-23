"""Read the saved editable PPTX XML, render each page locally, and check overflow."""
from pathlib import Path
import html
import json
import re
import subprocess
import tempfile
import xml.etree.ElementTree as ET
import zipfile

H=Path(__file__).resolve().parent
PPTX=H/'ownRead与new_源码展开版.pptx'
NS={'a':'http://schemas.openxmlformats.org/drawingml/2006/main',
    'p':'http://schemas.openxmlformats.org/presentationml/2006/main'}
EMU=914400


def px(v):return float(v)/EMU*100
def fill(e,default='transparent'):
    c=e.find('a:solidFill/a:srgbClr',NS) if e is not None else None
    return '#'+c.get('val') if c is not None else default


def paragraph(p):
    pp=p.find('a:pPr',NS)
    spacing=pp.find('a:lnSpc/a:spcPts',NS) if pp is not None else None
    runs=[];maxsize=0
    for r in p.findall('a:r',NS):
        t=r.find('a:t',NS);rp=r.find('a:rPr',NS)
        if t is None:continue
        size=float(rp.get('sz','2000'))/100 if rp is not None else 20
        maxsize=max(maxsize,size)
        latin=rp.find('a:latin',NS) if rp is not None else None
        family=latin.get('typeface') if latin is not None else 'Times New Roman'
        families="'DejaVu Sans Mono','AR PL UKai CN',monospace" if family=='DejaVu Sans Mono' else "'Times New Roman','Liberation Serif','AR PL UKai CN',serif"
        bold='700' if rp is not None and rp.get('b')=='1' else '400'
        style=f'font-size:{size*100/72}px;font-family:{families};font-weight:{bold};color:{fill(rp,"#17212B")}'
        runs.append('<span style="'+html.escape(style,quote=True)+'">'+html.escape(t.text or '')+'</span>')
    line=float(spacing.get('val'))/100 if spacing is not None else maxsize*1.28
    return f'<p style="line-height:{line*100/72}px;height:{line*100/72}px"><span class="natural">'+''.join(runs)+'</span></p>'


def main():
    reports=[]
    with zipfile.ZipFile(PPTX) as z:
        presentation=ET.fromstring(z.read('ppt/presentation.xml'))
        sz=presentation.find('p:sldSz',NS);w,h=px(sz.get('cx')),px(sz.get('cy'))
        slidefiles=sorted((n for n in z.namelist() if re.fullmatch(r'ppt/slides/slide\d+.xml',n)),
                          key=lambda s:int(re.search(r'slide(\d+)',s).group(1)))
        assert len(slidefiles)==12
        assert not any(n.startswith('ppt/media/') for n in z.namelist())
        for index,name in enumerate(slidefiles,1):
            root=ET.fromstring(z.read(name));parts=[];outside=[]
            for i,shape in enumerate(root.findall('p:cSld/p:spTree/p:sp',NS)):
                sp=shape.find('p:spPr',NS);xf=sp.find('a:xfrm',NS)
                if xf is None:continue
                off,ext=xf.find('a:off',NS),xf.find('a:ext',NS)
                x,y,sw,sh=[px(v) for v in [off.get('x'),off.get('y'),ext.get('cx'),ext.get('cy')]]
                if min(x,y)<-.1 or x+sw>w+.1 or y+sh>h+.1:outside.append(i)
                background=fill(sp)
                ln=sp.find('a:ln',NS);border=fill(ln)
                stroke=(float(ln.get('w','0'))/EMU*100) if ln is not None else 0
                body=shape.find('p:txBody',NS);paras=''
                if body is not None:paras=''.join(paragraph(p) for p in body.findall('a:p',NS))
                title=shape.find('p:nvSpPr/p:cNvPr',NS).get('name','')
                style=f'left:{x}px;top:{y}px;width:{sw}px;height:{sh}px;background:{background};border:{stroke}px solid {border}'
                parts.append(f'<div class="shape" data-id="{i}" data-name="{html.escape(title,quote=True)}" style="{style}">{paras}</div>')
            # The only connector in this deck is horizontal.
            for shape in root.findall('p:cSld/p:spTree/p:cxnSp',NS):
                sp=shape.find('p:spPr',NS);xf=sp.find('a:xfrm',NS)
                off,ext=xf.find('a:off',NS),xf.find('a:ext',NS)
                parts.append(f'<div style="position:absolute;left:{px(off.get("x"))}px;top:{px(off.get("y"))}px;width:{px(ext.get("cx"))}px;border-top:1px solid #D9E2E9"></div>')
            document=f'''<!doctype html><meta charset="utf-8"><style>
html,body{{margin:0;width:{w}px;height:{h}px;background:white;overflow:hidden}}
.shape{{position:absolute;box-sizing:border-box;overflow:visible}}
p{{margin:0;padding:0;white-space:pre;font-size:0;display:flex;align-items:flex-start}}
.natural{{display:inline-block;white-space:pre}}
</style>'''+''.join(parts)+'''
<script>
document.fonts.ready.then(()=>{
 const failures=[];
 for(const el of document.querySelectorAll('.shape')){
  const parent=el.getBoundingClientRect();
  for(const child of el.querySelectorAll('.natural')){
   const r=child.getBoundingClientRect();
   if(r.width>parent.width+1||r.bottom>parent.bottom+1)
    failures.push({id:el.dataset.id,name:el.dataset.name,text:child.innerText,width:r.width,available:parent.width,bottom:r.bottom,parentBottom:parent.bottom});
  }
 }
 const report={status:failures.length?'FAIL':'PASS',overflow:failures,fontCheck:{mono:document.fonts.check('20px "DejaVu Sans Mono"'),kai:document.fonts.check('20px "AR PL UKai CN"')}};
 const node=document.createElement('script');node.id='layout-check';node.type='application/json';node.textContent=JSON.stringify(report);document.body.append(node);
});
</script>'''
            page=H/f'preview_{index}.html';page.write_text(document)
            png=H/f'preview_{index}.png'
            with tempfile.TemporaryDirectory(prefix='ownread-chrome-') as profile:
                cmd=['google-chrome','--headless','--no-sandbox','--disable-gpu','--disable-dev-shm-usage',
                     '--disable-background-networking','--no-first-run','--hide-scrollbars',
                     '--user-data-dir='+profile,'--window-size=1600,900','--force-device-scale-factor=1',
                     '--virtual-time-budget=1800','--screenshot='+str(png),'--dump-dom',page.as_uri()]
                r=subprocess.run(cmd,capture_output=True,text=True,timeout=45)
                (H/f'preview_{index}.chrome.log').write_text(r.stderr)
                assert r.returncode==0 and png.exists(),r.stderr[-1200:]
                match=re.search(r'<script id="layout-check" type="application/json">(.*?)</script>',r.stdout,re.S)
                assert match,'missing DOM layout report'
                report=json.loads(html.unescape(match.group(1)));report['slide']=index;report['outside_canvas']=outside
                if outside:report['status']='FAIL'
                reports.append(report)
    from PIL import Image
    contact=Image.new('RGB',(1600,2700),'#D9E2E9')
    for i in range(12):contact.paste(Image.open(H/f'preview_{i+1}.png').resize((800,450)),((i%2)*800,(i//2)*450))
    contact.save(H/'preview_all.png')
    contact.crop((0,900,1600,2700)).save(H/'preview_new.png')
    (H/'layout_check.json').write_text(json.dumps(reports,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps(reports,ensure_ascii=False,indent=2))


if __name__=='__main__':main()
