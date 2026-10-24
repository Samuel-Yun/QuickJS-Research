; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   272aa:	f3 0f 1e fa          	endbr64
   272ae:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   272b3:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   272ba:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   272bf:	49 c1 e5 04          	shl    r13,0x4
   272c3:	49 01 c5             	add    r13,rax
   272c6:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   272cc:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
   272d3:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
   272da:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
   272e1:	85 d2                	test   edx,edx
   272e3:	0f 85 fd 22 00 00    	jne    295e6 <JS_CallInternal+0x6a46>
   272e9:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   272ee:	0f 84 f2 22 00 00    	je     295e6 <JS_CallInternal+0x6a46>
   272f4:	83 c0 01             	add    eax,0x1
   272f7:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   272fe:	00 
   272ff:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   27303:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27309:	49 83 c4 02          	add    r12,0x2
   2730d:	49 89 c5             	mov    r13,rax
   27310:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27314:	ff e0                	jmp    rax
   27316:	f3 0f 1e fa          	endbr64
   2731a:	44 8b 43 f8          	mov    r8d,DWORD PTR [rbx-0x8]
   2731e:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   27322:	45 85 c0             	test   r8d,r8d
   27325:	0f 85 87 25 00 00    	jne    298b2 <JS_CallInternal+0x6d12>
   2732b:	3d 00 00 00 80       	cmp    eax,0x80000000
   27330:	0f 84 7c 25 00 00    	je     298b2 <JS_CallInternal+0x6d12>
   27336:	83 e8 01             	sub    eax,0x1
   27339:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   27340:	00 
   27341:	48 89 03             	mov    QWORD PTR [rbx],rax
   27344:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27349:	48 83 c3 10          	add    rbx,0x10
   2734d:	49 83 c4 01          	add    r12,0x1
   27351:	49 89 c5             	mov    r13,rax
   27354:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27358:	ff e0                	jmp    rax
   2735a:	f3 0f 1e fa          	endbr64
   2735e:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   27365:	4d 63 2c 24          	movsxd r13,DWORD PTR [r12]
   27369:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   2736f:	4d 01 e5             	add    r13,r12
   27372:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   27378:	83 e8 01             	sub    eax,0x1
   2737b:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   27381:	85 c0                	test   eax,eax
   27383:	0f 8e a8 45 00 00    	jle    2b931 <JS_CallInternal+0x8d91>
   27389:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2738e:	4d 8d 65 01          	lea    r12,[r13+0x1]
   27392:	49 89 c5             	mov    r13,rax
   27395:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   27399:	f3 0f 1e fa          	endbr64
   2739d:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   273a1:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   273a4:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   273a8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   273ac:	0f 85 0c 45 00 00    	jne    2b8be <JS_CallInternal+0x8d1e>
   273b2:	31 c8                	xor    eax,ecx
   273b4:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   273bb:	00 
   273bc:	48 83 eb 10          	sub    rbx,0x10
   273c0:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   273c4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   273c9:	49 83 c4 01          	add    r12,0x1
   273cd:	49 89 c5             	mov    r13,rax
   273d0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   273d4:	ff e0                	jmp    rax
   273d6:	f3 0f 1e fa          	endbr64
   273da:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   273e1:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   273e5:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   273e9:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   273ed:	41 83 fd ff          	cmp    r13d,0xffffffff
   273f1:	0f 84 63 23 00 00    	je     2975a <JS_CallInternal+0x6bba>
   273f7:	41 83 fd 02          	cmp    r13d,0x2
   273fb:	0f 84 59 23 00 00    	je     2975a <JS_CallInternal+0x6bba>
   27401:	41 83 fd f6          	cmp    r13d,0xfffffff6
   27405:	76 13                	jbe    2741a <JS_CallInternal+0x487a>
   27407:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   2740b:	83 e8 01             	sub    eax,0x1
   2740e:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   27412:	85 c0                	test   eax,eax
   27414:	0f 8e d1 39 00 00    	jle    2adeb <JS_CallInternal+0x824b>
   2741a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2741f:	48 83 eb 10          	sub    rbx,0x10
   27423:	49 83 c4 01          	add    r12,0x1
   27427:	49 89 c5             	mov    r13,rax
