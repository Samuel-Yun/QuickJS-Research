
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002cf7c <JS_CallInternal+0x756c>:
   2cf7c:	mov    0x1(%r12),%ecx
   2cf81:	mov    0x18(%rdx),%rdi
   2cf85:	lea    0x1(%r12,%rcx,1),%rcx
   2cf8a:	cmp    %rdi,(%rcx)
   2cf8d:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf93:	mov    0x10(%rcx),%eax
   2cf96:	lea    0x10(%rbx),%rcx
   2cf9a:	shl    $0x4,%rax
   2cf9e:	add    0x20(%rdx),%rax
   2cfa2:	mov    (%rax),%rdx
   2cfa5:	mov    0x8(%rax),%rax
   2cfa9:	cmp    $0xfffffff6,%eax
   2cfac:	jbe    2cfb2 <JS_CallInternal+0x75a2>
   2cfae:	addl   $0x1,-0x4(%rdx)
   2cfb2:	mov    %rax,0x8(%rbx)
   2cfb6:	lea    0x5(%r12),%rax
   2cfbb:	mov    %rdx,(%rbx)
   2cfbe:	lea    0x1(%rax),%r12
   2cfc2:	movzbl (%rax),%eax
   2cfc5:	mov    %rcx,%rbx
   2cfc8:	mov    %rax,%r10
   2cfcb:	jmp    *(%r14,%rax,8)
