
... disjoint excerpt ...

   23f04:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23f08:	ff e0                	jmp    rax
   23f0a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   23f0e:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   23f12:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   23f19:	4c 8b 5b f8          	mov    r11,QWORD PTR [rbx-0x8]
   23f1d:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
   23f21:	48 8d 04 d5 00 00 00 	lea    rax,[rdx*8+0x0]
   23f28:	00 
   23f29:	48 29 d0             	sub    rax,rdx
   23f2c:	48 8b 51 60          	mov    rdx,QWORD PTR [rcx+0x60]
   23f30:	4c 8d 34 c2          	lea    r14,[rdx+rax*8]
   23f34:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   23f39:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 2)
   23f40:	41 83 fb ff          	cmp    r11d,0xffffffff
   23f44:	0f 85 49 73 00 00    	jne    2b293 <JS_CallInternal+0x87f3>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   23f4a:	41 8b 42 10          	mov    eax,DWORD PTR [r10+0x10]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 3)
   23f4e:	4d 8b 6a 18          	mov    r13,QWORD PTR [r10+0x18]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   23f52:	25 08 00 ff ff       	and    eax,0xffff0008
   23f57:	3d 00 00 01 00       	cmp    eax,0x10000
   23f5c:	0f 84 2a 60 00 00    	je     29f8c <JS_CallInternal+0x74ec>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 6)
   23f62:	41 8b 4e 30          	mov    ecx,DWORD PTR [r14+0x30]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 8)
   23f66:	4c 89 d2             	mov    rdx,r10
   23f69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6152
   23f70:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   23f74:	89 ce                	mov    esi,ecx
   23f76:	21 c6                	and    esi,eax
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6153
   23f78:	41 8b 74 b5 38       	mov    esi,DWORD PTR [r13+rsi*4+0x38]
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6155
   23f7d:	48 85 f6             	test   rsi,rsi
   23f80:	0f 84 46 4e 00 00    	je     28dcc <JS_CallInternal+0x632c>
   23f86:	48 8d 3c 85 34 00 00 	lea    rdi,[rax*4+0x34]
   23f8d:	00 
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6156
   23f8e:	48 8d 04 f7          	lea    rax,[rdi+rsi*8]
   23f92:	4c 01 e8             	add    rax,r13

... disjoint excerpt ...

   23f95:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   23f98:	0f 85 20 4e 00 00    	jne    28dbe <JS_CallInternal+0x631e>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   23f9e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6158
   23fa2:	48 8b 7a 20          	mov    rdi,QWORD PTR [rdx+0x20]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   23fa6:	0f 87 14 55 00 00    	ja     294c0 <JS_CallInternal+0x6a20>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6158
   23fac:	48 c1 e6 04          	shl    rsi,0x4
   23fb0:	48 8d 46 f0          	lea    rax,[rsi-0x10]
   23fb4:	48 01 c7             	add    rdi,rax
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 14)
   23fb7:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   23fbb:	4c 8b 07             	mov    r8,QWORD PTR [rdi]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:709
   23fbe:	83 f9 f6             	cmp    ecx,0xfffffff6
   23fc1:	76 05                	jbe    23fc8 <JS_CallInternal+0x1528>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:711
   23fc3:	41 83 40 fc 01       	add    DWORD PTR [r8-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   23fc8:	4c 39 d2             	cmp    rdx,r10
   23fcb:	0f 84 cd 81 00 00    	je     2c19e <JS_CallInternal+0x96fe>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 30)
   23fd1:	4c 89 03             	mov    QWORD PTR [rbx],r8
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:71
   23fd4:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 30)
   23fd8:	48 83 c3 10          	add    rbx,0x10
   23fdc:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:71
   23fe0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23fe6:	49 89 c5             	mov    r13,rax
   23fe9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23fed:	ff e0                	jmp    rax
   23fef:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   23ff3:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   23ff7:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   23ffe:	4c 8b 5b f8          	mov    r11,QWORD PTR [rbx-0x8]
   24002:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
   24006:	48 8d 04 d5 00 00 00 	lea    rax,[rdx*8+0x0]
   2400d:	00 
   2400e:	48 29 d0             	sub    rax,rdx
   24011:	48 8b 51 60          	mov    rdx,QWORD PTR [rcx+0x60]
   24015:	4c 8d 34 c2          	lea    r14,[rdx+rax*8]
   24019:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   2401e:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 2)
   24025:	41 83 fb ff          	cmp    r11d,0xffffffff
   24029:	0f 85 32 79 00 00    	jne    2b961 <JS_CallInternal+0x8ec1>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   2402f:	41 8b 42 10          	mov    eax,DWORD PTR [r10+0x10]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 3)
   24033:	4d 8b 6a 18          	mov    r13,QWORD PTR [r10+0x18]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   24037:	25 08 00 ff ff       	and    eax,0xffff0008
   2403c:	3d 00 00 01 00       	cmp    eax,0x10000
   24041:	0f 84 3a 5d 00 00    	je     29d81 <JS_CallInternal+0x72e1>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 6)
   24047:	41 8b 4e 30          	mov    ecx,DWORD PTR [r14+0x30]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 8)
   2404b:	4c 89 d2             	mov    rdx,r10
   2404e:	66 90                	xchg   ax,ax
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6152
   24050:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24054:	89 ce                	mov    esi,ecx
   24056:	21 c6                	and    esi,eax
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6153
   24058:	41 8b 74 b5 38       	mov    esi,DWORD PTR [r13+rsi*4+0x38]
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6155
   2405d:	48 85 f6             	test   rsi,rsi
   24060:	0f 84 38 4d 00 00    	je     28d9e <JS_CallInternal+0x62fe>
   24066:	48 8d 3c 85 34 00 00 	lea    rdi,[rax*4+0x34]
   2406d:	00 
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6156
   2406e:	48 8d 04 f7          	lea    rax,[rdi+rsi*8]
   24072:	4c 01 e8             	add    rax,r13

... disjoint excerpt ...

   24075:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24078:	0f 85 12 4d 00 00    	jne    28d90 <JS_CallInternal+0x62f0>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   2407e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6158
   24082:	48 8b 7a 20          	mov    rdi,QWORD PTR [rdx+0x20]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   24086:	0f 87 ce 53 00 00    	ja     2945a <JS_CallInternal+0x69ba>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6158
   2408c:	48 c1 e6 04          	shl    rsi,0x4
   24090:	48 8d 46 f0          	lea    rax,[rsi-0x10]
   24094:	48 01 c7             	add    rdi,rax
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 14)
   24097:	4c 8b 4f 08          	mov    r9,QWORD PTR [rdi+0x8]
   2409b:	48 8b 0f             	mov    rcx,QWORD PTR [rdi]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:709
   2409e:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   240a2:	76 04                	jbe    240a8 <JS_CallInternal+0x1608>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:711
   240a4:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18045
   240a8:	48 8d 7b f0          	lea    rdi,[rbx-0x10]
   240ac:	48 89 bd 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdi
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   240b3:	49 39 d2             	cmp    r10,rdx
   240b6:	0f 84 04 7e 00 00    	je     2bec0 <JS_CallInternal+0x9420>
   240bc:	49 89 cd             	mov    r13,rcx
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 31)
   240bf:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   240c6:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   240ca:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:689
   240cd:	83 fa f6             	cmp    edx,0xfffffff6
   240d0:	76 11                	jbe    240e3 <JS_CallInternal+0x1643>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:691
   240d2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   240d5:	83 e8 01             	sub    eax,0x1
   240d8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   240db:	85 c0                	test   eax,eax
   240dd:	0f 8e 75 68 00 00    	jle    2a958 <JS_CallInternal+0x7eb8>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   240e3:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:68
   240e7:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   240eb:	4c 89 4b f8          	mov    QWORD PTR [rbx-0x8],r9
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:68
   240ef:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   240f5:	49 89 c5             	mov    r13,rax
   240f8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   240fc:	ff e0                	jmp    rax
   240fe:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18449
   24102:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   24106:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   2410a:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   2410e:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24112:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   24116:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2411d:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   24121:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   24128:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
JS_NewRegexp():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:47686 (discriminator 1)

... disjoint excerpt ...

   28d92:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   28d98:	0f 85 d0 b2 ff ff    	jne    2406e <JS_CallInternal+0x15ce>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   28d9e:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28da2:	0f 85 a8 06 00 00    	jne    29450 <JS_CallInternal+0x69b0>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 24)
   28da8:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dac:	48 85 d2             	test   rdx,rdx
   28daf:	0f 84 3e 16 00 00    	je     2a3f3 <JS_CallInternal+0x7953>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6151
   28db5:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28db9:	e9 92 b2 ff ff       	jmp    24050 <JS_CallInternal+0x15b0>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6162
   28dbe:	8b 30                	mov    esi,DWORD PTR [rax]
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6155
   28dc0:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   28dc6:	0f 85 c2 b1 ff ff    	jne    23f8e <JS_CallInternal+0x14ee>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   28dcc:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28dd0:	0f 85 e0 06 00 00    	jne    294b6 <JS_CallInternal+0x6a16>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 24)
   28dd6:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dda:	48 85 d2             	test   rdx,rdx
   28ddd:	0f 84 fb 15 00 00    	je     2a3de <JS_CallInternal+0x793e>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6151
   28de3:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28de7:	e9 84 b1 ff ff       	jmp    23f70 <JS_CallInternal+0x14d0>
min_int():
/home/mzyx/read_ic_mic_attempt01/P/cutils.h:90
   28dec:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28df2:	39 f7                	cmp    edi,esi
   28df4:	41 89 f5             	mov    r13d,esi
   28df7:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:17871 (discriminator 1)
   28dfb:	45 85 ed             	test   r13d,r13d
   28dfe:	0f 8e 48 14 00 00    	jle    2a24c <JS_CallInternal+0x77ac>

... disjoint excerpt ...

   29446:	e8 55 34 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2944b:	e9 18 e4 ff ff       	jmp    27868 <JS_CallInternal+0x4dc8>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 23)
   29450:	49 89 d2             	mov    r10,rdx
   29453:	49 c7 c3 ff ff ff ff 	mov    r11,0xffffffffffffffff
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 15)
   2945a:	48 83 ec 08          	sub    rsp,0x8
   2945e:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29462:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29466:	4c 89 d6             	mov    rsi,r10
   29469:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29470:	48 8b bd 40 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1c0]
   29477:	4c 89 da             	mov    rdx,r11
   2947a:	48 89 78 30          	mov    QWORD PTR [rax+0x30],rdi
   2947e:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   29482:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29489:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   29490:	6a 00                	push   0x0
   29492:	e8 49 3a 00 00       	call   2cee0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 3)
   29497:	41 58                	pop    r8
   29499:	41 5a                	pop    r10
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 15)
   2949b:	49 89 c5             	mov    r13,rax
   2949e:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 3)
   294a1:	83 fa 06             	cmp    edx,0x6
   294a4:	0f 85 15 ac ff ff    	jne    240bf <JS_CallInternal+0x161f>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   294aa:	4c 8b a5 40 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c0]
   294b1:	e9 8a 9d ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 23)
   294b6:	49 89 d2             	mov    r10,rdx
   294b9:	49 c7 c3 ff ff ff ff 	mov    r11,0xffffffffffffffff
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 15)
   294c0:	48 83 ec 08          	sub    rsp,0x8
   294c4:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   294c8:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   294cc:	4c 89 d6             	mov    rsi,r10
   294cf:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   294d6:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   294dd:	4c 89 da             	mov    rdx,r11
   294e0:	48 89 78 30          	mov    QWORD PTR [rax+0x30],rdi
   294e4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   294eb:	6a 00                	push   0x0
   294ed:	e8 ee 39 00 00       	call   2cee0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 3)
   294f2:	5e                   	pop    rsi
   294f3:	5f                   	pop    rdi
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 15)
   294f4:	48 89 d1             	mov    rcx,rdx
   294f7:	49 89 c0             	mov    r8,rax
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 3)
   294fa:	83 fa 06             	cmp    edx,0x6
   294fd:	0f 85 ce aa ff ff    	jne    23fd1 <JS_CallInternal+0x1531>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   29503:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2950a:	e9 31 9d ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20486
   2950f:	85 c0                	test   eax,eax
   29511:	0f 84 d1 b9 ff ff    	je     24ee8 <JS_CallInternal+0x2448>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20492
   29517:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_ToPropertyKey():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:13688
   2951e:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29522:	b9 01 00 00 00       	mov    ecx,0x1
   29527:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2952b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20492
   29532:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_ToPropertyKey():

... disjoint excerpt ...

   29d7a:	31 ff                	xor    edi,edi
   29d7c:	e9 0b e7 ff ff       	jmp    2848c <JS_CallInternal+0x59ec>
rdi_probe():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:12
   29d81:	41 0f b6 56 34       	movzx  edx,BYTE PTR [r14+0x34]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:14
   29d86:	8d 42 01             	lea    eax,[rdx+0x1]
   29d89:	8d 72 04             	lea    esi,[rdx+0x4]
   29d8c:	4d 39 2c d6          	cmp    QWORD PTR [r14+rdx*8],r13
   29d90:	0f 84 7a 13 00 00    	je     2b110 <JS_CallInternal+0x8670>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:17
   29d96:	89 c1                	mov    ecx,eax
   29d98:	83 e1 03             	and    ecx,0x3
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:19
   29d9b:	89 ca                	mov    edx,ecx
   29d9d:	4d 39 2c d6          	cmp    QWORD PTR [r14+rdx*8],r13
   29da1:	0f 84 65 13 00 00    	je     2b10c <JS_CallInternal+0x866c>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:16 (discriminator 1)
   29da7:	83 c0 01             	add    eax,0x1
   29daa:	39 f0                	cmp    eax,esi
   29dac:	75 e8                	jne    29d96 <JS_CallInternal+0x72f6>
   29dae:	e9 94 a2 ff ff       	jmp    24047 <JS_CallInternal+0x15a7>
   29db3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29dba:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:3436
   29dbe:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   29dc5:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:3437 (discriminator 1)
   29dc9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29dcc:	83 e8 01             	sub    eax,0x1
   29dcf:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29dd2:	85 c0                	test   eax,eax
   29dd4:	0f 8f ab e9 ff ff    	jg     28785 <JS_CallInternal+0x5ce5>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:3439

... disjoint excerpt ...

   29f80:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   29f87:	e9 d4 ce ff ff       	jmp    26e60 <JS_CallInternal+0x43c0>
rdi_probe():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:12
   29f8c:	41 0f b6 56 34       	movzx  edx,BYTE PTR [r14+0x34]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:14
   29f91:	8d 42 01             	lea    eax,[rdx+0x1]
   29f94:	8d 72 04             	lea    esi,[rdx+0x4]
   29f97:	4d 39 2c d6          	cmp    QWORD PTR [r14+rdx*8],r13
   29f9b:	0f 84 61 0f 00 00    	je     2af02 <JS_CallInternal+0x8462>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:17
   29fa1:	89 c1                	mov    ecx,eax
   29fa3:	83 e1 03             	and    ecx,0x3
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:19
   29fa6:	89 ca                	mov    edx,ecx
   29fa8:	4d 39 2c d6          	cmp    QWORD PTR [r14+rdx*8],r13
   29fac:	0f 84 4c 0f 00 00    	je     2aefe <JS_CallInternal+0x845e>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:16 (discriminator 1)
   29fb2:	83 c0 01             	add    eax,0x1
   29fb5:	39 f0                	cmp    eax,esi
   29fb7:	75 e8                	jne    29fa1 <JS_CallInternal+0x7501>
   29fb9:	e9 a4 9f ff ff       	jmp    23f62 <JS_CallInternal+0x14c2>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20725
   29fbe:	48 89 fe             	mov    rsi,rdi
   29fc1:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
   29fc8:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   29fcf:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
   29fd6:	48 89 8d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rcx
   29fdd:	e8 ce 63 ff ff       	call   203b0 <close_var_refs>
   29fe2:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
   29fe9:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
   29ff0:	e9 b0 91 ff ff       	jmp    231a5 <JS_CallInternal+0x705>
JS_NewRegexp():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:47688

... disjoint excerpt ...

   2a3cd:	48 8d 35 38 31 0a 00 	lea    rsi,[rip+0xa3138]        # cd50c <_IO_stdin_used+0x50c>
   2a3d4:	e8 57 8d 00 00       	call   33130 <JS_ThrowInternalError>
   2a3d9:	e9 62 8e ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 25)
   2a3de:	b9 03 00 00 00       	mov    ecx,0x3
   2a3e3:	45 31 c0             	xor    r8d,r8d
   2a3e6:	e9 e6 9b ff ff       	jmp    23fd1 <JS_CallInternal+0x1531>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19085
   2a3eb:	4d 89 ec             	mov    r12,r13
   2a3ee:	e9 4d 8e ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18045
   2a3f3:	48 8d 43 f0          	lea    rax,[rbx-0x10]
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 25)
   2a3f7:	41 b9 03 00 00 00    	mov    r9d,0x3
   2a3fd:	45 31 ed             	xor    r13d,r13d
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18045
   2a400:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a407:	e9 b3 9c ff ff       	jmp    240bf <JS_CallInternal+0x161f>
__JS_FreeValue():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6516
   2a40c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a413:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a417:	e8 84 24 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a41c:	e9 0e ae ff ff       	jmp    2522f <JS_CallInternal+0x278f>
   2a421:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a428:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a42c:	e8 6f 24 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a431:	e9 ae ad ff ff       	jmp    251e4 <JS_CallInternal+0x2744>
   2a436:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a43d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]

... disjoint excerpt ...

   2aef2:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2aef9:	e9 9c a1 ff ff       	jmp    2509a <JS_CallInternal+0x25fa>
rdi_probe():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:20
   2aefe:	41 88 4e 34          	mov    BYTE PTR [r14+0x34],cl
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:21
   2af02:	41 8b 44 96 20       	mov    eax,DWORD PTR [r14+rdx*4+0x20]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 1)
   2af07:	83 f8 ff             	cmp    eax,0xffffffff
   2af0a:	0f 84 52 90 ff ff    	je     23f62 <JS_CallInternal+0x14c2>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 5)
   2af10:	48 c1 e0 04          	shl    rax,0x4
   2af14:	49 03 42 20          	add    rax,QWORD PTR [r10+0x20]
   2af18:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   2af1c:	4c 8b 00             	mov    r8,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:709
   2af1f:	83 f9 f6             	cmp    ecx,0xfffffff6
   2af22:	0f 86 a9 90 ff ff    	jbe    23fd1 <JS_CallInternal+0x1531>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:711
   2af28:	41 83 40 fc 01       	add    DWORD PTR [r8-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70
   2af2d:	e9 9f 90 ff ff       	jmp    23fd1 <JS_CallInternal+0x1531>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18274
   2af32:	4d 89 d4             	mov    r12,r10
   2af35:	e9 06 83 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
   2af3a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2af41:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2af45:	e9 4d e1 ff ff       	jmp    29097 <JS_CallInternal+0x65f7>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:17936 (discriminator 1)
   2af4a:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:17936
   2af4d:	4d 89 ec             	mov    r12,r13
   2af50:	e9 eb 82 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:7838
   2af55:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2af5c:	48 8d 35 fd 25 0a 00 	lea    rsi,[rip+0xa25fd]        # cd560 <_IO_stdin_used+0x560>
   2af63:	31 c0                	xor    eax,eax

... disjoint excerpt ...

   2b104:	4c 89 f3             	mov    rbx,r14
   2b107:	e9 34 81 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
rdi_probe():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:20
   2b10c:	41 88 4e 34          	mov    BYTE PTR [r14+0x34],cl
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:21
   2b110:	41 8b 44 96 20       	mov    eax,DWORD PTR [r14+rdx*4+0x20]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 1)
   2b115:	83 f8 ff             	cmp    eax,0xffffffff
   2b118:	0f 84 29 8f ff ff    	je     24047 <JS_CallInternal+0x15a7>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 5)
   2b11e:	48 c1 e0 04          	shl    rax,0x4
   2b122:	49 03 42 20          	add    rax,QWORD PTR [r10+0x20]
   2b126:	4c 8b 48 08          	mov    r9,QWORD PTR [rax+0x8]
   2b12a:	4c 8b 28             	mov    r13,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:709
   2b12d:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   2b131:	76 05                	jbe    2b138 <JS_CallInternal+0x8698>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.h:711
   2b133:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18045
   2b138:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   2b13c:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67
   2b143:	e9 77 8f ff ff       	jmp    240bf <JS_CallInternal+0x161f>
js_poll_interrupts():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:7901
   2b148:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b14f:	e8 5c 81 00 00       	call   332b0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18856 (discriminator 2)
   2b154:	85 c0                	test   eax,eax
   2b156:	0f 84 dd d0 ff ff    	je     28239 <JS_CallInternal+0x5799>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18855
   2b15c:	4d 89 ec             	mov    r12,r13
   2b15f:	e9 dc 80 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19301
   2b164:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19297
   2b167:	4d 89 ec             	mov    r12,r13
   2b16a:	e9 d1 80 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>

... disjoint excerpt ...

   2b28c:	31 ff                	xor    edi,edi
   2b28e:	e9 f9 d1 ff ff       	jmp    2848c <JS_CallInternal+0x59ec>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 6)
   2b293:	41 8b 4e 30          	mov    ecx,DWORD PTR [r14+0x30]
   2b297:	e9 24 e2 ff ff       	jmp    294c0 <JS_CallInternal+0x6a20>
   2b29c:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
__JS_FreeValue():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:6516
   2b2a3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b2aa:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2b2b1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b2b5:	e8 e6 15 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b2ba:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2b2c1:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2b2c8:	e9 d0 cc ff ff       	jmp    27f9d <JS_CallInternal+0x54fd>
   2b2cd:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2b2d4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b2db:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   2b2e2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b2e6:	e8 b5 15 ff ff       	call   1c8a0 <__JS_FreeValueRT>

... disjoint excerpt ...

   2b957:	e8 74 76 00 00       	call   32fd0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18771
   2b95c:	e9 df 78 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 6)
   2b961:	41 8b 4e 30          	mov    ecx,DWORD PTR [r14+0x30]
   2b965:	e9 f0 da ff ff       	jmp    2945a <JS_CallInternal+0x69ba>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20294 (discriminator 2)
   2b96a:	83 fe 08             	cmp    esi,0x8
   2b96d:	0f 84 c1 0b 00 00    	je     2c534 <JS_CallInternal+0x9a94>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20294 (discriminator 8)
   2b973:	85 f6                	test   esi,esi
   2b975:	75 09                	jne    2b980 <JS_CallInternal+0x8ee0>
   2b977:	83 f9 08             	cmp    ecx,0x8
   2b97a:	0f 84 ec 0b 00 00    	je     2c56c <JS_CallInternal+0x9acc>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20294 (discriminator 20)
   2b980:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b987:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b98e:	44 89 ea             	mov    edx,r13d
   2b991:	48 89 de             	mov    rsi,rbx
   2b994:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b998:	e8 33 f1 02 00       	call   5aad0 <js_relational_slow>

... disjoint excerpt ...

   2beb4:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2bebb:	e9 90 90 ff ff       	jmp    24f50 <JS_CallInternal+0x24b0>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 17)
   2bec0:	41 8b 52 10          	mov    edx,DWORD PTR [r10+0x10]
   2bec4:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2beca:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2bed0:	0f 85 e6 81 ff ff    	jne    240bc <JS_CallInternal+0x161c>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 19)
   2bed6:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2bedb:	0f 84 db 81 ff ff    	je     240bc <JS_CallInternal+0x161c>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:67 (discriminator 21)
   2bee1:	48 c1 f8 04          	sar    rax,0x4
   2bee5:	31 d2                	xor    edx,edx
   2bee7:	49 89 c0             	mov    r8,rax
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:42
   2beea:	b8 04 00 00 00       	mov    eax,0x4
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:45
   2beef:	49 8b 34 d6          	mov    rsi,QWORD PTR [r14+rdx*8]
   2bef3:	4c 39 ee             	cmp    rsi,r13
   2bef6:	0f 84 f1 0d 00 00    	je     2cced <JS_CallInternal+0xa24d>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:50 (discriminator 1)
   2befc:	48 85 f6             	test   rsi,rsi
   2beff:	75 06                	jne    2bf07 <JS_CallInternal+0x9467>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:51
   2bf01:	83 f8 04             	cmp    eax,0x4
   2bf04:	0f 44 c2             	cmove  eax,edx
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:43 (discriminator 1)
   2bf07:	48 83 c2 01          	add    rdx,0x1
   2bf0b:	48 83 fa 04          	cmp    rdx,0x4
   2bf0f:	75 de                	jne    2beef <JS_CallInternal+0x944f>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:53
   2bf11:	83 f8 03             	cmp    eax,0x3
   2bf14:	76 11                	jbe    2bf27 <JS_CallInternal+0x9487>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:57
   2bf16:	41 0f b6 46 35       	movzx  eax,BYTE PTR [r14+0x35]
   2bf1b:	89 c2                	mov    edx,eax
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:58
   2bf1d:	83 c2 01             	add    edx,0x1
   2bf20:	83 e2 03             	and    edx,0x3
   2bf23:	41 88 56 35          	mov    BYTE PTR [r14+0x35],dl
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:62
   2bf27:	89 c2                	mov    edx,eax
js_dup_shape():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:5305 (discriminator 1)
   2bf29:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:62
   2bf2e:	49 8b 34 d6          	mov    rsi,QWORD PTR [r14+rdx*8]
js_free_shape_null():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:5338
   2bf32:	48 85 f6             	test   rsi,rsi
   2bf35:	74 54                	je     2bf8b <JS_CallInternal+0x94eb>
   2bf37:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:5339
   2bf3d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bf44:	48 89 95 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rdx
   2bf4b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bf4f:	4c 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],r8
   2bf56:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   2bf5d:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2bf64:	e8 47 23 ff ff       	call   1e2b0 <js_free_shape>
   2bf69:	48 8b 95 e0 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x220]
   2bf70:	4c 8b 85 10 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1f0]
   2bf77:	48 8b 8d 28 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d8]
   2bf7e:	8b 85 38 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c8]
   2bf84:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:63
   2bf8b:	4d 89 2c d6          	mov    QWORD PTR [r14+rdx*8],r13
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:64
   2bf8f:	45 89 44 96 20       	mov    DWORD PTR [r14+rdx*4+0x20],r8d
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:65
   2bf94:	41 88 46 34          	mov    BYTE PTR [r14+0x34],al
   2bf98:	e9 1f 81 ff ff       	jmp    240bc <JS_CallInternal+0x161c>
   2bf9d:	0f 1f 00             	nop    DWORD PTR [rax]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20546
   2bfa0:	0f 85 00 76 ff ff    	jne    235a6 <JS_CallInternal+0xb06>
is_strict_mode():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:2873
   2bfa6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bfad:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2bfb1:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:2874
   2bfb8:	48 85 c0             	test   rax,rax
   2bfbb:	0f 84 43 03 00 00    	je     2c304 <JS_CallInternal+0x9864>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:2874 (discriminator 1)
   2bfc1:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2bfc5:	0f 84 39 03 00 00    	je     2c304 <JS_CallInternal+0x9864>

... disjoint excerpt ...

   2c191:	f2 0f 10 05 37 72 0a 	movsd  xmm0,QWORD PTR [rip+0xa7237]        # d33d0 <__PRETTY_FUNCTION__.0+0xc0>
   2c198:	00 
   2c199:	e9 ed d3 ff ff       	jmp    2958b <JS_CallInternal+0x6aeb>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 17)
   2c19e:	8b 52 10             	mov    edx,DWORD PTR [rdx+0x10]
   2c1a1:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2c1a7:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2c1ad:	0f 85 1e 7e ff ff    	jne    23fd1 <JS_CallInternal+0x1531>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 19)
   2c1b3:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2c1b8:	0f 84 13 7e ff ff    	je     23fd1 <JS_CallInternal+0x1531>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 21)
   2c1be:	48 c1 f8 04          	sar    rax,0x4
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:42
   2c1c2:	41 ba 04 00 00 00    	mov    r10d,0x4
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_opcodes.inc:70 (discriminator 21)
   2c1c8:	49 89 c1             	mov    r9,rax
   2c1cb:	31 c0                	xor    eax,eax
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:45
   2c1cd:	49 8b 14 c6          	mov    rdx,QWORD PTR [r14+rax*8]
   2c1d1:	4c 39 ea             	cmp    rdx,r13
   2c1d4:	0f 84 90 09 00 00    	je     2cb6a <JS_CallInternal+0xa0ca>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:50 (discriminator 1)
   2c1da:	48 85 d2             	test   rdx,rdx
   2c1dd:	75 08                	jne    2c1e7 <JS_CallInternal+0x9747>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:51
   2c1df:	41 83 fa 04          	cmp    r10d,0x4
   2c1e3:	44 0f 44 d0          	cmove  r10d,eax
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:43 (discriminator 1)
   2c1e7:	48 83 c0 01          	add    rax,0x1
   2c1eb:	48 83 f8 04          	cmp    rax,0x4
   2c1ef:	75 dc                	jne    2c1cd <JS_CallInternal+0x972d>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:53
   2c1f1:	41 83 fa 03          	cmp    r10d,0x3
   2c1f5:	76 12                	jbe    2c209 <JS_CallInternal+0x9769>
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:57
   2c1f7:	45 0f b6 56 35       	movzx  r10d,BYTE PTR [r14+0x35]
   2c1fc:	44 89 d0             	mov    eax,r10d
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:58
   2c1ff:	83 c0 01             	add    eax,0x1
   2c202:	83 e0 03             	and    eax,0x3
   2c205:	41 88 46 35          	mov    BYTE PTR [r14+0x35],al
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:62
   2c209:	44 89 d0             	mov    eax,r10d
js_dup_shape():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:5305 (discriminator 1)
   2c20c:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:62
   2c211:	49 8b 34 c6          	mov    rsi,QWORD PTR [r14+rax*8]
js_free_shape_null():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:5338
   2c215:	48 85 f6             	test   rsi,rsi
   2c218:	74 56                	je     2c270 <JS_CallInternal+0x97d0>
   2c21a:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:5339
   2c221:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c228:	4c 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r9
   2c22f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c233:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2c23a:	44 89 95 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r10d
   2c241:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2c248:	e8 63 20 ff ff       	call   1e2b0 <js_free_shape>
   2c24d:	48 8b 85 10 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1f0]
   2c254:	4c 8b 8d 28 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1d8]
   2c25b:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   2c262:	44 8b 95 40 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c0]
   2c269:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:63
   2c270:	4d 89 2c c6          	mov    QWORD PTR [r14+rax*8],r13
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:64
   2c274:	45 89 4c 86 20       	mov    DWORD PTR [r14+rax*4+0x20],r9d
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:65
   2c279:	45 88 56 34          	mov    BYTE PTR [r14+0x34],r10b
   2c27d:	e9 4f 7d ff ff       	jmp    23fd1 <JS_CallInternal+0x1531>
   2c282:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
JS_AtomGetStr():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:3601
   2c288:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c28f:	48 8d 45 80          	lea    rax,[rbp-0x80]
   2c293:	89 f2                	mov    edx,esi
   2c295:	48 89 c6             	mov    rsi,rax
   2c298:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c29c:	e8 6f b0 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c2a1:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:3601
   2c2a4:	e9 0f 82 ff ff       	jmp    244b8 <JS_CallInternal+0x1a18>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19738

... disjoint excerpt ...

/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20421 (discriminator 1)
   2cb65:	e9 53 d6 ff ff       	jmp    2a1bd <JS_CallInternal+0x771d>
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:46
   2cb6a:	89 c2                	mov    edx,eax
   2cb6c:	45 89 4c 96 20       	mov    DWORD PTR [r14+rdx*4+0x20],r9d
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:47
   2cb71:	41 88 46 34          	mov    BYTE PTR [r14+0x34],al
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:48
   2cb75:	e9 57 74 ff ff       	jmp    23fd1 <JS_CallInternal+0x1531>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18493
   2cb7a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cb81:	89 ce                	mov    esi,ecx
   2cb83:	e8 78 63 00 00       	call   32f00 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:18494
   2cb88:	e9 61 d7 ff ff       	jmp    2a2ee <JS_CallInternal+0x784e>
JS_FreeAtom():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:3735 (discriminator 1)
   2cb8d:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2cb94:	0f 8e a6 66 ff ff    	jle    23240 <JS_CallInternal+0x7a0>
   2cb9a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cba1:	44 89 ee             	mov    esi,r13d
   2cba4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2cba8:	e8 c3 c8 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2cbad:	e9 8e 66 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>

... disjoint excerpt ...

   2cce6:	31 c0                	xor    eax,eax
   2cce8:	e9 a6 ac ff ff       	jmp    27993 <JS_CallInternal+0x4ef3>
rdi_update():
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:46
   2cced:	89 d0                	mov    eax,edx
   2ccef:	45 89 44 86 20       	mov    DWORD PTR [r14+rax*4+0x20],r8d
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:47
   2ccf4:	41 88 56 34          	mov    BYTE PTR [r14+0x34],dl
/home/mzyx/read_ic_mic_attempt01/P/read_ic_runtime.inc:48
   2ccf8:	e9 bf 73 ff ff       	jmp    240bc <JS_CallInternal+0x161c>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:20102
   2ccfd:	4d 89 f4             	mov    r12,r14
   2cd00:	e9 3b 65 ff ff       	jmp    23240 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19793
   2cd05:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2cd09:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cd10:	4c 89 c2             	mov    rdx,r8
   2cd13:	4c 89 f1             	mov    rcx,r14
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19792
   2cd16:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19793
   2cd1d:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2cd24:	e8 07 81 fe ff       	call   14e30 <JS_ConcatStringInPlace>
/home/mzyx/read_ic_mic_attempt01/P/quickjs.c:19793 (discriminator 1)
   2cd29:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
