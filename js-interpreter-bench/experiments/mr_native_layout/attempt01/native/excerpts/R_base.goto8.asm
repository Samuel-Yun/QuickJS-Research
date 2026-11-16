; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   28bb5:	f3 0f 1e fa          	endbr64
   28bb9:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28bc0:	4d 0f be 2c 24       	movsx  r13,BYTE PTR [r12]
   28bc5:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   28bcb:	4d 01 e5             	add    r13,r12
   28bce:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28bd4:	83 e8 01             	sub    eax,0x1
   28bd7:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   28bdd:	85 c0                	test   eax,eax
   28bdf:	0f 8e 88 30 00 00    	jle    2bc6d <JS_CallInternal+0x90cd>
   28be5:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28bea:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28bee:	49 89 c5             	mov    r13,rax
   28bf1:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28bf5:	f3 0f 1e fa          	endbr64
   28bf9:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28c00:	4d 0f bf 2c 24       	movsx  r13,WORD PTR [r12]
   28c05:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   28c0b:	4d 01 e5             	add    r13,r12
   28c0e:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28c14:	83 e8 01             	sub    eax,0x1
   28c17:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   28c1d:	85 c0                	test   eax,eax
   28c1f:	0f 8e e3 2a 00 00    	jle    2b708 <JS_CallInternal+0x8b68>
   28c25:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28c2a:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28c2e:	49 89 c5             	mov    r13,rax
   28c31:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28c35:	f3 0f 1e fa          	endbr64
   28c39:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   28c40:	41 0f b6 0c 24       	movzx  ecx,BYTE PTR [r12]
   28c45:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   28c4a:	c7 85 f0 fe ff ff 01 	mov    DWORD PTR [rbp-0x110],0x1
   28c51:	00 00 00 
   28c54:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   28c58:	b8 fd ff ff ff       	mov    eax,0xfffffffd
   28c5d:	29 c8                	sub    eax,ecx
   28c5f:	48 98                	cdqe
   28c61:	48 c1 e0 04          	shl    rax,0x4
   28c65:	4c 8d 2c 03          	lea    r13,[rbx+rax*1]
   28c69:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   28c6d:	83 fa 03             	cmp    edx,0x3
   28c70:	0f 84 52 2a 00 00    	je     2b6c8 <JS_CallInternal+0x8b28>
   28c76:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   28c7b:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   28c7f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28c86:	4c 8d 8d f0 fe ff ff 	lea    r9,[rbp-0x110]
   28c8d:	29 c8                	sub    eax,ecx
   28c8f:	48 98                	cdqe
   28c91:	48 c1 e0 04          	shl    rax,0x4
   28c95:	48 01 d8             	add    rax,rbx
   28c98:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   28c9b:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   28c9f:	e8 3c e7 06 00       	call   973e0 <JS_IteratorNext.constprop.0>
   28ca4:	49 89 d1             	mov    r9,rdx
   28ca7:	48 89 c7             	mov    rdi,rax
   28caa:	48 89 d6             	mov    rsi,rdx
   28cad:	83 fa 06             	cmp    edx,0x6
   28cb0:	0f 84 72 11 00 00    	je     29e28 <JS_CallInternal+0x7288>
   28cb6:	8b 8d f0 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x110]
   28cbc:	31 d2                	xor    edx,edx
   28cbe:	85 c9                	test   ecx,ecx
   28cc0:	0f 85 71 11 00 00    	jne    29e37 <JS_CallInternal+0x7297>
   28cc6:	48 89 3b             	mov    QWORD PTR [rbx],rdi
   28cc9:	49 83 c4 02          	add    r12,0x2
   28ccd:	48 83 c3 20          	add    rbx,0x20
   28cd1:	48 89 73 e8          	mov    QWORD PTR [rbx-0x18],rsi
   28cd5:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   28cd9:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   28ce0:	00 
   28ce1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28ce7:	49 89 c5             	mov    r13,rax
   28cea:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28cee:	ff e0                	jmp    rax
   28cf0:	f3 0f 1e fa          	endbr64
   28cf4:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   28cf9:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   28d00:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   28d05:	48 c1 e0 04          	shl    rax,0x4
   28d09:	48 01 c8             	add    rax,rcx
   28d0c:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   28d10:	0f 85 f2 23 00 00    	jne    2b108 <JS_CallInternal+0x8568>
   28d16:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
   28d1b:	49 83 c4 03          	add    r12,0x3
   28d1f:	48 83 eb 10          	sub    rbx,0x10
   28d23:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
   28d26:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28d2c:	49 89 c5             	mov    r13,rax
   28d2f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d33:	ff e0                	jmp    rax
