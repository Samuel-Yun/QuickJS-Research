; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   2780f:	f3 0f 1e fa          	endbr64
   27813:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   27818:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   2781f:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   27824:	49 c1 e5 04          	shl    r13,0x4
   27828:	49 01 c5             	add    r13,rax
   2782b:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   27831:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
   27838:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
   2783f:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
   27846:	85 d2                	test   edx,edx
   27848:	0f 85 50 1c 00 00    	jne    2949e <JS_CallInternal+0x69de>
   2784e:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   27853:	0f 84 45 1c 00 00    	je     2949e <JS_CallInternal+0x69de>
   27859:	83 c0 01             	add    eax,0x1
   2785c:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   27863:	00 
   27864:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   27868:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   2786e:	49 83 c4 02          	add    r12,0x2
   27872:	49 89 c5             	mov    r13,rax
   27875:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27879:	ff e0                	jmp    rax
   2787b:	f3 0f 1e fa          	endbr64
   2787f:	44 8b 43 f8          	mov    r8d,DWORD PTR [rbx-0x8]
   27883:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   27887:	45 85 c0             	test   r8d,r8d
   2788a:	0f 85 b0 1e 00 00    	jne    29740 <JS_CallInternal+0x6c80>
   27890:	3d 00 00 00 80       	cmp    eax,0x80000000
   27895:	0f 84 a5 1e 00 00    	je     29740 <JS_CallInternal+0x6c80>
   2789b:	83 e8 01             	sub    eax,0x1
   2789e:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   278a5:	00 
   278a6:	48 89 03             	mov    QWORD PTR [rbx],rax
   278a9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   278ae:	48 83 c3 10          	add    rbx,0x10
   278b2:	49 83 c4 01          	add    r12,0x1
   278b6:	49 89 c5             	mov    r13,rax
   278b9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   278bd:	ff e0                	jmp    rax
   278bf:	f3 0f 1e fa          	endbr64
   278c3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   278ca:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   278d1:	31 d2                	xor    edx,edx
   278d3:	48 89 de             	mov    rsi,rbx
   278d6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   278da:	e8 71 e1 06 00       	call   95a50 <js_for_of_start>
   278df:	85 c0                	test   eax,eax
   278e1:	0f 85 79 b9 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
   278e7:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   278ee:	00 
   278ef:	49 83 c4 01          	add    r12,0x1
   278f3:	48 83 c3 20          	add    rbx,0x20
   278f7:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   278fe:	00 
   278ff:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27905:	49 89 c5             	mov    r13,rax
   27908:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2790c:	ff e0                	jmp    rax
   2790e:	f3 0f 1e fa          	endbr64
   27912:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   27916:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   2791a:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2791e:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   27922:	48 89 d7             	mov    rdi,rdx
   27925:	45 85 c9             	test   r9d,r9d
   27928:	0f 85 b3 33 00 00    	jne    2ace1 <JS_CallInternal+0x8221>
   2792e:	45 85 f6             	test   r14d,r14d
   27931:	0f 85 67 1d 00 00    	jne    2969e <JS_CallInternal+0x6bde>
   27937:	31 c0                	xor    eax,eax
   27939:	44 39 ea             	cmp    edx,r13d
   2793c:	0f 95 c0             	setne  al
   2793f:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   27943:	49 83 c4 01          	add    r12,0x1
   27947:	48 83 eb 10          	sub    rbx,0x10
   2794b:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27952:	00 
   27953:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27959:	49 89 c5             	mov    r13,rax
   2795c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27960:	ff e0                	jmp    rax
   27962:	f3 0f 1e fa          	endbr64
   27966:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   2796a:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   2796e:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   27972:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   27976:	48 89 d7             	mov    rdi,rdx
   27979:	45 85 c0             	test   r8d,r8d
   2797c:	0f 85 12 3d 00 00    	jne    2b694 <JS_CallInternal+0x8bd4>
   27982:	45 85 f6             	test   r14d,r14d
