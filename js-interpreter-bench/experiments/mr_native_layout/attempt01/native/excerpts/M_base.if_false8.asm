; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   2813f:	f3 0f 1e fa          	endbr64
   28143:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   28147:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   2814b:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   28150:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28154:	48 89 c8             	mov    rax,rcx
   28157:	0f 87 dc 1a 00 00    	ja     29c39 <JS_CallInternal+0x7179>
   2815d:	48 83 eb 10          	sub    rbx,0x10
   28161:	85 c0                	test   eax,eax
   28163:	75 0d                	jne    28172 <JS_CallInternal+0x56b2>
   28165:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   2816a:	83 e8 01             	sub    eax,0x1
   2816d:	48 98                	cdqe
   2816f:	49 01 c5             	add    r13,rax
   28172:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28179:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   2817f:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28185:	83 e8 01             	sub    eax,0x1
   28188:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   2818e:	85 c0                	test   eax,eax
   28190:	0f 8e 07 30 00 00    	jle    2b19d <JS_CallInternal+0x86dd>
   28196:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2819b:	4d 8d 65 01          	lea    r12,[r13+0x1]
   2819f:	49 89 c5             	mov    r13,rax
   281a2:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   281a6:	f3 0f 1e fa          	endbr64
   281aa:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   281ae:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   281b2:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   281b7:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   281bb:	48 89 c8             	mov    rax,rcx
   281be:	0f 87 61 1a 00 00    	ja     29c25 <JS_CallInternal+0x7165>
   281c4:	48 83 eb 10          	sub    rbx,0x10
   281c8:	85 c0                	test   eax,eax
   281ca:	74 0d                	je     281d9 <JS_CallInternal+0x5719>
   281cc:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   281d1:	83 e8 01             	sub    eax,0x1
   281d4:	48 98                	cdqe
   281d6:	49 01 c5             	add    r13,rax
   281d9:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   281e0:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   281e6:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   281ec:	83 e8 01             	sub    eax,0x1
   281ef:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   281f5:	85 c0                	test   eax,eax
   281f7:	0f 8e fe 30 00 00    	jle    2b2fb <JS_CallInternal+0x883b>
   281fd:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28202:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28206:	49 89 c5             	mov    r13,rax
   28209:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
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
