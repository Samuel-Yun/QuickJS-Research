
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ab45 <JS_CallInternal+0x5135>:
   2ab45:	endbr64
   2ab49:	mov    (%r12),%r9d
   2ab4d:	mov    -0x8(%rbx),%r11
   2ab51:	lea    0x4(%r12),%rax
   2ab56:	mov    %rax,-0x1e0(%rbp)
   2ab5d:	mov    -0x10(%rbx),%r10
   2ab61:	add    %r12,%r9
   2ab64:	cmp    $0xffffffff,%r11d
   2ab68:	jne    2e7a1 <JS_CallInternal+0x8d91>
   2ab6e:	mov    (%r9),%rax
   2ab71:	mov    0x18(%r10),%rdx
   2ab75:	mov    %rax,-0x1e8(%rbp)
   2ab7c:	cmp    %rax,%rdx
   2ab7f:	je     2d910 <JS_CallInternal+0x7f00>
   2ab85:	mov    0x14(%r9),%ecx
   2ab89:	mov    %r10,%rdi
   2ab8c:	nopl   0x0(%rax)
   2ab90:	mov    0x18(%rdx),%esi
   2ab93:	mov    %esi,%eax
   2ab95:	and    %ecx,%eax
   2ab97:	mov    0x38(%rdx,%rax,4),%eax
   2ab9b:	test   %rax,%rax
   2ab9e:	je     2c266 <JS_CallInternal+0x6856>
   2aba4:	lea    0x3c(,%rsi,4),%r8
   2abac:	sub    $0x1,%rax
   2abb0:	lea    (%r8,%rax,8),%rsi
   2abb4:	add    %rdx,%rsi
   2abb7:	cmp    0x4(%rsi),%ecx
   2abba:	jne    2c259 <JS_CallInternal+0x6849>
   2abc0:	mov    0x20(%rdi),%r8
   2abc4:	cmpb   $0x3f,0x3(%rsi)
   2abc8:	ja     2c9cf <JS_CallInternal+0x6fbf>
   2abce:	shl    $0x4,%rax
   2abd2:	add    %rax,%r8
   2abd5:	mov    %rax,%rsi
   2abd8:	mov    0x8(%r8),%rax
   2abdc:	mov    (%r8),%rcx
   2abdf:	cmp    $0xfffffff6,%eax
   2abe2:	jbe    2abe8 <JS_CallInternal+0x51d8>
   2abe4:	addl   $0x1,-0x4(%rcx)
   2abe8:	cmp    %rdi,%r10
   2abeb:	je     2fb4a <JS_CallInternal+0xa13a>
   2abf1:	mov    -0x8(%rbx),%rsi
   2abf5:	cmp    $0xfffffff6,%esi
   2abf8:	jbe    2ac0f <JS_CallInternal+0x51ff>
   2abfa:	mov    -0x10(%rbx),%rdi
   2abfe:	mov    -0x4(%rdi),%edx
   2ac01:	sub    $0x1,%edx
   2ac04:	mov    %edx,-0x4(%rdi)
   2ac07:	test   %edx,%edx
   2ac09:	jle    2e078 <JS_CallInternal+0x8668>
   2ac0f:	mov    %rcx,-0x10(%rbx)
   2ac13:	add    $0x5,%r12
   2ac17:	mov    %rax,-0x8(%rbx)
   2ac1b:	movzbl -0x1(%r12),%eax
   2ac21:	mov    %rax,%r10
   2ac24:	mov    (%r14,%rax,8),%rax
   2ac28:	jmp    *%rax
   2ac2a:	endbr64
   2ac2e:	mov    -0x8(%rbx),%rax
   2ac32:	mov    -0x10(%rbx),%rdx
   2ac36:	cmp    $0x3,%eax
   2ac39:	ja     2d173 <JS_CallInternal+0x7763>
   2ac3f:	xor    %eax,%eax
   2ac41:	test   %edx,%edx
   2ac43:	setne  %al
   2ac46:	test   %eax,%eax
   2ac48:	movq   $0x1,-0x8(%rbx)
   2ac50:	sete   %al
   2ac53:	add    $0x1,%r12
   2ac57:	movzbl %al,%eax
   2ac5a:	rex.W
   2ac5b:	.byte 0x89
   2ac5c:	rex.XB
