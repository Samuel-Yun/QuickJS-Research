
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ac6d <JS_CallInternal+0x525d>:
   2ac6d:	endbr64
   2ac71:	mov    (%r12),%r9d
   2ac75:	mov    -0x8(%rbx),%rax
   2ac79:	lea    0x4(%r12),%rcx
   2ac7e:	mov    %rcx,-0x1e8(%rbp)
   2ac85:	mov    -0x10(%rbx),%r10
   2ac89:	mov    %rax,-0x1e0(%rbp)
   2ac90:	add    %r12,%r9
   2ac93:	cmp    $0xffffffff,%eax
   2ac96:	jne    2e765 <JS_CallInternal+0x8d55>
   2ac9c:	movzwl 0x12(%r10),%eax
   2aca1:	mov    0x18(%r10),%r11
   2aca5:	mov    %ax,-0x200(%rbp)
   2acac:	cmp    $0x1,%ax
   2acb0:	je     2d58f <JS_CallInternal+0x7b7f>
   2acb6:	mov    0x14(%r9),%ecx
   2acba:	mov    %r11,%rdx
   2acbd:	mov    %r10,%rdi
   2acc0:	mov    0x18(%rdx),%esi
   2acc3:	mov    %esi,%eax
   2acc5:	and    %ecx,%eax
   2acc7:	mov    0x38(%rdx,%rax,4),%eax
   2accb:	test   %rax,%rax
   2acce:	je     2c239 <JS_CallInternal+0x6829>
   2acd4:	lea    0x3c(,%rsi,4),%r8
   2acdc:	sub    $0x1,%rax
   2ace0:	lea    (%r8,%rax,8),%rsi
   2ace4:	add    %rdx,%rsi
   2ace7:	cmp    0x4(%rsi),%ecx
   2acea:	jne    2c22c <JS_CallInternal+0x681c>
   2acf0:	mov    0x20(%rdi),%r8
   2acf4:	cmpb   $0x3f,0x3(%rsi)
   2acf8:	ja     2c76e <JS_CallInternal+0x6d5e>
   2acfe:	shl    $0x4,%rax
   2ad02:	add    %rax,%r8
   2ad05:	mov    %rax,%rsi
   2ad08:	mov    0x8(%r8),%rax
   2ad0c:	mov    (%r8),%rcx
   2ad0f:	cmp    $0xfffffff6,%eax
   2ad12:	jbe    2ad18 <JS_CallInternal+0x5308>
   2ad14:	addl   $0x1,-0x4(%rcx)
   2ad18:	cmp    %rdi,%r10
   2ad1b:	je     2fc23 <JS_CallInternal+0xa213>
   2ad21:	cmp    %rdi,0x30(%r11)
   2ad25:	je     2fee1 <JS_CallInternal+0xa4d1>
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
   2ad80:	rex.W
   2ad81:	.byte 0x89
   2ad82:	xchg   %eax,%ebp
   2ad83:	and    %bh,%dh
