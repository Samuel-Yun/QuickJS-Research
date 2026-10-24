; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   25757:	f3 0f 1e fa          	endbr64
   2575b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   25762:	f6 40 10 01          	test   BYTE PTR [rax+0x10],0x1
   25766:	0f 85 00 3f 00 00    	jne    2966c <JS_CallInternal+0x6acc>
   2576c:	83 bd 88 fe ff ff ff 	cmp    DWORD PTR [rbp-0x178],0xffffffff
   25773:	0f 85 f9 67 00 00    	jne    2bf72 <JS_CallInternal+0x93d2>
   25779:	48 8b 85 78 fe ff ff 	mov    rax,QWORD PTR [rbp-0x188]
   25780:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   25784:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   2578b:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
   25792:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   25795:	49 83 c4 01          	add    r12,0x1
   25799:	48 83 c3 10          	add    rbx,0x10
   2579d:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   257a1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   257a7:	49 89 c5             	mov    r13,rax
   257aa:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   257ae:	ff e0                	jmp    rax
   257b0:	f3 0f 1e fa          	endbr64
   257b4:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   257b8:	48 8b 7b e8          	mov    rdi,QWORD PTR [rbx-0x18]
   257bc:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   257c0:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   257c4:	49 89 f5             	mov    r13,rsi
   257c7:	49 89 fe             	mov    r14,rdi
   257ca:	83 ff ff             	cmp    edi,0xffffffff
   257cd:	0f 85 27 43 00 00    	jne    29afa <JS_CallInternal+0x6f5a>
   257d3:	45 85 c0             	test   r8d,r8d
   257d6:	0f 85 1e 43 00 00    	jne    29afa <JS_CallInternal+0x6f5a>
   257dc:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   257e1:	0f 85 13 43 00 00    	jne    29afa <JS_CallInternal+0x6f5a>
   257e7:	3b 4e 38             	cmp    ecx,DWORD PTR [rsi+0x38]
   257ea:	0f 83 0a 43 00 00    	jae    29afa <JS_CallInternal+0x6f5a>
   257f0:	89 c8                	mov    eax,ecx
   257f2:	48 c1 e0 04          	shl    rax,0x4
   257f6:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   257fa:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   257fd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25801:	83 f8 f6             	cmp    eax,0xfffffff6
   25804:	76 04                	jbe    2580a <JS_CallInternal+0x2c6a>
   25806:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   2580a:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2580e:	76 13                	jbe    25823 <JS_CallInternal+0x2c83>
   25810:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   25814:	8d 57 ff             	lea    edx,[rdi-0x1]
   25817:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   2581b:	85 d2                	test   edx,edx
   2581d:	0f 8e c6 4f 00 00    	jle    2a7e9 <JS_CallInternal+0x7c49>
   25823:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   25827:	49 83 c4 01          	add    r12,0x1
   2582b:	48 83 eb 10          	sub    rbx,0x10
   2582f:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   25833:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25839:	49 89 c5             	mov    r13,rax
   2583c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25840:	ff e0                	jmp    rax
   25842:	f3 0f 1e fa          	endbr64
   25846:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   2584d:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   25852:	48 83 eb 10          	sub    rbx,0x10
   25856:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25859:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   2585d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25861:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25864:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   25867:	83 fa f6             	cmp    edx,0xfffffff6
   2586a:	76 11                	jbe    2587d <JS_CallInternal+0x2cdd>
   2586c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2586f:	83 e8 01             	sub    eax,0x1
   25872:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25875:	85 c0                	test   eax,eax
   25877:	0f 8e 21 51 00 00    	jle    2a99e <JS_CallInternal+0x7dfe>
   2587d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25882:	49 83 c4 01          	add    r12,0x1
   25886:	49 89 c5             	mov    r13,rax
   25889:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2588d:	ff e0                	jmp    rax
   2588f:	f3 0f 1e fa          	endbr64
   25893:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   2589a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2589e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   258a2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   258a6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   258a9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   258ad:	83 f8 f6             	cmp    eax,0xfffffff6
   258b0:	76 04                	jbe    258b6 <JS_CallInternal+0x2d16>
   258b2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   258b6:	48 89 13             	mov    QWORD PTR [rbx],rdx
   258b9:	49 83 c4 01          	add    r12,0x1
   258bd:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
