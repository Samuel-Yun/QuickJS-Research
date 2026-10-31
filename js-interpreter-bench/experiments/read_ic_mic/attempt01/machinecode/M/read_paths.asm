
... disjoint excerpt ...

   23f24:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23f28:	ff e0                	jmp    rax
   23f2a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23f2e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   23f32:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   23f39:	4d 8d 5c 24 04       	lea    r11,[r12+0x4]
   23f3e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   23f42:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23f46:	48 c1 e0 04          	shl    rax,0x4
   23f4a:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   23f4e:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 2)
   23f51:	41 83 fa ff          	cmp    r10d,0xffffffff
   23f55:	0f 85 5e 72 00 00    	jne    2b1b9 <JS_CallInternal+0x86f9>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23f5b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 3)
   23f5e:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23f62:	25 08 00 ff ff       	and    eax,0xffff0008
   23f67:	3d 00 00 01 00       	cmp    eax,0x10000
   23f6c:	0f 84 90 5f 00 00    	je     29f02 <JS_CallInternal+0x7442>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 6)
   23f72:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 8)
   23f76:	48 89 f7             	mov    rdi,rsi
   23f79:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6152
   23f80:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   23f84:	89 ca                	mov    edx,ecx
   23f86:	21 c2                	and    edx,eax
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6153
   23f88:	41 8b 54 95 38       	mov    edx,DWORD PTR [r13+rdx*4+0x38]
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6155
   23f8d:	48 85 d2             	test   rdx,rdx
   23f90:	0f 84 46 4e 00 00    	je     28ddc <JS_CallInternal+0x631c>
   23f96:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   23f9d:	00 
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6156
   23f9e:	49 8d 04 d0          	lea    rax,[r8+rdx*8]
   23fa2:	4c 01 e8             	add    rax,r13

... disjoint excerpt ...

   23fa5:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   23fa8:	0f 85 20 4e 00 00    	jne    28dce <JS_CallInternal+0x630e>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23fae:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   23fb2:	0f 87 0b 54 00 00    	ja     293c3 <JS_CallInternal+0x6903>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6158
   23fb8:	48 c1 e2 04          	shl    rdx,0x4
   23fbc:	48 8d 42 f0          	lea    rax,[rdx-0x10]
   23fc0:	48 8b 57 20          	mov    rdx,QWORD PTR [rdi+0x20]
   23fc4:	48 01 c2             	add    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 14)
   23fc7:	4c 8b 02             	mov    r8,QWORD PTR [rdx]
   23fca:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:709
   23fce:	83 fa f6             	cmp    edx,0xfffffff6
   23fd1:	76 05                	jbe    23fd8 <JS_CallInternal+0x1518>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:711
   23fd3:	41 83 40 fc 01       	add    DWORD PTR [r8-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23fd8:	48 39 fe             	cmp    rsi,rdi
   23fdb:	0f 84 2e 7e 00 00    	je     2be0f <JS_CallInternal+0x934f>
   23fe1:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 30)
   23fe4:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:71
   23fe7:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 30)
   23feb:	48 83 c3 10          	add    rbx,0x10
   23fef:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:71
   23ff3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23ff9:	49 89 c5             	mov    r13,rax
   23ffc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24000:	ff e0                	jmp    rax
   24002:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   24006:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2400a:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   24011:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24015:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24019:	48 c1 e0 04          	shl    rax,0x4
   2401d:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   24021:	49 89 c6             	mov    r14,rax
   24024:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24029:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 2)
   24030:	41 83 fa ff          	cmp    r10d,0xffffffff
   24034:	0f 85 a0 6d 00 00    	jne    2adda <JS_CallInternal+0x831a>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   2403a:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 3)
   2403d:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   24041:	25 08 00 ff ff       	and    eax,0xffff0008
   24046:	3d 00 00 01 00       	cmp    eax,0x10000
   2404b:	0f 84 8f 5c 00 00    	je     29ce0 <JS_CallInternal+0x7220>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 6)
   24051:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 8)
   24055:	48 89 f2             	mov    rdx,rsi
   24058:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2405f:	00 
find_own_property():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6152
   24060:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24064:	89 cf                	mov    edi,ecx
   24066:	21 c7                	and    edi,eax
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6153
   24068:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6155
   2406d:	48 85 ff             	test   rdi,rdi
   24070:	0f 84 38 4d 00 00    	je     28dae <JS_CallInternal+0x62ee>
   24076:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2407d:	00 
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6156
   2407e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]

... disjoint excerpt ...

   24085:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24088:	0f 85 12 4d 00 00    	jne    28da0 <JS_CallInternal+0x62e0>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   2408e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24092:	0f 87 c2 52 00 00    	ja     2935a <JS_CallInternal+0x689a>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6158
   24098:	48 89 f9             	mov    rcx,rdi
   2409b:	48 8b 7a 20          	mov    rdi,QWORD PTR [rdx+0x20]
   2409f:	48 c1 e1 04          	shl    rcx,0x4
   240a3:	48 83 e9 10          	sub    rcx,0x10
   240a7:	48 01 cf             	add    rdi,rcx
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 14)
   240aa:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
   240ae:	48 8b 07             	mov    rax,QWORD PTR [rdi]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:709
   240b1:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   240b5:	76 04                	jbe    240bb <JS_CallInternal+0x15fb>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:711
   240b7:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18045
   240bb:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   240bf:	48 39 f2             	cmp    rdx,rsi
   240c2:	0f 84 56 7c 00 00    	je     2bd1e <JS_CallInternal+0x925e>
   240c8:	49 89 c5             	mov    r13,rax
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 31)
   240cb:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
   240cf:	49 8b 33             	mov    rsi,QWORD PTR [r11]
JS_FreeValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:689
   240d2:	83 fa f6             	cmp    edx,0xfffffff6
   240d5:	76 11                	jbe    240e8 <JS_CallInternal+0x1628>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:691
   240d7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   240da:	83 e8 01             	sub    eax,0x1
   240dd:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   240e0:	85 c0                	test   eax,eax
   240e2:	0f 8e 73 6b 00 00    	jle    2ac5b <JS_CallInternal+0x819b>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   240e8:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:68
   240ec:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   240f0:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:68
   240f4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   240fa:	49 89 c5             	mov    r13,rax
   240fd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24101:	ff e0                	jmp    rax
   24103:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18449
   24107:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2410b:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   2410f:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24113:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24117:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   2411b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   24122:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   24126:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2412d:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
JS_NewRegexp():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:47686 (discriminator 1)

... disjoint excerpt ...

   28da2:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28da8:	0f 85 d0 b2 ff ff    	jne    2407e <JS_CallInternal+0x15be>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   28dae:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28db2:	0f 85 98 05 00 00    	jne    29350 <JS_CallInternal+0x6890>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 24)
   28db8:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dbc:	48 85 d2             	test   rdx,rdx
   28dbf:	0f 84 3d 16 00 00    	je     2a402 <JS_CallInternal+0x7942>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6151
   28dc5:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28dc9:	e9 92 b2 ff ff       	jmp    24060 <JS_CallInternal+0x15a0>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6162
   28dce:	8b 10                	mov    edx,DWORD PTR [rax]
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6155
   28dd0:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   28dd6:	0f 85 c2 b1 ff ff    	jne    23f9e <JS_CallInternal+0x14de>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   28ddc:	f6 47 10 08          	test   BYTE PTR [rdi+0x10],0x8
   28de0:	0f 85 d3 05 00 00    	jne    293b9 <JS_CallInternal+0x68f9>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 24)
   28de6:	49 8b 7d 30          	mov    rdi,QWORD PTR [r13+0x30]
   28dea:	48 85 ff             	test   rdi,rdi
   28ded:	0f 84 c2 15 00 00    	je     2a3b5 <JS_CallInternal+0x78f5>
find_own_property():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6151
   28df3:	4c 8b 6f 18          	mov    r13,QWORD PTR [rdi+0x18]
   28df7:	e9 84 b1 ff ff       	jmp    23f80 <JS_CallInternal+0x14c0>
min_int():
/home/mzyx/read_ic_mic_attempt01/M/cutils.h:90
   28dfc:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28e02:	39 f7                	cmp    edi,esi
   28e04:	41 89 f5             	mov    r13d,esi
   28e07:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:17871 (discriminator 1)
   28e0b:	45 85 ed             	test   r13d,r13d
   28e0e:	0f 8e 2c 14 00 00    	jle    2a240 <JS_CallInternal+0x7780>

... disjoint excerpt ...

/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:19187 (discriminator 1)
   29348:	4d 89 f4             	mov    r12,r14
   2934b:	e9 10 9f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 23)
   29350:	48 89 d6             	mov    rsi,rdx
   29353:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 15)
   2935a:	48 83 ec 08          	sub    rsp,0x8
   2935e:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
   29362:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29366:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2936a:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   29371:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29378:	4c 89 9d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r11
   2937f:	4c 89 d2             	mov    rdx,r10
   29382:	48 89 78 30          	mov    QWORD PTR [rax+0x30],rdi
   29386:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2938d:	6a 00                	push   0x0
   2938f:	e8 1c 3a 00 00       	call   2cdb0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 3)
   29394:	5f                   	pop    rdi
   29395:	4c 8b 9d 40 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c0]
   2939c:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 15)
   2939f:	49 89 c5             	mov    r13,rax
   293a2:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 3)
   293a5:	41 59                	pop    r9
   293a7:	0f 85 1e ad ff ff    	jne    240cb <JS_CallInternal+0x160b>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   293ad:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   293b4:	e9 a7 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 23)
   293b9:	48 89 fe             	mov    rsi,rdi
   293bc:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 15)
   293c3:	48 83 ec 08          	sub    rsp,0x8
   293c7:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   293cb:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   293cf:	4c 89 d2             	mov    rdx,r10
   293d2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   293d9:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   293e0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293e7:	4c 89 58 30          	mov    QWORD PTR [rax+0x30],r11
   293eb:	6a 00                	push   0x0
   293ed:	e8 be 39 00 00       	call   2cdb0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 3)
   293f2:	59                   	pop    rcx
   293f3:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   293fa:	83 fa 06             	cmp    edx,0x6
   293fd:	5e                   	pop    rsi
   293fe:	0f 85 e0 ab ff ff    	jne    23fe4 <JS_CallInternal+0x1524>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   29404:	4d 89 dc             	mov    r12,r11
   29407:	e9 54 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18215 (discriminator 1)
   2940c:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   29413:	e9 48 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:20112
   29418:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   2941f:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:709
   29423:	83 fa f6             	cmp    edx,0xfffffff6
   29426:	76 04                	jbe    2942c <JS_CallInternal+0x696c>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:711
   29428:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:20116
   2942c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]

... disjoint excerpt ...

   29cd6:	e8 f5 4d ff ff       	call   1ead0 <JS_ToBoolFree>
   29cdb:	e9 df df ff ff       	jmp    27cbf <JS_CallInternal+0x51ff>
rdi_probe():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:9
   29ce0:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29ce3:	0f 85 68 a3 ff ff    	jne    24051 <JS_CallInternal+0x1591>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:10
   29ce9:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   29ced:	83 f8 ff             	cmp    eax,0xffffffff
   29cf0:	0f 84 5b a3 ff ff    	je     24051 <JS_CallInternal+0x1591>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 5)
   29cf6:	48 c1 e0 04          	shl    rax,0x4
   29cfa:	48 03 46 20          	add    rax,QWORD PTR [rsi+0x20]
   29cfe:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29d02:	4c 8b 28             	mov    r13,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:709
   29d05:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29d09:	76 05                	jbe    29d10 <JS_CallInternal+0x7250>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:711
   29d0b:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18045
   29d10:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67
   29d14:	e9 b2 a3 ff ff       	jmp    240cb <JS_CallInternal+0x160b>
   29d19:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29d20:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:3436
   29d24:	89 c8                	mov    eax,ecx
   29d26:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29d2d:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:3437 (discriminator 1)
   29d31:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29d34:	83 e8 01             	sub    eax,0x1
   29d37:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29d3a:	85 c0                	test   eax,eax
   29d3c:	0f 8f 1e d1 ff ff    	jg     26e60 <JS_CallInternal+0x43a0>
   29d42:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:3439
   29d49:	e8 b2 b6 fe ff       	call   15400 <JS_FreeAtomStruct>

... disjoint excerpt ...

   29efa:	0f b6 c0             	movzx  eax,al
   29efd:	e9 c2 b0 ff ff       	jmp    24fc4 <JS_CallInternal+0x2504>
rdi_probe():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:9
   29f02:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29f05:	0f 85 67 a0 ff ff    	jne    23f72 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:10
   29f0b:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   29f0f:	83 f8 ff             	cmp    eax,0xffffffff
   29f12:	0f 84 5a a0 ff ff    	je     23f72 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 5)
   29f18:	89 c2                	mov    edx,eax
   29f1a:	48 c1 e2 04          	shl    rdx,0x4
   29f1e:	48 03 56 20          	add    rdx,QWORD PTR [rsi+0x20]
   29f22:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   29f25:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:709
   29f29:	83 fa f6             	cmp    edx,0xfffffff6
   29f2c:	0f 86 b2 a0 ff ff    	jbe    23fe4 <JS_CallInternal+0x1524>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:711
   29f32:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70
   29f36:	e9 a9 a0 ff ff       	jmp    23fe4 <JS_CallInternal+0x1524>
   29f3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   29f40:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29f47:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:3436
   29f4b:	89 c8                	mov    eax,ecx
   29f4d:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29f54:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:3437 (discriminator 1)
   29f58:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29f5b:	83 e8 01             	sub    eax,0x1
   29f5e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29f61:	85 c0                	test   eax,eax
   29f63:	0f 8f 01 b1 ff ff    	jg     2506a <JS_CallInternal+0x25aa>
   29f69:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:3439

... disjoint excerpt ...

   2a3a9:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a3af:	51                   	push   rcx
   2a3b0:	e9 0a f4 ff ff       	jmp    297bf <JS_CallInternal+0x6cff>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 25)
   2a3b5:	ba 03 00 00 00       	mov    edx,0x3
   2a3ba:	31 c0                	xor    eax,eax
   2a3bc:	e9 23 9c ff ff       	jmp    23fe4 <JS_CallInternal+0x1524>
async_func_free():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:21032 (discriminator 1)
   2a3c1:	48 89 c6             	mov    rsi,rax
   2a3c4:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   2a3c7:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2a3cd:	83 e8 01             	sub    eax,0x1
   2a3d0:	89 46 ac             	mov    DWORD PTR [rsi-0x54],eax
   2a3d3:	0f 85 33 d8 ff ff    	jne    27c0c <JS_CallInternal+0x514c>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:21033
   2a3d9:	80 bf a0 04 00 00 02 	cmp    BYTE PTR [rdi+0x4a0],0x2
   2a3e0:	0f 84 26 d8 ff ff    	je     27c0c <JS_CallInternal+0x514c>
close_var_ref():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:17545
   2a3e6:	48 83 ee 50          	sub    rsi,0x50

... disjoint excerpt ...

JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18045
   2a402:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 25)
   2a406:	41 b8 03 00 00 00    	mov    r8d,0x3
   2a40c:	45 31 ed             	xor    r13d,r13d
   2a40f:	e9 b7 9c ff ff       	jmp    240cb <JS_CallInternal+0x160b>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18380
   2a414:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18363
   2a41b:	0f b6 d0             	movzx  edx,al
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18380
   2a41e:	31 c0                	xor    eax,eax
   2a420:	48 8d 35 e5 30 0a 00 	lea    rsi,[rip+0xa30e5]        # cd50c <_IO_stdin_used+0x50c>
   2a427:	e8 d4 8b 00 00       	call   33000 <JS_ThrowInternalError>
   2a42c:	e9 2f 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:19085
   2a431:	4d 89 ec             	mov    r12,r13
   2a434:	e9 27 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6516

... disjoint excerpt ...

/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:18450
   2add2:	4c 89 f3             	mov    rbx,r14
   2add5:	e9 86 84 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 6)
   2adda:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   2adde:	e9 77 e5 ff ff       	jmp    2935a <JS_CallInternal+0x689a>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:7862
   2ade3:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:7851 (discriminator 1)
   2adea:	48 8d 15 a9 26 0a 00 	lea    rdx,[rip+0xa26a9]        # cd49a <_IO_stdin_used+0x49a>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:7862
   2adf1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2adf5:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:7851
   2adf9:	85 c0                	test   eax,eax
   2adfb:	0f 85 32 16 00 00    	jne    2c433 <JS_CallInternal+0x9973>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:7851 (discriminator 2)

... disjoint excerpt ...

   2b1ab:	0f 84 e5 cf ff ff    	je     28196 <JS_CallInternal+0x56d6>
   2b1b1:	4d 89 ec             	mov    r12,r13
   2b1b4:	e9 a7 80 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 6)
   2b1b9:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   2b1bc:	e9 02 e2 ff ff       	jmp    293c3 <JS_CallInternal+0x6903>
__JS_FreeValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6516
   2b1c1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b1c8:	4c 89 ee             	mov    rsi,r13
   2b1cb:	4c 89 f2             	mov    rdx,r14
   2b1ce:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2b1d5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b1d9:	e8 c2 16 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b1de:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2b1e5:	e9 c9 9e ff ff       	jmp    250b3 <JS_CallInternal+0x25f3>
   2b1ea:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b1f1:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b1f8:	48 89 ce             	mov    rsi,rcx
   2b1fb:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b202:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]

... disjoint excerpt ...

   2bd14:	e8 27 71 00 00       	call   32e40 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:20568
   2bd19:	e9 a8 78 ff ff       	jmp    235c6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 17)
   2bd1e:	8b 52 10             	mov    edx,DWORD PTR [rdx+0x10]
   2bd21:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2bd27:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2bd2d:	0f 85 95 83 ff ff    	jne    240c8 <JS_CallInternal+0x1608>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 19)
   2bd33:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2bd38:	0f 84 8a 83 ff ff    	je     240c8 <JS_CallInternal+0x1608>
rdi_update():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:32
   2bd3e:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:67 (discriminator 21)
   2bd41:	48 c1 f9 04          	sar    rcx,0x4
rdi_update():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:32
   2bd45:	4c 39 ee             	cmp    rsi,r13
   2bd48:	74 55                	je     2bd9f <JS_CallInternal+0x92df>
js_dup_shape():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:5305 (discriminator 1)
   2bd4a:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:5338
   2bd4f:	48 85 f6             	test   rsi,rsi
   2bd52:	74 48                	je     2bd9c <JS_CallInternal+0x92dc>
   2bd54:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:5339
   2bd5b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd62:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   2bd69:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd6d:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
   2bd74:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2bd7b:	e8 30 25 ff ff       	call   1e2b0 <js_free_shape>

... disjoint excerpt ...

   2bd8e:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2bd95:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:39
   2bd9c:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:40
   2bd9f:	41 89 4e 08          	mov    DWORD PTR [r14+0x8],ecx
   2bda3:	e9 20 83 ff ff       	jmp    240c8 <JS_CallInternal+0x1608>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:19977
   2bda8:	f2 0f 10 05 b0 ec 0a 	movsd  xmm0,QWORD PTR [rip+0xaecb0]        # daa60 <typed_array_size_log2+0x28>
   2bdaf:	00 
   2bdb0:	e9 eb d7 ff ff       	jmp    295a0 <JS_CallInternal+0x6ae0>
__JS_FreeValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:6516
   2bdb5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bdbc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bdc0:	e8 db 0a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bdc5:	e9 fe 78 ff ff       	jmp    236c8 <JS_CallInternal+0xc08>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:20564
   2bdca:	0f 85 f6 77 ff ff    	jne    235c6 <JS_CallInternal+0xb06>
is_strict_mode():

... disjoint excerpt ...

   2be05:	e8 96 0a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2be0a:	e9 ab 77 ff ff       	jmp    235ba <JS_CallInternal+0xafa>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 17)
   2be0f:	8b 4e 10             	mov    ecx,DWORD PTR [rsi+0x10]
   2be12:	81 e1 08 00 ff ff    	and    ecx,0xffff0008
   2be18:	81 f9 00 00 01 00    	cmp    ecx,0x10000
   2be1e:	0f 85 bd 81 ff ff    	jne    23fe1 <JS_CallInternal+0x1521>
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 19)
   2be24:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2be29:	0f 84 b2 81 ff ff    	je     23fe1 <JS_CallInternal+0x1521>
rdi_update():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:32
   2be2f:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_opcodes.inc:70 (discriminator 21)
   2be32:	48 c1 f8 04          	sar    rax,0x4
rdi_update():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:32
   2be36:	4c 39 ee             	cmp    rsi,r13
   2be39:	74 47                	je     2be82 <JS_CallInternal+0x93c2>
js_dup_shape():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:5305 (discriminator 1)
   2be3b:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:5338
   2be40:	48 85 f6             	test   rsi,rsi
   2be43:	74 3a                	je     2be7f <JS_CallInternal+0x93bf>
   2be45:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:5339
   2be4c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2be53:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2be5a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2be5e:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2be65:	e8 46 24 ff ff       	call   1e2b0 <js_free_shape>
   2be6a:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2be71:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2be78:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:39
   2be7f:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_mic_attempt01/M/read_ic_runtime.inc:40
   2be82:	41 89 46 08          	mov    DWORD PTR [r14+0x8],eax
   2be86:	e9 56 81 ff ff       	jmp    23fe1 <JS_CallInternal+0x1521>
JS_CallInternal():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:19981
   2be8b:	f2 0f 10 05 3d 75 0a 	movsd  xmm0,QWORD PTR [rip+0xa753d]        # d33d0 <__PRETTY_FUNCTION__.0+0xc0>
   2be92:	00 
   2be93:	e9 08 d7 ff ff       	jmp    295a0 <JS_CallInternal+0x6ae0>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:19411
   2be98:	4d 89 f4             	mov    r12,r14
   2be9b:	e9 c0 73 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_mic_attempt01/M/quickjs.c:19633
   2bea0:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bea7:	48 8b 91 88 01 00 00 	mov    rdx,QWORD PTR [rcx+0x188]
   2beae:	48 8b 81 80 01 00 00 	mov    rax,QWORD PTR [rcx+0x180]
JS_DupValue():
/home/mzyx/read_ic_mic_attempt01/M/quickjs.h:709
   2beb5:	83 fa f6             	cmp    edx,0xfffffff6
