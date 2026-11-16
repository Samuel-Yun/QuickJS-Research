"""Post-formal static reachability evidence; no instruction coverage claims."""
import re,struct
from native import sections,table
from common import *
def main():
 assert read(HERE/'analysis/audit.json')['status']=='PASS';m=read(HERE/'manifest.final.json');checks=[];archives=[]
 for c in LAYOUT:
  a=m['artifacts'][c];exe=a['path'];n=a['padding_request'];pad=Path(exe).parent/'pad.o';assert sha(pad)==a['padding_object_sha256'];blob,ss=sections(pad)
  assert not any(s in ss for s in ['.init_array','.fini_array','.preinit_array'])
  entry=struct.unpack_from('<Q',Path(exe).read_bytes(),24)[0]
  symbol=subprocess.check_output(['readelf','-sW',exe],text=True);line=next(s for s in symbol.splitlines() if 'mr_unexecuted_padding' in s);cols=line.split();assert cols[3:5]==['OBJECT','LOCAL'];start=int(cols[1],16)
  assembly=subprocess.check_output(['objdump','-d','-M','intel',exe],text=True);data=assembly.encode();p=HERE/'native/final'/c/'all_instructions.txt.gz';save(p,gzip.compress(data,mtime=0));archives.append(dict(archive=p.relative_to(HERE).as_posix(),compressed_sha256=sha(p),original_sha256=digest(data),original_bytes=len(data)))
  edges=[]
  for s in assembly.splitlines():
   match=re.search(r'\b(?:call|j[a-z]+)\s+([0-9a-f]+)\s+<',s)
   if match and start<=int(match[1],16)<start+n:edges.append(s)
  reloc=gzip.open(HERE/'native/final'/c/'relocations.txt.gz','rt').read();refs=[]
  for s in reloc.splitlines():
   if 'R_X86_64_RELATIVE ' in s and start<=int(s.split()[-1],16)<start+n:refs.append(s)
  entries=table(exe)[0];assert not edges and not refs and not start<=entry<start+n and not any(start<=x<start+n for x in entries)
  # qjs.o contribution immediately before pad ends in help(), which calls exit@plt.
  prior=[s for s in assembly.splitlines() if re.match(r'^\s*[0-9a-f]+:',s) and int(s.split(':',1)[0],16)<start][-8:]
  assert any('exit@plt' in s and 'call' in s for s in prior),prior
  checks.append(dict(condition=c,padding_start=hex(start),requested_bytes=n,local_symbol_type='OBJECT',constructors=False,direct_edges_into_padding=edges,relative_relocations_into_padding=refs,dispatch_entries_into_padding=0,ELF_entry_outside=True,preceding_epilogue=prior,no_fallthrough_reason='preceding qjs help calls noreturn exit@plt; padding has no callable/exported entry',dynamic_native_coverage=None))
 save(HERE/'layout/padding_unreachable.json',dict(status='STATIC_EVIDENCE_PASS',checks=checks,scope='static direct edges, relative data relocations, entry/dispatch and noreturn boundary; no formal native coverage trace'))
 save(HERE/'native/padding_archives.json',archives);print('PADDING_STATIC_REFERENCE_CHECK_PASS',len(checks))
if __name__=='__main__':main()
