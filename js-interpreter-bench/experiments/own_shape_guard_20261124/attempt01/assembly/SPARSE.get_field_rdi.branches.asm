
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002f55b <JS_CallInternal+0x9b4b>:
   2f55b:	mov    0x14(%r10),%ecx
   2f55f:	jmp    2c927 <JS_CallInternal+0x6f17>
   2f564:	mov    0x14(%r9),%ecx
   2f568:	jmp    2c76e <JS_CallInternal+0x6d5e>
   2f56d:	mov    0x10(%r13),%rdi
   2f571:	lea    -0x80(%rbp),%rsi
   2f575:	mov    %eax,%edx
   2f577:	mov    %eax,-0x1e0(%rbp)
   2f57d:	call   18cd0 <JS_AtomGetStrRT.constprop.0>
   2f582:	lea    0xab039(%rip),%rsi        # da5c2 <_IO_stdin_used+0x5c2>
   2f589:	mov    %r13,%rdi
   2f58c:	mov    %rax,%rdx
   2f58f:	xor    %eax,%eax
   2f591:	call   36d60 <JS_ThrowReferenceError>
   2f596:	mov    -0x1e0(%rbp),%ecx
   2f59c:	cmp    $0xf2,%ecx
   2f5a2:	jle    26240 <JS_CallInternal+0x830>
   2f5a8:	mov    0x10(%r13),%rdi
   2f5ac:	mov    %ecx,%esi
   2f5ae:	call   1b070 <JS_FreeAtom.part.0.isra.0>
   2f5b3:	jmp    26240 <JS_CallInternal+0x830>
   2f5b8:	lea    0xae841(%rip),%rsi        # dde00 <_IO_stdin_used+0x3e00>
   2f5bf:	mov    %r13,%rdi
   2f5c2:	xor    %eax,%eax
   2f5c4:	call   34e80 <JS_ThrowTypeError>
   2f5c9:	jmp    26240 <JS_CallInternal+0x830>
   2f5ce:	mov    %r11,%rbx
   2f5d1:	jmp    26240 <JS_CallInternal+0x830>
   2f5d6:	mov    0x10(%r13),%rdi
   2f5da:	mov    %rcx,%rsi
   2f5dd:	mov    %r10,-0x1e8(%rbp)
   2f5e4:	mov    %r11,-0x1e0(%rbp)
   2f5eb:	call   1eb60 <__JS_FreeValueRT>
   2f5f0:	mov    -0x1e8(%rbp),%r10
   2f5f7:	mov    -0x1e0(%rbp),%r11
   2f5fe:	jmp    2851a <JS_CallInternal+0x2b0a>
   2f603:	mov    0x10(%r13),%rdi
   2f607:	mov    %ecx,%edx
   2f609:	lea    -0x80(%rbp),%rsi
   2f60d:	mov    %r8,-0x1e0(%rbp)
   2f614:	call   18cd0 <JS_AtomGetStrRT.constprop.0>
   2f619:	lea    0xaaf39(%rip),%rsi        # da559 <_IO_stdin_used+0x559>
   2f620:	mov    %r13,%rdi


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002d5a0 <JS_CallInternal+0x7b90>:
   2d5a0:	testb  $0x8,0x10(%rax)
   2d5a4:	jne    2ab7e <JS_CallInternal+0x516e>
   2d5aa:	cmp    %rdi,(%r10)
   2d5ad:	jne    2ab7e <JS_CallInternal+0x516e>
   2d5b3:	mov    0x10(%r10),%edx
   2d5b7:	cmp    $0xffffffff,%edx
   2d5ba:	je     2ab7e <JS_CallInternal+0x516e>
   2d5c0:	shl    $0x4,%rdx
   2d5c4:	add    0x20(%rax),%rdx
   2d5c8:	mov    %rdx,%rax
   2d5cb:	mov    (%rdx),%rdx
   2d5ce:	mov    0x8(%rax),%rcx
   2d5d2:	cmp    $0xfffffff6,%ecx
   2d5d5:	jbe    2d5db <JS_CallInternal+0x7bcb>
   2d5d7:	addl   $0x1,-0x4(%rdx)
   2d5db:	mov    %rdx,%r9
   2d5de:	jmp    2abf1 <JS_CallInternal+0x51e1>
   2d5e3:	nopl   0x0(%rax,%rax,1)
   2d5e8:	testb  $0x8,0x10(%r10)
   2d5ed:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d5f3:	mov    0x8(%r9),%rcx
   2d5f7:	mov    (%r9),%rdx
   2d5fa:	test   %rcx,%rcx
   2d5fd:	je     2fd83 <JS_CallInternal+0xa373>
   2d603:	mov    0x30(%r11),%rax
   2d607:	cmp    %r11,%rdx
   2d60a:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d610:	test   %rax,%rax
   2d613:	je     2acb6 <JS_CallInternal+0x52a6>
   2d619:	cmpw   $0x1,0x12(%rax)
   2d61e:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d624:	testb  $0x8,0x10(%rax)
   2d628:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d62e:	cmp    0x18(%rax),%rcx
   2d632:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d638:	mov    0x10(%r9),%edx
   2d63c:	shl    $0x4,%rdx
   2d640:	add    0x20(%rax),%rdx
   2d644:	mov    %rdx,%rax
   2d647:	mov    (%rdx),%rdx
   2d64a:	mov    0x8(%rax),%rax
   2d64e:	cmp    $0xfffffff6,%eax
   2d651:	jbe    2d657 <JS_CallInternal+0x7c47>
   2d653:	addl   $0x1,-0x4(%rdx)
   2d657:	mov    %rdx,%rcx
   2d65a:	jmp    2ad2b <JS_CallInternal+0x531b>
   2d65f:	nop
   2d660:	mov    0x10(%r13),%rdi
   2d664:	rex.W
   2d665:	.byte 0x8b
   2d666:	.byte 0x87
   2d667:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c267 <JS_CallInternal+0x6857>:
   2c267:	testb  $0x8,0x10(%r8)
   2c26c:	jne    2c91d <JS_CallInternal+0x6f0d>
   2c272:	mov    0x30(%rdi),%r8
   2c276:	test   %r8,%r8
   2c279:	je     2dd75 <JS_CallInternal+0x8365>
   2c27f:	mov    0x18(%r8),%rdi
   2c283:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c288:	mov    -0x170(%rbp),%esi
   2c28e:	cmp    %esi,%r8d
   2c291:	mov    %esi,%r12d
   2c294:	cmovle %r8d,%r12d
   2c298:	test   %r12d,%r12d
   2c29b:	jle    2da4f <JS_CallInternal+0x803f>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c259 <JS_CallInternal+0x6849>:
   2c259:	mov    (%rsi),%edx
   2c25b:	and    $0x3ffffff,%edx
   2c261:	jne    2abac <JS_CallInternal+0x519c>
   2c267:	testb  $0x8,0x10(%r8)
   2c26c:	jne    2c91d <JS_CallInternal+0x6f0d>
   2c272:	mov    0x30(%rdi),%r8
   2c276:	test   %r8,%r8
   2c279:	je     2dd75 <JS_CallInternal+0x8365>
   2c27f:	mov    0x18(%r8),%rdi
   2c283:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c288:	mov    -0x170(%rbp),%esi
   2c28e:	cmp    %esi,%r8d
   2c291:	mov    %esi,%r12d
   2c294:	cmovle %r8d,%r12d
   2c298:	test   %r12d,%r12d
   2c29b:	jle    2da4f <JS_CallInternal+0x803f>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


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
   2c950:	call   30ee0 <JS_GetPropertyInternal>
   2c955:	mov    %rdx,%rcx
   2c958:	pop    %rdx
   2c959:	pop    %rsi
   2c95a:	cmp    $0x6,%ecx
   2c95d:	je     2f6c0 <JS_CallInternal+0x9cb0>
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
   2c9c4:	jne    30b80 <JS_CallInternal+0xb170>
   2c9ca:	mov    -0x130(%rbp),%rsi
   2c9d1:	mov    (%rcx),%rdx
   2c9d4:	mov    0x8(%rcx),%rax
   2c9d8:	mov    %rsi,(%rcx)
   2c9db:	mov    -0x128(%rbp),%rsi
   2c9e2:	mov    %rsi,0x8(%rcx)
   2c9e6:	cmp    $0xfffffff6,%eax
   2c9e9:	jbe    2b2a8 <JS_CallInternal+0x5898>


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002abe5 <JS_CallInternal+0x51d5>:
   2abe5:	mov    %rsi,%r9
   2abe8:	cmp    %r8,%rax
   2abeb:	je     2fe0b <JS_CallInternal+0xa3fb>
   2abf1:	mov    -0x8(%rbx),%rax
   2abf5:	cmp    $0xfffffff6,%eax
   2abf8:	jbe    2ac0f <JS_CallInternal+0x51ff>
   2abfa:	mov    -0x10(%rbx),%rsi
   2abfe:	mov    -0x4(%rsi),%edi
   2ac01:	lea    -0x1(%rdi),%edx
   2ac04:	mov    %edx,-0x4(%rsi)
   2ac07:	test   %edx,%edx
   2ac09:	jle    2e3bb <JS_CallInternal+0x89ab>
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
   2ac39:	ja     2d292 <JS_CallInternal+0x7882>
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
   2ac96:	jne    2f564 <JS_CallInternal+0x9b54>
   2ac9c:	movzwl 0x12(%r10),%eax
   2aca1:	mov    0x18(%r10),%r11
   2aca5:	mov    %ax,-0x200(%rbp)
   2acac:	data16


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002fe0b <JS_CallInternal+0xa3fb>:
   2fe0b:	cmpw   $0x1,0x12(%rax)
   2fe10:	jne    2abf1 <JS_CallInternal+0x51e1>
   2fe16:	testb  $0x8,0x10(%rax)
   2fe1a:	jne    2abf1 <JS_CallInternal+0x51e1>
   2fe20:	cmpb   $0x0,0x10(%rdi)
   2fe24:	je     2abf1 <JS_CallInternal+0x51e1>
   2fe2a:	mov    0x8(%r10),%rsi
   2fe2e:	mov    (%r10),%rax
   2fe31:	sar    $0x4,%rdx
   2fe35:	addl   $0x1,-0x4(%rdi)
   2fe39:	mov    %rdi,(%r10)
   2fe3c:	xor    %edi,%edi
   2fe3e:	mov    %rdi,0x8(%r10)
   2fe42:	mov    %edx,0x10(%r10)
   2fe46:	test   %rsi,%rsi
   2fe49:	je     2fe7e <JS_CallInternal+0xa46e>
   2fe4b:	mov    0x10(%r13),%rdi
   2fe4f:	mov    %rax,-0x200(%rbp)
   2fe56:	mov    %r9,-0x1e8(%rbp)
   2fe5d:	mov    %rcx,-0x1e0(%rbp)
   2fe64:	call   207f0 <js_free_shape>
   2fe69:	mov    -0x200(%rbp),%rax
   2fe70:	mov    -0x1e8(%rbp),%r9
   2fe77:	mov    -0x1e0(%rbp),%rcx
   2fe7e:	test   %rax,%rax
   2fe81:	je     2abf1 <JS_CallInternal+0x51e1>
   2fe87:	mov    0x10(%r13),%rdi
   2fe8b:	mov    %rax,%rsi
   2fe8e:	mov    %r9,-0x1e8(%rbp)
   2fe95:	mov    %rcx,-0x1e0(%rbp)
   2fe9c:	call   207f0 <js_free_shape>
   2fea1:	mov    -0x1e0(%rbp),%rcx
   2fea8:	mov    -0x1e8(%rbp),%r9
   2feaf:	jmp    2abf1 <JS_CallInternal+0x51e1>
   2feb4:	nopl   0x0(%rax)
   2feb8:	mov    -0x168(%rbp),%rdi
   2febf:	mov    %r8,%rsi
   2fec2:	call   23140 <free_var_ref>
   2fec7:	jmp    26227 <JS_CallInternal+0x817>
   2fecc:	cmp    $0xfffffff9,%eax
   2fecf:	.byte 0xf
   2fed0:	test   %dh,%al
   2fed2:	.byte 0xd


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


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
   2ac39:	ja     2d292 <JS_CallInternal+0x7882>
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
   2ac96:	jne    2f564 <JS_CallInternal+0x9b54>
   2ac9c:	movzwl 0x12(%r10),%eax
   2aca1:	mov    0x18(%r10),%r11
   2aca5:	mov    %ax,-0x200(%rbp)
   2acac:	cmp    $0x1,%ax
   2acb0:	je     2d5e8 <JS_CallInternal+0x7bd8>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002e3bb <JS_CallInternal+0x89ab>:
   2e3bb:	mov    0x10(%r13),%rdi
   2e3bf:	mov    %rax,%rdx
   2e3c2:	mov    %r9,-0x1e8(%rbp)
   2e3c9:	mov    %rcx,-0x1e0(%rbp)
   2e3d0:	call   1eb60 <__JS_FreeValueRT>
   2e3d5:	mov    -0x1e8(%rbp),%r9
   2e3dc:	mov    -0x1e0(%rbp),%rcx
   2e3e3:	jmp    2ac0f <JS_CallInternal+0x51ff>
   2e3e8:	mov    -0x1e0(%rbp),%r10d
   2e3ef:	test   %r10d,%r10d
   2e3f2:	je     2e436 <JS_CallInternal+0x8a26>
   2e3f4:	mov    %r8,%rbx
   2e3f7:	lea    (%r9,%r8,1),%r12
   2e3fb:	mov    %r8,%r14
   2e3fe:	jmp    2e409 <JS_CallInternal+0x89f9>
   2e400:	add    $0x10,%rbx
   2e404:	cmp    %r12,%rbx
   2e407:	je     2e433 <JS_CallInternal+0x8a23>
   2e409:	mov    0x8(%rbx),%rax
   2e40d:	cmp    $0xfffffff6,%eax
   2e410:	jbe    2e400 <JS_CallInternal+0x89f0>
   2e412:	mov    (%rbx),%rcx
   2e415:	mov    -0x4(%rcx),%edi
   2e418:	lea    -0x1(%rdi),%edx
   2e41b:	mov    %edx,-0x4(%rcx)
   2e41e:	test   %edx,%edx
   2e420:	jg     2e400 <JS_CallInternal+0x89f0>
   2e422:	mov    0x10(%r13),%rdi
   2e426:	mov    %rax,%rdx
   2e429:	mov    %rcx,%rsi
   2e42c:	call   1eb60 <__JS_FreeValueRT>
   2e431:	jmp    2e400 <JS_CallInternal+0x89f0>
   2e433:	mov    %r14,%r8
   2e436:	mov    -0x220(%rbp),%r12
   2e43d:	mov    %r8,%rbx
   2e440:	jmp    26240 <JS_CallInternal+0x830>
   2e445:	mov    -0x150(%rbp),%rax
   2e44c:	mov    0x4(%r9),%ecx
   2e450:	mov    %r13,%rdi
   2e453:	mov    %r11,-0x1e8(%rbp)
   2e45a:	mov    0x180(%r13),%rsi
   2e461:	mov    0x188(%r13),%rdx
   2e468:	mov    %r9,-0x1e0(%rbp)
   2e46f:	mov    %r11,0x30(%rax)
   2e473:	call   71240 <JS_HasProperty>
   2e478:	mov    -0x1e8(%rbp),%r11
   2e47f:	test   %eax,%eax
   2e481:	.byte 0xf
   2e482:	.byte 0x88


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002d292 <JS_CallInternal+0x7882>:
   2d292:	xchg   %rax,%rdx
   2d294:	mov    %r13,%rdi
   2d297:	mov    %rax,%rsi
   2d29a:	call   213a0 <JS_ToBoolFree>
   2d29f:	jmp    2ac46 <JS_CallInternal+0x5236>
   2d2a4:	mov    -0x150(%rbp),%rax
   2d2ab:	mov    %rbx,%rsi
   2d2ae:	mov    %r13,%rdi
   2d2b1:	mov    %r12,0x30(%rax)
   2d2b5:	call   53830 <js_not_slow>
   2d2ba:	test   %eax,%eax
   2d2bc:	je     2a6f2 <JS_CallInternal+0x4ce2>
   2d2c2:	jmp    26240 <JS_CallInternal+0x830>
   2d2c7:	nopw   0x0(%rax,%rax,1)
   2d2d0:	xor    %ecx,%ecx
   2d2d2:	mov    $0x3,%r8d
   2d2d8:	jmp    2740f <JS_CallInternal+0x19ff>
   2d2dd:	mov    -0x210(%rbp),%rsi
   2d2e4:	mov    %r11d,%r9d
   2d2e7:	xor    %ecx,%ecx
   2d2e9:	mov    %r13,%rdi
   2d2ec:	mov    -0x220(%rbp),%rdx
   2d2f3:	mov    $0x3,%r8d
   2d2f9:	movq   $0x0,-0x2a0(%rbp)
   2d304:	movq   $0x3,-0x298(%rbp)
   2d30f:	push   $0x2
   2d311:	push   %r10
   2d313:	mov    %r10,-0x228(%rbp)
   2d31a:	push   -0x298(%rbp)
   2d320:	push   -0x2a0(%rbp)
   2d326:	mov    %r11d,-0x200(%rbp)
   2d32d:	call   25a10 <JS_CallInternal>
   2d332:	mov    -0x228(%rbp),%r10
   2d339:	mov    -0x200(%rbp),%r11d
   2d340:	add    $0x20,%rsp
   2d344:	mov    %rax,-0x210(%rbp)
   2d34b:	mov    %rdx,-0x1e8(%rbp)
   2d352:	jmp    27457 <JS_CallInternal+0x1a47>
   2d357:	rex.W
   2d358:	.byte 0x8b
   2d359:	.byte 0x85
