; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   2400a:	f3 0f 1e fa          	endbr64
   2400e:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   24015:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
   24019:	4d 8d 4c 24 ff       	lea    r9,[r12-0x1]
   2401e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24022:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   24026:	48 8b 70 60          	mov    rsi,QWORD PTR [rax+0x60]
   2402a:	89 f8                	mov    eax,edi
   2402c:	48 8d 04 40          	lea    rax,[rax+rax*2]
   24030:	4c 8d 04 c6          	lea    r8,[rsi+rax*8]
   24034:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24039:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24040:	41 83 fa ff          	cmp    r10d,0xffffffff
   24044:	0f 85 3f 7c 00 00    	jne    2bc89 <JS_CallInternal+0x90e9>
   2404a:	41 8b 46 10          	mov    eax,DWORD PTR [r14+0x10]
   2404e:	41 0f b6 50 10       	movzx  edx,BYTE PTR [r8+0x10]
   24053:	25 08 00 ff ff       	and    eax,0xffff0008
   24058:	3d 00 00 01 00       	cmp    eax,0x10000
   2405d:	0f 84 5d 5f 00 00    	je     29fc0 <JS_CallInternal+0x7420>
   24063:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   24067:	80 fa 1f             	cmp    dl,0x1f
   2406a:	77 07                	ja     24073 <JS_CallInternal+0x14d3>
   2406c:	83 c2 01             	add    edx,0x1
   2406f:	41 88 50 10          	mov    BYTE PTR [r8+0x10],dl
   24073:	80 fa 20             	cmp    dl,0x20
   24076:	0f 84 67 5f 00 00    	je     29fe3 <JS_CallInternal+0x7443>
   2407c:	49 8b 46 18          	mov    rax,QWORD PTR [r14+0x18]
   24080:	4c 89 f1             	mov    rcx,r14
   24083:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   24088:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
   2408b:	44 89 ee             	mov    esi,r13d
   2408e:	21 d6                	and    esi,edx
   24090:	8b 7c b0 38          	mov    edi,DWORD PTR [rax+rsi*4+0x38]
   24094:	48 85 ff             	test   rdi,rdi
   24097:	0f 84 7b 4e 00 00    	je     28f18 <JS_CallInternal+0x6378>
   2409d:	48 8d 34 95 34 00 00 	lea    rsi,[rdx*4+0x34]
   240a4:	00 
   240a5:	48 8d 14 fe          	lea    rdx,[rsi+rdi*8]
   240a9:	48 01 c2             	add    rdx,rax
   240ac:	44 3b 6a 04          	cmp    r13d,DWORD PTR [rdx+0x4]
   240b0:	0f 85 54 4e 00 00    	jne    28f0a <JS_CallInternal+0x636a>
   240b6:	80 7a 03 3f          	cmp    BYTE PTR [rdx+0x3],0x3f
   240ba:	48 8b 71 20          	mov    rsi,QWORD PTR [rcx+0x20]
   240be:	0f 87 d2 53 00 00    	ja     29496 <JS_CallInternal+0x68f6>
   240c4:	48 c1 e7 04          	shl    rdi,0x4
   240c8:	48 89 fa             	mov    rdx,rdi
   240cb:	48 83 ea 10          	sub    rdx,0x10
   240cf:	48 01 d6             	add    rsi,rdx
   240d2:	4c 8b 6e 08          	mov    r13,QWORD PTR [rsi+0x8]
   240d6:	4c 8b 0e             	mov    r9,QWORD PTR [rsi]
   240d9:	41 83 fd f6          	cmp    r13d,0xfffffff6
   240dd:	76 05                	jbe    240e4 <JS_CallInternal+0x1544>
   240df:	41 83 41 fc 01       	add    DWORD PTR [r9-0x4],0x1
   240e4:	4c 39 f1             	cmp    rcx,r14
   240e7:	0f 84 6a 7f 00 00    	je     2c057 <JS_CallInternal+0x94b7>
   240ed:	4c 89 c8             	mov    rax,r9
   240f0:	4c 89 6b 08          	mov    QWORD PTR [rbx+0x8],r13
   240f4:	49 83 c4 05          	add    r12,0x5
   240f8:	48 83 c3 10          	add    rbx,0x10
   240fc:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   24100:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24106:	49 89 c5             	mov    r13,rax
   24109:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2410d:	ff e0                	jmp    rax
   2410f:	f3 0f 1e fa          	endbr64
   24113:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2411a:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
   2411e:	49 8d 4c 24 04       	lea    rcx,[r12+0x4]
   24123:	4d 8d 54 24 ff       	lea    r10,[r12-0x1]
   24128:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2412f:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   24133:	48 8b 70 60          	mov    rsi,QWORD PTR [rax+0x60]
   24137:	89 f8                	mov    eax,edi
   24139:	48 8d 04 40          	lea    rax,[rax+rax*2]
   2413d:	4c 8d 04 c6          	lea    r8,[rsi+rax*8]
   24141:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24145:	83 f8 ff             	cmp    eax,0xffffffff
   24148:	0f 85 f2 6e 00 00    	jne    2b040 <JS_CallInternal+0x84a0>
   2414e:	41 8b 56 10          	mov    edx,DWORD PTR [r14+0x10]
   24152:	41 0f b6 48 10       	movzx  ecx,BYTE PTR [r8+0x10]
   24157:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2415d:	81 fa 00 00 01 00    	cmp    edx,0x10000
   24163:	0f 84 67 5f 00 00    	je     2a0d0 <JS_CallInternal+0x7530>
   24169:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   2416d:	80 f9 1f             	cmp    cl,0x1f
   24170:	77 07                	ja     24179 <JS_CallInternal+0x15d9>
   24172:	83 c1 01             	add    ecx,0x1
   24175:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
   24179:	80 f9 20             	cmp    cl,0x20
   2417c:	0f 84 71 5f 00 00    	je     2a0f3 <JS_CallInternal+0x7553>
