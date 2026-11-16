
... disjoint excerpt ...

   26846:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   2684a:	ff e0                	jmp    rax
   2684c:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19435
   26850:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/cutils.h:181
   26857:	45 8b 2c 24          	mov    r13d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19435
   2685b:	48 8b 78 60          	mov    rdi,QWORD PTR [rax+0x60]
   2685f:	44 89 ad f8 fe ff ff 	mov    DWORD PTR [rbp-0x108],r13d
   26866:	48 89 bd f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rdi
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:754
   2686d:	44 3b 6f 04          	cmp    r13d,DWORD PTR [rdi+0x4]
   26871:	0f 83 b9 60 00 00    	jae    2c930 <JS_CallInternal+0xa690>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:755
   26877:	44 89 ea             	mov    edx,r13d
   2687a:	4c 8b 47 18          	mov    r8,QWORD PTR [rdi+0x18]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19439
   2687e:	48 8b 8d a8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x158]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:755
   26885:	48 8d 04 d5 00 00 00 	lea    rax,[rdx*8+0x0]
   2688c:	00 
   2688d:	48 29 d0             	sub    rax,rdx
   26890:	49 8d 04 c0          	lea    rax,[r8+rax*8]
   26894:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
   26897:	89 85 10 fe ff ff    	mov    DWORD PTR [rbp-0x1f0],eax
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19438
   2689d:	49 8d 44 24 04       	lea    rax,[r12+0x4]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19439
   268a2:	48 89 41 30          	mov    QWORD PTR [rcx+0x30],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19438
   268a6:	48 89 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19440
   268ad:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   268b1:	4c 8b 53 e8          	mov    r10,QWORD PTR [rbx-0x18]
   268b5:	48 83 eb 20          	sub    rbx,0x20
   268b9:	4c 8b 03             	mov    r8,QWORD PTR [rbx]
   268bc:	4c 8b 4b 08          	mov    r9,QWORD PTR [rbx+0x8]
   268c0:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   268c3:	4c 8b 30             	mov    r14,QWORD PTR [rax]
   268c6:	4c 8b 78 08          	mov    r15,QWORD PTR [rax+0x8]
JS_SetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:10091 (discriminator 1)
   268ca:	41 83 fa ff          	cmp    r10d,0xffffffff
   268ce:	0f 85 db 34 00 00    	jne    29daf <JS_CallInternal+0x7b0f>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:10093
   268d4:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   268d8:	44 89 ee             	mov    esi,r13d
   268db:	4c 89 95 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],r10
   268e2:	48 89 8d 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rcx
   268e9:	4c 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],r8
   268f0:	4c 89 8d f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],r9
   268f7:	48 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rdx
   268fe:	e8 3d 16 ff ff       	call   17f40 <get_ic_prop_offset.isra.0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:10094 (discriminator 1)
   26903:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
   2690a:	4c 8b 95 00 fe ff ff 	mov    r10,QWORD PTR [rbp-0x200]
   26911:	83 f8 ff             	cmp    eax,0xffffffff
   26914:	0f 84 95 34 00 00    	je     29daf <JS_CallInternal+0x7b0f>
get_shape_prop():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:5203
   2691a:	48 8b 95 30 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1d0]
JS_SetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:10097 (discriminator 1)
   26921:	89 c0                	mov    eax,eax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:10098
   26923:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
   2692a:	00 
get_shape_prop():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:5203
   2692b:	8b 7a 18             	mov    edi,DWORD PTR [rdx+0x18]

... disjoint excerpt ...

   2696b:	85 c0                	test   eax,eax
   2696d:	0f 8e 3d 4e 00 00    	jle    2b7b0 <JS_CallInternal+0x9510>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19442
   26973:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   26977:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:689
   2697a:	83 fa f6             	cmp    edx,0xfffffff6
   2697d:	76 11                	jbe    26990 <JS_CallInternal+0x46f0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:691
   2697f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26982:	83 e8 01             	sub    eax,0x1
   26985:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26988:	85 c0                	test   eax,eax
   2698a:	0f 8e 80 35 00 00    	jle    29f10 <JS_CallInternal+0x7c70>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19447
   26990:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   26996:	48 8d 3d e3 93 0d 00 	lea    rdi,[rip+0xd93e3]        # ffd80 <dispatch_table.87>
   2699d:	49 83 c4 05          	add    r12,0x5
   269a1:	49 89 c5             	mov    r13,rax
   269a4:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   269a8:	ff e0                	jmp    rax
   269aa:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19467
   269ae:	48 8d 43 e0          	lea    rax,[rbx-0x20]
JS_GetPrivateField():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8551 (discriminator 1)
   269b2:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19467
   269b6:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   269ba:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   269be:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   269c2:	4d 8b 7e 08          	mov    r15,QWORD PTR [r14+0x8]
   269c6:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
JS_GetPrivateField():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8551 (discriminator 1)

... disjoint excerpt ...

   26ac4:	4c 89 f3             	mov    rbx,r14
   26ac7:	ff e0                	jmp    rax
   26ac9:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19420
   26acd:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/cutils.h:181
   26ad4:	45 8b 2c 24          	mov    r13d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19420
   26ad8:	48 8b 78 60          	mov    rdi,QWORD PTR [rax+0x60]
   26adc:	44 89 ad e8 fe ff ff 	mov    DWORD PTR [rbp-0x118],r13d
   26ae3:	48 89 bd e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rdi
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:754
   26aea:	44 3b 6f 04          	cmp    r13d,DWORD PTR [rdi+0x4]
   26aee:	0f 83 3c 5e 00 00    	jae    2c930 <JS_CallInternal+0xa690>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:755
   26af4:	44 89 ea             	mov    edx,r13d
   26af7:	4c 8b 5f 18          	mov    r11,QWORD PTR [rdi+0x18]
   26afb:	4c 8b 7b f8          	mov    r15,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19423
   26aff:	4d 8d 54 24 04       	lea    r10,[r12+0x4]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:755
   26b04:	48 8d 04 d5 00 00 00 	lea    rax,[rdx*8+0x0]
   26b0b:	00 
   26b0c:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   26b11:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   26b15:	48 29 d0             	sub    rax,rdx
   26b18:	49 8d 04 c3          	lea    rax,[r11+rax*8]
   26b1c:	0f 29 ad 00 fe ff ff 	movaps XMMWORD PTR [rbp-0x200],xmm5
   26b23:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
   26b26:	89 85 20 fe ff ff    	mov    DWORD PTR [rbp-0x1e0],eax
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19424
   26b2c:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
   26b33:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
JS_GetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8490 (discriminator 1)
   26b37:	41 83 ff ff          	cmp    r15d,0xffffffff
   26b3b:	0f 85 9d 36 00 00    	jne    2a1de <JS_CallInternal+0x7f3e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8493
   26b41:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   26b45:	44 89 ee             	mov    esi,r13d
   26b48:	4c 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r10
   26b4f:	e8 ec 13 ff ff       	call   17f40 <get_ic_prop_offset.isra.0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8494 (discriminator 1)
   26b54:	4c 8b 95 30 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1d0]
   26b5b:	83 f8 ff             	cmp    eax,0xffffffff
   26b5e:	0f 84 7a 36 00 00    	je     2a1de <JS_CallInternal+0x7f3e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8495
   26b64:	89 c0                	mov    eax,eax
   26b66:	48 c1 e0 04          	shl    rax,0x4
   26b6a:	49 03 46 20          	add    rax,QWORD PTR [r14+0x20]
   26b6e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   26b71:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:709
   26b75:	83 f8 f6             	cmp    eax,0xfffffff6
   26b78:	76 04                	jbe    26b7e <JS_CallInternal+0x48de>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:711
   26b7a:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19426 (discriminator 2)
   26b7e:	83 f8 06             	cmp    eax,0x6
   26b81:	0f 84 c9 4c 00 00    	je     2b850 <JS_CallInternal+0x95b0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19427
   26b87:	44 39 ad e8 fe ff ff 	cmp    DWORD PTR [rbp-0x118],r13d
   26b8e:	0f 85 40 5c 00 00    	jne    2c7d4 <JS_CallInternal+0xa534>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19428
   26b94:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19430
   26b97:	48 8d 0d e2 91 0d 00 	lea    rcx,[rip+0xd91e2]        # ffd80 <dispatch_table.87>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19428
   26b9e:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19430
   26ba2:	49 83 c4 05          	add    r12,0x5
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19428
   26ba6:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19430
   26baa:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26bb0:	49 89 c5             	mov    r13,rax
   26bb3:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   26bb7:	ff e0                	jmp    rax
   26bb9:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19404
   26bbd:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/cutils.h:181
   26bc4:	45 8b 2c 24          	mov    r13d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19404
   26bc8:	48 8b 78 60          	mov    rdi,QWORD PTR [rax+0x60]
   26bcc:	44 89 ad d8 fe ff ff 	mov    DWORD PTR [rbp-0x128],r13d
   26bd3:	48 89 bd d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rdi
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:754
   26bda:	44 3b 6f 04          	cmp    r13d,DWORD PTR [rdi+0x4]
   26bde:	0f 83 4c 5d 00 00    	jae    2c930 <JS_CallInternal+0xa690>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:755
   26be4:	44 89 ea             	mov    edx,r13d
   26be7:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   26beb:	4c 8b 7b f8          	mov    r15,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19407
   26bef:	4d 8d 54 24 04       	lea    r10,[r12+0x4]
get_ic_atom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:755
   26bf4:	48 8d 04 d5 00 00 00 	lea    rax,[rdx*8+0x0]
   26bfb:	00 
   26bfc:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
   26c01:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   26c05:	48 29 d0             	sub    rax,rdx
   26c08:	48 8d 04 c1          	lea    rax,[rcx+rax*8]
   26c0c:	0f 29 95 00 fe ff ff 	movaps XMMWORD PTR [rbp-0x200],xmm2
   26c13:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
   26c16:	89 85 20 fe ff ff    	mov    DWORD PTR [rbp-0x1e0],eax
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19408
   26c1c:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
   26c23:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
JS_GetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8490 (discriminator 1)
   26c27:	41 83 ff ff          	cmp    r15d,0xffffffff
   26c2b:	0f 85 62 35 00 00    	jne    2a193 <JS_CallInternal+0x7ef3>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8493
   26c31:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   26c35:	44 89 ee             	mov    esi,r13d
   26c38:	4c 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r10
   26c3f:	e8 fc 12 ff ff       	call   17f40 <get_ic_prop_offset.isra.0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8494 (discriminator 1)
   26c44:	4c 8b 95 30 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1d0]
   26c4b:	83 f8 ff             	cmp    eax,0xffffffff
   26c4e:	0f 84 3f 35 00 00    	je     2a193 <JS_CallInternal+0x7ef3>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8495
   26c54:	89 c0                	mov    eax,eax
   26c56:	48 c1 e0 04          	shl    rax,0x4
   26c5a:	49 03 46 20          	add    rax,QWORD PTR [r14+0x20]
   26c5e:	4c 8b 70 08          	mov    r14,QWORD PTR [rax+0x8]
   26c62:	4c 8b 38             	mov    r15,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:709
   26c65:	41 83 fe f6          	cmp    r14d,0xfffffff6
   26c69:	76 05                	jbe    26c70 <JS_CallInternal+0x49d0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:711
   26c6b:	41 83 47 fc 01       	add    DWORD PTR [r15-0x4],0x1
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19410 (discriminator 2)
   26c70:	41 83 fe 06          	cmp    r14d,0x6
   26c74:	0f 84 21 3f 00 00    	je     2ab9b <JS_CallInternal+0x88fb>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19411
   26c7a:	44 39 ad d8 fe ff ff 	cmp    DWORD PTR [rbp-0x128],r13d
   26c81:	0f 85 c8 5c 00 00    	jne    2c94f <JS_CallInternal+0xa6af>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19412
   26c87:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26c8b:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:689
   26c8f:	83 fa f6             	cmp    edx,0xfffffff6
   26c92:	76 11                	jbe    26ca5 <JS_CallInternal+0x4a05>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:691
   26c94:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26c97:	83 e8 01             	sub    eax,0x1
   26c9a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26c9d:	85 c0                	test   eax,eax
   26c9f:	0f 8e f6 3c 00 00    	jle    2a99b <JS_CallInternal+0x86fb>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19413
   26ca5:	4c 89 7b f0          	mov    QWORD PTR [rbx-0x10],r15
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19415
   26ca9:	48 8d 3d d0 90 0d 00 	lea    rdi,[rip+0xd90d0]        # ffd80 <dispatch_table.87>
   26cb0:	49 83 c4 05          	add    r12,0x5
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19413
   26cb4:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19415
   26cb8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26cbe:	49 89 c5             	mov    r13,rax
   26cc1:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   26cc5:	ff e0                	jmp    rax
   26cc7:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19365
   26ccb:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19371
   26cd2:	4c 8b 7b e8          	mov    r15,QWORD PTR [rbx-0x18]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19365
   26cd6:	c7 85 f8 fe ff ff ff 	mov    DWORD PTR [rbp-0x108],0xffffffff
   26cdd:	ff ff ff 
get_u32():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/cutils.h:181
   26ce0:	45 8b 34 24          	mov    r14d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19371
   26ce4:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19365
   26ce8:	48 8b 40 60          	mov    rax,QWORD PTR [rax+0x60]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19371

... disjoint excerpt ...

   29df9:	85 c0                	test   eax,eax
   29dfb:	0f 8e f4 22 00 00    	jle    2c0f5 <JS_CallInternal+0x9e55>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19444 (discriminator 1)
   29e01:	45 85 f6             	test   r14d,r14d
   29e04:	0f 89 16 01 00 00    	jns    29f20 <JS_CallInternal+0x7c80>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19438
   29e0a:	4c 8b a5 c0 fd ff ff 	mov    r12,QWORD PTR [rbp-0x240]
   29e11:	e9 1a 8c ff ff       	jmp    22a30 <JS_CallInternal+0x790>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20571 (discriminator 30)
   29e16:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
   29e1d:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   29e24:	31 d2                	xor    edx,edx
   29e26:	48 89 de             	mov    rsi,rbx
   29e29:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29e2d:	e8 4e 2f 03 00       	call   5cd80 <js_eq_slow>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20571 (discriminator 1)
   29e32:	85 c0                	test   eax,eax
   29e34:	0f 84 15 d2 ff ff    	je     2704f <JS_CallInternal+0x4daf>
   29e3a:	e9 f1 8b ff ff       	jmp    22a30 <JS_CallInternal+0x790>
   29e3f:	90                   	nop
JS_NewRegexp():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:47952
   29e40:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   29e47:	48 8d 35 ff 36 0a 00 	lea    rsi,[rip+0xa36ff]        # cd54d <_IO_stdin_used+0x54d>
   29e4e:	31 c0                	xor    eax,eax
   29e50:	e8 eb 6b 00 00       	call   30a40 <JS_ThrowTypeError>
JS_FreeValue():

... disjoint excerpt ...

   29f17:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29f1b:	e8 20 1f ff ff       	call   1be40 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19445
   29f20:	44 3b ad f8 fe ff ff 	cmp    r13d,DWORD PTR [rbp-0x108]
   29f27:	0f 84 63 ca ff ff    	je     26990 <JS_CallInternal+0x46f0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19445 (discriminator 1)
   29f2d:	48 8d 0d 3c f6 0a 00 	lea    rcx,[rip+0xaf63c]        # d9570 <__PRETTY_FUNCTION__.86>
   29f34:	ba f5 4b 00 00       	mov    edx,0x4bf5
   29f39:	48 8d 35 33 32 0a 00 	lea    rsi,[rip+0xa3233]        # cd173 <_IO_stdin_used+0x173>
   29f40:	48 8d 3d 32 36 0a 00 	lea    rdi,[rip+0xa3632]        # cd579 <_IO_stdin_used+0x579>
   29f47:	e8 54 7b fe ff       	call   11aa0 <__assert_fail@plt>
   29f4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
__JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:6604
   29f50:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29f57:	48 89 ca             	mov    rdx,rcx
   29f5a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29f5e:	e8 dd 1e ff ff       	call   1be40 <__JS_FreeValueRT>
   29f63:	e9 8b 92 ff ff       	jmp    231f3 <JS_CallInternal+0xf53>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20198
   29f68:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20199
   29f6f:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   29f76:	44 89 ea             	mov    edx,r13d
   29f79:	48 89 de             	mov    rsi,rbx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20198

... disjoint excerpt ...

/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20419
   2ab92:	48 83 eb 10          	sub    rbx,0x10
   2ab96:	e9 be da ff ff       	jmp    28659 <JS_CallInternal+0x63b9>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19407
   2ab9b:	4d 89 d4             	mov    r12,r10
   2ab9e:	e9 8d 7e ff ff       	jmp    22a30 <JS_CallInternal+0x790>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:18601
   2aba3:	4c 89 fb             	mov    rbx,r15
   2aba6:	e9 85 7e ff ff       	jmp    22a30 <JS_CallInternal+0x790>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:18425
   2abab:	4d 89 f4             	mov    r12,r14
   2abae:	e9 7d 7e ff ff       	jmp    22a30 <JS_CallInternal+0x790>
js_poll_interrupts():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7986
   2abb3:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2abba:	e8 11 81 00 00       	call   32cd0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19069 (discriminator 2)
   2abbf:	85 c0                	test   eax,eax
   2abc1:	0f 84 f8 b8 ff ff    	je     264bf <JS_CallInternal+0x421f>
   2abc7:	4d 89 ec             	mov    r12,r13
   2abca:	e9 61 7e ff ff       	jmp    22a30 <JS_CallInternal+0x790>
js_poll_interrupts():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7986
   2abcf:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]

... disjoint excerpt ...

/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:18134
   2b848:	4c 89 f3             	mov    rbx,r14
   2b84b:	e9 e0 71 ff ff       	jmp    22a30 <JS_CallInternal+0x790>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19423
   2b850:	4d 89 d4             	mov    r12,r10
   2b853:	e9 d8 71 ff ff       	jmp    22a30 <JS_CallInternal+0x790>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7923
   2b858:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2b85f:	48 8d 35 35 1d 0a 00 	lea    rsi,[rip+0xa1d35]        # cd59b <_IO_stdin_used+0x59b>
   2b866:	31 c0                	xor    eax,eax
   2b868:	e8 d3 51 00 00       	call   30a40 <JS_ThrowTypeError>
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:689
   2b86d:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2b871:	76 13                	jbe    2b886 <JS_CallInternal+0x95e6>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:691
   2b873:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b877:	83 e8 01             	sub    eax,0x1
   2b87a:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b87e:	85 c0                	test   eax,eax
   2b880:	0f 8e 43 0d 00 00    	jle    2c5c9 <JS_CallInternal+0xa329>
JS_SetPrivateField():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8590
   2b886:	41 bd ff ff ff ff    	mov    r13d,0xffffffff

... disjoint excerpt ...

   2c7c4:	e8 d7 f7 fe ff       	call   1bfa0 <JS_FreeValue>
   2c7c9:	8b 85 30 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1d0]
   2c7cf:	e9 ac 9a ff ff       	jmp    26280 <JS_CallInternal+0x3fe0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19427 (discriminator 1)
   2c7d4:	48 8d 0d 95 cd 0a 00 	lea    rcx,[rip+0xacd95]        # d9570 <__PRETTY_FUNCTION__.86>
   2c7db:	ba e3 4b 00 00       	mov    edx,0x4be3
   2c7e0:	48 8d 35 8c 09 0a 00 	lea    rsi,[rip+0xa098c]        # cd173 <_IO_stdin_used+0x173>
   2c7e7:	48 8d 3d 8b 0d 0a 00 	lea    rdi,[rip+0xa0d8b]        # cd579 <_IO_stdin_used+0x579>
   2c7ee:	e8 ad 52 fe ff       	call   11aa0 <__assert_fail@plt>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20629 (discriminator 20)
   2c7f3:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2c7fa:	4c 89 ee             	mov    rsi,r13
   2c7fd:	4c 89 f2             	mov    rdx,r14
   2c800:	e8 9b f7 fe ff       	call   1bfa0 <JS_FreeValue>
JS_NewBool():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:557
   2c805:	31 c0                	xor    eax,eax
   2c807:	45 39 f7             	cmp    r15d,r14d
   2c80a:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.h:557
   2c80d:	e9 b2 99 ff ff       	jmp    261c4 <JS_CallInternal+0x3f24>
JS_ThrowOutOfMemory():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:7886
   2c812:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]

... disjoint excerpt ...

   2c943:	48 8d 3d 16 09 0a 00 	lea    rdi,[rip+0xa0916]        # cd260 <_IO_stdin_used+0x260>
   2c94a:	e8 51 51 fe ff       	call   11aa0 <__assert_fail@plt>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19411 (discriminator 1)
   2c94f:	48 8d 0d 1a cc 0a 00 	lea    rcx,[rip+0xacc1a]        # d9570 <__PRETTY_FUNCTION__.86>
   2c956:	ba d3 4b 00 00       	mov    edx,0x4bd3
   2c95b:	48 8d 35 11 08 0a 00 	lea    rsi,[rip+0xa0811]        # cd173 <_IO_stdin_used+0x173>
   2c962:	48 8d 3d 10 0c 0a 00 	lea    rdi,[rip+0xa0c10]        # cd579 <_IO_stdin_used+0x579>
   2c969:	e8 32 51 fe ff       	call   11aa0 <__assert_fail@plt>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:18644
   2c96e:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2c975:	e8 a6 5f 00 00       	call   32920 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:18645
   2c97a:	e9 b1 d7 ff ff       	jmp    2a130 <JS_CallInternal+0x7e90>
js_operator_private_in():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:16131
   2c97f:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2c986:	48 8d 35 4f 0c 0a 00 	lea    rsi,[rip+0xa0c4f]        # cd5dc <_IO_stdin_used+0x5dc>
   2c98d:	31 c0                	xor    eax,eax
   2c98f:	e8 ac 40 00 00       	call   30a40 <JS_ThrowTypeError>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:16132
   2c994:	e9 97 60 ff ff       	jmp    22a30 <JS_CallInternal+0x790>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:20001
   2c999:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
