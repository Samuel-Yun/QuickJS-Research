
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002cfba <JS_CallInternal+0x75aa>:
   2cfba:	mov    0x1(%r12),%ecx
   2cfbf:	testb  $0x8,0x10(%rdx)
   2cfc3:	jne    291d9 <JS_CallInternal+0x37c9>
   2cfc9:	mov    0x18(%rdx),%rdi
   2cfcd:	cmp    %rdi,0x1(%r12,%rcx,1)
   2cfd2:	jne    291d9 <JS_CallInternal+0x37c9>
   2cfd8:	mov    0x11(%r12,%rcx,1),%eax
   2cfdd:	lea    0x10(%rbx),%rcx
   2cfe1:	shl    $0x4,%rax
   2cfe5:	add    0x20(%rdx),%rax
   2cfe9:	mov    (%rax),%rdx
   2cfec:	mov    0x8(%rax),%rax
   2cff0:	cmp    $0xfffffff6,%eax
   2cff3:	jbe    2cff9 <JS_CallInternal+0x75e9>
   2cff5:	addl   $0x1,-0x4(%rdx)
   2cff9:	mov    %rax,0x8(%rbx)
   2cffd:	lea    0x5(%r12),%rax
   2d002:	mov    %rdx,(%rbx)
   2d005:	lea    0x1(%rax),%r12
   2d009:	movzbl (%rax),%eax
   2d00c:	mov    %rcx,%rbx
   2d00f:	mov    %rax,%r10
   2d012:	jmp    *(%r14,%rax,8)
