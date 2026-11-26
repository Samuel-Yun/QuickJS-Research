
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ec5f <JS_CallInternal+0x924f>:
   2ec5f:	mov    0x14(%r10),%ecx
   2ec63:	jmp    2c927 <JS_CallInternal+0x6f17>
   2ec68:	movl   $0xffffffff,-0x138(%rbp)
   2ec72:	mov    0x8(%r10),%rsi
   2ec76:	cmp    $0xfffffff6,%esi
   2ec79:	ja     2fd3e <JS_CallInternal+0xa32e>
   2ec7f:	movq   $0x0,(%r10)
   2ec86:	movq   $0x3,0x8(%r10)
   2ec8e:	mov    %r11,%r12
   2ec91:	jmp    26240 <JS_CallInternal+0x830>
   2ec96:	cs nopw 0x0(%rax,%rax,1)
   2eca0:	mov    $0x1,%edx
   2eca5:	mov    $0x3,%esi
   2ecaa:	xor    %edi,%edi
   2ecac:	jmp    2a89c <JS_CallInternal+0x4e8c>
   2ecb1:	mov    -0x160(%rbp),%rax
   2ecb8:	mov    0x30(%rax),%rax
   2ecbc:	mov    0x4(%rax,%rdx,8),%eax
   2ecc0:	lea    0xab7f6(%rip),%rdx        # da4bd <_IO_stdin_used+0x4bd>
   2ecc7:	test   %eax,%eax
   2ecc9:	jne    2ffd8 <JS_CallInternal+0xa5c8>
   2eccf:	lea    0xab843(%rip),%rsi        # da519 <_IO_stdin_used+0x519>
   2ecd6:	mov    %r13,%rdi
   2ecd9:	xor    %eax,%eax
   2ecdb:	mov    %rcx,-0x1e0(%rbp)
   2ece2:	call   36d40 <JS_ThrowReferenceError>
   2ece7:	mov    -0x1e0(%rbp),%r12
   2ecee:	jmp    26240 <JS_CallInternal+0x830>
   2ecf3:	mov    %rdx,%rax
   2ecf6:	mov    0x10(%r13),%rdi
   2ecfa:	mov    -0x1e0(%rbp),%rdx
   2ed01:	mov    %ecx,-0x220(%rbp)
   2ed07:	mov    %rax,%rsi
   2ed0a:	call   1eb60 <__JS_FreeValueRT>
   2ed0f:	mov    -0x220(%rbp),%ecx
   2ed15:	jmp    2a57e <JS_CallInternal+0x4b6e>
   2ed1a:	add    $0x4,%r12
   2ed1e:	jmp    26240 <JS_CallInternal+0x830>
   2ed23:	mov    0x10(%r13),%rdi


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ab82 <JS_CallInternal+0x5172>:
   2ab82:	mov    0x14(%r10),%ecx
   2ab86:	mov    %rax,%r8
   2ab89:	nopl   0x0(%rax)
   2ab90:	mov    0x18(%rdi),%esi
   2ab93:	mov    %esi,%edx
   2ab95:	and    %ecx,%edx
   2ab97:	mov    0x38(%rdi,%rdx,4),%edx
   2ab9b:	test   %rdx,%rdx
   2ab9e:	je     2c267 <JS_CallInternal+0x6857>
   2aba4:	lea    0x3c(,%rsi,4),%r9
   2abac:	sub    $0x1,%rdx
   2abb0:	lea    (%r9,%rdx,8),%rsi
   2abb4:	add    %rdi,%rsi
   2abb7:	cmp    0x4(%rsi),%ecx
   2abba:	jne    2c259 <JS_CallInternal+0x6849>
   2abc0:	mov    0x20(%r8),%r9
   2abc4:	cmpb   $0x3f,0x3(%rsi)
   2abc8:	ja     2c927 <JS_CallInternal+0x6f17>
   2abce:	shl    $0x4,%rdx
   2abd2:	add    %rdx,%r9
   2abd5:	mov    0x8(%r9),%rcx
   2abd9:	mov    (%r9),%rsi
   2abdc:	cmp    $0xfffffff6,%ecx
   2abdf:	jbe    2abe5 <JS_CallInternal+0x51d5>
   2abe1:	addl   $0x1,-0x4(%rsi)
   2abe5:	mov    %rsi,%r9
   2abe8:	cmp    %r8,%rax
   2abeb:	je     2fb8a <JS_CallInternal+0xa17a>
   2abf1:	mov    -0x8(%rbx),%rax
   2abf5:	cmp    $0xfffffff6,%eax
   2abf8:	jbe    2ac0f <JS_CallInternal+0x51ff>
   2abfa:	mov    -0x10(%rbx),%rsi
   2abfe:	mov    -0x4(%rsi),%edi
   2ac01:	lea    -0x1(%rdi),%edx
   2ac04:	mov    %edx,-0x4(%rsi)
   2ac07:	test   %edx,%edx
   2ac09:	jle    2e119 <JS_CallInternal+0x8709>
   2ac0f:	mov    %r9,-0x10(%rbx)
   2ac13:	add    $0x5,%r12
   2ac17:	mov    %rcx,-0x8(%rbx)
   2ac1b:	movzbl -0x1(%r12),%eax
   2ac21:	mov    %rax,%r10
   2ac24:	mov    (%r14,%rax,8),%rax
   2ac28:	jmp    *%rax
   2ac2a:	endbr64
   2ac2e:	mov    -0x8(%rbx),%rax
   2ac32:	mov    -0x10(%rbx),%rdx
   2ac36:	cmp    $0x3,%eax
   2ac39:	ja     2d287 <JS_CallInternal+0x7877>
   2ac3f:	xor    %eax,%eax
   2ac41:	test   %edx,%edx
   2ac43:	setne  %al
   2ac46:	test   %eax,%eax
   2ac48:	rex.W
   2ac49:	.byte 0xc7


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002df4d <JS_CallInternal+0x853d>:
   2df4d:	mov    0x10(%r10),%edx
   2df51:	cmp    $0xffffffff,%edx
   2df54:	je     2ab82 <JS_CallInternal+0x5172>
   2df5a:	shl    $0x4,%rdx
   2df5e:	add    0x20(%rax),%rdx
   2df62:	mov    %rdx,%rax
   2df65:	mov    (%rdx),%rdx
   2df68:	mov    0x8(%rax),%rcx
   2df6c:	cmp    $0xfffffff6,%ecx
   2df6f:	jbe    2df75 <JS_CallInternal+0x8565>
   2df71:	addl   $0x1,-0x4(%rdx)
   2df75:	mov    %rdx,%r9
   2df78:	jmp    2abf1 <JS_CallInternal+0x51e1>
   2df7d:	mov    -0x150(%rbp),%rax
   2df84:	mov    0x4(%r9),%ecx
   2df88:	mov    %r13,%rdi
   2df8b:	mov    %r11,-0x1e8(%rbp)
   2df92:	mov    0x180(%r13),%rsi
   2df99:	mov    0x188(%r13),%rdx
   2dfa0:	mov    %r9,-0x1e0(%rbp)
   2dfa7:	mov    %r11,0x30(%rax)
   2dfab:	call   71240 <JS_HasProperty>
   2dfb0:	mov    -0x1e8(%rbp),%r11
   2dfb7:	test   %eax,%eax
   2dfb9:	js     30b2c <JS_CallInternal+0xb11c>
   2dfbf:	mov    -0x1e0(%rbp),%r9
   2dfc6:	jne    2f14f <JS_CallInternal+0x973f>
   2dfcc:	mov    0x10(%r13),%rax
   2dfd0:	mov    0x4f0(%rax),%rax
   2dfd7:	test   %rax,%rax
   2dfda:	je     2f14f <JS_CallInternal+0x973f>
   2dfe0:	testb  $0x1,0x3c(%rax)
   2dfe4:	je     2f14f <JS_CallInternal+0x973f>
   2dfea:	mov    0x4(%r9),%esi
   2dfee:	mov    %r13,%rdi
   2dff1:	mov    %r11,-0x1e0(%rbp)
   2dff8:	call   36e80 <JS_ThrowReferenceErrorNotDefined>
   2dffd:	mov    -0x1e0(%rbp),%r12
   2e004:	jmp    26240 <JS_CallInternal+0x830>
   2e009:	mov    0x10(%r13),%rdi
   2e00d:	mov    %r9,%rsi
   2e010:	mov    %r10,%rdx
   2e013:	rex.W
   2e014:	.byte 0x89


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c267 <JS_CallInternal+0x6857>:
   2c267:	testb  $0x8,0x10(%r8)
   2c26c:	jne    2c91d <JS_CallInternal+0x6f0d>
   2c272:	mov    0x30(%rdi),%r8
   2c276:	test   %r8,%r8
   2c279:	je     2dd7f <JS_CallInternal+0x836f>
   2c27f:	mov    0x18(%r8),%rdi
   2c283:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c288:	mov    -0x170(%rbp),%esi
   2c28e:	cmp    %esi,%r8d
   2c291:	mov    %esi,%r12d
   2c294:	cmovle %r8d,%r12d
   2c298:	test   %r12d,%r12d
   2c29b:	jle    2d9e4 <JS_CallInternal+0x7fd4>
   2c2a1:	mov    %eax,-0x150(%rbp)
   2c2a7:	movslq %r12d,%r13
   2c2aa:	mov    -0x180(%rbp),%r14
   2c2b1:	xor    %esi,%esi
   2c2b3:	shl    $0x4,%r13
   2c2b7:	nopw   0x0(%rax,%rax,1)
   2c2c0:	mov    0x8(%r14,%rsi,1),%rax
   2c2c5:	mov    (%r14,%rsi,1),%r11
   2c2c9:	cmp    $0xfffffff6,%eax
   2c2cc:	jbe    2c2d3 <JS_CallInternal+0x68c3>
   2c2ce:	addl   $0x1,-0x4(%r11)
   2c2d3:	mov    %r11,(%rdi,%rsi,1)
   2c2d7:	mov    %rax,0x8(%rdi,%rsi,1)
   2c2dc:	add    $0x10,%rsi
   2c2e0:	cmp    %r13,%rsi
   2c2e3:	jne    2c2c0 <JS_CallInternal+0x68b0>
   2c2e5:	mov    -0x150(%rbp),%eax
   2c2eb:	cmp    %r12d,%r8d
   2c2ee:	jle    2c338 <JS_CallInternal+0x6928>
   2c2f0:	lea    -0x1(%r8),%r11d
   2c2f4:	movslq %r12d,%r13
   2c2f7:	sub    %r12d,%r11d
   2c2fa:	mov    %r13,%rsi
   2c2fd:	add    %r13,%r11
   2c300:	shl    $0x4,%rsi
   2c304:	shl    $0x4,%r11
   2c308:	add    %rdi,%rsi
   2c30b:	lea    0x10(%rdi,%r11,1),%r11
   2c310:	nopl   0x0(%rax,%rax,1)
   2c315:	data16 cs nopw 0x0(%rax,%rax,1)
   2c320:	movq   $0x0,(%rsi)
   2c327:	add    $0x10,%rsi
   2c32b:	rex.W
   2c32c:	.byte 0xc7
   2c32d:	rex.RX clc


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c259 <JS_CallInternal+0x6849>:
   2c259:	mov    (%rsi),%edx
   2c25b:	and    $0x3ffffff,%edx
   2c261:	jne    2abac <JS_CallInternal+0x519c>
   2c267:	testb  $0x8,0x10(%r8)
   2c26c:	jne    2c91d <JS_CallInternal+0x6f0d>
   2c272:	mov    0x30(%rdi),%r8
   2c276:	test   %r8,%r8
   2c279:	je     2dd7f <JS_CallInternal+0x836f>
   2c27f:	mov    0x18(%r8),%rdi
   2c283:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c288:	mov    -0x170(%rbp),%esi
   2c28e:	cmp    %esi,%r8d
   2c291:	mov    %esi,%r12d
   2c294:	cmovle %r8d,%r12d
   2c298:	test   %r12d,%r12d
   2c29b:	jle    2d9e4 <JS_CallInternal+0x7fd4>
   2c2a1:	mov    %eax,-0x150(%rbp)
   2c2a7:	movslq %r12d,%r13
   2c2aa:	mov    -0x180(%rbp),%r14
   2c2b1:	xor    %esi,%esi
   2c2b3:	shl    $0x4,%r13
   2c2b7:	nopw   0x0(%rax,%rax,1)
   2c2c0:	mov    0x8(%r14,%rsi,1),%rax
   2c2c5:	mov    (%r14,%rsi,1),%r11
   2c2c9:	cmp    $0xfffffff6,%eax
   2c2cc:	jbe    2c2d3 <JS_CallInternal+0x68c3>
   2c2ce:	addl   $0x1,-0x4(%r11)
   2c2d3:	mov    %r11,(%rdi,%rsi,1)
   2c2d7:	mov    %rax,0x8(%rdi,%rsi,1)
   2c2dc:	add    $0x10,%rsi
   2c2e0:	cmp    %r13,%rsi
   2c2e3:	jne    2c2c0 <JS_CallInternal+0x68b0>
   2c2e5:	mov    -0x150(%rbp),%eax
   2c2eb:	cmp    %r12d,%r8d
   2c2ee:	jle    2c338 <JS_CallInternal+0x6928>
   2c2f0:	lea    -0x1(%r8),%r11d
   2c2f4:	movslq %r12d,%r13
   2c2f7:	sub    %r12d,%r11d
   2c2fa:	mov    %r13,%rsi
   2c2fd:	add    %r13,%r11
   2c300:	shl    $0x4,%rsi
   2c304:	shl    $0x4,%r11
   2c308:	add    %rdi,%rsi
   2c30b:	lea    0x10(%rdi,%r11,1),%r11
   2c310:	nopl   0x0(%rax,%rax,1)
   2c315:	data16 cs nopw 0x0(%rax,%rax,1)
   2c320:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c927 <JS_CallInternal+0x6f17>:
   2c927:	sub    $0x8,%rsp
   2c92b:	mov    -0x10(%rbx),%r8
   2c92f:	mov    -0x8(%rbx),%r9
   2c933:	mov    %rax,%rsi
   2c936:	mov    -0x150(%rbp),%rdx
   2c93d:	mov    -0x1e0(%rbp),%rdi
   2c944:	mov    %rdi,0x30(%rdx)
   2c948:	mov    %r11,%rdx
   2c94b:	mov    %r13,%rdi
   2c94e:	push   $0x0
   2c950:	call   30eb0 <JS_GetPropertyInternal>
   2c955:	mov    %rdx,%rcx
   2c958:	pop    %rdx
   2c959:	pop    %rsi
   2c95a:	cmp    $0x6,%ecx
   2c95d:	je     2fe78 <JS_CallInternal+0xa468>
   2c963:	mov    %rax,%r9
   2c966:	jmp    2abf1 <JS_CallInternal+0x51e1>
   2c96b:	mov    -0x1e0(%rbp),%r12
   2c972:	jmp    26240 <JS_CallInternal+0x830>
   2c977:	mov    -0x150(%rbp),%rdi
   2c97e:	mov    %r8,0x30(%rdi)
   2c982:	cmp    $0xfffffff6,%edx
   2c985:	jbe    2c98b <JS_CallInternal+0x6f7b>
   2c987:	addl   $0x1,-0x4(%rax)
   2c98b:	mov    %rdx,-0x128(%rbp)
   2c992:	mov    %r13,%rdi
   2c995:	lea    -0x120(%rbp),%rsi
   2c99c:	mov    $0x8d,%edx
   2c9a1:	mov    %rcx,-0x1e0(%rbp)
   2c9a8:	mov    %r8,-0x1e8(%rbp)
   2c9af:	mov    %rax,-0x130(%rbp)
   2c9b6:	call   532a0 <js_unary_arith_slow>
   2c9bb:	mov    -0x1e0(%rbp),%rcx
   2c9c2:	test   %eax,%eax
   2c9c4:	jne    30ba8 <JS_CallInternal+0xb198>
   2c9ca:	mov    -0x130(%rbp),%rsi
   2c9d1:	mov    (%rcx),%rdx
   2c9d4:	mov    0x8(%rcx),%rax
   2c9d8:	mov    %rsi,(%rcx)
   2c9db:	mov    -0x128(%rbp),%rsi
   2c9e2:	mov    %rsi,0x8(%rcx)
   2c9e6:	cmp    $0xfffffff6,%eax
   2c9e9:	jbe    2b2a8 <JS_CallInternal+0x5898>


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002abe5 <JS_CallInternal+0x51d5>:
   2abe5:	mov    %rsi,%r9
   2abe8:	cmp    %r8,%rax
   2abeb:	je     2fb8a <JS_CallInternal+0xa17a>
   2abf1:	mov    -0x8(%rbx),%rax
   2abf5:	cmp    $0xfffffff6,%eax
   2abf8:	jbe    2ac0f <JS_CallInternal+0x51ff>
   2abfa:	mov    -0x10(%rbx),%rsi
   2abfe:	mov    -0x4(%rsi),%edi
   2ac01:	lea    -0x1(%rdi),%edx
   2ac04:	mov    %edx,-0x4(%rsi)
   2ac07:	test   %edx,%edx
   2ac09:	jle    2e119 <JS_CallInternal+0x8709>
   2ac0f:	mov    %r9,-0x10(%rbx)
   2ac13:	add    $0x5,%r12
   2ac17:	mov    %rcx,-0x8(%rbx)
   2ac1b:	movzbl -0x1(%r12),%eax
   2ac21:	mov    %rax,%r10
   2ac24:	mov    (%r14,%rax,8),%rax
   2ac28:	jmp    *%rax
   2ac2a:	endbr64
   2ac2e:	mov    -0x8(%rbx),%rax
   2ac32:	mov    -0x10(%rbx),%rdx
   2ac36:	cmp    $0x3,%eax
   2ac39:	ja     2d287 <JS_CallInternal+0x7877>
   2ac3f:	xor    %eax,%eax
   2ac41:	test   %edx,%edx
   2ac43:	setne  %al
   2ac46:	test   %eax,%eax
   2ac48:	movq   $0x1,-0x8(%rbx)
   2ac50:	sete   %al
   2ac53:	add    $0x1,%r12
   2ac57:	movzbl %al,%eax
   2ac5a:	mov    %rax,-0x10(%rbx)
   2ac5e:	movzbl -0x1(%r12),%eax
   2ac64:	mov    %rax,%r10
   2ac67:	mov    (%r14,%rax,8),%rax
   2ac6b:	jmp    *%rax
   2ac6d:	endbr64
   2ac71:	mov    (%r12),%r9d
   2ac75:	mov    -0x8(%rbx),%rax
   2ac79:	lea    0x4(%r12),%rcx
   2ac7e:	mov    %rcx,-0x1e8(%rbp)
   2ac85:	mov    -0x10(%rbx),%r10
   2ac89:	mov    %rax,-0x1e0(%rbp)
   2ac90:	add    %r12,%r9
   2ac93:	cmp    $0xffffffff,%eax
   2ac96:	jne    2ed37 <JS_CallInternal+0x9327>
   2ac9c:	movzwl 0x12(%r10),%eax
   2aca1:	mov    0x18(%r10),%r11
   2aca5:	mov    %ax,-0x200(%rbp)
   2acac:	data16


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002fb8a <JS_CallInternal+0xa17a>:
   2fb8a:	testb  $0x8,0x10(%rax)
   2fb8e:	jne    2abf1 <JS_CallInternal+0x51e1>
   2fb94:	cmpb   $0x0,0x10(%rdi)
   2fb98:	je     2abf1 <JS_CallInternal+0x51e1>
   2fb9e:	mov    0x8(%r10),%rsi
   2fba2:	mov    (%r10),%rax
   2fba5:	sar    $0x4,%rdx
   2fba9:	addl   $0x1,-0x4(%rdi)
   2fbad:	mov    %rdi,(%r10)
   2fbb0:	xor    %edi,%edi
   2fbb2:	mov    %rdi,0x8(%r10)
   2fbb6:	mov    %edx,0x10(%r10)
   2fbba:	test   %rsi,%rsi
   2fbbd:	je     2fbf2 <JS_CallInternal+0xa1e2>
   2fbbf:	mov    0x10(%r13),%rdi
   2fbc3:	mov    %rax,-0x200(%rbp)
   2fbca:	mov    %r9,-0x1e8(%rbp)
   2fbd1:	mov    %rcx,-0x1e0(%rbp)
   2fbd8:	call   207f0 <js_free_shape>
   2fbdd:	mov    -0x200(%rbp),%rax
   2fbe4:	mov    -0x1e8(%rbp),%r9
   2fbeb:	mov    -0x1e0(%rbp),%rcx
   2fbf2:	test   %rax,%rax
   2fbf5:	je     2abf1 <JS_CallInternal+0x51e1>
   2fbfb:	mov    0x10(%r13),%rdi
   2fbff:	mov    %rax,%rsi
   2fc02:	mov    %r9,-0x1e8(%rbp)
   2fc09:	mov    %rcx,-0x1e0(%rbp)
   2fc10:	call   207f0 <js_free_shape>
   2fc15:	mov    -0x1e0(%rbp),%rcx
   2fc1c:	mov    -0x1e8(%rbp),%r9
   2fc23:	jmp    2abf1 <JS_CallInternal+0x51e1>
   2fc28:	mov    0x10(%r13),%rdi
   2fc2c:	mov    %r10,%rsi
   2fc2f:	mov    %r11,%rdx
   2fc32:	mov    %eax,-0x1e8(%rbp)
   2fc38:	call   1eb60 <__JS_FreeValueRT>
   2fc3d:	mov    -0x1e8(%rbp),%eax
   2fc43:	jmp    2d1f7 <JS_CallInternal+0x77e7>
   2fc48:	cmp    %r11,%rdx
   2fc4b:	jne    2acb6 <JS_CallInternal+0x52a6>
   2fc51:	rex.B


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ac0f <JS_CallInternal+0x51ff>:
   2ac0f:	mov    %r9,-0x10(%rbx)
   2ac13:	add    $0x5,%r12
   2ac17:	mov    %rcx,-0x8(%rbx)
   2ac1b:	movzbl -0x1(%r12),%eax
   2ac21:	mov    %rax,%r10
   2ac24:	mov    (%r14,%rax,8),%rax
   2ac28:	jmp    *%rax
   2ac2a:	endbr64
   2ac2e:	mov    -0x8(%rbx),%rax
   2ac32:	mov    -0x10(%rbx),%rdx
   2ac36:	cmp    $0x3,%eax
   2ac39:	ja     2d287 <JS_CallInternal+0x7877>
   2ac3f:	xor    %eax,%eax
   2ac41:	test   %edx,%edx
   2ac43:	setne  %al
   2ac46:	test   %eax,%eax
   2ac48:	movq   $0x1,-0x8(%rbx)
   2ac50:	sete   %al
   2ac53:	add    $0x1,%r12
   2ac57:	movzbl %al,%eax
   2ac5a:	mov    %rax,-0x10(%rbx)
   2ac5e:	movzbl -0x1(%r12),%eax
   2ac64:	mov    %rax,%r10
   2ac67:	mov    (%r14,%rax,8),%rax
   2ac6b:	jmp    *%rax
   2ac6d:	endbr64
   2ac71:	mov    (%r12),%r9d
   2ac75:	mov    -0x8(%rbx),%rax
   2ac79:	lea    0x4(%r12),%rcx
   2ac7e:	mov    %rcx,-0x1e8(%rbp)
   2ac85:	mov    -0x10(%rbx),%r10
   2ac89:	mov    %rax,-0x1e0(%rbp)
   2ac90:	add    %r12,%r9
   2ac93:	cmp    $0xffffffff,%eax
   2ac96:	jne    2ed37 <JS_CallInternal+0x9327>
   2ac9c:	movzwl 0x12(%r10),%eax
   2aca1:	mov    0x18(%r10),%r11
   2aca5:	mov    %ax,-0x200(%rbp)
   2acac:	cmp    $0x1,%ax
   2acb0:	je     2d653 <JS_CallInternal+0x7c43>
   2acb6:	mov    0x14(%r9),%ecx
   2acba:	mov    %r11,%rdx
   2acbd:	mov    %r10,%rdi
   2acc0:	mov    0x18(%rdx),%esi
   2acc3:	mov    %esi,%eax
   2acc5:	and    %ecx,%eax
   2acc7:	mov    0x38(%rdx,%rax,4),%eax
   2accb:	test   %rax,%rax
   2acce:	je     2c239 <JS_CallInternal+0x6829>
   2acd4:	rex.WR
   2acd5:	.byte 0x8d
   2acd6:	.byte 0x4


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002e119 <JS_CallInternal+0x8709>:
   2e119:	mov    0x10(%r13),%rdi
   2e11d:	mov    %rax,%rdx
   2e120:	mov    %r9,-0x1e8(%rbp)
   2e127:	mov    %rcx,-0x1e0(%rbp)
   2e12e:	call   1eb60 <__JS_FreeValueRT>
   2e133:	mov    -0x1e8(%rbp),%r9
   2e13a:	mov    -0x1e0(%rbp),%rcx
   2e141:	jmp    2ac0f <JS_CallInternal+0x51ff>
   2e146:	mov    0x10(%r13),%rdi
   2e14a:	mov    %rcx,%rsi
   2e14d:	call   1eb60 <__JS_FreeValueRT>
   2e152:	jmp    2715e <JS_CallInternal+0x174e>
   2e157:	mov    %rsi,%rdx
   2e15a:	mov    %rdi,%rsi
   2e15d:	mov    0x10(%r13),%rdi
   2e161:	mov    %rax,-0x200(%rbp)
   2e168:	mov    %rcx,-0x1e8(%rbp)
   2e16f:	call   1eb60 <__JS_FreeValueRT>
   2e174:	mov    -0x200(%rbp),%rax
   2e17b:	mov    -0x1e8(%rbp),%rcx
   2e182:	mov    -0x1e0(%rbp),%r9
   2e189:	jmp    271db <JS_CallInternal+0x17cb>
   2e18e:	mov    0x10(%r13),%rdi
   2e192:	mov    %rax,%rdx
   2e195:	call   1eb60 <__JS_FreeValueRT>
   2e19a:	jmp    28edd <JS_CallInternal+0x34cd>
   2e19f:	mov    %rsi,%rdx
   2e1a2:	mov    %rdi,%rsi
   2e1a5:	mov    0x10(%r13),%rdi
   2e1a9:	mov    %rax,-0x1e8(%rbp)
   2e1b0:	mov    %rcx,-0x1e0(%rbp)
   2e1b7:	call   1eb60 <__JS_FreeValueRT>
   2e1bc:	mov    -0x1e8(%rbp),%rax
   2e1c3:	mov    -0x1e0(%rbp),%rcx
   2e1ca:	jmp    285eb <JS_CallInternal+0x2bdb>
   2e1cf:	mov    0x10(%r13),%rdi
   2e1d3:	mov    %rcx,%rsi
   2e1d6:	call   1eb60 <__JS_FreeValueRT>
   2e1db:	jmp    2b734 <JS_CallInternal+0x5d24>
   2e1e0:	rex.R
