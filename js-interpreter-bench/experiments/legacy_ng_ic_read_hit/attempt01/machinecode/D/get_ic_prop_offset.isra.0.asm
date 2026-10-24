
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000017f40 <get_ic_prop_offset.isra.0>:
get_ic_prop_offset():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:733
   17f40:	3b 77 04             	cmp    esi,DWORD PTR [rdi+0x4]
   17f43:	73 3b                	jae    17f80 <get_ic_prop_offset.isra.0+0x40>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:734
   17f45:	89 f6                	mov    esi,esi
   17f47:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   17f4b:	48 8d 04 f5 00 00 00 	lea    rax,[rsi*8+0x0]
   17f52:	00 
   17f53:	48 29 f0             	sub    rax,rsi
   17f56:	48 8d 04 c1          	lea    rax,[rcx+rax*8]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:735
   17f5a:	0f b6 78 34          	movzx  edi,BYTE PTR [rax+0x34]
   17f5e:	89 f9                	mov    ecx,edi
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:737
   17f60:	89 ce                	mov    esi,ecx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:738 (discriminator 1)
   17f62:	48 39 14 f0          	cmp    QWORD PTR [rax+rsi*8],rdx
   17f66:	75 08                	jne    17f70 <get_ic_prop_offset.isra.0+0x30>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:739
   17f68:	88 48 34             	mov    BYTE PTR [rax+0x34],cl
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:740
   17f6b:	8b 44 b0 20          	mov    eax,DWORD PTR [rax+rsi*4+0x20]
   17f6f:	c3                   	ret
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:743
   17f70:	83 c1 01             	add    ecx,0x1
   17f73:	83 e1 03             	and    ecx,0x3
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:744 (discriminator 1)
   17f76:	39 cf                	cmp    edi,ecx
   17f78:	75 e6                	jne    17f60 <get_ic_prop_offset.isra.0+0x20>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:749
   17f7a:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:750
   17f7f:	c3                   	ret
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:726
   17f80:	50                   	push   rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:733 (discriminator 1)
   17f81:	48 8d 0d 48 13 0c 00 	lea    rcx,[rip+0xc1348]        # d92d0 <__PRETTY_FUNCTION__.63>
   17f88:	ba dd 02 00 00       	mov    edx,0x2dd
   17f8d:	48 8d 35 df 51 0b 00 	lea    rsi,[rip+0xb51df]        # cd173 <_IO_stdin_used+0x173>
   17f94:	48 8d 3d c5 52 0b 00 	lea    rdi,[rip+0xb52c5]        # cd260 <_IO_stdin_used+0x260>
   17f9b:	e8 00 9b ff ff       	call   11aa0 <__assert_fail@plt>

Disassembly of section .fini:
