
/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/d8:     file format elf64-x86-64


Disassembly of section .text:

0000000001b83180 <Builtins_CallFunction_ReceiverIsNullOrUndefined>:
 1b83180:	8b 57 0f             	mov    edx,DWORD PTR [rdi+0xf]
 1b83183:	49 0b d6             	or     rdx,r14
 1b83186:	8b 77 13             	mov    esi,DWORD PTR [rdi+0x13]
 1b83189:	49 0b f6             	or     rsi,r14
 1b8318c:	f6 42 1f 60          	test   BYTE PTR [rdx+0x1f],0x60
 1b83190:	0f 85 17 00 00 00    	jne    1b831ad <Builtins_CallFunction_ReceiverIsNullOrUndefined+0x2d>
 1b83196:	8b 4e ff             	mov    ecx,DWORD PTR [rsi-0x1]
 1b83199:	49 0b ce             	or     rcx,r14
 1b8319c:	8b 49 13             	mov    ecx,DWORD PTR [rcx+0x13]
 1b8319f:	49 0b ce             	or     rcx,r14
 1b831a2:	8b 49 13             	mov    ecx,DWORD PTR [rcx+0x13]
 1b831a5:	49 0b ce             	or     rcx,r14
 1b831a8:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
 1b831ad:	44 8b 7f 0b          	mov    r15d,DWORD PTR [rdi+0xb]
 1b831b1:	4d 8b 95 00 5a 00 00 	mov    r10,QWORD PTR [r13+0x5a00]
 1b831b8:	41 80 3a 00          	cmp    BYTE PTR [r10],0x0
 1b831bc:	0f 85 a3 00 00 00    	jne    1b83265 <Builtins_CallFunction_ReceiverIsNullOrUndefined+0xe5>
 1b831c2:	49 8d 56 11          	lea    rdx,[r14+0x11]
 1b831c6:	4d 8b 95 d0 02 00 00 	mov    r10,QWORD PTR [r13+0x2d0]
 1b831cd:	49 8b df             	mov    rbx,r15
 1b831d0:	c1 eb 08             	shr    ebx,0x8
 1b831d3:	c1 e3 04             	shl    ebx,0x4
 1b831d6:	41 0f b7 5c 1a 08    	movzx  ebx,WORD PTR [r10+rbx*1+0x8]
 1b831dc:	48 2b d8             	sub    rbx,rax
 1b831df:	0f 8e 68 00 00 00    	jle    1b8324d <Builtins_CallFunction_ReceiverIsNullOrUndefined+0xcd>
 1b831e5:	4c 8b d4             	mov    r10,rsp
 1b831e8:	4d 2b 55 90          	sub    r10,QWORD PTR [r13-0x70]
 1b831ec:	49 c1 fa 03          	sar    r10,0x3
 1b831f0:	4c 3b d3             	cmp    r10,rbx
 1b831f3:	0f 8e 3b 00 00 00    	jle    1b83234 <Builtins_CallFunction_ReceiverIsNullOrUndefined+0xb4>
 1b831f9:	4c 8b c4             	mov    r8,rsp
 1b831fc:	4c 8d 14 dd 00 00 00 	lea    r10,[rbx*8+0x0]
 1b83203:	00 
 1b83204:	49 2b e2             	sub    rsp,r10
 1b83207:	4c 8d 48 01          	lea    r9,[rax+0x1]
 1b8320b:	45 33 db             	xor    r11d,r11d
 1b8320e:	4f 8b 14 d8          	mov    r10,QWORD PTR [r8+r11*8]
 1b83212:	4e 89 14 dc          	mov    QWORD PTR [rsp+r11*8],r10
 1b83216:	49 ff c3             	inc    r11
 1b83219:	4d 3b d9             	cmp    r11,r9
 1b8321c:	7c f0                	jl     1b8320e <Builtins_CallFunction_ReceiverIsNullOrUndefined+0x8e>
 1b8321e:	4e 8d 04 cc          	lea    r8,[rsp+r9*8]
 1b83222:	4d 8d 56 11          	lea    r10,[r14+0x11]
 1b83226:	48 ff cb             	dec    rbx
 1b83229:	4d 89 14 d8          	mov    QWORD PTR [r8+rbx*8],r10
 1b8322d:	7f f7                	jg     1b83226 <Builtins_CallFunction_ReceiverIsNullOrUndefined+0xa6>
 1b8322f:	e9 19 00 00 00       	jmp    1b8324d <Builtins_CallFunction_ReceiverIsNullOrUndefined+0xcd>
 1b83234:	55                   	push   rbp
 1b83235:	48 8b ec             	mov    rbp,rsp
 1b83238:	6a 1a                	push   0x1a
 1b8323a:	33 c0                	xor    eax,eax
 1b8323c:	49 8b 9d 58 48 00 00 	mov    rbx,QWORD PTR [r13+0x4858]
 1b83243:	e8 78 e1 0c 00       	call   1c513c0 <Builtins_CEntry_Return1_ArgvOnStack_NoBuiltinExit>
 1b83248:	cc                   	int3
 1b83249:	48 8b e5             	mov    rsp,rbp
 1b8324c:	5d                   	pop    rbp
 1b8324d:	4d 8b 95 d0 02 00 00 	mov    r10,QWORD PTR [r13+0x2d0]
 1b83254:	49 8b cf             	mov    rcx,r15
 1b83257:	c1 e9 08             	shr    ecx,0x8
 1b8325a:	c1 e1 04             	shl    ecx,0x4
 1b8325d:	49 8b 0c 0a          	mov    rcx,QWORD PTR [r10+rcx*1]
 1b83261:	ff e1                	jmp    rcx
 1b83263:	eb 3c                	jmp    1b832a1 <Builtins_CallFunction_ReceiverIsNullOrUndefined+0x121>
 1b83265:	4c 8b 54 24 08       	mov    r10,QWORD PTR [rsp+0x8]
 1b8326a:	55                   	push   rbp
 1b8326b:	48 8b ec             	mov    rbp,rsp
 1b8326e:	6a 1a                	push   0x1a
 1b83270:	41 57                	push   r15
 1b83272:	03 c0                	add    eax,eax
 1b83274:	50                   	push   rax
 1b83275:	d1 f8                	sar    eax,1
 1b83277:	48 63 c0             	movsxd rax,eax
 1b8327a:	57                   	push   rdi
 1b8327b:	57                   	push   rdi
 1b8327c:	41 52                	push   r10
 1b8327e:	b8 02 00 00 00       	mov    eax,0x2
 1b83283:	49 8b 9d a8 45 00 00 	mov    rbx,QWORD PTR [r13+0x45a8]
 1b8328a:	e8 31 e1 0c 00       	call   1c513c0 <Builtins_CEntry_Return1_ArgvOnStack_NoBuiltinExit>
 1b8328f:	5f                   	pop    rdi
 1b83290:	58                   	pop    rax
 1b83291:	d1 f8                	sar    eax,1
 1b83293:	48 63 c0             	movsxd rax,eax
 1b83296:	41 5f                	pop    r15
 1b83298:	48 8b e5             	mov    rsp,rbp
 1b8329b:	5d                   	pop    rbp
 1b8329c:	e9 21 ff ff ff       	jmp    1b831c2 <Builtins_CallFunction_ReceiverIsNullOrUndefined+0x42>
 1b832a1:	cc                   	int3
 1b832a2:	cc                   	int3
 1b832a3:	cc                   	int3

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section malloc_hook:

Disassembly of section .plt:
