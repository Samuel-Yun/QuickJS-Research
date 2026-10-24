; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   2786d:	f3 0f 1e fa          	endbr64
   27871:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   27875:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   27879:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2787d:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   27881:	89 cf                	mov    edi,ecx
   27883:	09 f7                	or     edi,esi
   27885:	0f 85 46 3f 00 00    	jne    2b7d1 <JS_CallInternal+0x8c31>
   2788b:	39 d0                	cmp    eax,edx
   2788d:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   27894:	00 
   27895:	0f 9c c0             	setl   al
   27898:	48 83 eb 10          	sub    rbx,0x10
   2789c:	0f b6 c0             	movzx  eax,al
   2789f:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   278a3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   278a8:	49 83 c4 01          	add    r12,0x1
   278ac:	49 89 c5             	mov    r13,rax
   278af:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   278b3:	ff e0                	jmp    rax
   278b5:	f3 0f 1e fa          	endbr64
   278b9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   278c0:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   278c4:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   278c8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   278cf:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   278d3:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   278d7:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   278de:	e8 1d c4 01 00       	call   43d00 <JS_ValueToAtom>
   278e3:	41 89 c5             	mov    r13d,eax
   278e6:	45 85 ed             	test   r13d,r13d
   278e9:	0f 84 51 ba ff ff    	je     23340 <JS_CallInternal+0x7a0>
   278ef:	83 7b d8 03          	cmp    DWORD PTR [rbx-0x28],0x3
   278f3:	0f 84 71 39 00 00    	je     2b26a <JS_CallInternal+0x86ca>
   278f9:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   278fd:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   27901:	44 89 e9             	mov    ecx,r13d
   27904:	4c 8d 73 d0          	lea    r14,[rbx-0x30]
   27908:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2790f:	e8 1c 6b 04 00       	call   6e430 <JS_HasProperty>
   27914:	85 c0                	test   eax,eax
   27916:	0f 8e f6 38 00 00    	jle    2b212 <JS_CallInternal+0x8672>
   2791c:	48 83 ec 08          	sub    rsp,0x8
   27920:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27924:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   27928:	44 89 e9             	mov    ecx,r13d
   2792b:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   2792e:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27932:	68 00 80 00 00       	push   0x8000
   27937:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   2793b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27942:	41 ff 36             	push   QWORD PTR [r14]
   27945:	e8 26 64 00 00       	call   2dd70 <JS_SetPropertyInternal>
   2794a:	48 83 c4 20          	add    rsp,0x20
   2794e:	89 c3                	mov    ebx,eax
   27950:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   27957:	0f 8f 60 29 00 00    	jg     2a2bd <JS_CallInternal+0x771d>
   2795d:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   27964:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27968:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2796b:	83 fa f6             	cmp    edx,0xfffffff6
   2796e:	76 11                	jbe    27981 <JS_CallInternal+0x4de1>
   27970:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27973:	83 e8 01             	sub    eax,0x1
   27976:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27979:	85 c0                	test   eax,eax
   2797b:	0f 8e 86 39 00 00    	jle    2b307 <JS_CallInternal+0x8767>
   27981:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27985:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   27988:	83 fa f6             	cmp    edx,0xfffffff6
   2798b:	76 11                	jbe    2799e <JS_CallInternal+0x4dfe>
   2798d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27990:	83 e8 01             	sub    eax,0x1
   27993:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27996:	85 c0                	test   eax,eax
   27998:	0f 8e 77 3e 00 00    	jle    2b815 <JS_CallInternal+0x8c75>
   2799e:	85 db                	test   ebx,ebx
   279a0:	0f 88 4a 44 00 00    	js     2bdf0 <JS_CallInternal+0x9250>
   279a6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   279ab:	4c 89 f3             	mov    rbx,r14
   279ae:	49 83 c4 01          	add    r12,0x1
   279b2:	49 89 c5             	mov    r13,rax
   279b5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   279b9:	ff e0                	jmp    rax
   279bb:	f3 0f 1e fa          	endbr64
   279bf:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   279c3:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   279c6:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   279ca:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   279ce:	0f 85 e5 37 00 00    	jne    2b1b9 <JS_CallInternal+0x8619>
