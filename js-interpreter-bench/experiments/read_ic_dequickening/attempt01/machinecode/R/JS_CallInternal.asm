
/home/mzyx/read_ic_dequickening_attempt01/R/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000022ba0 <JS_CallInternal>:
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17770
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
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17771
   22bff:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
   22c06:	00 00 
   22c08:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   22c0c:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   22c10:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   22c17:	8b 87 a8 01 00 00    	mov    eax,DWORD PTR [rdi+0x1a8]
   22c1d:	89 85 e8 fe ff ff    	mov    DWORD PTR [rbp-0x118],eax
   22c23:	83 e8 01             	sub    eax,0x1
   22c26:	89 87 a8 01 00 00    	mov    DWORD PTR [rdi+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   22c2c:	85 c0                	test   eax,eax
   22c2e:	0f 8e 54 05 00 00    	jle    23188 <JS_CallInternal+0x5e8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17810 (discriminator 1)
   22c34:	83 bd d0 fe ff ff ff 	cmp    DWORD PTR [rbp-0x130],0xffffffff
   22c3b:	0f 85 7f 05 00 00    	jne    231c0 <JS_CallInternal+0x620>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17837
   22c41:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22c48:	0f b7 40 12          	movzx  eax,WORD PTR [rax+0x12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17837 (discriminator 1)
   22c4c:	66 83 f8 0d          	cmp    ax,0xd
   22c50:	0f 85 99 07 00 00    	jne    233ef <JS_CallInternal+0x84f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17847
   22c56:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22c5d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
   22c61:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17849
   22c68:	0f b7 78 38          	movzx  edi,WORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17849 (discriminator 1)
   22c6c:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   22c72:	39 c7                	cmp    edi,eax
   22c74:	0f 8f fc 01 00 00    	jg     22e76 <JS_CallInternal+0x2d6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17850
   22c7a:	8b 45 28             	mov    eax,DWORD PTR [rbp+0x28]
   22c7d:	83 e0 02             	and    eax,0x2
   22c80:	0f 45 c7             	cmovne eax,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17855
   22c83:	48 8b 95 d8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17858 (discriminator 1)
   22c8a:	4c 8b bd c0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x140]
js_check_stack_overflow():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2071 (discriminator 1)
   22c91:	49 89 e8             	mov    r8,rbp
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17855
   22c94:	44 0f b7 52 3a       	movzx  r10d,WORD PTR [rdx+0x3a]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17856
   22c99:	0f b7 72 3e          	movzx  esi,WORD PTR [rdx+0x3e]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17857
   22c9d:	0f b7 52 40          	movzx  edx,WORD PTR [rdx+0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17856
   22ca1:	89 f1                	mov    ecx,esi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17855
   22ca3:	44 01 d6             	add    esi,r10d
   22ca6:	4c 89 d3             	mov    rbx,r10
   22ca9:	01 c6                	add    esi,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17857
   22cab:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17855
   22cae:	48 63 f6             	movsxd rsi,esi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17856
   22cb1:	48 8d 34 72          	lea    rsi,[rdx+rsi*2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17855
   22cb5:	48 c1 e6 03          	shl    rsi,0x3
js_check_stack_overflow():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2071 (discriminator 1)
   22cb9:	49 29 f0             	sub    r8,rsi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17858 (discriminator 1)
   22cbc:	4d 3b 87 d0 04 00 00 	cmp    r8,QWORD PTR [r15+0x4d0]
   22cc3:	0f 82 d0 07 00 00    	jb     23499 <JS_CallInternal+0x8f9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17861
   22cc9:	4c 8b bd d8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17863
   22cd0:	44 8b 9d bc fe ff ff 	mov    r11d,DWORD PTR [rbp-0x144]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17867
   22cd7:	48 83 c6 17          	add    rsi,0x17
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17861
   22cdb:	45 0f b6 47 10       	movzx  r8d,BYTE PTR [r15+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17863
   22ce0:	44 89 9d 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r11d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17864
   22ce7:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
   22cee:	4c 8b bd d0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x130]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17861
   22cf5:	44 89 85 3c ff ff ff 	mov    DWORD PTR [rbp-0xc4],r8d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17867
   22cfc:	49 89 f0             	mov    r8,rsi
   22cff:	48 81 e6 00 f0 ff ff 	and    rsi,0xfffffffffffff000
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17864
   22d06:	4c 89 9d 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],r11
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17865
   22d0d:	4d 8b 5b 30          	mov    r11,QWORD PTR [r11+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17867
   22d11:	49 83 e0 f0          	and    r8,0xfffffffffffffff0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17864
   22d15:	4c 89 bd 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],r15
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17865
   22d1c:	4c 89 9d 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],r11
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17867
   22d23:	49 89 e3             	mov    r11,rsp
   22d26:	49 29 f3             	sub    r11,rsi
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
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17862
   22d58:	48 8b b5 a8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x158]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17867
   22d5f:	4c 8d 5c 24 0f       	lea    r11,[rsp+0xf]
   22d64:	49 83 e3 f0          	and    r11,0xfffffffffffffff0
   22d68:	4c 89 9d 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r11
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17862
   22d6f:	48 89 b5 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17868 (discriminator 1)
   22d76:	85 c0                	test   eax,eax
   22d78:	0f 85 ba 61 00 00    	jne    28f38 <JS_CallInternal+0x6398>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17877
   22d7e:	48 98                	cdqe
   22d80:	48 c1 e0 04          	shl    rax,0x4
   22d84:	4c 01 d8             	add    rax,r11
   22d87:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17878
   22d8e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17879
   22d95:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   22d9c:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17881 (discriminator 1)
   22da3:	45 85 d2             	test   r10d,r10d
   22da6:	74 30                	je     22dd8 <JS_CallInternal+0x238>
   22da8:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   22daf:	48 89 de             	mov    rsi,rbx
   22db2:	48 c1 e6 04          	shl    rsi,0x4
   22db6:	48 89 f8             	mov    rax,rdi
   22db9:	48 01 fe             	add    rsi,rdi
   22dbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17882
   22dc0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17881 (discriminator 1)
   22dc7:	48 83 c0 10          	add    rax,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17882
   22dcb:	48 c7 40 f8 03 00 00 	mov    QWORD PTR [rax-0x8],0x3
   22dd2:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17881 (discriminator 1)
   22dd3:	48 39 f0             	cmp    rax,rsi
   22dd6:	75 e8                	jne    22dc0 <JS_CallInternal+0x220>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17885
   22dd8:	0f b7 f9             	movzx  edi,cx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17884
   22ddb:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   22de2:	48 c1 e3 04          	shl    rbx,0x4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17885
   22de6:	48 89 f9             	mov    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17884
   22de9:	48 01 c3             	add    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17885
   22dec:	48 c1 e1 04          	shl    rcx,0x4
   22df0:	48 8d 3c 0b          	lea    rdi,[rbx+rcx*1]
   22df4:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17886 (discriminator 1)
   22dfb:	66 45 85 c9          	test   r9w,r9w
   22dff:	74 0b                	je     22e0c <JS_CallInternal+0x26c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17887
   22e01:	48 c1 e2 03          	shl    rdx,0x3
   22e05:	31 f6                	xor    esi,esi
   22e07:	e8 a4 ec fe ff       	call   11ab0 <memset@plt>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17889
   22e0c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17890
   22e13:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17884
   22e1a:	48 89 9d 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17889
   22e21:	48 8b 41 18          	mov    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17892
   22e25:	48 8b 49 48          	mov    rcx,QWORD PTR [rcx+0x48]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17890
   22e29:	48 8b 97 f0 04 00 00 	mov    rdx,QWORD PTR [rdi+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17892
   22e30:	48 89 8d e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17836
   22e37:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17890
   22e3e:	48 89 95 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17891
   22e45:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
   22e4c:	48 89 97 f0 04 00 00 	mov    QWORD PTR [rdi+0x4f0],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17836
   22e53:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17775
   22e5a:	48 89 95 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17899
   22e61:	4c 8d 60 01          	lea    r12,[rax+0x1]
   22e65:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   22e68:	4c 8d 3d 11 cf 0d 00 	lea    r15,[rip+0xdcf11]        # ffd80 <dispatch_table.86>
   22e6f:	49 89 c5             	mov    r13,rax
   22e72:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17850
   22e76:	89 f8                	mov    eax,edi
   22e78:	e9 06 fe ff ff       	jmp    22c83 <JS_CallInternal+0xe3>
   22e7d:	f3 0f 1e fa          	endbr64
   22e81:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   22e88:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17922
   22e8c:	41 8d 85 4d ff ff ff 	lea    eax,[r13-0xb3]
   22e93:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   22e9a:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17923
   22e9b:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17922
   22e9f:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   22ea3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17923
   22ea7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   22ead:	49 89 c5             	mov    r13,rax
   22eb0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   22eb4:	ff e0                	jmp    rax
   22eb6:	f3 0f 1e fa          	endbr64
   22eba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   22ec0:	f3 0f 1e fa          	endbr64
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   22ec4:	41 8b 44 24 04       	mov    eax,DWORD PTR [r12+0x4]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20529
   22ec9:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20526
   22ece:	4d 8d 74 24 09       	lea    r14,[r12+0x9]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   22ed3:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20530
   22ed7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   22ede:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20525
   22ee4:	41 0f b6 44 24 08    	movzx  eax,BYTE PTR [r12+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20529
   22eea:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20530
   22ef1:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20525
   22ef8:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20527
   22efe:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   22f05:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20530
   22f0b:	49 89 d4             	mov    r12,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20527
   22f0e:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20530
   22f12:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   22f19:	48 89 c6             	mov    rsi,rax
   22f1c:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
   22f23:	e8 08 b5 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20531 (discriminator 1)
   22f28:	85 c0                	test   eax,eax
   22f2a:	0f 88 76 07 00 00    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20533
   22f30:	0f 84 15 61 00 00    	je     2904b <JS_CallInternal+0x64ab>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20534
   22f36:	80 bd 40 fe ff ff 00 	cmp    BYTE PTR [rbp-0x1c0],0x0
   22f3d:	0f 85 d9 05 00 00    	jne    2351c <JS_CallInternal+0x97c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20541
   22f43:	41 83 ed 71          	sub    r13d,0x71
   22f47:	41 83 fd 04          	cmp    r13d,0x4
   22f4b:	0f 87 20 05 00 00    	ja     23471 <JS_CallInternal+0x8d1>
   22f51:	48 8d 15 f8 41 0b 00 	lea    rdx,[rip+0xb41f8]        # d7150 <qjsc_repl_size+0x444>
   22f58:	4a 63 04 aa          	movsxd rax,DWORD PTR [rdx+r13*4]
   22f5c:	48 01 d0             	add    rax,rdx
   22f5f:	3e ff e0             	notrack jmp rax
   22f62:	f3 0f 1e fa          	endbr64
   22f66:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18201
   22f6a:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18200
   22f71:	45 8d 95 14 ff ff ff 	lea    r10d,[r13-0xec]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18210
   22f78:	4d 63 da             	movsxd r11,r10d
   22f7b:	49 89 de             	mov    r14,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18211
   22f7e:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18212
   22f85:	45 89 d1             	mov    r9d,r10d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18210
   22f88:	49 c1 e3 04          	shl    r11,0x4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18211
   22f8c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18212
   22f93:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22f9a:	41 b8 03 00 00 00    	mov    r8d,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18210
   22fa0:	4d 29 de             	sub    r14,r11
   22fa3:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18212
   22faa:	49 8b 76 f0          	mov    rsi,QWORD PTR [r14-0x10]
   22fae:	49 8b 56 f8          	mov    rdx,QWORD PTR [r14-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18211
   22fb2:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18212
   22fb6:	31 c9                	xor    ecx,ecx
   22fb8:	6a 00                	push   0x0
   22fba:	4d 8d 66 f0          	lea    r12,[r14-0x10]
   22fbe:	41 56                	push   r14
   22fc0:	6a 03                	push   0x3
   22fc2:	6a 00                	push   0x0
   22fc4:	44 89 95 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r10d
   22fcb:	e8 d0 fb ff ff       	call   22ba0 <JS_CallInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18214 (discriminator 2)
   22fd0:	48 83 c4 20          	add    rsp,0x20
   22fd4:	44 8b 95 40 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c0]
   22fdb:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   22fe2:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18212
   22fe5:	49 89 c1             	mov    r9,rax
   22fe8:	49 89 d0             	mov    r8,rdx
   22feb:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18214 (discriminator 2)
   22fee:	0f 84 60 65 00 00    	je     29554 <JS_CallInternal+0x69b4>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18216
   22ff4:	41 83 fd 23          	cmp    r13d,0x23
   22ff8:	0f 84 95 02 00 00    	je     23293 <JS_CallInternal+0x6f3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18218 (discriminator 1)
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
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18219
   23029:	49 8b 4d 08          	mov    rcx,QWORD PTR [r13+0x8]
   2302d:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23031:	83 f9 f6             	cmp    ecx,0xfffffff6
   23034:	76 ea                	jbe    23020 <JS_CallInternal+0x480>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23036:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23039:	8d 50 ff             	lea    edx,[rax-0x1]
   2303c:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2303f:	85 d2                	test   edx,edx
   23041:	7f dd                	jg     23020 <JS_CallInternal+0x480>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   23043:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2304a:	48 89 ca             	mov    rdx,rcx
   2304d:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18218 (discriminator 1)
   23054:	49 83 c5 10          	add    r13,0x10
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   23058:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2305c:	e8 3f 98 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   23061:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18218 (discriminator 1)
   23068:	4d 39 c5             	cmp    r13,r8
   2306b:	75 bc                	jne    23029 <JS_CallInternal+0x489>
   2306d:	0f 1f 00             	nop    DWORD PTR [rax]
   23070:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23077:	45 89 e2             	mov    r10d,r12d
   2307a:	4d 89 f1             	mov    r9,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18220
   2307d:	41 8d 42 01          	lea    eax,[r10+0x1]
   23081:	48 98                	cdqe
   23083:	48 c1 e0 04          	shl    rax,0x4
   23087:	48 89 c2             	mov    rdx,rax
   2308a:	48 89 d8             	mov    rax,rbx
   2308d:	48 29 d0             	sub    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18221
   23090:	4c 89 08             	mov    QWORD PTR [rax],r9
   23093:	48 8d 58 10          	lea    rbx,[rax+0x10]
   23097:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18223
   2309b:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   230a2:	4c 8d 60 01          	lea    r12,[rax+0x1]
   230a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   230a9:	49 89 c5             	mov    r13,rax
   230ac:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   230b0:	f3 0f 1e fa          	endbr64
   230b4:	f3 0f 1e fa          	endbr64
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   230b8:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5847
   230bc:	31 f6                	xor    esi,esi
   230be:	b9 01 00 00 00       	mov    ecx,0x1
   230c3:	ba 02 00 00 00       	mov    edx,0x2
   230c8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   230cf:	45 0f b7 74 24 04    	movzx  r14d,WORD PTR [r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   230d5:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18808
   230db:	49 8d 44 24 06       	lea    rax,[r12+0x6]
   230e0:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18809
   230e7:	48 8d 43 10          	lea    rax,[rbx+0x10]
   230eb:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5847
   230f2:	e8 19 3b 02 00       	call   46c10 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18809
   230f7:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18810 (discriminator 2)
   230fb:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18809
   230ff:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18810 (discriminator 2)
   23102:	0f 84 23 02 00 00    	je     2332b <JS_CallInternal+0x78b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18812
   23108:	41 83 fd 78          	cmp    r13d,0x78
   2310c:	0f 85 ed 01 00 00    	jne    232ff <JS_CallInternal+0x75f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18813
   23112:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   23119:	4e 8b 2c f0          	mov    r13,QWORD PTR [rax+r14*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18814 (discriminator 1)
   2311d:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18820
   23122:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   23125:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   2312b:	b9 22 00 00 00       	mov    ecx,0x22
   23130:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23137:	e8 84 32 02 00       	call   463c0 <add_property>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18822
   2313c:	48 85 c0             	test   rax,rax
   2313f:	0f 84 66 8e 00 00    	je     2bfab <JS_CallInternal+0x940b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18826
   23145:	4c 89 28             	mov    QWORD PTR [rax],r13
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3633
   23148:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
   2314e:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18827
   23150:	48 83 c3 20          	add    rbx,0x20
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3633
   23154:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18829
   2315b:	49 83 c4 07          	add    r12,0x7
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3633
   2315f:	e8 1c 11 01 00       	call   34280 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18827
   23164:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2316b:	48 89 01             	mov    QWORD PTR [rcx],rax
   2316e:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18829
   23172:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23178:	49 89 c5             	mov    r13,rax
   2317b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2317f:	ff e0                	jmp    rax
   23181:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   23188:	e8 83 02 01 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17808 (discriminator 1)
   2318d:	85 c0                	test   eax,eax
   2318f:	0f 84 9f fa ff ff    	je     22c34 <JS_CallInternal+0x94>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17809
   23195:	31 c0                	xor    eax,eax
   23197:	ba 06 00 00 00       	mov    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20734
   2319c:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   231a0:	64 48 2b 0c 25 28 00 	sub    rcx,QWORD PTR fs:0x28
   231a7:	00 00 
   231a9:	0f 85 89 9c 00 00    	jne    2ce38 <JS_CallInternal+0xa298>
   231af:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
   231b3:	5b                   	pop    rbx
   231b4:	41 5c                	pop    r12
   231b6:	41 5d                	pop    r13
   231b8:	41 5e                	pop    r14
   231ba:	41 5f                	pop    r15
   231bc:	5d                   	pop    rbp
   231bd:	c3                   	ret
   231be:	66 90                	xchg   ax,ax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17811
   231c0:	f6 45 28 04          	test   BYTE PTR [rbp+0x28],0x4
   231c4:	0f 84 d6 03 00 00    	je     235a0 <JS_CallInternal+0xa00>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17815
   231ca:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17816
   231d1:	48 8b 48 58          	mov    rcx,QWORD PTR [rax+0x58]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17820
   231d5:	48 8b 50 68          	mov    rdx,QWORD PTR [rax+0x68]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17815
   231d9:	48 8d 78 50          	lea    rdi,[rax+0x50]
   231dd:	48 89 bd c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17817
   231e4:	48 8b 59 28          	mov    rbx,QWORD PTR [rcx+0x28]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17816
   231e8:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17819
   231ef:	48 8b 49 30          	mov    rcx,QWORD PTR [rcx+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17820
   231f3:	48 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17818
   231fa:	48 8b 73 48          	mov    rsi,QWORD PTR [rbx+0x48]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17817
   231fe:	48 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17819
   23205:	48 89 8d 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17821
   2320c:	48 89 c1             	mov    rcx,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17818
   2320f:	48 89 b5 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17821
   23216:	48 8b 70 70          	mov    rsi,QWORD PTR [rax+0x70]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17822
   2321a:	0f b7 43 3a          	movzx  eax,WORD PTR [rbx+0x3a]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17825
   2321e:	4c 8b a1 80 00 00 00 	mov    r12,QWORD PTR [rcx+0x80]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17821
   23225:	48 89 b5 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17823
   2322c:	48 8b 99 90 00 00 00 	mov    rbx,QWORD PTR [rcx+0x90]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17824
   23233:	48 c7 81 90 00 00 00 	mov    QWORD PTR [rcx+0x90],0x0
   2323a:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17822
   2323e:	48 c1 e0 04          	shl    rax,0x4
   23242:	48 01 f0             	add    rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17826
   23245:	48 8b b5 c0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17822
   2324c:	48 89 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17826
   23253:	48 8b 86 f0 04 00 00 	mov    rax,QWORD PTR [rsi+0x4f0]
   2325a:	48 89 41 50          	mov    QWORD PTR [rcx+0x50],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17827
   2325e:	48 89 be f0 04 00 00 	mov    QWORD PTR [rsi+0x4f0],rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17828
   23265:	8b 79 24             	mov    edi,DWORD PTR [rcx+0x24]
   23268:	85 ff                	test   edi,edi
   2326a:	0f 84 9d 02 00 00    	je     2350d <JS_CallInternal+0x96d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17820
   23270:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
   23277:	48 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rax
   2327e:	e9 bd 00 00 00       	jmp    23340 <JS_CallInternal+0x7a0>
   23283:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18288
   23287:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2328b:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2328f:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20723 (discriminator 1)
   23293:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   2329a:	66 83 7f 40 00       	cmp    WORD PTR [rdi+0x40],0x0
   2329f:	0f 85 c5 6e 00 00    	jne    2a16a <JS_CallInternal+0x75ca>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20728 (discriminator 1)
   232a5:	4c 8b a5 30 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d0]
   232ac:	49 39 dc             	cmp    r12,rbx
   232af:	0f 83 1a 01 00 00    	jae    233cf <JS_CallInternal+0x82f>
   232b5:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   232bc:	49 89 ce             	mov    r14,rcx
   232bf:	49 89 c7             	mov    r15,rax
   232c2:	eb 11                	jmp    232d5 <JS_CallInternal+0x735>
   232c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20728 (discriminator 3)
   232c8:	49 83 c4 10          	add    r12,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20728 (discriminator 1)
   232cc:	49 39 dc             	cmp    r12,rbx
   232cf:	0f 83 b9 01 00 00    	jae    2348e <JS_CallInternal+0x8ee>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20729
   232d5:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
   232da:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   232de:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   232e2:	76 e4                	jbe    232c8 <JS_CallInternal+0x728>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   232e4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   232e7:	8d 50 ff             	lea    edx,[rax-0x1]
   232ea:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   232ed:	85 d2                	test   edx,edx
   232ef:	7f d7                	jg     232c8 <JS_CallInternal+0x728>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   232f1:	49 8b 7d 10          	mov    rdi,QWORD PTR [r13+0x10]
   232f5:	4c 89 c2             	mov    rdx,r8
   232f8:	e8 a3 95 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   232fd:	eb c9                	jmp    232c8 <JS_CallInternal+0x728>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18816
   232ff:	31 c9                	xor    ecx,ecx
   23301:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   23308:	41 83 fd 77          	cmp    r13d,0x77
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18807 (discriminator 1)
   2330c:	41 0f b7 d6          	movzx  edx,r14w
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18816
   23310:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23317:	0f 94 c1             	sete   cl
   2331a:	e8 51 89 02 00       	call   4bc70 <get_var_ref>
   2331f:	49 89 c5             	mov    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18817
   23322:	48 85 c0             	test   rax,rax
   23325:	0f 85 f7 fd ff ff    	jne    23122 <JS_CallInternal+0x582>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18809
   2332b:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18808
   23332:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
   23339:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20686
   23340:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
is_backtrace_needed():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7644
   23347:	83 b9 e0 04 00 00 ff 	cmp    DWORD PTR [rcx+0x4e0],0xffffffff
   2334e:	48 8b 81 d8 04 00 00 	mov    rax,QWORD PTR [rcx+0x4d8]
   23355:	75 39                	jne    23390 <JS_CallInternal+0x7f0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7647
   23357:	66 83 78 12 03       	cmp    WORD PTR [rax+0x12],0x3
   2335c:	75 32                	jne    23390 <JS_CallInternal+0x7f0>
find_own_property1():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6130
   2335e:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6131
   23362:	8b 51 18             	mov    edx,DWORD PTR [rcx+0x18]
   23365:	89 d0                	mov    eax,edx
   23367:	83 e0 39             	and    eax,0x39
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6132
   2336a:	8b 44 81 38          	mov    eax,DWORD PTR [rcx+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6134
   2336e:	48 85 c0             	test   rax,rax
   23371:	0f 84 d6 67 00 00    	je     29b4d <JS_CallInternal+0x6fad>
   23377:	48 8d 14 95 34 00 00 	lea    rdx,[rdx*4+0x34]
   2337e:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6135
   2337f:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
   23383:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6136 (discriminator 1)
   23386:	83 78 04 39          	cmp    DWORD PTR [rax+0x4],0x39
   2338a:	0f 85 b0 67 00 00    	jne    29b40 <JS_CallInternal+0x6fa0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20693
   23390:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   23397:	80 b8 e8 04 00 00 00 	cmp    BYTE PTR [rax+0x4e8],0x0
   2339e:	0f 84 39 01 00 00    	je     234dd <JS_CallInternal+0x93d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20717
   233a4:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20713
   233ab:	b9 06 00 00 00       	mov    ecx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20717
   233b0:	f6 40 11 30          	test   BYTE PTR [rax+0x11],0x30
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20713
   233b4:	b8 00 00 00 00       	mov    eax,0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20717
   233b9:	0f 84 d4 fe ff ff    	je     23293 <JS_CallInternal+0x6f3>
   233bf:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20719
   233c0:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   233c7:	4c 89 67 30          	mov    QWORD PTR [rdi+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20720
   233cb:	48 89 5f 40          	mov    QWORD PTR [rdi+0x40],rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20732
   233cf:	48 8b 9d c8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x138]
   233d6:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   233d9:	48 8b 9d c0 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x140]
   233e0:	48 89 93 f0 04 00 00 	mov    QWORD PTR [rbx+0x4f0],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20733
   233e7:	48 89 ca             	mov    rdx,rcx
   233ea:	e9 ad fd ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17839
   233ef:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   233f6:	48 8d 04 80          	lea    rax,[rax+rax*4]
   233fa:	48 c1 e0 03          	shl    rax,0x3
   233fe:	48 03 81 58 04 00 00 	add    rax,QWORD PTR [rcx+0x458]
   23405:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17840
   23409:	48 85 c0             	test   rax,rax
   2340c:	0f 84 8e 01 00 00    	je     235a0 <JS_CallInternal+0xa00>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17844
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
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3633
   2344f:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   23455:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2345c:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20587
   2345e:	4c 8d 63 10          	lea    r12,[rbx+0x10]
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3633
   23462:	e8 19 0e 01 00       	call   34280 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20587
   23467:	48 89 03             	mov    QWORD PTR [rbx],rax
   2346a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   2346e:	4c 89 e3             	mov    rbx,r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20605
   23471:	8b 85 28 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1d8]
   23477:	83 e8 05             	sub    eax,0x5
   2347a:	48 98                	cdqe
   2347c:	49 01 c6             	add    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20613
   2347f:	41 0f b6 06          	movzx  eax,BYTE PTR [r14]
   23483:	4d 8d 66 01          	lea    r12,[r14+0x1]
   23487:	49 89 c5             	mov    r13,rax
   2348a:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2348e:	4c 89 f1             	mov    rcx,r14
   23491:	4c 89 f8             	mov    rax,r15
   23494:	e9 36 ff ff ff       	jmp    233cf <JS_CallInternal+0x82f>
JS_ThrowStackOverflow():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7812
   23499:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   234a0:	48 8d 35 2b a0 0a 00 	lea    rsi,[rip+0xaa02b]        # cd4d2 <_IO_stdin_used+0x4d2>
   234a7:	31 c0                	xor    eax,eax
   234a9:	e8 e2 fd 00 00       	call   33290 <JS_ThrowInternalError>
   234ae:	e9 e9 fc ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   234b3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   234ba:	4c 89 ee             	mov    rsi,r13
   234bd:	4c 89 f2             	mov    rdx,r14
   234c0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   234c4:	e8 d7 93 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   234c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20697
   234d0:	41 83 fe 05          	cmp    r14d,0x5
   234d4:	0f 84 a6 61 00 00    	je     29680 <JS_CallInternal+0x6ae0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20695
   234da:	4c 89 fb             	mov    rbx,r15
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20694
   234dd:	48 39 9d 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],rbx
   234e4:	0f 83 ba fe ff ff    	jae    233a4 <JS_CallInternal+0x804>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20695
   234ea:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   234ee:	4c 8d 7b f0          	lea    r15,[rbx-0x10]
   234f2:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   234f6:	41 83 fe f6          	cmp    r14d,0xfffffff6
   234fa:	76 d4                	jbe    234d0 <JS_CallInternal+0x930>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   234fc:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   23500:	83 e8 01             	sub    eax,0x1
   23503:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   23507:	85 c0                	test   eax,eax
   23509:	7f c5                	jg     234d0 <JS_CallInternal+0x930>
   2350b:	eb a6                	jmp    234b3 <JS_CallInternal+0x913>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17820
   2350d:	48 89 95 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17825
   23514:	4c 89 e0             	mov    rax,r12
   23517:	e9 45 f9 ff ff       	jmp    22e61 <JS_CallInternal+0x2c1>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   2351c:	48 83 ec 08          	sub    rsp,0x8
   23520:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   23527:	48 8b b5 10 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1f0]
   2352e:	b9 f1 00 00 00       	mov    ecx,0xf1
   23533:	6a 00                	push   0x0
   23535:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2353c:	4c 89 e2             	mov    rdx,r12
   2353f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23546:	e8 f5 9a 00 00       	call   2d040 <JS_GetPropertyInternal>
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16015 (discriminator 1)
   2354b:	59                   	pop    rcx
   2354c:	5e                   	pop    rsi
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   2354d:	49 89 c0             	mov    r8,rax
   23550:	49 89 d4             	mov    r12,rdx
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16015 (discriminator 1)
   23553:	83 fa 06             	cmp    edx,0x6
   23556:	0f 84 4a 01 00 00    	je     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16018 (discriminator 1)
   2355c:	83 fa ff             	cmp    edx,0xffffffff
   2355f:	0f 84 85 5a 00 00    	je     28fea <JS_CallInternal+0x644a>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23565:	83 fa f6             	cmp    edx,0xfffffff6
   23568:	0f 86 d5 f9 ff ff    	jbe    22f43 <JS_CallInternal+0x3a3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2356e:	8b 40 fc             	mov    eax,DWORD PTR [rax-0x4]
   23571:	83 e8 01             	sub    eax,0x1
   23574:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   23578:	85 c0                	test   eax,eax
   2357a:	0f 8f c3 f9 ff ff    	jg     22f43 <JS_CallInternal+0x3a3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   23580:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23587:	4c 89 c6             	mov    rsi,r8
   2358a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2358e:	e8 0d 93 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20538
   23593:	e9 ab f9 ff ff       	jmp    22f43 <JS_CallInternal+0x3a3>
   23598:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2359f:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17842
   235a0:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   235a7:	48 8d 35 17 b6 0a 00 	lea    rsi,[rip+0xab617]        # cebc5 <_IO_stdin_used+0x1bc5>
   235ae:	31 c0                	xor    eax,eax
   235b0:	e8 fb d8 00 00       	call   30eb0 <JS_ThrowTypeError>
   235b5:	e9 e2 fb ff ff       	jmp    2319c <JS_CallInternal+0x5fc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20592
   235ba:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   235c1:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   235c8:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   235ce:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   235d5:	48 89 c6             	mov    rsi,rax
   235d8:	49 89 c5             	mov    r13,rax
   235db:	49 89 d4             	mov    r12,rdx
   235de:	e8 4d ae 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20593 (discriminator 1)
   235e3:	85 c0                	test   eax,eax
   235e5:	0f 88 bb 00 00 00    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20596
   235eb:	b8 03 00 00 00       	mov    eax,0x3
   235f0:	b9 00 00 00 00       	mov    ecx,0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20595
   235f5:	0f 85 88 76 00 00    	jne    2ac83 <JS_CallInternal+0x80e3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20602
   235fb:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   235fe:	48 83 c3 10          	add    rbx,0x10
   23602:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20603
   23606:	e9 66 fe ff ff       	jmp    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20562
   2360b:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23612:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23619:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2361f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23626:	48 89 c6             	mov    rsi,rax
   23629:	e8 02 ae 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20563 (discriminator 1)
   2362e:	85 c0                	test   eax,eax
   23630:	0f 8e 89 89 00 00    	jle    2bfbf <JS_CallInternal+0x941f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20571
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
   23670:	e8 fb a6 00 00       	call   2dd70 <JS_SetPropertyInternal>
   23675:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23679:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2367d:	48 83 c4 20          	add    rsp,0x20
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20571
   23681:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23684:	83 fa f6             	cmp    edx,0xfffffff6
   23687:	76 11                	jbe    2369a <JS_CallInternal+0xafa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23689:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2368c:	83 e8 01             	sub    eax,0x1
   2368f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23692:	85 c0                	test   eax,eax
   23694:	0f 8e 60 89 00 00    	jle    2bffa <JS_CallInternal+0x945a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20574
   2369a:	4c 89 e3             	mov    rbx,r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20575 (discriminator 1)
   2369d:	45 85 ed             	test   r13d,r13d
   236a0:	0f 89 cb fd ff ff    	jns    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20526
   236a6:	4d 89 f4             	mov    r12,r14
   236a9:	e9 92 fc ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20544
   236ae:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   236b5:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   236bc:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   236c2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   236c9:	48 89 c6             	mov    rsi,rax
   236cc:	49 89 c5             	mov    r13,rax
   236cf:	49 89 d4             	mov    r12,rdx
   236d2:	e8 59 ad 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20545 (discriminator 1)
   236d7:	85 c0                	test   eax,eax
   236d9:	0f 8e 29 8c 00 00    	jle    2c308 <JS_CallInternal+0x9768>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   236df:	48 83 ec 08          	sub    rsp,0x8
   236e3:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   236e9:	4c 89 ee             	mov    rsi,r13
   236ec:	4c 89 e2             	mov    rdx,r12
   236ef:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   236f6:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   236fd:	6a 00                	push   0x0
   236ff:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23706:	e8 35 99 00 00       	call   2d040 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20555 (discriminator 2)
   2370b:	41 59                	pop    r9
   2370d:	41 5a                	pop    r10
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   2370f:	48 89 c1             	mov    rcx,rax
   23712:	48 89 d0             	mov    rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20555 (discriminator 2)
   23715:	83 fa 06             	cmp    edx,0x6
   23718:	74 8c                	je     236a6 <JS_CallInternal+0xb06>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   2371a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2371e:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   23722:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   23726:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2372a:	83 fa f6             	cmp    edx,0xfffffff6
   2372d:	0f 86 3e fd ff ff    	jbe    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23733:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23736:	83 e8 01             	sub    eax,0x1
   23739:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2373c:	85 c0                	test   eax,eax
   2373e:	0f 8f 2d fd ff ff    	jg     23471 <JS_CallInternal+0x8d1>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   23744:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2374b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2374f:	e8 4c 91 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20559
   23754:	e9 18 fd ff ff       	jmp    23471 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20579
   23759:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23760:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   23766:	45 31 c0             	xor    r8d,r8d
   23769:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23770:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23777:	48 89 c6             	mov    rsi,rax
   2377a:	e8 11 7c 02 00       	call   4b390 <JS_DeleteProperty>
   2377f:	41 89 c4             	mov    r12d,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20580 (discriminator 1)
   23782:	85 c0                	test   eax,eax
   23784:	0f 88 1c ff ff ff    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20582
   2378a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2378e:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23792:	83 fa f6             	cmp    edx,0xfffffff6
   23795:	76 11                	jbe    237a8 <JS_CallInternal+0xc08>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23797:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2379a:	83 e8 01             	sub    eax,0x1
   2379d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   237a0:	85 c0                	test   eax,eax
   237a2:	0f 8e c2 8c 00 00    	jle    2c46a <JS_CallInternal+0x98ca>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   237a8:	31 c0                	xor    eax,eax
   237aa:	45 85 e4             	test   r12d,r12d
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20583
   237ad:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   237b4:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   237b5:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20583
   237b8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20584
   237bc:	e9 b0 fc ff ff       	jmp    23471 <JS_CallInternal+0x8d1>
   237c1:	f3 0f 1e fa          	endbr64
   237c5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18518
   237c9:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   237ce:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18517
   237d5:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18518
   237da:	48 8b 14 c1          	mov    rdx,QWORD PTR [rcx+rax*8]
   237de:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
   237e5:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18519
   237e6:	48 8b 42 18          	mov    rax,QWORD PTR [rdx+0x18]
   237ea:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18519 (discriminator 2)
   237ee:	83 f9 04             	cmp    ecx,0x4
   237f1:	0f 84 89 62 00 00    	je     29a80 <JS_CallInternal+0x6ee0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18519 (discriminator 1)
   237f7:	80 7a 12 00          	cmp    BYTE PTR [rdx+0x12],0x0
   237fb:	0f 85 7f 62 00 00    	jne    29a80 <JS_CallInternal+0x6ee0>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   23801:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   23806:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   23809:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2380c:	83 f9 f6             	cmp    ecx,0xfffffff6
   2380f:	76 11                	jbe    23822 <JS_CallInternal+0xc82>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23811:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23814:	83 e8 01             	sub    eax,0x1
   23817:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2381a:	85 c0                	test   eax,eax
   2381c:	0f 8e cc 6a 00 00    	jle    2a2ee <JS_CallInternal+0x774e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18548
   23822:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18551
   23826:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2382c:	49 83 c4 03          	add    r12,0x3
   23830:	49 89 c5             	mov    r13,rax
   23833:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23837:	ff e0                	jmp    rax
   23839:	f3 0f 1e fa          	endbr64
   2383d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19412
   23841:	48 83 ec 08          	sub    rsp,0x8
   23845:	31 c0                	xor    eax,eax
   23847:	41 83 fd 54          	cmp    r13d,0x54
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19410
   2384b:	41 0f b6 4c 24 04    	movzx  ecx,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19412
   23851:	0f 94 c0             	sete   al
   23854:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   23858:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19411
   2385b:	4d 8d 74 24 05       	lea    r14,[r12+0x5]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19412
   23860:	4c 8b 8d c8 fe ff ff 	mov    r9,QWORD PTR [rbp-0x138]
   23867:	4c 8b 85 98 fe ff ff 	mov    r8,QWORD PTR [rbp-0x168]
   2386e:	50                   	push   rax
   2386f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23876:	e8 45 5a 06 00       	call   892c0 <js_op_define_class>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19412 (discriminator 1)
   2387b:	41 59                	pop    r9
   2387d:	41 5a                	pop    r10
   2387f:	85 c0                	test   eax,eax
   23881:	0f 88 c8 87 00 00    	js     2c04f <JS_CallInternal+0x94af>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19417
   23887:	41 0f b6 44 24 05    	movzx  eax,BYTE PTR [r12+0x5]
   2388d:	49 83 c4 06          	add    r12,0x6
   23891:	49 89 c5             	mov    r13,rax
   23894:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23898:	ff e0                	jmp    rax
   2389a:	f3 0f 1e fa          	endbr64
   2389e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19356
   238a2:	41 83 fd 52          	cmp    r13d,0x52
   238a6:	0f 94 c0             	sete   al
   238a9:	41 0f 94 c6          	sete   r14b
   238ad:	0f b6 c0             	movzx  eax,al
   238b0:	89 85 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19357
   238b6:	45 84 f6             	test   r14b,r14b
   238b9:	0f 85 c9 5f 00 00    	jne    29888 <JS_CallInternal+0x6ce8>
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   238bf:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19364
   238c3:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   238c8:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19368
   238ce:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   238d4:	b8 fe ff ff ff       	mov    eax,0xfffffffe
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19366
   238d9:	41 0f b6 55 00       	movzx  edx,BYTE PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19375
   238de:	bf 03 00 00 00       	mov    edi,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19374
   238e3:	48 c7 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],0x0
   238ea:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   238ee:	4c 8d 63 f0          	lea    r12,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19368
   238f2:	29 c8                	sub    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19375
   238f4:	48 89 bd 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19368
   238fb:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19376
   238fd:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19374
   23904:	48 c7 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],0x3
   2390b:	03 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19368
   2390f:	48 c1 e0 04          	shl    rax,0x4
   23913:	48 8b 0c 03          	mov    rcx,QWORD PTR [rbx+rax*1]
   23917:	48 8b 44 03 08       	mov    rax,QWORD PTR [rbx+rax*1+0x8]
   2391c:	48 89 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19371
   23923:	89 d0                	mov    eax,edx
   23925:	83 e0 04             	and    eax,0x4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19368
   23928:	48 89 8d c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19369
   2392f:	3c 01                	cmp    al,0x1
   23931:	19 c0                	sbb    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19375
   23933:	31 f6                	xor    esi,esi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19369
   23935:	83 e0 fc             	and    eax,0xfffffffc
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19375
   23938:	48 89 b5 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19376
   2393f:	48 89 b5 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19369
   23946:	05 05 45 00 00       	add    eax,0x4505
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19377
   2394b:	83 e2 03             	and    edx,0x3
   2394e:	0f 85 72 57 00 00    	jne    290c6 <JS_CallInternal+0x6526>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19378
   23954:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19379
   23958:	0d 02 22 00 00       	or     eax,0x2202
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   2395d:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19379
   23963:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   23969:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19378
   23970:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
   23977:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2397b:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2397f:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   23986:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19387
   2398d:	48 89 8d d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rcx
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   23994:	e8 f7 cf 01 00       	call   40990 <js_get_function_name>
   23999:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5943 (discriminator 1)
   2399c:	41 83 f9 06          	cmp    r9d,0x6
   239a0:	0f 84 3e 6a 00 00    	je     2a3e4 <JS_CallInternal+0x7844>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5945
   239a6:	48 83 ec 08          	sub    rsp,0x8
   239aa:	49 89 c0             	mov    r8,rax
   239ad:	b9 3a 00 00 00       	mov    ecx,0x3a
   239b2:	48 8b 95 d0 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x230]
   239b9:	48 8b b5 d8 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x228]
   239c0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   239c7:	6a 01                	push   0x1
   239c9:	48 89 95 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],rdx
   239d0:	48 89 b5 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],rsi
   239d7:	e8 54 c6 00 00       	call   30030 <JS_DefinePropertyValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5945 (discriminator 1)
   239dc:	41 5b                	pop    r11
   239de:	5a                   	pop    rdx
   239df:	85 c0                	test   eax,eax
   239e1:	0f 88 fd 69 00 00    	js     2a3e4 <JS_CallInternal+0x7844>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5948
   239e7:	4c 8b 95 c8 fd ff ff 	mov    r10,QWORD PTR [rbp-0x238]
   239ee:	48 8b 85 c0 fd ff ff 	mov    rax,QWORD PTR [rbp-0x240]
   239f5:	48 8b b5 b0 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x250]
   239fc:	48 8b 95 b8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x248]
   23a03:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23a0a:	4c 89 d1             	mov    rcx,r10
   23a0d:	49 89 c0             	mov    r8,rax
   23a10:	4c 89 95 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],r10
   23a17:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   23a1e:	e8 fd a6 ff ff       	call   1e120 <js_method_set_home_object>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19389
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
   23a6f:	e8 2c b7 00 00       	call   2f1a0 <JS_DefineProperty>
   23a74:	48 83 c4 30          	add    rsp,0x30
   23a78:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19392
   23a7a:	49 8b 54 24 08       	mov    rdx,QWORD PTR [r12+0x8]
   23a7f:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23a83:	83 fa f6             	cmp    edx,0xfffffff6
   23a86:	76 11                	jbe    23a99 <JS_CallInternal+0xef9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23a88:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23a8b:	83 e8 01             	sub    eax,0x1
   23a8e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23a91:	85 c0                	test   eax,eax
   23a93:	0f 8e 97 68 00 00    	jle    2a330 <JS_CallInternal+0x7790>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19393
   23a99:	45 84 f6             	test   r14b,r14b
   23a9c:	0f 85 3c 58 00 00    	jne    292de <JS_CallInternal+0x673e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19397
   23aa2:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19366
   23aa8:	4d 8d 65 01          	lea    r12,[r13+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19397
   23aac:	83 c0 01             	add    eax,0x1
   23aaf:	48 98                	cdqe
   23ab1:	48 c1 e0 04          	shl    rax,0x4
   23ab5:	48 29 c3             	sub    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19398 (discriminator 1)
   23ab8:	85 c9                	test   ecx,ecx
   23aba:	0f 88 80 f8 ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19401
   23ac0:	41 0f b6 45 01       	movzx  eax,BYTE PTR [r13+0x1]
   23ac5:	4d 8d 65 02          	lea    r12,[r13+0x2]
   23ac9:	49 89 c5             	mov    r13,rax
   23acc:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   23ad0:	f3 0f 1e fa          	endbr64
   23ad4:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   23ad8:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18246
   23add:	49 89 db             	mov    r11,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18245
   23ae0:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18248
   23ae5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18245
   23aec:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   23af3:	4c 89 c8             	mov    rax,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18244 (discriminator 1)
   23af6:	44 89 8d 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r9d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18246
   23afd:	48 c1 e0 04          	shl    rax,0x4
   23b01:	49 29 c3             	sub    r11,rax
   23b04:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18247
   23b0b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18248
   23b12:	49 8b 73 f0          	mov    rsi,QWORD PTR [r11-0x10]
   23b16:	49 8b 53 f8          	mov    rdx,QWORD PTR [r11-0x8]
   23b1a:	4d 8d 73 e0          	lea    r14,[r11-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18247
   23b1e:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18248
   23b22:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
   23b26:	49 8b 4b e0          	mov    rcx,QWORD PTR [r11-0x20]
   23b2a:	6a 00                	push   0x0
   23b2c:	41 53                	push   r11
   23b2e:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   23b35:	6a 03                	push   0x3
   23b37:	6a 00                	push   0x0
   23b39:	e8 62 f0 ff ff       	call   22ba0 <JS_CallInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18250 (discriminator 2)
   23b3e:	48 83 c4 20          	add    rsp,0x20
   23b42:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   23b49:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   23b50:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18248
   23b53:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18250 (discriminator 2)
   23b56:	0f 84 9a 68 00 00    	je     2a3f6 <JS_CallInternal+0x7856>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18252
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
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18254 (discriminator 1)
   23b90:	48 83 c3 10          	add    rbx,0x10
   23b94:	4c 39 e3             	cmp    rbx,r12
   23b97:	0f 84 e8 54 00 00    	je     29085 <JS_CallInternal+0x64e5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18255
   23b9d:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   23ba1:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23ba4:	83 f9 f6             	cmp    ecx,0xfffffff6
   23ba7:	76 e7                	jbe    23b90 <JS_CallInternal+0xff0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23ba9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23bac:	8d 50 ff             	lea    edx,[rax-0x1]
   23baf:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   23bb2:	85 d2                	test   edx,edx
   23bb4:	7f da                	jg     23b90 <JS_CallInternal+0xff0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   23bb6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23bbd:	48 89 ca             	mov    rdx,rcx
   23bc0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23bc4:	e8 d7 8c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   23bc9:	eb c5                	jmp    23b90 <JS_CallInternal+0xff0>
   23bcb:	f3 0f 1e fa          	endbr64
   23bcf:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20624
   23bd3:	31 c9                	xor    ecx,ecx
   23bd5:	b8 02 00 00 00       	mov    eax,0x2
   23bda:	e9 e1 f7 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   23bdf:	f3 0f 1e fa          	endbr64
   23be3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20681
   23be7:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   23bee:	4c 89 e2             	mov    rdx,r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20680
   23bf1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23bf8:	44 89 e9             	mov    ecx,r13d
   23bfb:	48 8d 35 a6 d2 0a 00 	lea    rsi,[rip+0xad2a6]        # d0ea8 <_IO_stdin_used+0x3ea8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20681
   23c02:	48 2b 50 18          	sub    rdx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20680
   23c06:	31 c0                	xor    eax,eax
   23c08:	83 ea 01             	sub    edx,0x1
   23c0b:	e8 80 f6 00 00       	call   33290 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20682
   23c10:	e9 2b f7 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   23c15:	f3 0f 1e fa          	endbr64
   23c19:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18489
   23c1d:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23c22:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18488
   23c29:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18489
   23c2e:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   23c35:	00 
   23c36:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   23c3a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23c3e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   23c41:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18490 (discriminator 2)
   23c45:	83 f8 04             	cmp    eax,0x4
   23c48:	0f 84 ce 67 00 00    	je     2a41c <JS_CallInternal+0x787c>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   23c4e:	83 f8 f6             	cmp    eax,0xfffffff6
   23c51:	76 04                	jbe    23c57 <JS_CallInternal+0x10b7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   23c53:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18505
   23c57:	48 89 13             	mov    QWORD PTR [rbx],rdx
   23c5a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18509
   23c5e:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18507
   23c64:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18509
   23c68:	49 83 c4 03          	add    r12,0x3
   23c6c:	49 89 c5             	mov    r13,rax
   23c6f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23c73:	ff e0                	jmp    rax
   23c75:	f3 0f 1e fa          	endbr64
   23c79:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18207
   23c7d:	49 8d 44 24 02       	lea    rax,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18206 (discriminator 1)
   23c82:	45 0f b7 14 24       	movzx  r10d,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18207
   23c87:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18208
   23c8e:	e9 e5 f2 ff ff       	jmp    22f78 <JS_CallInternal+0x3d8>
   23c93:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19941
   23c97:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19942
   23c9e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23ca5:	44 89 ea             	mov    edx,r13d
   23ca8:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19941
   23cab:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19942
   23caf:	e8 8c 0b 03 00       	call   54840 <js_binary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19942 (discriminator 1)
   23cb4:	85 c0                	test   eax,eax
   23cb6:	0f 85 84 f6 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19945
   23cbc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19944
   23cc1:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19945
   23cc5:	49 83 c4 01          	add    r12,0x1
   23cc9:	49 89 c5             	mov    r13,rax
   23ccc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23cd0:	ff e0                	jmp    rax
   23cd2:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   23cd6:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18228
   23cdb:	49 89 de             	mov    r14,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18227
   23cde:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18230
   23ce3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18229
   23cea:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   23cf1:	4c 89 c8             	mov    rax,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18226 (discriminator 1)
   23cf4:	44 89 8d 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r9d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18228
   23cfb:	48 c1 e0 04          	shl    rax,0x4
   23cff:	49 29 c6             	sub    r14,rax
   23d02:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18229
   23d09:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18230
   23d10:	4d 8b 46 f8          	mov    r8,QWORD PTR [r14-0x8]
   23d14:	49 8b 4e f0          	mov    rcx,QWORD PTR [r14-0x10]
   23d18:	4d 8d 6e e0          	lea    r13,[r14-0x20]
   23d1c:	49 8b 76 e0          	mov    rsi,QWORD PTR [r14-0x20]
   23d20:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18229
   23d24:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18230
   23d28:	6a 00                	push   0x0
   23d2a:	41 56                	push   r14
   23d2c:	e8 4f d4 06 00       	call   91180 <JS_CallConstructorInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18233 (discriminator 2)
   23d31:	41 5b                	pop    r11
   23d33:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   23d3a:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18230
   23d3d:	49 89 c1             	mov    r9,rax
   23d40:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18233 (discriminator 2)
   23d43:	58                   	pop    rax
   23d44:	0f 84 ab 77 00 00    	je     2b4f5 <JS_CallInternal+0x8955>
   23d4a:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   23d51:	4d 01 de             	add    r14,r11
   23d54:	eb 17                	jmp    23d6d <JS_CallInternal+0x11cd>
   23d56:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23d5d:	00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18235 (discriminator 1)
   23d60:	49 83 c5 10          	add    r13,0x10
   23d64:	4d 39 f5             	cmp    r13,r14
   23d67:	0f 84 3c 54 00 00    	je     291a9 <JS_CallInternal+0x6609>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18236
   23d6d:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   23d71:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23d75:	83 fa f6             	cmp    edx,0xfffffff6
   23d78:	76 e6                	jbe    23d60 <JS_CallInternal+0x11c0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23d7a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23d7d:	83 e8 01             	sub    eax,0x1
   23d80:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23d83:	85 c0                	test   eax,eax
   23d85:	7f d9                	jg     23d60 <JS_CallInternal+0x11c0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   23d87:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23d8e:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   23d95:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   23d9c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23da0:	e8 fb 8a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   23da5:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23dac:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   23db3:	eb ab                	jmp    23d60 <JS_CallInternal+0x11c0>
   23db5:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18471
   23db9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18472
   23dc0:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   23dc4:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   23dc8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   23dcc:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   23dd0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23dd4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18471
   23ddb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18472
   23ddf:	e8 bc 52 08 00       	call   a90a0 <js_dynamic_import>
   23de4:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18473 (discriminator 1)
   23de7:	83 fa 06             	cmp    edx,0x6
   23dea:	0f 84 50 f5 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18475
   23df0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23df4:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23df8:	83 fa f6             	cmp    edx,0xfffffff6
   23dfb:	76 11                	jbe    23e0e <JS_CallInternal+0x126e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23dfd:	8b 5e fc             	mov    ebx,DWORD PTR [rsi-0x4]
   23e00:	8d 4b ff             	lea    ecx,[rbx-0x1]
   23e03:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23e06:	85 c9                	test   ecx,ecx
   23e08:	0f 8e 40 6d 00 00    	jle    2ab4e <JS_CallInternal+0x7fae>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18476
   23e0e:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23e12:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23e15:	83 fa f6             	cmp    edx,0xfffffff6
   23e18:	76 11                	jbe    23e2b <JS_CallInternal+0x128b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23e1a:	8b 5e fc             	mov    ebx,DWORD PTR [rsi-0x4]
   23e1d:	8d 4b ff             	lea    ecx,[rbx-0x1]
   23e20:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23e23:	85 c9                	test   ecx,ecx
   23e25:	0f 8e 54 6d 00 00    	jle    2ab7f <JS_CallInternal+0x7fdf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18478
   23e2b:	49 89 46 f0          	mov    QWORD PTR [r14-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18477
   23e2f:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18480
   23e32:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18478
   23e36:	4d 89 46 f8          	mov    QWORD PTR [r14-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18480
   23e3a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23e40:	49 89 c5             	mov    r13,rax
   23e43:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23e47:	ff e0                	jmp    rax
   23e49:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18459
   23e4d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18460
   23e54:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23e58:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23e5c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18459
   23e63:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18460
   23e67:	e8 34 e6 ff ff       	call   224a0 <JS_GetPrototype>
   23e6c:	49 89 c6             	mov    r14,rax
   23e6f:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18461 (discriminator 1)
   23e72:	83 fa 06             	cmp    edx,0x6
   23e75:	0f 84 c5 f4 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18463
   23e7b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23e7f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23e83:	83 fa f6             	cmp    edx,0xfffffff6
   23e86:	76 11                	jbe    23e99 <JS_CallInternal+0x12f9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23e88:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23e8b:	83 e8 01             	sub    eax,0x1
   23e8e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23e91:	85 c0                	test   eax,eax
   23e93:	0f 8e 89 6e 00 00    	jle    2ad22 <JS_CallInternal+0x8182>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18464
   23e99:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18466
   23e9d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18464
   23ea1:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18466
   23ea5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23eab:	49 89 c5             	mov    r13,rax
   23eae:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23eb2:	ff e0                	jmp    rax
   23eb4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18275
   23eb8:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18274
   23ebf:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18277
   23ec4:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   23ec8:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18273 (discriminator 1)
   23ecc:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18277
   23ed1:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   23ed5:	4d 89 f0             	mov    r8,r14
   23ed8:	b9 02 00 00 00       	mov    ecx,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18275
   23edd:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18277
   23ee1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18275
   23ee8:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18277
   23eef:	e8 ac d8 07 00       	call   a17a0 <js_function_apply>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18278 (discriminator 2)
   23ef4:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   23efb:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18277
   23efe:	49 89 c1             	mov    r9,rax
   23f01:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18278 (discriminator 2)
   23f04:	0f 84 b1 71 00 00    	je     2b0bb <JS_CallInternal+0x851b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18280
   23f0a:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   23f0e:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23f12:	83 fa f6             	cmp    edx,0xfffffff6
   23f15:	76 11                	jbe    23f28 <JS_CallInternal+0x1388>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23f17:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23f1a:	83 e8 01             	sub    eax,0x1
   23f1d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23f20:	85 c0                	test   eax,eax
   23f22:	0f 8e 99 67 00 00    	jle    2a6c1 <JS_CallInternal+0x7b21>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18281
   23f28:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23f2c:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23f2f:	83 fa f6             	cmp    edx,0xfffffff6
   23f32:	76 11                	jbe    23f45 <JS_CallInternal+0x13a5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23f34:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23f37:	83 e8 01             	sub    eax,0x1
   23f3a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23f3d:	85 c0                	test   eax,eax
   23f3f:	0f 8e ad 67 00 00    	jle    2a6f2 <JS_CallInternal+0x7b52>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18282
   23f45:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23f49:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   23f4d:	83 fa f6             	cmp    edx,0xfffffff6
   23f50:	76 11                	jbe    23f63 <JS_CallInternal+0x13c3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   23f52:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23f55:	83 e8 01             	sub    eax,0x1
   23f58:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23f5b:	85 c0                	test   eax,eax
   23f5d:	0f 8e 2d 67 00 00    	jle    2a690 <JS_CallInternal+0x7af0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18284
   23f63:	4c 89 4b d0          	mov    QWORD PTR [rbx-0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18286
   23f67:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18284
   23f6b:	4c 89 43 d8          	mov    QWORD PTR [rbx-0x28],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18286
   23f6f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18284
   23f75:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18286
   23f78:	49 89 c5             	mov    r13,rax
   23f7b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23f7f:	ff e0                	jmp    rax
   23f81:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   23f85:	41 0f b7 14 24       	movzx  edx,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18262
   23f8a:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
   23f8f:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5852 (discriminator 1)
   23f96:	31 c9                	xor    ecx,ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18263
   23f98:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18261 (discriminator 1)
   23f9b:	89 95 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18263
   23fa1:	49 c1 e6 04          	shl    r14,0x4
   23fa5:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5852 (discriminator 1)
   23fac:	ba 02 00 00 00       	mov    edx,0x2
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18263
   23fb1:	4c 29 f3             	sub    rbx,r14
   23fb4:	49 89 dd             	mov    r13,rbx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5852
   23fb7:	48 8b 9d e8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x118]
   23fbe:	48 8b 73 30          	mov    rsi,QWORD PTR [rbx+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5852 (discriminator 1)
   23fc2:	48 89 df             	mov    rdi,rbx
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5305 (discriminator 1)
   23fc5:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5852 (discriminator 1)
   23fc9:	e8 c2 26 02 00       	call   46690 <JS_NewObjectFromShape>
   23fce:	49 89 c0             	mov    r8,rax
   23fd1:	48 89 d1             	mov    rcx,rdx
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9653 (discriminator 1)
   23fd4:	83 fa 06             	cmp    edx,0x6
   23fd7:	0f 84 03 76 00 00    	je     2b5e0 <JS_CallInternal+0x8a40>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9655
   23fdd:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   23fe3:	85 d2                	test   edx,edx
   23fe5:	0f 85 d8 59 00 00    	jne    299c3 <JS_CallInternal+0x6e23>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18267
   23feb:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   23fef:	49 8d 5d 10          	lea    rbx,[r13+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18268
   23ff3:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18267
   23ff7:	49 89 4d 08          	mov    QWORD PTR [r13+0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18268
   23ffb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24001:	49 89 c5             	mov    r13,rax
   24004:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24008:	ff e0                	jmp    rax
   2400a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   2400e:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   24015:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83
   24019:	4d 8d 4c 24 ff       	lea    r9,[r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   2401e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24022:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   24026:	48 8b 70 60          	mov    rsi,QWORD PTR [rax+0x60]
   2402a:	89 f8                	mov    eax,edi
   2402c:	48 8d 04 40          	lea    rax,[rax+rax*2]
   24030:	4c 8d 04 c6          	lea    r8,[rsi+rax*8]
   24034:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24039:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 2)
   24040:	41 83 fa ff          	cmp    r10d,0xffffffff
   24044:	0f 85 3f 7c 00 00    	jne    2bc89 <JS_CallInternal+0x90e9>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   2404a:	41 8b 46 10          	mov    eax,DWORD PTR [r14+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 5)
   2404e:	41 0f b6 50 10       	movzx  edx,BYTE PTR [r8+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   24053:	25 08 00 ff ff       	and    eax,0xffff0008
   24058:	3d 00 00 01 00       	cmp    eax,0x10000
   2405d:	0f 84 5d 5f 00 00    	je     29fc0 <JS_CallInternal+0x7420>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 6)
   24063:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   24067:	80 fa 1f             	cmp    dl,0x1f
   2406a:	77 07                	ja     24073 <JS_CallInternal+0x14d3>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 11)
   2406c:	83 c2 01             	add    edx,0x1
   2406f:	41 88 50 10          	mov    BYTE PTR [r8+0x10],dl
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 13)
   24073:	80 fa 20             	cmp    dl,0x20
   24076:	0f 84 67 5f 00 00    	je     29fe3 <JS_CallInternal+0x7443>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 3)
   2407c:	49 8b 46 18          	mov    rax,QWORD PTR [r14+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 17)
   24080:	4c 89 f1             	mov    rcx,r14
   24083:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   24088:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
   2408b:	44 89 ee             	mov    esi,r13d
   2408e:	21 d6                	and    esi,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   24090:	8b 7c b0 38          	mov    edi,DWORD PTR [rax+rsi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   24094:	48 85 ff             	test   rdi,rdi
   24097:	0f 84 7b 4e 00 00    	je     28f18 <JS_CallInternal+0x6378>
   2409d:	48 8d 34 95 34 00 00 	lea    rsi,[rdx*4+0x34]
   240a4:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   240a5:	48 8d 14 fe          	lea    rdx,[rsi+rdi*8]
   240a9:	48 01 c2             	add    rdx,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   240ac:	44 3b 6a 04          	cmp    r13d,DWORD PTR [rdx+0x4]
   240b0:	0f 85 54 4e 00 00    	jne    28f0a <JS_CallInternal+0x636a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   240b6:	80 7a 03 3f          	cmp    BYTE PTR [rdx+0x3],0x3f
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   240ba:	48 8b 71 20          	mov    rsi,QWORD PTR [rcx+0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   240be:	0f 87 d2 53 00 00    	ja     29496 <JS_CallInternal+0x68f6>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   240c4:	48 c1 e7 04          	shl    rdi,0x4
   240c8:	48 89 fa             	mov    rdx,rdi
   240cb:	48 83 ea 10          	sub    rdx,0x10
   240cf:	48 01 d6             	add    rsi,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 23)
   240d2:	4c 8b 6e 08          	mov    r13,QWORD PTR [rsi+0x8]
   240d6:	4c 8b 0e             	mov    r9,QWORD PTR [rsi]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   240d9:	41 83 fd f6          	cmp    r13d,0xfffffff6
   240dd:	76 05                	jbe    240e4 <JS_CallInternal+0x1544>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   240df:	41 83 41 fc 01       	add    DWORD PTR [r9-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   240e4:	4c 39 f1             	cmp    rcx,r14
   240e7:	0f 84 6a 7f 00 00    	je     2c057 <JS_CallInternal+0x94b7>
   240ed:	4c 89 c8             	mov    rax,r9
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 41)
   240f0:	4c 89 6b 08          	mov    QWORD PTR [rbx+0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:84
   240f4:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 41)
   240f8:	48 83 c3 10          	add    rbx,0x10
   240fc:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:84
   24100:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24106:	49 89 c5             	mov    r13,rax
   24109:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2410d:	ff e0                	jmp    rax
   2410f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   24113:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   2411a:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   2411e:	49 8d 4c 24 04       	lea    rcx,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80
   24123:	4d 8d 54 24 ff       	lea    r10,[r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   24128:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2412f:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   24133:	48 8b 70 60          	mov    rsi,QWORD PTR [rax+0x60]
   24137:	89 f8                	mov    eax,edi
   24139:	48 8d 04 40          	lea    rax,[rax+rax*2]
   2413d:	4c 8d 04 c6          	lea    r8,[rsi+rax*8]
   24141:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 2)
   24145:	83 f8 ff             	cmp    eax,0xffffffff
   24148:	0f 85 f2 6e 00 00    	jne    2b040 <JS_CallInternal+0x84a0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   2414e:	41 8b 56 10          	mov    edx,DWORD PTR [r14+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 5)
   24152:	41 0f b6 48 10       	movzx  ecx,BYTE PTR [r8+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   24157:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2415d:	81 fa 00 00 01 00    	cmp    edx,0x10000
   24163:	0f 84 67 5f 00 00    	je     2a0d0 <JS_CallInternal+0x7530>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 6)
   24169:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   2416d:	80 f9 1f             	cmp    cl,0x1f
   24170:	77 07                	ja     24179 <JS_CallInternal+0x15d9>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 11)
   24172:	83 c1 01             	add    ecx,0x1
   24175:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 13)
   24179:	80 f9 20             	cmp    cl,0x20
   2417c:	0f 84 71 5f 00 00    	je     2a0f3 <JS_CallInternal+0x7553>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 3)
   24182:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 17)
   24186:	4c 89 f6             	mov    rsi,r14
   24189:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   24190:	8b 4a 18             	mov    ecx,DWORD PTR [rdx+0x18]
   24193:	44 89 ef             	mov    edi,r13d
   24196:	21 cf                	and    edi,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   24198:	44 8b 4c ba 38       	mov    r9d,DWORD PTR [rdx+rdi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   2419d:	4d 85 c9             	test   r9,r9
   241a0:	0f 84 44 4d 00 00    	je     28eea <JS_CallInternal+0x634a>
   241a6:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   241ad:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   241ae:	4a 8d 0c cf          	lea    rcx,[rdi+r9*8]
   241b2:	48 01 d1             	add    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   241b5:	44 3b 69 04          	cmp    r13d,DWORD PTR [rcx+0x4]
   241b9:	0f 85 1b 4d 00 00    	jne    28eda <JS_CallInternal+0x633a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   241bf:	80 79 03 3f          	cmp    BYTE PTR [rcx+0x3],0x3f
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   241c3:	48 8b 7e 20          	mov    rdi,QWORD PTR [rsi+0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   241c7:	0f 87 22 53 00 00    	ja     294ef <JS_CallInternal+0x694f>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   241cd:	4c 89 c9             	mov    rcx,r9
   241d0:	48 c1 e1 04          	shl    rcx,0x4
   241d4:	48 83 e9 10          	sub    rcx,0x10
   241d8:	48 01 cf             	add    rdi,rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 23)
   241db:	4c 8b 6f 08          	mov    r13,QWORD PTR [rdi+0x8]
   241df:	48 8b 07             	mov    rax,QWORD PTR [rdi]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   241e2:	41 83 fd f6          	cmp    r13d,0xfffffff6
   241e6:	76 04                	jbe    241ec <JS_CallInternal+0x164c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   241e8:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   241ec:	4c 8d 53 f0          	lea    r10,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   241f0:	49 39 f6             	cmp    r14,rsi
   241f3:	0f 84 a5 7f 00 00    	je     2c19e <JS_CallInternal+0x95fe>
   241f9:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 42)
   241fc:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   24200:	49 8b 32             	mov    rsi,QWORD PTR [r10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24203:	83 fa f6             	cmp    edx,0xfffffff6
   24206:	76 11                	jbe    24219 <JS_CallInternal+0x1679>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24208:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2420b:	83 e8 01             	sub    eax,0x1
   2420e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24211:	85 c0                	test   eax,eax
   24213:	0f 8e 61 65 00 00    	jle    2a77a <JS_CallInternal+0x7bda>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   24219:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:81
   2421d:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   24221:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:81
   24225:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2422b:	49 89 c5             	mov    r13,rax
   2422e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24232:	ff e0                	jmp    rax
   24234:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18449
   24238:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2423c:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   24240:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24244:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24248:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   2424c:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24253:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   24257:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2425e:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47686 (discriminator 1)
   24265:	83 fb f9             	cmp    ebx,0xfffffff9
   24268:	0f 85 33 5f 00 00    	jne    2a1a1 <JS_CallInternal+0x7601>
   2426e:	83 f8 f9             	cmp    eax,0xfffffff9
   24271:	0f 85 2a 5f 00 00    	jne    2a1a1 <JS_CallInternal+0x7601>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47692
   24277:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47692 (discriminator 1)
   2427e:	ba 12 00 00 00       	mov    edx,0x12
   24283:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47691
   2428a:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
   24291:	00 00 00 00 
   24295:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   2429c:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47692
   242a0:	48 8b 77 48          	mov    rsi,QWORD PTR [rdi+0x48]
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5305 (discriminator 1)
   242a4:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47692 (discriminator 1)
   242a8:	e8 e3 23 02 00       	call   46690 <JS_NewObjectFromShape>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47693 (discriminator 1)
   242ad:	83 fa 06             	cmp    edx,0x6
   242b0:	0f 84 00 5f 00 00    	je     2a1b6 <JS_CallInternal+0x7616>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47697
   242b6:	f3 0f 7e 85 50 fe ff 	movq   xmm0,QWORD PTR [rbp-0x1b0]
   242bd:	ff 
   242be:	0f 16 85 40 fe ff ff 	movhps xmm0,QWORD PTR [rbp-0x1c0]
   242c5:	0f 11 40 28          	movups XMMWORD PTR [rax+0x28],xmm0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18449
   242c9:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   242cd:	49 89 55 08          	mov    QWORD PTR [r13+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18451 (discriminator 1)
   242d1:	41 83 7e f8 06       	cmp    DWORD PTR [r14-0x8],0x6
   242d6:	0f 84 fd 73 00 00    	je     2b6d9 <JS_CallInternal+0x8b39>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18454
   242dc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18450
   242e1:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18454
   242e4:	49 83 c4 01          	add    r12,0x1
   242e8:	49 89 c5             	mov    r13,rax
   242eb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   242ef:	ff e0                	jmp    rax
   242f1:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   242f5:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18423
   242fa:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   242fe:	48 8d b5 f0 fe ff ff 	lea    rsi,[rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18422
   24305:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18423
   2430c:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24313:	66 89 85 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],ax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18421
   2431a:	49 8d 44 24 02       	lea    rax,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18422
   2431f:	48 89 41 30          	mov    QWORD PTR [rcx+0x30],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18423
   24323:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   24327:	4c 89 ef             	mov    rdi,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18421
   2432a:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18423
   24331:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   24335:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2433c:	e8 9f 08 06 00       	call   84be0 <build_arg_list>
   24341:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18424
   24344:	48 85 c0             	test   rax,rax
   24347:	0f 84 ff 62 00 00    	je     2a64c <JS_CallInternal+0x7aac>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18426
   2434d:	f3 41 0f 6f 9d 70 01 	movdqu xmm3,XMMWORD PTR [r13+0x170]
   24354:	00 00 
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15927
   24356:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2435a:	41 b8 01 00 00 00    	mov    r8d,0x1
   24360:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   24364:	0f 29 9d 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm3
   2436b:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   24372:	48 89 c7             	mov    rdi,rax
   24375:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   2437c:	4c 89 ee             	mov    rsi,r13
   2437f:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   24386:	e8 45 61 ff ff       	call   1a4d0 <js_strict_eq2.isra.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18427
   2438b:	44 8b 95 f0 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18426 (discriminator 1)
   24392:	85 c0                	test   eax,eax
   24394:	0f 84 e4 59 00 00    	je     29d7e <JS_CallInternal+0x71de>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18427
   2439a:	45 85 d2             	test   r10d,r10d
   2439d:	0f 84 ce 59 00 00    	je     29d71 <JS_CallInternal+0x71d1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18428
   243a3:	49 8b 0e             	mov    rcx,QWORD PTR [r14]
   243a6:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   243aa:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18431
   243b1:	48 83 ec 08          	sub    rsp,0x8
   243b5:	31 f6                	xor    esi,esi
   243b7:	44 89 95 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r10d
   243be:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   243c5:	41 b9 02 00 00 00    	mov    r9d,0x2
   243cb:	ba 03 00 00 00       	mov    edx,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18420 (discriminator 1)
   243d0:	83 e8 02             	sub    eax,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18431
   243d3:	50                   	push   rax
   243d4:	e8 17 e8 01 00       	call   42bf0 <JS_EvalObject>
   243d9:	44 8b 95 28 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1d8]
   243e0:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   243e7:	49 89 d5             	mov    r13,rdx
   243ea:	58                   	pop    rax
   243eb:	5a                   	pop    rdx
free_arg_list():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:41186 (discriminator 1)
   243ec:	45 85 d2             	test   r10d,r10d
   243ef:	0f 84 ae 75 00 00    	je     2b9a3 <JS_CallInternal+0x8e03>
   243f5:	45 89 d0             	mov    r8d,r10d
   243f8:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   243ff:	48 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rbx
   24406:	4c 89 f3             	mov    rbx,r14
   24409:	49 c1 e0 04          	shl    r8,0x4
   2440d:	4c 89 a5 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r12
   24414:	4d 01 f0             	add    r8,r14
   24417:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2441b:	4d 89 c4             	mov    r12,r8
   2441e:	eb 0d                	jmp    2442d <JS_CallInternal+0x188d>
   24420:	48 83 c3 10          	add    rbx,0x10
   24424:	4c 39 e3             	cmp    rbx,r12
   24427:	0f 84 af 4d 00 00    	je     291dc <JS_CallInternal+0x663c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:41187
   2442d:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   24431:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24434:	83 f9 f6             	cmp    ecx,0xfffffff6
   24437:	76 e7                	jbe    24420 <JS_CallInternal+0x1880>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24439:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2443c:	8d 50 ff             	lea    edx,[rax-0x1]
   2443f:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   24442:	85 d2                	test   edx,edx
   24444:	7f da                	jg     24420 <JS_CallInternal+0x1880>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   24446:	48 89 ca             	mov    rdx,rcx
   24449:	e8 52 84 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2444e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   24455:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   24459:	eb c5                	jmp    24420 <JS_CallInternal+0x1880>
   2445b:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   2445f:	41 0f b7 0c 24       	movzx  ecx,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18391
   24464:	49 89 dd             	mov    r13,rbx
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24467:	41 0f b7 7c 24 02    	movzx  edi,WORD PTR [r12+0x2]
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15927
   2446d:	41 b8 01 00 00 00    	mov    r8d,0x1
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24473:	48 89 c8             	mov    rax,rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18388 (discriminator 1)
   24476:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18390
   2447c:	49 8d 4c 24 04       	lea    rcx,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18391
   24481:	48 c1 e0 04          	shl    rax,0x4
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24485:	66 89 bd 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],di
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18391
   2448c:	49 29 c5             	sub    r13,rax
   2448f:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18392
   24492:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18390
   24499:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15927
   244a0:	49 8b 7d f0          	mov    rdi,QWORD PTR [r13-0x10]
   244a4:	49 8b 75 f8          	mov    rsi,QWORD PTR [r13-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18392
   244a8:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18393
   244ac:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   244b3:	f3 0f 6f b8 70 01 00 	movdqu xmm7,XMMWORD PTR [rax+0x170]
   244ba:	00 
   244bb:	0f 29 bd 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm7
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15927
   244c2:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   244c9:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   244d0:	e8 fb 5f ff ff       	call   1a4d0 <js_strict_eq2.isra.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18393 (discriminator 1)
   244d5:	85 c0                	test   eax,eax
   244d7:	0f 84 3c 58 00 00    	je     29d19 <JS_CallInternal+0x7179>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18394
   244dd:	8b bd 50 fe ff ff    	mov    edi,DWORD PTR [rbp-0x1b0]
   244e3:	85 ff                	test   edi,edi
   244e5:	0f 84 41 56 00 00    	je     29b2c <JS_CallInternal+0x6f8c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18395
   244eb:	49 8b 4d 00          	mov    rcx,QWORD PTR [r13+0x0]
   244ef:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   244f3:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18398
   244fa:	48 83 ec 08          	sub    rsp,0x8
   244fe:	41 b9 02 00 00 00    	mov    r9d,0x2
   24504:	31 f6                	xor    esi,esi
   24506:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2450d:	ba 03 00 00 00       	mov    edx,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18389 (discriminator 1)
   24512:	83 e8 02             	sub    eax,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18398
   24515:	50                   	push   rax
   24516:	e8 d5 e6 01 00       	call   42bf0 <JS_EvalObject>
   2451b:	59                   	pop    rcx
   2451c:	5e                   	pop    rsi
   2451d:	49 89 c1             	mov    r9,rax
   24520:	49 89 d0             	mov    r8,rdx
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:643
   24523:	49 8d 45 f0          	lea    rax,[r13-0x10]
   24527:	4d 01 f5             	add    r13,r14
   2452a:	49 89 c6             	mov    r14,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18404 (discriminator 2)
   2452d:	41 83 f8 06          	cmp    r8d,0x6
   24531:	75 1a                	jne    2454d <JS_CallInternal+0x19ad>
   24533:	e9 b1 6f 00 00       	jmp    2b4e9 <JS_CallInternal+0x8949>
   24538:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2453f:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18406 (discriminator 1)
   24540:	49 83 c6 10          	add    r14,0x10
   24544:	4d 39 ee             	cmp    r14,r13
   24547:	0f 84 29 4c 00 00    	je     29176 <JS_CallInternal+0x65d6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18407
   2454d:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   24551:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24554:	83 fa f6             	cmp    edx,0xfffffff6
   24557:	76 e7                	jbe    24540 <JS_CallInternal+0x19a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24559:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2455c:	83 e8 01             	sub    eax,0x1
   2455f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24562:	85 c0                	test   eax,eax
   24564:	7f da                	jg     24540 <JS_CallInternal+0x19a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   24566:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2456d:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   24574:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2457b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2457f:	e8 1c 83 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   24584:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   2458b:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   24592:	eb ac                	jmp    24540 <JS_CallInternal+0x19a0>
   24594:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18363
   24598:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   2459e:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18364
   245a2:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18365
   245a6:	3c 04                	cmp    al,0x4
   245a8:	0f 87 b3 5f 00 00    	ja     2a561 <JS_CallInternal+0x79c1>
   245ae:	48 8d 15 af 2b 0b 00 	lea    rdx,[rip+0xb2baf]        # d7164 <qjsc_repl_size+0x458>
   245b5:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   245b9:	48 01 d0             	add    rax,rdx
   245bc:	3e ff e0             	notrack jmp rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18375
   245bf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   245c6:	48 8d 35 1b c8 0a 00 	lea    rsi,[rip+0xac81b]        # d0de8 <_IO_stdin_used+0x3de8>
   245cd:	31 c0                	xor    eax,eax
   245cf:	e8 cc e9 00 00       	call   32fa0 <JS_ThrowReferenceError>
   245d4:	e9 67 ed ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 1)
   245d9:	48 8d 15 e1 8e 0a 00 	lea    rdx,[rip+0xa8ee1]        # cd4c1 <_IO_stdin_used+0x4c1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851
   245e0:	85 f6                	test   esi,esi
   245e2:	0f 85 69 79 00 00    	jne    2bf51 <JS_CallInternal+0x93b1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   245e8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   245ef:	48 8d 35 27 8f 0a 00 	lea    rsi,[rip+0xa8f27]        # cd51d <_IO_stdin_used+0x51d>
   245f6:	31 c0                	xor    eax,eax
   245f8:	e8 a3 e9 00 00       	call   32fa0 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   245fd:	e9 3e ed ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   24602:	4c 8b bd e8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x118]
   24609:	48 8d 45 80          	lea    rax,[rbp-0x80]
   2460d:	89 f2                	mov    edx,esi
   2460f:	48 89 c6             	mov    rsi,rax
   24612:	49 8b 7f 10          	mov    rdi,QWORD PTR [r15+0x10]
   24616:	e8 f5 2c ff ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowSyntaxErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7746 (discriminator 1)
   2461b:	48 8d 35 e5 8e 0a 00 	lea    rsi,[rip+0xa8ee5]        # cd507 <_IO_stdin_used+0x507>
   24622:	4c 89 ff             	mov    rdi,r15
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   24625:	48 89 c2             	mov    rdx,rax
__JS_ThrowSyntaxErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7746 (discriminator 1)
   24628:	31 c0                	xor    eax,eax
   2462a:	e8 61 c4 00 00       	call   30a90 <JS_ThrowSyntaxError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7746
   2462f:	e9 0c ed ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowTypeErrorReadOnly():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7757
   24634:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2463b:	e8 30 dd 00 00       	call   32370 <JS_ThrowTypeErrorReadOnly.part.0>
   24640:	e9 fb ec ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18378
   24645:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2464c:	48 8d 35 bd c7 0a 00 	lea    rsi,[rip+0xac7bd]        # d0e10 <_IO_stdin_used+0x3e10>
   24653:	31 c0                	xor    eax,eax
   24655:	e8 56 c8 00 00       	call   30eb0 <JS_ThrowTypeError>
   2465a:	e9 e1 ec ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2465f:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24663:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24667:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18601
   2466c:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24670:	83 fa f6             	cmp    edx,0xfffffff6
   24673:	76 04                	jbe    24679 <JS_CallInternal+0x1ad9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24675:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18601 (discriminator 1)
   24679:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   24680:	48 c1 e0 04          	shl    rax,0x4
   24684:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24687:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   2468b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   2468e:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24692:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24695:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24699:	76 11                	jbe    246ac <JS_CallInternal+0x1b0c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2469b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2469e:	83 e8 01             	sub    eax,0x1
   246a1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   246a4:	85 c0                	test   eax,eax
   246a6:	0f 8e fb 60 00 00    	jle    2a7a7 <JS_CallInternal+0x7c07>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18603
   246ac:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   246b2:	49 83 c4 03          	add    r12,0x3
   246b6:	49 89 c5             	mov    r13,rax
   246b9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   246bd:	ff e0                	jmp    rax
   246bf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18583
   246c3:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   246c8:	48 8b 8d 90 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x170]
   246cf:	48 c1 e0 04          	shl    rax,0x4
   246d3:	48 01 c8             	add    rax,rcx
   246d6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   246d9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   246dd:	83 f8 f6             	cmp    eax,0xfffffff6
   246e0:	76 04                	jbe    246e6 <JS_CallInternal+0x1b46>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   246e2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18583
   246e6:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18586
   246e9:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18584
   246ed:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18583
   246f1:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18586
   246f5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   246fb:	49 89 c5             	mov    r13,rax
   246fe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24702:	ff e0                	jmp    rax
   24704:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24708:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2470c:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18575
   24711:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24715:	83 fa f6             	cmp    edx,0xfffffff6
   24718:	76 04                	jbe    2471e <JS_CallInternal+0x1b7e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2471a:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18575 (discriminator 1)
   2471e:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24725:	48 c1 e0 04          	shl    rax,0x4
   24729:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   2472c:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   24730:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24733:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24737:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2473a:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   2473e:	76 11                	jbe    24751 <JS_CallInternal+0x1bb1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24740:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24743:	83 e8 01             	sub    eax,0x1
   24746:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24749:	85 c0                	test   eax,eax
   2474b:	0f 8e 3e 60 00 00    	jle    2a78f <JS_CallInternal+0x7bef>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18577
   24751:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24757:	49 83 c4 03          	add    r12,0x3
   2475b:	49 89 c5             	mov    r13,rax
   2475e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24762:	ff e0                	jmp    rax
   24764:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18592
   24768:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2476d:	48 8b 8d 90 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x170]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24774:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18592
   24779:	48 c1 e0 04          	shl    rax,0x4
   2477d:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24780:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24784:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24787:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2478a:	83 fa f6             	cmp    edx,0xfffffff6
   2478d:	76 11                	jbe    247a0 <JS_CallInternal+0x1c00>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2478f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24792:	83 e8 01             	sub    eax,0x1
   24795:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24798:	85 c0                	test   eax,eax
   2479a:	0f 8e 34 60 00 00    	jle    2a7d4 <JS_CallInternal+0x7c34>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18595
   247a0:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18593
   247a6:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18595
   247aa:	49 83 c4 03          	add    r12,0x3
   247ae:	49 89 c5             	mov    r13,rax
   247b1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   247b5:	ff e0                	jmp    rax
   247b7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18566
   247bb:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   247c0:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   247c7:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18566
   247cc:	48 c1 e0 04          	shl    rax,0x4
   247d0:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   247d3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   247d7:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   247da:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   247dd:	83 fa f6             	cmp    edx,0xfffffff6
   247e0:	76 11                	jbe    247f3 <JS_CallInternal+0x1c53>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   247e2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   247e5:	83 e8 01             	sub    eax,0x1
   247e8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   247eb:	85 c0                	test   eax,eax
   247ed:	0f 8e cc 5f 00 00    	jle    2a7bf <JS_CallInternal+0x7c1f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18569
   247f3:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18567
   247f9:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18569
   247fd:	49 83 c4 03          	add    r12,0x3
   24801:	49 89 c5             	mov    r13,rax
   24804:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24808:	ff e0                	jmp    rax
   2480a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18557
   2480e:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24813:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   2481a:	48 c1 e0 04          	shl    rax,0x4
   2481e:	48 01 c8             	add    rax,rcx
   24821:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24824:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24828:	83 f8 f6             	cmp    eax,0xfffffff6
   2482b:	76 04                	jbe    24831 <JS_CallInternal+0x1c91>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2482d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18557
   24831:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18560
   24834:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18558
   24838:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18557
   2483c:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18560
   24840:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24846:	49 89 c5             	mov    r13,rax
   24849:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2484d:	ff e0                	jmp    rax
   2484f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18622
   24853:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   2485a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2485e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24861:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24865:	83 f8 f6             	cmp    eax,0xfffffff6
   24868:	76 04                	jbe    2486e <JS_CallInternal+0x1cce>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2486a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18622
   2486e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18622 (discriminator 1)
   24871:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18622
   24875:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18622 (discriminator 1)
   24879:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18622
   2487f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18622 (discriminator 1)
   24882:	49 89 c5             	mov    r13,rax
   24885:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24889:	ff e0                	jmp    rax
   2488b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18621
   2488f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24893:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24897:	83 f8 f6             	cmp    eax,0xfffffff6
   2489a:	76 04                	jbe    248a0 <JS_CallInternal+0x1d00>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2489c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   248a0:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   248a7:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   248ab:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   248af:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   248b3:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   248b7:	83 f9 f6             	cmp    ecx,0xfffffff6
   248ba:	76 11                	jbe    248cd <JS_CallInternal+0x1d2d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   248bc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   248bf:	83 e8 01             	sub    eax,0x1
   248c2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   248c5:	85 c0                	test   eax,eax
   248c7:	0f 8e 52 5d 00 00    	jle    2a61f <JS_CallInternal+0x7a7f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18621 (discriminator 2)
   248cd:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   248d2:	49 83 c4 01          	add    r12,0x1
   248d6:	49 89 c5             	mov    r13,rax
   248d9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   248dd:	ff e0                	jmp    rax
   248df:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18618
   248e3:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   248e7:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   248eb:	83 f8 f6             	cmp    eax,0xfffffff6
   248ee:	76 04                	jbe    248f4 <JS_CallInternal+0x1d54>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   248f0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   248f4:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   248fb:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   248ff:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24902:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   24906:	48 89 17             	mov    QWORD PTR [rdi],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24909:	83 f9 f6             	cmp    ecx,0xfffffff6
   2490c:	76 11                	jbe    2491f <JS_CallInternal+0x1d7f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2490e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24911:	83 e8 01             	sub    eax,0x1
   24914:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24917:	85 c0                	test   eax,eax
   24919:	0f 8e 04 5e 00 00    	jle    2a723 <JS_CallInternal+0x7b83>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18618 (discriminator 2)
   2491f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24924:	49 83 c4 01          	add    r12,0x1
   24928:	49 89 c5             	mov    r13,rax
   2492b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2492f:	ff e0                	jmp    rax
   24931:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18620
   24935:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24939:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2493d:	83 f8 f6             	cmp    eax,0xfffffff6
   24940:	76 04                	jbe    24946 <JS_CallInternal+0x1da6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24942:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24946:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   2494d:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   24951:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24955:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   24959:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2495d:	83 f9 f6             	cmp    ecx,0xfffffff6
   24960:	76 11                	jbe    24973 <JS_CallInternal+0x1dd3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24962:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24965:	83 e8 01             	sub    eax,0x1
   24968:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2496b:	85 c0                	test   eax,eax
   2496d:	0f 8e ad 5e 00 00    	jle    2a820 <JS_CallInternal+0x7c80>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18620 (discriminator 2)
   24973:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24978:	49 83 c4 01          	add    r12,0x1
   2497c:	49 89 c5             	mov    r13,rax
   2497f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24983:	ff e0                	jmp    rax
   24985:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24989:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24990:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18616
   24995:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24999:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   2499d:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   249a1:	0f 11 78 20          	movups XMMWORD PTR [rax+0x20],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   249a5:	83 fa f6             	cmp    edx,0xfffffff6
   249a8:	76 11                	jbe    249bb <JS_CallInternal+0x1e1b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   249aa:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   249ad:	83 e8 01             	sub    eax,0x1
   249b0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   249b3:	85 c0                	test   eax,eax
   249b5:	0f 8e 95 5d 00 00    	jle    2a750 <JS_CallInternal+0x7bb0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18616 (discriminator 1)
   249bb:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   249c0:	49 83 c4 01          	add    r12,0x1
   249c4:	49 89 c5             	mov    r13,rax
   249c7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   249cb:	ff e0                	jmp    rax
   249cd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18619
   249d1:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   249d5:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   249d9:	83 f8 f6             	cmp    eax,0xfffffff6
   249dc:	76 04                	jbe    249e2 <JS_CallInternal+0x1e42>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   249de:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   249e2:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   249e9:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   249ed:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   249f1:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   249f5:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   249f9:	83 f9 f6             	cmp    ecx,0xfffffff6
   249fc:	76 11                	jbe    24a0f <JS_CallInternal+0x1e6f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   249fe:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24a01:	83 e8 01             	sub    eax,0x1
   24a04:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24a07:	85 c0                	test   eax,eax
   24a09:	0f 8e 29 5e 00 00    	jle    2a838 <JS_CallInternal+0x7c98>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18619 (discriminator 2)
   24a0f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24a14:	49 83 c4 01          	add    r12,0x1
   24a18:	49 89 c5             	mov    r13,rax
   24a1b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24a1f:	ff e0                	jmp    rax
   24a21:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24a25:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24a2c:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18617
   24a31:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24a35:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   24a39:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24a3d:	0f 11 58 30          	movups XMMWORD PTR [rax+0x30],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24a41:	83 fa f6             	cmp    edx,0xfffffff6
   24a44:	76 11                	jbe    24a57 <JS_CallInternal+0x1eb7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24a46:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24a49:	83 e8 01             	sub    eax,0x1
   24a4c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24a4f:	85 c0                	test   eax,eax
   24a51:	0f 8e e4 5c 00 00    	jle    2a73b <JS_CallInternal+0x7b9b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18617 (discriminator 1)
   24a57:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24a5c:	49 83 c4 01          	add    r12,0x1
   24a60:	49 89 c5             	mov    r13,rax
   24a63:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24a67:	ff e0                	jmp    rax
   24a69:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24a6d:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24a74:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18615
   24a79:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24a7d:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   24a81:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24a85:	0f 11 70 10          	movups XMMWORD PTR [rax+0x10],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24a89:	83 fa f6             	cmp    edx,0xfffffff6
   24a8c:	76 11                	jbe    24a9f <JS_CallInternal+0x1eff>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24a8e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24a91:	83 e8 01             	sub    eax,0x1
   24a94:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24a97:	85 c0                	test   eax,eax
   24a99:	0f 8e c6 5c 00 00    	jle    2a765 <JS_CallInternal+0x7bc5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18615 (discriminator 1)
   24a9f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24aa4:	49 83 c4 01          	add    r12,0x1
   24aa8:	49 89 c5             	mov    r13,rax
   24aab:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24aaf:	ff e0                	jmp    rax
   24ab1:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24ab5:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24abc:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18614
   24ac1:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24ac5:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24ac9:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24acc:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24acf:	83 fa f6             	cmp    edx,0xfffffff6
   24ad2:	76 11                	jbe    24ae5 <JS_CallInternal+0x1f45>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24ad4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24ad7:	83 e8 01             	sub    eax,0x1
   24ada:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24add:	85 c0                	test   eax,eax
   24adf:	0f 8e 52 5f 00 00    	jle    2aa37 <JS_CallInternal+0x7e97>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18614 (discriminator 1)
   24ae5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24aea:	49 83 c4 01          	add    r12,0x1
   24aee:	49 89 c5             	mov    r13,rax
   24af1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24af5:	ff e0                	jmp    rax
   24af7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18610
   24afb:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24b02:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24b06:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24b09:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24b0d:	83 f8 f6             	cmp    eax,0xfffffff6
   24b10:	76 04                	jbe    24b16 <JS_CallInternal+0x1f76>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24b12:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18610
   24b16:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18610 (discriminator 1)
   24b19:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18610
   24b1d:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18610 (discriminator 1)
   24b21:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18610
   24b27:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18610 (discriminator 1)
   24b2a:	49 89 c5             	mov    r13,rax
   24b2d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b31:	ff e0                	jmp    rax
   24b33:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18608
   24b37:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24b3b:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24b3f:	83 fa f6             	cmp    edx,0xfffffff6
   24b42:	76 04                	jbe    24b48 <JS_CallInternal+0x1fa8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24b44:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18608 (discriminator 1)
   24b48:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b4d:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24b54:	48 c1 e0 04          	shl    rax,0x4
   24b58:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24b5b:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   24b5f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24b62:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24b66:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24b69:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24b6d:	76 11                	jbe    24b80 <JS_CallInternal+0x1fe0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24b6f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24b72:	83 e8 01             	sub    eax,0x1
   24b75:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24b78:	85 c0                	test   eax,eax
   24b7a:	0f 8e 4f 5a 00 00    	jle    2a5cf <JS_CallInternal+0x7a2f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18608 (discriminator 2)
   24b80:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24b86:	49 83 c4 02          	add    r12,0x2
   24b8a:	49 89 c5             	mov    r13,rax
   24b8d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b91:	ff e0                	jmp    rax
   24b93:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18607
   24b97:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b9c:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24ba3:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24ba7:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18607
   24bab:	48 c1 e0 04          	shl    rax,0x4
   24baf:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24bb2:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24bb6:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24bb9:	0f 11 10             	movups XMMWORD PTR [rax],xmm2
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24bbc:	83 fa f6             	cmp    edx,0xfffffff6
   24bbf:	76 11                	jbe    24bd2 <JS_CallInternal+0x2032>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24bc1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24bc4:	83 e8 01             	sub    eax,0x1
   24bc7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24bca:	85 c0                	test   eax,eax
   24bcc:	0f 8e e8 59 00 00    	jle    2a5ba <JS_CallInternal+0x7a1a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18607 (discriminator 1)
   24bd2:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24bd8:	49 83 c4 02          	add    r12,0x2
   24bdc:	49 89 c5             	mov    r13,rax
   24bdf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24be3:	ff e0                	jmp    rax
   24be5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18606
   24be9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24bee:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24bf5:	48 c1 e0 04          	shl    rax,0x4
   24bf9:	48 01 c8             	add    rax,rcx
   24bfc:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24c00:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24c03:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24c07:	83 f8 f6             	cmp    eax,0xfffffff6
   24c0a:	76 04                	jbe    24c10 <JS_CallInternal+0x2070>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24c0c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18606
   24c10:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18606 (discriminator 1)
   24c13:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18606
   24c17:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18606 (discriminator 1)
   24c1b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18606
   24c21:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18606 (discriminator 1)
   24c24:	49 89 c5             	mov    r13,rax
   24c27:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24c2b:	ff e0                	jmp    rax
   24c2d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18612
   24c31:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24c38:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24c3c:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   24c40:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24c44:	83 f8 f6             	cmp    eax,0xfffffff6
   24c47:	76 04                	jbe    24c4d <JS_CallInternal+0x20ad>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24c49:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18612
   24c4d:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18612 (discriminator 1)
   24c50:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18612
   24c54:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18612 (discriminator 1)
   24c58:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18612
   24c5e:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18612 (discriminator 1)
   24c61:	49 89 c5             	mov    r13,rax
   24c64:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24c68:	ff e0                	jmp    rax
   24c6a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18611
   24c6e:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24c75:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24c79:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   24c7d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24c81:	83 f8 f6             	cmp    eax,0xfffffff6
   24c84:	76 04                	jbe    24c8a <JS_CallInternal+0x20ea>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24c86:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18611
   24c8a:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18611 (discriminator 1)
   24c8d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18611
   24c91:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18611 (discriminator 1)
   24c95:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18611
   24c9b:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18611 (discriminator 1)
   24c9e:	49 89 c5             	mov    r13,rax
   24ca1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ca5:	ff e0                	jmp    rax
   24ca7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18613
   24cab:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24cb2:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24cb6:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   24cba:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24cbe:	83 f8 f6             	cmp    eax,0xfffffff6
   24cc1:	76 04                	jbe    24cc7 <JS_CallInternal+0x2127>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24cc3:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18613
   24cc7:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18613 (discriminator 1)
   24cca:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18613
   24cce:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18613 (discriminator 1)
   24cd2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18613
   24cd8:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18613 (discriminator 1)
   24cdb:	49 89 c5             	mov    r13,rax
   24cde:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ce2:	ff e0                	jmp    rax
   24ce4:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24ce8:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18743
   24ced:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18742
   24cf4:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24cf9:	48 89 c1             	mov    rcx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18743
   24cfc:	48 c1 e0 04          	shl    rax,0x4
   24d00:	48 01 f8             	add    rax,rdi
   24d03:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18743 (discriminator 2)
   24d07:	83 fa 04             	cmp    edx,0x4
   24d0a:	0f 84 b9 67 00 00    	je     2b4c9 <JS_CallInternal+0x8929>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18747
   24d10:	48 8b 00             	mov    rax,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24d13:	83 fa f6             	cmp    edx,0xfffffff6
   24d16:	76 04                	jbe    24d1c <JS_CallInternal+0x217c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24d18:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18747
   24d1c:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18750
   24d1f:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18748
   24d23:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18747
   24d27:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18750
   24d2b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24d31:	49 89 c5             	mov    r13,rax
   24d34:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d38:	ff e0                	jmp    rax
   24d3a:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24d3e:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18730
   24d43:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18729
   24d4a:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   24d4f:	48 89 c1             	mov    rcx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18730
   24d52:	48 c1 e0 04          	shl    rax,0x4
   24d56:	48 01 f8             	add    rax,rdi
   24d59:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18730 (discriminator 2)
   24d5d:	83 fa 04             	cmp    edx,0x4
   24d60:	0f 84 43 67 00 00    	je     2b4a9 <JS_CallInternal+0x8909>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18734
   24d66:	48 8b 00             	mov    rax,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   24d69:	83 fa f6             	cmp    edx,0xfffffff6
   24d6c:	76 04                	jbe    24d72 <JS_CallInternal+0x21d2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   24d6e:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18734
   24d72:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18737
   24d75:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18735
   24d79:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18734
   24d7d:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18737
   24d81:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24d87:	49 89 c5             	mov    r13,rax
   24d8a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d8e:	ff e0                	jmp    rax
   24d90:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18722
   24d94:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24d99:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24da0:	48 c1 e0 04          	shl    rax,0x4
   24da4:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24da7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24dab:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24dae:	48 c7 40 08 04 00 00 	mov    QWORD PTR [rax+0x8],0x4
   24db5:	00 
   24db6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24dbd:	83 fa f6             	cmp    edx,0xfffffff6
   24dc0:	76 11                	jbe    24dd3 <JS_CallInternal+0x2233>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24dc2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24dc5:	83 e8 01             	sub    eax,0x1
   24dc8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24dcb:	85 c0                	test   eax,eax
   24dcd:	0f 8e 4f 5c 00 00    	jle    2aa22 <JS_CallInternal+0x7e82>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18724
   24dd3:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24dd9:	49 83 c4 03          	add    r12,0x3
   24ddd:	49 89 c5             	mov    r13,rax
   24de0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24de4:	ff e0                	jmp    rax
   24de6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18709
   24dea:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24def:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18708
   24df6:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18709
   24dfb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   24e02:	00 
   24e03:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   24e07:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18709 (discriminator 2)
   24e0b:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   24e0f:	0f 85 f2 65 00 00    	jne    2b407 <JS_CallInternal+0x8867>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24e15:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18716
   24e1a:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18714
   24e1e:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24e22:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18716
   24e25:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24e2b:	49 89 c5             	mov    r13,rax
   24e2e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24e32:	ff e0                	jmp    rax
   24e34:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18696
   24e38:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24e3d:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18695
   24e44:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18696
   24e49:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   24e50:	00 
   24e51:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   24e55:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   24e59:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18696 (discriminator 2)
   24e5d:	83 fa 04             	cmp    edx,0x4
   24e60:	0f 84 e0 69 00 00    	je     2b846 <JS_CallInternal+0x8ca6>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24e66:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   24e6b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   24e6e:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24e71:	83 fa f6             	cmp    edx,0xfffffff6
   24e74:	76 11                	jbe    24e87 <JS_CallInternal+0x22e7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24e76:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24e79:	83 e8 01             	sub    eax,0x1
   24e7c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24e7f:	85 c0                	test   eax,eax
   24e81:	0f 8e 1e 57 00 00    	jle    2a5a5 <JS_CallInternal+0x7a05>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18703
   24e87:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18701
   24e8d:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18703
   24e91:	49 83 c4 03          	add    r12,0x3
   24e95:	49 89 c5             	mov    r13,rax
   24e98:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24e9c:	ff e0                	jmp    rax
   24e9e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20663
   24ea2:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24ea6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24ead:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24eb1:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24eb5:	e8 06 6b ff ff       	call   1b9c0 <js_operator_typeof>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20663 (discriminator 1)
   24eba:	83 f8 1b             	cmp    eax,0x1b
   24ebd:	74 61                	je     24f20 <JS_CallInternal+0x2380>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20675
   24ebf:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24ec3:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24ec6:	83 fa f6             	cmp    edx,0xfffffff6
   24ec9:	76 11                	jbe    24edc <JS_CallInternal+0x233c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24ecb:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24ece:	83 e8 01             	sub    eax,0x1
   24ed1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24ed4:	85 c0                	test   eax,eax
   24ed6:	0f 8e 66 49 00 00    	jle    29842 <JS_CallInternal+0x6ca2>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20676
   24edc:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   24ee3:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20677
   24ee4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20676
   24ee8:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24eef:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20677
   24ef0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24ef6:	49 89 c5             	mov    r13,rax
   24ef9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24efd:	ff e0                	jmp    rax
   24eff:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20657
   24f03:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24f07:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24f0e:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24f12:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24f16:	e8 a5 6a ff ff       	call   1b9c0 <js_operator_typeof>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20657 (discriminator 1)
   24f1b:	83 f8 49             	cmp    eax,0x49
   24f1e:	75 9f                	jne    24ebf <JS_CallInternal+0x231f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20669
   24f20:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24f24:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   24f27:	83 fa f6             	cmp    edx,0xfffffff6
   24f2a:	76 11                	jbe    24f3d <JS_CallInternal+0x239d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   24f2c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24f2f:	83 e8 01             	sub    eax,0x1
   24f32:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24f35:	85 c0                	test   eax,eax
   24f37:	0f 8e 7a 64 00 00    	jle    2b3b7 <JS_CallInternal+0x8817>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20672
   24f3d:	48 c7 43 f0 01 00 00 	mov    QWORD PTR [rbx-0x10],0x1
   24f44:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20673
   24f45:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20672
   24f49:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24f50:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20673
   24f51:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24f57:	49 89 c5             	mov    r13,rax
   24f5a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24f5e:	ff e0                	jmp    rax
   24f60:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20630
   24f64:	31 c9                	xor    ecx,ecx
   24f66:	b8 03 00 00 00       	mov    eax,0x3
   24f6b:	e9 50 e4 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24f70:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20626
   24f74:	b9 03 00 00 00       	mov    ecx,0x3
   24f79:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20627
   24f7b:	e9 40 e4 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24f80:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20649
   24f84:	83 7b f8 02          	cmp    DWORD PTR [rbx-0x8],0x2
   24f88:	74 b3                	je     24f3d <JS_CallInternal+0x239d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   24f8a:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24f8e:	e9 2c ff ff ff       	jmp    24ebf <JS_CallInternal+0x231f>
   24f93:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20643
   24f97:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   24f9b:	75 ed                	jne    24f8a <JS_CallInternal+0x23ea>
   24f9d:	eb 9e                	jmp    24f3d <JS_CallInternal+0x239d>
   24f9f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20635
   24fa3:	8b 43 f8             	mov    eax,DWORD PTR [rbx-0x8]
   24fa6:	83 e8 02             	sub    eax,0x2
   24fa9:	83 f8 01             	cmp    eax,0x1
   24fac:	77 dc                	ja     24f8a <JS_CallInternal+0x23ea>
   24fae:	eb 8d                	jmp    24f3d <JS_CallInternal+0x239d>
   24fb0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20633
   24fb4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24fb9:	49 83 c4 01          	add    r12,0x1
   24fbd:	49 89 c5             	mov    r13,rax
   24fc0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24fc4:	ff e0                	jmp    rax
   24fc6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20620
   24fca:	31 c9                	xor    ecx,ecx
   24fcc:	b8 01 00 00 00       	mov    eax,0x1
   24fd1:	e9 ea e3 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24fd6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20617
   24fda:	31 c9                	xor    ecx,ecx
   24fdc:	31 c0                	xor    eax,eax
   24fde:	e9 dd e3 ff ff       	jmp    233c0 <JS_CallInternal+0x820>
   24fe3:	f3 0f 1e fa          	endbr64
   24fe7:	e9 d4 de ff ff       	jmp    22ec0 <JS_CallInternal+0x320>
   24fec:	f3 0f 1e fa          	endbr64
   24ff0:	e9 cb de ff ff       	jmp    22ec0 <JS_CallInternal+0x320>
   24ff5:	f3 0f 1e fa          	endbr64
   24ff9:	e9 c2 de ff ff       	jmp    22ec0 <JS_CallInternal+0x320>
   24ffe:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20486
   25002:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25006:	83 f8 fa             	cmp    eax,0xfffffffa
   25009:	0f 8d e5 46 00 00    	jge    296f4 <JS_CallInternal+0x6b54>
   2500f:	83 f8 f8             	cmp    eax,0xfffffff8
   25012:	0f 8c e4 46 00 00    	jl     296fc <JS_CallInternal+0x6b5c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20500
   25018:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2501d:	49 83 c4 01          	add    r12,0x1
   25021:	49 89 c5             	mov    r13,rax
   25024:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25028:	ff e0                	jmp    rax
   2502a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20475
   2502e:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   25032:	74 54                	je     25088 <JS_CallInternal+0x24e8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20476
   25034:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20477
   2503b:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   2503f:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25043:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20476
   2504a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20477
   2504e:	e8 1d 37 02 00       	call   48770 <JS_ToObject>
   25053:	49 89 c1             	mov    r9,rax
   25056:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20478 (discriminator 1)
   25059:	83 fa 06             	cmp    edx,0x6
   2505c:	0f 84 de e2 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20480
   25062:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25066:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2506a:	83 fa f6             	cmp    edx,0xfffffff6
   2506d:	76 11                	jbe    25080 <JS_CallInternal+0x24e0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2506f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25072:	83 e8 01             	sub    eax,0x1
   25075:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25078:	85 c0                	test   eax,eax
   2507a:	0f 8e 1f 73 00 00    	jle    2c39f <JS_CallInternal+0x97ff>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20481
   25080:	4c 89 4b f0          	mov    QWORD PTR [rbx-0x10],r9
   25084:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20483
   25088:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2508d:	49 83 c4 01          	add    r12,0x1
   25091:	49 89 c5             	mov    r13,rax
   25094:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25098:	ff e0                	jmp    rax
   2509a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20465
   2509e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20464
   250a5:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   250aa:	45 8b 34 24          	mov    r14d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20465
   250ae:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   250b2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   250b9:	44 89 f1             	mov    ecx,r14d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   250bc:	48 8b 80 90 01 00 00 	mov    rax,QWORD PTR [rax+0x190]
   250c3:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   250c7:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   250ca:	21 c1                	and    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   250cc:	8b 4c 8a 38          	mov    ecx,DWORD PTR [rdx+rcx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   250d0:	48 85 c9             	test   rcx,rcx
   250d3:	0f 84 4e 4f 00 00    	je     2a027 <JS_CallInternal+0x7487>
   250d9:	48 8d 34 85 34 00 00 	lea    rsi,[rax*4+0x34]
   250e0:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   250e1:	48 8d 04 ce          	lea    rax,[rsi+rcx*8]
   250e5:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   250e8:	44 3b 70 04          	cmp    r14d,DWORD PTR [rax+0x4]
   250ec:	0f 85 27 4f 00 00    	jne    2a019 <JS_CallInternal+0x7479>
   250f2:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20470
   250f4:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20472
   250f7:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20470
   250fb:	48 83 c3 10          	add    rbx,0x10
   250ff:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   25106:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20472
   25107:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2510d:	49 89 c5             	mov    r13,rax
   25110:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25114:	ff e0                	jmp    rax
   25116:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20453
   2511a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16100
   25121:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   25125:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16099
   25129:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20453
   2512d:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16101
   25131:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25138:	4c 89 ee             	mov    rsi,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16099
   2513b:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16101
   2513f:	4c 89 f2             	mov    rdx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16099
   25142:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   25149:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16101
   25150:	e8 ab eb 01 00       	call   43d00 <JS_ValueToAtom>
   25155:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16102 (discriminator 1)
   25157:	85 c0                	test   eax,eax
   25159:	0f 84 e1 e1 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16104
   2515f:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   25166:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2516d:	41 b8 00 80 00 00    	mov    r8d,0x8000
   25173:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   25179:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25180:	e8 0b 62 02 00       	call   4b390 <JS_DeleteProperty>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   25185:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16104
   2518b:	41 89 c0             	mov    r8d,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2518e:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   25194:	0f 8f 8f 4f 00 00    	jg     2a129 <JS_CallInternal+0x7589>
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16106 (discriminator 1)
   2519a:	45 85 c0             	test   r8d,r8d
   2519d:	0f 88 9d e1 ff ff    	js     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   251a3:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   251aa:	76 1e                	jbe    251ca <JS_CallInternal+0x262a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   251ac:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   251b3:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   251b6:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   251bc:	83 e8 01             	sub    eax,0x1
   251bf:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   251c2:	85 c0                	test   eax,eax
   251c4:	0f 8e 33 63 00 00    	jle    2b4fd <JS_CallInternal+0x895d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   251ca:	41 83 fe f6          	cmp    r14d,0xfffffff6
   251ce:	76 13                	jbe    251e3 <JS_CallInternal+0x2643>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   251d0:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   251d4:	83 e8 01             	sub    eax,0x1
   251d7:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   251db:	85 c0                	test   eax,eax
   251dd:	0f 8e bc 64 00 00    	jle    2b69f <JS_CallInternal+0x8aff>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   251e3:	31 c0                	xor    eax,eax
   251e5:	45 85 c0             	test   r8d,r8d
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16110
   251e8:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   251ef:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   251f0:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20456
   251f3:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20457
   251f7:	49 83 c4 01          	add    r12,0x1
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16110
   251fb:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20457
   251ff:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25205:	49 89 c5             	mov    r13,rax
   25208:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2520c:	ff e0                	jmp    rax
   2520e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18069
   25212:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
   25216:	48 8b 53 d0          	mov    rdx,QWORD PTR [rbx-0x30]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2521a:	83 f8 f6             	cmp    eax,0xfffffff6
   2521d:	76 04                	jbe    25223 <JS_CallInternal+0x2683>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2521f:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18069
   25223:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18070
   25227:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18069
   2522b:	48 89 13             	mov    QWORD PTR [rbx],rdx
   2522e:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25232:	83 f8 f6             	cmp    eax,0xfffffff6
   25235:	76 04                	jbe    2523b <JS_CallInternal+0x269b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25237:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18070
   2523b:	48 89 43 18          	mov    QWORD PTR [rbx+0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18071
   2523f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18070
   25243:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   25247:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2524b:	83 f8 f6             	cmp    eax,0xfffffff6
   2524e:	76 04                	jbe    25254 <JS_CallInternal+0x26b4>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25250:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18071
   25254:	48 89 53 20          	mov    QWORD PTR [rbx+0x20],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18073
   25258:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18072
   2525c:	48 83 c3 30          	add    rbx,0x30
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18071
   25260:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18073
   25264:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2526a:	49 89 c5             	mov    r13,rax
   2526d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25271:	ff e0                	jmp    rax
   25273:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18064
   25277:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   2527b:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2527f:	83 f8 f6             	cmp    eax,0xfffffff6
   25282:	76 04                	jbe    25288 <JS_CallInternal+0x26e8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25284:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18064
   25288:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18065
   2528c:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18064
   25290:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25293:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25297:	83 f8 f6             	cmp    eax,0xfffffff6
   2529a:	76 04                	jbe    252a0 <JS_CallInternal+0x2700>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2529c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18065
   252a0:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18067
   252a4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18066
   252a8:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18065
   252ac:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18067
   252b0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   252b6:	49 89 c5             	mov    r13,rax
   252b9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   252bd:	ff e0                	jmp    rax
   252bf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18060
   252c3:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   252c7:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   252cb:	83 f8 f6             	cmp    eax,0xfffffff6
   252ce:	76 04                	jbe    252d4 <JS_CallInternal+0x2734>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   252d0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18060
   252d4:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18062
   252d7:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18061
   252db:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18060
   252df:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18062
   252e3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   252e9:	49 89 c5             	mov    r13,rax
   252ec:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   252f0:	ff e0                	jmp    rax
   252f2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18054
   252f6:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   252fa:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   252fe:	83 fa f6             	cmp    edx,0xfffffff6
   25301:	76 11                	jbe    25314 <JS_CallInternal+0x2774>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25303:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25306:	83 e8 01             	sub    eax,0x1
   25309:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2530c:	85 c0                	test   eax,eax
   2530e:	0f 8e 60 56 00 00    	jle    2a974 <JS_CallInternal+0x7dd4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18055
   25314:	f3 0f 6f 73 e0       	movdqu xmm6,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18056
   25319:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18058
   2531e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18057
   25322:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18055
   25326:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18056
   2532a:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18058
   2532e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25334:	49 89 c5             	mov    r13,rax
   25337:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2533b:	ff e0                	jmp    rax
   2533d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18049
   25341:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   25345:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25349:	83 fa f6             	cmp    edx,0xfffffff6
   2534c:	76 11                	jbe    2535f <JS_CallInternal+0x27bf>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2534e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25351:	83 e8 01             	sub    eax,0x1
   25354:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25357:	85 c0                	test   eax,eax
   25359:	0f 8e 00 56 00 00    	jle    2a95f <JS_CallInternal+0x7dbf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18050
   2535f:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18052
   25364:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18051
   25368:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18050
   2536c:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18052
   25370:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25376:	49 89 c5             	mov    r13,rax
   25379:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2537d:	ff e0                	jmp    rax
   2537f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   25383:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25387:	48 83 eb 10          	sub    rbx,0x10
   2538b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2538e:	83 fa f6             	cmp    edx,0xfffffff6
   25391:	76 11                	jbe    253a4 <JS_CallInternal+0x2804>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25393:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25396:	83 e8 01             	sub    eax,0x1
   25399:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2539c:	85 c0                	test   eax,eax
   2539e:	0f 8e e5 55 00 00    	jle    2a989 <JS_CallInternal+0x7de9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18047
   253a4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   253a9:	49 83 c4 01          	add    r12,0x1
   253ad:	49 89 c5             	mov    r13,rax
   253b0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   253b4:	ff e0                	jmp    rax
   253b6:	f3 0f 1e fa          	endbr64
min_int():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:90
   253ba:	8b 8d bc fe ff ff    	mov    ecx,DWORD PTR [rbp-0x144]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18035 (discriminator 1)
   253c0:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18036
   253c5:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18038
   253ca:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   253ce:	48 8b bd a8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x158]
min_int():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:90
   253d5:	39 c8                	cmp    eax,ecx
   253d7:	0f 4f c1             	cmovg  eax,ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18038
   253da:	48 63 d0             	movsxd rdx,eax
   253dd:	29 c1                	sub    ecx,eax
   253df:	48 c1 e2 04          	shl    rdx,0x4
   253e3:	89 ce                	mov    esi,ecx
   253e5:	48 01 fa             	add    rdx,rdi
   253e8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   253ef:	e8 7c 4b 02 00       	call   49f70 <js_create_array>
   253f4:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18039 (discriminator 2)
   253f8:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18038
   253fc:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18039 (discriminator 2)
   253ff:	0f 84 99 60 00 00    	je     2b49e <JS_CallInternal+0x88fe>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18042
   25405:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18038
   2540b:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18042
   2540e:	49 83 c4 03          	add    r12,0x3
   25412:	49 89 c5             	mov    r13,rax
   25415:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25419:	ff e0                	jmp    rax
   2541b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17990
   2541f:	41 80 3c 24 06       	cmp    BYTE PTR [r12],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17989
   25424:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17990
   25429:	0f 87 95 cb fe ff    	ja     11fc4 <JS_CallInternal.cold>
   2542f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25434:	48 8d 15 3d 1d 0b 00 	lea    rdx,[rip+0xb1d3d]        # d7178 <qjsc_repl_size+0x46c>
   2543b:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   2543f:	48 01 d0             	add    rax,rdx
   25442:	3e ff e0             	notrack jmp rax
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5847
   25445:	31 f6                	xor    esi,esi
   25447:	b9 01 00 00 00       	mov    ecx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18019
   2544c:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5847
   25450:	ba 02 00 00 00       	mov    edx,0x2
   25455:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2545c:	e8 af 17 02 00       	call   46c10 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18019
   25461:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18020 (discriminator 2)
   25465:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18019
   25469:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18020 (discriminator 2)
   2546c:	0f 84 be 00 00 00    	je     25530 <JS_CallInternal+0x2990>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18024
   25472:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18032
   25475:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   2547b:	49 83 c4 02          	add    r12,0x2
   2547f:	49 89 c5             	mov    r13,rax
   25482:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25486:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18011
   25488:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17901 (discriminator 1)
   2548f:	48 8d 53 10          	lea    rdx,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18011
   25493:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18012 (discriminator 1)
   25497:	48 85 c0             	test   rax,rax
   2549a:	0f 84 c7 76 00 00    	je     2cb67 <JS_CallInternal+0x9fc7>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   254a0:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18015
   254a4:	48 89 03             	mov    QWORD PTR [rbx],rax
   254a7:	48 c7 43 08 ff ff ff 	mov    QWORD PTR [rbx+0x8],0xffffffffffffffff
   254ae:	ff 
   254af:	48 89 d3             	mov    rbx,rdx
   254b2:	eb c1                	jmp    25475 <JS_CallInternal+0x28d5>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   254b4:	83 bd 80 fe ff ff f6 	cmp    DWORD PTR [rbp-0x180],0xfffffff6
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18006
   254bb:	48 8d 43 10          	lea    rax,[rbx+0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   254bf:	76 0b                	jbe    254cc <JS_CallInternal+0x292c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   254c1:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   254c8:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18006
   254cc:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   254d3:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   254d6:	48 8b 8d 80 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x180]
   254dd:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   254e1:	48 89 c3             	mov    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18007
   254e4:	eb 8f                	jmp    25475 <JS_CallInternal+0x28d5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17997
   254e6:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17997 (discriminator 1)
   254ed:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   254f4:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
   254f8:	48 8b 95 a8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x158]
   254ff:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17997
   25506:	44 0f b7 40 38       	movzx  r8d,WORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17997 (discriminator 1)
   2550b:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   25511:	41 39 c0             	cmp    r8d,eax
   25514:	89 c6                	mov    esi,eax
   25516:	44 0f 4f c0          	cmovg  r8d,eax
   2551a:	e8 21 69 02 00       	call   4be40 <js_build_mapped_arguments>
   2551f:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17999 (discriminator 2)
   25523:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17997 (discriminator 1)
   25527:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17999 (discriminator 2)
   2552a:	0f 85 42 ff ff ff    	jne    25472 <JS_CallInternal+0x28d2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18036
   25530:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17989
   25533:	4d 89 f4             	mov    r12,r14
   25536:	e9 05 de ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17992
   2553b:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   25542:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17992
   25548:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16182
   2554c:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   25553:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16183
   25557:	48 8b 91 58 01 00 00 	mov    rdx,QWORD PTR [rcx+0x158]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   2555e:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   25565:	48 8b 81 50 01 00 00 	mov    rax,QWORD PTR [rcx+0x150]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2556c:	83 fa f6             	cmp    edx,0xfffffff6
   2556f:	76 04                	jbe    25575 <JS_CallInternal+0x29d5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25571:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:713
   25575:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16183
   2557c:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
   25583:	48 89 95 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16184
   2558a:	48 8b 81 60 01 00 00 	mov    rax,QWORD PTR [rcx+0x160]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25591:	83 b9 68 01 00 00 f6 	cmp    DWORD PTR [rcx+0x168],0xfffffff6
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16184 (discriminator 1)
   25598:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2559f:	76 04                	jbe    255a5 <JS_CallInternal+0x2a05>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   255a1:	83 40 fc 02          	add    DWORD PTR [rax-0x4],0x2
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16187
   255a5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16187 (discriminator 1)
   255ac:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
   255b3:	ba 08 00 00 00       	mov    edx,0x8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16185 (discriminator 1)
   255b8:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16187
   255bf:	48 8b 77 38          	mov    rsi,QWORD PTR [rdi+0x38]
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5305 (discriminator 1)
   255c3:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16187 (discriminator 1)
   255c7:	e8 c4 10 02 00       	call   46690 <JS_NewObjectFromShape>
   255cc:	49 89 c1             	mov    r9,rax
   255cf:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16189 (discriminator 1)
   255d2:	83 fa 06             	cmp    edx,0x6
   255d5:	0f 84 f1 72 00 00    	je     2c8cc <JS_CallInternal+0x9d2c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16195
   255db:	8b bd bc fe ff ff    	mov    edi,DWORD PTR [rbp-0x144]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16194
   255e1:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16195
   255e3:	85 ff                	test   edi,edi
   255e5:	0f 8f e5 6d 00 00    	jg     2c3d0 <JS_CallInternal+0x9830>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16203
   255eb:	49 89 41 30          	mov    QWORD PTR [r9+0x30],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16204
   255ef:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   255f5:	41 89 41 38          	mov    DWORD PTR [r9+0x38],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17992
   255f9:	4c 89 0b             	mov    QWORD PTR [rbx],r9
   255fc:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   25600:	4c 89 eb             	mov    rbx,r13
   25603:	e9 6d fe ff ff       	jmp    25475 <JS_CallInternal+0x28d5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18003
   25608:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2560f:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25613:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
   25617:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2561b:	83 fa f6             	cmp    edx,0xfffffff6
   2561e:	76 04                	jbe    25624 <JS_CallInternal+0x2a84>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25620:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18003
   25624:	48 89 03             	mov    QWORD PTR [rbx],rax
   25627:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   2562b:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18004
   2562e:	e9 42 fe ff ff       	jmp    25475 <JS_CallInternal+0x28d5>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30936
   25633:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2563a:	31 f6                	xor    esi,esi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18024
   2563c:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30936
   25640:	e8 0b d4 ff ff       	call   22a50 <JS_GetScriptOrModuleName>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30937
   25645:	85 c0                	test   eax,eax
   25647:	0f 84 d2 68 00 00    	je     2bf1f <JS_CallInternal+0x937f>
js_find_loaded_module():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30026
   2564d:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   25654:	48 8b 91 b8 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1b8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30026 (discriminator 1)
   2565b:	48 81 c1 b0 01 00 00 	add    rcx,0x1b0
   25662:	48 39 d1             	cmp    rcx,rdx
   25665:	75 16                	jne    2567d <JS_CallInternal+0x2add>
   25667:	e9 8f 76 00 00       	jmp    2ccfb <JS_CallInternal+0xa15b>
   2566c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30026 (discriminator 2)
   25670:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30026 (discriminator 1)
   25674:	48 39 d1             	cmp    rcx,rdx
   25677:	0f 84 58 68 00 00    	je     2bed5 <JS_CallInternal+0x9335>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30028
   2567d:	3b 42 f8             	cmp    eax,DWORD PTR [rdx-0x8]
   25680:	75 ee                	jne    25670 <JS_CallInternal+0x2ad0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30027
   25682:	48 83 ea 18          	sub    rdx,0x18
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   25686:	3d f2 00 00 00       	cmp    eax,0xf2
   2568b:	0f 8f 4d 68 00 00    	jg     2bede <JS_CallInternal+0x933e>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30949
   25691:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25698:	48 89 d6             	mov    rsi,rdx
   2569b:	e8 80 d4 ff ff       	call   22b20 <JS_GetImportMeta>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18024
   256a0:	48 89 03             	mov    QWORD PTR [rbx],rax
   256a3:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18025 (discriminator 2)
   256a7:	83 fa 06             	cmp    edx,0x6
   256aa:	0f 85 c2 fd ff ff    	jne    25472 <JS_CallInternal+0x28d2>
   256b0:	e9 7b fe ff ff       	jmp    25530 <JS_CallInternal+0x2990>
   256b5:	0f 1f 00             	nop    DWORD PTR [rax]
   256b8:	f3 0f 1e fa          	endbr64
JS_NewObject():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5859
   256bc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   256c3:	b9 01 00 00 00       	mov    ecx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17983
   256c8:	4c 8d 73 10          	lea    r14,[rbx+0x10]
JS_NewObject():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5859
   256cc:	48 8b 47 58          	mov    rax,QWORD PTR [rdi+0x58]
   256d0:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
   256d4:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   256d8:	e8 33 15 02 00       	call   46c10 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17983
   256dd:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17984 (discriminator 2)
   256e1:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17983
   256e5:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17984 (discriminator 2)
   256e8:	0f 84 ea 5e 00 00    	je     2b5d8 <JS_CallInternal+0x8a38>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17986
   256ee:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17983
   256f3:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17986
   256f6:	49 83 c4 01          	add    r12,0x1
   256fa:	49 89 c5             	mov    r13,rax
   256fd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25701:	ff e0                	jmp    rax
   25703:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17980
   25707:	48 c7 03 01 00 00 00 	mov    QWORD PTR [rbx],0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17981
   2570e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17980
   25712:	48 83 c3 10          	add    rbx,0x10
   25716:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2571d:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17981
   2571e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25724:	49 89 c5             	mov    r13,rax
   25727:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2572b:	ff e0                	jmp    rax
   2572d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17977
   25731:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17978
   25738:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17977
   2573c:	48 83 c3 10          	add    rbx,0x10
   25740:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   25747:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17978
   25748:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2574e:	49 89 c5             	mov    r13,rax
   25751:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25755:	ff e0                	jmp    rax
   25757:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17958
   2575b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   25762:	f6 40 10 01          	test   BYTE PTR [rax+0x10],0x1
   25766:	0f 85 00 3f 00 00    	jne    2966c <JS_CallInternal+0x6acc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17960 (discriminator 1)
   2576c:	83 bd 88 fe ff ff ff 	cmp    DWORD PTR [rbp-0x178],0xffffffff
   25773:	0f 85 f9 67 00 00    	jne    2bf72 <JS_CallInternal+0x93d2>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25779:	48 8b 85 78 fe ff ff 	mov    rax,QWORD PTR [rbp-0x188]
   25780:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17911
   25784:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   2578b:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17973
   25792:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17975
   25795:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17973
   25799:	48 83 c3 10          	add    rbx,0x10
   2579d:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17975
   257a1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   257a7:	49 89 c5             	mov    r13,rax
   257aa:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   257ae:	ff e0                	jmp    rax
   257b0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458
   257b4:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   257b8:	48 8b 7b e8          	mov    rdi,QWORD PTR [rbx-0x18]
   257bc:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   257c0:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   257c4:	49 89 f5             	mov    r13,rsi
   257c7:	49 89 fe             	mov    r14,rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 1)
   257ca:	83 ff ff             	cmp    edi,0xffffffff
   257cd:	0f 85 27 43 00 00    	jne    29afa <JS_CallInternal+0x6f5a>
   257d3:	45 85 c0             	test   r8d,r8d
   257d6:	0f 85 1e 43 00 00    	jne    29afa <JS_CallInternal+0x6f5a>
   257dc:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   257e1:	0f 85 13 43 00 00    	jne    29afa <JS_CallInternal+0x6f5a>
   257e7:	3b 4e 38             	cmp    ecx,DWORD PTR [rsi+0x38]
   257ea:	0f 83 0a 43 00 00    	jae    29afa <JS_CallInternal+0x6f5a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 9)
   257f0:	89 c8                	mov    eax,ecx
   257f2:	48 c1 e0 04          	shl    rax,0x4
   257f6:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   257fa:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   257fd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25801:	83 f8 f6             	cmp    eax,0xfffffff6
   25804:	76 04                	jbe    2580a <JS_CallInternal+0x2c6a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25806:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2580a:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2580e:	76 13                	jbe    25823 <JS_CallInternal+0x2c83>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25810:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   25814:	8d 57 ff             	lea    edx,[rdi-0x1]
   25817:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   2581b:	85 d2                	test   edx,edx
   2581d:	0f 8e c6 4f 00 00    	jle    2a7e9 <JS_CallInternal+0x7c49>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 1)
   25823:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19459
   25827:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 1)
   2582b:	48 83 eb 10          	sub    rbx,0x10
   2582f:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19459
   25833:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25839:	49 89 c5             	mov    r13,rax
   2583c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25840:	ff e0                	jmp    rax
   25842:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18638
   25846:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   2584d:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18638
   25852:	48 83 eb 10          	sub    rbx,0x10
   25856:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25859:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   2585d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25861:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25864:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25867:	83 fa f6             	cmp    edx,0xfffffff6
   2586a:	76 11                	jbe    2587d <JS_CallInternal+0x2cdd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2586c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2586f:	83 e8 01             	sub    eax,0x1
   25872:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25875:	85 c0                	test   eax,eax
   25877:	0f 8e 21 51 00 00    	jle    2a99e <JS_CallInternal+0x7dfe>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18638 (discriminator 1)
   2587d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25882:	49 83 c4 01          	add    r12,0x1
   25886:	49 89 c5             	mov    r13,rax
   25889:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2588d:	ff e0                	jmp    rax
   2588f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18637
   25893:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   2589a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2589e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   258a2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   258a6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   258a9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   258ad:	83 f8 f6             	cmp    eax,0xfffffff6
   258b0:	76 04                	jbe    258b6 <JS_CallInternal+0x2d16>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   258b2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18637
   258b6:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18637 (discriminator 1)
   258b9:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18637
   258bd:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18637 (discriminator 1)
   258c1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18637
   258c7:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18637 (discriminator 1)
   258ca:	49 89 c5             	mov    r13,rax
   258cd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   258d1:	ff e0                	jmp    rax
   258d3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18636
   258d7:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   258de:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   258e2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   258e6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   258ea:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   258ed:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   258f1:	83 f8 f6             	cmp    eax,0xfffffff6
   258f4:	76 04                	jbe    258fa <JS_CallInternal+0x2d5a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   258f6:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18636
   258fa:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18636 (discriminator 1)
   258fd:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18636
   25901:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18636 (discriminator 1)
   25905:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18636
   2590b:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18636 (discriminator 1)
   2590e:	49 89 c5             	mov    r13,rax
   25911:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25915:	ff e0                	jmp    rax
   25917:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18635
   2591b:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25922:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25926:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2592a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   2592e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25931:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25935:	83 f8 f6             	cmp    eax,0xfffffff6
   25938:	76 04                	jbe    2593e <JS_CallInternal+0x2d9e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2593a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18635
   2593e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18635 (discriminator 1)
   25941:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18635
   25945:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18635 (discriminator 1)
   25949:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18635
   2594f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18635 (discriminator 1)
   25952:	49 89 c5             	mov    r13,rax
   25955:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25959:	ff e0                	jmp    rax
   2595b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18634
   2595f:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25966:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2596a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   2596d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25971:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25974:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25978:	83 f8 f6             	cmp    eax,0xfffffff6
   2597b:	76 04                	jbe    25981 <JS_CallInternal+0x2de1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2597d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18634
   25981:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18634 (discriminator 1)
   25984:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18634
   25988:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18634 (discriminator 1)
   2598c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18634
   25992:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18634 (discriminator 1)
   25995:	49 89 c5             	mov    r13,rax
   25998:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2599c:	ff e0                	jmp    rax
   2599e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18633
   259a2:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   259a6:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   259aa:	83 f8 f6             	cmp    eax,0xfffffff6
   259ad:	76 04                	jbe    259b3 <JS_CallInternal+0x2e13>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   259af:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   259b3:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   259ba:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   259be:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   259c2:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   259c6:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   259ca:	83 f9 f6             	cmp    ecx,0xfffffff6
   259cd:	76 11                	jbe    259e0 <JS_CallInternal+0x2e40>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   259cf:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   259d2:	83 e8 01             	sub    eax,0x1
   259d5:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   259d8:	85 c0                	test   eax,eax
   259da:	0f 8e d3 4f 00 00    	jle    2a9b3 <JS_CallInternal+0x7e13>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18633 (discriminator 2)
   259e0:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   259e5:	49 83 c4 01          	add    r12,0x1
   259e9:	49 89 c5             	mov    r13,rax
   259ec:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   259f0:	ff e0                	jmp    rax
   259f2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18632
   259f6:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   259fa:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   259fe:	83 f8 f6             	cmp    eax,0xfffffff6
   25a01:	76 04                	jbe    25a07 <JS_CallInternal+0x2e67>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25a03:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25a07:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   25a0e:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   25a12:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25a16:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   25a1a:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25a1e:	83 f9 f6             	cmp    ecx,0xfffffff6
   25a21:	76 11                	jbe    25a34 <JS_CallInternal+0x2e94>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25a23:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25a26:	83 e8 01             	sub    eax,0x1
   25a29:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25a2c:	85 c0                	test   eax,eax
   25a2e:	0f 8e f5 51 00 00    	jle    2ac29 <JS_CallInternal+0x8089>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18632 (discriminator 2)
   25a34:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25a39:	49 83 c4 01          	add    r12,0x1
   25a3d:	49 89 c5             	mov    r13,rax
   25a40:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25a44:	ff e0                	jmp    rax
   25a46:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18631
   25a4a:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25a4e:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25a52:	83 f8 f6             	cmp    eax,0xfffffff6
   25a55:	76 04                	jbe    25a5b <JS_CallInternal+0x2ebb>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25a57:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25a5b:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   25a62:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   25a66:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25a6a:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   25a6e:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25a72:	83 f9 f6             	cmp    ecx,0xfffffff6
   25a75:	76 11                	jbe    25a88 <JS_CallInternal+0x2ee8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25a77:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25a7a:	83 e8 01             	sub    eax,0x1
   25a7d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25a80:	85 c0                	test   eax,eax
   25a82:	0f 8e b9 51 00 00    	jle    2ac41 <JS_CallInternal+0x80a1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18631 (discriminator 2)
   25a88:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25a8d:	49 83 c4 01          	add    r12,0x1
   25a91:	49 89 c5             	mov    r13,rax
   25a94:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25a98:	ff e0                	jmp    rax
   25a9a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18630
   25a9e:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25aa2:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25aa6:	83 f8 f6             	cmp    eax,0xfffffff6
   25aa9:	76 04                	jbe    25aaf <JS_CallInternal+0x2f0f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25aab:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25aaf:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   25ab6:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   25aba:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25abd:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   25ac1:	48 89 17             	mov    QWORD PTR [rdi],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25ac4:	83 f9 f6             	cmp    ecx,0xfffffff6
   25ac7:	76 11                	jbe    25ada <JS_CallInternal+0x2f3a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25ac9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25acc:	83 e8 01             	sub    eax,0x1
   25acf:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25ad2:	85 c0                	test   eax,eax
   25ad4:	0f 8e 22 51 00 00    	jle    2abfc <JS_CallInternal+0x805c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18630 (discriminator 2)
   25ada:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25adf:	49 83 c4 01          	add    r12,0x1
   25ae3:	49 89 c5             	mov    r13,rax
   25ae6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25aea:	ff e0                	jmp    rax
   25aec:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25af0:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25af7:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18629
   25afc:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25b00:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   25b04:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25b08:	0f 11 68 30          	movups XMMWORD PTR [rax+0x30],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25b0c:	83 fa f6             	cmp    edx,0xfffffff6
   25b0f:	76 11                	jbe    25b22 <JS_CallInternal+0x2f82>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25b11:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b14:	83 e8 01             	sub    eax,0x1
   25b17:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b1a:	85 c0                	test   eax,eax
   25b1c:	0f 8e f2 50 00 00    	jle    2ac14 <JS_CallInternal+0x8074>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18629 (discriminator 1)
   25b22:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25b27:	49 83 c4 01          	add    r12,0x1
   25b2b:	49 89 c5             	mov    r13,rax
   25b2e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25b32:	ff e0                	jmp    rax
   25b34:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25b38:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25b3f:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18628
   25b44:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25b48:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   25b4c:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25b50:	0f 11 50 20          	movups XMMWORD PTR [rax+0x20],xmm2
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25b54:	83 fa f6             	cmp    edx,0xfffffff6
   25b57:	76 11                	jbe    25b6a <JS_CallInternal+0x2fca>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25b59:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b5c:	83 e8 01             	sub    eax,0x1
   25b5f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b62:	85 c0                	test   eax,eax
   25b64:	0f 8e 6c 4f 00 00    	jle    2aad6 <JS_CallInternal+0x7f36>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18628 (discriminator 1)
   25b6a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25b6f:	49 83 c4 01          	add    r12,0x1
   25b73:	49 89 c5             	mov    r13,rax
   25b76:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25b7a:	ff e0                	jmp    rax
   25b7c:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25b80:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25b87:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18627
   25b8c:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25b90:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   25b94:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25b98:	0f 11 60 10          	movups XMMWORD PTR [rax+0x10],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25b9c:	83 fa f6             	cmp    edx,0xfffffff6
   25b9f:	76 11                	jbe    25bb2 <JS_CallInternal+0x3012>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25ba1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25ba4:	83 e8 01             	sub    eax,0x1
   25ba7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25baa:	85 c0                	test   eax,eax
   25bac:	0f 8e 39 4f 00 00    	jle    2aaeb <JS_CallInternal+0x7f4b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18627 (discriminator 1)
   25bb2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25bb7:	49 83 c4 01          	add    r12,0x1
   25bbb:	49 89 c5             	mov    r13,rax
   25bbe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25bc2:	ff e0                	jmp    rax
   25bc4:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25bc8:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25bcf:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18626
   25bd4:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25bd8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25bdc:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25bdf:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25be2:	83 fa f6             	cmp    edx,0xfffffff6
   25be5:	76 11                	jbe    25bf8 <JS_CallInternal+0x3058>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25be7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25bea:	83 e8 01             	sub    eax,0x1
   25bed:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25bf0:	85 c0                	test   eax,eax
   25bf2:	0f 8e b1 4e 00 00    	jle    2aaa9 <JS_CallInternal+0x7f09>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18626 (discriminator 1)
   25bf8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25bfd:	49 83 c4 01          	add    r12,0x1
   25c01:	49 89 c5             	mov    r13,rax
   25c04:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25c08:	ff e0                	jmp    rax
   25c0a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18625
   25c0e:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   25c15:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25c19:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   25c1d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25c21:	83 f8 f6             	cmp    eax,0xfffffff6
   25c24:	76 04                	jbe    25c2a <JS_CallInternal+0x308a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25c26:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18625
   25c2a:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18625 (discriminator 1)
   25c2d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18625
   25c31:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18625 (discriminator 1)
   25c35:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18625
   25c3b:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18625 (discriminator 1)
   25c3e:	49 89 c5             	mov    r13,rax
   25c41:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25c45:	ff e0                	jmp    rax
   25c47:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18624
   25c4b:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   25c52:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25c56:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   25c5a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25c5e:	83 f8 f6             	cmp    eax,0xfffffff6
   25c61:	76 04                	jbe    25c67 <JS_CallInternal+0x30c7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25c63:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18624
   25c67:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18624 (discriminator 1)
   25c6a:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18624
   25c6e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18624 (discriminator 1)
   25c72:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18624
   25c78:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18624 (discriminator 1)
   25c7b:	49 89 c5             	mov    r13,rax
   25c7e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25c82:	ff e0                	jmp    rax
   25c84:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18623
   25c88:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   25c8f:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25c93:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   25c97:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25c9b:	83 f8 f6             	cmp    eax,0xfffffff6
   25c9e:	76 04                	jbe    25ca4 <JS_CallInternal+0x3104>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25ca0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18623
   25ca4:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18623 (discriminator 1)
   25ca7:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18623
   25cab:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18623 (discriminator 1)
   25caf:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18623
   25cb5:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18623 (discriminator 1)
   25cb8:	49 89 c5             	mov    r13,rax
   25cbb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25cbf:	ff e0                	jmp    rax
   25cc1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18654
   25cc5:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25cca:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25cd1:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25cd5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25cd9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25cdc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25ce0:	83 f8 f6             	cmp    eax,0xfffffff6
   25ce3:	76 04                	jbe    25ce9 <JS_CallInternal+0x3149>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25ce5:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18655
   25ce9:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18658
   25cec:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18656
   25cf0:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18655
   25cf4:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18658
   25cf8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25cfe:	49 89 c5             	mov    r13,rax
   25d01:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25d05:	ff e0                	jmp    rax
   25d07:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18645
   25d0b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25d0f:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25d13:	83 fa f6             	cmp    edx,0xfffffff6
   25d16:	76 04                	jbe    25d1c <JS_CallInternal+0x317c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25d18:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18645 (discriminator 1)
   25d1c:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25d23:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25d27:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25d2b:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25d2f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25d32:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25d36:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25d39:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25d3d:	76 11                	jbe    25d50 <JS_CallInternal+0x31b0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25d3f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25d42:	83 e8 01             	sub    eax,0x1
   25d45:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25d48:	85 c0                	test   eax,eax
   25d4a:	0f 8e 6e 4d 00 00    	jle    2aabe <JS_CallInternal+0x7f1e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18645 (discriminator 2)
   25d50:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25d55:	49 83 c4 01          	add    r12,0x1
   25d59:	49 89 c5             	mov    r13,rax
   25d5c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25d60:	ff e0                	jmp    rax
   25d62:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18644
   25d66:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25d6a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25d6e:	83 fa f6             	cmp    edx,0xfffffff6
   25d71:	76 04                	jbe    25d77 <JS_CallInternal+0x31d7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25d73:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18644 (discriminator 1)
   25d77:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25d7e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25d82:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25d86:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25d8a:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25d8d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25d91:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25d94:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25d98:	76 11                	jbe    25dab <JS_CallInternal+0x320b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25d9a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25d9d:	83 e8 01             	sub    eax,0x1
   25da0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25da3:	85 c0                	test   eax,eax
   25da5:	0f 8e ce 4c 00 00    	jle    2aa79 <JS_CallInternal+0x7ed9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18644 (discriminator 2)
   25dab:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25db0:	49 83 c4 01          	add    r12,0x1
   25db4:	49 89 c5             	mov    r13,rax
   25db7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25dbb:	ff e0                	jmp    rax
   25dbd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18643
   25dc1:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25dc5:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25dc9:	83 fa f6             	cmp    edx,0xfffffff6
   25dcc:	76 04                	jbe    25dd2 <JS_CallInternal+0x3232>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25dce:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18643 (discriminator 1)
   25dd2:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25dd9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25ddd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25de1:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25de5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25de8:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25dec:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25def:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25df3:	76 11                	jbe    25e06 <JS_CallInternal+0x3266>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25df5:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25df8:	83 e8 01             	sub    eax,0x1
   25dfb:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25dfe:	85 c0                	test   eax,eax
   25e00:	0f 8e 8b 4c 00 00    	jle    2aa91 <JS_CallInternal+0x7ef1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18643 (discriminator 2)
   25e06:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25e0b:	49 83 c4 01          	add    r12,0x1
   25e0f:	49 89 c5             	mov    r13,rax
   25e12:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25e16:	ff e0                	jmp    rax
   25e18:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18642
   25e1c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25e20:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25e24:	83 fa f6             	cmp    edx,0xfffffff6
   25e27:	76 04                	jbe    25e2d <JS_CallInternal+0x328d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25e29:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18642 (discriminator 1)
   25e2d:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25e34:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25e37:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25e3b:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25e3f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25e42:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25e46:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25e49:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25e4d:	76 11                	jbe    25e60 <JS_CallInternal+0x32c0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25e4f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25e52:	83 e8 01             	sub    eax,0x1
   25e55:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25e58:	85 c0                	test   eax,eax
   25e5a:	0f 8e ec 4b 00 00    	jle    2aa4c <JS_CallInternal+0x7eac>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18642 (discriminator 2)
   25e60:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25e65:	49 83 c4 01          	add    r12,0x1
   25e69:	49 89 c5             	mov    r13,rax
   25e6c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25e70:	ff e0                	jmp    rax
   25e72:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18641
   25e76:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25e7d:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18641
   25e82:	48 83 eb 10          	sub    rbx,0x10
   25e86:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25e8a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25e8e:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25e92:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25e95:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25e98:	83 fa f6             	cmp    edx,0xfffffff6
   25e9b:	76 11                	jbe    25eae <JS_CallInternal+0x330e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25e9d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25ea0:	83 e8 01             	sub    eax,0x1
   25ea3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25ea6:	85 c0                	test   eax,eax
   25ea8:	0f 8e b6 4b 00 00    	jle    2aa64 <JS_CallInternal+0x7ec4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18641 (discriminator 1)
   25eae:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25eb3:	49 83 c4 01          	add    r12,0x1
   25eb7:	49 89 c5             	mov    r13,rax
   25eba:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ebe:	ff e0                	jmp    rax
   25ec0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18640
   25ec4:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25ecb:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18640
   25ed0:	48 83 eb 10          	sub    rbx,0x10
   25ed4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25ed8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25edc:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25ee0:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25ee3:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25ee6:	83 fa f6             	cmp    edx,0xfffffff6
   25ee9:	76 11                	jbe    25efc <JS_CallInternal+0x335c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25eeb:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25eee:	83 e8 01             	sub    eax,0x1
   25ef1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25ef4:	85 c0                	test   eax,eax
   25ef6:	0f 8e fc 4a 00 00    	jle    2a9f8 <JS_CallInternal+0x7e58>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18640 (discriminator 1)
   25efc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25f01:	49 83 c4 01          	add    r12,0x1
   25f05:	49 89 c5             	mov    r13,rax
   25f08:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25f0c:	ff e0                	jmp    rax
   25f0e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18639
   25f12:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25f19:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18639
   25f1e:	48 83 eb 10          	sub    rbx,0x10
   25f22:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25f26:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25f2a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25f2e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25f31:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25f34:	83 fa f6             	cmp    edx,0xfffffff6
   25f37:	76 11                	jbe    25f4a <JS_CallInternal+0x33aa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25f39:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25f3c:	83 e8 01             	sub    eax,0x1
   25f3f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25f42:	85 c0                	test   eax,eax
   25f44:	0f 8e c3 4a 00 00    	jle    2aa0d <JS_CallInternal+0x7e6d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18639 (discriminator 1)
   25f4a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25f4f:	49 83 c4 01          	add    r12,0x1
   25f53:	49 89 c5             	mov    r13,rax
   25f56:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25f5a:	ff e0                	jmp    rax
   25f5c:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   25f60:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25f64:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18673
   25f69:	48 8b 7b f0          	mov    rdi,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   25f6d:	83 fa f6             	cmp    edx,0xfffffff6
   25f70:	76 04                	jbe    25f76 <JS_CallInternal+0x33d6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   25f72:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18673 (discriminator 1)
   25f76:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25f7d:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25f81:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25f85:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   25f89:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25f8c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25f90:	48 89 38             	mov    QWORD PTR [rax],rdi
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25f93:	83 f9 f6             	cmp    ecx,0xfffffff6
   25f96:	76 11                	jbe    25fa9 <JS_CallInternal+0x3409>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25f98:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25f9b:	83 e8 01             	sub    eax,0x1
   25f9e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25fa1:	85 c0                	test   eax,eax
   25fa3:	0f 8e 22 4a 00 00    	jle    2a9cb <JS_CallInternal+0x7e2b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18675
   25fa9:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   25faf:	49 83 c4 03          	add    r12,0x3
   25fb3:	49 89 c5             	mov    r13,rax
   25fb6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25fba:	ff e0                	jmp    rax
   25fbc:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18664
   25fc0:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25fc5:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25fcc:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18664
   25fd1:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25fd5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   25fd9:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25fdd:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   25fe0:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   25fe3:	83 fa f6             	cmp    edx,0xfffffff6
   25fe6:	76 11                	jbe    25ff9 <JS_CallInternal+0x3459>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   25fe8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25feb:	83 e8 01             	sub    eax,0x1
   25fee:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25ff1:	85 c0                	test   eax,eax
   25ff3:	0f 8e ea 49 00 00    	jle    2a9e3 <JS_CallInternal+0x7e43>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18667
   25ff9:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18665
   25fff:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18667
   26003:	49 83 c4 03          	add    r12,0x3
   26007:	49 89 c5             	mov    r13,rax
   2600a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2600e:	ff e0                	jmp    rax
   26010:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18682
   26014:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   26019:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18681
   26020:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18682
   26025:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   2602c:	00 
   2602d:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   26031:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   26035:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   26038:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18683 (discriminator 2)
   2603c:	83 f8 04             	cmp    eax,0x4
   2603f:	0f 84 87 53 00 00    	je     2b3cc <JS_CallInternal+0x882c>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   26045:	83 f8 f6             	cmp    eax,0xfffffff6
   26048:	76 04                	jbe    2604e <JS_CallInternal+0x34ae>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2604a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18687
   2604e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18690
   26051:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18688
   26055:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18687
   26059:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18690
   2605d:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26063:	49 89 c5             	mov    r13,rax
   26066:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2606a:	ff e0                	jmp    rax
   2606c:	f3 0f 1e fa          	endbr64
   26070:	e9 f1 ce ff ff       	jmp    22f66 <JS_CallInternal+0x3c6>
   26075:	f3 0f 1e fa          	endbr64
   26079:	e9 e8 ce ff ff       	jmp    22f66 <JS_CallInternal+0x3c6>
   2607e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18188 (discriminator 1)
   26082:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   26086:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   2608d:	48 c1 e0 04          	shl    rax,0x4
   26091:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   26095:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   26099:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2609c:	83 fa f6             	cmp    edx,0xfffffff6
   2609f:	76 04                	jbe    260a5 <JS_CallInternal+0x3505>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   260a1:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18190
   260a5:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   260ac:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18189
   260af:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18190
   260b4:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   260b8:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   260bf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   260c6:	e8 e5 69 02 00       	call   4cab0 <js_closure>
   260cb:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18191 (discriminator 2)
   260cf:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18190
   260d3:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18191 (discriminator 2)
   260d6:	0f 84 40 52 00 00    	je     2b31c <JS_CallInternal+0x877c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18194
   260dc:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18190
   260e2:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18194
   260e5:	49 83 c4 05          	add    r12,0x5
   260e9:	49 89 c5             	mov    r13,rax
   260ec:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   260f0:	ff e0                	jmp    rax
   260f2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18177
   260f6:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18178
   260fb:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18184
   26100:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18179
   26104:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18180
   26109:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18181
   2610e:	0f 11 4b e0          	movups XMMWORD PTR [rbx-0x20],xmm1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18179
   26112:	0f 11 6b c0          	movups XMMWORD PTR [rbx-0x40],xmm5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18180
   26116:	0f 11 73 d0          	movups XMMWORD PTR [rbx-0x30],xmm6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18182
   2611a:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18184
   2611e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26124:	49 89 c5             	mov    r13,rax
   26127:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2612b:	ff e0                	jmp    rax
   2612d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18169
   26131:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18170
   26136:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18173
   2613b:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18170
   2613f:	0f 11 53 e0          	movups XMMWORD PTR [rbx-0x20],xmm2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18171
   26143:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18173
   26147:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2614d:	49 89 c5             	mov    r13,rax
   26150:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26154:	ff e0                	jmp    rax
   26156:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18159
   2615a:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18160
   2615f:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18165
   26164:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18161
   26168:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18162
   2616d:	f3 0f 6f 63 b0       	movdqu xmm4,XMMWORD PTR [rbx-0x50]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18160
   26172:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18161
   26176:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18162
   2617a:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18163
   2617e:	0f 11 43 b0          	movups XMMWORD PTR [rbx-0x50],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18165
   26182:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26188:	49 89 c5             	mov    r13,rax
   2618b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2618f:	ff e0                	jmp    rax
   26191:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18150
   26195:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18151
   2619a:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18155
   2619f:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18152
   261a3:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18151
   261a8:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18152
   261ac:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18153
   261b0:	0f 11 43 c0          	movups XMMWORD PTR [rbx-0x40],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18155
   261b4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   261ba:	49 89 c5             	mov    r13,rax
   261bd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   261c1:	ff e0                	jmp    rax
   261c3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18141
   261c7:	f3 0f 6f 43 f0       	movdqu xmm0,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18142
   261cc:	f3 0f 6f 53 e0       	movdqu xmm2,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18146
   261d1:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18143
   261d5:	f3 0f 6f 6b d0       	movdqu xmm5,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18142
   261da:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18143
   261de:	0f 11 6b e0          	movups XMMWORD PTR [rbx-0x20],xmm5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18144
   261e2:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18146
   261e6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   261ec:	49 89 c5             	mov    r13,rax
   261ef:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   261f3:	ff e0                	jmp    rax
   261f5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18130
   261f9:	f3 0f 6f 43 b0       	movdqu xmm0,XMMWORD PTR [rbx-0x50]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18131
   261fe:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18137
   26203:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18132
   26207:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18133
   2620c:	f3 0f 6f 4b e0       	movdqu xmm1,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18134
   26211:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18131
   26216:	0f 11 7b b0          	movups XMMWORD PTR [rbx-0x50],xmm7
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18132
   2621a:	0f 11 5b c0          	movups XMMWORD PTR [rbx-0x40],xmm3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18133
   2621e:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18134
   26222:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18135
   26226:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18137
   2622a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26230:	49 89 c5             	mov    r13,rax
   26233:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26237:	ff e0                	jmp    rax
   26239:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18120
   2623d:	f3 0f 6f 43 c0       	movdqu xmm0,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18121
   26242:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18126
   26247:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18122
   2624b:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18123
   26250:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18121
   26255:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18122
   26259:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18123
   2625d:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18124
   26261:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18126
   26265:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2626b:	49 89 c5             	mov    r13,rax
   2626e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26272:	ff e0                	jmp    rax
   26274:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18111
   26278:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18112
   2627d:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18116
   26282:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18113
   26286:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18112
   2628b:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18113
   2628f:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18114
   26293:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18116
   26297:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2629d:	49 89 c5             	mov    r13,rax
   262a0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   262a4:	ff e0                	jmp    rax
   262a6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18103
   262aa:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18104
   262af:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18107
   262b4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18104
   262b8:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18105
   262bc:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18107
   262c0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   262c6:	49 89 c5             	mov    r13,rax
   262c9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   262cd:	ff e0                	jmp    rax
   262cf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18093
   262d3:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18094
   262d8:	f3 0f 6f 5b e0       	movdqu xmm3,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18095
   262dd:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18096
   262e2:	f3 0f 6f 6b c0       	movdqu xmm5,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18093
   262e7:	0f 11 3b             	movups XMMWORD PTR [rbx],xmm7
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18094
   262ea:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18093
   262ee:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18095
   262f2:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18094
   262f6:	0f 11 5b f0          	movups XMMWORD PTR [rbx-0x10],xmm3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18096
   262fa:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   262fe:	83 f8 f6             	cmp    eax,0xfffffff6
   26301:	76 04                	jbe    26307 <JS_CallInternal+0x3767>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   26303:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18097
   26307:	48 89 53 c0          	mov    QWORD PTR [rbx-0x40],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18099
   2630b:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18098
   2630f:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18097
   26313:	48 89 43 b8          	mov    QWORD PTR [rbx-0x48],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18099
   26317:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2631d:	49 89 c5             	mov    r13,rax
   26320:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26324:	ff e0                	jmp    rax
   26326:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18086
   2632a:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18087
   2632f:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18088
   26334:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18086
   26339:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   2633d:	0f 11 23             	movups XMMWORD PTR [rbx],xmm4
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18087
   26340:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   26344:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18088
   26348:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2634c:	83 f8 f6             	cmp    eax,0xfffffff6
   2634f:	76 04                	jbe    26355 <JS_CallInternal+0x37b5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   26351:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18089
   26355:	48 89 53 d0          	mov    QWORD PTR [rbx-0x30],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18091
   26359:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18090
   2635d:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18089
   26361:	48 89 43 c8          	mov    QWORD PTR [rbx-0x38],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18091
   26365:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2636b:	49 89 c5             	mov    r13,rax
   2636e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26372:	ff e0                	jmp    rax
   26374:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18080
   26378:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18081
   2637d:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18080
   26382:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   26386:	0f 11 33             	movups XMMWORD PTR [rbx],xmm6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18081
   26389:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   2638d:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   26391:	83 f8 f6             	cmp    eax,0xfffffff6
   26394:	76 04                	jbe    2639a <JS_CallInternal+0x37fa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   26396:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18082
   2639a:	48 89 53 e0          	mov    QWORD PTR [rbx-0x20],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18084
   2639e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18083
   263a2:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18082
   263a6:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18084
   263aa:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   263b0:	49 89 c5             	mov    r13,rax
   263b3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   263b7:	ff e0                	jmp    rax
   263b9:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18075
   263bd:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   263c2:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   263c6:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   263ca:	0f 11 2b             	movups XMMWORD PTR [rbx],xmm5
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   263cd:	83 f8 f6             	cmp    eax,0xfffffff6
   263d0:	76 04                	jbe    263d6 <JS_CallInternal+0x3836>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   263d2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18076
   263d6:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18078
   263da:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18077
   263de:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18076
   263e2:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18078
   263e6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   263ec:	49 89 c5             	mov    r13,rax
   263ef:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   263f3:	ff e0                	jmp    rax
   263f5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18350
   263f9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26400:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   26404:	48 83 eb 10          	sub    rbx,0x10
   26408:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2640c:	e8 bf bf ff ff       	call   223d0 <JS_Throw>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18351
   26411:	e9 2a cf ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   26416:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18342
   2641a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2641e:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   26422:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   26426:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   2642a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26431:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   26435:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   26439:	e8 d2 3f 02 00       	call   4a410 <JS_AddBrand>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18342 (discriminator 1)
   2643e:	85 c0                	test   eax,eax
   26440:	0f 88 fa ce ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18344
   26446:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   2644a:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2644e:	83 fa f6             	cmp    edx,0xfffffff6
   26451:	76 11                	jbe    26464 <JS_CallInternal+0x38c4>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26453:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26456:	83 e8 01             	sub    eax,0x1
   26459:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2645c:	85 c0                	test   eax,eax
   2645e:	0f 8e 83 47 00 00    	jle    2abe7 <JS_CallInternal+0x8047>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18345
   26464:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   26468:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2646c:	83 fa f6             	cmp    edx,0xfffffff6
   2646f:	76 11                	jbe    26482 <JS_CallInternal+0x38e2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26471:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26474:	83 e8 01             	sub    eax,0x1
   26477:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2647a:	85 c0                	test   eax,eax
   2647c:	0f 8e ec 47 00 00    	jle    2ac6e <JS_CallInternal+0x80ce>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18347
   26482:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18346
   26487:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18347
   2648a:	49 83 c4 01          	add    r12,0x1
   2648e:	49 89 c5             	mov    r13,rax
   26491:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26495:	ff e0                	jmp    rax
   26497:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18332
   2649b:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2649f:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   264a3:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   264a7:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   264ab:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   264b2:	e8 79 b0 00 00       	call   31530 <JS_CheckBrand>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18333
   264b7:	85 c0                	test   eax,eax
   264b9:	0f 88 81 ce ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18335
   264bf:	0f 84 2e 67 00 00    	je     2cbf3 <JS_CallInternal+0xa053>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18340
   264c5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   264ca:	49 83 c4 01          	add    r12,0x1
   264ce:	49 89 c5             	mov    r13,rax
   264d1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   264d5:	ff e0                	jmp    rax
   264d7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18317
   264db:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18318 (discriminator 1)
   264e2:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18317
   264e9:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18318 (discriminator 1)
   264ed:	0f 84 5d 5f 00 00    	je     2c450 <JS_CallInternal+0x98b0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18320
   264f3:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
   264fa:	48 8b 95 d0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x130]
   26501:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26508:	e8 93 bf ff ff       	call   224a0 <JS_GetPrototype>
   2650d:	49 89 c6             	mov    r14,rax
   26510:	49 89 d5             	mov    r13,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18321 (discriminator 1)
   26513:	83 fa 06             	cmp    edx,0x6
   26516:	0f 84 24 ce ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_CallConstructor2():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20884
   2651c:	6a 02                	push   0x2
   2651e:	44 8b 8d bc fe ff ff 	mov    r9d,DWORD PTR [rbp-0x144]
   26525:	48 89 c6             	mov    rsi,rax
   26528:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
   2652e:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   26535:	4c 8b 85 80 fe ff ff 	mov    r8,QWORD PTR [rbp-0x180]
   2653c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26543:	e8 38 ac 06 00       	call   91180 <JS_CallConstructorInternal>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   26548:	41 58                	pop    r8
   2654a:	41 59                	pop    r9
JS_CallConstructor2():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20884
   2654c:	48 89 d1             	mov    rcx,rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2654f:	41 83 fd f6          	cmp    r13d,0xfffffff6
   26553:	76 13                	jbe    26568 <JS_CallInternal+0x39c8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26555:	41 8b 7e fc          	mov    edi,DWORD PTR [r14-0x4]
   26559:	8d 57 ff             	lea    edx,[rdi-0x1]
   2655c:	41 89 56 fc          	mov    DWORD PTR [r14-0x4],edx
   26560:	85 d2                	test   edx,edx
   26562:	0f 8e 48 46 00 00    	jle    2abb0 <JS_CallInternal+0x8010>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18325 (discriminator 1)
   26568:	83 f9 06             	cmp    ecx,0x6
   2656b:	0f 84 cf cd ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18327
   26571:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18329
   26574:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18327
   26578:	48 83 c3 10          	add    rbx,0x10
   2657c:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18329
   26580:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26586:	49 89 c5             	mov    r13,rax
   26589:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2658d:	ff e0                	jmp    rax
   2658f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18308 (discriminator 1)
   26593:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
   2659a:	0f 84 b0 5e 00 00    	je     2c450 <JS_CallInternal+0x98b0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18313
   265a0:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   265a5:	49 83 c4 01          	add    r12,0x1
   265a9:	49 89 c5             	mov    r13,rax
   265ac:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   265b0:	ff e0                	jmp    rax
   265b2:	f3 0f 1e fa          	endbr64
JS_IsObject():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:664
   265b6:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18296 (discriminator 1)
   265ba:	83 f8 ff             	cmp    eax,0xffffffff
   265bd:	0f 84 76 35 00 00    	je     29b39 <JS_CallInternal+0x6f99>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18297 (discriminator 1)
   265c3:	83 f8 03             	cmp    eax,0x3
   265c6:	0f 85 bb 64 00 00    	jne    2ca87 <JS_CallInternal+0x9ee7>
   265cc:	b8 01 00 00 00       	mov    eax,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18301
   265d1:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18306
   265d4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18305
   265d8:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18301
   265dc:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   265e3:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18306
   265e4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   265ea:	49 89 c5             	mov    r13,rax
   265ed:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   265f1:	ff e0                	jmp    rax
   265f3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18291
   265f7:	b9 03 00 00 00       	mov    ecx,0x3
   265fc:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18292
   265fe:	e9 90 cc ff ff       	jmp    23293 <JS_CallInternal+0x6f3>
   26603:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17936
   26607:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2660c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   26613:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   26618:	48 c1 e0 04          	shl    rax,0x4
   2661c:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   26620:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   26624:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   26627:	83 fa f6             	cmp    edx,0xfffffff6
   2662a:	76 04                	jbe    26630 <JS_CallInternal+0x3a90>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2662c:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17936 (discriminator 1)
   26630:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   26637:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   2663e:	45 31 c9             	xor    r9d,r9d
   26641:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   26645:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2664c:	e8 5f 64 02 00       	call   4cab0 <js_closure>
   26651:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17937 (discriminator 2)
   26655:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17936 (discriminator 1)
   26659:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17937 (discriminator 2)
   2665c:	0f 84 7f 50 00 00    	je     2b6e1 <JS_CallInternal+0x8b41>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17939
   26662:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17936 (discriminator 1)
   26668:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17939
   2666b:	49 83 c4 02          	add    r12,0x2
   2666f:	49 89 c5             	mov    r13,rax
   26672:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26676:	ff e0                	jmp    rax
   26678:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17933
   2667c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   26683:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26688:	48 c1 e0 04          	shl    rax,0x4
   2668c:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   26690:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   26694:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   26697:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2669b:	83 f8 f6             	cmp    eax,0xfffffff6
   2669e:	76 04                	jbe    266a4 <JS_CallInternal+0x3b04>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   266a0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17933
   266a4:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17934
   266a7:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17933
   266ab:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17934
   266af:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17933
   266b5:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17934
   266b8:	49 89 c5             	mov    r13,rax
   266bb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   266bf:	ff e0                	jmp    rax
   266c1:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   266c5:	41 0f bf 04 24       	movsx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17929 (discriminator 1)
   266ca:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17931
   266ce:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17929 (discriminator 1)
   266d2:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   266d9:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   266da:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17931
   266de:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   266e4:	49 89 c5             	mov    r13,rax
   266e7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   266eb:	ff e0                	jmp    rax
   266ed:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   266f1:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17925 (discriminator 1)
   266f6:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17927
   266fa:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17925 (discriminator 1)
   266fe:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26705:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26706:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17927
   2670a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26710:	49 89 c5             	mov    r13,rax
   26713:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26717:	ff e0                	jmp    rax
   26719:	f3 0f 1e fa          	endbr64
   2671d:	e9 66 c7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   26722:	f3 0f 1e fa          	endbr64
   26726:	e9 5d c7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   2672b:	f3 0f 1e fa          	endbr64
   2672f:	e9 54 c7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   26734:	f3 0f 1e fa          	endbr64
   26738:	e9 4b c7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   2673d:	f3 0f 1e fa          	endbr64
   26741:	e9 42 c7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   26746:	f3 0f 1e fa          	endbr64
   2674a:	e9 39 c7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   2674f:	f3 0f 1e fa          	endbr64
   26753:	e9 30 c7 ff ff       	jmp    22e88 <JS_CallInternal+0x2e8>
   26758:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17909 (discriminator 1)
   2675c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   26763:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   26767:	48 c1 e0 04          	shl    rax,0x4
   2676b:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   2676f:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   26773:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   26776:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2677a:	83 f8 f6             	cmp    eax,0xfffffff6
   2677d:	76 04                	jbe    26783 <JS_CallInternal+0x3be3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2677f:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17909 (discriminator 1)
   26783:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17911
   26786:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17909 (discriminator 1)
   2678a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17911
   2678e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17909 (discriminator 1)
   26794:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17911
   26797:	49 89 c5             	mov    r13,rax
   2679a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2679e:	ff e0                	jmp    rax
   267a0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17905 (discriminator 1)
   267a4:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
   267a8:	48 c7 43 08 07 00 00 	mov    QWORD PTR [rbx+0x8],0x7
   267af:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17907
   267b0:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17905 (discriminator 1)
   267b4:	48 83 c3 10          	add    rbx,0x10
   267b8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17907
   267bc:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   267c2:	49 89 c5             	mov    r13,rax
   267c5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   267c9:	ff e0                	jmp    rax
   267cb:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   267cf:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17901 (discriminator 1)
   267d3:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   267da:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17903
   267db:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17901 (discriminator 1)
   267df:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   267e3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17903
   267e7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   267ed:	49 89 c5             	mov    r13,rax
   267f0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   267f4:	ff e0                	jmp    rax
   267f6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17952
   267fa:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17953
   26801:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17952
   26805:	48 83 c3 10          	add    rbx,0x10
   26809:	48 c7 43 f8 02 00 00 	mov    QWORD PTR [rbx-0x8],0x2
   26810:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17953
   26811:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26817:	49 89 c5             	mov    r13,rax
   2681a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2681e:	ff e0                	jmp    rax
   26820:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17949
   26824:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17950
   2682b:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17949
   2682f:	48 83 c3 10          	add    rbx,0x10
   26833:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   2683a:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17950
   2683b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26841:	49 89 c5             	mov    r13,rax
   26844:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26848:	ff e0                	jmp    rax
   2684a:	f3 0f 1e fa          	endbr64
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3633
   2684e:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   26852:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17945 (discriminator 1)
   26854:	4c 8d 73 10          	lea    r14,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17947
   26858:	49 83 c4 05          	add    r12,0x5
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3633
   2685c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26863:	e8 18 da 00 00       	call   34280 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17945 (discriminator 1)
   26868:	48 89 03             	mov    QWORD PTR [rbx],rax
   2686b:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17947
   2686f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17945 (discriminator 1)
   26875:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17947
   26878:	49 89 c5             	mov    r13,rax
   2687b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2687f:	ff e0                	jmp    rax
   26881:	f3 0f 1e fa          	endbr64
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3638
   26885:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2688c:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17941
   26891:	4c 8d 73 10          	lea    r14,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17942
   26895:	49 83 c4 01          	add    r12,0x1
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3638
   26899:	be 2f 00 00 00       	mov    esi,0x2f
   2689e:	e8 dd d9 00 00       	call   34280 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17941
   268a3:	48 89 03             	mov    QWORD PTR [rbx],rax
   268a6:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17942
   268aa:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17941
   268b0:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17942
   268b3:	49 89 c5             	mov    r13,rax
   268b6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   268ba:	ff e0                	jmp    rax
   268bc:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20202
   268c0:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20202 (discriminator 1)
   268c4:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20200
   268c7:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20201
   268cb:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20202 (discriminator 1)
   268cf:	0f 85 6d 4b 00 00    	jne    2b442 <JS_CallInternal+0x88a2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20203
   268d5:	21 c8                	and    eax,ecx
   268d7:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   268de:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20206
   268df:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   268e3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20214
   268e7:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   268ec:	49 83 c4 01          	add    r12,0x1
   268f0:	49 89 c5             	mov    r13,rax
   268f3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   268f7:	ff e0                	jmp    rax
   268f9:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20182
   268fd:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20182 (discriminator 1)
   26901:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20180
   26904:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20181
   26908:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20182 (discriminator 1)
   2690c:	0f 85 5e 4b 00 00    	jne    2b470 <JS_CallInternal+0x88d0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20186
   26912:	d3 f8                	sar    eax,cl
   26914:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   2691b:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20188
   2691c:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26920:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20196
   26924:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26929:	49 83 c4 01          	add    r12,0x1
   2692d:	49 89 c5             	mov    r13,rax
   26930:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26934:	ff e0                	jmp    rax
   26936:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20161
   2693a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20161 (discriminator 1)
   2693e:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20159
   26941:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20160
   26945:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20161 (discriminator 1)
   26949:	0f 85 98 48 00 00    	jne    2b1e7 <JS_CallInternal+0x8647>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20165
   2694f:	d3 e8                	shr    eax,cl
JS_NewUint32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:584
   26951:	85 c0                	test   eax,eax
   26953:	0f 88 57 30 00 00    	js     299b0 <JS_CallInternal+0x6e10>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26959:	66 0f 6e c0          	movd   xmm0,eax
   2695d:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20165
   2695f:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20168
   26963:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20165
   26967:	66 0f d6 43 f0       	movq   QWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20176
   2696c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26971:	49 83 c4 01          	add    r12,0x1
   26975:	49 89 c5             	mov    r13,rax
   26978:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2697c:	ff e0                	jmp    rax
   2697e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20141
   26982:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20141 (discriminator 1)
   26986:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20139
   26989:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20140
   2698d:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20141 (discriminator 1)
   26991:	0f 85 1c 50 00 00    	jne    2b9b3 <JS_CallInternal+0x8e13>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20146
   26997:	d3 e0                	shl    eax,cl
   26999:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   269a0:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20147
   269a1:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   269a5:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20155
   269a9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   269ae:	49 83 c4 01          	add    r12,0x1
   269b2:	49 89 c5             	mov    r13,rax
   269b5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   269b9:	ff e0                	jmp    rax
   269bb:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20126
   269bf:	8b 7b f8             	mov    edi,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20125
   269c2:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20126
   269c6:	85 ff                	test   edi,edi
   269c8:	0f 85 2c 34 00 00    	jne    29dfa <JS_CallInternal+0x725a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20127
   269ce:	f7 d0                	not    eax
   269d0:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   269d7:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   269d8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20134
   269dc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   269e1:	49 83 c4 01          	add    r12,0x1
   269e5:	49 89 c5             	mov    r13,rax
   269e8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   269ec:	ff e0                	jmp    rax
   269ee:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18955 (discriminator 1)
   269f2:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   269f6:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18957
   269fd:	49 8d 54 24 04       	lea    rdx,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18958
   26a02:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26a06:	2b 51 18             	sub    edx,DWORD PTR [rcx+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18959
   26a09:	4c 01 e0             	add    rax,r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18957
   26a0c:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26a13:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26a14:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18961
   26a18:	4c 8d 60 01          	lea    r12,[rax+0x1]
   26a1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   26a1f:	49 89 c5             	mov    r13,rax
   26a22:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26a26:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364
   26a2a:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   26a2e:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   26a32:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   26a36:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   26a3a:	4c 89 f7             	mov    rdi,r14
   26a3d:	4c 89 ce             	mov    rsi,r9
   26a40:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 1)
   26a43:	45 85 ed             	test   r13d,r13d
   26a46:	0f 85 0d 50 00 00    	jne    2ba59 <JS_CallInternal+0x8eb9>
   26a4c:	45 85 c0             	test   r8d,r8d
   26a4f:	0f 85 69 2d 00 00    	jne    297be <JS_CallInternal+0x6c1e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 3)
   26a55:	31 c0                	xor    eax,eax
   26a57:	45 39 ce             	cmp    r14d,r9d
   26a5a:	0f 94 c0             	sete   al
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26a5d:	83 f8 01             	cmp    eax,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 31)
   26a60:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26a67:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26a68:	0f 95 c0             	setne  al
   26a6b:	0f b6 c0             	movzx  eax,al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 31)
   26a6e:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364
   26a72:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 1)
   26a77:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364
   26a7b:	49 83 c4 01          	add    r12,0x1
   26a7f:	49 89 c5             	mov    r13,rax
   26a82:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26a86:	ff e0                	jmp    rax
   26a88:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363
   26a8c:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   26a90:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   26a94:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   26a98:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   26a9c:	4c 89 f7             	mov    rdi,r14
   26a9f:	4c 89 ce             	mov    rsi,r9
   26aa2:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 1)
   26aa5:	45 85 ed             	test   r13d,r13d
   26aa8:	0f 85 2f 50 00 00    	jne    2badd <JS_CallInternal+0x8f3d>
   26aae:	45 85 c0             	test   r8d,r8d
   26ab1:	0f 85 5f 2d 00 00    	jne    29816 <JS_CallInternal+0x6c76>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 3)
   26ab7:	45 39 ce             	cmp    r14d,r9d
   26aba:	0f 94 c0             	sete   al
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26abd:	0f b6 c0             	movzx  eax,al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 31)
   26ac0:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26ac7:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26ac8:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363
   26acc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 1)
   26ad1:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363
   26ad5:	49 83 c4 01          	add    r12,0x1
   26ad9:	49 89 c5             	mov    r13,rax
   26adc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ae0:	ff e0                	jmp    rax
   26ae2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294
   26ae6:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   26aea:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26aee:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   26af2:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 1)
   26af6:	89 cf                	mov    edi,ecx
   26af8:	09 f7                	or     edi,esi
   26afa:	0f 85 15 4f 00 00    	jne    2ba15 <JS_CallInternal+0x8e75>
   26b00:	39 c2                	cmp    edx,eax
   26b02:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26b09:	00 
   26b0a:	0f 9d c0             	setge  al
   26b0d:	48 83 eb 10          	sub    rbx,0x10
   26b11:	0f b6 c0             	movzx  eax,al
   26b14:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294
   26b18:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26b1d:	49 83 c4 01          	add    r12,0x1
   26b21:	49 89 c5             	mov    r13,rax
   26b24:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26b28:	ff e0                	jmp    rax
   26b2a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293
   26b2e:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   26b32:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26b36:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   26b3a:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 1)
   26b3e:	89 cf                	mov    edi,ecx
   26b40:	09 f7                	or     edi,esi
   26b42:	0f 85 7b 47 00 00    	jne    2b2c3 <JS_CallInternal+0x8723>
   26b48:	39 c2                	cmp    edx,eax
   26b4a:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26b51:	00 
   26b52:	0f 9f c0             	setg   al
   26b55:	48 83 eb 10          	sub    rbx,0x10
   26b59:	0f b6 c0             	movzx  eax,al
   26b5c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293
   26b60:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26b65:	49 83 c4 01          	add    r12,0x1
   26b69:	49 89 c5             	mov    r13,rax
   26b6c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26b70:	ff e0                	jmp    rax
   26b72:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292
   26b76:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   26b7a:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26b7e:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   26b82:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 1)
   26b86:	89 cf                	mov    edi,ecx
   26b88:	09 f7                	or     edi,esi
   26b8a:	0f 85 fc 49 00 00    	jne    2b58c <JS_CallInternal+0x89ec>
   26b90:	39 d0                	cmp    eax,edx
   26b92:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26b99:	00 
   26b9a:	0f 9e c0             	setle  al
   26b9d:	48 83 eb 10          	sub    rbx,0x10
   26ba1:	0f b6 c0             	movzx  eax,al
   26ba4:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292
   26ba8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26bad:	49 83 c4 01          	add    r12,0x1
   26bb1:	49 89 c5             	mov    r13,rax
   26bb4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26bb8:	ff e0                	jmp    rax
   26bba:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19284
   26bbe:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8403 (discriminator 1)
   26bc2:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19284
   26bc6:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   26bca:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   26bce:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   26bd2:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   26bd6:	49 8b 46 08          	mov    rax,QWORD PTR [r14+0x8]
   26bda:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8403 (discriminator 1)
   26be1:	0f 85 14 4e 00 00    	jne    2b9fb <JS_CallInternal+0x8e5b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8408 (discriminator 1)
   26be7:	83 f8 f8             	cmp    eax,0xfffffff8
   26bea:	0f 85 f1 4d 00 00    	jne    2b9e1 <JS_CallInternal+0x8e41>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9020
   26bf0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   26bf7:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   26bfe:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   26c02:	e8 49 ff fe ff       	call   16b50 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   26c07:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9020
   26c0e:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   26c10:	49 8b 48 18          	mov    rcx,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   26c14:	89 f2                	mov    edx,esi
   26c16:	8b 41 18             	mov    eax,DWORD PTR [rcx+0x18]
   26c19:	21 c2                	and    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   26c1b:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   26c1f:	48 85 d2             	test   rdx,rdx
   26c22:	0f 84 4d 26 00 00    	je     29275 <JS_CallInternal+0x66d5>
   26c28:	48 8d 3c 85 34 00 00 	lea    rdi,[rax*4+0x34]
   26c2f:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   26c30:	48 8d 04 d7          	lea    rax,[rdi+rdx*8]
   26c34:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   26c37:	3b 70 04             	cmp    esi,DWORD PTR [rax+0x4]
   26c3a:	0f 85 27 26 00 00    	jne    29267 <JS_CallInternal+0x66c7>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8416
   26c40:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26c47:	48 8d 0d f6 64 0a 00 	lea    rcx,[rip+0xa64f6]        # cd144 <_IO_stdin_used+0x144>
   26c4e:	48 8d 15 7b a2 0a 00 	lea    rdx,[rip+0xaa27b]        # d0ed0 <_IO_stdin_used+0x3ed0>
   26c55:	31 c0                	xor    eax,eax
   26c57:	e8 64 a4 00 00       	call   310c0 <__JS_ThrowTypeErrorAtom>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   26c5c:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   26c63:	76 13                	jbe    26c78 <JS_CallInternal+0x40d8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26c65:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   26c69:	83 e8 01             	sub    eax,0x1
   26c6c:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   26c70:	85 c0                	test   eax,eax
   26c72:	0f 8e 4a 5a 00 00    	jle    2c6c2 <JS_CallInternal+0x9b22>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19285
   26c78:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   26c7c:	49 8b 36             	mov    rsi,QWORD PTR [r14]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19286
   26c7f:	4c 89 f3             	mov    rbx,r14
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   26c82:	83 fa f6             	cmp    edx,0xfffffff6
   26c85:	0f 86 b5 c6 ff ff    	jbe    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26c8b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26c8e:	83 e8 01             	sub    eax,0x1
   26c91:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26c94:	85 c0                	test   eax,eax
   26c96:	0f 8f a4 c6 ff ff    	jg     23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   26c9c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   26ca3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   26ca7:	e8 f4 5b ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19287
   26cac:	e9 8f c6 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   26cb1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   26cb8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20037
   26cbc:	44 8b 4b f8          	mov    r9d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20036
   26cc0:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20037
   26cc4:	45 85 c9             	test   r9d,r9d
   26cc7:	0f 85 b4 2c 00 00    	jne    29981 <JS_CallInternal+0x6de1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20039 (discriminator 1)
   26ccd:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   26cd2:	0f 84 a9 2c 00 00    	je     29981 <JS_CallInternal+0x6de1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20041
   26cd8:	83 c0 01             	add    eax,0x1
   26cdb:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   26ce2:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26ce3:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20050
   26ce6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20048
   26ceb:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20050
   26cef:	49 83 c4 01          	add    r12,0x1
   26cf3:	49 89 c5             	mov    r13,rax
   26cf6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26cfa:	ff e0                	jmp    rax
   26cfc:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20019
   26d00:	44 8b 53 f8          	mov    r10d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20018
   26d04:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20019
   26d08:	45 85 d2             	test   r10d,r10d
   26d0b:	0f 85 cf 2b 00 00    	jne    298e0 <JS_CallInternal+0x6d40>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20021 (discriminator 1)
   26d11:	3d 00 00 00 80       	cmp    eax,0x80000000
   26d16:	0f 84 c4 2b 00 00    	je     298e0 <JS_CallInternal+0x6d40>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20023
   26d1c:	83 e8 01             	sub    eax,0x1
   26d1f:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26d26:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26d27:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20031
   26d2b:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26d30:	49 83 c4 01          	add    r12,0x1
   26d34:	49 89 c5             	mov    r13,rax
   26d37:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26d3b:	ff e0                	jmp    rax
   26d3d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20001
   26d41:	44 8b 5b f8          	mov    r11d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20000
   26d45:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20001
   26d49:	45 85 db             	test   r11d,r11d
   26d4c:	0f 85 05 2b 00 00    	jne    29857 <JS_CallInternal+0x6cb7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20003 (discriminator 1)
   26d52:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   26d57:	0f 84 fa 2a 00 00    	je     29857 <JS_CallInternal+0x6cb7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20005
   26d5d:	83 c0 01             	add    eax,0x1
   26d60:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26d67:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   26d68:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20013
   26d6c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26d71:	49 83 c4 01          	add    r12,0x1
   26d75:	49 89 c5             	mov    r13,rax
   26d78:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26d7c:	ff e0                	jmp    rax
   26d7e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19022
   26d82:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16772
   26d89:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   26d8d:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19022
   26d91:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16773 (discriminator 1)
   26d95:	41 83 fe ff          	cmp    r14d,0xffffffff
   26d99:	0f 85 a8 5e 00 00    	jne    2cc47 <JS_CallInternal+0xa0a7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16777
   26d9f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26da6:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
   26dad:	4c 89 f2             	mov    rdx,r14
   26db0:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   26db7:	e8 f4 67 00 00       	call   2d5b0 <JS_IteratorGetCompleteValue>
   26dbc:	48 89 c1             	mov    rcx,rax
   26dbf:	49 89 d5             	mov    r13,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16778 (discriminator 1)
   26dc2:	83 fa 06             	cmp    edx,0x6
   26dc5:	0f 84 75 c5 ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26dcb:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   26dd2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26dd5:	83 e8 01             	sub    eax,0x1
   26dd8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26ddb:	85 c0                	test   eax,eax
   26ddd:	0f 8e 1d 3d 00 00    	jle    2ab00 <JS_CallInternal+0x7f60>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26de3:	8b b5 f0 fe ff ff    	mov    esi,DWORD PTR [rbp-0x110]
   26de9:	31 c0                	xor    eax,eax
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16784
   26deb:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16783
   26def:	48 c7 43 e0 00 00 00 	mov    QWORD PTR [rbx-0x20],0x0
   26df6:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26df7:	85 f6                	test   esi,esi
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16783
   26df9:	48 c7 43 e8 05 00 00 	mov    QWORD PTR [rbx-0x18],0x5
   26e00:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26e01:	0f 95 c0             	setne  al
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16784
   26e04:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19026
   26e08:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19025
   26e0c:	48 83 c3 10          	add    rbx,0x10
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16785
   26e10:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26e14:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   26e1b:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19026
   26e1c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26e22:	49 89 c5             	mov    r13,rax
   26e25:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26e29:	ff e0                	jmp    rax
   26e2b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20430
   26e2f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15976
   26e36:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   26e3a:	4c 8b 4b e0          	mov    r9,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15977
   26e3e:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20430
   26e42:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15977
   26e46:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   26e4a:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15979
   26e51:	41 83 fd ff          	cmp    r13d,0xffffffff
   26e55:	0f 85 18 5f 00 00    	jne    2cd73 <JS_CallInternal+0xa1d3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15983 (discriminator 1)
   26e5b:	41 83 fe ff          	cmp    r14d,0xffffffff
   26e5f:	0f 84 5b 2c 00 00    	je     29ac0 <JS_CallInternal+0x6f20>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15994
   26e65:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   26e6c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26e73:	4c 89 f2             	mov    rdx,r14
   26e76:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   26e7d:	e8 7e ce 01 00       	call   43d00 <JS_ValueToAtom>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15995 (discriminator 1)
   26e82:	85 c0                	test   eax,eax
   26e84:	0f 84 b6 c4 ff ff    	je     23340 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   26e8a:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   26e91:	89 c2                	mov    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   26e93:	49 8b 49 18          	mov    rcx,QWORD PTR [r9+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   26e97:	8b 71 18             	mov    esi,DWORD PTR [rcx+0x18]
   26e9a:	21 f2                	and    edx,esi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   26e9c:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   26ea0:	48 85 d2             	test   rdx,rdx
   26ea3:	0f 84 44 54 00 00    	je     2c2ed <JS_CallInternal+0x974d>
   26ea9:	48 8d 34 b5 34 00 00 	lea    rsi,[rsi*4+0x34]
   26eb0:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   26eb1:	48 8d 14 d6          	lea    rdx,[rsi+rdx*8]
   26eb5:	48 01 ca             	add    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   26eb8:	3b 42 04             	cmp    eax,DWORD PTR [rdx+0x4]
   26ebb:	0f 85 1e 54 00 00    	jne    2c2df <JS_CallInternal+0x973f>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   26ec1:	3d f2 00 00 00       	cmp    eax,0xf2
   26ec6:	0f 8f d8 35 00 00    	jg     2a4a4 <JS_CallInternal+0x7904>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16000
   26ecc:	48 85 d2             	test   rdx,rdx
   26ecf:	0f 95 c0             	setne  al
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   26ed2:	41 83 fd f6          	cmp    r13d,0xfffffff6
   26ed6:	76 13                	jbe    26eeb <JS_CallInternal+0x434b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26ed8:	41 8b 49 fc          	mov    ecx,DWORD PTR [r9-0x4]
   26edc:	8d 51 ff             	lea    edx,[rcx-0x1]
   26edf:	41 89 51 fc          	mov    DWORD PTR [r9-0x4],edx
   26ee3:	85 d2                	test   edx,edx
   26ee5:	0f 8e 3b 3c 00 00    	jle    2ab26 <JS_CallInternal+0x7f86>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   26eeb:	41 83 fe f6          	cmp    r14d,0xfffffff6
   26eef:	76 1e                	jbe    26f0f <JS_CallInternal+0x436f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26ef1:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   26ef8:	8b 79 fc             	mov    edi,DWORD PTR [rcx-0x4]
   26efb:	8d 57 ff             	lea    edx,[rdi-0x1]
   26efe:	89 bd 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],edi
   26f04:	89 51 fc             	mov    DWORD PTR [rcx-0x4],edx
   26f07:	85 d2                	test   edx,edx
   26f09:	0f 8e b7 3d 00 00    	jle    2acc6 <JS_CallInternal+0x8126>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26f0f:	0f b6 c0             	movzx  eax,al
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16004
   26f12:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26f19:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20434
   26f1a:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20433
   26f1e:	48 83 eb 10          	sub    rbx,0x10
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   26f22:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20434
   26f26:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26f2c:	49 89 c5             	mov    r13,rax
   26f2f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f33:	ff e0                	jmp    rax
   26f35:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20424
   26f39:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15952
   26f40:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15951
   26f44:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20424
   26f48:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15951
   26f4c:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   26f50:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15952
   26f57:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   26f5b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15954
   26f62:	41 83 fd ff          	cmp    r13d,0xffffffff
   26f66:	0f 85 d6 5a 00 00    	jne    2ca42 <JS_CallInternal+0x9ea2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15958
   26f6c:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   26f73:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26f7a:	4c 89 f6             	mov    rsi,r14
   26f7d:	e8 7e cd 01 00       	call   43d00 <JS_ValueToAtom>
   26f82:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15959 (discriminator 1)
   26f84:	85 c0                	test   eax,eax
   26f86:	0f 84 b4 c3 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15961
   26f8c:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   26f93:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26f9a:	4c 89 ea             	mov    rdx,r13
   26f9d:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   26fa3:	e8 88 74 04 00       	call   6e430 <JS_HasProperty>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   26fa8:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15961
   26fae:	41 89 c0             	mov    r8d,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   26fb1:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   26fb7:	0f 8f 19 2f 00 00    	jg     29ed6 <JS_CallInternal+0x7336>
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15963
   26fbd:	45 85 c0             	test   r8d,r8d
   26fc0:	0f 88 7a c3 ff ff    	js     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   26fc6:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   26fcd:	76 13                	jbe    26fe2 <JS_CallInternal+0x4442>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26fcf:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   26fd3:	83 e8 01             	sub    eax,0x1
   26fd6:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   26fda:	85 c0                	test   eax,eax
   26fdc:	0f 8e 6b 49 00 00    	jle    2b94d <JS_CallInternal+0x8dad>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   26fe2:	41 83 fd f6          	cmp    r13d,0xfffffff6
   26fe6:	76 1e                	jbe    27006 <JS_CallInternal+0x4466>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   26fe8:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   26fef:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   26ff2:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26ff8:	83 e8 01             	sub    eax,0x1
   26ffb:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   26ffe:	85 c0                	test   eax,eax
   27000:	0f 8e 74 49 00 00    	jle    2b97a <JS_CallInternal+0x8dda>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   27006:	31 c0                	xor    eax,eax
   27008:	45 85 c0             	test   r8d,r8d
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15967
   2700b:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   27012:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   27013:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20427
   27016:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20428
   2701a:	49 83 c4 01          	add    r12,0x1
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15967
   2701e:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20428
   27022:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27028:	49 89 c5             	mov    r13,rax
   2702b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2702f:	ff e0                	jmp    rax
   27031:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19858
   27035:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19857
   27039:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   2703d:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19858
   27041:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19859 (discriminator 1)
   27045:	89 c7                	mov    edi,eax
   27047:	09 f7                	or     edi,esi
   27049:	0f 85 2f 3e 00 00    	jne    2ae7e <JS_CallInternal+0x82de>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19864
   2704f:	48 63 f2             	movsxd rsi,edx
   27052:	48 63 c1             	movsxd rax,ecx
   27055:	48 0f af c6          	imul   rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19865
   27059:	48 63 f0             	movsxd rsi,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19865 (discriminator 1)
   2705c:	48 39 c6             	cmp    rsi,rax
   2705f:	0f 85 fd 3d 00 00    	jne    2ae62 <JS_CallInternal+0x82c2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19870 (discriminator 1)
   27065:	48 85 f6             	test   rsi,rsi
   27068:	0f 84 52 4e 00 00    	je     2bec0 <JS_CallInternal+0x9320>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   2706e:	83 e0 ff             	and    eax,0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19875
   27071:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   27075:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19874
   27079:	31 c0                	xor    eax,eax
   2707b:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19901
   2707f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27084:	48 89 d3             	mov    rbx,rdx
   27087:	49 83 c4 01          	add    r12,0x1
   2708b:	49 89 c5             	mov    r13,rax
   2708e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27092:	ff e0                	jmp    rax
   27094:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19819
   27098:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19818
   2709c:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   270a0:	48 8b 7b e0          	mov    rdi,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19819
   270a4:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19820 (discriminator 1)
   270a8:	89 c6                	mov    esi,eax
   270aa:	09 d6                	or     esi,edx
   270ac:	0f 85 11 3e 00 00    	jne    2aec3 <JS_CallInternal+0x8323>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19823
   270b2:	89 fa                	mov    edx,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19822
   270b4:	48 63 f1             	movsxd rsi,ecx
   270b7:	48 63 c7             	movsxd rax,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19823
   270ba:	29 ca                	sub    edx,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19822
   270bc:	48 29 f0             	sub    rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19823
   270bf:	48 63 ca             	movsxd rcx,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19823 (discriminator 1)
   270c2:	48 39 c1             	cmp    rcx,rax
   270c5:	0f 85 e0 3d 00 00    	jne    2aeab <JS_CallInternal+0x830b>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   270cb:	89 d0                	mov    eax,edx
   270cd:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19826
   270d1:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19828
   270d3:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
   270d7:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19852
   270db:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   270e0:	48 89 d3             	mov    rbx,rdx
   270e3:	49 83 c4 01          	add    r12,0x1
   270e7:	49 89 c5             	mov    r13,rax
   270ea:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   270ee:	ff e0                	jmp    rax
   270f0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19775
   270f4:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   270f9:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19772
   27100:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19774
   27105:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   27109:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19775
   2710d:	49 c1 e5 04          	shl    r13,0x4
   27111:	49 01 c5             	add    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19776 (discriminator 1)
   27114:	44 89 f1             	mov    ecx,r14d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19776
   27117:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19776 (discriminator 1)
   2711b:	09 d1                	or     ecx,edx
   2711d:	0f 85 f7 3d 00 00    	jne    2af1a <JS_CallInternal+0x837a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19778
   27123:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   27127:	49 63 c8             	movsxd rcx,r8d
   2712a:	48 63 d0             	movsxd rdx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19779
   2712d:	44 01 c0             	add    eax,r8d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19778
   27130:	48 01 ca             	add    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19779
   27133:	48 63 c8             	movsxd rcx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19779 (discriminator 1)
   27136:	48 39 d1             	cmp    rcx,rdx
   27139:	0f 85 c2 3d 00 00    	jne    2af01 <JS_CallInternal+0x8361>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   2713f:	89 c0                	mov    eax,eax
   27141:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19782
   27145:	31 c0                	xor    eax,eax
   27147:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19784
   2714b:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19814
   2714f:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27155:	49 83 c4 02          	add    r12,0x2
   27159:	49 89 c5             	mov    r13,rax
   2715c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27160:	ff e0                	jmp    rax
   27162:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19723
   27166:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19722
   2716a:	4c 8b 5b e8          	mov    r11,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19723
   2716e:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19722
   27172:	4c 8b 53 e0          	mov    r10,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19724 (discriminator 1)
   27176:	41 89 fe             	mov    r14d,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19722
   27179:	4c 89 de             	mov    rsi,r11
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19723
   2717c:	48 89 f9             	mov    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19724 (discriminator 1)
   2717f:	45 09 de             	or     r14d,r11d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19723
   27182:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19724 (discriminator 1)
   27185:	0f 85 3b 4b 00 00    	jne    2bcc6 <JS_CallInternal+0x9126>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19726
   2718b:	49 63 ca             	movsxd rcx,r10d
   2718e:	49 63 f0             	movsxd rsi,r8d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19727
   27191:	44 01 d0             	add    eax,r10d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19726
   27194:	48 01 f1             	add    rcx,rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19727
   27197:	48 63 d0             	movsxd rdx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19727 (discriminator 1)
   2719a:	48 39 ca             	cmp    rdx,rcx
   2719d:	0f 85 cd 49 00 00    	jne    2bb70 <JS_CallInternal+0x8fd0>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   271a3:	89 c0                	mov    eax,eax
   271a5:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19730
   271a9:	31 c0                	xor    eax,eax
   271ab:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19732
   271af:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19765
   271b3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   271b8:	49 83 c4 01          	add    r12,0x1
   271bc:	49 89 c5             	mov    r13,rax
   271bf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   271c3:	ff e0                	jmp    rax
   271c5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19710
   271c9:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19711
   271ce:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19710
   271d5:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712
   271da:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19713
   271dd:	89 fa                	mov    edx,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19710
   271df:	89 f8                	mov    eax,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19711
   271e1:	4c 89 69 30          	mov    QWORD PTR [rcx+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19713
   271e5:	c1 fa 02             	sar    edx,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712
   271e8:	83 e0 03             	and    eax,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19713
   271eb:	83 e2 07             	and    edx,0x7
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712
   271ee:	f7 d0                	not    eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19713
   271f0:	f7 d2                	not    edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712
   271f2:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19713
   271f4:	48 63 d2             	movsxd rdx,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712
   271f7:	48 c1 e0 04          	shl    rax,0x4
   271fb:	48 c1 e2 04          	shl    rdx,0x4
   271ff:	48 01 d8             	add    rax,rbx
   27202:	48 01 da             	add    rdx,rbx
   27205:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   27208:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   2720b:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   2720f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19714
   27213:	89 f8                	mov    eax,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712
   27215:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19714
   2721c:	c1 f8 05             	sar    eax,0x5
   2721f:	f7 d0                	not    eax
   27221:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712
   27223:	48 c1 e0 04          	shl    rax,0x4
   27227:	ff 74 03 08          	push   QWORD PTR [rbx+rax*1+0x8]
   2722b:	ff 34 03             	push   QWORD PTR [rbx+rax*1]
   2722e:	e8 4d 45 06 00       	call   8b780 <JS_CopyDataProperties>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19712 (discriminator 1)
   27233:	41 5e                	pop    r14
   27235:	5a                   	pop    rdx
   27236:	85 c0                	test   eax,eax
   27238:	0f 85 2a 54 00 00    	jne    2c668 <JS_CallInternal+0x9ac8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19717
   2723e:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27244:	49 83 c4 02          	add    r12,0x2
   27248:	49 89 c5             	mov    r13,rax
   2724b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2724f:	ff e0                	jmp    rax
   27251:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19695
   27255:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19696
   2725c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27263:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19695
   27266:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19696
   2726a:	e8 c1 3b 07 00       	call   9ae30 <js_append_enumerate>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19696 (discriminator 1)
   2726f:	85 c0                	test   eax,eax
   27271:	0f 85 c9 c0 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19698
   27277:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2727b:	48 83 eb 10          	sub    rbx,0x10
   2727f:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27282:	83 fa f6             	cmp    edx,0xfffffff6
   27285:	76 11                	jbe    27298 <JS_CallInternal+0x46f8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27287:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2728a:	83 e8 01             	sub    eax,0x1
   2728d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27290:	85 c0                	test   eax,eax
   27292:	0f 8e b2 36 00 00    	jle    2a94a <JS_CallInternal+0x7daa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19700
   27298:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2729d:	49 83 c4 01          	add    r12,0x1
   272a1:	49 89 c5             	mov    r13,rax
   272a4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   272a8:	ff e0                	jmp    rax
   272aa:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20078
   272ae:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   272b3:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20076
   272ba:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20078
   272bf:	49 c1 e5 04          	shl    r13,0x4
   272c3:	49 01 c5             	add    r13,rax
   272c6:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   272cc:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20079
   272d3:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20080
   272da:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20079
   272e1:	85 d2                	test   edx,edx
   272e3:	0f 85 fd 22 00 00    	jne    295e6 <JS_CallInternal+0x6a46>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20081 (discriminator 1)
   272e9:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   272ee:	0f 84 f2 22 00 00    	je     295e6 <JS_CallInternal+0x6a46>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20083
   272f4:	83 c0 01             	add    eax,0x1
   272f7:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   272fe:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   272ff:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20095
   27303:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27309:	49 83 c4 02          	add    r12,0x2
   2730d:	49 89 c5             	mov    r13,rax
   27310:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27314:	ff e0                	jmp    rax
   27316:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20056
   2731a:	44 8b 43 f8          	mov    r8d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20055
   2731e:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20056
   27322:	45 85 c0             	test   r8d,r8d
   27325:	0f 85 87 25 00 00    	jne    298b2 <JS_CallInternal+0x6d12>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20058 (discriminator 1)
   2732b:	3d 00 00 00 80       	cmp    eax,0x80000000
   27330:	0f 84 7c 25 00 00    	je     298b2 <JS_CallInternal+0x6d12>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20060
   27336:	83 e8 01             	sub    eax,0x1
   27339:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   27340:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   27341:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20069
   27344:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20067
   27349:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20069
   2734d:	49 83 c4 01          	add    r12,0x1
   27351:	49 89 c5             	mov    r13,rax
   27354:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27358:	ff e0                	jmp    rax
   2735a:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   2735e:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18844 (discriminator 1)
   27365:	4d 63 2c 24          	movsxd r13,DWORD PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   27369:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18844 (discriminator 1)
   2736f:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   27372:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   27378:	83 e8 01             	sub    eax,0x1
   2737b:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   27381:	85 c0                	test   eax,eax
   27383:	0f 8e a8 45 00 00    	jle    2b931 <JS_CallInternal+0x8d91>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18847
   27389:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2738e:	4d 8d 65 01          	lea    r12,[r13+0x1]
   27392:	49 89 c5             	mov    r13,rax
   27395:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   27399:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20238
   2739d:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20238 (discriminator 1)
   273a1:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20236
   273a4:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20237
   273a8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20238 (discriminator 1)
   273ac:	0f 85 0c 45 00 00    	jne    2b8be <JS_CallInternal+0x8d1e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20239
   273b2:	31 c8                	xor    eax,ecx
   273b4:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   273bb:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20242
   273bc:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   273c0:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20250
   273c4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   273c9:	49 83 c4 01          	add    r12,0x1
   273cd:	49 89 c5             	mov    r13,rax
   273d0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   273d4:	ff e0                	jmp    rax
   273d6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19330
   273da:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19331
   273e1:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   273e5:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19330
   273e9:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19332 (discriminator 1)
   273ed:	41 83 fd ff          	cmp    r13d,0xffffffff
   273f1:	0f 84 63 23 00 00    	je     2975a <JS_CallInternal+0x6bba>
   273f7:	41 83 fd 02          	cmp    r13d,0x2
   273fb:	0f 84 59 23 00 00    	je     2975a <JS_CallInternal+0x6bba>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27401:	41 83 fd f6          	cmp    r13d,0xfffffff6
   27405:	76 13                	jbe    2741a <JS_CallInternal+0x487a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27407:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   2740b:	83 e8 01             	sub    eax,0x1
   2740e:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   27412:	85 c0                	test   eax,eax
   27414:	0f 8e d1 39 00 00    	jle    2adeb <JS_CallInternal+0x824b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19339
   2741a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19337
   2741f:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19339
   27423:	49 83 c4 01          	add    r12,0x1
   27427:	49 89 c5             	mov    r13,rax
   2742a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2742e:	ff e0                	jmp    rax
   27430:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19923
   27434:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19923 (discriminator 1)
   27438:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19921
   2743b:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19922
   2743f:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19923 (discriminator 1)
   27443:	0f 85 4e c8 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19925
   27449:	89 c8                	mov    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19926
   2744b:	89 d6                	mov    esi,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19929 (discriminator 1)
   2744d:	85 c9                	test   ecx,ecx
   2744f:	0f 88 42 c8 ff ff    	js     23c97 <JS_CallInternal+0x10f7>
   27455:	85 d2                	test   edx,edx
   27457:	0f 8e 3a c8 ff ff    	jle    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19931
   2745d:	99                   	cdq
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19932
   2745e:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   27465:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19938
   27466:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19933
   2746a:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19931
   2746e:	f7 fe                	idiv   esi
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   27470:	48 63 d2             	movsxd rdx,edx
   27473:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19938
   27477:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2747d:	49 89 c5             	mov    r13,rax
   27480:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27484:	ff e0                	jmp    rax
   27486:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19952
   2748a:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19951
   2748e:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19953
   27492:	a9 f7 ff ff ff       	test   eax,0xfffffff7
   27497:	74 1b                	je     274b4 <JS_CallInternal+0x4914>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19954
   27499:	83 e8 01             	sub    eax,0x1
   2749c:	83 f8 01             	cmp    eax,0x1
   2749f:	0f 87 4e 30 00 00    	ja     2a4f3 <JS_CallInternal+0x7953>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19955
   274a5:	83 e2 ff             	and    edx,0xffffffff
   274a8:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   274af:	00 
   274b0:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19962
   274b4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   274b9:	49 83 c4 01          	add    r12,0x1
   274bd:	49 89 c5             	mov    r13,rax
   274c0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   274c4:	ff e0                	jmp    rax
   274c6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19970
   274ca:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19969
   274ce:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19971
   274d2:	83 fa 02             	cmp    edx,0x2
   274d5:	0f 87 f1 21 00 00    	ja     296cc <JS_CallInternal+0x6b2c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19976 (discriminator 1)
   274db:	85 c0                	test   eax,eax
   274dd:	0f 84 55 4d 00 00    	je     2c238 <JS_CallInternal+0x9698>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19980 (discriminator 1)
   274e3:	3d 00 00 00 80       	cmp    eax,0x80000000
   274e8:	0f 84 0c 4c 00 00    	je     2c0fa <JS_CallInternal+0x955a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19984
   274ee:	f7 d8                	neg    eax
   274f0:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   274f7:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   274f8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19995
   274fc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27501:	49 83 c4 01          	add    r12,0x1
   27505:	49 89 c5             	mov    r13,rax
   27508:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2750c:	ff e0                	jmp    rax
   2750e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19907
   27512:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19907 (discriminator 1)
   27516:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19905
   27519:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19906
   2751d:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19907 (discriminator 1)
   27521:	0f 85 70 c7 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19911
   27527:	66 0f ef c0          	pxor   xmm0,xmm0
   2752b:	66 0f ef c9          	pxor   xmm1,xmm1
   2752f:	f2 0f 2a c1          	cvtsi2sd xmm0,ecx
   27533:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   27537:	f2 0f 5e c1          	divsd  xmm0,xmm1
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:602
   2753b:	66 0f 2f 05 15 bf 0a 	comisd xmm0,QWORD PTR [rip+0xabf15]        # d3458 <__PRETTY_FUNCTION__.0+0xc8>
   27542:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:603
   27543:	66 48 0f 7e c0       	movq   rax,xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:602
   27548:	0f 82 86 1d 00 00    	jb     292d4 <JS_CallInternal+0x6734>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:602 (discriminator 1)
   2754e:	f2 0f 10 0d 0a bf 0a 	movsd  xmm1,QWORD PTR [rip+0xabf0a]        # d3460 <__PRETTY_FUNCTION__.0+0xd0>
   27555:	00 
   27556:	66 0f 2f c8          	comisd xmm1,xmm0
   2755a:	0f 82 74 1d 00 00    	jb     292d4 <JS_CallInternal+0x6734>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:604
   27560:	f2 0f 2c c8          	cvttsd2si ecx,xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:605
   27564:	66 0f ef c9          	pxor   xmm1,xmm1
   27568:	ba 08 00 00 00       	mov    edx,0x8
   2756d:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   27571:	66 48 0f 7e ce       	movq   rsi,xmm1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:608
   27576:	48 39 f0             	cmp    rax,rsi
   27579:	0f 84 c9 49 00 00    	je     2bf48 <JS_CallInternal+0x93a8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19911
   2757f:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19917
   27583:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19912
   27587:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19911
   2758b:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19917
   2758f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27595:	49 89 c5             	mov    r13,rax
   27598:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2759c:	ff e0                	jmp    rax
   2759e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20104
   275a2:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   275a7:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20102
   275ae:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20104
   275b3:	49 c1 e5 04          	shl    r13,0x4
   275b7:	49 01 c5             	add    r13,rax
   275ba:	f3 41 0f 6f 6d 00    	movdqu xmm5,XMMWORD PTR [r13+0x0]
   275c0:	0f 29 ad f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20105
   275c7:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20106
   275ce:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20105
   275d5:	85 d2                	test   edx,edx
   275d7:	0f 85 83 1f 00 00    	jne    29560 <JS_CallInternal+0x69c0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20107 (discriminator 1)
   275dd:	3d 00 00 00 80       	cmp    eax,0x80000000
   275e2:	0f 84 78 1f 00 00    	je     29560 <JS_CallInternal+0x69c0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20109
   275e8:	83 e8 01             	sub    eax,0x1
   275eb:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   275f2:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   275f3:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20121
   275f7:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   275fd:	49 83 c4 02          	add    r12,0x2
   27601:	49 89 c5             	mov    r13,rax
   27604:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27608:	ff e0                	jmp    rax
   2760a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19069
   2760e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19070
   27615:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20743
   27619:	48 8b 4b c0          	mov    rcx,QWORD PTR [rbx-0x40]
   2761d:	48 c7 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],0x0
   27624:	00 00 00 00 
   27628:	4c 8b 43 c8          	mov    r8,QWORD PTR [rbx-0x38]
   2762c:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   27630:	41 b9 01 00 00 00    	mov    r9d,0x1
   27636:	48 c7 85 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],0x3
   2763d:	03 00 00 00 
   27641:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   27645:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19069
   2764c:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20743
   27650:	6a 02                	push   0x2
   27652:	41 55                	push   r13
   27654:	ff b5 08 fe ff ff    	push   QWORD PTR [rbp-0x1f8]
   2765a:	ff b5 00 fe ff ff    	push   QWORD PTR [rbp-0x200]
   27660:	e8 3b b5 ff ff       	call   22ba0 <JS_CallInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19072 (discriminator 1)
   27665:	48 83 c4 20          	add    rsp,0x20
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20743
   27669:	48 89 c1             	mov    rcx,rax
   2766c:	49 89 d6             	mov    r14,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19072 (discriminator 1)
   2766f:	83 fa 06             	cmp    edx,0x6
   27672:	0f 84 c8 bc ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19074
   27678:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2767c:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27680:	83 fa f6             	cmp    edx,0xfffffff6
   27683:	76 11                	jbe    27696 <JS_CallInternal+0x4af6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27685:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27688:	83 e8 01             	sub    eax,0x1
   2768b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2768e:	85 c0                	test   eax,eax
   27690:	0f 8e 69 36 00 00    	jle    2acff <JS_CallInternal+0x815f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19075
   27696:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19077
   2769a:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19075
   2769e:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19077
   276a2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   276a8:	49 89 c5             	mov    r13,rax
   276ab:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   276af:	ff e0                	jmp    rax
   276b1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20446
   276b5:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   276b9:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20447
   276bd:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   276c4:	4c 89 c2             	mov    rdx,r8
   276c7:	e8 f4 42 ff ff       	call   1b9c0 <js_operator_typeof>
   276cc:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   276cf:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   276d3:	76 11                	jbe    276e6 <JS_CallInternal+0x4b46>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   276d5:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   276d8:	83 e8 01             	sub    eax,0x1
   276db:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   276de:	85 c0                	test   eax,eax
   276e0:	0f 8e 08 36 00 00    	jle    2acee <JS_CallInternal+0x814e>
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3638
   276e6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   276ed:	44 89 ee             	mov    esi,r13d
   276f0:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20451
   276f5:	49 83 c4 01          	add    r12,0x1
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3638
   276f9:	e8 82 cb 00 00       	call   34280 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20449
   276fe:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   27702:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20451
   27706:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2770c:	49 89 c5             	mov    r13,rax
   2770f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27713:	ff e0                	jmp    rax
   27715:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20436
   27719:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16032
   27720:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   27724:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16031
   27728:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20436
   2772c:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16031
   27730:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16033
   27734:	4c 89 f1             	mov    rcx,r14
   27737:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2773e:	4d 89 e8             	mov    r8,r13
   27741:	48 89 b5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rsi
   27748:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2774f:	e8 4c bf 00 00       	call   336a0 <JS_IsInstanceOf>
   27754:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16034
   27756:	85 c0                	test   eax,eax
   27758:	0f 88 e2 bb ff ff    	js     23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2775e:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   27765:	83 fa f6             	cmp    edx,0xfffffff6
   27768:	76 18                	jbe    27782 <JS_CallInternal+0x4be2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2776a:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   27771:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27774:	83 e8 01             	sub    eax,0x1
   27777:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2777a:	85 c0                	test   eax,eax
   2777c:	0f 8e f6 46 00 00    	jle    2be78 <JS_CallInternal+0x92d8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27782:	41 83 fd f6          	cmp    r13d,0xfffffff6
   27786:	76 13                	jbe    2779b <JS_CallInternal+0x4bfb>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27788:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   2778c:	83 e8 01             	sub    eax,0x1
   2778f:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   27793:	85 c0                	test   eax,eax
   27795:	0f 8e fe 46 00 00    	jle    2be99 <JS_CallInternal+0x92f9>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2779b:	31 c0                	xor    eax,eax
   2779d:	85 c9                	test   ecx,ecx
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16038
   2779f:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   277a6:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   277a7:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20439
   277aa:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20440
   277ae:	49 83 c4 01          	add    r12,0x1
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16038
   277b2:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20440
   277b6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   277bc:	49 89 c5             	mov    r13,rax
   277bf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   277c3:	ff e0                	jmp    rax
   277c5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421
   277c9:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   277cd:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   277d1:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   277d5:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   277d9:	48 89 d7             	mov    rdi,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   277dc:	45 85 c9             	test   r9d,r9d
   277df:	0f 85 3f 3f 00 00    	jne    2b724 <JS_CallInternal+0x8b84>
   277e5:	45 85 f6             	test   r14d,r14d
   277e8:	0f 85 a2 1f 00 00    	jne    29790 <JS_CallInternal+0x6bf0>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   277ee:	31 c0                	xor    eax,eax
   277f0:	44 39 ea             	cmp    edx,r13d
   277f3:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 26)
   277f6:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   277fa:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   277fe:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 26)
   27802:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27809:	00 
   2780a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27810:	49 89 c5             	mov    r13,rax
   27813:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27817:	ff e0                	jmp    rax
   27819:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420
   2781d:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   27821:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   27825:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   27829:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   2782d:	48 89 d7             	mov    rdi,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 1)
   27830:	45 85 c0             	test   r8d,r8d
   27833:	0f 85 ee 3a 00 00    	jne    2b327 <JS_CallInternal+0x8787>
   27839:	45 85 f6             	test   r14d,r14d
   2783c:	0f 85 a6 1f 00 00    	jne    297e8 <JS_CallInternal+0x6c48>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 3)
   27842:	31 c0                	xor    eax,eax
   27844:	44 39 ea             	cmp    edx,r13d
   27847:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 26)
   2784a:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   2784e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 1)
   27852:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 26)
   27856:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2785d:	00 
   2785e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27864:	49 89 c5             	mov    r13,rax
   27867:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2786b:	ff e0                	jmp    rax
   2786d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291
   27871:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   27875:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   27879:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2787d:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 1)
   27881:	89 cf                	mov    edi,ecx
   27883:	09 f7                	or     edi,esi
   27885:	0f 85 46 3f 00 00    	jne    2b7d1 <JS_CallInternal+0x8c31>
   2788b:	39 d0                	cmp    eax,edx
   2788d:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   27894:	00 
   27895:	0f 9c c0             	setl   al
   27898:	48 83 eb 10          	sub    rbx,0x10
   2789c:	0f b6 c0             	movzx  eax,al
   2789f:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291
   278a3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   278a8:	49 83 c4 01          	add    r12,0x1
   278ac:	49 89 c5             	mov    r13,rax
   278af:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   278b3:	ff e0                	jmp    rax
   278b5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19623
   278b9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19624
   278c0:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   278c4:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   278c8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19623
   278cf:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19624
   278d3:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   278d7:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   278de:	e8 1d c4 01 00       	call   43d00 <JS_ValueToAtom>
   278e3:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19625 (discriminator 1)
   278e6:	45 85 ed             	test   r13d,r13d
   278e9:	0f 84 51 ba ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19627 (discriminator 2)
   278ef:	83 7b d8 03          	cmp    DWORD PTR [rbx-0x28],0x3
   278f3:	0f 84 71 39 00 00    	je     2b26a <JS_CallInternal+0x86ca>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19636
   278f9:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   278fd:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   27901:	44 89 e9             	mov    ecx,r13d
   27904:	4c 8d 73 d0          	lea    r14,[rbx-0x30]
   27908:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2790f:	e8 1c 6b 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19637 (discriminator 1)
   27914:	85 c0                	test   eax,eax
   27916:	0f 8e f6 38 00 00    	jle    2b212 <JS_CallInternal+0x8672>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19648
   2791c:	48 83 ec 08          	sub    rsp,0x8
   27920:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27924:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   27928:	44 89 e9             	mov    ecx,r13d
   2792b:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   2792e:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27932:	68 00 80 00 00       	push   0x8000
   27937:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   2793b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27942:	41 ff 36             	push   QWORD PTR [r14]
   27945:	e8 26 64 00 00       	call   2dd70 <JS_SetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2794a:	48 83 c4 20          	add    rsp,0x20
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19648
   2794e:	89 c3                	mov    ebx,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   27950:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   27957:	0f 8f 60 29 00 00    	jg     2a2bd <JS_CallInternal+0x771d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19650
   2795d:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   27964:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27968:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2796b:	83 fa f6             	cmp    edx,0xfffffff6
   2796e:	76 11                	jbe    27981 <JS_CallInternal+0x4de1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27970:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27973:	83 e8 01             	sub    eax,0x1
   27976:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27979:	85 c0                	test   eax,eax
   2797b:	0f 8e 86 39 00 00    	jle    2b307 <JS_CallInternal+0x8767>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19651
   27981:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27985:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27988:	83 fa f6             	cmp    edx,0xfffffff6
   2798b:	76 11                	jbe    2799e <JS_CallInternal+0x4dfe>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2798d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27990:	83 e8 01             	sub    eax,0x1
   27993:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27996:	85 c0                	test   eax,eax
   27998:	0f 8e 77 3e 00 00    	jle    2b815 <JS_CallInternal+0x8c75>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19653 (discriminator 1)
   2799e:	85 db                	test   ebx,ebx
   279a0:	0f 88 4a 44 00 00    	js     2bdf0 <JS_CallInternal+0x9250>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19656
   279a6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19652
   279ab:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19656
   279ae:	49 83 c4 01          	add    r12,0x1
   279b2:	49 89 c5             	mov    r13,rax
   279b5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   279b9:	ff e0                	jmp    rax
   279bb:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20220
   279bf:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20220 (discriminator 1)
   279c3:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20218
   279c6:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20219
   279ca:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20220 (discriminator 1)
   279ce:	0f 85 e5 37 00 00    	jne    2b1b9 <JS_CallInternal+0x8619>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20221
   279d4:	09 c8                	or     eax,ecx
   279d6:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   279dd:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20224
   279de:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   279e2:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20232
   279e6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   279eb:	49 83 c4 01          	add    r12,0x1
   279ef:	49 89 c5             	mov    r13,rax
   279f2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   279f6:	ff e0                	jmp    rax
   279f8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18885
   279fc:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18888
   27a00:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18886
   27a04:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18885
   27a09:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27a0d:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18888
   27a10:	0f 87 d8 22 00 00    	ja     29cee <JS_CallInternal+0x714e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18893
   27a16:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18894
   27a1a:	85 c0                	test   eax,eax
   27a1c:	75 0c                	jne    27a2a <JS_CallInternal+0x4e8a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18895 (discriminator 1)
   27a1e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   27a22:	83 e8 04             	sub    eax,0x4
   27a25:	48 98                	cdqe
   27a27:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   27a2a:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   27a31:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   27a37:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   27a3d:	83 e8 01             	sub    eax,0x1
   27a40:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   27a46:	85 c0                	test   eax,eax
   27a48:	0f 8e 9e 3c 00 00    	jle    2b6ec <JS_CallInternal+0x8b4c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18900
   27a4e:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   27a53:	4d 8d 65 01          	lea    r12,[r13+0x1]
   27a57:	49 89 c5             	mov    r13,rax
   27a5a:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   27a5e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19212
   27a62:	4c 8b 73 e8          	mov    r14,QWORD PTR [rbx-0x18]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   27a66:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19210
   27a6a:	4d 8d 54 24 04       	lea    r10,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19212
   27a6f:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   27a73:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27a77:	4c 8b 6b e0          	mov    r13,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19213 (discriminator 1)
   27a7b:	41 83 fe ff          	cmp    r14d,0xffffffff
   27a7f:	0f 85 d3 21 00 00    	jne    29c58 <JS_CallInternal+0x70b8>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   27a85:	4d 8b 4d 18          	mov    r9,QWORD PTR [r13+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   27a89:	41 8b 79 18          	mov    edi,DWORD PTR [r9+0x18]
   27a8d:	89 fe                	mov    esi,edi
   27a8f:	21 ce                	and    esi,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   27a91:	41 8b 74 b1 38       	mov    esi,DWORD PTR [r9+rsi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   27a96:	48 85 f6             	test   rsi,rsi
   27a99:	0f 84 b9 21 00 00    	je     29c58 <JS_CallInternal+0x70b8>
   27a9f:	48 8d 3c bd 34 00 00 	lea    rdi,[rdi*4+0x34]
   27aa6:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   27aa7:	4c 8d 04 f7          	lea    r8,[rdi+rsi*8]
   27aab:	4d 01 c8             	add    r8,r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   27aae:	41 39 48 04          	cmp    DWORD PTR [r8+0x4],ecx
   27ab2:	0f 85 91 21 00 00    	jne    29c49 <JS_CallInternal+0x70a9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   27ab8:	49 8b 7d 20          	mov    rdi,QWORD PTR [r13+0x20]
   27abc:	48 c1 e6 04          	shl    rsi,0x4
   27ac0:	48 8d 7c 37 f0       	lea    rdi,[rdi+rsi*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19218
   27ac5:	41 0f b6 70 03       	movzx  esi,BYTE PTR [r8+0x3]
   27aca:	40 c0 ee 02          	shr    sil,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19218 (discriminator 1)
   27ace:	83 e6 3a             	and    esi,0x3a
   27ad1:	40 80 fe 02          	cmp    sil,0x2
   27ad5:	0f 85 7d 21 00 00    	jne    29c58 <JS_CallInternal+0x70b8>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   27adb:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   27adf:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   27ae4:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   27ae7:	0f 11 37             	movups XMMWORD PTR [rdi],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27aea:	83 fa f6             	cmp    edx,0xfffffff6
   27aed:	76 11                	jbe    27b00 <JS_CallInternal+0x4f60>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27aef:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27af2:	83 e8 01             	sub    eax,0x1
   27af5:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27af8:	85 c0                	test   eax,eax
   27afa:	0f 8e 25 42 00 00    	jle    2bd25 <JS_CallInternal+0x9185>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27b00:	41 83 fe f6          	cmp    r14d,0xfffffff6
   27b04:	76 13                	jbe    27b19 <JS_CallInternal+0x4f79>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27b06:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   27b0a:	83 e8 01             	sub    eax,0x1
   27b0d:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   27b11:	85 c0                	test   eax,eax
   27b13:	0f 8e 36 42 00 00    	jle    2bd4f <JS_CallInternal+0x91af>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19226
   27b19:	48 83 eb 20          	sub    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19239
   27b1d:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   27b23:	49 83 c4 05          	add    r12,0x5
   27b27:	49 89 c5             	mov    r13,rax
   27b2a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27b2e:	ff e0                	jmp    rax
   27b30:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18992
   27b34:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18993
   27b3b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27b42:	31 d2                	xor    edx,edx
   27b44:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18992
   27b47:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18993
   27b4b:	e8 a0 e1 06 00       	call   95cf0 <js_for_of_start>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18993 (discriminator 1)
   27b50:	85 c0                	test   eax,eax
   27b52:	0f 85 e8 b7 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18996
   27b58:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   27b5f:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18997
   27b60:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18996
   27b64:	48 83 c3 20          	add    rbx,0x20
   27b68:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   27b6f:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18997
   27b70:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27b76:	49 89 c5             	mov    r13,rax
   27b79:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27b7d:	ff e0                	jmp    rax
   27b7f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18986
   27b83:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18987
   27b8a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27b91:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18986
   27b94:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18987
   27b98:	e8 73 60 04 00       	call   6dc10 <js_for_in_next>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18987 (discriminator 1)
   27b9d:	85 c0                	test   eax,eax
   27b9f:	0f 85 9b b7 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18990
   27ba5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18989
   27baa:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18990
   27bae:	49 83 c4 01          	add    r12,0x1
   27bb2:	49 89 c5             	mov    r13,rax
   27bb5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27bb9:	ff e0                	jmp    rax
   27bbb:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18981
   27bbf:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_for_in_start():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16355
   27bc6:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   27bca:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27bce:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18981
   27bd5:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_for_in_start():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16355
   27bd9:	e8 92 5d 04 00       	call   6d970 <build_for_in_iterator>
   27bde:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16356 (discriminator 1)
   27be2:	83 7b f8 06          	cmp    DWORD PTR [rbx-0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16355
   27be6:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16356 (discriminator 1)
   27bea:	0f 84 50 b7 ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18984
   27bf0:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27bf5:	49 83 c4 01          	add    r12,0x1
   27bf9:	49 89 c5             	mov    r13,rax
   27bfc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27c00:	ff e0                	jmp    rax
   27c02:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18967 (discriminator 1)
   27c06:	44 8b 43 f8          	mov    r8d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18966
   27c0a:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18967 (discriminator 1)
   27c0e:	45 85 c0             	test   r8d,r8d
   27c11:	0f 85 eb 27 00 00    	jne    2a402 <JS_CallInternal+0x7862>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18970 (discriminator 1)
   27c17:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   27c1e:	3b 41 20             	cmp    eax,DWORD PTR [rcx+0x20]
   27c21:	0f 83 db 27 00 00    	jae    2a402 <JS_CallInternal+0x7862>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18976
   27c27:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   27c2e:	89 c0                	mov    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18975
   27c30:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18976
   27c34:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18978
   27c38:	4c 8d 60 01          	lea    r12,[rax+0x1]
   27c3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   27c3f:	49 89 c5             	mov    r13,rax
   27c42:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   27c46:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19009
   27c4a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20743
   27c51:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
   27c55:	45 31 c9             	xor    r9d,r9d
   27c58:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
   27c5f:	00 00 00 00 
   27c63:	48 c7 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],0x3
   27c6a:	03 00 00 00 
   27c6e:	4c 8b 43 d8          	mov    r8,QWORD PTR [rbx-0x28]
   27c72:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27c76:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19009
   27c7a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16738
   27c7e:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   27c85:	00 
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20743
   27c86:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16738
   27c8d:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   27c94:	00 
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20743
   27c95:	6a 02                	push   0x2
   27c97:	6a 00                	push   0x0
   27c99:	ff b5 f8 fd ff ff    	push   QWORD PTR [rbp-0x208]
   27c9f:	ff b5 f0 fd ff ff    	push   QWORD PTR [rbp-0x210]
   27ca5:	e8 f6 ae ff ff       	call   22ba0 <JS_CallInternal>
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16743 (discriminator 1)
   27caa:	48 83 c4 20          	add    rsp,0x20
   27cae:	83 fa 06             	cmp    edx,0x6
   27cb1:	0f 84 89 b6 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16745
   27cb7:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19013
   27cba:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19012
   27cbe:	48 83 c3 10          	add    rbx,0x10
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16745
   27cc2:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19013
   27cc6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27ccc:	49 89 c5             	mov    r13,rax
   27ccf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27cd3:	ff e0                	jmp    rax
   27cd5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19685
   27cd9:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   27cdd:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   27ce1:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   27ce5:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27ce9:	76 04                	jbe    27cef <JS_CallInternal+0x514f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   27ceb:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19685 (discriminator 1)
   27cef:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   27cf3:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   27cf7:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   27cfb:	41 b9 07 40 00 00    	mov    r9d,0x4007
   27d01:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27d08:	41 ff 36             	push   QWORD PTR [r14]
   27d0b:	e8 80 c1 01 00       	call   43e90 <JS_DefinePropertyValueValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19688 (discriminator 1)
   27d10:	59                   	pop    rcx
   27d11:	5e                   	pop    rsi
   27d12:	85 c0                	test   eax,eax
   27d14:	0f 88 6e 3e 00 00    	js     2bb88 <JS_CallInternal+0x8fe8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19691
   27d1a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19687
   27d1f:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19691
   27d22:	49 83 c4 01          	add    r12,0x1
   27d26:	49 89 c5             	mov    r13,rax
   27d29:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27d2d:	ff e0                	jmp    rax
   27d2f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19662
   27d33:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19663
   27d3a:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19662
   27d3e:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19663
   27d42:	0f 85 28 49 00 00    	jne    2c670 <JS_CallInternal+0x9ad0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19667
   27d48:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27d4c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27d53:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   27d57:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27d5b:	e8 a0 bf 01 00       	call   43d00 <JS_ValueToAtom>
   27d60:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19668 (discriminator 1)
   27d63:	45 85 ed             	test   r13d,r13d
   27d66:	0f 84 d4 b5 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19670
   27d6c:	48 83 ec 08          	sub    rsp,0x8
   27d70:	4c 8d 53 d0          	lea    r10,[rbx-0x30]
   27d74:	48 8d 43 c0          	lea    rax,[rbx-0x40]
   27d78:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27d7c:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   27d83:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   27d87:	44 89 e9             	mov    ecx,r13d
   27d8a:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   27d8e:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   27d92:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   27d99:	68 00 80 00 00       	push   0x8000
   27d9e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27da5:	ff 73 c8             	push   QWORD PTR [rbx-0x38]
   27da8:	ff 73 c0             	push   QWORD PTR [rbx-0x40]
   27dab:	e8 c0 5f 00 00       	call   2dd70 <JS_SetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   27db0:	48 83 c4 20          	add    rsp,0x20
   27db4:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   27dbb:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19670
   27dc2:	89 c3                	mov    ebx,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   27dc4:	0f 8f d4 20 00 00    	jg     29e9e <JS_CallInternal+0x72fe>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19673
   27dca:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   27dd1:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27dd5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27dd8:	83 fa f6             	cmp    edx,0xfffffff6
   27ddb:	76 11                	jbe    27dee <JS_CallInternal+0x524e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27ddd:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27de0:	83 e8 01             	sub    eax,0x1
   27de3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27de6:	85 c0                	test   eax,eax
   27de8:	0f 8e 0e 28 00 00    	jle    2a5fc <JS_CallInternal+0x7a5c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19674
   27dee:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   27df2:	49 8b 32             	mov    rsi,QWORD PTR [r10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27df5:	83 fa f6             	cmp    edx,0xfffffff6
   27df8:	76 11                	jbe    27e0b <JS_CallInternal+0x526b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27dfa:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27dfd:	83 e8 01             	sub    eax,0x1
   27e00:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27e03:	85 c0                	test   eax,eax
   27e05:	0f 8e 2c 28 00 00    	jle    2a637 <JS_CallInternal+0x7a97>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19675
   27e0b:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27e0f:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   27e12:	83 fa f6             	cmp    edx,0xfffffff6
   27e15:	76 11                	jbe    27e28 <JS_CallInternal+0x5288>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   27e17:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27e1a:	83 e8 01             	sub    eax,0x1
   27e1d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27e20:	85 c0                	test   eax,eax
   27e22:	0f 8e bf 27 00 00    	jle    2a5e7 <JS_CallInternal+0x7a47>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19677
   27e28:	85 db                	test   ebx,ebx
   27e2a:	0f 88 81 47 00 00    	js     2c5b1 <JS_CallInternal+0x9a11>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19680
   27e30:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19676
   27e35:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19680
   27e3c:	49 83 c4 01          	add    r12,0x1
   27e40:	49 89 c5             	mov    r13,rax
   27e43:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27e47:	ff e0                	jmp    rax
   27e49:	f3 0f 1e fa          	endbr64
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17572
   27e4d:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18792 (discriminator 1)
   27e54:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17572
   27e59:	0f b7 51 38          	movzx  edx,WORD PTR [rcx+0x38]
   27e5d:	4c 8b 49 28          	mov    r9,QWORD PTR [rcx+0x28]
   27e61:	01 d0                	add    eax,edx
   27e63:	48 98                	cdqe
   27e65:	48 8d 04 40          	lea    rax,[rax+rax*2]
   27e69:	49 8d 04 81          	lea    rax,[r9+rax*4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17573
   27e6d:	44 0f b7 68 0a       	movzx  r13d,WORD PTR [rax+0xa]
   27e72:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27e79:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
   27e7d:	49 c1 e5 03          	shl    r13,0x3
   27e81:	4c 01 e9             	add    rcx,r13
   27e84:	4c 8b 31             	mov    r14,QWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17574
   27e87:	4d 85 f6             	test   r14,r14
   27e8a:	74 50                	je     27edc <JS_CallInternal+0x533c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17575
   27e8c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27e93:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17544
   27e97:	f6 40 3c 04          	test   BYTE PTR [rax+0x3c],0x4
   27e9b:	0f 85 7f 26 00 00    	jne    2a520 <JS_CallInternal+0x7980>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17548
   27ea1:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   27ea5:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   27ea8:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValueRT():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:718
   27eac:	83 fa f6             	cmp    edx,0xfffffff6
   27eaf:	76 04                	jbe    27eb5 <JS_CallInternal+0x5315>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:720
   27eb1:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17549
   27eb5:	49 8d 7e 20          	lea    rdi,[r14+0x20]
   27eb9:	66 48 0f 6e e0       	movq   xmm4,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17548
   27ebe:	49 89 56 28          	mov    QWORD PTR [r14+0x28],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17549
   27ec2:	66 48 0f 6e c7       	movq   xmm0,rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17551
   27ec7:	41 c6 46 10 01       	mov    BYTE PTR [r14+0x10],0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17549
   27ecc:	66 0f 6c c4          	punpcklqdq xmm0,xmm4
   27ed0:	41 0f 11 46 18       	movups XMMWORD PTR [r14+0x18],xmm0
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17576
   27ed5:	48 c7 01 00 00 00 00 	mov    QWORD PTR [rcx],0x0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18796
   27edc:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   27ee2:	49 83 c4 03          	add    r12,0x3
   27ee6:	49 89 c5             	mov    r13,rax
   27ee9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27eed:	ff e0                	jmp    rax
   27eef:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19341
   27ef3:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   27ef7:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19342
   27efb:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19341
   27eff:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27f03:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   27f07:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27f0e:	e8 0d 62 ff ff       	call   1e120 <js_method_set_home_object>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19342
   27f13:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27f19:	49 89 c5             	mov    r13,rax
   27f1c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27f20:	ff e0                	jmp    rax
   27f22:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19314
   27f26:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   27f2a:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19312
   27f2e:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19314
   27f33:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27f37:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27f3e:	e8 7d c8 00 00       	call   347c0 <JS_DefineObjectName.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19315 (discriminator 1)
   27f43:	85 c0                	test   eax,eax
   27f45:	0f 88 6b 39 00 00    	js     2b8b6 <JS_CallInternal+0x8d16>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19318
   27f4b:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   27f51:	49 83 c4 05          	add    r12,0x5
   27f55:	49 89 c5             	mov    r13,rax
   27f58:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27f5c:	ff e0                	jmp    rax
   27f5e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19299
   27f62:	48 83 ec 08          	sub    rsp,0x8
   27f66:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   27f6a:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27f6e:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   27f72:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27f76:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19297
   27f7a:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19299
   27f7f:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27f83:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27f8a:	68 07 40 00 00       	push   0x4007
   27f8f:	e8 9c 80 00 00       	call   30030 <JS_DefinePropertyValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19302 (discriminator 1)
   27f94:	59                   	pop    rcx
   27f95:	5e                   	pop    rsi
   27f96:	85 c0                	test   eax,eax
   27f98:	0f 88 4e 39 00 00    	js     2b8ec <JS_CallInternal+0x8d4c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19305
   27f9e:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19301
   27fa4:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19305
   27fa7:	49 83 c4 05          	add    r12,0x5
   27fab:	49 89 c5             	mov    r13,rax
   27fae:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27fb2:	ff e0                	jmp    rax
   27fb4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19322
   27fb8:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   27fbc:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   27fc0:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27fc4:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   27fc8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27fcf:	e8 ac c0 01 00       	call   44080 <JS_DefineObjectNameComputed.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19323 (discriminator 1)
   27fd4:	85 c0                	test   eax,eax
   27fd6:	0f 88 64 b3 ff ff    	js     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19326
   27fdc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27fe1:	49 83 c4 01          	add    r12,0x1
   27fe5:	49 89 c5             	mov    r13,rax
   27fe8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27fec:	ff e0                	jmp    rax
   27fee:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19259
   27ff2:	48 8d 43 e0          	lea    rax,[rbx-0x20]
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8438 (discriminator 1)
   27ff6:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19259
   27ffa:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   27ffe:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   28002:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   28006:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2800a:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8438 (discriminator 1)
   28011:	0f 85 ef 2d 00 00    	jne    2ae06 <JS_CallInternal+0x8266>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8441 (discriminator 1)
   28017:	41 83 f9 f8          	cmp    r9d,0xfffffff8
   2801b:	0f 85 17 36 00 00    	jne    2b638 <JS_CallInternal+0x8a98>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9020
   28021:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28028:	4c 89 ee             	mov    rsi,r13
   2802b:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   28032:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   28039:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2803d:	48 89 c7             	mov    rdi,rax
   28040:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   28047:	e8 04 eb fe ff       	call   16b50 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   2804c:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9020
   28053:	89 c2                	mov    edx,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   28055:	49 8b 70 18          	mov    rsi,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   28059:	8b 4e 18             	mov    ecx,DWORD PTR [rsi+0x18]
   2805c:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   2805e:	8b 44 86 38          	mov    eax,DWORD PTR [rsi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28062:	48 85 c0             	test   rax,rax
   28065:	0f 84 9a 3d 00 00    	je     2be05 <JS_CallInternal+0x9265>
   2806b:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   28072:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   28079:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   2807a:	48 8d 0c c7          	lea    rcx,[rdi+rax*8]
   2807e:	48 01 f1             	add    rcx,rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   28081:	3b 51 04             	cmp    edx,DWORD PTR [rcx+0x4]
   28084:	0f 85 6e 3d 00 00    	jne    2bdf8 <JS_CallInternal+0x9258>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   2808a:	49 8b 50 20          	mov    rdx,QWORD PTR [r8+0x20]
   2808e:	48 c1 e0 04          	shl    rax,0x4
   28092:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8450
   28097:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   2809a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2809e:	83 f8 f6             	cmp    eax,0xfffffff6
   280a1:	76 04                	jbe    280a7 <JS_CallInternal+0x5507>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   280a3:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:713
   280a7:	48 89 d1             	mov    rcx,rdx
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:643
   280aa:	41 89 c0             	mov    r8d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   280ad:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   280b1:	76 13                	jbe    280c6 <JS_CallInternal+0x5526>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   280b3:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   280b7:	8d 57 ff             	lea    edx,[rdi-0x1]
   280ba:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   280be:	85 d2                	test   edx,edx
   280c0:	0f 8e 00 28 00 00    	jle    2a8c6 <JS_CallInternal+0x7d26>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19261
   280c6:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   280cd:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
   280d1:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   280d4:	83 fa f6             	cmp    edx,0xfffffff6
   280d7:	76 11                	jbe    280ea <JS_CallInternal+0x554a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   280d9:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   280dc:	83 ef 01             	sub    edi,0x1
   280df:	89 7e fc             	mov    DWORD PTR [rsi-0x4],edi
   280e2:	85 ff                	test   edi,edi
   280e4:	0f 8e 21 28 00 00    	jle    2a90b <JS_CallInternal+0x7d6b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19262
   280ea:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   280ee:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19263
   280f2:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19264 (discriminator 2)
   280f5:	41 83 f8 06          	cmp    r8d,0x6
   280f9:	0f 84 41 b2 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19267
   280ff:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28104:	49 83 c4 01          	add    r12,0x1
   28108:	49 89 c5             	mov    r13,rax
   2810b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2810f:	ff e0                	jmp    rax
   28111:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19248
   28115:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   28119:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19247
   28120:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19248
   28125:	e8 76 bc 00 00       	call   33da0 <JS_NewSymbolFromAtom.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19249 (discriminator 1)
   2812a:	83 fa 06             	cmp    edx,0x6
   2812d:	0f 84 9d 34 00 00    	je     2b5d0 <JS_CallInternal+0x8a30>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19251
   28133:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19253
   28136:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19251
   2813a:	48 83 c3 10          	add    rbx,0x10
   2813e:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19253
   28142:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28148:	49 89 c5             	mov    r13,rax
   2814b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2814f:	ff e0                	jmp    rax
   28151:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19272
   28155:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   28159:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   2815d:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   28160:	48 83 eb 30          	sub    rbx,0x30
   28164:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8461 (discriminator 1)
   28168:	83 7b 08 ff          	cmp    DWORD PTR [rbx+0x8],0xffffffff
   2816c:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   2816f:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   28172:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   28179:	49 8b 4e 08          	mov    rcx,QWORD PTR [r14+0x8]
   2817d:	0f 85 40 2f 00 00    	jne    2b0c3 <JS_CallInternal+0x8523>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8466 (discriminator 1)
   28183:	83 f9 f8             	cmp    ecx,0xfffffff8
   28186:	0f 85 f3 2e 00 00    	jne    2b07f <JS_CallInternal+0x84df>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9020
   2818c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28193:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2819a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2819e:	48 89 c7             	mov    rdi,rax
   281a1:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   281a8:	e8 a3 e9 fe ff       	call   16b50 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   281ad:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9020
   281b4:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   281b6:	48 8b 7a 18          	mov    rdi,QWORD PTR [rdx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   281ba:	8b 4f 18             	mov    ecx,DWORD PTR [rdi+0x18]
   281bd:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   281bf:	8b 44 87 38          	mov    eax,DWORD PTR [rdi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   281c3:	48 85 c0             	test   rax,rax
   281c6:	0f 84 87 3c 00 00    	je     2be53 <JS_CallInternal+0x92b3>
   281cc:	4c 8d 04 8d 34 00 00 	lea    r8,[rcx*4+0x34]
   281d3:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   281d4:	49 8d 0c c0          	lea    rcx,[r8+rax*8]
   281d8:	48 01 f9             	add    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   281db:	3b 71 04             	cmp    esi,DWORD PTR [rcx+0x4]
   281de:	0f 85 62 3c 00 00    	jne    2be46 <JS_CallInternal+0x92a6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   281e4:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
   281e8:	48 c1 e0 04          	shl    rax,0x4
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   281ec:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   281f3:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   281f8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   281fc:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   281ff:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
   28203:	4c 89 28             	mov    QWORD PTR [rax],r13
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28206:	83 fa f6             	cmp    edx,0xfffffff6
   28209:	76 11                	jbe    2821c <JS_CallInternal+0x567c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2820b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2820e:	83 e8 01             	sub    eax,0x1
   28211:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28214:	85 c0                	test   eax,eax
   28216:	0f 8e be 2e 00 00    	jle    2b0da <JS_CallInternal+0x853a>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8480
   2821c:	45 31 ed             	xor    r13d,r13d
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19273
   2821f:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   28223:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28226:	83 fa f6             	cmp    edx,0xfffffff6
   28229:	76 11                	jbe    2823c <JS_CallInternal+0x569c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2822b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2822e:	83 e8 01             	sub    eax,0x1
   28231:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28234:	85 c0                	test   eax,eax
   28236:	0f 8e 75 26 00 00    	jle    2a8b1 <JS_CallInternal+0x7d11>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19274
   2823c:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   28240:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28243:	83 fa f6             	cmp    edx,0xfffffff6
   28246:	76 11                	jbe    28259 <JS_CallInternal+0x56b9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28248:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2824b:	83 e8 01             	sub    eax,0x1
   2824e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28251:	85 c0                	test   eax,eax
   28253:	0f 8e 00 2a 00 00    	jle    2ac59 <JS_CallInternal+0x80b9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19276 (discriminator 1)
   28259:	41 83 fd ff          	cmp    r13d,0xffffffff
   2825d:	0f 84 dd b0 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19279
   28263:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28268:	49 83 c4 01          	add    r12,0x1
   2826c:	49 89 c5             	mov    r13,rax
   2826f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28273:	ff e0                	jmp    rax
   28275:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 4)
   28279:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   2827d:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 1)
   28281:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 4)
   28286:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 1)
   2828a:	83 ff ff             	cmp    edi,0xffffffff
   2828d:	0f 85 fa 10 00 00    	jne    2938d <JS_CallInternal+0x67ed>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 5)
   28293:	4c 89 d1             	mov    rcx,r10
   28296:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   2829d:	00 00 00 
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   282a0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   282a4:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   282a7:	41 89 c0             	mov    r8d,eax
   282aa:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   282ad:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   282b2:	4d 85 c0             	test   r8,r8
   282b5:	0f 84 c4 0b 00 00    	je     28e7f <JS_CallInternal+0x62df>
   282bb:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   282c2:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   282c3:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   282c7:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   282ca:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   282cd:	0f 85 9c 0b 00 00    	jne    28e6f <JS_CallInternal+0x62cf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 1)
   282d3:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   282d7:	0f 87 b0 10 00 00    	ja     2938d <JS_CallInternal+0x67ed>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   282dd:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   282e1:	49 c1 e0 04          	shl    r8,0x4
   282e5:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 11)
   282ea:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   282ed:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   282f1:	83 fa f6             	cmp    edx,0xfffffff6
   282f4:	76 04                	jbe    282fa <JS_CallInternal+0x575a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   282f6:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 20)
   282fa:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19192
   282fd:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 20)
   28301:	48 83 c3 10          	add    rbx,0x10
   28305:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19192
   28309:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2830f:	49 89 c5             	mov    r13,rax
   28312:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28316:	ff e0                	jmp    rax
   28318:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 4)
   2831c:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   28320:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 1)
   28324:	4d 8d 74 24 04       	lea    r14,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 4)
   28329:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 1)
   2832d:	83 ff ff             	cmp    edi,0xffffffff
   28330:	0f 85 0d 11 00 00    	jne    29443 <JS_CallInternal+0x68a3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 5)
   28336:	4c 89 d1             	mov    rcx,r10
   28339:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   28340:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   28344:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   28347:	41 89 c0             	mov    r8d,eax
   2834a:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   2834d:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28352:	4d 85 c0             	test   r8,r8
   28355:	0f 84 57 0b 00 00    	je     28eb2 <JS_CallInternal+0x6312>
   2835b:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   28362:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   28363:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   28367:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   2836a:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   2836d:	0f 85 2f 0b 00 00    	jne    28ea2 <JS_CallInternal+0x6302>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 1)
   28373:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   28377:	0f 87 c6 10 00 00    	ja     29443 <JS_CallInternal+0x68a3>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   2837d:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   28381:	49 c1 e0 04          	shl    r8,0x4
   28385:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 11)
   2838a:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   2838e:	48 8b 02             	mov    rax,QWORD PTR [rdx]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   28391:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   28395:	76 04                	jbe    2839b <JS_CallInternal+0x57fb>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   28397:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   2839b:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 21)
   2839f:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   283a3:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   283a7:	83 fa f6             	cmp    edx,0xfffffff6
   283aa:	76 11                	jbe    283bd <JS_CallInternal+0x581d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   283ac:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   283af:	83 e9 01             	sub    ecx,0x1
   283b2:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   283b5:	85 c9                	test   ecx,ecx
   283b7:	0f 8e a8 24 00 00    	jle    2a865 <JS_CallInternal+0x7cc5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 1)
   283bd:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19188
   283c1:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 1)
   283c5:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19188
   283c9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   283cf:	49 89 c5             	mov    r13,rax
   283d2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   283d6:	ff e0                	jmp    rax
   283d8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 4)
   283dc:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   283e0:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 1)
   283e4:	83 ff ff             	cmp    edi,0xffffffff
   283e7:	0f 85 4e 0f 00 00    	jne    2933b <JS_CallInternal+0x679b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 5)
   283ed:	48 89 f1             	mov    rcx,rsi
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   283f0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6152
   283f4:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   283f7:	41 89 c0             	mov    r8d,eax
   283fa:	41 83 e0 32          	and    r8d,0x32
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6153
   283fe:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28403:	4d 85 c0             	test   r8,r8
   28406:	0f 84 3b 0a 00 00    	je     28e47 <JS_CallInternal+0x62a7>
   2840c:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   28413:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6156
   28414:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   28418:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6157 (discriminator 1)
   2841b:	83 78 04 32          	cmp    DWORD PTR [rax+0x4],0x32
   2841f:	0f 85 12 0a 00 00    	jne    28e37 <JS_CallInternal+0x6297>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 1)
   28425:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   28429:	0f 87 0c 0f 00 00    	ja     2933b <JS_CallInternal+0x679b>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6158
   2842f:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   28433:	49 c1 e0 04          	shl    r8,0x4
   28437:	4a 8d 44 00 f0       	lea    rax,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 11)
   2843c:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   28440:	4c 8b 30             	mov    r14,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   28443:	83 f9 f6             	cmp    ecx,0xfffffff6
   28446:	76 05                	jbe    2844d <JS_CallInternal+0x58ad>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   28448:	41 83 46 fc 01       	add    DWORD PTR [r14-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   2844d:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 21)
   28451:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   28455:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28459:	83 fa f6             	cmp    edx,0xfffffff6
   2845c:	76 11                	jbe    2846f <JS_CallInternal+0x58cf>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2845e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28461:	83 e8 01             	sub    eax,0x1
   28464:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28467:	85 c0                	test   eax,eax
   28469:	0f 8e fe 21 00 00    	jle    2a66d <JS_CallInternal+0x7acd>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 1)
   2846f:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19197
   28473:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 1)
   28477:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19197
   2847b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28481:	49 89 c5             	mov    r13,rax
   28484:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28488:	ff e0                	jmp    rax
   2848a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19471
   2848e:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19471 (discriminator 1)
   28492:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   28496:	83 f8 ff             	cmp    eax,0xffffffff
   28499:	0f 85 58 34 00 00    	jne    2b8f7 <JS_CallInternal+0x8d57>
   2849f:	45 85 ed             	test   r13d,r13d
   284a2:	0f 85 6f 1a 00 00    	jne    29f17 <JS_CallInternal+0x7377>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19473
   284a8:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19474
   284ac:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19475 (discriminator 1)
   284b0:	66 83 7a 12 02       	cmp    WORD PTR [rdx+0x12],0x2
   284b5:	0f 85 c1 1a 00 00    	jne    29f7c <JS_CallInternal+0x73dc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19477 (discriminator 1)
   284bb:	3b 42 38             	cmp    eax,DWORD PTR [rdx+0x38]
   284be:	0f 83 b8 1a 00 00    	jae    29f7c <JS_CallInternal+0x73dc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19479
   284c4:	89 c0                	mov    eax,eax
   284c6:	48 c1 e0 04          	shl    rax,0x4
   284ca:	48 03 42 30          	add    rax,QWORD PTR [rdx+0x30]
   284ce:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   284d1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   284d5:	83 f8 f6             	cmp    eax,0xfffffff6
   284d8:	76 04                	jbe    284de <JS_CallInternal+0x593e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   284da:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19507
   284de:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19509
   284e1:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19507
   284e5:	48 83 c3 10          	add    rbx,0x10
   284e9:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19509
   284ed:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   284f3:	49 89 c5             	mov    r13,rax
   284f6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   284fa:	ff e0                	jmp    rax
   284fc:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 1)
   28500:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462
   28504:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   28508:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
   2850c:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   28510:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 1)
   28514:	0f 85 e6 16 00 00    	jne    29c00 <JS_CallInternal+0x7060>
   2851a:	85 ff                	test   edi,edi
   2851c:	0f 85 de 16 00 00    	jne    29c00 <JS_CallInternal+0x7060>
   28522:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   28527:	0f 85 d3 16 00 00    	jne    29c00 <JS_CallInternal+0x7060>
   2852d:	44 3b 46 38          	cmp    r8d,DWORD PTR [rsi+0x38]
   28531:	0f 83 c9 16 00 00    	jae    29c00 <JS_CallInternal+0x7060>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 9)
   28537:	44 89 c0             	mov    eax,r8d
   2853a:	48 c1 e0 04          	shl    rax,0x4
   2853e:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   28542:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   28545:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   28549:	83 f8 f6             	cmp    eax,0xfffffff6
   2854c:	76 04                	jbe    28552 <JS_CallInternal+0x59b2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2854e:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 18)
   28552:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19463
   28556:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 18)
   2855a:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19463
   2855e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28564:	49 89 c5             	mov    r13,rax
   28567:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2856b:	ff e0                	jmp    rax
   2856d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19553
   28571:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19554
   28578:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   2857c:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   28580:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28587:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19553
   2858b:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19554
   2858f:	e8 6c b7 01 00       	call   43d00 <JS_ValueToAtom>
   28594:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19555 (discriminator 1)
   28597:	45 85 ed             	test   r13d,r13d
   2859a:	0f 84 a0 ad ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19557
   285a0:	48 83 ec 08          	sub    rsp,0x8
   285a4:	4c 8d 53 e0          	lea    r10,[rbx-0x20]
   285a8:	48 8d 43 d0          	lea    rax,[rbx-0x30]
   285ac:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   285b0:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   285b7:	4c 8b 4b d8          	mov    r9,QWORD PTR [rbx-0x28]
   285bb:	44 89 e9             	mov    ecx,r13d
   285be:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   285c2:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   285c9:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   285cd:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   285d4:	6a 00                	push   0x0
   285d6:	e8 65 4a 00 00       	call   2d040 <JS_GetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   285db:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   285e2:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19557
   285e9:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   285f0:	48 89 d0             	mov    rax,rdx
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   285f3:	5a                   	pop    rdx
   285f4:	59                   	pop    rcx
   285f5:	0f 8f 8f 1a 00 00    	jg     2a08a <JS_CallInternal+0x74ea>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19559 (discriminator 2)
   285fb:	83 f8 06             	cmp    eax,0x6
   285fe:	0f 84 3c ad ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19561
   28604:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   28608:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2860b:	83 fa f6             	cmp    edx,0xfffffff6
   2860e:	76 11                	jbe    28621 <JS_CallInternal+0x5a81>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28610:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   28613:	83 e9 01             	sub    ecx,0x1
   28616:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   28619:	85 c9                	test   ecx,ecx
   2861b:	0f 8e b7 29 00 00    	jle    2afd8 <JS_CallInternal+0x8438>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19562
   28621:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   28625:	49 8b 32             	mov    rsi,QWORD PTR [r10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28628:	83 fa f6             	cmp    edx,0xfffffff6
   2862b:	76 11                	jbe    2863e <JS_CallInternal+0x5a9e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2862d:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   28630:	83 e9 01             	sub    ecx,0x1
   28633:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   28636:	85 c9                	test   ecx,ecx
   28638:	0f 8e ec 2e 00 00    	jle    2b52a <JS_CallInternal+0x898a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19563
   2863e:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   28645:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   28649:	48 8b 31             	mov    rsi,QWORD PTR [rcx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2864c:	83 fa f6             	cmp    edx,0xfffffff6
   2864f:	76 11                	jbe    28662 <JS_CallInternal+0x5ac2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28651:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   28654:	83 e9 01             	sub    ecx,0x1
   28657:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   2865a:	85 c9                	test   ecx,ecx
   2865c:	0f 8e f9 2e 00 00    	jle    2b55b <JS_CallInternal+0x89bb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19564
   28662:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   28669:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19567
   2866d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19564
   28671:	48 89 4b d0          	mov    QWORD PTR [rbx-0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19567
   28675:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19565
   2867b:	4c 89 d3             	mov    rbx,r10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19567
   2867e:	49 89 c5             	mov    r13,rax
   28681:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28685:	ff e0                	jmp    rax
   28687:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19517
   2868b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19518
   28692:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   28696:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2869a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19517
   286a1:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19518
   286a5:	e8 56 b6 01 00       	call   43d00 <JS_ValueToAtom>
   286aa:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19519
   286ad:	45 85 ed             	test   r13d,r13d
   286b0:	0f 84 8a ac ff ff    	je     23340 <JS_CallInternal+0x7a0>
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:638
   286b6:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19521 (discriminator 2)
   286ba:	83 fa 03             	cmp    edx,0x3
   286bd:	0f 84 5a 35 00 00    	je     2bc1d <JS_CallInternal+0x907d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19526
   286c3:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   286c7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   286ce:	44 89 e9             	mov    ecx,r13d
   286d1:	e8 5a 5d 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19527 (discriminator 1)
   286d6:	85 c0                	test   eax,eax
   286d8:	0f 8e e0 34 00 00    	jle    2bbbe <JS_CallInternal+0x901e>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   286de:	48 83 ec 08          	sub    rsp,0x8
   286e2:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   286e6:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   286ea:	44 89 e9             	mov    ecx,r13d
   286ed:	6a 00                	push   0x0
   286ef:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   286f6:	4c 89 c6             	mov    rsi,r8
   286f9:	4c 89 ca             	mov    rdx,r9
   286fc:	e8 3f 49 00 00       	call   2d040 <JS_GetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   28701:	5e                   	pop    rsi
   28702:	5f                   	pop    rdi
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   28703:	48 89 c1             	mov    rcx,rax
   28706:	49 89 d6             	mov    r14,rdx
   28709:	48 89 d0             	mov    rax,rdx
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2870c:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   28713:	0f 8f 57 1b 00 00    	jg     2a270 <JS_CallInternal+0x76d0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19542 (discriminator 2)
   28719:	41 83 fe 06          	cmp    r14d,0x6
   2871d:	0f 84 1d ac ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19544
   28723:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19547
   28726:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19545
   2872a:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19544
   2872e:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19547
   28732:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28738:	49 89 c5             	mov    r13,rax
   2873b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2873f:	ff e0                	jmp    rax
   28741:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19575 (discriminator 1)
   28745:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
   28749:	0f 85 3f 14 00 00    	jne    29b8e <JS_CallInternal+0x6fee>
   2874f:	44 8b 5b e8          	mov    r11d,DWORD PTR [rbx-0x18]
   28753:	45 85 db             	test   r11d,r11d
   28756:	0f 85 32 14 00 00    	jne    29b8e <JS_CallInternal+0x6fee>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19577
   2875c:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19578
   28760:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19579 (discriminator 1)
   28764:	66 83 79 12 02       	cmp    WORD PTR [rcx+0x12],0x2
   28769:	0f 85 1f 14 00 00    	jne    29b8e <JS_CallInternal+0x6fee>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19581
   2876f:	8b 51 38             	mov    edx,DWORD PTR [rcx+0x38]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19581 (discriminator 1)
   28772:	39 d0                	cmp    eax,edx
   28774:	0f 83 f0 35 00 00    	jae    2bd6a <JS_CallInternal+0x91ca>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19603
   2877a:	89 c0                	mov    eax,eax
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   2877c:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19603
   28781:	48 c1 e0 04          	shl    rax,0x4
   28785:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   28789:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2878d:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   28790:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28793:	83 fa f6             	cmp    edx,0xfffffff6
   28796:	76 11                	jbe    287a9 <JS_CallInternal+0x5c09>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28798:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2879b:	83 e8 01             	sub    eax,0x1
   2879e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   287a1:	85 c0                	test   eax,eax
   287a3:	0f 8e 91 35 00 00    	jle    2bd3a <JS_CallInternal+0x919a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19605
   287a9:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   287ad:	48 83 eb 30          	sub    rbx,0x30
   287b1:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   287b4:	83 fa f6             	cmp    edx,0xfffffff6
   287b7:	76 11                	jbe    287ca <JS_CallInternal+0x5c2a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   287b9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   287bc:	83 e8 01             	sub    eax,0x1
   287bf:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   287c2:	85 c0                	test   eax,eax
   287c4:	0f 8e 46 35 00 00    	jle    2bd10 <JS_CallInternal+0x9170>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19617
   287ca:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   287cf:	49 83 c4 01          	add    r12,0x1
   287d3:	49 89 c5             	mov    r13,rax
   287d6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   287da:	ff e0                	jmp    rax
   287dc:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19119
   287e0:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19118
   287e4:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   287e8:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19119
   287ec:	0f 87 10 15 00 00    	ja     29d02 <JS_CallInternal+0x7162>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19120
   287f2:	31 c0                	xor    eax,eax
   287f4:	85 d2                	test   edx,edx
   287f6:	0f 95 c0             	setne  al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19124
   287f9:	85 c0                	test   eax,eax
   287fb:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   28802:	00 
   28803:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19126
   28806:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19124
   2880a:	0f b6 c0             	movzx  eax,al
   2880d:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19126
   28811:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28817:	49 89 c5             	mov    r13,rax
   2881a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2881e:	ff e0                	jmp    rax
   28820:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19085
   28824:	45 0f b6 34 24       	movzx  r14d,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19086
   28829:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19085
   28830:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19086
   28835:	4c 8b 43 c0          	mov    r8,QWORD PTR [rbx-0x40]
   28839:	4c 8b 4b c8          	mov    r9,QWORD PTR [rbx-0x38]
   2883d:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19087
   28841:	44 89 f0             	mov    eax,r14d
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   28844:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19087
   2884b:	83 e0 01             	and    eax,0x1
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   2884e:	4c 89 c6             	mov    rsi,r8
   28851:	4c 89 ca             	mov    rdx,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19087 (discriminator 1)
   28854:	3c 01                	cmp    al,0x1
   28856:	19 c9                	sbb    ecx,ecx
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   28858:	48 83 ec 08          	sub    rsp,0x8
   2885c:	6a 00                	push   0x0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19087 (discriminator 1)
   2885e:	83 e1 ef             	and    ecx,0xffffffef
   28861:	83 c1 17             	add    ecx,0x17
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   28864:	e8 d7 47 00 00       	call   2d040 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19089 (discriminator 1)
   28869:	41 5b                	pop    r11
   2886b:	59                   	pop    rcx
   2886c:	83 fa 06             	cmp    edx,0x6
   2886f:	0f 84 28 1d 00 00    	je     2a59d <JS_CallInternal+0x79fd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19091 (discriminator 1)
   28875:	8d 72 fe             	lea    esi,[rdx-0x2]
   28878:	b9 01 00 00 00       	mov    ecx,0x1
   2887d:	83 fe 01             	cmp    esi,0x1
   28880:	0f 87 8a 10 00 00    	ja     29910 <JS_CallInternal+0x6d70>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19108
   28886:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19111
   28889:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19109
   2888d:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19108
   28891:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   28898:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19111
   28899:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2889f:	49 89 c5             	mov    r13,rax
   288a2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   288a6:	ff e0                	jmp    rax
   288a8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18927
   288ac:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18929
   288b0:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18928
   288b4:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18927
   288b9:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   288bd:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18929
   288c0:	0f 87 14 14 00 00    	ja     29cda <JS_CallInternal+0x713a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18934
   288c6:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18935
   288ca:	85 c0                	test   eax,eax
   288cc:	75 0d                	jne    288db <JS_CallInternal+0x5d3b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18936
   288ce:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   288d3:	83 e8 01             	sub    eax,0x1
   288d6:	48 98                	cdqe
   288d8:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   288db:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   288e2:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   288e8:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   288ee:	83 e8 01             	sub    eax,0x1
   288f1:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   288f7:	85 c0                	test   eax,eax
   288f9:	0f 8e 2b 2f 00 00    	jle    2b82a <JS_CallInternal+0x8c8a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18941
   288ff:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28904:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28908:	49 89 c5             	mov    r13,rax
   2890b:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2890f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18907
   28913:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18909
   28917:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18908
   2891b:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18907
   28920:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28924:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18909
   28927:	0f 87 99 13 00 00    	ja     29cc6 <JS_CallInternal+0x7126>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18914
   2892d:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18915
   28931:	85 c0                	test   eax,eax
   28933:	74 0d                	je     28942 <JS_CallInternal+0x5da2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18916
   28935:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   2893a:	83 e8 01             	sub    eax,0x1
   2893d:	48 98                	cdqe
   2893f:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28942:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28949:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   2894f:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28955:	83 e8 01             	sub    eax,0x1
   28958:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   2895e:	85 c0                	test   eax,eax
   28960:	0f 8e 4f 2e 00 00    	jle    2b7b5 <JS_CallInternal+0x8c15>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18921
   28966:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2896b:	4d 8d 65 01          	lea    r12,[r13+0x1]
   2896f:	49 89 c5             	mov    r13,rax
   28972:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28976:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19015
   2897a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19016
   28981:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28988:	ba 01 00 00 00       	mov    edx,0x1
   2898d:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19015
   28990:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19016
   28994:	e8 57 d3 06 00       	call   95cf0 <js_for_of_start>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19016 (discriminator 1)
   28999:	85 c0                	test   eax,eax
   2899b:	0f 85 9f a9 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19019
   289a1:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   289a8:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19020
   289a9:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19019
   289ad:	48 83 c3 20          	add    rbx,0x20
   289b1:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   289b8:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19020
   289b9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   289bf:	49 89 c5             	mov    r13,rax
   289c2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   289c6:	ff e0                	jmp    rax
   289c8:	f3 0f 1e fa          	endbr64
   289cc:	e9 e3 a6 ff ff       	jmp    230b4 <JS_CallInternal+0x514>
   289d1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18835
   289d5:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18834
   289dc:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:181
   289e1:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18837
   289e5:	48 89 da             	mov    rdx,rbx
   289e8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18835
   289ef:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18837
   289f3:	e8 a8 5b 04 00       	call   6e5a0 <JS_GetGlobalVarRef>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18837 (discriminator 1)
   289f8:	85 c0                	test   eax,eax
   289fa:	0f 85 fb 3d 00 00    	jne    2c7fb <JS_CallInternal+0x9c5b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18841
   28a00:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18839
   28a06:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18841
   28a0a:	49 83 c4 05          	add    r12,0x5
   28a0e:	49 89 c5             	mov    r13,rax
   28a11:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28a15:	ff e0                	jmp    rax
   28a17:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   28a1b:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18769
   28a20:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18768
   28a27:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   28a2c:	48 89 c2             	mov    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18769
   28a2f:	48 c1 e0 04          	shl    rax,0x4
   28a33:	48 01 c8             	add    rax,rcx
   28a36:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18769 (discriminator 2)
   28a3a:	83 f9 04             	cmp    ecx,0x4
   28a3d:	0f 84 e0 25 00 00    	je     2b023 <JS_CallInternal+0x8483>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18773
   28a43:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28a47:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   28a4b:	83 fa f6             	cmp    edx,0xfffffff6
   28a4e:	76 04                	jbe    28a54 <JS_CallInternal+0x5eb4>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   28a50:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   28a54:	4c 8b 00             	mov    r8,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   28a57:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   28a5b:	48 89 30             	mov    QWORD PTR [rax],rsi
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28a5e:	83 f9 f6             	cmp    ecx,0xfffffff6
   28a61:	76 13                	jbe    28a76 <JS_CallInternal+0x5ed6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28a63:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   28a67:	83 e8 01             	sub    eax,0x1
   28a6a:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   28a6e:	85 c0                	test   eax,eax
   28a70:	0f 8e 20 1e 00 00    	jle    2a896 <JS_CallInternal+0x7cf6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18775
   28a76:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   28a7c:	49 83 c4 03          	add    r12,0x3
   28a80:	49 89 c5             	mov    r13,rax
   28a83:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28a87:	ff e0                	jmp    rax
   28a89:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19037
   28a8d:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   28a91:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   28a95:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28a99:	83 fa f6             	cmp    edx,0xfffffff6
   28a9c:	76 11                	jbe    28aaf <JS_CallInternal+0x5f0f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28a9e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28aa1:	83 e8 01             	sub    eax,0x1
   28aa4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28aa7:	85 c0                	test   eax,eax
   28aa9:	0f 8e a9 1b 00 00    	jle    2a658 <JS_CallInternal+0x7ab8>
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:638
   28aaf:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18054
   28ab3:	48 83 eb 30          	sub    rbx,0x30
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19039 (discriminator 1)
   28ab7:	83 f8 03             	cmp    eax,0x3
   28aba:	74 45                	je     28b01 <JS_CallInternal+0x5f61>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19040
   28abc:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19041
   28ac3:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   28ac6:	31 c9                	xor    ecx,ecx
   28ac8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   28acc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19040
   28ad3:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19041
   28ad7:	e8 24 87 00 00       	call   31200 <JS_IteratorClose>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19041 (discriminator 1)
   28adc:	85 c0                	test   eax,eax
   28ade:	0f 85 ba 43 00 00    	jne    2ce9e <JS_CallInternal+0xa2fe>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19043
   28ae4:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   28ae8:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28aeb:	83 fa f6             	cmp    edx,0xfffffff6
   28aee:	76 11                	jbe    28b01 <JS_CallInternal+0x5f61>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28af0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28af3:	83 e8 01             	sub    eax,0x1
   28af6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28af9:	85 c0                	test   eax,eax
   28afb:	0f 8e 9e 37 00 00    	jle    2c29f <JS_CallInternal+0x96ff>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19046
   28b01:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28b06:	49 83 c4 01          	add    r12,0x1
   28b0a:	49 89 c5             	mov    r13,rax
   28b0d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28b11:	ff e0                	jmp    rax
   28b13:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19028 (discriminator 2)
   28b17:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   28b1b:	0f 85 e8 24 00 00    	jne    2b009 <JS_CallInternal+0x8469>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19032
   28b21:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28b26:	49 83 c4 01          	add    r12,0x1
   28b2a:	49 89 c5             	mov    r13,rax
   28b2d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28b31:	ff e0                	jmp    rax
   28b33:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19051
   28b37:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   28b3b:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   28b3f:	48 8b 5b f8          	mov    rbx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19052
   28b43:	4c 39 b5 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],r14
   28b4a:	0f 83 f8 05 00 00    	jae    29148 <JS_CallInternal+0x65a8>
   28b50:	48 89 d8             	mov    rax,rbx
   28b53:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
   28b5a:	4c 89 f3             	mov    rbx,r14
   28b5d:	4c 8b a5 68 fe ff ff 	mov    r12,QWORD PTR [rbp-0x198]
   28b64:	49 89 c6             	mov    r14,rax
   28b67:	eb 10                	jmp    28b79 <JS_CallInternal+0x5fd9>
   28b69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   28b70:	49 39 dc             	cmp    r12,rbx
   28b73:	0f 83 bf 05 00 00    	jae    29138 <JS_CallInternal+0x6598>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19052 (discriminator 1)
   28b79:	83 7b f8 05          	cmp    DWORD PTR [rbx-0x8],0x5
   28b7d:	0f 84 b5 05 00 00    	je     29138 <JS_CallInternal+0x6598>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19054
   28b83:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   28b87:	48 83 eb 10          	sub    rbx,0x10
   28b8b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28b8e:	83 f9 f6             	cmp    ecx,0xfffffff6
   28b91:	76 dd                	jbe    28b70 <JS_CallInternal+0x5fd0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28b93:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28b96:	8d 50 ff             	lea    edx,[rax-0x1]
   28b99:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   28b9c:	85 d2                	test   edx,edx
   28b9e:	7f d0                	jg     28b70 <JS_CallInternal+0x5fd0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   28ba0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28ba7:	48 89 ca             	mov    rdx,rcx
   28baa:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   28bae:	e8 ed 3c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   28bb3:	eb bb                	jmp    28b70 <JS_CallInternal+0x5fd0>
   28bb5:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28bb9:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18855
   28bc0:	4d 0f be 2c 24       	movsx  r13,BYTE PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28bc5:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18855
   28bcb:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28bce:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28bd4:	83 e8 01             	sub    eax,0x1
   28bd7:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   28bdd:	85 c0                	test   eax,eax
   28bdf:	0f 8e 88 30 00 00    	jle    2bc6d <JS_CallInternal+0x90cd>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18858
   28be5:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28bea:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28bee:	49 89 c5             	mov    r13,rax
   28bf1:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28bf5:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28bf9:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18850 (discriminator 1)
   28c00:	4d 0f bf 2c 24       	movsx  r13,WORD PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28c05:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18850 (discriminator 1)
   28c0b:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28c0e:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28c14:	83 e8 01             	sub    eax,0x1
   28c17:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   28c1d:	85 c0                	test   eax,eax
   28c1f:	0f 8e e3 2a 00 00    	jle    2b708 <JS_CallInternal+0x8b68>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18853
   28c25:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28c2a:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28c2e:	49 89 c5             	mov    r13,rax
   28c31:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28c35:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19002
   28c39:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19000
   28c40:	41 0f b6 0c 24       	movzx  ecx,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19001
   28c45:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16710
   28c4a:	c7 85 f0 fe ff ff 01 	mov    DWORD PTR [rbp-0x110],0x1
   28c51:	00 00 00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19002
   28c54:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19000
   28c58:	b8 fd ff ff ff       	mov    eax,0xfffffffd
   28c5d:	29 c8                	sub    eax,ecx
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16712
   28c5f:	48 98                	cdqe
   28c61:	48 c1 e0 04          	shl    rax,0x4
   28c65:	4c 8d 2c 03          	lea    r13,[rbx+rax*1]
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:638
   28c69:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16712 (discriminator 2)
   28c6d:	83 fa 03             	cmp    edx,0x3
   28c70:	0f 84 52 2a 00 00    	je     2b6c8 <JS_CallInternal+0x8b28>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16713
   28c76:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   28c7b:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   28c7f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28c86:	4c 8d 8d f0 fe ff ff 	lea    r9,[rbp-0x110]
   28c8d:	29 c8                	sub    eax,ecx
   28c8f:	48 98                	cdqe
   28c91:	48 c1 e0 04          	shl    rax,0x4
   28c95:	48 01 d8             	add    rax,rbx
   28c98:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   28c9b:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   28c9f:	e8 3c e7 06 00       	call   973e0 <JS_IteratorNext.constprop.0>
   28ca4:	49 89 d1             	mov    r9,rdx
   28ca7:	48 89 c7             	mov    rdi,rax
   28caa:	48 89 d6             	mov    rsi,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16714 (discriminator 1)
   28cad:	83 fa 06             	cmp    edx,0x6
   28cb0:	0f 84 72 11 00 00    	je     29e28 <JS_CallInternal+0x7288>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16716
   28cb6:	8b 8d f0 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x110]
   28cbc:	31 d2                	xor    edx,edx
   28cbe:	85 c9                	test   ecx,ecx
   28cc0:	0f 85 71 11 00 00    	jne    29e37 <JS_CallInternal+0x7297>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16729
   28cc6:	48 89 3b             	mov    QWORD PTR [rbx],rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19007
   28cc9:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19005
   28ccd:	48 83 c3 20          	add    rbx,0x20
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16729
   28cd1:	48 89 73 e8          	mov    QWORD PTR [rbx-0x18],rsi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16730
   28cd5:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   28cd9:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   28ce0:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19007
   28ce1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28ce7:	49 89 c5             	mov    r13,rax
   28cea:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28cee:	ff e0                	jmp    rax
   28cf0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18781
   28cf4:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   28cf9:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18780
   28d00:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18781
   28d05:	48 c1 e0 04          	shl    rax,0x4
   28d09:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18781 (discriminator 2)
   28d0c:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   28d10:	0f 85 f2 23 00 00    	jne    2b108 <JS_CallInternal+0x8568>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   28d16:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18788
   28d1b:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18786
   28d1f:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   28d23:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18788
   28d26:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28d2c:	49 89 c5             	mov    r13,rax
   28d2f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d33:	ff e0                	jmp    rax
   28d35:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   28d39:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18756
   28d3e:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18755
   28d45:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:196
   28d4a:	48 89 c2             	mov    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18756
   28d4d:	48 c1 e0 04          	shl    rax,0x4
   28d51:	48 01 c8             	add    rax,rcx
   28d54:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18756 (discriminator 2)
   28d58:	83 f9 04             	cmp    ecx,0x4
   28d5b:	0f 84 8a 23 00 00    	je     2b0eb <JS_CallInternal+0x854b>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   28d61:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   28d66:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   28d69:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   28d6c:	83 f9 f6             	cmp    ecx,0xfffffff6
   28d6f:	76 11                	jbe    28d82 <JS_CallInternal+0x61e2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   28d71:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28d74:	83 e8 01             	sub    eax,0x1
   28d77:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28d7a:	85 c0                	test   eax,eax
   28d7c:	0f 8e 3c 20 00 00    	jle    2adbe <JS_CallInternal+0x821e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18763
   28d82:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18761
   28d88:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18763
   28d8c:	49 83 c4 03          	add    r12,0x3
   28d90:	49 89 c5             	mov    r13,rax
   28d93:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d97:	ff e0                	jmp    rax
   28d99:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18947
   28d9d:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:567
   28da1:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18948
   28da8:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18947
   28dac:	4c 01 e0             	add    rax,r12
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:567
   28daf:	2b 41 18             	sub    eax,DWORD PTR [rcx+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18947
   28db2:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   28db9:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18951
   28dba:	49 83 c4 05          	add    r12,0x5
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:567
   28dbe:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18951
   28dc2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28dc8:	49 89 c5             	mov    r13,rax
   28dcb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28dcf:	ff e0                	jmp    rax
   28dd1:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18865
   28dd5:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18867
   28dd9:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18866
   28ddd:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18865
   28de2:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28de6:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18867
   28de9:	0f 87 f7 0f 00 00    	ja     29de6 <JS_CallInternal+0x7246>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18872
   28def:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18873
   28df3:	85 c0                	test   eax,eax
   28df5:	74 0c                	je     28e03 <JS_CallInternal+0x6263>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18874 (discriminator 1)
   28df7:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   28dfb:	83 e8 04             	sub    eax,0x4
   28dfe:	48 98                	cdqe
   28e00:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900
   28e03:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28e0a:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   28e10:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28e16:	83 e8 01             	sub    eax,0x1
   28e19:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7900 (discriminator 1)
   28e1f:	85 c0                	test   eax,eax
   28e21:	0f 8e 1f 20 00 00    	jle    2ae46 <JS_CallInternal+0x82a6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18879
   28e27:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28e2c:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28e30:	49 89 c5             	mov    r13,rax
   28e33:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   28e37:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28e3a:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28e41:	0f 85 cd f5 ff ff    	jne    28414 <JS_CallInternal+0x5874>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 1)
   28e47:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28e4b:	0f 85 e0 04 00 00    	jne    29331 <JS_CallInternal+0x6791>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 14)
   28e51:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28e55:	48 85 c9             	test   rcx,rcx
   28e58:	0f 85 92 f5 ff ff    	jne    283f0 <JS_CallInternal+0x5850>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   28e5e:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 15)
   28e62:	b9 03 00 00 00       	mov    ecx,0x3
   28e67:	45 31 f6             	xor    r14d,r14d
   28e6a:	e9 e2 f5 ff ff       	jmp    28451 <JS_CallInternal+0x58b1>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   28e6f:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28e72:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28e79:	0f 85 44 f4 ff ff    	jne    282c3 <JS_CallInternal+0x5723>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 1)
   28e7f:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28e83:	0f 85 fa 04 00 00    	jne    29383 <JS_CallInternal+0x67e3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 14)
   28e89:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28e8d:	48 85 c9             	test   rcx,rcx
   28e90:	0f 85 0a f4 ff ff    	jne    282a0 <JS_CallInternal+0x5700>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 15)
   28e96:	ba 03 00 00 00       	mov    edx,0x3
   28e9b:	31 c0                	xor    eax,eax
   28e9d:	e9 58 f4 ff ff       	jmp    282fa <JS_CallInternal+0x575a>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   28ea2:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28ea5:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28eac:	0f 85 b1 f4 ff ff    	jne    28363 <JS_CallInternal+0x57c3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 1)
   28eb2:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28eb6:	0f 85 7d 05 00 00    	jne    29439 <JS_CallInternal+0x6899>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 14)
   28ebc:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28ec0:	48 85 c9             	test   rcx,rcx
   28ec3:	0f 85 77 f4 ff ff    	jne    28340 <JS_CallInternal+0x57a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   28ec9:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 15)
   28ecd:	41 b8 03 00 00 00    	mov    r8d,0x3
   28ed3:	31 c0                	xor    eax,eax
   28ed5:	e9 c5 f4 ff ff       	jmp    2839f <JS_CallInternal+0x57ff>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   28eda:	44 8b 09             	mov    r9d,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28edd:	41 81 e1 ff ff ff 03 	and    r9d,0x3ffffff
   28ee4:	0f 85 c4 b2 ff ff    	jne    241ae <JS_CallInternal+0x160e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   28eea:	f6 46 10 08          	test   BYTE PTR [rsi+0x10],0x8
   28eee:	0f 85 f1 05 00 00    	jne    294e5 <JS_CallInternal+0x6945>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 35)
   28ef4:	48 8b 72 30          	mov    rsi,QWORD PTR [rdx+0x30]
   28ef8:	48 85 f6             	test   rsi,rsi
   28efb:	0f 84 7d 16 00 00    	je     2a57e <JS_CallInternal+0x79de>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   28f01:	48 8b 56 18          	mov    rdx,QWORD PTR [rsi+0x18]
   28f05:	e9 86 b2 ff ff       	jmp    24190 <JS_CallInternal+0x15f0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   28f0a:	8b 3a                	mov    edi,DWORD PTR [rdx]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   28f0c:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28f12:	0f 85 8d b1 ff ff    	jne    240a5 <JS_CallInternal+0x1505>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   28f18:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28f1c:	0f 85 6a 05 00 00    	jne    2948c <JS_CallInternal+0x68ec>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 35)
   28f22:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
   28f26:	48 85 c9             	test   rcx,rcx
   28f29:	0f 84 61 16 00 00    	je     2a590 <JS_CallInternal+0x79f0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   28f2f:	48 8b 41 18          	mov    rax,QWORD PTR [rcx+0x18]
   28f33:	e9 50 b1 ff ff       	jmp    24088 <JS_CallInternal+0x14e8>
min_int():
/home/mzyx/read_ic_dequickening_attempt01/R/cutils.h:90
   28f38:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28f3e:	39 f7                	cmp    edi,esi
   28f40:	41 89 f5             	mov    r13d,esi
   28f43:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17871 (discriminator 1)
   28f47:	45 85 ed             	test   r13d,r13d
   28f4a:	0f 8e 9e 14 00 00    	jle    2a3ee <JS_CallInternal+0x784e>
   28f50:	4c 8b bd a8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x158]
   28f57:	4d 63 f5             	movsxd r14,r13d
   28f5a:	4d 8d 43 08          	lea    r8,[r11+0x8]
   28f5e:	49 c1 e6 04          	shl    r14,0x4
   28f62:	4c 89 fe             	mov    rsi,r15
   28f65:	4d 01 fe             	add    r14,r15
   28f68:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   28f6f:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17872
   28f70:	4c 8b 66 08          	mov    r12,QWORD PTR [rsi+0x8]
   28f74:	4c 8b 3e             	mov    r15,QWORD PTR [rsi]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   28f77:	41 83 fc f6          	cmp    r12d,0xfffffff6
   28f7b:	76 05                	jbe    28f82 <JS_CallInternal+0x63e2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   28f7d:	41 83 47 fc 01       	add    DWORD PTR [r15-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17871 (discriminator 1)
   28f82:	48 83 c6 10          	add    rsi,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17872
   28f86:	4d 89 78 f8          	mov    QWORD PTR [r8-0x8],r15
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17871 (discriminator 1)
   28f8a:	49 83 c0 10          	add    r8,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17872
   28f8e:	4d 89 60 f0          	mov    QWORD PTR [r8-0x10],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17871 (discriminator 1)
   28f92:	4c 39 f6             	cmp    rsi,r14
   28f95:	75 d9                	jne    28f70 <JS_CallInternal+0x63d0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17873 (discriminator 1)
   28f97:	44 39 ef             	cmp    edi,r13d
   28f9a:	7e 3c                	jle    28fd8 <JS_CallInternal+0x6438>
   28f9c:	44 8d 47 ff          	lea    r8d,[rdi-0x1]
   28fa0:	4d 63 e5             	movsxd r12,r13d
   28fa3:	45 29 e8             	sub    r8d,r13d
   28fa6:	4c 89 e6             	mov    rsi,r12
   28fa9:	4d 01 e0             	add    r8,r12
   28fac:	48 c1 e6 04          	shl    rsi,0x4
   28fb0:	49 c1 e0 04          	shl    r8,0x4
   28fb4:	4c 01 de             	add    rsi,r11
   28fb7:	4f 8d 44 03 10       	lea    r8,[r11+r8*1+0x10]
   28fbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17874
   28fc0:	48 c7 06 00 00 00 00 	mov    QWORD PTR [rsi],0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17873 (discriminator 1)
   28fc7:	48 83 c6 10          	add    rsi,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17874
   28fcb:	48 c7 46 f8 03 00 00 	mov    QWORD PTR [rsi-0x8],0x3
   28fd2:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17873 (discriminator 1)
   28fd3:	4c 39 c6             	cmp    rsi,r8
   28fd6:	75 e8                	jne    28fc0 <JS_CallInternal+0x6420>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17875
   28fd8:	89 bd 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17870
   28fde:	4c 89 9d 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],r11
   28fe5:	e9 94 9d ff ff       	jmp    22d7e <JS_CallInternal+0x1de>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   28fea:	48 83 ec 08          	sub    rsp,0x8
   28fee:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   28ff4:	49 89 d1             	mov    r9,rdx
   28ff7:	48 89 c6             	mov    rsi,rax
   28ffa:	6a 00                	push   0x0
   28ffc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29003:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2900a:	e8 31 40 00 00       	call   2d040 <JS_GetPropertyInternal>
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16020
   2900f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29016:	48 89 c6             	mov    rsi,rax
   29019:	e8 92 5b ff ff       	call   1ebb0 <JS_ToBoolFree>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2901e:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16020
   29025:	89 c1                	mov    ecx,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29027:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   2902b:	83 e8 01             	sub    eax,0x1
   2902e:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   29032:	41 5b                	pop    r11
   29034:	5a                   	pop    rdx
   29035:	85 c0                	test   eax,eax
   29037:	0f 8e 85 37 00 00    	jle    2c7c2 <JS_CallInternal+0x9c22>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20536 (discriminator 1)
   2903d:	85 c9                	test   ecx,ecx
   2903f:	0f 88 61 a6 ff ff    	js     236a6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20538
   29045:	0f 84 f8 9e ff ff    	je     22f43 <JS_CallInternal+0x3a3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20609
   2904b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2904f:	48 83 eb 10          	sub    rbx,0x10
   29053:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29056:	83 fa f6             	cmp    edx,0xfffffff6
   29059:	0f 86 20 a4 ff ff    	jbe    2347f <JS_CallInternal+0x8df>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2905f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29062:	83 e8 01             	sub    eax,0x1
   29065:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29068:	85 c0                	test   eax,eax
   2906a:	0f 8f 0f a4 ff ff    	jg     2347f <JS_CallInternal+0x8df>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   29070:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29077:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2907b:	e8 20 38 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20610
   29080:	e9 fa a3 ff ff       	jmp    2347f <JS_CallInternal+0x8df>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18256
   29085:	8b 85 38 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c8]
   2908b:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   29092:	4c 8b a5 40 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c0]
   29099:	83 c0 02             	add    eax,0x2
   2909c:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18259
   2909e:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18256
   290a2:	48 c1 e0 04          	shl    rax,0x4
   290a6:	48 29 c3             	sub    rbx,rax
   290a9:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18257
   290ac:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   290b0:	4c 89 2a             	mov    QWORD PTR [rdx],r13
   290b3:	4c 89 72 08          	mov    QWORD PTR [rdx+0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18259
   290b7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   290bd:	49 89 c5             	mov    r13,rax
   290c0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   290c4:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19380
   290c6:	80 fa 01             	cmp    dl,0x1
   290c9:	0f 84 01 03 00 00    	je     293d0 <JS_CallInternal+0x6830>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19385
   290cf:	80 cc 10             	or     ah,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19384
   290d2:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   290d7:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19385
   290dd:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   290e3:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   290e7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19384
   290ee:	0f 29 95 e0 fd ff ff 	movaps XMMWORD PTR [rbp-0x220],xmm2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19387
   290f5:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   290fc:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   29101:	48 89 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   29108:	e8 83 78 01 00       	call   40990 <js_get_function_name>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5941
   2910d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29114:	4c 8d 05 29 40 0a 00 	lea    r8,[rip+0xa4029]        # cd144 <_IO_stdin_used+0x144>
   2911b:	48 8d 35 77 44 0a 00 	lea    rsi,[rip+0xa4477]        # cd599 <_IO_stdin_used+0x599>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   29122:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5941
   29125:	48 89 c2             	mov    rdx,rax
   29128:	4c 89 c9             	mov    rcx,r9
   2912b:	e8 f0 76 01 00       	call   40820 <JS_ConcatString3>
   29130:	49 89 d1             	mov    r9,rdx
   29133:	e9 64 a8 ff ff       	jmp    2399c <JS_CallInternal+0xdfc>
   29138:	4c 89 f0             	mov    rax,r14
   2913b:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   29142:	49 89 de             	mov    r14,rbx
   29145:	48 89 c3             	mov    rbx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19056 (discriminator 1)
   29148:	48 8b 85 68 fe ff ff 	mov    rax,QWORD PTR [rbp-0x198]
   2914f:	49 39 c6             	cmp    r14,rax
   29152:	0f 84 29 27 00 00    	je     2b881 <JS_CallInternal+0x8ce1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19061
   29158:	4d 89 6e f0          	mov    QWORD PTR [r14-0x10],r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19063
   2915c:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19061
   29160:	49 89 5e f8          	mov    QWORD PTR [r14-0x8],rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19063
   29164:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2916a:	4c 89 f3             	mov    rbx,r14
   2916d:	49 89 c5             	mov    r13,rax
   29170:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   29174:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18408
   29176:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18411
   2917c:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18408
   29180:	83 c0 01             	add    eax,0x1
   29183:	48 98                	cdqe
   29185:	48 c1 e0 04          	shl    rax,0x4
   29189:	48 29 c3             	sub    rbx,rax
   2918c:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18409
   2918f:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   29193:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   29196:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18411
   2919a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   291a0:	49 89 c5             	mov    r13,rax
   291a3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   291a7:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18237
   291a9:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18240
   291af:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18237
   291b3:	83 c0 02             	add    eax,0x2
   291b6:	48 98                	cdqe
   291b8:	48 c1 e0 04          	shl    rax,0x4
   291bc:	48 29 c3             	sub    rbx,rax
   291bf:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18238
   291c2:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   291c6:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   291c9:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18240
   291cd:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   291d3:	49 89 c5             	mov    r13,rax
   291d6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   291da:	ff e0                	jmp    rax
free_arg_list():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18240
   291dc:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
   291e3:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
js_free_rt():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:1816
   291ea:	4c 89 f6             	mov    rsi,r14
   291ed:	e8 ae b8 fe ff       	call   14aa0 <__js_free>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18438 (discriminator 2)
   291f2:	41 83 fd 06          	cmp    r13d,0x6
   291f6:	0f 84 50 14 00 00    	je     2a64c <JS_CallInternal+0x7aac>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18440
   291fc:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29200:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29204:	83 fa f6             	cmp    edx,0xfffffff6
   29207:	76 11                	jbe    2921a <JS_CallInternal+0x667a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29209:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2920c:	83 e8 01             	sub    eax,0x1
   2920f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29212:	85 c0                	test   eax,eax
   29214:	0f 8e 36 16 00 00    	jle    2a850 <JS_CallInternal+0x7cb0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18441
   2921a:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   29221:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   29225:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29228:	83 fa f6             	cmp    edx,0xfffffff6
   2922b:	76 11                	jbe    2923e <JS_CallInternal+0x669e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2922d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29230:	83 e8 01             	sub    eax,0x1
   29233:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29236:	85 c0                	test   eax,eax
   29238:	0f 8e 98 1b 00 00    	jle    2add6 <JS_CallInternal+0x8236>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18443
   2923e:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   29245:	4c 89 6b e8          	mov    QWORD PTR [rbx-0x18],r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18445
   29249:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18443
   2924d:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18445
   29251:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18443
   29257:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18445
   2925e:	49 89 c5             	mov    r13,rax
   29261:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   29265:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   29267:	8b 10                	mov    edx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   29269:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   2926f:	0f 85 bb d9 ff ff    	jne    26c30 <JS_CallInternal+0x4090>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8420
   29275:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2927c:	89 f2                	mov    edx,esi
   2927e:	b9 07 00 00 00       	mov    ecx,0x7
   29283:	4c 89 c6             	mov    rsi,r8
   29286:	e8 35 d1 01 00       	call   463c0 <add_property>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8421 (discriminator 1)
   2928b:	48 85 c0             	test   rax,rax
   2928e:	0f 84 c8 d9 ff ff    	je     26c5c <JS_CallInternal+0x40bc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8426
   29294:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2929b:	4c 89 28             	mov    QWORD PTR [rax],r13
   2929e:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19285
   292a2:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   292a6:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   292a9:	83 fa f6             	cmp    edx,0xfffffff6
   292ac:	76 11                	jbe    292bf <JS_CallInternal+0x671f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   292ae:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   292b1:	83 e8 01             	sub    eax,0x1
   292b4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   292b7:	85 c0                	test   eax,eax
   292b9:	0f 8e 72 1b 00 00    	jle    2ae31 <JS_CallInternal+0x8291>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19290
   292bf:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19286
   292c4:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19290
   292c7:	49 83 c4 01          	add    r12,0x1
   292cb:	49 89 c5             	mov    r13,rax
   292ce:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   292d2:	ff e0                	jmp    rax
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19290
   292d4:	ba 08 00 00 00       	mov    edx,0x8
   292d9:	e9 a1 e2 ff ff       	jmp    2757f <JS_CallInternal+0x49df>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   292de:	81 bd 50 fe ff ff f2 	cmp    DWORD PTR [rbp-0x1b0],0xf2
   292e5:	00 00 00 
   292e8:	0f 8f b3 10 00 00    	jg     2a3a1 <JS_CallInternal+0x7801>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19395
   292ee:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   292f2:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   292f6:	83 fa f6             	cmp    edx,0xfffffff6
   292f9:	0f 86 a3 a7 ff ff    	jbe    23aa2 <JS_CallInternal+0xf02>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   292ff:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29302:	83 e8 01             	sub    eax,0x1
   29305:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29308:	85 c0                	test   eax,eax
   2930a:	0f 8f 92 a7 ff ff    	jg     23aa2 <JS_CallInternal+0xf02>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   29310:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29317:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2931d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29321:	e8 7a 35 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   29326:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2932c:	e9 71 a7 ff ff       	jmp    23aa2 <JS_CallInternal+0xf02>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 13)
   29331:	48 89 ce             	mov    rsi,rcx
   29334:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 12)
   2933b:	48 83 ec 08          	sub    rsp,0x8
   2933f:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29343:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29347:	48 89 fa             	mov    rdx,rdi
   2934a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29351:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29358:	b9 32 00 00 00       	mov    ecx,0x32
   2935d:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   29361:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29365:	6a 00                	push   0x0
   29367:	e8 d4 3c 00 00       	call   2d040 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 3)
   2936c:	5f                   	pop    rdi
   2936d:	41 58                	pop    r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 12)
   2936f:	49 89 c6             	mov    r14,rax
   29372:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19196 (discriminator 3)
   29375:	83 fa 06             	cmp    edx,0x6
   29378:	0f 85 d3 f0 ff ff    	jne    28451 <JS_CallInternal+0x58b1>
   2937e:	e9 bd 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 13)
   29383:	49 89 ca             	mov    r10,rcx
   29386:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 12)
   2938d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29394:	48 83 ec 08          	sub    rsp,0x8
   29398:	48 89 fa             	mov    rdx,rdi
   2939b:	89 f1                	mov    ecx,esi
   2939d:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   293a1:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   293a5:	4c 89 d6             	mov    rsi,r10
   293a8:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   293ac:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293b3:	6a 00                	push   0x0
   293b5:	e8 86 3c 00 00       	call   2d040 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 3)
   293ba:	41 59                	pop    r9
   293bc:	41 5a                	pop    r10
   293be:	83 fa 06             	cmp    edx,0x6
   293c1:	0f 85 33 ef ff ff    	jne    282fa <JS_CallInternal+0x575a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19191 (discriminator 1)
   293c7:	4d 89 ec             	mov    r12,r13
   293ca:	e9 71 9f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   293cf:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19382
   293d0:	80 cc 08             	or     ah,0x8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19381
   293d3:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   293d8:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19382
   293de:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   293e4:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   293e8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19381
   293ef:	0f 29 bd 10 fe ff ff 	movaps XMMWORD PTR [rbp-0x1f0],xmm7
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19387
   293f6:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   293fd:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   29402:	48 89 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   29409:	e8 82 75 01 00       	call   40990 <js_get_function_name>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5939
   2940e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29415:	4c 8d 05 28 3d 0a 00 	lea    r8,[rip+0xa3d28]        # cd144 <_IO_stdin_used+0x144>
   2941c:	48 8d 35 71 41 0a 00 	lea    rsi,[rip+0xa4171]        # cd594 <_IO_stdin_used+0x594>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5937
   29423:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5939
   29426:	48 89 c2             	mov    rdx,rax
   29429:	4c 89 c9             	mov    rcx,r9
   2942c:	e8 ef 73 01 00       	call   40820 <JS_ConcatString3>
   29431:	49 89 d1             	mov    r9,rdx
   29434:	e9 63 a5 ff ff       	jmp    2399c <JS_CallInternal+0xdfc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 13)
   29439:	49 89 ca             	mov    r10,rcx
   2943c:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 12)
   29443:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2944a:	48 83 ec 08          	sub    rsp,0x8
   2944e:	48 89 fa             	mov    rdx,rdi
   29451:	89 f1                	mov    ecx,esi
   29453:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29457:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2945b:	4c 89 d6             	mov    rsi,r10
   2945e:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   29462:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   29466:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2946d:	6a 00                	push   0x0
   2946f:	e8 cc 3b 00 00       	call   2d040 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 3)
   29474:	41 5b                	pop    r11
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 12)
   29476:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 3)
   29479:	5a                   	pop    rdx
   2947a:	41 83 f8 06          	cmp    r8d,0x6
   2947e:	0f 85 1b ef ff ff    	jne    2839f <JS_CallInternal+0x57ff>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19187 (discriminator 1)
   29484:	4d 89 f4             	mov    r12,r14
   29487:	e9 b4 9e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 34)
   2948c:	49 89 ce             	mov    r14,rcx
   2948f:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 24)
   29496:	48 83 ec 08          	sub    rsp,0x8
   2949a:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2949e:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   294a2:	4c 89 f6             	mov    rsi,r14
   294a5:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   294ac:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   294b3:	4c 89 d2             	mov    rdx,r10
   294b6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   294bd:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
   294c1:	44 89 e9             	mov    ecx,r13d
   294c4:	6a 00                	push   0x0
   294c6:	e8 75 3b 00 00       	call   2d040 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 3)
   294cb:	59                   	pop    rcx
   294cc:	5e                   	pop    rsi
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 24)
   294cd:	49 89 d5             	mov    r13,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 3)
   294d0:	83 fa 06             	cmp    edx,0x6
   294d3:	0f 85 17 ac ff ff    	jne    240f0 <JS_CallInternal+0x1550>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   294d9:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   294e0:	e9 5b 9e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 34)
   294e5:	49 89 f6             	mov    r14,rsi
   294e8:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 24)
   294ef:	48 83 ec 08          	sub    rsp,0x8
   294f3:	4c 8d 53 f0          	lea    r10,[rbx-0x10]
   294f7:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   294fb:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   294ff:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   29506:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   2950d:	4c 89 f6             	mov    rsi,r14
   29510:	48 89 c2             	mov    rdx,rax
   29513:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2951a:	48 89 79 30          	mov    QWORD PTR [rcx+0x30],rdi
   2951e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29525:	44 89 e9             	mov    ecx,r13d
   29528:	6a 00                	push   0x0
   2952a:	e8 11 3b 00 00       	call   2d040 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 3)
   2952f:	5f                   	pop    rdi
   29530:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   29537:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 24)
   2953a:	49 89 d5             	mov    r13,rdx
   2953d:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 3)
   29540:	41 58                	pop    r8
   29542:	0f 85 b4 ac ff ff    	jne    241fc <JS_CallInternal+0x165c>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   29548:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2954f:	e9 ec 9d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18215 (discriminator 1)
   29554:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2955b:	e9 e0 9d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20112
   29560:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   29567:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2956b:	83 fa f6             	cmp    edx,0xfffffff6
   2956e:	76 04                	jbe    29574 <JS_CallInternal+0x69d4>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   29570:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20116
   29574:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20115
   2957b:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20116
   29582:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   29589:	ba 8c 00 00 00       	mov    edx,0x8c
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20115
   2958e:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20116
   29595:	e8 26 bf 02 00       	call   554c0 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20116 (discriminator 1)
   2959a:	85 c0                	test   eax,eax
   2959c:	0f 85 49 37 00 00    	jne    2cceb <JS_CallInternal+0xa14b>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   295a2:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   295a6:	66 0f 6f a5 f0 fe ff 	movdqa xmm4,XMMWORD PTR [rbp-0x110]
   295ad:	ff 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   295ae:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   295b2:	41 0f 11 65 00       	movups XMMWORD PTR [r13+0x0],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   295b7:	83 fa f6             	cmp    edx,0xfffffff6
   295ba:	0f 86 37 e0 ff ff    	jbe    275f7 <JS_CallInternal+0x4a57>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   295c0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   295c3:	83 e8 01             	sub    eax,0x1
   295c6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   295c9:	85 c0                	test   eax,eax
   295cb:	0f 8f 26 e0 ff ff    	jg     275f7 <JS_CallInternal+0x4a57>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   295d1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   295d8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   295dc:	e8 bf 32 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   295e1:	e9 11 e0 ff ff       	jmp    275f7 <JS_CallInternal+0x4a57>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20086
   295e6:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   295ed:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   295f1:	83 fa f6             	cmp    edx,0xfffffff6
   295f4:	76 04                	jbe    295fa <JS_CallInternal+0x6a5a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   295f6:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20090
   295fa:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20089
   29601:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20090
   29608:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   2960f:	ba 8d 00 00 00       	mov    edx,0x8d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20089
   29614:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20090
   2961b:	e8 a0 be 02 00       	call   554c0 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20090 (discriminator 1)
   29620:	85 c0                	test   eax,eax
   29622:	0f 85 88 38 00 00    	jne    2ceb0 <JS_CallInternal+0xa310>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   29628:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   2962c:	66 0f 6f 9d f0 fe ff 	movdqa xmm3,XMMWORD PTR [rbp-0x110]
   29633:	ff 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   29634:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   29638:	41 0f 11 5d 00       	movups XMMWORD PTR [r13+0x0],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2963d:	83 fa f6             	cmp    edx,0xfffffff6
   29640:	0f 86 bd dc ff ff    	jbe    27303 <JS_CallInternal+0x4763>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29646:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29649:	83 e8 01             	sub    eax,0x1
   2964c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2964f:	85 c0                	test   eax,eax
   29651:	0f 8f ac dc ff ff    	jg     27303 <JS_CallInternal+0x4763>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   29657:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2965e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29662:	e8 39 32 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   29667:	e9 97 dc ff ff       	jmp    27303 <JS_CallInternal+0x4763>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2966c:	83 bd 88 fe ff ff f6 	cmp    DWORD PTR [rbp-0x178],0xfffffff6
   29673:	0f 86 0b c1 ff ff    	jbe    25784 <JS_CallInternal+0x2be4>
   29679:	e9 fb c0 ff ff       	jmp    25779 <JS_CallInternal+0x2bd9>
   2967e:	66 90                	xchg   ax,ax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20699
   29680:	45 85 ed             	test   r13d,r13d
   29683:	0f 85 c1 31 00 00    	jne    2c84a <JS_CallInternal+0x9caa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20701
   29689:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2968d:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29691:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29695:	83 fa f6             	cmp    edx,0xfffffff6
   29698:	76 11                	jbe    296ab <JS_CallInternal+0x6b0b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2969a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2969d:	83 e8 01             	sub    eax,0x1
   296a0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   296a3:	85 c0                	test   eax,eax
   296a5:	0f 8e d4 2d 00 00    	jle    2c47f <JS_CallInternal+0x98df>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20703
   296ab:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   296af:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   296b3:	b9 01 00 00 00       	mov    ecx,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20702
   296b8:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20703
   296bb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   296c2:	e8 39 7b 00 00       	call   31200 <JS_IteratorClose>
   296c7:	e9 11 9e ff ff       	jmp    234dd <JS_CallInternal+0x93d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19985
   296cc:	83 fa 08             	cmp    edx,0x8
   296cf:	0f 85 31 0c 00 00    	jne    2a306 <JS_CallInternal+0x7766>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19986
   296d5:	66 48 0f 6e c0       	movq   xmm0,rax
   296da:	66 0f 57 05 1e 14 0b 	xorpd  xmm0,XMMWORD PTR [rip+0xb141e]        # dab00 <typed_array_size_log2+0x28>
   296e1:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19988
   296e2:	48 c7 43 f8 08 00 00 	mov    QWORD PTR [rbx-0x8],0x8
   296e9:	00 
   296ea:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
   296ef:	e9 08 de ff ff       	jmp    274fc <JS_CallInternal+0x495c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20486
   296f4:	85 c0                	test   eax,eax
   296f6:	0f 84 1c b9 ff ff    	je     25018 <JS_CallInternal+0x2478>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20492
   296fc:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:13688
   29703:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29707:	b9 01 00 00 00       	mov    ecx,0x1
   2970c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29710:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20492
   29717:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:13688
   2971b:	e8 00 6a 01 00       	call   40120 <JS_ToStringInternal>
   29720:	48 89 c1             	mov    rcx,rax
   29723:	49 89 d5             	mov    r13,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20494 (discriminator 1)
   29726:	83 fa 06             	cmp    edx,0x6
   29729:	0f 84 11 9c ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20496
   2972f:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29733:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29737:	83 fa f6             	cmp    edx,0xfffffff6
   2973a:	76 11                	jbe    2974d <JS_CallInternal+0x6bad>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2973c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2973f:	83 e8 01             	sub    eax,0x1
   29742:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29745:	85 c0                	test   eax,eax
   29747:	0f 8e 00 2a 00 00    	jle    2c14d <JS_CallInternal+0x95ad>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20497
   2974d:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   29751:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20498
   29755:	e9 be b8 ff ff       	jmp    25018 <JS_CallInternal+0x2478>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19333
   2975a:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2975e:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29762:	4c 89 f1             	mov    rcx,r14
   29765:	4d 89 e8             	mov    r8,r13
   29768:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2976f:	41 b9 01 00 00 00    	mov    r9d,0x1
   29775:	e8 26 2f 01 00       	call   3c6a0 <JS_SetPrototypeInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19333 (discriminator 1)
   2977a:	85 c0                	test   eax,eax
   2977c:	0f 89 7f dc ff ff    	jns    27401 <JS_CallInternal+0x4861>
   29782:	e9 b9 9b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29787:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2978e:	00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 4)
   29790:	41 83 fe 08          	cmp    r14d,0x8
   29794:	0f 85 b7 0b 00 00    	jne    2a351 <JS_CallInternal+0x77b1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 5)
   2979a:	66 0f ef c0          	pxor   xmm0,xmm0
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2979e:	66 49 0f 6e f5       	movq   xmm6,r13
   297a3:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 5)
   297a5:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   297a9:	ba 01 00 00 00       	mov    edx,0x1
   297ae:	66 0f 2e c6          	ucomisd xmm0,xmm6
   297b2:	0f 9a c0             	setp   al
   297b5:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   297b9:	e9 38 e0 ff ff       	jmp    277f6 <JS_CallInternal+0x4c56>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 4)
   297be:	41 83 f8 08          	cmp    r8d,0x8
   297c2:	0f 85 44 0a 00 00    	jne    2a20c <JS_CallInternal+0x766c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 5)
   297c8:	66 0f ef c0          	pxor   xmm0,xmm0
   297cc:	66 49 0f 6e f9       	movq   xmm7,r9
   297d1:	31 c0                	xor    eax,eax
   297d3:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   297d8:	66 0f 2e c7          	ucomisd xmm0,xmm7
   297dc:	0f 9b c0             	setnp  al
   297df:	41 0f 45 c5          	cmovne eax,r13d
   297e3:	e9 75 d2 ff ff       	jmp    26a5d <JS_CallInternal+0x3ebd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 4)
   297e8:	41 83 fe 08          	cmp    r14d,0x8
   297ec:	0f 85 76 0b 00 00    	jne    2a368 <JS_CallInternal+0x77c8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 5)
   297f2:	66 0f ef c0          	pxor   xmm0,xmm0
   297f6:	66 49 0f 6e dd       	movq   xmm3,r13
   297fb:	31 c0                	xor    eax,eax
   297fd:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   29801:	ba 00 00 00 00       	mov    edx,0x0
   29806:	66 0f 2e c3          	ucomisd xmm0,xmm3
   2980a:	0f 9b c0             	setnp  al
   2980d:	48 0f 45 c2          	cmovne rax,rdx
   29811:	e9 34 e0 ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 4)
   29816:	41 83 f8 08          	cmp    r8d,0x8
   2981a:	0f 85 20 0a 00 00    	jne    2a240 <JS_CallInternal+0x76a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 5)
   29820:	66 0f ef c0          	pxor   xmm0,xmm0
   29824:	66 49 0f 6e d1       	movq   xmm2,r9
   29829:	ba 00 00 00 00       	mov    edx,0x0
   2982e:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   29833:	66 0f 2e c2          	ucomisd xmm0,xmm2
   29837:	0f 9b c0             	setnp  al
   2983a:	0f 45 c2             	cmovne eax,edx
   2983d:	e9 7b d2 ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   29842:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29849:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2984d:	e8 4e 30 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   29852:	e9 85 b6 ff ff       	jmp    24edc <JS_CallInternal+0x233c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20008
   29857:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20009
   2985e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29865:	44 89 ea             	mov    edx,r13d
   29868:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20008
   2986b:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20009
   2986f:	e8 4c bc 02 00       	call   554c0 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20009 (discriminator 1)
   29874:	85 c0                	test   eax,eax
   29876:	0f 84 f0 d4 ff ff    	je     26d6c <JS_CallInternal+0x41cc>
   2987c:	e9 bf 9a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29881:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19358
   29888:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2988c:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29890:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29897:	e8 64 a4 01 00       	call   43d00 <JS_ValueToAtom>
   2989c:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19359 (discriminator 1)
   298a2:	85 c0                	test   eax,eax
   298a4:	0f 84 96 9a ff ff    	je     23340 <JS_CallInternal+0x7a0>
   298aa:	4d 89 e5             	mov    r13,r12
   298ad:	e9 1c a0 ff ff       	jmp    238ce <JS_CallInternal+0xd2e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20063
   298b2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20064
   298b9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298c0:	44 89 ea             	mov    edx,r13d
   298c3:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20063
   298c6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20064
   298ca:	e8 91 c0 02 00       	call   55960 <js_post_inc_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20064 (discriminator 1)
   298cf:	85 c0                	test   eax,eax
   298d1:	0f 84 6d da ff ff    	je     27344 <JS_CallInternal+0x47a4>
   298d7:	e9 64 9a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   298dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20026
   298e0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20027
   298e7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298ee:	44 89 ea             	mov    edx,r13d
   298f1:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20026
   298f4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20027
   298f8:	e8 c3 bb 02 00       	call   554c0 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20027 (discriminator 1)
   298fd:	85 c0                	test   eax,eax
   298ff:	0f 84 26 d4 ff ff    	je     26d2b <JS_CallInternal+0x418b>
   29905:	e9 36 9a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2990a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19094
   29910:	41 83 e6 02          	and    r14d,0x2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19070
   29914:	48 8d 4b c0          	lea    rcx,[rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19096
   29918:	48 8b 73 c0          	mov    rsi,QWORD PTR [rbx-0x40]
   2991c:	4c 8b 41 08          	mov    r8,QWORD PTR [rcx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19094
   29920:	0f 84 6a 0b 00 00    	je     2a490 <JS_CallInternal+0x78f0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19096
   29926:	48 83 ec 08          	sub    rsp,0x8
   2992a:	45 31 c9             	xor    r9d,r9d
   2992d:	6a 00                	push   0x0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19099
   2992f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29936:	48 89 f1             	mov    rcx,rsi
   29939:	48 89 c6             	mov    rsi,rax
   2993c:	e8 8f 36 00 00       	call   2cfd0 <JS_CallFree>
   29941:	41 59                	pop    r9
   29943:	41 5a                	pop    r10
   29945:	48 89 c1             	mov    rcx,rax
   29948:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19102 (discriminator 1)
   2994b:	83 fa 06             	cmp    edx,0x6
   2994e:	0f 84 49 0c 00 00    	je     2a59d <JS_CallInternal+0x79fd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19104
   29954:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29958:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2995c:	83 fa f6             	cmp    edx,0xfffffff6
   2995f:	76 11                	jbe    29972 <JS_CallInternal+0x6dd2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29961:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29964:	83 e8 01             	sub    eax,0x1
   29967:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2996a:	85 c0                	test   eax,eax
   2996c:	0f 8e f5 28 00 00    	jle    2c267 <JS_CallInternal+0x96c7>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19105
   29972:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   29976:	31 c9                	xor    ecx,ecx
   29978:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19106
   2997c:	e9 05 ef ff ff       	jmp    28886 <JS_CallInternal+0x5ce6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20044
   29981:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20045
   29988:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2998f:	44 89 ea             	mov    edx,r13d
   29992:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20044
   29995:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20045
   29999:	e8 c2 bf 02 00       	call   55960 <js_post_inc_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20045 (discriminator 1)
   2999e:	85 c0                	test   eax,eax
   299a0:	0f 84 40 d3 ff ff    	je     26ce6 <JS_CallInternal+0x4146>
   299a6:	e9 95 99 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   299ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
JS_NewUint32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:587
   299b0:	66 0f ef c0          	pxor   xmm0,xmm0
   299b4:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   299b9:	b8 08 00 00 00       	mov    eax,0x8
   299be:	e9 9c cf ff ff       	jmp    2695f <JS_CallInternal+0x3dbf>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9657
   299c3:	4c 89 c6             	mov    rsi,r8
   299c6:	48 89 df             	mov    rdi,rbx
   299c9:	48 89 8d 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rcx
   299d0:	4c 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r8
   299d7:	e8 e4 25 01 00       	call   3bfc0 <expand_fast_array>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9657 (discriminator 1)
   299dc:	4c 8b 85 28 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1d8]
   299e3:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
   299ea:	85 c0                	test   eax,eax
   299ec:	0f 88 76 29 00 00    	js     2c368 <JS_CallInternal+0x97c8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9664
   299f2:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   299f8:	41 89 40 38          	mov    DWORD PTR [r8+0x38],eax
   299fc:	31 c0                	xor    eax,eax
   299fe:	66 90                	xchg   ax,ax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9666
   29a00:	f3 41 0f 6f 5c 05 00 	movdqu xmm3,XMMWORD PTR [r13+rax*1+0x0]
   29a07:	49 8b 50 30          	mov    rdx,QWORD PTR [r8+0x30]
   29a0b:	0f 11 1c 02          	movups XMMWORD PTR [rdx+rax*1],xmm3
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9665 (discriminator 1)
   29a0f:	48 83 c0 10          	add    rax,0x10
   29a13:	4c 39 f0             	cmp    rax,r14
   29a16:	75 e8                	jne    29a00 <JS_CallInternal+0x6e60>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9668 (discriminator 1)
   29a18:	49 8b 40 20          	mov    rax,QWORD PTR [r8+0x20]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   29a1c:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   29a23:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   29a27:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   29a2a:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
   29a31:	00 
   29a32:	48 89 18             	mov    QWORD PTR [rax],rbx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29a35:	83 fa f6             	cmp    edx,0xfffffff6
   29a38:	0f 86 ad a5 ff ff    	jbe    23feb <JS_CallInternal+0x144b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29a3e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29a41:	83 e8 01             	sub    eax,0x1
   29a44:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29a47:	85 c0                	test   eax,eax
   29a49:	0f 8f 9c a5 ff ff    	jg     23feb <JS_CallInternal+0x144b>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   29a4f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29a56:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   29a5d:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   29a64:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29a68:	e8 33 2e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   29a6d:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   29a74:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   29a7b:	e9 6b a5 ff ff       	jmp    23feb <JS_CallInternal+0x144b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18521
   29a80:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   29a87:	48 03 77 30          	add    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18522
   29a8b:	80 7a 11 00          	cmp    BYTE PTR [rdx+0x11],0x0
   29a8f:	0f 84 b0 12 00 00    	je     2ad45 <JS_CallInternal+0x81a5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18523
   29a95:	41 83 fd 3a          	cmp    r13d,0x3a
   29a99:	0f 84 62 9d ff ff    	je     23801 <JS_CallInternal+0xc61>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18497
   29a9f:	8b 76 04             	mov    esi,DWORD PTR [rsi+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18526
   29aa2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18525 (discriminator 1)
   29aa9:	83 f9 04             	cmp    ecx,0x4
   29aac:	0f 84 fe 34 00 00    	je     2cfb0 <JS_CallInternal+0xa410>
JS_ThrowTypeErrorReadOnly():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7757
   29ab2:	e8 b9 88 00 00       	call   32370 <JS_ThrowTypeErrorReadOnly.part.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18517
   29ab7:	4d 89 f4             	mov    r12,r14
   29aba:	e9 81 98 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29abf:	90                   	nop
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15985
   29ac0:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   29ac7:	4d 89 f0             	mov    r8,r14
   29aca:	4c 89 ce             	mov    rsi,r9
   29acd:	4c 89 ea             	mov    rdx,r13
   29ad0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ad7:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   29ade:	e8 4d 7a 00 00       	call   31530 <JS_CheckBrand>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15986
   29ae3:	85 c0                	test   eax,eax
   29ae5:	0f 88 55 98 ff ff    	js     23340 <JS_CallInternal+0x7a0>
   29aeb:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   29af2:	0f 95 c0             	setne  al
   29af5:	e9 d8 d3 ff ff       	jmp    26ed2 <JS_CallInternal+0x4332>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 10)
   29afa:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29b01:	48 89 fa             	mov    rdx,rdi
   29b04:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b0b:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29b0f:	e8 9c 3b 00 00       	call   2d6b0 <JS_GetPropertyValue>
   29b14:	48 89 c1             	mov    rcx,rax
   29b17:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 3)
   29b1a:	83 fa 06             	cmp    edx,0x6
   29b1d:	0f 85 e7 bc ff ff    	jne    2580a <JS_CallInternal+0x2c6a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 15)
   29b23:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19458 (discriminator 16)
   29b27:	e9 14 98 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18397
   29b2c:	31 c9                	xor    ecx,ecx
   29b2e:	41 b8 03 00 00 00    	mov    r8d,0x3
   29b34:	e9 ba a9 ff ff       	jmp    244f3 <JS_CallInternal+0x1953>
   29b39:	31 c0                	xor    eax,eax
   29b3b:	e9 91 ca ff ff       	jmp    265d1 <JS_CallInternal+0x3a31>
find_own_property1():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6139
   29b40:	8b 00                	mov    eax,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6134
   29b42:	25 ff ff ff 03       	and    eax,0x3ffffff
   29b47:	0f 85 32 98 ff ff    	jne    2337f <JS_CallInternal+0x7df>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20690
   29b4d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20691
   29b54:	48 83 ec 08          	sub    rsp,0x8
   29b58:	31 c9                	xor    ecx,ecx
   29b5a:	45 31 c9             	xor    r9d,r9d
   29b5d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b64:	45 31 c0             	xor    r8d,r8d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20690
   29b67:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20691
   29b6b:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   29b72:	48 8b b0 d8 04 00 00 	mov    rsi,QWORD PTR [rax+0x4d8]
   29b79:	48 8b 90 e0 04 00 00 	mov    rdx,QWORD PTR [rax+0x4e0]
   29b80:	6a 00                	push   0x0
   29b82:	e8 69 66 00 00       	call   301f0 <build_backtrace>
   29b87:	59                   	pop    rcx
   29b88:	5e                   	pop    rsi
   29b89:	e9 02 98 ff ff       	jmp    23390 <JS_CallInternal+0x7f0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19609
   29b8e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19610
   29b95:	48 8d 7b f0          	lea    rdi,[rbx-0x10]
   29b99:	41 b9 00 80 00 00    	mov    r9d,0x8000
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19609
   29b9f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19610
   29ba3:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   29ba7:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29bab:	48 83 eb 30          	sub    rbx,0x30
   29baf:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   29bb2:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   29bb6:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   29bb9:	ff 77 08             	push   QWORD PTR [rdi+0x8]
   29bbc:	ff 37                	push   QWORD PTR [rdi]
   29bbe:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29bc5:	e8 b6 4e 00 00       	call   2ea80 <JS_SetPropertyValue>
   29bca:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29bce:	5f                   	pop    rdi
   29bcf:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19610
   29bd2:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29bd5:	41 58                	pop    r8
   29bd7:	83 fa f6             	cmp    edx,0xfffffff6
   29bda:	76 11                	jbe    29bed <JS_CallInternal+0x704d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29bdc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29bdf:	83 e8 01             	sub    eax,0x1
   29be2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29be5:	85 c0                	test   eax,eax
   29be7:	0f 8e 4b 25 00 00    	jle    2c138 <JS_CallInternal+0x9598>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19613 (discriminator 1)
   29bed:	45 85 ed             	test   r13d,r13d
   29bf0:	0f 89 d4 eb ff ff    	jns    287ca <JS_CallInternal+0x5c2a>
   29bf6:	e9 45 97 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29bfb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 10)
   29c00:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29c07:	48 89 ca             	mov    rdx,rcx
   29c0a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29c0e:	4c 89 c0             	mov    rax,r8
   29c11:	49 89 f8             	mov    r8,rdi
   29c14:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c1b:	48 89 c1             	mov    rcx,rax
   29c1e:	e8 8d 3a 00 00       	call   2d6b0 <JS_GetPropertyValue>
   29c23:	48 89 c1             	mov    rcx,rax
   29c26:	48 89 d0             	mov    rax,rdx
   29c29:	48 89 ca             	mov    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 3)
   29c2c:	83 f8 06             	cmp    eax,0x6
   29c2f:	0f 85 1d e9 ff ff    	jne    28552 <JS_CallInternal+0x59b2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19462 (discriminator 14)
   29c35:	45 31 c0             	xor    r8d,r8d
   29c38:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   29c3f:	00 
   29c40:	4c 89 43 f0          	mov    QWORD PTR [rbx-0x10],r8
   29c44:	e9 f7 96 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   29c49:	41 8b 30             	mov    esi,DWORD PTR [r8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   29c4c:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   29c52:	0f 85 4f de ff ff    	jne    27aa7 <JS_CallInternal+0x4f07>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19230
   29c58:	48 83 ec 08          	sub    rsp,0x8
   29c5c:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29c60:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29c64:	48 89 c6             	mov    rsi,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19229
   29c67:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   29c6e:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   29c75:	4c 89 57 30          	mov    QWORD PTR [rdi+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19230
   29c79:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c80:	68 00 80 00 00       	push   0x8000
   29c85:	52                   	push   rdx
   29c86:	50                   	push   rax
   29c87:	e8 e4 40 00 00       	call   2dd70 <JS_SetPropertyInternal>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29c8c:	48 83 c4 20          	add    rsp,0x20
   29c90:	41 83 fe f6          	cmp    r14d,0xfffffff6
   29c94:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19230
   29c9b:	89 c1                	mov    ecx,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29c9d:	76 13                	jbe    29cb2 <JS_CallInternal+0x7112>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29c9f:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   29ca3:	83 e8 01             	sub    eax,0x1
   29ca6:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   29caa:	85 c0                	test   eax,eax
   29cac:	0f 8e be 24 00 00    	jle    2c170 <JS_CallInternal+0x95d0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19233
   29cb2:	48 83 eb 20          	sub    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19234 (discriminator 1)
   29cb6:	85 c9                	test   ecx,ecx
   29cb8:	0f 89 5f de ff ff    	jns    27b1d <JS_CallInternal+0x4f7d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19210
   29cbe:	4d 89 d4             	mov    r12,r10
   29cc1:	e9 7a 96 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18912
   29cc6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ccd:	48 89 ce             	mov    rsi,rcx
   29cd0:	e8 db 4e ff ff       	call   1ebb0 <JS_ToBoolFree>
   29cd5:	e9 53 ec ff ff       	jmp    2892d <JS_CallInternal+0x5d8d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18932
   29cda:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ce1:	48 89 ce             	mov    rsi,rcx
   29ce4:	e8 c7 4e ff ff       	call   1ebb0 <JS_ToBoolFree>
   29ce9:	e9 d8 eb ff ff       	jmp    288c6 <JS_CallInternal+0x5d26>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18891
   29cee:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29cf5:	48 89 ce             	mov    rsi,rcx
   29cf8:	e8 b3 4e ff ff       	call   1ebb0 <JS_ToBoolFree>
   29cfd:	e9 14 dd ff ff       	jmp    27a16 <JS_CallInternal+0x4e76>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19122
   29d02:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29d09:	48 89 d6             	mov    rsi,rdx
   29d0c:	48 89 c2             	mov    rdx,rax
   29d0f:	e8 9c 4e ff ff       	call   1ebb0 <JS_ToBoolFree>
   29d14:	e9 e0 ea ff ff       	jmp    287f9 <JS_CallInternal+0x5c59>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18401
   29d19:	49 8b 75 f0          	mov    rsi,QWORD PTR [r13-0x10]
   29d1d:	49 8b 55 f8          	mov    rdx,QWORD PTR [r13-0x8]
   29d21:	41 b8 03 00 00 00    	mov    r8d,0x3
   29d27:	31 c9                	xor    ecx,ecx
   29d29:	44 8b 8d 50 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x1b0]
   29d30:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18402
   29d37:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
   29d3e:	00 00 00 00 
   29d42:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x3
   29d49:	03 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18401
   29d4d:	6a 00                	push   0x0
   29d4f:	41 55                	push   r13
   29d51:	ff b5 98 fd ff ff    	push   QWORD PTR [rbp-0x268]
   29d57:	ff b5 90 fd ff ff    	push   QWORD PTR [rbp-0x270]
   29d5d:	e8 3e 8e ff ff       	call   22ba0 <JS_CallInternal>
   29d62:	48 83 c4 20          	add    rsp,0x20
   29d66:	49 89 c1             	mov    r9,rax
   29d69:	49 89 d0             	mov    r8,rdx
   29d6c:	e9 b2 a7 ff ff       	jmp    24523 <JS_CallInternal+0x1983>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18430
   29d71:	31 c9                	xor    ecx,ecx
   29d73:	41 b8 03 00 00 00    	mov    r8d,0x3
   29d79:	e9 2c a6 ff ff       	jmp    243aa <JS_CallInternal+0x180a>
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20743
   29d7e:	48 8b b5 28 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1d8]
   29d85:	45 89 d1             	mov    r9d,r10d
   29d88:	4c 89 ea             	mov    rdx,r13
   29d8b:	31 c9                	xor    ecx,ecx
   29d8d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29d94:	41 b8 03 00 00 00    	mov    r8d,0x3
   29d9a:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
   29da1:	00 00 00 00 
   29da5:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x3
   29dac:	03 00 00 00 
   29db0:	6a 02                	push   0x2
   29db2:	41 56                	push   r14
   29db4:	ff b5 a8 fd ff ff    	push   QWORD PTR [rbp-0x258]
   29dba:	ff b5 a0 fd ff ff    	push   QWORD PTR [rbp-0x260]
   29dc0:	44 89 95 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r10d
   29dc7:	e8 d4 8d ff ff       	call   22ba0 <JS_CallInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18434
   29dcc:	44 8b 95 38 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c8]
   29dd3:	48 83 c4 20          	add    rsp,0x20
   29dd7:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   29dde:	49 89 d5             	mov    r13,rdx
   29de1:	e9 06 a6 ff ff       	jmp    243ec <JS_CallInternal+0x184c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18870
   29de6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ded:	48 89 ce             	mov    rsi,rcx
   29df0:	e8 bb 4d ff ff       	call   1ebb0 <JS_ToBoolFree>
   29df5:	e9 f5 ef ff ff       	jmp    28def <JS_CallInternal+0x624f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20129
   29dfa:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20130
   29e01:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29e08:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20129
   29e0b:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20130
   29e0f:	e8 bc bb 02 00       	call   559d0 <js_not_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20130 (discriminator 1)
   29e14:	85 c0                	test   eax,eax
   29e16:	0f 84 c0 cb ff ff    	je     269dc <JS_CallInternal+0x3e3c>
   29e1c:	e9 1f 95 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   29e21:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16715
   29e28:	c7 85 f0 fe ff ff ff 	mov    DWORD PTR [rbp-0x110],0xffffffff
   29e2f:	ff ff ff 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16716
   29e32:	b9 ff ff ff ff       	mov    ecx,0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16719
   29e37:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   29e3b:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29e3f:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29e43:	76 11                	jbe    29e56 <JS_CallInternal+0x72b6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29e45:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   29e48:	8d 57 ff             	lea    edx,[rdi-0x1]
   29e4b:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   29e4e:	85 d2                	test   edx,edx
   29e50:	0f 8e b9 21 00 00    	jle    2c00f <JS_CallInternal+0x946f>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16720
   29e56:	49 c7 45 00 00 00 00 	mov    QWORD PTR [r13+0x0],0x0
   29e5d:	00 
   29e5e:	49 c7 45 08 03 00 00 	mov    QWORD PTR [r13+0x8],0x3
   29e65:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16721
   29e66:	85 c9                	test   ecx,ecx
   29e68:	0f 88 85 2e 00 00    	js     2ccf3 <JS_CallInternal+0xa153>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29e6e:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   29e72:	76 11                	jbe    29e85 <JS_CallInternal+0x72e5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29e74:	8b 48 fc             	mov    ecx,DWORD PTR [rax-0x4]
   29e77:	8d 51 ff             	lea    edx,[rcx-0x1]
   29e7a:	89 50 fc             	mov    DWORD PTR [rax-0x4],edx
   29e7d:	85 d2                	test   edx,edx
   29e7f:	0f 8e 5a 22 00 00    	jle    2c0df <JS_CallInternal+0x953f>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   29e85:	8b bd f0 fe ff ff    	mov    edi,DWORD PTR [rbp-0x110]
   29e8b:	31 d2                	xor    edx,edx
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16709
   29e8d:	be 03 00 00 00       	mov    esi,0x3
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   29e92:	85 ff                	test   edi,edi
   29e94:	0f 95 c2             	setne  dl
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16709
   29e97:	31 ff                	xor    edi,edi
   29e99:	e9 28 ee ff ff       	jmp    28cc6 <JS_CallInternal+0x6126>
   29e9e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29ea5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   29ea9:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   29eb0:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   29eb4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29eb7:	83 e8 01             	sub    eax,0x1
   29eba:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29ebd:	85 c0                	test   eax,eax
   29ebf:	0f 8f 05 df ff ff    	jg     27dca <JS_CallInternal+0x522a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   29ec5:	e8 36 b5 fe ff       	call   15400 <JS_FreeAtomStruct>
   29eca:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   29ed1:	e9 f4 de ff ff       	jmp    27dca <JS_CallInternal+0x522a>
   29ed6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29edd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   29ee1:	89 c8                	mov    eax,ecx
   29ee3:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29eea:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   29eee:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29ef1:	83 e8 01             	sub    eax,0x1
   29ef4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29ef7:	85 c0                	test   eax,eax
   29ef9:	0f 8f be d0 ff ff    	jg     26fbd <JS_CallInternal+0x441d>
   29eff:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   29f06:	e8 f5 b4 fe ff       	call   15400 <JS_FreeAtomStruct>
   29f0b:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   29f12:	e9 a6 d0 ff ff       	jmp    26fbd <JS_CallInternal+0x441d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19482
   29f17:	41 83 fd fa          	cmp    r13d,0xfffffffa
   29f1b:	7d 06                	jge    29f23 <JS_CallInternal+0x7383>
   29f1d:	41 83 fd f8          	cmp    r13d,0xfffffff8
   29f21:	7d 59                	jge    29f7c <JS_CallInternal+0x73dc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19494
   29f23:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:13688
   29f2a:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29f2e:	b9 01 00 00 00       	mov    ecx,0x1
   29f33:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29f37:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19494
   29f3e:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:13688
   29f42:	e8 d9 61 01 00       	call   40120 <JS_ToStringInternal>
   29f47:	49 89 d0             	mov    r8,rdx
   29f4a:	49 89 d5             	mov    r13,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19496 (discriminator 1)
   29f4d:	83 fa 06             	cmp    edx,0x6
   29f50:	0f 84 ea 93 ff ff    	je     23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19498
   29f56:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29f5a:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   29f5e:	83 fa f6             	cmp    edx,0xfffffff6
   29f61:	76 11                	jbe    29f74 <JS_CallInternal+0x73d4>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   29f63:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   29f66:	83 e9 01             	sub    ecx,0x1
   29f69:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   29f6c:	85 c9                	test   ecx,ecx
   29f6e:	0f 8e 64 26 00 00    	jle    2c5d8 <JS_CallInternal+0x9a38>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19499
   29f74:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   29f78:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19502
   29f7c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29f83:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   29f87:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   29f8b:	41 83 fd f6          	cmp    r13d,0xfffffff6
   29f8f:	76 04                	jbe    29f95 <JS_CallInternal+0x73f5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   29f91:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19503 (discriminator 1)
   29f95:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29f99:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29f9d:	4d 89 e8             	mov    r8,r13
   29fa0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29fa7:	e8 04 37 00 00       	call   2d6b0 <JS_GetPropertyValue>
   29fac:	48 89 c1             	mov    rcx,rax
   29faf:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19504 (discriminator 2)
   29fb2:	83 fa 06             	cmp    edx,0x6
   29fb5:	0f 85 23 e5 ff ff    	jne    284de <JS_CallInternal+0x593e>
   29fbb:	e9 80 93 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 3)
   29fc0:	49 8b 46 18          	mov    rax,QWORD PTR [r14+0x18]
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:9
   29fc4:	49 3b 00             	cmp    rax,QWORD PTR [r8]
   29fc7:	0f 84 b3 11 00 00    	je     2b180 <JS_CallInternal+0x85e0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 6)
   29fcd:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   29fd1:	80 fa 1f             	cmp    dl,0x1f
   29fd4:	0f 86 92 a0 ff ff    	jbe    2406c <JS_CallInternal+0x14cc>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 13)
   29fda:	80 fa 20             	cmp    dl,0x20
   29fdd:	0f 85 9d a0 ff ff    	jne    24080 <JS_CallInternal+0x14e0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 14)
   29fe3:	89 fa                	mov    edx,edi
   29fe5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29fec:	4c 89 c9             	mov    rcx,r9
   29fef:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   29ff6:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   29ffd:	e8 0e 44 ff ff       	call   1e410 <rdi_exit.isra.0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   2a002:	49 8b 46 18          	mov    rax,QWORD PTR [r14+0x18]
   2a006:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   2a00d:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   2a014:	e9 67 a0 ff ff       	jmp    24080 <JS_CallInternal+0x14e0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   2a019:	8b 08                	mov    ecx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   2a01b:	81 e1 ff ff ff 03    	and    ecx,0x3ffffff
   2a021:	0f 85 ba b0 ff ff    	jne    250e1 <JS_CallInternal+0x2541>
JS_DeleteGlobalVar():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:10928
   2a027:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a02e:	44 89 f1             	mov    ecx,r14d
   2a031:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   2a038:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   2a03f:	e8 ec 43 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:10929
   2a044:	85 c0                	test   eax,eax
   2a046:	0f 88 1e 2e 00 00    	js     2ce6a <JS_CallInternal+0xa2ca>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:10931
   2a04c:	b8 01 00 00 00       	mov    eax,0x1
   2a051:	0f 84 9d b0 ff ff    	je     250f4 <JS_CallInternal+0x2554>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:10932
   2a057:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a05e:	45 31 c0             	xor    r8d,r8d
   2a061:	44 89 f1             	mov    ecx,r14d
   2a064:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   2a06b:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   2a072:	e8 19 13 02 00       	call   4b390 <JS_DeleteProperty>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20468 (discriminator 1)
   2a077:	85 c0                	test   eax,eax
   2a079:	0f 88 5c 24 00 00    	js     2c4db <JS_CallInternal+0x993b>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2a07f:	0f 95 c0             	setne  al
   2a082:	0f b6 c0             	movzx  eax,al
   2a085:	e9 6a b0 ff ff       	jmp    250f4 <JS_CallInternal+0x2554>
   2a08a:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2a091:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2a095:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a09c:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2a0a0:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   2a0a3:	8d 51 ff             	lea    edx,[rcx-0x1]
   2a0a6:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2a0a9:	85 d2                	test   edx,edx
   2a0ab:	0f 8f 4a e5 ff ff    	jg     285fb <JS_CallInternal+0x5a5b>
   2a0b1:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2a0b8:	e8 43 b3 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a0bd:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2a0c4:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2a0cb:	e9 2b e5 ff ff       	jmp    285fb <JS_CallInternal+0x5a5b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 3)
   2a0d0:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:9
   2a0d4:	49 3b 10             	cmp    rdx,QWORD PTR [r8]
   2a0d7:	0f 84 85 15 00 00    	je     2b662 <JS_CallInternal+0x8ac2>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 6)
   2a0dd:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   2a0e1:	80 f9 1f             	cmp    cl,0x1f
   2a0e4:	0f 86 88 a0 ff ff    	jbe    24172 <JS_CallInternal+0x15d2>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 13)
   2a0ea:	80 f9 20             	cmp    cl,0x20
   2a0ed:	0f 85 93 a0 ff ff    	jne    24186 <JS_CallInternal+0x15e6>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 14)
   2a0f3:	89 fa                	mov    edx,edi
   2a0f5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a0fc:	4c 89 d1             	mov    rcx,r10
   2a0ff:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2a106:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a10d:	e8 fe 42 ff ff       	call   1e410 <rdi_exit.isra.0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6151
   2a112:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   2a116:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a11d:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2a124:	e9 5d a0 ff ff       	jmp    24186 <JS_CallInternal+0x15e6>
   2a129:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a130:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2a134:	89 c8                	mov    eax,ecx
   2a136:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a13d:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2a141:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a144:	83 e8 01             	sub    eax,0x1
   2a147:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a14a:	85 c0                	test   eax,eax
   2a14c:	0f 8f 48 b0 ff ff    	jg     2519a <JS_CallInternal+0x25fa>
   2a152:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2a159:	e8 a2 b2 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a15e:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2a165:	e9 30 b0 ff ff       	jmp    2519a <JS_CallInternal+0x25fa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20725
   2a16a:	48 89 fe             	mov    rsi,rdi
   2a16d:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
   2a174:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   2a17b:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
   2a182:	48 89 8d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rcx
   2a189:	e8 22 63 ff ff       	call   204b0 <close_var_refs>
   2a18e:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
   2a195:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
   2a19c:	e9 04 91 ff ff       	jmp    232a5 <JS_CallInternal+0x705>
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47688
   2a1a1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a1a8:	48 8d 35 9e 33 0a 00 	lea    rsi,[rip+0xa339e]        # cd54d <_IO_stdin_used+0x54d>
   2a1af:	31 c0                	xor    eax,eax
   2a1b1:	e8 fa 6c 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2a1b6:	83 fb f6             	cmp    ebx,0xfffffff6
   2a1b9:	76 1e                	jbe    2a1d9 <JS_CallInternal+0x7639>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2a1bb:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a1c2:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   2a1c5:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
   2a1cb:	83 e8 01             	sub    eax,0x1
   2a1ce:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   2a1d1:	85 c0                	test   eax,eax
   2a1d3:	0f 8e 34 2a 00 00    	jle    2cc0d <JS_CallInternal+0xa06d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2a1d9:	83 bd 38 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1c8],0xfffffff6
   2a1e0:	76 1e                	jbe    2a200 <JS_CallInternal+0x7660>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2a1e2:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2a1e9:	8b 43 fc             	mov    eax,DWORD PTR [rbx-0x4]
   2a1ec:	89 85 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],eax
   2a1f2:	83 e8 01             	sub    eax,0x1
   2a1f5:	89 43 fc             	mov    DWORD PTR [rbx-0x4],eax
   2a1f8:	85 c0                	test   eax,eax
   2a1fa:	0f 8e 28 2a 00 00    	jle    2cc28 <JS_CallInternal+0xa088>
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:47703
   2a200:	ba 06 00 00 00       	mov    edx,0x6
   2a205:	31 c0                	xor    eax,eax
   2a207:	e9 bd a0 ff ff       	jmp    242c9 <JS_CallInternal+0x1729>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 30)
   2a20c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a213:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a21a:	ba 01 00 00 00       	mov    edx,0x1
   2a21f:	48 89 de             	mov    rsi,rbx
   2a222:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2a226:	e8 65 0f 03 00       	call   5b190 <js_eq_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 1)
   2a22b:	85 c0                	test   eax,eax
   2a22d:	0f 84 3f c8 ff ff    	je     26a72 <JS_CallInternal+0x3ed2>
   2a233:	e9 08 91 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a238:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2a23f:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 30)
   2a240:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a247:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a24e:	31 d2                	xor    edx,edx
   2a250:	48 89 de             	mov    rsi,rbx
   2a253:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2a257:	e8 34 0f 03 00       	call   5b190 <js_eq_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 1)
   2a25c:	85 c0                	test   eax,eax
   2a25e:	0f 84 68 c8 ff ff    	je     26acc <JS_CallInternal+0x3f2c>
   2a264:	e9 d7 90 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a269:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   2a270:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a277:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2a27b:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a282:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2a286:	8b 56 fc             	mov    edx,DWORD PTR [rsi-0x4]
   2a289:	83 ea 01             	sub    edx,0x1
   2a28c:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2a28f:	85 d2                	test   edx,edx
   2a291:	0f 8f 82 e4 ff ff    	jg     28719 <JS_CallInternal+0x5b79>
   2a297:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2a29e:	4c 89 b5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r14
   2a2a5:	e8 56 b1 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a2aa:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2a2b1:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a2b8:	e9 5c e4 ff ff       	jmp    28719 <JS_CallInternal+0x5b79>
   2a2bd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a2c4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2a2c8:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   2a2cf:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2a2d3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a2d6:	83 e8 01             	sub    eax,0x1
   2a2d9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a2dc:	85 c0                	test   eax,eax
   2a2de:	0f 8f 79 d6 ff ff    	jg     2795d <JS_CallInternal+0x4dbd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2a2e4:	e8 17 b1 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a2e9:	e9 6f d6 ff ff       	jmp    2795d <JS_CallInternal+0x4dbd>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2a2ee:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a2f5:	48 89 ca             	mov    rdx,rcx
   2a2f8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a2fc:	e8 9f 25 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a301:	e9 1c 95 ff ff       	jmp    23822 <JS_CallInternal+0xc82>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19990
   2a306:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19991
   2a30d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a314:	44 89 ea             	mov    edx,r13d
   2a317:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19990
   2a31a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19991
   2a31e:	e8 9d b1 02 00       	call   554c0 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19991 (discriminator 1)
   2a323:	85 c0                	test   eax,eax
   2a325:	0f 84 d1 d1 ff ff    	je     274fc <JS_CallInternal+0x495c>
   2a32b:	e9 10 90 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2a330:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a337:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
   2a33d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a341:	e8 5a 25 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a346:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2a34c:	e9 48 97 ff ff       	jmp    23a99 <JS_CallInternal+0xef9>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2a351:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2a355:	0f 87 35 18 00 00    	ja     2bb90 <JS_CallInternal+0x8ff0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 16)
   2a35b:	b8 01 00 00 00       	mov    eax,0x1
   2a360:	e9 91 d4 ff ff       	jmp    277f6 <JS_CallInternal+0x4c56>
   2a365:	0f 1f 00             	nop    DWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2a368:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2a36c:	76 0f                	jbe    2a37d <JS_CallInternal+0x77dd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2a36e:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2a372:	83 e8 01             	sub    eax,0x1
   2a375:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2a379:	85 c0                	test   eax,eax
   2a37b:	7e 07                	jle    2a384 <JS_CallInternal+0x77e4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 16)
   2a37d:	31 c0                	xor    eax,eax
   2a37f:	e9 c6 d4 ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2a384:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a38b:	4c 89 ee             	mov    rsi,r13
   2a38e:	4c 89 f2             	mov    rdx,r14
   2a391:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a395:	e8 06 25 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 16)
   2a39a:	31 c0                	xor    eax,eax
   2a39c:	e9 a9 d4 ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
   2a3a1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a3a8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2a3ac:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2a3b2:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a3b9:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2a3bd:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a3c0:	83 e8 01             	sub    eax,0x1
   2a3c3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a3c6:	85 c0                	test   eax,eax
   2a3c8:	0f 8f 20 ef ff ff    	jg     292ee <JS_CallInternal+0x674e>
   2a3ce:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2a3d4:	e8 27 b0 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a3d9:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2a3df:	e9 0a ef ff ff       	jmp    292ee <JS_CallInternal+0x674e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19387
   2a3e4:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   2a3e9:	e9 8c 96 ff ff       	jmp    23a7a <JS_CallInternal+0xeda>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17871
   2a3ee:	45 31 ed             	xor    r13d,r13d
   2a3f1:	e9 a1 eb ff ff       	jmp    28f97 <JS_CallInternal+0x63f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18245
   2a3f6:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   2a3fd:	e9 3e 8f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18972
   2a402:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a409:	48 8d 35 4d 31 0a 00 	lea    rsi,[rip+0xa314d]        # cd55d <_IO_stdin_used+0x55d>
   2a410:	31 c0                	xor    eax,eax
   2a412:	e8 79 8e 00 00       	call   33290 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18973
   2a417:	e9 24 8f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18491
   2a41c:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   2a423:	48 8b 47 30          	mov    rax,QWORD PTR [rdi+0x30]
   2a427:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18497
   2a42a:	8b 48 04             	mov    ecx,DWORD PTR [rax+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18492
   2a42d:	f6 00 08             	test   BYTE PTR [rax],0x8
   2a430:	0f 85 7d 28 00 00    	jne    2ccb3 <JS_CallInternal+0xa113>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18497
   2a436:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18496
   2a43d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18497
   2a444:	48 83 ec 08          	sub    rsp,0x8
   2a448:	41 83 ed 37          	sub    r13d,0x37
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18496
   2a44c:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18497
   2a450:	4c 8b 87 80 01 00 00 	mov    r8,QWORD PTR [rdi+0x180]
   2a457:	4c 8b 8f 88 01 00 00 	mov    r9,QWORD PTR [rdi+0x188]
   2a45e:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   2a465:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   2a46c:	41 55                	push   r13
   2a46e:	e8 cd 2b 00 00       	call   2d040 <JS_GetPropertyInternal>
   2a473:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18501 (discriminator 1)
   2a477:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18497
   2a47b:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18501 (discriminator 1)
   2a47e:	41 5a                	pop    r10
   2a480:	41 5b                	pop    r11
   2a482:	0f 85 d6 97 ff ff    	jne    23c5e <JS_CallInternal+0x10be>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18488
   2a488:	4d 89 f4             	mov    r12,r14
   2a48b:	e9 b0 8e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19099
   2a490:	48 83 ec 08          	sub    rsp,0x8
   2a494:	48 8d 4b f0          	lea    rcx,[rbx-0x10]
   2a498:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a49e:	51                   	push   rcx
   2a49f:	e9 8b f4 ff ff       	jmp    2992f <JS_CallInternal+0x6d8f>
   2a4a4:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2a4ab:	89 c0                	mov    eax,eax
   2a4ad:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2a4b1:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   2a4b8:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2a4bc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a4bf:	83 e8 01             	sub    eax,0x1
   2a4c2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a4c5:	85 c0                	test   eax,eax
   2a4c7:	0f 8f ff c9 ff ff    	jg     26ecc <JS_CallInternal+0x432c>
   2a4cd:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
   2a4d4:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2a4db:	e8 20 af fe ff       	call   15400 <JS_FreeAtomStruct>
   2a4e0:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2a4e7:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2a4ee:	e9 d9 c9 ff ff       	jmp    26ecc <JS_CallInternal+0x432c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19957
   2a4f3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19958
   2a4fa:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a501:	44 89 ea             	mov    edx,r13d
   2a504:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19957
   2a507:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19958
   2a50b:	e8 b0 af 02 00       	call   554c0 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19958 (discriminator 1)
   2a510:	85 c0                	test   eax,eax
   2a512:	0f 84 9c cf ff ff    	je     274b4 <JS_CallInternal+0x4914>
   2a518:	e9 23 8e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2a51d:	0f 1f 00             	nop    DWORD PTR [rax]
async_func_free():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:21032 (discriminator 1)
   2a520:	48 89 c6             	mov    rsi,rax
   2a523:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   2a526:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2a52c:	83 e8 01             	sub    eax,0x1
   2a52f:	89 46 ac             	mov    DWORD PTR [rsi-0x54],eax
   2a532:	0f 85 69 d9 ff ff    	jne    27ea1 <JS_CallInternal+0x5301>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:21033
   2a538:	80 bf a0 04 00 00 02 	cmp    BYTE PTR [rdi+0x4a0],0x2
   2a53f:	0f 84 5c d9 ff ff    	je     27ea1 <JS_CallInternal+0x5301>
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17545
   2a545:	48 83 ee 50          	sub    rsi,0x50
async_func_free():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17545
   2a549:	e8 a2 5e ff ff       	call   203f0 <async_func_free.part.0>
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17576
   2a54e:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   2a555:	48 8b 4e 28          	mov    rcx,QWORD PTR [rsi+0x28]
   2a559:	4c 01 e9             	add    rcx,r13
   2a55c:	e9 40 d9 ff ff       	jmp    27ea1 <JS_CallInternal+0x5301>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18380
   2a561:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18363
   2a568:	0f b6 d0             	movzx  edx,al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18380
   2a56b:	31 c0                	xor    eax,eax
   2a56d:	48 8d 35 bf 2f 0a 00 	lea    rsi,[rip+0xa2fbf]        # cd533 <_IO_stdin_used+0x533>
   2a574:	e8 17 8d 00 00       	call   33290 <JS_ThrowInternalError>
   2a579:	e9 c2 8d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   2a57e:	4c 8d 53 f0          	lea    r10,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 36)
   2a582:	41 bd 03 00 00 00    	mov    r13d,0x3
   2a588:	45 31 f6             	xor    r14d,r14d
   2a58b:	e9 6c 9c ff ff       	jmp    241fc <JS_CallInternal+0x165c>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 36)
   2a590:	41 bd 03 00 00 00    	mov    r13d,0x3
   2a596:	31 c0                	xor    eax,eax
   2a598:	e9 53 9b ff ff       	jmp    240f0 <JS_CallInternal+0x1550>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19085
   2a59d:	4d 89 ec             	mov    r12,r13
   2a5a0:	e9 9b 8d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2a5a5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5ac:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5b0:	e8 eb 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5b5:	e9 cd a8 ff ff       	jmp    24e87 <JS_CallInternal+0x22e7>
   2a5ba:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5c1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5c5:	e8 d6 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5ca:	e9 03 a6 ff ff       	jmp    24bd2 <JS_CallInternal+0x2032>
   2a5cf:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5d6:	4c 89 c2             	mov    rdx,r8
   2a5d9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5dd:	e8 be 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5e2:	e9 99 a5 ff ff       	jmp    24b80 <JS_CallInternal+0x1fe0>
   2a5e7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5ee:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5f2:	e8 a9 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5f7:	e9 2c d8 ff ff       	jmp    27e28 <JS_CallInternal+0x5288>
   2a5fc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a603:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2a60a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a60e:	e8 8d 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a613:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   2a61a:	e9 cf d7 ff ff       	jmp    27dee <JS_CallInternal+0x524e>
   2a61f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a626:	48 89 ca             	mov    rdx,rcx
   2a629:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a62d:	e8 6e 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a632:	e9 96 a2 ff ff       	jmp    248cd <JS_CallInternal+0x1d2d>
   2a637:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a63e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a642:	e8 59 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a647:	e9 bf d7 ff ff       	jmp    27e0b <JS_CallInternal+0x526b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18421
   2a64c:	4c 8b a5 10 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1f0]
   2a653:	e9 e8 8c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2a658:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a65f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a663:	e8 38 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a668:	e9 42 e4 ff ff       	jmp    28aaf <JS_CallInternal+0x5f0f>
   2a66d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a674:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a67b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a67f:	e8 1c 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a684:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a68b:	e9 df dd ff ff       	jmp    2846f <JS_CallInternal+0x58cf>
   2a690:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a697:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a69e:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a6a5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6a9:	e8 f2 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a6ae:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a6b5:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a6bc:	e9 a2 98 ff ff       	jmp    23f63 <JS_CallInternal+0x13c3>
   2a6c1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6c8:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a6cf:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a6d6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6da:	e8 c1 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a6df:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a6e6:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a6ed:	e9 36 98 ff ff       	jmp    23f28 <JS_CallInternal+0x1388>
   2a6f2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6f9:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a700:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a707:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a70b:	e8 90 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a710:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a717:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a71e:	e9 22 98 ff ff       	jmp    23f45 <JS_CallInternal+0x13a5>
   2a723:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a72a:	48 89 ca             	mov    rdx,rcx
   2a72d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a731:	e8 6a 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a736:	e9 e4 a1 ff ff       	jmp    2491f <JS_CallInternal+0x1d7f>
   2a73b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a742:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a746:	e8 55 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a74b:	e9 07 a3 ff ff       	jmp    24a57 <JS_CallInternal+0x1eb7>
   2a750:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a757:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a75b:	e8 40 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a760:	e9 56 a2 ff ff       	jmp    249bb <JS_CallInternal+0x1e1b>
   2a765:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a76c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a770:	e8 2b 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a775:	e9 25 a3 ff ff       	jmp    24a9f <JS_CallInternal+0x1eff>
   2a77a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a781:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a785:	e8 16 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a78a:	e9 8a 9a ff ff       	jmp    24219 <JS_CallInternal+0x1679>
   2a78f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a796:	4c 89 c2             	mov    rdx,r8
   2a799:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a79d:	e8 fe 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7a2:	e9 aa 9f ff ff       	jmp    24751 <JS_CallInternal+0x1bb1>
   2a7a7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7ae:	4c 89 c2             	mov    rdx,r8
   2a7b1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7b5:	e8 e6 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7ba:	e9 ed 9e ff ff       	jmp    246ac <JS_CallInternal+0x1b0c>
   2a7bf:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7c6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7ca:	e8 d1 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7cf:	e9 1f a0 ff ff       	jmp    247f3 <JS_CallInternal+0x1c53>
   2a7d4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7db:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7df:	e8 bc 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7e4:	e9 b7 9f ff ff       	jmp    247a0 <JS_CallInternal+0x1c00>
   2a7e9:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2a7f0:	4c 89 ee             	mov    rsi,r13
   2a7f3:	4c 89 f2             	mov    rdx,r14
   2a7f6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7fd:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a804:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a808:	e8 93 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a80d:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2a814:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a81b:	e9 03 b0 ff ff       	jmp    25823 <JS_CallInternal+0x2c83>
   2a820:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a827:	48 89 ca             	mov    rdx,rcx
   2a82a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a82e:	e8 6d 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a833:	e9 3b a1 ff ff       	jmp    24973 <JS_CallInternal+0x1dd3>
   2a838:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a83f:	48 89 ca             	mov    rdx,rcx
   2a842:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a846:	e8 55 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a84b:	e9 bf a1 ff ff       	jmp    24a0f <JS_CallInternal+0x1e6f>
   2a850:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a857:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a85b:	e8 40 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a860:	e9 b5 e9 ff ff       	jmp    2921a <JS_CallInternal+0x667a>
   2a865:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a86c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a873:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a87a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a87e:	e8 1d 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a883:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a88a:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a891:	e9 27 db ff ff       	jmp    283bd <JS_CallInternal+0x581d>
   2a896:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a89d:	4c 89 c6             	mov    rsi,r8
   2a8a0:	48 89 ca             	mov    rdx,rcx
   2a8a3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8a7:	e8 f4 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a8ac:	e9 c5 e1 ff ff       	jmp    28a76 <JS_CallInternal+0x5ed6>
   2a8b1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8b8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8bc:	e8 df 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a8c1:	e9 76 d9 ff ff       	jmp    2823c <JS_CallInternal+0x569c>
   2a8c6:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2a8cd:	4c 89 ee             	mov    rsi,r13
   2a8d0:	4c 89 ca             	mov    rdx,r9
   2a8d3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8da:	44 89 85 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r8d
   2a8e1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8e5:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a8ec:	e8 af 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a8f1:	44 8b 85 28 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1d8]
   2a8f8:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2a8ff:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a906:	e9 bb d7 ff ff       	jmp    280c6 <JS_CallInternal+0x5526>
   2a90b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2a912:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a919:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2a920:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a924:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a92b:	e8 70 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a930:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2a937:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2a93e:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a945:	e9 a0 d7 ff ff       	jmp    280ea <JS_CallInternal+0x554a>
   2a94a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a951:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a955:	e8 46 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a95a:	e9 39 c9 ff ff       	jmp    27298 <JS_CallInternal+0x46f8>
   2a95f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a966:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a96a:	e8 31 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a96f:	e9 eb a9 ff ff       	jmp    2535f <JS_CallInternal+0x27bf>
   2a974:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a97b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a97f:	e8 1c 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a984:	e9 8b a9 ff ff       	jmp    25314 <JS_CallInternal+0x2774>
   2a989:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a990:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a994:	e8 07 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a999:	e9 06 aa ff ff       	jmp    253a4 <JS_CallInternal+0x2804>
   2a99e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9a5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9a9:	e8 f2 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9ae:	e9 ca ae ff ff       	jmp    2587d <JS_CallInternal+0x2cdd>
   2a9b3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9ba:	48 89 ca             	mov    rdx,rcx
   2a9bd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9c1:	e8 da 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9c6:	e9 15 b0 ff ff       	jmp    259e0 <JS_CallInternal+0x2e40>
   2a9cb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9d2:	48 89 ca             	mov    rdx,rcx
   2a9d5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9d9:	e8 c2 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9de:	e9 c6 b5 ff ff       	jmp    25fa9 <JS_CallInternal+0x3409>
   2a9e3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9ea:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9ee:	e8 ad 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9f3:	e9 01 b6 ff ff       	jmp    25ff9 <JS_CallInternal+0x3459>
   2a9f8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9ff:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa03:	e8 98 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa08:	e9 ef b4 ff ff       	jmp    25efc <JS_CallInternal+0x335c>
   2aa0d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa14:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa18:	e8 83 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa1d:	e9 28 b5 ff ff       	jmp    25f4a <JS_CallInternal+0x33aa>
   2aa22:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa29:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa2d:	e8 6e 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa32:	e9 9c a3 ff ff       	jmp    24dd3 <JS_CallInternal+0x2233>
   2aa37:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa3e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa42:	e8 59 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa47:	e9 99 a0 ff ff       	jmp    24ae5 <JS_CallInternal+0x1f45>
   2aa4c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa53:	4c 89 c2             	mov    rdx,r8
   2aa56:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa5a:	e8 41 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa5f:	e9 fc b3 ff ff       	jmp    25e60 <JS_CallInternal+0x32c0>
   2aa64:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa6b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa6f:	e8 2c 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa74:	e9 35 b4 ff ff       	jmp    25eae <JS_CallInternal+0x330e>
   2aa79:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa80:	4c 89 c2             	mov    rdx,r8
   2aa83:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa87:	e8 14 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa8c:	e9 1a b3 ff ff       	jmp    25dab <JS_CallInternal+0x320b>
   2aa91:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa98:	4c 89 c2             	mov    rdx,r8
   2aa9b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa9f:	e8 fc 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aaa4:	e9 5d b3 ff ff       	jmp    25e06 <JS_CallInternal+0x3266>
   2aaa9:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aab0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aab4:	e8 e7 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aab9:	e9 3a b1 ff ff       	jmp    25bf8 <JS_CallInternal+0x3058>
   2aabe:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aac5:	4c 89 c2             	mov    rdx,r8
   2aac8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aacc:	e8 cf 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aad1:	e9 7a b2 ff ff       	jmp    25d50 <JS_CallInternal+0x31b0>
   2aad6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aadd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aae1:	e8 ba 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aae6:	e9 7f b0 ff ff       	jmp    25b6a <JS_CallInternal+0x2fca>
   2aaeb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aaf2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aaf6:	e8 a5 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aafb:	e9 b2 b0 ff ff       	jmp    25bb2 <JS_CallInternal+0x3012>
   2ab00:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab07:	4c 89 f2             	mov    rdx,r14
   2ab0a:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2ab11:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab15:	e8 86 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ab1a:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2ab21:	e9 bd c2 ff ff       	jmp    26de3 <JS_CallInternal+0x4243>
   2ab26:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   2ab2c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab33:	4c 89 ce             	mov    rsi,r9
   2ab36:	4c 89 ea             	mov    rdx,r13
   2ab39:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab3d:	e8 5e 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ab42:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2ab49:	e9 9d c3 ff ff       	jmp    26eeb <JS_CallInternal+0x434b>
   2ab4e:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2ab55:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab5c:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2ab63:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab67:	e8 34 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ab6c:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2ab73:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2ab7a:	e9 8f 92 ff ff       	jmp    23e0e <JS_CallInternal+0x126e>
   2ab7f:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2ab86:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab8d:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2ab94:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab98:	e8 03 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ab9d:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2aba4:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2abab:	e9 7b 92 ff ff       	jmp    23e2b <JS_CallInternal+0x128b>
   2abb0:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2abb7:	4c 89 f6             	mov    rsi,r14
   2abba:	4c 89 ea             	mov    rdx,r13
   2abbd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abc4:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2abcb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abcf:	e8 cc 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2abd4:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2abdb:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2abe2:	e9 81 b9 ff ff       	jmp    26568 <JS_CallInternal+0x39c8>
   2abe7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abee:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abf2:	e8 a9 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2abf7:	e9 68 b8 ff ff       	jmp    26464 <JS_CallInternal+0x38c4>
   2abfc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac03:	48 89 ca             	mov    rdx,rcx
   2ac06:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac0a:	e8 91 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac0f:	e9 c6 ae ff ff       	jmp    25ada <JS_CallInternal+0x2f3a>
   2ac14:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac1b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac1f:	e8 7c 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac24:	e9 f9 ae ff ff       	jmp    25b22 <JS_CallInternal+0x2f82>
   2ac29:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac30:	48 89 ca             	mov    rdx,rcx
   2ac33:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac37:	e8 64 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac3c:	e9 f3 ad ff ff       	jmp    25a34 <JS_CallInternal+0x2e94>
   2ac41:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac48:	48 89 ca             	mov    rdx,rcx
   2ac4b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac4f:	e8 4c 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac54:	e9 2f ae ff ff       	jmp    25a88 <JS_CallInternal+0x2ee8>
   2ac59:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac60:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac64:	e8 37 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac69:	e9 eb d5 ff ff       	jmp    28259 <JS_CallInternal+0x56b9>
   2ac6e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac75:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac79:	e8 22 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac7e:	e9 ff b7 ff ff       	jmp    26482 <JS_CallInternal+0x38e2>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   2ac83:	48 83 ec 08          	sub    rsp,0x8
   2ac87:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2ac8d:	4c 89 ee             	mov    rsi,r13
   2ac90:	4c 89 e2             	mov    rdx,r12
   2ac93:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2ac9a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2aca1:	6a 00                	push   0x0
   2aca3:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2acaa:	e8 91 23 00 00       	call   2d040 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20599 (discriminator 2)
   2acaf:	5f                   	pop    rdi
   2acb0:	41 58                	pop    r8
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:782
   2acb2:	48 89 c1             	mov    rcx,rax
   2acb5:	48 89 d0             	mov    rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20599 (discriminator 2)
   2acb8:	83 fa 06             	cmp    edx,0x6
   2acbb:	0f 85 3a 89 ff ff    	jne    235fb <JS_CallInternal+0xa5b>
   2acc1:	e9 e0 89 ff ff       	jmp    236a6 <JS_CallInternal+0xb06>
   2acc6:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2accc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2acd3:	48 89 ce             	mov    rsi,rcx
   2acd6:	4c 89 f2             	mov    rdx,r14
   2acd9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2acdd:	e8 be 1b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ace2:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2ace9:	e9 21 c2 ff ff       	jmp    26f0f <JS_CallInternal+0x436f>
   2acee:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
   2acf2:	4c 89 c2             	mov    rdx,r8
   2acf5:	e8 a6 1b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2acfa:	e9 e7 c9 ff ff       	jmp    276e6 <JS_CallInternal+0x4b46>
   2acff:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad06:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2ad0d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad11:	e8 8a 1b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ad16:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2ad1d:	e9 74 c9 ff ff       	jmp    27696 <JS_CallInternal+0x4af6>
   2ad22:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad29:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2ad30:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad34:	e8 67 1b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ad39:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2ad40:	e9 54 91 ff ff       	jmp    23e99 <JS_CallInternal+0x12f9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18531
   2ad45:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18532
   2ad4c:	8b 4e 04             	mov    ecx,DWORD PTR [rsi+0x4]
   2ad4f:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   2ad56:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18531
   2ad5d:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18532
   2ad61:	49 8b b5 80 01 00 00 	mov    rsi,QWORD PTR [r13+0x180]
   2ad68:	49 8b 95 88 01 00 00 	mov    rdx,QWORD PTR [r13+0x188]
   2ad6f:	4c 89 ef             	mov    rdi,r13
   2ad72:	e8 b9 36 04 00       	call   6e430 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18533
   2ad77:	85 c0                	test   eax,eax
   2ad79:	0f 88 3e 22 00 00    	js     2cfbd <JS_CallInternal+0xa41d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18535
   2ad7f:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2ad86:	0f 85 99 03 00 00    	jne    2b125 <JS_CallInternal+0x8585>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2873
   2ad8c:	49 8b 45 10          	mov    rax,QWORD PTR [r13+0x10]
   2ad90:	4c 89 ef             	mov    rdi,r13
   2ad93:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874
   2ad9a:	48 85 c0             	test   rax,rax
   2ad9d:	0f 84 82 03 00 00    	je     2b125 <JS_CallInternal+0x8585>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874 (discriminator 1)
   2ada3:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2ada7:	0f 84 78 03 00 00    	je     2b125 <JS_CallInternal+0x8585>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18536
   2adad:	41 8b 72 04          	mov    esi,DWORD PTR [r10+0x4]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18517
   2adb1:	4d 89 f4             	mov    r12,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18536
   2adb4:	e8 17 83 00 00       	call   330d0 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18537
   2adb9:	e9 82 85 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2adbe:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2adc5:	48 89 ca             	mov    rdx,rcx
   2adc8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2adcc:	e8 cf 1a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2add1:	e9 ac df ff ff       	jmp    28d82 <JS_CallInternal+0x61e2>
   2add6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2addd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ade1:	e8 ba 1a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ade6:	e9 53 e4 ff ff       	jmp    2923e <JS_CallInternal+0x669e>
   2adeb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2adf2:	4c 89 f6             	mov    rsi,r14
   2adf5:	4c 89 ea             	mov    rdx,r13
   2adf8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2adfc:	e8 9f 1a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ae01:	e9 14 c6 ff ff       	jmp    2741a <JS_CallInternal+0x487a>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7817
   2ae06:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae0d:	48 8d 35 65 27 0a 00 	lea    rsi,[rip+0xa2765]        # cd579 <_IO_stdin_used+0x579>
   2ae14:	31 c0                	xor    eax,eax
   2ae16:	e8 95 60 00 00       	call   30eb0 <JS_ThrowTypeError>
   2ae1b:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2ae1f:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2ae23:	48 89 c1             	mov    rcx,rax
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:643
   2ae26:	41 89 d0             	mov    r8d,edx
   2ae29:	48 89 d0             	mov    rax,rdx
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8439
   2ae2c:	e9 7c d2 ff ff       	jmp    280ad <JS_CallInternal+0x550d>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2ae31:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ae38:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ae3c:	e8 5f 1a ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19287
   2ae41:	e9 79 e4 ff ff       	jmp    292bf <JS_CallInternal+0x671f>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   2ae46:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae4d:	e8 be 85 00 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18876 (discriminator 2)
   2ae52:	85 c0                	test   eax,eax
   2ae54:	0f 84 cd df ff ff    	je     28e27 <JS_CallInternal+0x6287>
   2ae5a:	4d 89 ec             	mov    r12,r13
   2ae5d:	e9 de 84 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19866
   2ae62:	66 0f ef c0          	pxor   xmm0,xmm0
   2ae66:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19895
   2ae6b:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19896
   2ae70:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19895
   2ae74:	b8 08 00 00 00       	mov    eax,0x8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19877
   2ae79:	e9 fd c1 ff ff       	jmp    2707b <JS_CallInternal+0x44db>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19876
   2ae7e:	83 fe 08             	cmp    esi,0x8
   2ae81:	0f 84 a0 17 00 00    	je     2c627 <JS_CallInternal+0x9a87>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19881
   2ae87:	83 f8 08             	cmp    eax,0x8
   2ae8a:	0f 85 07 8e ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
   2ae90:	85 f6                	test   esi,esi
   2ae92:	0f 85 ff 8d ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19882
   2ae98:	66 0f ef c9          	pxor   xmm1,xmm1
   2ae9c:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19887
   2aea0:	66 48 0f 6e c2       	movq   xmm0,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19893
   2aea5:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   2aea9:	eb c0                	jmp    2ae6b <JS_CallInternal+0x82cb>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19824
   2aeab:	66 0f ef c0          	pxor   xmm0,xmm0
   2aeaf:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   2aeb4:	b8 08 00 00 00       	mov    eax,0x8
   2aeb9:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2aebe:	e9 10 c2 ff ff       	jmp    270d3 <JS_CallInternal+0x4533>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19829
   2aec3:	83 fa 08             	cmp    edx,0x8
   2aec6:	0f 84 dd 19 00 00    	je     2c8a9 <JS_CallInternal+0x9d09>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19834
   2aecc:	85 d2                	test   edx,edx
   2aece:	0f 85 c3 8d ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
   2aed4:	83 f8 08             	cmp    eax,0x8
   2aed7:	0f 85 ba 8d ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19835
   2aedd:	66 0f ef c0          	pxor   xmm0,xmm0
   2aee1:	f2 0f 2a c7          	cvtsi2sd xmm0,edi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19840
   2aee5:	66 48 0f 6e c9       	movq   xmm1,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19846
   2aeea:	f2 0f 5c c1          	subsd  xmm0,xmm1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19847
   2aeee:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19830
   2aef2:	b8 08 00 00 00       	mov    eax,0x8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19846
   2aef7:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19830
   2aefc:	e9 d6 c1 ff ff       	jmp    270d7 <JS_CallInternal+0x4537>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19780
   2af01:	66 0f ef c0          	pxor   xmm0,xmm0
   2af05:	b8 08 00 00 00       	mov    eax,0x8
   2af0a:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
   2af0f:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2af15:	e9 2d c2 ff ff       	jmp    27147 <JS_CallInternal+0x45a7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   2af1a:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19785
   2af1e:	83 fa 08             	cmp    edx,0x8
   2af21:	0f 84 64 19 00 00    	je     2c88b <JS_CallInternal+0x9ceb>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19789
   2af27:	83 fa f9             	cmp    edx,0xfffffff9
   2af2a:	0f 84 15 13 00 00    	je     2c245 <JS_CallInternal+0x96a5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19805
   2af30:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2af37:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19806
   2af3b:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2af3f:	83 fa f6             	cmp    edx,0xfffffff6
   2af42:	0f 87 16 13 00 00    	ja     2c25e <JS_CallInternal+0x96be>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19809
   2af48:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2af4f:	48 8d b5 70 ff ff ff 	lea    rsi,[rbp-0x90]
   2af56:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19806
   2af5d:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   2af64:	48 89 95 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19807
   2af6b:	4c 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],r8
   2af72:	4c 89 b5 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19809
   2af79:	e8 72 b9 02 00       	call   568f0 <js_add_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19809 (discriminator 1)
   2af7e:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2af85:	85 c0                	test   eax,eax
   2af87:	0f 85 1e 1d 00 00    	jne    2ccab <JS_CallInternal+0xa10b>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   2af8d:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   2af91:	66 0f 6f bd 50 ff ff 	movdqa xmm7,XMMWORD PTR [rbp-0xb0]
   2af98:	ff 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   2af99:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   2af9d:	41 0f 11 7d 00       	movups XMMWORD PTR [r13+0x0],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2afa2:	83 fa f6             	cmp    edx,0xfffffff6
   2afa5:	0f 86 a4 c1 ff ff    	jbe    2714f <JS_CallInternal+0x45af>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2afab:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2afae:	83 e8 01             	sub    eax,0x1
   2afb1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2afb4:	85 c0                	test   eax,eax
   2afb6:	0f 8f 93 c1 ff ff    	jg     2714f <JS_CallInternal+0x45af>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2afbc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2afc3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2afc7:	e8 d4 18 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2afcc:	e9 7e c1 ff ff       	jmp    2714f <JS_CallInternal+0x45af>
   2afd1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   2afd8:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2afdf:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2afe6:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2afed:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aff1:	e8 aa 18 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aff6:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2affd:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2b004:	e9 18 d6 ff ff       	jmp    28621 <JS_CallInternal+0x5a81>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19029
   2b009:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b010:	48 8d 35 49 5e 0a 00 	lea    rsi,[rip+0xa5e49]        # d0e60 <_IO_stdin_used+0x3e60>
   2b017:	31 c0                	xor    eax,eax
   2b019:	e8 92 5e 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19030
   2b01e:	e9 1d 83 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18770
   2b023:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b02a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b031:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18768
   2b033:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18770
   2b036:	e8 f5 80 00 00       	call   33130 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18771
   2b03b:	e9 00 83 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 6)
   2b040:	41 0f b6 50 10       	movzx  edx,BYTE PTR [r8+0x10]
   2b045:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   2b049:	80 fa 1f             	cmp    dl,0x1f
   2b04c:	0f 86 38 12 00 00    	jbe    2c28a <JS_CallInternal+0x96ea>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 13)
   2b052:	80 fa 20             	cmp    dl,0x20
   2b055:	0f 85 94 e4 ff ff    	jne    294ef <JS_CallInternal+0x694f>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 14)
   2b05b:	89 fa                	mov    edx,edi
   2b05d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b064:	4c 89 d1             	mov    rcx,r10
   2b067:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2b06e:	e8 9d 33 ff ff       	call   1e410 <rdi_exit.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 16)
   2b073:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2b07a:	e9 70 e4 ff ff       	jmp    294ef <JS_CallInternal+0x694f>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7838
   2b07f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b086:	48 8d 35 fa 24 0a 00 	lea    rsi,[rip+0xa24fa]        # cd587 <_IO_stdin_used+0x587>
   2b08d:	31 c0                	xor    eax,eax
   2b08f:	e8 1c 5e 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2b094:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   2b09b:	76 13                	jbe    2b0b0 <JS_CallInternal+0x8510>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2b09d:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b0a1:	83 e8 01             	sub    eax,0x1
   2b0a4:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b0a8:	85 c0                	test   eax,eax
   2b0aa:	0f 8e 7b 17 00 00    	jle    2c82b <JS_CallInternal+0x9c8b>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8477
   2b0b0:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   2b0b6:	e9 64 d1 ff ff       	jmp    2821f <JS_CallInternal+0x567f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18274
   2b0bb:	4d 89 d4             	mov    r12,r10
   2b0be:	e9 7d 82 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7817
   2b0c3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b0ca:	48 8d 35 a8 24 0a 00 	lea    rsi,[rip+0xa24a8]        # cd579 <_IO_stdin_used+0x579>
   2b0d1:	31 c0                	xor    eax,eax
   2b0d3:	e8 d8 5d 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8463
   2b0d8:	eb ba                	jmp    2b094 <JS_CallInternal+0x84f4>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b0da:	48 8b bd 38 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1c8]
   2b0e1:	e8 ba 17 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b0e6:	e9 31 d1 ff ff       	jmp    2821c <JS_CallInternal+0x567c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18757
   2b0eb:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b0f2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b0f9:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18755
   2b0fb:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18757
   2b0fe:	e8 2d 80 00 00       	call   33130 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18758
   2b103:	e9 38 82 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18782
   2b108:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b10f:	48 8d 35 22 5d 0a 00 	lea    rsi,[rip+0xa5d22]        # d0e38 <_IO_stdin_used+0x3e38>
   2b116:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18780
   2b118:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18782
   2b11b:	e8 80 7e 00 00       	call   32fa0 <JS_ThrowReferenceError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18783
   2b120:	e9 1b 82 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18539
   2b125:	48 83 ec 08          	sub    rsp,0x8
   2b129:	41 8b 4a 04          	mov    ecx,DWORD PTR [r10+0x4]
   2b12d:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2b131:	48 83 eb 10          	sub    rbx,0x10
   2b135:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b13c:	4c 8b 4b 08          	mov    r9,QWORD PTR [rbx+0x8]
   2b140:	48 8b b0 80 01 00 00 	mov    rsi,QWORD PTR [rax+0x180]
   2b147:	48 8b 90 88 01 00 00 	mov    rdx,QWORD PTR [rax+0x188]
   2b14e:	68 00 80 00 00       	push   0x8000
   2b153:	48 89 c7             	mov    rdi,rax
   2b156:	ff b0 88 01 00 00    	push   QWORD PTR [rax+0x188]
   2b15c:	ff b0 80 01 00 00    	push   QWORD PTR [rax+0x180]
   2b162:	e8 09 2c 00 00       	call   2dd70 <JS_SetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18542
   2b167:	48 83 c4 20          	add    rsp,0x20
   2b16b:	85 c0                	test   eax,eax
   2b16d:	0f 89 b3 86 ff ff    	jns    23826 <JS_CallInternal+0xc86>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18517
   2b173:	4d 89 f4             	mov    r12,r14
   2b176:	e9 c5 81 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2b17b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:10
   2b180:	41 8b 48 08          	mov    ecx,DWORD PTR [r8+0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 1)
   2b184:	83 f9 ff             	cmp    ecx,0xffffffff
   2b187:	0f 84 40 ee ff ff    	je     29fcd <JS_CallInternal+0x742d>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 5)
   2b18d:	84 d2                	test   dl,dl
   2b18f:	74 05                	je     2b196 <JS_CallInternal+0x85f6>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 7)
   2b191:	41 c6 40 10 00       	mov    BYTE PTR [r8+0x10],0x0
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 9)
   2b196:	89 c8                	mov    eax,ecx
   2b198:	48 c1 e0 04          	shl    rax,0x4
   2b19c:	49 03 46 20          	add    rax,QWORD PTR [r14+0x20]
   2b1a0:	4c 8b 68 08          	mov    r13,QWORD PTR [rax+0x8]
   2b1a4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2b1a7:	41 83 fd f6          	cmp    r13d,0xfffffff6
   2b1ab:	76 04                	jbe    2b1b1 <JS_CallInternal+0x8611>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2b1ad:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:713
   2b1b1:	48 89 d0             	mov    rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83
   2b1b4:	e9 37 8f ff ff       	jmp    240f0 <JS_CallInternal+0x1550>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20226
   2b1b9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20227
   2b1c0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b1c7:	44 89 ea             	mov    edx,r13d
   2b1ca:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20226
   2b1cd:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20227
   2b1d1:	e8 9a ab 02 00       	call   55d70 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20227 (discriminator 1)
   2b1d6:	85 c0                	test   eax,eax
   2b1d8:	0f 85 62 81 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20229
   2b1de:	48 83 eb 10          	sub    rbx,0x10
   2b1e2:	e9 ff c7 ff ff       	jmp    279e6 <JS_CallInternal+0x4e46>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20170
   2b1e7:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20171
   2b1ee:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b1f5:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20170
   2b1f8:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20171
   2b1fc:	e8 9f a9 02 00       	call   55ba0 <js_shr_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20171 (discriminator 1)
   2b201:	85 c0                	test   eax,eax
   2b203:	0f 85 37 81 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20173
   2b209:	48 83 eb 10          	sub    rbx,0x10
   2b20d:	e9 5a b7 ff ff       	jmp    2696c <JS_CallInternal+0x3dcc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19638 (discriminator 1)
   2b212:	0f 85 ae 1a 00 00    	jne    2ccc6 <JS_CallInternal+0xa126>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2873
   2b218:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b21f:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2b223:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874
   2b22a:	48 85 c0             	test   rax,rax
   2b22d:	0f 84 e9 c6 ff ff    	je     2791c <JS_CallInternal+0x4d7c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874 (discriminator 1)
   2b233:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2b237:	0f 84 df c6 ff ff    	je     2791c <JS_CallInternal+0x4d7c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19643
   2b23d:	44 89 ee             	mov    esi,r13d
   2b240:	e8 8b 7e 00 00       	call   330d0 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2b245:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b24c:	0f 8e ee 80 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2b252:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b259:	44 89 ee             	mov    esi,r13d
   2b25c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b260:	e8 0b e2 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2b265:	e9 d6 80 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2873
   2b26a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b271:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2b275:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874
   2b27c:	48 85 c0             	test   rax,rax
   2b27f:	0f 84 2f 10 00 00    	je     2c2b4 <JS_CallInternal+0x9714>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874 (discriminator 1)
   2b285:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2b289:	0f 84 25 10 00 00    	je     2c2b4 <JS_CallInternal+0x9714>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19629
   2b28f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b296:	44 89 ee             	mov    esi,r13d
   2b299:	e8 32 7e 00 00       	call   330d0 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2b29e:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b2a5:	0f 8e 95 80 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2b2ab:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b2b2:	44 89 ee             	mov    esi,r13d
   2b2b5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b2b9:	e8 b2 e1 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2b2be:	e9 7d 80 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 2)
   2b2c3:	83 fe 08             	cmp    esi,0x8
   2b2c6:	0f 84 a9 12 00 00    	je     2c575 <JS_CallInternal+0x99d5>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 8)
   2b2cc:	83 f9 08             	cmp    ecx,0x8
   2b2cf:	75 08                	jne    2b2d9 <JS_CallInternal+0x8739>
   2b2d1:	85 f6                	test   esi,esi
   2b2d3:	0f 84 10 15 00 00    	je     2c7e9 <JS_CallInternal+0x9c49>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 20)
   2b2d9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b2e0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b2e7:	44 89 ea             	mov    edx,r13d
   2b2ea:	48 89 de             	mov    rsi,rbx
   2b2ed:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b2f1:	e8 2a f9 02 00       	call   5ac20 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 1)
   2b2f6:	85 c0                	test   eax,eax
   2b2f8:	0f 85 42 80 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 22)
   2b2fe:	48 83 eb 10          	sub    rbx,0x10
   2b302:	e9 59 b8 ff ff       	jmp    26b60 <JS_CallInternal+0x3fc0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b307:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b30e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b312:	e8 89 15 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b317:	e9 65 c6 ff ff       	jmp    27981 <JS_CallInternal+0x4de1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18190
   2b31c:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18189
   2b31f:	4d 89 ec             	mov    r12,r13
   2b322:	e9 19 80 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 2)
   2b327:	41 83 f8 08          	cmp    r8d,0x8
   2b32b:	0f 84 51 16 00 00    	je     2c982 <JS_CallInternal+0x9de2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 8)
   2b331:	41 83 f8 ff          	cmp    r8d,0xffffffff
   2b335:	0f 84 01 16 00 00    	je     2c93c <JS_CallInternal+0x9d9c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 14)
   2b33b:	41 8d 48 fe          	lea    ecx,[r8-0x2]
   2b33f:	83 f9 01             	cmp    ecx,0x1
   2b342:	0f 86 c8 1a 00 00    	jbe    2ce10 <JS_CallInternal+0xa270>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 21)
   2b348:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2b34c:	0f 85 ac 15 00 00    	jne    2c8fe <JS_CallInternal+0x9d5e>
   2b352:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2b356:	0f 85 a2 15 00 00    	jne    2c8fe <JS_CallInternal+0x9d5e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 23)
   2b35c:	4c 89 ee             	mov    rsi,r13
   2b35f:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2b366:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2b36d:	e8 9e ca fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 1)
   2b372:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b379:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 23)
   2b380:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 1)
   2b386:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b38d:	e8 6e 16 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 2)
   2b392:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b399:	4c 89 ee             	mov    rsi,r13
   2b39c:	4c 89 f2             	mov    rdx,r14
   2b39f:	e8 5c 16 ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2b3a4:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2b3aa:	85 c0                	test   eax,eax
   2b3ac:	0f 95 c0             	setne  al
   2b3af:	0f b6 c0             	movzx  eax,al
   2b3b2:	e9 93 c4 ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b3b7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b3be:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b3c2:	e8 d9 14 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b3c7:	e9 71 9b ff ff       	jmp    24f3d <JS_CallInternal+0x239d>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7862
   2b3cc:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 1)
   2b3d3:	48 8d 15 e7 20 0a 00 	lea    rdx,[rip+0xa20e7]        # cd4c1 <_IO_stdin_used+0x4c1>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7862
   2b3da:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2b3de:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851
   2b3e2:	85 c0                	test   eax,eax
   2b3e4:	0f 85 60 12 00 00    	jne    2c64a <JS_CallInternal+0x9aaa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   2b3ea:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b3f1:	48 8d 35 25 21 0a 00 	lea    rsi,[rip+0xa2125]        # cd51d <_IO_stdin_used+0x51d>
   2b3f8:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18681
   2b3fa:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   2b3fd:	e8 9e 7b 00 00       	call   32fa0 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18685
   2b402:	e9 39 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7862
   2b407:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2b40e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2b412:	8b 44 10 04          	mov    eax,DWORD PTR [rax+rdx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 1)
   2b416:	48 8d 15 a4 20 0a 00 	lea    rdx,[rip+0xa20a4]        # cd4c1 <_IO_stdin_used+0x4c1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851
   2b41d:	85 c0                	test   eax,eax
   2b41f:	0f 85 8b 15 00 00    	jne    2c9b0 <JS_CallInternal+0x9e10>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   2b425:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b42c:	48 8d 35 ea 20 0a 00 	lea    rsi,[rip+0xa20ea]        # cd51d <_IO_stdin_used+0x51d>
   2b433:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18708
   2b435:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   2b438:	e8 63 7b 00 00       	call   32fa0 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18711
   2b43d:	e9 fe 7e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20208
   2b442:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20209
   2b449:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b450:	44 89 ea             	mov    edx,r13d
   2b453:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20208
   2b456:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20209
   2b45a:	e8 11 a9 02 00       	call   55d70 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20209 (discriminator 1)
   2b45f:	85 c0                	test   eax,eax
   2b461:	0f 85 d9 7e ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20211
   2b467:	48 83 eb 10          	sub    rbx,0x10
   2b46b:	e9 77 b4 ff ff       	jmp    268e7 <JS_CallInternal+0x3d47>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20190
   2b470:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20191
   2b477:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b47e:	44 89 ea             	mov    edx,r13d
   2b481:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20190
   2b484:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20191
   2b488:	e8 e3 a8 02 00       	call   55d70 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20191 (discriminator 1)
   2b48d:	85 c0                	test   eax,eax
   2b48f:	0f 85 ab 7e ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20193
   2b495:	48 83 eb 10          	sub    rbx,0x10
   2b499:	e9 86 b4 ff ff       	jmp    26924 <JS_CallInternal+0x3d84>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18038
   2b49e:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18036
   2b4a1:	4d 89 ec             	mov    r12,r13
   2b4a4:	e9 97 7e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18731
   2b4a9:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b4b0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18728 (discriminator 1)
   2b4b7:	0f b7 d1             	movzx  edx,cx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18731
   2b4ba:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18729
   2b4bc:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18731
   2b4bf:	e8 6c 7c 00 00       	call   33130 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18732
   2b4c4:	e9 77 7e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18744
   2b4c9:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b4d0:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18741 (discriminator 1)
   2b4d7:	0f b7 d1             	movzx  edx,cx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18744
   2b4da:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18742
   2b4dc:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18744
   2b4df:	e8 4c 7c 00 00       	call   33130 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18745
   2b4e4:	e9 57 7e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18390
   2b4e9:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   2b4f0:	e9 4b 7e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18227
   2b4f5:	4d 89 d4             	mov    r12,r10
   2b4f8:	e9 43 7e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b4fd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b504:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b50b:	48 89 ce             	mov    rsi,rcx
   2b50e:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b515:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b519:	e8 82 13 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b51e:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b525:	e9 a0 9c ff ff       	jmp    251ca <JS_CallInternal+0x262a>
   2b52a:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2b531:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b538:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2b53f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b543:	e8 58 13 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b548:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2b54f:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2b556:	e9 e3 d0 ff ff       	jmp    2863e <JS_CallInternal+0x5a9e>
   2b55b:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2b562:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b569:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   2b570:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b574:	e8 27 13 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b579:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2b580:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2b587:	e9 d6 d0 ff ff       	jmp    28662 <JS_CallInternal+0x5ac2>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 2)
   2b58c:	83 fe 08             	cmp    esi,0x8
   2b58f:	0f 84 ff 0e 00 00    	je     2c494 <JS_CallInternal+0x98f4>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 8)
   2b595:	85 f6                	test   esi,esi
   2b597:	75 09                	jne    2b5a2 <JS_CallInternal+0x8a02>
   2b599:	83 f9 08             	cmp    ecx,0x8
   2b59c:	0f 84 2a 0f 00 00    	je     2c4cc <JS_CallInternal+0x992c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 20)
   2b5a2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b5a9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b5b0:	44 89 ea             	mov    edx,r13d
   2b5b3:	48 89 de             	mov    rsi,rbx
   2b5b6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b5ba:	e8 61 f6 02 00       	call   5ac20 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 1)
   2b5bf:	85 c0                	test   eax,eax
   2b5c1:	0f 85 79 7d ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 22)
   2b5c7:	48 83 eb 10          	sub    rbx,0x10
   2b5cb:	e9 d8 b5 ff ff       	jmp    26ba8 <JS_CallInternal+0x4008>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19247
   2b5d0:	4d 89 ec             	mov    r12,r13
   2b5d3:	e9 68 7d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17983
   2b5d8:	4c 89 f3             	mov    rbx,r14
   2b5db:	e9 60 7d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9660 (discriminator 1)
   2b5e0:	44 8b 95 50 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1b0]
   2b5e7:	45 85 d2             	test   r10d,r10d
   2b5ea:	74 3d                	je     2b629 <JS_CallInternal+0x8a89>
   2b5ec:	4c 8b a5 e8 fe ff ff 	mov    r12,QWORD PTR [rbp-0x118]
   2b5f3:	4c 89 eb             	mov    rbx,r13
   2b5f6:	4d 01 ee             	add    r14,r13
   2b5f9:	eb 09                	jmp    2b604 <JS_CallInternal+0x8a64>
   2b5fb:	48 83 c3 10          	add    rbx,0x10
   2b5ff:	4c 39 f3             	cmp    rbx,r14
   2b602:	74 25                	je     2b629 <JS_CallInternal+0x8a89>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9661
   2b604:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2b608:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2b60b:	83 fa f6             	cmp    edx,0xfffffff6
   2b60e:	76 eb                	jbe    2b5fb <JS_CallInternal+0x8a5b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2b610:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2b613:	83 e8 01             	sub    eax,0x1
   2b616:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2b619:	85 c0                	test   eax,eax
   2b61b:	7f de                	jg     2b5fb <JS_CallInternal+0x8a5b>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b61d:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2b622:	e8 79 12 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b627:	eb d2                	jmp    2b5fb <JS_CallInternal+0x8a5b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18262
   2b629:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18264
   2b630:	4c 89 eb             	mov    rbx,r13
   2b633:	e9 08 7d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7838
   2b638:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b63f:	48 8d 35 41 1f 0a 00 	lea    rsi,[rip+0xa1f41]        # cd587 <_IO_stdin_used+0x587>
   2b646:	31 c0                	xor    eax,eax
   2b648:	e8 63 58 00 00       	call   30eb0 <JS_ThrowTypeError>
   2b64d:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2b650:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2b654:	48 89 c1             	mov    rcx,rax
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:643
   2b657:	41 89 d0             	mov    r8d,edx
   2b65a:	48 89 d0             	mov    rax,rdx
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8442
   2b65d:	e9 4b ca ff ff       	jmp    280ad <JS_CallInternal+0x550d>
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:10
   2b662:	45 8b 48 08          	mov    r9d,DWORD PTR [r8+0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 1)
   2b666:	41 83 f9 ff          	cmp    r9d,0xffffffff
   2b66a:	0f 84 6d ea ff ff    	je     2a0dd <JS_CallInternal+0x753d>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 5)
   2b670:	84 c9                	test   cl,cl
   2b672:	74 05                	je     2b679 <JS_CallInternal+0x8ad9>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 7)
   2b674:	41 c6 40 10 00       	mov    BYTE PTR [r8+0x10],0x0
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 9)
   2b679:	44 89 c8             	mov    eax,r9d
   2b67c:	48 c1 e0 04          	shl    rax,0x4
   2b680:	49 03 46 20          	add    rax,QWORD PTR [r14+0x20]
   2b684:	4c 8b 68 08          	mov    r13,QWORD PTR [rax+0x8]
   2b688:	4c 8b 30             	mov    r14,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2b68b:	41 83 fd f6          	cmp    r13d,0xfffffff6
   2b68f:	76 05                	jbe    2b696 <JS_CallInternal+0x8af6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2b691:	41 83 46 fc 01       	add    DWORD PTR [r14-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18045
   2b696:	4c 8d 53 f0          	lea    r10,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80
   2b69a:	e9 5d 8b ff ff       	jmp    241fc <JS_CallInternal+0x165c>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b69f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b6a6:	4c 89 ee             	mov    rsi,r13
   2b6a9:	4c 89 f2             	mov    rdx,r14
   2b6ac:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2b6b3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b6b7:	e8 e4 11 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b6bc:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2b6c3:	e9 1b 9b ff ff       	jmp    251e3 <JS_CallInternal+0x2643>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16712 (discriminator 2)
   2b6c8:	ba 01 00 00 00       	mov    edx,0x1
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16709
   2b6cd:	be 03 00 00 00       	mov    esi,0x3
   2b6d2:	31 ff                	xor    edi,edi
   2b6d4:	e9 ed d5 ff ff       	jmp    28cc6 <JS_CallInternal+0x6126>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18450
   2b6d9:	4c 89 f3             	mov    rbx,r14
   2b6dc:	e9 5f 7c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17936 (discriminator 1)
   2b6e1:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17936
   2b6e4:	4d 89 ec             	mov    r12,r13
   2b6e7:	e9 54 7c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   2b6ec:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b6f3:	e8 18 7d 00 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18897 (discriminator 2)
   2b6f8:	85 c0                	test   eax,eax
   2b6fa:	0f 84 4e c3 ff ff    	je     27a4e <JS_CallInternal+0x4eae>
   2b700:	4d 89 ec             	mov    r12,r13
   2b703:	e9 38 7c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   2b708:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b70f:	e8 fc 7c 00 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18851 (discriminator 2)
   2b714:	85 c0                	test   eax,eax
   2b716:	0f 84 09 d5 ff ff    	je     28c25 <JS_CallInternal+0x6085>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18850 (discriminator 1)
   2b71c:	4d 89 ec             	mov    r12,r13
   2b71f:	e9 1c 7c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 2)
   2b724:	41 83 f9 08          	cmp    r9d,0x8
   2b728:	0f 84 ea 12 00 00    	je     2ca18 <JS_CallInternal+0x9e78>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 8)
   2b72e:	41 83 f9 ff          	cmp    r9d,0xffffffff
   2b732:	0f 84 96 12 00 00    	je     2c9ce <JS_CallInternal+0x9e2e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 14)
   2b738:	41 8d 41 fe          	lea    eax,[r9-0x2]
   2b73c:	83 f8 01             	cmp    eax,0x1
   2b73f:	0f 86 f8 16 00 00    	jbe    2ce3d <JS_CallInternal+0xa29d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 21)
   2b745:	41 83 f9 f9          	cmp    r9d,0xfffffff9
   2b749:	0f 85 2a 14 00 00    	jne    2cb79 <JS_CallInternal+0x9fd9>
   2b74f:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2b753:	0f 85 20 14 00 00    	jne    2cb79 <JS_CallInternal+0x9fd9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 23)
   2b759:	4c 89 ee             	mov    rsi,r13
   2b75c:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2b763:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2b76a:	e8 a1 c6 fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   2b76f:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b776:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 23)
   2b77d:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   2b783:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b78a:	4c 89 ca             	mov    rdx,r9
   2b78d:	e8 6e 12 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 2)
   2b792:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b799:	4c 89 ee             	mov    rsi,r13
   2b79c:	4c 89 f2             	mov    rdx,r14
   2b79f:	e8 5c 12 ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2b7a4:	31 c0                	xor    eax,eax
   2b7a6:	83 bd 50 fe ff ff 01 	cmp    DWORD PTR [rbp-0x1b0],0x1
   2b7ad:	0f 95 c0             	setne  al
   2b7b0:	e9 41 c0 ff ff       	jmp    277f6 <JS_CallInternal+0x4c56>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   2b7b5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b7bc:	e8 4f 7c 00 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18918 (discriminator 2)
   2b7c1:	85 c0                	test   eax,eax
   2b7c3:	0f 84 9d d1 ff ff    	je     28966 <JS_CallInternal+0x5dc6>
   2b7c9:	4d 89 ec             	mov    r12,r13
   2b7cc:	e9 6f 7b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 2)
   2b7d1:	83 fe 08             	cmp    esi,0x8
   2b7d4:	0f 84 46 13 00 00    	je     2cb20 <JS_CallInternal+0x9f80>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 8)
   2b7da:	83 f9 08             	cmp    ecx,0x8
   2b7dd:	75 08                	jne    2b7e7 <JS_CallInternal+0x8c47>
   2b7df:	85 f6                	test   esi,esi
   2b7e1:	0f 84 71 13 00 00    	je     2cb58 <JS_CallInternal+0x9fb8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 20)
   2b7e7:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b7ee:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b7f5:	44 89 ea             	mov    edx,r13d
   2b7f8:	48 89 de             	mov    rsi,rbx
   2b7fb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b7ff:	e8 1c f4 02 00       	call   5ac20 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 1)
   2b804:	85 c0                	test   eax,eax
   2b806:	0f 85 34 7b ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 22)
   2b80c:	48 83 eb 10          	sub    rbx,0x10
   2b810:	e9 8e c0 ff ff       	jmp    278a3 <JS_CallInternal+0x4d03>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b815:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b81c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b820:	e8 7b 10 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b825:	e9 74 c1 ff ff       	jmp    2799e <JS_CallInternal+0x4dfe>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   2b82a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b831:	e8 da 7b 00 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18938 (discriminator 2)
   2b836:	85 c0                	test   eax,eax
   2b838:	0f 84 c1 d0 ff ff    	je     288ff <JS_CallInternal+0x5d5f>
   2b83e:	4d 89 ec             	mov    r12,r13
   2b841:	e9 fa 7a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7862
   2b846:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 1)
   2b84d:	48 8d 15 6d 1c 0a 00 	lea    rdx,[rip+0xa1c6d]        # cd4c1 <_IO_stdin_used+0x4c1>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7862
   2b854:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2b858:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851
   2b85c:	85 c0                	test   eax,eax
   2b85e:	0f 85 a5 0d 00 00    	jne    2c609 <JS_CallInternal+0x9a69>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   2b864:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b86b:	48 8d 35 ab 1c 0a 00 	lea    rsi,[rip+0xa1cab]        # cd51d <_IO_stdin_used+0x51d>
   2b872:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18695
   2b874:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7851 (discriminator 2)
   2b877:	e8 24 77 00 00       	call   32fa0 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18698
   2b87c:	e9 bf 7a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19057
   2b881:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b888:	31 c0                	xor    eax,eax
   2b88a:	48 8d 35 de 1c 0a 00 	lea    rsi,[rip+0xa1cde]        # cd56f <_IO_stdin_used+0x56f>
   2b891:	e8 fa 79 00 00       	call   33290 <JS_ThrowInternalError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2b896:	83 fb f6             	cmp    ebx,0xfffffff6
   2b899:	76 13                	jbe    2b8ae <JS_CallInternal+0x8d0e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2b89b:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b89f:	83 e8 01             	sub    eax,0x1
   2b8a2:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b8a6:	85 c0                	test   eax,eax
   2b8a8:	0f 8e 0f 0d 00 00    	jle    2c5bd <JS_CallInternal+0x9a1d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19059 (discriminator 1)
   2b8ae:	4c 89 f3             	mov    rbx,r14
   2b8b1:	e9 8a 7a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19312
   2b8b6:	4d 89 ec             	mov    r12,r13
   2b8b9:	e9 82 7a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20244
   2b8be:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20245
   2b8c5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b8cc:	44 89 ea             	mov    edx,r13d
   2b8cf:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20244
   2b8d2:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20245
   2b8d6:	e8 95 a4 02 00       	call   55d70 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20245 (discriminator 1)
   2b8db:	85 c0                	test   eax,eax
   2b8dd:	0f 85 5d 7a ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20247
   2b8e3:	48 83 eb 10          	sub    rbx,0x10
   2b8e7:	e9 d8 ba ff ff       	jmp    273c4 <JS_CallInternal+0x4824>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19301
   2b8ec:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19297
   2b8ef:	4d 89 ec             	mov    r12,r13
   2b8f2:	e9 49 7a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19482
   2b8f7:	41 83 fd fa          	cmp    r13d,0xfffffffa
   2b8fb:	0f 8d 53 0a 00 00    	jge    2c354 <JS_CallInternal+0x97b4>
   2b901:	41 83 fd f8          	cmp    r13d,0xfffffff8
   2b905:	0f 8d 71 e6 ff ff    	jge    29f7c <JS_CallInternal+0x73dc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19490 (discriminator 2)
   2b90b:	83 e8 02             	sub    eax,0x2
   2b90e:	83 f8 01             	cmp    eax,0x1
   2b911:	0f 87 0c e6 ff ff    	ja     29f23 <JS_CallInternal+0x7383>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19491
   2b917:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b91e:	48 8d 35 79 1c 0a 00 	lea    rsi,[rip+0xa1c79]        # cd59e <_IO_stdin_used+0x59e>
   2b925:	31 c0                	xor    eax,eax
   2b927:	e8 84 55 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19492
   2b92c:	e9 0f 7a ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   2b931:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b938:	e8 d3 7a 00 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18845 (discriminator 2)
   2b93d:	85 c0                	test   eax,eax
   2b93f:	0f 84 44 ba ff ff    	je     27389 <JS_CallInternal+0x47e9>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18844 (discriminator 1)
   2b945:	4d 89 ec             	mov    r12,r13
   2b948:	e9 f3 79 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2b94d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b954:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b95b:	4c 89 f6             	mov    rsi,r14
   2b95e:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b965:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b969:	e8 32 0f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b96e:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b975:	e9 68 b6 ff ff       	jmp    26fe2 <JS_CallInternal+0x4442>
   2b97a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b981:	48 89 ce             	mov    rsi,rcx
   2b984:	4c 89 ea             	mov    rdx,r13
   2b987:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2b98e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b992:	e8 09 0f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b997:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2b99e:	e9 63 b6 ff ff       	jmp    27006 <JS_CallInternal+0x4466>
   2b9a3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b9aa:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b9ae:	e9 37 d8 ff ff       	jmp    291ea <JS_CallInternal+0x664a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20149
   2b9b3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20150
   2b9ba:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b9c1:	44 89 ea             	mov    edx,r13d
   2b9c4:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20149
   2b9c7:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20150
   2b9cb:	e8 a0 a3 02 00       	call   55d70 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20150 (discriminator 1)
   2b9d0:	85 c0                	test   eax,eax
   2b9d2:	0f 85 68 79 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20152
   2b9d8:	48 83 eb 10          	sub    rbx,0x10
   2b9dc:	e9 c8 af ff ff       	jmp    269a9 <JS_CallInternal+0x3e09>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7838
   2b9e1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b9e8:	48 8d 35 98 1b 0a 00 	lea    rsi,[rip+0xa1b98]        # cd587 <_IO_stdin_used+0x587>
   2b9ef:	31 c0                	xor    eax,eax
   2b9f1:	e8 ba 54 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8410
   2b9f6:	e9 61 b2 ff ff       	jmp    26c5c <JS_CallInternal+0x40bc>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7817
   2b9fb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ba02:	48 8d 35 70 1b 0a 00 	lea    rsi,[rip+0xa1b70]        # cd579 <_IO_stdin_used+0x579>
   2ba09:	31 c0                	xor    eax,eax
   2ba0b:	e8 a0 54 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8405
   2ba10:	e9 47 b2 ff ff       	jmp    26c5c <JS_CallInternal+0x40bc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 2)
   2ba15:	83 fe 08             	cmp    esi,0x8
   2ba18:	0f 84 6c 0c 00 00    	je     2c68a <JS_CallInternal+0x9aea>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 8)
   2ba1e:	85 f6                	test   esi,esi
   2ba20:	75 09                	jne    2ba2b <JS_CallInternal+0x8e8b>
   2ba22:	83 f9 08             	cmp    ecx,0x8
   2ba25:	0f 84 b6 0c 00 00    	je     2c6e1 <JS_CallInternal+0x9b41>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 20)
   2ba2b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2ba32:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ba39:	44 89 ea             	mov    edx,r13d
   2ba3c:	48 89 de             	mov    rsi,rbx
   2ba3f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2ba43:	e8 d8 f1 02 00       	call   5ac20 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 1)
   2ba48:	85 c0                	test   eax,eax
   2ba4a:	0f 85 f0 78 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 22)
   2ba50:	48 83 eb 10          	sub    rbx,0x10
   2ba54:	e9 bf b0 ff ff       	jmp    26b18 <JS_CallInternal+0x3f78>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 2)
   2ba59:	41 83 fd 08          	cmp    r13d,0x8
   2ba5d:	0f 84 6f 10 00 00    	je     2cad2 <JS_CallInternal+0x9f32>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 9)
   2ba63:	41 83 fd ff          	cmp    r13d,0xffffffff
   2ba67:	0f 84 34 10 00 00    	je     2caa1 <JS_CallInternal+0x9f01>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 16)
   2ba6d:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2ba71:	83 f9 01             	cmp    ecx,0x1
   2ba74:	0f 86 0a 0d 00 00    	jbe    2c784 <JS_CallInternal+0x9be4>
   2ba7a:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2ba81:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 23)
   2ba88:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2ba8c:	0f 85 7a e7 ff ff    	jne    2a20c <JS_CallInternal+0x766c>
   2ba92:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2ba96:	0f 85 70 e7 ff ff    	jne    2a20c <JS_CallInternal+0x766c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 29)
   2ba9c:	e8 6f c3 fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 1)
   2baa1:	4c 89 f6             	mov    rsi,r14
   2baa4:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2baab:	4c 89 ea             	mov    rdx,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 29)
   2baae:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 1)
   2bab4:	4c 89 f7             	mov    rdi,r14
   2bab7:	e8 44 0f ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 2)
   2babc:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2bac3:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2baca:	4c 89 f7             	mov    rdi,r14
   2bacd:	e8 2e 0f ff ff       	call   1ca00 <JS_FreeValue>
   2bad2:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2bad8:	e9 80 af ff ff       	jmp    26a5d <JS_CallInternal+0x3ebd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 2)
   2badd:	41 83 fd 08          	cmp    r13d,0x8
   2bae1:	0f 84 63 0a 00 00    	je     2c54a <JS_CallInternal+0x99aa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 9)
   2bae7:	41 83 fd ff          	cmp    r13d,0xffffffff
   2baeb:	0f 84 f2 09 00 00    	je     2c4e3 <JS_CallInternal+0x9943>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 16)
   2baf1:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2baf5:	83 f9 01             	cmp    ecx,0x1
   2baf8:	0f 86 b6 10 00 00    	jbe    2cbb4 <JS_CallInternal+0xa014>
   2bafe:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2bb05:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 23)
   2bb0c:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2bb10:	0f 85 2a e7 ff ff    	jne    2a240 <JS_CallInternal+0x76a0>
   2bb16:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2bb1a:	0f 85 20 e7 ff ff    	jne    2a240 <JS_CallInternal+0x76a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 29)
   2bb20:	e8 eb c2 fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 1)
   2bb25:	4c 89 f6             	mov    rsi,r14
   2bb28:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2bb2f:	4c 89 ea             	mov    rdx,r13
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 29)
   2bb32:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 1)
   2bb38:	4c 89 f7             	mov    rdi,r14
   2bb3b:	e8 c0 0e ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 2)
   2bb40:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2bb47:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2bb4e:	4c 89 f7             	mov    rdi,r14
   2bb51:	e8 aa 0e ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2bb56:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2bb5c:	85 c0                	test   eax,eax
   2bb5e:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2bb61:	e9 57 af ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
   2bb66:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   2bb6d:	00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19728
   2bb70:	66 0f ef c0          	pxor   xmm0,xmm0
   2bb74:	b8 08 00 00 00       	mov    eax,0x8
   2bb79:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
   2bb7e:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2bb83:	e9 23 b6 ff ff       	jmp    271ab <JS_CallInternal+0x460b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19687
   2bb88:	4c 89 f3             	mov    rbx,r14
   2bb8b:	e9 b0 77 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2bb90:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2bb94:	83 e8 01             	sub    eax,0x1
   2bb97:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2bb9b:	85 c0                	test   eax,eax
   2bb9d:	0f 8f b8 e7 ff ff    	jg     2a35b <JS_CallInternal+0x77bb>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2bba3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bbaa:	4c 89 ee             	mov    rsi,r13
   2bbad:	4c 89 f2             	mov    rdx,r14
   2bbb0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bbb4:	e8 e7 0c ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   2bbb9:	e9 9d e7 ff ff       	jmp    2a35b <JS_CallInternal+0x77bb>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19528
   2bbbe:	0f 85 c7 13 00 00    	jne    2cf8b <JS_CallInternal+0xa3eb>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2873
   2bbc4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bbcb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bbcf:	48 8b 87 f0 04 00 00 	mov    rax,QWORD PTR [rdi+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874
   2bbd6:	48 85 c0             	test   rax,rax
   2bbd9:	0f 84 5c 07 00 00    	je     2c33b <JS_CallInternal+0x979b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874 (discriminator 1)
   2bbdf:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2bbe3:	0f 84 52 07 00 00    	je     2c33b <JS_CallInternal+0x979b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19533
   2bbe9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bbf0:	44 89 ee             	mov    esi,r13d
   2bbf3:	e8 d8 74 00 00       	call   330d0 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2bbf8:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2bbff:	0f 8e 3b 77 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2bc05:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc0c:	44 89 ee             	mov    esi,r13d
   2bc0f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bc13:	e8 58 d8 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2bc18:	e9 23 77 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2bc1d:	4c 8b bd e8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x118]
   2bc24:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2bc28:	44 89 ea             	mov    edx,r13d
   2bc2b:	49 8b 7f 10          	mov    rdi,QWORD PTR [r15+0x10]
   2bc2f:	e8 dc b6 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7844 (discriminator 1)
   2bc34:	48 8d 35 79 19 0a 00 	lea    rsi,[rip+0xa1979]        # cd5b4 <_IO_stdin_used+0x5b4>
   2bc3b:	4c 89 ff             	mov    rdi,r15
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2bc3e:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7844 (discriminator 1)
   2bc41:	31 c0                	xor    eax,eax
   2bc43:	e8 58 73 00 00       	call   32fa0 <JS_ThrowReferenceError>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2bc48:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2bc4f:	0f 8e eb 76 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2bc55:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc5c:	44 89 ee             	mov    esi,r13d
   2bc5f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bc63:	e8 08 d8 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2bc68:	e9 d3 76 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7901
   2bc6d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bc74:	e8 97 77 00 00       	call   33410 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18856 (discriminator 2)
   2bc79:	85 c0                	test   eax,eax
   2bc7b:	0f 84 64 cf ff ff    	je     28be5 <JS_CallInternal+0x6045>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18855
   2bc81:	4d 89 ec             	mov    r12,r13
   2bc84:	e9 b7 76 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 6)
   2bc89:	41 0f b6 40 10       	movzx  eax,BYTE PTR [r8+0x10]
   2bc8e:	45 8b 68 0c          	mov    r13d,DWORD PTR [r8+0xc]
   2bc92:	3c 1f                	cmp    al,0x1f
   2bc94:	0f 86 5a 06 00 00    	jbe    2c2f4 <JS_CallInternal+0x9754>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 13)
   2bc9a:	3c 20                	cmp    al,0x20
   2bc9c:	0f 85 f4 d7 ff ff    	jne    29496 <JS_CallInternal+0x68f6>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 14)
   2bca2:	89 fa                	mov    edx,edi
   2bca4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bcab:	4c 89 c9             	mov    rcx,r9
   2bcae:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2bcb5:	e8 56 27 ff ff       	call   1e410 <rdi_exit.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 16)
   2bcba:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   2bcc1:	e9 d0 d7 ff ff       	jmp    29496 <JS_CallInternal+0x68f6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19733
   2bcc6:	41 83 fb 08          	cmp    r11d,0x8
   2bcca:	0f 84 90 0a 00 00    	je     2c760 <JS_CallInternal+0x9bc0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19733 (discriminator 1)
   2bcd0:	83 ff 08             	cmp    edi,0x8
   2bcd3:	0f 84 2e 04 00 00    	je     2c107 <JS_CallInternal+0x9567>
JS_IsString():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:653
   2bcd9:	83 c6 07             	add    esi,0x7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19752 (discriminator 1)
   2bcdc:	83 fe 01             	cmp    esi,0x1
   2bcdf:	0f 86 0b 0a 00 00    	jbe    2c6f0 <JS_CallInternal+0x9b50>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19759
   2bce5:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19760
   2bcec:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bcf3:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19759
   2bcf6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19760
   2bcfa:	e8 f1 ab 02 00       	call   568f0 <js_add_slow>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19760 (discriminator 1)
   2bcff:	85 c0                	test   eax,eax
   2bd01:	0f 85 39 76 ff ff    	jne    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19762
   2bd07:	48 83 eb 10          	sub    rbx,0x10
   2bd0b:	e9 a3 b4 ff ff       	jmp    271b3 <JS_CallInternal+0x4613>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2bd10:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd17:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd1b:	e8 80 0b ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19606
   2bd20:	e9 a5 ca ff ff       	jmp    287ca <JS_CallInternal+0x5c2a>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2bd25:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd2c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd30:	e8 6b 0b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bd35:	e9 c6 bd ff ff       	jmp    27b00 <JS_CallInternal+0x4f60>
   2bd3a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd41:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd45:	e8 56 0b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bd4a:	e9 5a ca ff ff       	jmp    287a9 <JS_CallInternal+0x5c09>
   2bd4f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd56:	4c 89 ee             	mov    rsi,r13
   2bd59:	4c 89 f2             	mov    rdx,r14
   2bd5c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd60:	e8 3b 0b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bd65:	e9 af bd ff ff       	jmp    27b19 <JS_CallInternal+0x4f79>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19583 (discriminator 1)
   2bd6a:	39 c2                	cmp    edx,eax
   2bd6c:	0f 85 1c de ff ff    	jne    29b8e <JS_CallInternal+0x6fee>
can_extend_fast_array():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9959
   2bd72:	0f b6 51 10          	movzx  edx,BYTE PTR [rcx+0x10]
   2bd76:	f7 d2                	not    edx
   2bd78:	83 e2 12             	and    edx,0x12
   2bd7b:	0f 85 0d de ff ff    	jne    29b8e <JS_CallInternal+0x6fee>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9961
   2bd81:	48 8b 79 18          	mov    rdi,QWORD PTR [rcx+0x18]
   2bd85:	48 8b 57 30          	mov    rdx,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9962
   2bd89:	48 85 d2             	test   rdx,rdx
   2bd8c:	74 0a                	je     2bd98 <JS_CallInternal+0x91f8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19583 (discriminator 2)
   2bd8e:	f6 42 10 01          	test   BYTE PTR [rdx+0x10],0x1
   2bd92:	0f 84 f6 dd ff ff    	je     29b8e <JS_CallInternal+0x6fee>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19588
   2bd98:	48 8b 71 20          	mov    rsi,QWORD PTR [rcx+0x20]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19588 (discriminator 1)
   2bd9c:	44 8b 56 08          	mov    r10d,DWORD PTR [rsi+0x8]
   2bda0:	45 85 d2             	test   r10d,r10d
   2bda3:	0f 85 e5 dd ff ff    	jne    29b8e <JS_CallInternal+0x6fee>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19591
   2bda9:	8d 50 01             	lea    edx,[rax+0x1]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19592 (discriminator 1)
   2bdac:	39 51 28             	cmp    DWORD PTR [rcx+0x28],edx
   2bdaf:	0f 82 d9 dd ff ff    	jb     29b8e <JS_CallInternal+0x6fee>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19595
   2bdb5:	39 16                	cmp    DWORD PTR [rsi],edx
   2bdb7:	73 1c                	jae    2bdd5 <JS_CallInternal+0x9235>
get_shape_prop():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5138
   2bdb9:	44 8b 47 18          	mov    r8d,DWORD PTR [rdi+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19596 (discriminator 2)
   2bdbd:	42 f6 44 87 3f 08    	test   BYTE PTR [rdi+r8*4+0x3f],0x8
   2bdc3:	0f 84 c5 dd ff ff    	je     29b8e <JS_CallInternal+0x6fee>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   2bdc9:	89 d7                	mov    edi,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19598
   2bdcb:	45 31 c9             	xor    r9d,r9d
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:562
   2bdce:	48 89 3e             	mov    QWORD PTR [rsi],rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19598
   2bdd1:	4c 89 4e 08          	mov    QWORD PTR [rsi+0x8],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19600
   2bdd5:	89 51 38             	mov    DWORD PTR [rcx+0x38],edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19601
   2bdd8:	89 c0                	mov    eax,eax
   2bdda:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   2bddf:	48 c1 e0 04          	shl    rax,0x4
   2bde3:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
   2bde7:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   2bdea:	e9 ba c9 ff ff       	jmp    287a9 <JS_CallInternal+0x5c09>
   2bdef:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19652
   2bdf0:	4c 89 f3             	mov    rbx,r14
   2bdf3:	e9 48 75 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   2bdf8:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   2bdfa:	25 ff ff ff 03       	and    eax,0x3ffffff
   2bdff:	0f 85 75 c2 ff ff    	jne    2807a <JS_CallInternal+0x54da>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2be05:	48 8b bd 28 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1d8]
   2be0c:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2be10:	e8 fb b4 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7738 (discriminator 1)
   2be15:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2be1c:	48 8d 35 5d 50 0a 00 	lea    rsi,[rip+0xa505d]        # d0e80 <_IO_stdin_used+0x3e80>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2be23:	48 89 c2             	mov    rdx,rax
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7738 (discriminator 1)
   2be26:	31 c0                	xor    eax,eax
   2be28:	e8 83 50 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8448
   2be2d:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2be30:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2be34:	31 c9                	xor    ecx,ecx
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8448
   2be36:	41 b8 06 00 00 00    	mov    r8d,0x6
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8448
   2be3c:	b8 06 00 00 00       	mov    eax,0x6
   2be41:	e9 67 c2 ff ff       	jmp    280ad <JS_CallInternal+0x550d>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   2be46:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   2be48:	25 ff ff ff 03       	and    eax,0x3ffffff
   2be4d:	0f 85 81 c3 ff ff    	jne    281d4 <JS_CallInternal+0x5634>
JS_ThrowTypeErrorPrivateNotFound():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:8389
   2be53:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2be5a:	48 8d 0d e3 12 0a 00 	lea    rcx,[rip+0xa12e3]        # cd144 <_IO_stdin_used+0x144>
   2be61:	31 c0                	xor    eax,eax
   2be63:	48 8d 15 16 50 0a 00 	lea    rdx,[rip+0xa5016]        # d0e80 <_IO_stdin_used+0x3e80>
   2be6a:	e8 51 52 00 00       	call   310c0 <__JS_ThrowTypeErrorAtom>
   2be6f:	e9 20 f2 ff ff       	jmp    2b094 <JS_CallInternal+0x84f4>
   2be74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2be78:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2be7f:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2be85:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2be89:	e8 12 0a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2be8e:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2be94:	e9 e9 b8 ff ff       	jmp    27782 <JS_CallInternal+0x4be2>
   2be99:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bea0:	4c 89 f6             	mov    rsi,r14
   2bea3:	4c 89 ea             	mov    rdx,r13
   2bea6:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2beac:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2beb0:	e8 eb 09 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2beb5:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2bebb:	e9 db b8 ff ff       	jmp    2779b <JS_CallInternal+0x4bfb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19870 (discriminator 1)
   2bec0:	09 ca                	or     edx,ecx
   2bec2:	0f 89 a6 b1 ff ff    	jns    2706e <JS_CallInternal+0x44ce>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19871
   2bec8:	f2 0f 10 05 30 ec 0a 	movsd  xmm0,QWORD PTR [rip+0xaec30]        # dab00 <typed_array_size_log2+0x28>
   2becf:	00 
   2bed0:	e9 96 ef ff ff       	jmp    2ae6b <JS_CallInternal+0x82cb>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2bed5:	3d f2 00 00 00       	cmp    eax,0xf2
   2beda:	7e 43                	jle    2bf1f <JS_CallInternal+0x937f>
   2bedc:	31 d2                	xor    edx,edx
   2bede:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2bee5:	89 c0                	mov    eax,eax
   2bee7:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2beeb:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   2bef2:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2bef6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2bef9:	83 e8 01             	sub    eax,0x1
   2befc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2beff:	85 c0                	test   eax,eax
   2bf01:	7f 13                	jg     2bf16 <JS_CallInternal+0x9376>
   2bf03:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2bf0a:	e8 f1 94 fe ff       	call   15400 <JS_FreeAtomStruct>
   2bf0f:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30944
   2bf16:	48 85 d2             	test   rdx,rdx
   2bf19:	0f 85 72 97 ff ff    	jne    25691 <JS_CallInternal+0x2af1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30946
   2bf1f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bf26:	48 8d 35 1b 4e 0a 00 	lea    rsi,[rip+0xa4e1b]        # d0d48 <_IO_stdin_used+0x3d48>
   2bf2d:	31 c0                	xor    eax,eax
   2bf2f:	e8 7c 4f 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18024
   2bf34:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
   2bf3b:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2bf42:	00 
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:643
   2bf43:	e9 e8 95 ff ff       	jmp    25530 <JS_CallInternal+0x2990>
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:609
   2bf48:	89 c8                	mov    eax,ecx
   2bf4a:	31 d2                	xor    edx,edx
   2bf4c:	e9 2e b6 ff ff       	jmp    2757f <JS_CallInternal+0x49df>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2bf51:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bf58:	48 8d 45 80          	lea    rax,[rbp-0x80]
   2bf5c:	89 f2                	mov    edx,esi
   2bf5e:	48 89 c6             	mov    rsi,rax
   2bf61:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2bf65:	e8 a6 b3 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2bf6a:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2bf6d:	e9 76 86 ff ff       	jmp    245e8 <JS_CallInternal+0x1a48>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17962
   2bf72:	8b 85 88 fe ff ff    	mov    eax,DWORD PTR [rbp-0x178]
   2bf78:	83 e8 02             	sub    eax,0x2
   2bf7b:	83 f8 01             	cmp    eax,0x1
   2bf7e:	0f 87 ae 07 00 00    	ja     2c732 <JS_CallInternal+0x9b92>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17963
   2bf84:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bf8b:	48 8b 88 80 01 00 00 	mov    rcx,QWORD PTR [rax+0x180]
   2bf92:	48 8b 80 88 01 00 00 	mov    rax,QWORD PTR [rax+0x188]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2bf99:	83 f8 f6             	cmp    eax,0xfffffff6
   2bf9c:	0f 86 f0 97 ff ff    	jbe    25792 <JS_CallInternal+0x2bf2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2bfa2:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   2bfa6:	e9 e7 97 ff ff       	jmp    25792 <JS_CallInternal+0x2bf2>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18823
   2bfab:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   2bfb2:	4c 89 ee             	mov    rsi,r13
   2bfb5:	e8 d6 47 ff ff       	call   20790 <free_var_ref>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18824
   2bfba:	e9 6c 73 ff ff       	jmp    2332b <JS_CallInternal+0x78b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20564
   2bfbf:	0f 85 e1 76 ff ff    	jne    236a6 <JS_CallInternal+0xb06>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2873
   2bfc5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bfcc:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2bfd0:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874
   2bfd7:	48 85 c0             	test   rax,rax
   2bfda:	0f 84 56 76 ff ff    	je     23636 <JS_CallInternal+0xa96>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874 (discriminator 1)
   2bfe0:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2bfe4:	0f 84 4c 76 ff ff    	je     23636 <JS_CallInternal+0xa96>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20567
   2bfea:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   2bff0:	e8 db 70 00 00       	call   330d0 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20568
   2bff5:	e9 ac 76 ff ff       	jmp    236a6 <JS_CallInternal+0xb06>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2bffa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c001:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c005:	e8 96 08 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c00a:	e9 8b 76 ff ff       	jmp    2369a <JS_CallInternal+0xafa>
   2c00f:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2c016:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c01d:	4c 89 c2             	mov    rdx,r8
   2c020:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2c027:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c02b:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2c031:	e8 6a 08 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c036:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   2c03d:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2c044:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2c04a:	e9 07 de ff ff       	jmp    29e56 <JS_CallInternal+0x72b6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19411
   2c04f:	4d 89 f4             	mov    r12,r14
   2c052:	e9 e9 72 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 26)
   2c057:	8b 49 10             	mov    ecx,DWORD PTR [rcx+0x10]
   2c05a:	81 e1 08 00 ff ff    	and    ecx,0xffff0008
   2c060:	81 f9 00 00 01 00    	cmp    ecx,0x10000
   2c066:	0f 85 81 80 ff ff    	jne    240ed <JS_CallInternal+0x154d>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 28)
   2c06c:	80 78 10 00          	cmp    BYTE PTR [rax+0x10],0x0
   2c070:	0f 84 77 80 ff ff    	je     240ed <JS_CallInternal+0x154d>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 30)
   2c076:	41 80 78 10 1f       	cmp    BYTE PTR [r8+0x10],0x1f
   2c07b:	0f 87 6c 80 ff ff    	ja     240ed <JS_CallInternal+0x154d>
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:32
   2c081:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 31)
   2c084:	48 c1 fa 04          	sar    rdx,0x4
   2c088:	49 89 d6             	mov    r14,rdx
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:32
   2c08b:	48 39 c6             	cmp    rsi,rax
   2c08e:	74 46                	je     2c0d6 <JS_CallInternal+0x9536>
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5305 (discriminator 1)
   2c090:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5338
   2c094:	48 85 f6             	test   rsi,rsi
   2c097:	74 3a                	je     2c0d3 <JS_CallInternal+0x9533>
   2c099:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5339
   2c0a0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c0a7:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2c0ae:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c0b2:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2c0b9:	e8 f2 21 ff ff       	call   1e2b0 <js_free_shape>
   2c0be:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2c0c5:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2c0cc:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:39
   2c0d3:	49 89 00             	mov    QWORD PTR [r8],rax
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:40
   2c0d6:	45 89 70 08          	mov    DWORD PTR [r8+0x8],r14d
   2c0da:	e9 0e 80 ff ff       	jmp    240ed <JS_CallInternal+0x154d>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c0df:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c0e6:	48 89 c6             	mov    rsi,rax
   2c0e9:	4c 89 ca             	mov    rdx,r9
   2c0ec:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c0f0:	e8 ab 07 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c0f5:	e9 8b dd ff ff       	jmp    29e85 <JS_CallInternal+0x72e5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19981
   2c0fa:	f2 0f 10 05 4e 73 0a 	movsd  xmm0,QWORD PTR [rip+0xa734e]        # d3450 <__PRETTY_FUNCTION__.0+0xc0>
   2c101:	00 
   2c102:	e9 db d5 ff ff       	jmp    296e2 <JS_CallInternal+0x6b42>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19738
   2c107:	45 85 db             	test   r11d,r11d
   2c10a:	0f 85 d5 fb ff ff    	jne    2bce5 <JS_CallInternal+0x9145>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19739
   2c110:	66 0f ef c9          	pxor   xmm1,xmm1
   2c114:	f2 41 0f 2a ca       	cvtsi2sd xmm1,r10d
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19744
   2c119:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19750
   2c11e:	f2 0f 58 c1          	addsd  xmm0,xmm1
   2c122:	48 c7 43 e8 08 00 00 	mov    QWORD PTR [rbx-0x18],0x8
   2c129:	00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19751
   2c12a:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19750
   2c12e:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19734
   2c133:	e9 7b b0 ff ff       	jmp    271b3 <JS_CallInternal+0x4613>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c138:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c13f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c143:	e8 58 07 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c148:	e9 a0 da ff ff       	jmp    29bed <JS_CallInternal+0x704d>
   2c14d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c154:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2c15b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c15f:	e8 3c 07 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c164:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2c16b:	e9 dd d5 ff ff       	jmp    2974d <JS_CallInternal+0x6bad>
   2c170:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c177:	4c 89 ee             	mov    rsi,r13
   2c17a:	4c 89 f2             	mov    rdx,r14
   2c17d:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2c183:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c187:	e8 14 07 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c18c:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2c192:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2c199:	e9 14 db ff ff       	jmp    29cb2 <JS_CallInternal+0x7112>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 26)
   2c19e:	41 8b 76 10          	mov    esi,DWORD PTR [r14+0x10]
   2c1a2:	81 e6 08 00 ff ff    	and    esi,0xffff0008
   2c1a8:	81 fe 00 00 01 00    	cmp    esi,0x10000
   2c1ae:	0f 85 45 80 ff ff    	jne    241f9 <JS_CallInternal+0x1659>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 28)
   2c1b4:	80 7a 10 00          	cmp    BYTE PTR [rdx+0x10],0x0
   2c1b8:	0f 84 3b 80 ff ff    	je     241f9 <JS_CallInternal+0x1659>
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 30)
   2c1be:	41 80 78 10 1f       	cmp    BYTE PTR [r8+0x10],0x1f
   2c1c3:	0f 87 30 80 ff ff    	ja     241f9 <JS_CallInternal+0x1659>
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:32
   2c1c9:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 31)
   2c1cc:	48 c1 f9 04          	sar    rcx,0x4
   2c1d0:	49 89 ce             	mov    r14,rcx
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:32
   2c1d3:	48 39 d6             	cmp    rsi,rdx
   2c1d6:	74 54                	je     2c22c <JS_CallInternal+0x968c>
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5305 (discriminator 1)
   2c1d8:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5338
   2c1dc:	48 85 f6             	test   rsi,rsi
   2c1df:	74 48                	je     2c229 <JS_CallInternal+0x9689>
   2c1e1:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:5339
   2c1e8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c1ef:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
   2c1f6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c1fa:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2c201:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2c208:	e8 a3 20 ff ff       	call   1e2b0 <js_free_shape>
   2c20d:	48 8b 95 28 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1d8]
   2c214:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   2c21b:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   2c222:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:39
   2c229:	49 89 10             	mov    QWORD PTR [r8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_runtime.inc:40
   2c22c:	45 89 70 08          	mov    DWORD PTR [r8+0x8],r14d
   2c230:	e9 c4 7f ff ff       	jmp    241f9 <JS_CallInternal+0x1659>
   2c235:	0f 1f 00             	nop    DWORD PTR [rax]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19977
   2c238:	f2 0f 10 05 c0 e8 0a 	movsd  xmm0,QWORD PTR [rip+0xae8c0]        # dab00 <typed_array_size_log2+0x28>
   2c23f:	00 
   2c240:	e9 9d d4 ff ff       	jmp    296e2 <JS_CallInternal+0x6b42>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19792
   2c245:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19789 (discriminator 1)
   2c24c:	41 83 fe f9          	cmp    r14d,0xfffffff9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19792
   2c250:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19789 (discriminator 1)
   2c254:	0f 84 7c 0c 00 00    	je     2ced6 <JS_CallInternal+0xa336>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19806
   2c25a:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2c25e:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   2c262:	e9 e1 ec ff ff       	jmp    2af48 <JS_CallInternal+0x83a8>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c267:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c26e:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2c275:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c279:	e8 22 06 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c27e:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2c285:	e9 e8 d6 ff ff       	jmp    29972 <JS_CallInternal+0x6dd2>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 11)
   2c28a:	83 c2 01             	add    edx,0x1
   2c28d:	41 88 50 10          	mov    BYTE PTR [r8+0x10],dl
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:80 (discriminator 13)
   2c291:	80 fa 20             	cmp    dl,0x20
   2c294:	0f 85 55 d2 ff ff    	jne    294ef <JS_CallInternal+0x694f>
   2c29a:	e9 bc ed ff ff       	jmp    2b05b <JS_CallInternal+0x84bb>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c29f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c2a6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c2aa:	e8 f1 05 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c2af:	e9 4d c8 ff ff       	jmp    28b01 <JS_CallInternal+0x5f61>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19633
   2c2b4:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c2bb:	48 8b 91 88 01 00 00 	mov    rdx,QWORD PTR [rcx+0x188]
   2c2c2:	48 8b 81 80 01 00 00 	mov    rax,QWORD PTR [rcx+0x180]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2c2c9:	83 fa f6             	cmp    edx,0xfffffff6
   2c2cc:	76 04                	jbe    2c2d2 <JS_CallInternal+0x9732>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2c2ce:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19633
   2c2d2:	48 89 43 d0          	mov    QWORD PTR [rbx-0x30],rax
   2c2d6:	48 89 53 d8          	mov    QWORD PTR [rbx-0x28],rdx
   2c2da:	e9 1a b6 ff ff       	jmp    278f9 <JS_CallInternal+0x4d59>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6162
   2c2df:	8b 12                	mov    edx,DWORD PTR [rdx]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6155
   2c2e1:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   2c2e7:	0f 85 c4 ab ff ff    	jne    26eb1 <JS_CallInternal+0x4311>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6165
   2c2ed:	31 d2                	xor    edx,edx
   2c2ef:	e9 cd ab ff ff       	jmp    26ec1 <JS_CallInternal+0x4321>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 11)
   2c2f4:	83 c0 01             	add    eax,0x1
   2c2f7:	41 88 40 10          	mov    BYTE PTR [r8+0x10],al
/home/mzyx/read_ic_dequickening_attempt01/R/read_ic_opcodes.inc:83 (discriminator 13)
   2c2fb:	3c 20                	cmp    al,0x20
   2c2fd:	0f 85 93 d1 ff ff    	jne    29496 <JS_CallInternal+0x68f6>
   2c303:	e9 9a f9 ff ff       	jmp    2bca2 <JS_CallInternal+0x9102>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20546
   2c308:	0f 85 98 73 ff ff    	jne    236a6 <JS_CallInternal+0xb06>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2873
   2c30e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c315:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2c319:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874
   2c320:	48 85 c0             	test   rax,rax
   2c323:	74 0a                	je     2c32f <JS_CallInternal+0x978f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2874 (discriminator 1)
   2c325:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2c329:	0f 85 bb fc ff ff    	jne    2bfea <JS_CallInternal+0x944a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20552
   2c32f:	b8 03 00 00 00       	mov    eax,0x3
   2c334:	31 c9                	xor    ecx,ecx
   2c336:	e9 df 73 ff ff       	jmp    2371a <JS_CallInternal+0xb7a>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2c33b:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2c342:	0f 8f 90 05 00 00    	jg     2c8d8 <JS_CallInternal+0x9d38>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19537
   2c348:	b8 03 00 00 00       	mov    eax,0x3
   2c34d:	31 c9                	xor    ecx,ecx
   2c34f:	e9 cf c3 ff ff       	jmp    28723 <JS_CallInternal+0x5b83>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19482
   2c354:	45 85 ed             	test   r13d,r13d
   2c357:	0f 85 ae f5 ff ff    	jne    2b90b <JS_CallInternal+0x8d6b>
   2c35d:	e9 1a dc ff ff       	jmp    29f7c <JS_CallInternal+0x73dc>
   2c362:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:689
   2c368:	83 f9 f6             	cmp    ecx,0xfffffff6
   2c36b:	0f 86 7b f2 ff ff    	jbe    2b5ec <JS_CallInternal+0x8a4c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:691
   2c371:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   2c375:	83 e8 01             	sub    eax,0x1
   2c378:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   2c37c:	85 c0                	test   eax,eax
   2c37e:	0f 8f 68 f2 ff ff    	jg     2b5ec <JS_CallInternal+0x8a4c>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c384:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c38b:	4c 89 c6             	mov    rsi,r8
   2c38e:	48 89 ca             	mov    rdx,rcx
   2c391:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c395:	e8 06 05 ff ff       	call   1c8a0 <__JS_FreeValueRT>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:9660 (discriminator 1)
   2c39a:	e9 4d f2 ff ff       	jmp    2b5ec <JS_CallInternal+0x8a4c>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c39f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c3a6:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2c3ad:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2c3b4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c3b8:	e8 e3 04 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c3bd:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2c3c4:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2c3cb:	e9 b0 8c ff ff       	jmp    25080 <JS_CallInternal+0x24e0>
js_malloc_rt():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:1811
   2c3d0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c3d7:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16196
   2c3de:	48 63 d7             	movsxd rdx,edi
   2c3e1:	48 c1 e2 04          	shl    rdx,0x4
   2c3e5:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
js_malloc_rt():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:1811
   2c3ec:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c3f0:	48 89 d6             	mov    rsi,rdx
   2c3f3:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2c3fa:	e8 51 85 fe ff       	call   14950 <__js_malloc>
js_malloc():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:1843 (discriminator 1)
   2c3ff:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c406:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2c40d:	48 85 c0             	test   rax,rax
   2c410:	48 8b 8d 38 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c8]
   2c417:	0f 84 1c 09 00 00    	je     2cd39 <JS_CallInternal+0xa199>
   2c41d:	4c 8b 95 a8 fe ff ff 	mov    r10,QWORD PTR [rbp-0x158]
   2c424:	31 f6                	xor    esi,esi
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16200
   2c426:	4d 8b 44 32 08       	mov    r8,QWORD PTR [r10+rsi*1+0x8]
   2c42b:	49 8b 3c 32          	mov    rdi,QWORD PTR [r10+rsi*1]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2c42f:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   2c433:	76 04                	jbe    2c439 <JS_CallInternal+0x9899>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2c435:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16200
   2c439:	48 89 3c 30          	mov    QWORD PTR [rax+rsi*1],rdi
   2c43d:	4c 89 44 30 08       	mov    QWORD PTR [rax+rsi*1+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16199 (discriminator 1)
   2c442:	48 83 c6 10          	add    rsi,0x10
   2c446:	48 39 f2             	cmp    rdx,rsi
   2c449:	75 db                	jne    2c426 <JS_CallInternal+0x9886>
   2c44b:	e9 9b 91 ff ff       	jmp    255eb <JS_CallInternal+0x2a4b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18310
   2c450:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c457:	48 8d 35 5a 49 0a 00 	lea    rsi,[rip+0xa495a]        # d0db8 <_IO_stdin_used+0x3db8>
   2c45e:	31 c0                	xor    eax,eax
   2c460:	e8 4b 4a 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18311
   2c465:	e9 d6 6e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c46a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c471:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c475:	e8 26 04 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c47a:	e9 29 73 ff ff       	jmp    237a8 <JS_CallInternal+0xc08>
   2c47f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c486:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c48a:	e8 11 04 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c48f:	e9 17 d2 ff ff       	jmp    296ab <JS_CallInternal+0x6b0b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 7)
   2c494:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 12)
   2c499:	83 f9 08             	cmp    ecx,0x8
   2c49c:	74 36                	je     2c4d4 <JS_CallInternal+0x9934>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 15)
   2c49e:	85 c9                	test   ecx,ecx
   2c4a0:	0f 85 fc f0 ff ff    	jne    2b5a2 <JS_CallInternal+0x8a02>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 17)
   2c4a6:	66 0f ef c9          	pxor   xmm1,xmm1
   2c4aa:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 19)
   2c4ae:	31 c0                	xor    eax,eax
   2c4b0:	66 0f 2f c8          	comisd xmm1,xmm0
   2c4b4:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c4bb:	00 
   2c4bc:	0f 93 c0             	setae  al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 1)
   2c4bf:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 19)
   2c4c3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292
   2c4c7:	e9 dc a6 ff ff       	jmp    26ba8 <JS_CallInternal+0x4008>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 10)
   2c4cc:	66 0f ef c0          	pxor   xmm0,xmm0
   2c4d0:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20292 (discriminator 14)
   2c4d4:	66 48 0f 6e ca       	movq   xmm1,rdx
   2c4d9:	eb d3                	jmp    2c4ae <JS_CallInternal+0x990e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20464
   2c4db:	4d 89 ec             	mov    r12,r13
   2c4de:	e9 5d 6e ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 15)
   2c4e3:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c4e7:	83 fa 01             	cmp    edx,0x1
   2c4ea:	0f 86 82 09 00 00    	jbe    2ce72 <JS_CallInternal+0xa2d2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 18)
   2c4f0:	83 c0 01             	add    eax,0x1
   2c4f3:	0f 85 47 dd ff ff    	jne    2a240 <JS_CallInternal+0x76a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 19)
   2c4f9:	4d 39 ce             	cmp    r14,r9
   2c4fc:	4c 89 f6             	mov    rsi,r14
   2c4ff:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2c506:	4c 89 ea             	mov    rdx,r13
   2c509:	0f 94 c0             	sete   al
   2c50c:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2c513:	4c 89 f7             	mov    rdi,r14
   2c516:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2c51c:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c523:	e8 d8 04 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 1)
   2c528:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2c52f:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2c536:	4c 89 f7             	mov    rdi,r14
   2c539:	e8 c2 04 ff ff       	call   1ca00 <JS_FreeValue>
   2c53e:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c545:	e9 73 a5 ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 8)
   2c54a:	45 85 c0             	test   r8d,r8d
   2c54d:	0f 85 b0 02 00 00    	jne    2c803 <JS_CallInternal+0x9c63>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 10)
   2c553:	66 0f ef c0          	pxor   xmm0,xmm0
   2c557:	66 49 0f 6e ee       	movq   xmm5,r14
   2c55c:	ba 00 00 00 00       	mov    edx,0x0
   2c561:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2c566:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2c56a:	0f 9b c0             	setnp  al
   2c56d:	0f 45 c2             	cmovne eax,edx
   2c570:	e9 48 a5 ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 7)
   2c575:	66 48 0f 6e ca       	movq   xmm1,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 12)
   2c57a:	83 f9 08             	cmp    ecx,0x8
   2c57d:	0f 84 6e 02 00 00    	je     2c7f1 <JS_CallInternal+0x9c51>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 15)
   2c583:	85 c9                	test   ecx,ecx
   2c585:	0f 85 4e ed ff ff    	jne    2b2d9 <JS_CallInternal+0x8739>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 17)
   2c58b:	66 0f ef c0          	pxor   xmm0,xmm0
   2c58f:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 19)
   2c593:	31 c0                	xor    eax,eax
   2c595:	66 0f 2f c8          	comisd xmm1,xmm0
   2c599:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c5a0:	00 
   2c5a1:	0f 97 c0             	seta   al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 1)
   2c5a4:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 19)
   2c5a8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293
   2c5ac:	e9 af a5 ff ff       	jmp    26b60 <JS_CallInternal+0x3fc0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19676
   2c5b1:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2c5b8:	e9 83 6d ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c5bd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c5c4:	4c 89 ee             	mov    rsi,r13
   2c5c7:	48 89 da             	mov    rdx,rbx
   2c5ca:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c5ce:	e8 cd 02 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c5d3:	e9 d6 f2 ff ff       	jmp    2b8ae <JS_CallInternal+0x8d0e>
   2c5d8:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2c5df:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c5e6:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2c5ed:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c5f1:	e8 aa 02 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c5f6:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2c5fd:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2c604:	e9 6b d9 ff ff       	jmp    29f74 <JS_CallInternal+0x73d4>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2c609:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c610:	89 c2                	mov    edx,eax
   2c612:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c616:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c61a:	e8 f1 ac fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c61f:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2c622:	e9 3d f2 ff ff       	jmp    2b864 <JS_CallInternal+0x8cc4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19880
   2c627:	66 48 0f 6e c9       	movq   xmm1,rcx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19886
   2c62c:	83 f8 08             	cmp    eax,0x8
   2c62f:	0f 84 6b e8 ff ff    	je     2aea0 <JS_CallInternal+0x8300>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19888
   2c635:	85 c0                	test   eax,eax
   2c637:	0f 85 5a 76 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19889
   2c63d:	66 0f ef c0          	pxor   xmm0,xmm0
   2c641:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   2c645:	e9 5b e8 ff ff       	jmp    2aea5 <JS_CallInternal+0x8305>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2c64a:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c651:	89 c2                	mov    edx,eax
   2c653:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c657:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c65b:	e8 b0 ac fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c660:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2c663:	e9 82 ed ff ff       	jmp    2b3ea <JS_CallInternal+0x884a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19710
   2c668:	4d 89 ec             	mov    r12,r13
   2c66b:	e9 d0 6c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7817
   2c670:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c677:	48 8d 35 fb 0e 0a 00 	lea    rsi,[rip+0xa0efb]        # cd579 <_IO_stdin_used+0x579>
   2c67e:	31 c0                	xor    eax,eax
   2c680:	e8 2b 48 00 00       	call   30eb0 <JS_ThrowTypeError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19665
   2c685:	e9 b6 6c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 7)
   2c68a:	66 48 0f 6e ca       	movq   xmm1,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 12)
   2c68f:	83 f9 08             	cmp    ecx,0x8
   2c692:	74 55                	je     2c6e9 <JS_CallInternal+0x9b49>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 15)
   2c694:	85 c9                	test   ecx,ecx
   2c696:	0f 85 8f f3 ff ff    	jne    2ba2b <JS_CallInternal+0x8e8b>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 17)
   2c69c:	66 0f ef c0          	pxor   xmm0,xmm0
   2c6a0:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 19)
   2c6a4:	31 c0                	xor    eax,eax
   2c6a6:	66 0f 2f c8          	comisd xmm1,xmm0
   2c6aa:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c6b1:	00 
   2c6b2:	0f 93 c0             	setae  al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 1)
   2c6b5:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 19)
   2c6b9:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294
   2c6bd:	e9 56 a4 ff ff       	jmp    26b18 <JS_CallInternal+0x3f78>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c6c2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c6c9:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c6d0:	4c 89 ee             	mov    rsi,r13
   2c6d3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c6d7:	e8 c4 01 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c6dc:	e9 97 a5 ff ff       	jmp    26c78 <JS_CallInternal+0x40d8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 10)
   2c6e1:	66 0f ef c9          	pxor   xmm1,xmm1
   2c6e5:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20294 (discriminator 14)
   2c6e9:	66 48 0f 6e c0       	movq   xmm0,rax
   2c6ee:	eb b4                	jmp    2c6a4 <JS_CallInternal+0x9b04>
JS_IsString():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:653
   2c6f0:	83 c1 07             	add    ecx,0x7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19752 (discriminator 1)
   2c6f3:	83 f9 01             	cmp    ecx,0x1
   2c6f6:	0f 87 e9 f5 ff ff    	ja     2bce5 <JS_CallInternal+0x9145>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19753
   2c6fc:	4c 89 c1             	mov    rcx,r8
   2c6ff:	49 89 f8             	mov    r8,rdi
   2c702:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c709:	4c 89 d6             	mov    rsi,r10
   2c70c:	4c 89 da             	mov    rdx,r11
   2c70f:	e8 fc 42 01 00       	call   40a10 <JS_ConcatString>
   2c714:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19754
   2c718:	48 8d 43 f0          	lea    rax,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19753
   2c71c:	48 89 53 e8          	mov    QWORD PTR [rbx-0x18],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19755 (discriminator 1)
   2c720:	83 7b e8 06          	cmp    DWORD PTR [rbx-0x18],0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19754
   2c724:	48 89 c3             	mov    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19755 (discriminator 1)
   2c727:	0f 85 86 aa ff ff    	jne    271b3 <JS_CallInternal+0x4613>
   2c72d:	e9 0e 6c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17965
   2c732:	48 8b b5 78 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x188]
   2c739:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
   2c740:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c747:	e8 24 c0 01 00       	call   48770 <JS_ToObject>
   2c74c:	48 89 c1             	mov    rcx,rax
   2c74f:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17966 (discriminator 1)
   2c752:	83 fa 06             	cmp    edx,0x6
   2c755:	0f 85 37 90 ff ff    	jne    25792 <JS_CallInternal+0x2bf2>
   2c75b:	e9 e0 6b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19737
   2c760:	66 49 0f 6e ca       	movq   xmm1,r10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19743
   2c765:	83 ff 08             	cmp    edi,0x8
   2c768:	0f 84 ab f9 ff ff    	je     2c119 <JS_CallInternal+0x9579>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19745
   2c76e:	85 ff                	test   edi,edi
   2c770:	0f 85 6f f5 ff ff    	jne    2bce5 <JS_CallInternal+0x9145>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19746
   2c776:	66 0f ef c0          	pxor   xmm0,xmm0
   2c77a:	f2 41 0f 2a c0       	cvtsi2sd xmm0,r8d
   2c77f:	e9 9a f9 ff ff       	jmp    2c11e <JS_CallInternal+0x957e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 22)
   2c784:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c788:	83 fa 01             	cmp    edx,0x1
   2c78b:	0f 86 15 07 00 00    	jbe    2cea6 <JS_CallInternal+0xa306>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 25)
   2c791:	83 c0 01             	add    eax,0x1
   2c794:	0f 85 72 da ff ff    	jne    2a20c <JS_CallInternal+0x766c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 26)
   2c79a:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2c79f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c7a6:	4c 89 c2             	mov    rdx,r8
   2c7a9:	83 e0 01             	and    eax,0x1
   2c7ac:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c7b2:	e8 49 02 ff ff       	call   1ca00 <JS_FreeValue>
   2c7b7:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2c7bd:	e9 9b a2 ff ff       	jmp    26a5d <JS_CallInternal+0x3ebd>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c7c2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c7c9:	4c 89 c6             	mov    rsi,r8
   2c7cc:	4c 89 e2             	mov    rdx,r12
   2c7cf:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2c7d5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c7d9:	e8 c2 00 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c7de:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2c7e4:	e9 54 c8 ff ff       	jmp    2903d <JS_CallInternal+0x649d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 10)
   2c7e9:	66 0f ef c9          	pxor   xmm1,xmm1
   2c7ed:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20293 (discriminator 14)
   2c7f1:	66 48 0f 6e c0       	movq   xmm0,rax
   2c7f6:	e9 98 fd ff ff       	jmp    2c593 <JS_CallInternal+0x99f3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18834
   2c7fb:	4d 89 ec             	mov    r12,r13
   2c7fe:	e9 3d 6b ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 11)
   2c803:	41 83 f8 08          	cmp    r8d,0x8
   2c807:	0f 85 33 da ff ff    	jne    2a240 <JS_CallInternal+0x76a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 12)
   2c80d:	66 49 0f 6e c6       	movq   xmm0,r14
   2c812:	66 49 0f 6e f1       	movq   xmm6,r9
   2c817:	ba 00 00 00 00       	mov    edx,0x0
   2c81c:	66 0f 2e c6          	ucomisd xmm0,xmm6
   2c820:	0f 9b c0             	setnp  al
   2c823:	0f 45 c2             	cmovne eax,edx
   2c826:	e9 92 a2 ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2c82b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c832:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c839:	4c 89 ee             	mov    rsi,r13
   2c83c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c840:	e8 5b 00 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c845:	e9 66 e8 ff ff       	jmp    2b0b0 <JS_CallInternal+0x8510>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20705
   2c84a:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20707
   2c851:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20706
   2c858:	31 d2                	xor    edx,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20705
   2c85a:	f3 0f 6f 90 d8 04 00 	movdqu xmm2,XMMWORD PTR [rax+0x4d8]
   2c861:	00 
   2c862:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
   2c866:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20706
   2c86d:	48 89 90 d8 04 00 00 	mov    QWORD PTR [rax+0x4d8],rdx
   2c874:	48 c7 80 e0 04 00 00 	mov    QWORD PTR [rax+0x4e0],0x4
   2c87b:	04 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20707
   2c87f:	49 63 c5             	movsxd rax,r13d
   2c882:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20708
   2c886:	e9 d6 65 ff ff       	jmp    22e61 <JS_CallInternal+0x2c1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19785 (discriminator 1)
   2c88b:	41 83 fe 08          	cmp    r14d,0x8
   2c88f:	0f 84 23 06 00 00    	je     2ceb8 <JS_CallInternal+0xa318>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19805
   2c895:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2c89c:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19806
   2c8a0:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2c8a4:	e9 9f e6 ff ff       	jmp    2af48 <JS_CallInternal+0x83a8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19833
   2c8a9:	66 48 0f 6e c7       	movq   xmm0,rdi
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19839
   2c8ae:	83 f8 08             	cmp    eax,0x8
   2c8b1:	0f 84 2e e6 ff ff    	je     2aee5 <JS_CallInternal+0x8345>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19841
   2c8b7:	85 c0                	test   eax,eax
   2c8b9:	0f 85 d8 73 ff ff    	jne    23c97 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19842
   2c8bf:	66 0f ef c9          	pxor   xmm1,xmm1
   2c8c3:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   2c8c7:	e9 1e e6 ff ff       	jmp    2aeea <JS_CallInternal+0x834a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17992
   2c8cc:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c8cf:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17993
   2c8d3:	e9 58 8c ff ff       	jmp    25530 <JS_CallInternal+0x2990>
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2c8d8:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   2c8df:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2c8e3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2c8e6:	83 e8 01             	sub    eax,0x1
   2c8e9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2c8ec:	85 c0                	test   eax,eax
   2c8ee:	0f 8f 54 fa ff ff    	jg     2c348 <JS_CallInternal+0x97a8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2c8f4:	e8 07 8b fe ff       	call   15400 <JS_FreeAtomStruct>
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:643
   2c8f9:	e9 4a fa ff ff       	jmp    2c348 <JS_CallInternal+0x97a8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 24)
   2c8fe:	4d 89 c1             	mov    r9,r8
   2c901:	48 89 d7             	mov    rdi,rdx
   2c904:	45 31 c0             	xor    r8d,r8d
   2c907:	4c 89 ea             	mov    rdx,r13
   2c90a:	4c 89 ce             	mov    rsi,r9
   2c90d:	4c 89 f1             	mov    rcx,r14
   2c910:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2c917:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c91e:	e8 ad db fe ff       	call   1a4d0 <js_strict_eq2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 1)
   2c923:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2c92a:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 24)
   2c931:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 1)
   2c937:	e9 4a ea ff ff       	jmp    2b386 <JS_CallInternal+0x87e6>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 16)
   2c93c:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 13)
   2c93e:	41 83 fe ff          	cmp    r14d,0xffffffff
   2c942:	75 08                	jne    2c94c <JS_CallInternal+0x9dac>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 15)
   2c944:	31 c0                	xor    eax,eax
   2c946:	4c 39 ea             	cmp    rdx,r13
   2c949:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 18)
   2c94c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c953:	48 89 d6             	mov    rsi,rdx
   2c956:	4c 89 c2             	mov    rdx,r8
   2c959:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c95f:	e8 9c 00 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 1)
   2c964:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c96b:	4c 89 ee             	mov    rsi,r13
   2c96e:	4c 89 f2             	mov    rdx,r14
   2c971:	e8 8a 00 ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2c976:	48 63 85 50 fe ff ff 	movsxd rax,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2c97d:	e9 c8 ae ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 7)
   2c982:	45 85 f6             	test   r14d,r14d
   2c985:	0f 85 d6 02 00 00    	jne    2cc61 <JS_CallInternal+0xa0c1>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 9)
   2c98b:	66 0f ef c0          	pxor   xmm0,xmm0
   2c98f:	66 48 0f 6e e2       	movq   xmm4,rdx
   2c994:	31 c0                	xor    eax,eax
   2c996:	ba 00 00 00 00       	mov    edx,0x0
   2c99b:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
   2c9a0:	66 0f 2e c4          	ucomisd xmm0,xmm4
   2c9a4:	0f 9b c0             	setnp  al
   2c9a7:	48 0f 45 c2          	cmovne rax,rdx
   2c9ab:	e9 9a ae ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2c9b0:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c9b7:	89 c2                	mov    edx,eax
   2c9b9:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c9bd:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c9c1:	e8 4a a9 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c9c6:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3601
   2c9c9:	e9 57 ea ff ff       	jmp    2b425 <JS_CallInternal+0x8885>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 16)
   2c9ce:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 13)
   2c9d0:	41 83 fe ff          	cmp    r14d,0xffffffff
   2c9d4:	75 08                	jne    2c9de <JS_CallInternal+0x9e3e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 15)
   2c9d6:	31 c0                	xor    eax,eax
   2c9d8:	4c 39 ea             	cmp    rdx,r13
   2c9db:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 18)
   2c9de:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c9e5:	48 89 d6             	mov    rsi,rdx
   2c9e8:	4c 89 ca             	mov    rdx,r9
   2c9eb:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c9f1:	e8 0a 00 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   2c9f6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c9fd:	4c 89 ee             	mov    rsi,r13
   2ca00:	4c 89 f2             	mov    rdx,r14
   2ca03:	e8 f8 ff fe ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ca08:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2ca0e:	83 f0 01             	xor    eax,0x1
   2ca11:	48 98                	cdqe
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ca13:	e9 de ad ff ff       	jmp    277f6 <JS_CallInternal+0x4c56>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 7)
   2ca18:	45 85 f6             	test   r14d,r14d
   2ca1b:	75 3f                	jne    2ca5c <JS_CallInternal+0x9ebc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 9)
   2ca1d:	66 0f ef c0          	pxor   xmm0,xmm0
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ca21:	66 48 0f 6e fa       	movq   xmm7,rdx
   2ca26:	31 c0                	xor    eax,eax
   2ca28:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 9)
   2ca2d:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ca32:	66 0f 2e c7          	ucomisd xmm0,xmm7
   2ca36:	0f 9a c0             	setp   al
   2ca39:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ca3d:	e9 b4 ad ff ff       	jmp    277f6 <JS_CallInternal+0x4c56>
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15955
   2ca42:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ca49:	48 8d 35 78 0b 0a 00 	lea    rsi,[rip+0xa0b78]        # cd5c8 <_IO_stdin_used+0x5c8>
   2ca50:	31 c0                	xor    eax,eax
   2ca52:	e8 59 44 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15956
   2ca57:	e9 e4 68 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 10)
   2ca5c:	41 83 fe 08          	cmp    r14d,0x8
   2ca60:	0f 85 93 03 00 00    	jne    2cdf9 <JS_CallInternal+0xa259>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ca66:	66 48 0f 6e c2       	movq   xmm0,rdx
   2ca6b:	66 49 0f 6e cd       	movq   xmm1,r13
   2ca70:	31 c0                	xor    eax,eax
   2ca72:	ba 01 00 00 00       	mov    edx,0x1
   2ca77:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2ca7b:	0f 9a c0             	setp   al
   2ca7e:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ca82:	e9 6f ad ff ff       	jmp    277f6 <JS_CallInternal+0x4c56>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18298
   2ca87:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2ca8e:	48 8d 35 e3 42 0a 00 	lea    rsi,[rip+0xa42e3]        # d0d78 <_IO_stdin_used+0x3d78>
   2ca95:	31 c0                	xor    eax,eax
   2ca97:	e8 14 44 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18299
   2ca9c:	e9 9f 68 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 15)
   2caa1:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2caa5:	83 fa 01             	cmp    edx,0x1
   2caa8:	0f 86 20 03 00 00    	jbe    2cdce <JS_CallInternal+0xa22e>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 18)
   2caae:	83 c0 01             	add    eax,0x1
   2cab1:	0f 85 55 d7 ff ff    	jne    2a20c <JS_CallInternal+0x766c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 19)
   2cab7:	31 c0                	xor    eax,eax
   2cab9:	4d 39 ce             	cmp    r14,r9
   2cabc:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2cac3:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2caca:	0f 94 c0             	sete   al
   2cacd:	e9 cf ef ff ff       	jmp    2baa1 <JS_CallInternal+0x8f01>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 8)
   2cad2:	45 85 c0             	test   r8d,r8d
   2cad5:	75 1f                	jne    2caf6 <JS_CallInternal+0x9f56>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 10)
   2cad7:	66 0f ef c0          	pxor   xmm0,xmm0
   2cadb:	66 49 0f 6e ce       	movq   xmm1,r14
   2cae0:	31 d2                	xor    edx,edx
   2cae2:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2cae7:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2caeb:	0f 9b c2             	setnp  dl
   2caee:	0f 44 c2             	cmove  eax,edx
   2caf1:	e9 67 9f ff ff       	jmp    26a5d <JS_CallInternal+0x3ebd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 11)
   2caf6:	41 83 f8 08          	cmp    r8d,0x8
   2cafa:	0f 85 0c d7 ff ff    	jne    2a20c <JS_CallInternal+0x766c>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 12)
   2cb00:	66 49 0f 6e c6       	movq   xmm0,r14
   2cb05:	66 49 0f 6e d1       	movq   xmm2,r9
   2cb0a:	31 c0                	xor    eax,eax
   2cb0c:	ba 00 00 00 00       	mov    edx,0x0
   2cb11:	66 0f 2e c2          	ucomisd xmm0,xmm2
   2cb15:	0f 9b c0             	setnp  al
   2cb18:	0f 45 c2             	cmovne eax,edx
   2cb1b:	e9 3d 9f ff ff       	jmp    26a5d <JS_CallInternal+0x3ebd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 7)
   2cb20:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 12)
   2cb25:	83 f9 08             	cmp    ecx,0x8
   2cb28:	74 36                	je     2cb60 <JS_CallInternal+0x9fc0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 15)
   2cb2a:	85 c9                	test   ecx,ecx
   2cb2c:	0f 85 b5 ec ff ff    	jne    2b7e7 <JS_CallInternal+0x8c47>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 17)
   2cb32:	66 0f ef c9          	pxor   xmm1,xmm1
   2cb36:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 19)
   2cb3a:	31 c0                	xor    eax,eax
   2cb3c:	66 0f 2f c8          	comisd xmm1,xmm0
   2cb40:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2cb47:	00 
   2cb48:	0f 97 c0             	seta   al
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 1)
   2cb4b:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 19)
   2cb4f:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291
   2cb53:	e9 4b ad ff ff       	jmp    278a3 <JS_CallInternal+0x4d03>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 10)
   2cb58:	66 0f ef c0          	pxor   xmm0,xmm0
   2cb5c:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20291 (discriminator 14)
   2cb60:	66 48 0f 6e ca       	movq   xmm1,rdx
   2cb65:	eb d3                	jmp    2cb3a <JS_CallInternal+0x9f9a>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18013
   2cb67:	31 c0                	xor    eax,eax
   2cb69:	48 c7 43 08 03 00 00 	mov    QWORD PTR [rbx+0x8],0x3
   2cb70:	00 
   2cb71:	48 89 03             	mov    QWORD PTR [rbx],rax
   2cb74:	e9 36 89 ff ff       	jmp    254af <JS_CallInternal+0x290f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 24)
   2cb79:	48 89 d7             	mov    rdi,rdx
   2cb7c:	4c 89 ce             	mov    rsi,r9
   2cb7f:	45 31 c0             	xor    r8d,r8d
   2cb82:	4c 89 ea             	mov    rdx,r13
   2cb85:	4c 89 f1             	mov    rcx,r14
   2cb88:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2cb8f:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2cb96:	e8 35 d9 fe ff       	call   1a4d0 <js_strict_eq2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   2cb9b:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2cba2:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 24)
   2cba9:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2cbaf:	e9 cf eb ff ff       	jmp    2b783 <JS_CallInternal+0x8be3>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 22)
   2cbb4:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2cbb8:	83 fa 01             	cmp    edx,0x1
   2cbbb:	0f 86 c7 00 00 00    	jbe    2cc88 <JS_CallInternal+0xa0e8>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 25)
   2cbc1:	83 c0 01             	add    eax,0x1
   2cbc4:	0f 85 76 d6 ff ff    	jne    2a240 <JS_CallInternal+0x76a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 26)
   2cbca:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2cbcf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbd6:	4c 89 c2             	mov    rdx,r8
   2cbd9:	83 e0 01             	and    eax,0x1
   2cbdc:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2cbe2:	e8 19 fe fe ff       	call   1ca00 <JS_FreeValue>
   2cbe7:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2cbee:	e9 ca 9e ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18336
   2cbf3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbfa:	48 8d 35 ee 08 0a 00 	lea    rsi,[rip+0xa08ee]        # cd4ef <_IO_stdin_used+0x4ef>
   2cc01:	31 c0                	xor    eax,eax
   2cc03:	e8 a8 42 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18337
   2cc08:	e9 33 67 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:6516
   2cc0d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cc14:	48 89 ce             	mov    rsi,rcx
   2cc17:	48 89 da             	mov    rdx,rbx
   2cc1a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2cc1e:	e8 7d fc fe ff       	call   1c8a0 <__JS_FreeValueRT>
   2cc23:	e9 b1 d5 ff ff       	jmp    2a1d9 <JS_CallInternal+0x7639>
   2cc28:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cc2f:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2cc36:	48 89 de             	mov    rsi,rbx
   2cc39:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2cc3d:	e8 5e fc fe ff       	call   1c8a0 <__JS_FreeValueRT>
   2cc42:	e9 b9 d5 ff ff       	jmp    2a200 <JS_CallInternal+0x7660>
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16774
   2cc47:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc4e:	48 8d 35 0b 42 0a 00 	lea    rsi,[rip+0xa420b]        # d0e60 <_IO_stdin_used+0x3e60>
   2cc55:	31 c0                	xor    eax,eax
   2cc57:	e8 54 42 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16775
   2cc5c:	e9 df 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 10)
   2cc61:	41 83 fe 08          	cmp    r14d,0x8
   2cc65:	75 2b                	jne    2cc92 <JS_CallInternal+0xa0f2>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 11)
   2cc67:	66 48 0f 6e c2       	movq   xmm0,rdx
   2cc6c:	66 49 0f 6e ed       	movq   xmm5,r13
   2cc71:	31 c0                	xor    eax,eax
   2cc73:	ba 00 00 00 00       	mov    edx,0x0
   2cc78:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2cc7c:	0f 9b c0             	setnp  al
   2cc7f:	48 0f 45 c2          	cmovne rax,rdx
   2cc83:	e9 c2 ab ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
   2cc88:	b8 01 00 00 00       	mov    eax,0x1
   2cc8d:	e9 2b 9e ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 12)
   2cc92:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc99:	4c 89 ee             	mov    rsi,r13
   2cc9c:	4c 89 f2             	mov    rdx,r14
   2cc9f:	e8 5c fd fe ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 16)
   2cca4:	31 c0                	xor    eax,eax
   2cca6:	e9 9f ab ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19810 (discriminator 1)
   2ccab:	4d 89 cc             	mov    r12,r9
   2ccae:	e9 8d 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18493
   2ccb3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ccba:	89 ce                	mov    esi,ecx
   2ccbc:	e8 9f 63 00 00       	call   33060 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18494
   2ccc1:	e9 c2 d7 ff ff       	jmp    2a488 <JS_CallInternal+0x78e8>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2ccc6:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2cccd:	0f 8e 6d 66 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2ccd3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ccda:	44 89 ee             	mov    esi,r13d
   2ccdd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2cce1:	e8 8a c7 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2cce6:	e9 55 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20102
   2cceb:	4d 89 f4             	mov    r12,r14
   2ccee:	e9 4d 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19001
   2ccf3:	4d 89 f4             	mov    r12,r14
   2ccf6:	e9 45 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2ccfb:	3d f2 00 00 00       	cmp    eax,0xf2
   2cd00:	0f 8e 19 f2 ff ff    	jle    2bf1f <JS_CallInternal+0x937f>
   2cd06:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3436
   2cd0d:	89 c0                	mov    eax,eax
   2cd0f:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2cd13:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2cd1a:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3437 (discriminator 1)
   2cd1e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2cd21:	83 e8 01             	sub    eax,0x1
   2cd24:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2cd27:	85 c0                	test   eax,eax
   2cd29:	0f 8f f0 f1 ff ff    	jg     2bf1f <JS_CallInternal+0x937f>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3439
   2cd2f:	e8 cc 86 fe ff       	call   15400 <JS_FreeAtomStruct>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:30944
   2cd34:	e9 e6 f1 ff ff       	jmp    2bf1f <JS_CallInternal+0x937f>
JS_ThrowOutOfMemory():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7801
   2cd39:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cd40:	4c 8b 60 10          	mov    r12,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7802
   2cd44:	41 80 bc 24 e9 04 00 	cmp    BYTE PTR [r12+0x4e9],0x0
   2cd4b:	00 00 
   2cd4d:	74 3e                	je     2cd8d <JS_CallInternal+0xa1ed>
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:16207
   2cd4f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cd56:	4c 89 ce             	mov    rsi,r9
   2cd59:	48 89 ca             	mov    rdx,rcx
   2cd5c:	e8 9f fc fe ff       	call   1ca00 <JS_FreeValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:17992
   2cd61:	31 c0                	xor    eax,eax
   2cd63:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2cd6a:	00 
   2cd6b:	48 89 03             	mov    QWORD PTR [rbx],rax
   2cd6e:	e9 bd 87 ff ff       	jmp    25530 <JS_CallInternal+0x2990>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15980
   2cd73:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cd7a:	48 8d 35 47 08 0a 00 	lea    rsi,[rip+0xa0847]        # cd5c8 <_IO_stdin_used+0x5c8>
   2cd81:	31 c0                	xor    eax,eax
   2cd83:	e8 28 41 00 00       	call   30eb0 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:15981
   2cd88:	e9 b3 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_ThrowOutOfMemory():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7803
   2cd8d:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x1
   2cd94:	00 01 
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7804
   2cd96:	48 89 c7             	mov    rdi,rax
   2cd99:	31 c0                	xor    eax,eax
   2cd9b:	48 8d 35 3f 07 0a 00 	lea    rsi,[rip+0xa073f]        # cd4e1 <_IO_stdin_used+0x4e1>
   2cda2:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2cda9:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cdb0:	e8 db 64 00 00       	call   33290 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:7805
   2cdb5:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2cdbc:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x0
   2cdc3:	00 00 
   2cdc5:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cdcc:	eb 81                	jmp    2cd4f <JS_CallInternal+0xa1af>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 17)
   2cdce:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2cdd3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cdda:	4c 89 f6             	mov    rsi,r14
   2cddd:	4c 89 ea             	mov    rdx,r13
   2cde0:	83 e0 01             	and    eax,0x1
   2cde3:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2cde9:	e8 12 fc fe ff       	call   1ca00 <JS_FreeValue>
   2cdee:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2cdf4:	e9 64 9c ff ff       	jmp    26a5d <JS_CallInternal+0x3ebd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 12)
   2cdf9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ce00:	4c 89 ee             	mov    rsi,r13
   2ce03:	4c 89 f2             	mov    rdx,r14
   2ce06:	e8 f5 fb fe ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 1)
   2ce0b:	e9 4b d5 ff ff       	jmp    2a35b <JS_CallInternal+0x77bb>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20420 (discriminator 20)
   2ce10:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ce17:	45 39 f0             	cmp    r8d,r14d
   2ce1a:	4c 89 ee             	mov    rsi,r13
   2ce1d:	4c 89 f2             	mov    rdx,r14
   2ce20:	0f 94 85 50 fe ff ff 	sete   BYTE PTR [rbp-0x1b0]
   2ce27:	e8 d4 fb fe ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ce2c:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ce33:	e9 12 aa ff ff       	jmp    2784a <JS_CallInternal+0x4caa>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20734
   2ce38:	e8 93 4b fe ff       	call   119d0 <__stack_chk_fail@plt>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20421 (discriminator 20)
   2ce3d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ce44:	4c 89 ee             	mov    rsi,r13
   2ce47:	4c 89 f2             	mov    rdx,r14
   2ce4a:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2ce51:	e8 aa fb fe ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ce56:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2ce5d:	31 c0                	xor    eax,eax
   2ce5f:	44 39 f1             	cmp    ecx,r14d
   2ce62:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:557
   2ce65:	e9 8c a9 ff ff       	jmp    277f6 <JS_CallInternal+0x4c56>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20464
   2ce6a:	4d 89 ec             	mov    r12,r13
   2ce6d:	e9 ce 64 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20363 (discriminator 17)
   2ce72:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2ce77:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ce7e:	4c 89 f6             	mov    rsi,r14
   2ce81:	4c 89 ea             	mov    rdx,r13
   2ce84:	83 e0 01             	and    eax,0x1
   2ce87:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2ce8d:	e8 6e fb fe ff       	call   1ca00 <JS_FreeValue>
   2ce92:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2ce99:	e9 1f 9c ff ff       	jmp    26abd <JS_CallInternal+0x3f1d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19038
   2ce9e:	4c 89 eb             	mov    rbx,r13
   2cea1:	e9 9a 64 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20364 (discriminator 24)
   2cea6:	b8 01 00 00 00       	mov    eax,0x1
   2ceab:	e9 ad 9b ff ff       	jmp    26a5d <JS_CallInternal+0x3ebd>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:20076
   2ceb0:	4d 89 f4             	mov    r12,r14
   2ceb3:	e9 88 64 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19786
   2ceb8:	66 49 0f 6e c0       	movq   xmm0,r8
   2cebd:	f2 41 0f 58 45 00    	addsd  xmm0,QWORD PTR [r13+0x0]
   2cec3:	49 c7 45 08 08 00 00 	mov    QWORD PTR [r13+0x8],0x8
   2ceca:	00 
   2cecb:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19788
   2ced1:	e9 79 a2 ff ff       	jmp    2714f <JS_CallInternal+0x45af>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19793
   2ced6:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2ceda:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cee1:	4c 89 c2             	mov    rdx,r8
   2cee4:	4c 89 f1             	mov    rcx,r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19792
   2cee7:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19793
   2ceee:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2cef5:	e8 36 7f fe ff       	call   14e30 <JS_ConcatStringInPlace>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19793 (discriminator 1)
   2cefa:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2cf01:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2cf08:	85 c0                	test   eax,eax
   2cf0a:	75 60                	jne    2cf6c <JS_CallInternal+0xa3cc>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19796
   2cf0c:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2cf10:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:709
   2cf14:	83 fa f6             	cmp    edx,0xfffffff6
   2cf17:	76 04                	jbe    2cf1d <JS_CallInternal+0xa37d>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.h:711
   2cf19:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19796 (discriminator 1)
   2cf1d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cf24:	4c 89 c1             	mov    rcx,r8
   2cf27:	4d 89 f0             	mov    r8,r14
   2cf2a:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cf31:	e8 da 3a 01 00       	call   40a10 <JS_ConcatString>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19797 (discriminator 1)
   2cf36:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cf3d:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19796 (discriminator 1)
   2cf40:	49 89 c0             	mov    r8,rax
   2cf43:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19797 (discriminator 1)
   2cf46:	74 3b                	je     2cf83 <JS_CallInternal+0xa3e3>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2676
   2cf48:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2cf4c:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2677
   2cf50:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   2cf54:	4d 89 75 08          	mov    QWORD PTR [r13+0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:2678
   2cf58:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cf5f:	48 89 c6             	mov    rsi,rax
   2cf62:	e8 99 fa fe ff       	call   1ca00 <JS_FreeValue>
   2cf67:	e9 e3 a1 ff ff       	jmp    2714f <JS_CallInternal+0x45af>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:19794
   2cf6c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cf73:	4c 89 c6             	mov    rsi,r8
   2cf76:	4c 89 f2             	mov    rdx,r14
   2cf79:	e8 82 fa fe ff       	call   1ca00 <JS_FreeValue>
   2cf7e:	e9 cc a1 ff ff       	jmp    2714f <JS_CallInternal+0x45af>
   2cf83:	4d 89 cc             	mov    r12,r9
   2cf86:	e9 b5 63 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:3735 (discriminator 1)
   2cf8b:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2cf92:	0f 8e a8 63 ff ff    	jle    23340 <JS_CallInternal+0x7a0>
   2cf98:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cf9f:	44 89 ee             	mov    esi,r13d
   2cfa2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2cfa6:	e8 c5 c4 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2cfab:	e9 90 63 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18526
   2cfb0:	e8 ab 60 00 00       	call   33060 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/read_ic_dequickening_attempt01/R/quickjs.c:18517
   2cfb5:	4d 89 f4             	mov    r12,r14
   2cfb8:	e9 83 63 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2cfbd:	4d 89 f4             	mov    r12,r14
   2cfc0:	e9 7b 63 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>

Disassembly of section .fini:
