; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   288a8:	f3 0f 1e fa          	endbr64
   288ac:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   288b0:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   288b4:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   288b9:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   288bd:	48 89 c8             	mov    rax,rcx
   288c0:	0f 87 14 14 00 00    	ja     29cda <JS_CallInternal+0x713a>
   288c6:	48 83 eb 10          	sub    rbx,0x10
   288ca:	85 c0                	test   eax,eax
   288cc:	75 0d                	jne    288db <JS_CallInternal+0x5d3b>
   288ce:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   288d3:	83 e8 01             	sub    eax,0x1
   288d6:	48 98                	cdqe
   288d8:	49 01 c5             	add    r13,rax
   288db:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   288e2:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   288e8:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   288ee:	83 e8 01             	sub    eax,0x1
   288f1:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   288f7:	85 c0                	test   eax,eax
   288f9:	0f 8e 2b 2f 00 00    	jle    2b82a <JS_CallInternal+0x8c8a>
   288ff:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28904:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28908:	49 89 c5             	mov    r13,rax
   2890b:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2890f:	f3 0f 1e fa          	endbr64
   28913:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   28917:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   2891b:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   28920:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28924:	48 89 c8             	mov    rax,rcx
   28927:	0f 87 99 13 00 00    	ja     29cc6 <JS_CallInternal+0x7126>
   2892d:	48 83 eb 10          	sub    rbx,0x10
   28931:	85 c0                	test   eax,eax
   28933:	74 0d                	je     28942 <JS_CallInternal+0x5da2>
   28935:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   2893a:	83 e8 01             	sub    eax,0x1
   2893d:	48 98                	cdqe
   2893f:	49 01 c5             	add    r13,rax
   28942:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28949:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   2894f:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28955:	83 e8 01             	sub    eax,0x1
   28958:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   2895e:	85 c0                	test   eax,eax
   28960:	0f 8e 4f 2e 00 00    	jle    2b7b5 <JS_CallInternal+0x8c15>
   28966:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2896b:	4d 8d 65 01          	lea    r12,[r13+0x1]
   2896f:	49 89 c5             	mov    r13,rax
   28972:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28976:	f3 0f 1e fa          	endbr64
   2897a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   28981:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28988:	ba 01 00 00 00       	mov    edx,0x1
   2898d:	48 89 de             	mov    rsi,rbx
   28990:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   28994:	e8 57 d3 06 00       	call   95cf0 <js_for_of_start>
   28999:	85 c0                	test   eax,eax
   2899b:	0f 85 9f a9 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
   289a1:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   289a8:	00 
   289a9:	49 83 c4 01          	add    r12,0x1
   289ad:	48 83 c3 20          	add    rbx,0x20
   289b1:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   289b8:	00 
   289b9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   289bf:	49 89 c5             	mov    r13,rax
   289c2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   289c6:	ff e0                	jmp    rax
   289c8:	f3 0f 1e fa          	endbr64
   289cc:	e9 e3 a6 ff ff       	jmp    230b4 <JS_CallInternal+0x514>
   289d1:	f3 0f 1e fa          	endbr64
   289d5:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   289dc:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   289e1:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   289e5:	48 89 da             	mov    rdx,rbx
   289e8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   289ef:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   289f3:	e8 a8 5b 04 00       	call   6e5a0 <JS_GetGlobalVarRef>
   289f8:	85 c0                	test   eax,eax
   289fa:	0f 85 fb 3d 00 00    	jne    2c7fb <JS_CallInternal+0x9c5b>
   28a00:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   28a06:	48 83 c3 20          	add    rbx,0x20
   28a0a:	49 83 c4 05          	add    r12,0x5
   28a0e:	49 89 c5             	mov    r13,rax
   28a11:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28a15:	ff e0                	jmp    rax
   28a17:	f3 0f 1e fa          	endbr64
   28a1b:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   28a20:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
