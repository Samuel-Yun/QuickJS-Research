
/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/d8:     file format elf64-x86-64


Disassembly of section .text:

0000000001b832c0 <Builtins_CallFunction_ReceiverIsNotNullOrUndefined>:
 1b832c0:	8b 57 0f             	mov    edx,DWORD PTR [rdi+0xf]
 1b832c3:	49 0b d6             	or     rdx,r14
 1b832c6:	8b 77 13             	mov    esi,DWORD PTR [rdi+0x13]
 1b832c9:	49 0b f6             	or     rsi,r14
 1b832cc:	f6 42 1f 60          	test   BYTE PTR [rdx+0x1f],0x60
 1b832d0:	0f 85 3f 00 00 00    	jne    1b83315 <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0x55>
 1b832d6:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
 1b832db:	f6 c1 01             	test   cl,0x1
 1b832de:	74 0b                	je     1b832eb <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0x2b>
 1b832e0:	8b 59 ff             	mov    ebx,DWORD PTR [rcx-0x1]
 1b832e3:	81 fb 00 00 1a 00    	cmp    ebx,0x1a0000
 1b832e9:	73 2a                	jae    1b83315 <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0x55>
 1b832eb:	55                   	push   rbp
 1b832ec:	48 8b ec             	mov    rbp,rsp
 1b832ef:	6a 1a                	push   0x1a
 1b832f1:	03 c0                	add    eax,eax
 1b832f3:	50                   	push   rax
 1b832f4:	57                   	push   rdi
 1b832f5:	48 8b c1             	mov    rax,rcx
 1b832f8:	56                   	push   rsi
 1b832f9:	e8 42 0a 13 00       	call   1cb3d40 <Builtins_ToObject>
 1b832fe:	5e                   	pop    rsi
 1b832ff:	48 8b c8             	mov    rcx,rax
 1b83302:	5f                   	pop    rdi
 1b83303:	58                   	pop    rax
 1b83304:	d1 e8                	shr    eax,1
 1b83306:	48 8b e5             	mov    rsp,rbp
 1b83309:	5d                   	pop    rbp
 1b8330a:	8b 57 0f             	mov    edx,DWORD PTR [rdi+0xf]
 1b8330d:	49 0b d6             	or     rdx,r14
 1b83310:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
 1b83315:	44 8b 7f 0b          	mov    r15d,DWORD PTR [rdi+0xb]
 1b83319:	4d 8b 95 00 5a 00 00 	mov    r10,QWORD PTR [r13+0x5a00]
 1b83320:	41 80 3a 00          	cmp    BYTE PTR [r10],0x0
 1b83324:	0f 85 a3 00 00 00    	jne    1b833cd <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0x10d>
 1b8332a:	49 8d 56 11          	lea    rdx,[r14+0x11]
 1b8332e:	4d 8b 95 d0 02 00 00 	mov    r10,QWORD PTR [r13+0x2d0]
 1b83335:	49 8b df             	mov    rbx,r15
 1b83338:	c1 eb 08             	shr    ebx,0x8
 1b8333b:	c1 e3 04             	shl    ebx,0x4
 1b8333e:	41 0f b7 5c 1a 08    	movzx  ebx,WORD PTR [r10+rbx*1+0x8]
 1b83344:	48 2b d8             	sub    rbx,rax
 1b83347:	0f 8e 68 00 00 00    	jle    1b833b5 <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0xf5>
 1b8334d:	4c 8b d4             	mov    r10,rsp
 1b83350:	4d 2b 55 90          	sub    r10,QWORD PTR [r13-0x70]
 1b83354:	49 c1 fa 03          	sar    r10,0x3
 1b83358:	4c 3b d3             	cmp    r10,rbx
 1b8335b:	0f 8e 3b 00 00 00    	jle    1b8339c <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0xdc>
 1b83361:	4c 8b c4             	mov    r8,rsp
 1b83364:	4c 8d 14 dd 00 00 00 	lea    r10,[rbx*8+0x0]
 1b8336b:	00 
 1b8336c:	49 2b e2             	sub    rsp,r10
 1b8336f:	4c 8d 48 01          	lea    r9,[rax+0x1]
 1b83373:	45 33 db             	xor    r11d,r11d
 1b83376:	4f 8b 14 d8          	mov    r10,QWORD PTR [r8+r11*8]
 1b8337a:	4e 89 14 dc          	mov    QWORD PTR [rsp+r11*8],r10
 1b8337e:	49 ff c3             	inc    r11
 1b83381:	4d 3b d9             	cmp    r11,r9
 1b83384:	7c f0                	jl     1b83376 <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0xb6>
 1b83386:	4e 8d 04 cc          	lea    r8,[rsp+r9*8]
 1b8338a:	4d 8d 56 11          	lea    r10,[r14+0x11]
 1b8338e:	48 ff cb             	dec    rbx
 1b83391:	4d 89 14 d8          	mov    QWORD PTR [r8+rbx*8],r10
 1b83395:	7f f7                	jg     1b8338e <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0xce>
 1b83397:	e9 19 00 00 00       	jmp    1b833b5 <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0xf5>
 1b8339c:	55                   	push   rbp
 1b8339d:	48 8b ec             	mov    rbp,rsp
 1b833a0:	6a 1a                	push   0x1a
 1b833a2:	33 c0                	xor    eax,eax
 1b833a4:	49 8b 9d 58 48 00 00 	mov    rbx,QWORD PTR [r13+0x4858]
 1b833ab:	e8 10 e0 0c 00       	call   1c513c0 <Builtins_CEntry_Return1_ArgvOnStack_NoBuiltinExit>
 1b833b0:	cc                   	int3
 1b833b1:	48 8b e5             	mov    rsp,rbp
 1b833b4:	5d                   	pop    rbp
 1b833b5:	4d 8b 95 d0 02 00 00 	mov    r10,QWORD PTR [r13+0x2d0]
 1b833bc:	49 8b cf             	mov    rcx,r15
 1b833bf:	c1 e9 08             	shr    ecx,0x8
 1b833c2:	c1 e1 04             	shl    ecx,0x4
 1b833c5:	49 8b 0c 0a          	mov    rcx,QWORD PTR [r10+rcx*1]
 1b833c9:	ff e1                	jmp    rcx
 1b833cb:	eb 3c                	jmp    1b83409 <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0x149>
 1b833cd:	4c 8b 54 24 08       	mov    r10,QWORD PTR [rsp+0x8]
 1b833d2:	55                   	push   rbp
 1b833d3:	48 8b ec             	mov    rbp,rsp
 1b833d6:	6a 1a                	push   0x1a
 1b833d8:	41 57                	push   r15
 1b833da:	03 c0                	add    eax,eax
 1b833dc:	50                   	push   rax
 1b833dd:	d1 f8                	sar    eax,1
 1b833df:	48 63 c0             	movsxd rax,eax
 1b833e2:	57                   	push   rdi
 1b833e3:	57                   	push   rdi
 1b833e4:	41 52                	push   r10
 1b833e6:	b8 02 00 00 00       	mov    eax,0x2
 1b833eb:	49 8b 9d a8 45 00 00 	mov    rbx,QWORD PTR [r13+0x45a8]
 1b833f2:	e8 c9 df 0c 00       	call   1c513c0 <Builtins_CEntry_Return1_ArgvOnStack_NoBuiltinExit>
 1b833f7:	5f                   	pop    rdi
 1b833f8:	58                   	pop    rax
 1b833f9:	d1 f8                	sar    eax,1
 1b833fb:	48 63 c0             	movsxd rax,eax
 1b833fe:	41 5f                	pop    r15
 1b83400:	48 8b e5             	mov    rsp,rbp
 1b83403:	5d                   	pop    rbp
 1b83404:	e9 21 ff ff ff       	jmp    1b8332a <Builtins_CallFunction_ReceiverIsNotNullOrUndefined+0x6a>
 1b83409:	cc                   	int3
 1b8340a:	cc                   	int3
 1b8340b:	cc                   	int3

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section malloc_hook:

Disassembly of section .plt:
