
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

000000000002caf0 <JS_GetPropertyInternalIC>:
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8319
   2caf0:	41 57                	push   r15
   2caf2:	41 56                	push   r14
   2caf4:	41 55                	push   r13
   2caf6:	41 54                	push   r12
   2caf8:	49 89 fc             	mov    r12,rdi
   2cafb:	48 89 f7             	mov    rdi,rsi
   2cafe:	48 89 d6             	mov    rsi,rdx
   2cb01:	55                   	push   rbp
   2cb02:	4c 89 ca             	mov    rdx,r9
   2cb05:	48 89 fd             	mov    rbp,rdi
   2cb08:	4d 89 c1             	mov    r9,r8
   2cb0b:	53                   	push   rbx
   2cb0c:	49 89 d7             	mov    r15,rdx
   2cb0f:	89 cb                	mov    ebx,ecx
   2cb11:	48 81 ec b8 00 00 00 	sub    rsp,0xb8
   2cb18:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
   2cb1f:	00 00 
   2cb21:	48 89 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],rax
   2cb28:	00 
   2cb29:	31 c0                	xor    eax,eax
   2cb2b:	44 8b 94 24 f0 00 00 	mov    r10d,DWORD PTR [rsp+0xf0]
   2cb32:	00 
   2cb33:	4c 8b b4 24 f8 00 00 	mov    r14,QWORD PTR [rsp+0xf8]
   2cb3a:	00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8326 (discriminator 1)
   2cb3b:	83 fe ff             	cmp    esi,0xffffffff
   2cb3e:	0f 85 04 02 00 00    	jne    2cd48 <JS_GetPropertyInternalIC+0x258>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8319
   2cb44:	45 31 ed             	xor    r13d,r13d
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6239
   2cb47:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6240
   2cb4b:	89 d9                	mov    ecx,ebx
   2cb4d:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   2cb50:	21 c1                	and    ecx,eax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6241
   2cb52:	44 8b 44 8a 38       	mov    r8d,DWORD PTR [rdx+rcx*4+0x38]
get_shape_prop():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:5203
   2cb57:	48 8d 0c 85 3c 00 00 	lea    rcx,[rax*4+0x3c]
   2cb5e:	00 
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6243
   2cb5f:	4d 85 c0             	test   r8,r8
   2cb62:	0f 84 99 00 00 00    	je     2cc01 <JS_GetPropertyInternalIC+0x111>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6244
   2cb68:	49 83 e8 01          	sub    r8,0x1
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6245
   2cb6c:	4a 8d 04 c1          	lea    rax,[rcx+r8*8]
   2cb70:	48 01 d0             	add    rax,rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6246 (discriminator 1)
   2cb73:	3b 58 04             	cmp    ebx,DWORD PTR [rax+0x4]
   2cb76:	0f 85 b4 01 00 00    	jne    2cd30 <JS_GetPropertyInternalIC+0x240>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8377
   2cb7c:	0f b6 48 03          	movzx  ecx,BYTE PTR [rax+0x3]
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6247
   2cb80:	4d 89 c3             	mov    r11,r8
   2cb83:	49 c1 e3 04          	shl    r11,0x4
   2cb87:	4c 03 5d 20          	add    r11,QWORD PTR [rbp+0x20]
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8377
   2cb8b:	89 ce                	mov    esi,ecx
   2cb8d:	40 c0 ee 02          	shr    sil,0x2
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8377 (discriminator 1)
   2cb91:	80 f9 3f             	cmp    cl,0x3f
   2cb94:	77 4a                	ja     2cbe0 <JS_GetPropertyInternalIC+0xf0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8399
   2cb96:	45 85 ed             	test   r13d,r13d
   2cb99:	0f 84 d1 00 00 00    	je     2cc70 <JS_GetPropertyInternalIC+0x180>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8401
   2cb9f:	49 8b 03             	mov    rax,QWORD PTR [r11]
   2cba2:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:709
   2cba6:	83 fa f6             	cmp    edx,0xfffffff6
   2cba9:	0f 87 b1 00 00 00    	ja     2cc60 <JS_GetPropertyInternalIC+0x170>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2cbaf:	48 8b 8c 24 a8 00 00 	mov    rcx,QWORD PTR [rsp+0xa8]
   2cbb6:	00 
   2cbb7:	64 48 2b 0c 25 28 00 	sub    rcx,QWORD PTR fs:0x28
   2cbbe:	00 00 
   2cbc0:	0f 85 8c 04 00 00    	jne    2d052 <JS_GetPropertyInternalIC+0x562>
   2cbc6:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
   2cbcd:	5b                   	pop    rbx
   2cbce:	5d                   	pop    rbp
   2cbcf:	41 5c                	pop    r12
   2cbd1:	41 5d                	pop    r13
   2cbd3:	41 5e                	pop    r14
   2cbd5:	41 5f                	pop    r15
   2cbd7:	c3                   	ret
   2cbd8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2cbdf:	00 
   2cbe0:	83 e6 30             	and    esi,0x30
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8378
   2cbe3:	40 80 fe 10          	cmp    sil,0x10
   2cbe7:	0f 84 61 03 00 00    	je     2cf4e <JS_GetPropertyInternalIC+0x45e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8387
   2cbed:	40 80 fe 20          	cmp    sil,0x20
   2cbf1:	0f 84 b3 03 00 00    	je     2cfaa <JS_GetPropertyInternalIC+0x4ba>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8392
   2cbf7:	40 80 fe 30          	cmp    sil,0x30
   2cbfb:	0f 84 2f 02 00 00    	je     2ce30 <JS_GetPropertyInternalIC+0x340>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8404
   2cc01:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8404 (discriminator 1)
   2cc05:	a8 08                	test   al,0x8
   2cc07:	0f 85 83 00 00 00    	jne    2cc90 <JS_GetPropertyInternalIC+0x1a0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8464
   2cc0d:	48 8b 6a 30          	mov    rbp,QWORD PTR [rdx+0x30]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8463
   2cc11:	41 83 c5 01          	add    r13d,0x1
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8465
   2cc15:	48 85 ed             	test   rbp,rbp
   2cc18:	0f 85 29 ff ff ff    	jne    2cb47 <JS_GetPropertyInternalIC+0x57>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8468 (discriminator 1)
   2cc1e:	45 85 d2             	test   r10d,r10d
   2cc21:	0f 84 65 01 00 00    	je     2cd8c <JS_GetPropertyInternalIC+0x29c>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:3666
   2cc27:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2cc2c:	48 8d 74 24 60       	lea    rsi,[rsp+0x60]
   2cc31:	89 da                	mov    edx,ebx
   2cc33:	e8 58 a7 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7929 (discriminator 1)
   2cc38:	48 8d 35 89 09 0a 00 	lea    rsi,[rip+0xa0989]        # cd5c8 <_IO_stdin_used+0x5c8>
   2cc3f:	4c 89 e7             	mov    rdi,r12
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:3666
   2cc42:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7929 (discriminator 1)
   2cc45:	31 c0                	xor    eax,eax
   2cc47:	e8 14 5c 00 00       	call   32860 <JS_ThrowReferenceError>
   2cc4c:	48 89 c1             	mov    rcx,rax
   2cc4f:	48 89 c8             	mov    rax,rcx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7929
   2cc52:	e9 58 ff ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
   2cc57:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2cc5e:	00 00 
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:711
   2cc60:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8401
   2cc64:	e9 46 ff ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
   2cc69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8400
   2cc70:	48 89 e9             	mov    rcx,rbp
   2cc73:	89 da                	mov    edx,ebx
   2cc75:	4c 89 f6             	mov    rsi,r14
   2cc78:	4c 89 e7             	mov    rdi,r12
   2cc7b:	4c 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],r11
   2cc80:	e8 1b 09 ff ff       	call   1d5a0 <add_ic_slot>
   2cc85:	4c 8b 5c 24 08       	mov    r11,QWORD PTR [rsp+0x8]
   2cc8a:	e9 10 ff ff ff       	jmp    2cb9f <JS_GetPropertyInternalIC+0xaf>
   2cc8f:	90                   	nop
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8406
   2cc90:	a8 10                	test   al,0x10
   2cc92:	0f 85 48 01 00 00    	jne    2cde0 <JS_GetPropertyInternalIC+0x2f0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8427
   2cc98:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
   2cc9d:	0f b7 45 12          	movzx  eax,WORD PTR [rbp+0x12]
   2cca1:	48 8b b9 58 04 00 00 	mov    rdi,QWORD PTR [rcx+0x458]
   2cca8:	48 8d 04 80          	lea    rax,[rax+rax*4]
   2ccac:	48 8d 04 c7          	lea    rax,[rdi+rax*8]
   2ccb0:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8428
   2ccb4:	48 85 c9             	test   rcx,rcx
   2ccb7:	0f 84 50 ff ff ff    	je     2cc0d <JS_GetPropertyInternalIC+0x11d>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8429
   2ccbd:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
   2ccc1:	48 85 c0             	test   rax,rax
   2ccc4:	0f 85 a7 03 00 00    	jne    2d071 <JS_GetPropertyInternalIC+0x581>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8439
   2ccca:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   2cccd:	48 85 c0             	test   rax,rax
   2ccd0:	0f 84 37 ff ff ff    	je     2cc0d <JS_GetPropertyInternalIC+0x11d>
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:711
   2ccd6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8447
   2ccda:	48 89 ea             	mov    rdx,rbp
   2ccdd:	4c 89 e7             	mov    rdi,r12
   2cce0:	41 89 d8             	mov    r8d,ebx
   2cce3:	4c 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],r9
   2cce8:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
   2cced:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   2ccf4:	44 89 54 24 08       	mov    DWORD PTR [rsp+0x8],r10d
   2ccf9:	ff d0                	call   rax
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:691
   2ccfb:	8b 7d fc             	mov    edi,DWORD PTR [rbp-0x4]
   2ccfe:	44 8b 54 24 08       	mov    r10d,DWORD PTR [rsp+0x8]
   2cd03:	4c 8b 4c 24 10       	mov    r9,QWORD PTR [rsp+0x10]
   2cd08:	8d 57 ff             	lea    edx,[rdi-0x1]
   2cd0b:	85 d2                	test   edx,edx
   2cd0d:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   2cd10:	0f 8e 07 03 00 00    	jle    2d01d <JS_GetPropertyInternalIC+0x52d>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8449
   2cd16:	85 c0                	test   eax,eax
   2cd18:	0f 88 41 01 00 00    	js     2ce5f <JS_GetPropertyInternalIC+0x36f>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8451
   2cd1e:	0f 85 33 03 00 00    	jne    2d057 <JS_GetPropertyInternalIC+0x567>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8464
   2cd24:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   2cd28:	e9 e0 fe ff ff       	jmp    2cc0d <JS_GetPropertyInternalIC+0x11d>
   2cd2d:	0f 1f 00             	nop    DWORD PTR [rax]
find_own_property_ic():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6252
   2cd30:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6243
   2cd33:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   2cd3a:	0f 85 28 fe ff ff    	jne    2cb68 <JS_GetPropertyInternalIC+0x78>
   2cd40:	e9 bc fe ff ff       	jmp    2cc01 <JS_GetPropertyInternalIC+0x111>
   2cd45:	0f 1f 00             	nop    DWORD PTR [rax]
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8327
   2cd48:	83 fe 06             	cmp    esi,0x6
   2cd4b:	0f 84 0e 01 00 00    	je     2ce5f <JS_GetPropertyInternalIC+0x36f>
   2cd51:	76 4d                	jbe    2cda0 <JS_GetPropertyInternalIC+0x2b0>
   2cd53:	83 fe f9             	cmp    esi,0xfffffff9
   2cd56:	0f 84 14 01 00 00    	je     2ce70 <JS_GetPropertyInternalIC+0x380>
   2cd5c:	83 fe fa             	cmp    esi,0xfffffffa
   2cd5f:	75 17                	jne    2cd78 <JS_GetPropertyInternalIC+0x288>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8351 (discriminator 1)
   2cd61:	85 c9                	test   ecx,ecx
   2cd63:	0f 88 77 01 00 00    	js     2cee0 <JS_GetPropertyInternalIC+0x3f0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8357
   2cd69:	83 f9 32             	cmp    ecx,0x32
   2cd6c:	0f 84 d3 01 00 00    	je     2cf45 <JS_GetPropertyInternalIC+0x455>
   2cd72:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8366
   2cd78:	4c 89 e7             	mov    rdi,r12
   2cd7b:	e8 b0 ae fe ff       	call   17c30 <JS_GetPrototypePrimitive.isra.0>
   2cd80:	48 89 c5             	mov    rbp,rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8367
   2cd83:	48 85 c0             	test   rax,rax
   2cd86:	0f 85 b8 fd ff ff    	jne    2cb44 <JS_GetPropertyInternalIC+0x54>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8368
   2cd8c:	31 c0                	xor    eax,eax
   2cd8e:	ba 03 00 00 00       	mov    edx,0x3
   2cd93:	e9 17 fe ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
   2cd98:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2cd9f:	00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8327
   2cda0:	83 fe 02             	cmp    esi,0x2
   2cda3:	0f 84 e7 00 00 00    	je     2ce90 <JS_GetPropertyInternalIC+0x3a0>
   2cda9:	83 fe 03             	cmp    esi,0x3
   2cdac:	75 ca                	jne    2cd78 <JS_GetPropertyInternalIC+0x288>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:3666
   2cdae:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2cdb3:	48 8d 74 24 60       	lea    rsi,[rsp+0x60]
   2cdb8:	89 ca                	mov    edx,ecx
   2cdba:	e8 d1 a5 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7823 (discriminator 1)
   2cdbf:	48 8d 35 da 40 0a 00 	lea    rsi,[rip+0xa40da]        # d0ea0 <_IO_stdin_used+0x3ea0>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:3666
   2cdc6:	48 89 c2             	mov    rdx,rax
__JS_ThrowTypeErrorAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7823 (discriminator 1)
   2cdc9:	4c 89 e7             	mov    rdi,r12
   2cdcc:	31 c0                	xor    eax,eax
   2cdce:	e8 6d 3c 00 00       	call   30a40 <JS_ThrowTypeError>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7823
   2cdd3:	e9 d7 fd ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
   2cdd8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2cddf:	00 
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8407 (discriminator 1)
   2cde0:	85 db                	test   ebx,ebx
   2cde2:	0f 88 c8 00 00 00    	js     2ceb0 <JS_GetPropertyInternalIC+0x3c0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8416
   2cde8:	0f b7 45 12          	movzx  eax,WORD PTR [rbp+0x12]
   2cdec:	83 e8 15             	sub    eax,0x15
   2cdef:	66 83 f8 0b          	cmp    ax,0xb
   2cdf3:	0f 87 14 fe ff ff    	ja     2cc0d <JS_GetPropertyInternalIC+0x11d>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8419
   2cdf9:	89 de                	mov    esi,ebx
   2cdfb:	4c 89 e7             	mov    rdi,r12
   2cdfe:	4c 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],r9
   2ce03:	44 89 54 24 08       	mov    DWORD PTR [rsp+0x8],r10d
   2ce08:	e8 23 30 02 00       	call   4fe30 <JS_AtomIsNumericIndex>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8420
   2ce0d:	85 c0                	test   eax,eax
   2ce0f:	0f 85 c7 02 00 00    	jne    2d0dc <JS_GetPropertyInternalIC+0x5ec>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8464
   2ce15:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   2ce19:	44 8b 54 24 08       	mov    r10d,DWORD PTR [rsp+0x8]
   2ce1e:	4c 8b 4c 24 10       	mov    r9,QWORD PTR [rsp+0x10]
   2ce23:	e9 e5 fd ff ff       	jmp    2cc0d <JS_GetPropertyInternalIC+0x11d>
   2ce28:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2ce2f:	00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8394
   2ce30:	49 89 c0             	mov    r8,rax
   2ce33:	4c 89 d9             	mov    rcx,r11
   2ce36:	89 da                	mov    edx,ebx
   2ce38:	48 89 ee             	mov    rsi,rbp
   2ce3b:	4c 89 e7             	mov    rdi,r12
   2ce3e:	4c 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],r9
   2ce43:	44 89 54 24 08       	mov    DWORD PTR [rsp+0x8],r10d
   2ce48:	e8 83 dd 00 00       	call   3abd0 <JS_AutoInitProperty>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8394 (discriminator 1)
   2ce4d:	44 8b 54 24 08       	mov    r10d,DWORD PTR [rsp+0x8]
   2ce52:	4c 8b 4c 24 10       	mov    r9,QWORD PTR [rsp+0x10]
   2ce57:	85 c0                	test   eax,eax
   2ce59:	0f 84 e8 fc ff ff    	je     2cb47 <JS_GetPropertyInternalIC+0x57>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8450
   2ce5f:	31 c0                	xor    eax,eax
   2ce61:	ba 06 00 00 00       	mov    edx,0x6
   2ce66:	e9 44 fd ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
   2ce6b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8337 (discriminator 1)
   2ce70:	85 c9                	test   ecx,ecx
   2ce72:	0f 88 a5 00 00 00    	js     2cf1d <JS_GetPropertyInternalIC+0x42d>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8343
   2ce78:	83 f9 32             	cmp    ecx,0x32
   2ce7b:	0f 85 f7 fe ff ff    	jne    2cd78 <JS_GetPropertyInternalIC+0x288>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8344
   2ce81:	8b 07                	mov    eax,DWORD PTR [rdi]
   2ce83:	31 d2                	xor    edx,edx
JS_NewInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:562
   2ce85:	25 ff ff ff 7f       	and    eax,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8344
   2ce8a:	e9 20 fd ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
   2ce8f:	90                   	nop
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:3666
   2ce90:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2ce95:	48 8d 74 24 60       	lea    rsi,[rsp+0x60]
   2ce9a:	89 ca                	mov    edx,ecx
   2ce9c:	e8 ef a4 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7823 (discriminator 1)
   2cea1:	48 8d 35 d0 3f 0a 00 	lea    rsi,[rip+0xa3fd0]        # d0e78 <_IO_stdin_used+0x3e78>
JS_AtomGetStr():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:3666
   2cea8:	48 89 c2             	mov    rdx,rax
   2ceab:	e9 19 ff ff ff       	jmp    2cdc9 <JS_GetPropertyInternalIC+0x2d9>
__JS_AtomToUInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:2972
   2ceb0:	89 d9                	mov    ecx,ebx
   2ceb2:	81 e1 ff ff ff 7f    	and    ecx,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8409
   2ceb8:	3b 4d 38             	cmp    ecx,DWORD PTR [rbp+0x38]
   2cebb:	0f 82 e8 01 00 00    	jb     2d0a9 <JS_GetPropertyInternalIC+0x5b9>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8412
   2cec1:	0f b7 45 12          	movzx  eax,WORD PTR [rbp+0x12]
   2cec5:	83 e8 15             	sub    eax,0x15
   2cec8:	66 83 f8 0b          	cmp    ax,0xb
   2cecc:	0f 87 3b fd ff ff    	ja     2cc0d <JS_GetPropertyInternalIC+0x11d>
   2ced2:	e9 b5 fe ff ff       	jmp    2cd8c <JS_GetPropertyInternalIC+0x29c>
   2ced7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2cede:	00 00 
__JS_AtomToUInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:2972
   2cee0:	89 ca                	mov    edx,ecx
   2cee2:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8354
   2cee8:	3b 17                	cmp    edx,DWORD PTR [rdi]
   2ceea:	0f 83 88 fe ff ff    	jae    2cd78 <JS_GetPropertyInternalIC+0x288>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8355
   2cef0:	e8 1b 66 fe ff       	call   13510 <string_rope_get>
js_new_string_char():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4029
   2cef5:	66 3d ff 00          	cmp    ax,0xff
   2cef9:	0f 87 ff 00 00 00    	ja     2cffe <JS_GetPropertyInternalIC+0x50e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4031
   2ceff:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
   2cf04:	ba 01 00 00 00       	mov    edx,0x1
   2cf09:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4030
   2cf0c:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4031
   2cf10:	e8 fb 66 00 00       	call   33610 <js_new_string8_len>
   2cf15:	48 89 c1             	mov    rcx,rax
   2cf18:	e9 32 fd ff ff       	jmp    2cc4f <JS_GetPropertyInternalIC+0x15f>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8340
   2cf1d:	8b 07                	mov    eax,DWORD PTR [rdi]
__JS_AtomToUInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:2972
   2cf1f:	89 ca                	mov    edx,ecx
   2cf21:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8340
   2cf27:	25 ff ff ff 7f       	and    eax,0x7fffffff
   2cf2c:	39 c2                	cmp    edx,eax
   2cf2e:	0f 83 44 fe ff ff    	jae    2cd78 <JS_GetPropertyInternalIC+0x288>
string_get():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:2036
   2cf34:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
   2cf38:	0f 88 b1 00 00 00    	js     2cfef <JS_GetPropertyInternalIC+0x4ff>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:2036 (discriminator 2)
   2cf3e:	0f b6 44 17 0c       	movzx  eax,BYTE PTR [rdi+rdx*1+0xc]
js_new_string_char():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4030
   2cf43:	eb ba                	jmp    2ceff <JS_GetPropertyInternalIC+0x40f>
JS_NewInt32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:562
   2cf45:	8b 07                	mov    eax,DWORD PTR [rdi]
   2cf47:	31 d2                	xor    edx,edx
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8358
   2cf49:	e9 61 fc ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8379
   2cf4e:	49 8b 33             	mov    rsi,QWORD PTR [r11]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8379 (discriminator 1)
   2cf51:	48 85 f6             	test   rsi,rsi
   2cf54:	0f 84 32 fe ff ff    	je     2cd8c <JS_GetPropertyInternalIC+0x29c>
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:711
   2cf5a:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8385
   2cf5e:	48 8b 84 24 a8 00 00 	mov    rax,QWORD PTR [rsp+0xa8]
   2cf65:	00 
   2cf66:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
   2cf6d:	00 00 
   2cf6f:	0f 85 dd 00 00 00    	jne    2d052 <JS_GetPropertyInternalIC+0x562>
   2cf75:	4c 89 c9             	mov    rcx,r9
   2cf78:	4d 89 f8             	mov    r8,r15
   2cf7b:	4c 89 e7             	mov    rdi,r12
   2cf7e:	45 31 c9             	xor    r9d,r9d
   2cf81:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
   2cf88:	00 00 00 00 00 
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2cf8d:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8385
   2cf94:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2cf9b:	5b                   	pop    rbx
   2cf9c:	5d                   	pop    rbp
   2cf9d:	41 5c                	pop    r12
   2cf9f:	41 5d                	pop    r13
   2cfa1:	41 5e                	pop    r14
   2cfa3:	41 5f                	pop    r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8385
   2cfa5:	e9 d6 fa ff ff       	jmp    2ca80 <JS_CallFree>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8388
   2cfaa:	49 8b 03             	mov    rax,QWORD PTR [r11]
   2cfad:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   2cfb1:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   2cfb4:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8389 (discriminator 2)
   2cfb8:	83 fa 04             	cmp    edx,0x4
   2cfbb:	0f 85 e5 fb ff ff    	jne    2cba6 <JS_GetPropertyInternalIC+0xb6>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8390
   2cfc1:	48 8b 84 24 a8 00 00 	mov    rax,QWORD PTR [rsp+0xa8]
   2cfc8:	00 
   2cfc9:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
   2cfd0:	00 00 
   2cfd2:	75 7e                	jne    2d052 <JS_GetPropertyInternalIC+0x562>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2cfd4:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8390
   2cfdb:	89 de                	mov    esi,ebx
   2cfdd:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2cfe0:	5b                   	pop    rbx
   2cfe1:	5d                   	pop    rbp
   2cfe2:	41 5c                	pop    r12
   2cfe4:	41 5d                	pop    r13
   2cfe6:	41 5e                	pop    r14
   2cfe8:	41 5f                	pop    r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8390
   2cfea:	e9 31 59 00 00       	jmp    32920 <JS_ThrowReferenceErrorUninitialized>
string_get():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:2036 (discriminator 1)
   2cfef:	0f b7 44 57 0c       	movzx  eax,WORD PTR [rdi+rdx*2+0xc]
js_new_string_char():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4029
   2cff4:	66 3d ff 00          	cmp    ax,0xff
   2cff8:	0f 86 01 ff ff ff    	jbe    2ceff <JS_GetPropertyInternalIC+0x40f>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4034
   2cffe:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
   2d003:	ba 01 00 00 00       	mov    edx,0x1
   2d008:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4033
   2d00b:	66 89 44 24 20       	mov    WORD PTR [rsp+0x20],ax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:4034
   2d010:	e8 7b 71 00 00       	call   34190 <js_new_string16_len>
   2d015:	48 89 c1             	mov    rcx,rax
   2d018:	e9 32 fc ff ff       	jmp    2cc4f <JS_GetPropertyInternalIC+0x15f>
__JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6604
   2d01d:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2d022:	48 89 ee             	mov    rsi,rbp
   2d025:	4c 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],r9
   2d02a:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
   2d031:	44 89 54 24 10       	mov    DWORD PTR [rsp+0x10],r10d
   2d036:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
   2d03a:	e8 01 ee fe ff       	call   1be40 <__JS_FreeValueRT>
   2d03f:	4c 8b 4c 24 18       	mov    r9,QWORD PTR [rsp+0x18]
   2d044:	44 8b 54 24 10       	mov    r10d,DWORD PTR [rsp+0x10]
   2d049:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
   2d04d:	e9 c4 fc ff ff       	jmp    2cd16 <JS_GetPropertyInternalIC+0x226>
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2d052:	e8 79 49 fe ff       	call   119d0 <__stack_chk_fail@plt>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8452
   2d057:	f6 44 24 20 10       	test   BYTE PTR [rsp+0x20],0x10
   2d05c:	0f 85 85 00 00 00    	jne    2d0e7 <JS_GetPropertyInternalIC+0x5f7>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8456
   2d062:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   2d067:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
   2d06c:	e9 3e fb ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8435
   2d071:	4d 89 c8             	mov    r8,r9
   2d074:	89 d9                	mov    ecx,ebx
   2d076:	4d 89 f9             	mov    r9,r15
   2d079:	48 89 ee             	mov    rsi,rbp
   2d07c:	4c 89 e7             	mov    rdi,r12
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:711
   2d07f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
JS_GetPropertyInternalIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8435
   2d083:	48 83 ca ff          	or     rdx,0xffffffffffffffff
   2d087:	ff d0                	call   rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8436
   2d089:	48 89 ee             	mov    rsi,rbp
   2d08c:	4c 89 e7             	mov    rdi,r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8435
   2d08f:	48 89 c3             	mov    rbx,rax
   2d092:	49 89 d5             	mov    r13,rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8436
   2d095:	48 83 ca ff          	or     rdx,0xffffffffffffffff
   2d099:	e8 02 ef fe ff       	call   1bfa0 <JS_FreeValue>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8437
   2d09e:	48 89 d8             	mov    rax,rbx
   2d0a1:	4c 89 ea             	mov    rdx,r13
   2d0a4:	e9 06 fb ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8411
   2d0a9:	48 8b 84 24 a8 00 00 	mov    rax,QWORD PTR [rsp+0xa8]
   2d0b0:	00 
   2d0b1:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
   2d0b8:	00 00 
   2d0ba:	75 96                	jne    2d052 <JS_GetPropertyInternalIC+0x562>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2d0bc:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8411
   2d0c3:	48 89 ee             	mov    rsi,rbp
   2d0c6:	4c 89 e7             	mov    rdi,r12
   2d0c9:	48 83 ca ff          	or     rdx,0xffffffffffffffff
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8473
   2d0cd:	5b                   	pop    rbx
   2d0ce:	5d                   	pop    rbp
   2d0cf:	41 5c                	pop    r12
   2d0d1:	41 5d                	pop    r13
   2d0d3:	41 5e                	pop    r14
   2d0d5:	41 5f                	pop    r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8411
   2d0d7:	e9 64 05 00 00       	jmp    2d640 <JS_GetPropertyUint32>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8421
   2d0dc:	0f 89 aa fc ff ff    	jns    2cd8c <JS_GetPropertyInternalIC+0x29c>
   2d0e2:	e9 78 fd ff ff       	jmp    2ce5f <JS_GetPropertyInternalIC+0x36f>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8453
   2d0e7:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   2d0ec:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   2d0f1:	4c 89 e7             	mov    rdi,r12
   2d0f4:	4c 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],r9
   2d0f9:	e8 a2 ee fe ff       	call   1bfa0 <JS_FreeValue>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8454
   2d0fe:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
   2d103:	4d 89 f8             	mov    r8,r15
   2d106:	45 31 c9             	xor    r9d,r9d
   2d109:	50                   	push   rax
   2d10a:	4c 89 e7             	mov    rdi,r12
   2d10d:	6a 00                	push   0x0
   2d10f:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   2d114:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   2d119:	e8 62 f9 ff ff       	call   2ca80 <JS_CallFree>
   2d11e:	59                   	pop    rcx
   2d11f:	5e                   	pop    rsi
   2d120:	e9 8a fa ff ff       	jmp    2cbaf <JS_GetPropertyInternalIC+0xbf>

Disassembly of section .fini:
