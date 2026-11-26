"""Make local layout previews from the actual PPTX table/shape XML."""
from pathlib import Path
import html
import json
import zipfile
import xml.etree.ElementTree as ET

HERE=Path(__file__).resolve().parent
NS={'a':'http://schemas.openxmlformats.org/drawingml/2006/main','p':'http://schemas.openxmlformats.org/presentationml/2006/main'}
SCALE=100/914400


def px(value):
    return float(value)*SCALE


def paragraph(p):
    pp=p.find('a:pPr',NS)
    align=pp.get('algn','l') if pp is not None else 'l'
    alignment={'l':'left','r':'right','ctr':'center'}.get(align,'left')
    spacing=pp.find('a:lnSpc/a:spcPts',NS) if pp is not None else None
    line=f'{float(spacing.get("val"))/100*100/72}px' if spacing is not None else '1.16'
    runs=[]
    for child in p:
        if child.tag.endswith('}br'):
            runs.append('<br>');continue
        if not child.tag.endswith('}r'):
            continue
        t=child.find('a:t',NS)
        if t is None:continue
        r=child.find('a:rPr',NS)
        size=float(r.get('sz','1600'))/100*100/72 if r is not None else 16*100/72
        color=r.find('a:solidFill/a:srgbClr',NS) if r is not None else None
        color=color.get('val') if color is not None else '000000'
        bold='700' if r is not None and r.get('b')=='1' else '400'
        runs.append(f'<span style="font-size:{size}px;color:#{color};font-weight:{bold}">{html.escape(t.text or "")}</span>')
    return f'<p style="text-align:{alignment};line-height:{line}">{"".join(runs)}</p>'


def main():
    with zipfile.ZipFile(HERE/'IC优化_30轮性能对比.pptx') as z:
        for index,label in enumerate(['octane','sunspider'],1):
            root=ET.fromstring(z.read(f'ppt/slides/slide{index}.xml'))
            elements=[]
            for shape in root.findall('.//p:spTree/p:sp',NS):
                transform=shape.find('p:spPr/a:xfrm',NS)
                if transform is None:continue
                off=transform.find('a:off',NS);ext=transform.find('a:ext',NS)
                body=shape.find('p:txBody',NS)
                if body is None:continue
                bp=body.find('a:bodyPr',NS)
                valign='center' if bp is not None and bp.get('anchor')=='ctr' else 'flex-start'
                paras=''.join(paragraph(p) for p in body.findall('a:p',NS))
                elements.append(f'<div class="shape" style="left:{px(off.get("x"))}px;top:{px(off.get("y"))}px;width:{px(ext.get("cx"))}px;height:{px(ext.get("cy"))}px;justify-content:{valign}">{paras}</div>')
            for frame in root.findall('.//p:spTree/p:graphicFrame',NS):
                table=frame.find('.//a:tbl',NS)
                if table is None:continue
                off=frame.find('p:xfrm/a:off',NS);ext=frame.find('p:xfrm/a:ext',NS)
                columns=[px(c.get('w')) for c in table.findall('a:tblGrid/a:gridCol',NS)]
                rows=[]
                for r in table.findall('a:tr',NS):
                    cells=[]
                    for cell in r.findall('a:tc',NS):
                        prop=cell.find('a:tcPr',NS)
                        fill=prop.find('a:solidFill/a:srgbClr',NS)
                        fill=fill.get('val') if fill is not None else 'FFFFFF'
                        b=prop.find('a:lnB',NS)
                        bc=b.find('a:solidFill/a:srgbClr',NS) if b is not None else None
                        border=f'{px(b.get("w","0"))}px solid #{bc.get("val")}' if bc is not None else 'none'
                        paragraphs=''.join(paragraph(p) for p in cell.findall('a:txBody/a:p',NS))
                        cells.append(f'<td style="background:#{fill};border-bottom:{border}">{paragraphs}</td>')
                    rows.append(f'<tr style="height:{px(r.get("h"))}px">{"".join(cells)}</tr>')
                elements.append(f'<table data-native-height="{px(ext.get("cy"))}" style="left:{px(off.get("x"))}px;top:{px(off.get("y"))}px;width:{px(ext.get("cx"))}px"><colgroup>'+''.join(f'<col style="width:{w}px">' for w in columns)+'</colgroup>'+''.join(rows)+'</table>')
            document='''<!doctype html><meta charset="utf-8"><style>
@font-face{font-family:'TNR Preview';src:local('Liberation Serif');font-weight:400}
@font-face{font-family:'TNR Preview';src:local('Liberation Serif Bold');font-weight:700}
@font-face{font-family:'Kai Preview';src:local('AR PL UKai CN');font-weight:400}
html,body{margin:0;width:1600px;height:900px;overflow:hidden;background:#fff;color:#000}
body{font-family:'TNR Preview','Kai Preview',serif}
.shape{position:absolute;display:flex;flex-direction:column;box-sizing:border-box}
p{margin:0;padding:0;white-space:nowrap}
table{position:absolute;border-collapse:collapse;table-layout:fixed;border-top:1.4px solid #000}
td{box-sizing:border-box;padding:1.3889px 16.6667px;vertical-align:middle}
</style>'''+''.join(elements)+'''<script>
document.fonts.ready.then(()=>{const t=document.querySelector('table');const b=t.getBoundingClientRect();
const check={tableCount:document.querySelectorAll('table').length,rows:t.rows.length,tableBottom:b.bottom,expectedHeight:Number(t.dataset.nativeHeight),actualHeight:b.height,
overflow:Array.from(t.querySelectorAll('td')).filter(c=>c.scrollWidth>c.clientWidth+1||c.scrollHeight>c.clientHeight+1).map(c=>c.innerText)};
const s=document.createElement('script');s.type='application/json';s.id='layout-check';s.textContent=JSON.stringify(check);document.body.append(s);document.body.dataset.ready='true';});
</script>'''
            (HERE/f'preview_{label}.html').write_text(document)
    for name in ['preview.html','preview_raw.html']:
        (HERE/name).unlink(missing_ok=True)
    print('XML_LAYOUT_PREVIEWS_READY')


if __name__=='__main__':main()
