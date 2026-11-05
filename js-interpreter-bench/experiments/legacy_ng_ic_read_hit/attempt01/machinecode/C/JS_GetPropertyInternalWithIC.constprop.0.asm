
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

000000000002d060 <JS_GetPropertyInternalWithIC.constprop.0>:
JS_GetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8482
   2d060:	41 57                	push   r15
   2d062:	49 89 d7             	mov    r15,rdx
   2d065:	41 56                	push   r14
   2d067:	49 89 f6             	mov    r14,rsi
   2d06a:	41 55                	push   r13
   2d06c:	4d 89 cd             	mov    r13,r9
   2d06f:	41 54                	push   r12
   2d071:	4d 89 c4             	mov    r12,r8
   2d074:	55                   	push   rbp
   2d075:	89 cd                	mov    ebp,ecx
   2d077:	53                   	push   rbx
   2d078:	48 83 ec 18          	sub    rsp,0x18
   2d07c:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
   2d081:	48 8b 5c 24 50       	mov    rbx,QWORD PTR [rsp+0x50]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8490 (discriminator 1)
   2d086:	83 fa ff             	cmp    edx,0xffffffff
   2d089:	75 45                	jne    2d0d0 <JS_GetPropertyInternalWithIC.constprop.0+0x70>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8493
   2d08b:	48 8b 56 18          	mov    rdx,QWORD PTR [rsi+0x18]
   2d08f:	48 8b 3b             	mov    rdi,QWORD PTR [rbx]
   2d092:	8b 73 08             	mov    esi,DWORD PTR [rbx+0x8]
   2d095:	e8 a6 ae fe ff       	call   17f40 <get_ic_prop_offset.isra.0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8494 (discriminator 1)
   2d09a:	83 f8 ff             	cmp    eax,0xffffffff
   2d09d:	74 31                	je     2d0d0 <JS_GetPropertyInternalWithIC.constprop.0+0x70>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8495
   2d09f:	89 c2                	mov    edx,eax
   2d0a1:	48 c1 e2 04          	shl    rdx,0x4
   2d0a5:	49 03 56 20          	add    rdx,QWORD PTR [r14+0x20]
   2d0a9:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   2d0ac:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:709
   2d0b0:	83 fa f6             	cmp    edx,0xfffffff6
   2d0b3:	76 04                	jbe    2d0b9 <JS_GetPropertyInternalWithIC.constprop.0+0x59>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:711
   2d0b5:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_GetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8498
   2d0b9:	48 83 c4 18          	add    rsp,0x18
   2d0bd:	5b                   	pop    rbx
   2d0be:	5d                   	pop    rbp
   2d0bf:	41 5c                	pop    r12
   2d0c1:	41 5d                	pop    r13
   2d0c3:	41 5e                	pop    r14
   2d0c5:	41 5f                	pop    r15
   2d0c7:	c3                   	ret
   2d0c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2d0cf:	00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8497
   2d0d0:	53                   	push   rbx
   2d0d1:	89 e9                	mov    ecx,ebp
   2d0d3:	4c 89 f6             	mov    rsi,r14
   2d0d6:	4d 89 e0             	mov    r8,r12
   2d0d9:	6a 00                	push   0x0
   2d0db:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
   2d0e0:	4d 89 e9             	mov    r9,r13
   2d0e3:	4c 89 fa             	mov    rdx,r15
   2d0e6:	e8 15 f9 ff ff       	call   2ca00 <JS_GetPropertyInternalIC>
   2d0eb:	59                   	pop    rcx
   2d0ec:	5e                   	pop    rsi
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8498
   2d0ed:	48 83 c4 18          	add    rsp,0x18
   2d0f1:	5b                   	pop    rbx
   2d0f2:	5d                   	pop    rbp
   2d0f3:	41 5c                	pop    r12
   2d0f5:	41 5d                	pop    r13
   2d0f7:	41 5e                	pop    r14
   2d0f9:	41 5f                	pop    r15
   2d0fb:	c3                   	ret

Disassembly of section .fini:
