
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

000000000002ca00 <JS_GetPropertyInternalIC>:
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8319
   2ca00:	41 57                	push   r15
   2ca02:	41 56                	push   r14
   2ca04:	41 55                	push   r13
   2ca06:	41 54                	push   r12
   2ca08:	49 89 fc             	mov    r12,rdi
   2ca0b:	48 89 f7             	mov    rdi,rsi
   2ca0e:	48 89 d6             	mov    rsi,rdx
   2ca11:	55                   	push   rbp
   2ca12:	4c 89 ca             	mov    rdx,r9
   2ca15:	48 89 fd             	mov    rbp,rdi
   2ca18:	4d 89 c1             	mov    r9,r8
   2ca1b:	53                   	push   rbx
   2ca1c:	49 89 d7             	mov    r15,rdx
   2ca1f:	89 cb                	mov    ebx,ecx
   2ca21:	48 81 ec b8 00 00 00 	sub    rsp,0xb8
   2ca28:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
   2ca2f:	00 00 
   2ca31:	48 89 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],rax
   2ca38:	00 
   2ca39:	31 c0                	xor    eax,eax
   2ca3b:	44 8b 94 24 f0 00 00 	mov    r10d,DWORD PTR [rsp+0xf0]
   2ca42:	00 
   2ca43:	4c 8b b4 24 f8 00 00 	mov    r14,QWORD PTR [rsp+0xf8]
   2ca4a:	00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8326 (discriminator 1)
   2ca4b:	83 fe ff             	cmp    esi,0xffffffff
   2ca4e:	0f 85 04 02 00 00    	jne    2cc58 <JS_GetPropertyInternalIC+0x258>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8319
   2ca54:	45 31 ed             	xor    r13d,r13d
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6239
   2ca57:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6240
   2ca5b:	89 d9                	mov    ecx,ebx
   2ca5d:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   2ca60:	21 c1                	and    ecx,eax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6241
   2ca62:	44 8b 44 8a 38       	mov    r8d,DWORD PTR [rdx+rcx*4+0x38]
get_shape_prop():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:5203
   2ca67:	48 8d 0c 85 3c 00 00 	lea    rcx,[rax*4+0x3c]
   2ca6e:	00 
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6243
   2ca6f:	4d 85 c0             	test   r8,r8
   2ca72:	0f 84 99 00 00 00    	je     2cb11 <JS_GetPropertyInternalIC+0x111>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6244
   2ca78:	49 83 e8 01          	sub    r8,0x1
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6245
   2ca7c:	4a 8d 04 c1          	lea    rax,[rcx+r8*8]
   2ca80:	48 01 d0             	add    rax,rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6246 (discriminator 1)
   2ca83:	3b 58 04             	cmp    ebx,DWORD PTR [rax+0x4]
   2ca86:	0f 85 b4 01 00 00    	jne    2cc40 <JS_GetPropertyInternalIC+0x240>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8377
   2ca8c:	0f b6 48 03          	movzx  ecx,BYTE PTR [rax+0x3]
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6247
   2ca90:	4d 89 c3             	mov    r11,r8
   2ca93:	49 c1 e3 04          	shl    r11,0x4
   2ca97:	4c 03 5d 20          	add    r11,QWORD PTR [rbp+0x20]
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8377
   2ca9b:	89 ce                	mov    esi,ecx
   2ca9d:	40 c0 ee 02          	shr    sil,0x2
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8377 (discriminator 1)
   2caa1:	80 f9 3f             	cmp    cl,0x3f
   2caa4:	77 4a                	ja     2caf0 <JS_GetPropertyInternalIC+0xf0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8399
   2caa6:	45 85 ed             	test   r13d,r13d
   2caa9:	0f 84 d1 00 00 00    	je     2cb80 <JS_GetPropertyInternalIC+0x180>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8401
   2caaf:	49 8b 03             	mov    rax,QWORD PTR [r11]
   2cab2:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:709
   2cab6:	83 fa f6             	cmp    edx,0xfffffff6
   2cab9:	0f 87 b1 00 00 00    	ja     2cb70 <JS_GetPropertyInternalIC+0x170>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2cabf:	48 8b 8c 24 a8 00 00 	mov    rcx,QWORD PTR [rsp+0xa8]
   2cac6:	00 
   2cac7:	64 48 2b 0c 25 28 00 	sub    rcx,QWORD PTR fs:0x28
   2cace:	00 00 
   2cad0:	0f 85 8c 04 00 00    	jne    2cf62 <JS_GetPropertyInternalIC+0x562>
   2cad6:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
   2cadd:	5b                   	pop    rbx
   2cade:	5d                   	pop    rbp
   2cadf:	41 5c                	pop    r12
   2cae1:	41 5d                	pop    r13
   2cae3:	41 5e                	pop    r14
   2cae5:	41 5f                	pop    r15
   2cae7:	c3                   	ret
   2cae8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2caef:	00 
   2caf0:	83 e6 30             	and    esi,0x30
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8378
   2caf3:	40 80 fe 10          	cmp    sil,0x10
   2caf7:	0f 84 61 03 00 00    	je     2ce5e <JS_GetPropertyInternalIC+0x45e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8387
   2cafd:	40 80 fe 20          	cmp    sil,0x20
   2cb01:	0f 84 b3 03 00 00    	je     2ceba <JS_GetPropertyInternalIC+0x4ba>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8392
   2cb07:	40 80 fe 30          	cmp    sil,0x30
   2cb0b:	0f 84 2f 02 00 00    	je     2cd40 <JS_GetPropertyInternalIC+0x340>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8404
   2cb11:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8404 (discriminator 1)
   2cb15:	a8 08                	test   al,0x8
   2cb17:	0f 85 83 00 00 00    	jne    2cba0 <JS_GetPropertyInternalIC+0x1a0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8464
   2cb1d:	48 8b 6a 30          	mov    rbp,QWORD PTR [rdx+0x30]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8463
   2cb21:	41 83 c5 01          	add    r13d,0x1
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8465
   2cb25:	48 85 ed             	test   rbp,rbp
   2cb28:	0f 85 29 ff ff ff    	jne    2ca57 <JS_GetPropertyInternalIC+0x57>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8468 (discriminator 1)
   2cb2e:	45 85 d2             	test   r10d,r10d
   2cb31:	0f 84 65 01 00 00    	je     2cc9c <JS_GetPropertyInternalIC+0x29c>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3666
   2cb37:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2cb3c:	48 8d 74 24 60       	lea    rsi,[rsp+0x60]
   2cb41:	89 da                	mov    edx,ebx
   2cb43:	e8 48 a8 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7929 (discriminator 1)
   2cb48:	48 8d 35 79 0a 0a 00 	lea    rsi,[rip+0xa0a79]        # cd5c8 <_IO_stdin_used+0x5c8>
   2cb4f:	4c 89 e7             	mov    rdi,r12
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3666
   2cb52:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7929 (discriminator 1)
   2cb55:	31 c0                	xor    eax,eax
   2cb57:	e8 b4 5c 00 00       	call   32810 <JS_ThrowReferenceError>
   2cb5c:	48 89 c1             	mov    rcx,rax
   2cb5f:	48 89 c8             	mov    rax,rcx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7929
   2cb62:	e9 58 ff ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
   2cb67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2cb6e:	00 00 
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:711
   2cb70:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8401
   2cb74:	e9 46 ff ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
   2cb79:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8400
   2cb80:	48 89 e9             	mov    rcx,rbp
   2cb83:	89 da                	mov    edx,ebx
   2cb85:	4c 89 f6             	mov    rsi,r14
   2cb88:	4c 89 e7             	mov    rdi,r12
   2cb8b:	4c 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],r11
   2cb90:	e8 0b 0a ff ff       	call   1d5a0 <add_ic_slot>
   2cb95:	4c 8b 5c 24 08       	mov    r11,QWORD PTR [rsp+0x8]
   2cb9a:	e9 10 ff ff ff       	jmp    2caaf <JS_GetPropertyInternalIC+0xaf>
   2cb9f:	90                   	nop
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8406
   2cba0:	a8 10                	test   al,0x10
   2cba2:	0f 85 48 01 00 00    	jne    2ccf0 <JS_GetPropertyInternalIC+0x2f0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8427
   2cba8:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
   2cbad:	0f b7 45 12          	movzx  eax,WORD PTR [rbp+0x12]
   2cbb1:	48 8b b9 58 04 00 00 	mov    rdi,QWORD PTR [rcx+0x458]
   2cbb8:	48 8d 04 80          	lea    rax,[rax+rax*4]
   2cbbc:	48 8d 04 c7          	lea    rax,[rdi+rax*8]
   2cbc0:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8428
   2cbc4:	48 85 c9             	test   rcx,rcx
   2cbc7:	0f 84 50 ff ff ff    	je     2cb1d <JS_GetPropertyInternalIC+0x11d>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8429
   2cbcd:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
   2cbd1:	48 85 c0             	test   rax,rax
   2cbd4:	0f 85 a7 03 00 00    	jne    2cf81 <JS_GetPropertyInternalIC+0x581>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8439
   2cbda:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   2cbdd:	48 85 c0             	test   rax,rax
   2cbe0:	0f 84 37 ff ff ff    	je     2cb1d <JS_GetPropertyInternalIC+0x11d>
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:711
   2cbe6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8447
   2cbea:	48 89 ea             	mov    rdx,rbp
   2cbed:	4c 89 e7             	mov    rdi,r12
   2cbf0:	41 89 d8             	mov    r8d,ebx
   2cbf3:	4c 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],r9
   2cbf8:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
   2cbfd:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   2cc04:	44 89 54 24 08       	mov    DWORD PTR [rsp+0x8],r10d
   2cc09:	ff d0                	call   rax
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:691
   2cc0b:	8b 7d fc             	mov    edi,DWORD PTR [rbp-0x4]
   2cc0e:	44 8b 54 24 08       	mov    r10d,DWORD PTR [rsp+0x8]
   2cc13:	4c 8b 4c 24 10       	mov    r9,QWORD PTR [rsp+0x10]
   2cc18:	8d 57 ff             	lea    edx,[rdi-0x1]
   2cc1b:	85 d2                	test   edx,edx
   2cc1d:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   2cc20:	0f 8e 07 03 00 00    	jle    2cf2d <JS_GetPropertyInternalIC+0x52d>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8449
   2cc26:	85 c0                	test   eax,eax
   2cc28:	0f 88 41 01 00 00    	js     2cd6f <JS_GetPropertyInternalIC+0x36f>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8451
   2cc2e:	0f 85 33 03 00 00    	jne    2cf67 <JS_GetPropertyInternalIC+0x567>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8464
   2cc34:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   2cc38:	e9 e0 fe ff ff       	jmp    2cb1d <JS_GetPropertyInternalIC+0x11d>
   2cc3d:	0f 1f 00             	nop    DWORD PTR [rax]
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6252
   2cc40:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6243
   2cc43:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   2cc4a:	0f 85 28 fe ff ff    	jne    2ca78 <JS_GetPropertyInternalIC+0x78>
   2cc50:	e9 bc fe ff ff       	jmp    2cb11 <JS_GetPropertyInternalIC+0x111>
   2cc55:	0f 1f 00             	nop    DWORD PTR [rax]
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8327
   2cc58:	83 fe 06             	cmp    esi,0x6
   2cc5b:	0f 84 0e 01 00 00    	je     2cd6f <JS_GetPropertyInternalIC+0x36f>
   2cc61:	76 4d                	jbe    2ccb0 <JS_GetPropertyInternalIC+0x2b0>
   2cc63:	83 fe f9             	cmp    esi,0xfffffff9
   2cc66:	0f 84 14 01 00 00    	je     2cd80 <JS_GetPropertyInternalIC+0x380>
   2cc6c:	83 fe fa             	cmp    esi,0xfffffffa
   2cc6f:	75 17                	jne    2cc88 <JS_GetPropertyInternalIC+0x288>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8351 (discriminator 1)
   2cc71:	85 c9                	test   ecx,ecx
   2cc73:	0f 88 77 01 00 00    	js     2cdf0 <JS_GetPropertyInternalIC+0x3f0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8357
   2cc79:	83 f9 32             	cmp    ecx,0x32
   2cc7c:	0f 84 d3 01 00 00    	je     2ce55 <JS_GetPropertyInternalIC+0x455>
   2cc82:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8366
   2cc88:	4c 89 e7             	mov    rdi,r12
   2cc8b:	e8 a0 af fe ff       	call   17c30 <JS_GetPrototypePrimitive.isra.0>
   2cc90:	48 89 c5             	mov    rbp,rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8367
   2cc93:	48 85 c0             	test   rax,rax
   2cc96:	0f 85 b8 fd ff ff    	jne    2ca54 <JS_GetPropertyInternalIC+0x54>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8368
   2cc9c:	31 c0                	xor    eax,eax
   2cc9e:	ba 03 00 00 00       	mov    edx,0x3
   2cca3:	e9 17 fe ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
   2cca8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2ccaf:	00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8327
   2ccb0:	83 fe 02             	cmp    esi,0x2
   2ccb3:	0f 84 e7 00 00 00    	je     2cda0 <JS_GetPropertyInternalIC+0x3a0>
   2ccb9:	83 fe 03             	cmp    esi,0x3
   2ccbc:	75 ca                	jne    2cc88 <JS_GetPropertyInternalIC+0x288>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3666
   2ccbe:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2ccc3:	48 8d 74 24 60       	lea    rsi,[rsp+0x60]
   2ccc8:	89 ca                	mov    edx,ecx
   2ccca:	e8 c1 a6 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7823 (discriminator 1)
   2cccf:	48 8d 35 ca 41 0a 00 	lea    rsi,[rip+0xa41ca]        # d0ea0 <_IO_stdin_used+0x3ea0>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3666
   2ccd6:	48 89 c2             	mov    rdx,rax
__JS_ThrowTypeErrorAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7823 (discriminator 1)
   2ccd9:	4c 89 e7             	mov    rdi,r12
   2ccdc:	31 c0                	xor    eax,eax
   2ccde:	e8 0d 3d 00 00       	call   309f0 <JS_ThrowTypeError>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7823
   2cce3:	e9 d7 fd ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
   2cce8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2ccef:	00 
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8407 (discriminator 1)
   2ccf0:	85 db                	test   ebx,ebx
   2ccf2:	0f 88 c8 00 00 00    	js     2cdc0 <JS_GetPropertyInternalIC+0x3c0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8416
   2ccf8:	0f b7 45 12          	movzx  eax,WORD PTR [rbp+0x12]
   2ccfc:	83 e8 15             	sub    eax,0x15
   2ccff:	66 83 f8 0b          	cmp    ax,0xb
   2cd03:	0f 87 14 fe ff ff    	ja     2cb1d <JS_GetPropertyInternalIC+0x11d>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8419
   2cd09:	89 de                	mov    esi,ebx
   2cd0b:	4c 89 e7             	mov    rdi,r12
   2cd0e:	4c 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],r9
   2cd13:	44 89 54 24 08       	mov    DWORD PTR [rsp+0x8],r10d
   2cd18:	e8 c3 30 02 00       	call   4fde0 <JS_AtomIsNumericIndex>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8420
   2cd1d:	85 c0                	test   eax,eax
   2cd1f:	0f 85 c7 02 00 00    	jne    2cfec <JS_GetPropertyInternalIC+0x5ec>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8464
   2cd25:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   2cd29:	44 8b 54 24 08       	mov    r10d,DWORD PTR [rsp+0x8]
   2cd2e:	4c 8b 4c 24 10       	mov    r9,QWORD PTR [rsp+0x10]
   2cd33:	e9 e5 fd ff ff       	jmp    2cb1d <JS_GetPropertyInternalIC+0x11d>
   2cd38:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2cd3f:	00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8394
   2cd40:	49 89 c0             	mov    r8,rax
   2cd43:	4c 89 d9             	mov    rcx,r11
   2cd46:	89 da                	mov    edx,ebx
   2cd48:	48 89 ee             	mov    rsi,rbp
   2cd4b:	4c 89 e7             	mov    rdi,r12
   2cd4e:	4c 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],r9
   2cd53:	44 89 54 24 08       	mov    DWORD PTR [rsp+0x8],r10d
   2cd58:	e8 23 de 00 00       	call   3ab80 <JS_AutoInitProperty>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8394 (discriminator 1)
   2cd5d:	44 8b 54 24 08       	mov    r10d,DWORD PTR [rsp+0x8]
   2cd62:	4c 8b 4c 24 10       	mov    r9,QWORD PTR [rsp+0x10]
   2cd67:	85 c0                	test   eax,eax
   2cd69:	0f 84 e8 fc ff ff    	je     2ca57 <JS_GetPropertyInternalIC+0x57>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8450
   2cd6f:	31 c0                	xor    eax,eax
   2cd71:	ba 06 00 00 00       	mov    edx,0x6
   2cd76:	e9 44 fd ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
   2cd7b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8337 (discriminator 1)
   2cd80:	85 c9                	test   ecx,ecx
   2cd82:	0f 88 a5 00 00 00    	js     2ce2d <JS_GetPropertyInternalIC+0x42d>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8343
   2cd88:	83 f9 32             	cmp    ecx,0x32
   2cd8b:	0f 85 f7 fe ff ff    	jne    2cc88 <JS_GetPropertyInternalIC+0x288>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8344
   2cd91:	8b 07                	mov    eax,DWORD PTR [rdi]
   2cd93:	31 d2                	xor    edx,edx
JS_NewInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:562
   2cd95:	25 ff ff ff 7f       	and    eax,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8344
   2cd9a:	e9 20 fd ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
   2cd9f:	90                   	nop
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3666
   2cda0:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2cda5:	48 8d 74 24 60       	lea    rsi,[rsp+0x60]
   2cdaa:	89 ca                	mov    edx,ecx
   2cdac:	e8 df a5 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7823 (discriminator 1)
   2cdb1:	48 8d 35 c0 40 0a 00 	lea    rsi,[rip+0xa40c0]        # d0e78 <_IO_stdin_used+0x3e78>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3666
   2cdb8:	48 89 c2             	mov    rdx,rax
   2cdbb:	e9 19 ff ff ff       	jmp    2ccd9 <JS_GetPropertyInternalIC+0x2d9>
__JS_AtomToUInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:2972
   2cdc0:	89 d9                	mov    ecx,ebx
   2cdc2:	81 e1 ff ff ff 7f    	and    ecx,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8409
   2cdc8:	3b 4d 38             	cmp    ecx,DWORD PTR [rbp+0x38]
   2cdcb:	0f 82 e8 01 00 00    	jb     2cfb9 <JS_GetPropertyInternalIC+0x5b9>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8412
   2cdd1:	0f b7 45 12          	movzx  eax,WORD PTR [rbp+0x12]
   2cdd5:	83 e8 15             	sub    eax,0x15
   2cdd8:	66 83 f8 0b          	cmp    ax,0xb
   2cddc:	0f 87 3b fd ff ff    	ja     2cb1d <JS_GetPropertyInternalIC+0x11d>
   2cde2:	e9 b5 fe ff ff       	jmp    2cc9c <JS_GetPropertyInternalIC+0x29c>
   2cde7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2cdee:	00 00 
__JS_AtomToUInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:2972
   2cdf0:	89 ca                	mov    edx,ecx
   2cdf2:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8354
   2cdf8:	3b 17                	cmp    edx,DWORD PTR [rdi]
   2cdfa:	0f 83 88 fe ff ff    	jae    2cc88 <JS_GetPropertyInternalIC+0x288>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8355
   2ce00:	e8 0b 67 fe ff       	call   13510 <string_rope_get>
js_new_string_char():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4029
   2ce05:	66 3d ff 00          	cmp    ax,0xff
   2ce09:	0f 87 ff 00 00 00    	ja     2cf0e <JS_GetPropertyInternalIC+0x50e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4031
   2ce0f:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
   2ce14:	ba 01 00 00 00       	mov    edx,0x1
   2ce19:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4030
   2ce1c:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4031
   2ce20:	e8 9b 67 00 00       	call   335c0 <js_new_string8_len>
   2ce25:	48 89 c1             	mov    rcx,rax
   2ce28:	e9 32 fd ff ff       	jmp    2cb5f <JS_GetPropertyInternalIC+0x15f>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8340
   2ce2d:	8b 07                	mov    eax,DWORD PTR [rdi]
__JS_AtomToUInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:2972
   2ce2f:	89 ca                	mov    edx,ecx
   2ce31:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8340
   2ce37:	25 ff ff ff 7f       	and    eax,0x7fffffff
   2ce3c:	39 c2                	cmp    edx,eax
   2ce3e:	0f 83 44 fe ff ff    	jae    2cc88 <JS_GetPropertyInternalIC+0x288>
string_get():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:2036
   2ce44:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
   2ce48:	0f 88 b1 00 00 00    	js     2ceff <JS_GetPropertyInternalIC+0x4ff>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:2036 (discriminator 2)
   2ce4e:	0f b6 44 17 0c       	movzx  eax,BYTE PTR [rdi+rdx*1+0xc]
js_new_string_char():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4030
   2ce53:	eb ba                	jmp    2ce0f <JS_GetPropertyInternalIC+0x40f>
JS_NewInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:562
   2ce55:	8b 07                	mov    eax,DWORD PTR [rdi]
   2ce57:	31 d2                	xor    edx,edx
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8358
   2ce59:	e9 61 fc ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8379
   2ce5e:	49 8b 33             	mov    rsi,QWORD PTR [r11]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8379 (discriminator 1)
   2ce61:	48 85 f6             	test   rsi,rsi
   2ce64:	0f 84 32 fe ff ff    	je     2cc9c <JS_GetPropertyInternalIC+0x29c>
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:711
   2ce6a:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8385
   2ce6e:	48 8b 84 24 a8 00 00 	mov    rax,QWORD PTR [rsp+0xa8]
   2ce75:	00 
   2ce76:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
   2ce7d:	00 00 
   2ce7f:	0f 85 dd 00 00 00    	jne    2cf62 <JS_GetPropertyInternalIC+0x562>
   2ce85:	4c 89 c9             	mov    rcx,r9
   2ce88:	4d 89 f8             	mov    r8,r15
   2ce8b:	4c 89 e7             	mov    rdi,r12
   2ce8e:	45 31 c9             	xor    r9d,r9d
   2ce91:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
   2ce98:	00 00 00 00 00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2ce9d:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8385
   2cea4:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2ceab:	5b                   	pop    rbx
   2ceac:	5d                   	pop    rbp
   2cead:	41 5c                	pop    r12
   2ceaf:	41 5d                	pop    r13
   2ceb1:	41 5e                	pop    r14
   2ceb3:	41 5f                	pop    r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8385
   2ceb5:	e9 d6 fa ff ff       	jmp    2c990 <JS_CallFree>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8388
   2ceba:	49 8b 03             	mov    rax,QWORD PTR [r11]
   2cebd:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   2cec1:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   2cec4:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8389 (discriminator 2)
   2cec8:	83 fa 04             	cmp    edx,0x4
   2cecb:	0f 85 e5 fb ff ff    	jne    2cab6 <JS_GetPropertyInternalIC+0xb6>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8390
   2ced1:	48 8b 84 24 a8 00 00 	mov    rax,QWORD PTR [rsp+0xa8]
   2ced8:	00 
   2ced9:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
   2cee0:	00 00 
   2cee2:	75 7e                	jne    2cf62 <JS_GetPropertyInternalIC+0x562>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2cee4:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8390
   2ceeb:	89 de                	mov    esi,ebx
   2ceed:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2cef0:	5b                   	pop    rbx
   2cef1:	5d                   	pop    rbp
   2cef2:	41 5c                	pop    r12
   2cef4:	41 5d                	pop    r13
   2cef6:	41 5e                	pop    r14
   2cef8:	41 5f                	pop    r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8390
   2cefa:	e9 d1 59 00 00       	jmp    328d0 <JS_ThrowReferenceErrorUninitialized>
string_get():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:2036 (discriminator 1)
   2ceff:	0f b7 44 57 0c       	movzx  eax,WORD PTR [rdi+rdx*2+0xc]
js_new_string_char():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4029
   2cf04:	66 3d ff 00          	cmp    ax,0xff
   2cf08:	0f 86 01 ff ff ff    	jbe    2ce0f <JS_GetPropertyInternalIC+0x40f>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4034
   2cf0e:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
   2cf13:	ba 01 00 00 00       	mov    edx,0x1
   2cf18:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4033
   2cf1b:	66 89 44 24 20       	mov    WORD PTR [rsp+0x20],ax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:4034
   2cf20:	e8 1b 72 00 00       	call   34140 <js_new_string16_len>
   2cf25:	48 89 c1             	mov    rcx,rax
   2cf28:	e9 32 fc ff ff       	jmp    2cb5f <JS_GetPropertyInternalIC+0x15f>
__JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6604
   2cf2d:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2cf32:	48 89 ee             	mov    rsi,rbp
   2cf35:	4c 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],r9
   2cf3a:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
   2cf41:	44 89 54 24 10       	mov    DWORD PTR [rsp+0x10],r10d
   2cf46:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
   2cf4a:	e8 f1 ee fe ff       	call   1be40 <__JS_FreeValueRT>
   2cf4f:	4c 8b 4c 24 18       	mov    r9,QWORD PTR [rsp+0x18]
   2cf54:	44 8b 54 24 10       	mov    r10d,DWORD PTR [rsp+0x10]
   2cf59:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
   2cf5d:	e9 c4 fc ff ff       	jmp    2cc26 <JS_GetPropertyInternalIC+0x226>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2cf62:	e8 69 4a fe ff       	call   119d0 <__stack_chk_fail@plt>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8452
   2cf67:	f6 44 24 20 10       	test   BYTE PTR [rsp+0x20],0x10
   2cf6c:	0f 85 85 00 00 00    	jne    2cff7 <JS_GetPropertyInternalIC+0x5f7>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8456
   2cf72:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   2cf77:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
   2cf7c:	e9 3e fb ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8435
   2cf81:	4d 89 c8             	mov    r8,r9
   2cf84:	89 d9                	mov    ecx,ebx
   2cf86:	4d 89 f9             	mov    r9,r15
   2cf89:	48 89 ee             	mov    rsi,rbp
   2cf8c:	4c 89 e7             	mov    rdi,r12
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:711
   2cf8f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8435
   2cf93:	48 83 ca ff          	or     rdx,0xffffffffffffffff
   2cf97:	ff d0                	call   rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8436
   2cf99:	48 89 ee             	mov    rsi,rbp
   2cf9c:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8435
   2cf9f:	48 89 c3             	mov    rbx,rax
   2cfa2:	49 89 d5             	mov    r13,rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8436
   2cfa5:	48 83 ca ff          	or     rdx,0xffffffffffffffff
   2cfa9:	e8 f2 ef fe ff       	call   1bfa0 <JS_FreeValue>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8437
   2cfae:	48 89 d8             	mov    rax,rbx
   2cfb1:	4c 89 ea             	mov    rdx,r13
   2cfb4:	e9 06 fb ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8411
   2cfb9:	48 8b 84 24 a8 00 00 	mov    rax,QWORD PTR [rsp+0xa8]
   2cfc0:	00 
   2cfc1:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
   2cfc8:	00 00 
   2cfca:	75 96                	jne    2cf62 <JS_GetPropertyInternalIC+0x562>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2cfcc:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8411
   2cfd3:	48 89 ee             	mov    rsi,rbp
   2cfd6:	4c 89 e7             	mov    rdi,r12
   2cfd9:	48 83 ca ff          	or     rdx,0xffffffffffffffff
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8473
   2cfdd:	5b                   	pop    rbx
   2cfde:	5d                   	pop    rbp
   2cfdf:	41 5c                	pop    r12
   2cfe1:	41 5d                	pop    r13
   2cfe3:	41 5e                	pop    r14
   2cfe5:	41 5f                	pop    r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8411
   2cfe7:	e9 04 06 00 00       	jmp    2d5f0 <JS_GetPropertyUint32>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8421
   2cfec:	0f 89 aa fc ff ff    	jns    2cc9c <JS_GetPropertyInternalIC+0x29c>
   2cff2:	e9 78 fd ff ff       	jmp    2cd6f <JS_GetPropertyInternalIC+0x36f>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8453
   2cff7:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   2cffc:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   2d001:	4c 89 e7             	mov    rdi,r12
   2d004:	4c 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],r9
   2d009:	e8 92 ef fe ff       	call   1bfa0 <JS_FreeValue>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8454
   2d00e:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
   2d013:	4d 89 f8             	mov    r8,r15
   2d016:	45 31 c9             	xor    r9d,r9d
   2d019:	50                   	push   rax
   2d01a:	4c 89 e7             	mov    rdi,r12
   2d01d:	6a 00                	push   0x0
   2d01f:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   2d024:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   2d029:	e8 62 f9 ff ff       	call   2c990 <JS_CallFree>
   2d02e:	59                   	pop    rcx
   2d02f:	5e                   	pop    rsi
   2d030:	e9 8a fa ff ff       	jmp    2cabf <JS_GetPropertyInternalIC+0xbf>

Disassembly of section .fini:
