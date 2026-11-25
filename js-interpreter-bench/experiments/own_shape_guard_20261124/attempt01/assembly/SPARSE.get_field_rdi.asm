
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ab45 <JS_CallInternal+0x5135>:
   2ab45:	endbr64
   2ab49:	mov    (%r12),%eax
   2ab4d:	mov    -0x8(%rbx),%r11
   2ab51:	lea    0x4(%r12),%rcx
   2ab56:	mov    %rcx,-0x1e0(%rbp)
   2ab5d:	lea    (%r12,%rax,1),%r10
   2ab61:	mov    -0x10(%rbx),%rax
   2ab65:	cmp    $0xffffffff,%r11d
   2ab69:	jne    2f55b <JS_CallInternal+0x9b4b>
   2ab6f:	mov    0x18(%rax),%rdi
   2ab73:	cmpw   $0x1,0x12(%rax)
   2ab78:	je     2d5a0 <JS_CallInternal+0x7b90>
   2ab7e:	mov    0x14(%r10),%ecx
   2ab82:	mov    %rax,%r8
   2ab85:	data16 cs nopw 0x0(%rax,%rax,1)
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
   2ac5a:	rex.W
   2ac5b:	.byte 0x89
   2ac5c:	rex.XB
