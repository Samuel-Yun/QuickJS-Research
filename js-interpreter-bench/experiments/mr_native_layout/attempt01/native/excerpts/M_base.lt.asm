; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   27c5a:	f3 0f 1e fa          	endbr64
   27c5e:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   27c62:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   27c66:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   27c6a:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   27c6e:	89 cf                	mov    edi,ecx
   27c70:	09 f7                	or     edi,esi
   27c72:	0f 85 22 3c 00 00    	jne    2b89a <JS_CallInternal+0x8dda>
   27c78:	39 d0                	cmp    eax,edx
   27c7a:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   27c81:	00 
   27c82:	0f 9c c0             	setl   al
   27c85:	48 83 eb 10          	sub    rbx,0x10
   27c89:	0f b6 c0             	movzx  eax,al
   27c8c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   27c90:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27c95:	49 83 c4 01          	add    r12,0x1
   27c99:	49 89 c5             	mov    r13,rax
   27c9c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ca0:	ff e0                	jmp    rax
   27ca2:	f3 0f 1e fa          	endbr64
   27ca6:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   27caa:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   27cae:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   27cb2:	0f 87 11 20 00 00    	ja     29cc9 <JS_CallInternal+0x7209>
   27cb8:	31 c0                	xor    eax,eax
   27cba:	85 d2                	test   edx,edx
   27cbc:	0f 95 c0             	setne  al
   27cbf:	85 c0                	test   eax,eax
   27cc1:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27cc8:	00 
   27cc9:	0f 94 c0             	sete   al
   27ccc:	49 83 c4 01          	add    r12,0x1
   27cd0:	0f b6 c0             	movzx  eax,al
   27cd3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   27cd7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27cdd:	49 89 c5             	mov    r13,rax
   27ce0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ce4:	ff e0                	jmp    rax
   27ce6:	f3 0f 1e fa          	endbr64
   27cea:	45 0f b6 34 24       	movzx  r14d,BYTE PTR [r12]
   27cef:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27cf6:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   27cfb:	4c 8b 43 c0          	mov    r8,QWORD PTR [rbx-0x40]
   27cff:	4c 8b 4b c8          	mov    r9,QWORD PTR [rbx-0x38]
   27d03:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   27d07:	44 89 f0             	mov    eax,r14d
   27d0a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27d11:	83 e0 01             	and    eax,0x1
   27d14:	4c 89 c6             	mov    rsi,r8
   27d17:	4c 89 ca             	mov    rdx,r9
   27d1a:	3c 01                	cmp    al,0x1
   27d1c:	19 c9                	sbb    ecx,ecx
   27d1e:	48 83 ec 08          	sub    rsp,0x8
   27d22:	6a 00                	push   0x0
   27d24:	83 e1 ef             	and    ecx,0xffffffef
   27d27:	83 c1 17             	add    ecx,0x17
   27d2a:	e8 81 50 00 00       	call   2cdb0 <JS_GetPropertyInternal>
   27d2f:	59                   	pop    rcx
   27d30:	5e                   	pop    rsi
   27d31:	83 fa 06             	cmp    edx,0x6
   27d34:	0f 84 f7 26 00 00    	je     2a431 <JS_CallInternal+0x7971>
   27d3a:	8d 72 fe             	lea    esi,[rdx-0x2]
   27d3d:	b9 01 00 00 00       	mov    ecx,0x1
   27d42:	83 fe 01             	cmp    esi,0x1
   27d45:	0f 87 55 1a 00 00    	ja     297a0 <JS_CallInternal+0x6ce0>
   27d4b:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   27d4e:	49 83 c4 02          	add    r12,0x2
   27d52:	48 83 c3 10          	add    rbx,0x10
   27d56:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27d5d:	00 
   27d5e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27d64:	49 89 c5             	mov    r13,rax
   27d67:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27d6b:	ff e0                	jmp    rax
   27d6d:	f3 0f 1e fa          	endbr64
   27d71:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   27d75:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   27d79:	48 8b 5b f8          	mov    rbx,QWORD PTR [rbx-0x8]
   27d7d:	4c 39 b5 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],r14
   27d84:	0f 83 0c 12 00 00    	jae    28f96 <JS_CallInternal+0x64d6>
   27d8a:	48 89 d8             	mov    rax,rbx
   27d8d:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
   27d94:	4c 89 f3             	mov    rbx,r14
   27d97:	4c 8b a5 68 fe ff ff 	mov    r12,QWORD PTR [rbp-0x198]
   27d9e:	49 89 c6             	mov    r14,rax
   27da1:	eb 0e                	jmp    27db1 <JS_CallInternal+0x52f1>
   27da3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   27da8:	49 39 dc             	cmp    r12,rbx
   27dab:	0f 83 d5 11 00 00    	jae    28f86 <JS_CallInternal+0x64c6>
