; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   239f0:	f3 0f 1e fa          	endbr64
   239f4:	f3 0f 1e fa          	endbr64
   239f8:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
   239fd:	49 89 db             	mov    r11,rbx
   23a00:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
   23a05:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23a0c:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   23a13:	4c 89 c8             	mov    rax,r9
   23a16:	44 89 8d 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r9d
   23a1d:	48 c1 e0 04          	shl    rax,0x4
   23a21:	49 29 c3             	sub    r11,rax
   23a24:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   23a2b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   23a32:	49 8b 73 f0          	mov    rsi,QWORD PTR [r11-0x10]
   23a36:	49 8b 53 f8          	mov    rdx,QWORD PTR [r11-0x8]
   23a3a:	4d 8d 73 e0          	lea    r14,[r11-0x20]
   23a3e:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
   23a42:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
   23a46:	49 8b 4b e0          	mov    rcx,QWORD PTR [r11-0x20]
   23a4a:	6a 00                	push   0x0
   23a4c:	41 53                	push   r11
   23a4e:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   23a55:	6a 03                	push   0x3
   23a57:	6a 00                	push   0x0
   23a59:	e8 62 f0 ff ff       	call   22ac0 <JS_CallInternal>
   23a5e:	48 83 c4 20          	add    rsp,0x20
   23a62:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   23a69:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   23a70:	83 fa 06             	cmp    edx,0x6
   23a73:	48 89 d1             	mov    rcx,rdx
   23a76:	0f 84 8b 68 00 00    	je     2a307 <JS_CallInternal+0x7847>
   23a7c:	41 83 fd 25          	cmp    r13d,0x25
   23a80:	0f 84 2d f7 ff ff    	je     231b3 <JS_CallInternal+0x6f3>
   23a86:	4f 8d 2c 13          	lea    r13,[r11+r10*1]
   23a8a:	48 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rbx
   23a91:	4c 89 f3             	mov    rbx,r14
   23a94:	49 89 d6             	mov    r14,rdx
   23a97:	4c 89 a5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r12
   23a9e:	4d 89 ec             	mov    r12,r13
   23aa1:	49 89 c5             	mov    r13,rax
   23aa4:	eb 17                	jmp    23abd <JS_CallInternal+0xffd>
   23aa6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23aad:	00 00 00 
   23ab0:	48 83 c3 10          	add    rbx,0x10
   23ab4:	4c 39 e3             	cmp    rbx,r12
   23ab7:	0f 84 88 54 00 00    	je     28f45 <JS_CallInternal+0x6485>
   23abd:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   23ac1:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   23ac4:	83 f9 f6             	cmp    ecx,0xfffffff6
   23ac7:	76 e7                	jbe    23ab0 <JS_CallInternal+0xff0>
   23ac9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23acc:	8d 50 ff             	lea    edx,[rax-0x1]
   23acf:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   23ad2:	85 d2                	test   edx,edx
   23ad4:	7f da                	jg     23ab0 <JS_CallInternal+0xff0>
   23ad6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23add:	48 89 ca             	mov    rdx,rcx
   23ae0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23ae4:	e8 b7 8d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   23ae9:	eb c5                	jmp    23ab0 <JS_CallInternal+0xff0>
   23aeb:	f3 0f 1e fa          	endbr64
   23aef:	f3 0f 1e fa          	endbr64
   23af3:	31 c9                	xor    ecx,ecx
   23af5:	b8 02 00 00 00       	mov    eax,0x2
   23afa:	e9 e1 f7 ff ff       	jmp    232e0 <JS_CallInternal+0x820>
   23aff:	f3 0f 1e fa          	endbr64
   23b03:	f3 0f 1e fa          	endbr64
   23b07:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   23b0e:	4c 89 e2             	mov    rdx,r12
   23b11:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23b18:	44 89 e9             	mov    ecx,r13d
   23b1b:	48 8d 35 06 d3 0a 00 	lea    rsi,[rip+0xad306]        # d0e28 <_IO_stdin_used+0x3e28>
   23b22:	48 2b 50 18          	sub    rdx,QWORD PTR [rax+0x18]
   23b26:	31 c0                	xor    eax,eax
   23b28:	83 ea 01             	sub    edx,0x1
   23b2b:	e8 d0 f4 00 00       	call   33000 <JS_ThrowInternalError>
   23b30:	e9 2b f7 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   23b35:	f3 0f 1e fa          	endbr64
   23b39:	f3 0f 1e fa          	endbr64
   23b3d:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23b42:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
   23b49:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
   23b4e:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   23b55:	00 
   23b56:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   23b5a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23b5e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   23b61:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   23b65:	83 f8 04             	cmp    eax,0x4
   23b68:	0f 84 a5 67 00 00    	je     2a313 <JS_CallInternal+0x7853>
