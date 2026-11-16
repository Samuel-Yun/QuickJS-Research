"""Set East Asian fonts explicitly and validate complete, editable, two-slide tables."""
from pathlib import Path
import hashlib
import json
import re
import zipfile
import xml.etree.ElementTree as ET
from PIL import ImageFont

HERE = Path(__file__).resolve().parent
PATH = HERE / 'IC优化_30轮性能对比.pptx'
NS = {'a':'http://schemas.openxmlformats.org/drawingml/2006/main',
      'p':'http://schemas.openxmlformats.org/presentationml/2006/main',
      'r':'http://schemas.openxmlformats.org/officeDocument/2006/relationships'}
for k, v in NS.items():
    ET.register_namespace(k, v)


def q(s):
    prefix, name = s.split(':')
    return '{' + NS[prefix] + '}' + name


def ensure(parent, tag, attributes=None):
    result = parent.find(tag, NS)
    if result is None:
        result = ET.SubElement(parent, q(tag))
    if attributes:
        result.attrib.update(attributes)
    return result


def text(node):
    return '\n'.join(''.join(x.itertext()) for x in node.findall('.//a:t', NS))


def main():
    dataset = json.loads((HERE / 'data.json').read_text())
    with zipfile.ZipFile(PATH) as z:
        files = {n:z.read(n) for n in z.namelist()}
    checks = []
    for name, blob in list(files.items()):
        if not name.startswith('ppt/') or not name.endswith('.xml'):
            continue
        root = ET.fromstring(blob)
        for tag in ['a:rPr','a:defRPr','a:endParaRPr']:
            for prop in root.findall('.//' + tag, NS):
                ensure(prop, 'a:latin', {'typeface':'Times New Roman'})
                ensure(prop, 'a:ea', {'typeface':'楷体'})
                ensure(prop, 'a:cs', {'typeface':'Times New Roman'})
        for tag in ['a:majorFont','a:minorFont']:
            for prop in root.findall('.//' + tag, NS):
                ensure(prop, 'a:latin', {'typeface':'Times New Roman'})
                ensure(prop, 'a:ea', {'typeface':'楷体'})
                ensure(prop, 'a:cs', {'typeface':'Times New Roman'})
                for font in prop.findall('a:font', NS):
                    if font.get('script') in ['Hans','Hant']:
                        font.set('typeface','楷体')
        if re.fullmatch(r'ppt/slides/slide[12]\.xml', name):
            index = int(re.search(r'slide([12])', name)[1]) - 1
            spec = dataset['slides'][index]
            tables = root.findall('.//a:tbl', NS)
            assert len(tables) == 1
            table = tables[0]
            rows = table.findall('a:tr', NS)
            assert len(rows) == len(spec['rows']) + 1
            heights = [.52] + [(.257 if index else .368)] * len(spec['rows'])
            for row, height in zip(rows, heights):
                row.set('h', str(round(height * 914400)))
            frame = root.find('.//p:graphicFrame', NS)
            ext = frame.find('p:xfrm/a:ext', NS)
            ext.set('cy', str(sum(int(r.get('h')) for r in rows)))
            assert 1.12 + sum(heights) < 8.4
            assert len(table.findall('a:tblGrid/a:gridCol', NS)) == 5
            for row_index, row in enumerate(rows):
                cells = row.findall('a:tc', NS)
                assert len(cells) == 5
                for column, cell in enumerate(cells):
                    props = ensure(cell, 'a:tcPr', dict(marL='152400',marR='152400',marT='12700',marB='12700',anchor='ctr'))
                    body = cell.find('a:txBody/a:bodyPr', NS)
                    body.set('wrap','none')
                    body.set('anchor','ctr')
                    for paragraph in cell.findall('a:txBody/a:p', NS):
                        pp = paragraph.find('a:pPr', NS)
                        if pp is None:
                            pp = ET.Element(q('a:pPr'))
                            paragraph.insert(0, pp)
                        for child in list(pp):
                            if child.tag in [q('a:lnSpc'),q('a:spcBef'),q('a:spcAft')]:
                                pp.remove(child)
                        line = ET.Element(q('a:lnSpc'))
                        ET.SubElement(line,q('a:spcPts'),{'val':str(1650 if row_index == 0 else (1500 if index else 1800))})
                        pp.insert(0,line)
                    if row_index:
                        expected = spec['rows'][row_index-1]['display'][column]
                        assert text(cell).replace('\n','') == expected
                        expected_color = ('147D38' if spec['rows'][row_index-1]['pct'] < 0 else 'BD252D') if column == 3 else '000000'
                        for prop in cell.findall('.//a:rPr', NS):
                            color = prop.find('a:solidFill/a:srgbClr',NS)
                            assert color is not None and color.get('val') == expected_color
                            assert prop.find('a:latin',NS).get('typeface') == 'Times New Roman'
                            assert prop.find('a:ea',NS).get('typeface') == '楷体'
            checks.append(dict(slide=index+1,benchmark=spec['title'],body_rows=len(spec['rows']),
                native_editable_tables=1,data_columns=4,row_label_columns=1,
                bottom_inches=round(1.12+sum(heights),3),all_data_values_match=True,percentage_colors_match=True))
        files[name] = ET.tostring(root,encoding='utf-8',xml_declaration=True)
    assert len(checks) == 2
    assert len([n for n in files if re.fullmatch(r'ppt/slides/slide\d+\.xml',n)]) == 2
    temp = PATH.with_suffix('.tmp.pptx')
    with zipfile.ZipFile(temp,'w',compression=zipfile.ZIP_DEFLATED) as z:
        for name, blob in files.items():
            z.writestr(name,blob)
    temp.replace(PATH)
    # Use metrically compatible Latin fallback for a conservative fit check.
    font_path='/usr/share/fonts/truetype/liberation/LiberationSerif-Regular.ttf'
    largest_ratio=0
    for index,spec in enumerate(dataset['slides']):
        font_size=13.2 if index else 16
        font=ImageFont.truetype(font_path,round(font_size*4))
        for row in spec['rows']:
            for column,value in enumerate(row['display']):
                width_pt=font.getlength(value)/4
                available=[4.6,2.5,2.5,2.2,3.1][column]*72-24
                largest_ratio=max(largest_ratio,width_pt/available)
                assert width_pt < available, (value,width_pt,available)
    result=dict(status='PASS',slides=checks,fonts=dict(latin='Times New Roman',east_asian='楷体'),
        font_embedding=False,local_preview_fallbacks=['AR PL UKai CN','Liberation Serif'],
        font_fit_max_width_ratio=largest_ratio,
        pptx_sha256=hashlib.sha256(PATH.read_bytes()).hexdigest(),source_sha256=dataset['source_sha256'])
    (HERE/'validation.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps(result,ensure_ascii=False))


if __name__ == '__main__':
    main()
