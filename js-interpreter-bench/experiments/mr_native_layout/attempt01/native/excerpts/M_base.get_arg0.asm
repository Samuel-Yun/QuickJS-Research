; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   2471f:	f3 0f 1e fa          	endbr64
   24723:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   2472a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2472e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24731:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   24735:	83 f8 f6             	cmp    eax,0xfffffff6
   24738:	76 04                	jbe    2473e <JS_CallInternal+0x1c7e>
   2473a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2473e:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24741:	49 83 c4 01          	add    r12,0x1
   24745:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24749:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2474f:	48 89 cb             	mov    rbx,rcx
   24752:	49 89 c5             	mov    r13,rax
   24755:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24759:	ff e0                	jmp    rax
   2475b:	f3 0f 1e fa          	endbr64
   2475f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24763:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   24767:	83 f8 f6             	cmp    eax,0xfffffff6
   2476a:	76 04                	jbe    24770 <JS_CallInternal+0x1cb0>
   2476c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24770:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24777:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   2477b:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
   2477f:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   24783:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
   24787:	83 f9 f6             	cmp    ecx,0xfffffff6
   2478a:	76 11                	jbe    2479d <JS_CallInternal+0x1cdd>
   2478c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2478f:	83 e8 01             	sub    eax,0x1
   24792:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24795:	85 c0                	test   eax,eax
   24797:	0f 8e 54 60 00 00    	jle    2a7f1 <JS_CallInternal+0x7d31>
   2479d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   247a2:	49 83 c4 01          	add    r12,0x1
   247a6:	49 89 c5             	mov    r13,rax
   247a9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   247ad:	ff e0                	jmp    rax
   247af:	f3 0f 1e fa          	endbr64
   247b3:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   247b7:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   247bb:	83 f8 f6             	cmp    eax,0xfffffff6
   247be:	76 04                	jbe    247c4 <JS_CallInternal+0x1d04>
   247c0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   247c4:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   247cb:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   247cf:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
   247d3:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   247d7:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
   247db:	83 f9 f6             	cmp    ecx,0xfffffff6
   247de:	76 11                	jbe    247f1 <JS_CallInternal+0x1d31>
   247e0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   247e3:	83 e8 01             	sub    eax,0x1
   247e6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   247e9:	85 c0                	test   eax,eax
   247eb:	0f 8e 72 60 00 00    	jle    2a863 <JS_CallInternal+0x7da3>
   247f1:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   247f6:	49 83 c4 01          	add    r12,0x1
   247fa:	49 89 c5             	mov    r13,rax
   247fd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24801:	ff e0                	jmp    rax
   24803:	f3 0f 1e fa          	endbr64
   24807:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   2480b:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   2480f:	83 f8 f6             	cmp    eax,0xfffffff6
   24812:	76 04                	jbe    24818 <JS_CallInternal+0x1d58>
   24814:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24818:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   2481f:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   24823:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
   24827:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   2482b:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
   2482f:	83 f9 f6             	cmp    ecx,0xfffffff6
   24832:	76 11                	jbe    24845 <JS_CallInternal+0x1d85>
   24834:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24837:	83 e8 01             	sub    eax,0x1
   2483a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2483d:	85 c0                	test   eax,eax
   2483f:	0f 8e 36 60 00 00    	jle    2a87b <JS_CallInternal+0x7dbb>
   24845:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2484a:	49 83 c4 01          	add    r12,0x1
   2484e:	49 89 c5             	mov    r13,rax
   24851:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24855:	ff e0                	jmp    rax
   24857:	f3 0f 1e fa          	endbr64
   2485b:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   2485f:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   24863:	83 f8 f6             	cmp    eax,0xfffffff6
   24866:	76 04                	jbe    2486c <JS_CallInternal+0x1dac>
