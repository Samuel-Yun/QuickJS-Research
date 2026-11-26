
... non-contiguous window ...

   23f34:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23f38:	ff e0                	jmp    rax
   23f3a:	f3 0f 1e fa          	endbr64
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   23f3e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   23f42:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   23f49:	4d 8d 5c 24 04       	lea    r11,[r12+0x4]
   23f4e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   23f52:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23f56:	48 c1 e0 04          	shl    rax,0x4
   23f5a:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   23f5e:	49 89 c6             	mov    r14,rax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 2)
   23f61:	41 83 fa ff          	cmp    r10d,0xffffffff
   23f65:	0f 85 bb 75 00 00    	jne    2b526 <JS_CallInternal+0x8a56>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   23f6b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 3)
   23f6e:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   23f72:	25 08 00 ff ff       	and    eax,0xffff0008
   23f77:	3d 00 00 01 00       	cmp    eax,0x10000
   23f7c:	0f 84 79 5f 00 00    	je     29efb <JS_CallInternal+0x742b>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 9)
   23f82:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   23f86:	45 31 c9             	xor    r9d,r9d
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 11)
   23f89:	48 89 f2             	mov    rdx,rsi
   23f8c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6154
   23f90:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   23f94:	89 cf                	mov    edi,ecx
   23f96:	21 c7                	and    edi,eax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6156
   23f98:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6158
   23f9d:	48 85 ff             	test   rdi,rdi
   23fa0:	0f 84 36 4e 00 00    	je     28ddc <JS_CallInternal+0x630c>
   23fa6:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   23fad:	00 
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6160
   23fae:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   23fb2:	4c 01 e8             	add    rax,r13

... non-contiguous window ...

   23fb5:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   23fb8:	0f 85 10 4e 00 00    	jne    28dce <JS_CallInternal+0x62fe>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   23fbe:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6162
   23fc2:	4c 8b 42 20          	mov    r8,QWORD PTR [rdx+0x20]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   23fc6:	0f 87 f0 53 00 00    	ja     293bc <JS_CallInternal+0x68ec>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6162
   23fcc:	48 c1 e7 04          	shl    rdi,0x4
   23fd0:	48 8d 47 f0          	lea    rax,[rdi-0x10]
   23fd4:	49 01 c0             	add    r8,rax
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 17)
   23fd7:	49 8b 48 08          	mov    rcx,QWORD PTR [r8+0x8]
   23fdb:	4d 8b 10             	mov    r10,QWORD PTR [r8]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:709
   23fde:	83 f9 f6             	cmp    ecx,0xfffffff6
   23fe1:	76 05                	jbe    23fe8 <JS_CallInternal+0x1518>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:711
   23fe3:	41 83 42 fc 01       	add    DWORD PTR [r10-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   23fe8:	48 39 f2             	cmp    rdx,rsi
   23feb:	0f 84 48 80 00 00    	je     2c039 <JS_CallInternal+0x9569>
   23ff1:	4c 89 d0             	mov    rax,r10
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 35)
   23ff4:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:82
   23ff7:	49 83 c4 05          	add    r12,0x5
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 35)
   23ffb:	48 83 c3 10          	add    rbx,0x10
   23fff:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:82
   24003:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24009:	49 89 c5             	mov    r13,rax
   2400c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24010:	ff e0                	jmp    rax
   24012:	f3 0f 1e fa          	endbr64
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   24016:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2401a:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   24021:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24025:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24029:	48 c1 e0 04          	shl    rax,0x4
   2402d:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   24031:	49 89 c6             	mov    r14,rax
   24034:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24039:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 2)
   24040:	41 83 fa ff          	cmp    r10d,0xffffffff
   24044:	0f 85 a9 74 00 00    	jne    2b4f3 <JS_CallInternal+0x8a23>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   2404a:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 3)
   2404d:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   24051:	25 08 00 ff ff       	and    eax,0xffff0008
   24056:	3d 00 00 01 00       	cmp    eax,0x10000
   2405b:	0f 84 6f 5c 00 00    	je     29cd0 <JS_CallInternal+0x7200>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 9)
   24061:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   24065:	45 31 c9             	xor    r9d,r9d
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 11)
   24068:	48 89 f2             	mov    rdx,rsi
   2406b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6154
   24070:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24074:	89 cf                	mov    edi,ecx
   24076:	21 c7                	and    edi,eax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6156
   24078:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6158
   2407d:	48 85 ff             	test   rdi,rdi
   24080:	0f 84 28 4d 00 00    	je     28dae <JS_CallInternal+0x62de>
   24086:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2408d:	00 
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6160
   2408e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24092:	4c 01 e8             	add    rax,r13

... non-contiguous window ...

   24095:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24098:	0f 85 02 4d 00 00    	jne    28da0 <JS_CallInternal+0x62d0>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   2409e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6162
   240a2:	4c 8b 42 20          	mov    r8,QWORD PTR [rdx+0x20]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   240a6:	0f 87 a6 52 00 00    	ja     29352 <JS_CallInternal+0x6882>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6162
   240ac:	48 c1 e7 04          	shl    rdi,0x4
   240b0:	48 8d 4f f0          	lea    rcx,[rdi-0x10]
   240b4:	49 01 c8             	add    r8,rcx
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 17)
   240b7:	49 8b 00             	mov    rax,QWORD PTR [r8]
   240ba:	4d 8b 40 08          	mov    r8,QWORD PTR [r8+0x8]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:709
   240be:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   240c2:	76 04                	jbe    240c8 <JS_CallInternal+0x15f8>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:711
   240c4:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18049
   240c8:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   240cc:	48 39 d6             	cmp    rsi,rdx
   240cf:	0f 84 dd 7d 00 00    	je     2beb2 <JS_CallInternal+0x93e2>
   240d5:	49 89 c5             	mov    r13,rax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 36)
   240d8:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
   240dc:	49 8b 33             	mov    rsi,QWORD PTR [r11]
JS_FreeValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:689
   240df:	83 fa f6             	cmp    edx,0xfffffff6
   240e2:	76 11                	jbe    240f5 <JS_CallInternal+0x1625>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:691
   240e4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   240e7:	83 e8 01             	sub    eax,0x1
   240ea:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   240ed:	85 c0                	test   eax,eax
   240ef:	0f 8e 8c 6a 00 00    	jle    2ab81 <JS_CallInternal+0x80b1>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   240f5:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:79
   240f9:	49 83 c4 05          	add    r12,0x5
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   240fd:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:79
   24101:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24107:	49 89 c5             	mov    r13,rax
   2410a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2410e:	ff e0                	jmp    rax
   24110:	f3 0f 1e fa          	endbr64
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18453
   24114:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   24118:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   2411c:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24120:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24124:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   24128:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2412f:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   24133:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2413a:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
JS_NewRegexp():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:47691 (discriminator 1)

... non-contiguous window ...

   28da2:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28da8:	0f 85 e0 b2 ff ff    	jne    2408e <JS_CallInternal+0x15be>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   28dae:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28db2:	0f 85 90 05 00 00    	jne    29348 <JS_CallInternal+0x6878>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 29)
   28db8:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dbc:	48 85 d2             	test   rdx,rdx
   28dbf:	0f 84 04 16 00 00    	je     2a3c9 <JS_CallInternal+0x78f9>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6153
   28dc5:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28dc9:	e9 a2 b2 ff ff       	jmp    24070 <JS_CallInternal+0x15a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6166
   28dce:	8b 38                	mov    edi,DWORD PTR [rax]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6158
   28dd0:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28dd6:	0f 85 d2 b1 ff ff    	jne    23fae <JS_CallInternal+0x14de>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   28ddc:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28de0:	0f 85 cc 05 00 00    	jne    293b2 <JS_CallInternal+0x68e2>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 29)
   28de6:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dea:	48 85 d2             	test   rdx,rdx
   28ded:	0f 84 ca 15 00 00    	je     2a3bd <JS_CallInternal+0x78ed>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6153
   28df3:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28df7:	e9 94 b1 ff ff       	jmp    23f90 <JS_CallInternal+0x14c0>
min_int():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/cutils.h:90
   28dfc:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28e02:	39 f7                	cmp    edi,esi
   28e04:	41 89 f5             	mov    r13d,esi
   28e07:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:17875 (discriminator 1)
   28e0b:	45 85 ed             	test   r13d,r13d
   28e0e:	0f 8e dd 13 00 00    	jle    2a1f1 <JS_CallInternal+0x7721>

... non-contiguous window ...

/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:19191 (discriminator 1)
   29340:	4d 89 f4             	mov    r12,r14
   29343:	e9 28 9f ff ff       	jmp    23270 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 28)
   29348:	48 89 d6             	mov    rsi,rdx
   2934b:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 18)
   29352:	48 83 ec 08          	sub    rsp,0x8
   29356:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
   2935a:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2935e:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29362:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   29369:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29370:	4c 89 9d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r11
   29377:	4c 89 d2             	mov    rdx,r10
   2937a:	48 89 78 30          	mov    QWORD PTR [rax+0x30],rdi
   2937e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29385:	6a 00                	push   0x0
   29387:	e8 a4 3a 00 00       	call   2ce30 <JS_GetPropertyInternal>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 3)
   2938c:	41 59                	pop    r9
   2938e:	4c 8b 9d 40 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c0]
   29395:	83 fa 06             	cmp    edx,0x6
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 18)
   29398:	49 89 c5             	mov    r13,rax
   2939b:	49 89 d0             	mov    r8,rdx
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 3)
   2939e:	41 5a                	pop    r10
   293a0:	0f 85 32 ad ff ff    	jne    240d8 <JS_CallInternal+0x1608>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   293a6:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   293ad:	e9 be 9e ff ff       	jmp    23270 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 28)
   293b2:	48 89 d6             	mov    rsi,rdx
   293b5:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 18)
   293bc:	48 83 ec 08          	sub    rsp,0x8
   293c0:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   293c4:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   293c8:	4c 89 d2             	mov    rdx,r10
   293cb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   293d2:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   293d9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293e0:	4c 89 58 30          	mov    QWORD PTR [rax+0x30],r11
   293e4:	6a 00                	push   0x0
   293e6:	e8 45 3a 00 00       	call   2ce30 <JS_GetPropertyInternal>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 3)
   293eb:	5e                   	pop    rsi
   293ec:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   293f3:	83 fa 06             	cmp    edx,0x6
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 18)
   293f6:	48 89 d1             	mov    rcx,rdx
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 3)
   293f9:	5f                   	pop    rdi
   293fa:	0f 85 f4 ab ff ff    	jne    23ff4 <JS_CallInternal+0x1524>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   29400:	4d 89 dc             	mov    r12,r11
   29403:	e9 68 9e ff ff       	jmp    23270 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18219 (discriminator 1)
   29408:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2940f:	e9 5c 9e ff ff       	jmp    23270 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:20116
   29414:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   2941b:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:709
   2941f:	83 fa f6             	cmp    edx,0xfffffff6
   29422:	76 04                	jbe    29428 <JS_CallInternal+0x6958>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:711
   29424:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:20120
   29428:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]

... non-contiguous window ...

   29cc6:	e8 15 4e ff ff       	call   1eae0 <JS_ToBoolFree>
   29ccb:	e9 ff df ff ff       	jmp    27ccf <JS_CallInternal+0x51ff>
rdi_probe():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:9
   29cd0:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29cd3:	0f 85 88 a3 ff ff    	jne    24061 <JS_CallInternal+0x1591>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:10
   29cd9:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   29cdd:	83 f8 ff             	cmp    eax,0xffffffff
   29ce0:	0f 84 7b a3 ff ff    	je     24061 <JS_CallInternal+0x1591>
fs_adopt():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/fs_control.h:22
   29ce6:	44 8b 1d 7b d4 0d 00 	mov    r11d,DWORD PTR [rip+0xdd47b]        # 107168 <fs_in_region>
   29ced:	45 85 db             	test   r11d,r11d
   29cf0:	74 0d                	je     29cff <JS_CallInternal+0x722f>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/fs_control.h:22 (discriminator 2)
   29cf2:	4c 39 35 87 d4 0d 00 	cmp    QWORD PTR [rip+0xdd487],r14        # 107180 <fs_target_site>
   29cf9:	0f 84 4b 29 00 00    	je     2c64a <JS_CallInternal+0x9b7a>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 8)
   29cff:	48 c1 e0 04          	shl    rax,0x4
   29d03:	48 03 46 20          	add    rax,QWORD PTR [rsi+0x20]
   29d07:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29d0b:	4c 8b 28             	mov    r13,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:709
   29d0e:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29d12:	76 05                	jbe    29d19 <JS_CallInternal+0x7249>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:711
   29d14:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18049
   29d19:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78
   29d1d:	e9 b6 a3 ff ff       	jmp    240d8 <JS_CallInternal+0x1608>
   29d22:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29d29:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:3437
   29d2d:	89 c8                	mov    eax,ecx
   29d2f:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29d36:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:3438 (discriminator 1)
   29d3a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29d3d:	83 e8 01             	sub    eax,0x1
   29d40:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29d43:	85 c0                	test   eax,eax
   29d45:	0f 8f 25 d1 ff ff    	jg     26e70 <JS_CallInternal+0x43a0>
   29d4b:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:3440
   29d52:	e8 b9 b6 fe ff       	call   15410 <JS_FreeAtomStruct>

... non-contiguous window ...

   29ef3:	0f b6 c0             	movzx  eax,al
   29ef6:	e9 d9 b0 ff ff       	jmp    24fd4 <JS_CallInternal+0x2504>
rdi_probe():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:9
   29efb:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29efe:	0f 85 7e a0 ff ff    	jne    23f82 <JS_CallInternal+0x14b2>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:10
   29f04:	41 8b 56 08          	mov    edx,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   29f08:	83 fa ff             	cmp    edx,0xffffffff
   29f0b:	0f 84 71 a0 ff ff    	je     23f82 <JS_CallInternal+0x14b2>
fs_adopt():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/fs_control.h:22
   29f11:	44 8b 05 50 d2 0d 00 	mov    r8d,DWORD PTR [rip+0xdd250]        # 107168 <fs_in_region>
   29f18:	45 85 c0             	test   r8d,r8d
   29f1b:	74 0d                	je     29f2a <JS_CallInternal+0x745a>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/fs_control.h:22 (discriminator 2)
   29f1d:	4c 3b 35 5c d2 0d 00 	cmp    r14,QWORD PTR [rip+0xdd25c]        # 107180 <fs_target_site>
   29f24:	0f 84 44 2a 00 00    	je     2c96e <JS_CallInternal+0x9e9e>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 8)
   29f2a:	48 c1 e2 04          	shl    rdx,0x4
   29f2e:	48 03 56 20          	add    rdx,QWORD PTR [rsi+0x20]
   29f32:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
   29f36:	48 8b 02             	mov    rax,QWORD PTR [rdx]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:709
   29f39:	83 f9 f6             	cmp    ecx,0xfffffff6
   29f3c:	0f 86 b2 a0 ff ff    	jbe    23ff4 <JS_CallInternal+0x1524>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:711
   29f42:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81
   29f46:	e9 a9 a0 ff ff       	jmp    23ff4 <JS_CallInternal+0x1524>
   29f4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   29f50:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29f57:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:3437
   29f5b:	89 c8                	mov    eax,ecx
   29f5d:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29f64:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:3438 (discriminator 1)
   29f68:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29f6b:	83 e8 01             	sub    eax,0x1
   29f6e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29f71:	85 c0                	test   eax,eax
   29f73:	0f 8f 01 b1 ff ff    	jg     2507a <JS_CallInternal+0x25aa>
   29f79:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:3440

... non-contiguous window ...

   2a3b1:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a3b7:	51                   	push   rcx
   2a3b8:	e9 fa f3 ff ff       	jmp    297b7 <JS_CallInternal+0x6ce7>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 30)
   2a3bd:	b9 03 00 00 00       	mov    ecx,0x3
   2a3c2:	31 c0                	xor    eax,eax
   2a3c4:	e9 2b 9c ff ff       	jmp    23ff4 <JS_CallInternal+0x1524>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18049
   2a3c9:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 30)
   2a3cd:	41 b8 03 00 00 00    	mov    r8d,0x3
   2a3d3:	45 31 ed             	xor    r13d,r13d
   2a3d6:	e9 fd 9c ff ff       	jmp    240d8 <JS_CallInternal+0x1608>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18384
   2a3db:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18367
   2a3e2:	0f b6 d0             	movzx  edx,al
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18384
   2a3e5:	31 c0                	xor    eax,eax
   2a3e7:	48 8d 35 1e 31 0a 00 	lea    rsi,[rip+0xa311e]        # cd50c <_IO_stdin_used+0x50c>
   2a3ee:	e8 2d 8d 00 00       	call   33120 <JS_ThrowInternalError>
   2a3f3:	e9 78 8e ff ff       	jmp    23270 <JS_CallInternal+0x7a0>
async_func_free():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:21036 (discriminator 1)
   2a3f8:	48 89 c6             	mov    rsi,rax
   2a3fb:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   2a3fe:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax

... non-contiguous window ...

JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18715
   2b4ee:	e9 7d 7d ff ff       	jmp    23270 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 9)
   2b4f3:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   2b4f7:	e9 56 de ff ff       	jmp    29352 <JS_CallInternal+0x6882>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:7842
   2b4fc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b503:	48 8d 35 56 20 0a 00 	lea    rsi,[rip+0xa2056]        # cd560 <_IO_stdin_used+0x560>
   2b50a:	31 c0                	xor    eax,eax
   2b50c:	e8 8f 57 00 00       	call   30ca0 <JS_ThrowTypeError>
   2b511:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2b514:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2b518:	48 89 c1             	mov    rcx,rax
JS_IsException():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.h:643
   2b51b:	41 89 d0             	mov    r8d,edx
   2b51e:	48 89 d0             	mov    rax,rdx
JS_GetPrivateField():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:8446
   2b521:	e9 f2 cd ff ff       	jmp    28318 <JS_CallInternal+0x5848>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 9)
   2b526:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   2b529:	e9 8e de ff ff       	jmp    293bc <JS_CallInternal+0x68ec>
js_for_of_next():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:16716 (discriminator 2)
   2b52e:	ba 01 00 00 00       	mov    edx,0x1
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:16713
   2b533:	be 03 00 00 00       	mov    esi,0x3
   2b538:	31 ff                	xor    edi,edi
   2b53a:	e9 5d cf ff ff       	jmp    2849c <JS_CallInternal+0x59cc>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:19033
   2b53f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b546:	48 8d 35 db 58 0a 00 	lea    rsi,[rip+0xa58db]        # d0e28 <_IO_stdin_used+0x3e28>
   2b54d:	31 c0                	xor    eax,eax
   2b54f:	e8 4c 57 00 00       	call   30ca0 <JS_ThrowTypeError>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:19034
   2b554:	e9 17 7d ff ff       	jmp    23270 <JS_CallInternal+0x7a0>

... non-contiguous window ...

   2bea8:	e8 b3 70 00 00       	call   32f60 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:20572
   2bead:	e9 24 77 ff ff       	jmp    235d6 <JS_CallInternal+0xb06>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 20)
   2beb2:	8b 56 10             	mov    edx,DWORD PTR [rsi+0x10]
   2beb5:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2bebb:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2bec1:	0f 85 0e 82 ff ff    	jne    240d5 <JS_CallInternal+0x1605>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 24)
   2bec7:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2becc:	0f 84 03 82 ff ff    	je     240d5 <JS_CallInternal+0x1605>
   2bed2:	45 85 c9             	test   r9d,r9d
   2bed5:	0f 85 fa 81 ff ff    	jne    240d5 <JS_CallInternal+0x1605>
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:33
   2bedb:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 25)
   2bede:	48 c1 f9 04          	sar    rcx,0x4
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:33
   2bee2:	4c 39 ee             	cmp    rsi,r13
   2bee5:	74 55                	je     2bf3c <JS_CallInternal+0x946c>
js_dup_shape():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:5306 (discriminator 1)
   2bee7:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:5339
   2beec:	48 85 f6             	test   rsi,rsi
   2beef:	74 48                	je     2bf39 <JS_CallInternal+0x9469>
   2bef1:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:5340
   2bef8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2beff:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   2bf06:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bf0a:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
   2bf11:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2bf18:	e8 a3 23 ff ff       	call   1e2c0 <js_free_shape>

... non-contiguous window ...

   2bf2b:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2bf32:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:42
   2bf39:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:43
   2bf3c:	41 89 4e 08          	mov    DWORD PTR [r14+0x8],ecx
   2bf40:	e9 90 81 ff ff       	jmp    240d5 <JS_CallInternal+0x1605>
__JS_FreeValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6520
   2bf45:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bf4c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bf50:	e8 5b 09 ff ff       	call   1c8b0 <__JS_FreeValueRT>
   2bf55:	e9 e8 da ff ff       	jmp    29a42 <JS_CallInternal+0x6f72>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:19796
   2bf5a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:19793 (discriminator 1)
   2bf61:	41 83 fe f9          	cmp    r14d,0xfffffff9
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:19796
   2bf65:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:19793 (discriminator 1)
   2bf69:	0f 84 6f 0c 00 00    	je     2cbde <JS_CallInternal+0xa10e>

... non-contiguous window ...

/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:9664 (discriminator 1)
   2c034:	e9 24 f3 ff ff       	jmp    2b35d <JS_CallInternal+0x888d>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 20)
   2c039:	8b 52 10             	mov    edx,DWORD PTR [rdx+0x10]
   2c03c:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2c042:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2c048:	0f 85 a3 7f ff ff    	jne    23ff1 <JS_CallInternal+0x1521>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 24)
   2c04e:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2c053:	0f 84 98 7f ff ff    	je     23ff1 <JS_CallInternal+0x1521>
   2c059:	45 85 c9             	test   r9d,r9d
   2c05c:	0f 85 8f 7f ff ff    	jne    23ff1 <JS_CallInternal+0x1521>
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:33
   2c062:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 25)
   2c065:	48 c1 f8 04          	sar    rax,0x4
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:33
   2c069:	4c 39 ee             	cmp    rsi,r13
   2c06c:	74 47                	je     2c0b5 <JS_CallInternal+0x95e5>
js_dup_shape():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:5306 (discriminator 1)
   2c06e:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:5339
   2c073:	48 85 f6             	test   rsi,rsi
   2c076:	74 3a                	je     2c0b2 <JS_CallInternal+0x95e2>
   2c078:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:5340
   2c07f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c086:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2c08d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c091:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   2c098:	e8 23 22 ff ff       	call   1e2c0 <js_free_shape>
   2c09d:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2c0a4:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2c0ab:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:42
   2c0b2:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_runtime.inc:43
   2c0b5:	41 89 46 08          	mov    DWORD PTR [r14+0x8],eax
   2c0b9:	e9 33 7f ff ff       	jmp    23ff1 <JS_CallInternal+0x1521>
   2c0be:	66 90                	xchg   ax,ax
js_malloc_rt():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:1812
   2c0c0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c0c7:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
js_build_arguments():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:16200
   2c0ce:	48 63 d7             	movsxd rdx,edi
   2c0d1:	48 c1 e2 04          	shl    rdx,0x4
   2c0d5:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
js_malloc_rt():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:1812
   2c0dc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c0e0:	48 89 d6             	mov    rsi,rdx
   2c0e3:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx

... non-contiguous window ...

   2c650:	8d 51 01             	lea    edx,[rcx+0x1]
   2c653:	83 e2 03             	and    edx,0x3
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   2c656:	3b 0d 1c ab 0d 00    	cmp    ecx,DWORD PTR [rip+0xdab1c]        # 107178 <fs_quota>
fs_adopt():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/fs_control.h:24
   2c65c:	89 15 0e ab 0d 00    	mov    DWORD PTR [rip+0xdab0e],edx        # 107170 <fs_phase>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 1)
   2c662:	0f 82 97 d6 ff ff    	jb     29cff <JS_CallInternal+0x722f>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 9)
   2c668:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:78 (discriminator 7)
   2c66c:	41 b9 01 00 00 00    	mov    r9d,0x1
   2c672:	e9 f1 79 ff ff       	jmp    24068 <JS_CallInternal+0x1598>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18302
   2c677:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2c67e:	48 8d 35 bb 46 0a 00 	lea    rsi,[rip+0xa46bb]        # d0d40 <_IO_stdin_used+0x3d40>
   2c685:	31 c0                	xor    eax,eax
   2c687:	e8 14 46 00 00       	call   30ca0 <JS_ThrowTypeError>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18303
   2c68c:	e9 df 6b ff ff       	jmp    23270 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:20368 (discriminator 8)
   2c691:	45 85 c0             	test   r8d,r8d
   2c694:	0f 85 98 00 00 00    	jne    2c732 <JS_CallInternal+0x9c62>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:20368 (discriminator 10)
   2c69a:	66 0f ef c0          	pxor   xmm0,xmm0
   2c69e:	66 49 0f 6e ce       	movq   xmm1,r14
   2c6a3:	31 d2                	xor    edx,edx
   2c6a5:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d

... non-contiguous window ...

   2c974:	8d 41 01             	lea    eax,[rcx+0x1]
   2c977:	83 e0 03             	and    eax,0x3
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   2c97a:	3b 0d f8 a7 0d 00    	cmp    ecx,DWORD PTR [rip+0xda7f8]        # 107178 <fs_quota>
fs_adopt():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/fs_control.h:24
   2c980:	89 05 ea a7 0d 00    	mov    DWORD PTR [rip+0xda7ea],eax        # 107170 <fs_phase>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 1)
   2c986:	0f 82 9e d5 ff ff    	jb     29f2a <JS_CallInternal+0x745a>
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 9)
   2c98c:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/ic_fast_slow_20261102_attempt01/C/read_ic_opcodes.inc:81 (discriminator 7)
   2c990:	41 b9 01 00 00 00    	mov    r9d,0x1
   2c996:	e9 ee 75 ff ff       	jmp    23f89 <JS_CallInternal+0x14b9>
__JS_FreeValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:6520
   2c99b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c9a2:	4c 89 ee             	mov    rsi,r13
   2c9a5:	48 89 da             	mov    rdx,rbx
   2c9a8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c9ac:	e8 ff fe fe ff       	call   1c8b0 <__JS_FreeValueRT>
   2c9b1:	e9 93 e9 ff ff       	jmp    2b349 <JS_CallInternal+0x8879>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/C/quickjs.c:18017
   2c9b6:	31 c0                	xor    eax,eax
   2c9b8:	48 c7 43 08 03 00 00 	mov    QWORD PTR [rbx+0x8],0x3
   2c9bf:	00 
   2c9c0:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c9c3:	e9 c7 89 ff ff       	jmp    2538f <JS_CallInternal+0x28bf>
