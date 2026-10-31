
... disjoint excerpt ...

   24938:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2493c:	ff e0                	jmp    rax
   2493e:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435
   24942:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   24946:	48 8b 7b e8          	mov    rdi,QWORD PTR [rbx-0x18]
   2494a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2494e:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   24952:	49 89 f5             	mov    r13,rsi
   24955:	49 89 fe             	mov    r14,rdi
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 1)
   24958:	83 ff ff             	cmp    edi,0xffffffff
   2495b:	0f 85 a7 4d 00 00    	jne    29708 <JS_CallInternal+0x6d08>
   24961:	45 85 c0             	test   r8d,r8d
   24964:	0f 85 9e 4d 00 00    	jne    29708 <JS_CallInternal+0x6d08>
   2496a:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   2496f:	0f 85 93 4d 00 00    	jne    29708 <JS_CallInternal+0x6d08>
   24975:	3b 4e 38             	cmp    ecx,DWORD PTR [rsi+0x38]
   24978:	0f 83 8a 4d 00 00    	jae    29708 <JS_CallInternal+0x6d08>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 9)
   2497e:	89 c8                	mov    eax,ecx
   24980:	48 c1 e0 04          	shl    rax,0x4
   24984:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   24988:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   2498b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.h:709
   2498f:	83 f8 f6             	cmp    eax,0xfffffff6
   24992:	76 04                	jbe    24998 <JS_CallInternal+0x1f98>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.h:711
   24994:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_FreeValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.h:689
   24998:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2499c:	76 13                	jbe    249b1 <JS_CallInternal+0x1fb1>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.h:691
   2499e:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   249a2:	8d 57 ff             	lea    edx,[rdi-0x1]
   249a5:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   249a9:	85 d2                	test   edx,edx
   249ab:	0f 8e c6 5c 00 00    	jle    2a677 <JS_CallInternal+0x7c77>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 1)
   249b1:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19436
   249b5:	49 83 c4 01          	add    r12,0x1
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 1)
   249b9:	48 83 eb 10          	sub    rbx,0x10
   249bd:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19436
   249c1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   249c7:	49 89 c5             	mov    r13,rax
   249ca:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   249ce:	ff e0                	jmp    rax
   249d0:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:20597
   249d4:	31 c9                	xor    ecx,ecx
   249d6:	b8 01 00 00 00       	mov    eax,0x1
   249db:	e9 40 e8 ff ff       	jmp    23220 <JS_CallInternal+0x820>
   249e0:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:20594
   249e4:	31 c9                	xor    ecx,ecx
   249e6:	31 c0                	xor    eax,eax
   249e8:	e9 33 e8 ff ff       	jmp    23220 <JS_CallInternal+0x820>
   249ed:	f3 0f 1e fa          	endbr64
   249f1:	e9 2a e3 ff ff       	jmp    22d20 <JS_CallInternal+0x320>
   249f6:	f3 0f 1e fa          	endbr64
   249fa:	e9 21 e3 ff ff       	jmp    22d20 <JS_CallInternal+0x320>
   249ff:	f3 0f 1e fa          	endbr64
   24a03:	e9 18 e3 ff ff       	jmp    22d20 <JS_CallInternal+0x320>
   24a08:	f3 0f 1e fa          	endbr64

... disjoint excerpt ...

   27f01:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27f05:	ff e0                	jmp    rax
   27f07:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19448
   27f0b:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19448 (discriminator 1)
   27f0f:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   27f13:	83 f8 ff             	cmp    eax,0xffffffff
   27f16:	0f 85 4a 2c 00 00    	jne    2ab66 <JS_CallInternal+0x8166>
   27f1c:	45 85 ed             	test   r13d,r13d
   27f1f:	0f 85 e4 1b 00 00    	jne    29b09 <JS_CallInternal+0x7109>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19450
   27f25:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19451
   27f29:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19452 (discriminator 1)
   27f2d:	66 83 7a 12 02       	cmp    WORD PTR [rdx+0x12],0x2
   27f32:	0f 85 36 1c 00 00    	jne    29b6e <JS_CallInternal+0x716e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19454 (discriminator 1)
   27f38:	3b 42 38             	cmp    eax,DWORD PTR [rdx+0x38]
   27f3b:	0f 83 2d 1c 00 00    	jae    29b6e <JS_CallInternal+0x716e>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19456
   27f41:	89 c0                	mov    eax,eax
   27f43:	48 c1 e0 04          	shl    rax,0x4
   27f47:	48 03 42 30          	add    rax,QWORD PTR [rdx+0x30]
   27f4b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   27f4e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]

... disjoint excerpt ...

   289dc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   289e0:	ff e0                	jmp    rax
   289e2:	f3 0f 1e fa          	endbr64
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 1)
   289e6:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439
   289ea:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   289ee:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
   289f2:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   289f6:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 1)
   289fa:	0f 85 b0 0b 00 00    	jne    295b0 <JS_CallInternal+0x6bb0>
   28a00:	85 ff                	test   edi,edi
   28a02:	0f 85 a8 0b 00 00    	jne    295b0 <JS_CallInternal+0x6bb0>
   28a08:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   28a0d:	0f 85 9d 0b 00 00    	jne    295b0 <JS_CallInternal+0x6bb0>
   28a13:	44 3b 46 38          	cmp    r8d,DWORD PTR [rsi+0x38]
   28a17:	0f 83 93 0b 00 00    	jae    295b0 <JS_CallInternal+0x6bb0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 9)
   28a1d:	44 89 c0             	mov    eax,r8d
   28a20:	48 c1 e0 04          	shl    rax,0x4
   28a24:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   28a28:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   28a2b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.h:709
   28a2f:	83 f8 f6             	cmp    eax,0xfffffff6
   28a32:	76 04                	jbe    28a38 <JS_CallInternal+0x6038>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.h:711
   28a34:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 18)
   28a38:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19440
   28a3c:	49 83 c4 01          	add    r12,0x1
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 18)
   28a40:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19440
   28a44:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28a4a:	49 89 c5             	mov    r13,rax
   28a4d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28a51:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:6153
   28a53:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:6146
   28a56:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28a5d:	0f 85 09 ff ff ff    	jne    2896c <JS_CallInternal+0x5f6c>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19173 (discriminator 1)
   28a63:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28a67:	0f 85 81 04 00 00    	jne    28eee <JS_CallInternal+0x64ee>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19173 (discriminator 14)
   28a6d:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28a71:	48 85 c9             	test   rcx,rcx
   28a74:	0f 85 ce fe ff ff    	jne    28948 <JS_CallInternal+0x5f48>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:18024
   28a7a:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19173 (discriminator 15)

... disjoint excerpt ...

   295a4:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   295ab:	e9 61 d6 ff ff       	jmp    26c11 <JS_CallInternal+0x4211>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 10)
   295b0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   295b7:	48 89 ca             	mov    rdx,rcx
   295ba:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   295be:	4c 89 c0             	mov    rax,r8
   295c1:	49 89 f8             	mov    r8,rdi
   295c4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   295cb:	48 89 c1             	mov    rcx,rax
   295ce:	e8 dd 38 00 00       	call   2ceb0 <JS_GetPropertyValue>
   295d3:	48 89 c1             	mov    rcx,rax
   295d6:	48 89 d0             	mov    rax,rdx
   295d9:	48 89 ca             	mov    rdx,rcx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 3)
   295dc:	83 f8 06             	cmp    eax,0x6
   295df:	0f 85 53 f4 ff ff    	jne    28a38 <JS_CallInternal+0x6038>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19439 (discriminator 14)
   295e5:	45 31 c0             	xor    r8d,r8d
   295e8:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   295ef:	00 
   295f0:	4c 89 43 f0          	mov    QWORD PTR [rbx-0x10],r8
   295f4:	e9 a7 9b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:6153
   295f9:	41 8b 30             	mov    esi,DWORD PTR [r8]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:6146
   295fc:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   29602:	0f 85 de eb ff ff    	jne    281e6 <JS_CallInternal+0x57e6>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19207
   29608:	48 83 ec 08          	sub    rsp,0x8
   2960c:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29610:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29614:	48 89 c6             	mov    rsi,rax
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19206
   29617:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2961e:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   29625:	4c 89 57 30          	mov    QWORD PTR [rdi+0x30],r10

... disjoint excerpt ...

   29701:	59                   	pop    rcx
   29702:	5e                   	pop    rsi
   29703:	e9 e8 9a ff ff       	jmp    231f0 <JS_CallInternal+0x7f0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 10)
   29708:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2970f:	48 89 fa             	mov    rdx,rdi
   29712:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29719:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2971d:	e8 8e 37 00 00       	call   2ceb0 <JS_GetPropertyValue>
   29722:	48 89 c1             	mov    rcx,rax
   29725:	48 89 d0             	mov    rax,rdx
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 3)
   29728:	83 fa 06             	cmp    edx,0x6
   2972b:	0f 85 67 b2 ff ff    	jne    24998 <JS_CallInternal+0x1f98>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 15)
   29731:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19435 (discriminator 16)
   29735:	e9 66 9a ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19586
   2973a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19587
   29741:	48 8d 7b f0          	lea    rdi,[rbx-0x10]
   29745:	41 b9 00 80 00 00    	mov    r9d,0x8000
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19586
   2974b:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/legacy_ng_ic_read_hit_attempt01/A/quickjs.c:19587
   2974f:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   29753:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29757:	48 83 eb 30          	sub    rbx,0x30
   2975b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   2975e:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   29762:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   29765:	ff 77 08             	push   QWORD PTR [rdi+0x8]
   29768:	ff 37                	push   QWORD PTR [rdi]
   2976a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29771:	e8 0a 4b 00 00       	call   2e280 <JS_SetPropertyValue>
   29776:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
JS_FreeValue():
