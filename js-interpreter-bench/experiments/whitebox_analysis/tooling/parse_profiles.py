"""Conservative PC classifier, NOT a replacement for V8's full tick processor.
Top PC only; temporal code creation/move/delete ranges, no stack attribution,
no native-symbol resolution, no inline reconstruction, whole process.
"""
import bisect, collections, csv, json, re
from pathlib import Path
import common as c
csv.field_size_limit(20000000)

def parse_v8(path):
    ranges={};counts=collections.Counter();total=0;unknown=0;states=collections.Counter()
    with path.open(errors='replace',newline='') as f:
        for row in csv.reader(f):
            if not row:continue
            try:
                if row[0]=='code-creation':ranges[int(row[4],16)]=(int(row[5]),row[1],row[6])
                elif row[0]=='code-move':
                    if int(row[1],16) in ranges:ranges[int(row[2],16)]=ranges.pop(int(row[1],16))
                elif row[0]=='code-delete':ranges.pop(int(row[1],16),None)
                elif row[0]=='tick':
                    pc=int(row[1],16);total+=1;states[row[5] if len(row)>5 else '?']+=1
                    starts=sorted(ranges);ix=bisect.bisect_right(starts,pc)-1
                    if ix>=0:
                        start=starts[ix];size,kind,name=ranges[start]
                        if pc<start+size:counts[kind+':'+name]+=1;continue
                    unknown+=1;counts['UNKNOWN_NATIVE_OR_UNMAPPED']+=1
            except (ValueError,IndexError):raise RuntimeError('unexpected log format at '+str(row[:6]))
    return {'ticks':total,'unknown_top_PC':unknown,'VM_state_raw':dict(states),
            'top_PC_counts':dict(counts.most_common()),'raw_sha256':c.sha(path),
            'parser_sha256':c.sha(__file__),'scope':'whole process; top PC only',
            'native_symbols':'UNKNOWN','function_stack_self_time':'UNKNOWN'}

def main():
    rows=[]
    for p in sorted((c.ATTEMPT/'profiles').glob('*/v8.log')):
        r=c.read(p.parent/'top_pc.json') if (p.parent/'top_pc.json').exists() else parse_v8(p)
        c.save(p.parent/'top_pc.json',r)
        for name,count in list(r['top_PC_counts'].items())[:25]:
            rows.append({'profile':p.parent.name,'kind_name':name,'samples':count,'total_ticks':r['ticks'],'fraction':count/r['ticks']})
    if (c.ATTEMPT/'profiles/regexp.v8.log').exists():
        r=parse_v8(c.ATTEMPT/'profiles/regexp.v8.log');c.save(c.ATTEMPT/'profiles/regexp.top_pc.json',r)
    c.export(c.ATTEMPT/'summary/v8_top_pc.csv',rows)
    rows=[]
    for p in sorted((c.ATTEMPT/'profiles').glob('*.jsc.*/stderr.txt')):
        text=p.read_text();total=int(re.search(r'Total samples: (\d+)',text).group(1))
        functions=text.split('Top functions as',1)[1].split('Sampling rate:',1)[0]
        for count,name in re.findall(r"^\s+(\d+)\s+'([^']+)'",functions,re.M):
            rows.append({'profile':p.parent.name,'function_hash_source':name,'samples':int(count),'total':total,'fraction':int(count)/total})
    c.export(c.ATTEMPT/'summary/jsc_function_samples.csv',rows)
    print('PROFILE_PARSE_DONE',flush=True)

if __name__=='__main__':main()
