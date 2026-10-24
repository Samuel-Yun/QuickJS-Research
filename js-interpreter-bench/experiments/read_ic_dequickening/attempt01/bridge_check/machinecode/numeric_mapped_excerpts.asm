# M add_loc source-lines 19766..19814; disjoint DWARF-mapped instructions, not a complete CFG
   26f97:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   26f9c:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   26fa3:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
   26fa8:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   26fac:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   26fb0:	49 c1 e5 04          	shl    r13,0x4
   26fb4:	49 01 c5             	add    r13,rax
   26fb7:	44 89 f1             	mov    ecx,r14d
   26fba:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   26fbe:	09 d1                	or     ecx,edx
   26fc0:	0f 85 ca 43 00 00    	jne    2b390 <JS_CallInternal+0x88d0>
   26fc6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   26fca:	49 63 c8             	movsxd rcx,r8d
   26fcd:	48 63 d0             	movsxd rdx,eax
   26fd0:	44 01 c0             	add    eax,r8d
   26fd3:	48 01 ca             	add    rdx,rcx
   26fd6:	48 63 c8             	movsxd rcx,eax
   26fd9:	48 39 d1             	cmp    rcx,rdx
   26fdc:	0f 85 95 43 00 00    	jne    2b377 <JS_CallInternal+0x88b7>
   26fe8:	31 c0                	xor    eax,eax
   26fea:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
   26fee:	48 83 eb 10          	sub    rbx,0x10
   26ff2:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26ff8:	49 83 c4 02          	add    r12,0x2
   26ffc:	49 89 c5             	mov    r13,rax
   26fff:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27003:	ff e0                	jmp    rax
   27005:	f3 0f 1e fa          	endbr64
   2b377:	66 0f ef c0          	pxor   xmm0,xmm0
   2b37b:	b8 08 00 00 00       	mov    eax,0x8
   2b380:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
   2b385:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2b38b:	e9 5a bc ff ff       	jmp    26fea <JS_CallInternal+0x452a>
   2b394:	83 fa 08             	cmp    edx,0x8
   2b397:	0f 84 e6 12 00 00    	je     2c683 <JS_CallInternal+0x9bc3>
   2b39d:	83 fa f9             	cmp    edx,0xfffffff9
   2b3a0:	0f 84 25 0b 00 00    	je     2becb <JS_CallInternal+0x940b>
   2b3a6:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b3ad:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2b3b1:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2b3be:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b3c5:	48 8d b5 70 ff ff ff 	lea    rsi,[rbp-0x90]
   2b3cc:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2b3d3:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   2b3da:	48 89 95 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rdx
   2b3e1:	4c 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],r8
   2b3e8:	4c 89 b5 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],r14
   2b3ef:	e8 5c b2 02 00       	call   56650 <js_add_slow>
   2b3f4:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2b3fb:	85 c0                	test   eax,eax
   2b3fd:	0f 85 e8 17 00 00    	jne    2cbeb <JS_CallInternal+0xa12b>
   2becb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2bed2:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2bed6:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2beda:	0f 84 13 0d 00 00    	je     2cbf3 <JS_CallInternal+0xa133>
   2bee0:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2c683:	41 83 fe 08          	cmp    r14d,0x8
   2c687:	0f 84 89 03 00 00    	je     2ca16 <JS_CallInternal+0x9f56>
   2c68d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2c694:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2c698:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2ca16:	66 49 0f 6e c0       	movq   xmm0,r8
   2ca1b:	f2 41 0f 58 45 00    	addsd  xmm0,QWORD PTR [r13+0x0]
   2ca21:	49 c7 45 08 08 00 00 	mov    QWORD PTR [r13+0x8],0x8
   2ca28:	00 
   2ca29:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2ca2f:	e9 be a5 ff ff       	jmp    26ff2 <JS_CallInternal+0x4532>
   2cbeb:	4d 89 cc             	mov    r12,r9
   2cbee:	e9 6d 66 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2cbf3:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2cbf7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbfe:	4c 89 c2             	mov    rdx,r8
   2cc01:	4c 89 f1             	mov    rcx,r14
   2cc04:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2cc0b:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2cc12:	e8 19 82 fe ff       	call   14e30 <JS_ConcatStringInPlace>
   2cc17:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2cc1e:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2cc25:	85 c0                	test   eax,eax
   2cc27:	75 60                	jne    2cc89 <JS_CallInternal+0xa1c9>
   2cc29:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2cc2d:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2cc3a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc41:	4c 89 c1             	mov    rcx,r8
   2cc44:	4d 89 f0             	mov    r8,r14
   2cc47:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cc4e:	e8 1d 3b 01 00       	call   40770 <JS_ConcatString>
   2cc53:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cc5a:	83 fa 06             	cmp    edx,0x6
   2cc5d:	49 89 c0             	mov    r8,rax
   2cc60:	49 89 d6             	mov    r14,rdx
   2cc63:	74 3b                	je     2cca0 <JS_CallInternal+0xa1e0>
   2cc89:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc90:	4c 89 c6             	mov    rsi,r8
   2cc93:	4c 89 f2             	mov    rdx,r14
   2cc96:	e8 65 fd fe ff       	call   1ca00 <JS_FreeValue>
   2cc9b:	e9 52 a3 ff ff       	jmp    26ff2 <JS_CallInternal+0x4532>
   2cca0:	4d 89 cc             	mov    r12,r9
   2cca3:	e9 b8 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>

# SW add_loc source-lines 19775..19823; disjoint DWARF-mapped instructions, not a complete CFG
   25eac:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   25eb1:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   25eb8:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
   25ebd:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   25ec1:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   25ec5:	49 c1 e5 04          	shl    r13,0x4
   25ec9:	49 01 c5             	add    r13,rax
   25ecc:	44 89 f1             	mov    ecx,r14d
   25ecf:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   25ed3:	09 d1                	or     ecx,edx
   25ed5:	0f 85 aa 5b 00 00    	jne    2ba85 <JS_CallInternal+0x8ee5>
   25edb:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   25edf:	49 63 c8             	movsxd rcx,r8d
   25ee2:	48 63 d0             	movsxd rdx,eax
   25ee5:	44 01 c0             	add    eax,r8d
   25ee8:	48 01 ca             	add    rdx,rcx
   25eeb:	48 63 c8             	movsxd rcx,eax
   25eee:	48 39 d1             	cmp    rcx,rdx
   25ef1:	0f 85 1f 5b 00 00    	jne    2ba16 <JS_CallInternal+0x8e76>
   25efd:	31 c0                	xor    eax,eax
   25eff:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
   25f03:	48 83 eb 10          	sub    rbx,0x10
   25f07:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   25f0d:	49 83 c4 02          	add    r12,0x2
   25f11:	49 89 c5             	mov    r13,rax
   25f14:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25f18:	ff e0                	jmp    rax
   25f1a:	f3 0f 1e fa          	endbr64
   2ba16:	66 0f ef c0          	pxor   xmm0,xmm0
   2ba1a:	b8 08 00 00 00       	mov    eax,0x8
   2ba1f:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
   2ba24:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2ba2a:	e9 d0 a4 ff ff       	jmp    25eff <JS_CallInternal+0x335f>
   2ba89:	83 fa 08             	cmp    edx,0x8
   2ba8c:	0f 84 1e 10 00 00    	je     2cab0 <JS_CallInternal+0x9f10>
   2ba92:	83 fa f9             	cmp    edx,0xfffffff9
   2ba95:	0f 84 43 07 00 00    	je     2c1de <JS_CallInternal+0x963e>
   2ba9b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2baa2:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2baa6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2bab3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2baba:	48 8d b5 70 ff ff ff 	lea    rsi,[rbp-0x90]
   2bac1:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2bac8:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   2bacf:	48 89 95 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rdx
   2bad6:	4c 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],r8
   2badd:	4c 89 b5 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],r14
   2bae4:	e8 b7 ac 02 00       	call   567a0 <js_add_slow>
   2bae9:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2baf0:	85 c0                	test   eax,eax
   2baf2:	0f 85 85 10 00 00    	jne    2cb7d <JS_CallInternal+0x9fdd>
   2c1de:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2c1e5:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2c1e9:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2c1ed:	0f 84 d8 09 00 00    	je     2cbcb <JS_CallInternal+0xa02b>
   2c1f3:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2cab0:	41 83 fe 08          	cmp    r14d,0x8
   2cab4:	0f 84 09 02 00 00    	je     2ccc3 <JS_CallInternal+0xa123>
   2caba:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2cac1:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2cac5:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2cb7d:	4d 89 cc             	mov    r12,r9
   2cb80:	e9 bb 67 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2cbcb:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2cbcf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbd6:	4c 89 c2             	mov    rdx,r8
   2cbd9:	4c 89 f1             	mov    rcx,r14
   2cbdc:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2cbe3:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2cbea:	e8 61 82 fe ff       	call   14e50 <JS_ConcatStringInPlace>
   2cbef:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2cbf6:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2cbfd:	85 c0                	test   eax,eax
   2cbff:	75 60                	jne    2cc61 <JS_CallInternal+0xa0c1>
   2cc01:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2cc05:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2cc12:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc19:	4c 89 c1             	mov    rcx,r8
   2cc1c:	4d 89 f0             	mov    r8,r14
   2cc1f:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cc26:	e8 95 3c 01 00       	call   408c0 <JS_ConcatString>
   2cc2b:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cc32:	83 fa 06             	cmp    edx,0x6
   2cc35:	49 89 c0             	mov    r8,rax
   2cc38:	49 89 d6             	mov    r14,rdx
   2cc3b:	74 3b                	je     2cc78 <JS_CallInternal+0xa0d8>
   2cc61:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc68:	4c 89 c6             	mov    rsi,r8
   2cc6b:	4c 89 f2             	mov    rdx,r14
   2cc6e:	e8 0d fe fe ff       	call   1ca80 <JS_FreeValue>
   2cc73:	e9 8f 92 ff ff       	jmp    25f07 <JS_CallInternal+0x3367>
   2cc78:	4d 89 cc             	mov    r12,r9
   2cc7b:	e9 c0 66 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>
   2ccc3:	66 49 0f 6e c0       	movq   xmm0,r8
   2ccc8:	f2 41 0f 58 45 00    	addsd  xmm0,QWORD PTR [r13+0x0]
   2ccce:	49 c7 45 08 08 00 00 	mov    QWORD PTR [r13+0x8],0x8
   2ccd5:	00 
   2ccd6:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2ccdc:	e9 26 92 ff ff       	jmp    25f07 <JS_CallInternal+0x3367>

# M inc_loc source-lines 20070..20095; disjoint DWARF-mapped instructions, not a complete CFG
   27813:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   27818:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   2781f:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   27824:	49 c1 e5 04          	shl    r13,0x4
   27828:	49 01 c5             	add    r13,rax
   2782b:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   27831:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
   27838:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
   2783f:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
   27846:	85 d2                	test   edx,edx
   27848:	0f 85 50 1c 00 00    	jne    2949e <JS_CallInternal+0x69de>
   2784e:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   27853:	0f 84 45 1c 00 00    	je     2949e <JS_CallInternal+0x69de>
   27859:	83 c0 01             	add    eax,0x1
   2785c:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   27863:	00 
   27868:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   2786e:	49 83 c4 02          	add    r12,0x2
   27872:	49 89 c5             	mov    r13,rax
   27875:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27879:	ff e0                	jmp    rax
   2787b:	f3 0f 1e fa          	endbr64
   2949e:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   294a5:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
   294b2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   294b9:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
   294c0:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   294c7:	ba 8d 00 00 00       	mov    edx,0x8d
   294cc:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
   294d3:	e8 48 bd 02 00       	call   55220 <js_unary_arith_slow>
   294d8:	85 c0                	test   eax,eax
   294da:	0f 85 57 38 00 00    	jne    2cd37 <JS_CallInternal+0xa277>
   2cd37:	4d 89 f4             	mov    r12,r14
   2cd3a:	e9 21 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>

# SW inc_loc source-lines 20079..20104; disjoint DWARF-mapped instructions, not a complete CFG
   26ea9:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   26eae:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   26eb5:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   26eba:	49 c1 e5 04          	shl    r13,0x4
   26ebe:	49 01 c5             	add    r13,rax
   26ec1:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   26ec7:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
   26ece:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
   26ed5:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
   26edc:	85 d2                	test   edx,edx
   26ede:	0f 85 2e 26 00 00    	jne    29512 <JS_CallInternal+0x6972>
   26ee4:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   26ee9:	0f 84 23 26 00 00    	je     29512 <JS_CallInternal+0x6972>
   26eef:	83 c0 01             	add    eax,0x1
   26ef2:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   26ef9:	00 
   26efe:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26f04:	49 83 c4 02          	add    r12,0x2
   26f08:	49 89 c5             	mov    r13,rax
   26f0b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f0f:	ff e0                	jmp    rax
   26f11:	f3 0f 1e fa          	endbr64
   29512:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   29519:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
   29526:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2952d:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
   29534:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   2953b:	ba 8d 00 00 00       	mov    edx,0x8d
   29540:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
   29547:	e8 24 be 02 00       	call   55370 <js_unary_arith_slow>
   2954c:	85 c0                	test   eax,eax
   2954e:	0f 85 f3 37 00 00    	jne    2cd47 <JS_CallInternal+0xa1a7>
   2cd47:	4d 89 f4             	mov    r12,r14
   2cd4a:	e9 f1 65 ff ff       	jmp    23340 <JS_CallInternal+0x7a0>

# M if_true8 source-lines 18902..18921; disjoint DWARF-mapped instructions, not a complete CFG
   281aa:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   281ae:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   281b2:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   281b7:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   281bb:	48 89 c8             	mov    rax,rcx
   281be:	0f 87 61 1a 00 00    	ja     29c25 <JS_CallInternal+0x7165>
   281c4:	48 83 eb 10          	sub    rbx,0x10
   281c8:	85 c0                	test   eax,eax
   281ca:	74 0d                	je     281d9 <JS_CallInternal+0x5719>
   281cc:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   281d1:	83 e8 01             	sub    eax,0x1
   281d4:	48 98                	cdqe
   281d6:	49 01 c5             	add    r13,rax
   281fd:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28202:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28206:	49 89 c5             	mov    r13,rax
   28209:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2820d:	f3 0f 1e fa          	endbr64
   29c25:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c2c:	48 89 ce             	mov    rsi,rcx
   29c2f:	e8 9c 4e ff ff       	call   1ead0 <JS_ToBoolFree>
   29c34:	e9 8b e5 ff ff       	jmp    281c4 <JS_CallInternal+0x5704>
   2b307:	85 c0                	test   eax,eax
   2b309:	0f 84 ee ce ff ff    	je     281fd <JS_CallInternal+0x573d>
   2b30f:	4d 89 ec             	mov    r12,r13
   2b312:	e9 49 7f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>

# SW if_true8 source-lines 18911..18930; disjoint DWARF-mapped instructions, not a complete CFG
   26a5e:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   26a62:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   26a66:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   26a6b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26a6f:	48 89 c8             	mov    rax,rcx
   26a72:	0f 87 28 32 00 00    	ja     29ca0 <JS_CallInternal+0x7100>
   26a78:	48 83 eb 10          	sub    rbx,0x10
   26a7c:	85 c0                	test   eax,eax
   26a7e:	74 0d                	je     26a8d <JS_CallInternal+0x3eed>
   26a80:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   26a85:	83 e8 01             	sub    eax,0x1
   26a88:	48 98                	cdqe
   26a8a:	49 01 c5             	add    r13,rax
   26ab1:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26ab6:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26aba:	49 89 c5             	mov    r13,rax
   26abd:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26ac1:	f3 0f 1e fa          	endbr64
   29ca0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ca7:	48 89 ce             	mov    rsi,rcx
   29caa:	e8 a1 4e ff ff       	call   1eb50 <JS_ToBoolFree>
   29caf:	e9 c4 cd ff ff       	jmp    26a78 <JS_CallInternal+0x3ed8>
   2b3be:	85 c0                	test   eax,eax
   2b3c0:	0f 84 eb b6 ff ff    	je     26ab1 <JS_CallInternal+0x3f11>
   2b3c6:	4d 89 ec             	mov    r12,r13
   2b3c9:	e9 72 7f ff ff       	jmp    23340 <JS_CallInternal+0x7a0>

# M return source-lines 18287..18306; disjoint DWARF-mapped instructions, not a complete CFG
   231a7:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   231ab:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   231af:	48 83 eb 10          	sub    rbx,0x10
   2648a:	83 f8 ff             	cmp    eax,0xffffffff
   2648d:	0f 84 1f 35 00 00    	je     299b2 <JS_CallInternal+0x6ef2>
   26493:	83 f8 03             	cmp    eax,0x3
   26496:	0f 85 2d 5e 00 00    	jne    2c2c9 <JS_CallInternal+0x9809>
   2649c:	b8 01 00 00 00       	mov    eax,0x1
   264a1:	48 89 03             	mov    QWORD PTR [rbx],rax
   264a4:	49 83 c4 01          	add    r12,0x1
   264a8:	48 83 c3 10          	add    rbx,0x10
   264ac:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   264b3:	00 
   264b4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   264ba:	49 89 c5             	mov    r13,rax
   264bd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   264c1:	ff e0                	jmp    rax
   264c3:	f3 0f 1e fa          	endbr64
   264c7:	b9 03 00 00 00       	mov    ecx,0x3
   264cc:	31 c0                	xor    eax,eax
   264ce:	e9 e0 cc ff ff       	jmp    231b3 <JS_CallInternal+0x6f3>
   264d3:	f3 0f 1e fa          	endbr64
   2c2c9:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2c2d0:	48 8d 35 21 4a 0a 00 	lea    rsi,[rip+0xa4a21]        # d0cf8 <_IO_stdin_used+0x3cf8>
   2c2d7:	31 c0                	xor    eax,eax
   2c2d9:	e8 42 49 00 00       	call   30c20 <JS_ThrowTypeError>
   2c2de:	e9 7d 6f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>

# SW return source-lines 18296..18315; disjoint DWARF-mapped instructions, not a complete CFG
   23287:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2328b:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2328f:	48 83 eb 10          	sub    rbx,0x10
   27320:	83 f8 ff             	cmp    eax,0xffffffff
   27323:	0f 84 07 29 00 00    	je     29c30 <JS_CallInternal+0x7090>
   27329:	83 f8 03             	cmp    eax,0x3
   2732c:	0f 85 3b 53 00 00    	jne    2c66d <JS_CallInternal+0x9acd>
   27332:	b8 01 00 00 00       	mov    eax,0x1
   27337:	48 89 03             	mov    QWORD PTR [rbx],rax
   2733a:	49 83 c4 01          	add    r12,0x1
   2733e:	48 83 c3 10          	add    rbx,0x10
   27342:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27349:	00 
   2734a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27350:	49 89 c5             	mov    r13,rax
   27353:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27357:	ff e0                	jmp    rax
   27359:	f3 0f 1e fa          	endbr64
   2735d:	b9 03 00 00 00       	mov    ecx,0x3
   27362:	31 c0                	xor    eax,eax
   27364:	e9 2a bf ff ff       	jmp    23293 <JS_CallInternal+0x6f3>
   27369:	f3 0f 1e fa          	endbr64
   2c66d:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2c674:	48 8d 35 bd 46 0a 00 	lea    rsi,[rip+0xa46bd]        # d0d38 <_IO_stdin_used+0x3d38>
   2c67b:	31 c0                	xor    eax,eax
   2c67d:	e8 ee 46 00 00       	call   30d70 <JS_ThrowTypeError>
   2c682:	e9 b9 6c ff ff       	jmp    23340 <JS_CallInternal+0x7a0>

