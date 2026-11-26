; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   25627:	f3 0f 1e fa          	endbr64
   2562b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   25632:	f6 40 10 01          	test   BYTE PTR [rax+0x10],0x1
   25636:	0f 85 76 3f 00 00    	jne    295b2 <JS_CallInternal+0x6af2>
   2563c:	83 bd 88 fe ff ff ff 	cmp    DWORD PTR [rbp-0x178],0xffffffff
   25643:	0f 85 9b 69 00 00    	jne    2bfe4 <JS_CallInternal+0x9524>
   25649:	48 8b 85 78 fe ff ff 	mov    rax,QWORD PTR [rbp-0x188]
   25650:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   25654:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   2565b:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
   25662:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   25665:	49 83 c4 01          	add    r12,0x1
   25669:	48 83 c3 10          	add    rbx,0x10
   2566d:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   25671:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25677:	49 89 c5             	mov    r13,rax
   2567a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2567e:	ff e0                	jmp    rax
   25680:	f3 0f 1e fa          	endbr64
   25684:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   25688:	48 8b 7b e8          	mov    rdi,QWORD PTR [rbx-0x18]
   2568c:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   25690:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   25694:	49 89 f5             	mov    r13,rsi
   25697:	49 89 fe             	mov    r14,rdi
   2569a:	83 ff ff             	cmp    edi,0xffffffff
   2569d:	0f 85 dd 42 00 00    	jne    29980 <JS_CallInternal+0x6ec0>
   256a3:	45 85 c0             	test   r8d,r8d
   256a6:	0f 85 d4 42 00 00    	jne    29980 <JS_CallInternal+0x6ec0>
   256ac:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   256b1:	0f 85 c9 42 00 00    	jne    29980 <JS_CallInternal+0x6ec0>
   256b7:	3b 4e 38             	cmp    ecx,DWORD PTR [rsi+0x38]
   256ba:	0f 83 c0 42 00 00    	jae    29980 <JS_CallInternal+0x6ec0>
   256c0:	89 c8                	mov    eax,ecx
   256c2:	48 c1 e0 04          	shl    rax,0x4
   256c6:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   256ca:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   256cd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   256d1:	83 f8 f6             	cmp    eax,0xfffffff6
   256d4:	76 04                	jbe    256da <JS_CallInternal+0x2c1a>
   256d6:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   256da:	41 83 fe f6          	cmp    r14d,0xfffffff6
   256de:	76 13                	jbe    256f3 <JS_CallInternal+0x2c33>
   256e0:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   256e4:	8d 57 ff             	lea    edx,[rdi-0x1]
   256e7:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   256eb:	85 d2                	test   edx,edx
   256ed:	0f 8e e8 53 00 00    	jle    2aadb <JS_CallInternal+0x801b>
   256f3:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   256f7:	49 83 c4 01          	add    r12,0x1
   256fb:	48 83 eb 10          	sub    rbx,0x10
   256ff:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   25703:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25709:	49 89 c5             	mov    r13,rax
   2570c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25710:	ff e0                	jmp    rax
   25712:	f3 0f 1e fa          	endbr64
   25716:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   2571d:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   25722:	48 83 eb 10          	sub    rbx,0x10
   25726:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25729:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   2572d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25731:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25734:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   25737:	83 fa f6             	cmp    edx,0xfffffff6
   2573a:	76 11                	jbe    2574d <JS_CallInternal+0x2c8d>
   2573c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2573f:	83 e8 01             	sub    eax,0x1
   25742:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25745:	85 c0                	test   eax,eax
   25747:	0f 8e d1 4d 00 00    	jle    2a51e <JS_CallInternal+0x7a5e>
   2574d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25752:	49 83 c4 01          	add    r12,0x1
   25756:	49 89 c5             	mov    r13,rax
   25759:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2575d:	ff e0                	jmp    rax
   2575f:	f3 0f 1e fa          	endbr64
   25763:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   2576a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2576e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25772:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25776:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25779:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2577d:	83 f8 f6             	cmp    eax,0xfffffff6
   25780:	76 04                	jbe    25786 <JS_CallInternal+0x2cc6>
   25782:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25786:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25789:	49 83 c4 01          	add    r12,0x1
   2578d:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
