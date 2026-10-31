"""Editable SVG forest plots from saved exploratory intervals, no plotting package."""
import csv,html,math
from pathlib import Path
HERE=Path(__file__).resolve().parent
def main():
    rows=list(csv.DictReader((HERE/'summary/ratios.csv').open(encoding='utf-8')))
    out=HERE/'plots';out.mkdir(exist_ok=True)
    for ratio in ['E/A','E/V8_ON','A/V8_ON']:
        rs=[r for r in rows if r['ratio']==ratio];h=110+len(rs)*31;lo=min([1.0]+[float(r['CI95_low']) for r in rs])*.94;hi=max([1.0]+[float(r['CI95_high']) for r in rs])*1.06
        def x(v):return 240+(math.log(v)-math.log(lo))/(math.log(hi)-math.log(lo))*540
        content=[f'<svg xmlns="http://www.w3.org/2000/svg" width="1020" height="{h}" viewBox="0 0 1020 {h}">','<rect width="100%" height="100%" fill="white"/>','<g font-family="sans-serif" fill="black">',f'<text x="20" y="28" font-size="19">{html.escape(ratio)} median time ratio; exploratory 95% interval</text>',f'<line x1="{x(1):.2f}" x2="{x(1):.2f}" y1="48" y2="{h-45}" stroke="#777" stroke-dasharray="5,5"/>']
        for i,r in enumerate(rs):
            y=67+31*i;p,l,u=[float(r[k]) for k in ['point','CI95_low','CI95_high']]
            content += [f'<text x="20" y="{y+4}" font-size="13">{html.escape(r["case"])}</text>',f'<line x1="{x(l):.2f}" x2="{x(u):.2f}" y1="{y}" y2="{y}" stroke="black" stroke-width="2"/>',f'<circle cx="{x(p):.2f}" cy="{y}" r="4" fill="black"/>',f'<text x="805" y="{y+4}" font-size="13">{p:.4f} [{l:.4f}, {u:.4f}]</text>']
        content += [f'<line x1="240" x2="780" y1="{h-43}" y2="{h-43}" stroke="black"/>']
        tick_positions=[]
        for tick in [1,.125,.25,.5,.6,.7,.8,.9,1.1,1.2,1.4,1.6,2,2.5,3,4,5,6,8]:
            if lo<=tick<=hi and all(abs(x(tick)-position)>=42 for position in tick_positions):
                xx=x(tick)
                tick_positions.append(xx)
                content += [f'<line x1="{xx:.2f}" x2="{xx:.2f}" y1="{h-43}" y2="{h-38}" stroke="black"/>',f'<text x="{xx:.2f}" y="{h-25}" text-anchor="middle" font-size="11">{tick:g}</text>']
        content += [f'<text x="240" y="{h-7}" font-size="12">Log scale; dashed=1. &lt;1: numerator faster. Not an official Octane score.</text>','</g></svg>']
        p=out/(ratio.replace('/','_over_')+'.svg');assert not p.exists();p.write_text('\n'.join(content),encoding='utf-8')
if __name__=='__main__':main()
