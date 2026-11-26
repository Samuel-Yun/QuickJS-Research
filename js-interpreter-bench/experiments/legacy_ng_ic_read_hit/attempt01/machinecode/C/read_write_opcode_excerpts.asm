
... disjoint excerpt ...

   26866:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   2686a:	ff e0                	jmp    rax
   2686c:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19435
   26870:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/cutils.h:181
   26877:	45 8b 2c 24          	mov    r13d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19435
   2687b:	48 8b 78 60          	mov    rdi,QWORD PTR [rax+0x60]
   2687f:	44 89 ad f8 fe ff ff 	mov    DWORD PTR [rbp-0x108],r13d
   26886:	48 89 bd f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rdi
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:754
   2688d:	44 3b 6f 04          	cmp    r13d,DWORD PTR [rdi+0x4]
   26891:	0f 83 d3 5f 00 00    	jae    2c86a <JS_CallInternal+0xa5ca>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26897:	44 89 ea             	mov    edx,r13d
   2689a:	4c 8b 47 18          	mov    r8,QWORD PTR [rdi+0x18]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19439
   2689e:	48 8b 8d a8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x158]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   268a5:	48 8d 04 d5 00 00 00 	lea    rax,[rdx*8+0x0]
   268ac:	00 
   268ad:	48 29 d0             	sub    rax,rdx
   268b0:	49 8d 04 c0          	lea    rax,[r8+rax*8]
   268b4:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
   268b7:	89 85 c0 fd ff ff    	mov    DWORD PTR [rbp-0x240],eax
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19438
   268bd:	49 8d 44 24 04       	lea    rax,[r12+0x4]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19439
   268c2:	48 89 41 30          	mov    QWORD PTR [rcx+0x30],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19438
   268c6:	48 89 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19440
   268cd:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   268d1:	4c 8b 53 e8          	mov    r10,QWORD PTR [rbx-0x18]
   268d5:	48 83 eb 20          	sub    rbx,0x20
   268d9:	4c 8b 03             	mov    r8,QWORD PTR [rbx]
   268dc:	4c 8b 4b 08          	mov    r9,QWORD PTR [rbx+0x8]
   268e0:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   268e3:	4c 8b 30             	mov    r14,QWORD PTR [rax]
   268e6:	4c 8b 78 08          	mov    r15,QWORD PTR [rax+0x8]
JS_SetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:10091 (discriminator 1)
   268ea:	41 83 fa ff          	cmp    r10d,0xffffffff
   268ee:	0f 85 2d 34 00 00    	jne    29d21 <JS_CallInternal+0x7a81>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:10093
   268f4:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   268f8:	44 89 ee             	mov    esi,r13d
   268fb:	4c 89 95 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],r10
   26902:	48 89 8d 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rcx
   26909:	4c 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],r8
   26910:	4c 89 8d 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],r9
   26917:	48 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rdx
   2691e:	e8 1d 16 ff ff       	call   17f40 <get_ic_prop_offset.isra.0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:10094 (discriminator 1)
   26923:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
   2692a:	4c 8b 95 10 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1f0]
   26931:	83 f8 ff             	cmp    eax,0xffffffff
   26934:	0f 84 e7 33 00 00    	je     29d21 <JS_CallInternal+0x7a81>
get_shape_prop():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:5203
   2693a:	48 8b 95 30 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1d0]
JS_SetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:10097 (discriminator 1)
   26941:	89 c0                	mov    eax,eax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:10098
   26943:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
   2694a:	00 
get_shape_prop():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:5203
   2694b:	8b 7a 18             	mov    edi,DWORD PTR [rdx+0x18]

... disjoint excerpt ...

   2698b:	85 c0                	test   eax,eax
   2698d:	0f 8e bd 4c 00 00    	jle    2b650 <JS_CallInternal+0x93b0>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19442
   26993:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   26997:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:689
   2699a:	83 fa f6             	cmp    edx,0xfffffff6
   2699d:	76 11                	jbe    269b0 <JS_CallInternal+0x4710>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:691
   2699f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   269a2:	83 e8 01             	sub    eax,0x1
   269a5:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   269a8:	85 c0                	test   eax,eax
   269aa:	0f 8e 07 35 00 00    	jle    29eb7 <JS_CallInternal+0x7c17>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19447
   269b0:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   269b6:	48 8d 0d c3 93 0d 00 	lea    rcx,[rip+0xd93c3]        # ffd80 <dispatch_table.87>
   269bd:	49 83 c4 05          	add    r12,0x5
   269c1:	49 89 c5             	mov    r13,rax
   269c4:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   269c8:	ff e0                	jmp    rax
   269ca:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19467
   269ce:	48 8d 43 e0          	lea    rax,[rbx-0x20]
JS_GetPrivateField():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8551 (discriminator 1)
   269d2:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19467
   269d6:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   269da:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   269de:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   269e2:	4d 8b 7e 08          	mov    r15,QWORD PTR [r14+0x8]
   269e6:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
JS_GetPrivateField():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:8551 (discriminator 1)

... disjoint excerpt ...

   26ae4:	4c 89 f3             	mov    rbx,r14
   26ae7:	ff e0                	jmp    rax
   26ae9:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19420
   26aed:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/cutils.h:181
   26af4:	45 8b 2c 24          	mov    r13d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19420
   26af8:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   26afc:	44 89 ad e8 fe ff ff 	mov    DWORD PTR [rbp-0x118],r13d
   26b03:	48 89 95 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rdx
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:754
   26b0a:	44 3b 6a 04          	cmp    r13d,DWORD PTR [rdx+0x4]
   26b0e:	0f 83 56 5d 00 00    	jae    2c86a <JS_CallInternal+0xa5ca>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26b14:	44 89 e9             	mov    ecx,r13d
   26b17:	4c 8b 4a 18          	mov    r9,QWORD PTR [rdx+0x18]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19423
   26b1b:	4d 8d 74 24 04       	lea    r14,[r12+0x4]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19425
   26b20:	48 83 ec 08          	sub    rsp,0x8
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26b24:	48 8d 04 cd 00 00 00 	lea    rax,[rcx*8+0x0]
   26b2b:	00 
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19425
   26b2c:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   26b30:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26b34:	48 29 c8             	sub    rax,rcx
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19425
   26b37:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26b3b:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26b42:	49 8d 04 c1          	lea    rax,[r9+rax*8]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19425
   26b46:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26b4a:	8b 48 30             	mov    ecx,DWORD PTR [rax+0x30]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19424
   26b4d:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
   26b54:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19425
   26b58:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
   26b5f:	50                   	push   rax
   26b60:	e8 fb 64 00 00       	call   2d060 <JS_GetPropertyInternalWithIC.constprop.0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19426 (discriminator 2)
   26b65:	41 5a                	pop    r10
   26b67:	41 5b                	pop    r11
   26b69:	83 fa 06             	cmp    edx,0x6
   26b6c:	0f 84 86 45 00 00    	je     2b0f8 <JS_CallInternal+0x8e58>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19427
   26b72:	44 39 ad e8 fe ff ff 	cmp    DWORD PTR [rbp-0x118],r13d
   26b79:	0f 85 df 5a 00 00    	jne    2c65e <JS_CallInternal+0xa3be>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19428
   26b7f:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19430
   26b82:	48 8d 3d f7 91 0d 00 	lea    rdi,[rip+0xd91f7]        # ffd80 <dispatch_table.87>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19428
   26b89:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19430
   26b8d:	49 83 c4 05          	add    r12,0x5
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19428
   26b91:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19430
   26b95:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26b9b:	49 89 c5             	mov    r13,rax
   26b9e:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   26ba2:	ff e0                	jmp    rax
   26ba4:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19404
   26ba8:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/cutils.h:181
   26baf:	45 8b 2c 24          	mov    r13d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19404
   26bb3:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   26bb7:	44 89 ad d8 fe ff ff 	mov    DWORD PTR [rbp-0x128],r13d
   26bbe:	48 89 95 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rdx
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:754
   26bc5:	44 3b 6a 04          	cmp    r13d,DWORD PTR [rdx+0x4]
   26bc9:	0f 83 9b 5c 00 00    	jae    2c86a <JS_CallInternal+0xa5ca>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26bcf:	44 89 e9             	mov    ecx,r13d
   26bd2:	4c 8b 72 18          	mov    r14,QWORD PTR [rdx+0x18]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19407
   26bd6:	4d 8d 7c 24 04       	lea    r15,[r12+0x4]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19409
   26bdb:	48 83 ec 08          	sub    rsp,0x8
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26bdf:	48 8d 04 cd 00 00 00 	lea    rax,[rcx*8+0x0]
   26be6:	00 
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19409
   26be7:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   26beb:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26bef:	48 29 c8             	sub    rax,rcx
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19409
   26bf2:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   26bf6:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26bfd:	49 8d 04 c6          	lea    rax,[r14+rax*8]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19409
   26c01:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26c05:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:755
   26c09:	8b 48 30             	mov    ecx,DWORD PTR [rax+0x30]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19408
   26c0c:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
   26c13:	4c 89 78 30          	mov    QWORD PTR [rax+0x30],r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19409
   26c17:	48 8d 85 d0 fe ff ff 	lea    rax,[rbp-0x130]
   26c1e:	50                   	push   rax
   26c1f:	e8 3c 64 00 00       	call   2d060 <JS_GetPropertyInternalWithIC.constprop.0>
   26c24:	48 89 d1             	mov    rcx,rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19410 (discriminator 2)
   26c27:	5a                   	pop    rdx
   26c28:	5e                   	pop    rsi
   26c29:	83 f9 06             	cmp    ecx,0x6
   26c2c:	0f 84 be 44 00 00    	je     2b0f0 <JS_CallInternal+0x8e50>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19411
   26c32:	44 39 ad d8 fe ff ff 	cmp    DWORD PTR [rbp-0x128],r13d
   26c39:	0f 85 cb 5c 00 00    	jne    2c90a <JS_CallInternal+0xa66a>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19412
   26c3f:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   26c43:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:689
   26c46:	83 fa f6             	cmp    edx,0xfffffff6
   26c49:	76 11                	jbe    26c5c <JS_CallInternal+0x49bc>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.h:691
   26c4b:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   26c4e:	83 ef 01             	sub    edi,0x1
   26c51:	89 7e fc             	mov    DWORD PTR [rsi-0x4],edi
   26c54:	85 ff                	test   edi,edi
   26c56:	0f 8e b5 36 00 00    	jle    2a311 <JS_CallInternal+0x8071>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19413
   26c5c:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19415
   26c60:	48 8d 0d 19 91 0d 00 	lea    rcx,[rip+0xd9119]        # ffd80 <dispatch_table.87>
   26c67:	49 83 c4 05          	add    r12,0x5
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19413
   26c6b:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19415
   26c6f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26c75:	49 89 c5             	mov    r13,rax
   26c78:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   26c7c:	ff e0                	jmp    rax
   26c7e:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19365
   26c82:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19371
   26c89:	4c 8b 7b e8          	mov    r15,QWORD PTR [rbx-0x18]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19365
   26c8d:	c7 85 f8 fe ff ff ff 	mov    DWORD PTR [rbp-0x108],0xffffffff
   26c94:	ff ff ff 
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/cutils.h:181
   26c97:	45 8b 34 24          	mov    r14d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19371
   26c9b:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19365
   26c9f:	48 8b 40 60          	mov    rax,QWORD PTR [rax+0x60]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19371

... disjoint excerpt ...

   29d6b:	85 c0                	test   eax,eax
   29d6d:	0f 8e b2 22 00 00    	jle    2c025 <JS_CallInternal+0x9d85>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19444 (discriminator 1)
   29d73:	45 85 f6             	test   r14d,r14d
   29d76:	0f 89 4b 01 00 00    	jns    29ec7 <JS_CallInternal+0x7c27>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19438
   29d7c:	4c 8b a5 f8 fd ff ff 	mov    r12,QWORD PTR [rbp-0x208]
   29d83:	e9 b0 8c ff ff       	jmp    22a38 <JS_CallInternal+0x798>
   29d88:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29d8f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3501
   29d93:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   29d9a:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3502 (discriminator 1)
   29d9e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29da1:	83 e8 01             	sub    eax,0x1
   29da4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29da7:	85 c0                	test   eax,eax
   29da9:	0f 8f f2 da ff ff    	jg     278a1 <JS_CallInternal+0x5601>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:3504
   29daf:	e8 4c b6 fe ff       	call   15400 <JS_FreeAtomStruct>
   29db4:	e9 e8 da ff ff       	jmp    278a1 <JS_CallInternal+0x5601>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20572 (discriminator 30)
   29db9:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
   29dc0:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]

... disjoint excerpt ...

   29ebe:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29ec2:	e8 79 1f ff ff       	call   1be40 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19445
   29ec7:	44 3b ad f8 fe ff ff 	cmp    r13d,DWORD PTR [rbp-0x108]
   29ece:	0f 84 dc ca ff ff    	je     269b0 <JS_CallInternal+0x4710>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19445 (discriminator 1)
   29ed4:	48 8d 0d 95 f6 0a 00 	lea    rcx,[rip+0xaf695]        # d9570 <__PRETTY_FUNCTION__.86>
   29edb:	ba f5 4b 00 00       	mov    edx,0x4bf5
   29ee0:	48 8d 35 8c 32 0a 00 	lea    rsi,[rip+0xa328c]        # cd173 <_IO_stdin_used+0x173>
   29ee7:	48 8d 3d 8b 36 0a 00 	lea    rdi,[rip+0xa368b]        # cd579 <_IO_stdin_used+0x579>
   29eee:	e8 ad 7b fe ff       	call   11aa0 <__assert_fail@plt>
   29ef3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20198
   29ef8:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20199
   29eff:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   29f06:	44 89 ea             	mov    edx,r13d
   29f09:	48 89 de             	mov    rsi,rbx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20198
   29f0c:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20199
   29f10:	e8 fb d4 02 00       	call   57410 <js_unary_arith_slow>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20199 (discriminator 1)
   29f15:	85 c0                	test   eax,eax
   29f17:	0f 84 7f 96 ff ff    	je     2359c <JS_CallInternal+0x12fc>
   29f1d:	e9 16 8b ff ff       	jmp    22a38 <JS_CallInternal+0x798>
   29f22:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

... disjoint excerpt ...

/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20360
   2b0e7:	48 83 eb 10          	sub    rbx,0x10
   2b0eb:	e9 21 b5 ff ff       	jmp    26611 <JS_CallInternal+0x4371>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19407
   2b0f0:	4d 89 fc             	mov    r12,r15
   2b0f3:	e9 40 79 ff ff       	jmp    22a38 <JS_CallInternal+0x798>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19423
   2b0f8:	4d 89 f4             	mov    r12,r14
   2b0fb:	e9 38 79 ff ff       	jmp    22a38 <JS_CallInternal+0x798>
__JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:6604
   2b100:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b107:	48 89 ce             	mov    rsi,rcx
   2b10a:	4c 89 ea             	mov    rdx,r13
   2b10d:	44 89 85 20 fe ff ff 	mov    DWORD PTR [rbp-0x1e0],r8d
   2b114:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b118:	e8 23 0d ff ff       	call   1be40 <__JS_FreeValueRT>
   2b11d:	44 8b 85 20 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1e0]
   2b124:	e9 55 b0 ff ff       	jmp    2617e <JS_CallInternal+0x3ede>
   2b129:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b130:	4c 89 f6             	mov    rsi,r14
   2b133:	4c 89 fa             	mov    rdx,r15
   2b136:	44 89 85 20 fe ff ff 	mov    DWORD PTR [rbp-0x1e0],r8d
   2b13d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b141:	e8 fa 0c ff ff       	call   1be40 <__JS_FreeValueRT>
   2b146:	44 8b 85 20 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1e0]
   2b14d:	e9 08 b0 ff ff       	jmp    2615a <JS_CallInternal+0x3eba>
JS_ThrowTypeErrorNotASymbol():

... disjoint excerpt ...

/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:31201
   2c659:	e9 27 f2 ff ff       	jmp    2b885 <JS_CallInternal+0x95e5>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19427 (discriminator 1)
   2c65e:	48 8d 0d 0b cf 0a 00 	lea    rcx,[rip+0xacf0b]        # d9570 <__PRETTY_FUNCTION__.86>
   2c665:	ba e3 4b 00 00       	mov    edx,0x4be3
   2c66a:	48 8d 35 02 0b 0a 00 	lea    rsi,[rip+0xa0b02]        # cd173 <_IO_stdin_used+0x173>
   2c671:	48 8d 3d 01 0f 0a 00 	lea    rdi,[rip+0xa0f01]        # cd579 <_IO_stdin_used+0x579>
   2c678:	e8 23 54 fe ff       	call   11aa0 <__assert_fail@plt>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20672
   2c67d:	4d 89 ec             	mov    r12,r13
   2c680:	e9 b3 63 ff ff       	jmp    22a38 <JS_CallInternal+0x798>
JS_ThrowOutOfMemory():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7886
   2c685:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2c68c:	4c 8b 60 10          	mov    r12,QWORD PTR [rax+0x10]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:7887
   2c690:	41 80 bc 24 e9 04 00 	cmp    BYTE PTR [r12+0x4e9],0x0
   2c697:	00 00 
   2c699:	74 3c                	je     2c6d7 <JS_CallInternal+0xa437>
js_build_arguments():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:16358
   2c69b:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2c6a2:	4c 89 fe             	mov    rsi,r15
   2c6a5:	48 89 ca             	mov    rdx,rcx

... disjoint excerpt ...

/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20284
   2c902:	4d 89 f4             	mov    r12,r14
   2c905:	e9 2e 61 ff ff       	jmp    22a38 <JS_CallInternal+0x798>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19411 (discriminator 1)
   2c90a:	48 8d 0d 5f cc 0a 00 	lea    rcx,[rip+0xacc5f]        # d9570 <__PRETTY_FUNCTION__.86>
   2c911:	ba d3 4b 00 00       	mov    edx,0x4bd3
   2c916:	48 8d 35 56 08 0a 00 	lea    rsi,[rip+0xa0856]        # cd173 <_IO_stdin_used+0x173>
   2c91d:	48 8d 3d 55 0c 0a 00 	lea    rdi,[rip+0xa0c55]        # cd579 <_IO_stdin_used+0x579>
   2c924:	e8 77 51 fe ff       	call   11aa0 <__assert_fail@plt>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19189
   2c929:	4c 89 eb             	mov    rbx,r13
   2c92c:	e9 07 61 ff ff       	jmp    22a38 <JS_CallInternal+0x798>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19994
   2c931:	66 49 0f 6e c7       	movq   xmm0,r15
   2c936:	f2 41 0f 58 45 00    	addsd  xmm0,QWORD PTR [r13+0x0]
   2c93c:	49 c7 45 08 08 00 00 	mov    QWORD PTR [r13+0x8],0x8
   2c943:	00 
   2c944:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:19996
   2c94a:	e9 30 94 ff ff       	jmp    25d7f <JS_CallInternal+0x3adf>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/C/quickjs.c:20628 (discriminator 20)
   2c94f:	45 39 f7             	cmp    r15d,r14d
   2c952:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2c959:	4c 89 ee             	mov    rsi,r13
   2c95c:	4c 89 f2             	mov    rdx,r14
