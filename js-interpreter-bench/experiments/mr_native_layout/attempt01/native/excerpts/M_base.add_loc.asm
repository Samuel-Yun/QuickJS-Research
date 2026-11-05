; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   26f93:	f3 0f 1e fa          	endbr64
   26f97:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   26f9c:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   26fa3:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
   26fa8:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   26fac:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   26fb0:	49 c1 e5 04          	shl    r13,0x4
   26fb4:	49 01 c5             	add    r13,rax
   26fb7:	44 89 f1             	mov    ecx,r14d
   26fba:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   26fbe:	09 d1                	or     ecx,edx
   26fc0:	0f 85 ca 43 00 00    	jne    2b390 <JS_CallInternal+0x88d0>
   26fc6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   26fca:	49 63 c8             	movsxd rcx,r8d
   26fcd:	48 63 d0             	movsxd rdx,eax
   26fd0:	44 01 c0             	add    eax,r8d
   26fd3:	48 01 ca             	add    rdx,rcx
   26fd6:	48 63 c8             	movsxd rcx,eax
   26fd9:	48 39 d1             	cmp    rcx,rdx
   26fdc:	0f 85 95 43 00 00    	jne    2b377 <JS_CallInternal+0x88b7>
   26fe2:	89 c0                	mov    eax,eax
   26fe4:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   26fe8:	31 c0                	xor    eax,eax
   26fea:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
   26fee:	48 83 eb 10          	sub    rbx,0x10
   26ff2:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26ff8:	49 83 c4 02          	add    r12,0x2
   26ffc:	49 89 c5             	mov    r13,rax
   26fff:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27003:	ff e0                	jmp    rax
   27005:	f3 0f 1e fa          	endbr64
   27009:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   2700d:	4c 8b 5b e8          	mov    r11,QWORD PTR [rbx-0x18]
   27011:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27015:	4c 8b 53 e0          	mov    r10,QWORD PTR [rbx-0x20]
   27019:	41 89 fe             	mov    r14d,edi
   2701c:	4c 89 de             	mov    rsi,r11
   2701f:	48 89 f9             	mov    rcx,rdi
   27022:	45 09 de             	or     r14d,r11d
   27025:	4c 89 c0             	mov    rax,r8
   27028:	0f 85 45 42 00 00    	jne    2b273 <JS_CallInternal+0x87b3>
   2702e:	49 63 ca             	movsxd rcx,r10d
   27031:	49 63 f0             	movsxd rsi,r8d
   27034:	44 01 d0             	add    eax,r10d
   27037:	48 01 f1             	add    rcx,rsi
   2703a:	48 63 d0             	movsxd rdx,eax
   2703d:	48 39 ca             	cmp    rdx,rcx
   27040:	0f 85 15 42 00 00    	jne    2b25b <JS_CallInternal+0x879b>
   27046:	89 c0                	mov    eax,eax
   27048:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   2704c:	31 c0                	xor    eax,eax
   2704e:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   27052:	48 83 eb 10          	sub    rbx,0x10
   27056:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2705b:	49 83 c4 01          	add    r12,0x1
   2705f:	49 89 c5             	mov    r13,rax
   27062:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27066:	ff e0                	jmp    rax
   27068:	f3 0f 1e fa          	endbr64
   2706c:	8b 7b f8             	mov    edi,DWORD PTR [rbx-0x8]
   2706f:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   27073:	85 ff                	test   edi,edi
   27075:	0f 85 1a 2b 00 00    	jne    29b95 <JS_CallInternal+0x70d5>
   2707b:	f7 d0                	not    eax
   2707d:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27084:	00 
   27085:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   27089:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2708e:	49 83 c4 01          	add    r12,0x1
   27092:	49 89 c5             	mov    r13,rax
   27095:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27099:	ff e0                	jmp    rax
   2709b:	f3 0f 1e fa          	endbr64
   2709f:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   270a4:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   270ab:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   270b0:	49 c1 e5 04          	shl    r13,0x4
   270b4:	49 01 c5             	add    r13,rax
   270b7:	f3 41 0f 6f 6d 00    	movdqu xmm5,XMMWORD PTR [r13+0x0]
   270bd:	0f 29 ad f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm5
   270c4:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
   270cb:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
   270d2:	85 d2                	test   edx,edx
   270d4:	0f 85 3e 23 00 00    	jne    29418 <JS_CallInternal+0x6958>
   270da:	3d 00 00 00 80       	cmp    eax,0x80000000
   270df:	0f 84 33 23 00 00    	je     29418 <JS_CallInternal+0x6958>
   270e5:	83 e8 01             	sub    eax,0x1
   270e8:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   270ef:	00 
   270f0:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
