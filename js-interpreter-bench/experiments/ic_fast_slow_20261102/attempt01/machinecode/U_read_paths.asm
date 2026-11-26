
... non-contiguous window ...

   23f24:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23f28:	ff e0                	jmp    rax
   23f2a:	f3 0f 1e fa          	endbr64
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   23f2e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   23f32:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   23f39:	4d 8d 5c 24 04       	lea    r11,[r12+0x4]
   23f3e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   23f42:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23f46:	48 c1 e0 04          	shl    rax,0x4
   23f4a:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   23f4e:	49 89 c6             	mov    r14,rax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 2)
   23f51:	41 83 fa ff          	cmp    r10d,0xffffffff
   23f55:	0f 85 3e 72 00 00    	jne    2b199 <JS_CallInternal+0x86d9>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   23f5b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 3)
   23f5e:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   23f62:	25 08 00 ff ff       	and    eax,0xffff0008
   23f67:	3d 00 00 01 00       	cmp    eax,0x10000
   23f6c:	0f 84 7c 5f 00 00    	je     29eee <JS_CallInternal+0x742e>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 6)
   23f72:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 8)
   23f76:	48 89 f2             	mov    rdx,rsi
   23f79:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6152
   23f80:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   23f84:	89 cf                	mov    edi,ecx
   23f86:	21 c7                	and    edi,eax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6153
   23f88:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6155
   23f8d:	48 85 ff             	test   rdi,rdi
   23f90:	0f 84 36 4e 00 00    	je     28dcc <JS_CallInternal+0x630c>
   23f96:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   23f9d:	00 
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6156
   23f9e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   23fa2:	4c 01 e8             	add    rax,r13

... non-contiguous window ...

   23fa5:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   23fa8:	0f 85 10 4e 00 00    	jne    28dbe <JS_CallInternal+0x62fe>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   23fae:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   23fb2:	0f 87 fc 53 00 00    	ja     293b4 <JS_CallInternal+0x68f4>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6158
   23fb8:	48 8b 4a 20          	mov    rcx,QWORD PTR [rdx+0x20]
   23fbc:	48 c1 e7 04          	shl    rdi,0x4
   23fc0:	4c 8d 47 f0          	lea    r8,[rdi-0x10]
   23fc4:	4c 01 c1             	add    rcx,r8
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 14)
   23fc7:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   23fca:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:709
   23fce:	83 f9 f6             	cmp    ecx,0xfffffff6
   23fd1:	76 04                	jbe    23fd7 <JS_CallInternal+0x1517>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:711
   23fd3:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   23fd7:	48 39 d6             	cmp    rsi,rdx
   23fda:	0f 84 27 7e 00 00    	je     2be07 <JS_CallInternal+0x9347>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 30)
   23fe0:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:71
   23fe3:	49 83 c4 05          	add    r12,0x5
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 30)
   23fe7:	48 83 c3 10          	add    rbx,0x10
   23feb:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:71
   23fef:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23ff5:	49 89 c5             	mov    r13,rax
   23ff8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23ffc:	ff e0                	jmp    rax
   23ffe:	f3 0f 1e fa          	endbr64
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   24002:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   24006:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   2400d:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24011:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24015:	48 c1 e0 04          	shl    rax,0x4
   24019:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   2401d:	49 89 c6             	mov    r14,rax
   24020:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24025:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 2)
   2402c:	41 83 fa ff          	cmp    r10d,0xffffffff
   24030:	0f 85 84 6d 00 00    	jne    2adba <JS_CallInternal+0x82fa>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   24036:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 3)
   24039:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   2403d:	25 08 00 ff ff       	and    eax,0xffff0008
   24042:	3d 00 00 01 00       	cmp    eax,0x10000
   24047:	0f 84 83 5c 00 00    	je     29cd0 <JS_CallInternal+0x7210>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 6)
   2404d:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 8)
   24051:	48 89 f2             	mov    rdx,rsi
   24054:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6152
   24058:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   2405c:	89 cf                	mov    edi,ecx
   2405e:	21 c7                	and    edi,eax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6153
   24060:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6155
   24065:	48 85 ff             	test   rdi,rdi
   24068:	0f 84 30 4d 00 00    	je     28d9e <JS_CallInternal+0x62de>
   2406e:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   24075:	00 
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6156
   24076:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   2407a:	4c 01 e8             	add    rax,r13

... non-contiguous window ...

   2407d:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24080:	0f 85 0a 4d 00 00    	jne    28d90 <JS_CallInternal+0x62d0>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   24086:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   2408a:	0f 87 ba 52 00 00    	ja     2934a <JS_CallInternal+0x688a>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6158
   24090:	48 c1 e7 04          	shl    rdi,0x4
   24094:	48 8d 47 f0          	lea    rax,[rdi-0x10]
   24098:	48 8b 7a 20          	mov    rdi,QWORD PTR [rdx+0x20]
   2409c:	48 01 c7             	add    rdi,rax
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 14)
   2409f:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
   240a3:	48 8b 0f             	mov    rcx,QWORD PTR [rdi]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:709
   240a6:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   240aa:	76 04                	jbe    240b0 <JS_CallInternal+0x15f0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:711
   240ac:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18045
   240b0:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   240b4:	48 39 f2             	cmp    rdx,rsi
   240b7:	0f 84 41 7c 00 00    	je     2bcfe <JS_CallInternal+0x923e>
   240bd:	49 89 cd             	mov    r13,rcx
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 31)
   240c0:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
   240c4:	49 8b 33             	mov    rsi,QWORD PTR [r11]
JS_FreeValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:689
   240c7:	83 fa f6             	cmp    edx,0xfffffff6
   240ca:	76 11                	jbe    240dd <JS_CallInternal+0x161d>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:691
   240cc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   240cf:	83 e8 01             	sub    eax,0x1
   240d2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   240d5:	85 c0                	test   eax,eax
   240d7:	0f 8e 5e 6b 00 00    	jle    2ac3b <JS_CallInternal+0x817b>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   240dd:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:68
   240e1:	49 83 c4 05          	add    r12,0x5
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   240e5:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:68
   240e9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   240ef:	49 89 c5             	mov    r13,rax
   240f2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   240f6:	ff e0                	jmp    rax
   240f8:	f3 0f 1e fa          	endbr64
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18449
   240fc:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   24100:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   24104:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24108:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2410c:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   24110:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   24117:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   2411b:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   24122:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
JS_NewRegexp():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:47686 (discriminator 1)

... non-contiguous window ...

   28d92:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28d98:	0f 85 d8 b2 ff ff    	jne    24076 <JS_CallInternal+0x15b6>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   28d9e:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28da2:	0f 85 98 05 00 00    	jne    29340 <JS_CallInternal+0x6880>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 24)
   28da8:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dac:	48 85 d2             	test   rdx,rdx
   28daf:	0f 84 2d 16 00 00    	je     2a3e2 <JS_CallInternal+0x7922>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6151
   28db5:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28db9:	e9 9a b2 ff ff       	jmp    24058 <JS_CallInternal+0x1598>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6162
   28dbe:	8b 38                	mov    edi,DWORD PTR [rax]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6155
   28dc0:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28dc6:	0f 85 d2 b1 ff ff    	jne    23f9e <JS_CallInternal+0x14de>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   28dcc:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28dd0:	0f 85 d4 05 00 00    	jne    293aa <JS_CallInternal+0x68ea>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 24)
   28dd6:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dda:	48 85 d2             	test   rdx,rdx
   28ddd:	0f 84 b2 15 00 00    	je     2a395 <JS_CallInternal+0x78d5>
find_own_property():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6151
   28de3:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28de7:	e9 94 b1 ff ff       	jmp    23f80 <JS_CallInternal+0x14c0>
min_int():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/cutils.h:90
   28dec:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28df2:	39 f7                	cmp    edi,esi
   28df4:	41 89 f5             	mov    r13d,esi
   28df7:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:17871 (discriminator 1)
   28dfb:	45 85 ed             	test   r13d,r13d
   28dfe:	0f 8e 1c 14 00 00    	jle    2a220 <JS_CallInternal+0x7760>

... non-contiguous window ...

/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:19187 (discriminator 1)
   29338:	4d 89 f4             	mov    r12,r14
   2933b:	e9 20 9f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 23)
   29340:	48 89 d6             	mov    rsi,rdx
   29343:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 15)
   2934a:	48 83 ec 08          	sub    rsp,0x8
   2934e:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
   29352:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29356:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2935a:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   29361:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29368:	4c 89 9d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r11
   2936f:	4c 89 d2             	mov    rdx,r10
   29372:	48 89 78 30          	mov    QWORD PTR [rax+0x30],rdi
   29376:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2937d:	6a 00                	push   0x0
   2937f:	e8 4c 3a 00 00       	call   2cdd0 <JS_GetPropertyInternal>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 3)
   29384:	41 59                	pop    r9
   29386:	4c 8b 9d 40 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c0]
   2938d:	83 fa 06             	cmp    edx,0x6
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 15)
   29390:	49 89 c5             	mov    r13,rax
   29393:	49 89 d0             	mov    r8,rdx
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 3)
   29396:	41 5a                	pop    r10
   29398:	0f 85 22 ad ff ff    	jne    240c0 <JS_CallInternal+0x1600>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   2939e:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   293a5:	e9 b6 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 23)
   293aa:	48 89 d6             	mov    rsi,rdx
   293ad:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 15)
   293b4:	48 83 ec 08          	sub    rsp,0x8
   293b8:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   293bc:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   293c0:	4c 89 d2             	mov    rdx,r10
   293c3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   293ca:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   293d1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293d8:	4c 89 58 30          	mov    QWORD PTR [rax+0x30],r11
   293dc:	6a 00                	push   0x0
   293de:	e8 ed 39 00 00       	call   2cdd0 <JS_GetPropertyInternal>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 3)
   293e3:	5e                   	pop    rsi
   293e4:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   293eb:	83 fa 06             	cmp    edx,0x6
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 15)
   293ee:	48 89 d1             	mov    rcx,rdx
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 3)
   293f1:	5f                   	pop    rdi
   293f2:	0f 85 e8 ab ff ff    	jne    23fe0 <JS_CallInternal+0x1520>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   293f8:	4d 89 dc             	mov    r12,r11
   293fb:	e9 60 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18215 (discriminator 1)
   29400:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   29407:	e9 54 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:20112
   2940c:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   29413:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:709
   29417:	83 fa f6             	cmp    edx,0xfffffff6
   2941a:	76 04                	jbe    29420 <JS_CallInternal+0x6960>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:711
   2941c:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:20116
   29420:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]

... non-contiguous window ...

   29cc6:	e8 05 4e ff ff       	call   1ead0 <JS_ToBoolFree>
   29ccb:	e9 df df ff ff       	jmp    27caf <JS_CallInternal+0x51ef>
rdi_probe():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:19
   29cd0:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29cd3:	0f 85 74 a3 ff ff    	jne    2404d <JS_CallInternal+0x158d>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:20
   29cd9:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 1)
   29cdd:	83 f8 ff             	cmp    eax,0xffffffff
   29ce0:	0f 84 67 a3 ff ff    	je     2404d <JS_CallInternal+0x158d>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 5)
   29ce6:	48 03 46 20          	add    rax,QWORD PTR [rsi+0x20]
   29cea:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29cee:	4c 8b 28             	mov    r13,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:709
   29cf1:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29cf5:	76 05                	jbe    29cfc <JS_CallInternal+0x723c>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:711
   29cf7:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18045
   29cfc:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67
   29d00:	e9 bb a3 ff ff       	jmp    240c0 <JS_CallInternal+0x1600>
   29d05:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29d0c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:3436
   29d10:	89 c8                	mov    eax,ecx
   29d12:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29d19:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:3437 (discriminator 1)
   29d1d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29d20:	83 e8 01             	sub    eax,0x1
   29d23:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29d26:	85 c0                	test   eax,eax
   29d28:	0f 8f 22 d1 ff ff    	jg     26e50 <JS_CallInternal+0x4390>
   29d2e:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:3439
   29d35:	e8 c6 b6 fe ff       	call   15400 <JS_FreeAtomStruct>

... non-contiguous window ...

   29ee6:	0f b6 c0             	movzx  eax,al
   29ee9:	e9 c6 b0 ff ff       	jmp    24fb4 <JS_CallInternal+0x24f4>
rdi_probe():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:19
   29eee:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29ef1:	0f 85 7b a0 ff ff    	jne    23f72 <JS_CallInternal+0x14b2>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:20
   29ef7:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 1)
   29efb:	83 f8 ff             	cmp    eax,0xffffffff
   29efe:	0f 84 6e a0 ff ff    	je     23f72 <JS_CallInternal+0x14b2>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 5)
   29f04:	48 03 46 20          	add    rax,QWORD PTR [rsi+0x20]
   29f08:	48 89 c2             	mov    rdx,rax
   29f0b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   29f0e:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:709
   29f12:	83 f9 f6             	cmp    ecx,0xfffffff6
   29f15:	0f 86 c5 a0 ff ff    	jbe    23fe0 <JS_CallInternal+0x1520>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:711
   29f1b:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70
   29f1f:	e9 bc a0 ff ff       	jmp    23fe0 <JS_CallInternal+0x1520>
   29f24:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   29f28:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29f2f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:3436
   29f33:	89 c8                	mov    eax,ecx
   29f35:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29f3c:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:3437 (discriminator 1)
   29f40:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29f43:	83 e8 01             	sub    eax,0x1
   29f46:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29f49:	85 c0                	test   eax,eax
   29f4b:	0f 8f 09 b1 ff ff    	jg     2505a <JS_CallInternal+0x259a>
   29f51:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:3439

... non-contiguous window ...

   2a389:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a38f:	51                   	push   rcx
   2a390:	e9 22 f4 ff ff       	jmp    297b7 <JS_CallInternal+0x6cf7>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 25)
   2a395:	b9 03 00 00 00       	mov    ecx,0x3
   2a39a:	31 c0                	xor    eax,eax
   2a39c:	e9 3f 9c ff ff       	jmp    23fe0 <JS_CallInternal+0x1520>
async_func_free():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:21032 (discriminator 1)
   2a3a1:	48 89 c6             	mov    rsi,rax
   2a3a4:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   2a3a7:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2a3ad:	83 e8 01             	sub    eax,0x1
   2a3b0:	89 46 ac             	mov    DWORD PTR [rsi-0x54],eax
   2a3b3:	0f 85 43 d8 ff ff    	jne    27bfc <JS_CallInternal+0x513c>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:21033
   2a3b9:	80 bf a0 04 00 00 02 	cmp    BYTE PTR [rdi+0x4a0],0x2
   2a3c0:	0f 84 36 d8 ff ff    	je     27bfc <JS_CallInternal+0x513c>
close_var_ref():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:17545
   2a3c6:	48 83 ee 50          	sub    rsi,0x50

... non-contiguous window ...

JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18045
   2a3e2:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 25)
   2a3e6:	41 b8 03 00 00 00    	mov    r8d,0x3
   2a3ec:	45 31 ed             	xor    r13d,r13d
   2a3ef:	e9 cc 9c ff ff       	jmp    240c0 <JS_CallInternal+0x1600>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18380
   2a3f4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18363
   2a3fb:	0f b6 d0             	movzx  edx,al
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18380
   2a3fe:	31 c0                	xor    eax,eax
   2a400:	48 8d 35 05 31 0a 00 	lea    rsi,[rip+0xa3105]        # cd50c <_IO_stdin_used+0x50c>
   2a407:	e8 14 8c 00 00       	call   33020 <JS_ThrowInternalError>
   2a40c:	e9 4f 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:19085
   2a411:	4d 89 ec             	mov    r12,r13
   2a414:	e9 47 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6516

... non-contiguous window ...

/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18450
   2adb2:	4c 89 f3             	mov    rbx,r14
   2adb5:	e9 a6 84 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 6)
   2adba:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   2adbe:	e9 87 e5 ff ff       	jmp    2934a <JS_CallInternal+0x688a>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:7862
   2adc3:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:7851 (discriminator 1)
   2adca:	48 8d 15 c9 26 0a 00 	lea    rdx,[rip+0xa26c9]        # cd49a <_IO_stdin_used+0x49a>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:7862
   2add1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2add5:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:7851
   2add9:	85 c0                	test   eax,eax
   2addb:	0f 85 8f 17 00 00    	jne    2c570 <JS_CallInternal+0x9ab0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:7851 (discriminator 2)

... non-contiguous window ...

   2b18b:	0f 84 f5 cf ff ff    	je     28186 <JS_CallInternal+0x56c6>
   2b191:	4d 89 ec             	mov    r12,r13
   2b194:	e9 c7 80 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 6)
   2b199:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   2b19c:	e9 13 e2 ff ff       	jmp    293b4 <JS_CallInternal+0x68f4>
__JS_FreeValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6516
   2b1a1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b1a8:	4c 89 ee             	mov    rsi,r13
   2b1ab:	4c 89 f2             	mov    rdx,r14
   2b1ae:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2b1b5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b1b9:	e8 e2 16 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b1be:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2b1c5:	e9 d9 9e ff ff       	jmp    250a3 <JS_CallInternal+0x25e3>
   2b1ca:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b1d1:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b1d8:	48 89 ce             	mov    rsi,rcx
   2b1db:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b1e2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]

... non-contiguous window ...

   2bcf4:	e8 67 71 00 00       	call   32e60 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:20568
   2bcf9:	e9 c8 78 ff ff       	jmp    235c6 <JS_CallInternal+0xb06>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 17)
   2bcfe:	8b 52 10             	mov    edx,DWORD PTR [rdx+0x10]
   2bd01:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2bd07:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2bd0d:	0f 85 aa 83 ff ff    	jne    240bd <JS_CallInternal+0x15fd>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:67 (discriminator 19)
   2bd13:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2bd18:	0f 84 9f 83 ff ff    	je     240bd <JS_CallInternal+0x15fd>
rdi_byte_offset():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:11
   2bd1e:	ba f0 ff ff ff       	mov    edx,0xfffffff0
   2bd23:	48 39 d0             	cmp    rax,rdx
   2bd26:	0f 8f 91 83 ff ff    	jg     240bd <JS_CallInternal+0x15fd>
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:45
   2bd2c:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   2bd2f:	4c 39 ee             	cmp    rsi,r13
   2bd32:	0f 84 27 0d 00 00    	je     2ca5f <JS_CallInternal+0x9f9f>
js_dup_shape():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:5305 (discriminator 1)
   2bd38:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:5338
   2bd3d:	48 85 f6             	test   rsi,rsi
   2bd40:	74 48                	je     2bd8a <JS_CallInternal+0x92ca>
   2bd42:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:5339
   2bd49:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd50:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
   2bd57:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd5b:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2bd62:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8

... non-contiguous window ...

   2bd7c:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2bd83:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:52
   2bd8a:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:53
   2bd8d:	41 89 46 08          	mov    DWORD PTR [r14+0x8],eax
   2bd91:	e9 27 83 ff ff       	jmp    240bd <JS_CallInternal+0x15fd>
   2bd96:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   2bd9d:	00 00 00 
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:19977
   2bda0:	f2 0f 10 05 b8 ec 0a 	movsd  xmm0,QWORD PTR [rip+0xaecb8]        # daa60 <typed_array_size_log2+0x28>
   2bda7:	00 
   2bda8:	e9 e7 d7 ff ff       	jmp    29594 <JS_CallInternal+0x6ad4>
__JS_FreeValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:6516
   2bdad:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bdb4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bdb8:	e8 e3 0a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bdbd:	e9 06 79 ff ff       	jmp    236c8 <JS_CallInternal+0xc08>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:20564

... non-contiguous window ...

   2bdfd:	e8 9e 0a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2be02:	e9 b3 77 ff ff       	jmp    235ba <JS_CallInternal+0xafa>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 17)
   2be07:	8b 56 10             	mov    edx,DWORD PTR [rsi+0x10]
   2be0a:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2be10:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2be16:	0f 85 c4 81 ff ff    	jne    23fe0 <JS_CallInternal+0x1520>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_opcodes.inc:70 (discriminator 19)
   2be1c:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2be21:	0f 84 b9 81 ff ff    	je     23fe0 <JS_CallInternal+0x1520>
rdi_byte_offset():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:11
   2be27:	ba f0 ff ff ff       	mov    edx,0xfffffff0
   2be2c:	49 39 d0             	cmp    r8,rdx
   2be2f:	0f 8f ab 81 ff ff    	jg     23fe0 <JS_CallInternal+0x1520>
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:45
   2be35:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   2be38:	4c 39 ee             	cmp    rsi,r13
   2be3b:	74 47                	je     2be84 <JS_CallInternal+0x93c4>
js_dup_shape():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:5305 (discriminator 1)
   2be3d:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:5338
   2be42:	48 85 f6             	test   rsi,rsi
   2be45:	74 3a                	je     2be81 <JS_CallInternal+0x93c1>
   2be47:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:5339
   2be4e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2be55:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2be5c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2be60:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2be67:	e8 44 24 ff ff       	call   1e2b0 <js_free_shape>

... non-contiguous window ...

   2be73:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2be7a:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:52
   2be81:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:53
   2be84:	45 89 46 08          	mov    DWORD PTR [r14+0x8],r8d
   2be88:	e9 53 81 ff ff       	jmp    23fe0 <JS_CallInternal+0x1520>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:19981
   2be8d:	f2 0f 10 05 3b 75 0a 	movsd  xmm0,QWORD PTR [rip+0xa753b]        # d33d0 <__PRETTY_FUNCTION__.0+0xc0>
   2be94:	00 
   2be95:	e9 fa d6 ff ff       	jmp    29594 <JS_CallInternal+0x6ad4>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:19411
   2be9a:	4d 89 f4             	mov    r12,r14
   2be9d:	e9 be 73 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:19633
   2bea2:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bea9:	48 8b 91 88 01 00 00 	mov    rdx,QWORD PTR [rcx+0x188]
   2beb0:	48 8b 81 80 01 00 00 	mov    rax,QWORD PTR [rcx+0x180]
JS_DupValue():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.h:709
   2beb7:	83 fa f6             	cmp    edx,0xfffffff6

... non-contiguous window ...

   2ca53:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2ca5a:	e9 e6 9e ff ff       	jmp    26945 <JS_CallInternal+0x3e85>
rdi_update():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:46
   2ca5f:	41 89 46 08          	mov    DWORD PTR [r14+0x8],eax
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/read_ic_runtime.inc:47
   2ca63:	e9 55 76 ff ff       	jmp    240bd <JS_CallInternal+0x15fd>
JS_CallInternal():
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:20464
   2ca68:	4d 89 ec             	mov    r12,r13
   2ca6b:	e9 f0 67 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18517
   2ca70:	4d 89 f4             	mov    r12,r14
   2ca73:	e9 e8 67 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18526
   2ca78:	e8 73 63 00 00       	call   32df0 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:18517
   2ca7d:	4d 89 f4             	mov    r12,r14
   2ca80:	e9 db 67 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/ic_fast_slow_20261102_attempt01/U_build03/quickjs.c:19793
   2ca85:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2ca89:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ca90:	4c 89 c2             	mov    rdx,r8
