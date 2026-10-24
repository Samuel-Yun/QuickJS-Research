; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   2484f:	f3 0f 1e fa          	endbr64
   24853:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   2485a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2485e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24861:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   24865:	83 f8 f6             	cmp    eax,0xfffffff6
   24868:	76 04                	jbe    2486e <JS_CallInternal+0x1cce>
   2486a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2486e:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24871:	49 83 c4 01          	add    r12,0x1
   24875:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24879:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2487f:	48 89 cb             	mov    rbx,rcx
   24882:	49 89 c5             	mov    r13,rax
   24885:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24889:	ff e0                	jmp    rax
   2488b:	f3 0f 1e fa          	endbr64
   2488f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24893:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   24897:	83 f8 f6             	cmp    eax,0xfffffff6
   2489a:	76 04                	jbe    248a0 <JS_CallInternal+0x1d00>
   2489c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   248a0:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   248a7:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   248ab:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
   248af:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   248b3:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
   248b7:	83 f9 f6             	cmp    ecx,0xfffffff6
   248ba:	76 11                	jbe    248cd <JS_CallInternal+0x1d2d>
   248bc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   248bf:	83 e8 01             	sub    eax,0x1
   248c2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   248c5:	85 c0                	test   eax,eax
   248c7:	0f 8e 52 5d 00 00    	jle    2a61f <JS_CallInternal+0x7a7f>
   248cd:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   248d2:	49 83 c4 01          	add    r12,0x1
   248d6:	49 89 c5             	mov    r13,rax
   248d9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   248dd:	ff e0                	jmp    rax
   248df:	f3 0f 1e fa          	endbr64
   248e3:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   248e7:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   248eb:	83 f8 f6             	cmp    eax,0xfffffff6
   248ee:	76 04                	jbe    248f4 <JS_CallInternal+0x1d54>
   248f0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   248f4:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   248fb:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   248ff:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
   24902:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   24906:	48 89 17             	mov    QWORD PTR [rdi],rdx
   24909:	83 f9 f6             	cmp    ecx,0xfffffff6
   2490c:	76 11                	jbe    2491f <JS_CallInternal+0x1d7f>
   2490e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24911:	83 e8 01             	sub    eax,0x1
   24914:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24917:	85 c0                	test   eax,eax
   24919:	0f 8e 04 5e 00 00    	jle    2a723 <JS_CallInternal+0x7b83>
   2491f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24924:	49 83 c4 01          	add    r12,0x1
   24928:	49 89 c5             	mov    r13,rax
   2492b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2492f:	ff e0                	jmp    rax
   24931:	f3 0f 1e fa          	endbr64
   24935:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24939:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   2493d:	83 f8 f6             	cmp    eax,0xfffffff6
   24940:	76 04                	jbe    24946 <JS_CallInternal+0x1da6>
   24942:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24946:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   2494d:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   24951:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
   24955:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   24959:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
   2495d:	83 f9 f6             	cmp    ecx,0xfffffff6
   24960:	76 11                	jbe    24973 <JS_CallInternal+0x1dd3>
   24962:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24965:	83 e8 01             	sub    eax,0x1
   24968:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2496b:	85 c0                	test   eax,eax
   2496d:	0f 8e ad 5e 00 00    	jle    2a820 <JS_CallInternal+0x7c80>
   24973:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24978:	49 83 c4 01          	add    r12,0x1
   2497c:	49 89 c5             	mov    r13,rax
   2497f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24983:	ff e0                	jmp    rax
   24985:	f3 0f 1e fa          	endbr64
   24989:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24990:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
   24995:	48 83 eb 10          	sub    rbx,0x10
   24999:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
