"""Fix neutral padding metadata, not a second layout method or value search."""
import shutil
from native import *
def main():
 old=read(HERE/'manifest.json');save(HERE/'manifest.initial.json',old);failure=[]
 for v in 'MR':
  for c in [v+'_base',v+'_p000']:
   a=old['artifacts'][c];_,syms,ss,_=table(a['path']);failure.append(dict(condition=c,JS_CallInternal=syms['JS_CallInternal'],sections=ss))
 save(HERE/'layout/initial_zero_failure.json',dict(status='ZERO_NOT_EQUIVALENT',cause='raw assembly lacked original GNU property note; note and PLT sizes changed',conditions=failure,formal_samples=0))
 artifacts={}
 for v in 'MR':
  src=STORE/(v+'_base');blob,ss=sections(src/'.obj/quickjs.o');sec=ss['.note.gnu.property'];note=blob[sec['offset']:sec['offset']+sec['size']]
  save(HERE/'padding'/f'{v}_original_GNU_property.hex',note.hex()+'\n')
  for c in [v+'_base']+[v+'_p'+f'{p:03}' for p in [0,16,32,48]]:
   dst=STORE/'final'/c;dst.mkdir(parents=True);a=old['artifacts'][c].copy()
   if c.endswith('base'):shutil.copy2(src/'qjs',dst/'qjs')
   else:
    n=a['padding_request'];assembly=(HERE/'padding'/f'p{n:03}.s').read_text()+'.section .note.gnu.property,"a",@note\n.balign 8\n.byte '+','.join(hex(x) for x in note)+'\n'
    ap=HERE/'padding'/f'{v}_p{n:03}_fixed.s';save(ap,assembly);obj=dst/'pad.o';r=capture(c+'_fixed_assemble',['as',ap,'-o',obj]);assert not r['exit_code']
    command=read(HERE/'links/inputs.json')['links'][v]['original_command'].copy();command[command.index('qjs')]=str(dst/'qjs');command.insert(command.index('.obj/quickjs.o'),str(obj));command+=['-Wl,-Map='+str(dst/'link.map'),'-Wl,-t']
    r=capture(c+'_fixed_link',command,src);assert not r['exit_code'];save(HERE/'links/final'/(c+'.map'),(dst/'link.map').read_bytes())
    b,s=sections(obj);t=s['.text'];assert b[t['offset']:t['offset']+t['size']]==bytes([0x90])*n
    a.update(padding_object_sha256=sha(obj),padding_bytes_hex=(bytes([0x90])*n).hex(),command=command,property_note_hex=note.hex())
   a.update(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),bytes=(dst/'qjs').stat().st_size);artifacts[c]=a
  assert all(sha(src/p)==h for p,h in old['objects'][v].items())
 old['artifacts']=artifacts;old['padding_metadata_correction']='padding note copied byte-for-byte from unchanged quickjs.o; first faulty outputs retained, no formal samples'
 save(HERE/'manifest.final.json',old)
 print('PADDING_METADATA_FIXED_NO_ORIGINAL_RECOMPILE',flush=True)
if __name__=='__main__':main()
