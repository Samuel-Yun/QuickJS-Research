
/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/lib/libJavaScriptCore.so.1.0.0:     file format elf64-x86-64


Disassembly of section .text:

000000000019f9d5 <llint_op_get_by_id>:
  19f9d5:	4b 0f be 44 05 02    	movsx  rax,BYTE PTR [r13+r8*1+0x2]
  19f9db:	48 83 f8 10          	cmp    rax,0x10
  19f9df:	7d 07                	jge    19f9e8 <llint_op_get_by_id+0x13>
  19f9e1:	48 8b 4c c5 00       	mov    rcx,QWORD PTR [rbp+rax*8+0x0]
  19f9e6:	eb 10                	jmp    19f9f8 <llint_op_get_by_id+0x23>
  19f9e8:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  19f9ec:	48 8b 89 a0 00 00 00 	mov    rcx,QWORD PTR [rcx+0xa0]
  19f9f3:	48 8b 4c c1 80       	mov    rcx,QWORD PTR [rcx+rax*8-0x80]
  19f9f8:	4c 85 f9             	test   rcx,r15
  19f9fb:	0f 85 9c 01 00 00    	jne    19fb9d <llint_op_get_by_id+0x1c8>
  19fa01:	41 0f b7 54 24 2a    	movzx  edx,WORD PTR [r12+0x2a]
  19fa07:	85 d2                	test   edx,edx
  19fa09:	75 08                	jne    19fa13 <llint_op_get_by_id+0x3e>
  19fa0b:	41 8b 94 24 bc 00 00 	mov    edx,DWORD PTR [r12+0xbc]
  19fa12:	00 
  19fa13:	43 0f b6 74 05 05    	movzx  esi,BYTE PTR [r13+r8*1+0x5]
  19fa19:	c1 e6 04             	shl    esi,0x4
  19fa1c:	01 f2                	add    edx,esi
  19fa1e:	4c 01 e2             	add    rdx,r12
  19fa21:	48 83 c2 07          	add    rdx,0x7
  19fa25:	48 83 e2 f8          	and    rdx,0xfffffffffffffff8
  19fa29:	0f b6 72 0e          	movzx  esi,BYTE PTR [rdx+0xe]
  19fa2d:	40 80 fe 01          	cmp    sil,0x1
  19fa31:	75 60                	jne    19fa93 <llint_op_get_by_id+0xbe>
  19fa33:	8b 31                	mov    esi,DWORD PTR [rcx]
  19fa35:	8b 02                	mov    eax,DWORD PTR [rdx]
  19fa37:	39 f0                	cmp    eax,esi
  19fa39:	0f 85 5e 01 00 00    	jne    19fb9d <llint_op_get_by_id+0x1c8>
  19fa3f:	48 63 72 04          	movsxd rsi,DWORD PTR [rdx+0x4]
  19fa43:	83 fe 40             	cmp    esi,0x40
  19fa46:	7c 0b                	jl     19fa53 <llint_op_get_by_id+0x7e>
  19fa48:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
  19fa4c:	f7 de                	neg    esi
  19fa4e:	48 63 f6             	movsxd rsi,esi
  19fa51:	eb 07                	jmp    19fa5a <llint_op_get_by_id+0x85>
  19fa53:	48 81 c1 20 fe ff ff 	add    rcx,0xfffffffffffffe20
  19fa5a:	48 8b 84 f1 f0 01 00 	mov    rax,QWORD PTR [rcx+rsi*8+0x1f0]
  19fa61:	00 
  19fa62:	43 0f b6 54 05 04    	movzx  edx,BYTE PTR [r13+r8*1+0x4]
  19fa68:	48 6b d2 f0          	imul   rdx,rdx,0xfffffffffffffff0
  19fa6c:	49 89 44 14 f0       	mov    QWORD PTR [r12+rdx*1-0x10],rax
  19fa71:	48 89 c2             	mov    rdx,rax
  19fa74:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  19fa7a:	48 89 54 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rdx
  19fa7f:	49 83 c0 06          	add    r8,0x6
  19fa83:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  19fa89:	48 8d 35 70 15 22 02 	lea    rsi,[rip+0x2221570]        # 23c1000 <os_script_config_storage>
  19fa90:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  19fa93:	40 84 f6             	test   sil,sil
  19fa96:	75 64                	jne    19fafc <llint_op_get_by_id+0x127>
  19fa98:	8b 31                	mov    esi,DWORD PTR [rcx]
  19fa9a:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  19fa9c:	39 f1                	cmp    ecx,esi
  19fa9e:	0f 85 f9 00 00 00    	jne    19fb9d <llint_op_get_by_id+0x1c8>
  19faa4:	48 63 72 04          	movsxd rsi,DWORD PTR [rdx+0x4]
  19faa8:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  19faac:	83 fe 40             	cmp    esi,0x40
  19faaf:	7c 0b                	jl     19fabc <llint_op_get_by_id+0xe7>
  19fab1:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
  19fab5:	f7 de                	neg    esi
  19fab7:	48 63 f6             	movsxd rsi,esi
  19faba:	eb 07                	jmp    19fac3 <llint_op_get_by_id+0xee>
  19fabc:	48 81 c1 20 fe ff ff 	add    rcx,0xfffffffffffffe20
  19fac3:	48 8b 84 f1 f0 01 00 	mov    rax,QWORD PTR [rcx+rsi*8+0x1f0]
  19faca:	00 
  19facb:	43 0f b6 54 05 04    	movzx  edx,BYTE PTR [r13+r8*1+0x4]
  19fad1:	48 6b d2 f0          	imul   rdx,rdx,0xfffffffffffffff0
  19fad5:	49 89 44 14 f0       	mov    QWORD PTR [r12+rdx*1-0x10],rax
  19fada:	48 89 c2             	mov    rdx,rax
  19fadd:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  19fae3:	48 89 54 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rdx
  19fae8:	49 83 c0 06          	add    r8,0x6
  19faec:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  19faf2:	48 8d 35 07 15 22 02 	lea    rsi,[rip+0x2221507]        # 23c1000 <os_script_config_storage>
  19faf9:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  19fafc:	40 80 fe 03          	cmp    sil,0x3
  19fb00:	75 5a                	jne    19fb5c <llint_op_get_by_id+0x187>
  19fb02:	0f b6 41 04          	movzx  eax,BYTE PTR [rcx+0x4]
  19fb06:	a9 01 00 00 00       	test   eax,0x1
  19fb0b:	0f 84 8c 00 00 00    	je     19fb9d <llint_op_get_by_id+0x1c8>
  19fb11:	a9 0e 00 00 00       	test   eax,0xe
  19fb16:	0f 84 81 00 00 00    	je     19fb9d <llint_op_get_by_id+0x1c8>
  19fb1c:	48 8b 41 08          	mov    rax,QWORD PTR [rcx+0x8]
  19fb20:	8b 40 f8             	mov    eax,DWORD PTR [rax-0x8]
  19fb23:	83 f8 00             	cmp    eax,0x0
  19fb26:	7c 75                	jl     19fb9d <llint_op_get_by_id+0x1c8>
  19fb28:	4c 09 f0             	or     rax,r14
  19fb2b:	43 0f b6 54 05 04    	movzx  edx,BYTE PTR [r13+r8*1+0x4]
  19fb31:	48 6b d2 f0          	imul   rdx,rdx,0xfffffffffffffff0
  19fb35:	49 89 44 14 f0       	mov    QWORD PTR [r12+rdx*1-0x10],rax
  19fb3a:	48 89 c2             	mov    rdx,rax
  19fb3d:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  19fb43:	48 89 54 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rdx
  19fb48:	49 83 c0 06          	add    r8,0x6
  19fb4c:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  19fb52:	48 8d 35 a7 14 22 02 	lea    rsi,[rip+0x22214a7]        # 23c1000 <os_script_config_storage>
  19fb59:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  19fb5c:	8b 31                	mov    esi,DWORD PTR [rcx]
  19fb5e:	8b 02                	mov    eax,DWORD PTR [rdx]
  19fb60:	39 f0                	cmp    eax,esi
  19fb62:	75 39                	jne    19fb9d <llint_op_get_by_id+0x1c8>
  19fb64:	43 0f b6 54 05 04    	movzx  edx,BYTE PTR [r13+r8*1+0x4]
  19fb6a:	48 6b d2 f0          	imul   rdx,rdx,0xfffffffffffffff0
  19fb6e:	49 c7 44 14 f0 0a 00 	mov    QWORD PTR [r12+rdx*1-0x10],0xa
  19fb75:	00 00 
  19fb77:	48 c7 c2 0a 00 00 00 	mov    rdx,0xa
  19fb7e:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  19fb84:	48 89 54 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rdx
  19fb89:	49 83 c0 06          	add    r8,0x6
  19fb8d:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  19fb93:	48 8d 35 66 14 22 02 	lea    rsi,[rip+0x2221466]        # 23c1000 <os_script_config_storage>
  19fb9a:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  19fb9d:	4d 01 e8             	add    r8,r13
  19fba0:	48 89 ef             	mov    rdi,rbp
  19fba3:	4c 89 c6             	mov    rsi,r8
  19fba6:	e8 e5 28 ef 00       	call   1092490 <llint_slow_path_get_by_id>
  19fbab:	48 83 fa ff          	cmp    rdx,0xffffffffffffffff
  19fbaf:	0f 84 63 6d 00 00    	je     1a6918 <llint_throw_from_slow_path_trampoline>
  19fbb5:	49 89 c0             	mov    r8,rax
  19fbb8:	4d 29 e8             	sub    r8,r13
  19fbbb:	49 83 c0 06          	add    r8,0x6
  19fbbf:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  19fbc5:	48 8d 35 34 14 22 02 	lea    rsi,[rip+0x2221434]        # 23c1000 <os_script_config_storage>
  19fbcc:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  19fbcf:	e8 dd 0e fe ff       	call   180ab1 <llint_crash>

000000000019fbd4 <op_get_by_id_return_location>:
  19fbd4:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  19fbd8:	8b 52 14             	mov    edx,DWORD PTR [rdx+0x14]
  19fbdb:	48 c1 e2 03          	shl    rdx,0x3
  19fbdf:	48 f7 da             	neg    rdx
  19fbe2:	48 01 ea             	add    rdx,rbp
  19fbe5:	48 89 d4             	mov    rsp,rdx
  19fbe8:	44 8b 45 24          	mov    r8d,DWORD PTR [rbp+0x24]
  19fbec:	43 0f b6 54 05 04    	movzx  edx,BYTE PTR [r13+r8*1+0x4]
  19fbf2:	48 6b d2 f0          	imul   rdx,rdx,0xfffffffffffffff0
  19fbf6:	49 89 44 14 f0       	mov    QWORD PTR [r12+rdx*1-0x10],rax
  19fbfb:	48 89 c2             	mov    rdx,rax
  19fbfe:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  19fc04:	48 89 54 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rdx
  19fc09:	49 83 c0 06          	add    r8,0x6
  19fc0d:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  19fc13:	48 8d 35 e6 13 22 02 	lea    rsi,[rip+0x22213e6]        # 23c1000 <os_script_config_storage>
  19fc1a:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  19fc1d:	55                   	push   rbp
  19fc1e:	01 00                	add    DWORD PTR [rax],eax
	...

000000000019fc21 <llint_op_get_by_id_wide16>:
  19fc21:	4b 0f bf 44 05 04    	movsx  rax,WORD PTR [r13+r8*1+0x4]
  19fc27:	48 83 f8 40          	cmp    rax,0x40
  19fc2b:	7d 07                	jge    19fc34 <llint_op_get_by_id_wide16+0x13>
  19fc2d:	48 8b 4c c5 00       	mov    rcx,QWORD PTR [rbp+rax*8+0x0]
  19fc32:	eb 13                	jmp    19fc47 <llint_op_get_by_id_wide16+0x26>
  19fc34:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  19fc38:	48 8b 89 a0 00 00 00 	mov    rcx,QWORD PTR [rcx+0xa0]
  19fc3f:	48 8b 8c c1 00 fe ff 	mov    rcx,QWORD PTR [rcx+rax*8-0x200]
  19fc46:	ff 
  19fc47:	4c 85 f9             	test   rcx,r15
  19fc4a:	0f 85 9c 01 00 00    	jne    19fdec <llint_op_get_by_id_wide16+0x1cb>
  19fc50:	41 0f b7 54 24 2a    	movzx  edx,WORD PTR [r12+0x2a]
  19fc56:	85 d2                	test   edx,edx
  19fc58:	75 08                	jne    19fc62 <llint_op_get_by_id_wide16+0x41>
  19fc5a:	41 8b 94 24 bc 00 00 	mov    edx,DWORD PTR [r12+0xbc]
  19fc61:	00 
  19fc62:	43 0f b7 74 05 0a    	movzx  esi,WORD PTR [r13+r8*1+0xa]
  19fc68:	c1 e6 04             	shl    esi,0x4
  19fc6b:	01 f2                	add    edx,esi
  19fc6d:	4c 01 e2             	add    rdx,r12
  19fc70:	48 83 c2 07          	add    rdx,0x7
  19fc74:	48 83 e2 f8          	and    rdx,0xfffffffffffffff8
  19fc78:	0f b6 72 0e          	movzx  esi,BYTE PTR [rdx+0xe]
  19fc7c:	40 80 fe 01          	cmp    sil,0x1
  19fc80:	75 60                	jne    19fce2 <llint_op_get_by_id_wide16+0xc1>
  19fc82:	8b 31                	mov    esi,DWORD PTR [rcx]
  19fc84:	8b 02                	mov    eax,DWORD PTR [rdx]
  19fc86:	39 f0                	cmp    eax,esi
  19fc88:	0f 85 5e 01 00 00    	jne    19fdec <llint_op_get_by_id_wide16+0x1cb>
  19fc8e:	48 63 72 04          	movsxd rsi,DWORD PTR [rdx+0x4]
  19fc92:	83 fe 40             	cmp    esi,0x40
  19fc95:	7c 0b                	jl     19fca2 <llint_op_get_by_id_wide16+0x81>
  19fc97:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
  19fc9b:	f7 de                	neg    esi
  19fc9d:	48 63 f6             	movsxd rsi,esi
  19fca0:	eb 07                	jmp    19fca9 <llint_op_get_by_id_wide16+0x88>
  19fca2:	48 81 c1 20 fe ff ff 	add    rcx,0xfffffffffffffe20
  19fca9:	48 8b 84 f1 f0 01 00 	mov    rax,QWORD PTR [rcx+rsi*8+0x1f0]
  19fcb0:	00 
  19fcb1:	43 0f b7 54 05 08    	movzx  edx,WORD PTR [r13+r8*1+0x8]
  19fcb7:	48 6b d2 f0          	imul   rdx,rdx,0xfffffffffffffff0
  19fcbb:	49 89 44 14 f0       	mov    QWORD PTR [r12+rdx*1-0x10],rax
  19fcc0:	48 89 c2             	mov    rdx,rax
  19fcc3:	4b 0f bf 74 05 02    	movsx  rsi,WORD PTR [r13+r8*1+0x2]
  19fcc9:	48 89 54 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rdx
  19fcce:	49 83 c0 0c          	add    r8,0xc
  19fcd2:	43                   	rex.XB
  19fcd3:	0f                   	.byte 0xf
  19fcd4:	b6                   	.byte 0xb6
