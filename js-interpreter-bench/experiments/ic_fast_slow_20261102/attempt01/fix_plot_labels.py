"""Derived display correction only. Never reads or runs an engine."""
import csv,xml.etree.ElementTree as ET
from analyze import HERE,curves
rows=[]
with (HERE/'mechanism/analysis/statistics.csv').open(encoding='utf-8',newline='') as f:
    for r in csv.DictReader(f):r['median']=float(r['median']);rows.append(r)
out=HERE/'mechanism/analysis/adoption_curves_labeled.svg';assert not out.exists();curves(out,rows)
for kind in ['mechanism','sunspider','micro','octane']:
    for p in (HERE/kind/'analysis').glob('*.svg'):ET.parse(p)
print('SVG_XML_CHECK_PASS; separated A/M reference legend, values unchanged')
