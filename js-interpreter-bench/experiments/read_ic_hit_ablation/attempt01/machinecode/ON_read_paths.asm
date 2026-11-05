
... disjoint excerpt ...

   24004:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24008:	ff e0                	jmp    rax
   2400a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   2400e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   24012:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   24019:	4d 8d 5c 24 04       	lea    r11,[r12+0x4]
   2401e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24022:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24026:	48 c1 e0 04          	shl    rax,0x4
   2402a:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   2402e:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 2)
   24031:	41 83 fa ff          	cmp    r10d,0xffffffff
   24035:	0f 85 b0 70 00 00    	jne    2b0eb <JS_CallInternal+0x854b>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   2403b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 3)
   2403e:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   24042:	25 08 00 ff ff       	and    eax,0xffff0008
   24047:	3d 00 00 01 00       	cmp    eax,0x10000
   2404c:	0f 84 63 5e 00 00    	je     29eb5 <JS_CallInternal+0x7315>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 10)
   24052:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   24056:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 11)
   24059:	48 89 f2             	mov    rdx,rsi
   2405c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6161
   24060:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24064:	89 cf                	mov    edi,ecx
   24066:	21 c7                	and    edi,eax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6162
   24068:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6164
   2406d:	48 85 ff             	test   rdi,rdi
   24070:	0f 84 2e 4e 00 00    	je     28ea4 <JS_CallInternal+0x6304>
   24076:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2407d:	00 
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6165
   2407e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24082:	4c 01 e8             	add    rax,r13
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6166 (discriminator 1)
   24085:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24088:	0f 85 08 4e 00 00    	jne    28e96 <JS_CallInternal+0x62f6>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   2408e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24092:	0f 87 0e 53 00 00    	ja     293a6 <JS_CallInternal+0x6806>
find_own_property():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6167
   24098:	48 8b 42 20          	mov    rax,QWORD PTR [rdx+0x20]
   2409c:	48 c1 e7 04          	shl    rdi,0x4
   240a0:	48 83 ef 10          	sub    rdi,0x10
   240a4:	48 01 f8             	add    rax,rdi
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 17)
   240a7:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   240ab:	4c 8b 00             	mov    r8,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:709
   240ae:	83 f9 f6             	cmp    ecx,0xfffffff6
   240b1:	76 05                	jbe    240b8 <JS_CallInternal+0x1518>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:711
   240b3:	41 83 40 fc 01       	add    DWORD PTR [r8-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 20)
   240b8:	48 39 d6             	cmp    rsi,rdx
   240bb:	75 09                	jne    240c6 <JS_CallInternal+0x1526>
   240bd:	45 85 c9             	test   r9d,r9d
   240c0:	0f 84 70 81 00 00    	je     2c236 <JS_CallInternal+0x9696>
   240c6:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 39)
   240c9:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:82
   240cc:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 39)
   240d0:	48 83 c3 10          	add    rbx,0x10
   240d4:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:82
   240d8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   240de:	49 89 c5             	mov    r13,rax
   240e1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   240e5:	ff e0                	jmp    rax
   240e7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   240eb:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   240ef:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   240f6:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   240fa:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   240fe:	48 c1 e0 04          	shl    rax,0x4
   24102:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   24106:	49 89 c6             	mov    r14,rax
   24109:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   2410e:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 2)
   24115:	41 83 fa ff          	cmp    r10d,0xffffffff
   24119:	0f 85 55 6d 00 00    	jne    2ae74 <JS_CallInternal+0x82d4>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2411f:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 3)
   24122:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   24126:	25 08 00 ff ff       	and    eax,0xffff0008
   2412b:	3d 00 00 01 00       	cmp    eax,0x10000
   24130:	0f 84 27 5f 00 00    	je     2a05d <JS_CallInternal+0x74bd>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 10)
   24136:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2413a:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 11)
   2413d:	48 89 f2             	mov    rdx,rsi
find_own_property():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6161
   24140:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24144:	89 cf                	mov    edi,ecx
   24146:	21 c7                	and    edi,eax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6162
   24148:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6164
   2414d:	48 85 ff             	test   rdi,rdi
   24150:	0f 84 7c 4d 00 00    	je     28ed2 <JS_CallInternal+0x6332>
   24156:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2415d:	00 
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6165
   2415e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24162:	4c 01 e8             	add    rax,r13
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6166 (discriminator 1)
   24165:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24168:	0f 85 56 4d 00 00    	jne    28ec4 <JS_CallInternal+0x6324>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2416e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24172:	0f 87 78 51 00 00    	ja     292f0 <JS_CallInternal+0x6750>
find_own_property():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6167
   24178:	48 8b 4a 20          	mov    rcx,QWORD PTR [rdx+0x20]
   2417c:	48 c1 e7 04          	shl    rdi,0x4
   24180:	48 83 ef 10          	sub    rdi,0x10
   24184:	48 01 f9             	add    rcx,rdi
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 17)
   24187:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   2418a:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
JS_DupValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:709
   2418e:	83 f9 f6             	cmp    ecx,0xfffffff6
   24191:	76 04                	jbe    24197 <JS_CallInternal+0x15f7>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:711
   24193:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:18054
   24197:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 20)
   2419b:	48 39 d6             	cmp    rsi,rdx
   2419e:	75 09                	jne    241a9 <JS_CallInternal+0x1609>
   241a0:	45 85 c9             	test   r9d,r9d
   241a3:	0f 84 40 82 00 00    	je     2c3e9 <JS_CallInternal+0x9849>
   241a9:	49 89 c5             	mov    r13,rax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 40)
   241ac:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
   241b0:	49 8b 33             	mov    rsi,QWORD PTR [r11]
JS_FreeValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:689
   241b3:	83 fa f6             	cmp    edx,0xfffffff6
   241b6:	76 11                	jbe    241c9 <JS_CallInternal+0x1629>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:691
   241b8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   241bb:	83 e8 01             	sub    eax,0x1
   241be:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   241c1:	85 c0                	test   eax,eax
   241c3:	0f 8e a9 65 00 00    	jle    2a772 <JS_CallInternal+0x7bd2>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   241c9:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:79
   241cd:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   241d1:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:79
   241d5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   241db:	49 89 c5             	mov    r13,rax
   241de:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   241e2:	ff e0                	jmp    rax
   241e4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19128
   241e8:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19127
   241ec:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   241f0:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19128
   241f4:	0f 87 ba 5a 00 00    	ja     29cb4 <JS_CallInternal+0x7114>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19129
   241fa:	31 c0                	xor    eax,eax
   241fc:	85 d2                	test   edx,edx
   241fe:	0f 95 c0             	setne  al
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19133
   24201:	85 c0                	test   eax,eax
   24203:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2420a:	00 
   2420b:	0f 94 c0             	sete   al
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19135

... disjoint excerpt ...

   28e98:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28e9e:	0f 85 da b1 ff ff    	jne    2407e <JS_CallInternal+0x14de>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   28ea4:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28ea8:	0f 85 ee 04 00 00    	jne    2939c <JS_CallInternal+0x67fc>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 30)
   28eae:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28eb2:	48 85 d2             	test   rdx,rdx
   28eb5:	0f 84 e4 15 00 00    	je     2a49f <JS_CallInternal+0x78ff>
find_own_property():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6160
   28ebb:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28ebf:	e9 9c b1 ff ff       	jmp    24060 <JS_CallInternal+0x14c0>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6171
   28ec4:	8b 38                	mov    edi,DWORD PTR [rax]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6164
   28ec6:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28ecc:	0f 85 8c b2 ff ff    	jne    2415e <JS_CallInternal+0x15be>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   28ed2:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28ed6:	0f 85 0a 04 00 00    	jne    292e6 <JS_CallInternal+0x6746>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 30)
   28edc:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28ee0:	48 85 d2             	test   rdx,rdx
   28ee3:	0f 84 c2 15 00 00    	je     2a4ab <JS_CallInternal+0x790b>
find_own_property():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6160
   28ee9:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28eed:	e9 4e b2 ff ff       	jmp    24140 <JS_CallInternal+0x15a0>
min_int():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/cutils.h:90
   28ef2:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28ef8:	39 f7                	cmp    edi,esi
   28efa:	41 89 f5             	mov    r13d,esi
   28efd:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:17880 (discriminator 1)
   28f01:	45 85 ed             	test   r13d,r13d
   28f04:	0f 8e c9 13 00 00    	jle    2a2d3 <JS_CallInternal+0x7733>
   28f0a:	4c 8b bd a8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x158]
   28f11:	4d 63 f5             	movsxd r14,r13d
   28f14:	4d 8d 43 08          	lea    r8,[r11+0x8]
   28f18:	49 c1 e6 04          	shl    r14,0x4
   28f1c:	4c 89 fe             	mov    rsi,r15

... disjoint excerpt ...

   292db:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   292e1:	e9 bc a7 ff ff       	jmp    23aa2 <JS_CallInternal+0xf02>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 31)
   292e6:	48 89 d6             	mov    rsi,rdx
   292e9:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 35)
   292f0:	48 83 ec 08          	sub    rsp,0x8
   292f4:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
   292f8:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   292fc:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29300:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   29307:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2930e:	4c 89 9d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r11
   29315:	4c 89 d2             	mov    rdx,r10
   29318:	48 89 78 30          	mov    QWORD PTR [rax+0x30],rdi
   2931c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29323:	6a 00                	push   0x0
   29325:	e8 d6 3b 00 00       	call   2cf00 <JS_GetPropertyInternal>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 3)
   2932a:	41 58                	pop    r8
   2932c:	4c 8b 9d 40 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c0]
   29333:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 35)
   29336:	49 89 c5             	mov    r13,rax
   29339:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 3)
   2933c:	41 59                	pop    r9
   2933e:	0f 85 68 ae ff ff    	jne    241ac <JS_CallInternal+0x160c>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   29344:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2934b:	e9 f0 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19200 (discriminator 13)
   29350:	49 89 ca             	mov    r10,rcx
   29353:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19200 (discriminator 12)
   2935a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29361:	48 83 ec 08          	sub    rsp,0x8
   29365:	48 89 fa             	mov    rdx,rdi
   29368:	89 f1                	mov    ecx,esi
   2936a:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2936e:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29372:	4c 89 d6             	mov    rsi,r10
   29375:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   29379:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29380:	6a 00                	push   0x0
   29382:	e8 79 3b 00 00       	call   2cf00 <JS_GetPropertyInternal>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19200 (discriminator 3)
   29387:	41 59                	pop    r9
   29389:	41 5a                	pop    r10
   2938b:	83 fa 06             	cmp    edx,0x6
   2938e:	0f 85 d6 d0 ff ff    	jne    2646a <JS_CallInternal+0x38ca>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19200 (discriminator 1)
   29394:	4d 89 ec             	mov    r12,r13
   29397:	e9 a4 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 31)
   2939c:	48 89 d6             	mov    rsi,rdx
   2939f:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 35)
   293a6:	48 83 ec 08          	sub    rsp,0x8
   293aa:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   293ae:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   293b2:	4c 89 d2             	mov    rdx,r10
   293b5:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   293bc:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   293c3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293ca:	4c 89 58 30          	mov    QWORD PTR [rax+0x30],r11
   293ce:	6a 00                	push   0x0
   293d0:	e8 2b 3b 00 00       	call   2cf00 <JS_GetPropertyInternal>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 3)
   293d5:	5e                   	pop    rsi
   293d6:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   293dd:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 35)
   293e0:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 3)
   293e3:	5f                   	pop    rdi
   293e4:	0f 85 df ac ff ff    	jne    240c9 <JS_CallInternal+0x1529>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   293ea:	4d 89 dc             	mov    r12,r11
   293ed:	e9 4e 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   293f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19391
   293f8:	80 cc 08             	or     ah,0x8
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19390
   293fb:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5946
   29400:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19391
   29406:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   2940c:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
js_method_set_properties():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5946
   29410:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19390
   29417:	0f 29 bd 10 fe ff ff 	movaps XMMWORD PTR [rbp-0x1f0],xmm7
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19396
   2941e:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax

... disjoint excerpt ...

   29ea9:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   29eb0:	e9 b1 c4 ff ff       	jmp    26366 <JS_CallInternal+0x37c6>
rdi_probe():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:9
   29eb5:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29eb8:	0f 85 94 a1 ff ff    	jne    24052 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:10
   29ebe:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   29ec2:	83 f8 ff             	cmp    eax,0xffffffff
   29ec5:	0f 84 87 a1 ff ff    	je     24052 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 5)
   29ecb:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   29ed2:	48 8b 51 10          	mov    rdx,QWORD PTR [rcx+0x10]
   29ed6:	80 ba a0 05 00 00 00 	cmp    BYTE PTR [rdx+0x5a0],0x0
   29edd:	0f 85 76 2a 00 00    	jne    2c959 <JS_CallInternal+0x9db9>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 10)
   29ee3:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   29ee7:	41 b9 01 00 00 00    	mov    r9d,0x1
   29eed:	e9 67 a1 ff ff       	jmp    24059 <JS_CallInternal+0x14b9>
js_for_of_next():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:16724
   29ef2:	c7 85 f0 fe ff ff ff 	mov    DWORD PTR [rbp-0x110],0xffffffff
   29ef9:	ff ff ff 
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:16725
   29efc:	b9 ff ff ff ff       	mov    ecx,0xffffffff
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:16728
   29f01:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   29f05:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:689
   29f09:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29f0d:	76 11                	jbe    29f20 <JS_CallInternal+0x7380>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:691
   29f0f:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   29f12:	8d 57 ff             	lea    edx,[rdi-0x1]
   29f15:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   29f18:	85 d2                	test   edx,edx
   29f1a:	0f 8e 1a 20 00 00    	jle    2bf3a <JS_CallInternal+0x939a>
js_for_of_next():

... disjoint excerpt ...

   2a055:	0f b6 c0             	movzx  eax,al
   2a058:	e9 48 ae ff ff       	jmp    24ea5 <JS_CallInternal+0x2305>
rdi_probe():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:9
   2a05d:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   2a060:	0f 85 d0 a0 ff ff    	jne    24136 <JS_CallInternal+0x1596>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:10
   2a066:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2a06a:	83 f8 ff             	cmp    eax,0xffffffff
   2a06d:	0f 84 c3 a0 ff ff    	je     24136 <JS_CallInternal+0x1596>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 5)
   2a073:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2a07a:	48 8b 51 10          	mov    rdx,QWORD PTR [rcx+0x10]
   2a07e:	80 ba a0 05 00 00 00 	cmp    BYTE PTR [rdx+0x5a0],0x0
   2a085:	0f 85 88 27 00 00    	jne    2c813 <JS_CallInternal+0x9c73>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 10)
   2a08b:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2a08f:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a095:	e9 a3 a0 ff ff       	jmp    2413d <JS_CallInternal+0x159d>
   2a09a:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2a0a1:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:3445
   2a0a5:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a0ac:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2a0b0:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   2a0b3:	8d 51 ff             	lea    edx,[rcx-0x1]
   2a0b6:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2a0b9:	85 d2                	test   edx,edx
   2a0bb:	0f 8f de bf ff ff    	jg     2609f <JS_CallInternal+0x34ff>
   2a0c1:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:3448
   2a0c8:	e8 53 b3 fe ff       	call   15420 <JS_FreeAtomStruct>
   2a0cd:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2a0d4:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2a0db:	e9 bf bf ff ff       	jmp    2609f <JS_CallInternal+0x34ff>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20372 (discriminator 30)

... disjoint excerpt ...

   2a493:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   2a49a:	e9 d5 ac ff ff       	jmp    25174 <JS_CallInternal+0x25d4>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 34)
   2a49f:	b9 03 00 00 00       	mov    ecx,0x3
   2a4a4:	31 c0                	xor    eax,eax
   2a4a6:	e9 1e 9c ff ff       	jmp    240c9 <JS_CallInternal+0x1529>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:18054
   2a4ab:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 34)
   2a4af:	b9 03 00 00 00       	mov    ecx,0x3
   2a4b4:	45 31 ed             	xor    r13d,r13d
   2a4b7:	e9 f0 9c ff ff       	jmp    241ac <JS_CallInternal+0x160c>
async_func_free():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:21041 (discriminator 1)
   2a4bc:	48 89 c6             	mov    rsi,rax
   2a4bf:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   2a4c2:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2a4c8:	83 e8 01             	sub    eax,0x1
   2a4cb:	89 46 ac             	mov    DWORD PTR [rsi-0x54],eax
   2a4ce:	0f 85 d1 c4 ff ff    	jne    269a5 <JS_CallInternal+0x3e05>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:21042
   2a4d4:	80 bf a0 04 00 00 02 	cmp    BYTE PTR [rdi+0x4a0],0x2
   2a4db:	0f 84 c4 c4 ff ff    	je     269a5 <JS_CallInternal+0x3e05>
close_var_ref():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:17554
   2a4e1:	48 83 ee 50          	sub    rsi,0x50
async_func_free():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:17554
   2a4e5:	e8 06 5f ff ff       	call   203f0 <async_func_free.part.0>
close_lexical_var():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:17585

... disjoint excerpt ...

   2ae6a:	e8 b1 1a ff ff       	call   1c920 <__JS_FreeValueRT>
   2ae6f:	e9 7a 9e ff ff       	jmp    24cee <JS_CallInternal+0x214e>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 10)
   2ae74:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   2ae78:	e9 73 e4 ff ff       	jmp    292f0 <JS_CallInternal+0x6750>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19696
   2ae7d:	4c 89 f3             	mov    rbx,r14
   2ae80:	e9 bb 84 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2ae85:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
__JS_FreeValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6525
   2ae8c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ae93:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   2ae9a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ae9e:	e8 7d 1a ff ff       	call   1c920 <__JS_FreeValueRT>
   2aea3:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2aeaa:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2aeb1:	e9 50 b2 ff ff       	jmp    26106 <JS_CallInternal+0x3566>
   2aeb6:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2aebd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aec4:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2aecb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aecf:	e8 4c 1a ff ff       	call   1c920 <__JS_FreeValueRT>
   2aed4:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2aedb:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]

... disjoint excerpt ...

JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19296
   2b0e6:	e9 89 e1 ff ff       	jmp    29274 <JS_CallInternal+0x66d4>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 10)
   2b0eb:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   2b0ee:	e9 b3 e2 ff ff       	jmp    293a6 <JS_CallInternal+0x6806>
__JS_FreeValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6525
   2b0f3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b0fa:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b101:	48 89 ce             	mov    rsi,rcx
   2b104:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b10b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b10f:	e8 0c 18 ff ff       	call   1c920 <__JS_FreeValueRT>
   2b114:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b11b:	e9 5b 9e ff ff       	jmp    24f7b <JS_CallInternal+0x23db>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20300 (discriminator 2)
   2b120:	83 fe 08             	cmp    esi,0x8
   2b123:	0f 84 28 14 00 00    	je     2c551 <JS_CallInternal+0x99b1>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20300 (discriminator 8)
   2b129:	85 f6                	test   esi,esi
   2b12b:	75 09                	jne    2b136 <JS_CallInternal+0x8596>
   2b12d:	83 f9 08             	cmp    ecx,0x8
   2b130:	0f 84 53 14 00 00    	je     2c589 <JS_CallInternal+0x99e9>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20300 (discriminator 20)

... disjoint excerpt ...

/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:3610
   2c231:	e9 88 ed ff ff       	jmp    2afbe <JS_CallInternal+0x841e>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 23)
   2c236:	8b 42 10             	mov    eax,DWORD PTR [rdx+0x10]
   2c239:	25 08 00 ff ff       	and    eax,0xffff0008
   2c23e:	3d 00 00 01 00       	cmp    eax,0x10000
   2c243:	0f 85 7d 7e ff ff    	jne    240c6 <JS_CallInternal+0x1526>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 25)
   2c249:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2c24e:	0f 84 72 7e ff ff    	je     240c6 <JS_CallInternal+0x1526>
rdi_update():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:32
   2c254:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 27)
   2c257:	48 89 f8             	mov    rax,rdi
   2c25a:	48 c1 f8 04          	sar    rax,0x4
rdi_update():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:32
   2c25e:	4c 39 ee             	cmp    rsi,r13
   2c261:	74 47                	je     2c2aa <JS_CallInternal+0x970a>
js_dup_shape():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5314 (discriminator 1)
   2c263:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5347
   2c268:	48 85 f6             	test   rsi,rsi
   2c26b:	74 3a                	je     2c2a7 <JS_CallInternal+0x9707>
   2c26d:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5348
   2c274:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c27b:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2c282:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c286:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2c28d:	e8 9e 20 ff ff       	call   1e330 <js_free_shape>
   2c292:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2c299:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2c2a0:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:39
   2c2a7:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:40
   2c2aa:	41 89 46 08          	mov    DWORD PTR [r14+0x8],eax
   2c2ae:	e9 13 7e ff ff       	jmp    240c6 <JS_CallInternal+0x1526>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20373 (discriminator 22)
   2c2b3:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c2b7:	83 fa 01             	cmp    edx,0x1
   2c2ba:	0f 86 88 0b 00 00    	jbe    2ce48 <JS_CallInternal+0xa2a8>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20373 (discriminator 25)
   2c2c0:	83 c0 01             	add    eax,0x1
   2c2c3:	0f 85 e3 de ff ff    	jne    2a1ac <JS_CallInternal+0x760c>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20373 (discriminator 26)
   2c2c9:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2c2ce:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c2d5:	4c 89 c2             	mov    rdx,r8
   2c2d8:	83 e0 01             	and    eax,0x1
   2c2db:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c2e1:	e8 9a 07 ff ff       	call   1ca80 <JS_FreeValue>
   2c2e6:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2c2ec:	e9 c7 90 ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20373 (discriminator 15)
   2c2f1:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c2f5:	83 fa 01             	cmp    edx,0x1

... disjoint excerpt ...

   2c3df:	e8 3c 05 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c3e4:	e9 86 dd ff ff       	jmp    2a16f <JS_CallInternal+0x75cf>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 23)
   2c3e9:	8b 52 10             	mov    edx,DWORD PTR [rdx+0x10]
   2c3ec:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2c3f2:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2c3f8:	0f 85 ab 7d ff ff    	jne    241a9 <JS_CallInternal+0x1609>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 25)
   2c3fe:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2c403:	0f 84 a0 7d ff ff    	je     241a9 <JS_CallInternal+0x1609>
rdi_update():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:32
   2c409:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 27)
   2c40c:	48 c1 ff 04          	sar    rdi,0x4
   2c410:	48 89 fa             	mov    rdx,rdi
rdi_update():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:32
   2c413:	4c 39 ee             	cmp    rsi,r13
   2c416:	74 55                	je     2c46d <JS_CallInternal+0x98cd>
js_dup_shape():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5314 (discriminator 1)
   2c418:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5347
   2c41d:	48 85 f6             	test   rsi,rsi
   2c420:	74 48                	je     2c46a <JS_CallInternal+0x98ca>
   2c422:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:5348
   2c429:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c430:	48 89 bd 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdi
   2c437:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c43b:	4c 89 9d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r11
   2c442:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2c449:	e8 e2 1e ff ff       	call   1e330 <js_free_shape>
   2c44e:	48 8b 95 28 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1d8]
   2c455:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2c45c:	4c 8b 9d 40 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c0]
   2c463:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:39
   2c46a:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_runtime.inc:40
   2c46d:	41 89 56 08          	mov    DWORD PTR [r14+0x8],edx
   2c471:	e9 33 7d ff ff       	jmp    241a9 <JS_CallInternal+0x1609>
__JS_FreeValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:6525
   2c476:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c47d:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c484:	4c 89 ee             	mov    rsi,r13
   2c487:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c48b:	e8 90 04 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c490:	e9 b8 95 ff ff       	jmp    25a4d <JS_CallInternal+0x2ead>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:7826
   2c495:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c49c:	48 8d 35 c0 10 0a 00 	lea    rsi,[rip+0xa10c0]        # cd563 <_IO_stdin_used+0x563>
   2c4a3:	31 c0                	xor    eax,eax
   2c4a5:	e8 c6 48 00 00       	call   30d70 <JS_ThrowTypeError>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19674
   2c4aa:	e9 91 6e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20303 (discriminator 7)
   2c4af:	66 48 0f 6e ca       	movq   xmm1,rdx
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20303 (discriminator 12)

... disjoint excerpt ...

/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19719
   2c80b:	4d 89 ec             	mov    r12,r13
   2c80e:	e9 2d 6b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 7)
   2c813:	48 c1 e0 04          	shl    rax,0x4
   2c817:	48 03 46 20          	add    rax,QWORD PTR [rsi+0x20]
   2c81b:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   2c81f:	4c 8b 28             	mov    r13,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:709
   2c822:	83 f9 f6             	cmp    ecx,0xfffffff6
   2c825:	76 05                	jbe    2c82c <JS_CallInternal+0x9c8c>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:711
   2c827:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:18054
   2c82c:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:78
   2c830:	e9 77 79 ff ff       	jmp    241ac <JS_CallInternal+0x160c>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19746
   2c835:	66 49 0f 6e ca       	movq   xmm1,r10
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19752
   2c83a:	83 ff 08             	cmp    edi,0x8
   2c83d:	0f 84 5e f7 ff ff    	je     2bfa1 <JS_CallInternal+0x9401>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19754
   2c843:	85 ff                	test   edi,edi
   2c845:	0f 85 17 e7 ff ff    	jne    2af62 <JS_CallInternal+0x83c2>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:19755
   2c84b:	66 0f ef c0          	pxor   xmm0,xmm0
   2c84f:	f2 41 0f 2a c0       	cvtsi2sd xmm0,r8d
   2c854:	e9 4d f7 ff ff       	jmp    2bfa6 <JS_CallInternal+0x9406>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:18843
   2c859:	4d 89 ec             	mov    r12,r13
   2c85c:	e9 df 6a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_AtomGetStr():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:3610
   2c861:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c868:	89 c2                	mov    edx,eax
   2c86a:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c86e:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]

... disjoint excerpt ...

   2c950:	00 
   2c951:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c954:	e9 7f c0 ff ff       	jmp    289d8 <JS_CallInternal+0x5e38>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 7)
   2c959:	89 c2                	mov    edx,eax
   2c95b:	48 c1 e2 04          	shl    rdx,0x4
   2c95f:	48 03 56 20          	add    rdx,QWORD PTR [rsi+0x20]
   2c963:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
   2c967:	48 8b 02             	mov    rax,QWORD PTR [rdx]
JS_DupValue():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:709
   2c96a:	83 f9 f6             	cmp    ecx,0xfffffff6
   2c96d:	0f 86 56 77 ff ff    	jbe    240c9 <JS_CallInternal+0x1529>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.h:711
   2c973:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/read_ic_opcodes.inc:81
   2c977:	e9 4d 77 ff ff       	jmp    240c9 <JS_CallInternal+0x1529>
js_iterator_get_value_done():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:16783
   2c97c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c983:	48 8d 35 96 44 0a 00 	lea    rsi,[rip+0xa4496]        # d0e20 <_IO_stdin_used+0x3e20>
   2c98a:	31 c0                	xor    eax,eax
   2c98c:	e8 df 43 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:16784
   2c991:	e9 aa 69 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20430 (discriminator 24)
   2c996:	48 89 d7             	mov    rdi,rdx
   2c999:	4c 89 ce             	mov    rsi,r9
   2c99c:	45 31 c0             	xor    r8d,r8d
   2c99f:	4c 89 ea             	mov    rdx,r13
   2c9a2:	4c 89 f1             	mov    rcx,r14
   2c9a5:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c9ac:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2c9b3:	e8 98 db fe ff       	call   1a550 <js_strict_eq2.isra.0>
/home/mzyx/read_ic_hit_ablation_attempt01/SW/quickjs.c:20430 (discriminator 1)
   2c9b8:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2c9bf:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
