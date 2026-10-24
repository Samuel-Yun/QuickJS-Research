; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   2410f:	f3 0f 1e fa          	endbr64
   24113:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2411a:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
   2411e:	49 8d 4c 24 04       	lea    rcx,[r12+0x4]
   24123:	4d 8d 54 24 ff       	lea    r10,[r12-0x1]
   24128:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2412f:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   24133:	48 8b 70 60          	mov    rsi,QWORD PTR [rax+0x60]
   24137:	89 f8                	mov    eax,edi
   24139:	48 8d 04 40          	lea    rax,[rax+rax*2]
   2413d:	4c 8d 04 c6          	lea    r8,[rsi+rax*8]
   24141:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24145:	83 f8 ff             	cmp    eax,0xffffffff
   24148:	0f 85 f2 6e 00 00    	jne    2b040 <JS_CallInternal+0x84a0>
   2414e:	41 8b 56 10          	mov    edx,DWORD PTR [r14+0x10]
   24152:	41 0f b6 48 10       	movzx  ecx,BYTE PTR [r8+0x10]
   24157:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2415d:	81 fa 00 00 01 00    	cmp    edx,0x10000
   24163:	0f 84 67 5f 00 00    	je     2a0d0 <JS_CallInternal+0x7530>
   24169:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   2416d:	80 f9 1f             	cmp    cl,0x1f
   24170:	77 07                	ja     24179 <JS_CallInternal+0x15d9>
   24172:	83 c1 01             	add    ecx,0x1
   24175:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
   24179:	80 f9 20             	cmp    cl,0x20
   2417c:	0f 84 71 5f 00 00    	je     2a0f3 <JS_CallInternal+0x7553>
   24182:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   24186:	4c 89 f6             	mov    rsi,r14
   24189:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   24190:	8b 4a 18             	mov    ecx,DWORD PTR [rdx+0x18]
   24193:	44 89 ef             	mov    edi,r13d
   24196:	21 cf                	and    edi,ecx
   24198:	44 8b 4c ba 38       	mov    r9d,DWORD PTR [rdx+rdi*4+0x38]
   2419d:	4d 85 c9             	test   r9,r9
   241a0:	0f 84 44 4d 00 00    	je     28eea <JS_CallInternal+0x634a>
   241a6:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   241ad:	00 
   241ae:	4a 8d 0c cf          	lea    rcx,[rdi+r9*8]
   241b2:	48 01 d1             	add    rcx,rdx
   241b5:	44 3b 69 04          	cmp    r13d,DWORD PTR [rcx+0x4]
   241b9:	0f 85 1b 4d 00 00    	jne    28eda <JS_CallInternal+0x633a>
   241bf:	80 79 03 3f          	cmp    BYTE PTR [rcx+0x3],0x3f
   241c3:	48 8b 7e 20          	mov    rdi,QWORD PTR [rsi+0x20]
   241c7:	0f 87 22 53 00 00    	ja     294ef <JS_CallInternal+0x694f>
   241cd:	4c 89 c9             	mov    rcx,r9
   241d0:	48 c1 e1 04          	shl    rcx,0x4
   241d4:	48 83 e9 10          	sub    rcx,0x10
   241d8:	48 01 cf             	add    rdi,rcx
   241db:	4c 8b 6f 08          	mov    r13,QWORD PTR [rdi+0x8]
   241df:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   241e2:	41 83 fd f6          	cmp    r13d,0xfffffff6
   241e6:	76 04                	jbe    241ec <JS_CallInternal+0x164c>
   241e8:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   241ec:	4c 8d 53 f0          	lea    r10,[rbx-0x10]
   241f0:	49 39 f6             	cmp    r14,rsi
   241f3:	0f 84 a5 7f 00 00    	je     2c19e <JS_CallInternal+0x95fe>
   241f9:	49 89 c6             	mov    r14,rax
   241fc:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   24200:	49 8b 32             	mov    rsi,QWORD PTR [r10]
   24203:	83 fa f6             	cmp    edx,0xfffffff6
   24206:	76 11                	jbe    24219 <JS_CallInternal+0x1679>
   24208:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2420b:	83 e8 01             	sub    eax,0x1
   2420e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24211:	85 c0                	test   eax,eax
   24213:	0f 8e 61 65 00 00    	jle    2a77a <JS_CallInternal+0x7bda>
   24219:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
   2421d:	49 83 c4 05          	add    r12,0x5
   24221:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
   24225:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2422b:	49 89 c5             	mov    r13,rax
   2422e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24232:	ff e0                	jmp    rax
   24234:	f3 0f 1e fa          	endbr64
   24238:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2423c:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   24240:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24244:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24248:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   2424c:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24253:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   24257:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2425e:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   24265:	83 fb f9             	cmp    ebx,0xfffffff9
   24268:	0f 85 33 5f 00 00    	jne    2a1a1 <JS_CallInternal+0x7601>
   2426e:	83 f8 f9             	cmp    eax,0xfffffff9
   24271:	0f 85 2a 5f 00 00    	jne    2a1a1 <JS_CallInternal+0x7601>
   24277:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2427e:	ba 12 00 00 00       	mov    edx,0x12
   24283:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
