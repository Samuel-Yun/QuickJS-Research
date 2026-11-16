
... non-contiguous window ...

   24be0:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   24be4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   24beb:	44 89 f1             	mov    ecx,r14d
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   24bee:	48 8b 80 90 01 00 00 	mov    rax,QWORD PTR [rax+0x190]
   24bf5:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   24bf9:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   24bfc:	21 c1                	and    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   24bfe:	8b 4c 8a 38          	mov    ecx,DWORD PTR [rdx+rcx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   24c02:	48 85 c9             	test   rcx,rcx
   24c05:	0f 84 aa 4d 00 00    	je     299b5 <JS_CallInternal+0x6fb5>
   24c0b:	48 8d 34 85 34 00 00 	lea    rsi,[rax*4+0x34]
   24c12:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   24c13:	48 8d 04 ce          	lea    rax,[rsi+rcx*8]
   24c17:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   24c1a:	44 3b 70 04          	cmp    r14d,DWORD PTR [rax+0x4]
   24c1e:	0f 85 83 4d 00 00    	jne    299a7 <JS_CallInternal+0x6fa7>
   24c24:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:20447
   24c26:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:20449
   24c29:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:20447
   24c2d:	48 83 c3 10          	add    rbx,0x10
   24c31:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24c38:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:20449

... non-contiguous window ...

   24dfd:	0f 84 9d e3 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   24e03:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   24e0a:	89 c2                	mov    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   24e0c:	49 8b 49 18          	mov    rcx,QWORD PTR [r9+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   24e10:	8b 71 18             	mov    esi,DWORD PTR [rcx+0x18]
   24e13:	21 f2                	and    edx,esi
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   24e15:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   24e19:	48 85 d2             	test   rdx,rdx
   24e1c:	0f 84 29 69 00 00    	je     2b74b <JS_CallInternal+0x8d4b>
   24e22:	48 8d 34 b5 34 00 00 	lea    rsi,[rsi*4+0x34]
   24e29:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   24e2a:	48 8d 14 d6          	lea    rdx,[rsi+rdx*8]
   24e2e:	48 01 ca             	add    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   24e31:	3b 42 04             	cmp    eax,DWORD PTR [rdx+0x4]
   24e34:	0f 85 03 69 00 00    	jne    2b73d <JS_CallInternal+0x8d3d>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:3726 (discriminator 1)
   24e3a:	3d f2 00 00 00       	cmp    eax,0xf2
   24e3f:	0f 8f 6d 50 00 00    	jg     29eb2 <JS_CallInternal+0x74b2>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:15979
   24e45:	48 85 d2             	test   rdx,rdx
   24e48:	0f 95 c0             	setne  al
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:689
   24e4b:	41 83 fd f6          	cmp    r13d,0xfffffff6

... non-contiguous window ...

   251bc:	ff e0                	jmp    rax
   251be:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 4)
   251c2:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/A/cutils.h:181
   251c6:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 1)
   251ca:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 4)
   251cf:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 1)
   251d3:	83 ff ff             	cmp    edi,0xffffffff
   251d6:	0f 85 2a 3e 00 00    	jne    29006 <JS_CallInternal+0x6606>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 5)
   251dc:	4c 89 d1             	mov    rcx,r10
   251df:	90                   	nop
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   251e0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   251e4:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   251e7:	41 89 c0             	mov    r8d,eax
   251ea:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   251ed:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   251f2:	4d 85 c0             	test   r8,r8
   251f5:	0f 84 d8 38 00 00    	je     28ad3 <JS_CallInternal+0x60d3>
   251fb:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   25202:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   25203:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   25207:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   2520a:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   2520d:	0f 85 b0 38 00 00    	jne    28ac3 <JS_CallInternal+0x60c3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 1)
   25213:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   25217:	0f 87 e9 3d 00 00    	ja     29006 <JS_CallInternal+0x6606>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6149
   2521d:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   25221:	49 c1 e0 04          	shl    r8,0x4
   25225:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 11)
   2522a:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   2522d:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:709
   25231:	83 fa f6             	cmp    edx,0xfffffff6
   25234:	76 04                	jbe    2523a <JS_CallInternal+0x283a>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:711
   25236:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 20)
   2523a:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19169
   2523d:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 20)
   25241:	48 83 c3 10          	add    rbx,0x10
   25245:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19169
   25249:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2524f:	49 89 c5             	mov    r13,rax
   25252:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25256:	ff e0                	jmp    rax
   25258:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 4)
   2525c:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/A/cutils.h:181
   25260:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 1)
   25264:	4d 8d 74 24 04       	lea    r14,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 4)
   25269:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 1)
   2526d:	83 ff ff             	cmp    edi,0xffffffff
   25270:	0f 85 3d 3d 00 00    	jne    28fb3 <JS_CallInternal+0x65b3>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 5)
   25276:	4c 89 d1             	mov    rcx,r10
   25279:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   25280:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   25284:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   25287:	41 89 c0             	mov    r8d,eax
   2528a:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   2528d:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   25292:	4d 85 c0             	test   r8,r8
   25295:	0f 84 00 38 00 00    	je     28a9b <JS_CallInternal+0x609b>
   2529b:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   252a2:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   252a3:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   252a7:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   252aa:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   252ad:	0f 85 d8 37 00 00    	jne    28a8b <JS_CallInternal+0x608b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 1)
   252b3:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   252b7:	0f 87 f6 3c 00 00    	ja     28fb3 <JS_CallInternal+0x65b3>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6149
   252bd:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   252c1:	49 c1 e0 04          	shl    r8,0x4
   252c5:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 11)
   252ca:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   252ce:	48 8b 02             	mov    rax,QWORD PTR [rdx]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:709
   252d1:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   252d5:	76 04                	jbe    252db <JS_CallInternal+0x28db>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:711
   252d7:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:18024
   252db:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 21)
   252df:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   252e3:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:689
   252e7:	83 fa f6             	cmp    edx,0xfffffff6
   252ea:	76 11                	jbe    252fd <JS_CallInternal+0x28fd>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:691
   252ec:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   252ef:	83 e9 01             	sub    ecx,0x1
   252f2:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   252f5:	85 c9                	test   ecx,ecx
   252f7:	0f 8e f6 4c 00 00    	jle    29ff3 <JS_CallInternal+0x75f3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 1)
   252fd:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19165
   25301:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 1)
   25305:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19165
   25309:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2530f:	49 89 c5             	mov    r13,rax
   25312:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25316:	ff e0                	jmp    rax
   25318:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19098
   2531c:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19097
   25320:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   25324:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19098
   25328:	0f 87 02 45 00 00    	ja     29830 <JS_CallInternal+0x6e30>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19099

... non-contiguous window ...

   25330:	85 d2                	test   edx,edx
   25332:	0f 95 c0             	setne  al
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19103
   25335:	85 c0                	test   eax,eax
   25337:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2533e:	00 
   2533f:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19105
   25342:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19103
   25346:	0f b6 c0             	movzx  eax,al
   25349:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19105
   2534d:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25353:	49 89 c5             	mov    r13,rax
   25356:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2535a:	ff e0                	jmp    rax
   2535c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19064
   25360:	45 0f b6 34 24       	movzx  r14d,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19065
   25365:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19064
   2536c:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19065
   25371:	4c 8b 43 c0          	mov    r8,QWORD PTR [rbx-0x40]

... non-contiguous window ...

   28093:	e8 88 ea fe ff       	call   16b20 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   28098:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8999
   2809f:	89 c2                	mov    edx,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   280a1:	49 8b 70 18          	mov    rsi,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   280a5:	8b 4e 18             	mov    ecx,DWORD PTR [rsi+0x18]
   280a8:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   280aa:	8b 44 86 38          	mov    eax,DWORD PTR [rsi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   280ae:	48 85 c0             	test   rax,rax
   280b1:	0f 84 8a 37 00 00    	je     2b841 <JS_CallInternal+0x8e41>
   280b7:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   280be:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   280c5:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   280c6:	48 8d 0c c7          	lea    rcx,[rdi+rax*8]
   280ca:	48 01 f1             	add    rcx,rsi
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   280cd:	3b 51 04             	cmp    edx,DWORD PTR [rcx+0x4]
   280d0:	0f 85 5e 37 00 00    	jne    2b834 <JS_CallInternal+0x8e34>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6149
   280d6:	49 8b 50 20          	mov    rdx,QWORD PTR [r8+0x20]
   280da:	48 c1 e0 04          	shl    rax,0x4
   280de:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8429
   280e3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   280e6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:709
   280ea:	83 f8 f6             	cmp    eax,0xfffffff6
   280ed:	76 04                	jbe    280f3 <JS_CallInternal+0x56f3>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:711
   280ef:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1

... non-contiguous window ...

   2819b:	ff e0                	jmp    rax
   2819d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19189
   281a1:	4c 8b 73 e8          	mov    r14,QWORD PTR [rbx-0x18]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/A/cutils.h:181
   281a5:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19187
   281a9:	4d 8d 54 24 04       	lea    r10,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19189
   281ae:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   281b2:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   281b6:	4c 8b 6b e0          	mov    r13,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19190 (discriminator 1)
   281ba:	41 83 fe ff          	cmp    r14d,0xffffffff
   281be:	0f 85 44 14 00 00    	jne    29608 <JS_CallInternal+0x6c08>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   281c4:	4d 8b 4d 18          	mov    r9,QWORD PTR [r13+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   281c8:	41 8b 79 18          	mov    edi,DWORD PTR [r9+0x18]
   281cc:	89 fe                	mov    esi,edi
   281ce:	21 ce                	and    esi,ecx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   281d0:	41 8b 74 b1 38       	mov    esi,DWORD PTR [r9+rsi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   281d5:	48 85 f6             	test   rsi,rsi
   281d8:	0f 84 2a 14 00 00    	je     29608 <JS_CallInternal+0x6c08>
   281de:	48 8d 3c bd 34 00 00 	lea    rdi,[rdi*4+0x34]
   281e5:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   281e6:	4c 8d 04 f7          	lea    r8,[rdi+rsi*8]
   281ea:	4d 01 c8             	add    r8,r9
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   281ed:	41 39 48 04          	cmp    DWORD PTR [r8+0x4],ecx
   281f1:	0f 85 02 14 00 00    	jne    295f9 <JS_CallInternal+0x6bf9>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6149
   281f7:	49 8b 7d 20          	mov    rdi,QWORD PTR [r13+0x20]
   281fb:	48 c1 e6 04          	shl    rsi,0x4
   281ff:	48 8d 7c 37 f0       	lea    rdi,[rdi+rsi*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19195
   28204:	41 0f b6 70 03       	movzx  esi,BYTE PTR [r8+0x3]
   28209:	40 c0 ee 02          	shr    sil,0x2
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19195 (discriminator 1)
   2820d:	83 e6 3a             	and    esi,0x3a
   28210:	40 80 fe 02          	cmp    sil,0x2
   28214:	0f 85 ee 13 00 00    	jne    29608 <JS_CallInternal+0x6c08>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:2667

... non-contiguous window ...

   28752:	e8 c9 e3 fe ff       	call   16b20 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   28757:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8999
   2875e:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   28760:	49 8b 48 18          	mov    rcx,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   28764:	89 f2                	mov    edx,esi
   28766:	8b 41 18             	mov    eax,DWORD PTR [rcx+0x18]
   28769:	21 c2                	and    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   2876b:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   2876f:	48 85 d2             	test   rdx,rdx
   28772:	0f 84 ba 06 00 00    	je     28e32 <JS_CallInternal+0x6432>
   28778:	48 8d 3c 85 34 00 00 	lea    rdi,[rax*4+0x34]
   2877f:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   28780:	48 8d 04 d7          	lea    rax,[rdi+rdx*8]
   28784:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   28787:	3b 70 04             	cmp    esi,DWORD PTR [rax+0x4]
   2878a:	0f 85 94 06 00 00    	jne    28e24 <JS_CallInternal+0x6424>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8395
   28790:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28797:	48 8d 0d a6 39 0a 00 	lea    rcx,[rip+0xa39a6]        # cc144 <_IO_stdin_used+0x144>
   2879e:	48 8d 15 73 76 0a 00 	lea    rdx,[rip+0xa7673]        # cfe18 <_IO_stdin_used+0x3e18>
   287a5:	31 c0                	xor    eax,eax
   287a7:	e8 14 81 00 00       	call   308c0 <__JS_ThrowTypeErrorAtom>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:689
   287ac:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   287b3:	76 13                	jbe    287c8 <JS_CallInternal+0x5dc8>

... non-contiguous window ...

   2885f:	e8 bc e2 fe ff       	call   16b20 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   28864:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8999
   2886b:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   2886d:	48 8b 7a 18          	mov    rdi,QWORD PTR [rdx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   28871:	8b 4f 18             	mov    ecx,DWORD PTR [rdi+0x18]
   28874:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   28876:	8b 44 87 38          	mov    eax,DWORD PTR [rdi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   2887a:	48 85 c0             	test   rax,rax
   2887d:	0f 84 fa 2e 00 00    	je     2b77d <JS_CallInternal+0x8d7d>
   28883:	4c 8d 04 8d 34 00 00 	lea    r8,[rcx*4+0x34]
   2888a:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   2888b:	49 8d 0c c0          	lea    rcx,[r8+rax*8]
   2888f:	48 01 f9             	add    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   28892:	3b 71 04             	cmp    esi,DWORD PTR [rcx+0x4]
   28895:	0f 85 d5 2e 00 00    	jne    2b770 <JS_CallInternal+0x8d70>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6149
   2889b:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
   2889f:	48 c1 e0 04          	shl    rax,0x4
set_value():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:2668
   288a3:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6149
   288aa:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:2667
   288af:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   288b3:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:2668
   288b6:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
   288ba:	4c 89 28             	mov    QWORD PTR [rax],r13
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:689
   288bd:	83 fa f6             	cmp    edx,0xfffffff6
   288c0:	76 11                	jbe    288d3 <JS_CallInternal+0x5ed3>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:691

... non-contiguous window ...

   2892a:	ff e0                	jmp    rax
   2892c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 4)
   28930:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   28934:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 1)
   28938:	83 ff ff             	cmp    edi,0xffffffff
   2893b:	0f 85 b7 05 00 00    	jne    28ef8 <JS_CallInternal+0x64f8>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 5)
   28941:	48 89 f1             	mov    rcx,rsi
   28944:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6142
   28948:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6143
   2894c:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   2894f:	41 89 c0             	mov    r8d,eax
   28952:	41 83 e0 32          	and    r8d,0x32
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6144
   28956:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   2895b:	4d 85 c0             	test   r8,r8
   2895e:	0f 84 ff 00 00 00    	je     28a63 <JS_CallInternal+0x6063>
   28964:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   2896b:	00 
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6147
   2896c:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   28970:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6148 (discriminator 1)
   28973:	83 78 04 32          	cmp    DWORD PTR [rax+0x4],0x32
   28977:	0f 85 d6 00 00 00    	jne    28a53 <JS_CallInternal+0x6053>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 1)
   2897d:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   28981:	0f 87 71 05 00 00    	ja     28ef8 <JS_CallInternal+0x64f8>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6149
   28987:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   2898b:	49 c1 e0 04          	shl    r8,0x4
   2898f:	4a 8d 44 00 f0       	lea    rax,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 11)
   28994:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   28998:	4c 8b 30             	mov    r14,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:709
   2899b:	83 f9 f6             	cmp    ecx,0xfffffff6
   2899e:	76 05                	jbe    289a5 <JS_CallInternal+0x5fa5>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:711
   289a0:	41 83 46 fc 01       	add    DWORD PTR [r14-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:18024
   289a5:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 21)
   289a9:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   289ad:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:689
   289b1:	83 fa f6             	cmp    edx,0xfffffff6
   289b4:	76 11                	jbe    289c7 <JS_CallInternal+0x5fc7>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:691
   289b6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   289b9:	83 e8 01             	sub    eax,0x1
   289bc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   289bf:	85 c0                	test   eax,eax
   289c1:	0f 8e 57 1a 00 00    	jle    2a41e <JS_CallInternal+0x7a1e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 1)
   289c7:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19174
   289cb:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 1)
   289cf:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19174
   289d3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   289d9:	49 89 c5             	mov    r13,rax
   289dc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   289e0:	ff e0                	jmp    rax
   289e2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19439 (discriminator 1)
   289e6:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19439
   289ea:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   289ee:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
   289f2:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   289f6:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19439 (discriminator 1)

... non-contiguous window ...

   28a51:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   28a53:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   28a56:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28a5d:	0f 85 09 ff ff ff    	jne    2896c <JS_CallInternal+0x5f6c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 1)
   28a63:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28a67:	0f 85 81 04 00 00    	jne    28eee <JS_CallInternal+0x64ee>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 14)
   28a6d:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28a71:	48 85 c9             	test   rcx,rcx
   28a74:	0f 85 ce fe ff ff    	jne    28948 <JS_CallInternal+0x5f48>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:18024
   28a7a:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 15)
   28a7e:	b9 03 00 00 00       	mov    ecx,0x3
   28a83:	45 31 f6             	xor    r14d,r14d
   28a86:	e9 1e ff ff ff       	jmp    289a9 <JS_CallInternal+0x5fa9>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   28a8b:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   28a8e:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28a95:	0f 85 08 c8 ff ff    	jne    252a3 <JS_CallInternal+0x28a3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 1)
   28a9b:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28a9f:	0f 85 04 05 00 00    	jne    28fa9 <JS_CallInternal+0x65a9>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 14)
   28aa5:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28aa9:	48 85 c9             	test   rcx,rcx
   28aac:	0f 85 ce c7 ff ff    	jne    25280 <JS_CallInternal+0x2880>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:18024
   28ab2:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 15)
   28ab6:	41 b8 03 00 00 00    	mov    r8d,0x3
   28abc:	31 c0                	xor    eax,eax
   28abe:	e9 1c c8 ff ff       	jmp    252df <JS_CallInternal+0x28df>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   28ac3:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   28ac6:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28acd:	0f 85 30 c7 ff ff    	jne    25203 <JS_CallInternal+0x2803>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 1)
   28ad3:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28ad7:	0f 85 1f 05 00 00    	jne    28ffc <JS_CallInternal+0x65fc>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 14)
   28add:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28ae1:	48 85 c9             	test   rcx,rcx
   28ae4:	0f 85 f6 c6 ff ff    	jne    251e0 <JS_CallInternal+0x27e0>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 15)
   28aea:	ba 03 00 00 00       	mov    edx,0x3
   28aef:	31 c0                	xor    eax,eax
   28af1:	e9 44 c7 ff ff       	jmp    2523a <JS_CallInternal+0x283a>
   28af6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   28afd:	00 00 00 
min_int():
/home/mzyx/read_ic_dequickening_attempt01/A/cutils.h:90
   28b00:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28b06:	39 f7                	cmp    edi,esi
   28b08:	41 89 f5             	mov    r13d,esi
   28b0b:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:17850 (discriminator 1)

... non-contiguous window ...

   28e22:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   28e24:	8b 10                	mov    edx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   28e26:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   28e2c:	0f 85 4e f9 ff ff    	jne    28780 <JS_CallInternal+0x5d80>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8399
   28e32:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28e39:	89 f2                	mov    edx,esi
   28e3b:	b9 07 00 00 00       	mov    ecx,0x7
   28e40:	4c 89 c6             	mov    rsi,r8
   28e43:	e8 08 cc 01 00       	call   45a50 <add_property>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8400 (discriminator 1)
   28e48:	48 85 c0             	test   rax,rax
   28e4b:	0f 84 5b f9 ff ff    	je     287ac <JS_CallInternal+0x5dac>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8405

... non-contiguous window ...

   28ee9:	e9 f1 a9 ff ff       	jmp    238df <JS_CallInternal+0xedf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 13)
   28eee:	48 89 ce             	mov    rsi,rcx
   28ef1:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 12)
   28ef8:	48 83 ec 08          	sub    rsp,0x8
   28efc:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   28f00:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   28f04:	48 89 fa             	mov    rdx,rdi
   28f07:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   28f0e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28f15:	b9 32 00 00 00       	mov    ecx,0x32
   28f1a:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   28f1e:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   28f22:	6a 00                	push   0x0
   28f24:	e8 17 39 00 00       	call   2c840 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 3)
   28f29:	5f                   	pop    rdi
   28f2a:	41 58                	pop    r8
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 12)
   28f2c:	49 89 c6             	mov    r14,rax
   28f2f:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19173 (discriminator 3)
   28f32:	83 fa 06             	cmp    edx,0x6
   28f35:	0f 85 6e fa ff ff    	jne    289a9 <JS_CallInternal+0x5fa9>
   28f3b:	e9 60 a2 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19359
   28f40:	80 cc 08             	or     ah,0x8
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19358
   28f43:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:5928
   28f48:	8b b5 40 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19359
   28f4e:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax

... non-contiguous window ...

   28fa4:	e9 2c a8 ff ff       	jmp    237d5 <JS_CallInternal+0xdd5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 13)
   28fa9:	49 89 ca             	mov    r10,rcx
   28fac:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 12)
   28fb3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   28fba:	48 83 ec 08          	sub    rsp,0x8
   28fbe:	48 89 fa             	mov    rdx,rdi
   28fc1:	89 f1                	mov    ecx,esi
   28fc3:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   28fc7:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   28fcb:	4c 89 d6             	mov    rsi,r10
   28fce:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   28fd2:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   28fd6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28fdd:	6a 00                	push   0x0
   28fdf:	e8 5c 38 00 00       	call   2c840 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 3)
   28fe4:	41 5b                	pop    r11
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 12)
   28fe6:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 3)
   28fe9:	5a                   	pop    rdx
   28fea:	41 83 f8 06          	cmp    r8d,0x6
   28fee:	0f 85 eb c2 ff ff    	jne    252df <JS_CallInternal+0x28df>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19164 (discriminator 1)
   28ff4:	4d 89 f4             	mov    r12,r14
   28ff7:	e9 a4 a1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 13)
   28ffc:	49 89 ca             	mov    r10,rcx
   28fff:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 12)
   29006:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2900d:	48 83 ec 08          	sub    rsp,0x8
   29011:	48 89 fa             	mov    rdx,rdi
   29014:	89 f1                	mov    ecx,esi
   29016:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2901a:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2901e:	4c 89 d6             	mov    rsi,r10
   29021:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   29025:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2902c:	6a 00                	push   0x0
   2902e:	e8 0d 38 00 00       	call   2c840 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 3)
   29033:	41 59                	pop    r9
   29035:	41 5a                	pop    r10
   29037:	83 fa 06             	cmp    edx,0x6
   2903a:	0f 85 fa c1 ff ff    	jne    2523a <JS_CallInternal+0x283a>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19168 (discriminator 1)
   29040:	4d 89 ec             	mov    r12,r13
   29043:	e9 58 a1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:18194 (discriminator 1)
   29048:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2904f:	e9 4c a1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:20063
   29054:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   2905b:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:709
   2905f:	83 fa f6             	cmp    edx,0xfffffff6
   29062:	76 04                	jbe    29068 <JS_CallInternal+0x6668>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.h:711

... non-contiguous window ...

   295f4:	e9 a7 9b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   295f9:	41 8b 30             	mov    esi,DWORD PTR [r8]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   295fc:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   29602:	0f 85 de eb ff ff    	jne    281e6 <JS_CallInternal+0x57e6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19207
   29608:	48 83 ec 08          	sub    rsp,0x8
   2960c:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29610:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29614:	48 89 c6             	mov    rsi,rax
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19206
   29617:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2961e:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   29625:	4c 89 57 30          	mov    QWORD PTR [rdi+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19207

... non-contiguous window ...

   29666:	85 c9                	test   ecx,ecx
   29668:	0f 89 ee eb ff ff    	jns    2825c <JS_CallInternal+0x585c>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19187
   2966e:	4d 89 d4             	mov    r12,r10
   29671:	e9 2a 9b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29676:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   2967d:	00 00 00 
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:15964
   29680:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   29687:	4d 89 f0             	mov    r8,r14
   2968a:	4c 89 ce             	mov    rsi,r9
   2968d:	4c 89 ea             	mov    rdx,r13
   29690:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29697:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2969e:	e8 8d 76 00 00       	call   30d30 <JS_CheckBrand>

... non-contiguous window ...

   29828:	49 89 d5             	mov    r13,rdx
   2982b:	e9 5c a6 ff ff       	jmp    23e8c <JS_CallInternal+0x148c>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19101
   29830:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29837:	48 89 d6             	mov    rsi,rdx
   2983a:	48 89 c2             	mov    rdx,rax
   2983d:	e8 5e 52 ff ff       	call   1eaa0 <JS_ToBoolFree>
   29842:	e9 ee ba ff ff       	jmp    25335 <JS_CallInternal+0x2935>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:18380
   29847:	49 8b 75 f0          	mov    rsi,QWORD PTR [r13-0x10]
   2984b:	49 8b 55 f8          	mov    rdx,QWORD PTR [r13-0x8]
   2984f:	41 b8 03 00 00 00    	mov    r8d,0x3
   29855:	31 c9                	xor    ecx,ecx
   29857:	44 8b 8d 50 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x1b0]
   2985e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:18381

... non-contiguous window ...

   299a2:	e9 3f b6 ff ff       	jmp    24fe6 <JS_CallInternal+0x25e6>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   299a7:	8b 08                	mov    ecx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   299a9:	81 e1 ff ff ff 03    	and    ecx,0x3ffffff
   299af:	0f 85 5e b2 ff ff    	jne    24c13 <JS_CallInternal+0x2213>
JS_DeleteGlobalVar():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:10907
   299b5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   299bc:	44 89 f1             	mov    ecx,r14d
   299bf:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   299c6:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   299cd:	e8 de 3f 04 00       	call   6d9b0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:10908
   299d2:	85 c0                	test   eax,eax
   299d4:	0f 88 57 2d 00 00    	js     2c731 <JS_CallInternal+0x9d31>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:10910

... non-contiguous window ...

   2b738:	e9 1b cb ff ff       	jmp    28258 <JS_CallInternal+0x5858>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   2b73d:	8b 12                	mov    edx,DWORD PTR [rdx]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   2b73f:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   2b745:	0f 85 df 96 ff ff    	jne    24e2a <JS_CallInternal+0x242a>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6156
   2b74b:	31 d2                	xor    edx,edx
   2b74d:	e9 e8 96 ff ff       	jmp    24e3a <JS_CallInternal+0x243a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19847 (discriminator 1)
   2b752:	09 ca                	or     edx,ecx
   2b754:	0f 89 58 ac ff ff    	jns    263b2 <JS_CallInternal+0x39b2>
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:19848
   2b75a:	f2 0f 10 05 5e e2 0a 	movsd  xmm0,QWORD PTR [rip+0xae25e]        # d99c0 <typed_array_size_log2+0x28>
   2b761:	00 
   2b762:	e9 1e f9 ff ff       	jmp    2b085 <JS_CallInternal+0x8685>
   2b767:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2b76e:	00 00 
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   2b770:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   2b772:	25 ff ff ff 03       	and    eax,0x3ffffff
   2b777:	0f 85 0e d1 ff ff    	jne    2888b <JS_CallInternal+0x5e8b>
JS_ThrowTypeErrorPrivateNotFound():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:8368
   2b77d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b784:	48 8d 0d b9 09 0a 00 	lea    rcx,[rip+0xa09b9]        # cc144 <_IO_stdin_used+0x144>
   2b78b:	31 c0                	xor    eax,eax
   2b78d:	48 8d 15 34 46 0a 00 	lea    rdx,[rip+0xa4634]        # cfdc8 <_IO_stdin_used+0x3dc8>
   2b794:	e8 27 51 00 00       	call   308c0 <__JS_ThrowTypeErrorAtom>
   2b799:	e9 71 f4 ff ff       	jmp    2ac0f <JS_CallInternal+0x820f>
   2b79e:	66 90                	xchg   ax,ax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6505

... non-contiguous window ...

   2b82f:	e9 4c a8 ff ff       	jmp    26080 <JS_CallInternal+0x3680>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6153
   2b834:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:6146
   2b836:	25 ff ff ff 03       	and    eax,0x3ffffff
   2b83b:	0f 85 85 c8 ff ff    	jne    280c6 <JS_CallInternal+0x56c6>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:3592
   2b841:	48 8b bd 28 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1d8]
   2b848:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2b84c:	e8 8f ba fe ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:7717 (discriminator 1)
   2b851:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b858:	48 8d 35 69 45 0a 00 	lea    rsi,[rip+0xa4569]        # cfdc8 <_IO_stdin_used+0x3dc8>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/A/quickjs.c:3592
