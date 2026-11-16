; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   24002:	f3 0f 1e fa          	endbr64
   24006:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2400a:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   24011:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24015:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24019:	48 c1 e0 04          	shl    rax,0x4
   2401d:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   24021:	49 89 c6             	mov    r14,rax
   24024:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24029:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24030:	41 83 fa ff          	cmp    r10d,0xffffffff
   24034:	0f 85 a0 6d 00 00    	jne    2adda <JS_CallInternal+0x831a>
   2403a:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
   2403d:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
   24041:	25 08 00 ff ff       	and    eax,0xffff0008
   24046:	3d 00 00 01 00       	cmp    eax,0x10000
   2404b:	0f 84 8f 5c 00 00    	je     29ce0 <JS_CallInternal+0x7220>
   24051:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   24055:	48 89 f2             	mov    rdx,rsi
   24058:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2405f:	00 
   24060:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24064:	89 cf                	mov    edi,ecx
   24066:	21 c7                	and    edi,eax
   24068:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
   2406d:	48 85 ff             	test   rdi,rdi
   24070:	0f 84 38 4d 00 00    	je     28dae <JS_CallInternal+0x62ee>
   24076:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2407d:	00 
   2407e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24082:	4c 01 e8             	add    rax,r13
   24085:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24088:	0f 85 12 4d 00 00    	jne    28da0 <JS_CallInternal+0x62e0>
   2408e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24092:	0f 87 c2 52 00 00    	ja     2935a <JS_CallInternal+0x689a>
   24098:	48 89 f9             	mov    rcx,rdi
   2409b:	48 8b 7a 20          	mov    rdi,QWORD PTR [rdx+0x20]
   2409f:	48 c1 e1 04          	shl    rcx,0x4
   240a3:	48 83 e9 10          	sub    rcx,0x10
   240a7:	48 01 cf             	add    rdi,rcx
   240aa:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
   240ae:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   240b1:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   240b5:	76 04                	jbe    240bb <JS_CallInternal+0x15fb>
   240b7:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   240bb:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
   240bf:	48 39 f2             	cmp    rdx,rsi
   240c2:	0f 84 56 7c 00 00    	je     2bd1e <JS_CallInternal+0x925e>
   240c8:	49 89 c5             	mov    r13,rax
   240cb:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
   240cf:	49 8b 33             	mov    rsi,QWORD PTR [r11]
   240d2:	83 fa f6             	cmp    edx,0xfffffff6
   240d5:	76 11                	jbe    240e8 <JS_CallInternal+0x1628>
   240d7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   240da:	83 e8 01             	sub    eax,0x1
   240dd:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   240e0:	85 c0                	test   eax,eax
   240e2:	0f 8e 73 6b 00 00    	jle    2ac5b <JS_CallInternal+0x819b>
   240e8:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
   240ec:	49 83 c4 05          	add    r12,0x5
   240f0:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
   240f4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   240fa:	49 89 c5             	mov    r13,rax
   240fd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24101:	ff e0                	jmp    rax
   24103:	f3 0f 1e fa          	endbr64
   24107:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2410b:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   2410f:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24113:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24117:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   2411b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   24122:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   24126:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2412d:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   24134:	83 fb f9             	cmp    ebx,0xfffffff9
   24137:	0f 85 d3 5f 00 00    	jne    2a110 <JS_CallInternal+0x7650>
   2413d:	83 f8 f9             	cmp    eax,0xfffffff9
   24140:	0f 85 ca 5f 00 00    	jne    2a110 <JS_CallInternal+0x7650>
   24146:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2414d:	ba 12 00 00 00       	mov    edx,0x12
   24152:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
   24159:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
   24160:	00 00 00 00 
   24164:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   2416b:	00 00 00 00 
   2416f:	48 8b 77 48          	mov    rsi,QWORD PTR [rdi+0x48]
   24173:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   24177:	e8 74 22 02 00       	call   463f0 <JS_NewObjectFromShape>
   2417c:	83 fa 06             	cmp    edx,0x6
