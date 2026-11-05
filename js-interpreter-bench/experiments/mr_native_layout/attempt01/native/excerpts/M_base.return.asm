; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   231a3:	f3 0f 1e fa          	endbr64
   231a7:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   231ab:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   231af:	48 83 eb 10          	sub    rbx,0x10
   231b3:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   231ba:	66 83 7f 40 00       	cmp    WORD PTR [rdi+0x40],0x0
   231bf:	0f 85 81 6e 00 00    	jne    2a046 <JS_CallInternal+0x7586>
   231c5:	4c 8b a5 30 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d0]
   231cc:	49 39 dc             	cmp    r12,rbx
   231cf:	0f 83 1a 01 00 00    	jae    232ef <JS_CallInternal+0x82f>
   231d5:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   231dc:	49 89 ce             	mov    r14,rcx
   231df:	49 89 c7             	mov    r15,rax
   231e2:	eb 11                	jmp    231f5 <JS_CallInternal+0x735>
   231e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   231e8:	49 83 c4 10          	add    r12,0x10
   231ec:	49 39 dc             	cmp    r12,rbx
   231ef:	0f 83 b9 01 00 00    	jae    233ae <JS_CallInternal+0x8ee>
   231f5:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
   231fa:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
   231fe:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   23202:	76 e4                	jbe    231e8 <JS_CallInternal+0x728>
   23204:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23207:	8d 50 ff             	lea    edx,[rax-0x1]
   2320a:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2320d:	85 d2                	test   edx,edx
   2320f:	7f d7                	jg     231e8 <JS_CallInternal+0x728>
   23211:	49 8b 7d 10          	mov    rdi,QWORD PTR [r13+0x10]
   23215:	4c 89 c2             	mov    rdx,r8
   23218:	e8 83 96 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2321d:	eb c9                	jmp    231e8 <JS_CallInternal+0x728>
   2321f:	31 c9                	xor    ecx,ecx
   23221:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   23228:	41 83 fd 77          	cmp    r13d,0x77
   2322c:	41 0f b7 d6          	movzx  edx,r14w
   23230:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23237:	0f 94 c1             	sete   cl
   2323a:	e8 91 87 02 00       	call   4b9d0 <get_var_ref>
   2323f:	49 89 c5             	mov    r13,rax
   23242:	48 85 c0             	test   rax,rax
   23245:	0f 85 f7 fd ff ff    	jne    23042 <JS_CallInternal+0x582>
   2324b:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
   23252:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
   23259:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   23260:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   23267:	83 b9 e0 04 00 00 ff 	cmp    DWORD PTR [rcx+0x4e0],0xffffffff
   2326e:	48 8b 81 d8 04 00 00 	mov    rax,QWORD PTR [rcx+0x4d8]
   23275:	75 39                	jne    232b0 <JS_CallInternal+0x7f0>
   23277:	66 83 78 12 03       	cmp    WORD PTR [rax+0x12],0x3
   2327c:	75 32                	jne    232b0 <JS_CallInternal+0x7f0>
   2327e:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
   23282:	8b 51 18             	mov    edx,DWORD PTR [rcx+0x18]
   23285:	89 d0                	mov    eax,edx
   23287:	83 e0 39             	and    eax,0x39
   2328a:	8b 44 81 38          	mov    eax,DWORD PTR [rcx+rax*4+0x38]
   2328e:	48 85 c0             	test   rax,rax
   23291:	0f 84 2c 68 00 00    	je     29ac3 <JS_CallInternal+0x7003>
   23297:	48 8d 14 95 34 00 00 	lea    rdx,[rdx*4+0x34]
   2329e:	00 
   2329f:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
   232a3:	48 01 c8             	add    rax,rcx
   232a6:	83 78 04 39          	cmp    DWORD PTR [rax+0x4],0x39
   232aa:	0f 85 06 68 00 00    	jne    29ab6 <JS_CallInternal+0x6ff6>
   232b0:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   232b7:	80 b8 e8 04 00 00 00 	cmp    BYTE PTR [rax+0x4e8],0x0
   232be:	0f 84 39 01 00 00    	je     233fd <JS_CallInternal+0x93d>
   232c4:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   232cb:	b9 06 00 00 00       	mov    ecx,0x6
   232d0:	f6 40 11 30          	test   BYTE PTR [rax+0x11],0x30
   232d4:	b8 00 00 00 00       	mov    eax,0x0
   232d9:	0f 84 d4 fe ff ff    	je     231b3 <JS_CallInternal+0x6f3>
   232df:	90                   	nop
   232e0:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   232e7:	4c 89 67 30          	mov    QWORD PTR [rdi+0x30],r12
   232eb:	48 89 5f 40          	mov    QWORD PTR [rdi+0x40],rbx
   232ef:	48 8b 9d c8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x138]
   232f6:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   232f9:	48 8b 9d c0 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x140]
   23300:	48 89 93 f0 04 00 00 	mov    QWORD PTR [rbx+0x4f0],rdx
   23307:	48 89 ca             	mov    rdx,rcx
   2330a:	e9 ad fd ff ff       	jmp    230bc <JS_CallInternal+0x5fc>
   2330f:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   23316:	48 8d 04 80          	lea    rax,[rax+rax*4]
   2331a:	48 c1 e0 03          	shl    rax,0x3
   2331e:	48 03 81 58 04 00 00 	add    rax,QWORD PTR [rcx+0x458]
   23325:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23329:	48 85 c0             	test   rax,rax
   2332c:	0f 84 8e 01 00 00    	je     234c0 <JS_CallInternal+0xa00>
   23332:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
   23335:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
