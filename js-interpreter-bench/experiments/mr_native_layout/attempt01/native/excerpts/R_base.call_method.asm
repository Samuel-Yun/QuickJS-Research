; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   23ad0:	f3 0f 1e fa          	endbr64
   23ad4:	f3 0f 1e fa          	endbr64
   23ad8:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
   23add:	49 89 db             	mov    r11,rbx
   23ae0:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
   23ae5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23aec:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   23af3:	4c 89 c8             	mov    rax,r9
   23af6:	44 89 8d 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r9d
   23afd:	48 c1 e0 04          	shl    rax,0x4
   23b01:	49 29 c3             	sub    r11,rax
   23b04:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   23b0b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   23b12:	49 8b 73 f0          	mov    rsi,QWORD PTR [r11-0x10]
   23b16:	49 8b 53 f8          	mov    rdx,QWORD PTR [r11-0x8]
   23b1a:	4d 8d 73 e0          	lea    r14,[r11-0x20]
   23b1e:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
   23b22:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
   23b26:	49 8b 4b e0          	mov    rcx,QWORD PTR [r11-0x20]
   23b2a:	6a 00                	push   0x0
   23b2c:	41 53                	push   r11
   23b2e:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   23b35:	6a 03                	push   0x3
   23b37:	6a 00                	push   0x0
   23b39:	e8 62 f0 ff ff       	call   22ba0 <JS_CallInternal>
   23b3e:	48 83 c4 20          	add    rsp,0x20
   23b42:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   23b49:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   23b50:	83 fa 06             	cmp    edx,0x6
   23b53:	48 89 d1             	mov    rcx,rdx
   23b56:	0f 84 9a 68 00 00    	je     2a3f6 <JS_CallInternal+0x7856>
   23b5c:	41 83 fd 25          	cmp    r13d,0x25
   23b60:	0f 84 2d f7 ff ff    	je     23293 <JS_CallInternal+0x6f3>
   23b66:	4f 8d 2c 13          	lea    r13,[r11+r10*1]
   23b6a:	48 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rbx
   23b71:	4c 89 f3             	mov    rbx,r14
   23b74:	49 89 d6             	mov    r14,rdx
   23b77:	4c 89 a5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r12
   23b7e:	4d 89 ec             	mov    r12,r13
   23b81:	49 89 c5             	mov    r13,rax
   23b84:	eb 17                	jmp    23b9d <JS_CallInternal+0xffd>
   23b86:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23b8d:	00 00 00 
   23b90:	48 83 c3 10          	add    rbx,0x10
   23b94:	4c 39 e3             	cmp    rbx,r12
   23b97:	0f 84 e8 54 00 00    	je     29085 <JS_CallInternal+0x64e5>
   23b9d:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   23ba1:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   23ba4:	83 f9 f6             	cmp    ecx,0xfffffff6
   23ba7:	76 e7                	jbe    23b90 <JS_CallInternal+0xff0>
   23ba9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23bac:	8d 50 ff             	lea    edx,[rax-0x1]
   23baf:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   23bb2:	85 d2                	test   edx,edx
   23bb4:	7f da                	jg     23b90 <JS_CallInternal+0xff0>
   23bb6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23bbd:	48 89 ca             	mov    rdx,rcx
   23bc0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23bc4:	e8 d7 8c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   23bc9:	eb c5                	jmp    23b90 <JS_CallInternal+0xff0>
   23bcb:	f3 0f 1e fa          	endbr64
   23bcf:	f3 0f 1e fa          	endbr64
   23bd3:	31 c9                	xor    ecx,ecx
   23bd5:	b8 02 00 00 00       	mov    eax,0x2
   23bda:	e9 e1 f7 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   23bdf:	f3 0f 1e fa          	endbr64
   23be3:	f3 0f 1e fa          	endbr64
   23be7:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   23bee:	4c 89 e2             	mov    rdx,r12
   23bf1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23bf8:	44 89 e9             	mov    ecx,r13d
   23bfb:	48 8d 35 a6 d2 0a 00 	lea    rsi,[rip+0xad2a6]        # d0ea8 <_IO_stdin_used+0x3ea8>
   23c02:	48 2b 50 18          	sub    rdx,QWORD PTR [rax+0x18]
   23c06:	31 c0                	xor    eax,eax
   23c08:	83 ea 01             	sub    edx,0x1
   23c0b:	e8 80 f6 00 00       	call   33290 <JS_ThrowInternalError>
   23c10:	e9 2b f7 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   23c15:	f3 0f 1e fa          	endbr64
   23c19:	f3 0f 1e fa          	endbr64
   23c1d:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23c22:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
   23c29:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
   23c2e:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   23c35:	00 
   23c36:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   23c3a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23c3e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   23c41:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   23c45:	83 f8 04             	cmp    eax,0x4
   23c48:	0f 84 ce 67 00 00    	je     2a41c <JS_CallInternal+0x787c>
