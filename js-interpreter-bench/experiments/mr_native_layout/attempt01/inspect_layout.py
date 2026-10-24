from native import *
for v in 'MR':
 for c in [v+'_base']+[v+'_p'+f'{n:03}' for n in [0,16,32,48]]:
  a=read(HERE/'manifest.json')['artifacts'][c];table_,syms,ss,nm=table(a['path']);b=Path(a['path']).read_bytes();s=ss['.text'];text_=b[s['offset']:s['offset']+s['size']]
  print(c,syms['JS_CallInternal'],s,'text_sha',digest(text_))
  if c.endswith('base'):base=text_;base_symbols=syms
  elif c.endswith('p000'):
   differences=[(hex(i+s['address']),x,y) for i,(x,y) in enumerate(zip(base,text_)) if x!=y]
   print('DIFF',len(differences),differences[:30]);print('SYMS',[(n,base_symbols[n]['address'],x['address']) for n,x in syms.items() if n in base_symbols and x['address']!=base_symbols[n]['address']][:25])
