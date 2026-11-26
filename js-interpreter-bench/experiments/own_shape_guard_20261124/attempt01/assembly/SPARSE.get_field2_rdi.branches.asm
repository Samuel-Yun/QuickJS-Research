
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002f564 <JS_CallInternal+0x9b54>:
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
   2f623:	mov    %rax,%rdx
   2f626:	xor    %eax,%eax
   2f628:	.byte 0xe8
   2f629:	push   %rbx
   2f62a:	pop    %rax
	...


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002d5e8 <JS_CallInternal+0x7bd8>:
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
   2d664:	mov    0x448(%rdi),%rax
   2d66b:	mov    (%rax,%rcx,8),%rsi
   2d66f:	mov    -0x4(%rsi),%eax
   2d672:	sub    $0x1,%eax
   2d675:	mov    %eax,-0x4(%rsi)
   2d678:	test   %eax,%eax
   2d67a:	jg     2b987 <JS_CallInternal+0x5f77>
   2d680:	mov    %r11,-0x220(%rbp)
   2d687:	call   16c60 <JS_FreeAtomStruct>
   2d68c:	mov    -0x220(%rbp),%r11
   2d693:	mov    -0x200(%rbp),%r10
   2d69a:	jmp    2b987 <JS_CallInternal+0x5f77>
   2d69f:	cmp    $0xfffffffa,%ecx
   2d6a2:	jge    2d6a9 <JS_CallInternal+0x7c99>
   2d6a4:	cmp    $0xfffffff8,%ecx
   2d6a7:	jge    2d701 <JS_CallInternal+0x7cf1>
   2d6a9:	mov    -0x10(%rbx),%rsi
   2d6ad:	rex.W
   2d6ae:	.byte 0x8b
   2d6af:	push   %rbx


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c239 <JS_CallInternal+0x6829>:
   2c239:	testb  $0x8,0x10(%rdi)
   2c23d:	jne    2c760 <JS_CallInternal+0x6d50>
   2c243:	mov    0x30(%rdx),%rdi
   2c247:	test   %rdi,%rdi
   2c24a:	je     2dd69 <JS_CallInternal+0x8359>
   2c250:	mov    0x18(%rdi),%rdx
   2c254:	jmp    2acc0 <JS_CallInternal+0x52b0>
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
   2c300:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c22c <JS_CallInternal+0x681c>:
   2c22c:	mov    (%rsi),%eax
   2c22e:	and    $0x3ffffff,%eax
   2c233:	jne    2acdc <JS_CallInternal+0x52cc>
   2c239:	testb  $0x8,0x10(%rdi)
   2c23d:	jne    2c760 <JS_CallInternal+0x6d50>
   2c243:	mov    0x30(%rdx),%rdi
   2c247:	test   %rdi,%rdi
   2c24a:	je     2dd69 <JS_CallInternal+0x8359>
   2c250:	mov    0x18(%rdi),%rdx
   2c254:	jmp    2acc0 <JS_CallInternal+0x52b0>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c76e <JS_CallInternal+0x6d5e>:
   2c76e:	sub    $0x8,%rsp
   2c772:	mov    -0x8(%rbx),%r9
   2c776:	mov    -0x10(%rbx),%r8
   2c77a:	mov    %r10,%rsi
   2c77d:	mov    -0x1e8(%rbp),%rdx
   2c784:	mov    -0x150(%rbp),%rax
   2c78b:	mov    %r13,%rdi
   2c78e:	mov    -0x1e0(%rbp),%r11
   2c795:	mov    %rdx,0x30(%rax)
   2c799:	push   $0x0
   2c79b:	mov    %r11,%rdx
   2c79e:	call   30ee0 <JS_GetPropertyInternal>
   2c7a3:	pop    %r9
   2c7a5:	pop    %r10
   2c7a7:	mov    %rax,%rcx
   2c7aa:	mov    %rdx,%rax
   2c7ad:	cmp    $0x6,%edx
   2c7b0:	jne    2ad2b <JS_CallInternal+0x531b>
   2c7b6:	mov    -0x1e8(%rbp),%r12
   2c7bd:	jmp    26240 <JS_CallInternal+0x830>
   2c7c2:	mov    %rdi,%r9
   2c7c5:	mov    $0xffffffffffffffff,%rax
   2c7cc:	mov    -0x150(%rbp),%rdi
   2c7d3:	sub    $0x8,%rsp
   2c7d7:	mov    -0x10(%rbx),%r8
   2c7db:	mov    %rax,%rdx
   2c7de:	mov    %r10,-0x1e0(%rbp)
   2c7e5:	mov    %r9,%rax
   2c7e8:	mov    -0x8(%rbx),%r9
   2c7ec:	mov    %r10,0x30(%rdi)
   2c7f0:	mov    %rax,%rsi
   2c7f3:	mov    %r13,%rdi
   2c7f6:	push   $0x0
   2c7f8:	call   30ee0 <JS_GetPropertyInternal>
   2c7fd:	pop    %rdi
   2c7fe:	pop    %r8
   2c800:	mov    %rdx,%rcx
   2c803:	cmp    $0x6,%edx
   2c806:	jne    287eb <JS_CallInternal+0x2ddb>
   2c80c:	mov    -0x1e0(%rbp),%r12
   2c813:	jmp    26240 <JS_CallInternal+0x830>
   2c818:	mov    %rdi,%r9
   2c81b:	mov    $0xffffffffffffffff,%rax
   2c822:	mov    -0x150(%rbp),%rdx
   2c829:	sub    $0x8,%rsp
   2c82d:	mov    -0x10(%rbx),%r8
   2c831:	mov    %r13,%rdi
   2c834:	rex.WR
   2c835:	.byte 0x89


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ad18 <JS_CallInternal+0x5308>:
   2ad18:	cmp    %rdi,%r10
   2ad1b:	je     2f8d8 <JS_CallInternal+0x9ec8>
   2ad21:	cmp    %rdi,0x30(%r11)
   2ad25:	je     3049b <JS_CallInternal+0xaa8b>
   2ad2b:	mov    %rcx,(%rbx)
   2ad2e:	add    $0x5,%r12
   2ad32:	add    $0x10,%rbx
   2ad36:	mov    %rax,-0x8(%rbx)
   2ad3a:	movzbl -0x1(%r12),%eax
   2ad40:	mov    %rax,%r10
   2ad43:	mov    (%r14,%rax,8),%rax
   2ad47:	jmp    *%rax
   2ad49:	endbr64
   2ad4d:	mov    -0x150(%rbp),%rax
   2ad54:	mov    -0x20(%rbx),%rsi
   2ad58:	mov    %r13,%rdi
   2ad5b:	mov    -0x18(%rbx),%rdx
   2ad5f:	mov    -0x10(%rbx),%rcx
   2ad63:	mov    %r12,0x30(%rax)
   2ad67:	mov    -0x8(%rbx),%r8
   2ad6b:	mov    %rcx,-0x200(%rbp)
   2ad72:	mov    %r8,-0x1e8(%rbp)
   2ad79:	mov    %rsi,-0x210(%rbp)
   2ad80:	mov    %rdx,-0x1e0(%rbp)
   2ad87:	call   96390 <JS_IsInstanceOf>
   2ad8c:	test   %eax,%eax
   2ad8e:	js     26240 <JS_CallInternal+0x830>
   2ad94:	mov    -0x1e0(%rbp),%rdx
   2ad9b:	mov    -0x1e8(%rbp),%r8
   2ada2:	mov    -0x200(%rbp),%rcx
   2ada9:	cmp    $0xfffffff6,%edx
   2adac:	jbe    2adc6 <JS_CallInternal+0x53b6>
   2adae:	mov    -0x210(%rbp),%rsi
   2adb5:	mov    -0x4(%rsi),%edi
   2adb8:	sub    $0x1,%edi
   2adbb:	mov    %edi,-0x4(%rsi)
   2adbe:	test   %edi,%edi
   2adc0:	jle    2f7d1 <JS_CallInternal+0x9dc1>
   2adc6:	cmp    $0xfffffff6,%r8d
   2adca:	jbe    2addd <JS_CallInternal+0x53cd>
   2adcc:	mov    -0x4(%rcx),%edx
   2adcf:	sub    $0x1,%edx
   2add2:	mov    %edx,-0x4(%rcx)
   2add5:	test   %edx,%edx
   2add7:	jle    2f800 <JS_CallInternal+0x9df0>
   2addd:	test   %eax,%eax
   2addf:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002f8d8 <JS_CallInternal+0x9ec8>:
   2f8d8:	cmpw   $0x1,0x12(%r10)
   2f8de:	jne    2ad2b <JS_CallInternal+0x531b>
   2f8e4:	testb  $0x8,0x10(%r10)
   2f8e9:	jne    2ad2b <JS_CallInternal+0x531b>
   2f8ef:	cmpb   $0x0,0x10(%rdx)
   2f8f3:	je     2ad2b <JS_CallInternal+0x531b>
   2f8f9:	mov    0x8(%r9),%rdi
   2f8fd:	xor    %r11d,%r11d
   2f900:	sar    $0x4,%rsi
   2f904:	mov    (%r9),%r8
   2f907:	addl   $0x1,-0x4(%rdx)
   2f90b:	mov    %rdx,(%r9)
   2f90e:	mov    %r11,0x8(%r9)
   2f912:	mov    %esi,0x10(%r9)
   2f916:	test   %rdi,%rdi
   2f919:	je     2f951 <JS_CallInternal+0x9f41>
   2f91b:	mov    %rdi,%rsi
   2f91e:	mov    0x10(%r13),%rdi
   2f922:	mov    %r8,-0x200(%rbp)
   2f929:	mov    %rcx,-0x1e8(%rbp)
   2f930:	mov    %rax,-0x1e0(%rbp)
   2f937:	call   207f0 <js_free_shape>
   2f93c:	mov    -0x200(%rbp),%r8
   2f943:	mov    -0x1e8(%rbp),%rcx
   2f94a:	mov    -0x1e0(%rbp),%rax
   2f951:	test   %r8,%r8
   2f954:	je     2ad2b <JS_CallInternal+0x531b>
   2f95a:	mov    0x10(%r13),%rdi
   2f95e:	mov    %r8,%rsi
   2f961:	mov    %rcx,-0x1e8(%rbp)
   2f968:	mov    %rax,-0x1e0(%rbp)
   2f96f:	call   207f0 <js_free_shape>
   2f974:	mov    -0x1e0(%rbp),%rax
   2f97b:	mov    -0x1e8(%rbp),%rcx
   2f982:	jmp    2ad2b <JS_CallInternal+0x531b>
   2f987:	nopw   0x0(%rax,%rax,1)
   2f990:	movslq -0x170(%rbp),%rsi
   2f997:	mov    0x10(%r13),%rdi
   2f99b:	rex.W
   2f99c:	.byte 0x89
   2f99d:	xchg   %eax,%ebp
   2f99e:	loopne 2f99d <JS_CallInternal+0x9f8d>


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000003049b <JS_CallInternal+0xaa8b>:
   3049b:	cmpw   $0x1,-0x200(%rbp)
   304a3:	jne    2ad2b <JS_CallInternal+0x531b>
   304a9:	testb  $0x8,0x10(%r10)
   304ae:	jne    2ad2b <JS_CallInternal+0x531b>
   304b4:	cmpw   $0x1,0x12(%rdi)
   304b9:	jne    2ad2b <JS_CallInternal+0x531b>
   304bf:	testb  $0x8,0x10(%rdi)
   304c3:	jne    2ad2b <JS_CallInternal+0x531b>
   304c9:	cmpb   $0x0,0x10(%r11)
   304ce:	je     2ad2b <JS_CallInternal+0x531b>
   304d4:	cmpb   $0x0,0x10(%rdx)
   304d8:	je     2ad2b <JS_CallInternal+0x531b>
   304de:	mov    (%r9),%r8
   304e1:	mov    0x8(%r9),%rdi
   304e5:	movq   %rdx,%xmm5
   304ea:	movq   %r11,%xmm0
   304ef:	addl   $0x1,-0x4(%r11)
   304f4:	punpcklqdq %xmm5,%xmm0
   304f8:	addl   $0x1,-0x4(%rdx)
   304fc:	mov    %rsi,%rdx
   304ff:	sar    $0x4,%rdx
   30503:	movups %xmm0,(%r9)
   30507:	mov    %edx,0x10(%r9)
   3050b:	test   %rdi,%rdi
   3050e:	jne    2f91b <JS_CallInternal+0x9f0b>
   30514:	jmp    2f951 <JS_CallInternal+0x9f41>
   30519:	movq   %rax,%xmm0
   3051e:	cmp    $0x8,%ecx
   30521:	je     30559 <JS_CallInternal+0xab49>
   30523:	test   %ecx,%ecx
   30525:	jne    2ebd6 <JS_CallInternal+0x91c6>
   3052b:	pxor   %xmm1,%xmm1
   3052f:	cvtsi2sd %edx,%xmm1
   30533:	xor    %eax,%eax
   30535:	comisd %xmm0,%xmm1
   30539:	movq   $0x1,-0x18(%rbx)
   30541:	setae  %al
   30544:	sub    $0x10,%rbx
   30548:	mov    %rax,-0x10(%rbx)
   3054c:	jmp    27ef9 <JS_CallInternal+0x24e9>
   30551:	pxor   %xmm0,%xmm0
   30555:	cvtsi2sd %eax,%xmm0
   30559:	movq   %rdx,%xmm1
   3055e:	jmp    30533 <JS_CallInternal+0xab23>
   30560:	rex.W
   30561:	.byte 0x83
   30562:	.byte 0xeb
