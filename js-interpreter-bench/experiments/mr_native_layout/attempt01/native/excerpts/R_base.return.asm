; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   23283:	f3 0f 1e fa          	endbr64
   23287:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2328b:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2328f:	48 83 eb 10          	sub    rbx,0x10
   23293:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   2329a:	66 83 7f 40 00       	cmp    WORD PTR [rdi+0x40],0x0
   2329f:	0f 85 c5 6e 00 00    	jne    2a16a <JS_CallInternal+0x75ca>
   232a5:	4c 8b a5 30 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d0]
   232ac:	49 39 dc             	cmp    r12,rbx
   232af:	0f 83 1a 01 00 00    	jae    233cf <JS_CallInternal+0x82f>
   232b5:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   232bc:	49 89 ce             	mov    r14,rcx
   232bf:	49 89 c7             	mov    r15,rax
   232c2:	eb 11                	jmp    232d5 <JS_CallInternal+0x735>
   232c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   232c8:	49 83 c4 10          	add    r12,0x10
   232cc:	49 39 dc             	cmp    r12,rbx
   232cf:	0f 83 b9 01 00 00    	jae    2348e <JS_CallInternal+0x8ee>
   232d5:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
   232da:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
   232de:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   232e2:	76 e4                	jbe    232c8 <JS_CallInternal+0x728>
   232e4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   232e7:	8d 50 ff             	lea    edx,[rax-0x1]
   232ea:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   232ed:	85 d2                	test   edx,edx
   232ef:	7f d7                	jg     232c8 <JS_CallInternal+0x728>
   232f1:	49 8b 7d 10          	mov    rdi,QWORD PTR [r13+0x10]
   232f5:	4c 89 c2             	mov    rdx,r8
   232f8:	e8 a3 95 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   232fd:	eb c9                	jmp    232c8 <JS_CallInternal+0x728>
   232ff:	31 c9                	xor    ecx,ecx
   23301:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   23308:	41 83 fd 77          	cmp    r13d,0x77
   2330c:	41 0f b7 d6          	movzx  edx,r14w
   23310:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23317:	0f 94 c1             	sete   cl
   2331a:	e8 51 89 02 00       	call   4bc70 <get_var_ref>
   2331f:	49 89 c5             	mov    r13,rax
   23322:	48 85 c0             	test   rax,rax
   23325:	0f 85 f7 fd ff ff    	jne    23122 <JS_CallInternal+0x582>
   2332b:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
   23332:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
   23339:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   23340:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   23347:	83 b9 e0 04 00 00 ff 	cmp    DWORD PTR [rcx+0x4e0],0xffffffff
   2334e:	48 8b 81 d8 04 00 00 	mov    rax,QWORD PTR [rcx+0x4d8]
   23355:	75 39                	jne    23390 <JS_CallInternal+0x7f0>
   23357:	66 83 78 12 03       	cmp    WORD PTR [rax+0x12],0x3
   2335c:	75 32                	jne    23390 <JS_CallInternal+0x7f0>
   2335e:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
   23362:	8b 51 18             	mov    edx,DWORD PTR [rcx+0x18]
   23365:	89 d0                	mov    eax,edx
   23367:	83 e0 39             	and    eax,0x39
   2336a:	8b 44 81 38          	mov    eax,DWORD PTR [rcx+rax*4+0x38]
   2336e:	48 85 c0             	test   rax,rax
   23371:	0f 84 d6 67 00 00    	je     29b4d <JS_CallInternal+0x6fad>
   23377:	48 8d 14 95 34 00 00 	lea    rdx,[rdx*4+0x34]
   2337e:	00 
   2337f:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
   23383:	48 01 c8             	add    rax,rcx
   23386:	83 78 04 39          	cmp    DWORD PTR [rax+0x4],0x39
   2338a:	0f 85 b0 67 00 00    	jne    29b40 <JS_CallInternal+0x6fa0>
   23390:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   23397:	80 b8 e8 04 00 00 00 	cmp    BYTE PTR [rax+0x4e8],0x0
   2339e:	0f 84 39 01 00 00    	je     234dd <JS_CallInternal+0x93d>
   233a4:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   233ab:	b9 06 00 00 00       	mov    ecx,0x6
   233b0:	f6 40 11 30          	test   BYTE PTR [rax+0x11],0x30
   233b4:	b8 00 00 00 00       	mov    eax,0x0
   233b9:	0f 84 d4 fe ff ff    	je     23293 <JS_CallInternal+0x6f3>
   233bf:	90                   	nop
   233c0:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   233c7:	4c 89 67 30          	mov    QWORD PTR [rdi+0x30],r12
   233cb:	48 89 5f 40          	mov    QWORD PTR [rdi+0x40],rbx
   233cf:	48 8b 9d c8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x138]
   233d6:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   233d9:	48 8b 9d c0 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x140]
   233e0:	48 89 93 f0 04 00 00 	mov    QWORD PTR [rbx+0x4f0],rdx
   233e7:	48 89 ca             	mov    rdx,rcx
   233ea:	e9 ad fd ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
   233ef:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   233f6:	48 8d 04 80          	lea    rax,[rax+rax*4]
   233fa:	48 c1 e0 03          	shl    rax,0x3
   233fe:	48 03 81 58 04 00 00 	add    rax,QWORD PTR [rcx+0x458]
   23405:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23409:	48 85 c0             	test   rax,rax
   2340c:	0f 84 8e 01 00 00    	je     235a0 <JS_CallInternal+0xa00>
   23412:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
   23415:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
