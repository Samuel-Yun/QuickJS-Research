; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   2820d:	f3 0f 1e fa          	endbr64
   28211:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28218:	4d 0f be 2c 24       	movsx  r13,BYTE PTR [r12]
   2821d:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   28223:	4d 01 e5             	add    r13,r12
   28226:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2822c:	83 e8 01             	sub    eax,0x1
   2822f:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   28235:	85 c0                	test   eax,eax
   28237:	0f 8e e5 36 00 00    	jle    2b922 <JS_CallInternal+0x8e62>
   2823d:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28242:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28246:	49 89 c5             	mov    r13,rax
   28249:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2824d:	f3 0f 1e fa          	endbr64
   28251:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   28255:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
   28259:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   2825d:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   28261:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   28265:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   28269:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   28270:	0f 85 29 2b 00 00    	jne    2ad9f <JS_CallInternal+0x82df>
   28276:	41 83 f9 f8          	cmp    r9d,0xfffffff8
   2827a:	0f 85 a1 2e 00 00    	jne    2b121 <JS_CallInternal+0x8661>
   28280:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28287:	4c 89 ee             	mov    rsi,r13
   2828a:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   28291:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   28298:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2829c:	48 89 c7             	mov    rdi,rax
   2829f:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   282a6:	e8 a5 e8 fe ff       	call   16b50 <js_get_atom_index>
   282ab:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   282b2:	89 c2                	mov    edx,eax
   282b4:	49 8b 70 18          	mov    rsi,QWORD PTR [r8+0x18]
   282b8:	8b 4e 18             	mov    ecx,DWORD PTR [rsi+0x18]
   282bb:	21 c8                	and    eax,ecx
   282bd:	8b 44 86 38          	mov    eax,DWORD PTR [rsi+rax*4+0x38]
   282c1:	48 85 c0             	test   rax,rax
   282c4:	0f 84 29 39 00 00    	je     2bbf3 <JS_CallInternal+0x9133>
   282ca:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   282d1:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   282d8:	00 
   282d9:	48 8d 0c c7          	lea    rcx,[rdi+rax*8]
   282dd:	48 01 f1             	add    rcx,rsi
   282e0:	3b 51 04             	cmp    edx,DWORD PTR [rcx+0x4]
   282e3:	0f 85 fd 38 00 00    	jne    2bbe6 <JS_CallInternal+0x9126>
   282e9:	49 8b 50 20          	mov    rdx,QWORD PTR [r8+0x20]
   282ed:	48 c1 e0 04          	shl    rax,0x4
   282f1:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
   282f6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   282f9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   282fd:	83 f8 f6             	cmp    eax,0xfffffff6
   28300:	76 04                	jbe    28306 <JS_CallInternal+0x5846>
   28302:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   28306:	48 89 d1             	mov    rcx,rdx
   28309:	41 89 c0             	mov    r8d,eax
   2830c:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   28310:	76 13                	jbe    28325 <JS_CallInternal+0x5865>
   28312:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   28316:	8d 57 ff             	lea    edx,[rdi-0x1]
   28319:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   2831d:	85 d2                	test   edx,edx
   2831f:	0f 8e ae 28 00 00    	jle    2abd3 <JS_CallInternal+0x8113>
   28325:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   2832c:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
   28330:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
   28333:	83 fa f6             	cmp    edx,0xfffffff6
   28336:	76 11                	jbe    28349 <JS_CallInternal+0x5889>
   28338:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   2833b:	83 ef 01             	sub    edi,0x1
   2833e:	89 7e fc             	mov    DWORD PTR [rsi-0x4],edi
   28341:	85 ff                	test   edi,edi
   28343:	0f 8e f1 26 00 00    	jle    2aa3a <JS_CallInternal+0x7f7a>
   28349:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   2834d:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   28351:	4c 89 f3             	mov    rbx,r14
   28354:	41 83 f8 06          	cmp    r8d,0x6
   28358:	0f 84 02 af ff ff    	je     23260 <JS_CallInternal+0x7a0>
   2835e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28363:	49 83 c4 01          	add    r12,0x1
   28367:	49 89 c5             	mov    r13,rax
   2836a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2836e:	ff e0                	jmp    rax
   28370:	f3 0f 1e fa          	endbr64
   28374:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2837b:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
   2837f:	45 31 c9             	xor    r9d,r9d
   28382:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
