; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   270f0:	f3 0f 1e fa          	endbr64
   270f4:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   270f9:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   27100:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
   27105:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   27109:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2710d:	49 c1 e5 04          	shl    r13,0x4
   27111:	49 01 c5             	add    r13,rax
   27114:	44 89 f1             	mov    ecx,r14d
   27117:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2711b:	09 d1                	or     ecx,edx
   2711d:	0f 85 f7 3d 00 00    	jne    2af1a <JS_CallInternal+0x837a>
   27123:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   27127:	49 63 c8             	movsxd rcx,r8d
   2712a:	48 63 d0             	movsxd rdx,eax
   2712d:	44 01 c0             	add    eax,r8d
   27130:	48 01 ca             	add    rdx,rcx
   27133:	48 63 c8             	movsxd rcx,eax
   27136:	48 39 d1             	cmp    rcx,rdx
   27139:	0f 85 c2 3d 00 00    	jne    2af01 <JS_CallInternal+0x8361>
   2713f:	89 c0                	mov    eax,eax
   27141:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   27145:	31 c0                	xor    eax,eax
   27147:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
   2714b:	48 83 eb 10          	sub    rbx,0x10
   2714f:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27155:	49 83 c4 02          	add    r12,0x2
   27159:	49 89 c5             	mov    r13,rax
   2715c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27160:	ff e0                	jmp    rax
   27162:	f3 0f 1e fa          	endbr64
   27166:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   2716a:	4c 8b 5b e8          	mov    r11,QWORD PTR [rbx-0x18]
   2716e:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27172:	4c 8b 53 e0          	mov    r10,QWORD PTR [rbx-0x20]
   27176:	41 89 fe             	mov    r14d,edi
   27179:	4c 89 de             	mov    rsi,r11
   2717c:	48 89 f9             	mov    rcx,rdi
   2717f:	45 09 de             	or     r14d,r11d
   27182:	4c 89 c0             	mov    rax,r8
   27185:	0f 85 3b 4b 00 00    	jne    2bcc6 <JS_CallInternal+0x9126>
   2718b:	49 63 ca             	movsxd rcx,r10d
   2718e:	49 63 f0             	movsxd rsi,r8d
   27191:	44 01 d0             	add    eax,r10d
   27194:	48 01 f1             	add    rcx,rsi
   27197:	48 63 d0             	movsxd rdx,eax
   2719a:	48 39 ca             	cmp    rdx,rcx
   2719d:	0f 85 cd 49 00 00    	jne    2bb70 <JS_CallInternal+0x8fd0>
   271a3:	89 c0                	mov    eax,eax
   271a5:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   271a9:	31 c0                	xor    eax,eax
   271ab:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   271af:	48 83 eb 10          	sub    rbx,0x10
   271b3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   271b8:	49 83 c4 01          	add    r12,0x1
   271bc:	49 89 c5             	mov    r13,rax
   271bf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   271c3:	ff e0                	jmp    rax
   271c5:	f3 0f 1e fa          	endbr64
   271c9:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
   271ce:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   271d5:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   271da:	45 31 c9             	xor    r9d,r9d
   271dd:	89 fa                	mov    edx,edi
   271df:	89 f8                	mov    eax,edi
   271e1:	4c 89 69 30          	mov    QWORD PTR [rcx+0x30],r13
   271e5:	c1 fa 02             	sar    edx,0x2
   271e8:	83 e0 03             	and    eax,0x3
   271eb:	83 e2 07             	and    edx,0x7
   271ee:	f7 d0                	not    eax
   271f0:	f7 d2                	not    edx
   271f2:	48 98                	cdqe
   271f4:	48 63 d2             	movsxd rdx,edx
   271f7:	48 c1 e0 04          	shl    rax,0x4
   271fb:	48 c1 e2 04          	shl    rdx,0x4
   271ff:	48 01 d8             	add    rax,rbx
   27202:	48 01 da             	add    rdx,rbx
   27205:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   27208:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   2720b:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   2720f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27213:	89 f8                	mov    eax,edi
   27215:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2721c:	c1 f8 05             	sar    eax,0x5
   2721f:	f7 d0                	not    eax
   27221:	48 98                	cdqe
   27223:	48 c1 e0 04          	shl    rax,0x4
   27227:	ff 74 03 08          	push   QWORD PTR [rbx+rax*1+0x8]
   2722b:	ff 34 03             	push   QWORD PTR [rbx+rax*1]
   2722e:	e8 4d 45 06 00       	call   8b780 <JS_CopyDataProperties>
