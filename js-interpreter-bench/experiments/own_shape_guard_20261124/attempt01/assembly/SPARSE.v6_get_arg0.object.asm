
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002cf70 <JS_CallInternal+0x7560>:
   2cf70:	mov    0x1(%r12),%ecx
   2cf75:	lea    0x1(%r12,%rcx,1),%rcx
   2cf7a:	cmpw   $0x1,0x12(%rax)
   2cf7f:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf85:	testb  $0x8,0x10(%rax)
   2cf89:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf8f:	mov    0x18(%rax),%rdi
   2cf93:	cmp    %rdi,(%rcx)
   2cf96:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf9c:	mov    0x10(%rcx),%edx
   2cf9f:	lea    0x10(%rbx),%rcx
   2cfa3:	shl    $0x4,%rdx
   2cfa7:	add    0x20(%rax),%rdx
   2cfab:	mov    %rdx,%rax
   2cfae:	mov    (%rdx),%rdx
   2cfb1:	mov    0x8(%rax),%rax
   2cfb5:	cmp    $0xfffffff6,%eax
   2cfb8:	jbe    2cfbe <JS_CallInternal+0x75ae>
   2cfba:	addl   $0x1,-0x4(%rdx)
   2cfbe:	mov    %rax,0x8(%rbx)
   2cfc2:	lea    0x5(%r12),%rax
   2cfc7:	mov    %rdx,(%rbx)
   2cfca:	lea    0x1(%rax),%r12
   2cfce:	movzbl (%rax),%eax
   2cfd1:	mov    %rcx,%rbx
   2cfd4:	mov    %rax,%r10
   2cfd7:	jmp    *(%r14,%rax,8)
