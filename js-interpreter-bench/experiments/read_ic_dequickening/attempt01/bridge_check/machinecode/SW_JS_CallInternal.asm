
/home/mzyx/read_ic_dequickening_attempt01/SW/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000022ba0 <JS_CallInternal>:
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17779
   22ba0:	55                   	push   rbp
   22ba1:	48 89 e5             	mov    rbp,rsp
   22ba4:	41 57                	push   r15
   22ba6:	41 56                	push   r14
   22ba8:	41 55                	push   r13
   22baa:	41 54                	push   r12
   22bac:	53                   	push   rbx
   22bad:	48 81 ec 48 02 00 00 	sub    rsp,0x248
   22bb4:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   22bb8:	48 89 bd a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rdi
   22bbf:	48 89 b5 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rsi
   22bc6:	48 89 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],rax
   22bcd:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   22bd1:	48 89 95 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rdx
   22bd8:	48 89 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],rax
   22bdf:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   22be3:	48 89 8d 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],rcx
   22bea:	4c 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],r8
   22bf1:	44 89 8d bc fe ff ff 	mov    DWORD PTR [rbp-0x144],r9d
   22bf8:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17780
   22bff:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
   22c06:	00 00 
   22c08:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   22c0c:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   22c10:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   22c17:	8b 87 a8 01 00 00    	mov    eax,DWORD PTR [rdi+0x1a8]
   22c1d:	89 85 e8 fe ff ff    	mov    DWORD PTR [rbp-0x118],eax
   22c23:	83 e8 01             	sub    eax,0x1
   22c26:	89 87 a8 01 00 00    	mov    DWORD PTR [rdi+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   22c2c:	85 c0                	test   eax,eax
   22c2e:	0f 8e 54 05 00 00    	jle    23188 <JS_CallInternal+0x5e8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17819 (discriminator 1)
   22c34:	83 bd d0 fe ff ff ff 	cmp    DWORD PTR [rbp-0x130],0xffffffff
   22c3b:	0f 85 7f 05 00 00    	jne    231c0 <JS_CallInternal+0x620>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17846
   22c41:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22c48:	0f b7 40 12          	movzx  eax,WORD PTR [rax+0x12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17846 (discriminator 1)
   22c4c:	66 83 f8 0d          	cmp    ax,0xd
   22c50:	0f 85 99 07 00 00    	jne    233ef <JS_CallInternal+0x84f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17856
   22c56:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22c5d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
   22c61:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17858
   22c68:	0f b7 78 38          	movzx  edi,WORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17858 (discriminator 1)
   22c6c:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   22c72:	39 c7                	cmp    edi,eax
   22c74:	0f 8f fc 01 00 00    	jg     22e76 <JS_CallInternal+0x2d6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17859
   22c7a:	8b 45 28             	mov    eax,DWORD PTR [rbp+0x28]
   22c7d:	83 e0 02             	and    eax,0x2
   22c80:	0f 45 c7             	cmovne eax,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17864
   22c83:	48 8b 95 d8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17867 (discriminator 1)
   22c8a:	4c 8b bd c0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x140]
js_check_stack_overflow():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2072 (discriminator 1)
   22c91:	49 89 e8             	mov    r8,rbp
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17864
   22c94:	44 0f b7 52 3a       	movzx  r10d,WORD PTR [rdx+0x3a]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17865
   22c99:	0f b7 72 3e          	movzx  esi,WORD PTR [rdx+0x3e]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17866
   22c9d:	0f b7 52 40          	movzx  edx,WORD PTR [rdx+0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17865
   22ca1:	89 f1                	mov    ecx,esi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17864
   22ca3:	44 01 d6             	add    esi,r10d
   22ca6:	4c 89 d3             	mov    rbx,r10
   22ca9:	01 c6                	add    esi,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17866
   22cab:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17864
   22cae:	48 63 f6             	movsxd rsi,esi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17865
   22cb1:	48 8d 34 72          	lea    rsi,[rdx+rsi*2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17864
   22cb5:	48 c1 e6 03          	shl    rsi,0x3
js_check_stack_overflow():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2072 (discriminator 1)
   22cb9:	49 29 f0             	sub    r8,rsi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17867 (discriminator 1)
   22cbc:	4d 3b 87 d0 04 00 00 	cmp    r8,QWORD PTR [r15+0x4d0]
   22cc3:	0f 82 d0 07 00 00    	jb     23499 <JS_CallInternal+0x8f9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17870
   22cc9:	4c 8b bd d8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17873
   22cd0:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17876
   22cd7:	48 83 c6 17          	add    rsi,0x17
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17870
   22cdb:	45 0f b6 47 10       	movzx  r8d,BYTE PTR [r15+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17872
   22ce0:	44 8b bd bc fe ff ff 	mov    r15d,DWORD PTR [rbp-0x144]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17873
   22ce7:	4c 89 9d 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],r11
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17874
   22cee:	4d 8b 5b 30          	mov    r11,QWORD PTR [r11+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17870
   22cf2:	44 89 85 3c ff ff ff 	mov    DWORD PTR [rbp-0xc4],r8d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17876
   22cf9:	49 89 f0             	mov    r8,rsi
   22cfc:	48 81 e6 00 f0 ff ff 	and    rsi,0xfffffffffffff000
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17872
   22d03:	44 89 bd 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r15d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17873
   22d0a:	4c 8b bd d0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x130]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17876
   22d11:	49 83 e0 f0          	and    r8,0xfffffffffffffff0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17874
   22d15:	4c 89 9d 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],r11
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17876
   22d1c:	49 89 e3             	mov    r11,rsp
   22d1f:	49 29 f3             	sub    r11,rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17873
   22d22:	4c 89 bd 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],r15
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17876
   22d29:	4c 39 dc             	cmp    rsp,r11
   22d2c:	74 15                	je     22d43 <JS_CallInternal+0x1a3>
   22d2e:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
   22d35:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
   22d3c:	00 00 
   22d3e:	4c 39 dc             	cmp    rsp,r11
   22d41:	75 eb                	jne    22d2e <JS_CallInternal+0x18e>
   22d43:	41 81 e0 ff 0f 00 00 	and    r8d,0xfff
   22d4a:	4c 29 c4             	sub    rsp,r8
   22d4d:	4d 85 c0             	test   r8,r8
   22d50:	74 06                	je     22d58 <JS_CallInternal+0x1b8>
   22d52:	4a 83 4c 04 f8 00    	or     QWORD PTR [rsp+r8*1-0x8],0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17871
   22d58:	48 8b b5 a8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x158]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17876
   22d5f:	4c 8d 5c 24 0f       	lea    r11,[rsp+0xf]
   22d64:	49 83 e3 f0          	and    r11,0xfffffffffffffff0
   22d68:	4c 89 9d 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r11
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17871
   22d6f:	48 89 b5 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17877 (discriminator 1)
   22d76:	85 c0                	test   eax,eax
   22d78:	0f 85 74 61 00 00    	jne    28ef2 <JS_CallInternal+0x6352>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17886
   22d7e:	48 98                	cdqe
   22d80:	48 c1 e0 04          	shl    rax,0x4
   22d84:	4c 01 d8             	add    rax,r11
   22d87:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17887
   22d8e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17888
   22d95:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   22d9c:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17890 (discriminator 1)
   22da3:	45 85 d2             	test   r10d,r10d
   22da6:	74 30                	je     22dd8 <JS_CallInternal+0x238>
   22da8:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   22daf:	48 89 de             	mov    rsi,rbx
   22db2:	48 c1 e6 04          	shl    rsi,0x4
   22db6:	48 89 f8             	mov    rax,rdi
   22db9:	48 01 fe             	add    rsi,rdi
   22dbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17891
   22dc0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17890 (discriminator 1)
   22dc7:	48 83 c0 10          	add    rax,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17891
   22dcb:	48 c7 40 f8 03 00 00 	mov    QWORD PTR [rax-0x8],0x3
   22dd2:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17890 (discriminator 1)
   22dd3:	48 39 f0             	cmp    rax,rsi
   22dd6:	75 e8                	jne    22dc0 <JS_CallInternal+0x220>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17894
   22dd8:	0f b7 f9             	movzx  edi,cx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17893
   22ddb:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   22de2:	48 c1 e3 04          	shl    rbx,0x4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17894
   22de6:	48 89 f9             	mov    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17893
   22de9:	48 01 c3             	add    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17894
   22dec:	48 c1 e1 04          	shl    rcx,0x4
   22df0:	48 8d 3c 0b          	lea    rdi,[rbx+rcx*1]
   22df4:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17895 (discriminator 1)
   22dfb:	66 45 85 c9          	test   r9w,r9w
   22dff:	74 0b                	je     22e0c <JS_CallInternal+0x26c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17896
   22e01:	48 c1 e2 03          	shl    rdx,0x3
   22e05:	31 f6                	xor    esi,esi
   22e07:	e8 b4 ec fe ff       	call   11ac0 <memset@plt>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17898
   22e0c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17899
   22e13:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17893
   22e1a:	48 89 9d 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17898
   22e21:	48 8b 41 18          	mov    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17901
   22e25:	48 8b 49 48          	mov    rcx,QWORD PTR [rcx+0x48]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17899
   22e29:	48 8b 97 f0 04 00 00 	mov    rdx,QWORD PTR [rdi+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17901
   22e30:	48 89 8d e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17845
   22e37:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17899
   22e3e:	48 89 95 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17900
   22e45:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
   22e4c:	48 89 97 f0 04 00 00 	mov    QWORD PTR [rdi+0x4f0],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17845
   22e53:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17784
   22e5a:	48 89 95 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17908
   22e61:	4c 8d 60 01          	lea    r12,[rax+0x1]
   22e65:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   22e68:	4c 8d 3d 11 cf 0d 00 	lea    r15,[rip+0xdcf11]        # ffd80 <dispatch_table.85>
   22e6f:	49 89 c5             	mov    r13,rax
   22e72:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17859
   22e76:	89 f8                	mov    eax,edi
   22e78:	e9 06 fe ff ff       	jmp    22c83 <JS_CallInternal+0xe3>
   22e7d:	f3 0f 1e fa          	endbr64
   22e81:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   22e88:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17931
   22e8c:	41 8d 85 4d ff ff ff 	lea    eax,[r13-0xb3]
   22e93:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   22e9a:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17932
   22e9b:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17931
   22e9f:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   22ea3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17932
   22ea7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   22ead:	49 89 c5             	mov    r13,rax
   22eb0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   22eb4:	ff e0                	jmp    rax
   22eb6:	f3 0f 1e fa          	endbr64
   22eba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   22ec0:	f3 0f 1e fa          	endbr64
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   22ec4:	41 8b 44 24 04       	mov    eax,DWORD PTR [r12+0x4]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20538
   22ec9:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20535
   22ece:	4d 8d 74 24 09       	lea    r14,[r12+0x9]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   22ed3:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20539
   22ed7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   22ede:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20534
   22ee4:	41 0f b6 44 24 08    	movzx  eax,BYTE PTR [r12+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20538
   22eea:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20539
   22ef1:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20534
   22ef8:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20536
   22efe:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   22f05:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20539
   22f0b:	49 89 d4             	mov    r12,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20536
   22f0e:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20539
   22f12:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   22f19:	48 89 c6             	mov    rsi,rax
   22f1c:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
   22f23:	e8 b8 b3 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20540 (discriminator 1)
   22f28:	85 c0                	test   eax,eax
   22f2a:	0f 88 76 07 00 00    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20542
   22f30:	0f 84 cd 60 00 00    	je     29003 <JS_CallInternal+0x6463>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20543
   22f36:	80 bd 40 fe ff ff 00 	cmp    BYTE PTR [rbp-0x1c0],0x0
   22f3d:	0f 85 d9 05 00 00    	jne    2351c <JS_CallInternal+0x97c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20550
   22f43:	41 83 ed 71          	sub    r13d,0x71
   22f47:	41 83 fd 04          	cmp    r13d,0x4
   22f4b:	0f 87 20 05 00 00    	ja     23471 <JS_CallInternal+0x8d1>
   22f51:	48 8d 15 b8 41 0b 00 	lea    rdx,[rip+0xb41b8]        # d7110 <qjsc_repl_size+0x444>
   22f58:	4a 63 04 aa          	movsxd rax,DWORD PTR [rdx+r13*4]
   22f5c:	48 01 d0             	add    rax,rdx
   22f5f:	3e ff e0             	notrack jmp rax
   22f62:	f3 0f 1e fa          	endbr64
   22f66:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18210
   22f6a:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18209
   22f71:	45 8d 95 14 ff ff ff 	lea    r10d,[r13-0xec]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18219
   22f78:	4d 63 da             	movsxd r11,r10d
   22f7b:	49 89 de             	mov    r14,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18220
   22f7e:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18221
   22f85:	45 89 d1             	mov    r9d,r10d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18219
   22f88:	49 c1 e3 04          	shl    r11,0x4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18220
   22f8c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18221
   22f93:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22f9a:	41 b8 03 00 00 00    	mov    r8d,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18219
   22fa0:	4d 29 de             	sub    r14,r11
   22fa3:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18221
   22faa:	49 8b 76 f0          	mov    rsi,QWORD PTR [r14-0x10]
   22fae:	49 8b 56 f8          	mov    rdx,QWORD PTR [r14-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18220
   22fb2:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18221
   22fb6:	31 c9                	xor    ecx,ecx
   22fb8:	6a 00                	push   0x0
   22fba:	4d 8d 66 f0          	lea    r12,[r14-0x10]
   22fbe:	41 56                	push   r14
   22fc0:	6a 03                	push   0x3
   22fc2:	6a 00                	push   0x0
   22fc4:	44 89 95 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r10d
   22fcb:	e8 d0 fb ff ff       	call   22ba0 <JS_CallInternal>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18223 (discriminator 2)
   22fd0:	48 83 c4 20          	add    rsp,0x20
   22fd4:	44 8b 95 40 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c0]
   22fdb:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   22fe2:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18221
   22fe5:	49 89 c1             	mov    r9,rax
   22fe8:	49 89 d0             	mov    r8,rdx
   22feb:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18223 (discriminator 2)
   22fee:	0f 84 12 65 00 00    	je     29506 <JS_CallInternal+0x6966>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18225
   22ff4:	41 83 fd 23          	cmp    r13d,0x23
   22ff8:	0f 84 95 02 00 00    	je     23293 <JS_CallInternal+0x6f3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18227 (discriminator 1)
   22ffe:	4d 01 de             	add    r14,r11
   23001:	45 85 d2             	test   r10d,r10d
   23004:	78 77                	js     2307d <JS_CallInternal+0x4dd>
   23006:	4d 89 e5             	mov    r13,r12
   23009:	4d 89 f0             	mov    r8,r14
   2300c:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
   23013:	45 89 d4             	mov    r12d,r10d
   23016:	49 89 c6             	mov    r14,rax
   23019:	eb 0e                	jmp    23029 <JS_CallInternal+0x489>
   2301b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   23020:	49 83 c5 10          	add    r13,0x10
   23024:	4d 39 c5             	cmp    r13,r8
   23027:	74 47                	je     23070 <JS_CallInternal+0x4d0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18228
   23029:	49 8b 4d 08          	mov    rcx,QWORD PTR [r13+0x8]
   2302d:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23031:	83 f9 f6             	cmp    ecx,0xfffffff6
   23034:	76 ea                	jbe    23020 <JS_CallInternal+0x480>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23036:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23039:	8d 50 ff             	lea    edx,[rax-0x1]
   2303c:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2303f:	85 d2                	test   edx,edx
   23041:	7f dd                	jg     23020 <JS_CallInternal+0x480>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   23043:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2304a:	48 89 ca             	mov    rdx,rcx
   2304d:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18227 (discriminator 1)
   23054:	49 83 c5 10          	add    r13,0x10
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   23058:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2305c:	e8 bf 98 ff ff       	call   1c920 <__JS_FreeValueRT>
   23061:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18227 (discriminator 1)
   23068:	4d 39 c5             	cmp    r13,r8
   2306b:	75 bc                	jne    23029 <JS_CallInternal+0x489>
   2306d:	0f 1f 00             	nop    DWORD PTR [rax]
   23070:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23077:	45 89 e2             	mov    r10d,r12d
   2307a:	4d 89 f1             	mov    r9,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18229
   2307d:	41 8d 42 01          	lea    eax,[r10+0x1]
   23081:	48 98                	cdqe
   23083:	48 c1 e0 04          	shl    rax,0x4
   23087:	48 89 c2             	mov    rdx,rax
   2308a:	48 89 d8             	mov    rax,rbx
   2308d:	48 29 d0             	sub    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18230
   23090:	4c 89 08             	mov    QWORD PTR [rax],r9
   23093:	48 8d 58 10          	lea    rbx,[rax+0x10]
   23097:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18232
   2309b:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   230a2:	4c 8d 60 01          	lea    r12,[rax+0x1]
   230a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   230a9:	49 89 c5             	mov    r13,rax
   230ac:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   230b0:	f3 0f 1e fa          	endbr64
   230b4:	f3 0f 1e fa          	endbr64
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   230b8:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5856
   230bc:	31 f6                	xor    esi,esi
   230be:	b9 01 00 00 00       	mov    ecx,0x1
   230c3:	ba 02 00 00 00       	mov    edx,0x2
   230c8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   230cf:	45 0f b7 74 24 04    	movzx  r14d,WORD PTR [r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   230d5:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18817
   230db:	49 8d 44 24 06       	lea    rax,[r12+0x6]
   230e0:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18818
   230e7:	48 8d 43 10          	lea    rax,[rbx+0x10]
   230eb:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5856
   230f2:	e8 c9 39 02 00       	call   46ac0 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18818
   230f7:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18819 (discriminator 2)
   230fb:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18818
   230ff:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18819 (discriminator 2)
   23102:	0f 84 23 02 00 00    	je     2332b <JS_CallInternal+0x78b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18821
   23108:	41 83 fd 78          	cmp    r13d,0x78
   2310c:	0f 85 ed 01 00 00    	jne    232ff <JS_CallInternal+0x75f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18822
   23112:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   23119:	4e 8b 2c f0          	mov    r13,QWORD PTR [rax+r14*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18823 (discriminator 1)
   2311d:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18829
   23122:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   23125:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   2312b:	b9 22 00 00 00       	mov    ecx,0x22
   23130:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23137:	e8 34 31 02 00       	call   46270 <add_property>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18831
   2313c:	48 85 c0             	test   rax,rax
   2313f:	0f 84 ef 8f 00 00    	je     2c134 <JS_CallInternal+0x9594>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18835
   23145:	4c 89 28             	mov    QWORD PTR [rax],r13
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3642
   23148:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
   2314e:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18836
   23150:	48 83 c3 20          	add    rbx,0x20
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3642
   23154:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18838
   2315b:	49 83 c4 07          	add    r12,0x7
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3642
   2315f:	e8 dc 0f 01 00       	call   34140 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18836
   23164:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2316b:	48 89 01             	mov    QWORD PTR [rcx],rax
   2316e:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18838
   23172:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23178:	49 89 c5             	mov    r13,rax
   2317b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2317f:	ff e0                	jmp    rax
   23181:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   23188:	e8 43 01 01 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17817 (discriminator 1)
   2318d:	85 c0                	test   eax,eax
   2318f:	0f 84 9f fa ff ff    	je     22c34 <JS_CallInternal+0x94>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17818
   23195:	31 c0                	xor    eax,eax
   23197:	ba 06 00 00 00       	mov    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20743
   2319c:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   231a0:	64 48 2b 0c 25 28 00 	sub    rcx,QWORD PTR fs:0x28
   231a7:	00 00 
   231a9:	0f 85 ce 9c 00 00    	jne    2ce7d <JS_CallInternal+0xa2dd>
   231af:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
   231b3:	5b                   	pop    rbx
   231b4:	41 5c                	pop    r12
   231b6:	41 5d                	pop    r13
   231b8:	41 5e                	pop    r14
   231ba:	41 5f                	pop    r15
   231bc:	5d                   	pop    rbp
   231bd:	c3                   	ret
   231be:	66 90                	xchg   ax,ax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17820
   231c0:	f6 45 28 04          	test   BYTE PTR [rbp+0x28],0x4
   231c4:	0f 84 d6 03 00 00    	je     235a0 <JS_CallInternal+0xa00>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17824
   231ca:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17825
   231d1:	48 8b 48 58          	mov    rcx,QWORD PTR [rax+0x58]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17829
   231d5:	48 8b 50 68          	mov    rdx,QWORD PTR [rax+0x68]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17824
   231d9:	48 8d 78 50          	lea    rdi,[rax+0x50]
   231dd:	48 89 bd c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17826
   231e4:	48 8b 59 28          	mov    rbx,QWORD PTR [rcx+0x28]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17825
   231e8:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17828
   231ef:	48 8b 49 30          	mov    rcx,QWORD PTR [rcx+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17829
   231f3:	48 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17827
   231fa:	48 8b 73 48          	mov    rsi,QWORD PTR [rbx+0x48]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17826
   231fe:	48 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17828
   23205:	48 89 8d 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17830
   2320c:	48 89 c1             	mov    rcx,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17827
   2320f:	48 89 b5 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17830
   23216:	48 8b 70 70          	mov    rsi,QWORD PTR [rax+0x70]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17831
   2321a:	0f b7 43 3a          	movzx  eax,WORD PTR [rbx+0x3a]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17834
   2321e:	4c 8b a1 80 00 00 00 	mov    r12,QWORD PTR [rcx+0x80]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17830
   23225:	48 89 b5 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17832
   2322c:	48 8b 99 90 00 00 00 	mov    rbx,QWORD PTR [rcx+0x90]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17833
   23233:	48 c7 81 90 00 00 00 	mov    QWORD PTR [rcx+0x90],0x0
   2323a:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17831
   2323e:	48 c1 e0 04          	shl    rax,0x4
   23242:	48 01 f0             	add    rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17835
   23245:	48 8b b5 c0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17831
   2324c:	48 89 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17835
   23253:	48 8b 86 f0 04 00 00 	mov    rax,QWORD PTR [rsi+0x4f0]
   2325a:	48 89 41 50          	mov    QWORD PTR [rcx+0x50],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17836
   2325e:	48 89 be f0 04 00 00 	mov    QWORD PTR [rsi+0x4f0],rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17837
   23265:	8b 79 24             	mov    edi,DWORD PTR [rcx+0x24]
   23268:	85 ff                	test   edi,edi
   2326a:	0f 84 9d 02 00 00    	je     2350d <JS_CallInternal+0x96d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17829
   23270:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
   23277:	48 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rax
   2327e:	e9 bd 00 00 00       	jmp    23340 <JS_CallInternal+0x7a0>
   23283:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18297
   23287:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2328b:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2328f:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20732 (discriminator 1)
   23293:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   2329a:	66 83 7f 40 00       	cmp    WORD PTR [rdi+0x40],0x0
   2329f:	0f 85 3b 6f 00 00    	jne    2a1e0 <JS_CallInternal+0x7640>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20737 (discriminator 1)
   232a5:	4c 8b a5 30 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d0]
   232ac:	49 39 dc             	cmp    r12,rbx
   232af:	0f 83 1a 01 00 00    	jae    233cf <JS_CallInternal+0x82f>
   232b5:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   232bc:	49 89 c6             	mov    r14,rax
   232bf:	49 89 cf             	mov    r15,rcx
   232c2:	eb 11                	jmp    232d5 <JS_CallInternal+0x735>
   232c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20737 (discriminator 3)
   232c8:	49 83 c4 10          	add    r12,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20737 (discriminator 1)
   232cc:	49 39 dc             	cmp    r12,rbx
   232cf:	0f 83 b9 01 00 00    	jae    2348e <JS_CallInternal+0x8ee>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20738
   232d5:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
   232da:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   232de:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   232e2:	76 e4                	jbe    232c8 <JS_CallInternal+0x728>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   232e4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   232e7:	8d 50 ff             	lea    edx,[rax-0x1]
   232ea:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   232ed:	85 d2                	test   edx,edx
   232ef:	7f d7                	jg     232c8 <JS_CallInternal+0x728>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   232f1:	49 8b 7d 10          	mov    rdi,QWORD PTR [r13+0x10]
   232f5:	4c 89 c2             	mov    rdx,r8
   232f8:	e8 23 96 ff ff       	call   1c920 <__JS_FreeValueRT>
   232fd:	eb c9                	jmp    232c8 <JS_CallInternal+0x728>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18825
   232ff:	31 c9                	xor    ecx,ecx
   23301:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   23308:	41 83 fd 77          	cmp    r13d,0x77
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18816 (discriminator 1)
   2330c:	41 0f b7 d6          	movzx  edx,r14w
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18825
   23310:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23317:	0f 94 c1             	sete   cl
   2331a:	e8 01 88 02 00       	call   4bb20 <get_var_ref>
   2331f:	49 89 c5             	mov    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18826
   23322:	48 85 c0             	test   rax,rax
   23325:	0f 85 f7 fd ff ff    	jne    23122 <JS_CallInternal+0x582>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18818
   2332b:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18817
   23332:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
   23339:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20695
   23340:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
is_backtrace_needed():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7653
   23347:	83 b9 e0 04 00 00 ff 	cmp    DWORD PTR [rcx+0x4e0],0xffffffff
   2334e:	48 8b 81 d8 04 00 00 	mov    rax,QWORD PTR [rcx+0x4d8]
   23355:	75 39                	jne    23390 <JS_CallInternal+0x7f0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7656
   23357:	66 83 78 12 03       	cmp    WORD PTR [rax+0x12],0x3
   2335c:	75 32                	jne    23390 <JS_CallInternal+0x7f0>
find_own_property1():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6139
   2335e:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6140
   23362:	8b 51 18             	mov    edx,DWORD PTR [rcx+0x18]
   23365:	89 d0                	mov    eax,edx
   23367:	83 e0 39             	and    eax,0x39
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6141
   2336a:	8b 44 81 38          	mov    eax,DWORD PTR [rcx+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6143
   2336e:	48 85 c0             	test   rax,rax
   23371:	0f 84 6b 68 00 00    	je     29be2 <JS_CallInternal+0x7042>
   23377:	48 8d 14 95 34 00 00 	lea    rdx,[rdx*4+0x34]
   2337e:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6144
   2337f:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
   23383:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6145 (discriminator 1)
   23386:	83 78 04 39          	cmp    DWORD PTR [rax+0x4],0x39
   2338a:	0f 85 45 68 00 00    	jne    29bd5 <JS_CallInternal+0x7035>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20702
   23390:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   23397:	80 b8 e8 04 00 00 00 	cmp    BYTE PTR [rax+0x4e8],0x0
   2339e:	0f 84 39 01 00 00    	je     234dd <JS_CallInternal+0x93d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20726
   233a4:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20722
   233ab:	b9 06 00 00 00       	mov    ecx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20726
   233b0:	f6 40 11 30          	test   BYTE PTR [rax+0x11],0x30
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20722
   233b4:	b8 00 00 00 00       	mov    eax,0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20726
   233b9:	0f 84 d4 fe ff ff    	je     23293 <JS_CallInternal+0x6f3>
   233bf:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20728
   233c0:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   233c7:	4c 89 67 30          	mov    QWORD PTR [rdi+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20729
   233cb:	48 89 5f 40          	mov    QWORD PTR [rdi+0x40],rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20741
   233cf:	48 8b 9d c8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x138]
   233d6:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   233d9:	48 8b 9d c0 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x140]
   233e0:	48 89 93 f0 04 00 00 	mov    QWORD PTR [rbx+0x4f0],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20742
   233e7:	48 89 ca             	mov    rdx,rcx
   233ea:	e9 ad fd ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17848
   233ef:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   233f6:	48 8d 04 80          	lea    rax,[rax+rax*4]
   233fa:	48 c1 e0 03          	shl    rax,0x3
   233fe:	48 03 81 58 04 00 00 	add    rax,QWORD PTR [rcx+0x458]
   23405:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17849
   23409:	48 85 c0             	test   rax,rax
   2340c:	0f 84 8e 01 00 00    	je     235a0 <JS_CallInternal+0xa00>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17853
   23412:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
   23415:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
   2341c:	44 8b 8d bc fe ff ff 	mov    r9d,DWORD PTR [rbp-0x144]
   23423:	4c 8b 85 88 fe ff ff 	mov    r8,QWORD PTR [rbp-0x178]
   2342a:	48 8b 95 d0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x130]
   23431:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   23438:	51                   	push   rcx
   23439:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
   23440:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
   23446:	ff d0                	call   rax
   23448:	59                   	pop    rcx
   23449:	5e                   	pop    rsi
   2344a:	e9 4d fd ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3642
   2344f:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   23455:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2345c:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20596
   2345e:	4c 8d 63 10          	lea    r12,[rbx+0x10]
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3642
   23462:	e8 d9 0c 01 00       	call   34140 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20596
   23467:	48 89 03             	mov    QWORD PTR [rbx],rax
   2346a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   2346e:	4c 89 e3             	mov    rbx,r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20614
   23471:	8b 85 28 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1d8]
   23477:	83 e8 05             	sub    eax,0x5
   2347a:	48 98                	cdqe
   2347c:	49 01 c6             	add    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20622
   2347f:	41 0f b6 06          	movzx  eax,BYTE PTR [r14]
   23483:	4d 8d 66 01          	lea    r12,[r14+0x1]
   23487:	49 89 c5             	mov    r13,rax
   2348a:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2348e:	4c 89 f0             	mov    rax,r14
   23491:	4c 89 f9             	mov    rcx,r15
   23494:	e9 36 ff ff ff       	jmp    233cf <JS_CallInternal+0x82f>
JS_ThrowStackOverflow():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7821
   23499:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   234a0:	48 8d 35 15 a0 0a 00 	lea    rsi,[rip+0xaa015]        # cd4bc <_IO_stdin_used+0x4bc>
   234a7:	31 c0                	xor    eax,eax
   234a9:	e8 a2 fc 00 00       	call   33150 <JS_ThrowInternalError>
   234ae:	e9 e9 fc ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   234b3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   234ba:	4c 89 ee             	mov    rsi,r13
   234bd:	4c 89 f2             	mov    rdx,r14
   234c0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   234c4:	e8 57 94 ff ff       	call   1c920 <__JS_FreeValueRT>
   234c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20706
   234d0:	41 83 fe 05          	cmp    r14d,0x5
   234d4:	0f 84 ec 61 00 00    	je     296c6 <JS_CallInternal+0x6b26>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20704
   234da:	4c 89 fb             	mov    rbx,r15
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20703
   234dd:	48 39 9d 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],rbx
   234e4:	0f 83 ba fe ff ff    	jae    233a4 <JS_CallInternal+0x804>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20704
   234ea:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   234ee:	4c 8d 7b f0          	lea    r15,[rbx-0x10]
   234f2:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   234f6:	41 83 fe f6          	cmp    r14d,0xfffffff6
   234fa:	76 d4                	jbe    234d0 <JS_CallInternal+0x930>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   234fc:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   23500:	83 e8 01             	sub    eax,0x1
   23503:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   23507:	85 c0                	test   eax,eax
   23509:	7f c5                	jg     234d0 <JS_CallInternal+0x930>
   2350b:	eb a6                	jmp    234b3 <JS_CallInternal+0x913>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17829
   2350d:	48 89 95 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17834
   23514:	4c 89 e0             	mov    rax,r12
   23517:	e9 45 f9 ff ff       	jmp    22e61 <JS_CallInternal+0x2c1>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   2351c:	48 83 ec 08          	sub    rsp,0x8
   23520:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   23527:	48 8b b5 10 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1f0]
   2352e:	b9 f1 00 00 00       	mov    ecx,0xf1
   23533:	6a 00                	push   0x0
   23535:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2353c:	4c 89 e2             	mov    rdx,r12
   2353f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23546:	e8 b5 99 00 00       	call   2cf00 <JS_GetPropertyInternal>
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16024 (discriminator 1)
   2354b:	59                   	pop    rcx
   2354c:	5e                   	pop    rsi
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   2354d:	49 89 c0             	mov    r8,rax
   23550:	49 89 d4             	mov    r12,rdx
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16024 (discriminator 1)
   23553:	83 fa 06             	cmp    edx,0x6
   23556:	0f 84 4a 01 00 00    	je     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16027 (discriminator 1)
   2355c:	83 fa ff             	cmp    edx,0xffffffff
   2355f:	0f 84 3d 5a 00 00    	je     28fa2 <JS_CallInternal+0x6402>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23565:	83 fa f6             	cmp    edx,0xfffffff6
   23568:	0f 86 d5 f9 ff ff    	jbe    22f43 <JS_CallInternal+0x3a3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2356e:	8b 40 fc             	mov    eax,DWORD PTR [rax-0x4]
   23571:	83 e8 01             	sub    eax,0x1
   23574:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   23578:	85 c0                	test   eax,eax
   2357a:	0f 8f c3 f9 ff ff    	jg     22f43 <JS_CallInternal+0x3a3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   23580:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23587:	4c 89 c6             	mov    rsi,r8
   2358a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2358e:	e8 8d 93 ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20547
   23593:	e9 ab f9 ff ff       	jmp    22f43 <JS_CallInternal+0x3a3>
   23598:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2359f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17851
   235a0:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   235a7:	48 8d 35 01 b6 0a 00 	lea    rsi,[rip+0xab601]        # cebaf <_IO_stdin_used+0x1baf>
   235ae:	31 c0                	xor    eax,eax
   235b0:	e8 bb d7 00 00       	call   30d70 <JS_ThrowTypeError>
   235b5:	e9 e2 fb ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20601
   235ba:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   235c1:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   235c8:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   235ce:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   235d5:	48 89 c6             	mov    rsi,rax
   235d8:	49 89 c5             	mov    r13,rax
   235db:	49 89 d4             	mov    r12,rdx
   235de:	e8 fd ac 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20602 (discriminator 1)
   235e3:	85 c0                	test   eax,eax
   235e5:	0f 88 bb 00 00 00    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20605
   235eb:	b8 03 00 00 00       	mov    eax,0x3
   235f0:	b9 00 00 00 00       	mov    ecx,0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20604
   235f5:	0f 85 84 73 00 00    	jne    2a97f <JS_CallInternal+0x7ddf>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20611
   235fb:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   235fe:	48 83 c3 10          	add    rbx,0x10
   23602:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20612
   23606:	e9 66 fe ff ff       	jmp    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20571
   2360b:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23612:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23619:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2361f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23626:	48 89 c6             	mov    rsi,rax
   23629:	e8 b2 ac 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20572 (discriminator 1)
   2362e:	85 c0                	test   eax,eax
   23630:	0f 8e 78 88 00 00    	jle    2beae <JS_CallInternal+0x930e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20580
   23636:	48 83 ec 08          	sub    rsp,0x8
   2363a:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   2363e:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   23642:	4c 8d 63 e0          	lea    r12,[rbx-0x20]
   23646:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2364d:	4c 8b 9d 58 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1a8]
   23654:	68 00 80 00 00       	push   0x8000
   23659:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2365f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23666:	41 53                	push   r11
   23668:	4c 89 d6             	mov    rsi,r10
   2366b:	4c 89 da             	mov    rdx,r11
   2366e:	41 52                	push   r10
   23670:	e8 bb a5 00 00       	call   2dc30 <JS_SetPropertyInternal>
   23675:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23679:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2367d:	48 83 c4 20          	add    rsp,0x20
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20580
   23681:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23684:	83 fa f6             	cmp    edx,0xfffffff6
   23687:	76 11                	jbe    2369a <JS_CallInternal+0xafa>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23689:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2368c:	83 e8 01             	sub    eax,0x1
   2368f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23692:	85 c0                	test   eax,eax
   23694:	0f 8e 44 88 00 00    	jle    2bede <JS_CallInternal+0x933e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20583
   2369a:	4c 89 e3             	mov    rbx,r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20584 (discriminator 1)
   2369d:	45 85 ed             	test   r13d,r13d
   236a0:	0f 89 cb fd ff ff    	jns    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20535
   236a6:	4d 89 f4             	mov    r12,r14
   236a9:	e9 92 fc ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20553
   236ae:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   236b5:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   236bc:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   236c2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   236c9:	48 89 c6             	mov    rsi,rax
   236cc:	49 89 c5             	mov    r13,rax
   236cf:	49 89 d4             	mov    r12,rdx
   236d2:	e8 09 ac 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20554 (discriminator 1)
   236d7:	85 c0                	test   eax,eax
   236d9:	0f 8e 29 87 00 00    	jle    2be08 <JS_CallInternal+0x9268>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   236df:	48 83 ec 08          	sub    rsp,0x8
   236e3:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   236e9:	4c 89 ee             	mov    rsi,r13
   236ec:	4c 89 e2             	mov    rdx,r12
   236ef:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   236f6:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   236fd:	6a 00                	push   0x0
   236ff:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23706:	e8 f5 97 00 00       	call   2cf00 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20564 (discriminator 2)
   2370b:	41 59                	pop    r9
   2370d:	41 5a                	pop    r10
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   2370f:	48 89 c1             	mov    rcx,rax
   23712:	48 89 d0             	mov    rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20564 (discriminator 2)
   23715:	83 fa 06             	cmp    edx,0x6
   23718:	74 8c                	je     236a6 <JS_CallInternal+0xb06>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2371a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2371e:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   23722:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   23726:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2372a:	83 fa f6             	cmp    edx,0xfffffff6
   2372d:	0f 86 3e fd ff ff    	jbe    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23733:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23736:	83 e8 01             	sub    eax,0x1
   23739:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2373c:	85 c0                	test   eax,eax
   2373e:	0f 8f 2d fd ff ff    	jg     23471 <JS_CallInternal+0x8d1>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   23744:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2374b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2374f:	e8 cc 91 ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20568
   23754:	e9 18 fd ff ff       	jmp    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20588
   23759:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23760:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   23766:	45 31 c0             	xor    r8d,r8d
   23769:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23770:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23777:	48 89 c6             	mov    rsi,rax
   2377a:	e8 c1 7a 02 00       	call   4b240 <JS_DeleteProperty>
   2377f:	41 89 c4             	mov    r12d,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20589 (discriminator 1)
   23782:	85 c0                	test   eax,eax
   23784:	0f 88 1c ff ff ff    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20591
   2378a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2378e:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23792:	83 fa f6             	cmp    edx,0xfffffff6
   23795:	76 11                	jbe    237a8 <JS_CallInternal+0xc08>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23797:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2379a:	83 e8 01             	sub    eax,0x1
   2379d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   237a0:	85 c0                	test   eax,eax
   237a2:	0f 8e f1 89 00 00    	jle    2c199 <JS_CallInternal+0x95f9>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   237a8:	31 c0                	xor    eax,eax
   237aa:	45 85 e4             	test   r12d,r12d
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20592
   237ad:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   237b4:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   237b5:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20592
   237b8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20593
   237bc:	e9 b0 fc ff ff       	jmp    23471 <JS_CallInternal+0x8d1>
   237c1:	f3 0f 1e fa          	endbr64
   237c5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18527
   237c9:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   237ce:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18526
   237d5:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18527
   237da:	48 8b 14 c1          	mov    rdx,QWORD PTR [rcx+rax*8]
   237de:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
   237e5:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18528
   237e6:	48 8b 42 18          	mov    rax,QWORD PTR [rdx+0x18]
   237ea:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18528 (discriminator 2)
   237ee:	83 f9 04             	cmp    ecx,0x4
   237f1:	0f 84 39 62 00 00    	je     29a30 <JS_CallInternal+0x6e90>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18528 (discriminator 1)
   237f7:	80 7a 12 00          	cmp    BYTE PTR [rdx+0x12],0x0
   237fb:	0f 85 2f 62 00 00    	jne    29a30 <JS_CallInternal+0x6e90>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   23801:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   23806:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   23809:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2380c:	83 f9 f6             	cmp    ecx,0xfffffff6
   2380f:	76 11                	jbe    23822 <JS_CallInternal+0xc82>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23811:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23814:	83 e8 01             	sub    eax,0x1
   23817:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2381a:	85 c0                	test   eax,eax
   2381c:	0f 8e 8f 6a 00 00    	jle    2a2b1 <JS_CallInternal+0x7711>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18557
   23822:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18560
   23826:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2382c:	49 83 c4 03          	add    r12,0x3
   23830:	49 89 c5             	mov    r13,rax
   23833:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23837:	ff e0                	jmp    rax
   23839:	f3 0f 1e fa          	endbr64
   2383d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19421
   23841:	48 83 ec 08          	sub    rsp,0x8
   23845:	31 c0                	xor    eax,eax
   23847:	41 83 fd 54          	cmp    r13d,0x54
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19419
   2384b:	41 0f b6 4c 24 04    	movzx  ecx,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19421
   23851:	0f 94 c0             	sete   al
   23854:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   23858:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19420
   2385b:	4d 8d 74 24 05       	lea    r14,[r12+0x5]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19421
   23860:	4c 8b 8d c8 fe ff ff 	mov    r9,QWORD PTR [rbp-0x138]
   23867:	4c 8b 85 98 fe ff ff 	mov    r8,QWORD PTR [rbp-0x168]
   2386e:	50                   	push   rax
   2386f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23876:	e8 f5 58 06 00       	call   89170 <js_op_define_class>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19421 (discriminator 1)
   2387b:	41 59                	pop    r9
   2387d:	41 5a                	pop    r10
   2387f:	85 c0                	test   eax,eax
   23881:	0f 88 ef 85 00 00    	js     2be76 <JS_CallInternal+0x92d6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19426
   23887:	41 0f b6 44 24 05    	movzx  eax,BYTE PTR [r12+0x5]
   2388d:	49 83 c4 06          	add    r12,0x6
   23891:	49 89 c5             	mov    r13,rax
   23894:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23898:	ff e0                	jmp    rax
   2389a:	f3 0f 1e fa          	endbr64
   2389e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19365
   238a2:	41 83 fd 52          	cmp    r13d,0x52
   238a6:	0f 94 c0             	sete   al
   238a9:	41 0f 94 c6          	sete   r14b
   238ad:	0f b6 c0             	movzx  eax,al
   238b0:	89 85 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19366
   238b6:	45 84 f6             	test   r14b,r14b
   238b9:	0f 85 d9 5f 00 00    	jne    29898 <JS_CallInternal+0x6cf8>
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   238bf:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19373
   238c3:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   238c8:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19377
   238ce:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   238d4:	b8 fe ff ff ff       	mov    eax,0xfffffffe
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19375
   238d9:	41 0f b6 55 00       	movzx  edx,BYTE PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19384
   238de:	bf 03 00 00 00       	mov    edi,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19383
   238e3:	48 c7 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],0x0
   238ea:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   238ee:	4c 8d 63 f0          	lea    r12,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19377
   238f2:	29 c8                	sub    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19384
   238f4:	48 89 bd 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19377
   238fb:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19385
   238fd:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19383
   23904:	48 c7 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],0x3
   2390b:	03 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19377
   2390f:	48 c1 e0 04          	shl    rax,0x4
   23913:	48 8b 0c 03          	mov    rcx,QWORD PTR [rbx+rax*1]
   23917:	48 8b 44 03 08       	mov    rax,QWORD PTR [rbx+rax*1+0x8]
   2391c:	48 89 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19380
   23923:	89 d0                	mov    eax,edx
   23925:	83 e0 04             	and    eax,0x4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19377
   23928:	48 89 8d c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19378
   2392f:	3c 01                	cmp    al,0x1
   23931:	19 c0                	sbb    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19384
   23933:	31 f6                	xor    esi,esi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19378
   23935:	83 e0 fc             	and    eax,0xfffffffc
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19384
   23938:	48 89 b5 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19385
   2393f:	48 89 b5 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19378
   23946:	05 05 45 00 00       	add    eax,0x4505
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19386
   2394b:	83 e2 03             	and    edx,0x3
   2394e:	0f 85 65 57 00 00    	jne    290b9 <JS_CallInternal+0x6519>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19387
   23954:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19388
   23958:	0d 02 22 00 00       	or     eax,0x2202
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   2395d:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19388
   23963:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   23969:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19387
   23970:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
   23977:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2397b:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2397f:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   23986:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19396
   2398d:	48 89 8d d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rcx
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   23994:	e8 a7 ce 01 00       	call   40840 <js_get_function_name>
   23999:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5952 (discriminator 1)
   2399c:	41 83 f9 06          	cmp    r9d,0x6
   239a0:	0f 84 23 69 00 00    	je     2a2c9 <JS_CallInternal+0x7729>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5954
   239a6:	48 83 ec 08          	sub    rsp,0x8
   239aa:	49 89 c0             	mov    r8,rax
   239ad:	b9 3a 00 00 00       	mov    ecx,0x3a
   239b2:	48 8b 95 d0 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x230]
   239b9:	48 8b b5 d8 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x228]
   239c0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   239c7:	6a 01                	push   0x1
   239c9:	48 89 95 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],rdx
   239d0:	48 89 b5 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],rsi
   239d7:	e8 14 c5 00 00       	call   2fef0 <JS_DefinePropertyValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5954 (discriminator 1)
   239dc:	41 5b                	pop    r11
   239de:	5a                   	pop    rdx
   239df:	85 c0                	test   eax,eax
   239e1:	0f 88 e2 68 00 00    	js     2a2c9 <JS_CallInternal+0x7729>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5957
   239e7:	4c 8b 95 c8 fd ff ff 	mov    r10,QWORD PTR [rbp-0x238]
   239ee:	48 8b 85 c0 fd ff ff 	mov    rax,QWORD PTR [rbp-0x240]
   239f5:	48 8b b5 b0 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x250]
   239fc:	48 8b 95 b8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x248]
   23a03:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23a0a:	4c 89 d1             	mov    rcx,r10
   23a0d:	49 89 c0             	mov    r8,rax
   23a10:	4c 89 95 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],r10
   23a17:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   23a1e:	e8 7d a7 ff ff       	call   1e1a0 <js_method_set_home_object>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19398
   23a23:	8b 85 24 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1dc]
   23a29:	48 83 ec 08          	sub    rsp,0x8
   23a2d:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   23a33:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23a3a:	4c 8b 8d 28 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1d8]
   23a41:	48 8b b5 d0 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x230]
   23a48:	48 8b 95 d8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x228]
   23a4f:	50                   	push   rax
   23a50:	ff b5 e8 fd ff ff    	push   QWORD PTR [rbp-0x218]
   23a56:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23a5d:	ff b5 e0 fd ff ff    	push   QWORD PTR [rbp-0x220]
   23a63:	ff b5 18 fe ff ff    	push   QWORD PTR [rbp-0x1e8]
   23a69:	ff b5 10 fe ff ff    	push   QWORD PTR [rbp-0x1f0]
   23a6f:	e8 ec b5 00 00       	call   2f060 <JS_DefineProperty>
   23a74:	48 83 c4 30          	add    rsp,0x30
   23a78:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19401
   23a7a:	49 8b 54 24 08       	mov    rdx,QWORD PTR [r12+0x8]
   23a7f:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23a83:	83 fa f6             	cmp    edx,0xfffffff6
   23a86:	76 11                	jbe    23a99 <JS_CallInternal+0xef9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23a88:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23a8b:	83 e8 01             	sub    eax,0x1
   23a8e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23a91:	85 c0                	test   eax,eax
   23a93:	0f 8e f7 67 00 00    	jle    2a290 <JS_CallInternal+0x76f0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19402
   23a99:	45 84 f6             	test   r14b,r14b
   23a9c:	0f 85 f1 57 00 00    	jne    29293 <JS_CallInternal+0x66f3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19406
   23aa2:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19375
   23aa8:	4d 8d 65 01          	lea    r12,[r13+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19406
   23aac:	83 c0 01             	add    eax,0x1
   23aaf:	48 98                	cdqe
   23ab1:	48 c1 e0 04          	shl    rax,0x4
   23ab5:	48 29 c3             	sub    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19407 (discriminator 1)
   23ab8:	85 c9                	test   ecx,ecx
   23aba:	0f 88 80 f8 ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19410
   23ac0:	41 0f b6 45 01       	movzx  eax,BYTE PTR [r13+0x1]
   23ac5:	4d 8d 65 02          	lea    r12,[r13+0x2]
   23ac9:	49 89 c5             	mov    r13,rax
   23acc:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   23ad0:	f3 0f 1e fa          	endbr64
   23ad4:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   23ad8:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18255
   23add:	49 89 db             	mov    r11,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18254
   23ae0:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18257
   23ae5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18254
   23aec:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   23af3:	4c 89 c8             	mov    rax,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18253 (discriminator 1)
   23af6:	44 89 8d 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r9d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18255
   23afd:	48 c1 e0 04          	shl    rax,0x4
   23b01:	49 29 c3             	sub    r11,rax
   23b04:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18256
   23b0b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18257
   23b12:	49 8b 73 f0          	mov    rsi,QWORD PTR [r11-0x10]
   23b16:	49 8b 53 f8          	mov    rdx,QWORD PTR [r11-0x8]
   23b1a:	4d 8d 73 e0          	lea    r14,[r11-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18256
   23b1e:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18257
   23b22:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
   23b26:	49 8b 4b e0          	mov    rcx,QWORD PTR [r11-0x20]
   23b2a:	6a 00                	push   0x0
   23b2c:	41 53                	push   r11
   23b2e:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   23b35:	6a 03                	push   0x3
   23b37:	6a 00                	push   0x0
   23b39:	e8 62 f0 ff ff       	call   22ba0 <JS_CallInternal>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18259 (discriminator 2)
   23b3e:	48 83 c4 20          	add    rsp,0x20
   23b42:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   23b49:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   23b50:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18257
   23b53:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18259 (discriminator 2)
   23b56:	0f 84 15 68 00 00    	je     2a371 <JS_CallInternal+0x77d1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18261
   23b5c:	41 83 fd 25          	cmp    r13d,0x25
   23b60:	0f 84 2d f7 ff ff    	je     23293 <JS_CallInternal+0x6f3>
   23b66:	4f 8d 2c 13          	lea    r13,[r11+r10*1]
   23b6a:	48 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rbx
   23b71:	4c 89 f3             	mov    rbx,r14
   23b74:	49 89 d6             	mov    r14,rdx
   23b77:	4c 89 a5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r12
   23b7e:	4d 89 ec             	mov    r12,r13
   23b81:	49 89 c5             	mov    r13,rax
   23b84:	eb 17                	jmp    23b9d <JS_CallInternal+0xffd>
   23b86:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23b8d:	00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18263 (discriminator 1)
   23b90:	48 83 c3 10          	add    rbx,0x10
   23b94:	4c 39 e3             	cmp    rbx,r12
   23b97:	0f 84 a0 54 00 00    	je     2903d <JS_CallInternal+0x649d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18264
   23b9d:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   23ba1:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23ba4:	83 f9 f6             	cmp    ecx,0xfffffff6
   23ba7:	76 e7                	jbe    23b90 <JS_CallInternal+0xff0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23ba9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23bac:	8d 50 ff             	lea    edx,[rax-0x1]
   23baf:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   23bb2:	85 d2                	test   edx,edx
   23bb4:	7f da                	jg     23b90 <JS_CallInternal+0xff0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   23bb6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23bbd:	48 89 ca             	mov    rdx,rcx
   23bc0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23bc4:	e8 57 8d ff ff       	call   1c920 <__JS_FreeValueRT>
   23bc9:	eb c5                	jmp    23b90 <JS_CallInternal+0xff0>
   23bcb:	f3 0f 1e fa          	endbr64
   23bcf:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20633
   23bd3:	31 c9                	xor    ecx,ecx
   23bd5:	b8 02 00 00 00       	mov    eax,0x2
   23bda:	e9 e1 f7 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   23bdf:	f3 0f 1e fa          	endbr64
   23be3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20690
   23be7:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   23bee:	4c 89 e2             	mov    rdx,r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20689
   23bf1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23bf8:	44 89 e9             	mov    ecx,r13d
   23bfb:	48 8d 35 66 d2 0a 00 	lea    rsi,[rip+0xad266]        # d0e68 <_IO_stdin_used+0x3e68>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20690
   23c02:	48 2b 50 18          	sub    rdx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20689
   23c06:	31 c0                	xor    eax,eax
   23c08:	83 ea 01             	sub    edx,0x1
   23c0b:	e8 40 f5 00 00       	call   33150 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20691
   23c10:	e9 2b f7 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   23c15:	f3 0f 1e fa          	endbr64
   23c19:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18498
   23c1d:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23c22:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18497
   23c29:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18498
   23c2e:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   23c35:	00 
   23c36:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   23c3a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23c3e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   23c41:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18499 (discriminator 2)
   23c45:	83 f8 04             	cmp    eax,0x4
   23c48:	0f 84 2f 67 00 00    	je     2a37d <JS_CallInternal+0x77dd>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   23c4e:	83 f8 f6             	cmp    eax,0xfffffff6
   23c51:	76 04                	jbe    23c57 <JS_CallInternal+0x10b7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   23c53:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18514
   23c57:	48 89 13             	mov    QWORD PTR [rbx],rdx
   23c5a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18518
   23c5e:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18516
   23c64:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18518
   23c68:	49 83 c4 03          	add    r12,0x3
   23c6c:	49 89 c5             	mov    r13,rax
   23c6f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23c73:	ff e0                	jmp    rax
   23c75:	f3 0f 1e fa          	endbr64
   23c79:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18216
   23c7d:	49 8d 44 24 02       	lea    rax,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18215 (discriminator 1)
   23c82:	45 0f b7 14 24       	movzx  r10d,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18216
   23c87:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18217
   23c8e:	e9 e5 f2 ff ff       	jmp    22f78 <JS_CallInternal+0x3d8>
   23c93:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19950
   23c97:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19951
   23c9e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23ca5:	44 89 ea             	mov    edx,r13d
   23ca8:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19950
   23cab:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19951
   23caf:	e8 3c 0a 03 00       	call   546f0 <js_binary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19951 (discriminator 1)
   23cb4:	85 c0                	test   eax,eax
   23cb6:	0f 85 84 f6 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19954
   23cbc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19953
   23cc1:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19954
   23cc5:	49 83 c4 01          	add    r12,0x1
   23cc9:	49 89 c5             	mov    r13,rax
   23ccc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23cd0:	ff e0                	jmp    rax
   23cd2:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   23cd6:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18237
   23cdb:	49 89 de             	mov    r14,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18236
   23cde:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18239
   23ce3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18238
   23cea:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   23cf1:	4c 89 c8             	mov    rax,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18235 (discriminator 1)
   23cf4:	44 89 8d 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r9d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18237
   23cfb:	48 c1 e0 04          	shl    rax,0x4
   23cff:	49 29 c6             	sub    r14,rax
   23d02:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18238
   23d09:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18239
   23d10:	4d 8b 46 f8          	mov    r8,QWORD PTR [r14-0x8]
   23d14:	49 8b 4e f0          	mov    rcx,QWORD PTR [r14-0x10]
   23d18:	4d 8d 6e e0          	lea    r13,[r14-0x20]
   23d1c:	49 8b 76 e0          	mov    rsi,QWORD PTR [r14-0x20]
   23d20:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18238
   23d24:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18239
   23d28:	6a 00                	push   0x0
   23d2a:	41 56                	push   r14
   23d2c:	e8 ff d2 06 00       	call   91030 <JS_CallConstructorInternal>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18242 (discriminator 2)
   23d31:	41 5b                	pop    r11
   23d33:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   23d3a:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18239
   23d3d:	49 89 c1             	mov    r9,rax
   23d40:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18242 (discriminator 2)
   23d43:	58                   	pop    rax
   23d44:	0f 84 eb 76 00 00    	je     2b435 <JS_CallInternal+0x8895>
   23d4a:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   23d51:	4d 01 de             	add    r14,r11
   23d54:	eb 17                	jmp    23d6d <JS_CallInternal+0x11cd>
   23d56:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23d5d:	00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18244 (discriminator 1)
   23d60:	49 83 c5 10          	add    r13,0x10
   23d64:	4d 39 f5             	cmp    r13,r14
   23d67:	0f 84 be 53 00 00    	je     2912b <JS_CallInternal+0x658b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18245
   23d6d:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   23d71:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23d75:	83 fa f6             	cmp    edx,0xfffffff6
   23d78:	76 e6                	jbe    23d60 <JS_CallInternal+0x11c0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23d7a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23d7d:	83 e8 01             	sub    eax,0x1
   23d80:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23d83:	85 c0                	test   eax,eax
   23d85:	7f d9                	jg     23d60 <JS_CallInternal+0x11c0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   23d87:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23d8e:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   23d95:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   23d9c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23da0:	e8 7b 8b ff ff       	call   1c920 <__JS_FreeValueRT>
   23da5:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23dac:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   23db3:	eb ab                	jmp    23d60 <JS_CallInternal+0x11c0>
   23db5:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18480
   23db9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18481
   23dc0:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   23dc4:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   23dc8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   23dcc:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   23dd0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23dd4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18480
   23ddb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18481
   23ddf:	e8 6c 51 08 00       	call   a8f50 <js_dynamic_import>
   23de4:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18482 (discriminator 1)
   23de7:	83 fa 06             	cmp    edx,0x6
   23dea:	0f 84 50 f5 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18484
   23df0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23df4:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23df8:	83 fa f6             	cmp    edx,0xfffffff6
   23dfb:	76 11                	jbe    23e0e <JS_CallInternal+0x126e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23dfd:	8b 5e fc             	mov    ebx,DWORD PTR [rsi-0x4]
   23e00:	8d 4b ff             	lea    ecx,[rbx-0x1]
   23e03:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23e06:	85 c9                	test   ecx,ecx
   23e08:	0f 8e 14 67 00 00    	jle    2a522 <JS_CallInternal+0x7982>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18485
   23e0e:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23e12:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23e15:	83 fa f6             	cmp    edx,0xfffffff6
   23e18:	76 11                	jbe    23e2b <JS_CallInternal+0x128b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23e1a:	8b 5e fc             	mov    ebx,DWORD PTR [rsi-0x4]
   23e1d:	8d 4b ff             	lea    ecx,[rbx-0x1]
   23e20:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23e23:	85 c9                	test   ecx,ecx
   23e25:	0f 8e 28 67 00 00    	jle    2a553 <JS_CallInternal+0x79b3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18487
   23e2b:	49 89 46 f0          	mov    QWORD PTR [r14-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18486
   23e2f:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18489
   23e32:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18487
   23e36:	4d 89 46 f8          	mov    QWORD PTR [r14-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18489
   23e3a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23e40:	49 89 c5             	mov    r13,rax
   23e43:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23e47:	ff e0                	jmp    rax
   23e49:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18468
   23e4d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18469
   23e54:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23e58:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23e5c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18468
   23e63:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18469
   23e67:	e8 34 e6 ff ff       	call   224a0 <JS_GetPrototype>
   23e6c:	49 89 c6             	mov    r14,rax
   23e6f:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18470 (discriminator 1)
   23e72:	83 fa 06             	cmp    edx,0x6
   23e75:	0f 84 c5 f4 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18472
   23e7b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23e7f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23e83:	83 fa f6             	cmp    edx,0xfffffff6
   23e86:	76 11                	jbe    23e99 <JS_CallInternal+0x12f9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23e88:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23e8b:	83 e8 01             	sub    eax,0x1
   23e8e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23e91:	85 c0                	test   eax,eax
   23e93:	0f 8e 31 68 00 00    	jle    2a6ca <JS_CallInternal+0x7b2a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18473
   23e99:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18475
   23e9d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18473
   23ea1:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18475
   23ea5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23eab:	49 89 c5             	mov    r13,rax
   23eae:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23eb2:	ff e0                	jmp    rax
   23eb4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18284
   23eb8:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18283
   23ebf:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18286
   23ec4:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   23ec8:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18282 (discriminator 1)
   23ecc:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18286
   23ed1:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   23ed5:	4d 89 f0             	mov    r8,r14
   23ed8:	b9 02 00 00 00       	mov    ecx,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18284
   23edd:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18286
   23ee1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18284
   23ee8:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18286
   23eef:	e8 5c d7 07 00       	call   a1650 <js_function_apply>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18287 (discriminator 2)
   23ef4:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   23efb:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18286
   23efe:	49 89 c1             	mov    r9,rax
   23f01:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18287 (discriminator 2)
   23f04:	0f 84 5e 75 00 00    	je     2b468 <JS_CallInternal+0x88c8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18289
   23f0a:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   23f0e:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23f12:	83 fa f6             	cmp    edx,0xfffffff6
   23f15:	76 11                	jbe    23f28 <JS_CallInternal+0x1388>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23f17:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23f1a:	83 e8 01             	sub    eax,0x1
   23f1d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23f20:	85 c0                	test   eax,eax
   23f22:	0f 8e 82 6b 00 00    	jle    2aaaa <JS_CallInternal+0x7f0a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18290
   23f28:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23f2c:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23f2f:	83 fa f6             	cmp    edx,0xfffffff6
   23f32:	76 11                	jbe    23f45 <JS_CallInternal+0x13a5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23f34:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23f37:	83 e8 01             	sub    eax,0x1
   23f3a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23f3d:	85 c0                	test   eax,eax
   23f3f:	0f 8e 96 6b 00 00    	jle    2aadb <JS_CallInternal+0x7f3b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18291
   23f45:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23f49:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   23f4d:	83 fa f6             	cmp    edx,0xfffffff6
   23f50:	76 11                	jbe    23f63 <JS_CallInternal+0x13c3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   23f52:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23f55:	83 e8 01             	sub    eax,0x1
   23f58:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23f5b:	85 c0                	test   eax,eax
   23f5d:	0f 8e 16 6b 00 00    	jle    2aa79 <JS_CallInternal+0x7ed9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18293
   23f63:	4c 89 4b d0          	mov    QWORD PTR [rbx-0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18295
   23f67:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18293
   23f6b:	4c 89 43 d8          	mov    QWORD PTR [rbx-0x28],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18295
   23f6f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18293
   23f75:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18295
   23f78:	49 89 c5             	mov    r13,rax
   23f7b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23f7f:	ff e0                	jmp    rax
   23f81:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   23f85:	41 0f b7 14 24       	movzx  edx,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18271
   23f8a:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
   23f8f:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5861 (discriminator 1)
   23f96:	31 c9                	xor    ecx,ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18272
   23f98:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18270 (discriminator 1)
   23f9b:	89 95 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18272
   23fa1:	49 c1 e6 04          	shl    r14,0x4
   23fa5:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5861 (discriminator 1)
   23fac:	ba 02 00 00 00       	mov    edx,0x2
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18272
   23fb1:	4c 29 f3             	sub    rbx,r14
   23fb4:	49 89 dd             	mov    r13,rbx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5861
   23fb7:	48 8b 9d e8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x118]
   23fbe:	48 8b 73 30          	mov    rsi,QWORD PTR [rbx+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5861 (discriminator 1)
   23fc2:	48 89 df             	mov    rdi,rbx
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5314 (discriminator 1)
   23fc5:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5861 (discriminator 1)
   23fc9:	e8 72 25 02 00       	call   46540 <JS_NewObjectFromShape>
   23fce:	49 89 c0             	mov    r8,rax
   23fd1:	48 89 d1             	mov    rcx,rdx
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9662 (discriminator 1)
   23fd4:	83 fa 06             	cmp    edx,0x6
   23fd7:	0f 84 bd 75 00 00    	je     2b59a <JS_CallInternal+0x89fa>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9664
   23fdd:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   23fe3:	85 d2                	test   edx,edx
   23fe5:	0f 85 89 59 00 00    	jne    29974 <JS_CallInternal+0x6dd4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18276
   23feb:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   23fef:	49 8d 5d 10          	lea    rbx,[r13+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18277
   23ff3:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18276
   23ff7:	49 89 4d 08          	mov    QWORD PTR [r13+0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18277
   23ffb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24001:	49 89 c5             	mov    r13,rax
   24004:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24008:	ff e0                	jmp    rax
   2400a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   2400e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   24012:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   24019:	4d 8d 5c 24 04       	lea    r11,[r12+0x4]
   2401e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24022:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24026:	48 c1 e0 04          	shl    rax,0x4
   2402a:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   2402e:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 2)
   24031:	41 83 fa ff          	cmp    r10d,0xffffffff
   24035:	0f 85 b0 70 00 00    	jne    2b0eb <JS_CallInternal+0x854b>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   2403b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 3)
   2403e:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   24042:	25 08 00 ff ff       	and    eax,0xffff0008
   24047:	3d 00 00 01 00       	cmp    eax,0x10000
   2404c:	0f 84 63 5e 00 00    	je     29eb5 <JS_CallInternal+0x7315>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 10)
   24052:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   24056:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 11)
   24059:	48 89 f2             	mov    rdx,rsi
   2405c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   24060:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24064:	89 cf                	mov    edi,ecx
   24066:	21 c7                	and    edi,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   24068:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   2406d:	48 85 ff             	test   rdi,rdi
   24070:	0f 84 2e 4e 00 00    	je     28ea4 <JS_CallInternal+0x6304>
   24076:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2407d:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   2407e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24082:	4c 01 e8             	add    rax,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   24085:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24088:	0f 85 08 4e 00 00    	jne    28e96 <JS_CallInternal+0x62f6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   2408e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24092:	0f 87 0e 53 00 00    	ja     293a6 <JS_CallInternal+0x6806>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   24098:	48 8b 42 20          	mov    rax,QWORD PTR [rdx+0x20]
   2409c:	48 c1 e7 04          	shl    rdi,0x4
   240a0:	48 83 ef 10          	sub    rdi,0x10
   240a4:	48 01 f8             	add    rax,rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 17)
   240a7:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   240ab:	4c 8b 00             	mov    r8,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   240ae:	83 f9 f6             	cmp    ecx,0xfffffff6
   240b1:	76 05                	jbe    240b8 <JS_CallInternal+0x1518>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   240b3:	41 83 40 fc 01       	add    DWORD PTR [r8-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 20)
   240b8:	48 39 d6             	cmp    rsi,rdx
   240bb:	75 09                	jne    240c6 <JS_CallInternal+0x1526>
   240bd:	45 85 c9             	test   r9d,r9d
   240c0:	0f 84 70 81 00 00    	je     2c236 <JS_CallInternal+0x9696>
   240c6:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 39)
   240c9:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:82
   240cc:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 39)
   240d0:	48 83 c3 10          	add    rbx,0x10
   240d4:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:82
   240d8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   240de:	49 89 c5             	mov    r13,rax
   240e1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   240e5:	ff e0                	jmp    rax
   240e7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   240eb:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   240ef:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   240f6:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   240fa:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   240fe:	48 c1 e0 04          	shl    rax,0x4
   24102:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   24106:	49 89 c6             	mov    r14,rax
   24109:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   2410e:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 2)
   24115:	41 83 fa ff          	cmp    r10d,0xffffffff
   24119:	0f 85 55 6d 00 00    	jne    2ae74 <JS_CallInternal+0x82d4>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2411f:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 3)
   24122:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   24126:	25 08 00 ff ff       	and    eax,0xffff0008
   2412b:	3d 00 00 01 00       	cmp    eax,0x10000
   24130:	0f 84 27 5f 00 00    	je     2a05d <JS_CallInternal+0x74bd>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 10)
   24136:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2413a:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 11)
   2413d:	48 89 f2             	mov    rdx,rsi
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   24140:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24144:	89 cf                	mov    edi,ecx
   24146:	21 c7                	and    edi,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   24148:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   2414d:	48 85 ff             	test   rdi,rdi
   24150:	0f 84 7c 4d 00 00    	je     28ed2 <JS_CallInternal+0x6332>
   24156:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2415d:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   2415e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24162:	4c 01 e8             	add    rax,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   24165:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24168:	0f 85 56 4d 00 00    	jne    28ec4 <JS_CallInternal+0x6324>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2416e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24172:	0f 87 78 51 00 00    	ja     292f0 <JS_CallInternal+0x6750>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   24178:	48 8b 4a 20          	mov    rcx,QWORD PTR [rdx+0x20]
   2417c:	48 c1 e7 04          	shl    rdi,0x4
   24180:	48 83 ef 10          	sub    rdi,0x10
   24184:	48 01 f9             	add    rcx,rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 17)
   24187:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   2418a:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2418e:	83 f9 f6             	cmp    ecx,0xfffffff6
   24191:	76 04                	jbe    24197 <JS_CallInternal+0x15f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   24193:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   24197:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 20)
   2419b:	48 39 d6             	cmp    rsi,rdx
   2419e:	75 09                	jne    241a9 <JS_CallInternal+0x1609>
   241a0:	45 85 c9             	test   r9d,r9d
   241a3:	0f 84 40 82 00 00    	je     2c3e9 <JS_CallInternal+0x9849>
   241a9:	49 89 c5             	mov    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 40)
   241ac:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
   241b0:	49 8b 33             	mov    rsi,QWORD PTR [r11]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   241b3:	83 fa f6             	cmp    edx,0xfffffff6
   241b6:	76 11                	jbe    241c9 <JS_CallInternal+0x1629>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   241b8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   241bb:	83 e8 01             	sub    eax,0x1
   241be:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   241c1:	85 c0                	test   eax,eax
   241c3:	0f 8e a9 65 00 00    	jle    2a772 <JS_CallInternal+0x7bd2>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   241c9:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:79
   241cd:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   241d1:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:79
   241d5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   241db:	49 89 c5             	mov    r13,rax
   241de:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   241e2:	ff e0                	jmp    rax
   241e4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19128
   241e8:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19127
   241ec:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   241f0:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19128
   241f4:	0f 87 ba 5a 00 00    	ja     29cb4 <JS_CallInternal+0x7114>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19129
   241fa:	31 c0                	xor    eax,eax
   241fc:	85 d2                	test   edx,edx
   241fe:	0f 95 c0             	setne  al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19133
   24201:	85 c0                	test   eax,eax
   24203:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2420a:	00 
   2420b:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19135
   2420e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19133
   24212:	0f b6 c0             	movzx  eax,al
   24215:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19135
   24219:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2421f:	49 89 c5             	mov    r13,rax
   24222:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24226:	ff e0                	jmp    rax
   24228:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19094
   2422c:	45 0f b6 34 24       	movzx  r14d,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19095
   24231:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19094
   24238:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19095
   2423d:	4c 8b 43 c0          	mov    r8,QWORD PTR [rbx-0x40]
   24241:	4c 8b 4b c8          	mov    r9,QWORD PTR [rbx-0x38]
   24245:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19096
   24249:	44 89 f0             	mov    eax,r14d
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   2424c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19096
   24253:	83 e0 01             	and    eax,0x1
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   24256:	4c 89 c6             	mov    rsi,r8
   24259:	4c 89 ca             	mov    rdx,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19096 (discriminator 1)
   2425c:	3c 01                	cmp    al,0x1
   2425e:	19 c9                	sbb    ecx,ecx
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   24260:	48 83 ec 08          	sub    rsp,0x8
   24264:	6a 00                	push   0x0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19096 (discriminator 1)
   24266:	83 e1 ef             	and    ecx,0xffffffef
   24269:	83 c1 17             	add    ecx,0x17
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   2426c:	e8 8f 8c 00 00       	call   2cf00 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19098 (discriminator 1)
   24271:	59                   	pop    rcx
   24272:	5e                   	pop    rsi
   24273:	83 fa 06             	cmp    edx,0x6
   24276:	0f 84 9e 62 00 00    	je     2a51a <JS_CallInternal+0x797a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19100 (discriminator 1)
   2427c:	8d 72 fe             	lea    esi,[rdx-0x2]
   2427f:	b9 01 00 00 00       	mov    ecx,0x1
   24284:	83 fe 01             	cmp    esi,0x1
   24287:	0f 87 63 56 00 00    	ja     298f0 <JS_CallInternal+0x6d50>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19117
   2428d:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19120
   24290:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19118
   24294:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19117
   24298:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2429f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19120
   242a0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   242a6:	49 89 c5             	mov    r13,rax
   242a9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   242ad:	ff e0                	jmp    rax
   242af:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19078
   242b3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19079
   242ba:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20752
   242be:	48 8b 4b c0          	mov    rcx,QWORD PTR [rbx-0x40]
   242c2:	48 c7 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],0x0
   242c9:	00 00 00 00 
   242cd:	4c 8b 43 c8          	mov    r8,QWORD PTR [rbx-0x38]
   242d1:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   242d5:	41 b9 01 00 00 00    	mov    r9d,0x1
   242db:	48 c7 85 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],0x3
   242e2:	03 00 00 00 
   242e6:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   242ea:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19078
   242f1:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20752
   242f5:	6a 02                	push   0x2
   242f7:	41 55                	push   r13
   242f9:	ff b5 08 fe ff ff    	push   QWORD PTR [rbp-0x1f8]
   242ff:	ff b5 00 fe ff ff    	push   QWORD PTR [rbp-0x200]
   24305:	e8 96 e8 ff ff       	call   22ba0 <JS_CallInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19081 (discriminator 1)
   2430a:	48 83 c4 20          	add    rsp,0x20
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20752
   2430e:	48 89 c1             	mov    rcx,rax
   24311:	49 89 d6             	mov    r14,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19081 (discriminator 1)
   24314:	83 fa 06             	cmp    edx,0x6
   24317:	0f 84 23 f0 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19083
   2431d:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24321:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24325:	83 fa f6             	cmp    edx,0xfffffff6
   24328:	76 11                	jbe    2433b <JS_CallInternal+0x179b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2432a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2432d:	83 e8 01             	sub    eax,0x1
   24330:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24333:	85 c0                	test   eax,eax
   24335:	0f 8e 11 68 00 00    	jle    2ab4c <JS_CallInternal+0x7fac>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19084
   2433b:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19086
   2433f:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19084
   24343:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19086
   24347:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2434d:	49 89 c5             	mov    r13,rax
   24350:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24354:	ff e0                	jmp    rax
   24356:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19060
   2435a:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2435e:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24362:	48 8b 5b f8          	mov    rbx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19061
   24366:	4c 39 b5 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],r14
   2436d:	0f 83 18 4d 00 00    	jae    2908b <JS_CallInternal+0x64eb>
   24373:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
   2437a:	4d 89 f4             	mov    r12,r14
   2437d:	49 89 de             	mov    r14,rbx
   24380:	48 8b 9d 68 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x198]
   24387:	eb 10                	jmp    24399 <JS_CallInternal+0x17f9>
   24389:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   24390:	4c 39 e3             	cmp    rbx,r12
   24393:	0f 83 e5 4c 00 00    	jae    2907e <JS_CallInternal+0x64de>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19061 (discriminator 1)
   24399:	41 83 7c 24 f8 05    	cmp    DWORD PTR [r12-0x8],0x5
   2439f:	0f 84 d9 4c 00 00    	je     2907e <JS_CallInternal+0x64de>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19063
   243a5:	49 8b 4c 24 f8       	mov    rcx,QWORD PTR [r12-0x8]
   243aa:	49 83 ec 10          	sub    r12,0x10
   243ae:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   243b2:	83 f9 f6             	cmp    ecx,0xfffffff6
   243b5:	76 d9                	jbe    24390 <JS_CallInternal+0x17f0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   243b7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   243ba:	8d 50 ff             	lea    edx,[rax-0x1]
   243bd:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   243c0:	85 d2                	test   edx,edx
   243c2:	7f cc                	jg     24390 <JS_CallInternal+0x17f0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   243c4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   243cb:	48 89 ca             	mov    rdx,rcx
   243ce:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   243d2:	e8 49 85 ff ff       	call   1c920 <__JS_FreeValueRT>
   243d7:	eb b7                	jmp    24390 <JS_CallInternal+0x17f0>
   243d9:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19046
   243dd:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   243e1:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   243e5:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   243e9:	83 fa f6             	cmp    edx,0xfffffff6
   243ec:	76 11                	jbe    243ff <JS_CallInternal+0x185f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   243ee:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   243f1:	83 e8 01             	sub    eax,0x1
   243f4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   243f7:	85 c0                	test   eax,eax
   243f9:	0f 8e 65 66 00 00    	jle    2aa64 <JS_CallInternal+0x7ec4>
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:638
   243ff:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18063
   24403:	48 83 eb 30          	sub    rbx,0x30
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19048 (discriminator 1)
   24407:	83 f8 03             	cmp    eax,0x3
   2440a:	74 45                	je     24451 <JS_CallInternal+0x18b1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19049
   2440c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19050
   24413:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   24416:	31 c9                	xor    ecx,ecx
   24418:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2441c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19049
   24423:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19050
   24427:	e8 94 cc 00 00       	call   310c0 <JS_IteratorClose>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19050 (discriminator 1)
   2442c:	85 c0                	test   eax,eax
   2442e:	0f 85 e7 89 00 00    	jne    2ce1b <JS_CallInternal+0xa27b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19052
   24434:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   24438:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2443b:	83 fa f6             	cmp    edx,0xfffffff6
   2443e:	76 11                	jbe    24451 <JS_CallInternal+0x18b1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24440:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24443:	83 e8 01             	sub    eax,0x1
   24446:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24449:	85 c0                	test   eax,eax
   2444b:	0f 8e 29 7b 00 00    	jle    2bf7a <JS_CallInternal+0x93da>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19055
   24451:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24456:	49 83 c4 01          	add    r12,0x1
   2445a:	49 89 c5             	mov    r13,rax
   2445d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24461:	ff e0                	jmp    rax
   24463:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19037 (discriminator 2)
   24467:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   2446b:	0f 85 a5 73 00 00    	jne    2b816 <JS_CallInternal+0x8c76>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19041
   24471:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24476:	49 83 c4 01          	add    r12,0x1
   2447a:	49 89 c5             	mov    r13,rax
   2447d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24481:	ff e0                	jmp    rax
   24483:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19031
   24487:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16781
   2448e:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   24492:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19031
   24496:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16782 (discriminator 1)
   2449a:	41 83 fe ff          	cmp    r14d,0xffffffff
   2449e:	0f 85 d8 84 00 00    	jne    2c97c <JS_CallInternal+0x9ddc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16786
   244a4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   244ab:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
   244b2:	4c 89 f2             	mov    rdx,r14
   244b5:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   244bc:	e8 af 8f 00 00       	call   2d470 <JS_IteratorGetCompleteValue>
   244c1:	48 89 c1             	mov    rcx,rax
   244c4:	49 89 d5             	mov    r13,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16787 (discriminator 1)
   244c7:	83 fa 06             	cmp    edx,0x6
   244ca:	0f 84 70 ee ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   244d0:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   244d7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   244da:	83 e8 01             	sub    eax,0x1
   244dd:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   244e0:	85 c0                	test   eax,eax
   244e2:	0f 8e 56 65 00 00    	jle    2aa3e <JS_CallInternal+0x7e9e>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   244e8:	8b bd f0 fe ff ff    	mov    edi,DWORD PTR [rbp-0x110]
   244ee:	31 c0                	xor    eax,eax
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16793
   244f0:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16792
   244f4:	48 c7 43 e0 00 00 00 	mov    QWORD PTR [rbx-0x20],0x0
   244fb:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   244fc:	85 ff                	test   edi,edi
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16792
   244fe:	48 c7 43 e8 05 00 00 	mov    QWORD PTR [rbx-0x18],0x5
   24505:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   24506:	0f 95 c0             	setne  al
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16793
   24509:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19035
   2450d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19034
   24511:	48 83 c3 10          	add    rbx,0x10
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16794
   24515:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   24519:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24520:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19035
   24521:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24527:	49 89 c5             	mov    r13,rax
   2452a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2452e:	ff e0                	jmp    rax
   24530:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19001
   24534:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19002
   2453b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24542:	31 d2                	xor    edx,edx
   24544:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19001
   24547:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19002
   2454b:	e8 50 16 07 00       	call   95ba0 <js_for_of_start>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19002 (discriminator 1)
   24550:	85 c0                	test   eax,eax
   24552:	0f 85 e8 ed ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19005
   24558:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   2455f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19006
   24560:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19005
   24564:	48 83 c3 20          	add    rbx,0x20
   24568:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   2456f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19006
   24570:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24576:	49 89 c5             	mov    r13,rax
   24579:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2457d:	ff e0                	jmp    rax
   2457f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18995
   24583:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18996
   2458a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24591:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18995
   24594:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18996
   24598:	e8 23 95 04 00       	call   6dac0 <js_for_in_next>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18996 (discriminator 1)
   2459d:	85 c0                	test   eax,eax
   2459f:	0f 85 9b ed ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18999
   245a5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18998
   245aa:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18999
   245ae:	49 83 c4 01          	add    r12,0x1
   245b2:	49 89 c5             	mov    r13,rax
   245b5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   245b9:	ff e0                	jmp    rax
   245bb:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19018
   245bf:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20752
   245c6:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
   245ca:	45 31 c9             	xor    r9d,r9d
   245cd:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
   245d4:	00 00 00 00 
   245d8:	48 c7 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],0x3
   245df:	03 00 00 00 
   245e3:	4c 8b 43 d8          	mov    r8,QWORD PTR [rbx-0x28]
   245e7:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   245eb:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19018
   245ef:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16747
   245f3:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   245fa:	00 
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20752
   245fb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16747
   24602:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   24609:	00 
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20752
   2460a:	6a 02                	push   0x2
   2460c:	6a 00                	push   0x0
   2460e:	ff b5 f8 fd ff ff    	push   QWORD PTR [rbp-0x208]
   24614:	ff b5 f0 fd ff ff    	push   QWORD PTR [rbp-0x210]
   2461a:	e8 81 e5 ff ff       	call   22ba0 <JS_CallInternal>
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16752 (discriminator 1)
   2461f:	48 83 c4 20          	add    rsp,0x20
   24623:	83 fa 06             	cmp    edx,0x6
   24626:	0f 84 14 ed ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16754
   2462c:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19022
   2462f:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19021
   24633:	48 83 c3 10          	add    rbx,0x10
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16754
   24637:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19022
   2463b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24641:	49 89 c5             	mov    r13,rax
   24644:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24648:	ff e0                	jmp    rax
   2464a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19011
   2464e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19009
   24655:	41 0f b6 0c 24       	movzx  ecx,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19010
   2465a:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16719
   2465f:	c7 85 f0 fe ff ff 01 	mov    DWORD PTR [rbp-0x110],0x1
   24666:	00 00 00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19011
   24669:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19009
   2466d:	b8 fd ff ff ff       	mov    eax,0xfffffffd
   24672:	29 c8                	sub    eax,ecx
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16721
   24674:	48 98                	cdqe
   24676:	48 c1 e0 04          	shl    rax,0x4
   2467a:	4c 8d 2c 03          	lea    r13,[rbx+rax*1]
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:638
   2467e:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16721 (discriminator 2)
   24682:	83 fa 03             	cmp    edx,0x3
   24685:	0f 84 7a 71 00 00    	je     2b805 <JS_CallInternal+0x8c65>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16722
   2468b:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   24690:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   24694:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2469b:	4c 8d 8d f0 fe ff ff 	lea    r9,[rbp-0x110]
   246a2:	29 c8                	sub    eax,ecx
   246a4:	48 98                	cdqe
   246a6:	48 c1 e0 04          	shl    rax,0x4
   246aa:	48 01 d8             	add    rax,rbx
   246ad:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   246b0:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   246b4:	e8 d7 2b 07 00       	call   97290 <JS_IteratorNext.constprop.0>
   246b9:	49 89 d1             	mov    r9,rdx
   246bc:	48 89 c7             	mov    rdi,rax
   246bf:	48 89 d6             	mov    rsi,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16723 (discriminator 1)
   246c2:	83 fa 06             	cmp    edx,0x6
   246c5:	0f 84 27 58 00 00    	je     29ef2 <JS_CallInternal+0x7352>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16725
   246cb:	8b 8d f0 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x110]
   246d1:	31 d2                	xor    edx,edx
   246d3:	85 c9                	test   ecx,ecx
   246d5:	0f 85 26 58 00 00    	jne    29f01 <JS_CallInternal+0x7361>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16738
   246db:	48 89 3b             	mov    QWORD PTR [rbx],rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19016
   246de:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19014
   246e2:	48 83 c3 20          	add    rbx,0x20
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16738
   246e6:	48 89 73 e8          	mov    QWORD PTR [rbx-0x18],rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16739
   246ea:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   246ee:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   246f5:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19016
   246f6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   246fc:	49 89 c5             	mov    r13,rax
   246ff:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24703:	ff e0                	jmp    rax
   24705:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19024
   24709:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19025
   24710:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24717:	ba 01 00 00 00       	mov    edx,0x1
   2471c:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19024
   2471f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19025
   24723:	e8 78 14 07 00       	call   95ba0 <js_for_of_start>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19025 (discriminator 1)
   24728:	85 c0                	test   eax,eax
   2472a:	0f 85 10 ec ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19028
   24730:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   24737:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19029
   24738:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19028
   2473c:	48 83 c3 20          	add    rbx,0x20
   24740:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   24747:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19029
   24748:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2474e:	49 89 c5             	mov    r13,rax
   24751:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24755:	ff e0                	jmp    rax
   24757:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18990
   2475b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_for_in_start():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16364
   24762:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24766:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2476a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18990
   24771:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_for_in_start():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16364
   24775:	e8 a6 90 04 00       	call   6d820 <build_for_in_iterator>
   2477a:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16365 (discriminator 1)
   2477e:	83 7b f8 06          	cmp    DWORD PTR [rbx-0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16364
   24782:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16365 (discriminator 1)
   24786:	0f 84 b4 eb ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18993
   2478c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24791:	49 83 c4 01          	add    r12,0x1
   24795:	49 89 c5             	mov    r13,rax
   24798:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2479c:	ff e0                	jmp    rax
   2479e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18976 (discriminator 1)
   247a2:	44 8b 4b f8          	mov    r9d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18975
   247a6:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18976 (discriminator 1)
   247aa:	45 85 c9             	test   r9d,r9d
   247ad:	0f 85 3e 5c 00 00    	jne    2a3f1 <JS_CallInternal+0x7851>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18979 (discriminator 1)
   247b3:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   247ba:	3b 41 20             	cmp    eax,DWORD PTR [rcx+0x20]
   247bd:	0f 83 2e 5c 00 00    	jae    2a3f1 <JS_CallInternal+0x7851>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18985
   247c3:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   247ca:	89 c0                	mov    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18984
   247cc:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18985
   247d0:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18987
   247d4:	4c 8d 60 01          	lea    r12,[rax+0x1]
   247d8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   247db:	49 89 c5             	mov    r13,rax
   247de:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   247e2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18964 (discriminator 1)
   247e6:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   247ea:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18966
   247f1:	49 8d 54 24 04       	lea    rdx,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18967
   247f6:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   247fa:	2b 51 18             	sub    edx,DWORD PTR [rcx+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18968
   247fd:	4c 01 e0             	add    rax,r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18966
   24800:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   24807:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   24808:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18970
   2480c:	4c 8d 60 01          	lea    r12,[rax+0x1]
   24810:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   24813:	49 89 c5             	mov    r13,rax
   24816:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2481a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18458
   2481e:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   24822:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   24826:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   2482a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2482e:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   24832:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24839:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   2483d:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   24844:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47695 (discriminator 1)
   2484b:	83 fb f9             	cmp    ebx,0xfffffff9
   2484e:	0f 85 bc 58 00 00    	jne    2a110 <JS_CallInternal+0x7570>
   24854:	83 f8 f9             	cmp    eax,0xfffffff9
   24857:	0f 85 b3 58 00 00    	jne    2a110 <JS_CallInternal+0x7570>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47701
   2485d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47701 (discriminator 1)
   24864:	ba 12 00 00 00       	mov    edx,0x12
   24869:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47700
   24870:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
   24877:	00 00 00 00 
   2487b:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   24882:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47701
   24886:	48 8b 77 48          	mov    rsi,QWORD PTR [rdi+0x48]
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5314 (discriminator 1)
   2488a:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47701 (discriminator 1)
   2488e:	e8 ad 1c 02 00       	call   46540 <JS_NewObjectFromShape>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47702 (discriminator 1)
   24893:	83 fa 06             	cmp    edx,0x6
   24896:	0f 84 89 58 00 00    	je     2a125 <JS_CallInternal+0x7585>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47706
   2489c:	f3 0f 7e 85 50 fe ff 	movq   xmm0,QWORD PTR [rbp-0x1b0]
   248a3:	ff 
   248a4:	0f 16 85 40 fe ff ff 	movhps xmm0,QWORD PTR [rbp-0x1c0]
   248ab:	0f 11 40 28          	movups XMMWORD PTR [rax+0x28],xmm0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18458
   248af:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   248b3:	49 89 55 08          	mov    QWORD PTR [r13+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18460 (discriminator 1)
   248b7:	41 83 7e f8 06       	cmp    DWORD PTR [r14-0x8],0x6
   248bc:	0f 84 6e 6f 00 00    	je     2b830 <JS_CallInternal+0x8c90>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18463
   248c2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18459
   248c7:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18463
   248ca:	49 83 c4 01          	add    r12,0x1
   248ce:	49 89 c5             	mov    r13,rax
   248d1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   248d5:	ff e0                	jmp    rax
   248d7:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   248db:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18432
   248e0:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   248e4:	48 8d b5 f0 fe ff ff 	lea    rsi,[rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18431
   248eb:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18432
   248f2:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   248f9:	66 89 85 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],ax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18430
   24900:	49 8d 44 24 02       	lea    rax,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18431
   24905:	48 89 41 30          	mov    QWORD PTR [rcx+0x30],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18432
   24909:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2490d:	4c 89 ef             	mov    rdi,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18430
   24910:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18432
   24917:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   2491b:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24922:	e8 69 01 06 00       	call   84a90 <build_arg_list>
   24927:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18433
   2492a:	48 85 c0             	test   rax,rax
   2492d:	0f 84 ba 5d 00 00    	je     2a6ed <JS_CallInternal+0x7b4d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18435
   24933:	f3 41 0f 6f 9d 70 01 	movdqu xmm3,XMMWORD PTR [r13+0x170]
   2493a:	00 00 
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15936
   2493c:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   24940:	41 b8 01 00 00 00    	mov    r8d,0x1
   24946:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   2494a:	0f 29 9d 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm3
   24951:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   24958:	48 89 c7             	mov    rdi,rax
   2495b:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   24962:	4c 89 ee             	mov    rsi,r13
   24965:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2496c:	e8 df 5b ff ff       	call   1a550 <js_strict_eq2.isra.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18436
   24971:	44 8b 95 f0 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18435 (discriminator 1)
   24978:	85 c0                	test   eax,eax
   2497a:	0f 84 ec 53 00 00    	je     29d6c <JS_CallInternal+0x71cc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18436
   24980:	45 85 d2             	test   r10d,r10d
   24983:	0f 84 d6 53 00 00    	je     29d5f <JS_CallInternal+0x71bf>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18437
   24989:	49 8b 0e             	mov    rcx,QWORD PTR [r14]
   2498c:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   24990:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18440
   24997:	48 83 ec 08          	sub    rsp,0x8
   2499b:	31 f6                	xor    esi,esi
   2499d:	44 89 95 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r10d
   249a4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   249ab:	41 b9 02 00 00 00    	mov    r9d,0x2
   249b1:	ba 03 00 00 00       	mov    edx,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18429 (discriminator 1)
   249b6:	83 e8 02             	sub    eax,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18440
   249b9:	50                   	push   rax
   249ba:	e8 e1 e0 01 00       	call   42aa0 <JS_EvalObject>
   249bf:	44 8b 95 28 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1d8]
   249c6:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   249cd:	49 89 d5             	mov    r13,rdx
   249d0:	58                   	pop    rax
   249d1:	5a                   	pop    rdx
free_arg_list():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:41195 (discriminator 1)
   249d2:	45 85 d2             	test   r10d,r10d
   249d5:	0f 84 81 6b 00 00    	je     2b55c <JS_CallInternal+0x89bc>
   249db:	45 89 d0             	mov    r8d,r10d
   249de:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   249e5:	48 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rbx
   249ec:	4c 89 f3             	mov    rbx,r14
   249ef:	49 c1 e0 04          	shl    r8,0x4
   249f3:	4c 89 a5 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r12
   249fa:	4d 01 f0             	add    r8,r14
   249fd:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   24a01:	4d 89 c4             	mov    r12,r8
   24a04:	eb 17                	jmp    24a1d <JS_CallInternal+0x1e7d>
   24a06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   24a0d:	00 00 00 
   24a10:	48 83 c3 10          	add    rbx,0x10
   24a14:	4c 39 e3             	cmp    rbx,r12
   24a17:	0f 84 74 47 00 00    	je     29191 <JS_CallInternal+0x65f1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:41196
   24a1d:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   24a21:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24a24:	83 f9 f6             	cmp    ecx,0xfffffff6
   24a27:	76 e7                	jbe    24a10 <JS_CallInternal+0x1e70>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24a29:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24a2c:	8d 50 ff             	lea    edx,[rax-0x1]
   24a2f:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   24a32:	85 d2                	test   edx,edx
   24a34:	7f da                	jg     24a10 <JS_CallInternal+0x1e70>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   24a36:	48 89 ca             	mov    rdx,rcx
   24a39:	e8 e2 7e ff ff       	call   1c920 <__JS_FreeValueRT>
   24a3e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   24a45:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   24a49:	eb c5                	jmp    24a10 <JS_CallInternal+0x1e70>
   24a4b:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   24a4f:	41 0f b7 0c 24       	movzx  ecx,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18400
   24a54:	49 89 dd             	mov    r13,rbx
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   24a57:	41 0f b7 7c 24 02    	movzx  edi,WORD PTR [r12+0x2]
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15936
   24a5d:	41 b8 01 00 00 00    	mov    r8d,0x1
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   24a63:	48 89 c8             	mov    rax,rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18397 (discriminator 1)
   24a66:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18399
   24a6c:	49 8d 4c 24 04       	lea    rcx,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18400
   24a71:	48 c1 e0 04          	shl    rax,0x4
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   24a75:	66 89 bd 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],di
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18400
   24a7c:	49 29 c5             	sub    r13,rax
   24a7f:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18401
   24a82:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18399
   24a89:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15936
   24a90:	49 8b 7d f0          	mov    rdi,QWORD PTR [r13-0x10]
   24a94:	49 8b 75 f8          	mov    rsi,QWORD PTR [r13-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18401
   24a98:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18402
   24a9c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   24aa3:	f3 0f 6f b8 70 01 00 	movdqu xmm7,XMMWORD PTR [rax+0x170]
   24aaa:	00 
   24aab:	0f 29 bd 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm7
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15936
   24ab2:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   24ab9:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   24ac0:	e8 8b 5a ff ff       	call   1a550 <js_strict_eq2.isra.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18402 (discriminator 1)
   24ac5:	85 c0                	test   eax,eax
   24ac7:	0f 84 3a 52 00 00    	je     29d07 <JS_CallInternal+0x7167>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18403
   24acd:	8b bd 50 fe ff ff    	mov    edi,DWORD PTR [rbp-0x1b0]
   24ad3:	85 ff                	test   edi,edi
   24ad5:	0f 84 48 51 00 00    	je     29c23 <JS_CallInternal+0x7083>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18404
   24adb:	49 8b 4d 00          	mov    rcx,QWORD PTR [r13+0x0]
   24adf:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   24ae3:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18407
   24aea:	48 83 ec 08          	sub    rsp,0x8
   24aee:	41 b9 02 00 00 00    	mov    r9d,0x2
   24af4:	31 f6                	xor    esi,esi
   24af6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24afd:	ba 03 00 00 00       	mov    edx,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18398 (discriminator 1)
   24b02:	83 e8 02             	sub    eax,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18407
   24b05:	50                   	push   rax
   24b06:	e8 95 df 01 00       	call   42aa0 <JS_EvalObject>
   24b0b:	59                   	pop    rcx
   24b0c:	5e                   	pop    rsi
   24b0d:	49 89 c1             	mov    r9,rax
   24b10:	49 89 d0             	mov    r8,rdx
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:643
   24b13:	49 8d 45 f0          	lea    rax,[r13-0x10]
   24b17:	4d 01 f5             	add    r13,r14
   24b1a:	49 89 c6             	mov    r14,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18413 (discriminator 2)
   24b1d:	41 83 f8 06          	cmp    r8d,0x6
   24b21:	75 1a                	jne    24b3d <JS_CallInternal+0x1f9d>
   24b23:	e9 57 68 00 00       	jmp    2b37f <JS_CallInternal+0x87df>
   24b28:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   24b2f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18415 (discriminator 1)
   24b30:	49 83 c6 10          	add    r14,0x10
   24b34:	4d 39 ee             	cmp    r14,r13
   24b37:	0f 84 21 46 00 00    	je     2915e <JS_CallInternal+0x65be>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18416
   24b3d:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   24b41:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24b44:	83 fa f6             	cmp    edx,0xfffffff6
   24b47:	76 e7                	jbe    24b30 <JS_CallInternal+0x1f90>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24b49:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24b4c:	83 e8 01             	sub    eax,0x1
   24b4f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24b52:	85 c0                	test   eax,eax
   24b54:	7f da                	jg     24b30 <JS_CallInternal+0x1f90>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   24b56:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   24b5d:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   24b64:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   24b6b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   24b6f:	e8 ac 7d ff ff       	call   1c920 <__JS_FreeValueRT>
   24b74:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   24b7b:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   24b82:	eb ac                	jmp    24b30 <JS_CallInternal+0x1f90>
   24b84:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18372
   24b88:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   24b8e:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18373
   24b92:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18374
   24b96:	3c 04                	cmp    al,0x4
   24b98:	0f 87 5f 59 00 00    	ja     2a4fd <JS_CallInternal+0x795d>
   24b9e:	48 8d 15 7f 25 0b 00 	lea    rdx,[rip+0xb257f]        # d7124 <qjsc_repl_size+0x458>
   24ba5:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   24ba9:	48 01 d0             	add    rax,rdx
   24bac:	3e ff e0             	notrack jmp rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18384
   24baf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24bb6:	48 8d 35 eb c1 0a 00 	lea    rsi,[rip+0xac1eb]        # d0da8 <_IO_stdin_used+0x3da8>
   24bbd:	31 c0                	xor    eax,eax
   24bbf:	e8 9c e2 00 00       	call   32e60 <JS_ThrowReferenceError>
   24bc4:	e9 77 e7 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 1)
   24bc9:	48 8d 15 db 88 0a 00 	lea    rdx,[rip+0xa88db]        # cd4ab <_IO_stdin_used+0x4ab>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860
   24bd0:	85 f6                	test   esi,esi
   24bd2:	0f 85 6f 74 00 00    	jne    2c047 <JS_CallInternal+0x94a7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   24bd8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24bdf:	48 8d 35 21 89 0a 00 	lea    rsi,[rip+0xa8921]        # cd507 <_IO_stdin_used+0x507>
   24be6:	31 c0                	xor    eax,eax
   24be8:	e8 73 e2 00 00       	call   32e60 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   24bed:	e9 4e e7 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   24bf2:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   24bf9:	48 8d 45 80          	lea    rax,[rbp-0x80]
   24bfd:	89 f2                	mov    edx,esi
   24bff:	48 89 c6             	mov    rsi,rax
   24c02:	49 8b 7e 10          	mov    rdi,QWORD PTR [r14+0x10]
   24c06:	e8 85 27 ff ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowSyntaxErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7755 (discriminator 1)
   24c0b:	48 8d 35 df 88 0a 00 	lea    rsi,[rip+0xa88df]        # cd4f1 <_IO_stdin_used+0x4f1>
   24c12:	4c 89 f7             	mov    rdi,r14
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   24c15:	48 89 c2             	mov    rdx,rax
__JS_ThrowSyntaxErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7755 (discriminator 1)
   24c18:	31 c0                	xor    eax,eax
   24c1a:	e8 31 bd 00 00       	call   30950 <JS_ThrowSyntaxError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7755
   24c1f:	e9 1c e7 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowTypeErrorReadOnly():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7766
   24c24:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24c2b:	e8 00 d6 00 00       	call   32230 <JS_ThrowTypeErrorReadOnly.part.0>
   24c30:	e9 0b e7 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18387
   24c35:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24c3c:	48 8d 35 8d c1 0a 00 	lea    rsi,[rip+0xac18d]        # d0dd0 <_IO_stdin_used+0x3dd0>
   24c43:	31 c0                	xor    eax,eax
   24c45:	e8 26 c1 00 00       	call   30d70 <JS_ThrowTypeError>
   24c4a:	e9 f1 e6 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   24c4f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20672
   24c53:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24c57:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24c5e:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24c62:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24c66:	e8 d5 6d ff ff       	call   1ba40 <js_operator_typeof>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20672 (discriminator 1)
   24c6b:	83 f8 1b             	cmp    eax,0x1b
   24c6e:	74 61                	je     24cd1 <JS_CallInternal+0x2131>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20684
   24c70:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24c74:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24c77:	83 fa f6             	cmp    edx,0xfffffff6
   24c7a:	76 11                	jbe    24c8d <JS_CallInternal+0x20ed>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24c7c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24c7f:	83 e8 01             	sub    eax,0x1
   24c82:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24c85:	85 c0                	test   eax,eax
   24c87:	0f 8e 65 4b 00 00    	jle    297f2 <JS_CallInternal+0x6c52>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20685
   24c8d:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   24c94:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20686
   24c95:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20685
   24c99:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24ca0:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20686
   24ca1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24ca7:	49 89 c5             	mov    r13,rax
   24caa:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24cae:	ff e0                	jmp    rax
   24cb0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20666
   24cb4:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24cb8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24cbf:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24cc3:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24cc7:	e8 74 6d ff ff       	call   1ba40 <js_operator_typeof>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20666 (discriminator 1)
   24ccc:	83 f8 49             	cmp    eax,0x49
   24ccf:	75 9f                	jne    24c70 <JS_CallInternal+0x20d0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20678
   24cd1:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24cd5:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24cd8:	83 fa f6             	cmp    edx,0xfffffff6
   24cdb:	76 11                	jbe    24cee <JS_CallInternal+0x214e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24cdd:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24ce0:	83 e8 01             	sub    eax,0x1
   24ce3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24ce6:	85 c0                	test   eax,eax
   24ce8:	0f 8e 71 61 00 00    	jle    2ae5f <JS_CallInternal+0x82bf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20681
   24cee:	48 c7 43 f0 01 00 00 	mov    QWORD PTR [rbx-0x10],0x1
   24cf5:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20682
   24cf6:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20681
   24cfa:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24d01:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20682
   24d02:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24d08:	49 89 c5             	mov    r13,rax
   24d0b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d0f:	ff e0                	jmp    rax
   24d11:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20639
   24d15:	31 c9                	xor    ecx,ecx
   24d17:	b8 03 00 00 00       	mov    eax,0x3
   24d1c:	e9 9f e6 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24d21:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20635
   24d25:	b9 03 00 00 00       	mov    ecx,0x3
   24d2a:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20636
   24d2c:	e9 8f e6 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24d31:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20658
   24d35:	83 7b f8 02          	cmp    DWORD PTR [rbx-0x8],0x2
   24d39:	74 b3                	je     24cee <JS_CallInternal+0x214e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   24d3b:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24d3f:	e9 2c ff ff ff       	jmp    24c70 <JS_CallInternal+0x20d0>
   24d44:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20652
   24d48:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   24d4c:	75 ed                	jne    24d3b <JS_CallInternal+0x219b>
   24d4e:	eb 9e                	jmp    24cee <JS_CallInternal+0x214e>
   24d50:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20644
   24d54:	8b 43 f8             	mov    eax,DWORD PTR [rbx-0x8]
   24d57:	83 e8 02             	sub    eax,0x2
   24d5a:	83 f8 01             	cmp    eax,0x1
   24d5d:	77 dc                	ja     24d3b <JS_CallInternal+0x219b>
   24d5f:	eb 8d                	jmp    24cee <JS_CallInternal+0x214e>
   24d61:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20642
   24d65:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24d6a:	49 83 c4 01          	add    r12,0x1
   24d6e:	49 89 c5             	mov    r13,rax
   24d71:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d75:	ff e0                	jmp    rax
   24d77:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20629
   24d7b:	31 c9                	xor    ecx,ecx
   24d7d:	b8 01 00 00 00       	mov    eax,0x1
   24d82:	e9 39 e6 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24d87:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20626
   24d8b:	31 c9                	xor    ecx,ecx
   24d8d:	31 c0                	xor    eax,eax
   24d8f:	e9 2c e6 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24d94:	f3 0f 1e fa          	endbr64
   24d98:	e9 23 e1 ff ff       	jmp    22ec0 <JS_CallInternal+0x320>
   24d9d:	f3 0f 1e fa          	endbr64
   24da1:	e9 1a e1 ff ff       	jmp    22ec0 <JS_CallInternal+0x320>
   24da6:	f3 0f 1e fa          	endbr64
   24daa:	e9 11 e1 ff ff       	jmp    22ec0 <JS_CallInternal+0x320>
   24daf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20495
   24db3:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24db7:	83 f8 fa             	cmp    eax,0xfffffffa
   24dba:	0f 8d a0 48 00 00    	jge    29660 <JS_CallInternal+0x6ac0>
   24dc0:	83 f8 f8             	cmp    eax,0xfffffff8
   24dc3:	0f 8c 9f 48 00 00    	jl     29668 <JS_CallInternal+0x6ac8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20509
   24dc9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24dce:	49 83 c4 01          	add    r12,0x1
   24dd2:	49 89 c5             	mov    r13,rax
   24dd5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24dd9:	ff e0                	jmp    rax
   24ddb:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20484
   24ddf:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   24de3:	74 54                	je     24e39 <JS_CallInternal+0x2299>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20485
   24de5:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20486
   24dec:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24df0:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24df4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20485
   24dfb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20486
   24dff:	e8 1c 38 02 00       	call   48620 <JS_ToObject>
   24e04:	49 89 c1             	mov    r9,rax
   24e07:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20487 (discriminator 1)
   24e0a:	83 fa 06             	cmp    edx,0x6
   24e0d:	0f 84 2d e5 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20489
   24e13:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24e17:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24e1b:	83 fa f6             	cmp    edx,0xfffffff6
   24e1e:	76 11                	jbe    24e31 <JS_CallInternal+0x2291>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24e20:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24e23:	83 e8 01             	sub    eax,0x1
   24e26:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24e29:	85 c0                	test   eax,eax
   24e2b:	0f 8e cf 70 00 00    	jle    2bf00 <JS_CallInternal+0x9360>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20490
   24e31:	4c 89 4b f0          	mov    QWORD PTR [rbx-0x10],r9
   24e35:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20492
   24e39:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24e3e:	49 83 c4 01          	add    r12,0x1
   24e42:	49 89 c5             	mov    r13,rax
   24e45:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24e49:	ff e0                	jmp    rax
   24e4b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20474
   24e4f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20473
   24e56:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   24e5b:	45 8b 34 24          	mov    r14d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20474
   24e5f:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   24e63:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   24e6a:	44 89 f1             	mov    ecx,r14d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   24e6d:	48 8b 80 90 01 00 00 	mov    rax,QWORD PTR [rax+0x190]
   24e74:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   24e78:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   24e7b:	21 c1                	and    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   24e7d:	8b 4c 8a 38          	mov    ecx,DWORD PTR [rdx+rcx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   24e81:	48 85 c9             	test   rcx,rcx
   24e84:	0f 84 70 51 00 00    	je     29ffa <JS_CallInternal+0x745a>
   24e8a:	48 8d 34 85 34 00 00 	lea    rsi,[rax*4+0x34]
   24e91:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   24e92:	48 8d 04 ce          	lea    rax,[rsi+rcx*8]
   24e96:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   24e99:	44 3b 70 04          	cmp    r14d,DWORD PTR [rax+0x4]
   24e9d:	0f 85 49 51 00 00    	jne    29fec <JS_CallInternal+0x744c>
   24ea3:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20479
   24ea5:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20481
   24ea8:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20479
   24eac:	48 83 c3 10          	add    rbx,0x10
   24eb0:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24eb7:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20481
   24eb8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24ebe:	49 89 c5             	mov    r13,rax
   24ec1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ec5:	ff e0                	jmp    rax
   24ec7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20462
   24ecb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16109
   24ed2:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   24ed6:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16108
   24eda:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20462
   24ede:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16110
   24ee2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24ee9:	4c 89 ee             	mov    rsi,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16108
   24eec:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16110
   24ef0:	4c 89 f2             	mov    rdx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16108
   24ef3:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   24efa:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16110
   24f01:	e8 aa ec 01 00       	call   43bb0 <JS_ValueToAtom>
   24f06:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16111 (discriminator 1)
   24f08:	85 c0                	test   eax,eax
   24f0a:	0f 84 30 e4 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16113
   24f10:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   24f17:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   24f1e:	41 b8 00 80 00 00    	mov    r8d,0x8000
   24f24:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   24f2a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24f31:	e8 0a 63 02 00       	call   4b240 <JS_DeleteProperty>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   24f36:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16113
   24f3c:	41 89 c0             	mov    r8d,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   24f3f:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   24f45:	0f 8f 60 50 00 00    	jg     29fab <JS_CallInternal+0x740b>
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16115 (discriminator 1)
   24f4b:	45 85 c0             	test   r8d,r8d
   24f4e:	0f 88 ec e3 ff ff    	js     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24f54:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   24f5b:	76 1e                	jbe    24f7b <JS_CallInternal+0x23db>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24f5d:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   24f64:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   24f67:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   24f6d:	83 e8 01             	sub    eax,0x1
   24f70:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   24f73:	85 c0                	test   eax,eax
   24f75:	0f 8e 78 61 00 00    	jle    2b0f3 <JS_CallInternal+0x8553>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24f7b:	41 83 fe f6          	cmp    r14d,0xfffffff6
   24f7f:	76 13                	jbe    24f94 <JS_CallInternal+0x23f4>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24f81:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   24f85:	83 e8 01             	sub    eax,0x1
   24f88:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   24f8c:	85 c0                	test   eax,eax
   24f8e:	0f 8e fd 5d 00 00    	jle    2ad91 <JS_CallInternal+0x81f1>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   24f94:	31 c0                	xor    eax,eax
   24f96:	45 85 c0             	test   r8d,r8d
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16119
   24f99:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   24fa0:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   24fa1:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20465
   24fa4:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20466
   24fa8:	49 83 c4 01          	add    r12,0x1
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16119
   24fac:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20466
   24fb0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24fb6:	49 89 c5             	mov    r13,rax
   24fb9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24fbd:	ff e0                	jmp    rax
   24fbf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20455
   24fc3:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   24fc7:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20456
   24fcb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24fd2:	4c 89 c2             	mov    rdx,r8
   24fd5:	e8 66 6a ff ff       	call   1ba40 <js_operator_typeof>
   24fda:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   24fdd:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24fe1:	76 11                	jbe    24ff4 <JS_CallInternal+0x2454>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   24fe3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24fe6:	83 e8 01             	sub    eax,0x1
   24fe9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24fec:	85 c0                	test   eax,eax
   24fee:	0f 8e 7a 59 00 00    	jle    2a96e <JS_CallInternal+0x7dce>
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3647
   24ff4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24ffb:	44 89 ee             	mov    esi,r13d
   24ffe:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20460
   25003:	49 83 c4 01          	add    r12,0x1
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3647
   25007:	e8 34 f1 00 00       	call   34140 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20458
   2500c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   25010:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20460
   25014:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2501a:	49 89 c5             	mov    r13,rax
   2501d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25021:	ff e0                	jmp    rax
   25023:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20445
   25027:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16041
   2502e:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   25032:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16040
   25036:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20445
   2503a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16040
   2503e:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16042
   25042:	4c 89 f1             	mov    rcx,r14
   25045:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2504c:	4d 89 e8             	mov    r8,r13
   2504f:	48 89 b5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rsi
   25056:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2505d:	e8 fe e4 00 00       	call   33560 <JS_IsInstanceOf>
   25062:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16043
   25064:	85 c0                	test   eax,eax
   25066:	0f 88 d4 e2 ff ff    	js     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2506c:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   25073:	83 fa f6             	cmp    edx,0xfffffff6
   25076:	76 18                	jbe    25090 <JS_CallInternal+0x24f0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25078:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2507f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25082:	83 e8 01             	sub    eax,0x1
   25085:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25088:	85 c0                	test   eax,eax
   2508a:	0f 8e 89 6b 00 00    	jle    2bc19 <JS_CallInternal+0x9079>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25090:	41 83 fd f6          	cmp    r13d,0xfffffff6
   25094:	76 13                	jbe    250a9 <JS_CallInternal+0x2509>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25096:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   2509a:	83 e8 01             	sub    eax,0x1
   2509d:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   250a1:	85 c0                	test   eax,eax
   250a3:	0f 8e 91 6b 00 00    	jle    2bc3a <JS_CallInternal+0x909a>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   250a9:	31 c0                	xor    eax,eax
   250ab:	85 c9                	test   ecx,ecx
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16047
   250ad:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   250b4:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   250b5:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20448
   250b8:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20449
   250bc:	49 83 c4 01          	add    r12,0x1
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16047
   250c0:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20449
   250c4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   250ca:	49 89 c5             	mov    r13,rax
   250cd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   250d1:	ff e0                	jmp    rax
   250d3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20439
   250d7:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15985
   250de:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   250e2:	4c 8b 4b e0          	mov    r9,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15986
   250e6:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20439
   250ea:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15986
   250ee:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   250f2:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15988
   250f9:	41 83 fd ff          	cmp    r13d,0xffffffff
   250fd:	0f 85 2a 7c 00 00    	jne    2cd2d <JS_CallInternal+0xa18d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15992 (discriminator 1)
   25103:	41 83 fe ff          	cmp    r14d,0xffffffff
   25107:	0f 84 2a 4b 00 00    	je     29c37 <JS_CallInternal+0x7097>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16003
   2510d:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   25114:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2511b:	4c 89 f2             	mov    rdx,r14
   2511e:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   25125:	e8 86 ea 01 00       	call   43bb0 <JS_ValueToAtom>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16004 (discriminator 1)
   2512a:	85 c0                	test   eax,eax
   2512c:	0f 84 0e e2 ff ff    	je     23340 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   25132:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   25139:	89 c2                	mov    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   2513b:	49 8b 49 18          	mov    rcx,QWORD PTR [r9+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   2513f:	8b 71 18             	mov    esi,DWORD PTR [rcx+0x18]
   25142:	21 f2                	and    edx,esi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   25144:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   25148:	48 85 d2             	test   rdx,rdx
   2514b:	0f 84 dc 6f 00 00    	je     2c12d <JS_CallInternal+0x958d>
   25151:	48 8d 34 b5 34 00 00 	lea    rsi,[rsi*4+0x34]
   25158:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   25159:	48 8d 14 d6          	lea    rdx,[rsi+rdx*8]
   2515d:	48 01 ca             	add    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   25160:	3b 42 04             	cmp    eax,DWORD PTR [rdx+0x4]
   25163:	0f 85 b6 6f 00 00    	jne    2c11f <JS_CallInternal+0x957f>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   25169:	3d f2 00 00 00       	cmp    eax,0xf2
   2516e:	0f 8f dc 52 00 00    	jg     2a450 <JS_CallInternal+0x78b0>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16009
   25174:	48 85 d2             	test   rdx,rdx
   25177:	0f 95 c0             	setne  al
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2517a:	41 83 fd f6          	cmp    r13d,0xfffffff6
   2517e:	76 13                	jbe    25193 <JS_CallInternal+0x25f3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25180:	41 8b 49 fc          	mov    ecx,DWORD PTR [r9-0x4]
   25184:	8d 51 ff             	lea    edx,[rcx-0x1]
   25187:	41 89 51 fc          	mov    DWORD PTR [r9-0x4],edx
   2518b:	85 d2                	test   edx,edx
   2518d:	0f 8e 79 59 00 00    	jle    2ab0c <JS_CallInternal+0x7f6c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25193:	41 83 fe f6          	cmp    r14d,0xfffffff6
   25197:	76 1e                	jbe    251b7 <JS_CallInternal+0x2617>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25199:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   251a0:	8b 79 fc             	mov    edi,DWORD PTR [rcx-0x4]
   251a3:	8d 57 ff             	lea    edx,[rdi-0x1]
   251a6:	89 bd 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],edi
   251ac:	89 51 fc             	mov    DWORD PTR [rcx-0x4],edx
   251af:	85 d2                	test   edx,edx
   251b1:	0f 8e f7 53 00 00    	jle    2a5ae <JS_CallInternal+0x7a0e>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   251b7:	0f b6 c0             	movzx  eax,al
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16013
   251ba:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   251c1:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20443
   251c2:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20442
   251c6:	48 83 eb 10          	sub    rbx,0x10
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   251ca:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20443
   251ce:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   251d4:	49 89 c5             	mov    r13,rax
   251d7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   251db:	ff e0                	jmp    rax
   251dd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430
   251e1:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   251e5:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   251e9:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   251ed:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   251f1:	48 89 d7             	mov    rdi,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   251f4:	45 85 c9             	test   r9d,r9d
   251f7:	0f 85 a0 62 00 00    	jne    2b49d <JS_CallInternal+0x88fd>
   251fd:	45 85 f6             	test   r14d,r14d
   25200:	0f 85 68 45 00 00    	jne    2976e <JS_CallInternal+0x6bce>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   25206:	31 c0                	xor    eax,eax
   25208:	44 39 ea             	cmp    edx,r13d
   2520b:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 26)
   2520e:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   25212:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   25216:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 26)
   2521a:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   25221:	00 
   25222:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25228:	49 89 c5             	mov    r13,rax
   2522b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2522f:	ff e0                	jmp    rax
   25231:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429
   25235:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   25239:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   2523d:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   25241:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   25245:	48 89 d7             	mov    rdi,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 1)
   25248:	45 85 c0             	test   r8d,r8d
   2524b:	0f 85 7e 5b 00 00    	jne    2adcf <JS_CallInternal+0x822f>
   25251:	45 85 f6             	test   r14d,r14d
   25254:	0f 85 e6 44 00 00    	jne    29740 <JS_CallInternal+0x6ba0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 3)
   2525a:	31 c0                	xor    eax,eax
   2525c:	44 39 ea             	cmp    edx,r13d
   2525f:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 26)
   25262:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   25266:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 1)
   2526a:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 26)
   2526e:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   25275:	00 
   25276:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2527c:	49 89 c5             	mov    r13,rax
   2527f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25283:	ff e0                	jmp    rax
   25285:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20433
   25289:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15961
   25290:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15960
   25294:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20433
   25298:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15960
   2529c:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   252a0:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15961
   252a7:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   252ab:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15963
   252b2:	41 83 fd ff          	cmp    r13d,0xffffffff
   252b6:	0f 85 7b 72 00 00    	jne    2c537 <JS_CallInternal+0x9997>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15967
   252bc:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   252c3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   252ca:	4c 89 f6             	mov    rsi,r14
   252cd:	e8 de e8 01 00       	call   43bb0 <JS_ValueToAtom>
   252d2:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15968 (discriminator 1)
   252d4:	85 c0                	test   eax,eax
   252d6:	0f 84 64 e0 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15970
   252dc:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   252e3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   252ea:	4c 89 ea             	mov    rdx,r13
   252ed:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   252f3:	e8 e8 8f 04 00       	call   6e2e0 <JS_HasProperty>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   252f8:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15970
   252fe:	41 89 c0             	mov    r8d,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   25301:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   25307:	0f 8f 5d 4c 00 00    	jg     29f6a <JS_CallInternal+0x73ca>
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15972
   2530d:	45 85 c0             	test   r8d,r8d
   25310:	0f 88 2a e0 ff ff    	js     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25316:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   2531d:	76 13                	jbe    25332 <JS_CallInternal+0x2792>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2531f:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   25323:	83 e8 01             	sub    eax,0x1
   25326:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   2532a:	85 c0                	test   eax,eax
   2532c:	0f 8e 3e 61 00 00    	jle    2b470 <JS_CallInternal+0x88d0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25332:	41 83 fd f6          	cmp    r13d,0xfffffff6
   25336:	76 1e                	jbe    25356 <JS_CallInternal+0x27b6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25338:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2533f:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   25342:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   25348:	83 e8 01             	sub    eax,0x1
   2534b:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   2534e:	85 c0                	test   eax,eax
   25350:	0f 8e 3e 65 00 00    	jle    2b894 <JS_CallInternal+0x8cf4>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   25356:	31 c0                	xor    eax,eax
   25358:	45 85 c0             	test   r8d,r8d
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15976
   2535b:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   25362:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   25363:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20436
   25366:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20437
   2536a:	49 83 c4 01          	add    r12,0x1
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15976
   2536e:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20437
   25372:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25378:	49 89 c5             	mov    r13,rax
   2537b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2537f:	ff e0                	jmp    rax
   25381:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373
   25385:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   25389:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   2538d:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   25391:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   25395:	4c 89 f7             	mov    rdi,r14
   25398:	4c 89 ce             	mov    rsi,r9
   2539b:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 1)
   2539e:	45 85 ed             	test   r13d,r13d
   253a1:	0f 85 8f 5c 00 00    	jne    2b036 <JS_CallInternal+0x8496>
   253a7:	45 85 c0             	test   r8d,r8d
   253aa:	0f 85 ec 43 00 00    	jne    2979c <JS_CallInternal+0x6bfc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 3)
   253b0:	31 c0                	xor    eax,eax
   253b2:	45 39 ce             	cmp    r14d,r9d
   253b5:	0f 94 c0             	sete   al
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   253b8:	83 f8 01             	cmp    eax,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 31)
   253bb:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   253c2:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   253c3:	0f 95 c0             	setne  al
   253c6:	0f b6 c0             	movzx  eax,al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 31)
   253c9:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373
   253cd:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 1)
   253d2:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373
   253d6:	49 83 c4 01          	add    r12,0x1
   253da:	49 89 c5             	mov    r13,rax
   253dd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   253e1:	ff e0                	jmp    rax
   253e3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372
   253e7:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   253eb:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   253ef:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   253f3:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   253f7:	4c 89 f7             	mov    rdi,r14
   253fa:	4c 89 ce             	mov    rsi,r9
   253fd:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 1)
   25400:	45 85 ed             	test   r13d,r13d
   25403:	0f 85 e7 5d 00 00    	jne    2b1f0 <JS_CallInternal+0x8650>
   25409:	45 85 c0             	test   r8d,r8d
   2540c:	0f 85 b4 43 00 00    	jne    297c6 <JS_CallInternal+0x6c26>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 3)
   25412:	45 39 ce             	cmp    r14d,r9d
   25415:	0f 94 c0             	sete   al
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   25418:	0f b6 c0             	movzx  eax,al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 31)
   2541b:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   25422:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   25423:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372
   25427:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 1)
   2542c:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372
   25430:	49 83 c4 01          	add    r12,0x1
   25434:	49 89 c5             	mov    r13,rax
   25437:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2543b:	ff e0                	jmp    rax
   2543d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301
   25441:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   25445:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   25449:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2544d:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 1)
   25451:	89 cf                	mov    edi,ecx
   25453:	09 f7                	or     edi,esi
   25455:	0f 85 62 64 00 00    	jne    2b8bd <JS_CallInternal+0x8d1d>
   2545b:	39 d0                	cmp    eax,edx
   2545d:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   25464:	00 
   25465:	0f 9e c0             	setle  al
   25468:	48 83 eb 10          	sub    rbx,0x10
   2546c:	0f b6 c0             	movzx  eax,al
   2546f:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301
   25473:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25478:	49 83 c4 01          	add    r12,0x1
   2547c:	49 89 c5             	mov    r13,rax
   2547f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25483:	ff e0                	jmp    rax
   25485:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300
   25489:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2548d:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   25491:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   25495:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 1)
   25499:	89 cf                	mov    edi,ecx
   2549b:	09 f7                	or     edi,esi
   2549d:	0f 85 7d 5c 00 00    	jne    2b120 <JS_CallInternal+0x8580>
   254a3:	39 d0                	cmp    eax,edx
   254a5:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   254ac:	00 
   254ad:	0f 9c c0             	setl   al
   254b0:	48 83 eb 10          	sub    rbx,0x10
   254b4:	0f b6 c0             	movzx  eax,al
   254b7:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300
   254bb:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   254c0:	49 83 c4 01          	add    r12,0x1
   254c4:	49 89 c5             	mov    r13,rax
   254c7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   254cb:	ff e0                	jmp    rax
   254cd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303
   254d1:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   254d5:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   254d9:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   254dd:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 1)
   254e1:	89 cf                	mov    edi,ecx
   254e3:	09 f7                	or     edi,esi
   254e5:	0f 85 b5 61 00 00    	jne    2b6a0 <JS_CallInternal+0x8b00>
   254eb:	39 c2                	cmp    edx,eax
   254ed:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   254f4:	00 
   254f5:	0f 9d c0             	setge  al
   254f8:	48 83 eb 10          	sub    rbx,0x10
   254fc:	0f b6 c0             	movzx  eax,al
   254ff:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303
   25503:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25508:	49 83 c4 01          	add    r12,0x1
   2550c:	49 89 c5             	mov    r13,rax
   2550f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25513:	ff e0                	jmp    rax
   25515:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20247
   25519:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20247 (discriminator 1)
   2551d:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20245
   25520:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20246
   25524:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20247 (discriminator 1)
   25528:	0f 85 36 5c 00 00    	jne    2b164 <JS_CallInternal+0x85c4>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20248
   2552e:	31 c8                	xor    eax,ecx
   25530:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   25537:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20251
   25538:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   2553c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20259
   25540:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25545:	49 83 c4 01          	add    r12,0x1
   25549:	49 89 c5             	mov    r13,rax
   2554c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25550:	ff e0                	jmp    rax
   25552:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302
   25556:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2555a:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   2555e:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   25562:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 1)
   25566:	89 cf                	mov    edi,ecx
   25568:	09 f7                	or     edi,esi
   2556a:	0f 85 74 61 00 00    	jne    2b6e4 <JS_CallInternal+0x8b44>
   25570:	39 c2                	cmp    edx,eax
   25572:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   25579:	00 
   2557a:	0f 9f c0             	setg   al
   2557d:	48 83 eb 10          	sub    rbx,0x10
   25581:	0f b6 c0             	movzx  eax,al
   25584:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302
   25588:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2558d:	49 83 c4 01          	add    r12,0x1
   25591:	49 89 c5             	mov    r13,rax
   25594:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25598:	ff e0                	jmp    rax
   2559a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20229
   2559e:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20229 (discriminator 1)
   255a2:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20227
   255a5:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20228
   255a9:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20229 (discriminator 1)
   255ad:	0f 85 85 62 00 00    	jne    2b838 <JS_CallInternal+0x8c98>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20230
   255b3:	09 c8                	or     eax,ecx
   255b5:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   255bc:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20233
   255bd:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   255c1:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20241
   255c5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   255ca:	49 83 c4 01          	add    r12,0x1
   255ce:	49 89 c5             	mov    r13,rax
   255d1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   255d5:	ff e0                	jmp    rax
   255d7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20211
   255db:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20211 (discriminator 1)
   255df:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20209
   255e2:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20210
   255e6:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20211 (discriminator 1)
   255ea:	0f 85 7c 5f 00 00    	jne    2b56c <JS_CallInternal+0x89cc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20212
   255f0:	21 c8                	and    eax,ecx
   255f2:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   255f9:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20215
   255fa:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   255fe:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20223
   25602:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25607:	49 83 c4 01          	add    r12,0x1
   2560b:	49 89 c5             	mov    r13,rax
   2560e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25612:	ff e0                	jmp    rax
   25614:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18078
   25618:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
   2561c:	48 8b 53 d0          	mov    rdx,QWORD PTR [rbx-0x30]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   25620:	83 f8 f6             	cmp    eax,0xfffffff6
   25623:	76 04                	jbe    25629 <JS_CallInternal+0x2a89>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   25625:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18078
   25629:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18079
   2562d:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18078
   25631:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25634:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   25638:	83 f8 f6             	cmp    eax,0xfffffff6
   2563b:	76 04                	jbe    25641 <JS_CallInternal+0x2aa1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2563d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18079
   25641:	48 89 43 18          	mov    QWORD PTR [rbx+0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18080
   25645:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18079
   25649:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   2564d:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   25651:	83 f8 f6             	cmp    eax,0xfffffff6
   25654:	76 04                	jbe    2565a <JS_CallInternal+0x2aba>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   25656:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18080
   2565a:	48 89 53 20          	mov    QWORD PTR [rbx+0x20],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18082
   2565e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18081
   25662:	48 83 c3 30          	add    rbx,0x30
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18080
   25666:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18082
   2566a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25670:	49 89 c5             	mov    r13,rax
   25673:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25677:	ff e0                	jmp    rax
   25679:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467
   2567d:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   25681:	48 8b 7b e8          	mov    rdi,QWORD PTR [rbx-0x18]
   25685:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   25689:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   2568d:	49 89 f5             	mov    r13,rsi
   25690:	49 89 fe             	mov    r14,rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 1)
   25693:	83 ff ff             	cmp    edi,0xffffffff
   25696:	0f 85 d4 43 00 00    	jne    29a70 <JS_CallInternal+0x6ed0>
   2569c:	45 85 c0             	test   r8d,r8d
   2569f:	0f 85 cb 43 00 00    	jne    29a70 <JS_CallInternal+0x6ed0>
   256a5:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   256aa:	0f 85 c0 43 00 00    	jne    29a70 <JS_CallInternal+0x6ed0>
   256b0:	3b 4e 38             	cmp    ecx,DWORD PTR [rsi+0x38]
   256b3:	0f 83 b7 43 00 00    	jae    29a70 <JS_CallInternal+0x6ed0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 9)
   256b9:	89 c8                	mov    eax,ecx
   256bb:	48 c1 e0 04          	shl    rax,0x4
   256bf:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   256c3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   256c6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   256ca:	83 f8 f6             	cmp    eax,0xfffffff6
   256cd:	76 04                	jbe    256d3 <JS_CallInternal+0x2b33>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   256cf:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   256d3:	41 83 fe f6          	cmp    r14d,0xfffffff6
   256d7:	76 13                	jbe    256ec <JS_CallInternal+0x2b4c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   256d9:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   256dd:	8d 57 ff             	lea    edx,[rdi-0x1]
   256e0:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   256e4:	85 d2                	test   edx,edx
   256e6:	0f 8e a4 51 00 00    	jle    2a890 <JS_CallInternal+0x7cf0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 1)
   256ec:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19468
   256f0:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 1)
   256f4:	48 83 eb 10          	sub    rbx,0x10
   256f8:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19468
   256fc:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25702:	49 89 c5             	mov    r13,rax
   25705:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25709:	ff e0                	jmp    rax
   2570b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19480
   2570f:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19480 (discriminator 1)
   25713:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   25717:	83 f8 ff             	cmp    eax,0xffffffff
   2571a:	0f 85 71 64 00 00    	jne    2bb91 <JS_CallInternal+0x8ff1>
   25720:	45 85 ed             	test   r13d,r13d
   25723:	0f 85 ab 46 00 00    	jne    29dd4 <JS_CallInternal+0x7234>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19482
   25729:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19483
   2572d:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19484 (discriminator 1)
   25731:	66 83 7a 12 02       	cmp    WORD PTR [rdx+0x12],0x2
   25736:	0f 85 fd 46 00 00    	jne    29e39 <JS_CallInternal+0x7299>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19486 (discriminator 1)
   2573c:	3b 42 38             	cmp    eax,DWORD PTR [rdx+0x38]
   2573f:	0f 83 f4 46 00 00    	jae    29e39 <JS_CallInternal+0x7299>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19488
   25745:	89 c0                	mov    eax,eax
   25747:	48 c1 e0 04          	shl    rax,0x4
   2574b:	48 03 42 30          	add    rax,QWORD PTR [rdx+0x30]
   2574f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   25752:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   25756:	83 f8 f6             	cmp    eax,0xfffffff6
   25759:	76 04                	jbe    2575f <JS_CallInternal+0x2bbf>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2575b:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19516
   2575f:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19518
   25762:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19516
   25766:	48 83 c3 10          	add    rbx,0x10
   2576a:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19518
   2576e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25774:	49 89 c5             	mov    r13,rax
   25777:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2577b:	ff e0                	jmp    rax
   2577d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 1)
   25781:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471
   25785:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   25789:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
   2578d:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   25791:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 1)
   25795:	0f 85 07 43 00 00    	jne    29aa2 <JS_CallInternal+0x6f02>
   2579b:	85 ff                	test   edi,edi
   2579d:	0f 85 ff 42 00 00    	jne    29aa2 <JS_CallInternal+0x6f02>
   257a3:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   257a8:	0f 85 f4 42 00 00    	jne    29aa2 <JS_CallInternal+0x6f02>
   257ae:	44 3b 46 38          	cmp    r8d,DWORD PTR [rsi+0x38]
   257b2:	0f 83 ea 42 00 00    	jae    29aa2 <JS_CallInternal+0x6f02>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 9)
   257b8:	44 89 c0             	mov    eax,r8d
   257bb:	48 c1 e0 04          	shl    rax,0x4
   257bf:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   257c3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   257c6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   257ca:	83 f8 f6             	cmp    eax,0xfffffff6
   257cd:	76 04                	jbe    257d3 <JS_CallInternal+0x2c33>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   257cf:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 18)
   257d3:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19472
   257d7:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 18)
   257db:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19472
   257df:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   257e5:	49 89 c5             	mov    r13,rax
   257e8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   257ec:	ff e0                	jmp    rax
   257ee:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19632
   257f2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19633
   257f9:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   257fd:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   25801:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19632
   25808:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19633
   2580c:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   25810:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   25817:	e8 94 e3 01 00       	call   43bb0 <JS_ValueToAtom>
   2581c:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19634 (discriminator 1)
   2581f:	45 85 ed             	test   r13d,r13d
   25822:	0f 84 18 db ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19636 (discriminator 2)
   25828:	83 7b d8 03          	cmp    DWORD PTR [rbx-0x28],0x3
   2582c:	0f 84 5d 5f 00 00    	je     2b78f <JS_CallInternal+0x8bef>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19645
   25832:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   25836:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   2583a:	44 89 e9             	mov    ecx,r13d
   2583d:	4c 8d 73 d0          	lea    r14,[rbx-0x30]
   25841:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25848:	e8 93 8a 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19646 (discriminator 1)
   2584d:	85 c0                	test   eax,eax
   2584f:	0f 8e 3d 59 00 00    	jle    2b192 <JS_CallInternal+0x85f2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19657
   25855:	48 83 ec 08          	sub    rsp,0x8
   25859:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2585d:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   25861:	44 89 e9             	mov    ecx,r13d
   25864:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   25867:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   2586b:	68 00 80 00 00       	push   0x8000
   25870:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   25874:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2587b:	41 ff 36             	push   QWORD PTR [r14]
   2587e:	e8 ad 83 00 00       	call   2dc30 <JS_SetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   25883:	48 83 c4 20          	add    rsp,0x20
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19657
   25887:	89 c3                	mov    ebx,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   25889:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   25890:	0f 8f e5 48 00 00    	jg     2a17b <JS_CallInternal+0x75db>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19659
   25896:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2589d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   258a1:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   258a4:	83 fa f6             	cmp    edx,0xfffffff6
   258a7:	76 11                	jbe    258ba <JS_CallInternal+0x2d1a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   258a9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   258ac:	83 e8 01             	sub    eax,0x1
   258af:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   258b2:	85 c0                	test   eax,eax
   258b4:	0f 8e 36 5f 00 00    	jle    2b7f0 <JS_CallInternal+0x8c50>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19660
   258ba:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   258be:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   258c1:	83 fa f6             	cmp    edx,0xfffffff6
   258c4:	76 11                	jbe    258d7 <JS_CallInternal+0x2d37>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   258c6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   258c9:	83 e8 01             	sub    eax,0x1
   258cc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   258cf:	85 c0                	test   eax,eax
   258d1:	0f 8e e3 54 00 00    	jle    2adba <JS_CallInternal+0x821a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19662 (discriminator 1)
   258d7:	85 db                	test   ebx,ebx
   258d9:	0f 88 66 64 00 00    	js     2bd45 <JS_CallInternal+0x91a5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19665
   258df:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19661
   258e4:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19665
   258e7:	49 83 c4 01          	add    r12,0x1
   258eb:	49 89 c5             	mov    r13,rax
   258ee:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   258f2:	ff e0                	jmp    rax
   258f4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19584 (discriminator 1)
   258f8:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
   258fc:	0f 85 e9 41 00 00    	jne    29aeb <JS_CallInternal+0x6f4b>
   25902:	44 8b 5b e8          	mov    r11d,DWORD PTR [rbx-0x18]
   25906:	45 85 db             	test   r11d,r11d
   25909:	0f 85 dc 41 00 00    	jne    29aeb <JS_CallInternal+0x6f4b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19586
   2590f:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19587
   25913:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19588 (discriminator 1)
   25917:	66 83 79 12 02       	cmp    WORD PTR [rcx+0x12],0x2
   2591c:	0f 85 c9 41 00 00    	jne    29aeb <JS_CallInternal+0x6f4b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19590
   25922:	8b 51 38             	mov    edx,DWORD PTR [rcx+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19590 (discriminator 1)
   25925:	39 d0                	cmp    eax,edx
   25927:	0f 83 20 64 00 00    	jae    2bd4d <JS_CallInternal+0x91ad>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19612
   2592d:	89 c0                	mov    eax,eax
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2592f:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19612
   25934:	48 c1 e0 04          	shl    rax,0x4
   25938:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2593c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25940:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   25943:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25946:	83 fa f6             	cmp    edx,0xfffffff6
   25949:	76 11                	jbe    2595c <JS_CallInternal+0x2dbc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2594b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2594e:	83 e8 01             	sub    eax,0x1
   25951:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25954:	85 c0                	test   eax,eax
   25956:	0f 8e bf 63 00 00    	jle    2bd1b <JS_CallInternal+0x917b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19614
   2595c:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   25960:	48 83 eb 30          	sub    rbx,0x30
   25964:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25967:	83 fa f6             	cmp    edx,0xfffffff6
   2596a:	76 11                	jbe    2597d <JS_CallInternal+0x2ddd>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2596c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2596f:	83 e8 01             	sub    eax,0x1
   25972:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25975:	85 c0                	test   eax,eax
   25977:	0f 8e b3 63 00 00    	jle    2bd30 <JS_CallInternal+0x9190>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19626
   2597d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25982:	49 83 c4 01          	add    r12,0x1
   25986:	49 89 c5             	mov    r13,rax
   25989:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2598d:	ff e0                	jmp    rax
   2598f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19293
   25993:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8412 (discriminator 1)
   25997:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19293
   2599b:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   2599f:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   259a3:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   259a7:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   259ab:	49 8b 46 08          	mov    rax,QWORD PTR [r14+0x8]
   259af:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8412 (discriminator 1)
   259b6:	0f 85 b1 5d 00 00    	jne    2b76d <JS_CallInternal+0x8bcd>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8417 (discriminator 1)
   259bc:	83 f8 f8             	cmp    eax,0xfffffff8
   259bf:	0f 85 63 5d 00 00    	jne    2b728 <JS_CallInternal+0x8b88>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9029
   259c5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   259cc:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   259d3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   259d7:	e8 f4 11 ff ff       	call   16bd0 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   259dc:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9029
   259e3:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   259e5:	49 8b 48 18          	mov    rcx,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   259e9:	89 f2                	mov    edx,esi
   259eb:	8b 41 18             	mov    eax,DWORD PTR [rcx+0x18]
   259ee:	21 c2                	and    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   259f0:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   259f4:	48 85 d2             	test   rdx,rdx
   259f7:	0f 84 2d 38 00 00    	je     2922a <JS_CallInternal+0x668a>
   259fd:	48 8d 3c 85 34 00 00 	lea    rdi,[rax*4+0x34]
   25a04:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   25a05:	48 8d 04 d7          	lea    rax,[rdi+rdx*8]
   25a09:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   25a0c:	3b 70 04             	cmp    esi,DWORD PTR [rax+0x4]
   25a0f:	0f 85 07 38 00 00    	jne    2921c <JS_CallInternal+0x667c>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8425
   25a15:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25a1c:	48 8d 0d 21 77 0a 00 	lea    rcx,[rip+0xa7721]        # cd144 <_IO_stdin_used+0x144>
   25a23:	48 8d 15 66 b4 0a 00 	lea    rdx,[rip+0xab466]        # d0e90 <_IO_stdin_used+0x3e90>
   25a2a:	31 c0                	xor    eax,eax
   25a2c:	e8 4f b5 00 00       	call   30f80 <__JS_ThrowTypeErrorAtom>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25a31:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   25a38:	76 13                	jbe    25a4d <JS_CallInternal+0x2ead>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25a3a:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   25a3e:	83 e8 01             	sub    eax,0x1
   25a41:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   25a45:	85 c0                	test   eax,eax
   25a47:	0f 8e 29 6a 00 00    	jle    2c476 <JS_CallInternal+0x98d6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19294
   25a4d:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   25a51:	49 8b 36             	mov    rsi,QWORD PTR [r14]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19295
   25a54:	4c 89 f3             	mov    rbx,r14
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25a57:	83 fa f6             	cmp    edx,0xfffffff6
   25a5a:	0f 86 e0 d8 ff ff    	jbe    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25a60:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25a63:	83 e8 01             	sub    eax,0x1
   25a66:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25a69:	85 c0                	test   eax,eax
   25a6b:	0f 8f cf d8 ff ff    	jg     23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   25a71:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   25a78:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   25a7c:	e8 9f 6e ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19296
   25a81:	e9 ba d8 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   25a86:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   25a8d:	00 00 00 
   25a90:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19281
   25a94:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   25a98:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   25a9c:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   25a9f:	48 83 eb 30          	sub    rbx,0x30
   25aa3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8470 (discriminator 1)
   25aa7:	83 7b 08 ff          	cmp    DWORD PTR [rbx+0x8],0xffffffff
   25aab:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   25aae:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   25ab1:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   25ab8:	49 8b 4e 08          	mov    rcx,QWORD PTR [r14+0x8]
   25abc:	0f 85 80 5c 00 00    	jne    2b742 <JS_CallInternal+0x8ba2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8475 (discriminator 1)
   25ac2:	83 f9 f8             	cmp    ecx,0xfffffff8
   25ac5:	0f 85 b5 57 00 00    	jne    2b280 <JS_CallInternal+0x86e0>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9029
   25acb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   25ad2:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   25ad9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25add:	48 89 c7             	mov    rdi,rax
   25ae0:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   25ae7:	e8 e4 10 ff ff       	call   16bd0 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   25aec:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9029
   25af3:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   25af5:	48 8b 7a 18          	mov    rdi,QWORD PTR [rdx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   25af9:	8b 4f 18             	mov    ecx,DWORD PTR [rdi+0x18]
   25afc:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   25afe:	8b 44 87 38          	mov    eax,DWORD PTR [rdi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   25b02:	48 85 c0             	test   rax,rax
   25b05:	0f 84 78 61 00 00    	je     2bc83 <JS_CallInternal+0x90e3>
   25b0b:	4c 8d 04 8d 34 00 00 	lea    r8,[rcx*4+0x34]
   25b12:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   25b13:	49 8d 0c c0          	lea    rcx,[r8+rax*8]
   25b17:	48 01 f9             	add    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   25b1a:	3b 71 04             	cmp    esi,DWORD PTR [rcx+0x4]
   25b1d:	0f 85 53 61 00 00    	jne    2bc76 <JS_CallInternal+0x90d6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   25b23:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
   25b27:	48 c1 e0 04          	shl    rax,0x4
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   25b2b:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   25b32:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   25b37:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25b3b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   25b3e:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
   25b42:	4c 89 28             	mov    QWORD PTR [rax],r13
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25b45:	83 fa f6             	cmp    edx,0xfffffff6
   25b48:	76 11                	jbe    25b5b <JS_CallInternal+0x2fbb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25b4a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b4d:	83 e8 01             	sub    eax,0x1
   25b50:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b53:	85 c0                	test   eax,eax
   25b55:	0f 8e 01 5c 00 00    	jle    2b75c <JS_CallInternal+0x8bbc>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8489
   25b5b:	45 31 ed             	xor    r13d,r13d
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19282
   25b5e:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   25b62:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25b65:	83 fa f6             	cmp    edx,0xfffffff6
   25b68:	76 11                	jbe    25b7b <JS_CallInternal+0x2fdb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25b6a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b6d:	83 e8 01             	sub    eax,0x1
   25b70:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b73:	85 c0                	test   eax,eax
   25b75:	0f 8e 44 4c 00 00    	jle    2a7bf <JS_CallInternal+0x7c1f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19283
   25b7b:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   25b7f:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25b82:	83 fa f6             	cmp    edx,0xfffffff6
   25b85:	76 11                	jbe    25b98 <JS_CallInternal+0x2ff8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25b87:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b8a:	83 e8 01             	sub    eax,0x1
   25b8d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b90:	85 c0                	test   eax,eax
   25b92:	0f 8e 12 4c 00 00    	jle    2a7aa <JS_CallInternal+0x7c0a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19285 (discriminator 1)
   25b98:	41 83 fd ff          	cmp    r13d,0xffffffff
   25b9c:	0f 84 9e d7 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19288
   25ba2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25ba7:	49 83 c4 01          	add    r12,0x1
   25bab:	49 89 c5             	mov    r13,rax
   25bae:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25bb2:	ff e0                	jmp    rax
   25bb4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19268
   25bb8:	48 8d 43 e0          	lea    rax,[rbx-0x20]
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8447 (discriminator 1)
   25bbc:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19268
   25bc0:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   25bc4:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   25bc8:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   25bcc:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   25bd0:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8447 (discriminator 1)
   25bd7:	0f 85 89 5f 00 00    	jne    2bb66 <JS_CallInternal+0x8fc6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8450 (discriminator 1)
   25bdd:	41 83 f9 f8          	cmp    r9d,0xfffffff8
   25be1:	0f 85 55 5f 00 00    	jne    2bb3c <JS_CallInternal+0x8f9c>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9029
   25be7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   25bee:	4c 89 ee             	mov    rsi,r13
   25bf1:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   25bf8:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   25bff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25c03:	48 89 c7             	mov    rdi,rax
   25c06:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   25c0d:	e8 be 0f ff ff       	call   16bd0 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   25c12:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9029
   25c19:	89 c2                	mov    edx,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   25c1b:	49 8b 70 18          	mov    rsi,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   25c1f:	8b 4e 18             	mov    ecx,DWORD PTR [rsi+0x18]
   25c22:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   25c24:	8b 44 86 38          	mov    eax,DWORD PTR [rsi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   25c28:	48 85 c0             	test   rax,rax
   25c2b:	0f 84 a7 5f 00 00    	je     2bbd8 <JS_CallInternal+0x9038>
   25c31:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   25c38:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   25c3f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   25c40:	48 8d 0c c7          	lea    rcx,[rdi+rax*8]
   25c44:	48 01 f1             	add    rcx,rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   25c47:	3b 51 04             	cmp    edx,DWORD PTR [rcx+0x4]
   25c4a:	0f 85 7b 5f 00 00    	jne    2bbcb <JS_CallInternal+0x902b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   25c50:	49 8b 50 20          	mov    rdx,QWORD PTR [r8+0x20]
   25c54:	48 c1 e0 04          	shl    rax,0x4
   25c58:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8459
   25c5d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25c60:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   25c64:	83 f8 f6             	cmp    eax,0xfffffff6
   25c67:	76 04                	jbe    25c6d <JS_CallInternal+0x30cd>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   25c69:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:713
   25c6d:	48 89 d1             	mov    rcx,rdx
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:643
   25c70:	41 89 c0             	mov    r8d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25c73:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   25c77:	76 13                	jbe    25c8c <JS_CallInternal+0x30ec>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25c79:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   25c7d:	8d 57 ff             	lea    edx,[rdi-0x1]
   25c80:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   25c84:	85 d2                	test   edx,edx
   25c86:	0f 8e 80 4b 00 00    	jle    2a80c <JS_CallInternal+0x7c6c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19270
   25c8c:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   25c93:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
   25c97:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25c9a:	83 fa f6             	cmp    edx,0xfffffff6
   25c9d:	76 11                	jbe    25cb0 <JS_CallInternal+0x3110>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25c9f:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   25ca2:	83 ef 01             	sub    edi,0x1
   25ca5:	89 7e fc             	mov    DWORD PTR [rsi-0x4],edi
   25ca8:	85 ff                	test   edi,edi
   25caa:	0f 8e a1 4b 00 00    	jle    2a851 <JS_CallInternal+0x7cb1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19271
   25cb0:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   25cb4:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19272
   25cb8:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19273 (discriminator 2)
   25cbb:	41 83 f8 06          	cmp    r8d,0x6
   25cbf:	0f 84 7b d6 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19276
   25cc5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25cca:	49 83 c4 01          	add    r12,0x1
   25cce:	49 89 c5             	mov    r13,rax
   25cd1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25cd5:	ff e0                	jmp    rax
   25cd7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19257
   25cdb:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   25cdf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19256
   25ce6:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19257
   25ceb:	e8 70 df 00 00       	call   33c60 <JS_NewSymbolFromAtom.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19258 (discriminator 1)
   25cf0:	83 fa 06             	cmp    edx,0x6
   25cf3:	0f 84 1f 52 00 00    	je     2af18 <JS_CallInternal+0x8378>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19260
   25cf9:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19262
   25cfc:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19260
   25d00:	48 83 c3 10          	add    rbx,0x10
   25d04:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19262
   25d08:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25d0e:	49 89 c5             	mov    r13,rax
   25d11:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25d15:	ff e0                	jmp    rax
   25d17:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19221
   25d1b:	4c 8b 73 e8          	mov    r14,QWORD PTR [rbx-0x18]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   25d1f:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19219
   25d23:	4d 8d 54 24 04       	lea    r10,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19221
   25d28:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   25d2c:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   25d30:	4c 8b 6b e0          	mov    r13,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19222 (discriminator 1)
   25d34:	41 83 fe ff          	cmp    r14d,0xffffffff
   25d38:	0f 85 29 3e 00 00    	jne    29b67 <JS_CallInternal+0x6fc7>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   25d3e:	4d 8b 4d 18          	mov    r9,QWORD PTR [r13+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   25d42:	41 8b 79 18          	mov    edi,DWORD PTR [r9+0x18]
   25d46:	89 fe                	mov    esi,edi
   25d48:	21 ce                	and    esi,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   25d4a:	41 8b 74 b1 38       	mov    esi,DWORD PTR [r9+rsi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   25d4f:	48 85 f6             	test   rsi,rsi
   25d52:	0f 84 0f 3e 00 00    	je     29b67 <JS_CallInternal+0x6fc7>
   25d58:	48 8d 3c bd 34 00 00 	lea    rdi,[rdi*4+0x34]
   25d5f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   25d60:	4c 8d 04 f7          	lea    r8,[rdi+rsi*8]
   25d64:	4d 01 c8             	add    r8,r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   25d67:	41 39 48 04          	cmp    DWORD PTR [r8+0x4],ecx
   25d6b:	0f 85 e7 3d 00 00    	jne    29b58 <JS_CallInternal+0x6fb8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   25d71:	49 8b 7d 20          	mov    rdi,QWORD PTR [r13+0x20]
   25d75:	48 c1 e6 04          	shl    rsi,0x4
   25d79:	48 8d 7c 37 f0       	lea    rdi,[rdi+rsi*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19227
   25d7e:	41 0f b6 70 03       	movzx  esi,BYTE PTR [r8+0x3]
   25d83:	40 c0 ee 02          	shr    sil,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19227 (discriminator 1)
   25d87:	83 e6 3a             	and    esi,0x3a
   25d8a:	40 80 fe 02          	cmp    sil,0x2
   25d8e:	0f 85 d3 3d 00 00    	jne    29b67 <JS_CallInternal+0x6fc7>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   25d94:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   25d98:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   25d9d:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   25da0:	0f 11 37             	movups XMMWORD PTR [rdi],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25da3:	83 fa f6             	cmp    edx,0xfffffff6
   25da6:	76 11                	jbe    25db9 <JS_CallInternal+0x3219>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25da8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25dab:	83 e8 01             	sub    eax,0x1
   25dae:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25db1:	85 c0                	test   eax,eax
   25db3:	0f 8e a8 5e 00 00    	jle    2bc61 <JS_CallInternal+0x90c1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25db9:	41 83 fe f6          	cmp    r14d,0xfffffff6
   25dbd:	76 13                	jbe    25dd2 <JS_CallInternal+0x3232>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25dbf:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   25dc3:	83 e8 01             	sub    eax,0x1
   25dc6:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   25dca:	85 c0                	test   eax,eax
   25dcc:	0f 8e 06 60 00 00    	jle    2bdd8 <JS_CallInternal+0x9238>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19235
   25dd2:	48 83 eb 20          	sub    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19248
   25dd6:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   25ddc:	49 83 c4 05          	add    r12,0x5
   25de0:	49 89 c5             	mov    r13,rax
   25de3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25de7:	ff e0                	jmp    rax
   25de9:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19867
   25ded:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19866
   25df1:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   25df5:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19867
   25df9:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19868 (discriminator 1)
   25dfd:	89 c7                	mov    edi,eax
   25dff:	09 f7                	or     edi,esi
   25e01:	0f 85 07 58 00 00    	jne    2b60e <JS_CallInternal+0x8a6e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19873
   25e07:	48 63 f2             	movsxd rsi,edx
   25e0a:	48 63 c1             	movsxd rax,ecx
   25e0d:	48 0f af c6          	imul   rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19874
   25e11:	48 63 f0             	movsxd rsi,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19874 (discriminator 1)
   25e14:	48 39 c6             	cmp    rsi,rax
   25e17:	0f 85 d5 57 00 00    	jne    2b5f2 <JS_CallInternal+0x8a52>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19879 (discriminator 1)
   25e1d:	48 85 f6             	test   rsi,rsi
   25e20:	0f 84 cd 5f 00 00    	je     2bdf3 <JS_CallInternal+0x9253>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   25e26:	83 e0 ff             	and    eax,0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19884
   25e29:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   25e2d:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19883
   25e31:	31 c0                	xor    eax,eax
   25e33:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19910
   25e37:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25e3c:	48 89 d3             	mov    rbx,rdx
   25e3f:	49 83 c4 01          	add    r12,0x1
   25e43:	49 89 c5             	mov    r13,rax
   25e46:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25e4a:	ff e0                	jmp    rax
   25e4c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19828
   25e50:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19827
   25e54:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   25e58:	48 8b 7b e0          	mov    rdi,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19828
   25e5c:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19829 (discriminator 1)
   25e60:	89 c6                	mov    esi,eax
   25e62:	09 d6                	or     esi,edx
   25e64:	0f 85 dd 5b 00 00    	jne    2ba47 <JS_CallInternal+0x8ea7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19832
   25e6a:	89 fa                	mov    edx,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19831
   25e6c:	48 63 f1             	movsxd rsi,ecx
   25e6f:	48 63 c7             	movsxd rax,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19832
   25e72:	29 ca                	sub    edx,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19831
   25e74:	48 29 f0             	sub    rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19832
   25e77:	48 63 ca             	movsxd rcx,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19832 (discriminator 1)
   25e7a:	48 39 c1             	cmp    rcx,rax
   25e7d:	0f 85 ac 5b 00 00    	jne    2ba2f <JS_CallInternal+0x8e8f>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   25e83:	89 d0                	mov    eax,edx
   25e85:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19835
   25e89:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19837
   25e8b:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
   25e8f:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19861
   25e93:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25e98:	48 89 d3             	mov    rbx,rdx
   25e9b:	49 83 c4 01          	add    r12,0x1
   25e9f:	49 89 c5             	mov    r13,rax
   25ea2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ea6:	ff e0                	jmp    rax
   25ea8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19784
   25eac:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   25eb1:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19781
   25eb8:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19783
   25ebd:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   25ec1:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19784
   25ec5:	49 c1 e5 04          	shl    r13,0x4
   25ec9:	49 01 c5             	add    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19785 (discriminator 1)
   25ecc:	44 89 f1             	mov    ecx,r14d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19785
   25ecf:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19785 (discriminator 1)
   25ed3:	09 d1                	or     ecx,edx
   25ed5:	0f 85 aa 5b 00 00    	jne    2ba85 <JS_CallInternal+0x8ee5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19787
   25edb:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   25edf:	49 63 c8             	movsxd rcx,r8d
   25ee2:	48 63 d0             	movsxd rdx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19788
   25ee5:	44 01 c0             	add    eax,r8d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19787
   25ee8:	48 01 ca             	add    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19788
   25eeb:	48 63 c8             	movsxd rcx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19788 (discriminator 1)
   25eee:	48 39 d1             	cmp    rcx,rdx
   25ef1:	0f 85 1f 5b 00 00    	jne    2ba16 <JS_CallInternal+0x8e76>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   25ef7:	89 c0                	mov    eax,eax
   25ef9:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19791
   25efd:	31 c0                	xor    eax,eax
   25eff:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19793
   25f03:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19823
   25f07:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   25f0d:	49 83 c4 02          	add    r12,0x2
   25f11:	49 89 c5             	mov    r13,rax
   25f14:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25f18:	ff e0                	jmp    rax
   25f1a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19732
   25f1e:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19731
   25f22:	4c 8b 5b e8          	mov    r11,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19732
   25f26:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19731
   25f2a:	4c 8b 53 e0          	mov    r10,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19733 (discriminator 1)
   25f2e:	41 89 fe             	mov    r14d,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19731
   25f31:	4c 89 de             	mov    rsi,r11
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19732
   25f34:	48 89 f9             	mov    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19733 (discriminator 1)
   25f37:	45 09 de             	or     r14d,r11d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19732
   25f3a:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19733 (discriminator 1)
   25f3d:	0f 85 00 50 00 00    	jne    2af43 <JS_CallInternal+0x83a3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19735
   25f43:	49 63 ca             	movsxd rcx,r10d
   25f46:	49 63 f0             	movsxd rsi,r8d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19736
   25f49:	44 01 d0             	add    eax,r10d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19735
   25f4c:	48 01 f1             	add    rcx,rsi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19736
   25f4f:	48 63 d0             	movsxd rdx,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19736 (discriminator 1)
   25f52:	48 39 ca             	cmp    rdx,rcx
   25f55:	0f 85 d0 4f 00 00    	jne    2af2b <JS_CallInternal+0x838b>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   25f5b:	89 c0                	mov    eax,eax
   25f5d:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19739
   25f61:	31 c0                	xor    eax,eax
   25f63:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19741
   25f67:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19774
   25f6b:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25f70:	49 83 c4 01          	add    r12,0x1
   25f74:	49 89 c5             	mov    r13,rax
   25f77:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25f7b:	ff e0                	jmp    rax
   25f7d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19339
   25f81:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19340
   25f88:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   25f8c:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19339
   25f90:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19341 (discriminator 1)
   25f94:	41 83 fe 02          	cmp    r14d,0x2
   25f98:	0f 84 74 37 00 00    	je     29712 <JS_CallInternal+0x6b72>
   25f9e:	41 83 fe ff          	cmp    r14d,0xffffffff
   25fa2:	0f 84 6a 37 00 00    	je     29712 <JS_CallInternal+0x6b72>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   25fa8:	41 83 fe f6          	cmp    r14d,0xfffffff6
   25fac:	76 13                	jbe    25fc1 <JS_CallInternal+0x3421>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   25fae:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   25fb2:	83 e8 01             	sub    eax,0x1
   25fb5:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   25fb9:	85 c0                	test   eax,eax
   25fbb:	0f 8e 62 4a 00 00    	jle    2aa23 <JS_CallInternal+0x7e83>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19348
   25fc1:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19346
   25fc6:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19348
   25fca:	49 83 c4 01          	add    r12,0x1
   25fce:	49 89 c5             	mov    r13,rax
   25fd1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25fd5:	ff e0                	jmp    rax
   25fd7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19331
   25fdb:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   25fdf:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   25fe3:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25fe7:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   25feb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25ff2:	e8 39 df 01 00       	call   43f30 <JS_DefineObjectNameComputed.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19332 (discriminator 1)
   25ff7:	85 c0                	test   eax,eax
   25ff9:	0f 88 41 d3 ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19335
   25fff:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26004:	49 83 c4 01          	add    r12,0x1
   26008:	49 89 c5             	mov    r13,rax
   2600b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2600f:	ff e0                	jmp    rax
   26011:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19562
   26015:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19563
   2601c:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   26020:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   26024:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2602b:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19562
   2602f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19563
   26033:	e8 78 db 01 00       	call   43bb0 <JS_ValueToAtom>
   26038:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19564 (discriminator 1)
   2603b:	45 85 ed             	test   r13d,r13d
   2603e:	0f 84 fc d2 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19566
   26044:	48 83 ec 08          	sub    rsp,0x8
   26048:	4c 8d 53 e0          	lea    r10,[rbx-0x20]
   2604c:	48 8d 43 d0          	lea    rax,[rbx-0x30]
   26050:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   26054:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2605b:	4c 8b 4b d8          	mov    r9,QWORD PTR [rbx-0x28]
   2605f:	44 89 e9             	mov    ecx,r13d
   26062:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   26066:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2606d:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   26071:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26078:	6a 00                	push   0x0
   2607a:	e8 81 6e 00 00       	call   2cf00 <JS_GetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2607f:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   26086:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19566
   2608d:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   26094:	48 89 d0             	mov    rax,rdx
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   26097:	5a                   	pop    rdx
   26098:	59                   	pop    rcx
   26099:	0f 8f fb 3f 00 00    	jg     2a09a <JS_CallInternal+0x74fa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19568 (discriminator 2)
   2609f:	83 f8 06             	cmp    eax,0x6
   260a2:	0f 84 98 d2 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19570
   260a8:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   260ac:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   260af:	83 fa f6             	cmp    edx,0xfffffff6
   260b2:	76 11                	jbe    260c5 <JS_CallInternal+0x3525>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   260b4:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   260b7:	83 e9 01             	sub    ecx,0x1
   260ba:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   260bd:	85 c9                	test   ecx,ecx
   260bf:	0f 8e f1 4d 00 00    	jle    2aeb6 <JS_CallInternal+0x8316>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19571
   260c5:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   260c9:	49 8b 32             	mov    rsi,QWORD PTR [r10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   260cc:	83 fa f6             	cmp    edx,0xfffffff6
   260cf:	76 11                	jbe    260e2 <JS_CallInternal+0x3542>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   260d1:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   260d4:	83 e9 01             	sub    ecx,0x1
   260d7:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   260da:	85 c9                	test   ecx,ecx
   260dc:	0f 8e 05 4e 00 00    	jle    2aee7 <JS_CallInternal+0x8347>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19572
   260e2:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   260e9:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   260ed:	48 8b 31             	mov    rsi,QWORD PTR [rcx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   260f0:	83 fa f6             	cmp    edx,0xfffffff6
   260f3:	76 11                	jbe    26106 <JS_CallInternal+0x3566>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   260f5:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   260f8:	83 e9 01             	sub    ecx,0x1
   260fb:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   260fe:	85 c9                	test   ecx,ecx
   26100:	0f 8e 7f 4d 00 00    	jle    2ae85 <JS_CallInternal+0x82e5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19573
   26106:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2610d:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19576
   26111:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19573
   26115:	48 89 4b d0          	mov    QWORD PTR [rbx-0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19576
   26119:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19574
   2611f:	4c 89 d3             	mov    rbx,r10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19576
   26122:	49 89 c5             	mov    r13,rax
   26125:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26129:	ff e0                	jmp    rax
   2612b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19526
   2612f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19527
   26136:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   2613a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2613e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19526
   26145:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19527
   26149:	e8 62 da 01 00       	call   43bb0 <JS_ValueToAtom>
   2614e:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19528
   26151:	45 85 ed             	test   r13d,r13d
   26154:	0f 84 e6 d1 ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:638
   2615a:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19530 (discriminator 2)
   2615e:	83 fa 03             	cmp    edx,0x3
   26161:	0f 84 f9 57 00 00    	je     2b960 <JS_CallInternal+0x8dc0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19535
   26167:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2616b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26172:	44 89 e9             	mov    ecx,r13d
   26175:	e8 66 81 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19536 (discriminator 1)
   2617a:	85 c0                	test   eax,eax
   2617c:	0f 8e b9 54 00 00    	jle    2b63b <JS_CallInternal+0x8a9b>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   26182:	48 83 ec 08          	sub    rsp,0x8
   26186:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   2618a:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   2618e:	44 89 e9             	mov    ecx,r13d
   26191:	6a 00                	push   0x0
   26193:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2619a:	4c 89 c6             	mov    rsi,r8
   2619d:	4c 89 ca             	mov    rdx,r9
   261a0:	e8 5b 6d 00 00       	call   2cf00 <JS_GetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   261a5:	5e                   	pop    rsi
   261a6:	5f                   	pop    rdi
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   261a7:	48 89 c1             	mov    rcx,rax
   261aa:	49 89 d6             	mov    r14,rdx
   261ad:	48 89 d0             	mov    rax,rdx
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   261b0:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   261b7:	0f 8f 5a 40 00 00    	jg     2a217 <JS_CallInternal+0x7677>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19551 (discriminator 2)
   261bd:	41 83 fe 06          	cmp    r14d,0x6
   261c1:	0f 84 79 d1 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19553
   261c7:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19556
   261ca:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19554
   261ce:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19553
   261d2:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19556
   261d6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   261dc:	49 89 c5             	mov    r13,rax
   261df:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   261e3:	ff e0                	jmp    rax
   261e5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19719
   261e9:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19720
   261ee:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19719
   261f5:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721
   261fa:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19722
   261fd:	89 fa                	mov    edx,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19719
   261ff:	89 f8                	mov    eax,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19720
   26201:	4c 89 69 30          	mov    QWORD PTR [rcx+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19722
   26205:	c1 fa 02             	sar    edx,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721
   26208:	83 e0 03             	and    eax,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19722
   2620b:	83 e2 07             	and    edx,0x7
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721
   2620e:	f7 d0                	not    eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19722
   26210:	f7 d2                	not    edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721
   26212:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19722
   26214:	48 63 d2             	movsxd rdx,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721
   26217:	48 c1 e0 04          	shl    rax,0x4
   2621b:	48 c1 e2 04          	shl    rdx,0x4
   2621f:	48 01 d8             	add    rax,rbx
   26222:	48 01 da             	add    rdx,rbx
   26225:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   26228:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   2622b:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   2622f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19723
   26233:	89 f8                	mov    eax,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721
   26235:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19723
   2623c:	c1 f8 05             	sar    eax,0x5
   2623f:	f7 d0                	not    eax
   26241:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721
   26243:	48 c1 e0 04          	shl    rax,0x4
   26247:	ff 74 03 08          	push   QWORD PTR [rbx+rax*1+0x8]
   2624b:	ff 34 03             	push   QWORD PTR [rbx+rax*1]
   2624e:	e8 dd 53 06 00       	call   8b630 <JS_CopyDataProperties>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19721 (discriminator 1)
   26253:	41 5e                	pop    r14
   26255:	5a                   	pop    rdx
   26256:	85 c0                	test   eax,eax
   26258:	0f 85 ad 65 00 00    	jne    2c80b <JS_CallInternal+0x9c6b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19726
   2625e:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26264:	49 83 c4 02          	add    r12,0x2
   26268:	49 89 c5             	mov    r13,rax
   2626b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2626f:	ff e0                	jmp    rax
   26271:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19694
   26275:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   26279:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   2627d:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   26281:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   26285:	76 04                	jbe    2628b <JS_CallInternal+0x36eb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   26287:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19694 (discriminator 1)
   2628b:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   2628f:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   26293:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   26297:	41 b9 07 40 00 00    	mov    r9d,0x4007
   2629d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   262a4:	41 ff 36             	push   QWORD PTR [r14]
   262a7:	e8 94 da 01 00       	call   43d40 <JS_DefinePropertyValueValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19697 (discriminator 1)
   262ac:	59                   	pop    rcx
   262ad:	5e                   	pop    rsi
   262ae:	85 c0                	test   eax,eax
   262b0:	0f 88 c7 4b 00 00    	js     2ae7d <JS_CallInternal+0x82dd>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19700
   262b6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19696
   262bb:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19700
   262be:	49 83 c4 01          	add    r12,0x1
   262c2:	49 89 c5             	mov    r13,rax
   262c5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   262c9:	ff e0                	jmp    rax
   262cb:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19671
   262cf:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19672
   262d6:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19671
   262da:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19672
   262de:	0f 85 b1 61 00 00    	jne    2c495 <JS_CallInternal+0x98f5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19676
   262e4:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   262e8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   262ef:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   262f3:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   262f7:	e8 b4 d8 01 00       	call   43bb0 <JS_ValueToAtom>
   262fc:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19677 (discriminator 1)
   262ff:	45 85 ed             	test   r13d,r13d
   26302:	0f 84 38 d0 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19679
   26308:	48 83 ec 08          	sub    rsp,0x8
   2630c:	4c 8d 53 d0          	lea    r10,[rbx-0x30]
   26310:	48 8d 43 c0          	lea    rax,[rbx-0x40]
   26314:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   26318:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2631f:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   26323:	44 89 e9             	mov    ecx,r13d
   26326:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   2632a:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   2632e:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   26335:	68 00 80 00 00       	push   0x8000
   2633a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26341:	ff 73 c8             	push   QWORD PTR [rbx-0x38]
   26344:	ff 73 c0             	push   QWORD PTR [rbx-0x40]
   26347:	e8 e4 78 00 00       	call   2dc30 <JS_SetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2634c:	48 83 c4 20          	add    rsp,0x20
   26350:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   26357:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19679
   2635e:	89 c3                	mov    ebx,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   26360:	0f 8f 17 3b 00 00    	jg     29e7d <JS_CallInternal+0x72dd>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19682
   26366:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2636d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   26371:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   26374:	83 fa f6             	cmp    edx,0xfffffff6
   26377:	76 11                	jbe    2638a <JS_CallInternal+0x37ea>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   26379:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2637c:	83 e8 01             	sub    eax,0x1
   2637f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26382:	85 c0                	test   eax,eax
   26384:	0f 8e c1 45 00 00    	jle    2a94b <JS_CallInternal+0x7dab>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19683
   2638a:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   2638e:	49 8b 32             	mov    rsi,QWORD PTR [r10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   26391:	83 fa f6             	cmp    edx,0xfffffff6
   26394:	76 11                	jbe    263a7 <JS_CallInternal+0x3807>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   26396:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26399:	83 e8 01             	sub    eax,0x1
   2639c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2639f:	85 c0                	test   eax,eax
   263a1:	0f 8e 20 45 00 00    	jle    2a8c7 <JS_CallInternal+0x7d27>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19684
   263a7:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   263ab:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   263ae:	83 fa f6             	cmp    edx,0xfffffff6
   263b1:	76 11                	jbe    263c4 <JS_CallInternal+0x3824>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   263b3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   263b6:	83 e8 01             	sub    eax,0x1
   263b9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   263bc:	85 c0                	test   eax,eax
   263be:	0f 8e 18 45 00 00    	jle    2a8dc <JS_CallInternal+0x7d3c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19686
   263c4:	85 db                	test   ebx,ebx
   263c6:	0f 88 34 5e 00 00    	js     2c200 <JS_CallInternal+0x9660>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19689
   263cc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19685
   263d1:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19689
   263d8:	49 83 c4 01          	add    r12,0x1
   263dc:	49 89 c5             	mov    r13,rax
   263df:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   263e3:	ff e0                	jmp    rax
   263e5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 4)
   263e9:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   263ed:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 1)
   263f1:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 4)
   263f6:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 1)
   263fa:	83 ff ff             	cmp    edi,0xffffffff
   263fd:	0f 85 57 2f 00 00    	jne    2935a <JS_CallInternal+0x67ba>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 5)
   26403:	4c 89 d1             	mov    rcx,r10
   26406:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   2640d:	00 00 00 
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   26410:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   26414:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   26417:	41 89 c0             	mov    r8d,eax
   2641a:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   2641d:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   26422:	4d 85 c0             	test   r8,r8
   26425:	0f 84 d8 29 00 00    	je     28e03 <JS_CallInternal+0x6263>
   2642b:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   26432:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   26433:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   26437:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   2643a:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   2643d:	0f 85 b0 29 00 00    	jne    28df3 <JS_CallInternal+0x6253>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 1)
   26443:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   26447:	0f 87 0d 2f 00 00    	ja     2935a <JS_CallInternal+0x67ba>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   2644d:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   26451:	49 c1 e0 04          	shl    r8,0x4
   26455:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 11)
   2645a:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   2645d:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   26461:	83 fa f6             	cmp    edx,0xfffffff6
   26464:	76 04                	jbe    2646a <JS_CallInternal+0x38ca>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   26466:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 20)
   2646a:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19201
   2646d:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 20)
   26471:	48 83 c3 10          	add    rbx,0x10
   26475:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19201
   26479:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2647f:	49 89 c5             	mov    r13,rax
   26482:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26486:	ff e0                	jmp    rax
   26488:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19704
   2648c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19705
   26493:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2649a:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19704
   2649d:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19705
   264a1:	e8 3a 48 07 00       	call   9ace0 <js_append_enumerate>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19705 (discriminator 1)
   264a6:	85 c0                	test   eax,eax
   264a8:	0f 85 92 ce ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19707
   264ae:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   264b2:	48 83 eb 10          	sub    rbx,0x10
   264b6:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   264b9:	83 fa f6             	cmp    edx,0xfffffff6
   264bc:	76 11                	jbe    264cf <JS_CallInternal+0x392f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   264be:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   264c1:	83 e8 01             	sub    eax,0x1
   264c4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   264c7:	85 c0                	test   eax,eax
   264c9:	0f 8e b5 40 00 00    	jle    2a584 <JS_CallInternal+0x79e4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19709
   264cf:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   264d4:	49 83 c4 01          	add    r12,0x1
   264d8:	49 89 c5             	mov    r13,rax
   264db:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   264df:	ff e0                	jmp    rax
   264e1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19350
   264e5:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   264e9:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19351
   264ed:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19350
   264f1:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   264f5:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   264f9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26500:	e8 9b 7c ff ff       	call   1e1a0 <js_method_set_home_object>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19351
   26505:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2650b:	49 89 c5             	mov    r13,rax
   2650e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26512:	ff e0                	jmp    rax
   26514:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19323
   26518:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   2651c:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19321
   26520:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19323
   26525:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26529:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26530:	e8 4b e1 00 00       	call   34680 <JS_DefineObjectName.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19324 (discriminator 1)
   26535:	85 c0                	test   eax,eax
   26537:	0f 88 50 4a 00 00    	js     2af8d <JS_CallInternal+0x83ed>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19327
   2653d:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   26543:	49 83 c4 05          	add    r12,0x5
   26547:	49 89 c5             	mov    r13,rax
   2654a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2654e:	ff e0                	jmp    rax
   26550:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19308
   26554:	48 83 ec 08          	sub    rsp,0x8
   26558:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   2655c:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   26560:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   26564:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   26568:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19306
   2656c:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19308
   26571:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   26575:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2657c:	68 07 40 00 00       	push   0x4007
   26581:	e8 6a 99 00 00       	call   2fef0 <JS_DefinePropertyValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19311 (discriminator 1)
   26586:	59                   	pop    rcx
   26587:	5e                   	pop    rsi
   26588:	85 c0                	test   eax,eax
   2658a:	0f 88 90 49 00 00    	js     2af20 <JS_CallInternal+0x8380>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19314
   26590:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19310
   26596:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19314
   26599:	49 83 c4 05          	add    r12,0x5
   2659d:	49 89 c5             	mov    r13,rax
   265a0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   265a4:	ff e0                	jmp    rax
   265a6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 4)
   265aa:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   265ae:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 1)
   265b2:	83 ff ff             	cmp    edi,0xffffffff
   265b5:	0f 85 03 2f 00 00    	jne    294be <JS_CallInternal+0x691e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 5)
   265bb:	48 89 f1             	mov    rcx,rsi
   265be:	66 90                	xchg   ax,ax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   265c0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   265c4:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   265c7:	41 89 c0             	mov    r8d,eax
   265ca:	41 83 e0 32          	and    r8d,0x32
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   265ce:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   265d3:	4d 85 c0             	test   r8,r8
   265d6:	0f 84 92 28 00 00    	je     28e6e <JS_CallInternal+0x62ce>
   265dc:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   265e3:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   265e4:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   265e8:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   265eb:	83 78 04 32          	cmp    DWORD PTR [rax+0x4],0x32
   265ef:	0f 85 69 28 00 00    	jne    28e5e <JS_CallInternal+0x62be>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 1)
   265f5:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   265f9:	0f 87 bf 2e 00 00    	ja     294be <JS_CallInternal+0x691e>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   265ff:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   26603:	49 c1 e0 04          	shl    r8,0x4
   26607:	4a 8d 44 00 f0       	lea    rax,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 11)
   2660c:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   26610:	4c 8b 30             	mov    r14,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   26613:	83 f9 f6             	cmp    ecx,0xfffffff6
   26616:	76 05                	jbe    2661d <JS_CallInternal+0x3a7d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   26618:	41 83 46 fc 01       	add    DWORD PTR [r14-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   2661d:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 21)
   26621:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   26625:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   26629:	83 fa f6             	cmp    edx,0xfffffff6
   2662c:	76 11                	jbe    2663f <JS_CallInternal+0x3a9f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2662e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26631:	83 e8 01             	sub    eax,0x1
   26634:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26637:	85 c0                	test   eax,eax
   26639:	0f 8e aa 41 00 00    	jle    2a7e9 <JS_CallInternal+0x7c49>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 1)
   2663f:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19206
   26643:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 1)
   26647:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19206
   2664b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26651:	49 89 c5             	mov    r13,rax
   26654:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26658:	ff e0                	jmp    rax
   2665a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 4)
   2665e:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   26662:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 1)
   26666:	4d 8d 74 24 04       	lea    r14,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 4)
   2666b:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 1)
   2666f:	83 ff ff             	cmp    edi,0xffffffff
   26672:	0f 85 f3 2d 00 00    	jne    2946b <JS_CallInternal+0x68cb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 5)
   26678:	4c 89 d1             	mov    rcx,r10
   2667b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   26680:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6161
   26684:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   26687:	41 89 c0             	mov    r8d,eax
   2668a:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6162
   2668d:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   26692:	4d 85 c0             	test   r8,r8
   26695:	0f 84 9b 27 00 00    	je     28e36 <JS_CallInternal+0x6296>
   2669b:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   266a2:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6165
   266a3:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   266a7:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6166 (discriminator 1)
   266aa:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   266ad:	0f 85 73 27 00 00    	jne    28e26 <JS_CallInternal+0x6286>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 1)
   266b3:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   266b7:	0f 87 ae 2d 00 00    	ja     2946b <JS_CallInternal+0x68cb>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6167
   266bd:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   266c1:	49 c1 e0 04          	shl    r8,0x4
   266c5:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 11)
   266ca:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   266ce:	48 8b 02             	mov    rax,QWORD PTR [rdx]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   266d1:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   266d5:	76 04                	jbe    266db <JS_CallInternal+0x3b3b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   266d7:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   266db:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 21)
   266df:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   266e3:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   266e7:	83 fa f6             	cmp    edx,0xfffffff6
   266ea:	76 11                	jbe    266fd <JS_CallInternal+0x3b5d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   266ec:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   266ef:	83 e9 01             	sub    ecx,0x1
   266f2:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   266f5:	85 c9                	test   ecx,ecx
   266f7:	0f 8e c5 42 00 00    	jle    2a9c2 <JS_CallInternal+0x7e22>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 1)
   266fd:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19197
   26701:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 1)
   26705:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19197
   26709:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2670f:	49 89 c5             	mov    r13,rax
   26712:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26716:	ff e0                	jmp    rax
   26718:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   2671c:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18853 (discriminator 1)
   26723:	4d 63 2c 24          	movsxd r13,DWORD PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26727:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18853 (discriminator 1)
   2672d:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26730:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26736:	83 e8 01             	sub    eax,0x1
   26739:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   2673f:	85 c0                	test   eax,eax
   26741:	0f 8e e7 4b 00 00    	jle    2b32e <JS_CallInternal+0x878e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18856
   26747:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2674c:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26750:	49 89 c5             	mov    r13,rax
   26753:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26757:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18844
   2675b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18843
   26762:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:181
   26767:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18846
   2676b:	48 89 da             	mov    rdx,rbx
   2676e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18844
   26775:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18846
   26779:	e8 d2 7c 04 00       	call   6e450 <JS_GetGlobalVarRef>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18846 (discriminator 1)
   2677e:	85 c0                	test   eax,eax
   26780:	0f 85 d3 60 00 00    	jne    2c859 <JS_CallInternal+0x9cb9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18850
   26786:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18848
   2678c:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18850
   26790:	49 83 c4 05          	add    r12,0x5
   26794:	49 89 c5             	mov    r13,rax
   26797:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2679b:	ff e0                	jmp    rax
   2679d:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   267a1:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18752
   267a6:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18751
   267ad:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   267b2:	48 89 c1             	mov    rcx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18752
   267b5:	48 c1 e0 04          	shl    rax,0x4
   267b9:	48 01 f8             	add    rax,rdi
   267bc:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18752 (discriminator 2)
   267c0:	83 fa 04             	cmp    edx,0x4
   267c3:	0f 84 e7 51 00 00    	je     2b9b0 <JS_CallInternal+0x8e10>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18756
   267c9:	48 8b 00             	mov    rax,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   267cc:	83 fa f6             	cmp    edx,0xfffffff6
   267cf:	76 04                	jbe    267d5 <JS_CallInternal+0x3c35>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   267d1:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18756
   267d5:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18759
   267d8:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18757
   267dc:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18756
   267e0:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18759
   267e4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   267ea:	49 89 c5             	mov    r13,rax
   267ed:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   267f1:	ff e0                	jmp    rax
   267f3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20046
   267f7:	44 8b 4b f8          	mov    r9d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20045
   267fb:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20046
   267ff:	45 85 c9             	test   r9d,r9d
   26802:	0f 85 30 30 00 00    	jne    29838 <JS_CallInternal+0x6c98>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20048 (discriminator 1)
   26808:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   2680d:	0f 84 25 30 00 00    	je     29838 <JS_CallInternal+0x6c98>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20050
   26813:	83 c0 01             	add    eax,0x1
   26816:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   2681d:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   2681e:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20059
   26821:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20057
   26826:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20059
   2682a:	49 83 c4 01          	add    r12,0x1
   2682e:	49 89 c5             	mov    r13,rax
   26831:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26835:	ff e0                	jmp    rax
   26837:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20028
   2683b:	44 8b 53 f8          	mov    r10d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20027
   2683f:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20028
   26843:	45 85 d2             	test   r10d,r10d
   26846:	0f 85 76 30 00 00    	jne    298c2 <JS_CallInternal+0x6d22>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20030 (discriminator 1)
   2684c:	3d 00 00 00 80       	cmp    eax,0x80000000
   26851:	0f 84 6b 30 00 00    	je     298c2 <JS_CallInternal+0x6d22>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20032
   26857:	83 e8 01             	sub    eax,0x1
   2685a:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26861:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26862:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20040
   26866:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2686b:	49 83 c4 01          	add    r12,0x1
   2686f:	49 89 c5             	mov    r13,rax
   26872:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26876:	ff e0                	jmp    rax
   26878:	f3 0f 1e fa          	endbr64
   2687c:	e9 e5 c6 ff ff       	jmp    22f66 <JS_CallInternal+0x3c6>
   26881:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18894
   26885:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18897
   26889:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18895
   2688d:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18894
   26892:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26896:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18897
   26899:	0f 87 54 34 00 00    	ja     29cf3 <JS_CallInternal+0x7153>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18902
   2689f:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18903
   268a3:	85 c0                	test   eax,eax
   268a5:	75 0c                	jne    268b3 <JS_CallInternal+0x3d13>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18904 (discriminator 1)
   268a7:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   268ab:	83 e8 04             	sub    eax,0x4
   268ae:	48 98                	cdqe
   268b0:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   268b3:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   268ba:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   268c0:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   268c6:	83 e8 01             	sub    eax,0x1
   268c9:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   268cf:	85 c0                	test   eax,eax
   268d1:	0f 8e 42 4b 00 00    	jle    2b419 <JS_CallInternal+0x8879>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18909
   268d7:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   268dc:	4d 8d 65 01          	lea    r12,[r13+0x1]
   268e0:	49 89 c5             	mov    r13,rax
   268e3:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   268e7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18874
   268eb:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18876
   268ef:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18875
   268f3:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18874
   268f8:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   268fc:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18876
   268ff:	0f 87 da 33 00 00    	ja     29cdf <JS_CallInternal+0x713f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18881
   26905:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18882
   26909:	85 c0                	test   eax,eax
   2690b:	74 0c                	je     26919 <JS_CallInternal+0x3d79>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18883 (discriminator 1)
   2690d:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   26911:	83 e8 04             	sub    eax,0x4
   26914:	48 98                	cdqe
   26916:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26919:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   26920:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   26926:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2692c:	83 e8 01             	sub    eax,0x1
   2692f:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   26935:	85 c0                	test   eax,eax
   26937:	0f 8e d5 49 00 00    	jle    2b312 <JS_CallInternal+0x8772>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18888
   2693d:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26942:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26946:	49 89 c5             	mov    r13,rax
   26949:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2694d:	f3 0f 1e fa          	endbr64
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17581
   26951:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18801 (discriminator 1)
   26958:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17581
   2695d:	0f b7 51 38          	movzx  edx,WORD PTR [rcx+0x38]
   26961:	4c 8b 51 28          	mov    r10,QWORD PTR [rcx+0x28]
   26965:	01 d0                	add    eax,edx
   26967:	48 98                	cdqe
   26969:	48 8d 04 40          	lea    rax,[rax+rax*2]
   2696d:	49 8d 04 82          	lea    rax,[r10+rax*4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17582
   26971:	44 0f b7 68 0a       	movzx  r13d,WORD PTR [rax+0xa]
   26976:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2697d:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
   26981:	49 c1 e5 03          	shl    r13,0x3
   26985:	4c 01 e9             	add    rcx,r13
   26988:	4c 8b 31             	mov    r14,QWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17583
   2698b:	4d 85 f6             	test   r14,r14
   2698e:	74 50                	je     269e0 <JS_CallInternal+0x3e40>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17584
   26990:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26997:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17553
   2699b:	f6 40 3c 04          	test   BYTE PTR [rax+0x3c],0x4
   2699f:	0f 85 17 3b 00 00    	jne    2a4bc <JS_CallInternal+0x791c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17557
   269a5:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   269a9:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   269ac:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValueRT():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:718
   269b0:	83 fa f6             	cmp    edx,0xfffffff6
   269b3:	76 04                	jbe    269b9 <JS_CallInternal+0x3e19>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:720
   269b5:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17558
   269b9:	49 8d 7e 20          	lea    rdi,[r14+0x20]
   269bd:	66 48 0f 6e e0       	movq   xmm4,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17557
   269c2:	49 89 56 28          	mov    QWORD PTR [r14+0x28],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17558
   269c6:	66 48 0f 6e c7       	movq   xmm0,rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17560
   269cb:	41 c6 46 10 01       	mov    BYTE PTR [r14+0x10],0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17558
   269d0:	66 0f 6c c4          	punpcklqdq xmm0,xmm4
   269d4:	41 0f 11 46 18       	movups XMMWORD PTR [r14+0x18],xmm0
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17585
   269d9:	48 c7 01 00 00 00 00 	mov    QWORD PTR [rcx],0x0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18805
   269e0:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   269e6:	49 83 c4 03          	add    r12,0x3
   269ea:	49 89 c5             	mov    r13,rax
   269ed:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   269f1:	ff e0                	jmp    rax
   269f3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18936
   269f7:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18938
   269fb:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18937
   269ff:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18936
   26a04:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26a08:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18938
   26a0b:	0f 87 ba 32 00 00    	ja     29ccb <JS_CallInternal+0x712b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18943
   26a11:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18944
   26a15:	85 c0                	test   eax,eax
   26a17:	75 0d                	jne    26a26 <JS_CallInternal+0x3e86>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18945
   26a19:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   26a1e:	83 e8 01             	sub    eax,0x1
   26a21:	48 98                	cdqe
   26a23:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26a26:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   26a2d:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   26a33:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26a39:	83 e8 01             	sub    eax,0x1
   26a3c:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   26a42:	85 c0                	test   eax,eax
   26a44:	0f 8e 4c 49 00 00    	jle    2b396 <JS_CallInternal+0x87f6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18950
   26a4a:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26a4f:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26a53:	49 89 c5             	mov    r13,rax
   26a56:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26a5a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18916
   26a5e:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18918
   26a62:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18917
   26a66:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18916
   26a6b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26a6f:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18918
   26a72:	0f 87 28 32 00 00    	ja     29ca0 <JS_CallInternal+0x7100>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18923
   26a78:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18924
   26a7c:	85 c0                	test   eax,eax
   26a7e:	74 0d                	je     26a8d <JS_CallInternal+0x3eed>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18925
   26a80:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   26a85:	83 e8 01             	sub    eax,0x1
   26a88:	48 98                	cdqe
   26a8a:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26a8d:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   26a94:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   26a9a:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26aa0:	83 e8 01             	sub    eax,0x1
   26aa3:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   26aa9:	85 c0                	test   eax,eax
   26aab:	0f 8e 01 49 00 00    	jle    2b3b2 <JS_CallInternal+0x8812>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18930
   26ab1:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26ab6:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26aba:	49 89 c5             	mov    r13,rax
   26abd:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26ac1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18956
   26ac5:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:567
   26ac9:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18957
   26ad0:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18956
   26ad4:	4c 01 e0             	add    rax,r12
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:567
   26ad7:	2b 41 18             	sub    eax,DWORD PTR [rcx+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18956
   26ada:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   26ae1:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18960
   26ae2:	49 83 c4 05          	add    r12,0x5
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:567
   26ae6:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18960
   26aea:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26af0:	49 89 c5             	mov    r13,rax
   26af3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26af7:	ff e0                	jmp    rax
   26af9:	f3 0f 1e fa          	endbr64
   26afd:	e9 b2 c5 ff ff       	jmp    230b4 <JS_CallInternal+0x514>
   26b02:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   26b06:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18778
   26b0b:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18777
   26b12:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   26b17:	48 89 c2             	mov    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18778
   26b1a:	48 c1 e0 04          	shl    rax,0x4
   26b1e:	48 01 c8             	add    rax,rcx
   26b21:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18778 (discriminator 2)
   26b25:	83 f9 04             	cmp    ecx,0x4
   26b28:	0f 84 ce 48 00 00    	je     2b3fc <JS_CallInternal+0x885c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18782
   26b2e:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26b32:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   26b36:	83 fa f6             	cmp    edx,0xfffffff6
   26b39:	76 04                	jbe    26b3f <JS_CallInternal+0x3f9f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   26b3b:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   26b3f:	4c 8b 00             	mov    r8,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   26b42:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   26b46:	48 89 30             	mov    QWORD PTR [rax],rsi
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   26b49:	83 f9 f6             	cmp    ecx,0xfffffff6
   26b4c:	76 13                	jbe    26b61 <JS_CallInternal+0x3fc1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   26b4e:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   26b52:	83 e8 01             	sub    eax,0x1
   26b55:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   26b59:	85 c0                	test   eax,eax
   26b5b:	0f 8e a7 3e 00 00    	jle    2aa08 <JS_CallInternal+0x7e68>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18784
   26b61:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   26b67:	49 83 c4 03          	add    r12,0x3
   26b6b:	49 89 c5             	mov    r13,rax
   26b6e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26b72:	ff e0                	jmp    rax
   26b74:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   26b78:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18765
   26b7d:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18764
   26b84:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   26b89:	48 89 c2             	mov    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18765
   26b8c:	48 c1 e0 04          	shl    rax,0x4
   26b90:	48 01 c8             	add    rax,rcx
   26b93:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18765 (discriminator 2)
   26b97:	83 f9 04             	cmp    ecx,0x4
   26b9a:	0f 84 55 47 00 00    	je     2b2f5 <JS_CallInternal+0x8755>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   26ba0:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   26ba5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   26ba8:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   26bab:	83 f9 f6             	cmp    ecx,0xfffffff6
   26bae:	76 11                	jbe    26bc1 <JS_CallInternal+0x4021>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   26bb0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26bb3:	83 e8 01             	sub    eax,0x1
   26bb6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26bb9:	85 c0                	test   eax,eax
   26bbb:	0f 8e 73 3f 00 00    	jle    2ab34 <JS_CallInternal+0x7f94>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18772
   26bc1:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18770
   26bc7:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18772
   26bcb:	49 83 c4 03          	add    r12,0x3
   26bcf:	49 89 c5             	mov    r13,rax
   26bd2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26bd6:	ff e0                	jmp    rax
   26bd8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18790
   26bdc:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   26be1:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18789
   26be8:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18790
   26bed:	48 c1 e0 04          	shl    rax,0x4
   26bf1:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18790 (discriminator 2)
   26bf4:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   26bf8:	0f 85 be 46 00 00    	jne    2b2bc <JS_CallInternal+0x871c>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   26bfe:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18797
   26c03:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18795
   26c07:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   26c0b:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18797
   26c0e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26c14:	49 89 c5             	mov    r13,rax
   26c17:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26c1b:	ff e0                	jmp    rax
   26c1d:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26c21:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18864
   26c28:	4d 0f be 2c 24       	movsx  r13,BYTE PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26c2d:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18864
   26c33:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26c36:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26c3c:	83 e8 01             	sub    eax,0x1
   26c3f:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   26c45:	85 c0                	test   eax,eax
   26c47:	0f 8e 8c 46 00 00    	jle    2b2d9 <JS_CallInternal+0x8739>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18867
   26c4d:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26c52:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26c56:	49 89 c5             	mov    r13,rax
   26c59:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26c5d:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26c61:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18859 (discriminator 1)
   26c68:	4d 0f bf 2c 24       	movsx  r13,WORD PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26c6d:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18859 (discriminator 1)
   26c73:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909
   26c76:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26c7c:	83 e8 01             	sub    eax,0x1
   26c7f:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7909 (discriminator 1)
   26c85:	85 c0                	test   eax,eax
   26c87:	0f 8e 2d 44 00 00    	jle    2b0ba <JS_CallInternal+0x851a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18862
   26c8d:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26c92:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26c96:	49 89 c5             	mov    r13,rax
   26c99:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26c9d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20135
   26ca1:	8b 7b f8             	mov    edi,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20134
   26ca4:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20135
   26ca8:	85 ff                	test   edi,edi
   26caa:	0f 85 c1 2f 00 00    	jne    29c71 <JS_CallInternal+0x70d1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20136
   26cb0:	f7 d0                	not    eax
   26cb2:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26cb9:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26cba:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20143
   26cbe:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26cc3:	49 83 c4 01          	add    r12,0x1
   26cc7:	49 89 c5             	mov    r13,rax
   26cca:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26cce:	ff e0                	jmp    rax
   26cd0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18631
   26cd4:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   26cdb:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   26cdf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   26ce2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   26ce6:	83 f8 f6             	cmp    eax,0xfffffff6
   26ce9:	76 04                	jbe    26cef <JS_CallInternal+0x414f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   26ceb:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18631
   26cef:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18631 (discriminator 1)
   26cf2:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18631
   26cf6:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18631 (discriminator 1)
   26cfa:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18631
   26d00:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18631 (discriminator 1)
   26d03:	49 89 c5             	mov    r13,rax
   26d06:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26d0a:	ff e0                	jmp    rax
   26d0c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19932
   26d10:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19932 (discriminator 1)
   26d14:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19930
   26d17:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19931
   26d1b:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19932 (discriminator 1)
   26d1f:	0f 85 72 cf ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19934
   26d25:	89 c8                	mov    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19935
   26d27:	89 d6                	mov    esi,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19938 (discriminator 1)
   26d29:	85 c9                	test   ecx,ecx
   26d2b:	0f 88 66 cf ff ff    	js     23c97 <JS_CallInternal+0x10f7>
   26d31:	85 d2                	test   edx,edx
   26d33:	0f 8e 5e cf ff ff    	jle    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19940
   26d39:	99                   	cdq
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19941
   26d3a:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   26d41:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19947
   26d42:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19942
   26d46:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19940
   26d4a:	f7 fe                	idiv   esi
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26d4c:	48 63 d2             	movsxd rdx,edx
   26d4f:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19947
   26d53:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26d59:	49 89 c5             	mov    r13,rax
   26d5c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26d60:	ff e0                	jmp    rax
   26d62:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19961
   26d66:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19960
   26d6a:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19962
   26d6e:	a9 f7 ff ff ff       	test   eax,0xfffffff7
   26d73:	74 1b                	je     26d90 <JS_CallInternal+0x41f0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19963
   26d75:	83 e8 01             	sub    eax,0x1
   26d78:	83 f8 01             	cmp    eax,0x1
   26d7b:	0f 87 9e 36 00 00    	ja     2a41f <JS_CallInternal+0x787f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19964
   26d81:	83 e2 ff             	and    edx,0xffffffff
   26d84:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26d8b:	00 
   26d8c:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19971
   26d90:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26d95:	49 83 c4 01          	add    r12,0x1
   26d99:	49 89 c5             	mov    r13,rax
   26d9c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26da0:	ff e0                	jmp    rax
   26da2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20170
   26da6:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20170 (discriminator 1)
   26daa:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20168
   26dad:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20169
   26db1:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20170 (discriminator 1)
   26db5:	0f 85 82 46 00 00    	jne    2b43d <JS_CallInternal+0x889d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20174
   26dbb:	d3 e8                	shr    eax,cl
JS_NewUint32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:584
   26dbd:	85 c0                	test   eax,eax
   26dbf:	0f 88 9c 2b 00 00    	js     29961 <JS_CallInternal+0x6dc1>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26dc5:	66 0f 6e c0          	movd   xmm0,eax
   26dc9:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20174
   26dcb:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20177
   26dcf:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20174
   26dd3:	66 0f d6 43 f0       	movq   QWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20185
   26dd8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26ddd:	49 83 c4 01          	add    r12,0x1
   26de1:	49 89 c5             	mov    r13,rax
   26de4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26de8:	ff e0                	jmp    rax
   26dea:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20150
   26dee:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20150 (discriminator 1)
   26df2:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20148
   26df5:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20149
   26df9:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20150 (discriminator 1)
   26dfd:	0f 85 63 4a 00 00    	jne    2b866 <JS_CallInternal+0x8cc6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20155
   26e03:	d3 e0                	shl    eax,cl
   26e05:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   26e0c:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20156
   26e0d:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26e11:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20164
   26e15:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26e1a:	49 83 c4 01          	add    r12,0x1
   26e1e:	49 89 c5             	mov    r13,rax
   26e21:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26e25:	ff e0                	jmp    rax
   26e27:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20191
   26e2b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20191 (discriminator 1)
   26e2f:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20189
   26e32:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20190
   26e36:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20191 (discriminator 1)
   26e3a:	0f 85 8e 45 00 00    	jne    2b3ce <JS_CallInternal+0x882e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20195
   26e40:	d3 f8                	sar    eax,cl
   26e42:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   26e49:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20197
   26e4a:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26e4e:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20205
   26e52:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26e57:	49 83 c4 01          	add    r12,0x1
   26e5b:	49 89 c5             	mov    r13,rax
   26e5e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26e62:	ff e0                	jmp    rax
   26e64:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20010
   26e68:	44 8b 5b f8          	mov    r11d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20009
   26e6c:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20010
   26e70:	45 85 db             	test   r11d,r11d
   26e73:	0f 85 8e 29 00 00    	jne    29807 <JS_CallInternal+0x6c67>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20012 (discriminator 1)
   26e79:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   26e7e:	0f 84 83 29 00 00    	je     29807 <JS_CallInternal+0x6c67>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20014
   26e84:	83 c0 01             	add    eax,0x1
   26e87:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26e8e:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26e8f:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20022
   26e93:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26e98:	49 83 c4 01          	add    r12,0x1
   26e9c:	49 89 c5             	mov    r13,rax
   26e9f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ea3:	ff e0                	jmp    rax
   26ea5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20087
   26ea9:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   26eae:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20085
   26eb5:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20087
   26eba:	49 c1 e5 04          	shl    r13,0x4
   26ebe:	49 01 c5             	add    r13,rax
   26ec1:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   26ec7:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20088
   26ece:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20089
   26ed5:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20088
   26edc:	85 d2                	test   edx,edx
   26ede:	0f 85 2e 26 00 00    	jne    29512 <JS_CallInternal+0x6972>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20090 (discriminator 1)
   26ee4:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   26ee9:	0f 84 23 26 00 00    	je     29512 <JS_CallInternal+0x6972>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20092
   26eef:	83 c0 01             	add    eax,0x1
   26ef2:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   26ef9:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26efa:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20104
   26efe:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26f04:	49 83 c4 02          	add    r12,0x2
   26f08:	49 89 c5             	mov    r13,rax
   26f0b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f0f:	ff e0                	jmp    rax
   26f11:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19916
   26f15:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19916 (discriminator 1)
   26f19:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19914
   26f1c:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19915
   26f20:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19916 (discriminator 1)
   26f24:	0f 85 6d cd ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19920
   26f2a:	66 0f ef c0          	pxor   xmm0,xmm0
   26f2e:	66 0f ef c9          	pxor   xmm1,xmm1
   26f32:	f2 0f 2a c1          	cvtsi2sd xmm0,ecx
   26f36:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   26f3a:	f2 0f 5e c1          	divsd  xmm0,xmm1
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:602
   26f3e:	66 0f 2f 05 d2 c4 0a 	comisd xmm0,QWORD PTR [rip+0xac4d2]        # d3418 <__PRETTY_FUNCTION__.0+0xc8>
   26f45:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:603
   26f46:	66 48 0f 7e c0       	movq   rax,xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:602
   26f4b:	0f 82 38 23 00 00    	jb     29289 <JS_CallInternal+0x66e9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:602 (discriminator 1)
   26f51:	f2 0f 10 0d c7 c4 0a 	movsd  xmm1,QWORD PTR [rip+0xac4c7]        # d3420 <__PRETTY_FUNCTION__.0+0xd0>
   26f58:	00 
   26f59:	66 0f 2f c8          	comisd xmm1,xmm0
   26f5d:	0f 82 26 23 00 00    	jb     29289 <JS_CallInternal+0x66e9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:604
   26f63:	f2 0f 2c c8          	cvttsd2si ecx,xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:605
   26f67:	66 0f ef c9          	pxor   xmm1,xmm1
   26f6b:	ba 08 00 00 00       	mov    edx,0x8
   26f70:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   26f74:	66 48 0f 7e ce       	movq   rsi,xmm1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:608
   26f79:	48 39 f0             	cmp    rax,rsi
   26f7c:	0f 84 af 4f 00 00    	je     2bf31 <JS_CallInternal+0x9391>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19920
   26f82:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19926
   26f86:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19921
   26f8a:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19920
   26f8e:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19926
   26f92:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26f98:	49 89 c5             	mov    r13,rax
   26f9b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f9f:	ff e0                	jmp    rax
   26fa1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20113
   26fa5:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   26faa:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20111
   26fb1:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20113
   26fb6:	49 c1 e5 04          	shl    r13,0x4
   26fba:	49 01 c5             	add    r13,rax
   26fbd:	f3 41 0f 6f 6d 00    	movdqu xmm5,XMMWORD PTR [r13+0x0]
   26fc3:	0f 29 ad f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20114
   26fca:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20115
   26fd1:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20114
   26fd8:	85 d2                	test   edx,edx
   26fda:	0f 85 b8 25 00 00    	jne    29598 <JS_CallInternal+0x69f8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20116 (discriminator 1)
   26fe0:	3d 00 00 00 80       	cmp    eax,0x80000000
   26fe5:	0f 84 ad 25 00 00    	je     29598 <JS_CallInternal+0x69f8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20118
   26feb:	83 e8 01             	sub    eax,0x1
   26fee:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   26ff5:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   26ff6:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20130
   26ffa:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27000:	49 83 c4 02          	add    r12,0x2
   27004:	49 89 c5             	mov    r13,rax
   27007:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2700b:	ff e0                	jmp    rax
   2700d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19979
   27011:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19978
   27015:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19980
   27019:	83 fa 02             	cmp    edx,0x2
   2701c:	0f 87 fc 25 00 00    	ja     2961e <JS_CallInternal+0x6a7e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19985 (discriminator 1)
   27022:	85 c0                	test   eax,eax
   27024:	0f 84 54 4e 00 00    	je     2be7e <JS_CallInternal+0x92de>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19989 (discriminator 1)
   2702a:	3d 00 00 00 80       	cmp    eax,0x80000000
   2702f:	0f 84 be 4e 00 00    	je     2bef3 <JS_CallInternal+0x9353>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19993
   27035:	f7 d8                	neg    eax
   27037:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   2703e:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   2703f:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20004
   27043:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27048:	49 83 c4 01          	add    r12,0x1
   2704c:	49 89 c5             	mov    r13,rax
   2704f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27053:	ff e0                	jmp    rax
   27055:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20065
   27059:	44 8b 43 f8          	mov    r8d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20064
   2705d:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20065
   27061:	45 85 c0             	test   r8d,r8d
   27064:	0f 85 fe 27 00 00    	jne    29868 <JS_CallInternal+0x6cc8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20067 (discriminator 1)
   2706a:	3d 00 00 00 80       	cmp    eax,0x80000000
   2706f:	0f 84 f3 27 00 00    	je     29868 <JS_CallInternal+0x6cc8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20069
   27075:	83 e8 01             	sub    eax,0x1
   27078:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   2707f:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   27080:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20078
   27083:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20076
   27088:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20078
   2708c:	49 83 c4 01          	add    r12,0x1
   27090:	49 89 c5             	mov    r13,rax
   27093:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27097:	ff e0                	jmp    rax
   27099:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17945
   2709d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   270a2:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   270a9:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   270ae:	48 c1 e0 04          	shl    rax,0x4
   270b2:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   270b6:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   270ba:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   270bd:	83 fa f6             	cmp    edx,0xfffffff6
   270c0:	76 04                	jbe    270c6 <JS_CallInternal+0x4526>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   270c2:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17945 (discriminator 1)
   270c6:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   270cd:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   270d4:	45 31 c9             	xor    r9d,r9d
   270d7:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   270db:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   270e2:	e8 79 58 02 00       	call   4c960 <js_closure>
   270e7:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17946 (discriminator 2)
   270eb:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17945 (discriminator 1)
   270ef:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17946 (discriminator 2)
   270f2:	0f 84 9d 3e 00 00    	je     2af95 <JS_CallInternal+0x83f5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17948
   270f8:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17945 (discriminator 1)
   270fe:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17948
   27101:	49 83 c4 02          	add    r12,0x2
   27105:	49 89 c5             	mov    r13,rax
   27108:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2710c:	ff e0                	jmp    rax
   2710e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18647
   27112:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27119:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18647
   2711e:	48 83 eb 10          	sub    rbx,0x10
   27122:	48 8b 00             	mov    rax,QWORD PTR [rax]
   27125:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27129:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2712d:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27130:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27133:	83 fa f6             	cmp    edx,0xfffffff6
   27136:	76 11                	jbe    27149 <JS_CallInternal+0x45a9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27138:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2713b:	83 e8 01             	sub    eax,0x1
   2713e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27141:	85 c0                	test   eax,eax
   27143:	0f 8e 8d 34 00 00    	jle    2a5d6 <JS_CallInternal+0x7a36>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18647 (discriminator 1)
   27149:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2714e:	49 83 c4 01          	add    r12,0x1
   27152:	49 89 c5             	mov    r13,rax
   27155:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27159:	ff e0                	jmp    rax
   2715b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18359
   2715f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27166:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   2716a:	48 83 eb 10          	sub    rbx,0x10
   2716e:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   27172:	e8 59 b2 ff ff       	call   223d0 <JS_Throw>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18360
   27177:	e9 c4 c1 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2717c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18351
   27180:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   27184:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27188:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   2718c:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   27190:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27197:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   2719b:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   2719f:	e8 1c 31 02 00       	call   4a2c0 <JS_AddBrand>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18351 (discriminator 1)
   271a4:	85 c0                	test   eax,eax
   271a6:	0f 88 94 c1 ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18353
   271ac:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   271b0:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   271b4:	83 fa f6             	cmp    edx,0xfffffff6
   271b7:	76 11                	jbe    271ca <JS_CallInternal+0x462a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   271b9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   271bc:	83 e8 01             	sub    eax,0x1
   271bf:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   271c2:	85 c0                	test   eax,eax
   271c4:	0f 8e 21 34 00 00    	jle    2a5eb <JS_CallInternal+0x7a4b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18354
   271ca:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   271ce:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   271d2:	83 fa f6             	cmp    edx,0xfffffff6
   271d5:	76 11                	jbe    271e8 <JS_CallInternal+0x4648>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   271d7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   271da:	83 e8 01             	sub    eax,0x1
   271dd:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   271e0:	85 c0                	test   eax,eax
   271e2:	0f 8e 18 34 00 00    	jle    2a600 <JS_CallInternal+0x7a60>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18356
   271e8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18355
   271ed:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18356
   271f0:	49 83 c4 01          	add    r12,0x1
   271f4:	49 89 c5             	mov    r13,rax
   271f7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   271fb:	ff e0                	jmp    rax
   271fd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18341
   27201:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   27205:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27209:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2720d:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   27211:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27218:	e8 d3 a1 00 00       	call   313f0 <JS_CheckBrand>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18342
   2721d:	85 c0                	test   eax,eax
   2721f:	0f 88 1b c1 ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18344
   27225:	0f 84 d4 56 00 00    	je     2c8ff <JS_CallInternal+0x9d5f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18349
   2722b:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27230:	49 83 c4 01          	add    r12,0x1
   27234:	49 89 c5             	mov    r13,rax
   27237:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2723b:	ff e0                	jmp    rax
   2723d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18326
   27241:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18327 (discriminator 1)
   27248:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18326
   2724f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18327 (discriminator 1)
   27253:	0f 84 ea 4b 00 00    	je     2be43 <JS_CallInternal+0x92a3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18329
   27259:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
   27260:	48 8b 95 d0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x130]
   27267:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2726e:	e8 2d b2 ff ff       	call   224a0 <JS_GetPrototype>
   27273:	49 89 c6             	mov    r14,rax
   27276:	49 89 d5             	mov    r13,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18330 (discriminator 1)
   27279:	83 fa 06             	cmp    edx,0x6
   2727c:	0f 84 be c0 ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_CallConstructor2():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20893
   27282:	6a 02                	push   0x2
   27284:	44 8b 8d bc fe ff ff 	mov    r9d,DWORD PTR [rbp-0x144]
   2728b:	48 89 c6             	mov    rsi,rax
   2728e:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
   27294:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   2729b:	4c 8b 85 80 fe ff ff 	mov    r8,QWORD PTR [rbp-0x180]
   272a2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   272a9:	e8 82 9d 06 00       	call   91030 <JS_CallConstructorInternal>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   272ae:	41 58                	pop    r8
   272b0:	41 59                	pop    r9
JS_CallConstructor2():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20893
   272b2:	48 89 d1             	mov    rcx,rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   272b5:	41 83 fd f6          	cmp    r13d,0xfffffff6
   272b9:	76 13                	jbe    272ce <JS_CallInternal+0x472e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   272bb:	41 8b 7e fc          	mov    edi,DWORD PTR [r14-0x4]
   272bf:	8d 57 ff             	lea    edx,[rdi-0x1]
   272c2:	41 89 56 fc          	mov    DWORD PTR [r14-0x4],edx
   272c6:	85 d2                	test   edx,edx
   272c8:	0f 8e 47 33 00 00    	jle    2a615 <JS_CallInternal+0x7a75>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18334 (discriminator 1)
   272ce:	83 f9 06             	cmp    ecx,0x6
   272d1:	0f 84 69 c0 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18336
   272d7:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18338
   272da:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18336
   272de:	48 83 c3 10          	add    rbx,0x10
   272e2:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18338
   272e6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   272ec:	49 89 c5             	mov    r13,rax
   272ef:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   272f3:	ff e0                	jmp    rax
   272f5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18317 (discriminator 1)
   272f9:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
   27300:	0f 84 3d 4b 00 00    	je     2be43 <JS_CallInternal+0x92a3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18322
   27306:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2730b:	49 83 c4 01          	add    r12,0x1
   2730f:	49 89 c5             	mov    r13,rax
   27312:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27316:	ff e0                	jmp    rax
   27318:	f3 0f 1e fa          	endbr64
JS_IsObject():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:664
   2731c:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18305 (discriminator 1)
   27320:	83 f8 ff             	cmp    eax,0xffffffff
   27323:	0f 84 07 29 00 00    	je     29c30 <JS_CallInternal+0x7090>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18306 (discriminator 1)
   27329:	83 f8 03             	cmp    eax,0x3
   2732c:	0f 85 3b 53 00 00    	jne    2c66d <JS_CallInternal+0x9acd>
   27332:	b8 01 00 00 00       	mov    eax,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18310
   27337:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18315
   2733a:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18314
   2733e:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18310
   27342:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27349:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18315
   2734a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27350:	49 89 c5             	mov    r13,rax
   27353:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27357:	ff e0                	jmp    rax
   27359:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18300
   2735d:	b9 03 00 00 00       	mov    ecx,0x3
   27362:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18301
   27364:	e9 2a bf ff ff       	jmp    23293 <JS_CallInternal+0x6f3>
   27369:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18139
   2736d:	f3 0f 6f 43 b0       	movdqu xmm0,XMMWORD PTR [rbx-0x50]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18140
   27372:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18146
   27377:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18141
   2737b:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18142
   27380:	f3 0f 6f 4b e0       	movdqu xmm1,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18143
   27385:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18140
   2738a:	0f 11 7b b0          	movups XMMWORD PTR [rbx-0x50],xmm7
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18141
   2738e:	0f 11 5b c0          	movups XMMWORD PTR [rbx-0x40],xmm3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18142
   27392:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18143
   27396:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18144
   2739a:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18146
   2739e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   273a4:	49 89 c5             	mov    r13,rax
   273a7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   273ab:	ff e0                	jmp    rax
   273ad:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18129
   273b1:	f3 0f 6f 43 c0       	movdqu xmm0,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18130
   273b6:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18135
   273bb:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18131
   273bf:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18132
   273c4:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18130
   273c9:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18131
   273cd:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18132
   273d1:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18133
   273d5:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18135
   273d9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   273df:	49 89 c5             	mov    r13,rax
   273e2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   273e6:	ff e0                	jmp    rax
   273e8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18120
   273ec:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18121
   273f1:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18125
   273f6:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18122
   273fa:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18121
   273ff:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18122
   27403:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18123
   27407:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18125
   2740b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27411:	49 89 c5             	mov    r13,rax
   27414:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27418:	ff e0                	jmp    rax
   2741a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18112
   2741e:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18113
   27423:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18116
   27428:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18113
   2742c:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18114
   27430:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18116
   27434:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2743a:	49 89 c5             	mov    r13,rax
   2743d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27441:	ff e0                	jmp    rax
   27443:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18102
   27447:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18103
   2744c:	f3 0f 6f 5b e0       	movdqu xmm3,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18104
   27451:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18105
   27456:	f3 0f 6f 6b c0       	movdqu xmm5,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18102
   2745b:	0f 11 3b             	movups XMMWORD PTR [rbx],xmm7
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18103
   2745e:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18102
   27462:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18104
   27466:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18103
   2746a:	0f 11 5b f0          	movups XMMWORD PTR [rbx-0x10],xmm3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18105
   2746e:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27472:	83 f8 f6             	cmp    eax,0xfffffff6
   27475:	76 04                	jbe    2747b <JS_CallInternal+0x48db>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27477:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18106
   2747b:	48 89 53 c0          	mov    QWORD PTR [rbx-0x40],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18108
   2747f:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18107
   27483:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18106
   27487:	48 89 43 b8          	mov    QWORD PTR [rbx-0x48],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18108
   2748b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27491:	49 89 c5             	mov    r13,rax
   27494:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27498:	ff e0                	jmp    rax
   2749a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18095
   2749e:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18096
   274a3:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18097
   274a8:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18095
   274ad:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   274b1:	0f 11 23             	movups XMMWORD PTR [rbx],xmm4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18096
   274b4:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   274b8:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18097
   274bc:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   274c0:	83 f8 f6             	cmp    eax,0xfffffff6
   274c3:	76 04                	jbe    274c9 <JS_CallInternal+0x4929>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   274c5:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18098
   274c9:	48 89 53 d0          	mov    QWORD PTR [rbx-0x30],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18100
   274cd:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18099
   274d1:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18098
   274d5:	48 89 43 c8          	mov    QWORD PTR [rbx-0x38],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18100
   274d9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   274df:	49 89 c5             	mov    r13,rax
   274e2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   274e6:	ff e0                	jmp    rax
   274e8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18089
   274ec:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18090
   274f1:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18089
   274f6:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   274fa:	0f 11 33             	movups XMMWORD PTR [rbx],xmm6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18090
   274fd:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   27501:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27505:	83 f8 f6             	cmp    eax,0xfffffff6
   27508:	76 04                	jbe    2750e <JS_CallInternal+0x496e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2750a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18091
   2750e:	48 89 53 e0          	mov    QWORD PTR [rbx-0x20],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18093
   27512:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18092
   27516:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18091
   2751a:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18093
   2751e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27524:	49 89 c5             	mov    r13,rax
   27527:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2752b:	ff e0                	jmp    rax
   2752d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18084
   27531:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   27536:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   2753a:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   2753e:	0f 11 2b             	movups XMMWORD PTR [rbx],xmm5
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27541:	83 f8 f6             	cmp    eax,0xfffffff6
   27544:	76 04                	jbe    2754a <JS_CallInternal+0x49aa>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27546:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18085
   2754a:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18087
   2754e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18086
   27552:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18085
   27556:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18087
   2755a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27560:	49 89 c5             	mov    r13,rax
   27563:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27567:	ff e0                	jmp    rax
   27569:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18178
   2756d:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18179
   27572:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18182
   27577:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18179
   2757b:	0f 11 53 e0          	movups XMMWORD PTR [rbx-0x20],xmm2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18180
   2757f:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18182
   27583:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27589:	49 89 c5             	mov    r13,rax
   2758c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27590:	ff e0                	jmp    rax
   27592:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18168
   27596:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18169
   2759b:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18174
   275a0:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18170
   275a4:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18171
   275a9:	f3 0f 6f 63 b0       	movdqu xmm4,XMMWORD PTR [rbx-0x50]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18169
   275ae:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18170
   275b2:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18171
   275b6:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18172
   275ba:	0f 11 43 b0          	movups XMMWORD PTR [rbx-0x50],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18174
   275be:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   275c4:	49 89 c5             	mov    r13,rax
   275c7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   275cb:	ff e0                	jmp    rax
   275cd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18159
   275d1:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18160
   275d6:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18164
   275db:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18161
   275df:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18160
   275e4:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18161
   275e8:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18162
   275ec:	0f 11 43 c0          	movups XMMWORD PTR [rbx-0x40],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18164
   275f0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   275f6:	49 89 c5             	mov    r13,rax
   275f9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   275fd:	ff e0                	jmp    rax
   275ff:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18150
   27603:	f3 0f 6f 43 f0       	movdqu xmm0,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18151
   27608:	f3 0f 6f 53 e0       	movdqu xmm2,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18155
   2760d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18152
   27611:	f3 0f 6f 6b d0       	movdqu xmm5,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18151
   27616:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18152
   2761a:	0f 11 6b e0          	movups XMMWORD PTR [rbx-0x20],xmm5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18153
   2761e:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18155
   27622:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27628:	49 89 c5             	mov    r13,rax
   2762b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2762f:	ff e0                	jmp    rax
   27631:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18197 (discriminator 1)
   27635:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   27639:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   27640:	48 c1 e0 04          	shl    rax,0x4
   27644:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   27648:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2764c:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2764f:	83 fa f6             	cmp    edx,0xfffffff6
   27652:	76 04                	jbe    27658 <JS_CallInternal+0x4ab8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27654:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18199
   27658:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   2765f:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18198
   27662:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18199
   27667:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   2766b:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   27672:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27679:	e8 e2 52 02 00       	call   4c960 <js_closure>
   2767e:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18200 (discriminator 2)
   27682:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18199
   27686:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18200 (discriminator 2)
   27689:	0f 84 fc 3c 00 00    	je     2b38b <JS_CallInternal+0x87eb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18203
   2768f:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18199
   27695:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18203
   27698:	49 83 c4 05          	add    r12,0x5
   2769c:	49 89 c5             	mov    r13,rax
   2769f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   276a3:	ff e0                	jmp    rax
   276a5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18186
   276a9:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18187
   276ae:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18193
   276b3:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18188
   276b7:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18189
   276bc:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18190
   276c1:	0f 11 4b e0          	movups XMMWORD PTR [rbx-0x20],xmm1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18188
   276c5:	0f 11 6b c0          	movups XMMWORD PTR [rbx-0x40],xmm5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18189
   276c9:	0f 11 73 d0          	movups XMMWORD PTR [rbx-0x30],xmm6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18191
   276cd:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18193
   276d1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   276d7:	49 89 c5             	mov    r13,rax
   276da:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   276de:	ff e0                	jmp    rax
   276e0:	f3 0f 1e fa          	endbr64
   276e4:	e9 7d b8 ff ff       	jmp    22f66 <JS_CallInternal+0x3c6>
   276e9:	f3 0f 1e fa          	endbr64
JS_NewObject():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5868
   276ed:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   276f4:	b9 01 00 00 00       	mov    ecx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17992
   276f9:	4c 8d 73 10          	lea    r14,[rbx+0x10]
JS_NewObject():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5868
   276fd:	48 8b 47 58          	mov    rax,QWORD PTR [rdi+0x58]
   27701:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
   27705:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   27709:	e8 b2 f3 01 00       	call   46ac0 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17992
   2770e:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17993 (discriminator 2)
   27712:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17992
   27716:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17993 (discriminator 2)
   27719:	0f 84 68 40 00 00    	je     2b787 <JS_CallInternal+0x8be7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17995
   2771f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17992
   27724:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17995
   27727:	49 83 c4 01          	add    r12,0x1
   2772b:	49 89 c5             	mov    r13,rax
   2772e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27732:	ff e0                	jmp    rax
   27734:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17989
   27738:	48 c7 03 01 00 00 00 	mov    QWORD PTR [rbx],0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17990
   2773f:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17989
   27743:	48 83 c3 10          	add    rbx,0x10
   27747:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2774e:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17990
   2774f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27755:	49 89 c5             	mov    r13,rax
   27758:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2775c:	ff e0                	jmp    rax
   2775e:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   27762:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27766:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18610
   2776b:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2776f:	83 fa f6             	cmp    edx,0xfffffff6
   27772:	76 04                	jbe    27778 <JS_CallInternal+0x4bd8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27774:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18610 (discriminator 1)
   27778:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   2777f:	48 c1 e0 04          	shl    rax,0x4
   27783:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27786:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   2778a:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2778d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   27791:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27794:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27798:	76 11                	jbe    277ab <JS_CallInternal+0x4c0b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2779a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2779d:	83 e8 01             	sub    eax,0x1
   277a0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   277a3:	85 c0                	test   eax,eax
   277a5:	0f 8e 5e 31 00 00    	jle    2a909 <JS_CallInternal+0x7d69>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18612
   277ab:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   277b1:	49 83 c4 03          	add    r12,0x3
   277b5:	49 89 c5             	mov    r13,rax
   277b8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   277bc:	ff e0                	jmp    rax
   277be:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18592
   277c2:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   277c7:	48 8b 8d 90 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x170]
   277ce:	48 c1 e0 04          	shl    rax,0x4
   277d2:	48 01 c8             	add    rax,rcx
   277d5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   277d8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   277dc:	83 f8 f6             	cmp    eax,0xfffffff6
   277df:	76 04                	jbe    277e5 <JS_CallInternal+0x4c45>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   277e1:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18592
   277e5:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18595
   277e8:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18593
   277ec:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18592
   277f0:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18595
   277f4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   277fa:	49 89 c5             	mov    r13,rax
   277fd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27801:	ff e0                	jmp    rax
   27803:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   27807:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2780b:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18584
   27810:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27814:	83 fa f6             	cmp    edx,0xfffffff6
   27817:	76 04                	jbe    2781d <JS_CallInternal+0x4c7d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27819:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18584 (discriminator 1)
   2781d:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   27824:	48 c1 e0 04          	shl    rax,0x4
   27828:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2782b:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   2782f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27832:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   27836:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27839:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   2783d:	76 11                	jbe    27850 <JS_CallInternal+0x4cb0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2783f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27842:	83 e8 01             	sub    eax,0x1
   27845:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27848:	85 c0                	test   eax,eax
   2784a:	0f 8e a1 30 00 00    	jle    2a8f1 <JS_CallInternal+0x7d51>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18586
   27850:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   27856:	49 83 c4 03          	add    r12,0x3
   2785a:	49 89 c5             	mov    r13,rax
   2785d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27861:	ff e0                	jmp    rax
   27863:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18601
   27867:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2786c:	48 8b 8d 90 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x170]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27873:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18601
   27878:	48 c1 e0 04          	shl    rax,0x4
   2787c:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2787f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27883:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27886:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27889:	83 fa f6             	cmp    edx,0xfffffff6
   2788c:	76 11                	jbe    2789f <JS_CallInternal+0x4cff>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2788e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27891:	83 e8 01             	sub    eax,0x1
   27894:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27897:	85 c0                	test   eax,eax
   27899:	0f 8e 97 30 00 00    	jle    2a936 <JS_CallInternal+0x7d96>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18604
   2789f:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18602
   278a5:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18604
   278a9:	49 83 c4 03          	add    r12,0x3
   278ad:	49 89 c5             	mov    r13,rax
   278b0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   278b4:	ff e0                	jmp    rax
   278b6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18575
   278ba:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   278bf:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   278c6:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18575
   278cb:	48 c1 e0 04          	shl    rax,0x4
   278cf:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   278d2:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   278d6:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   278d9:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   278dc:	83 fa f6             	cmp    edx,0xfffffff6
   278df:	76 11                	jbe    278f2 <JS_CallInternal+0x4d52>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   278e1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   278e4:	83 e8 01             	sub    eax,0x1
   278e7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   278ea:	85 c0                	test   eax,eax
   278ec:	0f 8e 2f 30 00 00    	jle    2a921 <JS_CallInternal+0x7d81>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18578
   278f2:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18576
   278f8:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18578
   278fc:	49 83 c4 03          	add    r12,0x3
   27900:	49 89 c5             	mov    r13,rax
   27903:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27907:	ff e0                	jmp    rax
   27909:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18566
   2790d:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   27912:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   27919:	48 c1 e0 04          	shl    rax,0x4
   2791d:	48 01 c8             	add    rax,rcx
   27920:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   27923:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27927:	83 f8 f6             	cmp    eax,0xfffffff6
   2792a:	76 04                	jbe    27930 <JS_CallInternal+0x4d90>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2792c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18566
   27930:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18569
   27933:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18567
   27937:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18566
   2793b:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18569
   2793f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27945:	49 89 c5             	mov    r13,rax
   27948:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2794c:	ff e0                	jmp    rax
   2794e:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27952:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27959:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18623
   2795e:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27962:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27966:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27969:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2796c:	83 fa f6             	cmp    edx,0xfffffff6
   2796f:	76 11                	jbe    27982 <JS_CallInternal+0x4de2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27971:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27974:	83 e8 01             	sub    eax,0x1
   27977:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2797a:	85 c0                	test   eax,eax
   2797c:	0f 8e 71 30 00 00    	jle    2a9f3 <JS_CallInternal+0x7e53>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18623 (discriminator 1)
   27982:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27987:	49 83 c4 01          	add    r12,0x1
   2798b:	49 89 c5             	mov    r13,rax
   2798e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27992:	ff e0                	jmp    rax
   27994:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18622
   27998:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   2799f:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   279a3:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   279a7:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   279ab:	83 f8 f6             	cmp    eax,0xfffffff6
   279ae:	76 04                	jbe    279b4 <JS_CallInternal+0x4e14>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   279b0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18622
   279b4:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18622 (discriminator 1)
   279b7:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18622
   279bb:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18622 (discriminator 1)
   279bf:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18622
   279c5:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18622 (discriminator 1)
   279c8:	49 89 c5             	mov    r13,rax
   279cb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   279cf:	ff e0                	jmp    rax
   279d1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18621
   279d5:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   279dc:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   279e0:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   279e4:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   279e8:	83 f8 f6             	cmp    eax,0xfffffff6
   279eb:	76 04                	jbe    279f1 <JS_CallInternal+0x4e51>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   279ed:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18621
   279f1:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18621 (discriminator 1)
   279f4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18621
   279f8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18621 (discriminator 1)
   279fc:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18621
   27a02:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18621 (discriminator 1)
   27a05:	49 89 c5             	mov    r13,rax
   27a08:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27a0c:	ff e0                	jmp    rax
   27a0e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18620
   27a12:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   27a19:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   27a1d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   27a21:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27a25:	83 f8 f6             	cmp    eax,0xfffffff6
   27a28:	76 04                	jbe    27a2e <JS_CallInternal+0x4e8e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27a2a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18620
   27a2e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18620 (discriminator 1)
   27a31:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18620
   27a35:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18620 (discriminator 1)
   27a39:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18620
   27a3f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18620 (discriminator 1)
   27a42:	49 89 c5             	mov    r13,rax
   27a45:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27a49:	ff e0                	jmp    rax
   27a4b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18619
   27a4f:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   27a56:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   27a5a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   27a5d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27a61:	83 f8 f6             	cmp    eax,0xfffffff6
   27a64:	76 04                	jbe    27a6a <JS_CallInternal+0x4eca>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27a66:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18619
   27a6a:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18619 (discriminator 1)
   27a6d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18619
   27a71:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18619 (discriminator 1)
   27a75:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18619
   27a7b:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18619 (discriminator 1)
   27a7e:	49 89 c5             	mov    r13,rax
   27a81:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27a85:	ff e0                	jmp    rax
   27a87:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18617
   27a8b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27a8f:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27a93:	83 fa f6             	cmp    edx,0xfffffff6
   27a96:	76 04                	jbe    27a9c <JS_CallInternal+0x4efc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27a98:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18617 (discriminator 1)
   27a9c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27aa1:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   27aa8:	48 c1 e0 04          	shl    rax,0x4
   27aac:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27aaf:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   27ab3:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27ab6:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   27aba:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27abd:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27ac1:	76 11                	jbe    27ad4 <JS_CallInternal+0x4f34>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27ac3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27ac6:	83 e8 01             	sub    eax,0x1
   27ac9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27acc:	85 c0                	test   eax,eax
   27ace:	0f 8e b0 30 00 00    	jle    2ab84 <JS_CallInternal+0x7fe4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18617 (discriminator 2)
   27ad4:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27ada:	49 83 c4 02          	add    r12,0x2
   27ade:	49 89 c5             	mov    r13,rax
   27ae1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ae5:	ff e0                	jmp    rax
   27ae7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18616
   27aeb:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27af0:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   27af7:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27afb:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18616
   27aff:	48 c1 e0 04          	shl    rax,0x4
   27b03:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27b06:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27b0a:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27b0d:	0f 11 10             	movups XMMWORD PTR [rax],xmm2
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27b10:	83 fa f6             	cmp    edx,0xfffffff6
   27b13:	76 11                	jbe    27b26 <JS_CallInternal+0x4f86>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27b15:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27b18:	83 e8 01             	sub    eax,0x1
   27b1b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27b1e:	85 c0                	test   eax,eax
   27b20:	0f 8e 49 30 00 00    	jle    2ab6f <JS_CallInternal+0x7fcf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18616 (discriminator 1)
   27b26:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27b2c:	49 83 c4 02          	add    r12,0x2
   27b30:	49 89 c5             	mov    r13,rax
   27b33:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27b37:	ff e0                	jmp    rax
   27b39:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18615
   27b3d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27b42:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   27b49:	48 c1 e0 04          	shl    rax,0x4
   27b4d:	48 01 c8             	add    rax,rcx
   27b50:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   27b54:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   27b57:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27b5b:	83 f8 f6             	cmp    eax,0xfffffff6
   27b5e:	76 04                	jbe    27b64 <JS_CallInternal+0x4fc4>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27b60:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18615
   27b64:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18615 (discriminator 1)
   27b67:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18615
   27b6b:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18615 (discriminator 1)
   27b6f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18615
   27b75:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18615 (discriminator 1)
   27b78:	49 89 c5             	mov    r13,rax
   27b7b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27b7f:	ff e0                	jmp    rax
   27b81:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18627
   27b85:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   27b89:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27b8d:	83 f8 f6             	cmp    eax,0xfffffff6
   27b90:	76 04                	jbe    27b96 <JS_CallInternal+0x4ff6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27b92:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27b96:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   27b9d:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   27ba1:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27ba4:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   27ba8:	48 89 17             	mov    QWORD PTR [rdi],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27bab:	83 f9 f6             	cmp    ecx,0xfffffff6
   27bae:	76 11                	jbe    27bc1 <JS_CallInternal+0x5021>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27bb0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27bb3:	83 e8 01             	sub    eax,0x1
   27bb6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27bb9:	85 c0                	test   eax,eax
   27bbb:	0f 8e db 2f 00 00    	jle    2ab9c <JS_CallInternal+0x7ffc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18627 (discriminator 2)
   27bc1:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27bc6:	49 83 c4 01          	add    r12,0x1
   27bca:	49 89 c5             	mov    r13,rax
   27bcd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27bd1:	ff e0                	jmp    rax
   27bd3:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27bd7:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27bde:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18625
   27be3:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27be7:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   27beb:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27bef:	0f 11 78 20          	movups XMMWORD PTR [rax+0x20],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27bf3:	83 fa f6             	cmp    edx,0xfffffff6
   27bf6:	76 11                	jbe    27c09 <JS_CallInternal+0x5069>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27bf8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27bfb:	83 e8 01             	sub    eax,0x1
   27bfe:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27c01:	85 c0                	test   eax,eax
   27c03:	0f 8e c0 2f 00 00    	jle    2abc9 <JS_CallInternal+0x8029>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18625 (discriminator 1)
   27c09:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27c0e:	49 83 c4 01          	add    r12,0x1
   27c12:	49 89 c5             	mov    r13,rax
   27c15:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27c19:	ff e0                	jmp    rax
   27c1b:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27c1f:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27c26:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18626
   27c2b:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27c2f:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   27c33:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27c37:	0f 11 58 30          	movups XMMWORD PTR [rax+0x30],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27c3b:	83 fa f6             	cmp    edx,0xfffffff6
   27c3e:	76 11                	jbe    27c51 <JS_CallInternal+0x50b1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27c40:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27c43:	83 e8 01             	sub    eax,0x1
   27c46:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27c49:	85 c0                	test   eax,eax
   27c4b:	0f 8e 63 2f 00 00    	jle    2abb4 <JS_CallInternal+0x8014>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18626 (discriminator 1)
   27c51:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27c56:	49 83 c4 01          	add    r12,0x1
   27c5a:	49 89 c5             	mov    r13,rax
   27c5d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27c61:	ff e0                	jmp    rax
   27c63:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27c67:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27c6e:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18624
   27c73:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27c77:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   27c7b:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27c7f:	0f 11 70 10          	movups XMMWORD PTR [rax+0x10],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27c83:	83 fa f6             	cmp    edx,0xfffffff6
   27c86:	76 11                	jbe    27c99 <JS_CallInternal+0x50f9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27c88:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27c8b:	83 e8 01             	sub    eax,0x1
   27c8e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27c91:	85 c0                	test   eax,eax
   27c93:	0f 8e 45 2f 00 00    	jle    2abde <JS_CallInternal+0x803e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18624 (discriminator 1)
   27c99:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27c9e:	49 83 c4 01          	add    r12,0x1
   27ca2:	49 89 c5             	mov    r13,rax
   27ca5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ca9:	ff e0                	jmp    rax
   27cab:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18629
   27caf:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   27cb3:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27cb7:	83 f8 f6             	cmp    eax,0xfffffff6
   27cba:	76 04                	jbe    27cc0 <JS_CallInternal+0x5120>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27cbc:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27cc0:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   27cc7:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   27ccb:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27ccf:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   27cd3:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27cd7:	83 f9 f6             	cmp    ecx,0xfffffff6
   27cda:	76 11                	jbe    27ced <JS_CallInternal+0x514d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27cdc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27cdf:	83 e8 01             	sub    eax,0x1
   27ce2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27ce5:	85 c0                	test   eax,eax
   27ce7:	0f 8e 93 2f 00 00    	jle    2ac80 <JS_CallInternal+0x80e0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18629 (discriminator 2)
   27ced:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27cf2:	49 83 c4 01          	add    r12,0x1
   27cf6:	49 89 c5             	mov    r13,rax
   27cf9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27cfd:	ff e0                	jmp    rax
   27cff:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18630
   27d03:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   27d07:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27d0b:	83 f8 f6             	cmp    eax,0xfffffff6
   27d0e:	76 04                	jbe    27d14 <JS_CallInternal+0x5174>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27d10:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27d14:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   27d1b:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   27d1f:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27d23:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   27d27:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27d2b:	83 f9 f6             	cmp    ecx,0xfffffff6
   27d2e:	76 11                	jbe    27d41 <JS_CallInternal+0x51a1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27d30:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27d33:	83 e8 01             	sub    eax,0x1
   27d36:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27d39:	85 c0                	test   eax,eax
   27d3b:	0f 8e 27 2f 00 00    	jle    2ac68 <JS_CallInternal+0x80c8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18630 (discriminator 2)
   27d41:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27d46:	49 83 c4 01          	add    r12,0x1
   27d4a:	49 89 c5             	mov    r13,rax
   27d4d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27d51:	ff e0                	jmp    rax
   27d53:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18628
   27d57:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   27d5b:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27d5f:	83 f8 f6             	cmp    eax,0xfffffff6
   27d62:	76 04                	jbe    27d68 <JS_CallInternal+0x51c8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27d64:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27d68:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   27d6f:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   27d73:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27d77:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   27d7b:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27d7f:	83 f9 f6             	cmp    ecx,0xfffffff6
   27d82:	76 11                	jbe    27d95 <JS_CallInternal+0x51f5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27d84:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27d87:	83 e8 01             	sub    eax,0x1
   27d8a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27d8d:	85 c0                	test   eax,eax
   27d8f:	0f 8e 03 2f 00 00    	jle    2ac98 <JS_CallInternal+0x80f8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18628 (discriminator 2)
   27d95:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27d9a:	49 83 c4 01          	add    r12,0x1
   27d9e:	49 89 c5             	mov    r13,rax
   27da1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27da5:	ff e0                	jmp    rax
   27da7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18663
   27dab:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   27db0:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   27db7:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   27dbb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   27dbf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   27dc2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27dc6:	83 f8 f6             	cmp    eax,0xfffffff6
   27dc9:	76 04                	jbe    27dcf <JS_CallInternal+0x522f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27dcb:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18664
   27dcf:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18667
   27dd2:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18665
   27dd6:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18664
   27dda:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18667
   27dde:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27de4:	49 89 c5             	mov    r13,rax
   27de7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27deb:	ff e0                	jmp    rax
   27ded:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18654
   27df1:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27df5:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27df9:	83 fa f6             	cmp    edx,0xfffffff6
   27dfc:	76 04                	jbe    27e02 <JS_CallInternal+0x5262>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27dfe:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18654 (discriminator 1)
   27e02:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   27e09:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   27e0d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27e11:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   27e15:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27e18:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   27e1c:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27e1f:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27e23:	76 11                	jbe    27e36 <JS_CallInternal+0x5296>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27e25:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27e28:	83 e8 01             	sub    eax,0x1
   27e2b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27e2e:	85 c0                	test   eax,eax
   27e30:	0f 8e 43 2f 00 00    	jle    2ad79 <JS_CallInternal+0x81d9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18654 (discriminator 2)
   27e36:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27e3b:	49 83 c4 01          	add    r12,0x1
   27e3f:	49 89 c5             	mov    r13,rax
   27e42:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27e46:	ff e0                	jmp    rax
   27e48:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18653
   27e4c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27e50:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27e54:	83 fa f6             	cmp    edx,0xfffffff6
   27e57:	76 04                	jbe    27e5d <JS_CallInternal+0x52bd>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27e59:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18653 (discriminator 1)
   27e5d:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   27e64:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   27e68:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27e6c:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   27e70:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27e73:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   27e77:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27e7a:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27e7e:	76 11                	jbe    27e91 <JS_CallInternal+0x52f1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27e80:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27e83:	83 e8 01             	sub    eax,0x1
   27e86:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27e89:	85 c0                	test   eax,eax
   27e8b:	0f 8e d0 2e 00 00    	jle    2ad61 <JS_CallInternal+0x81c1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18653 (discriminator 2)
   27e91:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27e96:	49 83 c4 01          	add    r12,0x1
   27e9a:	49 89 c5             	mov    r13,rax
   27e9d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ea1:	ff e0                	jmp    rax
   27ea3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18652
   27ea7:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27eab:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27eaf:	83 fa f6             	cmp    edx,0xfffffff6
   27eb2:	76 04                	jbe    27eb8 <JS_CallInternal+0x5318>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27eb4:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18652 (discriminator 1)
   27eb8:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   27ebf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   27ec3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27ec7:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   27ecb:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27ece:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   27ed2:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27ed5:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27ed9:	76 11                	jbe    27eec <JS_CallInternal+0x534c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27edb:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27ede:	83 e8 01             	sub    eax,0x1
   27ee1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27ee4:	85 c0                	test   eax,eax
   27ee6:	0f 8e 06 2e 00 00    	jle    2acf2 <JS_CallInternal+0x8152>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18652 (discriminator 2)
   27eec:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27ef1:	49 83 c4 01          	add    r12,0x1
   27ef5:	49 89 c5             	mov    r13,rax
   27ef8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27efc:	ff e0                	jmp    rax
   27efe:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18651
   27f02:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27f06:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   27f0a:	83 fa f6             	cmp    edx,0xfffffff6
   27f0d:	76 04                	jbe    27f13 <JS_CallInternal+0x5373>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   27f0f:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18651 (discriminator 1)
   27f13:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   27f1a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   27f1d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27f21:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   27f25:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27f28:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   27f2c:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27f2f:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27f33:	76 11                	jbe    27f46 <JS_CallInternal+0x53a6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27f35:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27f38:	83 e8 01             	sub    eax,0x1
   27f3b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27f3e:	85 c0                	test   eax,eax
   27f40:	0f 8e 94 2d 00 00    	jle    2acda <JS_CallInternal+0x813a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18651 (discriminator 2)
   27f46:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27f4b:	49 83 c4 01          	add    r12,0x1
   27f4f:	49 89 c5             	mov    r13,rax
   27f52:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27f56:	ff e0                	jmp    rax
   27f58:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18650
   27f5c:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27f63:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18650
   27f68:	48 83 eb 10          	sub    rbx,0x10
   27f6c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   27f70:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27f74:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27f78:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27f7b:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27f7e:	83 fa f6             	cmp    edx,0xfffffff6
   27f81:	76 11                	jbe    27f94 <JS_CallInternal+0x53f4>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27f83:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27f86:	83 e8 01             	sub    eax,0x1
   27f89:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27f8c:	85 c0                	test   eax,eax
   27f8e:	0f 8e 31 2d 00 00    	jle    2acc5 <JS_CallInternal+0x8125>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18650 (discriminator 1)
   27f94:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27f99:	49 83 c4 01          	add    r12,0x1
   27f9d:	49 89 c5             	mov    r13,rax
   27fa0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27fa4:	ff e0                	jmp    rax
   27fa6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18649
   27faa:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27fb1:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18649
   27fb6:	48 83 eb 10          	sub    rbx,0x10
   27fba:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   27fbe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   27fc2:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27fc6:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27fc9:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   27fcc:	83 fa f6             	cmp    edx,0xfffffff6
   27fcf:	76 11                	jbe    27fe2 <JS_CallInternal+0x5442>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   27fd1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27fd4:	83 e8 01             	sub    eax,0x1
   27fd7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27fda:	85 c0                	test   eax,eax
   27fdc:	0f 8e ce 2c 00 00    	jle    2acb0 <JS_CallInternal+0x8110>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18649 (discriminator 1)
   27fe2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27fe7:	49 83 c4 01          	add    r12,0x1
   27feb:	49 89 c5             	mov    r13,rax
   27fee:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ff2:	ff e0                	jmp    rax
   27ff4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18648
   27ff8:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   27fff:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18648
   28004:	48 83 eb 10          	sub    rbx,0x10
   28008:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2800c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28010:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   28014:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28017:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2801a:	83 fa f6             	cmp    edx,0xfffffff6
   2801d:	76 11                	jbe    28030 <JS_CallInternal+0x5490>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2801f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28022:	83 e8 01             	sub    eax,0x1
   28025:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28028:	85 c0                	test   eax,eax
   2802a:	0f 8e da 2c 00 00    	jle    2ad0a <JS_CallInternal+0x816a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18648 (discriminator 1)
   28030:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28035:	49 83 c4 01          	add    r12,0x1
   28039:	49 89 c5             	mov    r13,rax
   2803c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28040:	ff e0                	jmp    rax
   28042:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18705
   28046:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2804b:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18704
   28052:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18705
   28057:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   2805e:	00 
   2805f:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   28063:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   28067:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18705 (discriminator 2)
   2806b:	83 fa 04             	cmp    edx,0x4
   2806e:	0f 84 67 2f 00 00    	je     2afdb <JS_CallInternal+0x843b>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28074:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28079:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2807c:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2807f:	83 fa f6             	cmp    edx,0xfffffff6
   28082:	76 11                	jbe    28095 <JS_CallInternal+0x54f5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28084:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28087:	83 e8 01             	sub    eax,0x1
   2808a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2808d:	85 c0                	test   eax,eax
   2808f:	0f 8e b7 2c 00 00    	jle    2ad4c <JS_CallInternal+0x81ac>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18712
   28095:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18710
   2809b:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18712
   2809f:	49 83 c4 03          	add    r12,0x3
   280a3:	49 89 c5             	mov    r13,rax
   280a6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   280aa:	ff e0                	jmp    rax
   280ac:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18691
   280b0:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   280b5:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18690
   280bc:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18691
   280c1:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   280c8:	00 
   280c9:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   280cd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   280d1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   280d4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18692 (discriminator 2)
   280d8:	83 f8 04             	cmp    eax,0x4
   280db:	0f 84 bf 2e 00 00    	je     2afa0 <JS_CallInternal+0x8400>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   280e1:	83 f8 f6             	cmp    eax,0xfffffff6
   280e4:	76 04                	jbe    280ea <JS_CallInternal+0x554a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   280e6:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18696
   280ea:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18699
   280ed:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18697
   280f1:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18696
   280f5:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18699
   280f9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   280ff:	49 89 c5             	mov    r13,rax
   28102:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28106:	ff e0                	jmp    rax
   28108:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   2810c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28110:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18682
   28115:	48 8b 7b f0          	mov    rdi,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28119:	83 fa f6             	cmp    edx,0xfffffff6
   2811c:	76 04                	jbe    28122 <JS_CallInternal+0x5582>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2811e:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18682 (discriminator 1)
   28122:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   28129:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   2812d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28131:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   28135:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28138:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   2813c:	48 89 38             	mov    QWORD PTR [rax],rdi
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2813f:	83 f9 f6             	cmp    ecx,0xfffffff6
   28142:	76 11                	jbe    28155 <JS_CallInternal+0x55b5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28144:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28147:	83 e8 01             	sub    eax,0x1
   2814a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2814d:	85 c0                	test   eax,eax
   2814f:	0f 8e ca 2b 00 00    	jle    2ad1f <JS_CallInternal+0x817f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18684
   28155:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2815b:	49 83 c4 03          	add    r12,0x3
   2815f:	49 89 c5             	mov    r13,rax
   28162:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28166:	ff e0                	jmp    rax
   28168:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18673
   2816c:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   28171:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28178:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18673
   2817d:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   28181:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28185:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   28189:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2818c:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2818f:	83 fa f6             	cmp    edx,0xfffffff6
   28192:	76 11                	jbe    281a5 <JS_CallInternal+0x5605>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28194:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28197:	83 e8 01             	sub    eax,0x1
   2819a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2819d:	85 c0                	test   eax,eax
   2819f:	0f 8e 92 2b 00 00    	jle    2ad37 <JS_CallInternal+0x8197>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18676
   281a5:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18674
   281ab:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18676
   281af:	49 83 c4 03          	add    r12,0x3
   281b3:	49 89 c5             	mov    r13,rax
   281b6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   281ba:	ff e0                	jmp    rax
   281bc:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18731
   281c0:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   281c5:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   281cc:	48 c1 e0 04          	shl    rax,0x4
   281d0:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   281d3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   281d7:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   281da:	48 c7 40 08 04 00 00 	mov    QWORD PTR [rax+0x8],0x4
   281e1:	00 
   281e2:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   281e9:	83 fa f6             	cmp    edx,0xfffffff6
   281ec:	76 11                	jbe    281ff <JS_CallInternal+0x565f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   281ee:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   281f1:	83 e8 01             	sub    eax,0x1
   281f4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   281f7:	85 c0                	test   eax,eax
   281f9:	0f 8e 3c 2a 00 00    	jle    2ac3b <JS_CallInternal+0x809b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18733
   281ff:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   28205:	49 83 c4 03          	add    r12,0x3
   28209:	49 89 c5             	mov    r13,rax
   2820c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28210:	ff e0                	jmp    rax
   28212:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   28216:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18739
   2821b:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18738
   28222:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:196
   28227:	48 89 c1             	mov    rcx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18739
   2822a:	48 c1 e0 04          	shl    rax,0x4
   2822e:	48 01 f8             	add    rax,rdi
   28231:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18739 (discriminator 2)
   28235:	83 fa 04             	cmp    edx,0x4
   28238:	0f 84 d8 2d 00 00    	je     2b016 <JS_CallInternal+0x8476>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18743
   2823e:	48 8b 00             	mov    rax,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28241:	83 fa f6             	cmp    edx,0xfffffff6
   28244:	76 04                	jbe    2824a <JS_CallInternal+0x56aa>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28246:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18743
   2824a:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18746
   2824d:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18744
   28251:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18743
   28255:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18746
   28259:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2825f:	49 89 c5             	mov    r13,rax
   28262:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28266:	ff e0                	jmp    rax
   28268:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18718
   2826c:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   28271:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18717
   28278:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18718
   2827d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   28284:	00 
   28285:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   28289:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18718 (discriminator 2)
   2828d:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   28291:	0f 85 44 37 00 00    	jne    2b9db <JS_CallInternal+0x8e3b>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28297:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18725
   2829c:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18723
   282a0:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   282a4:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18725
   282a7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   282ad:	49 89 c5             	mov    r13,rax
   282b0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   282b4:	ff e0                	jmp    rax
   282b6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18639
   282ba:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   282be:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   282c2:	83 f8 f6             	cmp    eax,0xfffffff6
   282c5:	76 04                	jbe    282cb <JS_CallInternal+0x572b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   282c7:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   282cb:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   282d2:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   282d6:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   282d9:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   282dd:	48 89 17             	mov    QWORD PTR [rdi],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   282e0:	83 f9 f6             	cmp    ecx,0xfffffff6
   282e3:	76 11                	jbe    282f6 <JS_CallInternal+0x5756>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   282e5:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   282e8:	83 e8 01             	sub    eax,0x1
   282eb:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   282ee:	85 c0                	test   eax,eax
   282f0:	0f 8e 5a 29 00 00    	jle    2ac50 <JS_CallInternal+0x80b0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18639 (discriminator 2)
   282f6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   282fb:	49 83 c4 01          	add    r12,0x1
   282ff:	49 89 c5             	mov    r13,rax
   28302:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28306:	ff e0                	jmp    rax
   28308:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18643
   2830c:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   28313:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   28317:	48 8b 00             	mov    rax,QWORD PTR [rax]
   2831a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   2831e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   28321:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28325:	83 f8 f6             	cmp    eax,0xfffffff6
   28328:	76 04                	jbe    2832e <JS_CallInternal+0x578e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2832a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18643
   2832e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18643 (discriminator 1)
   28331:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18643
   28335:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18643 (discriminator 1)
   28339:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18643
   2833f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18643 (discriminator 1)
   28342:	49 89 c5             	mov    r13,rax
   28345:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28349:	ff e0                	jmp    rax
   2834b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18642
   2834f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   28353:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28357:	83 f8 f6             	cmp    eax,0xfffffff6
   2835a:	76 04                	jbe    28360 <JS_CallInternal+0x57c0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2835c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28360:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   28367:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   2836b:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2836f:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   28373:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   28377:	83 f9 f6             	cmp    ecx,0xfffffff6
   2837a:	76 11                	jbe    2838d <JS_CallInternal+0x57ed>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2837c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2837f:	83 e8 01             	sub    eax,0x1
   28382:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28385:	85 c0                	test   eax,eax
   28387:	0f 8e 96 28 00 00    	jle    2ac23 <JS_CallInternal+0x8083>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18642 (discriminator 2)
   2838d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28392:	49 83 c4 01          	add    r12,0x1
   28396:	49 89 c5             	mov    r13,rax
   28399:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2839d:	ff e0                	jmp    rax
   2839f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18641
   283a3:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   283a7:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   283ab:	83 f8 f6             	cmp    eax,0xfffffff6
   283ae:	76 04                	jbe    283b4 <JS_CallInternal+0x5814>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   283b0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   283b4:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   283bb:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   283bf:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   283c3:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   283c7:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   283cb:	83 f9 f6             	cmp    ecx,0xfffffff6
   283ce:	76 11                	jbe    283e1 <JS_CallInternal+0x5841>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   283d0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   283d3:	83 e8 01             	sub    eax,0x1
   283d6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   283d9:	85 c0                	test   eax,eax
   283db:	0f 8e 2a 28 00 00    	jle    2ac0b <JS_CallInternal+0x806b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18641 (discriminator 2)
   283e1:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   283e6:	49 83 c4 01          	add    r12,0x1
   283ea:	49 89 c5             	mov    r13,rax
   283ed:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   283f1:	ff e0                	jmp    rax
   283f3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18640
   283f7:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   283fb:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   283ff:	83 f8 f6             	cmp    eax,0xfffffff6
   28402:	76 04                	jbe    28408 <JS_CallInternal+0x5868>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28404:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28408:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   2840f:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   28413:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28417:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   2841b:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2841f:	83 f9 f6             	cmp    ecx,0xfffffff6
   28422:	76 11                	jbe    28435 <JS_CallInternal+0x5895>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28424:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28427:	83 e8 01             	sub    eax,0x1
   2842a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2842d:	85 c0                	test   eax,eax
   2842f:	0f 8e be 27 00 00    	jle    2abf3 <JS_CallInternal+0x8053>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18640 (discriminator 2)
   28435:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2843a:	49 83 c4 01          	add    r12,0x1
   2843e:	49 89 c5             	mov    r13,rax
   28441:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28445:	ff e0                	jmp    rax
   28447:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18645
   2844b:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   28452:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   28456:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2845a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   2845e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   28461:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28465:	83 f8 f6             	cmp    eax,0xfffffff6
   28468:	76 04                	jbe    2846e <JS_CallInternal+0x58ce>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2846a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18645
   2846e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18645 (discriminator 1)
   28471:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18645
   28475:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18645 (discriminator 1)
   28479:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18645
   2847f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18645 (discriminator 1)
   28482:	49 89 c5             	mov    r13,rax
   28485:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28489:	ff e0                	jmp    rax
   2848b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18644
   2848f:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   28496:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2849a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2849e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   284a2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   284a5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   284a9:	83 f8 f6             	cmp    eax,0xfffffff6
   284ac:	76 04                	jbe    284b2 <JS_CallInternal+0x5912>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   284ae:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18644
   284b2:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18644 (discriminator 1)
   284b5:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18644
   284b9:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18644 (discriminator 1)
   284bd:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18644
   284c3:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18644 (discriminator 1)
   284c6:	49 89 c5             	mov    r13,rax
   284c9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   284cd:	ff e0                	jmp    rax
   284cf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18646
   284d3:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   284da:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   284de:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   284e2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   284e6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   284e9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   284ed:	83 f8 f6             	cmp    eax,0xfffffff6
   284f0:	76 04                	jbe    284f6 <JS_CallInternal+0x5956>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   284f2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18646
   284f6:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18646 (discriminator 1)
   284f9:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18646
   284fd:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18646 (discriminator 1)
   28501:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18646
   28507:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18646 (discriminator 1)
   2850a:	49 89 c5             	mov    r13,rax
   2850d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28511:	ff e0                	jmp    rax
   28513:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28517:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2851e:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18635
   28523:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   28527:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2852b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2852e:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   28531:	83 fa f6             	cmp    edx,0xfffffff6
   28534:	76 11                	jbe    28547 <JS_CallInternal+0x59a7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28536:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28539:	83 e8 01             	sub    eax,0x1
   2853c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2853f:	85 c0                	test   eax,eax
   28541:	0f 8e 2f 21 00 00    	jle    2a676 <JS_CallInternal+0x7ad6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18635 (discriminator 1)
   28547:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2854c:	49 83 c4 01          	add    r12,0x1
   28550:	49 89 c5             	mov    r13,rax
   28553:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28557:	ff e0                	jmp    rax
   28559:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2855d:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28564:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18637
   28569:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2856d:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   28571:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28575:	0f 11 50 20          	movups XMMWORD PTR [rax+0x20],xmm2
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   28579:	83 fa f6             	cmp    edx,0xfffffff6
   2857c:	76 11                	jbe    2858f <JS_CallInternal+0x59ef>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2857e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28581:	83 e8 01             	sub    eax,0x1
   28584:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28587:	85 c0                	test   eax,eax
   28589:	0f 8e d2 20 00 00    	jle    2a661 <JS_CallInternal+0x7ac1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18637 (discriminator 1)
   2858f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28594:	49 83 c4 01          	add    r12,0x1
   28598:	49 89 c5             	mov    r13,rax
   2859b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2859f:	ff e0                	jmp    rax
   285a1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18633
   285a5:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   285ac:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   285b0:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   285b4:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   285b8:	83 f8 f6             	cmp    eax,0xfffffff6
   285bb:	76 04                	jbe    285c1 <JS_CallInternal+0x5a21>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   285bd:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18633
   285c1:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18633 (discriminator 1)
   285c4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18633
   285c8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18633 (discriminator 1)
   285cc:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18633
   285d2:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18633 (discriminator 1)
   285d5:	49 89 c5             	mov    r13,rax
   285d8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   285dc:	ff e0                	jmp    rax
   285de:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18632
   285e2:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   285e9:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   285ed:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   285f1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   285f5:	83 f8 f6             	cmp    eax,0xfffffff6
   285f8:	76 04                	jbe    285fe <JS_CallInternal+0x5a5e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   285fa:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18632
   285fe:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18632 (discriminator 1)
   28601:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18632
   28605:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18632 (discriminator 1)
   28609:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18632
   2860f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18632 (discriminator 1)
   28612:	49 89 c5             	mov    r13,rax
   28615:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28619:	ff e0                	jmp    rax
   2861b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18634
   2861f:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   28626:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2862a:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   2862e:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28632:	83 f8 f6             	cmp    eax,0xfffffff6
   28635:	76 04                	jbe    2863b <JS_CallInternal+0x5a9b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28637:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18634
   2863b:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18634 (discriminator 1)
   2863e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18634
   28642:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18634 (discriminator 1)
   28646:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18634
   2864c:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18634 (discriminator 1)
   2864f:	49 89 c5             	mov    r13,rax
   28652:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28656:	ff e0                	jmp    rax
   28658:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2865c:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28663:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18638
   28668:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2866c:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   28670:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   28674:	0f 11 68 30          	movups XMMWORD PTR [rax+0x30],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   28678:	83 fa f6             	cmp    edx,0xfffffff6
   2867b:	76 11                	jbe    2868e <JS_CallInternal+0x5aee>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2867d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28680:	83 e8 01             	sub    eax,0x1
   28683:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28686:	85 c0                	test   eax,eax
   28688:	0f 8e be 1f 00 00    	jle    2a64c <JS_CallInternal+0x7aac>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18638 (discriminator 1)
   2868e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28693:	49 83 c4 01          	add    r12,0x1
   28697:	49 89 c5             	mov    r13,rax
   2869a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2869e:	ff e0                	jmp    rax
   286a0:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   286a4:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   286ab:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18636
   286b0:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   286b4:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   286b8:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   286bc:	0f 11 60 10          	movups XMMWORD PTR [rax+0x10],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   286c0:	83 fa f6             	cmp    edx,0xfffffff6
   286c3:	76 11                	jbe    286d6 <JS_CallInternal+0x5b36>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   286c5:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   286c8:	83 e8 01             	sub    eax,0x1
   286cb:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   286ce:	85 c0                	test   eax,eax
   286d0:	0f 8e fe 20 00 00    	jle    2a7d4 <JS_CallInternal+0x7c34>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18636 (discriminator 1)
   286d6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   286db:	49 83 c4 01          	add    r12,0x1
   286df:	49 89 c5             	mov    r13,rax
   286e2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   286e6:	ff e0                	jmp    rax
   286e8:	f3 0f 1e fa          	endbr64
   286ec:	e9 97 a7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   286f1:	f3 0f 1e fa          	endbr64
   286f5:	e9 8e a7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   286fa:	f3 0f 1e fa          	endbr64
   286fe:	e9 85 a7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   28703:	f3 0f 1e fa          	endbr64
   28707:	e9 7c a7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   2870c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17918 (discriminator 1)
   28710:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   28717:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2871b:	48 c1 e0 04          	shl    rax,0x4
   2871f:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   28723:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   28727:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   2872a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2872e:	83 f8 f6             	cmp    eax,0xfffffff6
   28731:	76 04                	jbe    28737 <JS_CallInternal+0x5b97>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28733:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17918 (discriminator 1)
   28737:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17920
   2873a:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17918 (discriminator 1)
   2873e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17920
   28742:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17918 (discriminator 1)
   28748:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17920
   2874b:	49 89 c5             	mov    r13,rax
   2874e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28752:	ff e0                	jmp    rax
   28754:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17914 (discriminator 1)
   28758:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
   2875c:	48 c7 43 08 07 00 00 	mov    QWORD PTR [rbx+0x8],0x7
   28763:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17916
   28764:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17914 (discriminator 1)
   28768:	48 83 c3 10          	add    rbx,0x10
   2876c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17916
   28770:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28776:	49 89 c5             	mov    r13,rax
   28779:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2877d:	ff e0                	jmp    rax
   2877f:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   28783:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17910 (discriminator 1)
   28787:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   2878e:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17912
   2878f:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17910 (discriminator 1)
   28793:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   28797:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17912
   2879b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   287a1:	49 89 c5             	mov    r13,rax
   287a4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   287a8:	ff e0                	jmp    rax
   287aa:	f3 0f 1e fa          	endbr64
   287ae:	e9 d5 a6 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   287b3:	f3 0f 1e fa          	endbr64
   287b7:	e9 cc a6 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   287bc:	f3 0f 1e fa          	endbr64
   287c0:	e9 c3 a6 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   287c5:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   287c9:	41 0f bf 04 24       	movsx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17938 (discriminator 1)
   287ce:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17940
   287d2:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17938 (discriminator 1)
   287d6:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   287dd:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   287de:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17940
   287e2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   287e8:	49 89 c5             	mov    r13,rax
   287eb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   287ef:	ff e0                	jmp    rax
   287f1:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   287f5:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17934 (discriminator 1)
   287fa:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17936
   287fe:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17934 (discriminator 1)
   28802:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   28809:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   2880a:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17936
   2880e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28814:	49 89 c5             	mov    r13,rax
   28817:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2881b:	ff e0                	jmp    rax
   2881d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17942
   28821:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   28828:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2882d:	48 c1 e0 04          	shl    rax,0x4
   28831:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   28835:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   28839:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   2883c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28840:	83 f8 f6             	cmp    eax,0xfffffff6
   28843:	76 04                	jbe    28849 <JS_CallInternal+0x5ca9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28845:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17942
   28849:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17943
   2884c:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17942
   28850:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17943
   28854:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17942
   2885a:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17943
   2885d:	49 89 c5             	mov    r13,rax
   28860:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28864:	ff e0                	jmp    rax
   28866:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18058
   2886a:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2886e:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   28872:	83 fa f6             	cmp    edx,0xfffffff6
   28875:	76 11                	jbe    28888 <JS_CallInternal+0x5ce8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28877:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2887a:	83 e8 01             	sub    eax,0x1
   2887d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28880:	85 c0                	test   eax,eax
   28882:	0f 8e 03 1e 00 00    	jle    2a68b <JS_CallInternal+0x7aeb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18059
   28888:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18061
   2888d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18060
   28891:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18059
   28895:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18061
   28899:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2889f:	49 89 c5             	mov    r13,rax
   288a2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   288a6:	ff e0                	jmp    rax
   288a8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   288ac:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   288b0:	48 83 eb 10          	sub    rbx,0x10
   288b4:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   288b7:	83 fa f6             	cmp    edx,0xfffffff6
   288ba:	76 11                	jbe    288cd <JS_CallInternal+0x5d2d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   288bc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   288bf:	83 e8 01             	sub    eax,0x1
   288c2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   288c5:	85 c0                	test   eax,eax
   288c7:	0f 8e d3 1d 00 00    	jle    2a6a0 <JS_CallInternal+0x7b00>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18056
   288cd:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   288d2:	49 83 c4 01          	add    r12,0x1
   288d6:	49 89 c5             	mov    r13,rax
   288d9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   288dd:	ff e0                	jmp    rax
   288df:	f3 0f 1e fa          	endbr64
min_int():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:90
   288e3:	8b 8d bc fe ff ff    	mov    ecx,DWORD PTR [rbp-0x144]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18044 (discriminator 1)
   288e9:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18045
   288ee:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18047
   288f3:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   288f7:	48 8b bd a8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x158]
min_int():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:90
   288fe:	39 c8                	cmp    eax,ecx
   28900:	0f 4f c1             	cmovg  eax,ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18047
   28903:	48 63 d0             	movsxd rdx,eax
   28906:	29 c1                	sub    ecx,eax
   28908:	48 c1 e2 04          	shl    rdx,0x4
   2890c:	89 ce                	mov    esi,ecx
   2890e:	48 01 fa             	add    rdx,rdi
   28911:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28918:	e8 03 15 02 00       	call   49e20 <js_create_array>
   2891d:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18048 (discriminator 2)
   28921:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18047
   28925:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18048 (discriminator 2)
   28928:	0f 84 a2 30 00 00    	je     2b9d0 <JS_CallInternal+0x8e30>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18051
   2892e:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18047
   28934:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18051
   28937:	49 83 c4 03          	add    r12,0x3
   2893b:	49 89 c5             	mov    r13,rax
   2893e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28942:	ff e0                	jmp    rax
   28944:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17999
   28948:	41 80 3c 24 06       	cmp    BYTE PTR [r12],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17998
   2894d:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17999
   28952:	0f 87 8c 96 fe ff    	ja     11fe4 <JS_CallInternal.cold>
   28958:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2895d:	48 8d 15 d4 e7 0a 00 	lea    rdx,[rip+0xae7d4]        # d7138 <qjsc_repl_size+0x46c>
   28964:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   28968:	48 01 d0             	add    rax,rdx
   2896b:	3e ff e0             	notrack jmp rax
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5856
   2896e:	31 f6                	xor    esi,esi
   28970:	b9 01 00 00 00       	mov    ecx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18028
   28975:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5856
   28979:	ba 02 00 00 00       	mov    edx,0x2
   2897e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28985:	e8 36 e1 01 00       	call   46ac0 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18028
   2898a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18029 (discriminator 2)
   2898e:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18028
   28992:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18029 (discriminator 2)
   28995:	0f 84 be 00 00 00    	je     28a59 <JS_CallInternal+0x5eb9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18033
   2899b:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18041
   2899e:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   289a4:	49 83 c4 02          	add    r12,0x2
   289a8:	49 89 c5             	mov    r13,rax
   289ab:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   289af:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18020
   289b1:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17910 (discriminator 1)
   289b8:	48 8d 53 10          	lea    rdx,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18020
   289bc:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18021 (discriminator 1)
   289c0:	48 85 c0             	test   rax,rax
   289c3:	0f 84 7e 3f 00 00    	je     2c947 <JS_CallInternal+0x9da7>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   289c9:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18024
   289cd:	48 89 03             	mov    QWORD PTR [rbx],rax
   289d0:	48 c7 43 08 ff ff ff 	mov    QWORD PTR [rbx+0x8],0xffffffffffffffff
   289d7:	ff 
   289d8:	48 89 d3             	mov    rbx,rdx
   289db:	eb c1                	jmp    2899e <JS_CallInternal+0x5dfe>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   289dd:	83 bd 80 fe ff ff f6 	cmp    DWORD PTR [rbp-0x180],0xfffffff6
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18015
   289e4:	48 8d 43 10          	lea    rax,[rbx+0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   289e8:	76 0b                	jbe    289f5 <JS_CallInternal+0x5e55>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   289ea:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   289f1:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18015
   289f5:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   289fc:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   289ff:	48 8b 8d 80 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x180]
   28a06:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   28a0a:	48 89 c3             	mov    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18016
   28a0d:	eb 8f                	jmp    2899e <JS_CallInternal+0x5dfe>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18006
   28a0f:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18006 (discriminator 1)
   28a16:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   28a1d:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
   28a21:	48 8b 95 a8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x158]
   28a28:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18006
   28a2f:	44 0f b7 40 38       	movzx  r8d,WORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18006 (discriminator 1)
   28a34:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   28a3a:	41 39 c0             	cmp    r8d,eax
   28a3d:	89 c6                	mov    esi,eax
   28a3f:	44 0f 4f c0          	cmovg  r8d,eax
   28a43:	e8 a8 32 02 00       	call   4bcf0 <js_build_mapped_arguments>
   28a48:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18008 (discriminator 2)
   28a4c:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18006 (discriminator 1)
   28a50:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18008 (discriminator 2)
   28a53:	0f 85 42 ff ff ff    	jne    2899b <JS_CallInternal+0x5dfb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18045
   28a59:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17998
   28a5c:	4d 89 f4             	mov    r12,r14
   28a5f:	e9 dc a8 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18001
   28a64:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   28a6b:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18001
   28a71:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16191
   28a75:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   28a7c:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16192
   28a80:	48 8b 91 58 01 00 00 	mov    rdx,QWORD PTR [rcx+0x158]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   28a87:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   28a8e:	48 8b 81 50 01 00 00 	mov    rax,QWORD PTR [rcx+0x150]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28a95:	83 fa f6             	cmp    edx,0xfffffff6
   28a98:	76 04                	jbe    28a9e <JS_CallInternal+0x5efe>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28a9a:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:713
   28a9e:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16192
   28aa5:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
   28aac:	48 89 95 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16193
   28ab3:	48 8b 81 60 01 00 00 	mov    rax,QWORD PTR [rcx+0x160]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28aba:	83 b9 68 01 00 00 f6 	cmp    DWORD PTR [rcx+0x168],0xfffffff6
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16193 (discriminator 1)
   28ac1:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28ac8:	76 04                	jbe    28ace <JS_CallInternal+0x5f2e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28aca:	83 40 fc 02          	add    DWORD PTR [rax-0x4],0x2
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16196
   28ace:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16196 (discriminator 1)
   28ad5:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
   28adc:	ba 08 00 00 00       	mov    edx,0x8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16194 (discriminator 1)
   28ae1:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16196
   28ae8:	48 8b 77 38          	mov    rsi,QWORD PTR [rdi+0x38]
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5314 (discriminator 1)
   28aec:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16196 (discriminator 1)
   28af0:	e8 4b da 01 00       	call   46540 <JS_NewObjectFromShape>
   28af5:	49 89 c1             	mov    r9,rax
   28af8:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16198 (discriminator 1)
   28afb:	83 fa 06             	cmp    edx,0x6
   28afe:	0f 84 08 37 00 00    	je     2c20c <JS_CallInternal+0x966c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16204
   28b04:	8b bd bc fe ff ff    	mov    edi,DWORD PTR [rbp-0x144]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16203
   28b0a:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16204
   28b0c:	85 ff                	test   edi,edi
   28b0e:	0f 8f 8b 35 00 00    	jg     2c09f <JS_CallInternal+0x94ff>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16212
   28b14:	49 89 41 30          	mov    QWORD PTR [r9+0x30],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16213
   28b18:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   28b1e:	41 89 41 38          	mov    DWORD PTR [r9+0x38],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18001
   28b22:	4c 89 0b             	mov    QWORD PTR [rbx],r9
   28b25:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   28b29:	4c 89 eb             	mov    rbx,r13
   28b2c:	e9 6d fe ff ff       	jmp    2899e <JS_CallInternal+0x5dfe>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18012
   28b31:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   28b38:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   28b3c:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
   28b40:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28b44:	83 fa f6             	cmp    edx,0xfffffff6
   28b47:	76 04                	jbe    28b4d <JS_CallInternal+0x5fad>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28b49:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18012
   28b4d:	48 89 03             	mov    QWORD PTR [rbx],rax
   28b50:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   28b54:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18013
   28b57:	e9 42 fe ff ff       	jmp    2899e <JS_CallInternal+0x5dfe>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30945
   28b5c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28b63:	31 f6                	xor    esi,esi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18033
   28b65:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30945
   28b69:	e8 e2 9e ff ff       	call   22a50 <JS_GetScriptOrModuleName>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30946
   28b6e:	85 c0                	test   eax,eax
   28b70:	0f 84 7c 31 00 00    	je     2bcf2 <JS_CallInternal+0x9152>
js_find_loaded_module():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30035
   28b76:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28b7d:	48 8b 91 b8 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1b8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30035 (discriminator 1)
   28b84:	48 81 c1 b0 01 00 00 	add    rcx,0x1b0
   28b8b:	48 39 ca             	cmp    rdx,rcx
   28b8e:	75 15                	jne    28ba5 <JS_CallInternal+0x6005>
   28b90:	e9 ba 41 00 00       	jmp    2cd4f <JS_CallInternal+0xa1af>
   28b95:	0f 1f 00             	nop    DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30035 (discriminator 2)
   28b98:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30035 (discriminator 1)
   28b9c:	48 39 ca             	cmp    rdx,rcx
   28b9f:	0f 84 03 31 00 00    	je     2bca8 <JS_CallInternal+0x9108>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30037
   28ba5:	3b 42 f8             	cmp    eax,DWORD PTR [rdx-0x8]
   28ba8:	75 ee                	jne    28b98 <JS_CallInternal+0x5ff8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30036
   28baa:	48 83 ea 18          	sub    rdx,0x18
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   28bae:	3d f2 00 00 00       	cmp    eax,0xf2
   28bb3:	0f 8f f8 30 00 00    	jg     2bcb1 <JS_CallInternal+0x9111>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30958
   28bb9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28bc0:	48 89 d6             	mov    rsi,rdx
   28bc3:	e8 58 9f ff ff       	call   22b20 <JS_GetImportMeta>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18033
   28bc8:	48 89 03             	mov    QWORD PTR [rbx],rax
   28bcb:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18034 (discriminator 2)
   28bcf:	83 fa 06             	cmp    edx,0x6
   28bd2:	0f 85 c3 fd ff ff    	jne    2899b <JS_CallInternal+0x5dfb>
   28bd8:	e9 7c fe ff ff       	jmp    28a59 <JS_CallInternal+0x5eb9>
   28bdd:	0f 1f 00             	nop    DWORD PTR [rax]
   28be0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17961
   28be4:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17962
   28beb:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17961
   28bef:	48 83 c3 10          	add    rbx,0x10
   28bf3:	48 c7 43 f8 02 00 00 	mov    QWORD PTR [rbx-0x8],0x2
   28bfa:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17962
   28bfb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28c01:	49 89 c5             	mov    r13,rax
   28c04:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28c08:	ff e0                	jmp    rax
   28c0a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17958
   28c0e:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17959
   28c15:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17958
   28c19:	48 83 c3 10          	add    rbx,0x10
   28c1d:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   28c24:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17959
   28c25:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28c2b:	49 89 c5             	mov    r13,rax
   28c2e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28c32:	ff e0                	jmp    rax
   28c34:	f3 0f 1e fa          	endbr64
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3642
   28c38:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   28c3c:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17954 (discriminator 1)
   28c3e:	4c 8d 73 10          	lea    r14,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17956
   28c42:	49 83 c4 05          	add    r12,0x5
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3642
   28c46:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28c4d:	e8 ee b4 00 00       	call   34140 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17954 (discriminator 1)
   28c52:	48 89 03             	mov    QWORD PTR [rbx],rax
   28c55:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17956
   28c59:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17954 (discriminator 1)
   28c5f:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17956
   28c62:	49 89 c5             	mov    r13,rax
   28c65:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28c69:	ff e0                	jmp    rax
   28c6b:	f3 0f 1e fa          	endbr64
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3647
   28c6f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28c76:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17950
   28c7b:	4c 8d 73 10          	lea    r14,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17951
   28c7f:	49 83 c4 01          	add    r12,0x1
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3647
   28c83:	be 2f 00 00 00       	mov    esi,0x2f
   28c88:	e8 b3 b4 00 00       	call   34140 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17950
   28c8d:	48 89 03             	mov    QWORD PTR [rbx],rax
   28c90:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17951
   28c94:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17950
   28c9a:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17951
   28c9d:	49 89 c5             	mov    r13,rax
   28ca0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28ca4:	ff e0                	jmp    rax
   28ca6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18069
   28caa:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   28cae:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28cb2:	83 f8 f6             	cmp    eax,0xfffffff6
   28cb5:	76 04                	jbe    28cbb <JS_CallInternal+0x611b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28cb7:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18069
   28cbb:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18071
   28cbe:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18070
   28cc2:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18069
   28cc6:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18071
   28cca:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28cd0:	49 89 c5             	mov    r13,rax
   28cd3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28cd7:	ff e0                	jmp    rax
   28cd9:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18063
   28cdd:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   28ce1:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   28ce5:	83 fa f6             	cmp    edx,0xfffffff6
   28ce8:	76 11                	jbe    28cfb <JS_CallInternal+0x615b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28cea:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28ced:	83 e8 01             	sub    eax,0x1
   28cf0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28cf3:	85 c0                	test   eax,eax
   28cf5:	0f 8e ba 19 00 00    	jle    2a6b5 <JS_CallInternal+0x7b15>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18064
   28cfb:	f3 0f 6f 73 e0       	movdqu xmm6,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18065
   28d00:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18067
   28d05:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18066
   28d09:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18064
   28d0d:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18065
   28d11:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18067
   28d15:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28d1b:	49 89 c5             	mov    r13,rax
   28d1e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d22:	ff e0                	jmp    rax
   28d24:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18073
   28d28:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   28d2c:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28d30:	83 f8 f6             	cmp    eax,0xfffffff6
   28d33:	76 04                	jbe    28d39 <JS_CallInternal+0x6199>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28d35:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18073
   28d39:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18074
   28d3d:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18073
   28d41:	48 89 13             	mov    QWORD PTR [rbx],rdx
   28d44:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28d48:	83 f8 f6             	cmp    eax,0xfffffff6
   28d4b:	76 04                	jbe    28d51 <JS_CallInternal+0x61b1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28d4d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18074
   28d51:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18076
   28d55:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18075
   28d59:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18074
   28d5d:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18076
   28d61:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28d67:	49 89 c5             	mov    r13,rax
   28d6a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d6e:	ff e0                	jmp    rax
   28d70:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17986
   28d74:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17987
   28d7b:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17986
   28d7f:	48 83 c3 10          	add    rbx,0x10
   28d83:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   28d8a:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17987
   28d8b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28d91:	49 89 c5             	mov    r13,rax
   28d94:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d98:	ff e0                	jmp    rax
   28d9a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17967
   28d9e:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   28da5:	f6 40 10 01          	test   BYTE PTR [rax+0x10],0x1
   28da9:	0f 85 97 08 00 00    	jne    29646 <JS_CallInternal+0x6aa6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17969 (discriminator 1)
   28daf:	83 bd 88 fe ff ff ff 	cmp    DWORD PTR [rbp-0x178],0xffffffff
   28db6:	0f 85 27 32 00 00    	jne    2bfe3 <JS_CallInternal+0x9443>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28dbc:	48 8b 85 78 fe ff ff 	mov    rax,QWORD PTR [rbp-0x188]
   28dc3:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17920
   28dc7:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   28dce:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17982
   28dd5:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17984
   28dd8:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17982
   28ddc:	48 83 c3 10          	add    rbx,0x10
   28de0:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17984
   28de4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28dea:	49 89 c5             	mov    r13,rax
   28ded:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28df1:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   28df3:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   28df6:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28dfd:	0f 85 30 d6 ff ff    	jne    26433 <JS_CallInternal+0x3893>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 1)
   28e03:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28e07:	0f 85 43 05 00 00    	jne    29350 <JS_CallInternal+0x67b0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 14)
   28e0d:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28e11:	48 85 c9             	test   rcx,rcx
   28e14:	0f 85 f6 d5 ff ff    	jne    26410 <JS_CallInternal+0x3870>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 15)
   28e1a:	ba 03 00 00 00       	mov    edx,0x3
   28e1f:	31 c0                	xor    eax,eax
   28e21:	e9 44 d6 ff ff       	jmp    2646a <JS_CallInternal+0x38ca>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   28e26:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   28e29:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28e30:	0f 85 6d d8 ff ff    	jne    266a3 <JS_CallInternal+0x3b03>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 1)
   28e36:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28e3a:	0f 85 21 06 00 00    	jne    29461 <JS_CallInternal+0x68c1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 14)
   28e40:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28e44:	48 85 c9             	test   rcx,rcx
   28e47:	0f 85 33 d8 ff ff    	jne    26680 <JS_CallInternal+0x3ae0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   28e4d:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 15)
   28e51:	41 b8 03 00 00 00    	mov    r8d,0x3
   28e57:	31 c0                	xor    eax,eax
   28e59:	e9 81 d8 ff ff       	jmp    266df <JS_CallInternal+0x3b3f>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   28e5e:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   28e61:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28e68:	0f 85 76 d7 ff ff    	jne    265e4 <JS_CallInternal+0x3a44>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 1)
   28e6e:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28e72:	0f 85 3c 06 00 00    	jne    294b4 <JS_CallInternal+0x6914>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 14)
   28e78:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28e7c:	48 85 c9             	test   rcx,rcx
   28e7f:	0f 85 3b d7 ff ff    	jne    265c0 <JS_CallInternal+0x3a20>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   28e85:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 15)
   28e89:	b9 03 00 00 00       	mov    ecx,0x3
   28e8e:	45 31 f6             	xor    r14d,r14d
   28e91:	e9 8b d7 ff ff       	jmp    26621 <JS_CallInternal+0x3a81>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   28e96:	8b 38                	mov    edi,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   28e98:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28e9e:	0f 85 da b1 ff ff    	jne    2407e <JS_CallInternal+0x14de>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   28ea4:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28ea8:	0f 85 ee 04 00 00    	jne    2939c <JS_CallInternal+0x67fc>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 30)
   28eae:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28eb2:	48 85 d2             	test   rdx,rdx
   28eb5:	0f 84 e4 15 00 00    	je     2a49f <JS_CallInternal+0x78ff>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   28ebb:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28ebf:	e9 9c b1 ff ff       	jmp    24060 <JS_CallInternal+0x14c0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   28ec4:	8b 38                	mov    edi,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   28ec6:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28ecc:	0f 85 8c b2 ff ff    	jne    2415e <JS_CallInternal+0x15be>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   28ed2:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28ed6:	0f 85 0a 04 00 00    	jne    292e6 <JS_CallInternal+0x6746>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 30)
   28edc:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28ee0:	48 85 d2             	test   rdx,rdx
   28ee3:	0f 84 c2 15 00 00    	je     2a4ab <JS_CallInternal+0x790b>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6160
   28ee9:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28eed:	e9 4e b2 ff ff       	jmp    24140 <JS_CallInternal+0x15a0>
min_int():
/home/mzyx/read_ic_dequickening_attempt01/SW/cutils.h:90
   28ef2:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28ef8:	39 f7                	cmp    edi,esi
   28efa:	41 89 f5             	mov    r13d,esi
   28efd:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17880 (discriminator 1)
   28f01:	45 85 ed             	test   r13d,r13d
   28f04:	0f 8e c9 13 00 00    	jle    2a2d3 <JS_CallInternal+0x7733>
   28f0a:	4c 8b bd a8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x158]
   28f11:	4d 63 f5             	movsxd r14,r13d
   28f14:	4d 8d 43 08          	lea    r8,[r11+0x8]
   28f18:	49 c1 e6 04          	shl    r14,0x4
   28f1c:	4c 89 fe             	mov    rsi,r15
   28f1f:	4d 01 fe             	add    r14,r15
   28f22:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17881
   28f28:	4c 8b 66 08          	mov    r12,QWORD PTR [rsi+0x8]
   28f2c:	4c 8b 3e             	mov    r15,QWORD PTR [rsi]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   28f2f:	41 83 fc f6          	cmp    r12d,0xfffffff6
   28f33:	76 05                	jbe    28f3a <JS_CallInternal+0x639a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   28f35:	41 83 47 fc 01       	add    DWORD PTR [r15-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17880 (discriminator 1)
   28f3a:	48 83 c6 10          	add    rsi,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17881
   28f3e:	4d 89 78 f8          	mov    QWORD PTR [r8-0x8],r15
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17880 (discriminator 1)
   28f42:	49 83 c0 10          	add    r8,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17881
   28f46:	4d 89 60 f0          	mov    QWORD PTR [r8-0x10],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17880 (discriminator 1)
   28f4a:	4c 39 f6             	cmp    rsi,r14
   28f4d:	75 d9                	jne    28f28 <JS_CallInternal+0x6388>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17882 (discriminator 1)
   28f4f:	44 39 ef             	cmp    edi,r13d
   28f52:	7e 3c                	jle    28f90 <JS_CallInternal+0x63f0>
   28f54:	44 8d 47 ff          	lea    r8d,[rdi-0x1]
   28f58:	4d 63 e5             	movsxd r12,r13d
   28f5b:	45 29 e8             	sub    r8d,r13d
   28f5e:	4c 89 e6             	mov    rsi,r12
   28f61:	4d 01 e0             	add    r8,r12
   28f64:	48 c1 e6 04          	shl    rsi,0x4
   28f68:	49 c1 e0 04          	shl    r8,0x4
   28f6c:	4c 01 de             	add    rsi,r11
   28f6f:	4f 8d 44 03 10       	lea    r8,[r11+r8*1+0x10]
   28f74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17883
   28f78:	48 c7 06 00 00 00 00 	mov    QWORD PTR [rsi],0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17882 (discriminator 1)
   28f7f:	48 83 c6 10          	add    rsi,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17883
   28f83:	48 c7 46 f8 03 00 00 	mov    QWORD PTR [rsi-0x8],0x3
   28f8a:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17882 (discriminator 1)
   28f8b:	4c 39 c6             	cmp    rsi,r8
   28f8e:	75 e8                	jne    28f78 <JS_CallInternal+0x63d8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17884
   28f90:	89 bd 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17879
   28f96:	4c 89 9d 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],r11
   28f9d:	e9 dc 9d ff ff       	jmp    22d7e <JS_CallInternal+0x1de>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   28fa2:	48 83 ec 08          	sub    rsp,0x8
   28fa6:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   28fac:	49 89 d1             	mov    r9,rdx
   28faf:	48 89 c6             	mov    rsi,rax
   28fb2:	6a 00                	push   0x0
   28fb4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28fbb:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   28fc2:	e8 39 3f 00 00       	call   2cf00 <JS_GetPropertyInternal>
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16029
   28fc7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28fce:	48 89 c6             	mov    rsi,rax
   28fd1:	e8 7a 5b ff ff       	call   1eb50 <JS_ToBoolFree>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28fd6:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16029
   28fdd:	89 c1                	mov    ecx,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   28fdf:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   28fe3:	83 e8 01             	sub    eax,0x1
   28fe6:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   28fea:	41 5b                	pop    r11
   28fec:	5a                   	pop    rdx
   28fed:	85 c0                	test   eax,eax
   28fef:	0f 8e 51 36 00 00    	jle    2c646 <JS_CallInternal+0x9aa6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20545 (discriminator 1)
   28ff5:	85 c9                	test   ecx,ecx
   28ff7:	0f 88 a9 a6 ff ff    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20547
   28ffd:	0f 84 40 9f ff ff    	je     22f43 <JS_CallInternal+0x3a3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20618
   29003:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29007:	48 83 eb 10          	sub    rbx,0x10
   2900b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2900e:	83 fa f6             	cmp    edx,0xfffffff6
   29011:	0f 86 68 a4 ff ff    	jbe    2347f <JS_CallInternal+0x8df>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29017:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2901a:	83 e8 01             	sub    eax,0x1
   2901d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29020:	85 c0                	test   eax,eax
   29022:	0f 8f 57 a4 ff ff    	jg     2347f <JS_CallInternal+0x8df>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   29028:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2902f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29033:	e8 e8 38 ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20619
   29038:	e9 42 a4 ff ff       	jmp    2347f <JS_CallInternal+0x8df>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18265
   2903d:	8b 85 38 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c8]
   29043:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2904a:	4c 8b a5 40 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c0]
   29051:	83 c0 02             	add    eax,0x2
   29054:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18268
   29056:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18265
   2905a:	48 c1 e0 04          	shl    rax,0x4
   2905e:	48 29 c3             	sub    rbx,rax
   29061:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18266
   29064:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   29068:	4c 89 2a             	mov    QWORD PTR [rdx],r13
   2906b:	4c 89 72 08          	mov    QWORD PTR [rdx+0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18268
   2906f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   29075:	49 89 c5             	mov    r13,rax
   29078:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2907c:	ff e0                	jmp    rax
   2907e:	4c 89 f3             	mov    rbx,r14
   29081:	4d 89 e6             	mov    r14,r12
   29084:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19065 (discriminator 1)
   2908b:	48 8b 85 68 fe ff ff 	mov    rax,QWORD PTR [rbp-0x198]
   29092:	49 39 c6             	cmp    r14,rax
   29095:	0f 84 af 22 00 00    	je     2b34a <JS_CallInternal+0x87aa>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19070
   2909b:	4d 89 6e f0          	mov    QWORD PTR [r14-0x10],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19072
   2909f:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19070
   290a3:	49 89 5e f8          	mov    QWORD PTR [r14-0x8],rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19072
   290a7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   290ad:	4c 89 f3             	mov    rbx,r14
   290b0:	49 89 c5             	mov    r13,rax
   290b3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   290b7:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19389
   290b9:	80 fa 01             	cmp    dl,0x1
   290bc:	0f 84 36 03 00 00    	je     293f8 <JS_CallInternal+0x6858>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19394
   290c2:	80 cc 10             	or     ah,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19393
   290c5:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   290ca:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19394
   290d0:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   290d6:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   290da:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19393
   290e1:	0f 29 95 e0 fd ff ff 	movaps XMMWORD PTR [rbp-0x220],xmm2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19396
   290e8:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   290ef:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   290f4:	48 89 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   290fb:	e8 40 77 01 00       	call   40840 <js_get_function_name>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5950
   29100:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29107:	4c 8d 05 36 40 0a 00 	lea    r8,[rip+0xa4036]        # cd144 <_IO_stdin_used+0x144>
   2910e:	48 8d 35 6e 44 0a 00 	lea    rsi,[rip+0xa446e]        # cd583 <_IO_stdin_used+0x583>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   29115:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5950
   29118:	48 89 c2             	mov    rdx,rax
   2911b:	4c 89 c9             	mov    rcx,r9
   2911e:	e8 ad 75 01 00       	call   406d0 <JS_ConcatString3>
   29123:	49 89 d1             	mov    r9,rdx
   29126:	e9 71 a8 ff ff       	jmp    2399c <JS_CallInternal+0xdfc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18246
   2912b:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18249
   29131:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18246
   29135:	83 c0 02             	add    eax,0x2
   29138:	48 98                	cdqe
   2913a:	48 c1 e0 04          	shl    rax,0x4
   2913e:	48 29 c3             	sub    rbx,rax
   29141:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18247
   29144:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   29148:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   2914b:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18249
   2914f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   29155:	49 89 c5             	mov    r13,rax
   29158:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2915c:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18417
   2915e:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18420
   29164:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18417
   29168:	83 c0 01             	add    eax,0x1
   2916b:	48 98                	cdqe
   2916d:	48 c1 e0 04          	shl    rax,0x4
   29171:	48 29 c3             	sub    rbx,rax
   29174:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18418
   29177:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   2917b:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   2917e:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18420
   29182:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   29188:	49 89 c5             	mov    r13,rax
   2918b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2918f:	ff e0                	jmp    rax
free_arg_list():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18420
   29191:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
   29198:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
js_free_rt():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:1817
   2919f:	4c 89 f6             	mov    rsi,r14
   291a2:	e8 19 b9 fe ff       	call   14ac0 <__js_free>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18447 (discriminator 2)
   291a7:	41 83 fd 06          	cmp    r13d,0x6
   291ab:	0f 84 3c 15 00 00    	je     2a6ed <JS_CallInternal+0x7b4d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18449
   291b1:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   291b5:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   291b9:	83 fa f6             	cmp    edx,0xfffffff6
   291bc:	76 11                	jbe    291cf <JS_CallInternal+0x662f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   291be:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   291c1:	83 e8 01             	sub    eax,0x1
   291c4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   291c7:	85 c0                	test   eax,eax
   291c9:	0f 8e ca 13 00 00    	jle    2a599 <JS_CallInternal+0x79f9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18450
   291cf:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   291d6:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   291da:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   291dd:	83 fa f6             	cmp    edx,0xfffffff6
   291e0:	76 11                	jbe    291f3 <JS_CallInternal+0x6653>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   291e2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   291e5:	83 e8 01             	sub    eax,0x1
   291e8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   291eb:	85 c0                	test   eax,eax
   291ed:	0f 8e a2 15 00 00    	jle    2a795 <JS_CallInternal+0x7bf5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18452
   291f3:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   291fa:	4c 89 6b e8          	mov    QWORD PTR [rbx-0x18],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18454
   291fe:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18452
   29202:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18454
   29206:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18452
   2920c:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18454
   29213:	49 89 c5             	mov    r13,rax
   29216:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2921a:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   2921c:	8b 10                	mov    edx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   2921e:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   29224:	0f 85 db c7 ff ff    	jne    25a05 <JS_CallInternal+0x2e65>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8429
   2922a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29231:	89 f2                	mov    edx,esi
   29233:	b9 07 00 00 00       	mov    ecx,0x7
   29238:	4c 89 c6             	mov    rsi,r8
   2923b:	e8 30 d0 01 00       	call   46270 <add_property>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8430 (discriminator 1)
   29240:	48 85 c0             	test   rax,rax
   29243:	0f 84 e8 c7 ff ff    	je     25a31 <JS_CallInternal+0x2e91>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8435
   29249:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   29250:	4c 89 28             	mov    QWORD PTR [rax],r13
   29253:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19294
   29257:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   2925b:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2925e:	83 fa f6             	cmp    edx,0xfffffff6
   29261:	76 11                	jbe    29274 <JS_CallInternal+0x66d4>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29263:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29266:	83 e8 01             	sub    eax,0x1
   29269:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2926c:	85 c0                	test   eax,eax
   2926e:	0f 8e 62 1e 00 00    	jle    2b0d6 <JS_CallInternal+0x8536>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19299
   29274:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19295
   29279:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19299
   2927c:	49 83 c4 01          	add    r12,0x1
   29280:	49 89 c5             	mov    r13,rax
   29283:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   29287:	ff e0                	jmp    rax
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19299
   29289:	ba 08 00 00 00       	mov    edx,0x8
   2928e:	e9 ef dc ff ff       	jmp    26f82 <JS_CallInternal+0x43e2>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   29293:	81 bd 50 fe ff ff f2 	cmp    DWORD PTR [rbp-0x1b0],0xf2
   2929a:	00 00 00 
   2929d:	0f 8f 38 10 00 00    	jg     2a2db <JS_CallInternal+0x773b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19404
   292a3:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   292a7:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   292ab:	83 fa f6             	cmp    edx,0xfffffff6
   292ae:	0f 86 ee a7 ff ff    	jbe    23aa2 <JS_CallInternal+0xf02>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   292b4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   292b7:	83 e8 01             	sub    eax,0x1
   292ba:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   292bd:	85 c0                	test   eax,eax
   292bf:	0f 8f dd a7 ff ff    	jg     23aa2 <JS_CallInternal+0xf02>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   292c5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   292cc:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   292d2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   292d6:	e8 45 36 ff ff       	call   1c920 <__JS_FreeValueRT>
   292db:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   292e1:	e9 bc a7 ff ff       	jmp    23aa2 <JS_CallInternal+0xf02>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 31)
   292e6:	48 89 d6             	mov    rsi,rdx
   292e9:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 35)
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
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 3)
   2932a:	41 58                	pop    r8
   2932c:	4c 8b 9d 40 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c0]
   29333:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 35)
   29336:	49 89 c5             	mov    r13,rax
   29339:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 3)
   2933c:	41 59                	pop    r9
   2933e:	0f 85 68 ae ff ff    	jne    241ac <JS_CallInternal+0x160c>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   29344:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2934b:	e9 f0 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 13)
   29350:	49 89 ca             	mov    r10,rcx
   29353:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 12)
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
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 3)
   29387:	41 59                	pop    r9
   29389:	41 5a                	pop    r10
   2938b:	83 fa 06             	cmp    edx,0x6
   2938e:	0f 85 d6 d0 ff ff    	jne    2646a <JS_CallInternal+0x38ca>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19200 (discriminator 1)
   29394:	4d 89 ec             	mov    r12,r13
   29397:	e9 a4 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 31)
   2939c:	48 89 d6             	mov    rsi,rdx
   2939f:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 35)
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
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 3)
   293d5:	5e                   	pop    rsi
   293d6:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   293dd:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 35)
   293e0:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 3)
   293e3:	5f                   	pop    rdi
   293e4:	0f 85 df ac ff ff    	jne    240c9 <JS_CallInternal+0x1529>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   293ea:	4d 89 dc             	mov    r12,r11
   293ed:	e9 4e 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   293f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19391
   293f8:	80 cc 08             	or     ah,0x8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19390
   293fb:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   29400:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19391
   29406:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   2940c:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   29410:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19390
   29417:	0f 29 bd 10 fe ff ff 	movaps XMMWORD PTR [rbp-0x1f0],xmm7
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19396
   2941e:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   29425:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   2942a:	48 89 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   29431:	e8 0a 74 01 00       	call   40840 <js_get_function_name>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5948
   29436:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2943d:	4c 8d 05 00 3d 0a 00 	lea    r8,[rip+0xa3d00]        # cd144 <_IO_stdin_used+0x144>
   29444:	48 8d 35 33 41 0a 00 	lea    rsi,[rip+0xa4133]        # cd57e <_IO_stdin_used+0x57e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5946
   2944b:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5948
   2944e:	48 89 c2             	mov    rdx,rax
   29451:	4c 89 c9             	mov    rcx,r9
   29454:	e8 77 72 01 00       	call   406d0 <JS_ConcatString3>
   29459:	49 89 d1             	mov    r9,rdx
   2945c:	e9 3b a5 ff ff       	jmp    2399c <JS_CallInternal+0xdfc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 13)
   29461:	49 89 ca             	mov    r10,rcx
   29464:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 12)
   2946b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29472:	48 83 ec 08          	sub    rsp,0x8
   29476:	48 89 fa             	mov    rdx,rdi
   29479:	89 f1                	mov    ecx,esi
   2947b:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2947f:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29483:	4c 89 d6             	mov    rsi,r10
   29486:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   2948a:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   2948e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29495:	6a 00                	push   0x0
   29497:	e8 64 3a 00 00       	call   2cf00 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 3)
   2949c:	41 5b                	pop    r11
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 12)
   2949e:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 3)
   294a1:	5a                   	pop    rdx
   294a2:	41 83 f8 06          	cmp    r8d,0x6
   294a6:	0f 85 33 d2 ff ff    	jne    266df <JS_CallInternal+0x3b3f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19196 (discriminator 1)
   294ac:	4d 89 f4             	mov    r12,r14
   294af:	e9 8c 9e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 13)
   294b4:	48 89 ce             	mov    rsi,rcx
   294b7:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 12)
   294be:	48 83 ec 08          	sub    rsp,0x8
   294c2:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   294c6:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   294ca:	48 89 fa             	mov    rdx,rdi
   294cd:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   294d4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   294db:	b9 32 00 00 00       	mov    ecx,0x32
   294e0:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   294e4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   294e8:	6a 00                	push   0x0
   294ea:	e8 11 3a 00 00       	call   2cf00 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 3)
   294ef:	5f                   	pop    rdi
   294f0:	41 58                	pop    r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 12)
   294f2:	49 89 c6             	mov    r14,rax
   294f5:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19205 (discriminator 3)
   294f8:	83 fa 06             	cmp    edx,0x6
   294fb:	0f 85 20 d1 ff ff    	jne    26621 <JS_CallInternal+0x3a81>
   29501:	e9 3a 9e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18224 (discriminator 1)
   29506:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2950d:	e9 2e 9e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20095
   29512:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   29519:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2951d:	83 fa f6             	cmp    edx,0xfffffff6
   29520:	76 04                	jbe    29526 <JS_CallInternal+0x6986>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   29522:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20099
   29526:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20098
   2952d:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20099
   29534:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   2953b:	ba 8d 00 00 00       	mov    edx,0x8d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20098
   29540:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20099
   29547:	e8 24 be 02 00       	call   55370 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20099 (discriminator 1)
   2954c:	85 c0                	test   eax,eax
   2954e:	0f 85 f3 37 00 00    	jne    2cd47 <JS_CallInternal+0xa1a7>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   29554:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   29558:	66 0f 6f 9d f0 fe ff 	movdqa xmm3,XMMWORD PTR [rbp-0x110]
   2955f:	ff 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   29560:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   29564:	41 0f 11 5d 00       	movups XMMWORD PTR [r13+0x0],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29569:	83 fa f6             	cmp    edx,0xfffffff6
   2956c:	0f 86 8c d9 ff ff    	jbe    26efe <JS_CallInternal+0x435e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29572:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29575:	83 e8 01             	sub    eax,0x1
   29578:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2957b:	85 c0                	test   eax,eax
   2957d:	0f 8f 7b d9 ff ff    	jg     26efe <JS_CallInternal+0x435e>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   29583:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2958a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2958e:	e8 8d 33 ff ff       	call   1c920 <__JS_FreeValueRT>
   29593:	e9 66 d9 ff ff       	jmp    26efe <JS_CallInternal+0x435e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20121
   29598:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   2959f:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   295a3:	83 fa f6             	cmp    edx,0xfffffff6
   295a6:	76 04                	jbe    295ac <JS_CallInternal+0x6a0c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   295a8:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20125
   295ac:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20124
   295b3:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20125
   295ba:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   295c1:	ba 8c 00 00 00       	mov    edx,0x8c
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20124
   295c6:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20125
   295cd:	e8 9e bd 02 00       	call   55370 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20125 (discriminator 1)
   295d2:	85 c0                	test   eax,eax
   295d4:	0f 85 ab 35 00 00    	jne    2cb85 <JS_CallInternal+0x9fe5>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   295da:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   295de:	66 0f 6f a5 f0 fe ff 	movdqa xmm4,XMMWORD PTR [rbp-0x110]
   295e5:	ff 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   295e6:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   295ea:	41 0f 11 65 00       	movups XMMWORD PTR [r13+0x0],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   295ef:	83 fa f6             	cmp    edx,0xfffffff6
   295f2:	0f 86 02 da ff ff    	jbe    26ffa <JS_CallInternal+0x445a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   295f8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   295fb:	83 e8 01             	sub    eax,0x1
   295fe:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29601:	85 c0                	test   eax,eax
   29603:	0f 8f f1 d9 ff ff    	jg     26ffa <JS_CallInternal+0x445a>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   29609:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29610:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29614:	e8 07 33 ff ff       	call   1c920 <__JS_FreeValueRT>
   29619:	e9 dc d9 ff ff       	jmp    26ffa <JS_CallInternal+0x445a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19994
   2961e:	83 fa 08             	cmp    edx,0x8
   29621:	0f 85 3d 0c 00 00    	jne    2a264 <JS_CallInternal+0x76c4>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19995
   29627:	66 48 0f 6e c0       	movq   xmm0,rax
   2962c:	66 0f 57 05 6c 14 0b 	xorpd  xmm0,XMMWORD PTR [rip+0xb146c]        # daaa0 <typed_array_size_log2+0x28>
   29633:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19997
   29634:	48 c7 43 f8 08 00 00 	mov    QWORD PTR [rbx-0x8],0x8
   2963b:	00 
   2963c:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
   29641:	e9 fd d9 ff ff       	jmp    27043 <JS_CallInternal+0x44a3>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   29646:	83 bd 88 fe ff ff f6 	cmp    DWORD PTR [rbp-0x178],0xfffffff6
   2964d:	0f 86 74 f7 ff ff    	jbe    28dc7 <JS_CallInternal+0x6227>
   29653:	e9 64 f7 ff ff       	jmp    28dbc <JS_CallInternal+0x621c>
   29658:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2965f:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20495
   29660:	85 c0                	test   eax,eax
   29662:	0f 84 61 b7 ff ff    	je     24dc9 <JS_CallInternal+0x2229>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20501
   29668:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:13697
   2966f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29673:	b9 01 00 00 00       	mov    ecx,0x1
   29678:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2967c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20501
   29683:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:13697
   29687:	e8 44 69 01 00       	call   3ffd0 <JS_ToStringInternal>
   2968c:	48 89 c1             	mov    rcx,rax
   2968f:	49 89 d5             	mov    r13,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20503 (discriminator 1)
   29692:	83 fa 06             	cmp    edx,0x6
   29695:	0f 84 a5 9c ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20505
   2969b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2969f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   296a3:	83 fa f6             	cmp    edx,0xfffffff6
   296a6:	76 11                	jbe    296b9 <JS_CallInternal+0x6b19>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   296a8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   296ab:	83 e8 01             	sub    eax,0x1
   296ae:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   296b1:	85 c0                	test   eax,eax
   296b3:	0f 8e d2 27 00 00    	jle    2be8b <JS_CallInternal+0x92eb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20506
   296b9:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   296bd:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20507
   296c1:	e9 03 b7 ff ff       	jmp    24dc9 <JS_CallInternal+0x2229>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20708
   296c6:	45 85 ed             	test   r13d,r13d
   296c9:	0f 85 4c 30 00 00    	jne    2c71b <JS_CallInternal+0x9b7b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20710
   296cf:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   296d3:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   296d7:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   296db:	83 fa f6             	cmp    edx,0xfffffff6
   296de:	76 11                	jbe    296f1 <JS_CallInternal+0x6b51>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   296e0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   296e3:	83 e8 01             	sub    eax,0x1
   296e6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   296e9:	85 c0                	test   eax,eax
   296eb:	0f 8e bd 2a 00 00    	jle    2c1ae <JS_CallInternal+0x960e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20712
   296f1:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   296f5:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   296f9:	b9 01 00 00 00       	mov    ecx,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20711
   296fe:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20712
   29701:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29708:	e8 b3 79 00 00       	call   310c0 <JS_IteratorClose>
   2970d:	e9 cb 9d ff ff       	jmp    234dd <JS_CallInternal+0x93d>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19342
   29712:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29716:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2971a:	4c 89 e9             	mov    rcx,r13
   2971d:	4d 89 f0             	mov    r8,r14
   29720:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29727:	41 b9 01 00 00 00    	mov    r9d,0x1
   2972d:	e8 1e 2e 01 00       	call   3c550 <JS_SetPrototypeInternal>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19342 (discriminator 1)
   29732:	85 c0                	test   eax,eax
   29734:	0f 89 6e c8 ff ff    	jns    25fa8 <JS_CallInternal+0x3408>
   2973a:	e9 01 9c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2973f:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 4)
   29740:	41 83 fe 08          	cmp    r14d,0x8
   29744:	0f 85 ee 0b 00 00    	jne    2a338 <JS_CallInternal+0x7798>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 5)
   2974a:	66 0f ef c0          	pxor   xmm0,xmm0
   2974e:	66 49 0f 6e dd       	movq   xmm3,r13
   29753:	31 c0                	xor    eax,eax
   29755:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   29759:	ba 00 00 00 00       	mov    edx,0x0
   2975e:	66 0f 2e c3          	ucomisd xmm0,xmm3
   29762:	0f 9b c0             	setnp  al
   29765:	48 0f 45 c2          	cmovne rax,rdx
   29769:	e9 f4 ba ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 4)
   2976e:	41 83 fe 08          	cmp    r14d,0x8
   29772:	0f 85 a6 0b 00 00    	jne    2a31e <JS_CallInternal+0x777e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 5)
   29778:	66 0f ef c0          	pxor   xmm0,xmm0
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2977c:	66 49 0f 6e f5       	movq   xmm6,r13
   29781:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 5)
   29783:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   29787:	ba 01 00 00 00       	mov    edx,0x1
   2978c:	66 0f 2e c6          	ucomisd xmm0,xmm6
   29790:	0f 9a c0             	setp   al
   29793:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   29797:	e9 72 ba ff ff       	jmp    2520e <JS_CallInternal+0x266e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 4)
   2979c:	41 83 f8 08          	cmp    r8d,0x8
   297a0:	0f 85 06 0a 00 00    	jne    2a1ac <JS_CallInternal+0x760c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 5)
   297a6:	66 0f ef c0          	pxor   xmm0,xmm0
   297aa:	66 49 0f 6e f9       	movq   xmm7,r9
   297af:	31 c0                	xor    eax,eax
   297b1:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   297b6:	66 0f 2e c7          	ucomisd xmm0,xmm7
   297ba:	0f 9b c0             	setnp  al
   297bd:	41 0f 45 c5          	cmovne eax,r13d
   297c1:	e9 f2 bb ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 4)
   297c6:	41 83 f8 08          	cmp    r8d,0x8
   297ca:	0f 85 10 09 00 00    	jne    2a0e0 <JS_CallInternal+0x7540>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 5)
   297d0:	66 0f ef c0          	pxor   xmm0,xmm0
   297d4:	66 49 0f 6e d1       	movq   xmm2,r9
   297d9:	ba 00 00 00 00       	mov    edx,0x0
   297de:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   297e3:	66 0f 2e c2          	ucomisd xmm0,xmm2
   297e7:	0f 9b c0             	setnp  al
   297ea:	0f 45 c2             	cmovne eax,edx
   297ed:	e9 26 bc ff ff       	jmp    25418 <JS_CallInternal+0x2878>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   297f2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   297f9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   297fd:	e8 1e 31 ff ff       	call   1c920 <__JS_FreeValueRT>
   29802:	e9 86 b4 ff ff       	jmp    24c8d <JS_CallInternal+0x20ed>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20017
   29807:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20018
   2980e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29815:	44 89 ea             	mov    edx,r13d
   29818:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20017
   2981b:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20018
   2981f:	e8 4c bb 02 00       	call   55370 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20018 (discriminator 1)
   29824:	85 c0                	test   eax,eax
   29826:	0f 84 67 d6 ff ff    	je     26e93 <JS_CallInternal+0x42f3>
   2982c:	e9 0f 9b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29831:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20053
   29838:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20054
   2983f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29846:	44 89 ea             	mov    edx,r13d
   29849:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20053
   2984c:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20054
   29850:	e8 bb bf 02 00       	call   55810 <js_post_inc_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20054 (discriminator 1)
   29855:	85 c0                	test   eax,eax
   29857:	0f 84 c4 cf ff ff    	je     26821 <JS_CallInternal+0x3c81>
   2985d:	e9 de 9a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29862:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20072
   29868:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20073
   2986f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29876:	44 89 ea             	mov    edx,r13d
   29879:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20072
   2987c:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20073
   29880:	e8 8b bf 02 00       	call   55810 <js_post_inc_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20073 (discriminator 1)
   29885:	85 c0                	test   eax,eax
   29887:	0f 84 f6 d7 ff ff    	je     27083 <JS_CallInternal+0x44e3>
   2988d:	e9 ae 9a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29892:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19367
   29898:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2989c:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   298a0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298a7:	e8 04 a3 01 00       	call   43bb0 <JS_ValueToAtom>
   298ac:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19368 (discriminator 1)
   298b2:	85 c0                	test   eax,eax
   298b4:	0f 84 86 9a ff ff    	je     23340 <JS_CallInternal+0x7a0>
   298ba:	4d 89 e5             	mov    r13,r12
   298bd:	e9 0c a0 ff ff       	jmp    238ce <JS_CallInternal+0xd2e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20035
   298c2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20036
   298c9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298d0:	44 89 ea             	mov    edx,r13d
   298d3:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20035
   298d6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20036
   298da:	e8 91 ba 02 00       	call   55370 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20036 (discriminator 1)
   298df:	85 c0                	test   eax,eax
   298e1:	0f 84 7f cf ff ff    	je     26866 <JS_CallInternal+0x3cc6>
   298e7:	e9 54 9a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   298ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19103
   298f0:	41 83 e6 02          	and    r14d,0x2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19079
   298f4:	48 8d 4b c0          	lea    rcx,[rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19105
   298f8:	48 8b 73 c0          	mov    rsi,QWORD PTR [rbx-0x40]
   298fc:	4c 8b 41 08          	mov    r8,QWORD PTR [rcx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19103
   29900:	0f 84 05 0b 00 00    	je     2a40b <JS_CallInternal+0x786b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19105
   29906:	48 83 ec 08          	sub    rsp,0x8
   2990a:	45 31 c9             	xor    r9d,r9d
   2990d:	6a 00                	push   0x0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19108
   2990f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29916:	48 89 f1             	mov    rcx,rsi
   29919:	48 89 c6             	mov    rsi,rax
   2991c:	e8 6f 35 00 00       	call   2ce90 <JS_CallFree>
   29921:	41 5a                	pop    r10
   29923:	41 5b                	pop    r11
   29925:	48 89 c1             	mov    rcx,rax
   29928:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19111 (discriminator 1)
   2992b:	83 fa 06             	cmp    edx,0x6
   2992e:	0f 84 e6 0b 00 00    	je     2a51a <JS_CallInternal+0x797a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19113
   29934:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29938:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2993c:	83 fa f6             	cmp    edx,0xfffffff6
   2993f:	76 11                	jbe    29952 <JS_CallInternal+0x6db2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29941:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29944:	83 e8 01             	sub    eax,0x1
   29947:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2994a:	85 c0                	test   eax,eax
   2994c:	0f 8e f6 27 00 00    	jle    2c148 <JS_CallInternal+0x95a8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19114
   29952:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   29956:	31 c9                	xor    ecx,ecx
   29958:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19115
   2995c:	e9 2c a9 ff ff       	jmp    2428d <JS_CallInternal+0x16ed>
JS_NewUint32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:587
   29961:	66 0f ef c0          	pxor   xmm0,xmm0
   29965:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   2996a:	b8 08 00 00 00       	mov    eax,0x8
   2996f:	e9 57 d4 ff ff       	jmp    26dcb <JS_CallInternal+0x422b>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9666
   29974:	4c 89 c6             	mov    rsi,r8
   29977:	48 89 df             	mov    rdi,rbx
   2997a:	48 89 8d 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rcx
   29981:	4c 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r8
   29988:	e8 e3 24 01 00       	call   3be70 <expand_fast_array>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9666 (discriminator 1)
   2998d:	4c 8b 85 28 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1d8]
   29994:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
   2999b:	85 c0                	test   eax,eax
   2999d:	0f 88 c5 26 00 00    	js     2c068 <JS_CallInternal+0x94c8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9673
   299a3:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   299a9:	41 89 40 38          	mov    DWORD PTR [r8+0x38],eax
   299ad:	31 c0                	xor    eax,eax
   299af:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9675
   299b0:	f3 41 0f 6f 5c 05 00 	movdqu xmm3,XMMWORD PTR [r13+rax*1+0x0]
   299b7:	49 8b 50 30          	mov    rdx,QWORD PTR [r8+0x30]
   299bb:	0f 11 1c 02          	movups XMMWORD PTR [rdx+rax*1],xmm3
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9674 (discriminator 1)
   299bf:	48 83 c0 10          	add    rax,0x10
   299c3:	4c 39 f0             	cmp    rax,r14
   299c6:	75 e8                	jne    299b0 <JS_CallInternal+0x6e10>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9677 (discriminator 1)
   299c8:	49 8b 40 20          	mov    rax,QWORD PTR [r8+0x20]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   299cc:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   299d3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   299d7:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   299da:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
   299e1:	00 
   299e2:	48 89 18             	mov    QWORD PTR [rax],rbx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   299e5:	83 fa f6             	cmp    edx,0xfffffff6
   299e8:	0f 86 fd a5 ff ff    	jbe    23feb <JS_CallInternal+0x144b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   299ee:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   299f1:	83 e8 01             	sub    eax,0x1
   299f4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   299f7:	85 c0                	test   eax,eax
   299f9:	0f 8f ec a5 ff ff    	jg     23feb <JS_CallInternal+0x144b>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   299ff:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29a06:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   29a0d:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   29a14:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29a18:	e8 03 2f ff ff       	call   1c920 <__JS_FreeValueRT>
   29a1d:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   29a24:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   29a2b:	e9 bb a5 ff ff       	jmp    23feb <JS_CallInternal+0x144b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18530
   29a30:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   29a37:	48 03 77 30          	add    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18531
   29a3b:	80 7a 11 00          	cmp    BYTE PTR [rdx+0x11],0x0
   29a3f:	0f 84 b4 0c 00 00    	je     2a6f9 <JS_CallInternal+0x7b59>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18532
   29a45:	41 83 fd 3a          	cmp    r13d,0x3a
   29a49:	0f 84 b2 9d ff ff    	je     23801 <JS_CallInternal+0xc61>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18506
   29a4f:	8b 76 04             	mov    esi,DWORD PTR [rsi+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18535
   29a52:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18534 (discriminator 1)
   29a59:	83 f9 04             	cmp    ecx,0x4
   29a5c:	0f 84 87 33 00 00    	je     2cde9 <JS_CallInternal+0xa249>
JS_ThrowTypeErrorReadOnly():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7766
   29a62:	e8 c9 87 00 00       	call   32230 <JS_ThrowTypeErrorReadOnly.part.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18526
   29a67:	4d 89 f4             	mov    r12,r14
   29a6a:	e9 d1 98 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29a6f:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 10)
   29a70:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29a77:	48 89 fa             	mov    rdx,rdi
   29a7a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29a81:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29a85:	e8 e6 3a 00 00       	call   2d570 <JS_GetPropertyValue>
   29a8a:	48 89 c1             	mov    rcx,rax
   29a8d:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 3)
   29a90:	83 fa 06             	cmp    edx,0x6
   29a93:	0f 85 3a bc ff ff    	jne    256d3 <JS_CallInternal+0x2b33>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 15)
   29a99:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19467 (discriminator 16)
   29a9d:	e9 9e 98 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 10)
   29aa2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29aa9:	48 89 ca             	mov    rdx,rcx
   29aac:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29ab0:	4c 89 c0             	mov    rax,r8
   29ab3:	49 89 f8             	mov    r8,rdi
   29ab6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29abd:	48 89 c1             	mov    rcx,rax
   29ac0:	e8 ab 3a 00 00       	call   2d570 <JS_GetPropertyValue>
   29ac5:	48 89 c1             	mov    rcx,rax
   29ac8:	48 89 d0             	mov    rax,rdx
   29acb:	48 89 ca             	mov    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 3)
   29ace:	83 f8 06             	cmp    eax,0x6
   29ad1:	0f 85 fc bc ff ff    	jne    257d3 <JS_CallInternal+0x2c33>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19471 (discriminator 14)
   29ad7:	45 31 c0             	xor    r8d,r8d
   29ada:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   29ae1:	00 
   29ae2:	4c 89 43 f0          	mov    QWORD PTR [rbx-0x10],r8
   29ae6:	e9 55 98 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19618
   29aeb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19619
   29af2:	48 8d 7b f0          	lea    rdi,[rbx-0x10]
   29af6:	41 b9 00 80 00 00    	mov    r9d,0x8000
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19618
   29afc:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19619
   29b00:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   29b04:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29b08:	48 83 eb 30          	sub    rbx,0x30
   29b0c:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   29b0f:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   29b13:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   29b16:	ff 77 08             	push   QWORD PTR [rdi+0x8]
   29b19:	ff 37                	push   QWORD PTR [rdi]
   29b1b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b22:	e8 19 4e 00 00       	call   2e940 <JS_SetPropertyValue>
   29b27:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29b2b:	5f                   	pop    rdi
   29b2c:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19619
   29b2f:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29b32:	41 58                	pop    r8
   29b34:	83 fa f6             	cmp    edx,0xfffffff6
   29b37:	76 11                	jbe    29b4a <JS_CallInternal+0x6faa>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29b39:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29b3c:	83 e8 01             	sub    eax,0x1
   29b3f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29b42:	85 c0                	test   eax,eax
   29b44:	0f 8e 84 24 00 00    	jle    2bfce <JS_CallInternal+0x942e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19622 (discriminator 1)
   29b4a:	45 85 ed             	test   r13d,r13d
   29b4d:	0f 89 2a be ff ff    	jns    2597d <JS_CallInternal+0x2ddd>
   29b53:	e9 e8 97 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   29b58:	41 8b 30             	mov    esi,DWORD PTR [r8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   29b5b:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   29b61:	0f 85 f9 c1 ff ff    	jne    25d60 <JS_CallInternal+0x31c0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19239
   29b67:	48 83 ec 08          	sub    rsp,0x8
   29b6b:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29b6f:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29b73:	48 89 c6             	mov    rsi,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19238
   29b76:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   29b7d:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   29b84:	4c 89 57 30          	mov    QWORD PTR [rdi+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19239
   29b88:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b8f:	68 00 80 00 00       	push   0x8000
   29b94:	52                   	push   rdx
   29b95:	50                   	push   rax
   29b96:	e8 95 40 00 00       	call   2dc30 <JS_SetPropertyInternal>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29b9b:	48 83 c4 20          	add    rsp,0x20
   29b9f:	41 83 fe f6          	cmp    r14d,0xfffffff6
   29ba3:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19239
   29baa:	89 c1                	mov    ecx,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29bac:	76 13                	jbe    29bc1 <JS_CallInternal+0x7021>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29bae:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   29bb2:	83 e8 01             	sub    eax,0x1
   29bb5:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   29bb9:	85 c0                	test   eax,eax
   29bbb:	0f 8e aa 25 00 00    	jle    2c16b <JS_CallInternal+0x95cb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19242
   29bc1:	48 83 eb 20          	sub    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19243 (discriminator 1)
   29bc5:	85 c9                	test   ecx,ecx
   29bc7:	0f 89 09 c2 ff ff    	jns    25dd6 <JS_CallInternal+0x3236>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19219
   29bcd:	4d 89 d4             	mov    r12,r10
   29bd0:	e9 6b 97 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
find_own_property1():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6148
   29bd5:	8b 00                	mov    eax,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6143
   29bd7:	25 ff ff ff 03       	and    eax,0x3ffffff
   29bdc:	0f 85 9d 97 ff ff    	jne    2337f <JS_CallInternal+0x7df>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20699
   29be2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20700
   29be9:	48 83 ec 08          	sub    rsp,0x8
   29bed:	31 c9                	xor    ecx,ecx
   29bef:	45 31 c9             	xor    r9d,r9d
   29bf2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29bf9:	45 31 c0             	xor    r8d,r8d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20699
   29bfc:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20700
   29c00:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   29c07:	48 8b b0 d8 04 00 00 	mov    rsi,QWORD PTR [rax+0x4d8]
   29c0e:	48 8b 90 e0 04 00 00 	mov    rdx,QWORD PTR [rax+0x4e0]
   29c15:	6a 00                	push   0x0
   29c17:	e8 94 64 00 00       	call   300b0 <build_backtrace>
   29c1c:	59                   	pop    rcx
   29c1d:	5e                   	pop    rsi
   29c1e:	e9 6d 97 ff ff       	jmp    23390 <JS_CallInternal+0x7f0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18406
   29c23:	31 c9                	xor    ecx,ecx
   29c25:	41 b8 03 00 00 00    	mov    r8d,0x3
   29c2b:	e9 b3 ae ff ff       	jmp    24ae3 <JS_CallInternal+0x1f43>
   29c30:	31 c0                	xor    eax,eax
   29c32:	e9 00 d7 ff ff       	jmp    27337 <JS_CallInternal+0x4797>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15994
   29c37:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   29c3e:	4d 89 f0             	mov    r8,r14
   29c41:	4c 89 ce             	mov    rsi,r9
   29c44:	4c 89 ea             	mov    rdx,r13
   29c47:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c4e:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   29c55:	e8 96 77 00 00       	call   313f0 <JS_CheckBrand>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15995
   29c5a:	85 c0                	test   eax,eax
   29c5c:	0f 88 de 96 ff ff    	js     23340 <JS_CallInternal+0x7a0>
   29c62:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   29c69:	0f 95 c0             	setne  al
   29c6c:	e9 09 b5 ff ff       	jmp    2517a <JS_CallInternal+0x25da>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20138
   29c71:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20139
   29c78:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c7f:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20138
   29c82:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20139
   29c86:	e8 f5 bb 02 00       	call   55880 <js_not_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20139 (discriminator 1)
   29c8b:	85 c0                	test   eax,eax
   29c8d:	0f 84 2b d0 ff ff    	je     26cbe <JS_CallInternal+0x411e>
   29c93:	e9 a8 96 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29c98:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   29c9f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18921
   29ca0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ca7:	48 89 ce             	mov    rsi,rcx
   29caa:	e8 a1 4e ff ff       	call   1eb50 <JS_ToBoolFree>
   29caf:	e9 c4 cd ff ff       	jmp    26a78 <JS_CallInternal+0x3ed8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19131
   29cb4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29cbb:	48 89 d6             	mov    rsi,rdx
   29cbe:	48 89 c2             	mov    rdx,rax
   29cc1:	e8 8a 4e ff ff       	call   1eb50 <JS_ToBoolFree>
   29cc6:	e9 36 a5 ff ff       	jmp    24201 <JS_CallInternal+0x1661>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18941
   29ccb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29cd2:	48 89 ce             	mov    rsi,rcx
   29cd5:	e8 76 4e ff ff       	call   1eb50 <JS_ToBoolFree>
   29cda:	e9 32 cd ff ff       	jmp    26a11 <JS_CallInternal+0x3e71>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18879
   29cdf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ce6:	48 89 ce             	mov    rsi,rcx
   29ce9:	e8 62 4e ff ff       	call   1eb50 <JS_ToBoolFree>
   29cee:	e9 12 cc ff ff       	jmp    26905 <JS_CallInternal+0x3d65>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18900
   29cf3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29cfa:	48 89 ce             	mov    rsi,rcx
   29cfd:	e8 4e 4e ff ff       	call   1eb50 <JS_ToBoolFree>
   29d02:	e9 98 cb ff ff       	jmp    2689f <JS_CallInternal+0x3cff>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18410
   29d07:	49 8b 75 f0          	mov    rsi,QWORD PTR [r13-0x10]
   29d0b:	49 8b 55 f8          	mov    rdx,QWORD PTR [r13-0x8]
   29d0f:	41 b8 03 00 00 00    	mov    r8d,0x3
   29d15:	31 c9                	xor    ecx,ecx
   29d17:	44 8b 8d 50 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x1b0]
   29d1e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18411
   29d25:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
   29d2c:	00 00 00 00 
   29d30:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x3
   29d37:	03 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18410
   29d3b:	6a 00                	push   0x0
   29d3d:	41 55                	push   r13
   29d3f:	ff b5 98 fd ff ff    	push   QWORD PTR [rbp-0x268]
   29d45:	ff b5 90 fd ff ff    	push   QWORD PTR [rbp-0x270]
   29d4b:	e8 50 8e ff ff       	call   22ba0 <JS_CallInternal>
   29d50:	48 83 c4 20          	add    rsp,0x20
   29d54:	49 89 c1             	mov    r9,rax
   29d57:	49 89 d0             	mov    r8,rdx
   29d5a:	e9 b4 ad ff ff       	jmp    24b13 <JS_CallInternal+0x1f73>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18439
   29d5f:	31 c9                	xor    ecx,ecx
   29d61:	41 b8 03 00 00 00    	mov    r8d,0x3
   29d67:	e9 24 ac ff ff       	jmp    24990 <JS_CallInternal+0x1df0>
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20752
   29d6c:	48 8b b5 28 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1d8]
   29d73:	45 89 d1             	mov    r9d,r10d
   29d76:	4c 89 ea             	mov    rdx,r13
   29d79:	31 c9                	xor    ecx,ecx
   29d7b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29d82:	41 b8 03 00 00 00    	mov    r8d,0x3
   29d88:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
   29d8f:	00 00 00 00 
   29d93:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x3
   29d9a:	03 00 00 00 
   29d9e:	6a 02                	push   0x2
   29da0:	41 56                	push   r14
   29da2:	ff b5 a8 fd ff ff    	push   QWORD PTR [rbp-0x258]
   29da8:	ff b5 a0 fd ff ff    	push   QWORD PTR [rbp-0x260]
   29dae:	44 89 95 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r10d
   29db5:	e8 e6 8d ff ff       	call   22ba0 <JS_CallInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18443
   29dba:	44 8b 95 38 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c8]
   29dc1:	48 83 c4 20          	add    rsp,0x20
   29dc5:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   29dcc:	49 89 d5             	mov    r13,rdx
   29dcf:	e9 fe ab ff ff       	jmp    249d2 <JS_CallInternal+0x1e32>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19491
   29dd4:	41 83 fd fa          	cmp    r13d,0xfffffffa
   29dd8:	7d 06                	jge    29de0 <JS_CallInternal+0x7240>
   29dda:	41 83 fd f8          	cmp    r13d,0xfffffff8
   29dde:	7d 59                	jge    29e39 <JS_CallInternal+0x7299>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19503
   29de0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:13697
   29de7:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29deb:	b9 01 00 00 00       	mov    ecx,0x1
   29df0:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29df4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19503
   29dfb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:13697
   29dff:	e8 cc 61 01 00       	call   3ffd0 <JS_ToStringInternal>
   29e04:	49 89 d0             	mov    r8,rdx
   29e07:	49 89 d5             	mov    r13,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19505 (discriminator 1)
   29e0a:	83 fa 06             	cmp    edx,0x6
   29e0d:	0f 84 2d 95 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19507
   29e13:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29e17:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29e1b:	83 fa f6             	cmp    edx,0xfffffff6
   29e1e:	76 11                	jbe    29e31 <JS_CallInternal+0x7291>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29e20:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   29e23:	83 e9 01             	sub    ecx,0x1
   29e26:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   29e29:	85 c9                	test   ecx,ecx
   29e2b:	0f 8e 9d 2a 00 00    	jle    2c8ce <JS_CallInternal+0x9d2e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19508
   29e31:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   29e35:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19511
   29e39:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29e40:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   29e44:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   29e48:	41 83 fd f6          	cmp    r13d,0xfffffff6
   29e4c:	76 04                	jbe    29e52 <JS_CallInternal+0x72b2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   29e4e:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19512 (discriminator 1)
   29e52:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29e56:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29e5a:	4d 89 e8             	mov    r8,r13
   29e5d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29e64:	e8 07 37 00 00       	call   2d570 <JS_GetPropertyValue>
   29e69:	48 89 c1             	mov    rcx,rax
   29e6c:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19513 (discriminator 2)
   29e6f:	83 fa 06             	cmp    edx,0x6
   29e72:	0f 85 e7 b8 ff ff    	jne    2575f <JS_CallInternal+0x2bbf>
   29e78:	e9 c3 94 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29e7d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29e84:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   29e88:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   29e8f:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   29e93:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29e96:	83 e8 01             	sub    eax,0x1
   29e99:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29e9c:	85 c0                	test   eax,eax
   29e9e:	0f 8f c2 c4 ff ff    	jg     26366 <JS_CallInternal+0x37c6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   29ea4:	e8 77 b5 fe ff       	call   15420 <JS_FreeAtomStruct>
   29ea9:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   29eb0:	e9 b1 c4 ff ff       	jmp    26366 <JS_CallInternal+0x37c6>
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:9
   29eb5:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29eb8:	0f 85 94 a1 ff ff    	jne    24052 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:10
   29ebe:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   29ec2:	83 f8 ff             	cmp    eax,0xffffffff
   29ec5:	0f 84 87 a1 ff ff    	je     24052 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 5)
   29ecb:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   29ed2:	48 8b 51 10          	mov    rdx,QWORD PTR [rcx+0x10]
   29ed6:	80 ba a0 05 00 00 00 	cmp    BYTE PTR [rdx+0x5a0],0x0
   29edd:	0f 85 76 2a 00 00    	jne    2c959 <JS_CallInternal+0x9db9>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 10)
   29ee3:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 1)
   29ee7:	41 b9 01 00 00 00    	mov    r9d,0x1
   29eed:	e9 67 a1 ff ff       	jmp    24059 <JS_CallInternal+0x14b9>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16724
   29ef2:	c7 85 f0 fe ff ff ff 	mov    DWORD PTR [rbp-0x110],0xffffffff
   29ef9:	ff ff ff 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16725
   29efc:	b9 ff ff ff ff       	mov    ecx,0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16728
   29f01:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   29f05:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29f09:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29f0d:	76 11                	jbe    29f20 <JS_CallInternal+0x7380>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29f0f:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   29f12:	8d 57 ff             	lea    edx,[rdi-0x1]
   29f15:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   29f18:	85 d2                	test   edx,edx
   29f1a:	0f 8e 1a 20 00 00    	jle    2bf3a <JS_CallInternal+0x939a>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16729
   29f20:	49 c7 45 00 00 00 00 	mov    QWORD PTR [r13+0x0],0x0
   29f27:	00 
   29f28:	49 c7 45 08 03 00 00 	mov    QWORD PTR [r13+0x8],0x3
   29f2f:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16730
   29f30:	85 c9                	test   ecx,ecx
   29f32:	0f 88 3d 2c 00 00    	js     2cb75 <JS_CallInternal+0x9fd5>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   29f38:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   29f3c:	76 11                	jbe    29f4f <JS_CallInternal+0x73af>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   29f3e:	8b 48 fc             	mov    ecx,DWORD PTR [rax-0x4]
   29f41:	8d 51 ff             	lea    edx,[rcx-0x1]
   29f44:	89 50 fc             	mov    DWORD PTR [rax-0x4],edx
   29f47:	85 d2                	test   edx,edx
   29f49:	0f 8e 74 22 00 00    	jle    2c1c3 <JS_CallInternal+0x9623>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   29f4f:	44 8b 85 f0 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x110]
   29f56:	31 d2                	xor    edx,edx
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16718
   29f58:	be 03 00 00 00       	mov    esi,0x3
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   29f5d:	45 85 c0             	test   r8d,r8d
   29f60:	0f 95 c2             	setne  dl
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16718
   29f63:	31 ff                	xor    edi,edi
   29f65:	e9 71 a7 ff ff       	jmp    246db <JS_CallInternal+0x1b3b>
   29f6a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29f71:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   29f75:	89 c8                	mov    eax,ecx
   29f77:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29f7e:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   29f82:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29f85:	83 e8 01             	sub    eax,0x1
   29f88:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29f8b:	85 c0                	test   eax,eax
   29f8d:	0f 8f 7a b3 ff ff    	jg     2530d <JS_CallInternal+0x276d>
   29f93:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   29f9a:	e8 81 b4 fe ff       	call   15420 <JS_FreeAtomStruct>
   29f9f:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   29fa6:	e9 62 b3 ff ff       	jmp    2530d <JS_CallInternal+0x276d>
   29fab:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29fb2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   29fb6:	89 c8                	mov    eax,ecx
   29fb8:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29fbf:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   29fc3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29fc6:	83 e8 01             	sub    eax,0x1
   29fc9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29fcc:	85 c0                	test   eax,eax
   29fce:	0f 8f 77 af ff ff    	jg     24f4b <JS_CallInternal+0x23ab>
   29fd4:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   29fdb:	e8 40 b4 fe ff       	call   15420 <JS_FreeAtomStruct>
   29fe0:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   29fe7:	e9 5f af ff ff       	jmp    24f4b <JS_CallInternal+0x23ab>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   29fec:	8b 08                	mov    ecx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   29fee:	81 e1 ff ff ff 03    	and    ecx,0x3ffffff
   29ff4:	0f 85 98 ae ff ff    	jne    24e92 <JS_CallInternal+0x22f2>
JS_DeleteGlobalVar():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:10937
   29ffa:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a001:	44 89 f1             	mov    ecx,r14d
   2a004:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   2a00b:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   2a012:	e8 c9 42 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:10938
   2a017:	85 c0                	test   eax,eax
   2a019:	0f 88 06 2d 00 00    	js     2cd25 <JS_CallInternal+0xa185>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:10940
   2a01f:	b8 01 00 00 00       	mov    eax,0x1
   2a024:	0f 84 7b ae ff ff    	je     24ea5 <JS_CallInternal+0x2305>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:10941
   2a02a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a031:	45 31 c0             	xor    r8d,r8d
   2a034:	44 89 f1             	mov    ecx,r14d
   2a037:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   2a03e:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   2a045:	e8 f6 11 02 00       	call   4b240 <JS_DeleteProperty>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20477 (discriminator 1)
   2a04a:	85 c0                	test   eax,eax
   2a04c:	0f 88 74 28 00 00    	js     2c8c6 <JS_CallInternal+0x9d26>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2a052:	0f 95 c0             	setne  al
   2a055:	0f b6 c0             	movzx  eax,al
   2a058:	e9 48 ae ff ff       	jmp    24ea5 <JS_CallInternal+0x2305>
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:9
   2a05d:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   2a060:	0f 85 d0 a0 ff ff    	jne    24136 <JS_CallInternal+0x1596>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:10
   2a066:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2a06a:	83 f8 ff             	cmp    eax,0xffffffff
   2a06d:	0f 84 c3 a0 ff ff    	je     24136 <JS_CallInternal+0x1596>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 5)
   2a073:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2a07a:	48 8b 51 10          	mov    rdx,QWORD PTR [rcx+0x10]
   2a07e:	80 ba a0 05 00 00 00 	cmp    BYTE PTR [rdx+0x5a0],0x0
   2a085:	0f 85 88 27 00 00    	jne    2c813 <JS_CallInternal+0x9c73>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 10)
   2a08b:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 1)
   2a08f:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a095:	e9 a3 a0 ff ff       	jmp    2413d <JS_CallInternal+0x159d>
   2a09a:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2a0a1:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2a0a5:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a0ac:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2a0b0:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   2a0b3:	8d 51 ff             	lea    edx,[rcx-0x1]
   2a0b6:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2a0b9:	85 d2                	test   edx,edx
   2a0bb:	0f 8f de bf ff ff    	jg     2609f <JS_CallInternal+0x34ff>
   2a0c1:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2a0c8:	e8 53 b3 fe ff       	call   15420 <JS_FreeAtomStruct>
   2a0cd:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2a0d4:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2a0db:	e9 bf bf ff ff       	jmp    2609f <JS_CallInternal+0x34ff>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 30)
   2a0e0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a0e7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a0ee:	31 d2                	xor    edx,edx
   2a0f0:	48 89 de             	mov    rsi,rbx
   2a0f3:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2a0f7:	e8 44 0f 03 00       	call   5b040 <js_eq_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 1)
   2a0fc:	85 c0                	test   eax,eax
   2a0fe:	0f 84 23 b3 ff ff    	je     25427 <JS_CallInternal+0x2887>
   2a104:	e9 37 92 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a109:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47697
   2a110:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a117:	48 8d 35 19 34 0a 00 	lea    rsi,[rip+0xa3419]        # cd537 <_IO_stdin_used+0x537>
   2a11e:	31 c0                	xor    eax,eax
   2a120:	e8 4b 6c 00 00       	call   30d70 <JS_ThrowTypeError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2a125:	83 fb f6             	cmp    ebx,0xfffffff6
   2a128:	76 1e                	jbe    2a148 <JS_CallInternal+0x75a8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2a12a:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a131:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   2a134:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
   2a13a:	83 e8 01             	sub    eax,0x1
   2a13d:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   2a140:	85 c0                	test   eax,eax
   2a142:	0f 8e 67 22 00 00    	jle    2c3af <JS_CallInternal+0x980f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2a148:	83 bd 38 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1c8],0xfffffff6
   2a14f:	76 1e                	jbe    2a16f <JS_CallInternal+0x75cf>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2a151:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2a158:	8b 43 fc             	mov    eax,DWORD PTR [rbx-0x4]
   2a15b:	89 85 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],eax
   2a161:	83 e8 01             	sub    eax,0x1
   2a164:	89 43 fc             	mov    DWORD PTR [rbx-0x4],eax
   2a167:	85 c0                	test   eax,eax
   2a169:	0f 8e 5b 22 00 00    	jle    2c3ca <JS_CallInternal+0x982a>
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:47712
   2a16f:	ba 06 00 00 00       	mov    edx,0x6
   2a174:	31 c0                	xor    eax,eax
   2a176:	e9 34 a7 ff ff       	jmp    248af <JS_CallInternal+0x1d0f>
   2a17b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a182:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2a186:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   2a18d:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2a191:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a194:	83 e8 01             	sub    eax,0x1
   2a197:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a19a:	85 c0                	test   eax,eax
   2a19c:	0f 8f f4 b6 ff ff    	jg     25896 <JS_CallInternal+0x2cf6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2a1a2:	e8 79 b2 fe ff       	call   15420 <JS_FreeAtomStruct>
   2a1a7:	e9 ea b6 ff ff       	jmp    25896 <JS_CallInternal+0x2cf6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 30)
   2a1ac:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a1b3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a1ba:	ba 01 00 00 00       	mov    edx,0x1
   2a1bf:	48 89 de             	mov    rsi,rbx
   2a1c2:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2a1c6:	e8 75 0e 03 00       	call   5b040 <js_eq_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 1)
   2a1cb:	85 c0                	test   eax,eax
   2a1cd:	0f 84 fa b1 ff ff    	je     253cd <JS_CallInternal+0x282d>
   2a1d3:	e9 68 91 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a1d8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2a1df:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20734
   2a1e0:	48 89 fe             	mov    rsi,rdi
   2a1e3:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
   2a1ea:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   2a1f1:	48 89 8d d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rcx
   2a1f8:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
   2a1ff:	e8 ac 62 ff ff       	call   204b0 <close_var_refs>
   2a204:	48 8b 8d d0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x130]
   2a20b:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   2a212:	e9 8e 90 ff ff       	jmp    232a5 <JS_CallInternal+0x705>
   2a217:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a21e:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2a222:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a229:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2a22d:	8b 56 fc             	mov    edx,DWORD PTR [rsi-0x4]
   2a230:	83 ea 01             	sub    edx,0x1
   2a233:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2a236:	85 d2                	test   edx,edx
   2a238:	0f 8f 7f bf ff ff    	jg     261bd <JS_CallInternal+0x361d>
   2a23e:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a245:	4c 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2a24c:	e8 cf b1 fe ff       	call   15420 <JS_FreeAtomStruct>
   2a251:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a258:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a25f:	e9 59 bf ff ff       	jmp    261bd <JS_CallInternal+0x361d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19999
   2a264:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20000
   2a26b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a272:	44 89 ea             	mov    edx,r13d
   2a275:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19999
   2a278:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20000
   2a27c:	e8 ef b0 02 00       	call   55370 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20000 (discriminator 1)
   2a281:	85 c0                	test   eax,eax
   2a283:	0f 84 ba cd ff ff    	je     27043 <JS_CallInternal+0x44a3>
   2a289:	e9 b2 90 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a28e:	66 90                	xchg   ax,ax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2a290:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a297:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
   2a29d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a2a1:	e8 7a 26 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a2a6:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2a2ac:	e9 e8 97 ff ff       	jmp    23a99 <JS_CallInternal+0xef9>
   2a2b1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a2b8:	48 89 ca             	mov    rdx,rcx
   2a2bb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a2bf:	e8 5c 26 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a2c4:	e9 59 95 ff ff       	jmp    23822 <JS_CallInternal+0xc82>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19396
   2a2c9:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   2a2ce:	e9 a7 97 ff ff       	jmp    23a7a <JS_CallInternal+0xeda>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17880
   2a2d3:	45 31 ed             	xor    r13d,r13d
   2a2d6:	e9 74 ec ff ff       	jmp    28f4f <JS_CallInternal+0x63af>
   2a2db:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a2e2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2a2e6:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2a2ec:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a2f3:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2a2f7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a2fa:	83 e8 01             	sub    eax,0x1
   2a2fd:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a300:	85 c0                	test   eax,eax
   2a302:	0f 8f 9b ef ff ff    	jg     292a3 <JS_CallInternal+0x6703>
   2a308:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2a30e:	e8 0d b1 fe ff       	call   15420 <JS_FreeAtomStruct>
   2a313:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2a319:	e9 85 ef ff ff       	jmp    292a3 <JS_CallInternal+0x6703>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2a31e:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2a322:	0f 87 06 12 00 00    	ja     2b52e <JS_CallInternal+0x898e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 16)
   2a328:	b8 01 00 00 00       	mov    eax,0x1
   2a32d:	e9 dc ae ff ff       	jmp    2520e <JS_CallInternal+0x266e>
   2a332:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2a338:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2a33c:	76 0f                	jbe    2a34d <JS_CallInternal+0x77ad>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2a33e:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2a342:	83 e8 01             	sub    eax,0x1
   2a345:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2a349:	85 c0                	test   eax,eax
   2a34b:	7e 07                	jle    2a354 <JS_CallInternal+0x77b4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 16)
   2a34d:	31 c0                	xor    eax,eax
   2a34f:	e9 0e af ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2a354:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a35b:	4c 89 ee             	mov    rsi,r13
   2a35e:	4c 89 f2             	mov    rdx,r14
   2a361:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a365:	e8 b6 25 ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 16)
   2a36a:	31 c0                	xor    eax,eax
   2a36c:	e9 f1 ae ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18254
   2a371:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   2a378:	e9 c3 8f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18500
   2a37d:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   2a384:	48 8b 47 30          	mov    rax,QWORD PTR [rdi+0x30]
   2a388:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18506
   2a38b:	8b 48 04             	mov    ecx,DWORD PTR [rax+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18501
   2a38e:	f6 00 08             	test   BYTE PTR [rax],0x8
   2a391:	0f 85 1e 2a 00 00    	jne    2cdb5 <JS_CallInternal+0xa215>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18506
   2a397:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18505
   2a39e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18506
   2a3a5:	48 83 ec 08          	sub    rsp,0x8
   2a3a9:	41 83 ed 37          	sub    r13d,0x37
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18505
   2a3ad:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18506
   2a3b1:	4c 8b 87 80 01 00 00 	mov    r8,QWORD PTR [rdi+0x180]
   2a3b8:	4c 8b 8f 88 01 00 00 	mov    r9,QWORD PTR [rdi+0x188]
   2a3bf:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   2a3c6:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   2a3cd:	41 55                	push   r13
   2a3cf:	e8 2c 2b 00 00       	call   2cf00 <JS_GetPropertyInternal>
   2a3d4:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18510 (discriminator 1)
   2a3d8:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18506
   2a3dc:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18510 (discriminator 1)
   2a3df:	41 5b                	pop    r11
   2a3e1:	41 5d                	pop    r13
   2a3e3:	0f 85 75 98 ff ff    	jne    23c5e <JS_CallInternal+0x10be>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18497
   2a3e9:	4d 89 f4             	mov    r12,r14
   2a3ec:	e9 4f 8f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18981
   2a3f1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a3f8:	48 8d 35 48 31 0a 00 	lea    rsi,[rip+0xa3148]        # cd547 <_IO_stdin_used+0x547>
   2a3ff:	31 c0                	xor    eax,eax
   2a401:	e8 4a 8d 00 00       	call   33150 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18982
   2a406:	e9 35 8f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19108
   2a40b:	48 83 ec 08          	sub    rsp,0x8
   2a40f:	48 8d 4b f0          	lea    rcx,[rbx-0x10]
   2a413:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a419:	51                   	push   rcx
   2a41a:	e9 f0 f4 ff ff       	jmp    2990f <JS_CallInternal+0x6d6f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19966
   2a41f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19967
   2a426:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a42d:	44 89 ea             	mov    edx,r13d
   2a430:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19966
   2a433:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19967
   2a437:	e8 34 af 02 00       	call   55370 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19967 (discriminator 1)
   2a43c:	85 c0                	test   eax,eax
   2a43e:	0f 84 4c c9 ff ff    	je     26d90 <JS_CallInternal+0x41f0>
   2a444:	e9 f7 8e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a449:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   2a450:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2a457:	89 c0                	mov    eax,eax
   2a459:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2a45d:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   2a464:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2a468:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a46b:	83 e8 01             	sub    eax,0x1
   2a46e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a471:	85 c0                	test   eax,eax
   2a473:	0f 8f fb ac ff ff    	jg     25174 <JS_CallInternal+0x25d4>
   2a479:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2a480:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2a487:	e8 94 af fe ff       	call   15420 <JS_FreeAtomStruct>
   2a48c:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   2a493:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   2a49a:	e9 d5 ac ff ff       	jmp    25174 <JS_CallInternal+0x25d4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 34)
   2a49f:	b9 03 00 00 00       	mov    ecx,0x3
   2a4a4:	31 c0                	xor    eax,eax
   2a4a6:	e9 1e 9c ff ff       	jmp    240c9 <JS_CallInternal+0x1529>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   2a4ab:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 34)
   2a4af:	b9 03 00 00 00       	mov    ecx,0x3
   2a4b4:	45 31 ed             	xor    r13d,r13d
   2a4b7:	e9 f0 9c ff ff       	jmp    241ac <JS_CallInternal+0x160c>
async_func_free():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:21041 (discriminator 1)
   2a4bc:	48 89 c6             	mov    rsi,rax
   2a4bf:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   2a4c2:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2a4c8:	83 e8 01             	sub    eax,0x1
   2a4cb:	89 46 ac             	mov    DWORD PTR [rsi-0x54],eax
   2a4ce:	0f 85 d1 c4 ff ff    	jne    269a5 <JS_CallInternal+0x3e05>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:21042
   2a4d4:	80 bf a0 04 00 00 02 	cmp    BYTE PTR [rdi+0x4a0],0x2
   2a4db:	0f 84 c4 c4 ff ff    	je     269a5 <JS_CallInternal+0x3e05>
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17554
   2a4e1:	48 83 ee 50          	sub    rsi,0x50
async_func_free():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17554
   2a4e5:	e8 06 5f ff ff       	call   203f0 <async_func_free.part.0>
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17585
   2a4ea:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   2a4f1:	48 8b 4e 28          	mov    rcx,QWORD PTR [rsi+0x28]
   2a4f5:	4c 01 e9             	add    rcx,r13
   2a4f8:	e9 a8 c4 ff ff       	jmp    269a5 <JS_CallInternal+0x3e05>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18389
   2a4fd:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18372
   2a504:	0f b6 d0             	movzx  edx,al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18389
   2a507:	31 c0                	xor    eax,eax
   2a509:	48 8d 35 0d 30 0a 00 	lea    rsi,[rip+0xa300d]        # cd51d <_IO_stdin_used+0x51d>
   2a510:	e8 3b 8c 00 00       	call   33150 <JS_ThrowInternalError>
   2a515:	e9 26 8e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19094
   2a51a:	4d 89 ec             	mov    r12,r13
   2a51d:	e9 1e 8e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a522:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2a529:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a530:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a537:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a53b:	e8 e0 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a540:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a547:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a54e:	e9 bb 98 ff ff       	jmp    23e0e <JS_CallInternal+0x126e>
   2a553:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a55a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a561:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a568:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a56c:	e8 af 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a571:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a578:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a57f:	e9 a7 98 ff ff       	jmp    23e2b <JS_CallInternal+0x128b>
   2a584:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a58b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a58f:	e8 8c 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a594:	e9 36 bf ff ff       	jmp    264cf <JS_CallInternal+0x392f>
   2a599:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5a0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5a4:	e8 77 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a5a9:	e9 21 ec ff ff       	jmp    291cf <JS_CallInternal+0x662f>
   2a5ae:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   2a5b4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5bb:	48 89 ce             	mov    rsi,rcx
   2a5be:	4c 89 f2             	mov    rdx,r14
   2a5c1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5c5:	e8 56 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a5ca:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2a5d1:	e9 e1 ab ff ff       	jmp    251b7 <JS_CallInternal+0x2617>
   2a5d6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5dd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5e1:	e8 3a 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a5e6:	e9 5e cb ff ff       	jmp    27149 <JS_CallInternal+0x45a9>
   2a5eb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5f2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5f6:	e8 25 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a5fb:	e9 ca cb ff ff       	jmp    271ca <JS_CallInternal+0x462a>
   2a600:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a607:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a60b:	e8 10 23 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a610:	e9 d3 cb ff ff       	jmp    271e8 <JS_CallInternal+0x4648>
   2a615:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a61c:	4c 89 f6             	mov    rsi,r14
   2a61f:	4c 89 ea             	mov    rdx,r13
   2a622:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a629:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a630:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a634:	e8 e7 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a639:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a640:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a647:	e9 82 cc ff ff       	jmp    272ce <JS_CallInternal+0x472e>
   2a64c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a653:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a657:	e8 c4 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a65c:	e9 2d e0 ff ff       	jmp    2868e <JS_CallInternal+0x5aee>
   2a661:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a668:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a66c:	e8 af 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a671:	e9 19 df ff ff       	jmp    2858f <JS_CallInternal+0x59ef>
   2a676:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a67d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a681:	e8 9a 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a686:	e9 bc de ff ff       	jmp    28547 <JS_CallInternal+0x59a7>
   2a68b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a692:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a696:	e8 85 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a69b:	e9 e8 e1 ff ff       	jmp    28888 <JS_CallInternal+0x5ce8>
   2a6a0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6a7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6ab:	e8 70 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a6b0:	e9 18 e2 ff ff       	jmp    288cd <JS_CallInternal+0x5d2d>
   2a6b5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6bc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6c0:	e8 5b 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a6c5:	e9 31 e6 ff ff       	jmp    28cfb <JS_CallInternal+0x615b>
   2a6ca:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6d1:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a6d8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6dc:	e8 3f 22 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a6e1:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a6e8:	e9 ac 97 ff ff       	jmp    23e99 <JS_CallInternal+0x12f9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18430
   2a6ed:	4c 8b a5 10 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1f0]
   2a6f4:	e9 47 8c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18540
   2a6f9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18541
   2a700:	8b 4e 04             	mov    ecx,DWORD PTR [rsi+0x4]
   2a703:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   2a70a:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18540
   2a711:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18541
   2a715:	49 8b b5 80 01 00 00 	mov    rsi,QWORD PTR [r13+0x180]
   2a71c:	49 8b 95 88 01 00 00 	mov    rdx,QWORD PTR [r13+0x188]
   2a723:	4c 89 ef             	mov    rdi,r13
   2a726:	e8 b5 3b 04 00       	call   6e2e0 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18542
   2a72b:	85 c0                	test   eax,eax
   2a72d:	0f 88 95 26 00 00    	js     2cdc8 <JS_CallInternal+0xa228>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18544
   2a733:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2a73a:	0f 85 c1 11 00 00    	jne    2b901 <JS_CallInternal+0x8d61>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2882
   2a740:	49 8b 45 10          	mov    rax,QWORD PTR [r13+0x10]
   2a744:	4c 89 ef             	mov    rdi,r13
   2a747:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883
   2a74e:	48 85 c0             	test   rax,rax
   2a751:	0f 84 aa 11 00 00    	je     2b901 <JS_CallInternal+0x8d61>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883 (discriminator 1)
   2a757:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2a75b:	0f 84 a0 11 00 00    	je     2b901 <JS_CallInternal+0x8d61>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18545
   2a761:	41 8b 72 04          	mov    esi,DWORD PTR [r10+0x4]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18526
   2a765:	4d 89 f4             	mov    r12,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18545
   2a768:	e8 23 88 00 00       	call   32f90 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18546
   2a76d:	e9 ce 8b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2a772:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a779:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a780:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a784:	e8 97 21 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a789:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a790:	e9 34 9a ff ff       	jmp    241c9 <JS_CallInternal+0x1629>
   2a795:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a79c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7a0:	e8 7b 21 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a7a5:	e9 49 ea ff ff       	jmp    291f3 <JS_CallInternal+0x6653>
   2a7aa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7b1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7b5:	e8 66 21 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a7ba:	e9 d9 b3 ff ff       	jmp    25b98 <JS_CallInternal+0x2ff8>
   2a7bf:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7c6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7ca:	e8 51 21 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a7cf:	e9 a7 b3 ff ff       	jmp    25b7b <JS_CallInternal+0x2fdb>
   2a7d4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7db:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7df:	e8 3c 21 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a7e4:	e9 ed de ff ff       	jmp    286d6 <JS_CallInternal+0x5b36>
   2a7e9:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7f0:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a7f7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7fb:	e8 20 21 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a800:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a807:	e9 33 be ff ff       	jmp    2663f <JS_CallInternal+0x3a9f>
   2a80c:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2a813:	4c 89 ee             	mov    rsi,r13
   2a816:	4c 89 ca             	mov    rdx,r9
   2a819:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a820:	44 89 85 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r8d
   2a827:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a82b:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a832:	e8 e9 20 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a837:	44 8b 85 28 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1d8]
   2a83e:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2a845:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a84c:	e9 3b b4 ff ff       	jmp    25c8c <JS_CallInternal+0x30ec>
   2a851:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2a858:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a85f:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2a866:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a86a:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a871:	e8 aa 20 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a876:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2a87d:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2a884:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a88b:	e9 20 b4 ff ff       	jmp    25cb0 <JS_CallInternal+0x3110>
   2a890:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a897:	4c 89 ee             	mov    rsi,r13
   2a89a:	4c 89 f2             	mov    rdx,r14
   2a89d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8a4:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a8ab:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8af:	e8 6c 20 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a8b4:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a8bb:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a8c2:	e9 25 ae ff ff       	jmp    256ec <JS_CallInternal+0x2b4c>
   2a8c7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8ce:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8d2:	e8 49 20 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a8d7:	e9 cb ba ff ff       	jmp    263a7 <JS_CallInternal+0x3807>
   2a8dc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8e3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8e7:	e8 34 20 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a8ec:	e9 d3 ba ff ff       	jmp    263c4 <JS_CallInternal+0x3824>
   2a8f1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8f8:	4c 89 c2             	mov    rdx,r8
   2a8fb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8ff:	e8 1c 20 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a904:	e9 47 cf ff ff       	jmp    27850 <JS_CallInternal+0x4cb0>
   2a909:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a910:	4c 89 c2             	mov    rdx,r8
   2a913:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a917:	e8 04 20 ff ff       	call   1c920 <__JS_FreeValueRT>
   2a91c:	e9 8a ce ff ff       	jmp    277ab <JS_CallInternal+0x4c0b>
   2a921:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a928:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a92c:	e8 ef 1f ff ff       	call   1c920 <__JS_FreeValueRT>
   2a931:	e9 bc cf ff ff       	jmp    278f2 <JS_CallInternal+0x4d52>
   2a936:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a93d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a941:	e8 da 1f ff ff       	call   1c920 <__JS_FreeValueRT>
   2a946:	e9 54 cf ff ff       	jmp    2789f <JS_CallInternal+0x4cff>
   2a94b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a952:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2a959:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a95d:	e8 be 1f ff ff       	call   1c920 <__JS_FreeValueRT>
   2a962:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   2a969:	e9 1c ba ff ff       	jmp    2638a <JS_CallInternal+0x37ea>
   2a96e:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
   2a972:	4c 89 c2             	mov    rdx,r8
   2a975:	e8 a6 1f ff ff       	call   1c920 <__JS_FreeValueRT>
   2a97a:	e9 75 a6 ff ff       	jmp    24ff4 <JS_CallInternal+0x2454>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   2a97f:	48 83 ec 08          	sub    rsp,0x8
   2a983:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2a989:	4c 89 ee             	mov    rsi,r13
   2a98c:	4c 89 e2             	mov    rdx,r12
   2a98f:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2a996:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a99d:	6a 00                	push   0x0
   2a99f:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2a9a6:	e8 55 25 00 00       	call   2cf00 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20608 (discriminator 2)
   2a9ab:	5f                   	pop    rdi
   2a9ac:	41 58                	pop    r8
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:782
   2a9ae:	48 89 c1             	mov    rcx,rax
   2a9b1:	48 89 d0             	mov    rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20608 (discriminator 2)
   2a9b4:	83 fa 06             	cmp    edx,0x6
   2a9b7:	0f 85 3e 8c ff ff    	jne    235fb <JS_CallInternal+0xa5b>
   2a9bd:	e9 e4 8c ff ff       	jmp    236a6 <JS_CallInternal+0xb06>
   2a9c2:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2a9c9:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9d0:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2a9d7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9db:	e8 40 1f ff ff       	call   1c920 <__JS_FreeValueRT>
   2a9e0:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2a9e7:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2a9ee:	e9 0a bd ff ff       	jmp    266fd <JS_CallInternal+0x3b5d>
   2a9f3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9fa:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9fe:	e8 1d 1f ff ff       	call   1c920 <__JS_FreeValueRT>
   2aa03:	e9 7a cf ff ff       	jmp    27982 <JS_CallInternal+0x4de2>
   2aa08:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa0f:	4c 89 c6             	mov    rsi,r8
   2aa12:	48 89 ca             	mov    rdx,rcx
   2aa15:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa19:	e8 02 1f ff ff       	call   1c920 <__JS_FreeValueRT>
   2aa1e:	e9 3e c1 ff ff       	jmp    26b61 <JS_CallInternal+0x3fc1>
   2aa23:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa2a:	4c 89 ee             	mov    rsi,r13
   2aa2d:	4c 89 f2             	mov    rdx,r14
   2aa30:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa34:	e8 e7 1e ff ff       	call   1c920 <__JS_FreeValueRT>
   2aa39:	e9 83 b5 ff ff       	jmp    25fc1 <JS_CallInternal+0x3421>
   2aa3e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa45:	4c 89 f2             	mov    rdx,r14
   2aa48:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2aa4f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa53:	e8 c8 1e ff ff       	call   1c920 <__JS_FreeValueRT>
   2aa58:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2aa5f:	e9 84 9a ff ff       	jmp    244e8 <JS_CallInternal+0x1948>
   2aa64:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa6b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa6f:	e8 ac 1e ff ff       	call   1c920 <__JS_FreeValueRT>
   2aa74:	e9 86 99 ff ff       	jmp    243ff <JS_CallInternal+0x185f>
   2aa79:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa80:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2aa87:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2aa8e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa92:	e8 89 1e ff ff       	call   1c920 <__JS_FreeValueRT>
   2aa97:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2aa9e:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2aaa5:	e9 b9 94 ff ff       	jmp    23f63 <JS_CallInternal+0x13c3>
   2aaaa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aab1:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2aab8:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2aabf:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aac3:	e8 58 1e ff ff       	call   1c920 <__JS_FreeValueRT>
   2aac8:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2aacf:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2aad6:	e9 4d 94 ff ff       	jmp    23f28 <JS_CallInternal+0x1388>
   2aadb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aae2:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2aae9:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2aaf0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aaf4:	e8 27 1e ff ff       	call   1c920 <__JS_FreeValueRT>
   2aaf9:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2ab00:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2ab07:	e9 39 94 ff ff       	jmp    23f45 <JS_CallInternal+0x13a5>
   2ab0c:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   2ab12:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab19:	4c 89 ce             	mov    rsi,r9
   2ab1c:	4c 89 ea             	mov    rdx,r13
   2ab1f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab23:	e8 f8 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2ab28:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2ab2f:	e9 5f a6 ff ff       	jmp    25193 <JS_CallInternal+0x25f3>
   2ab34:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab3b:	48 89 ca             	mov    rdx,rcx
   2ab3e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab42:	e8 d9 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2ab47:	e9 75 c0 ff ff       	jmp    26bc1 <JS_CallInternal+0x4021>
   2ab4c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab53:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2ab5a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab5e:	e8 bd 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2ab63:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2ab6a:	e9 cc 97 ff ff       	jmp    2433b <JS_CallInternal+0x179b>
   2ab6f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab76:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab7a:	e8 a1 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2ab7f:	e9 a2 cf ff ff       	jmp    27b26 <JS_CallInternal+0x4f86>
   2ab84:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab8b:	4c 89 c2             	mov    rdx,r8
   2ab8e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab92:	e8 89 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2ab97:	e9 38 cf ff ff       	jmp    27ad4 <JS_CallInternal+0x4f34>
   2ab9c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aba3:	48 89 ca             	mov    rdx,rcx
   2aba6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abaa:	e8 71 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2abaf:	e9 0d d0 ff ff       	jmp    27bc1 <JS_CallInternal+0x5021>
   2abb4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abbb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abbf:	e8 5c 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2abc4:	e9 88 d0 ff ff       	jmp    27c51 <JS_CallInternal+0x50b1>
   2abc9:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abd0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abd4:	e8 47 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2abd9:	e9 2b d0 ff ff       	jmp    27c09 <JS_CallInternal+0x5069>
   2abde:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abe5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abe9:	e8 32 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2abee:	e9 a6 d0 ff ff       	jmp    27c99 <JS_CallInternal+0x50f9>
   2abf3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abfa:	48 89 ca             	mov    rdx,rcx
   2abfd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac01:	e8 1a 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2ac06:	e9 2a d8 ff ff       	jmp    28435 <JS_CallInternal+0x5895>
   2ac0b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac12:	48 89 ca             	mov    rdx,rcx
   2ac15:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac19:	e8 02 1d ff ff       	call   1c920 <__JS_FreeValueRT>
   2ac1e:	e9 be d7 ff ff       	jmp    283e1 <JS_CallInternal+0x5841>
   2ac23:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac2a:	48 89 ca             	mov    rdx,rcx
   2ac2d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac31:	e8 ea 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2ac36:	e9 52 d7 ff ff       	jmp    2838d <JS_CallInternal+0x57ed>
   2ac3b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac42:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac46:	e8 d5 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2ac4b:	e9 af d5 ff ff       	jmp    281ff <JS_CallInternal+0x565f>
   2ac50:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac57:	48 89 ca             	mov    rdx,rcx
   2ac5a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac5e:	e8 bd 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2ac63:	e9 8e d6 ff ff       	jmp    282f6 <JS_CallInternal+0x5756>
   2ac68:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac6f:	48 89 ca             	mov    rdx,rcx
   2ac72:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac76:	e8 a5 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2ac7b:	e9 c1 d0 ff ff       	jmp    27d41 <JS_CallInternal+0x51a1>
   2ac80:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac87:	48 89 ca             	mov    rdx,rcx
   2ac8a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac8e:	e8 8d 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2ac93:	e9 55 d0 ff ff       	jmp    27ced <JS_CallInternal+0x514d>
   2ac98:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac9f:	48 89 ca             	mov    rdx,rcx
   2aca2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aca6:	e8 75 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2acab:	e9 e5 d0 ff ff       	jmp    27d95 <JS_CallInternal+0x51f5>
   2acb0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2acb7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2acbb:	e8 60 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2acc0:	e9 1d d3 ff ff       	jmp    27fe2 <JS_CallInternal+0x5442>
   2acc5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2accc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2acd0:	e8 4b 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2acd5:	e9 ba d2 ff ff       	jmp    27f94 <JS_CallInternal+0x53f4>
   2acda:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ace1:	4c 89 c2             	mov    rdx,r8
   2ace4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ace8:	e8 33 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2aced:	e9 54 d2 ff ff       	jmp    27f46 <JS_CallInternal+0x53a6>
   2acf2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2acf9:	4c 89 c2             	mov    rdx,r8
   2acfc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad00:	e8 1b 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2ad05:	e9 e2 d1 ff ff       	jmp    27eec <JS_CallInternal+0x534c>
   2ad0a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad11:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad15:	e8 06 1c ff ff       	call   1c920 <__JS_FreeValueRT>
   2ad1a:	e9 11 d3 ff ff       	jmp    28030 <JS_CallInternal+0x5490>
   2ad1f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad26:	48 89 ca             	mov    rdx,rcx
   2ad29:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad2d:	e8 ee 1b ff ff       	call   1c920 <__JS_FreeValueRT>
   2ad32:	e9 1e d4 ff ff       	jmp    28155 <JS_CallInternal+0x55b5>
   2ad37:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad3e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad42:	e8 d9 1b ff ff       	call   1c920 <__JS_FreeValueRT>
   2ad47:	e9 59 d4 ff ff       	jmp    281a5 <JS_CallInternal+0x5605>
   2ad4c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad53:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad57:	e8 c4 1b ff ff       	call   1c920 <__JS_FreeValueRT>
   2ad5c:	e9 34 d3 ff ff       	jmp    28095 <JS_CallInternal+0x54f5>
   2ad61:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad68:	4c 89 c2             	mov    rdx,r8
   2ad6b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad6f:	e8 ac 1b ff ff       	call   1c920 <__JS_FreeValueRT>
   2ad74:	e9 18 d1 ff ff       	jmp    27e91 <JS_CallInternal+0x52f1>
   2ad79:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad80:	4c 89 c2             	mov    rdx,r8
   2ad83:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad87:	e8 94 1b ff ff       	call   1c920 <__JS_FreeValueRT>
   2ad8c:	e9 a5 d0 ff ff       	jmp    27e36 <JS_CallInternal+0x5296>
   2ad91:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad98:	4c 89 ee             	mov    rsi,r13
   2ad9b:	4c 89 f2             	mov    rdx,r14
   2ad9e:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2ada5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ada9:	e8 72 1b ff ff       	call   1c920 <__JS_FreeValueRT>
   2adae:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2adb5:	e9 da a1 ff ff       	jmp    24f94 <JS_CallInternal+0x23f4>
   2adba:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2adc1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2adc5:	e8 56 1b ff ff       	call   1c920 <__JS_FreeValueRT>
   2adca:	e9 08 ab ff ff       	jmp    258d7 <JS_CallInternal+0x2d37>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 2)
   2adcf:	41 83 f8 08          	cmp    r8d,0x8
   2add3:	0f 84 43 18 00 00    	je     2c61c <JS_CallInternal+0x9a7c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 8)
   2add9:	41 83 f8 ff          	cmp    r8d,0xffffffff
   2addd:	0f 84 f3 17 00 00    	je     2c5d6 <JS_CallInternal+0x9a36>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 14)
   2ade3:	41 8d 48 fe          	lea    ecx,[r8-0x2]
   2ade7:	83 f9 01             	cmp    ecx,0x1
   2adea:	0f 86 9d 1f 00 00    	jbe    2cd8d <JS_CallInternal+0xa1ed>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 21)
   2adf0:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2adf4:	0f 85 9e 17 00 00    	jne    2c598 <JS_CallInternal+0x99f8>
   2adfa:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2adfe:	0f 85 94 17 00 00    	jne    2c598 <JS_CallInternal+0x99f8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 23)
   2ae04:	4c 89 ee             	mov    rsi,r13
   2ae07:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2ae0e:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2ae15:	e8 76 d0 fe ff       	call   17e90 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 1)
   2ae1a:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2ae21:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 23)
   2ae28:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 1)
   2ae2e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae35:	e8 46 1c ff ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 2)
   2ae3a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae41:	4c 89 ee             	mov    rsi,r13
   2ae44:	4c 89 f2             	mov    rdx,r14
   2ae47:	e8 34 1c ff ff       	call   1ca80 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2ae4c:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2ae52:	85 c0                	test   eax,eax
   2ae54:	0f 95 c0             	setne  al
   2ae57:	0f b6 c0             	movzx  eax,al
   2ae5a:	e9 03 a4 ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2ae5f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ae66:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ae6a:	e8 b1 1a ff ff       	call   1c920 <__JS_FreeValueRT>
   2ae6f:	e9 7a 9e ff ff       	jmp    24cee <JS_CallInternal+0x214e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 10)
   2ae74:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   2ae78:	e9 73 e4 ff ff       	jmp    292f0 <JS_CallInternal+0x6750>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19696
   2ae7d:	4c 89 f3             	mov    rbx,r14
   2ae80:	e9 bb 84 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2ae85:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
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
   2aee2:	e9 de b1 ff ff       	jmp    260c5 <JS_CallInternal+0x3525>
   2aee7:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2aeee:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aef5:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2aefc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2af00:	e8 1b 1a ff ff       	call   1c920 <__JS_FreeValueRT>
   2af05:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2af0c:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2af13:	e9 ca b1 ff ff       	jmp    260e2 <JS_CallInternal+0x3542>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19256
   2af18:	4d 89 ec             	mov    r12,r13
   2af1b:	e9 20 84 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19310
   2af20:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19306
   2af23:	4d 89 ec             	mov    r12,r13
   2af26:	e9 15 84 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19737
   2af2b:	66 0f ef c0          	pxor   xmm0,xmm0
   2af2f:	b8 08 00 00 00       	mov    eax,0x8
   2af34:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
   2af39:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2af3e:	e9 20 b0 ff ff       	jmp    25f63 <JS_CallInternal+0x33c3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19742
   2af43:	41 83 fb 08          	cmp    r11d,0x8
   2af47:	0f 84 e8 18 00 00    	je     2c835 <JS_CallInternal+0x9c95>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19742 (discriminator 1)
   2af4d:	83 ff 08             	cmp    edi,0x8
   2af50:	0f 84 39 10 00 00    	je     2bf8f <JS_CallInternal+0x93ef>
JS_IsString():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:653
   2af56:	83 c6 07             	add    esi,0x7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19761 (discriminator 1)
   2af59:	83 fe 01             	cmp    esi,0x1
   2af5c:	0f 86 41 18 00 00    	jbe    2c7a3 <JS_CallInternal+0x9c03>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19768
   2af62:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19769
   2af69:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2af70:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19768
   2af73:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19769
   2af77:	e8 24 b8 02 00       	call   567a0 <js_add_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19769 (discriminator 1)
   2af7c:	85 c0                	test   eax,eax
   2af7e:	0f 85 bc 83 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19771
   2af84:	48 83 eb 10          	sub    rbx,0x10
   2af88:	e9 de af ff ff       	jmp    25f6b <JS_CallInternal+0x33cb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19321
   2af8d:	4d 89 ec             	mov    r12,r13
   2af90:	e9 ab 83 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17945 (discriminator 1)
   2af95:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17945
   2af98:	4d 89 ec             	mov    r12,r13
   2af9b:	e9 a0 83 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7871
   2afa0:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 1)
   2afa7:	48 8d 15 fd 24 0a 00 	lea    rdx,[rip+0xa24fd]        # cd4ab <_IO_stdin_used+0x4ab>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7871
   2afae:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2afb2:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860
   2afb6:	85 c0                	test   eax,eax
   2afb8:	0f 85 5a 12 00 00    	jne    2c218 <JS_CallInternal+0x9678>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   2afbe:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2afc5:	48 8d 35 3b 25 0a 00 	lea    rsi,[rip+0xa253b]        # cd507 <_IO_stdin_used+0x507>
   2afcc:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18690
   2afce:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   2afd1:	e8 8a 7e 00 00       	call   32e60 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18694
   2afd6:	e9 65 83 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7871
   2afdb:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 1)
   2afe2:	48 8d 15 c2 24 0a 00 	lea    rdx,[rip+0xa24c2]        # cd4ab <_IO_stdin_used+0x4ab>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7871
   2afe9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2afed:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860
   2aff1:	85 c0                	test   eax,eax
   2aff3:	0f 85 68 18 00 00    	jne    2c861 <JS_CallInternal+0x9cc1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   2aff9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b000:	48 8d 35 00 25 0a 00 	lea    rsi,[rip+0xa2500]        # cd507 <_IO_stdin_used+0x507>
   2b007:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18704
   2b009:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   2b00c:	e8 4f 7e 00 00       	call   32e60 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18707
   2b011:	e9 2a 83 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18740
   2b016:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b01d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18737 (discriminator 1)
   2b024:	0f b7 d1             	movzx  edx,cx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18740
   2b027:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18738
   2b029:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18740
   2b02c:	e8 bf 7f 00 00       	call   32ff0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18741
   2b031:	e9 0a 83 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 2)
   2b036:	41 83 fd 08          	cmp    r13d,0x8
   2b03a:	0f 84 e2 12 00 00    	je     2c322 <JS_CallInternal+0x9782>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 9)
   2b040:	41 83 fd ff          	cmp    r13d,0xffffffff
   2b044:	0f 84 a7 12 00 00    	je     2c2f1 <JS_CallInternal+0x9751>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 16)
   2b04a:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2b04e:	83 f9 01             	cmp    ecx,0x1
   2b051:	0f 86 5c 12 00 00    	jbe    2c2b3 <JS_CallInternal+0x9713>
   2b057:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2b05e:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 23)
   2b065:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2b069:	0f 85 3d f1 ff ff    	jne    2a1ac <JS_CallInternal+0x760c>
   2b06f:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2b073:	0f 85 33 f1 ff ff    	jne    2a1ac <JS_CallInternal+0x760c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 29)
   2b079:	e8 12 ce fe ff       	call   17e90 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 1)
   2b07e:	4c 89 f6             	mov    rsi,r14
   2b081:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2b088:	4c 89 ea             	mov    rdx,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 29)
   2b08b:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 1)
   2b091:	4c 89 f7             	mov    rdi,r14
   2b094:	e8 e7 19 ff ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 2)
   2b099:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b0a0:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2b0a7:	4c 89 f7             	mov    rdi,r14
   2b0aa:	e8 d1 19 ff ff       	call   1ca80 <JS_FreeValue>
   2b0af:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2b0b5:	e9 fe a2 ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   2b0ba:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b0c1:	e8 0a 82 00 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18860 (discriminator 2)
   2b0c6:	85 c0                	test   eax,eax
   2b0c8:	0f 84 bf bb ff ff    	je     26c8d <JS_CallInternal+0x40ed>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18859 (discriminator 1)
   2b0ce:	4d 89 ec             	mov    r12,r13
   2b0d1:	e9 6a 82 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b0d6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b0dd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b0e1:	e8 3a 18 ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19296
   2b0e6:	e9 89 e1 ff ff       	jmp    29274 <JS_CallInternal+0x66d4>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 10)
   2b0eb:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   2b0ee:	e9 b3 e2 ff ff       	jmp    293a6 <JS_CallInternal+0x6806>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b0f3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b0fa:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b101:	48 89 ce             	mov    rsi,rcx
   2b104:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b10b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b10f:	e8 0c 18 ff ff       	call   1c920 <__JS_FreeValueRT>
   2b114:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b11b:	e9 5b 9e ff ff       	jmp    24f7b <JS_CallInternal+0x23db>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 2)
   2b120:	83 fe 08             	cmp    esi,0x8
   2b123:	0f 84 28 14 00 00    	je     2c551 <JS_CallInternal+0x99b1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 8)
   2b129:	85 f6                	test   esi,esi
   2b12b:	75 09                	jne    2b136 <JS_CallInternal+0x8596>
   2b12d:	83 f9 08             	cmp    ecx,0x8
   2b130:	0f 84 53 14 00 00    	je     2c589 <JS_CallInternal+0x99e9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 20)
   2b136:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b13d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b144:	44 89 ea             	mov    edx,r13d
   2b147:	48 89 de             	mov    rsi,rbx
   2b14a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b14e:	e8 7d f9 02 00       	call   5aad0 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 1)
   2b153:	85 c0                	test   eax,eax
   2b155:	0f 85 e5 81 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 22)
   2b15b:	48 83 eb 10          	sub    rbx,0x10
   2b15f:	e9 57 a3 ff ff       	jmp    254bb <JS_CallInternal+0x291b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20253
   2b164:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20254
   2b16b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b172:	44 89 ea             	mov    edx,r13d
   2b175:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20253
   2b178:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20254
   2b17c:	e8 9f aa 02 00       	call   55c20 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20254 (discriminator 1)
   2b181:	85 c0                	test   eax,eax
   2b183:	0f 85 b7 81 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20256
   2b189:	48 83 eb 10          	sub    rbx,0x10
   2b18d:	e9 ae a3 ff ff       	jmp    25540 <JS_CallInternal+0x29a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19647 (discriminator 1)
   2b192:	0f 85 8b 1c 00 00    	jne    2ce23 <JS_CallInternal+0xa283>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2882
   2b198:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b19f:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2b1a3:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883
   2b1aa:	48 85 c0             	test   rax,rax
   2b1ad:	0f 84 a2 a6 ff ff    	je     25855 <JS_CallInternal+0x2cb5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883 (discriminator 1)
   2b1b3:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2b1b7:	0f 84 98 a6 ff ff    	je     25855 <JS_CallInternal+0x2cb5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19652
   2b1bd:	44 89 ee             	mov    esi,r13d
   2b1c0:	e8 cb 7d 00 00       	call   32f90 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2b1c5:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b1cc:	0f 8e 6e 81 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2b1d2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b1d9:	44 89 ee             	mov    esi,r13d
   2b1dc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b1e0:	e8 0b e3 fe ff       	call   194f0 <JS_FreeAtom.part.0.isra.0>
   2b1e5:	e9 56 81 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2b1ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 2)
   2b1f0:	41 83 fd 08          	cmp    r13d,0x8
   2b1f4:	0f 84 d4 18 00 00    	je     2cace <JS_CallInternal+0x9f2e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 9)
   2b1fa:	41 83 fd ff          	cmp    r13d,0xffffffff
   2b1fe:	0f 84 45 18 00 00    	je     2ca49 <JS_CallInternal+0x9ea9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 16)
   2b204:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2b208:	83 f9 01             	cmp    ecx,0x1
   2b20b:	0f 86 35 11 00 00    	jbe    2c346 <JS_CallInternal+0x97a6>
   2b211:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2b218:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 23)
   2b21f:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2b223:	0f 85 b7 ee ff ff    	jne    2a0e0 <JS_CallInternal+0x7540>
   2b229:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2b22d:	0f 85 ad ee ff ff    	jne    2a0e0 <JS_CallInternal+0x7540>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 29)
   2b233:	e8 58 cc fe ff       	call   17e90 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 1)
   2b238:	4c 89 f6             	mov    rsi,r14
   2b23b:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2b242:	4c 89 ea             	mov    rdx,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 29)
   2b245:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 1)
   2b24b:	4c 89 f7             	mov    rdi,r14
   2b24e:	e8 2d 18 ff ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 2)
   2b253:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b25a:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2b261:	4c 89 f7             	mov    rdi,r14
   2b264:	e8 17 18 ff ff       	call   1ca80 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2b269:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2b26f:	85 c0                	test   eax,eax
   2b271:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2b274:	e9 9f a1 ff ff       	jmp    25418 <JS_CallInternal+0x2878>
   2b279:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7847
   2b280:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b287:	48 8d 35 e3 22 0a 00 	lea    rsi,[rip+0xa22e3]        # cd571 <_IO_stdin_used+0x571>
   2b28e:	31 c0                	xor    eax,eax
   2b290:	e8 db 5a 00 00       	call   30d70 <JS_ThrowTypeError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2b295:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   2b29c:	76 13                	jbe    2b2b1 <JS_CallInternal+0x8711>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2b29e:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b2a2:	83 e8 01             	sub    eax,0x1
   2b2a5:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b2a9:	85 c0                	test   eax,eax
   2b2ab:	0f 8e 30 14 00 00    	jle    2c6e1 <JS_CallInternal+0x9b41>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8486
   2b2b1:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   2b2b7:	e9 a2 a8 ff ff       	jmp    25b5e <JS_CallInternal+0x2fbe>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18791
   2b2bc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b2c3:	48 8d 35 2e 5b 0a 00 	lea    rsi,[rip+0xa5b2e]        # d0df8 <_IO_stdin_used+0x3df8>
   2b2ca:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18789
   2b2cc:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18791
   2b2cf:	e8 8c 7b 00 00       	call   32e60 <JS_ThrowReferenceError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18792
   2b2d4:	e9 67 80 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   2b2d9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b2e0:	e8 eb 7f 00 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18865 (discriminator 2)
   2b2e5:	85 c0                	test   eax,eax
   2b2e7:	0f 84 60 b9 ff ff    	je     26c4d <JS_CallInternal+0x40ad>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18864
   2b2ed:	4d 89 ec             	mov    r12,r13
   2b2f0:	e9 4b 80 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18766
   2b2f5:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b2fc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b303:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18764
   2b305:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18766
   2b308:	e8 e3 7c 00 00       	call   32ff0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18767
   2b30d:	e9 2e 80 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   2b312:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b319:	e8 b2 7f 00 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18885 (discriminator 2)
   2b31e:	85 c0                	test   eax,eax
   2b320:	0f 84 17 b6 ff ff    	je     2693d <JS_CallInternal+0x3d9d>
   2b326:	4d 89 ec             	mov    r12,r13
   2b329:	e9 12 80 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   2b32e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b335:	e8 96 7f 00 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18854 (discriminator 2)
   2b33a:	85 c0                	test   eax,eax
   2b33c:	0f 84 05 b4 ff ff    	je     26747 <JS_CallInternal+0x3ba7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18853 (discriminator 1)
   2b342:	4d 89 ec             	mov    r12,r13
   2b345:	e9 f6 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19066
   2b34a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b351:	31 c0                	xor    eax,eax
   2b353:	48 8d 35 ff 21 0a 00 	lea    rsi,[rip+0xa21ff]        # cd559 <_IO_stdin_used+0x559>
   2b35a:	e8 f1 7d 00 00       	call   33150 <JS_ThrowInternalError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2b35f:	83 fb f6             	cmp    ebx,0xfffffff6
   2b362:	76 13                	jbe    2b377 <JS_CallInternal+0x87d7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2b364:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b368:	83 e8 01             	sub    eax,0x1
   2b36b:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b36f:	85 c0                	test   eax,eax
   2b371:	0f 8e 89 13 00 00    	jle    2c700 <JS_CallInternal+0x9b60>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19068 (discriminator 1)
   2b377:	4c 89 f3             	mov    rbx,r14
   2b37a:	e9 c1 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18399
   2b37f:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   2b386:	e9 b5 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18199
   2b38b:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18198
   2b38e:	4d 89 ec             	mov    r12,r13
   2b391:	e9 aa 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   2b396:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b39d:	e8 2e 7f 00 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18947 (discriminator 2)
   2b3a2:	85 c0                	test   eax,eax
   2b3a4:	0f 84 a0 b6 ff ff    	je     26a4a <JS_CallInternal+0x3eaa>
   2b3aa:	4d 89 ec             	mov    r12,r13
   2b3ad:	e9 8e 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   2b3b2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b3b9:	e8 12 7f 00 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18927 (discriminator 2)
   2b3be:	85 c0                	test   eax,eax
   2b3c0:	0f 84 eb b6 ff ff    	je     26ab1 <JS_CallInternal+0x3f11>
   2b3c6:	4d 89 ec             	mov    r12,r13
   2b3c9:	e9 72 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20199
   2b3ce:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20200
   2b3d5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b3dc:	44 89 ea             	mov    edx,r13d
   2b3df:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20199
   2b3e2:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20200
   2b3e6:	e8 35 a8 02 00       	call   55c20 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20200 (discriminator 1)
   2b3eb:	85 c0                	test   eax,eax
   2b3ed:	0f 85 4d 7f ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20202
   2b3f3:	48 83 eb 10          	sub    rbx,0x10
   2b3f7:	e9 56 ba ff ff       	jmp    26e52 <JS_CallInternal+0x42b2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18779
   2b3fc:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b403:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b40a:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18777
   2b40c:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18779
   2b40f:	e8 dc 7b 00 00       	call   32ff0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18780
   2b414:	e9 27 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7910
   2b419:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b420:	e8 ab 7e 00 00       	call   332d0 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18906 (discriminator 2)
   2b425:	85 c0                	test   eax,eax
   2b427:	0f 84 aa b4 ff ff    	je     268d7 <JS_CallInternal+0x3d37>
   2b42d:	4d 89 ec             	mov    r12,r13
   2b430:	e9 0b 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18236
   2b435:	4d 89 d4             	mov    r12,r10
   2b438:	e9 03 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20179
   2b43d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20180
   2b444:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b44b:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20179
   2b44e:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20180
   2b452:	e8 f9 a5 02 00       	call   55a50 <js_shr_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20180 (discriminator 1)
   2b457:	85 c0                	test   eax,eax
   2b459:	0f 85 e1 7e ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20182
   2b45f:	48 83 eb 10          	sub    rbx,0x10
   2b463:	e9 70 b9 ff ff       	jmp    26dd8 <JS_CallInternal+0x4238>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18283
   2b468:	4d 89 d4             	mov    r12,r10
   2b46b:	e9 d0 7e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b470:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b477:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b47e:	4c 89 f6             	mov    rsi,r14
   2b481:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b488:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b48c:	e8 8f 14 ff ff       	call   1c920 <__JS_FreeValueRT>
   2b491:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b498:	e9 95 9e ff ff       	jmp    25332 <JS_CallInternal+0x2792>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 2)
   2b49d:	41 83 f9 08          	cmp    r9d,0x8
   2b4a1:	0f 84 74 15 00 00    	je     2ca1b <JS_CallInternal+0x9e7b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 8)
   2b4a7:	41 83 f9 ff          	cmp    r9d,0xffffffff
   2b4ab:	0f 84 20 15 00 00    	je     2c9d1 <JS_CallInternal+0x9e31>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 14)
   2b4b1:	41 8d 41 fe          	lea    eax,[r9-0x2]
   2b4b5:	83 f8 01             	cmp    eax,0x1
   2b4b8:	0f 86 8a 16 00 00    	jbe    2cb48 <JS_CallInternal+0x9fa8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 21)
   2b4be:	41 83 f9 f9          	cmp    r9d,0xfffffff9
   2b4c2:	0f 85 ce 14 00 00    	jne    2c996 <JS_CallInternal+0x9df6>
   2b4c8:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2b4cc:	0f 85 c4 14 00 00    	jne    2c996 <JS_CallInternal+0x9df6>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 23)
   2b4d2:	4c 89 ee             	mov    rsi,r13
   2b4d5:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2b4dc:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2b4e3:	e8 a8 c9 fe ff       	call   17e90 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   2b4e8:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b4ef:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 23)
   2b4f6:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   2b4fc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b503:	4c 89 ca             	mov    rdx,r9
   2b506:	e8 75 15 ff ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 2)
   2b50b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b512:	4c 89 ee             	mov    rsi,r13
   2b515:	4c 89 f2             	mov    rdx,r14
   2b518:	e8 63 15 ff ff       	call   1ca80 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2b51d:	31 c0                	xor    eax,eax
   2b51f:	83 bd 50 fe ff ff 01 	cmp    DWORD PTR [rbp-0x1b0],0x1
   2b526:	0f 95 c0             	setne  al
   2b529:	e9 e0 9c ff ff       	jmp    2520e <JS_CallInternal+0x266e>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2b52e:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b532:	83 e8 01             	sub    eax,0x1
   2b535:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b539:	85 c0                	test   eax,eax
   2b53b:	0f 8f e7 ed ff ff    	jg     2a328 <JS_CallInternal+0x7788>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b541:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b548:	4c 89 ee             	mov    rsi,r13
   2b54b:	4c 89 f2             	mov    rdx,r14
   2b54e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b552:	e8 c9 13 ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   2b557:	e9 cc ed ff ff       	jmp    2a328 <JS_CallInternal+0x7788>
   2b55c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b563:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b567:	e9 33 dc ff ff       	jmp    2919f <JS_CallInternal+0x65ff>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20217
   2b56c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20218
   2b573:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b57a:	44 89 ea             	mov    edx,r13d
   2b57d:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20217
   2b580:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20218
   2b584:	e8 97 a6 02 00       	call   55c20 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20218 (discriminator 1)
   2b589:	85 c0                	test   eax,eax
   2b58b:	0f 85 af 7d ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20220
   2b591:	48 83 eb 10          	sub    rbx,0x10
   2b595:	e9 68 a0 ff ff       	jmp    25602 <JS_CallInternal+0x2a62>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9669 (discriminator 1)
   2b59a:	44 8b 95 50 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1b0]
   2b5a1:	45 85 d2             	test   r10d,r10d
   2b5a4:	74 3d                	je     2b5e3 <JS_CallInternal+0x8a43>
   2b5a6:	4c 8b a5 e8 fe ff ff 	mov    r12,QWORD PTR [rbp-0x118]
   2b5ad:	4c 89 eb             	mov    rbx,r13
   2b5b0:	4d 01 ee             	add    r14,r13
   2b5b3:	eb 09                	jmp    2b5be <JS_CallInternal+0x8a1e>
   2b5b5:	48 83 c3 10          	add    rbx,0x10
   2b5b9:	4c 39 f3             	cmp    rbx,r14
   2b5bc:	74 25                	je     2b5e3 <JS_CallInternal+0x8a43>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9670
   2b5be:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2b5c2:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2b5c5:	83 fa f6             	cmp    edx,0xfffffff6
   2b5c8:	76 eb                	jbe    2b5b5 <JS_CallInternal+0x8a15>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2b5ca:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2b5cd:	83 e8 01             	sub    eax,0x1
   2b5d0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2b5d3:	85 c0                	test   eax,eax
   2b5d5:	7f de                	jg     2b5b5 <JS_CallInternal+0x8a15>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b5d7:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2b5dc:	e8 3f 13 ff ff       	call   1c920 <__JS_FreeValueRT>
   2b5e1:	eb d2                	jmp    2b5b5 <JS_CallInternal+0x8a15>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18271
   2b5e3:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18273
   2b5ea:	4c 89 eb             	mov    rbx,r13
   2b5ed:	e9 4e 7d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19875
   2b5f2:	66 0f ef c0          	pxor   xmm0,xmm0
   2b5f6:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19904
   2b5fb:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19905
   2b600:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19904
   2b604:	b8 08 00 00 00       	mov    eax,0x8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19886
   2b609:	e9 25 a8 ff ff       	jmp    25e33 <JS_CallInternal+0x3293>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19885
   2b60e:	83 fe 08             	cmp    esi,0x8
   2b611:	0f 84 a7 10 00 00    	je     2c6be <JS_CallInternal+0x9b1e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19890
   2b617:	85 f6                	test   esi,esi
   2b619:	0f 85 78 86 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
   2b61f:	83 f8 08             	cmp    eax,0x8
   2b622:	0f 85 6f 86 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19891
   2b628:	66 0f ef c9          	pxor   xmm1,xmm1
   2b62c:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19896
   2b630:	66 48 0f 6e c2       	movq   xmm0,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19902
   2b635:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   2b639:	eb c0                	jmp    2b5fb <JS_CallInternal+0x8a5b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19537
   2b63b:	0f 85 b5 17 00 00    	jne    2cdf6 <JS_CallInternal+0xa256>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2882
   2b641:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b648:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b64c:	48 8b 87 f0 04 00 00 	mov    rax,QWORD PTR [rdi+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883
   2b653:	48 85 c0             	test   rax,rax
   2b656:	0f 84 01 08 00 00    	je     2be5d <JS_CallInternal+0x92bd>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883 (discriminator 1)
   2b65c:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2b660:	0f 84 f7 07 00 00    	je     2be5d <JS_CallInternal+0x92bd>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19542
   2b666:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b66d:	44 89 ee             	mov    esi,r13d
   2b670:	e8 1b 79 00 00       	call   32f90 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2b675:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b67c:	0f 8e be 7c ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2b682:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b689:	44 89 ee             	mov    esi,r13d
   2b68c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b690:	e8 5b de fe ff       	call   194f0 <JS_FreeAtom.part.0.isra.0>
   2b695:	e9 a6 7c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2b69a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 2)
   2b6a0:	83 fe 08             	cmp    esi,0x8
   2b6a3:	0f 84 06 0e 00 00    	je     2c4af <JS_CallInternal+0x990f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 8)
   2b6a9:	85 f6                	test   esi,esi
   2b6ab:	75 09                	jne    2b6b6 <JS_CallInternal+0x8b16>
   2b6ad:	83 f9 08             	cmp    ecx,0x8
   2b6b0:	0f 84 31 0e 00 00    	je     2c4e7 <JS_CallInternal+0x9947>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 20)
   2b6b6:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b6bd:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b6c4:	44 89 ea             	mov    edx,r13d
   2b6c7:	48 89 de             	mov    rsi,rbx
   2b6ca:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b6ce:	e8 fd f3 02 00       	call   5aad0 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 1)
   2b6d3:	85 c0                	test   eax,eax
   2b6d5:	0f 85 65 7c ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 22)
   2b6db:	48 83 eb 10          	sub    rbx,0x10
   2b6df:	e9 1f 9e ff ff       	jmp    25503 <JS_CallInternal+0x2963>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 2)
   2b6e4:	83 fe 08             	cmp    esi,0x8
   2b6e7:	0f 84 92 11 00 00    	je     2c87f <JS_CallInternal+0x9cdf>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 8)
   2b6ed:	85 f6                	test   esi,esi
   2b6ef:	75 09                	jne    2b6fa <JS_CallInternal+0x8b5a>
   2b6f1:	83 f9 08             	cmp    ecx,0x8
   2b6f4:	0f 84 bd 11 00 00    	je     2c8b7 <JS_CallInternal+0x9d17>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 20)
   2b6fa:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b701:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b708:	44 89 ea             	mov    edx,r13d
   2b70b:	48 89 de             	mov    rsi,rbx
   2b70e:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b712:	e8 b9 f3 02 00       	call   5aad0 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 1)
   2b717:	85 c0                	test   eax,eax
   2b719:	0f 85 21 7c ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 22)
   2b71f:	48 83 eb 10          	sub    rbx,0x10
   2b723:	e9 60 9e ff ff       	jmp    25588 <JS_CallInternal+0x29e8>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7847
   2b728:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b72f:	48 8d 35 3b 1e 0a 00 	lea    rsi,[rip+0xa1e3b]        # cd571 <_IO_stdin_used+0x571>
   2b736:	31 c0                	xor    eax,eax
   2b738:	e8 33 56 00 00       	call   30d70 <JS_ThrowTypeError>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8419
   2b73d:	e9 ef a2 ff ff       	jmp    25a31 <JS_CallInternal+0x2e91>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7826
   2b742:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b749:	48 8d 35 13 1e 0a 00 	lea    rsi,[rip+0xa1e13]        # cd563 <_IO_stdin_used+0x563>
   2b750:	31 c0                	xor    eax,eax
   2b752:	e8 19 56 00 00       	call   30d70 <JS_ThrowTypeError>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8472
   2b757:	e9 39 fb ff ff       	jmp    2b295 <JS_CallInternal+0x86f5>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b75c:	48 8b bd 38 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1c8]
   2b763:	e8 b8 11 ff ff       	call   1c920 <__JS_FreeValueRT>
   2b768:	e9 ee a3 ff ff       	jmp    25b5b <JS_CallInternal+0x2fbb>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7826
   2b76d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b774:	48 8d 35 e8 1d 0a 00 	lea    rsi,[rip+0xa1de8]        # cd563 <_IO_stdin_used+0x563>
   2b77b:	31 c0                	xor    eax,eax
   2b77d:	e8 ee 55 00 00       	call   30d70 <JS_ThrowTypeError>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8414
   2b782:	e9 aa a2 ff ff       	jmp    25a31 <JS_CallInternal+0x2e91>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17992
   2b787:	4c 89 f3             	mov    rbx,r14
   2b78a:	e9 b1 7b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2882
   2b78f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b796:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2b79a:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883
   2b7a1:	48 85 c0             	test   rax,rax
   2b7a4:	0f 84 72 08 00 00    	je     2c01c <JS_CallInternal+0x947c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883 (discriminator 1)
   2b7aa:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2b7ae:	0f 84 68 08 00 00    	je     2c01c <JS_CallInternal+0x947c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19638
   2b7b4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b7bb:	44 89 ee             	mov    esi,r13d
   2b7be:	e8 cd 77 00 00       	call   32f90 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2b7c3:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b7ca:	0f 8e 70 7b ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2b7d0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b7d7:	44 89 ee             	mov    esi,r13d
   2b7da:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b7de:	e8 0d dd fe ff       	call   194f0 <JS_FreeAtom.part.0.isra.0>
   2b7e3:	e9 58 7b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2b7e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2b7ef:	00 
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b7f0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b7f7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b7fb:	e8 20 11 ff ff       	call   1c920 <__JS_FreeValueRT>
   2b800:	e9 b5 a0 ff ff       	jmp    258ba <JS_CallInternal+0x2d1a>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16721 (discriminator 2)
   2b805:	ba 01 00 00 00       	mov    edx,0x1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16718
   2b80a:	be 03 00 00 00       	mov    esi,0x3
   2b80f:	31 ff                	xor    edi,edi
   2b811:	e9 c5 8e ff ff       	jmp    246db <JS_CallInternal+0x1b3b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19038
   2b816:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b81d:	48 8d 35 fc 55 0a 00 	lea    rsi,[rip+0xa55fc]        # d0e20 <_IO_stdin_used+0x3e20>
   2b824:	31 c0                	xor    eax,eax
   2b826:	e8 45 55 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19039
   2b82b:	e9 10 7b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18459
   2b830:	4c 89 f3             	mov    rbx,r14
   2b833:	e9 08 7b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20235
   2b838:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20236
   2b83f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b846:	44 89 ea             	mov    edx,r13d
   2b849:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20235
   2b84c:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20236
   2b850:	e8 cb a3 02 00       	call   55c20 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20236 (discriminator 1)
   2b855:	85 c0                	test   eax,eax
   2b857:	0f 85 e3 7a ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20238
   2b85d:	48 83 eb 10          	sub    rbx,0x10
   2b861:	e9 5f 9d ff ff       	jmp    255c5 <JS_CallInternal+0x2a25>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20158
   2b866:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20159
   2b86d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b874:	44 89 ea             	mov    edx,r13d
   2b877:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20158
   2b87a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20159
   2b87e:	e8 9d a3 02 00       	call   55c20 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20159 (discriminator 1)
   2b883:	85 c0                	test   eax,eax
   2b885:	0f 85 b5 7a ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20161
   2b88b:	48 83 eb 10          	sub    rbx,0x10
   2b88f:	e9 81 b5 ff ff       	jmp    26e15 <JS_CallInternal+0x4275>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2b894:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b89b:	48 89 ce             	mov    rsi,rcx
   2b89e:	4c 89 ea             	mov    rdx,r13
   2b8a1:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2b8a8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b8ac:	e8 6f 10 ff ff       	call   1c920 <__JS_FreeValueRT>
   2b8b1:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2b8b8:	e9 99 9a ff ff       	jmp    25356 <JS_CallInternal+0x27b6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 2)
   2b8bd:	83 fe 08             	cmp    esi,0x8
   2b8c0:	0f 84 96 0e 00 00    	je     2c75c <JS_CallInternal+0x9bbc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 8)
   2b8c6:	85 f6                	test   esi,esi
   2b8c8:	75 09                	jne    2b8d3 <JS_CallInternal+0x8d33>
   2b8ca:	83 f9 08             	cmp    ecx,0x8
   2b8cd:	0f 84 c1 0e 00 00    	je     2c794 <JS_CallInternal+0x9bf4>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 20)
   2b8d3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b8da:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b8e1:	44 89 ea             	mov    edx,r13d
   2b8e4:	48 89 de             	mov    rsi,rbx
   2b8e7:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b8eb:	e8 e0 f1 02 00       	call   5aad0 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 1)
   2b8f0:	85 c0                	test   eax,eax
   2b8f2:	0f 85 48 7a ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 22)
   2b8f8:	48 83 eb 10          	sub    rbx,0x10
   2b8fc:	e9 72 9b ff ff       	jmp    25473 <JS_CallInternal+0x28d3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18548
   2b901:	48 83 ec 08          	sub    rsp,0x8
   2b905:	41 8b 4a 04          	mov    ecx,DWORD PTR [r10+0x4]
   2b909:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2b90d:	48 83 eb 10          	sub    rbx,0x10
   2b911:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b918:	4c 8b 4b 08          	mov    r9,QWORD PTR [rbx+0x8]
   2b91c:	48 8b b0 80 01 00 00 	mov    rsi,QWORD PTR [rax+0x180]
   2b923:	48 8b 90 88 01 00 00 	mov    rdx,QWORD PTR [rax+0x188]
   2b92a:	68 00 80 00 00       	push   0x8000
   2b92f:	48 89 c7             	mov    rdi,rax
   2b932:	ff b0 88 01 00 00    	push   QWORD PTR [rax+0x188]
   2b938:	ff b0 80 01 00 00    	push   QWORD PTR [rax+0x180]
   2b93e:	e8 ed 22 00 00       	call   2dc30 <JS_SetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18551
   2b943:	48 83 c4 20          	add    rsp,0x20
   2b947:	85 c0                	test   eax,eax
   2b949:	0f 89 d7 7e ff ff    	jns    23826 <JS_CallInternal+0xc86>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18526
   2b94f:	4d 89 f4             	mov    r12,r14
   2b952:	e9 e9 79 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2b957:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2b95e:	00 00 
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2b960:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2b967:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2b96b:	44 89 ea             	mov    edx,r13d
   2b96e:	49 8b 7e 10          	mov    rdi,QWORD PTR [r14+0x10]
   2b972:	e8 19 ba fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7853 (discriminator 1)
   2b977:	48 8d 35 20 1c 0a 00 	lea    rsi,[rip+0xa1c20]        # cd59e <_IO_stdin_used+0x59e>
   2b97e:	4c 89 f7             	mov    rdi,r14
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2b981:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7853 (discriminator 1)
   2b984:	31 c0                	xor    eax,eax
   2b986:	e8 d5 74 00 00       	call   32e60 <JS_ThrowReferenceError>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2b98b:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b992:	0f 8e a8 79 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2b998:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b99f:	44 89 ee             	mov    esi,r13d
   2b9a2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b9a6:	e8 45 db fe ff       	call   194f0 <JS_FreeAtom.part.0.isra.0>
   2b9ab:	e9 90 79 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18753
   2b9b0:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b9b7:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18750 (discriminator 1)
   2b9be:	0f b7 d1             	movzx  edx,cx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18753
   2b9c1:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18751
   2b9c3:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18753
   2b9c6:	e8 25 76 00 00       	call   32ff0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18754
   2b9cb:	e9 70 79 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18047
   2b9d0:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18045
   2b9d3:	4d 89 ec             	mov    r12,r13
   2b9d6:	e9 65 79 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7871
   2b9db:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2b9e2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2b9e6:	8b 44 10 04          	mov    eax,DWORD PTR [rax+rdx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 1)
   2b9ea:	48 8d 15 ba 1a 0a 00 	lea    rdx,[rip+0xa1aba]        # cd4ab <_IO_stdin_used+0x4ab>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860
   2b9f1:	85 c0                	test   eax,eax
   2b9f3:	0f 85 fd 0a 00 00    	jne    2c4f6 <JS_CallInternal+0x9956>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   2b9f9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ba00:	48 8d 35 00 1b 0a 00 	lea    rsi,[rip+0xa1b00]        # cd507 <_IO_stdin_used+0x507>
   2ba07:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18717
   2ba09:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7860 (discriminator 2)
   2ba0c:	e8 4f 74 00 00       	call   32e60 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18720
   2ba11:	e9 2a 79 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19789
   2ba16:	66 0f ef c0          	pxor   xmm0,xmm0
   2ba1a:	b8 08 00 00 00       	mov    eax,0x8
   2ba1f:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
   2ba24:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2ba2a:	e9 d0 a4 ff ff       	jmp    25eff <JS_CallInternal+0x335f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19833
   2ba2f:	66 0f ef c0          	pxor   xmm0,xmm0
   2ba33:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   2ba38:	b8 08 00 00 00       	mov    eax,0x8
   2ba3d:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2ba42:	e9 44 a4 ff ff       	jmp    25e8b <JS_CallInternal+0x32eb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19838
   2ba47:	83 fa 08             	cmp    edx,0x8
   2ba4a:	0f 84 c4 0a 00 00    	je     2c514 <JS_CallInternal+0x9974>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19843
   2ba50:	83 f8 08             	cmp    eax,0x8
   2ba53:	0f 85 3e 82 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
   2ba59:	85 d2                	test   edx,edx
   2ba5b:	0f 85 36 82 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19844
   2ba61:	66 0f ef c0          	pxor   xmm0,xmm0
   2ba65:	f2 0f 2a c7          	cvtsi2sd xmm0,edi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19849
   2ba69:	66 48 0f 6e c9       	movq   xmm1,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19855
   2ba6e:	f2 0f 5c c1          	subsd  xmm0,xmm1
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19856
   2ba72:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19839
   2ba76:	b8 08 00 00 00       	mov    eax,0x8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19855
   2ba7b:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19839
   2ba80:	e9 0a a4 ff ff       	jmp    25e8f <JS_CallInternal+0x32ef>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   2ba85:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19794
   2ba89:	83 fa 08             	cmp    edx,0x8
   2ba8c:	0f 84 1e 10 00 00    	je     2cab0 <JS_CallInternal+0x9f10>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19798
   2ba92:	83 fa f9             	cmp    edx,0xfffffff9
   2ba95:	0f 84 43 07 00 00    	je     2c1de <JS_CallInternal+0x963e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19814
   2ba9b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2baa2:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19815
   2baa6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2baaa:	83 fa f6             	cmp    edx,0xfffffff6
   2baad:	0f 87 44 07 00 00    	ja     2c1f7 <JS_CallInternal+0x9657>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19818
   2bab3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2baba:	48 8d b5 70 ff ff ff 	lea    rsi,[rbp-0x90]
   2bac1:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19815
   2bac8:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   2bacf:	48 89 95 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19816
   2bad6:	4c 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],r8
   2badd:	4c 89 b5 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19818
   2bae4:	e8 b7 ac 02 00       	call   567a0 <js_add_slow>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19818 (discriminator 1)
   2bae9:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2baf0:	85 c0                	test   eax,eax
   2baf2:	0f 85 85 10 00 00    	jne    2cb7d <JS_CallInternal+0x9fdd>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2baf8:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2bafc:	66 0f 6f bd 50 ff ff 	movdqa xmm7,XMMWORD PTR [rbp-0xb0]
   2bb03:	ff 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2bb04:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2bb08:	41 0f 11 7d 00       	movups XMMWORD PTR [r13+0x0],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2bb0d:	83 fa f6             	cmp    edx,0xfffffff6
   2bb10:	0f 86 f1 a3 ff ff    	jbe    25f07 <JS_CallInternal+0x3367>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2bb16:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2bb19:	83 e8 01             	sub    eax,0x1
   2bb1c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2bb1f:	85 c0                	test   eax,eax
   2bb21:	0f 8f e0 a3 ff ff    	jg     25f07 <JS_CallInternal+0x3367>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bb27:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bb2e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bb32:	e8 e9 0d ff ff       	call   1c920 <__JS_FreeValueRT>
   2bb37:	e9 cb a3 ff ff       	jmp    25f07 <JS_CallInternal+0x3367>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7847
   2bb3c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bb43:	48 8d 35 27 1a 0a 00 	lea    rsi,[rip+0xa1a27]        # cd571 <_IO_stdin_used+0x571>
   2bb4a:	31 c0                	xor    eax,eax
   2bb4c:	e8 1f 52 00 00       	call   30d70 <JS_ThrowTypeError>
   2bb51:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2bb54:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2bb58:	48 89 c1             	mov    rcx,rax
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:643
   2bb5b:	41 89 d0             	mov    r8d,edx
   2bb5e:	48 89 d0             	mov    rax,rdx
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8451
   2bb61:	e9 0d a1 ff ff       	jmp    25c73 <JS_CallInternal+0x30d3>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7826
   2bb66:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bb6d:	48 8d 35 ef 19 0a 00 	lea    rsi,[rip+0xa19ef]        # cd563 <_IO_stdin_used+0x563>
   2bb74:	31 c0                	xor    eax,eax
   2bb76:	e8 f5 51 00 00       	call   30d70 <JS_ThrowTypeError>
   2bb7b:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2bb7f:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2bb83:	48 89 c1             	mov    rcx,rax
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:643
   2bb86:	41 89 d0             	mov    r8d,edx
   2bb89:	48 89 d0             	mov    rax,rdx
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8448
   2bb8c:	e9 e2 a0 ff ff       	jmp    25c73 <JS_CallInternal+0x30d3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19491
   2bb91:	41 83 fd fa          	cmp    r13d,0xfffffffa
   2bb95:	0f 8d 25 04 00 00    	jge    2bfc0 <JS_CallInternal+0x9420>
   2bb9b:	41 83 fd f8          	cmp    r13d,0xfffffff8
   2bb9f:	0f 8d 94 e2 ff ff    	jge    29e39 <JS_CallInternal+0x7299>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19499 (discriminator 2)
   2bba5:	83 e8 02             	sub    eax,0x2
   2bba8:	83 f8 01             	cmp    eax,0x1
   2bbab:	0f 87 2f e2 ff ff    	ja     29de0 <JS_CallInternal+0x7240>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19500
   2bbb1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bbb8:	48 8d 35 c9 19 0a 00 	lea    rsi,[rip+0xa19c9]        # cd588 <_IO_stdin_used+0x588>
   2bbbf:	31 c0                	xor    eax,eax
   2bbc1:	e8 aa 51 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19501
   2bbc6:	e9 75 77 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   2bbcb:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   2bbcd:	25 ff ff ff 03       	and    eax,0x3ffffff
   2bbd2:	0f 85 68 a0 ff ff    	jne    25c40 <JS_CallInternal+0x30a0>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2bbd8:	48 8b bd 28 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1d8]
   2bbdf:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2bbe3:	e8 a8 b7 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7747 (discriminator 1)
   2bbe8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bbef:	48 8d 35 4a 52 0a 00 	lea    rsi,[rip+0xa524a]        # d0e40 <_IO_stdin_used+0x3e40>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2bbf6:	48 89 c2             	mov    rdx,rax
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7747 (discriminator 1)
   2bbf9:	31 c0                	xor    eax,eax
   2bbfb:	e8 70 51 00 00       	call   30d70 <JS_ThrowTypeError>
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8457
   2bc00:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2bc03:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2bc07:	31 c9                	xor    ecx,ecx
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8457
   2bc09:	41 b8 06 00 00 00    	mov    r8d,0x6
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8457
   2bc0f:	b8 06 00 00 00       	mov    eax,0x6
   2bc14:	e9 5a a0 ff ff       	jmp    25c73 <JS_CallInternal+0x30d3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bc19:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc20:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2bc26:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bc2a:	e8 f1 0c ff ff       	call   1c920 <__JS_FreeValueRT>
   2bc2f:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2bc35:	e9 56 94 ff ff       	jmp    25090 <JS_CallInternal+0x24f0>
   2bc3a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc41:	4c 89 f6             	mov    rsi,r14
   2bc44:	4c 89 ea             	mov    rdx,r13
   2bc47:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2bc4d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bc51:	e8 ca 0c ff ff       	call   1c920 <__JS_FreeValueRT>
   2bc56:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2bc5c:	e9 48 94 ff ff       	jmp    250a9 <JS_CallInternal+0x2509>
   2bc61:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc68:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bc6c:	e8 af 0c ff ff       	call   1c920 <__JS_FreeValueRT>
   2bc71:	e9 43 a1 ff ff       	jmp    25db9 <JS_CallInternal+0x3219>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   2bc76:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   2bc78:	25 ff ff ff 03       	and    eax,0x3ffffff
   2bc7d:	0f 85 90 9e ff ff    	jne    25b13 <JS_CallInternal+0x2f73>
JS_ThrowTypeErrorPrivateNotFound():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:8398
   2bc83:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bc8a:	48 8d 0d b3 14 0a 00 	lea    rcx,[rip+0xa14b3]        # cd144 <_IO_stdin_used+0x144>
   2bc91:	31 c0                	xor    eax,eax
   2bc93:	48 8d 15 a6 51 0a 00 	lea    rdx,[rip+0xa51a6]        # d0e40 <_IO_stdin_used+0x3e40>
   2bc9a:	e8 e1 52 00 00       	call   30f80 <__JS_ThrowTypeErrorAtom>
   2bc9f:	e9 f1 f5 ff ff       	jmp    2b295 <JS_CallInternal+0x86f5>
   2bca4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2bca8:	3d f2 00 00 00       	cmp    eax,0xf2
   2bcad:	7e 43                	jle    2bcf2 <JS_CallInternal+0x9152>
   2bcaf:	31 d2                	xor    edx,edx
   2bcb1:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2bcb8:	89 c0                	mov    eax,eax
   2bcba:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2bcbe:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   2bcc5:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2bcc9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2bccc:	83 e8 01             	sub    eax,0x1
   2bccf:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2bcd2:	85 c0                	test   eax,eax
   2bcd4:	7f 13                	jg     2bce9 <JS_CallInternal+0x9149>
   2bcd6:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2bcdd:	e8 3e 97 fe ff       	call   15420 <JS_FreeAtomStruct>
   2bce2:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30953
   2bce9:	48 85 d2             	test   rdx,rdx
   2bcec:	0f 85 c7 ce ff ff    	jne    28bb9 <JS_CallInternal+0x6019>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30955
   2bcf2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bcf9:	48 8d 35 08 50 0a 00 	lea    rsi,[rip+0xa5008]        # d0d08 <_IO_stdin_used+0x3d08>
   2bd00:	31 c0                	xor    eax,eax
   2bd02:	e8 69 50 00 00       	call   30d70 <JS_ThrowTypeError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18033
   2bd07:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
   2bd0e:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2bd15:	00 
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:643
   2bd16:	e9 3e cd ff ff       	jmp    28a59 <JS_CallInternal+0x5eb9>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bd1b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd22:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd26:	e8 f5 0b ff ff       	call   1c920 <__JS_FreeValueRT>
   2bd2b:	e9 2c 9c ff ff       	jmp    2595c <JS_CallInternal+0x2dbc>
   2bd30:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd37:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd3b:	e8 e0 0b ff ff       	call   1c920 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19615
   2bd40:	e9 38 9c ff ff       	jmp    2597d <JS_CallInternal+0x2ddd>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19661
   2bd45:	4c 89 f3             	mov    rbx,r14
   2bd48:	e9 f3 75 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19592 (discriminator 1)
   2bd4d:	39 c2                	cmp    edx,eax
   2bd4f:	0f 85 96 dd ff ff    	jne    29aeb <JS_CallInternal+0x6f4b>
can_extend_fast_array():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9968
   2bd55:	0f b6 51 10          	movzx  edx,BYTE PTR [rcx+0x10]
   2bd59:	f7 d2                	not    edx
   2bd5b:	83 e2 12             	and    edx,0x12
   2bd5e:	0f 85 87 dd ff ff    	jne    29aeb <JS_CallInternal+0x6f4b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9970
   2bd64:	48 8b 79 18          	mov    rdi,QWORD PTR [rcx+0x18]
   2bd68:	48 8b 57 30          	mov    rdx,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9971
   2bd6c:	48 85 d2             	test   rdx,rdx
   2bd6f:	74 0a                	je     2bd7b <JS_CallInternal+0x91db>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19592 (discriminator 2)
   2bd71:	f6 42 10 01          	test   BYTE PTR [rdx+0x10],0x1
   2bd75:	0f 84 70 dd ff ff    	je     29aeb <JS_CallInternal+0x6f4b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19597
   2bd7b:	48 8b 71 20          	mov    rsi,QWORD PTR [rcx+0x20]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19597 (discriminator 1)
   2bd7f:	44 8b 56 08          	mov    r10d,DWORD PTR [rsi+0x8]
   2bd83:	45 85 d2             	test   r10d,r10d
   2bd86:	0f 85 5f dd ff ff    	jne    29aeb <JS_CallInternal+0x6f4b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19600
   2bd8c:	8d 50 01             	lea    edx,[rax+0x1]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19601 (discriminator 1)
   2bd8f:	39 51 28             	cmp    DWORD PTR [rcx+0x28],edx
   2bd92:	0f 82 53 dd ff ff    	jb     29aeb <JS_CallInternal+0x6f4b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19604
   2bd98:	39 16                	cmp    DWORD PTR [rsi],edx
   2bd9a:	73 1c                	jae    2bdb8 <JS_CallInternal+0x9218>
get_shape_prop():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5147
   2bd9c:	44 8b 47 18          	mov    r8d,DWORD PTR [rdi+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19605 (discriminator 2)
   2bda0:	42 f6 44 87 3f 08    	test   BYTE PTR [rdi+r8*4+0x3f],0x8
   2bda6:	0f 84 3f dd ff ff    	je     29aeb <JS_CallInternal+0x6f4b>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   2bdac:	89 d7                	mov    edi,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19607
   2bdae:	45 31 c9             	xor    r9d,r9d
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:562
   2bdb1:	48 89 3e             	mov    QWORD PTR [rsi],rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19607
   2bdb4:	4c 89 4e 08          	mov    QWORD PTR [rsi+0x8],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19609
   2bdb8:	89 51 38             	mov    DWORD PTR [rcx+0x38],edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19610
   2bdbb:	89 c0                	mov    eax,eax
   2bdbd:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   2bdc2:	48 c1 e0 04          	shl    rax,0x4
   2bdc6:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
   2bdca:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   2bdcd:	e9 8a 9b ff ff       	jmp    2595c <JS_CallInternal+0x2dbc>
   2bdd2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bdd8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bddf:	4c 89 ee             	mov    rsi,r13
   2bde2:	4c 89 f2             	mov    rdx,r14
   2bde5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bde9:	e8 32 0b ff ff       	call   1c920 <__JS_FreeValueRT>
   2bdee:	e9 df 9f ff ff       	jmp    25dd2 <JS_CallInternal+0x3232>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19879 (discriminator 1)
   2bdf3:	09 ca                	or     edx,ecx
   2bdf5:	0f 89 2b a0 ff ff    	jns    25e26 <JS_CallInternal+0x3286>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19880
   2bdfb:	f2 0f 10 05 9d ec 0a 	movsd  xmm0,QWORD PTR [rip+0xaec9d]        # daaa0 <typed_array_size_log2+0x28>
   2be02:	00 
   2be03:	e9 f3 f7 ff ff       	jmp    2b5fb <JS_CallInternal+0x8a5b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20555
   2be08:	0f 85 98 78 ff ff    	jne    236a6 <JS_CallInternal+0xb06>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2882
   2be0e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2be15:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2be19:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883
   2be20:	48 85 c0             	test   rax,rax
   2be23:	0f 84 5e 08 00 00    	je     2c687 <JS_CallInternal+0x9ae7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883 (discriminator 1)
   2be29:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2be2d:	0f 84 54 08 00 00    	je     2c687 <JS_CallInternal+0x9ae7>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20576
   2be33:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   2be39:	e8 52 71 00 00       	call   32f90 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20577
   2be3e:	e9 63 78 ff ff       	jmp    236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18319
   2be43:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2be4a:	48 8d 35 27 4f 0a 00 	lea    rsi,[rip+0xa4f27]        # d0d78 <_IO_stdin_used+0x3d78>
   2be51:	31 c0                	xor    eax,eax
   2be53:	e8 18 4f 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18320
   2be58:	e9 e3 74 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2be5d:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2be64:	0f 8f 7b 09 00 00    	jg     2c7e5 <JS_CallInternal+0x9c45>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19546
   2be6a:	31 c9                	xor    ecx,ecx
   2be6c:	b8 03 00 00 00       	mov    eax,0x3
   2be71:	e9 51 a3 ff ff       	jmp    261c7 <JS_CallInternal+0x3627>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19420
   2be76:	4d 89 f4             	mov    r12,r14
   2be79:	e9 c2 74 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19986
   2be7e:	f2 0f 10 05 1a ec 0a 	movsd  xmm0,QWORD PTR [rip+0xaec1a]        # daaa0 <typed_array_size_log2+0x28>
   2be85:	00 
   2be86:	e9 a9 d7 ff ff       	jmp    29634 <JS_CallInternal+0x6a94>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2be8b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2be92:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2be99:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2be9d:	e8 7e 0a ff ff       	call   1c920 <__JS_FreeValueRT>
   2bea2:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2bea9:	e9 0b d8 ff ff       	jmp    296b9 <JS_CallInternal+0x6b19>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20573
   2beae:	0f 85 f2 77 ff ff    	jne    236a6 <JS_CallInternal+0xb06>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2882
   2beb4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bebb:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2bebf:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883
   2bec6:	48 85 c0             	test   rax,rax
   2bec9:	0f 84 67 77 ff ff    	je     23636 <JS_CallInternal+0xa96>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2883 (discriminator 1)
   2becf:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2bed3:	0f 84 5d 77 ff ff    	je     23636 <JS_CallInternal+0xa96>
   2bed9:	e9 55 ff ff ff       	jmp    2be33 <JS_CallInternal+0x9293>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bede:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bee5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bee9:	e8 32 0a ff ff       	call   1c920 <__JS_FreeValueRT>
   2beee:	e9 a7 77 ff ff       	jmp    2369a <JS_CallInternal+0xafa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19990
   2bef3:	f2 0f 10 05 15 75 0a 	movsd  xmm0,QWORD PTR [rip+0xa7515]        # d3410 <__PRETTY_FUNCTION__.0+0xc0>
   2befa:	00 
   2befb:	e9 34 d7 ff ff       	jmp    29634 <JS_CallInternal+0x6a94>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bf00:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bf07:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2bf0e:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2bf15:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bf19:	e8 02 0a ff ff       	call   1c920 <__JS_FreeValueRT>
   2bf1e:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2bf25:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2bf2c:	e9 00 8f ff ff       	jmp    24e31 <JS_CallInternal+0x2291>
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:609
   2bf31:	89 c8                	mov    eax,ecx
   2bf33:	31 d2                	xor    edx,edx
   2bf35:	e9 48 b0 ff ff       	jmp    26f82 <JS_CallInternal+0x43e2>
   2bf3a:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bf41:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bf48:	4c 89 c2             	mov    rdx,r8
   2bf4b:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2bf52:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bf56:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2bf5c:	e8 bf 09 ff ff       	call   1c920 <__JS_FreeValueRT>
   2bf61:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   2bf68:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2bf6f:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2bf75:	e9 a6 df ff ff       	jmp    29f20 <JS_CallInternal+0x7380>
   2bf7a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bf81:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bf85:	e8 96 09 ff ff       	call   1c920 <__JS_FreeValueRT>
   2bf8a:	e9 c2 84 ff ff       	jmp    24451 <JS_CallInternal+0x18b1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19747
   2bf8f:	45 85 db             	test   r11d,r11d
   2bf92:	0f 85 ca ef ff ff    	jne    2af62 <JS_CallInternal+0x83c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19748
   2bf98:	66 0f ef c9          	pxor   xmm1,xmm1
   2bf9c:	f2 41 0f 2a ca       	cvtsi2sd xmm1,r10d
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19753
   2bfa1:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19759
   2bfa6:	f2 0f 58 c1          	addsd  xmm0,xmm1
   2bfaa:	48 c7 43 e8 08 00 00 	mov    QWORD PTR [rbx-0x18],0x8
   2bfb1:	00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19760
   2bfb2:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19759
   2bfb6:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19743
   2bfbb:	e9 ab 9f ff ff       	jmp    25f6b <JS_CallInternal+0x33cb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19491
   2bfc0:	45 85 ed             	test   r13d,r13d
   2bfc3:	0f 85 dc fb ff ff    	jne    2bba5 <JS_CallInternal+0x9005>
   2bfc9:	e9 6b de ff ff       	jmp    29e39 <JS_CallInternal+0x7299>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2bfce:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bfd5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bfd9:	e8 42 09 ff ff       	call   1c920 <__JS_FreeValueRT>
   2bfde:	e9 67 db ff ff       	jmp    29b4a <JS_CallInternal+0x6faa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17971
   2bfe3:	8b 85 88 fe ff ff    	mov    eax,DWORD PTR [rbp-0x178]
   2bfe9:	83 e8 02             	sub    eax,0x2
   2bfec:	83 f8 01             	cmp    eax,0x1
   2bfef:	0f 87 24 09 00 00    	ja     2c919 <JS_CallInternal+0x9d79>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17972
   2bff5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bffc:	48 8b 88 80 01 00 00 	mov    rcx,QWORD PTR [rax+0x180]
   2c003:	48 8b 80 88 01 00 00 	mov    rax,QWORD PTR [rax+0x188]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2c00a:	83 f8 f6             	cmp    eax,0xfffffff6
   2c00d:	0f 86 c2 cd ff ff    	jbe    28dd5 <JS_CallInternal+0x6235>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2c013:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   2c017:	e9 b9 cd ff ff       	jmp    28dd5 <JS_CallInternal+0x6235>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19642
   2c01c:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c023:	48 8b 91 88 01 00 00 	mov    rdx,QWORD PTR [rcx+0x188]
   2c02a:	48 8b 81 80 01 00 00 	mov    rax,QWORD PTR [rcx+0x180]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2c031:	83 fa f6             	cmp    edx,0xfffffff6
   2c034:	76 04                	jbe    2c03a <JS_CallInternal+0x949a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2c036:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19642
   2c03a:	48 89 43 d0          	mov    QWORD PTR [rbx-0x30],rax
   2c03e:	48 89 53 d8          	mov    QWORD PTR [rbx-0x28],rdx
   2c042:	e9 eb 97 ff ff       	jmp    25832 <JS_CallInternal+0x2c92>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c047:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c04e:	48 8d 45 80          	lea    rax,[rbp-0x80]
   2c052:	89 f2                	mov    edx,esi
   2c054:	48 89 c6             	mov    rsi,rax
   2c057:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c05b:	e8 30 b3 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
   2c060:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c063:	e9 70 8b ff ff       	jmp    24bd8 <JS_CallInternal+0x2038>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:689
   2c068:	83 f9 f6             	cmp    ecx,0xfffffff6
   2c06b:	0f 86 35 f5 ff ff    	jbe    2b5a6 <JS_CallInternal+0x8a06>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:691
   2c071:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   2c075:	83 e8 01             	sub    eax,0x1
   2c078:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   2c07c:	85 c0                	test   eax,eax
   2c07e:	0f 8f 22 f5 ff ff    	jg     2b5a6 <JS_CallInternal+0x8a06>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2c084:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c08b:	4c 89 c6             	mov    rsi,r8
   2c08e:	48 89 ca             	mov    rdx,rcx
   2c091:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c095:	e8 86 08 ff ff       	call   1c920 <__JS_FreeValueRT>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:9669 (discriminator 1)
   2c09a:	e9 07 f5 ff ff       	jmp    2b5a6 <JS_CallInternal+0x8a06>
js_malloc_rt():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:1812
   2c09f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c0a6:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16205
   2c0ad:	48 63 d7             	movsxd rdx,edi
   2c0b0:	48 c1 e2 04          	shl    rdx,0x4
   2c0b4:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
js_malloc_rt():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:1812
   2c0bb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c0bf:	48 89 d6             	mov    rsi,rdx
   2c0c2:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2c0c9:	e8 a2 88 fe ff       	call   14970 <__js_malloc>
js_malloc():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:1844 (discriminator 1)
   2c0ce:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c0d5:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2c0dc:	48 85 c0             	test   rax,rax
   2c0df:	48 8b 8d 38 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c8]
   2c0e6:	0f 84 a1 0a 00 00    	je     2cb8d <JS_CallInternal+0x9fed>
   2c0ec:	4c 8b 95 a8 fe ff ff 	mov    r10,QWORD PTR [rbp-0x158]
   2c0f3:	31 f6                	xor    esi,esi
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16209
   2c0f5:	4d 8b 44 32 08       	mov    r8,QWORD PTR [r10+rsi*1+0x8]
   2c0fa:	49 8b 3c 32          	mov    rdi,QWORD PTR [r10+rsi*1]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2c0fe:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   2c102:	76 04                	jbe    2c108 <JS_CallInternal+0x9568>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2c104:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16209
   2c108:	48 89 3c 30          	mov    QWORD PTR [rax+rsi*1],rdi
   2c10c:	4c 89 44 30 08       	mov    QWORD PTR [rax+rsi*1+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16208 (discriminator 1)
   2c111:	48 83 c6 10          	add    rsi,0x10
   2c115:	48 39 f2             	cmp    rdx,rsi
   2c118:	75 db                	jne    2c0f5 <JS_CallInternal+0x9555>
   2c11a:	e9 f5 c9 ff ff       	jmp    28b14 <JS_CallInternal+0x5f74>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6171
   2c11f:	8b 12                	mov    edx,DWORD PTR [rdx]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6164
   2c121:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   2c127:	0f 85 2c 90 ff ff    	jne    25159 <JS_CallInternal+0x25b9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6174
   2c12d:	31 d2                	xor    edx,edx
   2c12f:	e9 35 90 ff ff       	jmp    25169 <JS_CallInternal+0x25c9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18832
   2c134:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   2c13b:	4c 89 ee             	mov    rsi,r13
   2c13e:	e8 4d 46 ff ff       	call   20790 <free_var_ref>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18833
   2c143:	e9 e3 71 ff ff       	jmp    2332b <JS_CallInternal+0x78b>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2c148:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c14f:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2c156:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c15a:	e8 c1 07 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c15f:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2c166:	e9 e7 d7 ff ff       	jmp    29952 <JS_CallInternal+0x6db2>
   2c16b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c172:	4c 89 ee             	mov    rsi,r13
   2c175:	4c 89 f2             	mov    rdx,r14
   2c178:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2c17e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c182:	e8 99 07 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c187:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2c18d:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2c194:	e9 28 da ff ff       	jmp    29bc1 <JS_CallInternal+0x7021>
   2c199:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c1a0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c1a4:	e8 77 07 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c1a9:	e9 fa 75 ff ff       	jmp    237a8 <JS_CallInternal+0xc08>
   2c1ae:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c1b5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c1b9:	e8 62 07 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c1be:	e9 2e d5 ff ff       	jmp    296f1 <JS_CallInternal+0x6b51>
   2c1c3:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c1ca:	48 89 c6             	mov    rsi,rax
   2c1cd:	4c 89 ca             	mov    rdx,r9
   2c1d0:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c1d4:	e8 47 07 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c1d9:	e9 71 dd ff ff       	jmp    29f4f <JS_CallInternal+0x73af>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19801
   2c1de:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19798 (discriminator 1)
   2c1e5:	41 83 fe f9          	cmp    r14d,0xfffffff9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19801
   2c1e9:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19798 (discriminator 1)
   2c1ed:	0f 84 d8 09 00 00    	je     2cbcb <JS_CallInternal+0xa02b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19815
   2c1f3:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2c1f7:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   2c1fb:	e9 b3 f8 ff ff       	jmp    2bab3 <JS_CallInternal+0x8f13>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19685
   2c200:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2c207:	e9 34 71 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18001
   2c20c:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c20f:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18002
   2c213:	e9 41 c8 ff ff       	jmp    28a59 <JS_CallInternal+0x5eb9>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c218:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c21f:	89 c2                	mov    edx,eax
   2c221:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c225:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c229:	e8 62 b1 fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
   2c22e:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c231:	e9 88 ed ff ff       	jmp    2afbe <JS_CallInternal+0x841e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 23)
   2c236:	8b 42 10             	mov    eax,DWORD PTR [rdx+0x10]
   2c239:	25 08 00 ff ff       	and    eax,0xffff0008
   2c23e:	3d 00 00 01 00       	cmp    eax,0x10000
   2c243:	0f 85 7d 7e ff ff    	jne    240c6 <JS_CallInternal+0x1526>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 25)
   2c249:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2c24e:	0f 84 72 7e ff ff    	je     240c6 <JS_CallInternal+0x1526>
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:32
   2c254:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 27)
   2c257:	48 89 f8             	mov    rax,rdi
   2c25a:	48 c1 f8 04          	sar    rax,0x4
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:32
   2c25e:	4c 39 ee             	cmp    rsi,r13
   2c261:	74 47                	je     2c2aa <JS_CallInternal+0x970a>
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5314 (discriminator 1)
   2c263:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5347
   2c268:	48 85 f6             	test   rsi,rsi
   2c26b:	74 3a                	je     2c2a7 <JS_CallInternal+0x9707>
   2c26d:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5348
   2c274:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c27b:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2c282:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c286:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2c28d:	e8 9e 20 ff ff       	call   1e330 <js_free_shape>
   2c292:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2c299:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2c2a0:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:39
   2c2a7:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:40
   2c2aa:	41 89 46 08          	mov    DWORD PTR [r14+0x8],eax
   2c2ae:	e9 13 7e ff ff       	jmp    240c6 <JS_CallInternal+0x1526>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 22)
   2c2b3:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c2b7:	83 fa 01             	cmp    edx,0x1
   2c2ba:	0f 86 88 0b 00 00    	jbe    2ce48 <JS_CallInternal+0xa2a8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 25)
   2c2c0:	83 c0 01             	add    eax,0x1
   2c2c3:	0f 85 e3 de ff ff    	jne    2a1ac <JS_CallInternal+0x760c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 26)
   2c2c9:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2c2ce:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c2d5:	4c 89 c2             	mov    rdx,r8
   2c2d8:	83 e0 01             	and    eax,0x1
   2c2db:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c2e1:	e8 9a 07 ff ff       	call   1ca80 <JS_FreeValue>
   2c2e6:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2c2ec:	e9 c7 90 ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 15)
   2c2f1:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c2f5:	83 fa 01             	cmp    edx,0x1
   2c2f8:	0f 86 54 0b 00 00    	jbe    2ce52 <JS_CallInternal+0xa2b2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 18)
   2c2fe:	83 c0 01             	add    eax,0x1
   2c301:	0f 85 a5 de ff ff    	jne    2a1ac <JS_CallInternal+0x760c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 19)
   2c307:	31 c0                	xor    eax,eax
   2c309:	4d 39 ce             	cmp    r14,r9
   2c30c:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2c313:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c31a:	0f 94 c0             	sete   al
   2c31d:	e9 5c ed ff ff       	jmp    2b07e <JS_CallInternal+0x84de>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 8)
   2c322:	45 85 c0             	test   r8d,r8d
   2c325:	75 5e                	jne    2c385 <JS_CallInternal+0x97e5>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 10)
   2c327:	66 0f ef c0          	pxor   xmm0,xmm0
   2c32b:	66 49 0f 6e ce       	movq   xmm1,r14
   2c330:	31 d2                	xor    edx,edx
   2c332:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2c337:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2c33b:	0f 9b c2             	setnp  dl
   2c33e:	0f 44 c2             	cmove  eax,edx
   2c341:	e9 72 90 ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 22)
   2c346:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c34a:	83 fa 01             	cmp    edx,0x1
   2c34d:	0f 86 2f 0b 00 00    	jbe    2ce82 <JS_CallInternal+0xa2e2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 25)
   2c353:	83 c0 01             	add    eax,0x1
   2c356:	0f 85 84 dd ff ff    	jne    2a0e0 <JS_CallInternal+0x7540>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 26)
   2c35c:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2c361:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c368:	4c 89 c2             	mov    rdx,r8
   2c36b:	83 e0 01             	and    eax,0x1
   2c36e:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2c374:	e8 07 07 ff ff       	call   1ca80 <JS_FreeValue>
   2c379:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c380:	e9 93 90 ff ff       	jmp    25418 <JS_CallInternal+0x2878>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 11)
   2c385:	41 83 f8 08          	cmp    r8d,0x8
   2c389:	0f 85 1d de ff ff    	jne    2a1ac <JS_CallInternal+0x760c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 12)
   2c38f:	66 49 0f 6e c6       	movq   xmm0,r14
   2c394:	66 49 0f 6e d1       	movq   xmm2,r9
   2c399:	31 c0                	xor    eax,eax
   2c39b:	ba 00 00 00 00       	mov    edx,0x0
   2c3a0:	66 0f 2e c2          	ucomisd xmm0,xmm2
   2c3a4:	0f 9b c0             	setnp  al
   2c3a7:	0f 45 c2             	cmovne eax,edx
   2c3aa:	e9 09 90 ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2c3af:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c3b6:	48 89 ce             	mov    rsi,rcx
   2c3b9:	48 89 da             	mov    rdx,rbx
   2c3bc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c3c0:	e8 5b 05 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c3c5:	e9 7e dd ff ff       	jmp    2a148 <JS_CallInternal+0x75a8>
   2c3ca:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c3d1:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2c3d8:	48 89 de             	mov    rsi,rbx
   2c3db:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c3df:	e8 3c 05 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c3e4:	e9 86 dd ff ff       	jmp    2a16f <JS_CallInternal+0x75cf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 23)
   2c3e9:	8b 52 10             	mov    edx,DWORD PTR [rdx+0x10]
   2c3ec:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2c3f2:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2c3f8:	0f 85 ab 7d ff ff    	jne    241a9 <JS_CallInternal+0x1609>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 25)
   2c3fe:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2c403:	0f 84 a0 7d ff ff    	je     241a9 <JS_CallInternal+0x1609>
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:32
   2c409:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 27)
   2c40c:	48 c1 ff 04          	sar    rdi,0x4
   2c410:	48 89 fa             	mov    rdx,rdi
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:32
   2c413:	4c 39 ee             	cmp    rsi,r13
   2c416:	74 55                	je     2c46d <JS_CallInternal+0x98cd>
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5314 (discriminator 1)
   2c418:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5347
   2c41d:	48 85 f6             	test   rsi,rsi
   2c420:	74 48                	je     2c46a <JS_CallInternal+0x98ca>
   2c422:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:5348
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
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:39
   2c46a:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_runtime.inc:40
   2c46d:	41 89 56 08          	mov    DWORD PTR [r14+0x8],edx
   2c471:	e9 33 7d ff ff       	jmp    241a9 <JS_CallInternal+0x1609>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2c476:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c47d:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c484:	4c 89 ee             	mov    rsi,r13
   2c487:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c48b:	e8 90 04 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c490:	e9 b8 95 ff ff       	jmp    25a4d <JS_CallInternal+0x2ead>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7826
   2c495:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c49c:	48 8d 35 c0 10 0a 00 	lea    rsi,[rip+0xa10c0]        # cd563 <_IO_stdin_used+0x563>
   2c4a3:	31 c0                	xor    eax,eax
   2c4a5:	e8 c6 48 00 00       	call   30d70 <JS_ThrowTypeError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19674
   2c4aa:	e9 91 6e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 7)
   2c4af:	66 48 0f 6e ca       	movq   xmm1,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 12)
   2c4b4:	83 f9 08             	cmp    ecx,0x8
   2c4b7:	74 36                	je     2c4ef <JS_CallInternal+0x994f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 15)
   2c4b9:	85 c9                	test   ecx,ecx
   2c4bb:	0f 85 f5 f1 ff ff    	jne    2b6b6 <JS_CallInternal+0x8b16>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 17)
   2c4c1:	66 0f ef c0          	pxor   xmm0,xmm0
   2c4c5:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 19)
   2c4c9:	31 c0                	xor    eax,eax
   2c4cb:	66 0f 2f c8          	comisd xmm1,xmm0
   2c4cf:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c4d6:	00 
   2c4d7:	0f 93 c0             	setae  al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 1)
   2c4da:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 19)
   2c4de:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303
   2c4e2:	e9 1c 90 ff ff       	jmp    25503 <JS_CallInternal+0x2963>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 10)
   2c4e7:	66 0f ef c9          	pxor   xmm1,xmm1
   2c4eb:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20303 (discriminator 14)
   2c4ef:	66 48 0f 6e c0       	movq   xmm0,rax
   2c4f4:	eb d3                	jmp    2c4c9 <JS_CallInternal+0x9929>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c4f6:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c4fd:	89 c2                	mov    edx,eax
   2c4ff:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c503:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c507:	e8 84 ae fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
   2c50c:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c50f:	e9 e5 f4 ff ff       	jmp    2b9f9 <JS_CallInternal+0x8e59>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19842
   2c514:	66 48 0f 6e c7       	movq   xmm0,rdi
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19848
   2c519:	83 f8 08             	cmp    eax,0x8
   2c51c:	0f 84 47 f5 ff ff    	je     2ba69 <JS_CallInternal+0x8ec9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19850
   2c522:	85 c0                	test   eax,eax
   2c524:	0f 85 6d 77 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19851
   2c52a:	66 0f ef c9          	pxor   xmm1,xmm1
   2c52e:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   2c532:	e9 37 f5 ff ff       	jmp    2ba6e <JS_CallInternal+0x8ece>
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15964
   2c537:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c53e:	48 8d 35 6d 10 0a 00 	lea    rsi,[rip+0xa106d]        # cd5b2 <_IO_stdin_used+0x5b2>
   2c545:	31 c0                	xor    eax,eax
   2c547:	e8 24 48 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15965
   2c54c:	e9 ef 6d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 7)
   2c551:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 12)
   2c556:	83 f9 08             	cmp    ecx,0x8
   2c559:	74 36                	je     2c591 <JS_CallInternal+0x99f1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 15)
   2c55b:	85 c9                	test   ecx,ecx
   2c55d:	0f 85 d3 eb ff ff    	jne    2b136 <JS_CallInternal+0x8596>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 17)
   2c563:	66 0f ef c9          	pxor   xmm1,xmm1
   2c567:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 19)
   2c56b:	31 c0                	xor    eax,eax
   2c56d:	66 0f 2f c8          	comisd xmm1,xmm0
   2c571:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c578:	00 
   2c579:	0f 97 c0             	seta   al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 1)
   2c57c:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 19)
   2c580:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300
   2c584:	e9 32 8f ff ff       	jmp    254bb <JS_CallInternal+0x291b>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 10)
   2c589:	66 0f ef c0          	pxor   xmm0,xmm0
   2c58d:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20300 (discriminator 14)
   2c591:	66 48 0f 6e ca       	movq   xmm1,rdx
   2c596:	eb d3                	jmp    2c56b <JS_CallInternal+0x99cb>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 24)
   2c598:	4d 89 c1             	mov    r9,r8
   2c59b:	48 89 d7             	mov    rdi,rdx
   2c59e:	45 31 c0             	xor    r8d,r8d
   2c5a1:	4c 89 ea             	mov    rdx,r13
   2c5a4:	4c 89 ce             	mov    rsi,r9
   2c5a7:	4c 89 f1             	mov    rcx,r14
   2c5aa:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2c5b1:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c5b8:	e8 93 df fe ff       	call   1a550 <js_strict_eq2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 1)
   2c5bd:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2c5c4:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 24)
   2c5cb:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 1)
   2c5d1:	e9 58 e8 ff ff       	jmp    2ae2e <JS_CallInternal+0x828e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 16)
   2c5d6:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 13)
   2c5d8:	41 83 fe ff          	cmp    r14d,0xffffffff
   2c5dc:	75 08                	jne    2c5e6 <JS_CallInternal+0x9a46>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 15)
   2c5de:	31 c0                	xor    eax,eax
   2c5e0:	4c 39 ea             	cmp    rdx,r13
   2c5e3:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 18)
   2c5e6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c5ed:	48 89 d6             	mov    rsi,rdx
   2c5f0:	4c 89 c2             	mov    rdx,r8
   2c5f3:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c5f9:	e8 82 04 ff ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 1)
   2c5fe:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c605:	4c 89 ee             	mov    rsi,r13
   2c608:	4c 89 f2             	mov    rdx,r14
   2c60b:	e8 70 04 ff ff       	call   1ca80 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2c610:	48 63 85 50 fe ff ff 	movsxd rax,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2c617:	e9 46 8c ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 7)
   2c61c:	45 85 f6             	test   r14d,r14d
   2c61f:	75 72                	jne    2c693 <JS_CallInternal+0x9af3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 9)
   2c621:	66 0f ef c0          	pxor   xmm0,xmm0
   2c625:	66 48 0f 6e e2       	movq   xmm4,rdx
   2c62a:	31 c0                	xor    eax,eax
   2c62c:	ba 00 00 00 00       	mov    edx,0x0
   2c631:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
   2c636:	66 0f 2e c4          	ucomisd xmm0,xmm4
   2c63a:	0f 9b c0             	setnp  al
   2c63d:	48 0f 45 c2          	cmovne rax,rdx
   2c641:	e9 1c 8c ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2c646:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c64d:	4c 89 c6             	mov    rsi,r8
   2c650:	4c 89 e2             	mov    rdx,r12
   2c653:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2c659:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c65d:	e8 be 02 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c662:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2c668:	e9 88 c9 ff ff       	jmp    28ff5 <JS_CallInternal+0x6455>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18307
   2c66d:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2c674:	48 8d 35 bd 46 0a 00 	lea    rsi,[rip+0xa46bd]        # d0d38 <_IO_stdin_used+0x3d38>
   2c67b:	31 c0                	xor    eax,eax
   2c67d:	e8 ee 46 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18308
   2c682:	e9 b9 6c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20561
   2c687:	b8 03 00 00 00       	mov    eax,0x3
   2c68c:	31 c9                	xor    ecx,ecx
   2c68e:	e9 87 70 ff ff       	jmp    2371a <JS_CallInternal+0xb7a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 10)
   2c693:	41 83 fe 08          	cmp    r14d,0x8
   2c697:	0f 85 33 07 00 00    	jne    2cdd0 <JS_CallInternal+0xa230>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 11)
   2c69d:	66 48 0f 6e c2       	movq   xmm0,rdx
   2c6a2:	66 49 0f 6e ed       	movq   xmm5,r13
   2c6a7:	31 c0                	xor    eax,eax
   2c6a9:	ba 00 00 00 00       	mov    edx,0x0
   2c6ae:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2c6b2:	0f 9b c0             	setnp  al
   2c6b5:	48 0f 45 c2          	cmovne rax,rdx
   2c6b9:	e9 a4 8b ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19889
   2c6be:	66 48 0f 6e c9       	movq   xmm1,rcx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19895
   2c6c3:	83 f8 08             	cmp    eax,0x8
   2c6c6:	0f 84 64 ef ff ff    	je     2b630 <JS_CallInternal+0x8a90>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19897
   2c6cc:	85 c0                	test   eax,eax
   2c6ce:	0f 85 c3 75 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19898
   2c6d4:	66 0f ef c0          	pxor   xmm0,xmm0
   2c6d8:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   2c6dc:	e9 54 ef ff ff       	jmp    2b635 <JS_CallInternal+0x8a95>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2c6e1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c6e8:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c6ef:	4c 89 ee             	mov    rsi,r13
   2c6f2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c6f6:	e8 25 02 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c6fb:	e9 b1 eb ff ff       	jmp    2b2b1 <JS_CallInternal+0x8711>
   2c700:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c707:	4c 89 ee             	mov    rsi,r13
   2c70a:	48 89 da             	mov    rdx,rbx
   2c70d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c711:	e8 0a 02 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c716:	e9 5c ec ff ff       	jmp    2b377 <JS_CallInternal+0x87d7>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20714
   2c71b:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20716
   2c722:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20715
   2c729:	31 d2                	xor    edx,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20714
   2c72b:	f3 0f 6f 90 d8 04 00 	movdqu xmm2,XMMWORD PTR [rax+0x4d8]
   2c732:	00 
   2c733:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
   2c737:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20715
   2c73e:	48 89 90 d8 04 00 00 	mov    QWORD PTR [rax+0x4d8],rdx
   2c745:	48 c7 80 e0 04 00 00 	mov    QWORD PTR [rax+0x4e0],0x4
   2c74c:	04 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20716
   2c750:	49 63 c5             	movsxd rax,r13d
   2c753:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20717
   2c757:	e9 05 67 ff ff       	jmp    22e61 <JS_CallInternal+0x2c1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 7)
   2c75c:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 12)
   2c761:	83 f9 08             	cmp    ecx,0x8
   2c764:	74 36                	je     2c79c <JS_CallInternal+0x9bfc>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 15)
   2c766:	85 c9                	test   ecx,ecx
   2c768:	0f 85 65 f1 ff ff    	jne    2b8d3 <JS_CallInternal+0x8d33>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 17)
   2c76e:	66 0f ef c9          	pxor   xmm1,xmm1
   2c772:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 19)
   2c776:	31 c0                	xor    eax,eax
   2c778:	66 0f 2f c8          	comisd xmm1,xmm0
   2c77c:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c783:	00 
   2c784:	0f 93 c0             	setae  al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 1)
   2c787:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 19)
   2c78b:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301
   2c78f:	e9 df 8c ff ff       	jmp    25473 <JS_CallInternal+0x28d3>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 10)
   2c794:	66 0f ef c0          	pxor   xmm0,xmm0
   2c798:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20301 (discriminator 14)
   2c79c:	66 48 0f 6e ca       	movq   xmm1,rdx
   2c7a1:	eb d3                	jmp    2c776 <JS_CallInternal+0x9bd6>
JS_IsString():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:653
   2c7a3:	83 c1 07             	add    ecx,0x7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19761 (discriminator 1)
   2c7a6:	83 f9 01             	cmp    ecx,0x1
   2c7a9:	0f 87 b3 e7 ff ff    	ja     2af62 <JS_CallInternal+0x83c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19762
   2c7af:	4c 89 c1             	mov    rcx,r8
   2c7b2:	49 89 f8             	mov    r8,rdi
   2c7b5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c7bc:	4c 89 d6             	mov    rsi,r10
   2c7bf:	4c 89 da             	mov    rdx,r11
   2c7c2:	e8 f9 40 01 00       	call   408c0 <JS_ConcatString>
   2c7c7:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19763
   2c7cb:	48 8d 43 f0          	lea    rax,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19762
   2c7cf:	48 89 53 e8          	mov    QWORD PTR [rbx-0x18],rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19764 (discriminator 1)
   2c7d3:	83 7b e8 06          	cmp    DWORD PTR [rbx-0x18],0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19763
   2c7d7:	48 89 c3             	mov    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19764 (discriminator 1)
   2c7da:	0f 85 8b 97 ff ff    	jne    25f6b <JS_CallInternal+0x33cb>
   2c7e0:	e9 5b 6b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2c7e5:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   2c7ec:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2c7f0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2c7f3:	83 e8 01             	sub    eax,0x1
   2c7f6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2c7f9:	85 c0                	test   eax,eax
   2c7fb:	0f 8f 69 f6 ff ff    	jg     2be6a <JS_CallInternal+0x92ca>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2c801:	e8 1a 8c fe ff       	call   15420 <JS_FreeAtomStruct>
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:643
   2c806:	e9 5f f6 ff ff       	jmp    2be6a <JS_CallInternal+0x92ca>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19719
   2c80b:	4d 89 ec             	mov    r12,r13
   2c80e:	e9 2d 6b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78 (discriminator 7)
   2c813:	48 c1 e0 04          	shl    rax,0x4
   2c817:	48 03 46 20          	add    rax,QWORD PTR [rsi+0x20]
   2c81b:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   2c81f:	4c 8b 28             	mov    r13,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2c822:	83 f9 f6             	cmp    ecx,0xfffffff6
   2c825:	76 05                	jbe    2c82c <JS_CallInternal+0x9c8c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2c827:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18054
   2c82c:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:78
   2c830:	e9 77 79 ff ff       	jmp    241ac <JS_CallInternal+0x160c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19746
   2c835:	66 49 0f 6e ca       	movq   xmm1,r10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19752
   2c83a:	83 ff 08             	cmp    edi,0x8
   2c83d:	0f 84 5e f7 ff ff    	je     2bfa1 <JS_CallInternal+0x9401>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19754
   2c843:	85 ff                	test   edi,edi
   2c845:	0f 85 17 e7 ff ff    	jne    2af62 <JS_CallInternal+0x83c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19755
   2c84b:	66 0f ef c0          	pxor   xmm0,xmm0
   2c84f:	f2 41 0f 2a c0       	cvtsi2sd xmm0,r8d
   2c854:	e9 4d f7 ff ff       	jmp    2bfa6 <JS_CallInternal+0x9406>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18843
   2c859:	4d 89 ec             	mov    r12,r13
   2c85c:	e9 df 6a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c861:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c868:	89 c2                	mov    edx,eax
   2c86a:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c86e:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c872:	e8 19 ab fe ff       	call   17390 <JS_AtomGetStrRT.constprop.0>
   2c877:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3610
   2c87a:	e9 7a e7 ff ff       	jmp    2aff9 <JS_CallInternal+0x8459>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 7)
   2c87f:	66 48 0f 6e ca       	movq   xmm1,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 12)
   2c884:	83 f9 08             	cmp    ecx,0x8
   2c887:	74 36                	je     2c8bf <JS_CallInternal+0x9d1f>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 15)
   2c889:	85 c9                	test   ecx,ecx
   2c88b:	0f 85 69 ee ff ff    	jne    2b6fa <JS_CallInternal+0x8b5a>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 17)
   2c891:	66 0f ef c0          	pxor   xmm0,xmm0
   2c895:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 19)
   2c899:	31 c0                	xor    eax,eax
   2c89b:	66 0f 2f c8          	comisd xmm1,xmm0
   2c89f:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c8a6:	00 
   2c8a7:	0f 97 c0             	seta   al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 1)
   2c8aa:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 19)
   2c8ae:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302
   2c8b2:	e9 d1 8c ff ff       	jmp    25588 <JS_CallInternal+0x29e8>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 10)
   2c8b7:	66 0f ef c9          	pxor   xmm1,xmm1
   2c8bb:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20302 (discriminator 14)
   2c8bf:	66 48 0f 6e c0       	movq   xmm0,rax
   2c8c4:	eb d3                	jmp    2c899 <JS_CallInternal+0x9cf9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20473
   2c8c6:	4d 89 ec             	mov    r12,r13
   2c8c9:	e9 72 6a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2c8ce:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:6525
   2c8d5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c8dc:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2c8e3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c8e7:	e8 34 00 ff ff       	call   1c920 <__JS_FreeValueRT>
   2c8ec:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2c8f3:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2c8fa:	e9 32 d5 ff ff       	jmp    29e31 <JS_CallInternal+0x7291>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18345
   2c8ff:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c906:	48 8d 35 cc 0b 0a 00 	lea    rsi,[rip+0xa0bcc]        # cd4d9 <_IO_stdin_used+0x4d9>
   2c90d:	31 c0                	xor    eax,eax
   2c90f:	e8 5c 44 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18346
   2c914:	e9 27 6a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17974
   2c919:	48 8b b5 78 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x188]
   2c920:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
   2c927:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c92e:	e8 ed bc 01 00       	call   48620 <JS_ToObject>
   2c933:	48 89 c1             	mov    rcx,rax
   2c936:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:17975 (discriminator 1)
   2c939:	83 fa 06             	cmp    edx,0x6
   2c93c:	0f 85 93 c4 ff ff    	jne    28dd5 <JS_CallInternal+0x6235>
   2c942:	e9 f9 69 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18022
   2c947:	31 c0                	xor    eax,eax
   2c949:	48 c7 43 08 03 00 00 	mov    QWORD PTR [rbx+0x8],0x3
   2c950:	00 
   2c951:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c954:	e9 7f c0 ff ff       	jmp    289d8 <JS_CallInternal+0x5e38>
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81 (discriminator 7)
   2c959:	89 c2                	mov    edx,eax
   2c95b:	48 c1 e2 04          	shl    rdx,0x4
   2c95f:	48 03 56 20          	add    rdx,QWORD PTR [rsi+0x20]
   2c963:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
   2c967:	48 8b 02             	mov    rax,QWORD PTR [rdx]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2c96a:	83 f9 f6             	cmp    ecx,0xfffffff6
   2c96d:	0f 86 56 77 ff ff    	jbe    240c9 <JS_CallInternal+0x1529>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2c973:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/read_ic_opcodes.inc:81
   2c977:	e9 4d 77 ff ff       	jmp    240c9 <JS_CallInternal+0x1529>
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16783
   2c97c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c983:	48 8d 35 96 44 0a 00 	lea    rsi,[rip+0xa4496]        # d0e20 <_IO_stdin_used+0x3e20>
   2c98a:	31 c0                	xor    eax,eax
   2c98c:	e8 df 43 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16784
   2c991:	e9 aa 69 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 24)
   2c996:	48 89 d7             	mov    rdi,rdx
   2c999:	4c 89 ce             	mov    rsi,r9
   2c99c:	45 31 c0             	xor    r8d,r8d
   2c99f:	4c 89 ea             	mov    rdx,r13
   2c9a2:	4c 89 f1             	mov    rcx,r14
   2c9a5:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c9ac:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2c9b3:	e8 98 db fe ff       	call   1a550 <js_strict_eq2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   2c9b8:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2c9bf:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 24)
   2c9c6:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c9cc:	e9 2b eb ff ff       	jmp    2b4fc <JS_CallInternal+0x895c>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 16)
   2c9d1:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 13)
   2c9d3:	41 83 fe ff          	cmp    r14d,0xffffffff
   2c9d7:	75 08                	jne    2c9e1 <JS_CallInternal+0x9e41>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 15)
   2c9d9:	31 c0                	xor    eax,eax
   2c9db:	4c 39 ea             	cmp    rdx,r13
   2c9de:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 18)
   2c9e1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c9e8:	48 89 d6             	mov    rsi,rdx
   2c9eb:	4c 89 ca             	mov    rdx,r9
   2c9ee:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c9f4:	e8 87 00 ff ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   2c9f9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ca00:	4c 89 ee             	mov    rsi,r13
   2ca03:	4c 89 f2             	mov    rdx,r14
   2ca06:	e8 75 00 ff ff       	call   1ca80 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2ca0b:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2ca11:	83 f0 01             	xor    eax,0x1
   2ca14:	48 98                	cdqe
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2ca16:	e9 f3 87 ff ff       	jmp    2520e <JS_CallInternal+0x266e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 7)
   2ca1b:	45 85 f6             	test   r14d,r14d
   2ca1e:	0f 85 d1 00 00 00    	jne    2caf5 <JS_CallInternal+0x9f55>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 9)
   2ca24:	66 0f ef c0          	pxor   xmm0,xmm0
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2ca28:	66 48 0f 6e fa       	movq   xmm7,rdx
   2ca2d:	31 c0                	xor    eax,eax
   2ca2f:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 9)
   2ca34:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2ca39:	66 0f 2e c7          	ucomisd xmm0,xmm7
   2ca3d:	0f 9a c0             	setp   al
   2ca40:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2ca44:	e9 c5 87 ff ff       	jmp    2520e <JS_CallInternal+0x266e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 15)
   2ca49:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2ca4d:	83 fa 01             	cmp    edx,0x1
   2ca50:	0f 86 2a 02 00 00    	jbe    2cc80 <JS_CallInternal+0xa0e0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 18)
   2ca56:	83 c0 01             	add    eax,0x1
   2ca59:	0f 85 81 d6 ff ff    	jne    2a0e0 <JS_CallInternal+0x7540>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 19)
   2ca5f:	4d 39 ce             	cmp    r14,r9
   2ca62:	4c 89 f6             	mov    rsi,r14
   2ca65:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2ca6c:	4c 89 ea             	mov    rdx,r13
   2ca6f:	0f 94 c0             	sete   al
   2ca72:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2ca79:	4c 89 f7             	mov    rdi,r14
   2ca7c:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2ca82:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2ca89:	e8 f2 ff fe ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 1)
   2ca8e:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2ca95:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2ca9c:	4c 89 f7             	mov    rdi,r14
   2ca9f:	e8 dc ff fe ff       	call   1ca80 <JS_FreeValue>
   2caa4:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2caab:	e9 68 89 ff ff       	jmp    25418 <JS_CallInternal+0x2878>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19794 (discriminator 1)
   2cab0:	41 83 fe 08          	cmp    r14d,0x8
   2cab4:	0f 84 09 02 00 00    	je     2ccc3 <JS_CallInternal+0xa123>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19814
   2caba:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2cac1:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19815
   2cac5:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2cac9:	e9 e5 ef ff ff       	jmp    2bab3 <JS_CallInternal+0x8f13>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 8)
   2cace:	45 85 c0             	test   r8d,r8d
   2cad1:	75 4d                	jne    2cb20 <JS_CallInternal+0x9f80>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 10)
   2cad3:	66 0f ef c0          	pxor   xmm0,xmm0
   2cad7:	66 49 0f 6e ee       	movq   xmm5,r14
   2cadc:	ba 00 00 00 00       	mov    edx,0x0
   2cae1:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2cae6:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2caea:	0f 9b c0             	setnp  al
   2caed:	0f 45 c2             	cmovne eax,edx
   2caf0:	e9 23 89 ff ff       	jmp    25418 <JS_CallInternal+0x2878>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 10)
   2caf5:	41 83 fe 08          	cmp    r14d,0x8
   2caf9:	0f 85 ad 01 00 00    	jne    2ccac <JS_CallInternal+0xa10c>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2caff:	66 48 0f 6e c2       	movq   xmm0,rdx
   2cb04:	66 49 0f 6e cd       	movq   xmm1,r13
   2cb09:	31 c0                	xor    eax,eax
   2cb0b:	ba 01 00 00 00       	mov    edx,0x1
   2cb10:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2cb14:	0f 9a c0             	setp   al
   2cb17:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2cb1b:	e9 ee 86 ff ff       	jmp    2520e <JS_CallInternal+0x266e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 11)
   2cb20:	41 83 f8 08          	cmp    r8d,0x8
   2cb24:	0f 85 b6 d5 ff ff    	jne    2a0e0 <JS_CallInternal+0x7540>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 12)
   2cb2a:	66 49 0f 6e c6       	movq   xmm0,r14
   2cb2f:	66 49 0f 6e f1       	movq   xmm6,r9
   2cb34:	ba 00 00 00 00       	mov    edx,0x0
   2cb39:	66 0f 2e c6          	ucomisd xmm0,xmm6
   2cb3d:	0f 9b c0             	setnp  al
   2cb40:	0f 45 c2             	cmovne eax,edx
   2cb43:	e9 d0 88 ff ff       	jmp    25418 <JS_CallInternal+0x2878>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 20)
   2cb48:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cb4f:	4c 89 ee             	mov    rsi,r13
   2cb52:	4c 89 f2             	mov    rdx,r14
   2cb55:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cb5c:	e8 1f ff fe ff       	call   1ca80 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2cb61:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2cb68:	31 c0                	xor    eax,eax
   2cb6a:	44 39 f1             	cmp    ecx,r14d
   2cb6d:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2cb70:	e9 99 86 ff ff       	jmp    2520e <JS_CallInternal+0x266e>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19010
   2cb75:	4d 89 f4             	mov    r12,r14
   2cb78:	e9 c3 67 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19819 (discriminator 1)
   2cb7d:	4d 89 cc             	mov    r12,r9
   2cb80:	e9 bb 67 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20111
   2cb85:	4d 89 f4             	mov    r12,r14
   2cb88:	e9 b3 67 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowOutOfMemory():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7810
   2cb8d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cb94:	4c 8b 60 10          	mov    r12,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7811
   2cb98:	41 80 bc 24 e9 04 00 	cmp    BYTE PTR [r12+0x4e9],0x0
   2cb9f:	00 00 
   2cba1:	0f 84 3a 01 00 00    	je     2cce1 <JS_CallInternal+0xa141>
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:16216
   2cba7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbae:	4c 89 ce             	mov    rsi,r9
   2cbb1:	48 89 ca             	mov    rdx,rcx
   2cbb4:	e8 c7 fe fe ff       	call   1ca80 <JS_FreeValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18001
   2cbb9:	31 c0                	xor    eax,eax
   2cbbb:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2cbc2:	00 
   2cbc3:	48 89 03             	mov    QWORD PTR [rbx],rax
   2cbc6:	e9 8e be ff ff       	jmp    28a59 <JS_CallInternal+0x5eb9>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19802
   2cbcb:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2cbcf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbd6:	4c 89 c2             	mov    rdx,r8
   2cbd9:	4c 89 f1             	mov    rcx,r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19801
   2cbdc:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19802
   2cbe3:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2cbea:	e8 61 82 fe ff       	call   14e50 <JS_ConcatStringInPlace>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19802 (discriminator 1)
   2cbef:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2cbf6:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2cbfd:	85 c0                	test   eax,eax
   2cbff:	75 60                	jne    2cc61 <JS_CallInternal+0xa0c1>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19805
   2cc01:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2cc05:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:709
   2cc09:	83 fa f6             	cmp    edx,0xfffffff6
   2cc0c:	76 04                	jbe    2cc12 <JS_CallInternal+0xa072>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:711
   2cc0e:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19805 (discriminator 1)
   2cc12:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc19:	4c 89 c1             	mov    rcx,r8
   2cc1c:	4d 89 f0             	mov    r8,r14
   2cc1f:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cc26:	e8 95 3c 01 00       	call   408c0 <JS_ConcatString>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19806 (discriminator 1)
   2cc2b:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cc32:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19805 (discriminator 1)
   2cc35:	49 89 c0             	mov    r8,rax
   2cc38:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19806 (discriminator 1)
   2cc3b:	74 3b                	je     2cc78 <JS_CallInternal+0xa0d8>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2685
   2cc3d:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2cc41:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2686
   2cc45:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   2cc49:	4d 89 75 08          	mov    QWORD PTR [r13+0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:2687
   2cc4d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc54:	48 89 c6             	mov    rsi,rax
   2cc57:	e8 24 fe fe ff       	call   1ca80 <JS_FreeValue>
   2cc5c:	e9 a6 92 ff ff       	jmp    25f07 <JS_CallInternal+0x3367>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19803
   2cc61:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc68:	4c 89 c6             	mov    rsi,r8
   2cc6b:	4c 89 f2             	mov    rdx,r14
   2cc6e:	e8 0d fe fe ff       	call   1ca80 <JS_FreeValue>
   2cc73:	e9 8f 92 ff ff       	jmp    25f07 <JS_CallInternal+0x3367>
   2cc78:	4d 89 cc             	mov    r12,r9
   2cc7b:	e9 c0 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20372 (discriminator 17)
   2cc80:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2cc85:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc8c:	4c 89 f6             	mov    rsi,r14
   2cc8f:	4c 89 ea             	mov    rdx,r13
   2cc92:	83 e0 01             	and    eax,0x1
   2cc95:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2cc9b:	e8 e0 fd fe ff       	call   1ca80 <JS_FreeValue>
   2cca0:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2cca7:	e9 6c 87 ff ff       	jmp    25418 <JS_CallInternal+0x2878>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 12)
   2ccac:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ccb3:	4c 89 ee             	mov    rsi,r13
   2ccb6:	4c 89 f2             	mov    rdx,r14
   2ccb9:	e8 c2 fd fe ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20430 (discriminator 1)
   2ccbe:	e9 65 d6 ff ff       	jmp    2a328 <JS_CallInternal+0x7788>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19795
   2ccc3:	66 49 0f 6e c0       	movq   xmm0,r8
   2ccc8:	f2 41 0f 58 45 00    	addsd  xmm0,QWORD PTR [r13+0x0]
   2ccce:	49 c7 45 08 08 00 00 	mov    QWORD PTR [r13+0x8],0x8
   2ccd5:	00 
   2ccd6:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19797
   2ccdc:	e9 26 92 ff ff       	jmp    25f07 <JS_CallInternal+0x3367>
JS_ThrowOutOfMemory():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7812
   2cce1:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x1
   2cce8:	00 01 
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7813
   2ccea:	48 89 c7             	mov    rdi,rax
   2cced:	31 c0                	xor    eax,eax
   2ccef:	48 8d 35 d5 07 0a 00 	lea    rsi,[rip+0xa07d5]        # cd4cb <_IO_stdin_used+0x4cb>
   2ccf6:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2ccfd:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cd04:	e8 47 64 00 00       	call   33150 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:7814
   2cd09:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2cd10:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x0
   2cd17:	00 00 
   2cd19:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cd20:	e9 82 fe ff ff       	jmp    2cba7 <JS_CallInternal+0xa007>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20473
   2cd25:	4d 89 ec             	mov    r12,r13
   2cd28:	e9 13 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15989
   2cd2d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cd34:	48 8d 35 77 08 0a 00 	lea    rsi,[rip+0xa0877]        # cd5b2 <_IO_stdin_used+0x5b2>
   2cd3b:	31 c0                	xor    eax,eax
   2cd3d:	e8 2e 40 00 00       	call   30d70 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:15990
   2cd42:	e9 f9 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20085
   2cd47:	4d 89 f4             	mov    r12,r14
   2cd4a:	e9 f1 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2cd4f:	3d f2 00 00 00       	cmp    eax,0xf2
   2cd54:	0f 8e 98 ef ff ff    	jle    2bcf2 <JS_CallInternal+0x9152>
   2cd5a:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3445
   2cd61:	89 c0                	mov    eax,eax
   2cd63:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2cd67:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2cd6e:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3446 (discriminator 1)
   2cd72:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2cd75:	83 e8 01             	sub    eax,0x1
   2cd78:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2cd7b:	85 c0                	test   eax,eax
   2cd7d:	0f 8f 6f ef ff ff    	jg     2bcf2 <JS_CallInternal+0x9152>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3448
   2cd83:	e8 98 86 fe ff       	call   15420 <JS_FreeAtomStruct>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:30953
   2cd88:	e9 65 ef ff ff       	jmp    2bcf2 <JS_CallInternal+0x9152>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 20)
   2cd8d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cd94:	45 39 f0             	cmp    r8d,r14d
   2cd97:	4c 89 ee             	mov    rsi,r13
   2cd9a:	4c 89 f2             	mov    rdx,r14
   2cd9d:	0f 94 85 50 fe ff ff 	sete   BYTE PTR [rbp-0x1b0]
   2cda4:	e8 d7 fc fe ff       	call   1ca80 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2cda9:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.h:557
   2cdb0:	e9 ad 84 ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18502
   2cdb5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cdbc:	89 ce                	mov    esi,ecx
   2cdbe:	e8 5d 61 00 00       	call   32f20 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18503
   2cdc3:	e9 21 d6 ff ff       	jmp    2a3e9 <JS_CallInternal+0x7849>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18526
   2cdc8:	4d 89 f4             	mov    r12,r14
   2cdcb:	e9 70 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 12)
   2cdd0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cdd7:	4c 89 ee             	mov    rsi,r13
   2cdda:	4c 89 f2             	mov    rdx,r14
   2cddd:	e8 9e fc fe ff       	call   1ca80 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20429 (discriminator 16)
   2cde2:	31 c0                	xor    eax,eax
   2cde4:	e9 79 84 ff ff       	jmp    25262 <JS_CallInternal+0x26c2>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18535
   2cde9:	e8 32 61 00 00       	call   32f20 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:18526
   2cdee:	4d 89 f4             	mov    r12,r14
   2cdf1:	e9 4a 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2cdf6:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2cdfd:	0f 8e 3d 65 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2ce03:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ce0a:	44 89 ee             	mov    esi,r13d
   2ce0d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ce11:	e8 da c6 fe ff       	call   194f0 <JS_FreeAtom.part.0.isra.0>
   2ce16:	e9 25 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:19047
   2ce1b:	4c 89 eb             	mov    rbx,r13
   2ce1e:	e9 1d 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:3744 (discriminator 1)
   2ce23:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2ce2a:	0f 8e 10 65 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2ce30:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ce37:	44 89 ee             	mov    esi,r13d
   2ce3a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ce3e:	e8 ad c6 fe ff       	call   194f0 <JS_FreeAtom.part.0.isra.0>
   2ce43:	e9 f8 64 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 24)
   2ce48:	b8 01 00 00 00       	mov    eax,0x1
   2ce4d:	e9 66 85 ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20373 (discriminator 17)
   2ce52:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2ce57:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ce5e:	4c 89 f6             	mov    rsi,r14
   2ce61:	4c 89 ea             	mov    rdx,r13
   2ce64:	83 e0 01             	and    eax,0x1
   2ce67:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2ce6d:	e8 0e fc fe ff       	call   1ca80 <JS_FreeValue>
   2ce72:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2ce78:	e9 3b 85 ff ff       	jmp    253b8 <JS_CallInternal+0x2818>
/home/mzyx/read_ic_dequickening_attempt01/SW/quickjs.c:20743
   2ce7d:	e8 5e 4b fe ff       	call   119e0 <__stack_chk_fail@plt>
   2ce82:	b8 01 00 00 00       	mov    eax,0x1
   2ce87:	e9 8c 85 ff ff       	jmp    25418 <JS_CallInternal+0x2878>

Disassembly of section .fini:
