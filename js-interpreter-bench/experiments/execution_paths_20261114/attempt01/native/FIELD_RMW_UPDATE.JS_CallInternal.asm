
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/execution_paths_20261114/attempt01/work/FIELD_RMW_UPDATE.release/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000025490 <JS_CallInternal>:
   25490:	55                   	push   %rbp
   25491:	48 89 e5             	mov    %rsp,%rbp
   25494:	41 57                	push   %r15
   25496:	4d 89 c7             	mov    %r8,%r15
   25499:	41 56                	push   %r14
   2549b:	49 89 ce             	mov    %rcx,%r14
   2549e:	41 55                	push   %r13
   254a0:	49 89 d5             	mov    %rdx,%r13
   254a3:	41 54                	push   %r12
   254a5:	49 89 f4             	mov    %rsi,%r12
   254a8:	53                   	push   %rbx
   254a9:	48 81 ec 68 02 00 00 	sub    $0x268,%rsp
   254b0:	48 8b 45 10          	mov    0x10(%rbp),%rax
   254b4:	48 89 bd 90 fe ff ff 	mov    %rdi,-0x170(%rbp)
   254bb:	48 89 b5 c8 fe ff ff 	mov    %rsi,-0x138(%rbp)
   254c2:	48 89 85 58 fe ff ff 	mov    %rax,-0x1a8(%rbp)
   254c9:	48 8b 45 18          	mov    0x18(%rbp),%rax
   254cd:	48 89 b5 60 fe ff ff 	mov    %rsi,-0x1a0(%rbp)
   254d4:	48 89 85 78 fe ff ff 	mov    %rax,-0x188(%rbp)
   254db:	48 8b 45 20          	mov    0x20(%rbp),%rax
   254df:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   254e6:	48 89 8d 50 fe ff ff 	mov    %rcx,-0x1b0(%rbp)
   254ed:	4c 89 85 70 fe ff ff 	mov    %r8,-0x190(%rbp)
   254f4:	44 89 8d a8 fe ff ff 	mov    %r9d,-0x158(%rbp)
   254fb:	48 89 85 98 fe ff ff 	mov    %rax,-0x168(%rbp)
   25502:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
   25509:	00 00 
   2550b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   2550f:	48 8b 47 10          	mov    0x10(%rdi),%rax
   25513:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
   2551a:	8b 87 a8 01 00 00    	mov    0x1a8(%rdi),%eax
   25520:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%rbp)
   25526:	83 e8 01             	sub    $0x1,%eax
   25529:	89 87 a8 01 00 00    	mov    %eax,0x1a8(%rdi)
   2552f:	85 c0                	test   %eax,%eax
   25531:	0f 8e 99 05 00 00    	jle    25ad0 <JS_CallInternal+0x640>
   25537:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   2553b:	0f 85 cf 05 00 00    	jne    25b10 <JS_CallInternal+0x680>
   25541:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   25548:	0f b7 40 12          	movzwl 0x12(%rax),%eax
   2554c:	66 83 f8 0d          	cmp    $0xd,%ax
   25550:	0f 85 a6 07 00 00    	jne    25cfc <JS_CallInternal+0x86c>
   25556:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   2555d:	48 8b 40 28          	mov    0x28(%rax),%rax
   25561:	48 89 85 c0 fe ff ff 	mov    %rax,-0x140(%rbp)
   25568:	44 0f b7 40 38       	movzwl 0x38(%rax),%r8d
   2556d:	44 3b 85 a8 fe ff ff 	cmp    -0x158(%rbp),%r8d
   25574:	0f 8f f9 01 00 00    	jg     25773 <JS_CallInternal+0x2e3>
   2557a:	8b 45 28             	mov    0x28(%rbp),%eax
   2557d:	83 e0 02             	and    $0x2,%eax
   25580:	41 0f 45 c0          	cmovne %r8d,%eax
   25584:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   2558b:	4c 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%r11
   25592:	44 0f b7 57 3a       	movzwl 0x3a(%rdi),%r10d
   25597:	0f b7 77 3e          	movzwl 0x3e(%rdi),%esi
   2559b:	0f b7 57 40          	movzwl 0x40(%rdi),%edx
   2559f:	48 89 ef             	mov    %rbp,%rdi
   255a2:	48 89 f1             	mov    %rsi,%rcx
   255a5:	44 01 d6             	add    %r10d,%esi
   255a8:	4c 89 d3             	mov    %r10,%rbx
   255ab:	01 c6                	add    %eax,%esi
   255ad:	49 89 d1             	mov    %rdx,%r9
   255b0:	48 63 f6             	movslq %esi,%rsi
   255b3:	48 8d 34 72          	lea    (%rdx,%rsi,2),%rsi
   255b7:	48 c1 e6 03          	shl    $0x3,%rsi
   255bb:	48 29 f7             	sub    %rsi,%rdi
   255be:	49 3b bb d0 04 00 00 	cmp    0x4d0(%r11),%rdi
   255c5:	0f 82 cc 07 00 00    	jb     25d97 <JS_CallInternal+0x907>
   255cb:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   255d2:	48 83 c6 17          	add    $0x17,%rsi
   255d6:	49 89 f3             	mov    %rsi,%r11
   255d9:	0f b6 7f 10          	movzbl 0x10(%rdi),%edi
   255dd:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
   255e4:	4c 89 a5 08 ff ff ff 	mov    %r12,-0xf8(%rbp)
   255eb:	4c 89 ad 10 ff ff ff 	mov    %r13,-0xf0(%rbp)
   255f2:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
   255f8:	8b bd a8 fe ff ff    	mov    -0x158(%rbp),%edi
   255fe:	89 bd 38 ff ff ff    	mov    %edi,-0xc8(%rbp)
   25604:	48 8b bd c8 fe ff ff 	mov    -0x138(%rbp),%rdi
   2560b:	48 8b 7f 30          	mov    0x30(%rdi),%rdi
   2560f:	48 89 bd 88 fe ff ff 	mov    %rdi,-0x178(%rbp)
   25616:	48 89 e7             	mov    %rsp,%rdi
   25619:	4c 29 df             	sub    %r11,%rdi
   2561c:	48 39 fc             	cmp    %rdi,%rsp
   2561f:	74 15                	je     25636 <JS_CallInternal+0x1a6>
   25621:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
   25628:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
   2562f:	00 00 
   25631:	48 39 fc             	cmp    %rdi,%rsp
   25634:	75 eb                	jne    25621 <JS_CallInternal+0x191>
   25636:	81 e6 f0 0f 00 00    	and    $0xff0,%esi
   2563c:	48 29 f4             	sub    %rsi,%rsp
   2563f:	48 85 f6             	test   %rsi,%rsi
   25642:	74 06                	je     2564a <JS_CallInternal+0x1ba>
   25644:	48 83 4c 34 f8 00    	orq    $0x0,-0x8(%rsp,%rsi,1)
   2564a:	48 8b b5 98 fe ff ff 	mov    -0x168(%rbp),%rsi
   25651:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
   25656:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   2565a:	48 89 bd 28 fe ff ff 	mov    %rdi,-0x1d8(%rbp)
   25661:	48 89 b5 80 fe ff ff 	mov    %rsi,-0x180(%rbp)
   25668:	85 c0                	test   %eax,%eax
   2566a:	0f 85 4b 66 00 00    	jne    2bcbb <JS_CallInternal+0x682b>
   25670:	48 98                	cltq
   25672:	48 c1 e0 04          	shl    $0x4,%rax
   25676:	48 01 f8             	add    %rdi,%rax
   25679:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   25680:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
   25687:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2568e:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
   25695:	45 85 d2             	test   %r10d,%r10d
   25698:	74 3e                	je     256d8 <JS_CallInternal+0x248>
   2569a:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   256a1:	48 89 de             	mov    %rbx,%rsi
   256a4:	48 c1 e6 04          	shl    $0x4,%rsi
   256a8:	48 89 f8             	mov    %rdi,%rax
   256ab:	48 01 fe             	add    %rdi,%rsi
   256ae:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   256b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   256bc:	00 00 00 00 
   256c0:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   256c7:	48 83 c0 10          	add    $0x10,%rax
   256cb:	48 c7 40 f8 03 00 00 	movq   $0x3,-0x8(%rax)
   256d2:	00 
   256d3:	48 39 f0             	cmp    %rsi,%rax
   256d6:	75 e8                	jne    256c0 <JS_CallInternal+0x230>
   256d8:	48 c1 e3 04          	shl    $0x4,%rbx
   256dc:	48 c1 e1 04          	shl    $0x4,%rcx
   256e0:	48 03 9d a0 fe ff ff 	add    -0x160(%rbp),%rbx
   256e7:	48 8d 3c 0b          	lea    (%rbx,%rcx,1),%rdi
   256eb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
   256f2:	66 45 85 c9          	test   %r9w,%r9w
   256f6:	74 0b                	je     25703 <JS_CallInternal+0x273>
   256f8:	48 c1 e2 03          	shl    $0x3,%rdx
   256fc:	31 f6                	xor    %esi,%esi
   256fe:	e8 5d c1 fe ff       	call   11860 <memset@plt>
   25703:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2570a:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   25711:	48 89 9d 48 fe ff ff 	mov    %rbx,-0x1b8(%rbp)
   25718:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2571f:	4c 8b 79 18          	mov    0x18(%rcx),%r15
   25723:	4c 8b 69 48          	mov    0x48(%rcx),%r13
   25727:	48 8b 8d c8 fe ff ff 	mov    -0x138(%rbp),%rcx
   2572e:	48 89 85 00 ff ff ff 	mov    %rax,-0x100(%rbp)
   25735:	48 8d 85 00 ff ff ff 	lea    -0x100(%rbp),%rax
   2573c:	48 89 87 f0 04 00 00 	mov    %rax,0x4f0(%rdi)
   25743:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
   2574a:	48 89 85 b8 fe ff ff 	mov    %rax,-0x148(%rbp)
   25751:	41 0f b6 07          	movzbl (%r15),%eax
   25755:	4c 8d 35 e4 55 0e 00 	lea    0xe55e4(%rip),%r14        # 10ad40 <dispatch_table.85>
   2575c:	4d 8d 67 01          	lea    0x1(%r15),%r12
   25760:	49 8d 54 24 04       	lea    0x4(%r12),%rdx
   25765:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   25769:	49 89 c2             	mov    %rax,%r10
   2576c:	b8 01 00 00 00       	mov    $0x1,%eax
   25771:	ff e1                	jmp    *%rcx
   25773:	44 89 c0             	mov    %r8d,%eax
   25776:	e9 09 fe ff ff       	jmp    25584 <JS_CallInternal+0xf4>
   2577b:	f3 0f 1e fa          	endbr64
   2577f:	90                   	nop
   25780:	f3 0f 1e fa          	endbr64
   25784:	41 8d 82 4d ff ff ff 	lea    -0xb3(%r10),%eax
   2578b:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   25792:	00 
   25793:	49 83 c4 01          	add    $0x1,%r12
   25797:	48 83 c3 10          	add    $0x10,%rbx
   2579b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2579f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   257a5:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   257a9:	49 89 c2             	mov    %rax,%r10
   257ac:	0f 1f 40 00          	nopl   0x0(%rax)
   257b0:	b8 01 00 00 00       	mov    $0x1,%eax
   257b5:	49 8d 54 24 04       	lea    0x4(%r12),%rdx
   257ba:	ff e1                	jmp    *%rcx
   257bc:	f3 0f 1e fa          	endbr64
   257c0:	f3 0f 1e fa          	endbr64
   257c4:	41 8b 44 24 04       	mov    0x4(%r12),%eax
   257c9:	4d 8d 7c 24 09       	lea    0x9(%r12),%r15
   257ce:	41 8b 0c 24          	mov    (%r12),%ecx
   257d2:	4c 89 ef             	mov    %r13,%rdi
   257d5:	f3 0f 6f 5b f0       	movdqu -0x10(%rbx),%xmm3
   257da:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   257e1:	89 85 20 fe ff ff    	mov    %eax,-0x1e0(%rbp)
   257e7:	41 0f b6 44 24 08    	movzbl 0x8(%r12),%eax
   257ed:	0f 29 9d 30 fe ff ff 	movaps %xmm3,-0x1d0(%rbp)
   257f4:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   257fb:	88 85 10 fe ff ff    	mov    %al,-0x1f0(%rbp)
   25801:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25808:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2580e:	49 89 d4             	mov    %rdx,%r12
   25811:	4c 89 78 30          	mov    %r15,0x30(%rax)
   25815:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2581c:	48 89 c6             	mov    %rax,%rsi
   2581f:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   25826:	e8 35 ac 04 00       	call   70460 <JS_HasProperty>
   2582b:	85 c0                	test   %eax,%eax
   2582d:	0f 88 9d 03 00 00    	js     25bd0 <JS_CallInternal+0x740>
   25833:	0f 84 b7 65 00 00    	je     2bdf0 <JS_CallInternal+0x6960>
   25839:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   25840:	44 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10d
   25847:	0f 85 01 06 00 00    	jne    25e4e <JS_CallInternal+0x9be>
   2584d:	41 83 ea 71          	sub    $0x71,%r10d
   25851:	41 83 fa 04          	cmp    $0x4,%r10d
   25855:	0f 87 0f 05 00 00    	ja     25d6a <JS_CallInternal+0x8da>
   2585b:	48 8d 15 02 d9 0b 00 	lea    0xbd902(%rip),%rdx        # e3164 <qjsc_repl_size+0x4b8>
   25862:	4a 63 04 92          	movslq (%rdx,%r10,4),%rax
   25866:	48 01 d0             	add    %rdx,%rax
   25869:	3e ff e0             	notrack jmp *%rax
   2586c:	f3 0f 1e fa          	endbr64
   25870:	f3 0f 1e fa          	endbr64
   25874:	45 8d 8a 14 ff ff ff 	lea    -0xec(%r10),%r9d
   2587b:	4d 89 e7             	mov    %r12,%r15
   2587e:	4d 63 e1             	movslq %r9d,%r12
   25881:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25888:	49 89 db             	mov    %rbx,%r11
   2588b:	31 c9                	xor    %ecx,%ecx
   2588d:	49 c1 e4 04          	shl    $0x4,%r12
   25891:	44 89 95 30 fe ff ff 	mov    %r10d,-0x1d0(%rbp)
   25898:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2589e:	4c 89 ef             	mov    %r13,%rdi
   258a1:	4d 29 e3             	sub    %r12,%r11
   258a4:	4c 89 78 30          	mov    %r15,0x30(%rax)
   258a8:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   258ac:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   258b0:	6a 00                	push   $0x0
   258b2:	41 53                	push   %r11
   258b4:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   258bb:	6a 03                	push   $0x3
   258bd:	6a 00                	push   $0x0
   258bf:	44 89 8d 10 fe ff ff 	mov    %r9d,-0x1f0(%rbp)
   258c6:	e8 c5 fb ff ff       	call   25490 <JS_CallInternal>
   258cb:	48 83 c4 20          	add    $0x20,%rsp
   258cf:	49 89 c0             	mov    %rax,%r8
   258d2:	48 89 d0             	mov    %rdx,%rax
   258d5:	83 fa 06             	cmp    $0x6,%edx
   258d8:	0f 84 f2 02 00 00    	je     25bd0 <JS_CallInternal+0x740>
   258de:	4c 89 c1             	mov    %r8,%rcx
   258e1:	83 bd 30 fe ff ff 23 	cmpl   $0x23,-0x1d0(%rbp)
   258e8:	0f 84 a4 03 00 00    	je     25c92 <JS_CallInternal+0x802>
   258ee:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   258f5:	44 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9d
   258fc:	4d 01 dc             	add    %r11,%r12
   258ff:	45 85 c9             	test   %r9d,%r9d
   25902:	0f 88 a3 00 00 00    	js     259ab <JS_CallInternal+0x51b>
   25908:	48 89 9d 00 fe ff ff 	mov    %rbx,-0x200(%rbp)
   2590f:	49 8d 5b f0          	lea    -0x10(%r11),%rbx
   25913:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2591a:	4d 89 e8             	mov    %r13,%r8
   2591d:	45 89 cd             	mov    %r9d,%r13d
   25920:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   25927:	eb 20                	jmp    25949 <JS_CallInternal+0x4b9>
   25929:	90                   	nop
   2592a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25931:	00 00 00 00 
   25935:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2593c:	00 00 00 00 
   25940:	48 83 c3 10          	add    $0x10,%rbx
   25944:	4c 39 e3             	cmp    %r12,%rbx
   25947:	74 47                	je     25990 <JS_CallInternal+0x500>
   25949:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2594d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   25950:	76 ee                	jbe    25940 <JS_CallInternal+0x4b0>
   25952:	48 8b 33             	mov    (%rbx),%rsi
   25955:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   25958:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2595b:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2595e:	85 d2                	test   %edx,%edx
   25960:	7f de                	jg     25940 <JS_CallInternal+0x4b0>
   25962:	49 8b 78 10          	mov    0x10(%r8),%rdi
   25966:	48 89 c2             	mov    %rax,%rdx
   25969:	48 83 c3 10          	add    $0x10,%rbx
   2596d:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   25974:	e8 47 90 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   25979:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   25980:	4c 39 e3             	cmp    %r12,%rbx
   25983:	75 c4                	jne    25949 <JS_CallInternal+0x4b9>
   25985:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2598c:	00 00 00 00 
   25990:	45 89 e9             	mov    %r13d,%r9d
   25993:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2599a:	4d 89 c5             	mov    %r8,%r13
   2599d:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   259a4:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   259ab:	41 83 c1 01          	add    $0x1,%r9d
   259af:	4d 8d 67 01          	lea    0x1(%r15),%r12
   259b3:	4d 63 c9             	movslq %r9d,%r9
   259b6:	49 c1 e1 04          	shl    $0x4,%r9
   259ba:	4c 29 cb             	sub    %r9,%rbx
   259bd:	48 89 da             	mov    %rbx,%rdx
   259c0:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   259c4:	4c 89 02             	mov    %r8,(%rdx)
   259c7:	48 89 42 08          	mov    %rax,0x8(%rdx)
   259cb:	41 0f b6 07          	movzbl (%r15),%eax
   259cf:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   259d3:	49 89 c2             	mov    %rax,%r10
   259d6:	e9 d5 fd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   259db:	f3 0f 1e fa          	endbr64
   259df:	f3 0f 1e fa          	endbr64
   259e3:	41 8b 04 24          	mov    (%r12),%eax
   259e7:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   259eb:	31 f6                	xor    %esi,%esi
   259ed:	ba 02 00 00 00       	mov    $0x2,%edx
   259f2:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   259f9:	4c 89 ef             	mov    %r13,%rdi
   259fc:	b9 01 00 00 00       	mov    $0x1,%ecx
   25a01:	4d 8d 7c 24 06       	lea    0x6(%r12),%r15
   25a06:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   25a0c:	41 0f b7 44 24 04    	movzwl 0x4(%r12),%eax
   25a12:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   25a19:	66 89 85 00 fe ff ff 	mov    %ax,-0x200(%rbp)
   25a20:	e8 cb 55 02 00       	call   4aff0 <JS_NewObjectProtoClass>
   25a25:	48 89 03             	mov    %rax,(%rbx)
   25a28:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   25a2c:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   25a30:	0f 84 00 04 00 00    	je     25e36 <JS_CallInternal+0x9a6>
   25a36:	44 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10d
   25a3d:	41 83 fa 78          	cmp    $0x78,%r10d
   25a41:	0f 85 c4 03 00 00    	jne    25e0b <JS_CallInternal+0x97b>
   25a47:	0f b7 85 00 fe ff ff 	movzwl -0x200(%rbp),%eax
   25a4e:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   25a55:	4c 8b 04 c1          	mov    (%rcx,%rax,8),%r8
   25a59:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   25a5e:	48 8b 33             	mov    (%rbx),%rsi
   25a61:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   25a67:	b9 22 00 00 00       	mov    $0x22,%ecx
   25a6c:	4c 89 ef             	mov    %r13,%rdi
   25a6f:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   25a76:	e8 e5 49 02 00       	call   4a460 <add_property>
   25a7b:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   25a82:	48 85 c0             	test   %rax,%rax
   25a85:	0f 84 6d 98 00 00    	je     2f2f8 <JS_CallInternal+0x9e68>
   25a8b:	4c 89 00             	mov    %r8,(%rax)
   25a8e:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   25a94:	31 d2                	xor    %edx,%edx
   25a96:	4c 89 ef             	mov    %r13,%rdi
   25a99:	48 83 c3 20          	add    $0x20,%rbx
   25a9d:	49 83 c4 07          	add    $0x7,%r12
   25aa1:	e8 1a 64 01 00       	call   3bec0 <__JS_AtomToValue>
   25aa6:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   25aad:	48 89 01             	mov    %rax,(%rcx)
   25ab0:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   25ab4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   25aba:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   25abe:	49 89 c2             	mov    %rax,%r10
   25ac1:	e9 ea fc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   25ac6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   25acd:	00 00 00 
   25ad0:	e8 0b 0b 01 00       	call   365e0 <__js_poll_interrupts>
   25ad5:	85 c0                	test   %eax,%eax
   25ad7:	0f 84 5a fa ff ff    	je     25537 <JS_CallInternal+0xa7>
   25add:	31 c0                	xor    %eax,%eax
   25adf:	ba 06 00 00 00       	mov    $0x6,%edx
   25ae4:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   25ae8:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
   25aef:	00 00 
   25af1:	0f 85 ae a7 00 00    	jne    302a5 <JS_CallInternal+0xae15>
   25af7:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
   25afb:	5b                   	pop    %rbx
   25afc:	41 5c                	pop    %r12
   25afe:	41 5d                	pop    %r13
   25b00:	41 5e                	pop    %r14
   25b02:	41 5f                	pop    %r15
   25b04:	5d                   	pop    %rbp
   25b05:	c3                   	ret
   25b06:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   25b0d:	00 00 00 
   25b10:	f6 45 28 04          	testb  $0x4,0x28(%rbp)
   25b14:	0f 84 b0 5b 00 00    	je     2b6ca <JS_CallInternal+0x623a>
   25b1a:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   25b21:	48 8b 58 58          	mov    0x58(%rax),%rbx
   25b25:	48 8b 70 70          	mov    0x70(%rax),%rsi
   25b29:	48 8d 50 50          	lea    0x50(%rax),%rdx
   25b2d:	48 8b 78 68          	mov    0x68(%rax),%rdi
   25b31:	48 89 95 b8 fe ff ff 	mov    %rdx,-0x148(%rbp)
   25b38:	48 8b 4b 28          	mov    0x28(%rbx),%rcx
   25b3c:	48 89 9d 40 fe ff ff 	mov    %rbx,-0x1c0(%rbp)
   25b43:	48 8b 5b 30          	mov    0x30(%rbx),%rbx
   25b47:	48 89 b5 a0 fe ff ff 	mov    %rsi,-0x160(%rbp)
   25b4e:	4c 8b 69 48          	mov    0x48(%rcx),%r13
   25b52:	48 89 8d c0 fe ff ff 	mov    %rcx,-0x140(%rbp)
   25b59:	48 89 9d 88 fe ff ff 	mov    %rbx,-0x178(%rbp)
   25b60:	48 89 c3             	mov    %rax,%rbx
   25b63:	0f b7 41 3a          	movzwl 0x3a(%rcx),%eax
   25b67:	48 89 d9             	mov    %rbx,%rcx
   25b6a:	48 89 bd 28 fe ff ff 	mov    %rdi,-0x1d8(%rbp)
   25b71:	48 8b 9b 90 00 00 00 	mov    0x90(%rbx),%rbx
   25b78:	48 c1 e0 04          	shl    $0x4,%rax
   25b7c:	44 8b 51 24          	mov    0x24(%rcx),%r10d
   25b80:	48 c7 81 90 00 00 00 	movq   $0x0,0x90(%rcx)
   25b87:	00 00 00 00 
   25b8b:	48 01 f0             	add    %rsi,%rax
   25b8e:	48 8b b5 b0 fe ff ff 	mov    -0x150(%rbp),%rsi
   25b95:	4c 8b b9 80 00 00 00 	mov    0x80(%rcx),%r15
   25b9c:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
   25ba3:	48 8b 86 f0 04 00 00 	mov    0x4f0(%rsi),%rax
   25baa:	48 89 41 50          	mov    %rax,0x50(%rcx)
   25bae:	48 89 96 f0 04 00 00 	mov    %rdx,0x4f0(%rsi)
   25bb5:	45 85 d2             	test   %r10d,%r10d
   25bb8:	0f 84 84 02 00 00    	je     25e42 <JS_CallInternal+0x9b2>
   25bbe:	48 8b 85 28 fe ff ff 	mov    -0x1d8(%rbp),%rax
   25bc5:	48 89 85 80 fe ff ff 	mov    %rax,-0x180(%rbp)
   25bcc:	0f 1f 40 00          	nopl   0x0(%rax)
   25bd0:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   25bd7:	83 b8 e0 04 00 00 ff 	cmpl   $0xffffffff,0x4e0(%rax)
   25bde:	75 41                	jne    25c21 <JS_CallInternal+0x791>
   25be0:	48 8b 80 d8 04 00 00 	mov    0x4d8(%rax),%rax
   25be7:	66 83 78 12 03       	cmpw   $0x3,0x12(%rax)
   25bec:	75 33                	jne    25c21 <JS_CallInternal+0x791>
   25bee:	48 8b 48 18          	mov    0x18(%rax),%rcx
   25bf2:	8b 51 18             	mov    0x18(%rcx),%edx
   25bf5:	89 d0                	mov    %edx,%eax
   25bf7:	83 e0 39             	and    $0x39,%eax
   25bfa:	8b 44 81 38          	mov    0x38(%rcx,%rax,4),%eax
   25bfe:	48 85 c0             	test   %rax,%rax
   25c01:	0f 84 a4 6e 00 00    	je     2caab <JS_CallInternal+0x761b>
   25c07:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   25c0e:	00 
   25c0f:	48 8d 44 c2 f8       	lea    -0x8(%rdx,%rax,8),%rax
   25c14:	48 01 c8             	add    %rcx,%rax
   25c17:	83 78 04 39          	cmpl   $0x39,0x4(%rax)
   25c1b:	0f 85 7d 6e 00 00    	jne    2ca9e <JS_CallInternal+0x760e>
   25c21:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   25c28:	80 b8 e8 04 00 00 00 	cmpb   $0x0,0x4e8(%rax)
   25c2f:	0f 84 a8 01 00 00    	je     25ddd <JS_CallInternal+0x94d>
   25c35:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   25c3c:	f6 40 11 30          	testb  $0x30,0x11(%rax)
   25c40:	0f 84 53 68 00 00    	je     2c499 <JS_CallInternal+0x7009>
   25c46:	4d 89 fc             	mov    %r15,%r12
   25c49:	b8 06 00 00 00       	mov    $0x6,%eax
   25c4e:	31 c9                	xor    %ecx,%ecx
   25c50:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   25c57:	4c 89 62 30          	mov    %r12,0x30(%rdx)
   25c5b:	48 89 5a 40          	mov    %rbx,0x40(%rdx)
   25c5f:	48 8b 9d b8 fe ff ff 	mov    -0x148(%rbp),%rbx
   25c66:	48 8b 13             	mov    (%rbx),%rdx
   25c69:	48 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%rbx
   25c70:	48 89 93 f0 04 00 00 	mov    %rdx,0x4f0(%rbx)
   25c77:	48 89 c2             	mov    %rax,%rdx
   25c7a:	48 89 c8             	mov    %rcx,%rax
   25c7d:	e9 62 fe ff ff       	jmp    25ae4 <JS_CallInternal+0x654>
   25c82:	f3 0f 1e fa          	endbr64
   25c86:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25c8a:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   25c8e:	48 83 eb 10          	sub    $0x10,%rbx
   25c92:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
   25c99:	66 83 7a 40 00       	cmpw   $0x0,0x40(%rdx)
   25c9e:	0f 85 45 74 00 00    	jne    2d0e9 <JS_CallInternal+0x7c59>
   25ca4:	4c 8b a5 28 fe ff ff 	mov    -0x1d8(%rbp),%r12
   25cab:	49 39 dc             	cmp    %rbx,%r12
   25cae:	73 af                	jae    25c5f <JS_CallInternal+0x7cf>
   25cb0:	49 89 c6             	mov    %rax,%r14
   25cb3:	49 89 cf             	mov    %rcx,%r15
   25cb6:	eb 15                	jmp    25ccd <JS_CallInternal+0x83d>
   25cb8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   25cbf:	00 
   25cc0:	49 83 c4 10          	add    $0x10,%r12
   25cc4:	49 39 dc             	cmp    %rbx,%r12
   25cc7:	0f 83 bf 00 00 00    	jae    25d8c <JS_CallInternal+0x8fc>
   25ccd:	49 8b 74 24 08       	mov    0x8(%r12),%rsi
   25cd2:	83 fe f6             	cmp    $0xfffffff6,%esi
   25cd5:	76 e9                	jbe    25cc0 <JS_CallInternal+0x830>
   25cd7:	49 8b 14 24          	mov    (%r12),%rdx
   25cdb:	8b 42 fc             	mov    -0x4(%rdx),%eax
   25cde:	83 e8 01             	sub    $0x1,%eax
   25ce1:	89 42 fc             	mov    %eax,-0x4(%rdx)
   25ce4:	85 c0                	test   %eax,%eax
   25ce6:	7f d8                	jg     25cc0 <JS_CallInternal+0x830>
   25ce8:	48 89 d0             	mov    %rdx,%rax
   25ceb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25cef:	48 89 f2             	mov    %rsi,%rdx
   25cf2:	48 89 c6             	mov    %rax,%rsi
   25cf5:	e8 c6 8c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   25cfa:	eb c4                	jmp    25cc0 <JS_CallInternal+0x830>
   25cfc:	48 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%rbx
   25d03:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   25d07:	48 c1 e0 03          	shl    $0x3,%rax
   25d0b:	48 03 83 58 04 00 00 	add    0x458(%rbx),%rax
   25d12:	48 8b 40 18          	mov    0x18(%rax),%rax
   25d16:	48 85 c0             	test   %rax,%rax
   25d19:	0f 84 ab 59 00 00    	je     2b6ca <JS_CallInternal+0x623a>
   25d1f:	8b 5d 28             	mov    0x28(%rbp),%ebx
   25d22:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   25d29:	4d 89 f8             	mov    %r15,%r8
   25d2c:	4c 89 f1             	mov    %r14,%rcx
   25d2f:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25d36:	4c 89 e6             	mov    %r12,%rsi
   25d39:	4c 89 ea             	mov    %r13,%rdx
   25d3c:	53                   	push   %rbx
   25d3d:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   25d43:	ff d0                	call   *%rax
   25d45:	41 58                	pop    %r8
   25d47:	41 59                	pop    %r9
   25d49:	e9 96 fd ff ff       	jmp    25ae4 <JS_CallInternal+0x654>
   25d4e:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   25d54:	31 d2                	xor    %edx,%edx
   25d56:	4c 89 ef             	mov    %r13,%rdi
   25d59:	48 83 c3 10          	add    $0x10,%rbx
   25d5d:	e8 5e 61 01 00       	call   3bec0 <__JS_AtomToValue>
   25d62:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25d66:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   25d6a:	8b 85 20 fe ff ff    	mov    -0x1e0(%rbp),%eax
   25d70:	83 e8 05             	sub    $0x5,%eax
   25d73:	48 98                	cltq
   25d75:	49 01 c7             	add    %rax,%r15
   25d78:	41 0f b6 07          	movzbl (%r15),%eax
   25d7c:	4d 8d 67 01          	lea    0x1(%r15),%r12
   25d80:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   25d84:	49 89 c2             	mov    %rax,%r10
   25d87:	e9 24 fa ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   25d8c:	4c 89 f0             	mov    %r14,%rax
   25d8f:	4c 89 f9             	mov    %r15,%rcx
   25d92:	e9 c8 fe ff ff       	jmp    25c5f <JS_CallInternal+0x7cf>
   25d97:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25d9e:	48 8d 35 29 37 0b 00 	lea    0xb3729(%rip),%rsi        # d94ce <_IO_stdin_used+0x4ce>
   25da5:	31 c0                	xor    %eax,%eax
   25da7:	e8 74 07 01 00       	call   36520 <JS_ThrowInternalError>
   25dac:	e9 33 fd ff ff       	jmp    25ae4 <JS_CallInternal+0x654>
   25db1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25db5:	48 89 ce             	mov    %rcx,%rsi
   25db8:	4c 89 e2             	mov    %r12,%rdx
   25dbb:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   25dc2:	e8 f9 8b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   25dc7:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   25dce:	66 90                	xchg   %ax,%ax
   25dd0:	41 83 fc 05          	cmp    $0x5,%r12d
   25dd4:	0f 84 56 68 00 00    	je     2c630 <JS_CallInternal+0x71a0>
   25dda:	4c 89 f3             	mov    %r14,%rbx
   25ddd:	48 39 9d 48 fe ff ff 	cmp    %rbx,-0x1b8(%rbp)
   25de4:	0f 83 4b fe ff ff    	jae    25c35 <JS_CallInternal+0x7a5>
   25dea:	4c 8b 63 f8          	mov    -0x8(%rbx),%r12
   25dee:	4c 8d 73 f0          	lea    -0x10(%rbx),%r14
   25df2:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25df6:	41 83 fc f6          	cmp    $0xfffffff6,%r12d
   25dfa:	76 d4                	jbe    25dd0 <JS_CallInternal+0x940>
   25dfc:	8b 41 fc             	mov    -0x4(%rcx),%eax
   25dff:	83 e8 01             	sub    $0x1,%eax
   25e02:	89 41 fc             	mov    %eax,-0x4(%rcx)
   25e05:	85 c0                	test   %eax,%eax
   25e07:	7f c7                	jg     25dd0 <JS_CallInternal+0x940>
   25e09:	eb a6                	jmp    25db1 <JS_CallInternal+0x921>
   25e0b:	31 c9                	xor    %ecx,%ecx
   25e0d:	0f b7 95 00 fe ff ff 	movzwl -0x200(%rbp),%edx
   25e14:	41 83 fa 77          	cmp    $0x77,%r10d
   25e18:	4c 89 ef             	mov    %r13,%rdi
   25e1b:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   25e22:	0f 94 c1             	sete   %cl
   25e25:	e8 c6 3f 02 00       	call   49df0 <get_var_ref>
   25e2a:	49 89 c0             	mov    %rax,%r8
   25e2d:	48 85 c0             	test   %rax,%rax
   25e30:	0f 85 28 fc ff ff    	jne    25a5e <JS_CallInternal+0x5ce>
   25e36:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   25e3d:	e9 8e fd ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   25e42:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   25e49:	e9 03 f9 ff ff       	jmp    25751 <JS_CallInternal+0x2c1>
   25e4e:	48 83 ec 08          	sub    $0x8,%rsp
   25e52:	4d 89 e1             	mov    %r12,%r9
   25e55:	4c 89 e2             	mov    %r12,%rdx
   25e58:	4c 89 ef             	mov    %r13,%rdi
   25e5b:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   25e62:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   25e69:	b9 f1 00 00 00       	mov    $0xf1,%ecx
   25e6e:	6a 00                	push   $0x0
   25e70:	48 8b b5 e8 fd ff ff 	mov    -0x218(%rbp),%rsi
   25e77:	e8 24 a5 00 00       	call   303a0 <JS_GetPropertyInternal>
   25e7c:	5e                   	pop    %rsi
   25e7d:	5f                   	pop    %rdi
   25e7e:	49 89 c0             	mov    %rax,%r8
   25e81:	49 89 d4             	mov    %rdx,%r12
   25e84:	83 fa 06             	cmp    $0x6,%edx
   25e87:	0f 84 43 fd ff ff    	je     25bd0 <JS_CallInternal+0x740>
   25e8d:	83 fa ff             	cmp    $0xffffffff,%edx
   25e90:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   25e97:	0f 84 ee 5e 00 00    	je     2bd8b <JS_CallInternal+0x68fb>
   25e9d:	83 fa f6             	cmp    $0xfffffff6,%edx
   25ea0:	0f 86 a7 f9 ff ff    	jbe    2584d <JS_CallInternal+0x3bd>
   25ea6:	8b 40 fc             	mov    -0x4(%rax),%eax
   25ea9:	83 e8 01             	sub    $0x1,%eax
   25eac:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   25eb0:	85 c0                	test   %eax,%eax
   25eb2:	0f 8f 95 f9 ff ff    	jg     2584d <JS_CallInternal+0x3bd>
   25eb8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25ebc:	4c 89 c6             	mov    %r8,%rsi
   25ebf:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   25ec6:	e8 f5 8a ff ff       	call   1e9c0 <__JS_FreeValueRT>
   25ecb:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   25ed2:	e9 76 f9 ff ff       	jmp    2584d <JS_CallInternal+0x3bd>
   25ed7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   25ede:	00 00 
   25ee0:	f3 0f 1e fa          	endbr64
   25ee4:	f3 0f 1e fa          	endbr64
   25ee8:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   25eef:	4c 89 e2             	mov    %r12,%rdx
   25ef2:	44 89 d1             	mov    %r10d,%ecx
   25ef5:	4c 89 ef             	mov    %r13,%rdi
   25ef8:	48 8d 35 31 6f 0b 00 	lea    0xb6f31(%rip),%rsi        # dce30 <_IO_stdin_used+0x3e30>
   25eff:	4d 89 e7             	mov    %r12,%r15
   25f02:	48 2b 50 18          	sub    0x18(%rax),%rdx
   25f06:	31 c0                	xor    %eax,%eax
   25f08:	83 ea 01             	sub    $0x1,%edx
   25f0b:	e8 10 06 01 00       	call   36520 <JS_ThrowInternalError>
   25f10:	e9 bb fc ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   25f15:	f3 0f 1e fa          	endbr64
   25f19:	f3 0f 1e fa          	endbr64
   25f1d:	31 c0                	xor    %eax,%eax
   25f1f:	b9 02 00 00 00       	mov    $0x2,%ecx
   25f24:	e9 27 fd ff ff       	jmp    25c50 <JS_CallInternal+0x7c0>
   25f29:	f3 0f 1e fa          	endbr64
   25f2d:	f3 0f 1e fa          	endbr64
   25f31:	48 83 ec 08          	sub    $0x8,%rsp
   25f35:	31 c0                	xor    %eax,%eax
   25f37:	41 83 fa 54          	cmp    $0x54,%r10d
   25f3b:	41 0f b6 4c 24 04    	movzbl 0x4(%r12),%ecx
   25f41:	0f 94 c0             	sete   %al
   25f44:	41 8b 14 24          	mov    (%r12),%edx
   25f48:	48 89 de             	mov    %rbx,%rsi
   25f4b:	4c 89 ef             	mov    %r13,%rdi
   25f4e:	50                   	push   %rax
   25f4f:	4c 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%r9
   25f56:	4d 8d 7c 24 05       	lea    0x5(%r12),%r15
   25f5b:	4c 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%r8
   25f62:	e8 99 ca 06 00       	call   92a00 <js_op_define_class>
   25f67:	41 58                	pop    %r8
   25f69:	41 59                	pop    %r9
   25f6b:	83 f8 ff             	cmp    $0xffffffff,%eax
   25f6e:	0f 84 5c fc ff ff    	je     25bd0 <JS_CallInternal+0x740>
   25f74:	41 0f b6 44 24 05    	movzbl 0x5(%r12),%eax
   25f7a:	49 83 c4 06          	add    $0x6,%r12
   25f7e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   25f82:	49 89 c2             	mov    %rax,%r10
   25f85:	e9 26 f8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   25f8a:	f3 0f 1e fa          	endbr64
   25f8e:	f3 0f 1e fa          	endbr64
   25f92:	41 83 fa 52          	cmp    $0x52,%r10d
   25f96:	0f 94 85 10 fe ff ff 	sete   -0x1f0(%rbp)
   25f9d:	0f 84 9f 67 00 00    	je     2c742 <JS_CallInternal+0x72b2>
   25fa3:	41 8b 04 24          	mov    (%r12),%eax
   25fa7:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   25fac:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   25fb2:	0f b6 8d 10 fe ff ff 	movzbl -0x1f0(%rbp),%ecx
   25fb9:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   25fbe:	41 0f b6 17          	movzbl (%r15),%edx
   25fc2:	bf 03 00 00 00       	mov    $0x3,%edi
   25fc7:	48 c7 85 e0 fd ff ff 	movq   $0x0,-0x220(%rbp)
   25fce:	00 00 00 00 
   25fd2:	29 c8                	sub    %ecx,%eax
   25fd4:	89 8d b4 fd ff ff    	mov    %ecx,-0x24c(%rbp)
   25fda:	48 98                	cltq
   25fdc:	48 89 bd a8 fd ff ff 	mov    %rdi,-0x258(%rbp)
   25fe3:	48 c1 e0 04          	shl    $0x4,%rax
   25fe7:	48 89 bd 98 fd ff ff 	mov    %rdi,-0x268(%rbp)
   25fee:	48 c7 85 b8 fd ff ff 	movq   $0x3,-0x248(%rbp)
   25ff5:	03 00 00 00 
   25ff9:	48 01 d8             	add    %rbx,%rax
   25ffc:	48 8b 08             	mov    (%rax),%rcx
   25fff:	48 8b 40 08          	mov    0x8(%rax),%rax
   26003:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2600a:	89 d0                	mov    %edx,%eax
   2600c:	83 e0 04             	and    $0x4,%eax
   2600f:	48 89 8d 20 fe ff ff 	mov    %rcx,-0x1e0(%rbp)
   26016:	3c 01                	cmp    $0x1,%al
   26018:	19 c0                	sbb    %eax,%eax
   2601a:	31 f6                	xor    %esi,%esi
   2601c:	83 e0 fc             	and    $0xfffffffc,%eax
   2601f:	48 89 b5 a0 fd ff ff 	mov    %rsi,-0x260(%rbp)
   26026:	48 89 b5 90 fd ff ff 	mov    %rsi,-0x270(%rbp)
   2602d:	05 05 45 00 00       	add    $0x4505,%eax
   26032:	83 e2 03             	and    $0x3,%edx
   26035:	0f 85 9a 5e 00 00    	jne    2bed5 <JS_CallInternal+0x6a45>
   2603b:	0d 02 22 00 00       	or     $0x2202,%eax
   26040:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26044:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   26048:	4c 89 ef             	mov    %r13,%rdi
   2604b:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   26051:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26055:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2605c:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   26062:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26069:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2606d:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   26072:	48 89 8d b8 fd ff ff 	mov    %rcx,-0x248(%rbp)
   26079:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   26080:	e8 7b e3 01 00       	call   44400 <js_get_function_name>
   26085:	49 89 c0             	mov    %rax,%r8
   26088:	49 89 d1             	mov    %rdx,%r9
   2608b:	41 83 f9 06          	cmp    $0x6,%r9d
   2608f:	0f 84 df 72 00 00    	je     2d374 <JS_CallInternal+0x7ee4>
   26095:	48 83 ec 08          	sub    $0x8,%rsp
   26099:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   260a0:	b9 3a 00 00 00       	mov    $0x3a,%ecx
   260a5:	4c 89 ef             	mov    %r13,%rdi
   260a8:	6a 01                	push   $0x1
   260aa:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   260b1:	e8 5a d3 00 00       	call   33410 <JS_DefinePropertyValue>
   260b6:	41 5a                	pop    %r10
   260b8:	41 5b                	pop    %r11
   260ba:	85 c0                	test   %eax,%eax
   260bc:	0f 88 b2 72 00 00    	js     2d374 <JS_CallInternal+0x7ee4>
   260c2:	48 8b 8d 20 fe ff ff 	mov    -0x1e0(%rbp),%rcx
   260c9:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   260d0:	4c 89 ef             	mov    %r13,%rdi
   260d3:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   260da:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   260e1:	e8 8a a3 ff ff       	call   20470 <js_method_set_home_object>
   260e6:	8b 85 b0 fd ff ff    	mov    -0x250(%rbp),%eax
   260ec:	48 83 ec 08          	sub    $0x8,%rsp
   260f0:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   260f6:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   260fd:	4c 8b 8d b8 fd ff ff 	mov    -0x248(%rbp),%r9
   26104:	4c 89 ef             	mov    %r13,%rdi
   26107:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   2610e:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   26115:	50                   	push   %rax
   26116:	ff b5 98 fd ff ff    	push   -0x268(%rbp)
   2611c:	ff b5 90 fd ff ff    	push   -0x270(%rbp)
   26122:	ff b5 a8 fd ff ff    	push   -0x258(%rbp)
   26128:	ff b5 a0 fd ff ff    	push   -0x260(%rbp)
   2612e:	e8 4d c4 00 00       	call   32580 <JS_DefineProperty>
   26133:	48 83 c4 30          	add    $0x30,%rsp
   26137:	89 c1                	mov    %eax,%ecx
   26139:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2613e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26141:	76 15                	jbe    26158 <JS_CallInternal+0xcc8>
   26143:	49 8b 34 24          	mov    (%r12),%rsi
   26147:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2614a:	83 ea 01             	sub    $0x1,%edx
   2614d:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26150:	85 d2                	test   %edx,%edx
   26152:	0f 8e 3e 71 00 00    	jle    2d296 <JS_CallInternal+0x7e06>
   26158:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   2615f:	0f 85 c6 5f 00 00    	jne    2c12b <JS_CallInternal+0x6c9b>
   26165:	8b 85 b4 fd ff ff    	mov    -0x24c(%rbp),%eax
   2616b:	83 c0 01             	add    $0x1,%eax
   2616e:	48 98                	cltq
   26170:	48 c1 e0 04          	shl    $0x4,%rax
   26174:	48 29 c3             	sub    %rax,%rbx
   26177:	85 c9                	test   %ecx,%ecx
   26179:	0f 88 1d 73 00 00    	js     2d49c <JS_CallInternal+0x800c>
   2617f:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   26184:	4d 8d 67 02          	lea    0x2(%r15),%r12
   26188:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2618c:	49 89 c2             	mov    %rax,%r10
   2618f:	e9 1c f6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26194:	f3 0f 1e fa          	endbr64
   26198:	f3 0f 1e fa          	endbr64
   2619c:	31 f6                	xor    %esi,%esi
   2619e:	ba 02 00 00 00       	mov    $0x2,%edx
   261a3:	41 80 7c 24 ff f9    	cmpb   $0xf9,-0x1(%r12)
   261a9:	b9 03 00 00 00       	mov    $0x3,%ecx
   261ae:	48 0f 44 d6          	cmove  %rsi,%rdx
   261b2:	be 01 00 00 00       	mov    $0x1,%esi
   261b7:	48 0f 44 ce          	cmove  %rsi,%rcx
   261bb:	4c 01 e2             	add    %r12,%rdx
   261be:	0f b6 3a             	movzbl (%rdx),%edi
   261c1:	4c 8d 14 0a          	lea    (%rdx,%rcx,1),%r10
   261c5:	45 8b 7a 01          	mov    0x1(%r10),%r15d
   261c9:	8d b7 3d ff ff ff    	lea    -0xc3(%rdi),%esi
   261cf:	83 fe 03             	cmp    $0x3,%esi
   261d2:	0f 86 40 5f 00 00    	jbe    2c118 <JS_CallInternal+0x6c88>
   261d8:	8d b7 31 ff ff ff    	lea    -0xcf(%rdi),%esi
   261de:	83 fe 03             	cmp    $0x3,%esi
   261e1:	0f 86 90 64 00 00    	jbe    2c677 <JS_CallInternal+0x71e7>
   261e7:	81 ff f6 00 00 00    	cmp    $0xf6,%edi
   261ed:	0f 84 aa 74 00 00    	je     2d69d <JS_CallInternal+0x820d>
   261f3:	81 ff f7 00 00 00    	cmp    $0xf7,%edi
   261f9:	0f 84 e0 74 00 00    	je     2d6df <JS_CallInternal+0x824f>
   261ff:	83 ff 55             	cmp    $0x55,%edi
   26202:	0f 84 c3 75 00 00    	je     2d7cb <JS_CallInternal+0x833b>
   26208:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   2620f:	83 ff 58             	cmp    $0x58,%edi
   26212:	0f 84 b3 75 00 00    	je     2d7cb <JS_CallInternal+0x833b>
   26218:	4c 8b 06             	mov    (%rsi),%r8
   2621b:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   2621f:	41 0f b6 72 05       	movzbl 0x5(%r10),%esi
   26224:	44 8d 4e 4e          	lea    0x4e(%rsi),%r9d
   26228:	41 80 f9 08          	cmp    $0x8,%r9b
   2622c:	0f 86 d5 5e 00 00    	jbe    2c107 <JS_CallInternal+0x6c77>
   26232:	40 80 fe bb          	cmp    $0xbb,%sil
   26236:	0f 84 e1 72 00 00    	je     2d51d <JS_CallInternal+0x808d>
   2623c:	40 80 fe bc          	cmp    $0xbc,%sil
   26240:	0f 84 a5 74 00 00    	je     2d6eb <JS_CallInternal+0x825b>
   26246:	45 31 db             	xor    %r11d,%r11d
   26249:	40 80 fe 01          	cmp    $0x1,%sil
   2624d:	0f 84 f6 76 00 00    	je     2d949 <JS_CallInternal+0x84b9>
   26253:	83 f8 01             	cmp    $0x1,%eax
   26256:	75 09                	jne    26261 <JS_CallInternal+0xdd1>
   26258:	83 ff ff             	cmp    $0xffffffff,%edi
   2625b:	0f 84 44 62 00 00    	je     2c4a5 <JS_CallInternal+0x7015>
   26261:	48 8d 43 10          	lea    0x10(%rbx),%rax
   26265:	83 ff f6             	cmp    $0xfffffff6,%edi
   26268:	76 05                	jbe    2626f <JS_CallInternal+0xddf>
   2626a:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   2626f:	4c 89 03             	mov    %r8,(%rbx)
   26272:	49 01 cc             	add    %rcx,%r12
   26275:	48 89 7b 08          	mov    %rdi,0x8(%rbx)
   26279:	0f b6 12             	movzbl (%rdx),%edx
   2627c:	48 89 c3             	mov    %rax,%rbx
   2627f:	49 8b 0c d6          	mov    (%r14,%rdx,8),%rcx
   26283:	49 89 d2             	mov    %rdx,%r10
   26286:	e9 25 f5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2628b:	f3 0f 1e fa          	endbr64
   2628f:	f3 0f 1e fa          	endbr64
   26293:	41 0f b7 04 24       	movzwl (%r12),%eax
   26298:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2629f:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   262a4:	48 8b 0c c1          	mov    (%rcx,%rax,8),%rcx
   262a8:	4c 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%r9
   262af:	00 
   262b0:	48 8b 41 18          	mov    0x18(%rcx),%rax
   262b4:	48 8b 50 08          	mov    0x8(%rax),%rdx
   262b8:	83 fa 04             	cmp    $0x4,%edx
   262bb:	0f 84 25 66 00 00    	je     2c8e6 <JS_CallInternal+0x7456>
   262c1:	80 79 12 00          	cmpb   $0x0,0x12(%rcx)
   262c5:	0f 85 1b 66 00 00    	jne    2c8e6 <JS_CallInternal+0x7456>
   262cb:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   262d0:	48 8b 08             	mov    (%rax),%rcx
   262d3:	0f 11 00             	movups %xmm0,(%rax)
   262d6:	83 fa f6             	cmp    $0xfffffff6,%edx
   262d9:	76 11                	jbe    262ec <JS_CallInternal+0xe5c>
   262db:	8b 41 fc             	mov    -0x4(%rcx),%eax
   262de:	83 e8 01             	sub    $0x1,%eax
   262e1:	89 41 fc             	mov    %eax,-0x4(%rcx)
   262e4:	85 c0                	test   %eax,%eax
   262e6:	0f 8e 77 70 00 00    	jle    2d363 <JS_CallInternal+0x7ed3>
   262ec:	48 83 eb 10          	sub    $0x10,%rbx
   262f0:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   262f6:	49 83 c4 03          	add    $0x3,%r12
   262fa:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   262fe:	49 89 c2             	mov    %rax,%r10
   26301:	e9 aa f4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26306:	f3 0f 1e fa          	endbr64
   2630a:	f3 0f 1e fa          	endbr64
   2630e:	41 0f b7 04 24       	movzwl (%r12),%eax
   26313:	48 8b 95 88 fe ff ff 	mov    -0x178(%rbp),%rdx
   2631a:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2631f:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   26326:	00 
   26327:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   2632b:	48 8b 40 18          	mov    0x18(%rax),%rax
   2632f:	48 8b 10             	mov    (%rax),%rdx
   26332:	48 8b 40 08          	mov    0x8(%rax),%rax
   26336:	83 f8 04             	cmp    $0x4,%eax
   26339:	0f 84 58 70 00 00    	je     2d397 <JS_CallInternal+0x7f07>
   2633f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26342:	76 04                	jbe    26348 <JS_CallInternal+0xeb8>
   26344:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26348:	48 89 13             	mov    %rdx,(%rbx)
   2634b:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2634f:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   26355:	48 83 c3 10          	add    $0x10,%rbx
   26359:	49 83 c4 03          	add    $0x3,%r12
   2635d:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26361:	49 89 c2             	mov    %rax,%r10
   26364:	e9 47 f4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26369:	f3 0f 1e fa          	endbr64
   2636d:	f3 0f 1e fa          	endbr64
   26371:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   26376:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2637b:	4c 89 ef             	mov    %r13,%rdi
   2637e:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   26385:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   2638c:	45 0f b7 d9          	movzwl %r9w,%r11d
   26390:	4c 89 7a 30          	mov    %r15,0x30(%rdx)
   26394:	49 c1 e3 04          	shl    $0x4,%r11
   26398:	44 89 8d 10 fe ff ff 	mov    %r9d,-0x1f0(%rbp)
   2639f:	4c 89 d8             	mov    %r11,%rax
   263a2:	49 89 db             	mov    %rbx,%r11
   263a5:	49 29 c3             	sub    %rax,%r11
   263a8:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   263af:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   263b3:	49 8b 4b e0          	mov    -0x20(%r11),%rcx
   263b7:	4d 8b 43 e8          	mov    -0x18(%r11),%r8
   263bb:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   263bf:	6a 00                	push   $0x0
   263c1:	41 53                	push   %r11
   263c3:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   263ca:	6a 03                	push   $0x3
   263cc:	6a 00                	push   $0x0
   263ce:	e8 bd f0 ff ff       	call   25490 <JS_CallInternal>
   263d3:	48 83 c4 20          	add    $0x20,%rsp
   263d7:	48 89 c6             	mov    %rax,%rsi
   263da:	48 89 d0             	mov    %rdx,%rax
   263dd:	83 fa 06             	cmp    $0x6,%edx
   263e0:	0f 84 ea f7 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   263e6:	48 89 f1             	mov    %rsi,%rcx
   263e9:	83 bd f0 fd ff ff 25 	cmpl   $0x25,-0x210(%rbp)
   263f0:	0f 84 9c f8 ff ff    	je     25c92 <JS_CallInternal+0x802>
   263f6:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   263fd:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   26404:	4c 89 a5 00 fe ff ff 	mov    %r12,-0x200(%rbp)
   2640b:	48 89 9d 30 fe ff ff 	mov    %rbx,-0x1d0(%rbp)
   26412:	48 89 b5 f0 fd ff ff 	mov    %rsi,-0x210(%rbp)
   26419:	4d 8d 7b e0          	lea    -0x20(%r11),%r15
   2641d:	4e 8d 24 19          	lea    (%rcx,%r11,1),%r12
   26421:	eb 2a                	jmp    2644d <JS_CallInternal+0xfbd>
   26423:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2642a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   26431:	00 00 00 00 
   26435:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2643c:	00 00 00 00 
   26440:	49 83 c7 10          	add    $0x10,%r15
   26444:	4d 39 e7             	cmp    %r12,%r15
   26447:	0f 84 dc 59 00 00    	je     2be29 <JS_CallInternal+0x6999>
   2644d:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   26451:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   26454:	76 ea                	jbe    26440 <JS_CallInternal+0xfb0>
   26456:	49 8b 37             	mov    (%r15),%rsi
   26459:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2645c:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2645f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26462:	85 d2                	test   %edx,%edx
   26464:	7f da                	jg     26440 <JS_CallInternal+0xfb0>
   26466:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2646a:	48 89 ca             	mov    %rcx,%rdx
   2646d:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   26474:	e8 47 85 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   26479:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   26480:	eb be                	jmp    26440 <JS_CallInternal+0xfb0>
   26482:	f3 0f 1e fa          	endbr64
   26486:	f3 0f 1e fa          	endbr64
   2648a:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   2648f:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26494:	e9 e5 f3 ff ff       	jmp    2587e <JS_CallInternal+0x3ee>
   26499:	f3 0f 1e fa          	endbr64
   2649d:	41 8b 04 24          	mov    (%r12),%eax
   264a1:	4c 8b 5b f0          	mov    -0x10(%rbx),%r11
   264a5:	49 89 d7             	mov    %rdx,%r15
   264a8:	4d 8d 14 04          	lea    (%r12,%rax,1),%r10
   264ac:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   264b0:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   264b7:	83 f8 ff             	cmp    $0xffffffff,%eax
   264ba:	0f 85 dd 9d 00 00    	jne    3029d <JS_CallInternal+0xae0d>
   264c0:	41 0f b7 43 12       	movzwl 0x12(%r11),%eax
   264c5:	49 8b 4b 18          	mov    0x18(%r11),%rcx
   264c9:	66 89 85 00 fe ff ff 	mov    %ax,-0x200(%rbp)
   264d0:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   264d7:	66 83 f8 01          	cmp    $0x1,%ax
   264db:	0f 84 e3 5e 00 00    	je     2c3c4 <JS_CallInternal+0x6f34>
   264e1:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   264e5:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   264ec:	4c 89 d8             	mov    %r11,%rax
   264ef:	90                   	nop
   264f0:	41 8b 78 18          	mov    0x18(%r8),%edi
   264f4:	89 fe                	mov    %edi,%esi
   264f6:	21 ce                	and    %ecx,%esi
   264f8:	41 8b 74 b0 38       	mov    0x38(%r8,%rsi,4),%esi
   264fd:	48 85 f6             	test   %rsi,%rsi
   26500:	0f 84 d0 56 00 00    	je     2bbd6 <JS_CallInternal+0x6746>
   26506:	4c 8d 0c bd 3c 00 00 	lea    0x3c(,%rdi,4),%r9
   2650d:	00 
   2650e:	48 83 ee 01          	sub    $0x1,%rsi
   26512:	49 8d 3c f1          	lea    (%r9,%rsi,8),%rdi
   26516:	4c 01 c7             	add    %r8,%rdi
   26519:	39 4f 04             	cmp    %ecx,0x4(%rdi)
   2651c:	0f 85 a6 56 00 00    	jne    2bbc8 <JS_CallInternal+0x6738>
   26522:	4c 8b 48 20          	mov    0x20(%rax),%r9
   26526:	80 7f 03 3f          	cmpb   $0x3f,0x3(%rdi)
   2652a:	0f 87 9d 59 00 00    	ja     2becd <JS_CallInternal+0x6a3d>
   26530:	48 c1 e6 04          	shl    $0x4,%rsi
   26534:	49 01 f1             	add    %rsi,%r9
   26537:	49 8b 51 08          	mov    0x8(%r9),%rdx
   2653b:	49 8b 09             	mov    (%r9),%rcx
   2653e:	83 fa f6             	cmp    $0xfffffff6,%edx
   26541:	76 04                	jbe    26547 <JS_CallInternal+0x10b7>
   26543:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   26547:	49 89 cf             	mov    %rcx,%r15
   2654a:	4c 39 d8             	cmp    %r11,%rax
   2654d:	0f 84 0b 82 00 00    	je     2e75e <JS_CallInternal+0x92ce>
   26553:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2655a:	48 39 41 30          	cmp    %rax,0x30(%rcx)
   2655e:	0f 84 5d 8b 00 00    	je     2f0c1 <JS_CallInternal+0x9c31>
   26564:	4c 89 3b             	mov    %r15,(%rbx)
   26567:	49 83 c4 05          	add    $0x5,%r12
   2656b:	48 83 c3 10          	add    $0x10,%rbx
   2656f:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   26573:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26579:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2657d:	49 89 c2             	mov    %rax,%r10
   26580:	e9 2b f2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26585:	f3 0f 1e fa          	endbr64
   26589:	41 8b 04 24          	mov    (%r12),%eax
   2658d:	4c 8b 5b f8          	mov    -0x8(%rbx),%r11
   26591:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   26596:	4d 8d 14 04          	lea    (%r12,%rax,1),%r10
   2659a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2659e:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   265a2:	0f 85 13 7d 00 00    	jne    2e2bb <JS_CallInternal+0x8e2b>
   265a8:	48 8b 78 18          	mov    0x18(%rax),%rdi
   265ac:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   265b1:	0f 84 3f 6a 00 00    	je     2cff6 <JS_CallInternal+0x7b66>
   265b7:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   265bb:	49 89 c0             	mov    %rax,%r8
   265be:	66 90                	xchg   %ax,%ax
   265c0:	8b 77 18             	mov    0x18(%rdi),%esi
   265c3:	89 f2                	mov    %esi,%edx
   265c5:	21 ca                	and    %ecx,%edx
   265c7:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   265cb:	48 85 d2             	test   %rdx,%rdx
   265ce:	0f 84 c6 56 00 00    	je     2bc9a <JS_CallInternal+0x680a>
   265d4:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   265db:	00 
   265dc:	48 83 ea 01          	sub    $0x1,%rdx
   265e0:	49 8d 34 d1          	lea    (%r9,%rdx,8),%rsi
   265e4:	48 01 fe             	add    %rdi,%rsi
   265e7:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   265ea:	0f 85 9c 56 00 00    	jne    2bc8c <JS_CallInternal+0x67fc>
   265f0:	4d 8b 48 20          	mov    0x20(%r8),%r9
   265f4:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   265f8:	0f 87 d1 5c 00 00    	ja     2c2cf <JS_CallInternal+0x6e3f>
   265fe:	48 c1 e2 04          	shl    $0x4,%rdx
   26602:	49 01 d1             	add    %rdx,%r9
   26605:	49 8b 49 08          	mov    0x8(%r9),%rcx
   26609:	49 8b 31             	mov    (%r9),%rsi
   2660c:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2660f:	76 04                	jbe    26615 <JS_CallInternal+0x1185>
   26611:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   26615:	49 89 f7             	mov    %rsi,%r15
   26618:	4c 39 c0             	cmp    %r8,%rax
   2661b:	0f 84 2c 8f 00 00    	je     2f54d <JS_CallInternal+0xa0bd>
   26621:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26625:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26628:	76 15                	jbe    2663f <JS_CallInternal+0x11af>
   2662a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2662e:	8b 56 fc             	mov    -0x4(%rsi),%edx
   26631:	83 ea 01             	sub    $0x1,%edx
   26634:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26637:	85 d2                	test   %edx,%edx
   26639:	0f 8e 6b 76 00 00    	jle    2dcaa <JS_CallInternal+0x881a>
   2663f:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   26643:	49 83 c4 05          	add    $0x5,%r12
   26647:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2664b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26651:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26655:	49 89 c2             	mov    %rax,%r10
   26658:	e9 53 f1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2665d:	f3 0f 1e fa          	endbr64
   26661:	41 8b 04 24          	mov    (%r12),%eax
   26665:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   26669:	49 8d 54 24 04       	lea    0x4(%r12),%rdx
   2666e:	49 89 d7             	mov    %rdx,%r15
   26671:	4d 8d 14 04          	lea    (%r12,%rax,1),%r10
   26675:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2667c:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26680:	41 80 7c 24 04 8d    	cmpb   $0x8d,0x4(%r12)
   26686:	74 2e                	je     266b6 <JS_CallInternal+0x1226>
   26688:	41 0f b6 4c 24 04    	movzbl 0x4(%r12),%ecx
   2668e:	8d 71 4e             	lea    0x4e(%rcx),%esi
   26691:	40 80 fe 08          	cmp    $0x8,%sil
   26695:	0f 86 27 70 00 00    	jbe    2d6c2 <JS_CallInternal+0x8232>
   2669b:	80 f9 bb             	cmp    $0xbb,%cl
   2669e:	0f 84 14 8e 00 00    	je     2f4b8 <JS_CallInternal+0xa028>
   266a4:	80 f9 bc             	cmp    $0xbc,%cl
   266a7:	0f 84 cd 96 00 00    	je     2fd7a <JS_CallInternal+0xa8ea>
   266ad:	80 f9 01             	cmp    $0x1,%cl
   266b0:	0f 84 8a 95 00 00    	je     2fc40 <JS_CallInternal+0xa7b0>
   266b6:	49 8d 4c 24 05       	lea    0x5(%r12),%rcx
   266bb:	83 bd 30 fe ff ff ff 	cmpl   $0xffffffff,-0x1d0(%rbp)
   266c2:	0f 84 eb 6b 00 00    	je     2d2b3 <JS_CallInternal+0x7e23>
   266c8:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   266cc:	48 83 ec 08          	sub    $0x8,%rsp
   266d0:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   266d4:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   266d8:	4c 89 ef             	mov    %r13,%rdi
   266db:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   266e2:	48 89 56 30          	mov    %rdx,0x30(%rsi)
   266e6:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   266ed:	48 89 c6             	mov    %rax,%rsi
   266f0:	6a 00                	push   $0x0
   266f2:	e8 a9 9c 00 00       	call   303a0 <JS_GetPropertyInternal>
   266f7:	41 58                	pop    %r8
   266f9:	41 59                	pop    %r9
   266fb:	83 fa 06             	cmp    $0x6,%edx
   266fe:	0f 84 cc f4 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   26704:	49 89 c7             	mov    %rax,%r15
   26707:	e9 58 fe ff ff       	jmp    26564 <JS_CallInternal+0x10d4>
   2670c:	f3 0f 1e fa          	endbr64
   26710:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26714:	41 8b 0c 24          	mov    (%r12),%ecx
   26718:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2671d:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   26721:	83 f8 ff             	cmp    $0xffffffff,%eax
   26724:	0f 85 aa 5a 00 00    	jne    2c1d4 <JS_CallInternal+0x6d44>
   2672a:	4d 89 c8             	mov    %r9,%r8
   2672d:	0f 1f 00             	nopl   (%rax)
   26730:	49 8b 78 18          	mov    0x18(%r8),%rdi
   26734:	8b 77 18             	mov    0x18(%rdi),%esi
   26737:	89 f2                	mov    %esi,%edx
   26739:	21 ca                	and    %ecx,%edx
   2673b:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2673f:	48 85 d2             	test   %rdx,%rdx
   26742:	0f 84 1f 55 00 00    	je     2bc67 <JS_CallInternal+0x67d7>
   26748:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   2674f:	00 
   26750:	48 83 ea 01          	sub    $0x1,%rdx
   26754:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   26758:	48 01 fe             	add    %rdi,%rsi
   2675b:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2675e:	0f 85 f5 54 00 00    	jne    2bc59 <JS_CallInternal+0x67c9>
   26764:	49 8b 78 20          	mov    0x20(%r8),%rdi
   26768:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2676c:	0f 87 62 5a 00 00    	ja     2c1d4 <JS_CallInternal+0x6d44>
   26772:	48 c1 e2 04          	shl    $0x4,%rdx
   26776:	48 01 d7             	add    %rdx,%rdi
   26779:	48 8b 47 08          	mov    0x8(%rdi),%rax
   2677d:	4c 8b 3f             	mov    (%rdi),%r15
   26780:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26783:	76 05                	jbe    2678a <JS_CallInternal+0x12fa>
   26785:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2678a:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2678e:	83 fe f6             	cmp    $0xfffffff6,%esi
   26791:	76 15                	jbe    267a8 <JS_CallInternal+0x1318>
   26793:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26797:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2679a:	83 ea 01             	sub    $0x1,%edx
   2679d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   267a0:	85 d2                	test   %edx,%edx
   267a2:	0f 8e 73 76 00 00    	jle    2de1b <JS_CallInternal+0x898b>
   267a8:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   267ac:	49 83 c4 05          	add    $0x5,%r12
   267b0:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   267b4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   267ba:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   267be:	49 89 c2             	mov    %rax,%r10
   267c1:	e9 ea ef ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   267c6:	f3 0f 1e fa          	endbr64
   267ca:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   267cf:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   267d3:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   267d7:	4c 89 ef             	mov    %r13,%rdi
   267da:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   267e1:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   267e6:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   267ea:	b9 02 00 00 00       	mov    $0x2,%ecx
   267ef:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   267f6:	4c 89 78 30          	mov    %r15,0x30(%rax)
   267fa:	e8 01 5d 08 00       	call   ac500 <js_function_apply>
   267ff:	48 89 d1             	mov    %rdx,%rcx
   26802:	83 fa 06             	cmp    $0x6,%edx
   26805:	0f 84 c5 f3 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2680b:	48 8b 73 d8          	mov    -0x28(%rbx),%rsi
   2680f:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   26816:	83 fe f6             	cmp    $0xfffffff6,%esi
   26819:	76 15                	jbe    26830 <JS_CallInternal+0x13a0>
   2681b:	48 8b 7b d0          	mov    -0x30(%rbx),%rdi
   2681f:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26822:	83 ea 01             	sub    $0x1,%edx
   26825:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26828:	85 d2                	test   %edx,%edx
   2682a:	0f 8e 99 74 00 00    	jle    2dcc9 <JS_CallInternal+0x8839>
   26830:	49 8b 70 08          	mov    0x8(%r8),%rsi
   26834:	83 fe f6             	cmp    $0xfffffff6,%esi
   26837:	76 14                	jbe    2684d <JS_CallInternal+0x13bd>
   26839:	49 8b 38             	mov    (%r8),%rdi
   2683c:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2683f:	83 ea 01             	sub    $0x1,%edx
   26842:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26845:	85 d2                	test   %edx,%edx
   26847:	0f 8e b3 74 00 00    	jle    2dd00 <JS_CallInternal+0x8870>
   2684d:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   26851:	83 fe f6             	cmp    $0xfffffff6,%esi
   26854:	76 15                	jbe    2686b <JS_CallInternal+0x13db>
   26856:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2685a:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2685d:	83 ea 01             	sub    $0x1,%edx
   26860:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26863:	85 d2                	test   %edx,%edx
   26865:	0f 8e 00 6f 00 00    	jle    2d76b <JS_CallInternal+0x82db>
   2686b:	48 89 4b d8          	mov    %rcx,-0x28(%rbx)
   2686f:	49 83 c4 03          	add    $0x3,%r12
   26873:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   26877:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2687d:	4c 89 c3             	mov    %r8,%rbx
   26880:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26884:	49 89 c2             	mov    %rax,%r10
   26887:	e9 24 ef ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2688c:	f3 0f 1e fa          	endbr64
   26890:	49 8b 75 30          	mov    0x30(%r13),%rsi
   26894:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   26899:	ba 02 00 00 00       	mov    $0x2,%edx
   2689e:	4c 89 ef             	mov    %r13,%rdi
   268a1:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   268a6:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   268aa:	49 89 c9             	mov    %rcx,%r9
   268ad:	49 c1 e1 04          	shl    $0x4,%r9
   268b1:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   268b7:	4c 29 cb             	sub    %r9,%rbx
   268ba:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   268c1:	31 c9                	xor    %ecx,%ecx
   268c3:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   268ca:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   268d1:	e8 6a 3e 02 00       	call   4a740 <JS_NewObjectFromShape>
   268d6:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   268dd:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   268e4:	83 fa 06             	cmp    $0x6,%edx
   268e7:	48 89 c1             	mov    %rax,%rcx
   268ea:	49 89 d2             	mov    %rdx,%r10
   268ed:	0f 84 80 71 00 00    	je     2da73 <JS_CallInternal+0x85e3>
   268f3:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   268f9:	85 d2                	test   %edx,%edx
   268fb:	0f 85 1f 60 00 00    	jne    2c920 <JS_CallInternal+0x7490>
   26901:	49 89 08             	mov    %rcx,(%r8)
   26904:	49 8d 58 10          	lea    0x10(%r8),%rbx
   26908:	49 83 c4 03          	add    $0x3,%r12
   2690c:	4d 89 50 08          	mov    %r10,0x8(%r8)
   26910:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26916:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2691a:	49 89 c2             	mov    %rax,%r10
   2691d:	e9 8e ee ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26922:	f3 0f 1e fa          	endbr64
   26926:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2692a:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2692e:	83 f9 ff             	cmp    $0xffffffff,%ecx
   26931:	0f 85 4d 58 00 00    	jne    2c184 <JS_CallInternal+0x6cf4>
   26937:	48 89 fe             	mov    %rdi,%rsi
   2693a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   26940:	4c 8b 46 18          	mov    0x18(%rsi),%r8
   26944:	41 8b 50 18          	mov    0x18(%r8),%edx
   26948:	89 d0                	mov    %edx,%eax
   2694a:	83 e0 32             	and    $0x32,%eax
   2694d:	41 8b 44 80 38       	mov    0x38(%r8,%rax,4),%eax
   26952:	48 85 c0             	test   %rax,%rax
   26955:	0f 84 a8 52 00 00    	je     2bc03 <JS_CallInternal+0x6773>
   2695b:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   26962:	00 
   26963:	48 83 e8 01          	sub    $0x1,%rax
   26967:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2696b:	4c 01 c2             	add    %r8,%rdx
   2696e:	83 7a 04 32          	cmpl   $0x32,0x4(%rdx)
   26972:	0f 85 7e 52 00 00    	jne    2bbf6 <JS_CallInternal+0x6766>
   26978:	48 8b 76 20          	mov    0x20(%rsi),%rsi
   2697c:	80 7a 03 3f          	cmpb   $0x3f,0x3(%rdx)
   26980:	0f 87 fe 57 00 00    	ja     2c184 <JS_CallInternal+0x6cf4>
   26986:	48 c1 e0 04          	shl    $0x4,%rax
   2698a:	48 01 c6             	add    %rax,%rsi
   2698d:	48 8b 46 08          	mov    0x8(%rsi),%rax
   26991:	4c 8b 3e             	mov    (%rsi),%r15
   26994:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26997:	76 05                	jbe    2699e <JS_CallInternal+0x150e>
   26999:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2699e:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   269a2:	83 fe f6             	cmp    $0xfffffff6,%esi
   269a5:	76 15                	jbe    269bc <JS_CallInternal+0x152c>
   269a7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   269ab:	8b 51 fc             	mov    -0x4(%rcx),%edx
   269ae:	83 ea 01             	sub    $0x1,%edx
   269b1:	89 51 fc             	mov    %edx,-0x4(%rcx)
   269b4:	85 d2                	test   %edx,%edx
   269b6:	0f 8e 81 74 00 00    	jle    2de3d <JS_CallInternal+0x89ad>
   269bc:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   269c0:	49 83 c4 01          	add    $0x1,%r12
   269c4:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   269c8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   269ce:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   269d2:	49 89 c2             	mov    %rax,%r10
   269d5:	e9 d6 ed ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   269da:	f3 0f 1e fa          	endbr64
   269de:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   269e2:	41 8b 0c 24          	mov    (%r12),%ecx
   269e6:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   269eb:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   269ef:	83 f8 ff             	cmp    $0xffffffff,%eax
   269f2:	0f 85 2a 58 00 00    	jne    2c222 <JS_CallInternal+0x6d92>
   269f8:	4d 89 c8             	mov    %r9,%r8
   269fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   26a00:	49 8b 78 18          	mov    0x18(%r8),%rdi
   26a04:	8b 77 18             	mov    0x18(%rdi),%esi
   26a07:	89 f2                	mov    %esi,%edx
   26a09:	21 ca                	and    %ecx,%edx
   26a0b:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   26a0f:	48 85 d2             	test   %rdx,%rdx
   26a12:	0f 84 1d 52 00 00    	je     2bc35 <JS_CallInternal+0x67a5>
   26a18:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   26a1f:	00 
   26a20:	48 83 ea 01          	sub    $0x1,%rdx
   26a24:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   26a28:	48 01 fe             	add    %rdi,%rsi
   26a2b:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   26a2e:	0f 85 f3 51 00 00    	jne    2bc27 <JS_CallInternal+0x6797>
   26a34:	49 8b 78 20          	mov    0x20(%r8),%rdi
   26a38:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   26a3c:	0f 87 e0 57 00 00    	ja     2c222 <JS_CallInternal+0x6d92>
   26a42:	48 c1 e2 04          	shl    $0x4,%rdx
   26a46:	48 01 d7             	add    %rdx,%rdi
   26a49:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   26a4d:	48 8b 07             	mov    (%rdi),%rax
   26a50:	83 fa f6             	cmp    $0xfffffff6,%edx
   26a53:	76 04                	jbe    26a59 <JS_CallInternal+0x15c9>
   26a55:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   26a59:	48 89 03             	mov    %rax,(%rbx)
   26a5c:	49 83 c4 05          	add    $0x5,%r12
   26a60:	48 83 c3 10          	add    $0x10,%rbx
   26a64:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   26a68:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26a6e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26a72:	49 89 c2             	mov    %rax,%r10
   26a75:	e9 36 ed ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26a7a:	f3 0f 1e fa          	endbr64
   26a7e:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   26a83:	49 89 da             	mov    %rbx,%r10
   26a86:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26a8b:	4c 89 ef             	mov    %r13,%rdi
   26a8e:	4c 89 c8             	mov    %r9,%rax
   26a91:	44 89 8d 30 fe ff ff 	mov    %r9d,-0x1d0(%rbp)
   26a98:	48 c1 e0 04          	shl    $0x4,%rax
   26a9c:	49 29 c2             	sub    %rax,%r10
   26a9f:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26aa6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26aad:	49 8b 4a f0          	mov    -0x10(%r10),%rcx
   26ab1:	4d 8b 42 f8          	mov    -0x8(%r10),%r8
   26ab5:	49 8b 72 e0          	mov    -0x20(%r10),%rsi
   26ab9:	49 8b 52 e8          	mov    -0x18(%r10),%rdx
   26abd:	4c 89 78 30          	mov    %r15,0x30(%rax)
   26ac1:	6a 00                	push   $0x0
   26ac3:	41 52                	push   %r10
   26ac5:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   26acc:	e8 8f 45 07 00       	call   9b060 <JS_CallConstructorInternal>
   26ad1:	41 5b                	pop    %r11
   26ad3:	59                   	pop    %rcx
   26ad4:	83 fa 06             	cmp    $0x6,%edx
   26ad7:	0f 84 f3 f0 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   26add:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   26ae4:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   26aeb:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   26af2:	4d 8d 7a e0          	lea    -0x20(%r10),%r15
   26af6:	4c 03 95 00 fe ff ff 	add    -0x200(%rbp),%r10
   26afd:	4c 89 a5 00 fe ff ff 	mov    %r12,-0x200(%rbp)
   26b04:	4d 89 d4             	mov    %r10,%r12
   26b07:	eb 24                	jmp    26b2d <JS_CallInternal+0x169d>
   26b09:	90                   	nop
   26b0a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   26b11:	00 00 00 00 
   26b15:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   26b1c:	00 00 00 00 
   26b20:	49 83 c7 10          	add    $0x10,%r15
   26b24:	4d 39 e7             	cmp    %r12,%r15
   26b27:	0f 84 b8 54 00 00    	je     2bfe5 <JS_CallInternal+0x6b55>
   26b2d:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   26b31:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   26b34:	76 ea                	jbe    26b20 <JS_CallInternal+0x1690>
   26b36:	49 8b 37             	mov    (%r15),%rsi
   26b39:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   26b3c:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26b3f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26b42:	85 d2                	test   %edx,%edx
   26b44:	7f da                	jg     26b20 <JS_CallInternal+0x1690>
   26b46:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   26b4a:	48 89 ca             	mov    %rcx,%rdx
   26b4d:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   26b54:	e8 67 7e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   26b59:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   26b60:	eb be                	jmp    26b20 <JS_CallInternal+0x1690>
   26b62:	f3 0f 1e fa          	endbr64
   26b66:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26b6a:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26b6e:	4c 89 ef             	mov    %r13,%rdi
   26b71:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26b75:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26b7c:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26b80:	4d 8b 47 08          	mov    0x8(%r15),%r8
   26b84:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26b88:	e8 93 d3 08 00       	call   b3f20 <js_dynamic_import>
   26b8d:	48 89 c1             	mov    %rax,%rcx
   26b90:	48 89 d0             	mov    %rdx,%rax
   26b93:	83 fa 06             	cmp    $0x6,%edx
   26b96:	0f 84 ba 7b 00 00    	je     2e756 <JS_CallInternal+0x92c6>
   26b9c:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   26ba0:	83 fe f6             	cmp    $0xfffffff6,%esi
   26ba3:	76 15                	jbe    26bba <JS_CallInternal+0x172a>
   26ba5:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26ba9:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   26bac:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26baf:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26bb2:	85 d2                	test   %edx,%edx
   26bb4:	0f 8e 2e 6f 00 00    	jle    2dae8 <JS_CallInternal+0x8658>
   26bba:	49 8b 77 08          	mov    0x8(%r15),%rsi
   26bbe:	83 fe f6             	cmp    $0xfffffff6,%esi
   26bc1:	76 14                	jbe    26bd7 <JS_CallInternal+0x1747>
   26bc3:	49 8b 3f             	mov    (%r15),%rdi
   26bc6:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   26bc9:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26bcc:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26bcf:	85 d2                	test   %edx,%edx
   26bd1:	0f 8e 6c 6e 00 00    	jle    2da43 <JS_CallInternal+0x85b3>
   26bd7:	49 89 4f f0          	mov    %rcx,-0x10(%r15)
   26bdb:	4c 89 fb             	mov    %r15,%rbx
   26bde:	49 83 c4 01          	add    $0x1,%r12
   26be2:	49 89 47 f8          	mov    %rax,-0x8(%r15)
   26be6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26bec:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26bf0:	49 89 c2             	mov    %rax,%r10
   26bf3:	e9 b8 eb ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26bf8:	f3 0f 1e fa          	endbr64
   26bfc:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26c03:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26c07:	4c 89 ef             	mov    %r13,%rdi
   26c0a:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26c0e:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26c12:	e8 89 e0 ff ff       	call   24ca0 <JS_GetPrototype>
   26c17:	48 89 c1             	mov    %rax,%rcx
   26c1a:	49 89 d7             	mov    %rdx,%r15
   26c1d:	83 fa 06             	cmp    $0x6,%edx
   26c20:	0f 84 12 7c 00 00    	je     2e838 <JS_CallInternal+0x93a8>
   26c26:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26c2a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26c2d:	76 15                	jbe    26c44 <JS_CallInternal+0x17b4>
   26c2f:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26c33:	8b 56 fc             	mov    -0x4(%rsi),%edx
   26c36:	83 ea 01             	sub    $0x1,%edx
   26c39:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26c3c:	85 d2                	test   %edx,%edx
   26c3e:	0f 8e 85 6e 00 00    	jle    2dac9 <JS_CallInternal+0x8639>
   26c44:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   26c48:	49 83 c4 01          	add    $0x1,%r12
   26c4c:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   26c50:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26c56:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26c5a:	49 89 c2             	mov    %rax,%r10
   26c5d:	e9 4e eb ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26c62:	f3 0f 1e fa          	endbr64
   26c66:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26c6a:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26c6e:	4c 89 ef             	mov    %r13,%rdi
   26c71:	48 83 eb 10          	sub    $0x10,%rbx
   26c75:	4d 89 e7             	mov    %r12,%r15
   26c78:	e8 33 df ff ff       	call   24bb0 <JS_Throw>
   26c7d:	e9 4e ef ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   26c82:	f3 0f 1e fa          	endbr64
   26c86:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26c8a:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26c8e:	4c 8d 4b f0          	lea    -0x10(%rbx),%r9
   26c92:	4c 89 ef             	mov    %r13,%rdi
   26c95:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26c99:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26c9d:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   26ca4:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   26ca8:	e8 03 65 02 00       	call   4d1b0 <JS_AddBrand>
   26cad:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   26cb4:	83 f8 ff             	cmp    $0xffffffff,%eax
   26cb7:	0f 84 1e 90 00 00    	je     2fcdb <JS_CallInternal+0xa84b>
   26cbd:	49 8b 47 08          	mov    0x8(%r15),%rax
   26cc1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26cc4:	76 15                	jbe    26cdb <JS_CallInternal+0x184b>
   26cc6:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   26cca:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   26ccd:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26cd0:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26cd3:	85 d2                	test   %edx,%edx
   26cd5:	0f 8e 09 6f 00 00    	jle    2dbe4 <JS_CallInternal+0x8754>
   26cdb:	49 8b 41 08          	mov    0x8(%r9),%rax
   26cdf:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26ce2:	76 14                	jbe    26cf8 <JS_CallInternal+0x1868>
   26ce4:	49 8b 09             	mov    (%r9),%rcx
   26ce7:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   26cea:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26ced:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26cf0:	85 d2                	test   %edx,%edx
   26cf2:	0f 8e d8 6e 00 00    	jle    2dbd0 <JS_CallInternal+0x8740>
   26cf8:	41 0f b6 04 24       	movzbl (%r12),%eax
   26cfd:	4c 89 fb             	mov    %r15,%rbx
   26d00:	49 83 c4 01          	add    $0x1,%r12
   26d04:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26d08:	49 89 c2             	mov    %rax,%r10
   26d0b:	e9 a0 ea ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26d10:	f3 0f 1e fa          	endbr64
   26d14:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26d18:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26d1c:	4c 89 ef             	mov    %r13,%rdi
   26d1f:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26d23:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26d27:	e8 c4 d9 00 00       	call   346f0 <JS_CheckBrand>
   26d2c:	83 f8 ff             	cmp    $0xffffffff,%eax
   26d2f:	0f 84 91 89 00 00    	je     2f6c6 <JS_CallInternal+0xa236>
   26d35:	85 c0                	test   %eax,%eax
   26d37:	0f 84 72 89 00 00    	je     2f6af <JS_CallInternal+0xa21f>
   26d3d:	41 0f b6 04 24       	movzbl (%r12),%eax
   26d42:	49 83 c4 01          	add    $0x1,%r12
   26d46:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26d4a:	49 89 c2             	mov    %rax,%r10
   26d4d:	e9 5e ea ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26d52:	f3 0f 1e fa          	endbr64
   26d56:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26d5d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26d61:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   26d68:	0f 84 86 87 00 00    	je     2f4f4 <JS_CallInternal+0xa064>
   26d6e:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   26d75:	48 8b 95 68 fe ff ff 	mov    -0x198(%rbp),%rdx
   26d7c:	4c 89 ef             	mov    %r13,%rdi
   26d7f:	48 89 c6             	mov    %rax,%rsi
   26d82:	48 89 85 60 fe ff ff 	mov    %rax,-0x1a0(%rbp)
   26d89:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   26d90:	e8 0b df ff ff       	call   24ca0 <JS_GetPrototype>
   26d95:	48 89 c6             	mov    %rax,%rsi
   26d98:	49 89 d7             	mov    %rdx,%r15
   26d9b:	83 fa 06             	cmp    $0x6,%edx
   26d9e:	0f 84 0d 77 00 00    	je     2e4b1 <JS_CallInternal+0x9021>
   26da4:	48 8b 95 78 fe ff ff 	mov    -0x188(%rbp),%rdx
   26dab:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   26db2:	6a 02                	push   $0x2
   26db4:	4c 89 ef             	mov    %r13,%rdi
   26db7:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   26dbd:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   26dc4:	49 89 d0             	mov    %rdx,%r8
   26dc7:	48 89 c1             	mov    %rax,%rcx
   26dca:	4c 89 fa             	mov    %r15,%rdx
   26dcd:	48 89 b5 30 fe ff ff 	mov    %rsi,-0x1d0(%rbp)
   26dd4:	e8 87 42 07 00       	call   9b060 <JS_CallConstructorInternal>
   26dd9:	5e                   	pop    %rsi
   26dda:	5f                   	pop    %rdi
   26ddb:	49 89 c0             	mov    %rax,%r8
   26dde:	48 89 d1             	mov    %rdx,%rcx
   26de1:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   26de5:	76 18                	jbe    26dff <JS_CallInternal+0x196f>
   26de7:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   26dee:	8b 46 fc             	mov    -0x4(%rsi),%eax
   26df1:	83 e8 01             	sub    $0x1,%eax
   26df4:	89 46 fc             	mov    %eax,-0x4(%rsi)
   26df7:	85 c0                	test   %eax,%eax
   26df9:	0f 8e 84 77 00 00    	jle    2e583 <JS_CallInternal+0x90f3>
   26dff:	4d 89 e7             	mov    %r12,%r15
   26e02:	83 f9 06             	cmp    $0x6,%ecx
   26e05:	0f 84 c5 ed ff ff    	je     25bd0 <JS_CallInternal+0x740>
   26e0b:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   26e0f:	49 83 c4 01          	add    $0x1,%r12
   26e13:	48 83 c3 10          	add    $0x10,%rbx
   26e17:	4c 89 43 f0          	mov    %r8,-0x10(%rbx)
   26e1b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26e21:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26e25:	49 89 c2             	mov    %rax,%r10
   26e28:	e9 83 e9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26e2d:	f3 0f 1e fa          	endbr64
   26e31:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   26e38:	0f 84 b6 86 00 00    	je     2f4f4 <JS_CallInternal+0xa064>
   26e3e:	41 0f b6 04 24       	movzbl (%r12),%eax
   26e43:	49 83 c4 01          	add    $0x1,%r12
   26e47:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26e4b:	49 89 c2             	mov    %rax,%r10
   26e4e:	e9 5d e9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26e53:	f3 0f 1e fa          	endbr64
   26e57:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26e5b:	83 f8 ff             	cmp    $0xffffffff,%eax
   26e5e:	0f 84 3e 5f 00 00    	je     2cda2 <JS_CallInternal+0x7912>
   26e64:	83 f8 03             	cmp    $0x3,%eax
   26e67:	0f 85 02 90 00 00    	jne    2fe6f <JS_CallInternal+0xa9df>
   26e6d:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   26e74:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   26e7b:	00 
   26e7c:	41 0f b6 04 24       	movzbl (%r12),%eax
   26e81:	48 83 c3 10          	add    $0x10,%rbx
   26e85:	49 83 c4 01          	add    $0x1,%r12
   26e89:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26e8d:	49 89 c2             	mov    %rax,%r10
   26e90:	e9 1b e9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26e95:	f3 0f 1e fa          	endbr64
   26e99:	b8 03 00 00 00       	mov    $0x3,%eax
   26e9e:	31 c9                	xor    %ecx,%ecx
   26ea0:	e9 ed ed ff ff       	jmp    25c92 <JS_CallInternal+0x802>
   26ea5:	f3 0f 1e fa          	endbr64
   26ea9:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   26ead:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   26eb1:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   26eb5:	48 8b 5b f0          	mov    -0x10(%rbx),%rbx
   26eb9:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   26ec0:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   26ec7:	49 8b 47 08          	mov    0x8(%r15),%rax
   26ecb:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   26ed2:	49 8b 58 08          	mov    0x8(%r8),%rbx
   26ed6:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26edd:	83 fb f9             	cmp    $0xfffffff9,%ebx
   26ee0:	0f 85 d2 62 00 00    	jne    2d1b8 <JS_CallInternal+0x7d28>
   26ee6:	83 f8 f9             	cmp    $0xfffffff9,%eax
   26ee9:	0f 85 c9 62 00 00    	jne    2d1b8 <JS_CallInternal+0x7d28>
   26eef:	49 8b 75 48          	mov    0x48(%r13),%rsi
   26ef3:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   26efa:	ba 12 00 00 00       	mov    $0x12,%edx
   26eff:	4c 89 ef             	mov    %r13,%rdi
   26f02:	48 c7 85 50 ff ff ff 	movq   $0x0,-0xb0(%rbp)
   26f09:	00 00 00 00 
   26f0d:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   26f11:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   26f18:	00 00 00 00 
   26f1c:	e8 1f 38 02 00       	call   4a740 <JS_NewObjectFromShape>
   26f21:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   26f28:	83 fa 06             	cmp    $0x6,%edx
   26f2b:	0f 84 9f 62 00 00    	je     2d1d0 <JS_CallInternal+0x7d40>
   26f31:	f3 0f 7e 85 30 fe ff 	movq   -0x1d0(%rbp),%xmm0
   26f38:	ff 
   26f39:	0f 16 85 10 fe ff ff 	movhps -0x1f0(%rbp),%xmm0
   26f40:	0f 11 40 28          	movups %xmm0,0x28(%rax)
   26f44:	49 89 07             	mov    %rax,(%r15)
   26f47:	4c 89 c3             	mov    %r8,%rbx
   26f4a:	49 89 57 08          	mov    %rdx,0x8(%r15)
   26f4e:	4d 89 e7             	mov    %r12,%r15
   26f51:	41 83 78 f8 06       	cmpl   $0x6,-0x8(%r8)
   26f56:	0f 84 74 ec ff ff    	je     25bd0 <JS_CallInternal+0x740>
   26f5c:	41 0f b6 04 24       	movzbl (%r12),%eax
   26f61:	49 83 c4 01          	add    $0x1,%r12
   26f65:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   26f69:	49 89 c2             	mov    %rax,%r10
   26f6c:	e9 3f e8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   26f71:	f3 0f 1e fa          	endbr64
   26f75:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26f7a:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   26f7e:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   26f82:	4c 89 ef             	mov    %r13,%rdi
   26f85:	41 0f b7 04 24       	movzwl (%r12),%eax
   26f8a:	48 8d b5 dc fe ff ff 	lea    -0x124(%rbp),%rsi
   26f91:	66 89 85 10 fe ff ff 	mov    %ax,-0x1f0(%rbp)
   26f98:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26f9f:	4c 89 78 30          	mov    %r15,0x30(%rax)
   26fa3:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   26fa7:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   26fae:	e8 8d 66 06 00       	call   8d640 <build_arg_list>
   26fb3:	49 89 c2             	mov    %rax,%r10
   26fb6:	48 85 c0             	test   %rax,%rax
   26fb9:	0f 84 11 ec ff ff    	je     25bd0 <JS_CallInternal+0x740>
   26fbf:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26fc3:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26fc7:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   26fcd:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   26fd4:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   26fdb:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   26fe2:	48 89 c6             	mov    %rax,%rsi
   26fe5:	48 89 bd f0 fd ff ff 	mov    %rdi,-0x210(%rbp)
   26fec:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   26ff3:	e8 b8 4d ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   26ff8:	44 8b 9d dc fe ff ff 	mov    -0x124(%rbp),%r11d
   26fff:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   27006:	85 c0                	test   %eax,%eax
   27008:	0f 84 1a 5d 00 00    	je     2cd28 <JS_CallInternal+0x7898>
   2700e:	0f b7 85 10 fe ff ff 	movzwl -0x1f0(%rbp),%eax
   27015:	83 e8 02             	sub    $0x2,%eax
   27018:	45 85 db             	test   %r11d,%r11d
   2701b:	0f 84 87 5b 00 00    	je     2cba8 <JS_CallInternal+0x7718>
   27021:	49 8b 0a             	mov    (%r10),%rcx
   27024:	4d 8b 42 08          	mov    0x8(%r10),%r8
   27028:	48 83 ec 08          	sub    $0x8,%rsp
   2702c:	44 89 9d 20 fe ff ff 	mov    %r11d,-0x1e0(%rbp)
   27033:	31 f6                	xor    %esi,%esi
   27035:	4c 89 ef             	mov    %r13,%rdi
   27038:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2703f:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   27045:	ba 03 00 00 00       	mov    $0x3,%edx
   2704a:	50                   	push   %rax
   2704b:	e8 50 dd 01 00       	call   44da0 <JS_EvalObject>
   27050:	44 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11d
   27057:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2705e:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   27065:	41 59                	pop    %r9
   27067:	41 5a                	pop    %r10
   27069:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   27070:	45 85 db             	test   %r11d,%r11d
   27073:	0f 84 de 4e 00 00    	je     2bf57 <JS_CallInternal+0x6ac7>
   27079:	45 89 d8             	mov    %r11d,%r8d
   2707c:	48 89 9d 20 fe ff ff 	mov    %rbx,-0x1e0(%rbp)
   27083:	4c 89 d3             	mov    %r10,%rbx
   27086:	49 c1 e0 04          	shl    $0x4,%r8
   2708a:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   27091:	4d 01 d0             	add    %r10,%r8
   27094:	4d 89 ea             	mov    %r13,%r10
   27097:	4d 89 e5             	mov    %r12,%r13
   2709a:	4d 89 c4             	mov    %r8,%r12
   2709d:	eb 0e                	jmp    270ad <JS_CallInternal+0x1c1d>
   2709f:	90                   	nop
   270a0:	48 83 c3 10          	add    $0x10,%rbx
   270a4:	4c 39 e3             	cmp    %r12,%rbx
   270a7:	0f 84 96 4e 00 00    	je     2bf43 <JS_CallInternal+0x6ab3>
   270ad:	48 8b 43 08          	mov    0x8(%rbx),%rax
   270b1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   270b4:	76 ea                	jbe    270a0 <JS_CallInternal+0x1c10>
   270b6:	48 8b 33             	mov    (%rbx),%rsi
   270b9:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   270bc:	8d 51 ff             	lea    -0x1(%rcx),%edx
   270bf:	89 56 fc             	mov    %edx,-0x4(%rsi)
   270c2:	85 d2                	test   %edx,%edx
   270c4:	7f da                	jg     270a0 <JS_CallInternal+0x1c10>
   270c6:	49 8b 7a 10          	mov    0x10(%r10),%rdi
   270ca:	48 89 c2             	mov    %rax,%rdx
   270cd:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   270d4:	e8 e7 78 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   270d9:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   270e0:	eb be                	jmp    270a0 <JS_CallInternal+0x1c10>
   270e2:	f3 0f 1e fa          	endbr64
   270e6:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   270eb:	49 89 da             	mov    %rbx,%r10
   270ee:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   270f3:	41 0f b7 74 24 02    	movzwl 0x2(%r12),%esi
   270f9:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   27100:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   27106:	48 89 c8             	mov    %rcx,%rax
   27109:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2710f:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   27116:	48 c1 e0 04          	shl    $0x4,%rax
   2711a:	66 89 b5 f0 fd ff ff 	mov    %si,-0x210(%rbp)
   27121:	49 29 c2             	sub    %rax,%r10
   27124:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2712b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27132:	49 8b 7a f0          	mov    -0x10(%r10),%rdi
   27136:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2713d:	4c 89 78 30          	mov    %r15,0x30(%rax)
   27141:	49 8b 42 f8          	mov    -0x8(%r10),%rax
   27145:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   2714c:	48 89 c6             	mov    %rax,%rsi
   2714f:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   27156:	e8 55 4c ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2715b:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   27162:	85 c0                	test   %eax,%eax
   27164:	0f 84 c6 5c 00 00    	je     2ce30 <JS_CallInternal+0x79a0>
   2716a:	0f b7 85 f0 fd ff ff 	movzwl -0x210(%rbp),%eax
   27171:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   27177:	83 e8 02             	sub    $0x2,%eax
   2717a:	85 d2                	test   %edx,%edx
   2717c:	0f 84 f7 5a 00 00    	je     2cc79 <JS_CallInternal+0x77e9>
   27182:	49 8b 0a             	mov    (%r10),%rcx
   27185:	4d 8b 42 08          	mov    0x8(%r10),%r8
   27189:	48 83 ec 08          	sub    $0x8,%rsp
   2718d:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   27194:	31 f6                	xor    %esi,%esi
   27196:	4c 89 ef             	mov    %r13,%rdi
   27199:	50                   	push   %rax
   2719a:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   271a0:	ba 03 00 00 00       	mov    $0x3,%edx
   271a5:	e8 f6 db 01 00       	call   44da0 <JS_EvalObject>
   271aa:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   271b1:	41 5b                	pop    %r11
   271b3:	48 89 c6             	mov    %rax,%rsi
   271b6:	58                   	pop    %rax
   271b7:	83 fa 06             	cmp    $0x6,%edx
   271ba:	0f 84 10 ea ff ff    	je     25bd0 <JS_CallInternal+0x740>
   271c0:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   271c7:	4c 89 a5 10 fe ff ff 	mov    %r12,-0x1f0(%rbp)
   271ce:	4d 8d 7a f0          	lea    -0x10(%r10),%r15
   271d2:	49 89 dc             	mov    %rbx,%r12
   271d5:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   271dc:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   271e3:	4a 8d 1c 10          	lea    (%rax,%r10,1),%rbx
   271e7:	eb 24                	jmp    2720d <JS_CallInternal+0x1d7d>
   271e9:	90                   	nop
   271ea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   271f1:	00 00 00 00 
   271f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   271fc:	00 00 00 00 
   27200:	49 83 c7 10          	add    $0x10,%r15
   27204:	49 39 df             	cmp    %rbx,%r15
   27207:	0f 84 24 4e 00 00    	je     2c031 <JS_CallInternal+0x6ba1>
   2720d:	49 8b 57 08          	mov    0x8(%r15),%rdx
   27211:	83 fa f6             	cmp    $0xfffffff6,%edx
   27214:	76 ea                	jbe    27200 <JS_CallInternal+0x1d70>
   27216:	49 8b 37             	mov    (%r15),%rsi
   27219:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2721c:	83 e8 01             	sub    $0x1,%eax
   2721f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   27222:	85 c0                	test   %eax,%eax
   27224:	7f da                	jg     27200 <JS_CallInternal+0x1d70>
   27226:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2722a:	e8 91 77 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2722f:	eb cf                	jmp    27200 <JS_CallInternal+0x1d70>
   27231:	f3 0f 1e fa          	endbr64
   27235:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2723b:	41 8b 34 24          	mov    (%r12),%esi
   2723f:	4d 8d 7c 24 05       	lea    0x5(%r12),%r15
   27244:	3c 04                	cmp    $0x4,%al
   27246:	0f 87 5d 64 00 00    	ja     2d6a9 <JS_CallInternal+0x8219>
   2724c:	48 8d 15 25 bf 0b 00 	lea    0xbbf25(%rip),%rdx        # e3178 <qjsc_repl_size+0x4cc>
   27253:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   27257:	48 01 d0             	add    %rdx,%rax
   2725a:	3e ff e0             	notrack jmp *%rax
   2725d:	f3 0f 1e fa          	endbr64
   27261:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27265:	41 0f b7 04 24       	movzwl (%r12),%eax
   2726a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2726e:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   27271:	76 04                	jbe    27277 <JS_CallInternal+0x1de7>
   27273:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   27277:	48 c1 e0 04          	shl    $0x4,%rax
   2727b:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   27282:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27286:	48 8b 38             	mov    (%rax),%rdi
   27289:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2728d:	48 89 30             	mov    %rsi,(%rax)
   27290:	83 fa f6             	cmp    $0xfffffff6,%edx
   27293:	76 11                	jbe    272a6 <JS_CallInternal+0x1e16>
   27295:	8b 47 fc             	mov    -0x4(%rdi),%eax
   27298:	83 e8 01             	sub    $0x1,%eax
   2729b:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2729e:	85 c0                	test   %eax,%eax
   272a0:	0f 8e 14 65 00 00    	jle    2d7ba <JS_CallInternal+0x832a>
   272a6:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   272ac:	49 83 c4 03          	add    $0x3,%r12
   272b0:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   272b4:	49 89 c2             	mov    %rax,%r10
   272b7:	e9 f4 e4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   272bc:	f3 0f 1e fa          	endbr64
   272c0:	41 0f b7 04 24       	movzwl (%r12),%eax
   272c5:	48 c1 e0 04          	shl    $0x4,%rax
   272c9:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   272d0:	48 8b 10             	mov    (%rax),%rdx
   272d3:	48 8b 40 08          	mov    0x8(%rax),%rax
   272d7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   272da:	76 04                	jbe    272e0 <JS_CallInternal+0x1e50>
   272dc:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   272e0:	48 89 13             	mov    %rdx,(%rbx)
   272e3:	49 83 c4 03          	add    $0x3,%r12
   272e7:	48 83 c3 10          	add    $0x10,%rbx
   272eb:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   272ef:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   272f5:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   272f9:	49 89 c2             	mov    %rax,%r10
   272fc:	e9 af e4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27301:	f3 0f 1e fa          	endbr64
   27305:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27309:	41 0f b7 04 24       	movzwl (%r12),%eax
   2730e:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27312:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   27315:	76 04                	jbe    2731b <JS_CallInternal+0x1e8b>
   27317:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2731b:	48 c1 e0 04          	shl    $0x4,%rax
   2731f:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   27326:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2732a:	48 8b 38             	mov    (%rax),%rdi
   2732d:	48 89 48 08          	mov    %rcx,0x8(%rax)
   27331:	48 89 30             	mov    %rsi,(%rax)
   27334:	83 fa f6             	cmp    $0xfffffff6,%edx
   27337:	76 11                	jbe    2734a <JS_CallInternal+0x1eba>
   27339:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2733c:	83 e8 01             	sub    $0x1,%eax
   2733f:	89 47 fc             	mov    %eax,-0x4(%rdi)
   27342:	85 c0                	test   %eax,%eax
   27344:	0f 8e 5f 64 00 00    	jle    2d7a9 <JS_CallInternal+0x8319>
   2734a:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   27350:	49 83 c4 03          	add    $0x3,%r12
   27354:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27358:	49 89 c2             	mov    %rax,%r10
   2735b:	e9 50 e4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27360:	f3 0f 1e fa          	endbr64
   27364:	41 0f b7 04 24       	movzwl (%r12),%eax
   27369:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2736e:	48 c1 e0 04          	shl    $0x4,%rax
   27372:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   27379:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2737d:	48 8b 08             	mov    (%rax),%rcx
   27380:	0f 11 00             	movups %xmm0,(%rax)
   27383:	83 fa f6             	cmp    $0xfffffff6,%edx
   27386:	76 11                	jbe    27399 <JS_CallInternal+0x1f09>
   27388:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2738b:	83 e8 01             	sub    $0x1,%eax
   2738e:	89 41 fc             	mov    %eax,-0x4(%rcx)
   27391:	85 c0                	test   %eax,%eax
   27393:	0f 8e 99 66 00 00    	jle    2da32 <JS_CallInternal+0x85a2>
   27399:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2739f:	48 83 eb 10          	sub    $0x10,%rbx
   273a3:	49 83 c4 03          	add    $0x3,%r12
   273a7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   273ab:	49 89 c2             	mov    %rax,%r10
   273ae:	e9 fd e3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   273b3:	f3 0f 1e fa          	endbr64
   273b7:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   273bb:	4c 8b 7b e0          	mov    -0x20(%rbx),%r15
   273bf:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   273c3:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   273c7:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   273cb:	0f 85 4b 56 00 00    	jne    2ca1c <JS_CallInternal+0x758c>
   273d1:	85 c0                	test   %eax,%eax
   273d3:	0f 85 43 56 00 00    	jne    2ca1c <JS_CallInternal+0x758c>
   273d9:	66 41 83 7f 12 02    	cmpw   $0x2,0x12(%r15)
   273df:	0f 85 37 56 00 00    	jne    2ca1c <JS_CallInternal+0x758c>
   273e5:	41 3b 57 38          	cmp    0x38(%r15),%edx
   273e9:	0f 83 2d 56 00 00    	jae    2ca1c <JS_CallInternal+0x758c>
   273ef:	89 d0                	mov    %edx,%eax
   273f1:	48 c1 e0 04          	shl    $0x4,%rax
   273f5:	49 03 47 30          	add    0x30(%r15),%rax
   273f9:	48 8b 08             	mov    (%rax),%rcx
   273fc:	48 8b 40 08          	mov    0x8(%rax),%rax
   27400:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27403:	76 04                	jbe    27409 <JS_CallInternal+0x1f79>
   27405:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27409:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2740d:	76 13                	jbe    27422 <JS_CallInternal+0x1f92>
   2740f:	41 8b 77 fc          	mov    -0x4(%r15),%esi
   27413:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27416:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   2741a:	85 d2                	test   %edx,%edx
   2741c:	0f 8e c9 69 00 00    	jle    2ddeb <JS_CallInternal+0x895b>
   27422:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   27426:	49 83 c4 01          	add    $0x1,%r12
   2742a:	48 83 eb 10          	sub    $0x10,%rbx
   2742e:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27432:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27438:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2743c:	49 89 c2             	mov    %rax,%r10
   2743f:	e9 6c e3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27444:	f3 0f 1e fa          	endbr64
   27448:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2744c:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27450:	4c 89 ef             	mov    %r13,%rdi
   27453:	49 83 c4 01          	add    $0x1,%r12
   27457:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2745b:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   2745f:	e8 0c 90 ff ff       	call   20470 <js_method_set_home_object>
   27464:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2746a:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2746e:	49 89 c2             	mov    %rax,%r10
   27471:	e9 3a e3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27476:	f3 0f 1e fa          	endbr64
   2747a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27481:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   27485:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   27489:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2748d:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   27491:	0f 84 4e 51 00 00    	je     2c5e5 <JS_CallInternal+0x7155>
   27497:	41 83 ff 02          	cmp    $0x2,%r15d
   2749b:	0f 84 44 51 00 00    	je     2c5e5 <JS_CallInternal+0x7155>
   274a1:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   274a5:	76 13                	jbe    274ba <JS_CallInternal+0x202a>
   274a7:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   274ab:	83 e8 01             	sub    $0x1,%eax
   274ae:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   274b2:	85 c0                	test   %eax,%eax
   274b4:	0f 8e 3f 63 00 00    	jle    2d7f9 <JS_CallInternal+0x8369>
   274ba:	41 0f b6 04 24       	movzbl (%r12),%eax
   274bf:	48 83 eb 10          	sub    $0x10,%rbx
   274c3:	49 83 c4 01          	add    $0x1,%r12
   274c7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   274cb:	49 89 c2             	mov    %rax,%r10
   274ce:	e9 dd e2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   274d3:	f3 0f 1e fa          	endbr64
   274d7:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   274db:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   274df:	4c 89 ef             	mov    %r13,%rdi
   274e2:	4d 89 e7             	mov    %r12,%r15
   274e5:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   274e9:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   274ed:	e8 1e 00 02 00       	call   47510 <JS_DefineObjectNameComputed.constprop.0>
   274f2:	83 f8 ff             	cmp    $0xffffffff,%eax
   274f5:	0f 84 d5 e6 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   274fb:	41 0f b6 04 24       	movzbl (%r12),%eax
   27500:	49 83 c4 01          	add    $0x1,%r12
   27504:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27508:	49 89 c2             	mov    %rax,%r10
   2750b:	e9 a0 e2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27510:	f3 0f 1e fa          	endbr64
   27514:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27518:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2751c:	4c 8d 5b f0          	lea    -0x10(%rbx),%r11
   27520:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27523:	76 04                	jbe    27529 <JS_CallInternal+0x2099>
   27525:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27529:	48 92                	xchg   %rax,%rdx
   2752b:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2752f:	4c 89 ef             	mov    %r13,%rdi
   27532:	41 b9 07 40 00 00    	mov    $0x4007,%r9d
   27538:	49 89 d0             	mov    %rdx,%r8
   2753b:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2753f:	41 ff 73 08          	push   0x8(%r11)
   27543:	48 89 c1             	mov    %rax,%rcx
   27546:	41 ff 33             	push   (%r11)
   27549:	4d 89 e7             	mov    %r12,%r15
   2754c:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   27553:	e8 a8 fd 01 00       	call   47300 <JS_DefinePropertyValueValue>
   27558:	5f                   	pop    %rdi
   27559:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   27560:	41 58                	pop    %r8
   27562:	85 c0                	test   %eax,%eax
   27564:	0f 88 66 e6 ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2756a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2756f:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   27576:	49 83 c4 01          	add    $0x1,%r12
   2757a:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2757e:	49 89 c2             	mov    %rax,%r10
   27581:	e9 2a e2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27586:	f3 0f 1e fa          	endbr64
   2758a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27591:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27595:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   27599:	0f 85 3b 81 00 00    	jne    2f6da <JS_CallInternal+0xa24a>
   2759f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   275a3:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   275a7:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   275ab:	4c 89 ef             	mov    %r13,%rdi
   275ae:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   275b5:	4d 89 e7             	mov    %r12,%r15
   275b8:	e8 73 fb 01 00       	call   47130 <JS_ValueToAtom>
   275bd:	89 c1                	mov    %eax,%ecx
   275bf:	85 c0                	test   %eax,%eax
   275c1:	0f 84 09 e6 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   275c7:	48 83 ec 08          	sub    $0x8,%rsp
   275cb:	4c 8d 53 d0          	lea    -0x30(%rbx),%r10
   275cf:	4c 8d 7b c0          	lea    -0x40(%rbx),%r15
   275d3:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   275d7:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   275de:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   275e2:	4c 89 ef             	mov    %r13,%rdi
   275e5:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   275e9:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   275ed:	68 00 80 00 00       	push   $0x8000
   275f2:	41 ff 77 08          	push   0x8(%r15)
   275f6:	41 ff 37             	push   (%r15)
   275f9:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   275ff:	e8 ec 9a 00 00       	call   310f0 <JS_SetPropertyInternal>
   27604:	8b 8d 10 fe ff ff    	mov    -0x1f0(%rbp),%ecx
   2760a:	48 83 c4 20          	add    $0x20,%rsp
   2760e:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   27615:	89 c3                	mov    %eax,%ebx
   27617:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2761d:	0f 8f ab 58 00 00    	jg     2cece <JS_CallInternal+0x7a3e>
   27623:	49 8b 47 08          	mov    0x8(%r15),%rax
   27627:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2762a:	76 14                	jbe    27640 <JS_CallInternal+0x21b0>
   2762c:	49 8b 0f             	mov    (%r15),%rcx
   2762f:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27632:	83 ea 01             	sub    $0x1,%edx
   27635:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27638:	85 d2                	test   %edx,%edx
   2763a:	0f 8e df 6b 00 00    	jle    2e21f <JS_CallInternal+0x8d8f>
   27640:	49 8b 42 08          	mov    0x8(%r10),%rax
   27644:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27647:	76 14                	jbe    2765d <JS_CallInternal+0x21cd>
   27649:	49 8b 0a             	mov    (%r10),%rcx
   2764c:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2764f:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27652:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27655:	85 d2                	test   %edx,%edx
   27657:	0f 8e 5c 6b 00 00    	jle    2e1b9 <JS_CallInternal+0x8d29>
   2765d:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   27664:	48 8b 41 08          	mov    0x8(%rcx),%rax
   27668:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2766b:	76 14                	jbe    27681 <JS_CallInternal+0x21f1>
   2766d:	48 8b 09             	mov    (%rcx),%rcx
   27670:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27673:	83 ea 01             	sub    $0x1,%edx
   27676:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27679:	85 d2                	test   %edx,%edx
   2767b:	0f 8e 4c 6b 00 00    	jle    2e1cd <JS_CallInternal+0x8d3d>
   27681:	85 db                	test   %ebx,%ebx
   27683:	0f 88 1c 88 00 00    	js     2fea5 <JS_CallInternal+0xaa15>
   27689:	41 0f b6 04 24       	movzbl (%r12),%eax
   2768e:	4c 89 fb             	mov    %r15,%rbx
   27691:	49 83 c4 01          	add    $0x1,%r12
   27695:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27699:	49 89 c2             	mov    %rax,%r10
   2769c:	e9 0f e1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   276a1:	f3 0f 1e fa          	endbr64
   276a5:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   276a9:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   276ad:	4c 89 ef             	mov    %r13,%rdi
   276b0:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   276b4:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   276bb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   276bf:	e8 6c fa 01 00       	call   47130 <JS_ValueToAtom>
   276c4:	89 c1                	mov    %eax,%ecx
   276c6:	85 c0                	test   %eax,%eax
   276c8:	0f 84 5e 70 00 00    	je     2e72c <JS_CallInternal+0x929c>
   276ce:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   276d2:	0f 84 01 70 00 00    	je     2e6d9 <JS_CallInternal+0x9249>
   276d8:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   276dc:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   276e0:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   276e4:	4c 89 ef             	mov    %r13,%rdi
   276e7:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   276ee:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   276f4:	e8 67 8d 04 00       	call   70460 <JS_HasProperty>
   276f9:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   276ff:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   27706:	85 c0                	test   %eax,%eax
   27708:	0f 8e 6a 78 00 00    	jle    2ef78 <JS_CallInternal+0x9ae8>
   2770e:	48 83 ec 08          	sub    $0x8,%rsp
   27712:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   27716:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2771a:	4c 89 ef             	mov    %r13,%rdi
   2771d:	49 8b 33             	mov    (%r11),%rsi
   27720:	49 8b 53 08          	mov    0x8(%r11),%rdx
   27724:	68 00 80 00 00       	push   $0x8000
   27729:	41 ff 73 08          	push   0x8(%r11)
   2772d:	41 ff 33             	push   (%r11)
   27730:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   27737:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2773d:	e8 ae 99 00 00       	call   310f0 <JS_SetPropertyInternal>
   27742:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   27748:	48 83 c4 20          	add    $0x20,%rsp
   2774c:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   27753:	89 c3                	mov    %eax,%ebx
   27755:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2775b:	0f 8f 1f 5a 00 00    	jg     2d180 <JS_CallInternal+0x7cf0>
   27761:	49 8b 47 08          	mov    0x8(%r15),%rax
   27765:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27768:	76 14                	jbe    2777e <JS_CallInternal+0x22ee>
   2776a:	49 8b 0f             	mov    (%r15),%rcx
   2776d:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27770:	83 ea 01             	sub    $0x1,%edx
   27773:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27776:	85 d2                	test   %edx,%edx
   27778:	0f 8e b6 6f 00 00    	jle    2e734 <JS_CallInternal+0x92a4>
   2777e:	49 8b 43 08          	mov    0x8(%r11),%rax
   27782:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27785:	76 14                	jbe    2779b <JS_CallInternal+0x230b>
   27787:	49 8b 0b             	mov    (%r11),%rcx
   2778a:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2778d:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27790:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27793:	85 d2                	test   %edx,%edx
   27795:	0f 8e 1c 6f 00 00    	jle    2e6b7 <JS_CallInternal+0x9227>
   2779b:	85 db                	test   %ebx,%ebx
   2779d:	0f 88 9d 77 00 00    	js     2ef40 <JS_CallInternal+0x9ab0>
   277a3:	41 0f b6 04 24       	movzbl (%r12),%eax
   277a8:	4c 89 db             	mov    %r11,%rbx
   277ab:	49 83 c4 01          	add    $0x1,%r12
   277af:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   277b3:	49 89 c2             	mov    %rax,%r10
   277b6:	e9 f5 df ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   277bb:	f3 0f 1e fa          	endbr64
   277bf:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   277c3:	0f 85 ec 53 00 00    	jne    2cbb5 <JS_CallInternal+0x7725>
   277c9:	44 8b 7b e8          	mov    -0x18(%rbx),%r15d
   277cd:	45 85 ff             	test   %r15d,%r15d
   277d0:	0f 85 df 53 00 00    	jne    2cbb5 <JS_CallInternal+0x7725>
   277d6:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   277da:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   277de:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   277e3:	0f 85 cc 53 00 00    	jne    2cbb5 <JS_CallInternal+0x7725>
   277e9:	8b 4a 38             	mov    0x38(%rdx),%ecx
   277ec:	39 c8                	cmp    %ecx,%eax
   277ee:	0f 83 19 78 00 00    	jae    2f00d <JS_CallInternal+0x9b7d>
   277f4:	89 c0                	mov    %eax,%eax
   277f6:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   277fb:	48 c1 e0 04          	shl    $0x4,%rax
   277ff:	48 03 42 30          	add    0x30(%rdx),%rax
   27803:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27807:	48 8b 08             	mov    (%rax),%rcx
   2780a:	0f 11 00             	movups %xmm0,(%rax)
   2780d:	83 fa f6             	cmp    $0xfffffff6,%edx
   27810:	76 11                	jbe    27823 <JS_CallInternal+0x2393>
   27812:	8b 41 fc             	mov    -0x4(%rcx),%eax
   27815:	83 e8 01             	sub    $0x1,%eax
   27818:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2781b:	85 c0                	test   %eax,%eax
   2781d:	0f 8e 11 76 00 00    	jle    2ee34 <JS_CallInternal+0x99a4>
   27823:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   27827:	48 83 eb 30          	sub    $0x30,%rbx
   2782b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2782e:	76 14                	jbe    27844 <JS_CallInternal+0x23b4>
   27830:	48 8b 0b             	mov    (%rbx),%rcx
   27833:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27836:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27839:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2783c:	85 d2                	test   %edx,%edx
   2783e:	0f 8e 4c 78 00 00    	jle    2f090 <JS_CallInternal+0x9c00>
   27844:	41 0f b6 04 24       	movzbl (%r12),%eax
   27849:	49 83 c4 01          	add    $0x1,%r12
   2784d:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27851:	49 89 c2             	mov    %rax,%r10
   27854:	e9 57 df ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27859:	f3 0f 1e fa          	endbr64
   2785d:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27861:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27865:	4c 89 ef             	mov    %r13,%rdi
   27868:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2786c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27873:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27877:	e8 b4 f8 01 00       	call   47130 <JS_ValueToAtom>
   2787c:	89 c1                	mov    %eax,%ecx
   2787e:	85 c0                	test   %eax,%eax
   27880:	0f 84 0d 66 00 00    	je     2de93 <JS_CallInternal+0x8a03>
   27886:	48 83 ec 08          	sub    $0x8,%rsp
   2788a:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   2788e:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   27892:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   27896:	4c 89 9d 20 fe ff ff 	mov    %r11,-0x1e0(%rbp)
   2789d:	4c 8b 4b d8          	mov    -0x28(%rbx),%r9
   278a1:	4c 89 ef             	mov    %r13,%rdi
   278a4:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   278a8:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   278ac:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   278b3:	6a 00                	push   $0x0
   278b5:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   278bb:	e8 e0 8a 00 00       	call   303a0 <JS_GetPropertyInternal>
   278c0:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   278c6:	4c 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11
   278cd:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   278d4:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   278da:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   278e1:	58                   	pop    %rax
   278e2:	5a                   	pop    %rdx
   278e3:	0f 8f 57 57 00 00    	jg     2d040 <JS_CallInternal+0x7bb0>
   278e9:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   278f0:	0f 84 05 6d 00 00    	je     2e5fb <JS_CallInternal+0x916b>
   278f6:	49 8b 47 08          	mov    0x8(%r15),%rax
   278fa:	83 f8 f6             	cmp    $0xfffffff6,%eax
   278fd:	76 14                	jbe    27913 <JS_CallInternal+0x2483>
   278ff:	49 8b 0f             	mov    (%r15),%rcx
   27902:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27905:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27908:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2790b:	85 d2                	test   %edx,%edx
   2790d:	0f 8e ea 68 00 00    	jle    2e1fd <JS_CallInternal+0x8d6d>
   27913:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2791a:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2791e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27921:	76 14                	jbe    27937 <JS_CallInternal+0x24a7>
   27923:	48 8b 09             	mov    (%rcx),%rcx
   27926:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27929:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2792c:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2792f:	85 d2                	test   %edx,%edx
   27931:	0f 8e cc 6c 00 00    	jle    2e603 <JS_CallInternal+0x9173>
   27937:	49 8b 43 08          	mov    0x8(%r11),%rax
   2793b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2793e:	76 14                	jbe    27954 <JS_CallInternal+0x24c4>
   27940:	49 8b 0b             	mov    (%r11),%rcx
   27943:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27946:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27949:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2794c:	85 d2                	test   %edx,%edx
   2794e:	0f 8e 95 68 00 00    	jle    2e1e9 <JS_CallInternal+0x8d59>
   27954:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2795b:	49 83 c4 01          	add    $0x1,%r12
   2795f:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   27963:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2796a:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   2796e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27974:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2797b:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2797f:	49 89 c2             	mov    %rax,%r10
   27982:	e9 29 de ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27987:	f3 0f 1e fa          	endbr64
   2798b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27992:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27996:	4c 89 ef             	mov    %r13,%rdi
   27999:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2799d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   279a1:	e8 8a f7 01 00       	call   47130 <JS_ValueToAtom>
   279a6:	89 c1                	mov    %eax,%ecx
   279a8:	85 c0                	test   %eax,%eax
   279aa:	0f 84 80 83 00 00    	je     2fd30 <JS_CallInternal+0xa8a0>
   279b0:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   279b4:	83 fa 03             	cmp    $0x3,%edx
   279b7:	0f 84 78 6b 00 00    	je     2e535 <JS_CallInternal+0x90a5>
   279bd:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   279c1:	4c 89 ef             	mov    %r13,%rdi
   279c4:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   279ca:	e8 91 8a 04 00       	call   70460 <JS_HasProperty>
   279cf:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   279d5:	85 c0                	test   %eax,%eax
   279d7:	0f 8e a7 73 00 00    	jle    2ed84 <JS_CallInternal+0x98f4>
   279dd:	48 83 ec 08          	sub    $0x8,%rsp
   279e1:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   279e5:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   279e9:	4c 89 ef             	mov    %r13,%rdi
   279ec:	6a 00                	push   $0x0
   279ee:	49 89 f0             	mov    %rsi,%r8
   279f1:	49 89 d1             	mov    %rdx,%r9
   279f4:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   279fa:	e8 a1 89 00 00       	call   303a0 <JS_GetPropertyInternal>
   279ff:	59                   	pop    %rcx
   27a00:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   27a06:	49 89 c7             	mov    %rax,%r15
   27a09:	5e                   	pop    %rsi
   27a0a:	48 89 d0             	mov    %rdx,%rax
   27a0d:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   27a13:	0f 8f 37 58 00 00    	jg     2d250 <JS_CallInternal+0x7dc0>
   27a19:	83 fa 06             	cmp    $0x6,%edx
   27a1c:	0f 84 82 76 00 00    	je     2f0a4 <JS_CallInternal+0x9c14>
   27a22:	4c 89 3b             	mov    %r15,(%rbx)
   27a25:	49 83 c4 01          	add    $0x1,%r12
   27a29:	48 83 c3 10          	add    $0x10,%rbx
   27a2d:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27a31:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27a37:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27a3b:	49 89 c2             	mov    %rax,%r10
   27a3e:	e9 6d dd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27a43:	f3 0f 1e fa          	endbr64
   27a47:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27a4b:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   27a4f:	83 f8 ff             	cmp    $0xffffffff,%eax
   27a52:	0f 85 6a 6b 00 00    	jne    2e5c2 <JS_CallInternal+0x9132>
   27a58:	45 85 ff             	test   %r15d,%r15d
   27a5b:	0f 85 a5 54 00 00    	jne    2cf06 <JS_CallInternal+0x7a76>
   27a61:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27a65:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   27a69:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   27a6e:	0f 85 01 55 00 00    	jne    2cf75 <JS_CallInternal+0x7ae5>
   27a74:	3b 42 38             	cmp    0x38(%rdx),%eax
   27a77:	0f 83 f8 54 00 00    	jae    2cf75 <JS_CallInternal+0x7ae5>
   27a7d:	89 c0                	mov    %eax,%eax
   27a7f:	48 c1 e0 04          	shl    $0x4,%rax
   27a83:	48 03 42 30          	add    0x30(%rdx),%rax
   27a87:	48 8b 10             	mov    (%rax),%rdx
   27a8a:	48 8b 40 08          	mov    0x8(%rax),%rax
   27a8e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a91:	76 04                	jbe    27a97 <JS_CallInternal+0x2607>
   27a93:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27a97:	48 89 13             	mov    %rdx,(%rbx)
   27a9a:	49 83 c4 01          	add    $0x1,%r12
   27a9e:	48 83 c3 10          	add    $0x10,%rbx
   27aa2:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27aa6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27aac:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27ab0:	49 89 c2             	mov    %rax,%r10
   27ab3:	e9 f8 dc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27ab8:	f3 0f 1e fa          	endbr64
   27abc:	e9 af dd ff ff       	jmp    25870 <JS_CallInternal+0x3e0>
   27ac1:	f3 0f 1e fa          	endbr64
   27ac5:	e9 a6 dd ff ff       	jmp    25870 <JS_CallInternal+0x3e0>
   27aca:	f3 0f 1e fa          	endbr64
   27ace:	41 8b 04 24          	mov    (%r12),%eax
   27ad2:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   27ad9:	48 c1 e0 04          	shl    $0x4,%rax
   27add:	48 03 41 50          	add    0x50(%rcx),%rax
   27ae1:	48 8b 10             	mov    (%rax),%rdx
   27ae4:	48 8b 40 08          	mov    0x8(%rax),%rax
   27ae8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27aeb:	76 04                	jbe    27af1 <JS_CallInternal+0x2661>
   27aed:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27af1:	48 92                	xchg   %rax,%rdx
   27af3:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   27afa:	45 31 c9             	xor    %r9d,%r9d
   27afd:	4c 89 ef             	mov    %r13,%rdi
   27b00:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   27b07:	48 89 c6             	mov    %rax,%rsi
   27b0a:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   27b0f:	e8 6c 72 02 00       	call   4ed80 <js_closure>
   27b14:	48 89 03             	mov    %rax,(%rbx)
   27b17:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27b1b:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27b1f:	0f 84 85 6d 00 00    	je     2e8aa <JS_CallInternal+0x941a>
   27b25:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   27b2b:	48 83 c3 10          	add    $0x10,%rbx
   27b2f:	49 83 c4 05          	add    $0x5,%r12
   27b33:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27b37:	49 89 c2             	mov    %rax,%r10
   27b3a:	e9 71 dc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27b3f:	f3 0f 1e fa          	endbr64
   27b43:	f3 0f 6f 53 e0       	movdqu -0x20(%rbx),%xmm2
   27b48:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   27b4d:	49 83 c4 01          	add    $0x1,%r12
   27b51:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27b56:	0f 11 53 c0          	movups %xmm2,-0x40(%rbx)
   27b5a:	f3 0f 6f 53 f0       	movdqu -0x10(%rbx),%xmm2
   27b5f:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27b63:	0f 11 53 d0          	movups %xmm2,-0x30(%rbx)
   27b67:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27b6b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27b71:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27b75:	49 89 c2             	mov    %rax,%r10
   27b78:	e9 33 dc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27b7d:	f3 0f 1e fa          	endbr64
   27b81:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27b86:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   27b8b:	49 83 c4 01          	add    $0x1,%r12
   27b8f:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27b93:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27b97:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27b9d:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27ba1:	49 89 c2             	mov    %rax,%r10
   27ba4:	e9 07 dc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27ba9:	f3 0f 1e fa          	endbr64
   27bad:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27bb2:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27bb7:	49 83 c4 01          	add    $0x1,%r12
   27bbb:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27bbf:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   27bc4:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   27bc8:	f3 0f 6f 4b b0       	movdqu -0x50(%rbx),%xmm1
   27bcd:	0f 11 43 b0          	movups %xmm0,-0x50(%rbx)
   27bd1:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   27bd5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27bdb:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27bdf:	49 89 c2             	mov    %rax,%r10
   27be2:	e9 c9 db ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27be7:	f3 0f 1e fa          	endbr64
   27beb:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27bf0:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27bf5:	49 83 c4 01          	add    $0x1,%r12
   27bf9:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27bfd:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   27c02:	0f 11 43 c0          	movups %xmm0,-0x40(%rbx)
   27c06:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   27c0a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27c10:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27c14:	49 89 c2             	mov    %rax,%r10
   27c17:	e9 94 db ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27c1c:	f3 0f 1e fa          	endbr64
   27c20:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   27c25:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27c2a:	49 83 c4 01          	add    $0x1,%r12
   27c2e:	0f 11 4b f0          	movups %xmm1,-0x10(%rbx)
   27c32:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27c37:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   27c3b:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27c3f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27c45:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27c49:	49 89 c2             	mov    %rax,%r10
   27c4c:	e9 5f db ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27c51:	f3 0f 1e fa          	endbr64
   27c55:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   27c5a:	f3 0f 6f 43 b0       	movdqu -0x50(%rbx),%xmm0
   27c5f:	49 83 c4 01          	add    $0x1,%r12
   27c63:	0f 11 4b b0          	movups %xmm1,-0x50(%rbx)
   27c67:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27c6c:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   27c70:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   27c75:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   27c79:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   27c7e:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27c82:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27c86:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27c8c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27c90:	49 89 c2             	mov    %rax,%r10
   27c93:	e9 18 db ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27c98:	f3 0f 1e fa          	endbr64
   27c9c:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27ca1:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   27ca6:	49 83 c4 01          	add    $0x1,%r12
   27caa:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   27cae:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   27cb3:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   27cb7:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   27cbc:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27cc0:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27cc4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27cca:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27cce:	49 89 c2             	mov    %rax,%r10
   27cd1:	e9 da da ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27cd6:	f3 0f 1e fa          	endbr64
   27cda:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   27cdf:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27ce4:	49 83 c4 01          	add    $0x1,%r12
   27ce8:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   27cec:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   27cf1:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27cf5:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27cf9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27cff:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27d03:	49 89 c2             	mov    %rax,%r10
   27d06:	e9 a5 da ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27d0b:	f3 0f 1e fa          	endbr64
   27d0f:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27d14:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27d19:	49 83 c4 01          	add    $0x1,%r12
   27d1d:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27d21:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   27d25:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27d2b:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27d2f:	49 89 c2             	mov    %rax,%r10
   27d32:	e9 79 da ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27d37:	f3 0f 1e fa          	endbr64
   27d3b:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27d40:	0f 11 03             	movups %xmm0,(%rbx)
   27d43:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   27d48:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27d4d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27d51:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27d55:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27d5a:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   27d5e:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   27d63:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   27d67:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27d6a:	76 04                	jbe    27d70 <JS_CallInternal+0x28e0>
   27d6c:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27d70:	48 89 53 c0          	mov    %rdx,-0x40(%rbx)
   27d74:	49 83 c4 01          	add    $0x1,%r12
   27d78:	48 83 c3 10          	add    $0x10,%rbx
   27d7c:	48 89 43 b8          	mov    %rax,-0x48(%rbx)
   27d80:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27d86:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27d8a:	49 89 c2             	mov    %rax,%r10
   27d8d:	e9 1e da ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27d92:	f3 0f 1e fa          	endbr64
   27d96:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27d9b:	0f 11 03             	movups %xmm0,(%rbx)
   27d9e:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   27da3:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27da8:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27dac:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27db0:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27db5:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   27db9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27dbc:	76 04                	jbe    27dc2 <JS_CallInternal+0x2932>
   27dbe:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27dc2:	48 89 53 d0          	mov    %rdx,-0x30(%rbx)
   27dc6:	49 83 c4 01          	add    $0x1,%r12
   27dca:	48 83 c3 10          	add    $0x10,%rbx
   27dce:	48 89 43 c8          	mov    %rax,-0x38(%rbx)
   27dd2:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27dd8:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27ddc:	49 89 c2             	mov    %rax,%r10
   27ddf:	e9 cc d9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27de4:	f3 0f 1e fa          	endbr64
   27de8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27ded:	0f 11 03             	movups %xmm0,(%rbx)
   27df0:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   27df5:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27df9:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27dfe:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27e02:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e05:	76 04                	jbe    27e0b <JS_CallInternal+0x297b>
   27e07:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27e0b:	48 89 53 e0          	mov    %rdx,-0x20(%rbx)
   27e0f:	49 83 c4 01          	add    $0x1,%r12
   27e13:	48 83 c3 10          	add    $0x10,%rbx
   27e17:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   27e1b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27e21:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27e25:	49 89 c2             	mov    %rax,%r10
   27e28:	e9 83 d9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27e2d:	f3 0f 1e fa          	endbr64
   27e31:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27e36:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27e3a:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27e3e:	0f 11 03             	movups %xmm0,(%rbx)
   27e41:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e44:	76 04                	jbe    27e4a <JS_CallInternal+0x29ba>
   27e46:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27e4a:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   27e4e:	49 83 c4 01          	add    $0x1,%r12
   27e52:	48 83 c3 10          	add    $0x10,%rbx
   27e56:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   27e5a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27e60:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27e64:	49 89 c2             	mov    %rax,%r10
   27e67:	e9 44 d9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27e6c:	f3 0f 1e fa          	endbr64
   27e70:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   27e74:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   27e78:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e7b:	76 04                	jbe    27e81 <JS_CallInternal+0x29f1>
   27e7d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27e81:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27e85:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27e89:	48 89 13             	mov    %rdx,(%rbx)
   27e8c:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27e90:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e93:	76 04                	jbe    27e99 <JS_CallInternal+0x2a09>
   27e95:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27e99:	48 89 43 18          	mov    %rax,0x18(%rbx)
   27e9d:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27ea1:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   27ea5:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27ea9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27eac:	76 04                	jbe    27eb2 <JS_CallInternal+0x2a22>
   27eae:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27eb2:	48 89 53 20          	mov    %rdx,0x20(%rbx)
   27eb6:	49 83 c4 01          	add    $0x1,%r12
   27eba:	48 83 c3 30          	add    $0x30,%rbx
   27ebe:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27ec2:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27ec8:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27ecc:	49 89 c2             	mov    %rax,%r10
   27ecf:	e9 dc d8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27ed4:	f3 0f 1e fa          	endbr64
   27ed8:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27edc:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27ee0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27ee3:	76 04                	jbe    27ee9 <JS_CallInternal+0x2a59>
   27ee5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27ee9:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27eed:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27ef1:	48 89 13             	mov    %rdx,(%rbx)
   27ef4:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27ef8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27efb:	76 04                	jbe    27f01 <JS_CallInternal+0x2a71>
   27efd:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27f01:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   27f05:	49 83 c4 01          	add    $0x1,%r12
   27f09:	48 83 c3 20          	add    $0x20,%rbx
   27f0d:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27f11:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27f17:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27f1b:	49 89 c2             	mov    %rax,%r10
   27f1e:	e9 8d d8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27f23:	f3 0f 1e fa          	endbr64
   27f27:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27f2b:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27f2f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f32:	76 04                	jbe    27f38 <JS_CallInternal+0x2aa8>
   27f34:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27f38:	48 89 13             	mov    %rdx,(%rbx)
   27f3b:	49 83 c4 01          	add    $0x1,%r12
   27f3f:	48 83 c3 10          	add    $0x10,%rbx
   27f43:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27f47:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27f4d:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27f51:	49 89 c2             	mov    %rax,%r10
   27f54:	e9 57 d8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27f59:	f3 0f 1e fa          	endbr64
   27f5d:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   27f61:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   27f65:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f68:	76 11                	jbe    27f7b <JS_CallInternal+0x2aeb>
   27f6a:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27f6d:	83 ea 01             	sub    $0x1,%edx
   27f70:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27f73:	85 d2                	test   %edx,%edx
   27f75:	0f 8e 2d 5c 00 00    	jle    2dba8 <JS_CallInternal+0x8718>
   27f7b:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27f80:	49 83 c4 01          	add    $0x1,%r12
   27f84:	48 83 eb 10          	sub    $0x10,%rbx
   27f88:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   27f8c:	f3 0f 6f 03          	movdqu (%rbx),%xmm0
   27f90:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27f94:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27f9a:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27f9e:	49 89 c2             	mov    %rax,%r10
   27fa1:	e9 0a d8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27fa6:	f3 0f 1e fa          	endbr64
   27faa:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27fae:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   27fb2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27fb5:	76 11                	jbe    27fc8 <JS_CallInternal+0x2b38>
   27fb7:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27fba:	83 ea 01             	sub    $0x1,%edx
   27fbd:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27fc0:	85 d2                	test   %edx,%edx
   27fc2:	0f 8e cc 5b 00 00    	jle    2db94 <JS_CallInternal+0x8704>
   27fc8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27fcd:	49 83 c4 01          	add    $0x1,%r12
   27fd1:	48 83 eb 10          	sub    $0x10,%rbx
   27fd5:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27fd9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27fdf:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   27fe3:	49 89 c2             	mov    %rax,%r10
   27fe6:	e9 c5 d7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   27feb:	f3 0f 1e fa          	endbr64
   27fef:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27ff3:	48 83 eb 10          	sub    $0x10,%rbx
   27ff7:	48 8b 0b             	mov    (%rbx),%rcx
   27ffa:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27ffd:	76 11                	jbe    28010 <JS_CallInternal+0x2b80>
   27fff:	8b 51 fc             	mov    -0x4(%rcx),%edx
   28002:	83 ea 01             	sub    $0x1,%edx
   28005:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28008:	85 d2                	test   %edx,%edx
   2800a:	0f 8e ac 5b 00 00    	jle    2dbbc <JS_CallInternal+0x872c>
   28010:	41 0f b6 04 24       	movzbl (%r12),%eax
   28015:	49 83 c4 01          	add    $0x1,%r12
   28019:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2801d:	49 89 c2             	mov    %rax,%r10
   28020:	e9 8b d7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28025:	f3 0f 1e fa          	endbr64
   28029:	8b 8d a8 fe ff ff    	mov    -0x158(%rbp),%ecx
   2802f:	41 0f b7 04 24       	movzwl (%r12),%eax
   28034:	4c 89 ef             	mov    %r13,%rdi
   28037:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2803c:	39 c8                	cmp    %ecx,%eax
   2803e:	0f 4f c1             	cmovg  %ecx,%eax
   28041:	48 63 d0             	movslq %eax,%rdx
   28044:	29 c1                	sub    %eax,%ecx
   28046:	48 c1 e2 04          	shl    $0x4,%rdx
   2804a:	89 ce                	mov    %ecx,%esi
   2804c:	48 03 95 98 fe ff ff 	add    -0x168(%rbp),%rdx
   28053:	e8 f8 4c 02 00       	call   4cd50 <js_create_array>
   28058:	48 89 03             	mov    %rax,(%rbx)
   2805b:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2805f:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   28063:	0f 84 50 65 00 00    	je     2e5b9 <JS_CallInternal+0x9129>
   28069:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2806f:	48 83 c3 10          	add    $0x10,%rbx
   28073:	49 83 c4 03          	add    $0x3,%r12
   28077:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2807b:	49 89 c2             	mov    %rax,%r10
   2807e:	e9 2d d7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28083:	f3 0f 1e fa          	endbr64
   28087:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2808c:	41 80 3c 24 06       	cmpb   $0x6,(%r12)
   28091:	0f 87 46 a5 fe ff    	ja     125dd <JS_CallInternal.cold>
   28097:	41 0f b6 04 24       	movzbl (%r12),%eax
   2809c:	48 8d 15 e9 b0 0b 00 	lea    0xbb0e9(%rip),%rdx        # e318c <qjsc_repl_size+0x4e0>
   280a3:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   280a7:	48 01 d0             	add    %rdx,%rax
   280aa:	3e ff e0             	notrack jmp *%rax
   280ad:	f3 0f 1e fa          	endbr64
   280b1:	49 8b 45 58          	mov    0x58(%r13),%rax
   280b5:	b9 01 00 00 00       	mov    $0x1,%ecx
   280ba:	4c 89 ef             	mov    %r13,%rdi
   280bd:	48 8b 70 10          	mov    0x10(%rax),%rsi
   280c1:	48 8b 50 18          	mov    0x18(%rax),%rdx
   280c5:	e8 26 2f 02 00       	call   4aff0 <JS_NewObjectProtoClass>
   280ca:	48 89 03             	mov    %rax,(%rbx)
   280cd:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   280d1:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   280d5:	0f 84 d8 67 00 00    	je     2e8b3 <JS_CallInternal+0x9423>
   280db:	41 0f b6 04 24       	movzbl (%r12),%eax
   280e0:	48 83 c3 10          	add    $0x10,%rbx
   280e4:	49 83 c4 01          	add    $0x1,%r12
   280e8:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   280ec:	49 89 c2             	mov    %rax,%r10
   280ef:	e9 bc d6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   280f4:	f3 0f 1e fa          	endbr64
   280f8:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   280ff:	49 83 c4 01          	add    $0x1,%r12
   28103:	48 83 c3 10          	add    $0x10,%rbx
   28107:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2810e:	00 
   2810f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28115:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28119:	49 89 c2             	mov    %rax,%r10
   2811c:	e9 8f d6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28121:	f3 0f 1e fa          	endbr64
   28125:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2812c:	49 83 c4 01          	add    $0x1,%r12
   28130:	48 83 c3 10          	add    $0x10,%rbx
   28134:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2813b:	00 
   2813c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28142:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28146:	49 89 c2             	mov    %rax,%r10
   28149:	e9 62 d6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2814e:	f3 0f 1e fa          	endbr64
   28152:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   28159:	f6 40 10 01          	testb  $0x1,0x10(%rax)
   2815d:	75 0d                	jne    2816c <JS_CallInternal+0x2cdc>
   2815f:	83 bd 70 fe ff ff ff 	cmpl   $0xffffffff,-0x190(%rbp)
   28166:	0f 85 59 70 00 00    	jne    2f1c5 <JS_CallInternal+0x9d35>
   2816c:	83 bd 70 fe ff ff f6 	cmpl   $0xfffffff6,-0x190(%rbp)
   28173:	76 0b                	jbe    28180 <JS_CallInternal+0x2cf0>
   28175:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   2817c:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28180:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   28187:	48 8b 95 50 fe ff ff 	mov    -0x1b0(%rbp),%rdx
   2818e:	48 89 13             	mov    %rdx,(%rbx)
   28191:	49 83 c4 01          	add    $0x1,%r12
   28195:	48 83 c3 10          	add    $0x10,%rbx
   28199:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2819d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   281a3:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   281a7:	49 89 c2             	mov    %rax,%r10
   281aa:	e9 01 d6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   281af:	f3 0f 1e fa          	endbr64
   281b3:	41 0f b6 04 24       	movzbl (%r12),%eax
   281b8:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   281bf:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   281c4:	48 c1 e0 04          	shl    $0x4,%rax
   281c8:	48 03 41 50          	add    0x50(%rcx),%rax
   281cc:	48 8b 10             	mov    (%rax),%rdx
   281cf:	48 8b 40 08          	mov    0x8(%rax),%rax
   281d3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   281d6:	76 04                	jbe    281dc <JS_CallInternal+0x2d4c>
   281d8:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   281dc:	48 92                	xchg   %rax,%rdx
   281de:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   281e5:	45 31 c9             	xor    %r9d,%r9d
   281e8:	4c 89 ef             	mov    %r13,%rdi
   281eb:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   281f2:	48 89 c6             	mov    %rax,%rsi
   281f5:	e8 86 6b 02 00       	call   4ed80 <js_closure>
   281fa:	48 89 03             	mov    %rax,(%rbx)
   281fd:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28201:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   28205:	0f 84 a5 63 00 00    	je     2e5b0 <JS_CallInternal+0x9120>
   2820b:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   28211:	48 83 c3 10          	add    $0x10,%rbx
   28215:	49 83 c4 02          	add    $0x2,%r12
   28219:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2821d:	49 89 c2             	mov    %rax,%r10
   28220:	e9 8b d5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28225:	f3 0f 1e fa          	endbr64
   28229:	41 0f b6 04 24       	movzbl (%r12),%eax
   2822e:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   28235:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28239:	48 c1 e0 04          	shl    $0x4,%rax
   2823d:	48 03 41 50          	add    0x50(%rcx),%rax
   28241:	48 8b 10             	mov    (%rax),%rdx
   28244:	48 8b 40 08          	mov    0x8(%rax),%rax
   28248:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2824b:	76 04                	jbe    28251 <JS_CallInternal+0x2dc1>
   2824d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28251:	48 89 13             	mov    %rdx,(%rbx)
   28254:	49 83 c4 02          	add    $0x2,%r12
   28258:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2825c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28262:	48 89 f3             	mov    %rsi,%rbx
   28265:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28269:	49 89 c2             	mov    %rax,%r10
   2826c:	e9 3f d5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28271:	f3 0f 1e fa          	endbr64
   28275:	41 0f bf 04 24       	movswl (%r12),%eax
   2827a:	48 83 c3 10          	add    $0x10,%rbx
   2827e:	49 83 c4 03          	add    $0x3,%r12
   28282:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   28289:	00 
   2828a:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2828e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28294:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28298:	49 89 c2             	mov    %rax,%r10
   2829b:	e9 10 d5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   282a0:	f3 0f 1e fa          	endbr64
   282a4:	41 0f be 04 24       	movsbl (%r12),%eax
   282a9:	48 83 c3 10          	add    $0x10,%rbx
   282ad:	49 83 c4 02          	add    $0x2,%r12
   282b1:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   282b8:	00 
   282b9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   282bd:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   282c3:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   282c7:	49 89 c2             	mov    %rax,%r10
   282ca:	e9 e1 d4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   282cf:	f3 0f 1e fa          	endbr64
   282d3:	e9 a8 d4 ff ff       	jmp    25780 <JS_CallInternal+0x2f0>
   282d8:	f3 0f 1e fa          	endbr64
   282dc:	e9 9f d4 ff ff       	jmp    25780 <JS_CallInternal+0x2f0>
   282e1:	f3 0f 1e fa          	endbr64
   282e5:	e9 96 d4 ff ff       	jmp    25780 <JS_CallInternal+0x2f0>
   282ea:	f3 0f 1e fa          	endbr64
   282ee:	e9 8d d4 ff ff       	jmp    25780 <JS_CallInternal+0x2f0>
   282f3:	f3 0f 1e fa          	endbr64
   282f7:	e9 84 d4 ff ff       	jmp    25780 <JS_CallInternal+0x2f0>
   282fc:	f3 0f 1e fa          	endbr64
   28300:	e9 7b d4 ff ff       	jmp    25780 <JS_CallInternal+0x2f0>
   28305:	f3 0f 1e fa          	endbr64
   28309:	e9 72 d4 ff ff       	jmp    25780 <JS_CallInternal+0x2f0>
   2830e:	f3 0f 1e fa          	endbr64
   28312:	41 8b 04 24          	mov    (%r12),%eax
   28316:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2831d:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28321:	48 c1 e0 04          	shl    $0x4,%rax
   28325:	48 03 41 50          	add    0x50(%rcx),%rax
   28329:	48 8b 10             	mov    (%rax),%rdx
   2832c:	48 8b 40 08          	mov    0x8(%rax),%rax
   28330:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28333:	76 04                	jbe    28339 <JS_CallInternal+0x2ea9>
   28335:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28339:	48 89 13             	mov    %rdx,(%rbx)
   2833c:	49 83 c4 05          	add    $0x5,%r12
   28340:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28344:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2834a:	48 89 f3             	mov    %rsi,%rbx
   2834d:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28351:	49 89 c2             	mov    %rax,%r10
   28354:	e9 57 d4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28359:	f3 0f 1e fa          	endbr64
   2835d:	49 63 04 24          	movslq (%r12),%rax
   28361:	48 c7 43 08 07 00 00 	movq   $0x7,0x8(%rbx)
   28368:	00 
   28369:	49 83 c4 05          	add    $0x5,%r12
   2836d:	48 83 c3 10          	add    $0x10,%rbx
   28371:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28375:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2837b:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2837f:	49 89 c2             	mov    %rax,%r10
   28382:	e9 29 d4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28387:	f3 0f 1e fa          	endbr64
   2838b:	41 8b 04 24          	mov    (%r12),%eax
   2838f:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   28396:	00 
   28397:	49 83 c4 05          	add    $0x5,%r12
   2839b:	48 83 c3 10          	add    $0x10,%rbx
   2839f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   283a3:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   283a9:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   283ad:	49 89 c2             	mov    %rax,%r10
   283b0:	e9 fb d3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   283b5:	f3 0f 1e fa          	endbr64
   283b9:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   283bd:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   283c1:	4c 89 ef             	mov    %r13,%rdi
   283c4:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   283c8:	e8 53 cb ff ff       	call   24f20 <js_operator_typeof>
   283cd:	83 f8 1b             	cmp    $0x1b,%eax
   283d0:	74 60                	je     28432 <JS_CallInternal+0x2fa2>
   283d2:	49 8b 57 08          	mov    0x8(%r15),%rdx
   283d6:	49 8b 0f             	mov    (%r15),%rcx
   283d9:	83 fa f6             	cmp    $0xfffffff6,%edx
   283dc:	76 11                	jbe    283ef <JS_CallInternal+0x2f5f>
   283de:	8b 41 fc             	mov    -0x4(%rcx),%eax
   283e1:	83 e8 01             	sub    $0x1,%eax
   283e4:	89 41 fc             	mov    %eax,-0x4(%rcx)
   283e7:	85 c0                	test   %eax,%eax
   283e9:	0f 8e 81 43 00 00    	jle    2c770 <JS_CallInternal+0x72e0>
   283ef:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   283f6:	00 
   283f7:	49 83 c4 01          	add    $0x1,%r12
   283fb:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28402:	00 
   28403:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28409:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2840d:	49 89 c2             	mov    %rax,%r10
   28410:	e9 9b d3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28415:	f3 0f 1e fa          	endbr64
   28419:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2841d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28421:	4c 89 ef             	mov    %r13,%rdi
   28424:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   28428:	e8 f3 ca ff ff       	call   24f20 <js_operator_typeof>
   2842d:	83 f8 49             	cmp    $0x49,%eax
   28430:	75 a0                	jne    283d2 <JS_CallInternal+0x2f42>
   28432:	49 8b 47 08          	mov    0x8(%r15),%rax
   28436:	49 8b 17             	mov    (%r15),%rdx
   28439:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2843c:	76 11                	jbe    2844f <JS_CallInternal+0x2fbf>
   2843e:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   28441:	83 e9 01             	sub    $0x1,%ecx
   28444:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   28447:	85 c9                	test   %ecx,%ecx
   28449:	0f 8e 8e 69 00 00    	jle    2eddd <JS_CallInternal+0x994d>
   2844f:	48 c7 43 f0 01 00 00 	movq   $0x1,-0x10(%rbx)
   28456:	00 
   28457:	49 83 c4 01          	add    $0x1,%r12
   2845b:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28462:	00 
   28463:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28469:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2846d:	49 89 c2             	mov    %rax,%r10
   28470:	e9 3b d3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28475:	f3 0f 1e fa          	endbr64
   28479:	83 7b f8 02          	cmpl   $0x2,-0x8(%rbx)
   2847d:	74 d0                	je     2844f <JS_CallInternal+0x2fbf>
   2847f:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   28483:	e9 4a ff ff ff       	jmp    283d2 <JS_CallInternal+0x2f42>
   28488:	f3 0f 1e fa          	endbr64
   2848c:	83 7b f8 03          	cmpl   $0x3,-0x8(%rbx)
   28490:	75 ed                	jne    2847f <JS_CallInternal+0x2fef>
   28492:	eb bb                	jmp    2844f <JS_CallInternal+0x2fbf>
   28494:	f3 0f 1e fa          	endbr64
   28498:	8b 43 f8             	mov    -0x8(%rbx),%eax
   2849b:	83 e8 02             	sub    $0x2,%eax
   2849e:	83 f8 01             	cmp    $0x1,%eax
   284a1:	77 dc                	ja     2847f <JS_CallInternal+0x2fef>
   284a3:	eb aa                	jmp    2844f <JS_CallInternal+0x2fbf>
   284a5:	f3 0f 1e fa          	endbr64
   284a9:	41 0f b6 04 24       	movzbl (%r12),%eax
   284ae:	49 83 c4 01          	add    $0x1,%r12
   284b2:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   284b6:	49 89 c2             	mov    %rax,%r10
   284b9:	e9 f2 d2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   284be:	f3 0f 1e fa          	endbr64
   284c2:	31 c0                	xor    %eax,%eax
   284c4:	b9 03 00 00 00       	mov    $0x3,%ecx
   284c9:	e9 82 d7 ff ff       	jmp    25c50 <JS_CallInternal+0x7c0>
   284ce:	f3 0f 1e fa          	endbr64
   284d2:	b8 03 00 00 00       	mov    $0x3,%eax
   284d7:	31 c9                	xor    %ecx,%ecx
   284d9:	e9 72 d7 ff ff       	jmp    25c50 <JS_CallInternal+0x7c0>
   284de:	f3 0f 1e fa          	endbr64
   284e2:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   284e9:	49 83 c4 01          	add    $0x1,%r12
   284ed:	48 83 c3 10          	add    $0x10,%rbx
   284f1:	48 c7 43 f8 02 00 00 	movq   $0x2,-0x8(%rbx)
   284f8:	00 
   284f9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   284ff:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28503:	49 89 c2             	mov    %rax,%r10
   28506:	e9 a5 d2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2850b:	f3 0f 1e fa          	endbr64
   2850f:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   28516:	49 83 c4 01          	add    $0x1,%r12
   2851a:	48 83 c3 10          	add    $0x10,%rbx
   2851e:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   28525:	00 
   28526:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2852c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28530:	49 89 c2             	mov    %rax,%r10
   28533:	e9 78 d2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28538:	f3 0f 1e fa          	endbr64
   2853c:	41 8b 34 24          	mov    (%r12),%esi
   28540:	31 d2                	xor    %edx,%edx
   28542:	4c 89 ef             	mov    %r13,%rdi
   28545:	48 83 c3 10          	add    $0x10,%rbx
   28549:	49 83 c4 05          	add    $0x5,%r12
   2854d:	e8 6e 39 01 00       	call   3bec0 <__JS_AtomToValue>
   28552:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28556:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2855a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28560:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28564:	49 89 c2             	mov    %rax,%r10
   28567:	e9 44 d2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2856c:	f3 0f 1e fa          	endbr64
   28570:	ba 01 00 00 00       	mov    $0x1,%edx
   28575:	4c 89 ef             	mov    %r13,%rdi
   28578:	48 83 c3 10          	add    $0x10,%rbx
   2857c:	49 83 c4 01          	add    $0x1,%r12
   28580:	be 2f 00 00 00       	mov    $0x2f,%esi
   28585:	e8 36 39 01 00       	call   3bec0 <__JS_AtomToValue>
   2858a:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2858e:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   28592:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28598:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2859c:	49 89 c2             	mov    %rax,%r10
   2859f:	e9 0c d2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   285a4:	f3 0f 1e fa          	endbr64
   285a8:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   285af:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   285b3:	48 8b 40 10          	mov    0x10(%rax),%rax
   285b7:	48 8b 40 18          	mov    0x18(%rax),%rax
   285bb:	48 8b 10             	mov    (%rax),%rdx
   285be:	48 8b 40 08          	mov    0x8(%rax),%rax
   285c2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   285c5:	76 04                	jbe    285cb <JS_CallInternal+0x313b>
   285c7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   285cb:	48 89 13             	mov    %rdx,(%rbx)
   285ce:	49 83 c4 01          	add    $0x1,%r12
   285d2:	48 89 43 08          	mov    %rax,0x8(%rbx)
   285d6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   285dc:	48 89 f3             	mov    %rsi,%rbx
   285df:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   285e3:	49 89 c2             	mov    %rax,%r10
   285e6:	e9 c5 d1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   285eb:	f3 0f 1e fa          	endbr64
   285ef:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   285f6:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   285fa:	48 8b 40 08          	mov    0x8(%rax),%rax
   285fe:	48 8b 40 18          	mov    0x18(%rax),%rax
   28602:	48 8b 10             	mov    (%rax),%rdx
   28605:	48 8b 40 08          	mov    0x8(%rax),%rax
   28609:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2860c:	76 04                	jbe    28612 <JS_CallInternal+0x3182>
   2860e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28612:	48 89 13             	mov    %rdx,(%rbx)
   28615:	49 83 c4 01          	add    $0x1,%r12
   28619:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2861d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28623:	48 89 f3             	mov    %rsi,%rbx
   28626:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2862a:	49 89 c2             	mov    %rax,%r10
   2862d:	e9 7e d1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28632:	f3 0f 1e fa          	endbr64
   28636:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2863d:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28641:	48 8b 00             	mov    (%rax),%rax
   28644:	48 8b 40 18          	mov    0x18(%rax),%rax
   28648:	48 8b 10             	mov    (%rax),%rdx
   2864b:	48 8b 40 08          	mov    0x8(%rax),%rax
   2864f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28652:	76 04                	jbe    28658 <JS_CallInternal+0x31c8>
   28654:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28658:	48 89 13             	mov    %rdx,(%rbx)
   2865b:	49 83 c4 01          	add    $0x1,%r12
   2865f:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28663:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28669:	48 89 f3             	mov    %rsi,%rbx
   2866c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28670:	49 89 c2             	mov    %rax,%r10
   28673:	e9 38 d1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28678:	f3 0f 1e fa          	endbr64
   2867c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28680:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28684:	83 fa f6             	cmp    $0xfffffff6,%edx
   28687:	76 04                	jbe    2868d <JS_CallInternal+0x31fd>
   28689:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2868d:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   28694:	48 8b 47 38          	mov    0x38(%rdi),%rax
   28698:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   2869c:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   286a0:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   286a4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   286a7:	76 11                	jbe    286ba <JS_CallInternal+0x322a>
   286a9:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   286ac:	8d 51 ff             	lea    -0x1(%rcx),%edx
   286af:	89 56 fc             	mov    %edx,-0x4(%rsi)
   286b2:	85 d2                	test   %edx,%edx
   286b4:	0f 8e cb 55 00 00    	jle    2dc85 <JS_CallInternal+0x87f5>
   286ba:	41 0f b6 04 24       	movzbl (%r12),%eax
   286bf:	49 83 c4 01          	add    $0x1,%r12
   286c3:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   286c7:	49 89 c2             	mov    %rax,%r10
   286ca:	e9 e1 d0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   286cf:	f3 0f 1e fa          	endbr64
   286d3:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   286d7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   286db:	83 fa f6             	cmp    $0xfffffff6,%edx
   286de:	76 04                	jbe    286e4 <JS_CallInternal+0x3254>
   286e0:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   286e4:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   286eb:	48 8b 47 28          	mov    0x28(%rdi),%rax
   286ef:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   286f3:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   286f7:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   286fb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   286fe:	76 11                	jbe    28711 <JS_CallInternal+0x3281>
   28700:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28703:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28706:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28709:	85 d2                	test   %edx,%edx
   2870b:	0f 8e f1 51 00 00    	jle    2d902 <JS_CallInternal+0x8472>
   28711:	41 0f b6 04 24       	movzbl (%r12),%eax
   28716:	49 83 c4 01          	add    $0x1,%r12
   2871a:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2871e:	49 89 c2             	mov    %rax,%r10
   28721:	e9 8a d0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28726:	f3 0f 1e fa          	endbr64
   2872a:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2872e:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28732:	83 fa f6             	cmp    $0xfffffff6,%edx
   28735:	76 04                	jbe    2873b <JS_CallInternal+0x32ab>
   28737:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2873b:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   28742:	48 8b 47 08          	mov    0x8(%rdi),%rax
   28746:	48 8b 37             	mov    (%rdi),%rsi
   28749:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   2874d:	48 89 0f             	mov    %rcx,(%rdi)
   28750:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28753:	76 11                	jbe    28766 <JS_CallInternal+0x32d6>
   28755:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28758:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2875b:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2875e:	85 d2                	test   %edx,%edx
   28760:	0f 8e be 51 00 00    	jle    2d924 <JS_CallInternal+0x8494>
   28766:	41 0f b6 04 24       	movzbl (%r12),%eax
   2876b:	49 83 c4 01          	add    $0x1,%r12
   2876f:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28773:	49 89 c2             	mov    %rax,%r10
   28776:	e9 35 d0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2877b:	f3 0f 1e fa          	endbr64
   2877f:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28783:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28787:	83 fa f6             	cmp    $0xfffffff6,%edx
   2878a:	76 04                	jbe    28790 <JS_CallInternal+0x3300>
   2878c:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28790:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   28797:	48 8b 47 18          	mov    0x18(%rdi),%rax
   2879b:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   2879f:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   287a3:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   287a7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   287aa:	76 11                	jbe    287bd <JS_CallInternal+0x332d>
   287ac:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   287af:	8d 51 ff             	lea    -0x1(%rcx),%edx
   287b2:	89 56 fc             	mov    %edx,-0x4(%rsi)
   287b5:	85 d2                	test   %edx,%edx
   287b7:	0f 8e 56 51 00 00    	jle    2d913 <JS_CallInternal+0x8483>
   287bd:	41 0f b6 04 24       	movzbl (%r12),%eax
   287c2:	49 83 c4 01          	add    $0x1,%r12
   287c6:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   287ca:	49 89 c2             	mov    %rax,%r10
   287cd:	e9 de cf ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   287d2:	f3 0f 1e fa          	endbr64
   287d6:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   287dd:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   287e2:	48 83 eb 10          	sub    $0x10,%rbx
   287e6:	48 8b 42 38          	mov    0x38(%rdx),%rax
   287ea:	48 8b 4a 30          	mov    0x30(%rdx),%rcx
   287ee:	0f 11 42 30          	movups %xmm0,0x30(%rdx)
   287f2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   287f5:	76 11                	jbe    28808 <JS_CallInternal+0x3378>
   287f7:	8b 71 fc             	mov    -0x4(%rcx),%esi
   287fa:	8d 56 ff             	lea    -0x1(%rsi),%edx
   287fd:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28800:	85 d2                	test   %edx,%edx
   28802:	0f 8e 2d 51 00 00    	jle    2d935 <JS_CallInternal+0x84a5>
   28808:	41 0f b6 04 24       	movzbl (%r12),%eax
   2880d:	49 83 c4 01          	add    $0x1,%r12
   28811:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28815:	49 89 c2             	mov    %rax,%r10
   28818:	e9 93 cf ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2881d:	f3 0f 1e fa          	endbr64
   28821:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   28828:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2882d:	48 83 eb 10          	sub    $0x10,%rbx
   28831:	48 8b 42 28          	mov    0x28(%rdx),%rax
   28835:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
   28839:	0f 11 42 20          	movups %xmm0,0x20(%rdx)
   2883d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28840:	76 11                	jbe    28853 <JS_CallInternal+0x33c3>
   28842:	8b 51 fc             	mov    -0x4(%rcx),%edx
   28845:	83 ea 01             	sub    $0x1,%edx
   28848:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2884b:	85 d2                	test   %edx,%edx
   2884d:	0f 8e 87 50 00 00    	jle    2d8da <JS_CallInternal+0x844a>
   28853:	41 0f b6 04 24       	movzbl (%r12),%eax
   28858:	49 83 c4 01          	add    $0x1,%r12
   2885c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28860:	49 89 c2             	mov    %rax,%r10
   28863:	e9 48 cf ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28868:	f3 0f 1e fa          	endbr64
   2886c:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   28873:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28878:	48 83 eb 10          	sub    $0x10,%rbx
   2887c:	48 8b 42 08          	mov    0x8(%rdx),%rax
   28880:	48 8b 0a             	mov    (%rdx),%rcx
   28883:	0f 11 02             	movups %xmm0,(%rdx)
   28886:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28889:	76 11                	jbe    2889c <JS_CallInternal+0x340c>
   2888b:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2888e:	83 ea 01             	sub    $0x1,%edx
   28891:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28894:	85 d2                	test   %edx,%edx
   28896:	0f 8e 2a 50 00 00    	jle    2d8c6 <JS_CallInternal+0x8436>
   2889c:	41 0f b6 04 24       	movzbl (%r12),%eax
   288a1:	49 83 c4 01          	add    $0x1,%r12
   288a5:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   288a9:	49 89 c2             	mov    %rax,%r10
   288ac:	e9 ff ce ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   288b1:	f3 0f 1e fa          	endbr64
   288b5:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   288bc:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   288c1:	48 83 eb 10          	sub    $0x10,%rbx
   288c5:	48 8b 42 18          	mov    0x18(%rdx),%rax
   288c9:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   288cd:	0f 11 42 10          	movups %xmm0,0x10(%rdx)
   288d1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   288d4:	76 11                	jbe    288e7 <JS_CallInternal+0x3457>
   288d6:	8b 71 fc             	mov    -0x4(%rcx),%esi
   288d9:	8d 56 ff             	lea    -0x1(%rsi),%edx
   288dc:	89 51 fc             	mov    %edx,-0x4(%rcx)
   288df:	85 d2                	test   %edx,%edx
   288e1:	0f 8e 07 50 00 00    	jle    2d8ee <JS_CallInternal+0x845e>
   288e7:	41 0f b6 04 24       	movzbl (%r12),%eax
   288ec:	49 83 c4 01          	add    $0x1,%r12
   288f0:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   288f4:	49 89 c2             	mov    %rax,%r10
   288f7:	e9 b4 ce ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   288fc:	f3 0f 1e fa          	endbr64
   28900:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   28907:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   2890b:	48 8b 50 30          	mov    0x30(%rax),%rdx
   2890f:	48 8b 40 38          	mov    0x38(%rax),%rax
   28913:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28916:	76 04                	jbe    2891c <JS_CallInternal+0x348c>
   28918:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2891c:	48 89 13             	mov    %rdx,(%rbx)
   2891f:	49 83 c4 01          	add    $0x1,%r12
   28923:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28927:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2892d:	48 89 f3             	mov    %rsi,%rbx
   28930:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28934:	49 89 c2             	mov    %rax,%r10
   28937:	e9 74 ce ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2893c:	f3 0f 1e fa          	endbr64
   28940:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   28947:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   2894b:	48 8b 50 20          	mov    0x20(%rax),%rdx
   2894f:	48 8b 40 28          	mov    0x28(%rax),%rax
   28953:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28956:	76 04                	jbe    2895c <JS_CallInternal+0x34cc>
   28958:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2895c:	48 89 13             	mov    %rdx,(%rbx)
   2895f:	49 83 c4 01          	add    $0x1,%r12
   28963:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28967:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2896d:	48 89 f3             	mov    %rsi,%rbx
   28970:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28974:	49 89 c2             	mov    %rax,%r10
   28977:	e9 34 ce ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2897c:	f3 0f 1e fa          	endbr64
   28980:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   28987:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   2898b:	48 8b 50 10          	mov    0x10(%rax),%rdx
   2898f:	48 8b 40 18          	mov    0x18(%rax),%rax
   28993:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28996:	76 04                	jbe    2899c <JS_CallInternal+0x350c>
   28998:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2899c:	48 89 13             	mov    %rdx,(%rbx)
   2899f:	49 83 c4 01          	add    $0x1,%r12
   289a3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   289a7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   289ad:	48 89 f3             	mov    %rsi,%rbx
   289b0:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   289b4:	49 89 c2             	mov    %rax,%r10
   289b7:	e9 f4 cd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   289bc:	f3 0f 1e fa          	endbr64
   289c0:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   289c7:	48 8b 10             	mov    (%rax),%rdx
   289ca:	48 8b 40 08          	mov    0x8(%rax),%rax
   289ce:	83 f8 ff             	cmp    $0xffffffff,%eax
   289d1:	0f 84 f1 43 00 00    	je     2cdc8 <JS_CallInternal+0x7938>
   289d7:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   289db:	83 f8 f6             	cmp    $0xfffffff6,%eax
   289de:	76 04                	jbe    289e4 <JS_CallInternal+0x3554>
   289e0:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   289e4:	48 89 43 08          	mov    %rax,0x8(%rbx)
   289e8:	4c 89 e0             	mov    %r12,%rax
   289eb:	48 89 13             	mov    %rdx,(%rbx)
   289ee:	48 89 cb             	mov    %rcx,%rbx
   289f1:	4c 8d 60 01          	lea    0x1(%rax),%r12
   289f5:	0f b6 00             	movzbl (%rax),%eax
   289f8:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   289fc:	49 89 c2             	mov    %rax,%r10
   289ff:	e9 ac cd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28a04:	f3 0f 1e fa          	endbr64
   28a08:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   28a0f:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28a13:	48 8b 10             	mov    (%rax),%rdx
   28a16:	48 8b 40 08          	mov    0x8(%rax),%rax
   28a1a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a1d:	76 04                	jbe    28a23 <JS_CallInternal+0x3593>
   28a1f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28a23:	48 89 13             	mov    %rdx,(%rbx)
   28a26:	49 83 c4 01          	add    $0x1,%r12
   28a2a:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28a2e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28a34:	48 89 f3             	mov    %rsi,%rbx
   28a37:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28a3b:	49 89 c2             	mov    %rax,%r10
   28a3e:	e9 6d cd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28a43:	f3 0f 1e fa          	endbr64
   28a47:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28a4b:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28a4f:	83 fa f6             	cmp    $0xfffffff6,%edx
   28a52:	76 04                	jbe    28a58 <JS_CallInternal+0x35c8>
   28a54:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28a58:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   28a5f:	48 8b 47 38          	mov    0x38(%rdi),%rax
   28a63:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   28a67:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   28a6b:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   28a6f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a72:	76 11                	jbe    28a85 <JS_CallInternal+0x35f5>
   28a74:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28a77:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28a7a:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28a7d:	85 d2                	test   %edx,%edx
   28a7f:	0f 8e 19 4f 00 00    	jle    2d99e <JS_CallInternal+0x850e>
   28a85:	41 0f b6 04 24       	movzbl (%r12),%eax
   28a8a:	49 83 c4 01          	add    $0x1,%r12
   28a8e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28a92:	49 89 c2             	mov    %rax,%r10
   28a95:	e9 16 cd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28a9a:	f3 0f 1e fa          	endbr64
   28a9e:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   28aa5:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28aa9:	48 8b 50 30          	mov    0x30(%rax),%rdx
   28aad:	48 8b 40 38          	mov    0x38(%rax),%rax
   28ab1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28ab4:	76 04                	jbe    28aba <JS_CallInternal+0x362a>
   28ab6:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28aba:	48 89 13             	mov    %rdx,(%rbx)
   28abd:	49 83 c4 01          	add    $0x1,%r12
   28ac1:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28ac5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28acb:	48 89 f3             	mov    %rsi,%rbx
   28ace:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28ad2:	49 89 c2             	mov    %rax,%r10
   28ad5:	e9 d6 cc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28ada:	f3 0f 1e fa          	endbr64
   28ade:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   28ae5:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28ae9:	48 8b 50 20          	mov    0x20(%rax),%rdx
   28aed:	48 8b 40 28          	mov    0x28(%rax),%rax
   28af1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28af4:	76 04                	jbe    28afa <JS_CallInternal+0x366a>
   28af6:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28afa:	48 89 13             	mov    %rdx,(%rbx)
   28afd:	49 83 c4 01          	add    $0x1,%r12
   28b01:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28b05:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28b0b:	48 89 f3             	mov    %rsi,%rbx
   28b0e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28b12:	49 89 c2             	mov    %rax,%r10
   28b15:	e9 96 cc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28b1a:	f3 0f 1e fa          	endbr64
   28b1e:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   28b25:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28b29:	48 8b 50 10          	mov    0x10(%rax),%rdx
   28b2d:	48 8b 40 18          	mov    0x18(%rax),%rax
   28b31:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28b34:	76 04                	jbe    28b3a <JS_CallInternal+0x36aa>
   28b36:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28b3a:	48 89 13             	mov    %rdx,(%rbx)
   28b3d:	49 83 c4 01          	add    $0x1,%r12
   28b41:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28b45:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28b4b:	48 89 f3             	mov    %rsi,%rbx
   28b4e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28b52:	49 89 c2             	mov    %rax,%r10
   28b55:	e9 56 cc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28b5a:	f3 0f 1e fa          	endbr64
   28b5e:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   28b65:	48 8b 10             	mov    (%rax),%rdx
   28b68:	48 8b 40 08          	mov    0x8(%rax),%rax
   28b6c:	83 f8 ff             	cmp    $0xffffffff,%eax
   28b6f:	0f 84 51 41 00 00    	je     2ccc6 <JS_CallInternal+0x7836>
   28b75:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28b79:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28b7c:	76 04                	jbe    28b82 <JS_CallInternal+0x36f2>
   28b7e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28b82:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28b86:	4c 89 e0             	mov    %r12,%rax
   28b89:	48 89 13             	mov    %rdx,(%rbx)
   28b8c:	48 89 cb             	mov    %rcx,%rbx
   28b8f:	4c 8d 60 01          	lea    0x1(%rax),%r12
   28b93:	0f b6 00             	movzbl (%rax),%eax
   28b96:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28b9a:	49 89 c2             	mov    %rax,%r10
   28b9d:	e9 0e cc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28ba2:	f3 0f 1e fa          	endbr64
   28ba6:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   28bad:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28bb1:	48 8b 10             	mov    (%rax),%rdx
   28bb4:	48 8b 40 08          	mov    0x8(%rax),%rax
   28bb8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28bbb:	76 04                	jbe    28bc1 <JS_CallInternal+0x3731>
   28bbd:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28bc1:	48 89 13             	mov    %rdx,(%rbx)
   28bc4:	49 83 c4 01          	add    $0x1,%r12
   28bc8:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28bcc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28bd2:	48 89 f3             	mov    %rsi,%rbx
   28bd5:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28bd9:	49 89 c2             	mov    %rax,%r10
   28bdc:	e9 cf cb ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28be1:	f3 0f 1e fa          	endbr64
   28be5:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28be9:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28bed:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28bf0:	76 04                	jbe    28bf6 <JS_CallInternal+0x3766>
   28bf2:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28bf6:	41 0f b6 04 24       	movzbl (%r12),%eax
   28bfb:	48 c1 e0 04          	shl    $0x4,%rax
   28bff:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28c06:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28c0a:	48 8b 38             	mov    (%rax),%rdi
   28c0d:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28c11:	48 89 30             	mov    %rsi,(%rax)
   28c14:	83 fa f6             	cmp    $0xfffffff6,%edx
   28c17:	76 11                	jbe    28c2a <JS_CallInternal+0x379a>
   28c19:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28c1c:	83 e8 01             	sub    $0x1,%eax
   28c1f:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28c22:	85 c0                	test   %eax,%eax
   28c24:	0f 8e 14 51 00 00    	jle    2dd3e <JS_CallInternal+0x88ae>
   28c2a:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   28c30:	49 83 c4 02          	add    $0x2,%r12
   28c34:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28c38:	49 89 c2             	mov    %rax,%r10
   28c3b:	e9 70 cb ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28c40:	f3 0f 1e fa          	endbr64
   28c44:	41 0f b6 04 24       	movzbl (%r12),%eax
   28c49:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28c4e:	48 83 eb 10          	sub    $0x10,%rbx
   28c52:	48 c1 e0 04          	shl    $0x4,%rax
   28c56:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28c5d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28c61:	48 8b 08             	mov    (%rax),%rcx
   28c64:	0f 11 00             	movups %xmm0,(%rax)
   28c67:	83 fa f6             	cmp    $0xfffffff6,%edx
   28c6a:	76 11                	jbe    28c7d <JS_CallInternal+0x37ed>
   28c6c:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28c6f:	83 e8 01             	sub    $0x1,%eax
   28c72:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28c75:	85 c0                	test   %eax,%eax
   28c77:	0f 8e 93 4d 00 00    	jle    2da10 <JS_CallInternal+0x8580>
   28c7d:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   28c83:	49 83 c4 02          	add    $0x2,%r12
   28c87:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28c8b:	49 89 c2             	mov    %rax,%r10
   28c8e:	e9 1d cb ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28c93:	f3 0f 1e fa          	endbr64
   28c97:	41 0f b6 04 24       	movzbl (%r12),%eax
   28c9c:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   28ca0:	48 c1 e0 04          	shl    $0x4,%rax
   28ca4:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28cab:	48 8b 10             	mov    (%rax),%rdx
   28cae:	48 8b 40 08          	mov    0x8(%rax),%rax
   28cb2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28cb5:	76 04                	jbe    28cbb <JS_CallInternal+0x382b>
   28cb7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28cbb:	48 89 13             	mov    %rdx,(%rbx)
   28cbe:	49 83 c4 02          	add    $0x2,%r12
   28cc2:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28cc6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28ccc:	48 89 f3             	mov    %rsi,%rbx
   28ccf:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28cd3:	49 89 c2             	mov    %rax,%r10
   28cd6:	e9 d5 ca ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28cdb:	f3 0f 1e fa          	endbr64
   28cdf:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   28ce6:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28ceb:	48 83 eb 10          	sub    $0x10,%rbx
   28cef:	48 8b 42 38          	mov    0x38(%rdx),%rax
   28cf3:	48 8b 4a 30          	mov    0x30(%rdx),%rcx
   28cf7:	0f 11 42 30          	movups %xmm0,0x30(%rdx)
   28cfb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28cfe:	76 11                	jbe    28d11 <JS_CallInternal+0x3881>
   28d00:	8b 71 fc             	mov    -0x4(%rcx),%esi
   28d03:	8d 56 ff             	lea    -0x1(%rsi),%edx
   28d06:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28d09:	85 d2                	test   %edx,%edx
   28d0b:	0f 8e eb 4c 00 00    	jle    2d9fc <JS_CallInternal+0x856c>
   28d11:	41 0f b6 04 24       	movzbl (%r12),%eax
   28d16:	49 83 c4 01          	add    $0x1,%r12
   28d1a:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28d1e:	49 89 c2             	mov    %rax,%r10
   28d21:	e9 8a ca ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28d26:	f3 0f 1e fa          	endbr64
   28d2a:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   28d31:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28d36:	48 83 eb 10          	sub    $0x10,%rbx
   28d3a:	48 8b 42 28          	mov    0x28(%rdx),%rax
   28d3e:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
   28d42:	0f 11 42 20          	movups %xmm0,0x20(%rdx)
   28d46:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28d49:	76 11                	jbe    28d5c <JS_CallInternal+0x38cc>
   28d4b:	8b 51 fc             	mov    -0x4(%rcx),%edx
   28d4e:	83 ea 01             	sub    $0x1,%edx
   28d51:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28d54:	85 d2                	test   %edx,%edx
   28d56:	0f 8e 8c 4c 00 00    	jle    2d9e8 <JS_CallInternal+0x8558>
   28d5c:	41 0f b6 04 24       	movzbl (%r12),%eax
   28d61:	49 83 c4 01          	add    $0x1,%r12
   28d65:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28d69:	49 89 c2             	mov    %rax,%r10
   28d6c:	e9 3f ca ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28d71:	f3 0f 1e fa          	endbr64
   28d75:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   28d7c:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28d81:	48 83 eb 10          	sub    $0x10,%rbx
   28d85:	48 8b 42 18          	mov    0x18(%rdx),%rax
   28d89:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   28d8d:	0f 11 42 10          	movups %xmm0,0x10(%rdx)
   28d91:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28d94:	76 11                	jbe    28da7 <JS_CallInternal+0x3917>
   28d96:	8b 71 fc             	mov    -0x4(%rcx),%esi
   28d99:	8d 56 ff             	lea    -0x1(%rsi),%edx
   28d9c:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28d9f:	85 d2                	test   %edx,%edx
   28da1:	0f 8e 2d 4c 00 00    	jle    2d9d4 <JS_CallInternal+0x8544>
   28da7:	41 0f b6 04 24       	movzbl (%r12),%eax
   28dac:	49 83 c4 01          	add    $0x1,%r12
   28db0:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28db4:	49 89 c2             	mov    %rax,%r10
   28db7:	e9 f4 c9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28dbc:	f3 0f 1e fa          	endbr64
   28dc0:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   28dc7:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28dcc:	48 83 eb 10          	sub    $0x10,%rbx
   28dd0:	48 8b 42 08          	mov    0x8(%rdx),%rax
   28dd4:	48 8b 0a             	mov    (%rdx),%rcx
   28dd7:	0f 11 02             	movups %xmm0,(%rdx)
   28dda:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28ddd:	76 11                	jbe    28df0 <JS_CallInternal+0x3960>
   28ddf:	8b 51 fc             	mov    -0x4(%rcx),%edx
   28de2:	83 ea 01             	sub    $0x1,%edx
   28de5:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28de8:	85 d2                	test   %edx,%edx
   28dea:	0f 8e d0 4b 00 00    	jle    2d9c0 <JS_CallInternal+0x8530>
   28df0:	41 0f b6 04 24       	movzbl (%r12),%eax
   28df5:	49 83 c4 01          	add    $0x1,%r12
   28df9:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28dfd:	49 89 c2             	mov    %rax,%r10
   28e00:	e9 ab c9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28e05:	f3 0f 1e fa          	endbr64
   28e09:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28e0d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28e11:	83 fa f6             	cmp    $0xfffffff6,%edx
   28e14:	76 04                	jbe    28e1a <JS_CallInternal+0x398a>
   28e16:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28e1a:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   28e21:	48 8b 47 18          	mov    0x18(%rdi),%rax
   28e25:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   28e29:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   28e2d:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   28e31:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28e34:	76 11                	jbe    28e47 <JS_CallInternal+0x39b7>
   28e36:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28e39:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28e3c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28e3f:	85 d2                	test   %edx,%edx
   28e41:	0f 8e 68 4b 00 00    	jle    2d9af <JS_CallInternal+0x851f>
   28e47:	41 0f b6 04 24       	movzbl (%r12),%eax
   28e4c:	49 83 c4 01          	add    $0x1,%r12
   28e50:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28e54:	49 89 c2             	mov    %rax,%r10
   28e57:	e9 54 c9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28e5c:	f3 0f 1e fa          	endbr64
   28e60:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28e64:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28e68:	83 fa f6             	cmp    $0xfffffff6,%edx
   28e6b:	76 04                	jbe    28e71 <JS_CallInternal+0x39e1>
   28e6d:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28e71:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   28e78:	48 8b 47 08          	mov    0x8(%rdi),%rax
   28e7c:	48 8b 37             	mov    (%rdi),%rsi
   28e7f:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   28e83:	48 89 0f             	mov    %rcx,(%rdi)
   28e86:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28e89:	76 11                	jbe    28e9c <JS_CallInternal+0x3a0c>
   28e8b:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28e8e:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28e91:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28e94:	85 d2                	test   %edx,%edx
   28e96:	0f 8e f1 4a 00 00    	jle    2d98d <JS_CallInternal+0x84fd>
   28e9c:	41 0f b6 04 24       	movzbl (%r12),%eax
   28ea1:	49 83 c4 01          	add    $0x1,%r12
   28ea5:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28ea9:	49 89 c2             	mov    %rax,%r10
   28eac:	e9 ff c8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28eb1:	f3 0f 1e fa          	endbr64
   28eb5:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28eb9:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28ebd:	83 fa f6             	cmp    $0xfffffff6,%edx
   28ec0:	76 04                	jbe    28ec6 <JS_CallInternal+0x3a36>
   28ec2:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28ec6:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   28ecd:	48 8b 47 28          	mov    0x28(%rdi),%rax
   28ed1:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   28ed5:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   28ed9:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   28edd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28ee0:	76 11                	jbe    28ef3 <JS_CallInternal+0x3a63>
   28ee2:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28ee5:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28ee8:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28eeb:	85 d2                	test   %edx,%edx
   28eed:	0f 8e 36 4c 00 00    	jle    2db29 <JS_CallInternal+0x8699>
   28ef3:	41 0f b6 04 24       	movzbl (%r12),%eax
   28ef8:	49 83 c4 01          	add    $0x1,%r12
   28efc:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28f00:	49 89 c2             	mov    %rax,%r10
   28f03:	e9 a8 c8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28f08:	f3 0f 1e fa          	endbr64
   28f0c:	41 0f b7 04 24       	movzwl (%r12),%eax
   28f11:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28f16:	48 c1 e0 04          	shl    $0x4,%rax
   28f1a:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28f21:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28f25:	48 8b 08             	mov    (%rax),%rcx
   28f28:	0f 11 00             	movups %xmm0,(%rax)
   28f2b:	83 fa f6             	cmp    $0xfffffff6,%edx
   28f2e:	76 11                	jbe    28f41 <JS_CallInternal+0x3ab1>
   28f30:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28f33:	83 e8 01             	sub    $0x1,%eax
   28f36:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28f39:	85 c0                	test   %eax,%eax
   28f3b:	0f 8e d7 4b 00 00    	jle    2db18 <JS_CallInternal+0x8688>
   28f41:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28f47:	48 83 eb 10          	sub    $0x10,%rbx
   28f4b:	49 83 c4 03          	add    $0x3,%r12
   28f4f:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28f53:	49 89 c2             	mov    %rax,%r10
   28f56:	e9 55 c8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28f5b:	f3 0f 1e fa          	endbr64
   28f5f:	41 0f b7 04 24       	movzwl (%r12),%eax
   28f64:	48 c1 e0 04          	shl    $0x4,%rax
   28f68:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28f6f:	48 8b 10             	mov    (%rax),%rdx
   28f72:	48 8b 40 08          	mov    0x8(%rax),%rax
   28f76:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28f79:	76 04                	jbe    28f7f <JS_CallInternal+0x3aef>
   28f7b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28f7f:	48 89 13             	mov    %rdx,(%rbx)
   28f82:	49 83 c4 03          	add    $0x3,%r12
   28f86:	48 83 c3 10          	add    $0x10,%rbx
   28f8a:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28f8e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28f94:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28f98:	49 89 c2             	mov    %rax,%r10
   28f9b:	e9 10 c8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28fa0:	f3 0f 1e fa          	endbr64
   28fa4:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28fa8:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   28fac:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   28fb1:	83 fa 03             	cmp    $0x3,%edx
   28fb4:	0f 87 ec 3c 00 00    	ja     2cca6 <JS_CallInternal+0x7816>
   28fba:	48 83 eb 10          	sub    $0x10,%rbx
   28fbe:	85 c0                	test   %eax,%eax
   28fc0:	75 0d                	jne    28fcf <JS_CallInternal+0x3b3f>
   28fc2:	41 0f be 04 24       	movsbl (%r12),%eax
   28fc7:	83 e8 01             	sub    $0x1,%eax
   28fca:	48 98                	cltq
   28fcc:	49 01 c7             	add    %rax,%r15
   28fcf:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   28fd6:	83 e8 01             	sub    $0x1,%eax
   28fd9:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   28fe0:	85 c0                	test   %eax,%eax
   28fe2:	0f 8e b0 53 00 00    	jle    2e398 <JS_CallInternal+0x8f08>
   28fe8:	41 0f b6 07          	movzbl (%r15),%eax
   28fec:	4d 8d 67 01          	lea    0x1(%r15),%r12
   28ff0:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   28ff4:	49 89 c2             	mov    %rax,%r10
   28ff7:	e9 b4 c7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   28ffc:	f3 0f 1e fa          	endbr64
   29000:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29004:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29008:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2900d:	83 fa 03             	cmp    $0x3,%edx
   29010:	0f 87 80 3c 00 00    	ja     2cc96 <JS_CallInternal+0x7806>
   29016:	48 83 eb 10          	sub    $0x10,%rbx
   2901a:	85 c0                	test   %eax,%eax
   2901c:	74 0d                	je     2902b <JS_CallInternal+0x3b9b>
   2901e:	41 0f be 04 24       	movsbl (%r12),%eax
   29023:	83 e8 01             	sub    $0x1,%eax
   29026:	48 98                	cltq
   29028:	49 01 c7             	add    %rax,%r15
   2902b:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   29032:	83 e8 01             	sub    $0x1,%eax
   29035:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2903c:	85 c0                	test   %eax,%eax
   2903e:	0f 8e 3c 53 00 00    	jle    2e380 <JS_CallInternal+0x8ef0>
   29044:	41 0f b6 07          	movzbl (%r15),%eax
   29048:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2904c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29050:	49 89 c2             	mov    %rax,%r10
   29053:	e9 58 c7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29058:	f3 0f 1e fa          	endbr64
   2905c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29060:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29064:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   29069:	83 fa 03             	cmp    $0x3,%edx
   2906c:	0f 87 14 3c 00 00    	ja     2cc86 <JS_CallInternal+0x77f6>
   29072:	48 83 eb 10          	sub    $0x10,%rbx
   29076:	85 c0                	test   %eax,%eax
   29078:	75 0c                	jne    29086 <JS_CallInternal+0x3bf6>
   2907a:	41 8b 04 24          	mov    (%r12),%eax
   2907e:	83 e8 04             	sub    $0x4,%eax
   29081:	48 98                	cltq
   29083:	49 01 c7             	add    %rax,%r15
   29086:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2908d:	83 e8 01             	sub    $0x1,%eax
   29090:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   29097:	85 c0                	test   %eax,%eax
   29099:	0f 8e 81 57 00 00    	jle    2e820 <JS_CallInternal+0x9390>
   2909f:	41 0f b6 07          	movzbl (%r15),%eax
   290a3:	4d 8d 67 01          	lea    0x1(%r15),%r12
   290a7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   290ab:	49 89 c2             	mov    %rax,%r10
   290ae:	e9 fd c6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   290b3:	f3 0f 1e fa          	endbr64
   290b7:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   290bb:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   290bf:	83 f8 03             	cmp    $0x3,%eax
   290c2:	0f 87 ee 3c 00 00    	ja     2cdb6 <JS_CallInternal+0x7926>
   290c8:	31 c0                	xor    %eax,%eax
   290ca:	85 d2                	test   %edx,%edx
   290cc:	0f 95 c0             	setne  %al
   290cf:	85 c0                	test   %eax,%eax
   290d1:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   290d8:	00 
   290d9:	0f 94 c0             	sete   %al
   290dc:	49 83 c4 01          	add    $0x1,%r12
   290e0:	0f b6 c0             	movzbl %al,%eax
   290e3:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   290e7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   290ed:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   290f1:	49 89 c2             	mov    %rax,%r10
   290f4:	e9 b7 c6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   290f9:	f3 0f 1e fa          	endbr64
   290fd:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   29102:	48 8b 73 c0          	mov    -0x40(%rbx),%rsi
   29106:	48 8b 53 c8          	mov    -0x38(%rbx),%rdx
   2910a:	4c 89 ef             	mov    %r13,%rdi
   2910d:	45 0f b6 14 24       	movzbl (%r12),%r10d
   29112:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29119:	49 89 f0             	mov    %rsi,%r8
   2911c:	49 89 d1             	mov    %rdx,%r9
   2911f:	4c 89 78 30          	mov    %r15,0x30(%rax)
   29123:	44 89 d0             	mov    %r10d,%eax
   29126:	83 e0 01             	and    $0x1,%eax
   29129:	44 88 95 30 fe ff ff 	mov    %r10b,-0x1d0(%rbp)
   29130:	3c 01                	cmp    $0x1,%al
   29132:	19 c9                	sbb    %ecx,%ecx
   29134:	48 83 ec 08          	sub    $0x8,%rsp
   29138:	6a 00                	push   $0x0
   2913a:	83 e1 ef             	and    $0xffffffef,%ecx
   2913d:	83 c1 17             	add    $0x17,%ecx
   29140:	e8 5b 72 00 00       	call   303a0 <JS_GetPropertyInternal>
   29145:	41 5a                	pop    %r10
   29147:	41 5b                	pop    %r11
   29149:	48 89 c6             	mov    %rax,%rsi
   2914c:	83 fa 06             	cmp    $0x6,%edx
   2914f:	0f 84 7b ca ff ff    	je     25bd0 <JS_CallInternal+0x740>
   29155:	8d 4a fe             	lea    -0x2(%rdx),%ecx
   29158:	b8 01 00 00 00       	mov    $0x1,%eax
   2915d:	83 f9 01             	cmp    $0x1,%ecx
   29160:	0f 87 1a 37 00 00    	ja     2c880 <JS_CallInternal+0x73f0>
   29166:	48 89 03             	mov    %rax,(%rbx)
   29169:	49 83 c4 02          	add    $0x2,%r12
   2916d:	48 83 c3 10          	add    $0x10,%rbx
   29171:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29178:	00 
   29179:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2917f:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29183:	49 89 c2             	mov    %rax,%r10
   29186:	e9 25 c6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2918b:	f3 0f 1e fa          	endbr64
   2918f:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   29193:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   29197:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2919b:	4c 89 ef             	mov    %r13,%rdi
   2919e:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   291a2:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   291a6:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   291ac:	48 c7 85 d0 fd ff ff 	movq   $0x0,-0x230(%rbp)
   291b3:	00 00 00 00 
   291b7:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   291be:	48 c7 85 d8 fd ff ff 	movq   $0x3,-0x228(%rbp)
   291c5:	03 00 00 00 
   291c9:	4c 89 60 30          	mov    %r12,0x30(%rax)
   291cd:	6a 02                	push   $0x2
   291cf:	41 57                	push   %r15
   291d1:	ff b5 d8 fd ff ff    	push   -0x228(%rbp)
   291d7:	ff b5 d0 fd ff ff    	push   -0x230(%rbp)
   291dd:	e8 ae c2 ff ff       	call   25490 <JS_CallInternal>
   291e2:	48 83 c4 20          	add    $0x20,%rsp
   291e6:	48 89 c1             	mov    %rax,%rcx
   291e9:	48 89 d0             	mov    %rdx,%rax
   291ec:	83 fa 06             	cmp    $0x6,%edx
   291ef:	0f 84 ca 56 00 00    	je     2e8bf <JS_CallInternal+0x942f>
   291f5:	49 8b 77 08          	mov    0x8(%r15),%rsi
   291f9:	83 fe f6             	cmp    $0xfffffff6,%esi
   291fc:	76 15                	jbe    29213 <JS_CallInternal+0x3d83>
   291fe:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   29202:	8b 57 fc             	mov    -0x4(%rdi),%edx
   29205:	83 ea 01             	sub    $0x1,%edx
   29208:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2920b:	85 d2                	test   %edx,%edx
   2920d:	0f 8e 83 46 00 00    	jle    2d896 <JS_CallInternal+0x8406>
   29213:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   29217:	49 83 c4 01          	add    $0x1,%r12
   2921b:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2921f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29225:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29229:	49 89 c2             	mov    %rax,%r10
   2922c:	e9 7f c5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29231:	f3 0f 1e fa          	endbr64
   29235:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29239:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   2923d:	48 8b 5b f8          	mov    -0x8(%rbx),%rbx
   29241:	4c 39 85 48 fe ff ff 	cmp    %r8,-0x1b8(%rbp)
   29248:	0f 83 51 2c 00 00    	jae    2be9f <JS_CallInternal+0x6a0f>
   2924e:	48 89 d8             	mov    %rbx,%rax
   29251:	4c 89 a5 30 fe ff ff 	mov    %r12,-0x1d0(%rbp)
   29258:	4c 89 eb             	mov    %r13,%rbx
   2925b:	4d 89 c7             	mov    %r8,%r15
   2925e:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   29265:	4c 8b a5 48 fe ff ff 	mov    -0x1b8(%rbp),%r12
   2926c:	49 89 c5             	mov    %rax,%r13
   2926f:	eb 10                	jmp    29281 <JS_CallInternal+0x3df1>
   29271:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   29278:	4d 39 fc             	cmp    %r15,%r12
   2927b:	0f 83 04 2c 00 00    	jae    2be85 <JS_CallInternal+0x69f5>
   29281:	41 83 7f f8 05       	cmpl   $0x5,-0x8(%r15)
   29286:	0f 84 f9 2b 00 00    	je     2be85 <JS_CallInternal+0x69f5>
   2928c:	49 8b 47 f8          	mov    -0x8(%r15),%rax
   29290:	49 83 ef 10          	sub    $0x10,%r15
   29294:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29297:	76 df                	jbe    29278 <JS_CallInternal+0x3de8>
   29299:	49 8b 37             	mov    (%r15),%rsi
   2929c:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2929f:	8d 51 ff             	lea    -0x1(%rcx),%edx
   292a2:	89 56 fc             	mov    %edx,-0x4(%rsi)
   292a5:	85 d2                	test   %edx,%edx
   292a7:	7f cf                	jg     29278 <JS_CallInternal+0x3de8>
   292a9:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   292ad:	48 89 c2             	mov    %rax,%rdx
   292b0:	e8 0b 57 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   292b5:	eb c1                	jmp    29278 <JS_CallInternal+0x3de8>
   292b7:	f3 0f 1e fa          	endbr64
   292bb:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   292bf:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   292c3:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   292c7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   292ca:	76 11                	jbe    292dd <JS_CallInternal+0x3e4d>
   292cc:	8b 51 fc             	mov    -0x4(%rcx),%edx
   292cf:	83 ea 01             	sub    $0x1,%edx
   292d2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   292d5:	85 d2                	test   %edx,%edx
   292d7:	0f 8e 30 45 00 00    	jle    2d80d <JS_CallInternal+0x837d>
   292dd:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   292e1:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   292e5:	74 51                	je     29338 <JS_CallInternal+0x3ea8>
   292e7:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   292ee:	49 8b 53 08          	mov    0x8(%r11),%rdx
   292f2:	31 c9                	xor    %ecx,%ecx
   292f4:	4c 89 ef             	mov    %r13,%rdi
   292f7:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   292fb:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   29302:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29306:	e8 85 b9 06 00       	call   94c90 <JS_IteratorClose>
   2930b:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   29312:	85 c0                	test   %eax,%eax
   29314:	0f 85 1d 6d 00 00    	jne    30037 <JS_CallInternal+0xaba7>
   2931a:	49 8b 43 08          	mov    0x8(%r11),%rax
   2931e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29321:	76 15                	jbe    29338 <JS_CallInternal+0x3ea8>
   29323:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29327:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2932a:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2932d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29330:	85 d2                	test   %edx,%edx
   29332:	0f 8e bf 5e 00 00    	jle    2f1f7 <JS_CallInternal+0x9d67>
   29338:	41 0f b6 04 24       	movzbl (%r12),%eax
   2933d:	4c 89 db             	mov    %r11,%rbx
   29340:	49 83 c4 01          	add    $0x1,%r12
   29344:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29348:	49 89 c2             	mov    %rax,%r10
   2934b:	e9 60 c4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29350:	f3 0f 1e fa          	endbr64
   29354:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   29358:	0f 85 7d 58 00 00    	jne    2ebdb <JS_CallInternal+0x974b>
   2935e:	41 0f b6 04 24       	movzbl (%r12),%eax
   29363:	49 83 c4 01          	add    $0x1,%r12
   29367:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2936b:	49 89 c2             	mov    %rax,%r10
   2936e:	e9 3d c4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29373:	f3 0f 1e fa          	endbr64
   29377:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2937e:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29382:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29386:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2938a:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2938e:	0f 85 92 63 00 00    	jne    2f726 <JS_CallInternal+0xa296>
   29394:	48 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%rcx
   2939b:	4c 89 fa             	mov    %r15,%rdx
   2939e:	48 89 c6             	mov    %rax,%rsi
   293a1:	4c 89 ef             	mov    %r13,%rdi
   293a4:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   293ab:	e8 f0 da 05 00       	call   86ea0 <JS_IteratorGetCompleteValue>
   293b0:	48 89 c1             	mov    %rax,%rcx
   293b3:	48 89 d0             	mov    %rdx,%rax
   293b6:	83 fa 06             	cmp    $0x6,%edx
   293b9:	0f 84 fb 57 00 00    	je     2ebba <JS_CallInternal+0x972a>
   293bf:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   293c6:	8b 56 fc             	mov    -0x4(%rsi),%edx
   293c9:	83 ea 01             	sub    $0x1,%edx
   293cc:	89 56 fc             	mov    %edx,-0x4(%rsi)
   293cf:	85 d2                	test   %edx,%edx
   293d1:	0f 8e b0 56 00 00    	jle    2ea87 <JS_CallInternal+0x95f7>
   293d7:	44 8b bd dc fe ff ff 	mov    -0x124(%rbp),%r15d
   293de:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   293e2:	31 c0                	xor    %eax,%eax
   293e4:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   293e8:	45 85 ff             	test   %r15d,%r15d
   293eb:	48 c7 43 e0 00 00 00 	movq   $0x0,-0x20(%rbx)
   293f2:	00 
   293f3:	0f 95 c0             	setne  %al
   293f6:	48 83 c3 10          	add    $0x10,%rbx
   293fa:	49 83 c4 01          	add    $0x1,%r12
   293fe:	48 c7 43 d8 05 00 00 	movq   $0x5,-0x28(%rbx)
   29405:	00 
   29406:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2940a:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29411:	00 
   29412:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29418:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2941c:	49 89 c2             	mov    %rax,%r10
   2941f:	e9 8c c3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29424:	f3 0f 1e fa          	endbr64
   29428:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   2942d:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   29432:	48 c1 e1 04          	shl    $0x4,%rcx
   29436:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   2943d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   29441:	48 8b 01             	mov    (%rcx),%rax
   29444:	85 d2                	test   %edx,%edx
   29446:	0f 85 b8 2f 00 00    	jne    2c404 <JS_CallInternal+0x6f74>
   2944c:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   29451:	0f 84 ad 2f 00 00    	je     2c404 <JS_CallInternal+0x6f74>
   29457:	83 c0 01             	add    $0x1,%eax
   2945a:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   29461:	00 
   29462:	48 89 01             	mov    %rax,(%rcx)
   29465:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2946b:	49 83 c4 02          	add    $0x2,%r12
   2946f:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29473:	49 89 c2             	mov    %rax,%r10
   29476:	e9 35 c3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2947b:	f3 0f 1e fa          	endbr64
   2947f:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   29483:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29487:	45 85 db             	test   %r11d,%r11d
   2948a:	0f 85 c0 33 00 00    	jne    2c850 <JS_CallInternal+0x73c0>
   29490:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   29495:	0f 84 b5 33 00 00    	je     2c850 <JS_CallInternal+0x73c0>
   2949b:	83 c0 01             	add    $0x1,%eax
   2949e:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   294a5:	00 
   294a6:	48 89 03             	mov    %rax,(%rbx)
   294a9:	41 0f b6 04 24       	movzbl (%r12),%eax
   294ae:	48 83 c3 10          	add    $0x10,%rbx
   294b2:	49 83 c4 01          	add    $0x1,%r12
   294b6:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   294ba:	49 89 c2             	mov    %rax,%r10
   294bd:	e9 ee c2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   294c2:	f3 0f 1e fa          	endbr64
   294c6:	44 8b 7b f8          	mov    -0x8(%rbx),%r15d
   294ca:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   294ce:	45 85 ff             	test   %r15d,%r15d
   294d1:	0f 85 aa 32 00 00    	jne    2c781 <JS_CallInternal+0x72f1>
   294d7:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   294dc:	0f 84 9f 32 00 00    	je     2c781 <JS_CallInternal+0x72f1>
   294e2:	83 e8 01             	sub    $0x1,%eax
   294e5:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   294ec:	00 
   294ed:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   294f1:	41 0f b6 04 24       	movzbl (%r12),%eax
   294f6:	49 83 c4 01          	add    $0x1,%r12
   294fa:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   294fe:	49 89 c2             	mov    %rax,%r10
   29501:	e9 aa c2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29506:	f3 0f 1e fa          	endbr64
   2950a:	41 0f b7 04 24       	movzwl (%r12),%eax
   2950f:	48 c1 e0 04          	shl    $0x4,%rax
   29513:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2951a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2951e:	48 8b 08             	mov    (%rax),%rcx
   29521:	48 c7 40 08 04 00 00 	movq   $0x4,0x8(%rax)
   29528:	00 
   29529:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   29530:	83 fa f6             	cmp    $0xfffffff6,%edx
   29533:	76 11                	jbe    29546 <JS_CallInternal+0x40b6>
   29535:	8b 41 fc             	mov    -0x4(%rcx),%eax
   29538:	83 e8 01             	sub    $0x1,%eax
   2953b:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2953e:	85 c0                	test   %eax,%eax
   29540:	0f 8e db 42 00 00    	jle    2d821 <JS_CallInternal+0x8391>
   29546:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2954c:	49 83 c4 03          	add    $0x3,%r12
   29550:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29554:	49 89 c2             	mov    %rax,%r10
   29557:	e9 54 c2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2955c:	f3 0f 1e fa          	endbr64
   29560:	48 8b 4b e8          	mov    -0x18(%rbx),%rcx
   29564:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   29568:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   2956c:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29570:	85 c9                	test   %ecx,%ecx
   29572:	0f 85 38 4e 00 00    	jne    2e3b0 <JS_CallInternal+0x8f20>
   29578:	45 85 ff             	test   %r15d,%r15d
   2957b:	0f 85 8b 31 00 00    	jne    2c70c <JS_CallInternal+0x727c>
   29581:	31 c0                	xor    %eax,%eax
   29583:	44 39 d2             	cmp    %r10d,%edx
   29586:	0f 95 c0             	setne  %al
   29589:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2958d:	49 83 c4 01          	add    $0x1,%r12
   29591:	48 83 eb 10          	sub    $0x10,%rbx
   29595:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2959c:	00 
   2959d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   295a3:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   295a7:	49 89 c2             	mov    %rax,%r10
   295aa:	e9 01 c2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   295af:	f3 0f 1e fa          	endbr64
   295b3:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   295b7:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   295bb:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   295bf:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   295c3:	85 d2                	test   %edx,%edx
   295c5:	0f 85 5a 50 00 00    	jne    2e625 <JS_CallInternal+0x9195>
   295cb:	45 85 c0             	test   %r8d,%r8d
   295ce:	0f 85 08 31 00 00    	jne    2c6dc <JS_CallInternal+0x724c>
   295d4:	45 31 ff             	xor    %r15d,%r15d
   295d7:	44 39 d7             	cmp    %r10d,%edi
   295da:	41 0f 94 c7          	sete   %r15b
   295de:	4c 89 7b e0          	mov    %r15,-0x20(%rbx)
   295e2:	49 83 c4 01          	add    $0x1,%r12
   295e6:	48 83 eb 10          	sub    $0x10,%rbx
   295ea:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   295f1:	00 
   295f2:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   295f8:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   295fc:	49 89 c2             	mov    %rax,%r10
   295ff:	e9 ac c1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29604:	f3 0f 1e fa          	endbr64
   29608:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2960c:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29610:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   29614:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29618:	85 d2                	test   %edx,%edx
   2961a:	0f 85 ce 4c 00 00    	jne    2e2ee <JS_CallInternal+0x8e5e>
   29620:	85 c9                	test   %ecx,%ecx
   29622:	0f 85 8a 30 00 00    	jne    2c6b2 <JS_CallInternal+0x7222>
   29628:	45 31 ff             	xor    %r15d,%r15d
   2962b:	44 39 c7             	cmp    %r8d,%edi
   2962e:	41 0f 94 c7          	sete   %r15b
   29632:	41 83 f7 01          	xor    $0x1,%r15d
   29636:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2963d:	00 
   2963e:	49 63 c7             	movslq %r15d,%rax
   29641:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   29645:	41 0f b6 04 24       	movzbl (%r12),%eax
   2964a:	48 83 eb 10          	sub    $0x10,%rbx
   2964e:	49 83 c4 01          	add    $0x1,%r12
   29652:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29656:	49 89 c2             	mov    %rax,%r10
   29659:	e9 52 c1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2965e:	f3 0f 1e fa          	endbr64
   29662:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29666:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2966a:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2966e:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29672:	85 d2                	test   %edx,%edx
   29674:	0f 85 3a 54 00 00    	jne    2eab4 <JS_CallInternal+0x9624>
   2967a:	45 85 ff             	test   %r15d,%r15d
   2967d:	0f 85 07 30 00 00    	jne    2c68a <JS_CallInternal+0x71fa>
   29683:	31 c9                	xor    %ecx,%ecx
   29685:	44 39 c7             	cmp    %r8d,%edi
   29688:	0f 94 c1             	sete   %cl
   2968b:	48 63 c9             	movslq %ecx,%rcx
   2968e:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29695:	00 
   29696:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   2969a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2969f:	48 83 eb 10          	sub    $0x10,%rbx
   296a3:	49 83 c4 01          	add    $0x1,%r12
   296a7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   296ab:	49 89 c2             	mov    %rax,%r10
   296ae:	e9 fd c0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   296b3:	f3 0f 1e fa          	endbr64
   296b7:	41 8b 0c 24          	mov    (%r12),%ecx
   296bb:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   296bf:	4c 89 ef             	mov    %r13,%rdi
   296c2:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   296c7:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   296cb:	e8 40 2d 01 00       	call   3c410 <JS_DefineObjectName.constprop.0>
   296d0:	83 f8 ff             	cmp    $0xffffffff,%eax
   296d3:	0f 84 f7 c4 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   296d9:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   296df:	49 83 c4 05          	add    $0x5,%r12
   296e3:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   296e7:	49 89 c2             	mov    %rax,%r10
   296ea:	e9 c1 c0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   296ef:	f3 0f 1e fa          	endbr64
   296f3:	48 83 ec 08          	sub    $0x8,%rsp
   296f7:	41 8b 0c 24          	mov    (%r12),%ecx
   296fb:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   296ff:	4c 89 ef             	mov    %r13,%rdi
   29702:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   29706:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2970a:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2970f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29713:	68 07 40 00 00       	push   $0x4007
   29718:	e8 f3 9c 00 00       	call   33410 <JS_DefinePropertyValue>
   2971d:	5a                   	pop    %rdx
   2971e:	59                   	pop    %rcx
   2971f:	85 c0                	test   %eax,%eax
   29721:	0f 88 8a 54 00 00    	js     2ebb1 <JS_CallInternal+0x9721>
   29727:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2972d:	48 83 eb 10          	sub    $0x10,%rbx
   29731:	49 83 c4 05          	add    $0x5,%r12
   29735:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29739:	49 89 c2             	mov    %rax,%r10
   2973c:	e9 6f c0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29741:	f3 0f 1e fa          	endbr64
   29745:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29749:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2974d:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29751:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29755:	83 fe ff             	cmp    $0xffffffff,%esi
   29758:	0f 85 01 33 00 00    	jne    2ca5f <JS_CallInternal+0x75cf>
   2975e:	85 c9                	test   %ecx,%ecx
   29760:	0f 85 f9 32 00 00    	jne    2ca5f <JS_CallInternal+0x75cf>
   29766:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   2976b:	0f 85 ee 32 00 00    	jne    2ca5f <JS_CallInternal+0x75cf>
   29771:	3b 42 38             	cmp    0x38(%rdx),%eax
   29774:	0f 83 e5 32 00 00    	jae    2ca5f <JS_CallInternal+0x75cf>
   2977a:	89 c0                	mov    %eax,%eax
   2977c:	48 c1 e0 04          	shl    $0x4,%rax
   29780:	48 03 42 30          	add    0x30(%rdx),%rax
   29784:	48 8b 10             	mov    (%rax),%rdx
   29787:	48 8b 40 08          	mov    0x8(%rax),%rax
   2978b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2978e:	76 04                	jbe    29794 <JS_CallInternal+0x4304>
   29790:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29794:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   29798:	49 83 c4 01          	add    $0x1,%r12
   2979c:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   297a0:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   297a6:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   297aa:	49 89 c2             	mov    %rax,%r10
   297ad:	e9 fe bf ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   297b2:	f3 0f 1e fa          	endbr64
   297b6:	e9 24 c2 ff ff       	jmp    259df <JS_CallInternal+0x54f>
   297bb:	f3 0f 1e fa          	endbr64
   297bf:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   297c6:	41 0f b7 04 24       	movzwl (%r12),%eax
   297cb:	0f b7 51 38          	movzwl 0x38(%rcx),%edx
   297cf:	48 8b 71 28          	mov    0x28(%rcx),%rsi
   297d3:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   297da:	01 d0                	add    %edx,%eax
   297dc:	48 98                	cltq
   297de:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   297e2:	48 8d 04 86          	lea    (%rsi,%rax,4),%rax
   297e6:	44 0f b7 78 0a       	movzwl 0xa(%rax),%r15d
   297eb:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   297f2:	00 
   297f3:	48 03 51 28          	add    0x28(%rcx),%rdx
   297f7:	48 8b 02             	mov    (%rdx),%rax
   297fa:	48 85 c0             	test   %rax,%rax
   297fd:	74 47                	je     29846 <JS_CallInternal+0x43b6>
   297ff:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   29803:	f6 41 3c 04          	testb  $0x4,0x3c(%rcx)
   29807:	0f 85 20 3d 00 00    	jne    2d52d <JS_CallInternal+0x809d>
   2980d:	48 8b 70 18          	mov    0x18(%rax),%rsi
   29811:	48 8b 0e             	mov    (%rsi),%rcx
   29814:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   29818:	83 fe f6             	cmp    $0xfffffff6,%esi
   2981b:	76 04                	jbe    29821 <JS_CallInternal+0x4391>
   2981d:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   29821:	48 89 70 28          	mov    %rsi,0x28(%rax)
   29825:	48 8d 70 20          	lea    0x20(%rax),%rsi
   29829:	66 48 0f 6e e1       	movq   %rcx,%xmm4
   2982e:	66 48 0f 6e c6       	movq   %rsi,%xmm0
   29833:	c6 40 10 01          	movb   $0x1,0x10(%rax)
   29837:	66 0f 6c c4          	punpcklqdq %xmm4,%xmm0
   2983b:	0f 11 40 18          	movups %xmm0,0x18(%rax)
   2983f:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
   29846:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2984c:	49 83 c4 03          	add    $0x3,%r12
   29850:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29854:	49 89 c2             	mov    %rax,%r10
   29857:	e9 54 bf ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2985c:	f3 0f 1e fa          	endbr64
   29860:	41 0f b7 04 24       	movzwl (%r12),%eax
   29865:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2986a:	48 c1 e0 04          	shl    $0x4,%rax
   2986e:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   29875:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   29879:	0f 85 a0 4c 00 00    	jne    2e51f <JS_CallInternal+0x908f>
   2987f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29884:	49 83 c4 03          	add    $0x3,%r12
   29888:	48 83 eb 10          	sub    $0x10,%rbx
   2988c:	0f 11 00             	movups %xmm0,(%rax)
   2988f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29895:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29899:	49 89 c2             	mov    %rax,%r10
   2989c:	e9 0f bf ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   298a1:	f3 0f 1e fa          	endbr64
   298a5:	41 0f b7 04 24       	movzwl (%r12),%eax
   298aa:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   298af:	48 89 c1             	mov    %rax,%rcx
   298b2:	48 c1 e0 04          	shl    $0x4,%rax
   298b6:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   298bd:	48 8b 50 08          	mov    0x8(%rax),%rdx
   298c1:	83 fa 04             	cmp    $0x4,%edx
   298c4:	0f 84 c7 4f 00 00    	je     2e891 <JS_CallInternal+0x9401>
   298ca:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   298ce:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   298d2:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   298d5:	76 04                	jbe    298db <JS_CallInternal+0x444b>
   298d7:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   298db:	48 8b 38             	mov    (%rax),%rdi
   298de:	48 89 48 08          	mov    %rcx,0x8(%rax)
   298e2:	48 89 30             	mov    %rsi,(%rax)
   298e5:	83 fa f6             	cmp    $0xfffffff6,%edx
   298e8:	76 11                	jbe    298fb <JS_CallInternal+0x446b>
   298ea:	8b 47 fc             	mov    -0x4(%rdi),%eax
   298ed:	83 e8 01             	sub    $0x1,%eax
   298f0:	89 47 fc             	mov    %eax,-0x4(%rdi)
   298f3:	85 c0                	test   %eax,%eax
   298f5:	0f 8e 8a 3f 00 00    	jle    2d885 <JS_CallInternal+0x83f5>
   298fb:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   29901:	49 83 c4 03          	add    $0x3,%r12
   29905:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29909:	49 89 c2             	mov    %rax,%r10
   2990c:	e9 9f be ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29911:	f3 0f 1e fa          	endbr64
   29915:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29919:	83 f8 fa             	cmp    $0xfffffffa,%eax
   2991c:	0f 8d 2e 2c 00 00    	jge    2c550 <JS_CallInternal+0x70c0>
   29922:	83 f8 f8             	cmp    $0xfffffff8,%eax
   29925:	0f 8c 2d 2c 00 00    	jl     2c558 <JS_CallInternal+0x70c8>
   2992b:	41 0f b6 04 24       	movzbl (%r12),%eax
   29930:	49 83 c4 01          	add    $0x1,%r12
   29934:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29938:	49 89 c2             	mov    %rax,%r10
   2993b:	e9 70 be ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29940:	f3 0f 1e fa          	endbr64
   29944:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   29948:	74 5b                	je     299a5 <JS_CallInternal+0x4515>
   2994a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29951:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29955:	4c 89 ef             	mov    %r13,%rdi
   29958:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2995c:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29960:	e8 eb 1d 02 00       	call   4b750 <JS_ToObject>
   29965:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2996c:	49 89 d7             	mov    %rdx,%r15
   2996f:	83 fa 06             	cmp    $0x6,%edx
   29972:	0f 84 b5 59 00 00    	je     2f32d <JS_CallInternal+0x9e9d>
   29978:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2997c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2997f:	76 15                	jbe    29996 <JS_CallInternal+0x4506>
   29981:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29985:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   29988:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2998b:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2998e:	85 d2                	test   %edx,%edx
   29990:	0f 8e 9f 59 00 00    	jle    2f335 <JS_CallInternal+0x9ea5>
   29996:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2999d:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   299a1:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   299a5:	41 0f b6 04 24       	movzbl (%r12),%eax
   299aa:	49 83 c4 01          	add    $0x1,%r12
   299ae:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   299b2:	49 89 c2             	mov    %rax,%r10
   299b5:	e9 f6 bd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   299ba:	f3 0f 1e fa          	endbr64
   299be:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   299c5:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   299ca:	41 8b 0c 24          	mov    (%r12),%ecx
   299ce:	4c 89 78 30          	mov    %r15,0x30(%rax)
   299d2:	49 8b 85 90 01 00 00 	mov    0x190(%r13),%rax
   299d9:	89 ca                	mov    %ecx,%edx
   299db:	48 8b 70 18          	mov    0x18(%rax),%rsi
   299df:	8b 46 18             	mov    0x18(%rsi),%eax
   299e2:	21 c2                	and    %eax,%edx
   299e4:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   299e8:	48 85 d2             	test   %rdx,%rdx
   299eb:	0f 84 97 36 00 00    	je     2d088 <JS_CallInternal+0x7bf8>
   299f1:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   299f8:	00 
   299f9:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   299fe:	48 01 f0             	add    %rsi,%rax
   29a01:	3b 48 04             	cmp    0x4(%rax),%ecx
   29a04:	0f 85 70 36 00 00    	jne    2d07a <JS_CallInternal+0x7bea>
   29a0a:	31 c0                	xor    %eax,%eax
   29a0c:	48 89 03             	mov    %rax,(%rbx)
   29a0f:	49 83 c4 05          	add    $0x5,%r12
   29a13:	48 83 c3 10          	add    $0x10,%rbx
   29a17:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29a1e:	00 
   29a1f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29a25:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29a29:	49 89 c2             	mov    %rax,%r10
   29a2c:	e9 7f bd ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29a31:	f3 0f 1e fa          	endbr64
   29a35:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29a3c:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   29a40:	4c 89 ef             	mov    %r13,%rdi
   29a43:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29a47:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29a4b:	4c 89 fe             	mov    %r15,%rsi
   29a4e:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   29a55:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   29a59:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   29a60:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29a64:	48 89 c2             	mov    %rax,%rdx
   29a67:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29a6e:	e8 bd d6 01 00       	call   47130 <JS_ValueToAtom>
   29a73:	85 c0                	test   %eax,%eax
   29a75:	0f 84 20 44 00 00    	je     2de9b <JS_CallInternal+0x8a0b>
   29a7b:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   29a82:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   29a89:	89 c1                	mov    %eax,%ecx
   29a8b:	4c 89 ef             	mov    %r13,%rdi
   29a8e:	41 b8 00 80 00 00    	mov    $0x8000,%r8d
   29a94:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   29a9a:	e8 d1 46 02 00       	call   4e170 <JS_DeleteProperty>
   29a9f:	44 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9d
   29aa6:	89 c1                	mov    %eax,%ecx
   29aa8:	41 81 f9 f2 00 00 00 	cmp    $0xf2,%r9d
   29aaf:	0f 8f e0 33 00 00    	jg     2ce95 <JS_CallInternal+0x7a05>
   29ab5:	85 c9                	test   %ecx,%ecx
   29ab7:	0f 88 0d 44 00 00    	js     2deca <JS_CallInternal+0x8a3a>
   29abd:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   29ac4:	76 1e                	jbe    29ae4 <JS_CallInternal+0x4654>
   29ac6:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   29acd:	8b 42 fc             	mov    -0x4(%rdx),%eax
   29ad0:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   29ad6:	83 e8 01             	sub    $0x1,%eax
   29ad9:	89 42 fc             	mov    %eax,-0x4(%rdx)
   29adc:	85 c0                	test   %eax,%eax
   29ade:	0f 8e bf 43 00 00    	jle    2dea3 <JS_CallInternal+0x8a13>
   29ae4:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   29aeb:	76 13                	jbe    29b00 <JS_CallInternal+0x4670>
   29aed:	41 8b 47 fc          	mov    -0x4(%r15),%eax
   29af1:	83 e8 01             	sub    $0x1,%eax
   29af4:	41 89 47 fc          	mov    %eax,-0x4(%r15)
   29af8:	85 c0                	test   %eax,%eax
   29afa:	0f 8e 6d 4d 00 00    	jle    2e86d <JS_CallInternal+0x93dd>
   29b00:	31 c0                	xor    %eax,%eax
   29b02:	85 c9                	test   %ecx,%ecx
   29b04:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29b0b:	00 
   29b0c:	0f 95 c0             	setne  %al
   29b0f:	48 83 eb 10          	sub    $0x10,%rbx
   29b13:	49 83 c4 01          	add    $0x1,%r12
   29b17:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29b1b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29b21:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29b25:	49 89 c2             	mov    %rax,%r10
   29b28:	e9 83 bc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29b2d:	f3 0f 1e fa          	endbr64
   29b31:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   29b35:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29b39:	4c 89 ef             	mov    %r13,%rdi
   29b3c:	4c 89 c2             	mov    %r8,%rdx
   29b3f:	e8 dc b3 ff ff       	call   24f20 <js_operator_typeof>
   29b44:	41 89 c7             	mov    %eax,%r15d
   29b47:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   29b4b:	76 11                	jbe    29b5e <JS_CallInternal+0x46ce>
   29b4d:	8b 46 fc             	mov    -0x4(%rsi),%eax
   29b50:	83 e8 01             	sub    $0x1,%eax
   29b53:	89 46 fc             	mov    %eax,-0x4(%rsi)
   29b56:	85 c0                	test   %eax,%eax
   29b58:	0f 8e 16 3d 00 00    	jle    2d874 <JS_CallInternal+0x83e4>
   29b5e:	ba 01 00 00 00       	mov    $0x1,%edx
   29b63:	44 89 fe             	mov    %r15d,%esi
   29b66:	4c 89 ef             	mov    %r13,%rdi
   29b69:	49 83 c4 01          	add    $0x1,%r12
   29b6d:	e8 4e 23 01 00       	call   3bec0 <__JS_AtomToValue>
   29b72:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29b76:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29b7a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29b80:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29b84:	49 89 c2             	mov    %rax,%r10
   29b87:	e9 24 bc ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29b8c:	f3 0f 1e fa          	endbr64
   29b90:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29b97:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   29b9b:	4c 89 ef             	mov    %r13,%rdi
   29b9e:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   29ba2:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29ba6:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29baa:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   29bae:	4c 89 ca             	mov    %r9,%rdx
   29bb1:	4c 89 f9             	mov    %r15,%rcx
   29bb4:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   29bbb:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   29bc2:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   29bc9:	e8 42 ba 06 00       	call   95610 <JS_IsInstanceOf>
   29bce:	85 c0                	test   %eax,%eax
   29bd0:	0f 88 64 2b 00 00    	js     2c73a <JS_CallInternal+0x72aa>
   29bd6:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   29bdd:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   29be4:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   29be8:	76 18                	jbe    29c02 <JS_CallInternal+0x4772>
   29bea:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   29bf1:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   29bf4:	8d 51 ff             	lea    -0x1(%rcx),%edx
   29bf7:	89 56 fc             	mov    %edx,-0x4(%rsi)
   29bfa:	85 d2                	test   %edx,%edx
   29bfc:	0f 8e 43 52 00 00    	jle    2ee45 <JS_CallInternal+0x99b5>
   29c02:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   29c06:	76 13                	jbe    29c1b <JS_CallInternal+0x478b>
   29c08:	41 8b 4f fc          	mov    -0x4(%r15),%ecx
   29c0c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   29c0f:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   29c13:	85 d2                	test   %edx,%edx
   29c15:	0f 8e ca 53 00 00    	jle    2efe5 <JS_CallInternal+0x9b55>
   29c1b:	85 c0                	test   %eax,%eax
   29c1d:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29c24:	00 
   29c25:	0f 95 c0             	setne  %al
   29c28:	48 83 eb 10          	sub    $0x10,%rbx
   29c2c:	49 83 c4 01          	add    $0x1,%r12
   29c30:	0f b6 c0             	movzbl %al,%eax
   29c33:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29c37:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c3d:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29c41:	49 89 c2             	mov    %rax,%r10
   29c44:	e9 67 bb ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29c49:	f3 0f 1e fa          	endbr64
   29c4d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29c54:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   29c58:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   29c5c:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29c60:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29c64:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29c68:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   29c6f:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   29c73:	0f 85 f1 63 00 00    	jne    3006a <JS_CallInternal+0xabda>
   29c79:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   29c7d:	0f 84 a0 2f 00 00    	je     2cc23 <JS_CallInternal+0x7793>
   29c83:	4c 89 d6             	mov    %r10,%rsi
   29c86:	4c 89 fa             	mov    %r15,%rdx
   29c89:	4c 89 ef             	mov    %r13,%rdi
   29c8c:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   29c93:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   29c9a:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   29ca1:	e8 8a d4 01 00       	call   47130 <JS_ValueToAtom>
   29ca6:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   29cad:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   29cb4:	85 c0                	test   %eax,%eax
   29cb6:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   29cbd:	0f 84 2d 51 00 00    	je     2edf0 <JS_CallInternal+0x9960>
   29cc3:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   29cca:	48 8b 71 18          	mov    0x18(%rcx),%rsi
   29cce:	89 c1                	mov    %eax,%ecx
   29cd0:	8b 56 18             	mov    0x18(%rsi),%edx
   29cd3:	21 d1                	and    %edx,%ecx
   29cd5:	8b 4c 8e 38          	mov    0x38(%rsi,%rcx,4),%ecx
   29cd9:	48 85 c9             	test   %rcx,%rcx
   29cdc:	0f 84 f2 57 00 00    	je     2f4d4 <JS_CallInternal+0xa044>
   29ce2:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   29ce9:	00 
   29cea:	48 8d 4c ca f8       	lea    -0x8(%rdx,%rcx,8),%rcx
   29cef:	48 01 f1             	add    %rsi,%rcx
   29cf2:	39 41 04             	cmp    %eax,0x4(%rcx)
   29cf5:	0f 85 cb 57 00 00    	jne    2f4c6 <JS_CallInternal+0xa036>
   29cfb:	b9 01 00 00 00       	mov    $0x1,%ecx
   29d00:	3d f2 00 00 00       	cmp    $0xf2,%eax
   29d05:	0f 8f 9a 37 00 00    	jg     2d4a5 <JS_CallInternal+0x8015>
   29d0b:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   29d0f:	76 1e                	jbe    29d2f <JS_CallInternal+0x489f>
   29d11:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   29d18:	8b 46 fc             	mov    -0x4(%rsi),%eax
   29d1b:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   29d21:	83 e8 01             	sub    $0x1,%eax
   29d24:	89 46 fc             	mov    %eax,-0x4(%rsi)
   29d27:	85 c0                	test   %eax,%eax
   29d29:	0f 8e 30 41 00 00    	jle    2de5f <JS_CallInternal+0x89cf>
   29d2f:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   29d33:	76 13                	jbe    29d48 <JS_CallInternal+0x48b8>
   29d35:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   29d39:	83 e8 01             	sub    $0x1,%eax
   29d3c:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   29d40:	85 c0                	test   %eax,%eax
   29d42:	0f 8e 2a 3e 00 00    	jle    2db72 <JS_CallInternal+0x86e2>
   29d48:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   29d4c:	49 83 c4 01          	add    $0x1,%r12
   29d50:	48 83 eb 10          	sub    $0x10,%rbx
   29d54:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29d5b:	00 
   29d5c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29d62:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29d66:	49 89 c2             	mov    %rax,%r10
   29d69:	e9 42 ba ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29d6e:	f3 0f 1e fa          	endbr64
   29d72:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29d79:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29d7d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29d81:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29d85:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   29d8c:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   29d90:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   29d97:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29d9b:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29da2:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   29da6:	0f 85 e0 60 00 00    	jne    2fe8c <JS_CallInternal+0xa9fc>
   29dac:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   29db3:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   29dba:	4c 89 ef             	mov    %r13,%rdi
   29dbd:	e8 6e d3 01 00       	call   47130 <JS_ValueToAtom>
   29dc2:	89 c1                	mov    %eax,%ecx
   29dc4:	85 c0                	test   %eax,%eax
   29dc6:	0f 84 15 44 00 00    	je     2e1e1 <JS_CallInternal+0x8d51>
   29dcc:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   29dd3:	4c 89 fa             	mov    %r15,%rdx
   29dd6:	4c 89 ef             	mov    %r13,%rdi
   29dd9:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   29ddf:	e8 7c 66 04 00       	call   70460 <JS_HasProperty>
   29de4:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   29dea:	41 89 c0             	mov    %eax,%r8d
   29ded:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   29df3:	0f 8f c5 31 00 00    	jg     2cfbe <JS_CallInternal+0x7b2e>
   29df9:	45 85 c0             	test   %r8d,%r8d
   29dfc:	0f 88 92 5e 00 00    	js     2fc94 <JS_CallInternal+0xa804>
   29e02:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   29e09:	76 1e                	jbe    29e29 <JS_CallInternal+0x4999>
   29e0b:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   29e12:	8b 41 fc             	mov    -0x4(%rcx),%eax
   29e15:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   29e1b:	83 e8 01             	sub    $0x1,%eax
   29e1e:	89 41 fc             	mov    %eax,-0x4(%rcx)
   29e21:	85 c0                	test   %eax,%eax
   29e23:	0f 8e 62 46 00 00    	jle    2e48b <JS_CallInternal+0x8ffb>
   29e29:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   29e2d:	76 1e                	jbe    29e4d <JS_CallInternal+0x49bd>
   29e2f:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   29e36:	8b 41 fc             	mov    -0x4(%rcx),%eax
   29e39:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   29e3f:	83 e8 01             	sub    $0x1,%eax
   29e42:	89 41 fc             	mov    %eax,-0x4(%rcx)
   29e45:	85 c0                	test   %eax,%eax
   29e47:	0f 8e 02 4e 00 00    	jle    2ec4f <JS_CallInternal+0x97bf>
   29e4d:	31 c0                	xor    %eax,%eax
   29e4f:	45 85 c0             	test   %r8d,%r8d
   29e52:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29e59:	00 
   29e5a:	0f 95 c0             	setne  %al
   29e5d:	48 83 eb 10          	sub    $0x10,%rbx
   29e61:	49 83 c4 01          	add    $0x1,%r12
   29e65:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29e69:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29e6f:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29e73:	49 89 c2             	mov    %rax,%r10
   29e76:	e9 35 b9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29e7b:	f3 0f 1e fa          	endbr64
   29e7f:	e9 3c b9 ff ff       	jmp    257c0 <JS_CallInternal+0x330>
   29e84:	f3 0f 1e fa          	endbr64
   29e88:	e9 33 b9 ff ff       	jmp    257c0 <JS_CallInternal+0x330>
   29e8d:	f3 0f 1e fa          	endbr64
   29e91:	e9 2a b9 ff ff       	jmp    257c0 <JS_CallInternal+0x330>
   29e96:	f3 0f 1e fa          	endbr64
   29e9a:	31 c0                	xor    %eax,%eax
   29e9c:	b9 01 00 00 00       	mov    $0x1,%ecx
   29ea1:	e9 aa bd ff ff       	jmp    25c50 <JS_CallInternal+0x7c0>
   29ea6:	f3 0f 1e fa          	endbr64
   29eaa:	31 c0                	xor    %eax,%eax
   29eac:	31 c9                	xor    %ecx,%ecx
   29eae:	e9 9d bd ff ff       	jmp    25c50 <JS_CallInternal+0x7c0>
   29eb3:	f3 0f 1e fa          	endbr64
   29eb7:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29ebb:	0b 53 e8             	or     -0x18(%rbx),%edx
   29ebe:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29ec2:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29ec6:	0f 85 8e 4e 00 00    	jne    2ed5a <JS_CallInternal+0x98ca>
   29ecc:	31 c8                	xor    %ecx,%eax
   29ece:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29ed5:	00 
   29ed6:	48 83 eb 10          	sub    $0x10,%rbx
   29eda:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29ede:	41 0f b6 04 24       	movzbl (%r12),%eax
   29ee3:	49 83 c4 01          	add    $0x1,%r12
   29ee7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29eeb:	49 89 c2             	mov    %rax,%r10
   29eee:	e9 bd b8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29ef3:	f3 0f 1e fa          	endbr64
   29ef7:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29efb:	0b 53 e8             	or     -0x18(%rbx),%edx
   29efe:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29f02:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29f06:	0f 85 f1 40 00 00    	jne    2dffd <JS_CallInternal+0x8b6d>
   29f0c:	09 c8                	or     %ecx,%eax
   29f0e:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29f15:	00 
   29f16:	48 83 eb 10          	sub    $0x10,%rbx
   29f1a:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29f1e:	41 0f b6 04 24       	movzbl (%r12),%eax
   29f23:	49 83 c4 01          	add    $0x1,%r12
   29f27:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29f2b:	49 89 c2             	mov    %rax,%r10
   29f2e:	e9 7d b8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29f33:	f3 0f 1e fa          	endbr64
   29f37:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29f3b:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29f3f:	45 31 c9             	xor    %r9d,%r9d
   29f42:	4c 89 ef             	mov    %r13,%rdi
   29f45:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29f4c:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29f50:	48 c7 85 c0 fd ff ff 	movq   $0x0,-0x240(%rbp)
   29f57:	00 00 00 00 
   29f5b:	48 c7 85 c8 fd ff ff 	movq   $0x3,-0x238(%rbp)
   29f62:	03 00 00 00 
   29f66:	4c 8b 43 d8          	mov    -0x28(%rbx),%r8
   29f6a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29f6e:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   29f75:	00 
   29f76:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   29f7d:	00 
   29f7e:	6a 02                	push   $0x2
   29f80:	6a 00                	push   $0x0
   29f82:	ff b5 c8 fd ff ff    	push   -0x238(%rbp)
   29f88:	ff b5 c0 fd ff ff    	push   -0x240(%rbp)
   29f8e:	e8 fd b4 ff ff       	call   25490 <JS_CallInternal>
   29f93:	48 83 c4 20          	add    $0x20,%rsp
   29f97:	83 fa 06             	cmp    $0x6,%edx
   29f9a:	0f 84 7f 49 00 00    	je     2e91f <JS_CallInternal+0x948f>
   29fa0:	48 89 03             	mov    %rax,(%rbx)
   29fa3:	49 83 c4 01          	add    $0x1,%r12
   29fa7:	48 83 c3 10          	add    $0x10,%rbx
   29fab:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29faf:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29fb5:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   29fb9:	49 89 c2             	mov    %rax,%r10
   29fbc:	e9 ef b7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   29fc1:	f3 0f 1e fa          	endbr64
   29fc5:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29fc9:	0b 43 e8             	or     -0x18(%rbx),%eax
   29fcc:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   29fd0:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29fd4:	0f 85 0b 15 00 00    	jne    2b4e5 <JS_CallInternal+0x6055>
   29fda:	89 c8                	mov    %ecx,%eax
   29fdc:	89 d6                	mov    %edx,%esi
   29fde:	85 c9                	test   %ecx,%ecx
   29fe0:	0f 88 ff 14 00 00    	js     2b4e5 <JS_CallInternal+0x6055>
   29fe6:	85 d2                	test   %edx,%edx
   29fe8:	0f 8e f7 14 00 00    	jle    2b4e5 <JS_CallInternal+0x6055>
   29fee:	99                   	cltd
   29fef:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29ff6:	00 
   29ff7:	49 83 c4 01          	add    $0x1,%r12
   29ffb:	48 83 eb 10          	sub    $0x10,%rbx
   29fff:	f7 fe                	idiv   %esi
   2a001:	48 63 d2             	movslq %edx,%rdx
   2a004:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2a008:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a00e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a012:	49 89 c2             	mov    %rax,%r10
   2a015:	e9 96 b7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a01a:	f3 0f 1e fa          	endbr64
   2a01e:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a022:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a026:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a029:	76 04                	jbe    2a02f <JS_CallInternal+0x4b9f>
   2a02b:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a02f:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a036:	48 8b 40 10          	mov    0x10(%rax),%rax
   2a03a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a03e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a042:	48 8b 38             	mov    (%rax),%rdi
   2a045:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a049:	48 89 30             	mov    %rsi,(%rax)
   2a04c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a04f:	76 11                	jbe    2a062 <JS_CallInternal+0x4bd2>
   2a051:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a054:	83 e8 01             	sub    $0x1,%eax
   2a057:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a05a:	85 c0                	test   %eax,%eax
   2a05c:	0f 8e d0 37 00 00    	jle    2d832 <JS_CallInternal+0x83a2>
   2a062:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a067:	49 83 c4 01          	add    $0x1,%r12
   2a06b:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a06f:	49 89 c2             	mov    %rax,%r10
   2a072:	e9 39 b7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a077:	f3 0f 1e fa          	endbr64
   2a07b:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a07f:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a083:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2a087:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a08b:	89 cf                	mov    %ecx,%edi
   2a08d:	09 f7                	or     %esi,%edi
   2a08f:	0f 85 b6 43 00 00    	jne    2e44b <JS_CallInternal+0x8fbb>
   2a095:	39 c2                	cmp    %eax,%edx
   2a097:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2a09e:	00 
   2a09f:	0f 9d c0             	setge  %al
   2a0a2:	48 83 eb 10          	sub    $0x10,%rbx
   2a0a6:	0f b6 c0             	movzbl %al,%eax
   2a0a9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a0ad:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a0b2:	49 83 c4 01          	add    $0x1,%r12
   2a0b6:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a0ba:	49 89 c2             	mov    %rax,%r10
   2a0bd:	e9 ee b6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a0c2:	f3 0f 1e fa          	endbr64
   2a0c6:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a0ca:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a0ce:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2a0d2:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a0d6:	89 cf                	mov    %ecx,%edi
   2a0d8:	09 f7                	or     %esi,%edi
   2a0da:	0f 85 61 41 00 00    	jne    2e241 <JS_CallInternal+0x8db1>
   2a0e0:	39 c2                	cmp    %eax,%edx
   2a0e2:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2a0e9:	00 
   2a0ea:	0f 9f c0             	setg   %al
   2a0ed:	48 83 eb 10          	sub    $0x10,%rbx
   2a0f1:	0f b6 c0             	movzbl %al,%eax
   2a0f4:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a0f8:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a0fd:	49 83 c4 01          	add    $0x1,%r12
   2a101:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a105:	49 89 c2             	mov    %rax,%r10
   2a108:	e9 a3 b6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a10d:	f3 0f 1e fa          	endbr64
   2a111:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2a115:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2a119:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2a11d:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a121:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2a128:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2a12c:	83 7b e8 ff          	cmpl   $0xffffffff,-0x18(%rbx)
   2a130:	0f 85 a9 43 00 00    	jne    2e4df <JS_CallInternal+0x904f>
   2a136:	41 83 f9 f8          	cmp    $0xfffffff8,%r9d
   2a13a:	0f 85 79 43 00 00    	jne    2e4b9 <JS_CallInternal+0x9029>
   2a140:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2a144:	48 89 d6             	mov    %rdx,%rsi
   2a147:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2a14e:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   2a155:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   2a15c:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2a163:	e8 98 e0 fe ff       	call   18200 <js_get_atom_index>
   2a168:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2a16f:	89 c7                	mov    %eax,%edi
   2a171:	49 8b 72 18          	mov    0x18(%r10),%rsi
   2a175:	8b 4e 18             	mov    0x18(%rsi),%ecx
   2a178:	21 c8                	and    %ecx,%eax
   2a17a:	8b 44 86 38          	mov    0x38(%rsi,%rax,4),%eax
   2a17e:	48 85 c0             	test   %rax,%rax
   2a181:	0f 84 35 48 00 00    	je     2e9bc <JS_CallInternal+0x952c>
   2a187:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   2a18e:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2a195:	4c 8d 04 8d 3c 00 00 	lea    0x3c(,%rcx,4),%r8
   2a19c:	00 
   2a19d:	48 83 e8 01          	sub    $0x1,%rax
   2a1a1:	49 8d 0c c0          	lea    (%r8,%rax,8),%rcx
   2a1a5:	48 01 f1             	add    %rsi,%rcx
   2a1a8:	3b 79 04             	cmp    0x4(%rcx),%edi
   2a1ab:	0f 85 fe 47 00 00    	jne    2e9af <JS_CallInternal+0x951f>
   2a1b1:	48 c1 e0 04          	shl    $0x4,%rax
   2a1b5:	49 03 42 20          	add    0x20(%r10),%rax
   2a1b9:	48 8b 08             	mov    (%rax),%rcx
   2a1bc:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a1c0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a1c3:	76 04                	jbe    2a1c9 <JS_CallInternal+0x4d39>
   2a1c5:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2a1c9:	41 89 c0             	mov    %eax,%r8d
   2a1cc:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2a1d0:	76 11                	jbe    2a1e3 <JS_CallInternal+0x4d53>
   2a1d2:	8b 72 fc             	mov    -0x4(%rdx),%esi
   2a1d5:	83 ee 01             	sub    $0x1,%esi
   2a1d8:	89 72 fc             	mov    %esi,-0x4(%rdx)
   2a1db:	85 f6                	test   %esi,%esi
   2a1dd:	0f 8e 23 3a 00 00    	jle    2dc06 <JS_CallInternal+0x8776>
   2a1e3:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2a1ea:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   2a1ee:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a1f1:	76 1b                	jbe    2a20e <JS_CallInternal+0x4d7e>
   2a1f3:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2a1fa:	48 8b 3a             	mov    (%rdx),%rdi
   2a1fd:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2a200:	83 ea 01             	sub    $0x1,%edx
   2a203:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2a206:	85 d2                	test   %edx,%edx
   2a208:	0f 8e 39 3a 00 00    	jle    2dc47 <JS_CallInternal+0x87b7>
   2a20e:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   2a212:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a216:	41 83 f8 06          	cmp    $0x6,%r8d
   2a21a:	0f 84 f2 47 00 00    	je     2ea12 <JS_CallInternal+0x9582>
   2a220:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a225:	4c 89 fb             	mov    %r15,%rbx
   2a228:	49 83 c4 01          	add    $0x1,%r12
   2a22c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a230:	49 89 c2             	mov    %rax,%r10
   2a233:	e9 78 b5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a238:	f3 0f 1e fa          	endbr64
   2a23c:	8b 53 f8             	mov    -0x8(%rbx),%edx
   2a23f:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a243:	85 d2                	test   %edx,%edx
   2a245:	0f 85 db 25 00 00    	jne    2c826 <JS_CallInternal+0x7396>
   2a24b:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2a250:	0f 84 d0 25 00 00    	je     2c826 <JS_CallInternal+0x7396>
   2a256:	83 c0 01             	add    $0x1,%eax
   2a259:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2a260:	00 
   2a261:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a265:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a26a:	49 83 c4 01          	add    $0x1,%r12
   2a26e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a272:	49 89 c2             	mov    %rax,%r10
   2a275:	e9 36 b5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a27a:	f3 0f 1e fa          	endbr64
   2a27e:	49 0f be 04 24       	movsbq (%r12),%rax
   2a283:	4d 8d 3c 04          	lea    (%r12,%rax,1),%r15
   2a287:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2a28e:	83 e8 01             	sub    $0x1,%eax
   2a291:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2a298:	85 c0                	test   %eax,%eax
   2a29a:	0f 8e 20 4a 00 00    	jle    2ecc0 <JS_CallInternal+0x9830>
   2a2a0:	41 0f b6 07          	movzbl (%r15),%eax
   2a2a4:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2a2a8:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a2ac:	49 89 c2             	mov    %rax,%r10
   2a2af:	e9 fc b4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a2b4:	f3 0f 1e fa          	endbr64
   2a2b8:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a2bc:	0b 53 e8             	or     -0x18(%rbx),%edx
   2a2bf:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a2c3:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a2c7:	0f 85 27 49 00 00    	jne    2ebf4 <JS_CallInternal+0x9764>
   2a2cd:	d3 e8                	shr    %cl,%eax
   2a2cf:	85 c0                	test   %eax,%eax
   2a2d1:	0f 88 32 27 00 00    	js     2ca09 <JS_CallInternal+0x7579>
   2a2d7:	66 0f 6e c0          	movd   %eax,%xmm0
   2a2db:	31 c0                	xor    %eax,%eax
   2a2dd:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a2e1:	48 83 eb 10          	sub    $0x10,%rbx
   2a2e5:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2a2ea:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a2ef:	49 83 c4 01          	add    $0x1,%r12
   2a2f3:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a2f7:	49 89 c2             	mov    %rax,%r10
   2a2fa:	e9 b1 b4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a2ff:	f3 0f 1e fa          	endbr64
   2a303:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a30a:	ba 01 00 00 00       	mov    $0x1,%edx
   2a30f:	48 89 de             	mov    %rbx,%rsi
   2a312:	4c 89 ef             	mov    %r13,%rdi
   2a315:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2a319:	e8 d2 59 07 00       	call   9fcf0 <js_for_of_start>
   2a31e:	85 c0                	test   %eax,%eax
   2a320:	0f 85 cd 53 00 00    	jne    2f6f3 <JS_CallInternal+0xa263>
   2a326:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2a32d:	00 
   2a32e:	49 83 c4 01          	add    $0x1,%r12
   2a332:	48 83 c3 20          	add    $0x20,%rbx
   2a336:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2a33d:	00 
   2a33e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a344:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a348:	49 89 c2             	mov    %rax,%r10
   2a34b:	e9 60 b4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a350:	f3 0f 1e fa          	endbr64
   2a354:	45 0f b6 0c 24       	movzbl (%r12),%r9d
   2a359:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a35d:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2a362:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a366:	49 c1 e1 04          	shl    $0x4,%r9
   2a36a:	4c 03 8d a0 fe ff ff 	add    -0x160(%rbp),%r9
   2a371:	89 ce                	mov    %ecx,%esi
   2a373:	49 8b 41 08          	mov    0x8(%r9),%rax
   2a377:	09 c6                	or     %eax,%esi
   2a379:	0f 85 37 3d 00 00    	jne    2e0b6 <JS_CallInternal+0x8c26>
   2a37f:	49 8b 01             	mov    (%r9),%rax
   2a382:	48 63 f2             	movslq %edx,%rsi
   2a385:	48 63 c8             	movslq %eax,%rcx
   2a388:	01 d0                	add    %edx,%eax
   2a38a:	48 01 f1             	add    %rsi,%rcx
   2a38d:	48 63 d0             	movslq %eax,%rdx
   2a390:	48 39 ca             	cmp    %rcx,%rdx
   2a393:	0f 85 05 3d 00 00    	jne    2e09e <JS_CallInternal+0x8c0e>
   2a399:	89 c0                	mov    %eax,%eax
   2a39b:	49 89 01             	mov    %rax,(%r9)
   2a39e:	31 c0                	xor    %eax,%eax
   2a3a0:	49 89 41 08          	mov    %rax,0x8(%r9)
   2a3a4:	48 83 eb 10          	sub    $0x10,%rbx
   2a3a8:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2a3ae:	49 83 c4 02          	add    $0x2,%r12
   2a3b2:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a3b6:	49 89 c2             	mov    %rax,%r10
   2a3b9:	e9 f2 b3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a3be:	f3 0f 1e fa          	endbr64
   2a3c2:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2a3c6:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a3cb:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2a3cf:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a3d2:	76 04                	jbe    2a3d8 <JS_CallInternal+0x4f48>
   2a3d4:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2a3d8:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a3df:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a3e3:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a3e7:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a3eb:	48 8b 08             	mov    (%rax),%rcx
   2a3ee:	48 89 70 08          	mov    %rsi,0x8(%rax)
   2a3f2:	48 89 38             	mov    %rdi,(%rax)
   2a3f5:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a3f8:	76 11                	jbe    2a40b <JS_CallInternal+0x4f7b>
   2a3fa:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a3fd:	83 e8 01             	sub    $0x1,%eax
   2a400:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a403:	85 c0                	test   %eax,%eax
   2a405:	0f 8e dd 33 00 00    	jle    2d7e8 <JS_CallInternal+0x8358>
   2a40b:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2a411:	49 83 c4 03          	add    $0x3,%r12
   2a415:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a419:	49 89 c2             	mov    %rax,%r10
   2a41c:	e9 8f b3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a421:	f3 0f 1e fa          	endbr64
   2a425:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a42a:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a431:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a436:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a43a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a43e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a442:	48 8b 08             	mov    (%rax),%rcx
   2a445:	0f 11 00             	movups %xmm0,(%rax)
   2a448:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a44b:	76 11                	jbe    2a45e <JS_CallInternal+0x4fce>
   2a44d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a450:	83 e8 01             	sub    $0x1,%eax
   2a453:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a456:	85 c0                	test   %eax,%eax
   2a458:	0f 8e e5 33 00 00    	jle    2d843 <JS_CallInternal+0x83b3>
   2a45e:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2a464:	48 83 eb 10          	sub    $0x10,%rbx
   2a468:	49 83 c4 03          	add    $0x3,%r12
   2a46c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a470:	49 89 c2             	mov    %rax,%r10
   2a473:	e9 38 b3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a478:	f3 0f 1e fa          	endbr64
   2a47c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a480:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a484:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a488:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a48c:	89 cf                	mov    %ecx,%edi
   2a48e:	09 f7                	or     %esi,%edi
   2a490:	0f 85 b1 45 00 00    	jne    2ea47 <JS_CallInternal+0x95b7>
   2a496:	39 d0                	cmp    %edx,%eax
   2a498:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2a49f:	00 
   2a4a0:	0f 9e c0             	setle  %al
   2a4a3:	48 83 eb 10          	sub    $0x10,%rbx
   2a4a7:	0f b6 c0             	movzbl %al,%eax
   2a4aa:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a4ae:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a4b3:	49 83 c4 01          	add    $0x1,%r12
   2a4b7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a4bb:	49 89 c2             	mov    %rax,%r10
   2a4be:	e9 ed b2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a4c3:	f3 0f 1e fa          	endbr64
   2a4c7:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a4cb:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a4cf:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a4d3:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a4d7:	89 cf                	mov    %ecx,%edi
   2a4d9:	09 f7                	or     %esi,%edi
   2a4db:	0f 85 60 46 00 00    	jne    2eb41 <JS_CallInternal+0x96b1>
   2a4e1:	39 d0                	cmp    %edx,%eax
   2a4e3:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2a4ea:	00 
   2a4eb:	0f 9c c0             	setl   %al
   2a4ee:	48 83 eb 10          	sub    $0x10,%rbx
   2a4f2:	0f b6 c0             	movzbl %al,%eax
   2a4f5:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a4f9:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a4fe:	49 83 c4 01          	add    $0x1,%r12
   2a502:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a506:	49 89 c2             	mov    %rax,%r10
   2a509:	e9 a2 b2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a50e:	f3 0f 1e fa          	endbr64
   2a512:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a516:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2a51a:	4c 8b 7b d0          	mov    -0x30(%rbx),%r15
   2a51e:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2a525:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2a529:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2a530:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a534:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2a538:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2a53f:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2a543:	0f 85 79 46 00 00    	jne    2ebc2 <JS_CallInternal+0x9732>
   2a549:	83 f8 f8             	cmp    $0xfffffff8,%eax
   2a54c:	0f 85 ee 42 00 00    	jne    2e840 <JS_CallInternal+0x93b0>
   2a552:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2a556:	e8 a5 dc fe ff       	call   18200 <js_get_atom_index>
   2a55b:	49 8b 4f 18          	mov    0x18(%r15),%rcx
   2a55f:	89 c6                	mov    %eax,%esi
   2a561:	8b 41 18             	mov    0x18(%rcx),%eax
   2a564:	89 f2                	mov    %esi,%edx
   2a566:	21 c2                	and    %eax,%edx
   2a568:	8b 54 91 38          	mov    0x38(%rcx,%rdx,4),%edx
   2a56c:	48 85 d2             	test   %rdx,%rdx
   2a56f:	0f 84 18 1b 00 00    	je     2c08d <JS_CallInternal+0x6bfd>
   2a575:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2a57c:	00 
   2a57d:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   2a582:	48 01 c8             	add    %rcx,%rax
   2a585:	3b 70 04             	cmp    0x4(%rax),%esi
   2a588:	0f 85 f1 1a 00 00    	jne    2c07f <JS_CallInternal+0x6bef>
   2a58e:	48 8d 0d af eb 0a 00 	lea    0xaebaf(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   2a595:	4c 89 ef             	mov    %r13,%rdi
   2a598:	31 c0                	xor    %eax,%eax
   2a59a:	4d 89 e7             	mov    %r12,%r15
   2a59d:	48 8d 15 b4 28 0b 00 	lea    0xb28b4(%rip),%rdx        # dce58 <_IO_stdin_used+0x3e58>
   2a5a4:	e8 a7 9f 00 00       	call   34550 <__JS_ThrowTypeErrorAtom>
   2a5a9:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   2a5b0:	76 1e                	jbe    2a5d0 <JS_CallInternal+0x5140>
   2a5b2:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2a5b9:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2a5bc:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2a5c2:	83 e8 01             	sub    $0x1,%eax
   2a5c5:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2a5c8:	85 c0                	test   %eax,%eax
   2a5ca:	0f 8e 6f 51 00 00    	jle    2f73f <JS_CallInternal+0xa2af>
   2a5d0:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2a5d7:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2a5db:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a5de:	0f 86 ec b5 ff ff    	jbe    25bd0 <JS_CallInternal+0x740>
   2a5e4:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2a5eb:	48 8b 0b             	mov    (%rbx),%rcx
   2a5ee:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2a5f1:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2a5f4:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a5f7:	85 d2                	test   %edx,%edx
   2a5f9:	0f 8f d1 b5 ff ff    	jg     25bd0 <JS_CallInternal+0x740>
   2a5ff:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2a603:	48 89 c2             	mov    %rax,%rdx
   2a606:	48 89 ce             	mov    %rcx,%rsi
   2a609:	e8 b2 43 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2a60e:	e9 bd b5 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2a613:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2a618:	f3 0f 1e fa          	endbr64
   2a61c:	44 8b 4b f8          	mov    -0x8(%rbx),%r9d
   2a620:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a624:	45 85 c9             	test   %r9d,%r9d
   2a627:	0f 85 83 21 00 00    	jne    2c7b0 <JS_CallInternal+0x7320>
   2a62d:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2a632:	0f 84 78 21 00 00    	je     2c7b0 <JS_CallInternal+0x7320>
   2a638:	83 e8 01             	sub    $0x1,%eax
   2a63b:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   2a642:	00 
   2a643:	48 89 03             	mov    %rax,(%rbx)
   2a646:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a64b:	48 83 c3 10          	add    $0x10,%rbx
   2a64f:	49 83 c4 01          	add    $0x1,%r12
   2a653:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a657:	49 89 c2             	mov    %rax,%r10
   2a65a:	e9 51 b1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a65f:	f3 0f 1e fa          	endbr64
   2a663:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a667:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a66b:	a9 f7 ff ff ff       	test   $0xfffffff7,%eax
   2a670:	74 1b                	je     2a68d <JS_CallInternal+0x51fd>
   2a672:	83 e8 01             	sub    $0x1,%eax
   2a675:	83 f8 01             	cmp    $0x1,%eax
   2a678:	0f 87 8a 2d 00 00    	ja     2d408 <JS_CallInternal+0x7f78>
   2a67e:	83 e2 ff             	and    $0xffffffff,%edx
   2a681:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2a688:	00 
   2a689:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2a68d:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a692:	49 83 c4 01          	add    $0x1,%r12
   2a696:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a69a:	49 89 c2             	mov    %rax,%r10
   2a69d:	e9 0e b1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a6a2:	f3 0f 1e fa          	endbr64
   2a6a6:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a6ab:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2a6b0:	48 89 c1             	mov    %rax,%rcx
   2a6b3:	48 c1 e0 04          	shl    $0x4,%rax
   2a6b7:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a6be:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a6c2:	83 fa 04             	cmp    $0x4,%edx
   2a6c5:	0f 84 55 38 00 00    	je     2df20 <JS_CallInternal+0x8a90>
   2a6cb:	48 8b 00             	mov    (%rax),%rax
   2a6ce:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a6d1:	76 04                	jbe    2a6d7 <JS_CallInternal+0x5247>
   2a6d3:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a6d7:	48 89 03             	mov    %rax,(%rbx)
   2a6da:	49 83 c4 03          	add    $0x3,%r12
   2a6de:	48 83 c3 10          	add    $0x10,%rbx
   2a6e2:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a6e6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a6ec:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a6f0:	49 89 c2             	mov    %rax,%r10
   2a6f3:	e9 b8 b0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a6f8:	f3 0f 1e fa          	endbr64
   2a6fc:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a701:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2a706:	48 89 c1             	mov    %rax,%rcx
   2a709:	48 c1 e0 04          	shl    $0x4,%rax
   2a70d:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a714:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a718:	83 fa 04             	cmp    $0x4,%edx
   2a71b:	0f 84 e5 3d 00 00    	je     2e506 <JS_CallInternal+0x9076>
   2a721:	48 8b 00             	mov    (%rax),%rax
   2a724:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a727:	76 04                	jbe    2a72d <JS_CallInternal+0x529d>
   2a729:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a72d:	48 89 03             	mov    %rax,(%rbx)
   2a730:	49 83 c4 03          	add    $0x3,%r12
   2a734:	48 83 c3 10          	add    $0x10,%rbx
   2a738:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a73c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a742:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a746:	49 89 c2             	mov    %rax,%r10
   2a749:	e9 62 b0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a74e:	f3 0f 1e fa          	endbr64
   2a752:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a757:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2a75c:	48 89 c1             	mov    %rax,%rcx
   2a75f:	48 c1 e0 04          	shl    $0x4,%rax
   2a763:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a76a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a76e:	83 fa 04             	cmp    $0x4,%edx
   2a771:	0f 84 29 3a 00 00    	je     2e1a0 <JS_CallInternal+0x8d10>
   2a777:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a77c:	48 8b 08             	mov    (%rax),%rcx
   2a77f:	0f 11 00             	movups %xmm0,(%rax)
   2a782:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a785:	76 11                	jbe    2a798 <JS_CallInternal+0x5308>
   2a787:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a78a:	83 e8 01             	sub    $0x1,%eax
   2a78d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a790:	85 c0                	test   %eax,%eax
   2a792:	0f 8e 89 32 00 00    	jle    2da21 <JS_CallInternal+0x8591>
   2a798:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2a79e:	48 83 eb 10          	sub    $0x10,%rbx
   2a7a2:	49 83 c4 03          	add    $0x3,%r12
   2a7a6:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a7aa:	49 89 c2             	mov    %rax,%r10
   2a7ad:	e9 fe af ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a7b2:	f3 0f 1e fa          	endbr64
   2a7b6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a7ba:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a7be:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2a7c3:	83 fa 03             	cmp    $0x3,%edx
   2a7c6:	0f 87 ea 24 00 00    	ja     2ccb6 <JS_CallInternal+0x7826>
   2a7cc:	48 83 eb 10          	sub    $0x10,%rbx
   2a7d0:	85 c0                	test   %eax,%eax
   2a7d2:	74 0c                	je     2a7e0 <JS_CallInternal+0x5350>
   2a7d4:	41 8b 04 24          	mov    (%r12),%eax
   2a7d8:	83 e8 04             	sub    $0x4,%eax
   2a7db:	48 98                	cltq
   2a7dd:	49 01 c7             	add    %rax,%r15
   2a7e0:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2a7e7:	83 e8 01             	sub    $0x1,%eax
   2a7ea:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2a7f1:	85 c0                	test   %eax,%eax
   2a7f3:	0f 8e 75 39 00 00    	jle    2e16e <JS_CallInternal+0x8cde>
   2a7f9:	41 0f b6 07          	movzbl (%r15),%eax
   2a7fd:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2a801:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a805:	49 89 c2             	mov    %rax,%r10
   2a808:	e9 a3 af ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a80d:	f3 0f 1e fa          	endbr64
   2a811:	49 63 04 24          	movslq (%r12),%rax
   2a815:	4d 8d 3c 04          	lea    (%r12,%rax,1),%r15
   2a819:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2a820:	83 e8 01             	sub    $0x1,%eax
   2a823:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2a82a:	85 c0                	test   %eax,%eax
   2a82c:	0f 8e 73 44 00 00    	jle    2eca5 <JS_CallInternal+0x9815>
   2a832:	41 0f b6 07          	movzbl (%r15),%eax
   2a836:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2a83a:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a83e:	49 89 c2             	mov    %rax,%r10
   2a841:	e9 6a af ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a846:	f3 0f 1e fa          	endbr64
   2a84a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a84e:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a852:	4c 89 ef             	mov    %r13,%rdi
   2a855:	4d 89 e7             	mov    %r12,%r15
   2a858:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a85f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2a863:	e8 a8 57 04 00       	call   70010 <build_for_in_iterator>
   2a868:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a86c:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a870:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2a874:	0f 84 56 b3 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2a87a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a87f:	49 83 c4 01          	add    $0x1,%r12
   2a883:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a887:	49 89 c2             	mov    %rax,%r10
   2a88a:	e9 21 af ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a88f:	f3 0f 1e fa          	endbr64
   2a893:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a89a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a89f:	48 83 eb 10          	sub    $0x10,%rbx
   2a8a3:	48 8b 40 10          	mov    0x10(%rax),%rax
   2a8a7:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a8ab:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a8af:	48 8b 08             	mov    (%rax),%rcx
   2a8b2:	0f 11 00             	movups %xmm0,(%rax)
   2a8b5:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a8b8:	76 11                	jbe    2a8cb <JS_CallInternal+0x543b>
   2a8ba:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a8bd:	83 e8 01             	sub    $0x1,%eax
   2a8c0:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a8c3:	85 c0                	test   %eax,%eax
   2a8c5:	0f 8e b7 34 00 00    	jle    2dd82 <JS_CallInternal+0x88f2>
   2a8cb:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a8d0:	49 83 c4 01          	add    $0x1,%r12
   2a8d4:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a8d8:	49 89 c2             	mov    %rax,%r10
   2a8db:	e9 d0 ae ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a8e0:	f3 0f 1e fa          	endbr64
   2a8e4:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2a8e8:	41 8b 0c 24          	mov    (%r12),%ecx
   2a8ec:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2a8f1:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2a8f5:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2a8f9:	0f 85 04 22 00 00    	jne    2cb03 <JS_CallInternal+0x7673>
   2a8ff:	49 8b 72 18          	mov    0x18(%r10),%rsi
   2a903:	8b 46 18             	mov    0x18(%rsi),%eax
   2a906:	89 c2                	mov    %eax,%edx
   2a908:	21 ca                	and    %ecx,%edx
   2a90a:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   2a90e:	48 85 d2             	test   %rdx,%rdx
   2a911:	0f 84 ec 21 00 00    	je     2cb03 <JS_CallInternal+0x7673>
   2a917:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2a91e:	00 
   2a91f:	48 83 ea 01          	sub    $0x1,%rdx
   2a923:	48 8d 04 d7          	lea    (%rdi,%rdx,8),%rax
   2a927:	48 01 f0             	add    %rsi,%rax
   2a92a:	3b 48 04             	cmp    0x4(%rax),%ecx
   2a92d:	0f 85 c2 21 00 00    	jne    2caf5 <JS_CallInternal+0x7665>
   2a933:	0f b6 40 03          	movzbl 0x3(%rax),%eax
   2a937:	49 8b 72 20          	mov    0x20(%r10),%rsi
   2a93b:	c0 e8 02             	shr    $0x2,%al
   2a93e:	83 e0 3a             	and    $0x3a,%eax
   2a941:	3c 02                	cmp    $0x2,%al
   2a943:	0f 85 ba 21 00 00    	jne    2cb03 <JS_CallInternal+0x7673>
   2a949:	48 c1 e2 04          	shl    $0x4,%rdx
   2a94d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a952:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
   2a956:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a95a:	48 8b 08             	mov    (%rax),%rcx
   2a95d:	0f 11 00             	movups %xmm0,(%rax)
   2a960:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a963:	76 11                	jbe    2a976 <JS_CallInternal+0x54e6>
   2a965:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a968:	83 e8 01             	sub    $0x1,%eax
   2a96b:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a96e:	85 c0                	test   %eax,%eax
   2a970:	0f 8e d5 45 00 00    	jle    2ef4b <JS_CallInternal+0x9abb>
   2a976:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2a97a:	76 13                	jbe    2a98f <JS_CallInternal+0x54ff>
   2a97c:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2a980:	83 e8 01             	sub    $0x1,%eax
   2a983:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2a987:	85 c0                	test   %eax,%eax
   2a989:	0f 8e 91 44 00 00    	jle    2ee20 <JS_CallInternal+0x9990>
   2a98f:	48 83 eb 20          	sub    $0x20,%rbx
   2a993:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2a999:	49 83 c4 05          	add    $0x5,%r12
   2a99d:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a9a1:	49 89 c2             	mov    %rax,%r10
   2a9a4:	e9 07 ae ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a9a9:	f3 0f 1e fa          	endbr64
   2a9ad:	49 0f bf 04 24       	movswq (%r12),%rax
   2a9b2:	4d 8d 3c 04          	lea    (%r12,%rax,1),%r15
   2a9b6:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2a9bd:	83 e8 01             	sub    $0x1,%eax
   2a9c0:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2a9c7:	85 c0                	test   %eax,%eax
   2a9c9:	0f 8e b9 37 00 00    	jle    2e188 <JS_CallInternal+0x8cf8>
   2a9cf:	41 0f b6 07          	movzbl (%r15),%eax
   2a9d3:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2a9d7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2a9db:	49 89 c2             	mov    %rax,%r10
   2a9de:	e9 cd ad ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2a9e3:	f3 0f 1e fa          	endbr64
   2a9e7:	49 8b b5 90 01 00 00 	mov    0x190(%r13),%rsi
   2a9ee:	41 8b 0c 24          	mov    (%r12),%ecx
   2a9f2:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2a9f7:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a9fe:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
   2aa02:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2aa06:	89 c8                	mov    %ecx,%eax
   2aa08:	8b 57 18             	mov    0x18(%rdi),%edx
   2aa0b:	21 d0                	and    %edx,%eax
   2aa0d:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2aa11:	48 85 c0             	test   %rax,%rax
   2aa14:	0f 84 30 2c 00 00    	je     2d64a <JS_CallInternal+0x81ba>
   2aa1a:	4c 8d 04 95 3c 00 00 	lea    0x3c(,%rdx,4),%r8
   2aa21:	00 
   2aa22:	48 83 e8 01          	sub    $0x1,%rax
   2aa26:	49 8d 14 c0          	lea    (%r8,%rax,8),%rdx
   2aa2a:	48 01 fa             	add    %rdi,%rdx
   2aa2d:	39 4a 04             	cmp    %ecx,0x4(%rdx)
   2aa30:	0f 85 07 2c 00 00    	jne    2d63d <JS_CallInternal+0x81ad>
   2aa36:	48 c1 e0 04          	shl    $0x4,%rax
   2aa3a:	48 03 46 20          	add    0x20(%rsi),%rax
   2aa3e:	48 8b 00             	mov    (%rax),%rax
   2aa41:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aa45:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2aa49:	0f 84 76 35 00 00    	je     2dfc5 <JS_CallInternal+0x8b35>
   2aa4f:	f6 42 03 08          	testb  $0x8,0x3(%rdx)
   2aa53:	0f 84 9f 43 00 00    	je     2edf8 <JS_CallInternal+0x9968>
   2aa59:	49 8b 85 98 01 00 00 	mov    0x198(%r13),%rax
   2aa60:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aa63:	76 04                	jbe    2aa69 <JS_CallInternal+0x55d9>
   2aa65:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2aa69:	48 89 33             	mov    %rsi,(%rbx)
   2aa6c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2aa70:	89 ce                	mov    %ecx,%esi
   2aa72:	31 d2                	xor    %edx,%edx
   2aa74:	4c 89 ef             	mov    %r13,%rdi
   2aa77:	48 83 c3 20          	add    $0x20,%rbx
   2aa7b:	e8 40 14 01 00       	call   3bec0 <__JS_AtomToValue>
   2aa80:	49 83 c4 05          	add    $0x5,%r12
   2aa84:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2aa88:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2aa8c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2aa92:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2aa96:	49 89 c2             	mov    %rax,%r10
   2aa99:	e9 12 ad ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2aa9e:	f3 0f 1e fa          	endbr64
   2aaa2:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2aaa9:	31 d2                	xor    %edx,%edx
   2aaab:	48 89 de             	mov    %rbx,%rsi
   2aaae:	4c 89 ef             	mov    %r13,%rdi
   2aab1:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2aab5:	e8 36 52 07 00       	call   9fcf0 <js_for_of_start>
   2aaba:	85 c0                	test   %eax,%eax
   2aabc:	0f 85 8e 53 00 00    	jne    2fe50 <JS_CallInternal+0xa9c0>
   2aac2:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2aac9:	00 
   2aaca:	49 83 c4 01          	add    $0x1,%r12
   2aace:	48 83 c3 20          	add    $0x20,%rbx
   2aad2:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2aad9:	00 
   2aada:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2aae0:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2aae4:	49 89 c2             	mov    %rax,%r10
   2aae7:	e9 c4 ac ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2aaec:	f3 0f 1e fa          	endbr64
   2aaf0:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2aaf7:	48 89 de             	mov    %rbx,%rsi
   2aafa:	4c 89 ef             	mov    %r13,%rdi
   2aafd:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ab01:	e8 9a b0 05 00       	call   85ba0 <js_for_in_next>
   2ab06:	85 c0                	test   %eax,%eax
   2ab08:	0f 85 96 51 00 00    	jne    2fca4 <JS_CallInternal+0xa814>
   2ab0e:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ab13:	48 83 c3 20          	add    $0x20,%rbx
   2ab17:	49 83 c4 01          	add    $0x1,%r12
   2ab1b:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2ab1f:	49 89 c2             	mov    %rax,%r10
   2ab22:	e9 89 ac ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2ab27:	f3 0f 1e fa          	endbr64
   2ab2b:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   2ab30:	41 ba fd ff ff ff    	mov    $0xfffffffd,%r10d
   2ab36:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2ab3b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ab42:	c7 85 dc fe ff ff 01 	movl   $0x1,-0x124(%rbp)
   2ab49:	00 00 00 
   2ab4c:	41 29 ca             	sub    %ecx,%r10d
   2ab4f:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2ab53:	4d 63 d2             	movslq %r10d,%r10
   2ab56:	49 c1 e2 04          	shl    $0x4,%r10
   2ab5a:	49 01 da             	add    %rbx,%r10
   2ab5d:	49 8b 52 08          	mov    0x8(%r10),%rdx
   2ab61:	83 fa 03             	cmp    $0x3,%edx
   2ab64:	0f 84 fe 33 00 00    	je     2df68 <JS_CallInternal+0x8ad8>
   2ab6a:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   2ab6f:	49 8b 32             	mov    (%r10),%rsi
   2ab72:	4c 89 ef             	mov    %r13,%rdi
   2ab75:	4c 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%r9
   2ab7c:	29 c8                	sub    %ecx,%eax
   2ab7e:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2ab85:	48 98                	cltq
   2ab87:	48 c1 e0 04          	shl    $0x4,%rax
   2ab8b:	48 01 d8             	add    %rbx,%rax
   2ab8e:	48 8b 08             	mov    (%rax),%rcx
   2ab91:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2ab95:	e8 c6 68 07 00       	call   a1460 <JS_IteratorNext.constprop.0>
   2ab9a:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2aba1:	48 89 c1             	mov    %rax,%rcx
   2aba4:	83 fa 06             	cmp    $0x6,%edx
   2aba7:	48 89 d0             	mov    %rdx,%rax
   2abaa:	48 89 d6             	mov    %rdx,%rsi
   2abad:	48 89 cf             	mov    %rcx,%rdi
   2abb0:	0f 84 87 33 00 00    	je     2df3d <JS_CallInternal+0x8aad>
   2abb6:	44 8b 85 dc fe ff ff 	mov    -0x124(%rbp),%r8d
   2abbd:	31 d2                	xor    %edx,%edx
   2abbf:	45 85 c0             	test   %r8d,%r8d
   2abc2:	0f 85 70 28 00 00    	jne    2d438 <JS_CallInternal+0x7fa8>
   2abc8:	48 89 3b             	mov    %rdi,(%rbx)
   2abcb:	49 83 c4 02          	add    $0x2,%r12
   2abcf:	48 83 c3 20          	add    $0x20,%rbx
   2abd3:	48 89 73 e8          	mov    %rsi,-0x18(%rbx)
   2abd7:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2abdb:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2abe2:	00 
   2abe3:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2abe9:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2abed:	49 89 c2             	mov    %rax,%r10
   2abf0:	e9 bb ab ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2abf5:	f3 0f 1e fa          	endbr64
   2abf9:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   2abfe:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2ac05:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2ac0a:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   2ac0e:	48 8b 50 18          	mov    0x18(%rax),%rdx
   2ac12:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2ac16:	83 f8 04             	cmp    $0x4,%eax
   2ac19:	0f 84 4b 34 00 00    	je     2e06a <JS_CallInternal+0x8bda>
   2ac1f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2ac24:	48 8b 0a             	mov    (%rdx),%rcx
   2ac27:	0f 11 02             	movups %xmm0,(%rdx)
   2ac2a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ac2d:	76 11                	jbe    2ac40 <JS_CallInternal+0x57b0>
   2ac2f:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2ac32:	83 ea 01             	sub    $0x1,%edx
   2ac35:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2ac38:	85 d2                	test   %edx,%edx
   2ac3a:	0f 8e 64 31 00 00    	jle    2dda4 <JS_CallInternal+0x8914>
   2ac40:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2ac46:	48 83 eb 10          	sub    $0x10,%rbx
   2ac4a:	49 83 c4 03          	add    $0x3,%r12
   2ac4e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2ac52:	49 89 c2             	mov    %rax,%r10
   2ac55:	e9 56 ab ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2ac5a:	f3 0f 1e fa          	endbr64
   2ac5e:	41 0f b7 14 24       	movzwl (%r12),%edx
   2ac63:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2ac6a:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2ac6f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   2ac73:	48 8b 40 18          	mov    0x18(%rax),%rax
   2ac77:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2ac7b:	0f 85 f0 3f 00 00    	jne    2ec71 <JS_CallInternal+0x97e1>
   2ac81:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2ac86:	49 83 c4 03          	add    $0x3,%r12
   2ac8a:	48 83 eb 10          	sub    $0x10,%rbx
   2ac8e:	0f 11 00             	movups %xmm0,(%rax)
   2ac91:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ac97:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2ac9b:	49 89 c2             	mov    %rax,%r10
   2ac9e:	e9 0d ab ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2aca3:	f3 0f 1e fa          	endbr64
   2aca7:	48 89 d8             	mov    %rbx,%rax
   2acaa:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2acae:	48 83 eb 30          	sub    $0x30,%rbx
   2acb2:	48 8b 0b             	mov    (%rbx),%rcx
   2acb5:	48 8b 78 e0          	mov    -0x20(%rax),%rdi
   2acb9:	48 8b 40 e8          	mov    -0x18(%rax),%rax
   2acbd:	49 8b 37             	mov    (%r15),%rsi
   2acc0:	49 8b 57 08          	mov    0x8(%r15),%rdx
   2acc4:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2accb:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2acd2:	83 7b 08 ff          	cmpl   $0xffffffff,0x8(%rbx)
   2acd6:	0f 85 0e 33 00 00    	jne    2dfea <JS_CallInternal+0x8b5a>
   2acdc:	83 fa f8             	cmp    $0xfffffff8,%edx
   2acdf:	0f 85 94 32 00 00    	jne    2df79 <JS_CallInternal+0x8ae9>
   2ace5:	49 8b 45 10          	mov    0x10(%r13),%rax
   2ace9:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2acf0:	48 89 c7             	mov    %rax,%rdi
   2acf3:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2acfa:	e8 01 d5 fe ff       	call   18200 <js_get_atom_index>
   2acff:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ad06:	89 c6                	mov    %eax,%esi
   2ad08:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   2ad0c:	8b 57 18             	mov    0x18(%rdi),%edx
   2ad0f:	21 d0                	and    %edx,%eax
   2ad11:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2ad15:	48 85 c0             	test   %rax,%rax
   2ad18:	0f 84 5f 41 00 00    	je     2ee7d <JS_CallInternal+0x99ed>
   2ad1e:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2ad25:	00 
   2ad26:	48 83 e8 01          	sub    $0x1,%rax
   2ad2a:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2ad2e:	48 01 fa             	add    %rdi,%rdx
   2ad31:	3b 72 04             	cmp    0x4(%rdx),%esi
   2ad34:	0f 85 36 41 00 00    	jne    2ee70 <JS_CallInternal+0x99e0>
   2ad3a:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2ad41:	48 c1 e0 04          	shl    $0x4,%rax
   2ad45:	48 03 41 20          	add    0x20(%rcx),%rax
   2ad49:	48 8b 08             	mov    (%rax),%rcx
   2ad4c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2ad50:	48 89 30             	mov    %rsi,(%rax)
   2ad53:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2ad5a:	48 89 70 08          	mov    %rsi,0x8(%rax)
   2ad5e:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ad61:	76 11                	jbe    2ad74 <JS_CallInternal+0x58e4>
   2ad63:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2ad66:	83 e8 01             	sub    $0x1,%eax
   2ad69:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2ad6c:	85 c0                	test   %eax,%eax
   2ad6e:	0f 8e e2 32 00 00    	jle    2e056 <JS_CallInternal+0x8bc6>
   2ad74:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2ad78:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ad7b:	0f 87 5f 1a 00 00    	ja     2c7e0 <JS_CallInternal+0x7350>
   2ad81:	49 8b 47 08          	mov    0x8(%r15),%rax
   2ad85:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ad88:	76 14                	jbe    2ad9e <JS_CallInternal+0x590e>
   2ad8a:	49 8b 17             	mov    (%r15),%rdx
   2ad8d:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2ad90:	83 e9 01             	sub    $0x1,%ecx
   2ad93:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2ad96:	85 c9                	test   %ecx,%ecx
   2ad98:	0f 8e cb 2b 00 00    	jle    2d969 <JS_CallInternal+0x84d9>
   2ad9e:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ada3:	49 83 c4 01          	add    $0x1,%r12
   2ada7:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2adab:	49 89 c2             	mov    %rax,%r10
   2adae:	e9 fd a9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2adb3:	f3 0f 1e fa          	endbr64
   2adb7:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2adbb:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2adbf:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2adc2:	76 04                	jbe    2adc8 <JS_CallInternal+0x5938>
   2adc4:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2adc8:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2adcf:	48 8b 00             	mov    (%rax),%rax
   2add2:	48 8b 40 18          	mov    0x18(%rax),%rax
   2add6:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2adda:	48 8b 38             	mov    (%rax),%rdi
   2addd:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2ade1:	48 89 30             	mov    %rsi,(%rax)
   2ade4:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ade7:	76 11                	jbe    2adfa <JS_CallInternal+0x596a>
   2ade9:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2adec:	83 e8 01             	sub    $0x1,%eax
   2adef:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2adf2:	85 c0                	test   %eax,%eax
   2adf4:	0f 8e 5e 2b 00 00    	jle    2d958 <JS_CallInternal+0x84c8>
   2adfa:	41 0f b6 04 24       	movzbl (%r12),%eax
   2adff:	49 83 c4 01          	add    $0x1,%r12
   2ae03:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2ae07:	49 89 c2             	mov    %rax,%r10
   2ae0a:	e9 a1 a9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2ae0f:	f3 0f 1e fa          	endbr64
   2ae13:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2ae1a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2ae1f:	48 83 eb 10          	sub    $0x10,%rbx
   2ae23:	48 8b 40 18          	mov    0x18(%rax),%rax
   2ae27:	48 8b 40 18          	mov    0x18(%rax),%rax
   2ae2b:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2ae2f:	48 8b 08             	mov    (%rax),%rcx
   2ae32:	0f 11 00             	movups %xmm0,(%rax)
   2ae35:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ae38:	76 11                	jbe    2ae4b <JS_CallInternal+0x59bb>
   2ae3a:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2ae3d:	83 e8 01             	sub    $0x1,%eax
   2ae40:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2ae43:	85 c0                	test   %eax,%eax
   2ae45:	0f 8e 6d 2f 00 00    	jle    2ddb8 <JS_CallInternal+0x8928>
   2ae4b:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ae50:	49 83 c4 01          	add    $0x1,%r12
   2ae54:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2ae58:	49 89 c2             	mov    %rax,%r10
   2ae5b:	e9 50 a9 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2ae60:	f3 0f 1e fa          	endbr64
   2ae64:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2ae68:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2ae6c:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2ae6f:	76 04                	jbe    2ae75 <JS_CallInternal+0x59e5>
   2ae71:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2ae75:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2ae7c:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ae80:	48 8b 40 18          	mov    0x18(%rax),%rax
   2ae84:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2ae88:	48 8b 38             	mov    (%rax),%rdi
   2ae8b:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2ae8f:	48 89 30             	mov    %rsi,(%rax)
   2ae92:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ae95:	76 11                	jbe    2aea8 <JS_CallInternal+0x5a18>
   2ae97:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2ae9a:	83 e8 01             	sub    $0x1,%eax
   2ae9d:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2aea0:	85 c0                	test   %eax,%eax
   2aea2:	0f 8e 32 2f 00 00    	jle    2ddda <JS_CallInternal+0x894a>
   2aea8:	41 0f b6 04 24       	movzbl (%r12),%eax
   2aead:	49 83 c4 01          	add    $0x1,%r12
   2aeb1:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2aeb5:	49 89 c2             	mov    %rax,%r10
   2aeb8:	e9 f3 a8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2aebd:	f3 0f 1e fa          	endbr64
   2aec1:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2aec8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2aecd:	48 83 eb 10          	sub    $0x10,%rbx
   2aed1:	48 8b 00             	mov    (%rax),%rax
   2aed4:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aed8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aedc:	48 8b 08             	mov    (%rax),%rcx
   2aedf:	0f 11 00             	movups %xmm0,(%rax)
   2aee2:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aee5:	76 11                	jbe    2aef8 <JS_CallInternal+0x5a68>
   2aee7:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2aeea:	83 e8 01             	sub    $0x1,%eax
   2aeed:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2aef0:	85 c0                	test   %eax,%eax
   2aef2:	0f 8e d1 2e 00 00    	jle    2ddc9 <JS_CallInternal+0x8939>
   2aef8:	41 0f b6 04 24       	movzbl (%r12),%eax
   2aefd:	49 83 c4 01          	add    $0x1,%r12
   2af01:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2af05:	49 89 c2             	mov    %rax,%r10
   2af08:	e9 a3 a8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2af0d:	f3 0f 1e fa          	endbr64
   2af11:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2af18:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   2af1c:	48 8b 40 18          	mov    0x18(%rax),%rax
   2af20:	48 8b 40 18          	mov    0x18(%rax),%rax
   2af24:	48 8b 10             	mov    (%rax),%rdx
   2af27:	48 8b 40 08          	mov    0x8(%rax),%rax
   2af2b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2af2e:	76 04                	jbe    2af34 <JS_CallInternal+0x5aa4>
   2af30:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2af34:	48 89 13             	mov    %rdx,(%rbx)
   2af37:	49 83 c4 01          	add    $0x1,%r12
   2af3b:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2af3f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2af45:	48 89 f3             	mov    %rsi,%rbx
   2af48:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2af4c:	49 89 c2             	mov    %rax,%r10
   2af4f:	e9 5c a8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2af54:	f3 0f 1e fa          	endbr64
   2af58:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2af5f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2af64:	48 83 eb 10          	sub    $0x10,%rbx
   2af68:	48 8b 40 08          	mov    0x8(%rax),%rax
   2af6c:	48 8b 40 18          	mov    0x18(%rax),%rax
   2af70:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2af74:	48 8b 08             	mov    (%rax),%rcx
   2af77:	0f 11 00             	movups %xmm0,(%rax)
   2af7a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2af7d:	76 11                	jbe    2af90 <JS_CallInternal+0x5b00>
   2af7f:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2af82:	83 e8 01             	sub    $0x1,%eax
   2af85:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2af88:	85 c0                	test   %eax,%eax
   2af8a:	0f 8e 03 2e 00 00    	jle    2dd93 <JS_CallInternal+0x8903>
   2af90:	41 0f b6 04 24       	movzbl (%r12),%eax
   2af95:	49 83 c4 01          	add    $0x1,%r12
   2af99:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2af9d:	49 89 c2             	mov    %rax,%r10
   2afa0:	e9 0b a8 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2afa5:	f3 0f 1e fa          	endbr64
   2afa9:	41 0f b7 04 24       	movzwl (%r12),%eax
   2afae:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2afb5:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2afb9:	48 8b 40 18          	mov    0x18(%rax),%rax
   2afbd:	48 8b 10             	mov    (%rax),%rdx
   2afc0:	48 8b 40 08          	mov    0x8(%rax),%rax
   2afc4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2afc7:	76 04                	jbe    2afcd <JS_CallInternal+0x5b3d>
   2afc9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2afcd:	48 89 13             	mov    %rdx,(%rbx)
   2afd0:	49 83 c4 03          	add    $0x3,%r12
   2afd4:	48 83 c3 10          	add    $0x10,%rbx
   2afd8:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2afdc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2afe2:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2afe6:	49 89 c2             	mov    %rax,%r10
   2afe9:	e9 c2 a7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2afee:	f3 0f 1e fa          	endbr64
   2aff2:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2aff6:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2affa:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2affd:	76 04                	jbe    2b003 <JS_CallInternal+0x5b73>
   2afff:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2b003:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2b00a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2b00e:	48 8b 40 18          	mov    0x18(%rax),%rax
   2b012:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b016:	48 8b 38             	mov    (%rax),%rdi
   2b019:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2b01d:	48 89 30             	mov    %rsi,(%rax)
   2b020:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b023:	76 11                	jbe    2b036 <JS_CallInternal+0x5ba6>
   2b025:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2b028:	83 e8 01             	sub    $0x1,%eax
   2b02b:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2b02e:	85 c0                	test   %eax,%eax
   2b030:	0f 8e 3b 2d 00 00    	jle    2dd71 <JS_CallInternal+0x88e1>
   2b036:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b03b:	49 83 c4 01          	add    $0x1,%r12
   2b03f:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b043:	49 89 c2             	mov    %rax,%r10
   2b046:	e9 65 a7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b04b:	f3 0f 1e fa          	endbr64
   2b04f:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   2b054:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2b05b:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2b060:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   2b064:	48 8b 40 18          	mov    0x18(%rax),%rax
   2b068:	48 8b 10             	mov    (%rax),%rdx
   2b06b:	48 8b 40 08          	mov    0x8(%rax),%rax
   2b06f:	83 f8 04             	cmp    $0x4,%eax
   2b072:	0f 84 a3 3b 00 00    	je     2ec1b <JS_CallInternal+0x978b>
   2b078:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b07b:	76 04                	jbe    2b081 <JS_CallInternal+0x5bf1>
   2b07d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2b081:	48 89 13             	mov    %rdx,(%rbx)
   2b084:	49 83 c4 03          	add    $0x3,%r12
   2b088:	48 83 c3 10          	add    $0x10,%rbx
   2b08c:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b090:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b096:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b09a:	49 89 c2             	mov    %rax,%r10
   2b09d:	e9 0e a7 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b0a2:	f3 0f 1e fa          	endbr64
   2b0a6:	49 63 04 24          	movslq (%r12),%rax
   2b0aa:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2b0b1:	49 8d 54 24 04       	lea    0x4(%r12),%rdx
   2b0b6:	48 83 c3 10          	add    $0x10,%rbx
   2b0ba:	2b 51 18             	sub    0x18(%rcx),%edx
   2b0bd:	4c 01 e0             	add    %r12,%rax
   2b0c0:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b0c7:	00 
   2b0c8:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2b0cc:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2b0d0:	0f b6 00             	movzbl (%rax),%eax
   2b0d3:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b0d7:	49 89 c2             	mov    %rax,%r10
   2b0da:	e9 d1 a6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b0df:	f3 0f 1e fa          	endbr64
   2b0e3:	49 63 04 24          	movslq (%r12),%rax
   2b0e7:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2b0ee:	48 83 c3 10          	add    $0x10,%rbx
   2b0f2:	4c 01 e0             	add    %r12,%rax
   2b0f5:	2b 41 18             	sub    0x18(%rcx),%eax
   2b0f8:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b0ff:	00 
   2b100:	49 83 c4 05          	add    $0x5,%r12
   2b104:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b108:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b10e:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b112:	49 89 c2             	mov    %rax,%r10
   2b115:	e9 96 a6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b11a:	f3 0f 1e fa          	endbr64
   2b11e:	8b 53 f8             	mov    -0x8(%rbx),%edx
   2b121:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b125:	85 d2                	test   %edx,%edx
   2b127:	0f 85 51 22 00 00    	jne    2d37e <JS_CallInternal+0x7eee>
   2b12d:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2b134:	3b 41 20             	cmp    0x20(%rcx),%eax
   2b137:	0f 83 41 22 00 00    	jae    2d37e <JS_CallInternal+0x7eee>
   2b13d:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2b144:	89 c0                	mov    %eax,%eax
   2b146:	48 83 eb 10          	sub    $0x10,%rbx
   2b14a:	48 03 41 18          	add    0x18(%rcx),%rax
   2b14e:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2b152:	0f b6 00             	movzbl (%rax),%eax
   2b155:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b159:	49 89 c2             	mov    %rax,%r10
   2b15c:	e9 4f a6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b161:	f3 0f 1e fa          	endbr64
   2b165:	41 8b 34 24          	mov    (%r12),%esi
   2b169:	4c 89 ef             	mov    %r13,%rdi
   2b16c:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b171:	e8 aa b8 00 00       	call   36a20 <JS_NewSymbolFromAtom.constprop.0>
   2b176:	83 fa 06             	cmp    $0x6,%edx
   2b179:	0f 84 51 aa ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2b17f:	48 89 03             	mov    %rax,(%rbx)
   2b182:	49 83 c4 05          	add    $0x5,%r12
   2b186:	48 83 c3 10          	add    $0x10,%rbx
   2b18a:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b18e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b194:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b198:	49 89 c2             	mov    %rax,%r10
   2b19b:	e9 10 a6 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b1a0:	f3 0f 1e fa          	endbr64
   2b1a4:	41 8b 04 24          	mov    (%r12),%eax
   2b1a8:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2b1ac:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b1b1:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2b1b5:	4c 01 e0             	add    %r12,%rax
   2b1b8:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2b1bc:	75 0c                	jne    2b1ca <JS_CallInternal+0x5d3a>
   2b1be:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2b1c4:	0f 84 b7 23 00 00    	je     2d581 <JS_CallInternal+0x80f1>
   2b1ca:	48 83 ec 08          	sub    $0x8,%rsp
   2b1ce:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b1d2:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b1d6:	4c 89 da             	mov    %r11,%rdx
   2b1d9:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2b1e0:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2b1e7:	4c 89 d6             	mov    %r10,%rsi
   2b1ea:	4c 89 ef             	mov    %r13,%rdi
   2b1ed:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2b1f4:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   2b1f8:	8b 48 14             	mov    0x14(%rax),%ecx
   2b1fb:	68 00 80 00 00       	push   $0x8000
   2b200:	41 53                	push   %r11
   2b202:	41 52                	push   %r10
   2b204:	e8 e7 5e 00 00       	call   310f0 <JS_SetPropertyInternal>
   2b209:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2b210:	48 83 c4 20          	add    $0x20,%rsp
   2b214:	89 c1                	mov    %eax,%ecx
   2b216:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2b21a:	76 1a                	jbe    2b236 <JS_CallInternal+0x5da6>
   2b21c:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2b223:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2b227:	83 e8 01             	sub    $0x1,%eax
   2b22a:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2b22e:	85 c0                	test   %eax,%eax
   2b230:	0f 8e 1e 26 00 00    	jle    2d854 <JS_CallInternal+0x83c4>
   2b236:	48 83 eb 20          	sub    $0x20,%rbx
   2b23a:	85 c9                	test   %ecx,%ecx
   2b23c:	0f 88 8e a9 ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2b242:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2b248:	49 83 c4 05          	add    $0x5,%r12
   2b24c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b250:	49 89 c2             	mov    %rax,%r10
   2b253:	e9 58 a5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b258:	f3 0f 1e fa          	endbr64
   2b25c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b260:	0b 53 e8             	or     -0x18(%rbx),%edx
   2b263:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2b267:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b26b:	0f 85 bf 3a 00 00    	jne    2ed30 <JS_CallInternal+0x98a0>
   2b271:	21 c8                	and    %ecx,%eax
   2b273:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2b27a:	00 
   2b27b:	48 83 eb 10          	sub    $0x10,%rbx
   2b27f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b283:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b288:	49 83 c4 01          	add    $0x1,%r12
   2b28c:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b290:	49 89 c2             	mov    %rax,%r10
   2b293:	e9 18 a5 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b298:	f3 0f 1e fa          	endbr64
   2b29c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b2a0:	0b 53 e8             	or     -0x18(%rbx),%edx
   2b2a3:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2b2a7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b2ab:	0f 85 13 30 00 00    	jne    2e2c4 <JS_CallInternal+0x8e34>
   2b2b1:	d3 f8                	sar    %cl,%eax
   2b2b3:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2b2ba:	00 
   2b2bb:	48 83 eb 10          	sub    $0x10,%rbx
   2b2bf:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b2c3:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b2c8:	49 83 c4 01          	add    $0x1,%r12
   2b2cc:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b2d0:	49 89 c2             	mov    %rax,%r10
   2b2d3:	e9 d8 a4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b2d8:	f3 0f 1e fa          	endbr64
   2b2dc:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b2e0:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2b2e4:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2b2e8:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2b2ec:	89 c7                	mov    %eax,%edi
   2b2ee:	09 f7                	or     %esi,%edi
   2b2f0:	0f 85 8b 38 00 00    	jne    2eb81 <JS_CallInternal+0x96f1>
   2b2f6:	48 63 f2             	movslq %edx,%rsi
   2b2f9:	48 63 c1             	movslq %ecx,%rax
   2b2fc:	48 0f af c6          	imul   %rsi,%rax
   2b300:	48 63 f0             	movslq %eax,%rsi
   2b303:	48 39 c6             	cmp    %rax,%rsi
   2b306:	0f 85 84 36 00 00    	jne    2e990 <JS_CallInternal+0x9500>
   2b30c:	48 85 f6             	test   %rsi,%rsi
   2b30f:	0f 84 97 3d 00 00    	je     2f0ac <JS_CallInternal+0x9c1c>
   2b315:	83 e0 ff             	and    $0xffffffff,%eax
   2b318:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2b31f:	00 
   2b320:	48 83 eb 10          	sub    $0x10,%rbx
   2b324:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b328:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b32d:	49 83 c4 01          	add    $0x1,%r12
   2b331:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b335:	49 89 c2             	mov    %rax,%r10
   2b338:	e9 73 a4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b33d:	f3 0f 1e fa          	endbr64
   2b341:	44 8b 43 f8          	mov    -0x8(%rbx),%r8d
   2b345:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b349:	45 85 c0             	test   %r8d,%r8d
   2b34c:	0f 85 29 18 00 00    	jne    2cb7b <JS_CallInternal+0x76eb>
   2b352:	f7 d0                	not    %eax
   2b354:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b35b:	00 
   2b35c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b360:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b365:	49 83 c4 01          	add    $0x1,%r12
   2b369:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b36d:	49 89 c2             	mov    %rax,%r10
   2b370:	e9 3b a4 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b375:	f3 0f 1e fa          	endbr64
   2b379:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b37d:	0b 53 e8             	or     -0x18(%rbx),%edx
   2b380:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2b384:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b388:	0f 85 8f 36 00 00    	jne    2ea1d <JS_CallInternal+0x958d>
   2b38e:	d3 e0                	shl    %cl,%eax
   2b390:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2b397:	00 
   2b398:	48 83 eb 10          	sub    $0x10,%rbx
   2b39c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b3a0:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b3a5:	49 83 c4 01          	add    $0x1,%r12
   2b3a9:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b3ad:	49 89 c2             	mov    %rax,%r10
   2b3b0:	e9 fb a3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b3b5:	f3 0f 1e fa          	endbr64
   2b3b9:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b3bd:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b3c1:	83 fa 02             	cmp    $0x2,%edx
   2b3c4:	0f 87 f3 11 00 00    	ja     2c5bd <JS_CallInternal+0x712d>
   2b3ca:	85 c0                	test   %eax,%eax
   2b3cc:	0f 84 4e 3f 00 00    	je     2f320 <JS_CallInternal+0x9e90>
   2b3d2:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2b3d7:	0f 84 c7 3d 00 00    	je     2f1a4 <JS_CallInternal+0x9d14>
   2b3dd:	f7 d8                	neg    %eax
   2b3df:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b3e6:	00 
   2b3e7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b3eb:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b3f0:	49 83 c4 01          	add    $0x1,%r12
   2b3f4:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b3f8:	49 89 c2             	mov    %rax,%r10
   2b3fb:	e9 b0 a3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b400:	f3 0f 1e fa          	endbr64
   2b404:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   2b409:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2b40e:	48 c1 e1 04          	shl    $0x4,%rcx
   2b412:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   2b419:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   2b41d:	48 8b 01             	mov    (%rcx),%rax
   2b420:	85 d2                	test   %edx,%edx
   2b422:	0f 85 e4 0e 00 00    	jne    2c30c <JS_CallInternal+0x6e7c>
   2b428:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2b42d:	0f 84 d9 0e 00 00    	je     2c30c <JS_CallInternal+0x6e7c>
   2b433:	83 e8 01             	sub    $0x1,%eax
   2b436:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   2b43d:	00 
   2b43e:	48 89 01             	mov    %rax,(%rcx)
   2b441:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2b447:	49 83 c4 02          	add    $0x2,%r12
   2b44b:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b44f:	49 89 c2             	mov    %rax,%r10
   2b452:	e9 59 a3 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b457:	f3 0f 1e fa          	endbr64
   2b45b:	41 0f b6 3c 24       	movzbl (%r12),%edi
   2b460:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2b467:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2b46c:	45 31 c9             	xor    %r9d,%r9d
   2b46f:	89 fa                	mov    %edi,%edx
   2b471:	89 f8                	mov    %edi,%eax
   2b473:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   2b477:	c1 fa 02             	sar    $0x2,%edx
   2b47a:	83 e0 03             	and    $0x3,%eax
   2b47d:	83 e2 07             	and    $0x7,%edx
   2b480:	f7 d0                	not    %eax
   2b482:	f7 d2                	not    %edx
   2b484:	48 98                	cltq
   2b486:	48 63 d2             	movslq %edx,%rdx
   2b489:	48 c1 e0 04          	shl    $0x4,%rax
   2b48d:	48 c1 e2 04          	shl    $0x4,%rdx
   2b491:	48 01 d8             	add    %rbx,%rax
   2b494:	48 01 da             	add    %rbx,%rdx
   2b497:	48 8b 30             	mov    (%rax),%rsi
   2b49a:	48 8b 0a             	mov    (%rdx),%rcx
   2b49d:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   2b4a1:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b4a5:	89 f8                	mov    %edi,%eax
   2b4a7:	4c 89 ef             	mov    %r13,%rdi
   2b4aa:	c1 f8 05             	sar    $0x5,%eax
   2b4ad:	f7 d0                	not    %eax
   2b4af:	48 98                	cltq
   2b4b1:	48 c1 e0 04          	shl    $0x4,%rax
   2b4b5:	ff 74 03 08          	push   0x8(%rbx,%rax,1)
   2b4b9:	ff 34 03             	push   (%rbx,%rax,1)
   2b4bc:	e8 bf 8d 06 00       	call   94280 <JS_CopyDataProperties>
   2b4c1:	59                   	pop    %rcx
   2b4c2:	5e                   	pop    %rsi
   2b4c3:	85 c0                	test   %eax,%eax
   2b4c5:	0f 85 05 a7 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2b4cb:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2b4d1:	49 83 c4 02          	add    $0x2,%r12
   2b4d5:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b4d9:	49 89 c2             	mov    %rax,%r10
   2b4dc:	e9 cf a2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b4e1:	f3 0f 1e fa          	endbr64
   2b4e5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b4ec:	44 89 d2             	mov    %r10d,%edx
   2b4ef:	48 89 de             	mov    %rbx,%rsi
   2b4f2:	4c 89 ef             	mov    %r13,%rdi
   2b4f5:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b4f9:	e8 32 af 02 00       	call   56430 <js_binary_arith_slow>
   2b4fe:	85 c0                	test   %eax,%eax
   2b500:	0f 85 f5 41 00 00    	jne    2f6fb <JS_CallInternal+0xa26b>
   2b506:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b50b:	48 83 eb 10          	sub    $0x10,%rbx
   2b50f:	49 83 c4 01          	add    $0x1,%r12
   2b513:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b517:	49 89 c2             	mov    %rax,%r10
   2b51a:	e9 91 a2 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b51f:	f3 0f 1e fa          	endbr64
   2b523:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b527:	0b 43 e8             	or     -0x18(%rbx),%eax
   2b52a:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2b52e:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2b532:	75 b1                	jne    2b4e5 <JS_CallInternal+0x6055>
   2b534:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2b538:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2b53c:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2b540:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2b544:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
   2b548:	66 0f 2f 05 b0 3e 0b 	comisd 0xb3eb0(%rip),%xmm0        # df400 <__PRETTY_FUNCTION__.0+0xc0>
   2b54f:	00 
   2b550:	66 48 0f 7e c0       	movq   %xmm0,%rax
   2b555:	0f 82 a2 0b 00 00    	jb     2c0fd <JS_CallInternal+0x6c6d>
   2b55b:	f2 0f 10 0d a5 3e 0b 	movsd  0xb3ea5(%rip),%xmm1        # df408 <__PRETTY_FUNCTION__.0+0xc8>
   2b562:	00 
   2b563:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2b567:	0f 82 90 0b 00 00    	jb     2c0fd <JS_CallInternal+0x6c6d>
   2b56d:	f2 0f 2c c8          	cvttsd2si %xmm0,%ecx
   2b571:	66 0f ef ff          	pxor   %xmm7,%xmm7
   2b575:	ba 08 00 00 00       	mov    $0x8,%edx
   2b57a:	f2 0f 2a f9          	cvtsi2sd %ecx,%xmm7
   2b57e:	66 48 0f 7e fe       	movq   %xmm7,%rsi
   2b583:	89 c9                	mov    %ecx,%ecx
   2b585:	48 39 f0             	cmp    %rsi,%rax
   2b588:	be 00 00 00 00       	mov    $0x0,%esi
   2b58d:	48 0f 44 d6          	cmove  %rsi,%rdx
   2b591:	48 0f 44 c1          	cmove  %rcx,%rax
   2b595:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2b599:	49 83 c4 01          	add    $0x1,%r12
   2b59d:	48 83 eb 10          	sub    $0x10,%rbx
   2b5a1:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b5a5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b5ab:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b5af:	49 89 c2             	mov    %rax,%r10
   2b5b2:	e9 f9 a1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b5b7:	f3 0f 1e fa          	endbr64
   2b5bb:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b5bf:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2b5c3:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2b5c7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b5cb:	89 c6                	mov    %eax,%esi
   2b5cd:	09 d6                	or     %edx,%esi
   2b5cf:	0f 85 6d 33 00 00    	jne    2e942 <JS_CallInternal+0x94b2>
   2b5d5:	48 63 f1             	movslq %ecx,%rsi
   2b5d8:	48 63 c7             	movslq %edi,%rax
   2b5db:	8d 14 39             	lea    (%rcx,%rdi,1),%edx
   2b5de:	48 01 f0             	add    %rsi,%rax
   2b5e1:	48 63 ca             	movslq %edx,%rcx
   2b5e4:	48 39 c1             	cmp    %rax,%rcx
   2b5e7:	0f 85 3a 33 00 00    	jne    2e927 <JS_CallInternal+0x9497>
   2b5ed:	89 d0                	mov    %edx,%eax
   2b5ef:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2b5f6:	00 
   2b5f7:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2b5fb:	48 83 eb 10          	sub    $0x10,%rbx
   2b5ff:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b604:	49 83 c4 01          	add    $0x1,%r12
   2b608:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b60c:	49 89 c2             	mov    %rax,%r10
   2b60f:	e9 9c a1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b614:	f3 0f 1e fa          	endbr64
   2b618:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b61c:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2b620:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2b624:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b628:	89 c6                	mov    %eax,%esi
   2b62a:	09 d6                	or     %edx,%esi
   2b62c:	0f 85 b0 32 00 00    	jne    2e8e2 <JS_CallInternal+0x9452>
   2b632:	89 fa                	mov    %edi,%edx
   2b634:	48 63 f1             	movslq %ecx,%rsi
   2b637:	48 63 c7             	movslq %edi,%rax
   2b63a:	29 ca                	sub    %ecx,%edx
   2b63c:	48 29 f0             	sub    %rsi,%rax
   2b63f:	48 63 ca             	movslq %edx,%rcx
   2b642:	48 39 c1             	cmp    %rax,%rcx
   2b645:	0f 85 7c 32 00 00    	jne    2e8c7 <JS_CallInternal+0x9437>
   2b64b:	89 d0                	mov    %edx,%eax
   2b64d:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2b654:	00 
   2b655:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2b659:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b65e:	48 83 eb 10          	sub    $0x10,%rbx
   2b662:	49 83 c4 01          	add    $0x1,%r12
   2b666:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b66a:	49 89 c2             	mov    %rax,%r10
   2b66d:	e9 3e a1 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b672:	f3 0f 1e fa          	endbr64
   2b676:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b67d:	48 89 de             	mov    %rbx,%rsi
   2b680:	4c 89 ef             	mov    %r13,%rdi
   2b683:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b687:	e8 c4 a2 07 00       	call   a5950 <js_append_enumerate>
   2b68c:	85 c0                	test   %eax,%eax
   2b68e:	0f 85 08 46 00 00    	jne    2fc9c <JS_CallInternal+0xa80c>
   2b694:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b698:	48 83 eb 10          	sub    $0x10,%rbx
   2b69c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b69f:	76 14                	jbe    2b6b5 <JS_CallInternal+0x6225>
   2b6a1:	48 8b 0b             	mov    (%rbx),%rcx
   2b6a4:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b6a7:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b6aa:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b6ad:	85 d2                	test   %edx,%edx
   2b6af:	0f 8e e1 25 00 00    	jle    2dc96 <JS_CallInternal+0x8806>
   2b6b5:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b6ba:	49 83 c4 01          	add    $0x1,%r12
   2b6be:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b6c2:	49 89 c2             	mov    %rax,%r10
   2b6c5:	e9 e6 a0 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b6ca:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2b6d1:	48 8d 35 aa f4 0a 00 	lea    0xaf4aa(%rip),%rsi        # dab82 <_IO_stdin_used+0x1b82>
   2b6d8:	31 c0                	xor    %eax,%eax
   2b6da:	e8 61 8c 00 00       	call   34340 <JS_ThrowTypeError>
   2b6df:	e9 00 a4 ff ff       	jmp    25ae4 <JS_CallInternal+0x654>
   2b6e4:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2b6eb:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   2b6f2:	4c 89 ef             	mov    %r13,%rdi
   2b6f5:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2b6fb:	48 89 c6             	mov    %rax,%rsi
   2b6fe:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2b705:	49 89 c4             	mov    %rax,%r12
   2b708:	e8 53 4d 04 00       	call   70460 <JS_HasProperty>
   2b70d:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2b714:	85 c0                	test   %eax,%eax
   2b716:	0f 8e a5 3b 00 00    	jle    2f2c1 <JS_CallInternal+0x9e31>
   2b71c:	48 83 ec 08          	sub    $0x8,%rsp
   2b720:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2b726:	49 89 d1             	mov    %rdx,%r9
   2b729:	4c 89 e6             	mov    %r12,%rsi
   2b72c:	6a 00                	push   $0x0
   2b72e:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2b735:	4c 89 ef             	mov    %r13,%rdi
   2b738:	e8 63 4c 00 00       	call   303a0 <JS_GetPropertyInternal>
   2b73d:	41 59                	pop    %r9
   2b73f:	41 5a                	pop    %r10
   2b741:	48 89 c1             	mov    %rax,%rcx
   2b744:	48 89 d0             	mov    %rdx,%rax
   2b747:	83 fa 06             	cmp    $0x6,%edx
   2b74a:	0f 84 80 a4 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2b750:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b754:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b758:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b75c:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2b760:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b763:	0f 86 01 a6 ff ff    	jbe    25d6a <JS_CallInternal+0x8da>
   2b769:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2b76c:	83 e8 01             	sub    $0x1,%eax
   2b76f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2b772:	85 c0                	test   %eax,%eax
   2b774:	0f 8f f0 a5 ff ff    	jg     25d6a <JS_CallInternal+0x8da>
   2b77a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2b77e:	e8 3d 32 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2b783:	e9 e2 a5 ff ff       	jmp    25d6a <JS_CallInternal+0x8da>
   2b788:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2b78f:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   2b796:	4c 89 ef             	mov    %r13,%rdi
   2b799:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2b79f:	48 89 c6             	mov    %rax,%rsi
   2b7a2:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2b7a9:	49 89 c4             	mov    %rax,%r12
   2b7ac:	e8 af 4c 04 00       	call   70460 <JS_HasProperty>
   2b7b1:	85 c0                	test   %eax,%eax
   2b7b3:	0f 88 17 a4 ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2b7b9:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2b7c0:	b8 03 00 00 00       	mov    $0x3,%eax
   2b7c5:	b9 00 00 00 00       	mov    $0x0,%ecx
   2b7ca:	0f 85 6a 23 00 00    	jne    2db3a <JS_CallInternal+0x86aa>
   2b7d0:	48 89 0b             	mov    %rcx,(%rbx)
   2b7d3:	48 83 c3 10          	add    $0x10,%rbx
   2b7d7:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b7db:	e9 8a a5 ff ff       	jmp    25d6a <JS_CallInternal+0x8da>
   2b7e0:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2b7e7:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   2b7ee:	45 31 c0             	xor    %r8d,%r8d
   2b7f1:	4c 89 ef             	mov    %r13,%rdi
   2b7f4:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2b7fa:	48 89 c6             	mov    %rax,%rsi
   2b7fd:	e8 6e 29 02 00       	call   4e170 <JS_DeleteProperty>
   2b802:	41 89 c4             	mov    %eax,%r12d
   2b805:	85 c0                	test   %eax,%eax
   2b807:	0f 88 c3 a3 ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2b80d:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b811:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b814:	76 15                	jbe    2b82b <JS_CallInternal+0x639b>
   2b816:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b81a:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2b81d:	83 ea 01             	sub    $0x1,%edx
   2b820:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b823:	85 d2                	test   %edx,%edx
   2b825:	0f 8e 65 39 00 00    	jle    2f190 <JS_CallInternal+0x9d00>
   2b82b:	31 c0                	xor    %eax,%eax
   2b82d:	45 85 e4             	test   %r12d,%r12d
   2b830:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2b837:	00 
   2b838:	0f 95 c0             	setne  %al
   2b83b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b83f:	e9 26 a5 ff ff       	jmp    25d6a <JS_CallInternal+0x8da>
   2b844:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2b84b:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   2b852:	4c 89 ef             	mov    %r13,%rdi
   2b855:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2b85b:	48 89 c6             	mov    %rax,%rsi
   2b85e:	e8 fd 4b 04 00       	call   70460 <JS_HasProperty>
   2b863:	85 c0                	test   %eax,%eax
   2b865:	0f 8e ae 39 00 00    	jle    2f219 <JS_CallInternal+0x9d89>
   2b86b:	48 83 ec 08          	sub    $0x8,%rsp
   2b86f:	4c 8b 43 e0          	mov    -0x20(%rbx),%r8
   2b873:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   2b877:	4c 89 ef             	mov    %r13,%rdi
   2b87a:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2b881:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   2b888:	68 00 80 00 00       	push   $0x8000
   2b88d:	4c 8d 63 e0          	lea    -0x20(%rbx),%r12
   2b891:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2b897:	41 53                	push   %r11
   2b899:	4c 89 d6             	mov    %r10,%rsi
   2b89c:	4c 89 da             	mov    %r11,%rdx
   2b89f:	41 52                	push   %r10
   2b8a1:	e8 4a 58 00 00       	call   310f0 <JS_SetPropertyInternal>
   2b8a6:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2b8aa:	48 83 c4 20          	add    $0x20,%rsp
   2b8ae:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2b8b1:	76 15                	jbe    2b8c8 <JS_CallInternal+0x6438>
   2b8b3:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b8b7:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2b8ba:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2b8bd:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b8c0:	85 d2                	test   %edx,%edx
   2b8c2:	0f 8e 88 39 00 00    	jle    2f250 <JS_CallInternal+0x9dc0>
   2b8c8:	4c 89 e3             	mov    %r12,%rbx
   2b8cb:	85 c0                	test   %eax,%eax
   2b8cd:	0f 89 97 a4 ff ff    	jns    25d6a <JS_CallInternal+0x8da>
   2b8d3:	e9 f8 a2 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2b8d8:	48 8d 35 91 14 0b 00 	lea    0xb1491(%rip),%rsi        # dcd70 <_IO_stdin_used+0x3d70>
   2b8df:	4c 89 ef             	mov    %r13,%rdi
   2b8e2:	31 c0                	xor    %eax,%eax
   2b8e4:	e8 37 a9 00 00       	call   36220 <JS_ThrowReferenceError>
   2b8e9:	e9 e2 a2 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2b8ee:	48 8d 15 c8 db 0a 00 	lea    0xadbc8(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2b8f5:	85 f6                	test   %esi,%esi
   2b8f7:	0f 85 a4 3b 00 00    	jne    2f4a1 <JS_CallInternal+0xa011>
   2b8fd:	48 8d 35 15 dc 0a 00 	lea    0xadc15(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2b904:	4c 89 ef             	mov    %r13,%rdi
   2b907:	31 c0                	xor    %eax,%eax
   2b909:	e8 12 a9 00 00       	call   36220 <JS_ThrowReferenceError>
   2b90e:	e9 bd a2 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2b913:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2b917:	89 f2                	mov    %esi,%edx
   2b919:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2b91d:	e8 ae d0 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2b922:	48 8d 35 da db 0a 00 	lea    0xadbda(%rip),%rsi        # d9503 <_IO_stdin_used+0x503>
   2b929:	4c 89 ef             	mov    %r13,%rdi
   2b92c:	48 89 c2             	mov    %rax,%rdx
   2b92f:	31 c0                	xor    %eax,%eax
   2b931:	e8 ba 85 00 00       	call   33ef0 <JS_ThrowSyntaxError>
   2b936:	e9 95 a2 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2b93b:	48 8d 35 56 14 0b 00 	lea    0xb1456(%rip),%rsi        # dcd98 <_IO_stdin_used+0x3d98>
   2b942:	4c 89 ef             	mov    %r13,%rdi
   2b945:	31 c0                	xor    %eax,%eax
   2b947:	e8 f4 89 00 00       	call   34340 <JS_ThrowTypeError>
   2b94c:	e9 7f a2 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2b951:	4c 89 ef             	mov    %r13,%rdi
   2b954:	e8 37 9d 00 00       	call   35690 <JS_ThrowTypeErrorReadOnly.part.0>
   2b959:	e9 72 a2 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2b95e:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2b962:	b9 01 00 00 00       	mov    $0x1,%ecx
   2b967:	31 f6                	xor    %esi,%esi
   2b969:	ba 02 00 00 00       	mov    $0x2,%edx
   2b96e:	4c 89 ef             	mov    %r13,%rdi
   2b971:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2b978:	e8 73 f6 01 00       	call   4aff0 <JS_NewObjectProtoClass>
   2b97d:	48 89 03             	mov    %rax,(%rbx)
   2b980:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2b984:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2b988:	0f 84 f1 00 00 00    	je     2ba7f <JS_CallInternal+0x65ef>
   2b98e:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b995:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2b99b:	49 83 c4 02          	add    $0x2,%r12
   2b99f:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2b9a3:	49 89 c2             	mov    %rax,%r10
   2b9a6:	e9 05 9e ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2b9ab:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   2b9b2:	48 8b 40 38          	mov    0x38(%rax),%rax
   2b9b6:	48 85 c0             	test   %rax,%rax
   2b9b9:	0f 84 79 3c 00 00    	je     2f638 <JS_CallInternal+0xa1a8>
   2b9bf:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b9c3:	48 83 c3 10          	add    $0x10,%rbx
   2b9c7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b9cb:	48 c7 43 f8 ff ff ff 	movq   $0xffffffffffffffff,-0x8(%rbx)
   2b9d2:	ff 
   2b9d3:	eb c0                	jmp    2b995 <JS_CallInternal+0x6505>
   2b9d5:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2b9d9:	83 bd 78 fe ff ff f6 	cmpl   $0xfffffff6,-0x188(%rbp)
   2b9e0:	76 0b                	jbe    2b9ed <JS_CallInternal+0x655d>
   2b9e2:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   2b9e9:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2b9ed:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   2b9f4:	48 89 0b             	mov    %rcx,(%rbx)
   2b9f7:	48 8b 8d 78 fe ff ff 	mov    -0x188(%rbp),%rcx
   2b9fe:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   2ba02:	48 89 c3             	mov    %rax,%rbx
   2ba05:	eb 8e                	jmp    2b995 <JS_CallInternal+0x6505>
   2ba07:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2ba0e:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2ba12:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2ba16:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   2ba1a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ba1d:	76 04                	jbe    2ba23 <JS_CallInternal+0x6593>
   2ba1f:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2ba23:	48 89 03             	mov    %rax,(%rbx)
   2ba26:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2ba2a:	48 89 cb             	mov    %rcx,%rbx
   2ba2d:	e9 63 ff ff ff       	jmp    2b995 <JS_CallInternal+0x6505>
   2ba32:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ba39:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2ba3d:	48 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%rdx
   2ba44:	4c 89 ef             	mov    %r13,%rdi
   2ba47:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ba4e:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2ba54:	44 0f b7 41 38       	movzwl 0x38(%rcx),%r8d
   2ba59:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2ba60:	89 c6                	mov    %eax,%esi
   2ba62:	41 39 c0             	cmp    %eax,%r8d
   2ba65:	44 0f 4f c0          	cmovg  %eax,%r8d
   2ba69:	e8 02 f1 01 00       	call   4ab70 <js_build_mapped_arguments>
   2ba6e:	48 89 03             	mov    %rax,(%rbx)
   2ba71:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2ba75:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2ba79:	0f 85 0f ff ff ff    	jne    2b98e <JS_CallInternal+0x64fe>
   2ba7f:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2ba86:	e9 45 a1 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ba8b:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2ba8f:	49 8b 95 58 01 00 00 	mov    0x158(%r13),%rdx
   2ba96:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   2ba9d:	00 00 00 00 
   2baa1:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2baa8:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2baae:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
   2bab5:	49 8b 85 50 01 00 00 	mov    0x150(%r13),%rax
   2babc:	83 fa f6             	cmp    $0xfffffff6,%edx
   2babf:	76 04                	jbe    2bac5 <JS_CallInternal+0x6635>
   2bac1:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2bac5:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
   2bacc:	49 8b 85 60 01 00 00 	mov    0x160(%r13),%rax
   2bad3:	41 83 bd 68 01 00 00 	cmpl   $0xfffffff6,0x168(%r13)
   2bada:	f6 
   2badb:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   2bae2:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   2bae9:	76 04                	jbe    2baef <JS_CallInternal+0x665f>
   2baeb:	83 40 fc 02          	addl   $0x2,-0x4(%rax)
   2baef:	49 8b 75 38          	mov    0x38(%r13),%rsi
   2baf3:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   2bafa:	ba 08 00 00 00       	mov    $0x8,%edx
   2baff:	4c 89 ef             	mov    %r13,%rdi
   2bb02:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   2bb09:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2bb0d:	e8 2e ec 01 00       	call   4a740 <JS_NewObjectFromShape>
   2bb12:	48 89 c1             	mov    %rax,%rcx
   2bb15:	83 fa 06             	cmp    $0x6,%edx
   2bb18:	0f 84 0e 3b 00 00    	je     2f62c <JS_CallInternal+0xa19c>
   2bb1e:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2bb24:	85 c0                	test   %eax,%eax
   2bb26:	0f 8f e4 38 00 00    	jg     2f410 <JS_CallInternal+0x9f80>
   2bb2c:	48 c7 41 30 00 00 00 	movq   $0x0,0x30(%rcx)
   2bb33:	00 
   2bb34:	89 41 38             	mov    %eax,0x38(%rcx)
   2bb37:	48 89 0b             	mov    %rcx,(%rbx)
   2bb3a:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2bb3e:	e9 4b fe ff ff       	jmp    2b98e <JS_CallInternal+0x64fe>
   2bb43:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2bb47:	31 f6                	xor    %esi,%esi
   2bb49:	4c 89 ef             	mov    %r13,%rdi
   2bb4c:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2bb53:	e8 e8 97 ff ff       	call   25340 <JS_GetScriptOrModuleName>
   2bb58:	89 c2                	mov    %eax,%edx
   2bb5a:	85 d2                	test   %edx,%edx
   2bb5c:	0f 84 61 33 00 00    	je     2eec3 <JS_CallInternal+0x9a33>
   2bb62:	49 8b 85 b8 01 00 00 	mov    0x1b8(%r13),%rax
   2bb69:	49 8d 8d b0 01 00 00 	lea    0x1b0(%r13),%rcx
   2bb70:	48 39 c1             	cmp    %rax,%rcx
   2bb73:	75 18                	jne    2bb8d <JS_CallInternal+0x66fd>
   2bb75:	e9 20 33 00 00       	jmp    2ee9a <JS_CallInternal+0x9a0a>
   2bb7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2bb80:	48 8b 40 08          	mov    0x8(%rax),%rax
   2bb84:	48 39 c1             	cmp    %rax,%rcx
   2bb87:	0f 84 36 38 00 00    	je     2f3c3 <JS_CallInternal+0x9f33>
   2bb8d:	3b 50 f8             	cmp    -0x8(%rax),%edx
   2bb90:	75 ee                	jne    2bb80 <JS_CallInternal+0x66f0>
   2bb92:	48 83 e8 18          	sub    $0x18,%rax
   2bb96:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2bb9c:	0f 8f 2f 38 00 00    	jg     2f3d1 <JS_CallInternal+0x9f41>
   2bba2:	48 89 c6             	mov    %rax,%rsi
   2bba5:	4c 89 ef             	mov    %r13,%rdi
   2bba8:	e8 63 98 ff ff       	call   25410 <JS_GetImportMeta>
   2bbad:	48 89 03             	mov    %rax,(%rbx)
   2bbb0:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2bbb4:	83 fa 06             	cmp    $0x6,%edx
   2bbb7:	0f 85 d1 fd ff ff    	jne    2b98e <JS_CallInternal+0x64fe>
   2bbbd:	e9 bd fe ff ff       	jmp    2ba7f <JS_CallInternal+0x65ef>
   2bbc2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2bbc8:	8b 37                	mov    (%rdi),%esi
   2bbca:	81 e6 ff ff ff 03    	and    $0x3ffffff,%esi
   2bbd0:	0f 85 38 a9 ff ff    	jne    2650e <JS_CallInternal+0x107e>
   2bbd6:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2bbda:	0f 85 95 02 00 00    	jne    2be75 <JS_CallInternal+0x69e5>
   2bbe0:	49 8b 40 30          	mov    0x30(%r8),%rax
   2bbe4:	48 85 c0             	test   %rax,%rax
   2bbe7:	0f 84 fb 0e 00 00    	je     2cae8 <JS_CallInternal+0x7658>
   2bbed:	4c 8b 40 18          	mov    0x18(%rax),%r8
   2bbf1:	e9 fa a8 ff ff       	jmp    264f0 <JS_CallInternal+0x1060>
   2bbf6:	8b 02                	mov    (%rdx),%eax
   2bbf8:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2bbfd:	0f 85 60 ad ff ff    	jne    26963 <JS_CallInternal+0x14d3>
   2bc03:	f6 46 10 08          	testb  $0x8,0x10(%rsi)
   2bc07:	0f 85 6d 05 00 00    	jne    2c17a <JS_CallInternal+0x6cea>
   2bc0d:	49 8b 70 30          	mov    0x30(%r8),%rsi
   2bc11:	48 85 f6             	test   %rsi,%rsi
   2bc14:	0f 85 26 ad ff ff    	jne    26940 <JS_CallInternal+0x14b0>
   2bc1a:	b8 03 00 00 00       	mov    $0x3,%eax
   2bc1f:	45 31 ff             	xor    %r15d,%r15d
   2bc22:	e9 77 ad ff ff       	jmp    2699e <JS_CallInternal+0x150e>
   2bc27:	8b 16                	mov    (%rsi),%edx
   2bc29:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bc2f:	0f 85 eb ad ff ff    	jne    26a20 <JS_CallInternal+0x1590>
   2bc35:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bc3a:	0f 85 d8 05 00 00    	jne    2c218 <JS_CallInternal+0x6d88>
   2bc40:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bc44:	4d 85 c0             	test   %r8,%r8
   2bc47:	0f 85 b3 ad ff ff    	jne    26a00 <JS_CallInternal+0x1570>
   2bc4d:	ba 03 00 00 00       	mov    $0x3,%edx
   2bc52:	31 c0                	xor    %eax,%eax
   2bc54:	e9 00 ae ff ff       	jmp    26a59 <JS_CallInternal+0x15c9>
   2bc59:	8b 16                	mov    (%rsi),%edx
   2bc5b:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bc61:	0f 85 e9 aa ff ff    	jne    26750 <JS_CallInternal+0x12c0>
   2bc67:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bc6c:	0f 85 58 05 00 00    	jne    2c1ca <JS_CallInternal+0x6d3a>
   2bc72:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bc76:	4d 85 c0             	test   %r8,%r8
   2bc79:	0f 85 b1 aa ff ff    	jne    26730 <JS_CallInternal+0x12a0>
   2bc7f:	b8 03 00 00 00       	mov    $0x3,%eax
   2bc84:	45 31 ff             	xor    %r15d,%r15d
   2bc87:	e9 fe aa ff ff       	jmp    2678a <JS_CallInternal+0x12fa>
   2bc8c:	8b 16                	mov    (%rsi),%edx
   2bc8e:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bc94:	0f 85 42 a9 ff ff    	jne    265dc <JS_CallInternal+0x114c>
   2bc9a:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bc9f:	0f 85 20 06 00 00    	jne    2c2c5 <JS_CallInternal+0x6e35>
   2bca5:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bca9:	4d 85 c0             	test   %r8,%r8
   2bcac:	0f 84 7e 19 00 00    	je     2d630 <JS_CallInternal+0x81a0>
   2bcb2:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2bcb6:	e9 05 a9 ff ff       	jmp    265c0 <JS_CallInternal+0x1130>
   2bcbb:	8b b5 a8 fe ff ff    	mov    -0x158(%rbp),%esi
   2bcc1:	41 39 f0             	cmp    %esi,%r8d
   2bcc4:	41 89 f3             	mov    %esi,%r11d
   2bcc7:	45 0f 4e d8          	cmovle %r8d,%r11d
   2bccb:	45 85 db             	test   %r11d,%r11d
   2bcce:	0f 8e 2a 16 00 00    	jle    2d2fe <JS_CallInternal+0x7e6e>
   2bcd4:	4d 63 eb             	movslq %r11d,%r13
   2bcd7:	4c 8b bd 98 fe ff ff 	mov    -0x168(%rbp),%r15
   2bcde:	31 f6                	xor    %esi,%esi
   2bce0:	49 c1 e5 04          	shl    $0x4,%r13
   2bce4:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2bcea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bcf1:	00 00 00 00 
   2bcf5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bcfc:	00 00 00 00 
   2bd00:	4d 8b 74 37 08       	mov    0x8(%r15,%rsi,1),%r14
   2bd05:	4d 8b 24 37          	mov    (%r15,%rsi,1),%r12
   2bd09:	41 83 fe f6          	cmp    $0xfffffff6,%r14d
   2bd0d:	76 06                	jbe    2bd15 <JS_CallInternal+0x6885>
   2bd0f:	41 83 44 24 fc 01    	addl   $0x1,-0x4(%r12)
   2bd15:	4c 89 24 37          	mov    %r12,(%rdi,%rsi,1)
   2bd19:	4c 89 74 37 08       	mov    %r14,0x8(%rdi,%rsi,1)
   2bd1e:	48 83 c6 10          	add    $0x10,%rsi
   2bd22:	4c 39 ee             	cmp    %r13,%rsi
   2bd25:	75 d9                	jne    2bd00 <JS_CallInternal+0x6870>
   2bd27:	45 39 d8             	cmp    %r11d,%r8d
   2bd2a:	7e 4c                	jle    2bd78 <JS_CallInternal+0x68e8>
   2bd2c:	45 8d 60 ff          	lea    -0x1(%r8),%r12d
   2bd30:	4d 63 eb             	movslq %r11d,%r13
   2bd33:	45 29 dc             	sub    %r11d,%r12d
   2bd36:	4c 89 ee             	mov    %r13,%rsi
   2bd39:	4d 01 ec             	add    %r13,%r12
   2bd3c:	48 c1 e6 04          	shl    $0x4,%rsi
   2bd40:	49 c1 e4 04          	shl    $0x4,%r12
   2bd44:	48 01 fe             	add    %rdi,%rsi
   2bd47:	4e 8d 5c 27 10       	lea    0x10(%rdi,%r12,1),%r11
   2bd4c:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2bd53:	00 00 
   2bd55:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bd5c:	00 00 00 00 
   2bd60:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
   2bd67:	48 83 c6 10          	add    $0x10,%rsi
   2bd6b:	48 c7 46 f8 03 00 00 	movq   $0x3,-0x8(%rsi)
   2bd72:	00 
   2bd73:	4c 39 de             	cmp    %r11,%rsi
   2bd76:	75 e8                	jne    2bd60 <JS_CallInternal+0x68d0>
   2bd78:	44 89 85 38 ff ff ff 	mov    %r8d,-0xc8(%rbp)
   2bd7f:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   2bd86:	e9 e5 98 ff ff       	jmp    25670 <JS_CallInternal+0x1e0>
   2bd8b:	48 83 ec 08          	sub    $0x8,%rsp
   2bd8f:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2bd95:	49 89 d1             	mov    %rdx,%r9
   2bd98:	48 89 c6             	mov    %rax,%rsi
   2bd9b:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   2bda2:	4c 89 ef             	mov    %r13,%rdi
   2bda5:	6a 00                	push   $0x0
   2bda7:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2bdae:	e8 ed 45 00 00       	call   303a0 <JS_GetPropertyInternal>
   2bdb3:	4c 89 ef             	mov    %r13,%rdi
   2bdb6:	48 89 c6             	mov    %rax,%rsi
   2bdb9:	e8 62 51 ff ff       	call   20f20 <JS_ToBoolFree>
   2bdbe:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2bdc5:	44 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10d
   2bdcc:	41 8b 48 fc          	mov    -0x4(%r8),%ecx
   2bdd0:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2bdd3:	85 d2                	test   %edx,%edx
   2bdd5:	41 89 50 fc          	mov    %edx,-0x4(%r8)
   2bdd9:	41 5b                	pop    %r11
   2bddb:	59                   	pop    %rcx
   2bddc:	0f 8e 6a 3f 00 00    	jle    2fd4c <JS_CallInternal+0xa8bc>
   2bde2:	85 c0                	test   %eax,%eax
   2bde4:	0f 88 e6 9d ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2bdea:	0f 84 5d 9a ff ff    	je     2584d <JS_CallInternal+0x3bd>
   2bdf0:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2bdf4:	48 83 eb 10          	sub    $0x10,%rbx
   2bdf8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bdfb:	0f 86 77 9f ff ff    	jbe    25d78 <JS_CallInternal+0x8e8>
   2be01:	48 8b 0b             	mov    (%rbx),%rcx
   2be04:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2be07:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2be0a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2be0d:	85 d2                	test   %edx,%edx
   2be0f:	0f 8f 63 9f ff ff    	jg     25d78 <JS_CallInternal+0x8e8>
   2be15:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2be19:	48 89 c2             	mov    %rax,%rdx
   2be1c:	48 89 ce             	mov    %rcx,%rsi
   2be1f:	e8 9c 2b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2be24:	e9 4f 9f ff ff       	jmp    25d78 <JS_CallInternal+0x8e8>
   2be29:	8b 95 10 fe ff ff    	mov    -0x1f0(%rbp),%edx
   2be2f:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2be36:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2be3d:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2be44:	83 c2 02             	add    $0x2,%edx
   2be47:	48 63 d2             	movslq %edx,%rdx
   2be4a:	49 83 c4 03          	add    $0x3,%r12
   2be4e:	48 c1 e2 04          	shl    $0x4,%rdx
   2be52:	48 29 d3             	sub    %rdx,%rbx
   2be55:	48 89 d9             	mov    %rbx,%rcx
   2be58:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2be5c:	48 89 31             	mov    %rsi,(%rcx)
   2be5f:	48 89 41 08          	mov    %rax,0x8(%rcx)
   2be63:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2be69:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2be6d:	49 89 c2             	mov    %rax,%r10
   2be70:	e9 3b 99 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2be75:	48 c7 85 30 fe ff ff 	movq   $0xffffffffffffffff,-0x1d0(%rbp)
   2be7c:	ff ff ff ff 
   2be80:	e9 47 a8 ff ff       	jmp    266cc <JS_CallInternal+0x123c>
   2be85:	4c 89 e8             	mov    %r13,%rax
   2be88:	4c 8b a5 30 fe ff ff 	mov    -0x1d0(%rbp),%r12
   2be8f:	49 89 dd             	mov    %rbx,%r13
   2be92:	4d 89 f8             	mov    %r15,%r8
   2be95:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2be9c:	48 89 c3             	mov    %rax,%rbx
   2be9f:	4c 39 85 48 fe ff ff 	cmp    %r8,-0x1b8(%rbp)
   2bea6:	0f 84 26 20 00 00    	je     2ded2 <JS_CallInternal+0x8a42>
   2beac:	49 89 48 f0          	mov    %rcx,-0x10(%r8)
   2beb0:	49 83 c4 01          	add    $0x1,%r12
   2beb4:	49 89 58 f8          	mov    %rbx,-0x8(%r8)
   2beb8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bebe:	4c 89 c3             	mov    %r8,%rbx
   2bec1:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2bec5:	49 89 c2             	mov    %rax,%r10
   2bec8:	e9 e3 98 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2becd:	4c 89 d8             	mov    %r11,%rax
   2bed0:	e9 f7 a7 ff ff       	jmp    266cc <JS_CallInternal+0x123c>
   2bed5:	80 fa 01             	cmp    $0x1,%dl
   2bed8:	0f 84 82 03 00 00    	je     2c260 <JS_CallInternal+0x6dd0>
   2bede:	80 cc 10             	or     $0x10,%ah
   2bee1:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2bee5:	f3 0f 6f 73 f0       	movdqu -0x10(%rbx),%xmm6
   2beea:	4c 89 ef             	mov    %r13,%rdi
   2beed:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   2bef3:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2bef7:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2befd:	0f 29 b5 90 fd ff ff 	movaps %xmm6,-0x270(%rbp)
   2bf04:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2bf0b:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2bf10:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2bf17:	e8 e4 84 01 00       	call   44400 <js_get_function_name>
   2bf1c:	4c 8d 05 21 d2 0a 00 	lea    0xad221(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2bf23:	48 8d 35 7d d6 0a 00 	lea    0xad67d(%rip),%rsi        # d95a7 <_IO_stdin_used+0x5a7>
   2bf2a:	4c 89 ef             	mov    %r13,%rdi
   2bf2d:	48 89 d1             	mov    %rdx,%rcx
   2bf30:	48 89 c2             	mov    %rax,%rdx
   2bf33:	e8 28 83 01 00       	call   44260 <JS_ConcatString3>
   2bf38:	49 89 c0             	mov    %rax,%r8
   2bf3b:	49 89 d1             	mov    %rdx,%r9
   2bf3e:	e9 48 a1 ff ff       	jmp    2608b <JS_CallInternal+0xbfb>
   2bf43:	4d 89 ec             	mov    %r13,%r12
   2bf46:	48 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%rbx
   2bf4d:	4d 89 d5             	mov    %r10,%r13
   2bf50:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2bf57:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bf5b:	4c 89 d6             	mov    %r10,%rsi
   2bf5e:	e8 8d a0 fe ff       	call   15ff0 <__js_free>
   2bf63:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   2bf6a:	0f 84 60 9c ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2bf70:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2bf74:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bf77:	76 15                	jbe    2bf8e <JS_CallInternal+0x6afe>
   2bf79:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2bf7d:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2bf80:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2bf83:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bf86:	85 d2                	test   %edx,%edx
   2bf88:	0f 8e 6a 28 00 00    	jle    2e7f8 <JS_CallInternal+0x9368>
   2bf8e:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2bf95:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2bf99:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bf9c:	76 14                	jbe    2bfb2 <JS_CallInternal+0x6b22>
   2bf9e:	48 8b 09             	mov    (%rcx),%rcx
   2bfa1:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2bfa4:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2bfa7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bfaa:	85 d2                	test   %edx,%edx
   2bfac:	0f 8e 5a 28 00 00    	jle    2e80c <JS_CallInternal+0x937c>
   2bfb2:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2bfb9:	49 83 c4 03          	add    $0x3,%r12
   2bfbd:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2bfc1:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2bfc8:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2bfcc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bfd2:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2bfd9:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2bfdd:	49 89 c2             	mov    %rax,%r10
   2bfe0:	e9 cb 97 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2bfe5:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2bfeb:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2bff2:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2bff9:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2c000:	83 c1 02             	add    $0x2,%ecx
   2c003:	48 63 c9             	movslq %ecx,%rcx
   2c006:	49 83 c4 03          	add    $0x3,%r12
   2c00a:	48 c1 e1 04          	shl    $0x4,%rcx
   2c00e:	48 29 cb             	sub    %rcx,%rbx
   2c011:	48 89 de             	mov    %rbx,%rsi
   2c014:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2c018:	48 89 06             	mov    %rax,(%rsi)
   2c01b:	48 89 56 08          	mov    %rdx,0x8(%rsi)
   2c01f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2c025:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2c029:	49 89 c2             	mov    %rax,%r10
   2c02c:	e9 7f 97 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2c031:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2c037:	4c 89 e3             	mov    %r12,%rbx
   2c03a:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   2c041:	4c 8b a5 10 fe ff ff 	mov    -0x1f0(%rbp),%r12
   2c048:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2c04f:	83 c0 01             	add    $0x1,%eax
   2c052:	48 98                	cltq
   2c054:	49 83 c4 05          	add    $0x5,%r12
   2c058:	48 c1 e0 04          	shl    $0x4,%rax
   2c05c:	48 29 c3             	sub    %rax,%rbx
   2c05f:	48 89 d9             	mov    %rbx,%rcx
   2c062:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2c066:	48 89 31             	mov    %rsi,(%rcx)
   2c069:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2c06d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2c073:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2c077:	49 89 c2             	mov    %rax,%r10
   2c07a:	e9 31 97 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2c07f:	8b 10                	mov    (%rax),%edx
   2c081:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2c087:	0f 85 f0 e4 ff ff    	jne    2a57d <JS_CallInternal+0x50ed>
   2c08d:	89 f2                	mov    %esi,%edx
   2c08f:	b9 07 00 00 00       	mov    $0x7,%ecx
   2c094:	4c 89 fe             	mov    %r15,%rsi
   2c097:	4c 89 ef             	mov    %r13,%rdi
   2c09a:	e8 c1 e3 01 00       	call   4a460 <add_property>
   2c09f:	48 85 c0             	test   %rax,%rax
   2c0a2:	0f 84 5d 2f 00 00    	je     2f005 <JS_CallInternal+0x9b75>
   2c0a8:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2c0af:	48 89 18             	mov    %rbx,(%rax)
   2c0b2:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2c0b9:	48 89 58 08          	mov    %rbx,0x8(%rax)
   2c0bd:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2c0c4:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2c0c8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c0cb:	76 14                	jbe    2c0e1 <JS_CallInternal+0x6c51>
   2c0cd:	48 8b 0b             	mov    (%rbx),%rcx
   2c0d0:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2c0d3:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2c0d6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c0d9:	85 d2                	test   %edx,%edx
   2c0db:	0f 8e 78 27 00 00    	jle    2e859 <JS_CallInternal+0x93c9>
   2c0e1:	41 0f b6 04 24       	movzbl (%r12),%eax
   2c0e6:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2c0ed:	49 83 c4 01          	add    $0x1,%r12
   2c0f1:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2c0f5:	49 89 c2             	mov    %rax,%r10
   2c0f8:	e9 b3 96 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2c0fd:	ba 08 00 00 00       	mov    $0x8,%edx
   2c102:	e9 8e f4 ff ff       	jmp    2b595 <JS_CallInternal+0x6105>
   2c107:	8d 86 4d ff ff ff    	lea    -0xb3(%rsi),%eax
   2c10d:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   2c113:	e9 3b a1 ff ff       	jmp    26253 <JS_CallInternal+0xdc3>
   2c118:	48 63 f6             	movslq %esi,%rsi
   2c11b:	48 c1 e6 04          	shl    $0x4,%rsi
   2c11f:	48 03 b5 a0 fe ff ff 	add    -0x160(%rbp),%rsi
   2c126:	e9 ed a0 ff ff       	jmp    26218 <JS_CallInternal+0xd88>
   2c12b:	81 bd 30 fe ff ff f2 	cmpl   $0xf2,-0x1d0(%rbp)
   2c132:	00 00 00 
   2c135:	0f 8f cb 11 00 00    	jg     2d306 <JS_CallInternal+0x7e76>
   2c13b:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2c13f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c142:	0f 86 1d a0 ff ff    	jbe    26165 <JS_CallInternal+0xcd5>
   2c148:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c14c:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2c14f:	83 ea 01             	sub    $0x1,%edx
   2c152:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c155:	85 d2                	test   %edx,%edx
   2c157:	0f 8f 08 a0 ff ff    	jg     26165 <JS_CallInternal+0xcd5>
   2c15d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c161:	48 89 c2             	mov    %rax,%rdx
   2c164:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2c16a:	e8 51 28 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2c16f:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2c175:	e9 eb 9f ff ff       	jmp    26165 <JS_CallInternal+0xcd5>
   2c17a:	48 89 f7             	mov    %rsi,%rdi
   2c17d:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   2c184:	48 83 ec 08          	sub    $0x8,%rsp
   2c188:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c18c:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c190:	48 89 ca             	mov    %rcx,%rdx
   2c193:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c19a:	48 89 fe             	mov    %rdi,%rsi
   2c19d:	b9 32 00 00 00       	mov    $0x32,%ecx
   2c1a2:	4c 89 ef             	mov    %r13,%rdi
   2c1a5:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c1a9:	6a 00                	push   $0x0
   2c1ab:	e8 f0 41 00 00       	call   303a0 <JS_GetPropertyInternal>
   2c1b0:	5f                   	pop    %rdi
   2c1b1:	41 58                	pop    %r8
   2c1b3:	49 89 c7             	mov    %rax,%r15
   2c1b6:	48 89 d0             	mov    %rdx,%rax
   2c1b9:	83 fa 06             	cmp    $0x6,%edx
   2c1bc:	0f 85 dc a7 ff ff    	jne    2699e <JS_CallInternal+0x150e>
   2c1c2:	4d 89 e7             	mov    %r12,%r15
   2c1c5:	e9 06 9a ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c1ca:	4d 89 c1             	mov    %r8,%r9
   2c1cd:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2c1d4:	48 83 ec 08          	sub    $0x8,%rsp
   2c1d8:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c1dc:	48 89 c2             	mov    %rax,%rdx
   2c1df:	4c 89 c8             	mov    %r9,%rax
   2c1e2:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c1e9:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c1ed:	4c 89 ef             	mov    %r13,%rdi
   2c1f0:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c1f4:	48 89 c6             	mov    %rax,%rsi
   2c1f7:	6a 00                	push   $0x0
   2c1f9:	e8 a2 41 00 00       	call   303a0 <JS_GetPropertyInternal>
   2c1fe:	41 5b                	pop    %r11
   2c200:	48 89 c1             	mov    %rax,%rcx
   2c203:	48 89 d0             	mov    %rdx,%rax
   2c206:	5a                   	pop    %rdx
   2c207:	83 f8 06             	cmp    $0x6,%eax
   2c20a:	0f 84 c0 99 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2c210:	49 89 cf             	mov    %rcx,%r15
   2c213:	e9 72 a5 ff ff       	jmp    2678a <JS_CallInternal+0x12fa>
   2c218:	4d 89 c1             	mov    %r8,%r9
   2c21b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2c222:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2c229:	48 83 ec 08          	sub    $0x8,%rsp
   2c22d:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c231:	4c 89 ef             	mov    %r13,%rdi
   2c234:	4c 89 7a 30          	mov    %r15,0x30(%rdx)
   2c238:	48 89 c2             	mov    %rax,%rdx
   2c23b:	4c 89 c8             	mov    %r9,%rax
   2c23e:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c242:	6a 00                	push   $0x0
   2c244:	48 89 c6             	mov    %rax,%rsi
   2c247:	e8 54 41 00 00       	call   303a0 <JS_GetPropertyInternal>
   2c24c:	41 59                	pop    %r9
   2c24e:	41 5a                	pop    %r10
   2c250:	83 fa 06             	cmp    $0x6,%edx
   2c253:	0f 85 00 a8 ff ff    	jne    26a59 <JS_CallInternal+0x15c9>
   2c259:	e9 72 99 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c25e:	66 90                	xchg   %ax,%ax
   2c260:	80 cc 08             	or     $0x8,%ah
   2c263:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2c267:	f3 0f 6f 6b f0       	movdqu -0x10(%rbx),%xmm5
   2c26c:	4c 89 ef             	mov    %r13,%rdi
   2c26f:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   2c275:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2c279:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2c27f:	0f 29 ad a0 fd ff ff 	movaps %xmm5,-0x260(%rbp)
   2c286:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2c28d:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2c292:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2c299:	e8 62 81 01 00       	call   44400 <js_get_function_name>
   2c29e:	4c 8d 05 9f ce 0a 00 	lea    0xace9f(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2c2a5:	48 8d 35 f6 d2 0a 00 	lea    0xad2f6(%rip),%rsi        # d95a2 <_IO_stdin_used+0x5a2>
   2c2ac:	4c 89 ef             	mov    %r13,%rdi
   2c2af:	48 89 d1             	mov    %rdx,%rcx
   2c2b2:	48 89 c2             	mov    %rax,%rdx
   2c2b5:	e8 a6 7f 01 00       	call   44260 <JS_ConcatString3>
   2c2ba:	49 89 c0             	mov    %rax,%r8
   2c2bd:	49 89 d1             	mov    %rdx,%r9
   2c2c0:	e9 c6 9d ff ff       	jmp    2608b <JS_CallInternal+0xbfb>
   2c2c5:	4c 89 c0             	mov    %r8,%rax
   2c2c8:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   2c2cf:	48 83 ec 08          	sub    $0x8,%rsp
   2c2d3:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c2d7:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c2db:	48 89 c6             	mov    %rax,%rsi
   2c2de:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2c2e5:	4c 89 ef             	mov    %r13,%rdi
   2c2e8:	4c 89 7a 30          	mov    %r15,0x30(%rdx)
   2c2ec:	4c 89 da             	mov    %r11,%rdx
   2c2ef:	6a 00                	push   $0x0
   2c2f1:	e8 aa 40 00 00       	call   303a0 <JS_GetPropertyInternal>
   2c2f6:	48 89 d1             	mov    %rdx,%rcx
   2c2f9:	5a                   	pop    %rdx
   2c2fa:	5e                   	pop    %rsi
   2c2fb:	83 f9 06             	cmp    $0x6,%ecx
   2c2fe:	0f 84 cc 98 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2c304:	49 89 c7             	mov    %rax,%r15
   2c307:	e9 15 a3 ff ff       	jmp    26621 <JS_CallInternal+0x1191>
   2c30c:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c313:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c317:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c31a:	76 04                	jbe    2c320 <JS_CallInternal+0x6e90>
   2c31c:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c320:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
   2c327:	4c 89 ef             	mov    %r13,%rdi
   2c32a:	48 8d b5 00 ff ff ff 	lea    -0x100(%rbp),%rsi
   2c331:	ba 8c 00 00 00       	mov    $0x8c,%edx
   2c336:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2c33d:	48 89 85 f0 fe ff ff 	mov    %rax,-0x110(%rbp)
   2c344:	e8 57 61 02 00       	call   524a0 <js_unary_arith_slow>
   2c349:	85 c0                	test   %eax,%eax
   2c34b:	0f 85 7f 98 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2c351:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c358:	48 8b b5 f0 fe ff ff 	mov    -0x110(%rbp),%rsi
   2c35f:	48 8b 11             	mov    (%rcx),%rdx
   2c362:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2c366:	48 89 31             	mov    %rsi,(%rcx)
   2c369:	48 8b b5 f8 fe ff ff 	mov    -0x108(%rbp),%rsi
   2c370:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2c374:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c377:	0f 86 c4 f0 ff ff    	jbe    2b441 <JS_CallInternal+0x5fb1>
   2c37d:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c380:	83 e9 01             	sub    $0x1,%ecx
   2c383:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c386:	85 c9                	test   %ecx,%ecx
   2c388:	0f 8f b3 f0 ff ff    	jg     2b441 <JS_CallInternal+0x5fb1>
   2c38e:	48 92                	xchg   %rax,%rdx
   2c390:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c394:	48 89 c6             	mov    %rax,%rsi
   2c397:	e8 24 26 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2c39c:	e9 a0 f0 ff ff       	jmp    2b441 <JS_CallInternal+0x5fb1>
   2c3a1:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c3a5:	0f 85 f1 2f 00 00    	jne    2f39c <JS_CallInternal+0x9f0c>
   2c3ab:	49 83 7a 08 00       	cmpq   $0x0,0x8(%r10)
   2c3b0:	4c 8b 40 18          	mov    0x18(%rax),%r8
   2c3b4:	0f 84 d7 36 00 00    	je     2fa91 <JS_CallInternal+0xa601>
   2c3ba:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2c3c1:	49 89 c3             	mov    %rax,%r11
   2c3c4:	41 f6 43 10 08       	testb  $0x8,0x10(%r11)
   2c3c9:	75 24                	jne    2c3ef <JS_CallInternal+0x6f5f>
   2c3cb:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2c3cf:	49 8b 0a             	mov    (%r10),%rcx
   2c3d2:	48 85 f6             	test   %rsi,%rsi
   2c3d5:	0f 84 a6 1e 00 00    	je     2e281 <JS_CallInternal+0x8df1>
   2c3db:	48 8b bd 10 fe ff ff 	mov    -0x1f0(%rbp),%rdi
   2c3e2:	48 8b 47 30          	mov    0x30(%rdi),%rax
   2c3e6:	48 39 cf             	cmp    %rcx,%rdi
   2c3e9:	0f 84 f9 2a 00 00    	je     2eee8 <JS_CallInternal+0x9a58>
   2c3ef:	b8 01 00 00 00       	mov    $0x1,%eax
   2c3f4:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2c3f8:	66 89 85 00 fe ff ff 	mov    %ax,-0x200(%rbp)
   2c3ff:	e9 e1 a0 ff ff       	jmp    264e5 <JS_CallInternal+0x1055>
   2c404:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c40b:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c40f:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c412:	76 04                	jbe    2c418 <JS_CallInternal+0x6f88>
   2c414:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c418:	48 89 95 e8 fe ff ff 	mov    %rdx,-0x118(%rbp)
   2c41f:	4c 89 ef             	mov    %r13,%rdi
   2c422:	48 8d b5 f0 fe ff ff 	lea    -0x110(%rbp),%rsi
   2c429:	ba 8d 00 00 00       	mov    $0x8d,%edx
   2c42e:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2c435:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
   2c43c:	e8 5f 60 02 00       	call   524a0 <js_unary_arith_slow>
   2c441:	85 c0                	test   %eax,%eax
   2c443:	0f 85 87 97 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2c449:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c450:	48 8b b5 e0 fe ff ff 	mov    -0x120(%rbp),%rsi
   2c457:	48 8b 11             	mov    (%rcx),%rdx
   2c45a:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2c45e:	48 89 31             	mov    %rsi,(%rcx)
   2c461:	48 8b b5 e8 fe ff ff 	mov    -0x118(%rbp),%rsi
   2c468:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2c46c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c46f:	0f 86 f0 cf ff ff    	jbe    29465 <JS_CallInternal+0x3fd5>
   2c475:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c478:	83 e9 01             	sub    $0x1,%ecx
   2c47b:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c47e:	85 c9                	test   %ecx,%ecx
   2c480:	0f 8f df cf ff ff    	jg     29465 <JS_CallInternal+0x3fd5>
   2c486:	48 92                	xchg   %rax,%rdx
   2c488:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c48c:	48 89 c6             	mov    %rax,%rsi
   2c48f:	e8 2c 25 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2c494:	e9 cc cf ff ff       	jmp    29465 <JS_CallInternal+0x3fd5>
   2c499:	b8 06 00 00 00       	mov    $0x6,%eax
   2c49e:	31 c9                	xor    %ecx,%ecx
   2c4a0:	e9 ed 97 ff ff       	jmp    25c92 <JS_CallInternal+0x802>
   2c4a5:	66 41 83 78 12 01    	cmpw   $0x1,0x12(%r8)
   2c4ab:	0f 85 b0 9d ff ff    	jne    26261 <JS_CallInternal+0xdd1>
   2c4b1:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2c4b6:	0f 85 a5 9d ff ff    	jne    26261 <JS_CallInternal+0xdd1>
   2c4bc:	4b 8d 74 3a 01       	lea    0x1(%r10,%r15,1),%rsi
   2c4c1:	48 83 7e 08 00       	cmpq   $0x0,0x8(%rsi)
   2c4c6:	0f 85 95 9d ff ff    	jne    26261 <JS_CallInternal+0xdd1>
   2c4cc:	49 8b 40 18          	mov    0x18(%r8),%rax
   2c4d0:	48 39 06             	cmp    %rax,(%rsi)
   2c4d3:	0f 85 88 9d ff ff    	jne    26261 <JS_CallInternal+0xdd1>
   2c4d9:	44 8b 7e 10          	mov    0x10(%rsi),%r15d
   2c4dd:	44 8b 48 18          	mov    0x18(%rax),%r9d
   2c4e1:	4a 8d 34 fd 00 00 00 	lea    0x0(,%r15,8),%rsi
   2c4e8:	00 
   2c4e9:	4a 8d 74 8e 3c       	lea    0x3c(%rsi,%r9,4),%rsi
   2c4ee:	0f b6 44 30 03       	movzbl 0x3(%rax,%rsi,1),%eax
   2c4f3:	c0 e8 02             	shr    $0x2,%al
   2c4f6:	83 e0 3a             	and    $0x3a,%eax
   2c4f9:	3c 02                	cmp    $0x2,%al
   2c4fb:	0f 85 60 9d ff ff    	jne    26261 <JS_CallInternal+0xdd1>
   2c501:	4c 89 f8             	mov    %r15,%rax
   2c504:	48 c1 e0 04          	shl    $0x4,%rax
   2c508:	49 03 40 20          	add    0x20(%r8),%rax
   2c50c:	83 78 08 00          	cmpl   $0x0,0x8(%rax)
   2c510:	0f 85 4b 9d ff ff    	jne    26261 <JS_CallInternal+0xdd1>
   2c516:	8b 30                	mov    (%rax),%esi
   2c518:	81 fe ff ff ff 7f    	cmp    $0x7fffffff,%esi
   2c51e:	0f 84 3d 9d ff ff    	je     26261 <JS_CallInternal+0xdd1>
   2c524:	8d 4e 01             	lea    0x1(%rsi),%ecx
   2c527:	48 89 08             	mov    %rcx,(%rax)
   2c52a:	31 c9                	xor    %ecx,%ecx
   2c52c:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2c530:	41 8d 43 0b          	lea    0xb(%r11),%eax
   2c534:	48 98                	cltq
   2c536:	49 01 c2             	add    %rax,%r10
   2c539:	41 0f b6 02          	movzbl (%r10),%eax
   2c53d:	4d 8d 62 01          	lea    0x1(%r10),%r12
   2c541:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2c545:	49 89 c2             	mov    %rax,%r10
   2c548:	e9 63 92 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2c54d:	0f 1f 00             	nopl   (%rax)
   2c550:	85 c0                	test   %eax,%eax
   2c552:	0f 84 d3 d3 ff ff    	je     2992b <JS_CallInternal+0x449b>
   2c558:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c55c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2c560:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c565:	4c 89 ef             	mov    %r13,%rdi
   2c568:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c56f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c573:	e8 78 75 01 00       	call   43af0 <JS_ToStringInternal>
   2c578:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2c57f:	49 89 d7             	mov    %rdx,%r15
   2c582:	83 fa 06             	cmp    $0x6,%edx
   2c585:	0f 84 bc 33 00 00    	je     2f947 <JS_CallInternal+0xa4b7>
   2c58b:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2c58f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c592:	76 15                	jbe    2c5a9 <JS_CallInternal+0x7119>
   2c594:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c598:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2c59b:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2c59e:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c5a1:	85 d2                	test   %edx,%edx
   2c5a3:	0f 8e f2 33 00 00    	jle    2f99b <JS_CallInternal+0xa50b>
   2c5a9:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2c5b0:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   2c5b4:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2c5b8:	e9 6e d3 ff ff       	jmp    2992b <JS_CallInternal+0x449b>
   2c5bd:	83 fa 08             	cmp    $0x8,%edx
   2c5c0:	0f 85 60 0c 00 00    	jne    2d226 <JS_CallInternal+0x7d96>
   2c5c6:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2c5cb:	66 0f 57 05 cd a4 0b 	xorpd  0xba4cd(%rip),%xmm0        # e6aa0 <typed_array_size_log2+0x28>
   2c5d2:	00 
   2c5d3:	48 c7 43 f8 08 00 00 	movq   $0x8,-0x8(%rbx)
   2c5da:	00 
   2c5db:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2c5e0:	e9 06 ee ff ff       	jmp    2b3eb <JS_CallInternal+0x5f5b>
   2c5e5:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c5e9:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c5ed:	4c 89 d1             	mov    %r10,%rcx
   2c5f0:	4d 89 f8             	mov    %r15,%r8
   2c5f3:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2c5f9:	4c 89 ef             	mov    %r13,%rdi
   2c5fc:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2c603:	4c 89 bd 38 fe ff ff 	mov    %r15,-0x1c8(%rbp)
   2c60a:	e8 a1 19 01 00       	call   3dfb0 <JS_SetPrototypeInternal>
   2c60f:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2c616:	85 c0                	test   %eax,%eax
   2c618:	0f 89 83 ae ff ff    	jns    274a1 <JS_CallInternal+0x2011>
   2c61e:	4d 89 e7             	mov    %r12,%r15
   2c621:	e9 aa 95 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c626:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2c62d:	00 00 00 
   2c630:	85 c9                	test   %ecx,%ecx
   2c632:	0f 85 c0 38 00 00    	jne    2fef8 <JS_CallInternal+0xaa68>
   2c638:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2c63c:	4c 8d 63 e0          	lea    -0x20(%rbx),%r12
   2c640:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c643:	76 15                	jbe    2c65a <JS_CallInternal+0x71ca>
   2c645:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2c649:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2c64c:	83 ea 01             	sub    $0x1,%edx
   2c64f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c652:	85 d2                	test   %edx,%edx
   2c654:	0f 8e 57 2b 00 00    	jle    2f1b1 <JS_CallInternal+0x9d21>
   2c65a:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2c65e:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2c662:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c667:	4c 89 ef             	mov    %r13,%rdi
   2c66a:	4c 89 e3             	mov    %r12,%rbx
   2c66d:	e8 1e 86 06 00       	call   94c90 <JS_IteratorClose>
   2c672:	e9 66 97 ff ff       	jmp    25ddd <JS_CallInternal+0x94d>
   2c677:	48 63 f6             	movslq %esi,%rsi
   2c67a:	48 c1 e6 04          	shl    $0x4,%rsi
   2c67e:	48 03 b5 80 fe ff ff 	add    -0x180(%rbp),%rsi
   2c685:	e9 8e 9b ff ff       	jmp    26218 <JS_CallInternal+0xd88>
   2c68a:	41 83 ff 08          	cmp    $0x8,%r15d
   2c68e:	0f 85 90 0a 00 00    	jne    2d124 <JS_CallInternal+0x7c94>
   2c694:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c698:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2c69d:	31 c9                	xor    %ecx,%ecx
   2c69f:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c6a3:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c6a7:	0f 9b c1             	setnp  %cl
   2c6aa:	0f 45 ca             	cmovne %edx,%ecx
   2c6ad:	e9 d9 cf ff ff       	jmp    2968b <JS_CallInternal+0x41fb>
   2c6b2:	83 f9 08             	cmp    $0x8,%ecx
   2c6b5:	0f 85 95 0a 00 00    	jne    2d150 <JS_CallInternal+0x7cc0>
   2c6bb:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c6bf:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2c6c4:	45 31 ff             	xor    %r15d,%r15d
   2c6c7:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c6cb:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c6cf:	41 0f 9b c7          	setnp  %r15b
   2c6d3:	44 0f 45 fa          	cmovne %edx,%r15d
   2c6d7:	e9 56 cf ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   2c6dc:	41 83 f8 08          	cmp    $0x8,%r8d
   2c6e0:	0f 85 5c 0c 00 00    	jne    2d342 <JS_CallInternal+0x7eb2>
   2c6e6:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c6ea:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c6ef:	45 31 ff             	xor    %r15d,%r15d
   2c6f2:	b8 00 00 00 00       	mov    $0x0,%eax
   2c6f7:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c6fb:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c6ff:	41 0f 9b c7          	setnp  %r15b
   2c703:	4c 0f 45 f8          	cmovne %rax,%r15
   2c707:	e9 d2 ce ff ff       	jmp    295de <JS_CallInternal+0x414e>
   2c70c:	41 83 ff 08          	cmp    $0x8,%r15d
   2c710:	0f 85 c5 0b 00 00    	jne    2d2db <JS_CallInternal+0x7e4b>
   2c716:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c71a:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c71f:	31 c0                	xor    %eax,%eax
   2c721:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2c725:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c729:	ba 01 00 00 00       	mov    $0x1,%edx
   2c72e:	0f 9a c0             	setp   %al
   2c731:	48 0f 45 c2          	cmovne %rdx,%rax
   2c735:	e9 4f ce ff ff       	jmp    29589 <JS_CallInternal+0x40f9>
   2c73a:	4d 89 e7             	mov    %r12,%r15
   2c73d:	e9 8e 94 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c742:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c746:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c74a:	4c 89 ef             	mov    %r13,%rdi
   2c74d:	4d 89 e7             	mov    %r12,%r15
   2c750:	e8 db a9 01 00       	call   47130 <JS_ValueToAtom>
   2c755:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2c75b:	85 c0                	test   %eax,%eax
   2c75d:	0f 85 4f 98 ff ff    	jne    25fb2 <JS_CallInternal+0xb22>
   2c763:	e9 68 94 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c768:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2c76f:	00 
   2c770:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c774:	48 89 ce             	mov    %rcx,%rsi
   2c777:	e8 44 22 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2c77c:	e9 6e bc ff ff       	jmp    283ef <JS_CallInternal+0x2f5f>
   2c781:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c788:	44 89 d2             	mov    %r10d,%edx
   2c78b:	48 89 de             	mov    %rbx,%rsi
   2c78e:	4c 89 ef             	mov    %r13,%rdi
   2c791:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c795:	e8 06 5d 02 00       	call   524a0 <js_unary_arith_slow>
   2c79a:	85 c0                	test   %eax,%eax
   2c79c:	0f 84 4f cd ff ff    	je     294f1 <JS_CallInternal+0x4061>
   2c7a2:	4d 89 e7             	mov    %r12,%r15
   2c7a5:	e9 26 94 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c7aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2c7b0:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c7b7:	44 89 d2             	mov    %r10d,%edx
   2c7ba:	48 89 de             	mov    %rbx,%rsi
   2c7bd:	4c 89 ef             	mov    %r13,%rdi
   2c7c0:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c7c4:	e8 e7 61 02 00       	call   529b0 <js_post_inc_slow>
   2c7c9:	85 c0                	test   %eax,%eax
   2c7cb:	0f 84 75 de ff ff    	je     2a646 <JS_CallInternal+0x51b6>
   2c7d1:	4d 89 e7             	mov    %r12,%r15
   2c7d4:	e9 f7 93 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c7d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c7e0:	45 31 c0             	xor    %r8d,%r8d
   2c7e3:	48 8b 0b             	mov    (%rbx),%rcx
   2c7e6:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2c7e9:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2c7ec:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c7ef:	85 d2                	test   %edx,%edx
   2c7f1:	0f 8e 58 15 00 00    	jle    2dd4f <JS_CallInternal+0x88bf>
   2c7f7:	49 8b 47 08          	mov    0x8(%r15),%rax
   2c7fb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c7fe:	76 14                	jbe    2c814 <JS_CallInternal+0x7384>
   2c800:	49 8b 17             	mov    (%r15),%rdx
   2c803:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c806:	83 e9 01             	sub    $0x1,%ecx
   2c809:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c80c:	85 c9                	test   %ecx,%ecx
   2c80e:	0f 8e 58 11 00 00    	jle    2d96c <JS_CallInternal+0x84dc>
   2c814:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2c818:	0f 85 80 e5 ff ff    	jne    2ad9e <JS_CallInternal+0x590e>
   2c81e:	4d 89 e7             	mov    %r12,%r15
   2c821:	e9 aa 93 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c826:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c82d:	44 89 d2             	mov    %r10d,%edx
   2c830:	48 89 de             	mov    %rbx,%rsi
   2c833:	4c 89 ef             	mov    %r13,%rdi
   2c836:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c83a:	e8 61 5c 02 00       	call   524a0 <js_unary_arith_slow>
   2c83f:	85 c0                	test   %eax,%eax
   2c841:	0f 84 1e da ff ff    	je     2a265 <JS_CallInternal+0x4dd5>
   2c847:	4d 89 e7             	mov    %r12,%r15
   2c84a:	e9 81 93 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c84f:	90                   	nop
   2c850:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c857:	44 89 d2             	mov    %r10d,%edx
   2c85a:	48 89 de             	mov    %rbx,%rsi
   2c85d:	4c 89 ef             	mov    %r13,%rdi
   2c860:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c864:	e8 47 61 02 00       	call   529b0 <js_post_inc_slow>
   2c869:	85 c0                	test   %eax,%eax
   2c86b:	0f 84 38 cc ff ff    	je     294a9 <JS_CallInternal+0x4019>
   2c871:	4d 89 e7             	mov    %r12,%r15
   2c874:	e9 57 93 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c879:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c880:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2c884:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2c888:	f6 85 30 fe ff ff 02 	testb  $0x2,-0x1d0(%rbp)
   2c88f:	0f 84 74 0c 00 00    	je     2d509 <JS_CallInternal+0x8079>
   2c895:	48 83 ec 08          	sub    $0x8,%rsp
   2c899:	45 31 c9             	xor    %r9d,%r9d
   2c89c:	6a 00                	push   $0x0
   2c89e:	4c 89 ef             	mov    %r13,%rdi
   2c8a1:	e8 6a 3a 00 00       	call   30310 <JS_CallFree>
   2c8a6:	41 58                	pop    %r8
   2c8a8:	41 59                	pop    %r9
   2c8aa:	48 89 c1             	mov    %rax,%rcx
   2c8ad:	48 89 d0             	mov    %rdx,%rax
   2c8b0:	83 fa 06             	cmp    $0x6,%edx
   2c8b3:	0f 84 17 93 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2c8b9:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c8bd:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c8c0:	76 15                	jbe    2c8d7 <JS_CallInternal+0x7447>
   2c8c2:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c8c6:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2c8c9:	83 ea 01             	sub    $0x1,%edx
   2c8cc:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c8cf:	85 d2                	test   %edx,%edx
   2c8d1:	0f 8e 96 29 00 00    	jle    2f26d <JS_CallInternal+0x9ddd>
   2c8d7:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2c8db:	31 c0                	xor    %eax,%eax
   2c8dd:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2c8e1:	e9 80 c8 ff ff       	jmp    29166 <JS_CallInternal+0x3cd6>
   2c8e6:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2c8ed:	4c 03 4e 30          	add    0x30(%rsi),%r9
   2c8f1:	80 79 11 00          	cmpb   $0x0,0x11(%rcx)
   2c8f5:	0f 84 00 0e 00 00    	je     2d6fb <JS_CallInternal+0x826b>
   2c8fb:	41 83 fa 3a          	cmp    $0x3a,%r10d
   2c8ff:	0f 84 c6 99 ff ff    	je     262cb <JS_CallInternal+0xe3b>
   2c905:	41 8b 71 04          	mov    0x4(%r9),%esi
   2c909:	4c 89 ef             	mov    %r13,%rdi
   2c90c:	83 fa 04             	cmp    $0x4,%edx
   2c90f:	0f 84 1f 39 00 00    	je     30234 <JS_CallInternal+0xada4>
   2c915:	e8 76 8d 00 00       	call   35690 <JS_ThrowTypeErrorReadOnly.part.0>
   2c91a:	e9 b1 92 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2c91f:	90                   	nop
   2c920:	48 89 ce             	mov    %rcx,%rsi
   2c923:	4c 89 ef             	mov    %r13,%rdi
   2c926:	4c 89 95 20 fe ff ff 	mov    %r10,-0x1e0(%rbp)
   2c92d:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2c934:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2c93b:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2c942:	e8 89 0d 01 00       	call   3d6d0 <expand_fast_array>
   2c947:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2c94e:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2c955:	83 f8 ff             	cmp    $0xffffffff,%eax
   2c958:	4c 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%r10
   2c95f:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2c966:	0f 84 da 29 00 00    	je     2f346 <JS_CallInternal+0x9eb6>
   2c96c:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2c972:	89 41 38             	mov    %eax,0x38(%rcx)
   2c975:	31 c0                	xor    %eax,%eax
   2c977:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2c97e:	00 00 
   2c980:	f3 41 0f 6f 04 00    	movdqu (%r8,%rax,1),%xmm0
   2c986:	48 8b 51 30          	mov    0x30(%rcx),%rdx
   2c98a:	0f 11 04 02          	movups %xmm0,(%rdx,%rax,1)
   2c98e:	48 83 c0 10          	add    $0x10,%rax
   2c992:	4c 39 c8             	cmp    %r9,%rax
   2c995:	75 e9                	jne    2c980 <JS_CallInternal+0x74f0>
   2c997:	48 8b 51 20          	mov    0x20(%rcx),%rdx
   2c99b:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2c9a2:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2c9a6:	48 8b 32             	mov    (%rdx),%rsi
   2c9a9:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
   2c9b0:	00 
   2c9b1:	48 89 1a             	mov    %rbx,(%rdx)
   2c9b4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c9b7:	0f 86 44 9f ff ff    	jbe    26901 <JS_CallInternal+0x1471>
   2c9bd:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2c9c0:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2c9c3:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c9c6:	85 d2                	test   %edx,%edx
   2c9c8:	0f 8f 33 9f ff ff    	jg     26901 <JS_CallInternal+0x1471>
   2c9ce:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c9d2:	48 89 c2             	mov    %rax,%rdx
   2c9d5:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2c9dc:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2c9e3:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2c9ea:	e8 d1 1f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2c9ef:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2c9f6:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2c9fd:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2ca04:	e9 f8 9e ff ff       	jmp    26901 <JS_CallInternal+0x1471>
   2ca09:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ca0d:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2ca12:	b8 08 00 00 00       	mov    $0x8,%eax
   2ca17:	e9 c1 d8 ff ff       	jmp    2a2dd <JS_CallInternal+0x4e4d>
   2ca1c:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2ca23:	48 92                	xchg   %rax,%rdx
   2ca25:	4c 89 fe             	mov    %r15,%rsi
   2ca28:	4c 89 ef             	mov    %r13,%rdi
   2ca2b:	49 89 d0             	mov    %rdx,%r8
   2ca2e:	4c 89 ca             	mov    %r9,%rdx
   2ca31:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2ca38:	4c 89 61 30          	mov    %r12,0x30(%rcx)
   2ca3c:	48 89 c1             	mov    %rax,%rcx
   2ca3f:	e8 9c 3f 00 00       	call   309e0 <JS_GetPropertyValue>
   2ca44:	48 89 c1             	mov    %rax,%rcx
   2ca47:	48 89 d0             	mov    %rdx,%rax
   2ca4a:	83 fa 06             	cmp    $0x6,%edx
   2ca4d:	0f 84 7b 2c 00 00    	je     2f6ce <JS_CallInternal+0xa23e>
   2ca53:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2ca5a:	e9 aa a9 ff ff       	jmp    27409 <JS_CallInternal+0x1f79>
   2ca5f:	48 8b bd b8 fe ff ff 	mov    -0x148(%rbp),%rdi
   2ca66:	49 89 d1             	mov    %rdx,%r9
   2ca69:	49 89 f2             	mov    %rsi,%r10
   2ca6c:	48 89 ca             	mov    %rcx,%rdx
   2ca6f:	49 89 d0             	mov    %rdx,%r8
   2ca72:	48 89 c1             	mov    %rax,%rcx
   2ca75:	4c 89 ce             	mov    %r9,%rsi
   2ca78:	4c 89 d2             	mov    %r10,%rdx
   2ca7b:	4c 89 67 30          	mov    %r12,0x30(%rdi)
   2ca7f:	4c 89 ef             	mov    %r13,%rdi
   2ca82:	e8 59 3f 00 00       	call   309e0 <JS_GetPropertyValue>
   2ca87:	48 89 c1             	mov    %rax,%rcx
   2ca8a:	48 89 d0             	mov    %rdx,%rax
   2ca8d:	83 fa 06             	cmp    $0x6,%edx
   2ca90:	0f 84 fa 34 00 00    	je     2ff90 <JS_CallInternal+0xab00>
   2ca96:	48 89 ca             	mov    %rcx,%rdx
   2ca99:	e9 f6 cc ff ff       	jmp    29794 <JS_CallInternal+0x4304>
   2ca9e:	8b 00                	mov    (%rax),%eax
   2caa0:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2caa5:	0f 85 64 91 ff ff    	jne    25c0f <JS_CallInternal+0x77f>
   2caab:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cab2:	48 83 ec 08          	sub    $0x8,%rsp
   2cab6:	31 c9                	xor    %ecx,%ecx
   2cab8:	45 31 c9             	xor    %r9d,%r9d
   2cabb:	45 31 c0             	xor    %r8d,%r8d
   2cabe:	4c 89 ef             	mov    %r13,%rdi
   2cac1:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2cac5:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2cacc:	48 8b b0 d8 04 00 00 	mov    0x4d8(%rax),%rsi
   2cad3:	48 8b 90 e0 04 00 00 	mov    0x4e0(%rax),%rdx
   2cada:	6a 00                	push   $0x0
   2cadc:	e8 0f 6b 00 00       	call   335f0 <build_backtrace>
   2cae1:	59                   	pop    %rcx
   2cae2:	5e                   	pop    %rsi
   2cae3:	e9 39 91 ff ff       	jmp    25c21 <JS_CallInternal+0x791>
   2cae8:	ba 03 00 00 00       	mov    $0x3,%edx
   2caed:	45 31 ff             	xor    %r15d,%r15d
   2caf0:	e9 6f 9a ff ff       	jmp    26564 <JS_CallInternal+0x10d4>
   2caf5:	8b 10                	mov    (%rax),%edx
   2caf7:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2cafd:	0f 85 1c de ff ff    	jne    2a91f <JS_CallInternal+0x548f>
   2cb03:	48 83 ec 08          	sub    $0x8,%rsp
   2cb07:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2cb0b:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2cb0f:	4c 89 da             	mov    %r11,%rdx
   2cb12:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cb19:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2cb20:	4c 89 d6             	mov    %r10,%rsi
   2cb23:	4c 89 ef             	mov    %r13,%rdi
   2cb26:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2cb2d:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2cb31:	68 00 80 00 00       	push   $0x8000
   2cb36:	41 53                	push   %r11
   2cb38:	41 52                	push   %r10
   2cb3a:	e8 b1 45 00 00       	call   310f0 <JS_SetPropertyInternal>
   2cb3f:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2cb46:	48 83 c4 20          	add    $0x20,%rsp
   2cb4a:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2cb4e:	76 1a                	jbe    2cb6a <JS_CallInternal+0x76da>
   2cb50:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2cb57:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   2cb5b:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2cb5e:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   2cb62:	85 d2                	test   %edx,%edx
   2cb64:	0f 8e a3 29 00 00    	jle    2f50d <JS_CallInternal+0xa07d>
   2cb6a:	48 83 eb 20          	sub    $0x20,%rbx
   2cb6e:	85 c0                	test   %eax,%eax
   2cb70:	0f 89 1d de ff ff    	jns    2a993 <JS_CallInternal+0x5503>
   2cb76:	e9 55 90 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2cb7b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cb82:	48 89 de             	mov    %rbx,%rsi
   2cb85:	4c 89 ef             	mov    %r13,%rdi
   2cb88:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cb8c:	e8 9f 5e 02 00       	call   52a30 <js_not_slow>
   2cb91:	85 c0                	test   %eax,%eax
   2cb93:	0f 84 c7 e7 ff ff    	je     2b360 <JS_CallInternal+0x5ed0>
   2cb99:	4d 89 e7             	mov    %r12,%r15
   2cb9c:	e9 2f 90 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2cba1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2cba8:	31 c9                	xor    %ecx,%ecx
   2cbaa:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cbb0:	e9 73 a4 ff ff       	jmp    27028 <JS_CallInternal+0x1b98>
   2cbb5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cbbc:	48 8d 7b f0          	lea    -0x10(%rbx),%rdi
   2cbc0:	41 b9 00 80 00 00    	mov    $0x8000,%r9d
   2cbc6:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cbca:	48 89 d8             	mov    %rbx,%rax
   2cbcd:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2cbd1:	48 83 eb 30          	sub    $0x30,%rbx
   2cbd5:	48 8b 48 e0          	mov    -0x20(%rax),%rcx
   2cbd9:	4c 8b 40 e8          	mov    -0x18(%rax),%r8
   2cbdd:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   2cbe1:	ff 77 08             	push   0x8(%rdi)
   2cbe4:	ff 37                	push   (%rdi)
   2cbe6:	4c 89 ef             	mov    %r13,%rdi
   2cbe9:	e8 b2 51 00 00       	call   31da0 <JS_SetPropertyValue>
   2cbee:	41 59                	pop    %r9
   2cbf0:	41 5a                	pop    %r10
   2cbf2:	41 89 c7             	mov    %eax,%r15d
   2cbf5:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2cbf9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2cbfc:	76 14                	jbe    2cc12 <JS_CallInternal+0x7782>
   2cbfe:	48 8b 0b             	mov    (%rbx),%rcx
   2cc01:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2cc04:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2cc07:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2cc0a:	85 d2                	test   %edx,%edx
   2cc0c:	0f 8e 9d 27 00 00    	jle    2f3af <JS_CallInternal+0x9f1f>
   2cc12:	45 85 ff             	test   %r15d,%r15d
   2cc15:	0f 89 29 ac ff ff    	jns    27844 <JS_CallInternal+0x23b4>
   2cc1b:	4d 89 e7             	mov    %r12,%r15
   2cc1e:	e9 ad 8f ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2cc23:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cc2a:	4c 89 ca             	mov    %r9,%rdx
   2cc2d:	4c 89 d1             	mov    %r10,%rcx
   2cc30:	4d 89 f8             	mov    %r15,%r8
   2cc33:	4c 89 ef             	mov    %r13,%rdi
   2cc36:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2cc3d:	48 89 c6             	mov    %rax,%rsi
   2cc40:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2cc47:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   2cc4e:	e8 9d 7a 00 00       	call   346f0 <JS_CheckBrand>
   2cc53:	83 f8 ff             	cmp    $0xffffffff,%eax
   2cc56:	0f 84 36 34 00 00    	je     30092 <JS_CallInternal+0xac02>
   2cc5c:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2cc63:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   2cc6a:	48 63 c8             	movslq %eax,%rcx
   2cc6d:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2cc74:	e9 92 d0 ff ff       	jmp    29d0b <JS_CallInternal+0x487b>
   2cc79:	31 c9                	xor    %ecx,%ecx
   2cc7b:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cc81:	e9 03 a5 ff ff       	jmp    27189 <JS_CallInternal+0x1cf9>
   2cc86:	48 89 c6             	mov    %rax,%rsi
   2cc89:	4c 89 ef             	mov    %r13,%rdi
   2cc8c:	e8 8f 42 ff ff       	call   20f20 <JS_ToBoolFree>
   2cc91:	e9 dc c3 ff ff       	jmp    29072 <JS_CallInternal+0x3be2>
   2cc96:	48 89 c6             	mov    %rax,%rsi
   2cc99:	4c 89 ef             	mov    %r13,%rdi
   2cc9c:	e8 7f 42 ff ff       	call   20f20 <JS_ToBoolFree>
   2cca1:	e9 70 c3 ff ff       	jmp    29016 <JS_CallInternal+0x3b86>
   2cca6:	48 89 c6             	mov    %rax,%rsi
   2cca9:	4c 89 ef             	mov    %r13,%rdi
   2ccac:	e8 6f 42 ff ff       	call   20f20 <JS_ToBoolFree>
   2ccb1:	e9 04 c3 ff ff       	jmp    28fba <JS_CallInternal+0x3b2a>
   2ccb6:	48 89 c6             	mov    %rax,%rsi
   2ccb9:	4c 89 ef             	mov    %r13,%rdi
   2ccbc:	e8 5f 42 ff ff       	call   20f20 <JS_ToBoolFree>
   2ccc1:	e9 06 db ff ff       	jmp    2a7cc <JS_CallInternal+0x533c>
   2ccc6:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2cccb:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2ccd0:	66 83 7a 12 01       	cmpw   $0x1,0x12(%rdx)
   2ccd5:	0f 85 9a be ff ff    	jne    28b75 <JS_CallInternal+0x36e5>
   2ccdb:	f6 42 10 08          	testb  $0x8,0x10(%rdx)
   2ccdf:	0f 85 90 be ff ff    	jne    28b75 <JS_CallInternal+0x36e5>
   2cce5:	48 8b 72 18          	mov    0x18(%rdx),%rsi
   2cce9:	48 39 31             	cmp    %rsi,(%rcx)
   2ccec:	0f 85 83 be ff ff    	jne    28b75 <JS_CallInternal+0x36e5>
   2ccf2:	8b 41 10             	mov    0x10(%rcx),%eax
   2ccf5:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2ccf9:	48 c1 e0 04          	shl    $0x4,%rax
   2ccfd:	48 03 42 20          	add    0x20(%rdx),%rax
   2cd01:	48 8b 10             	mov    (%rax),%rdx
   2cd04:	48 8b 40 08          	mov    0x8(%rax),%rax
   2cd08:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2cd0b:	76 04                	jbe    2cd11 <JS_CallInternal+0x7881>
   2cd0d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cd11:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2cd15:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2cd1a:	48 89 13             	mov    %rdx,(%rbx)
   2cd1d:	48 89 cb             	mov    %rcx,%rbx
   2cd20:	e9 6a be ff ff       	jmp    28b8f <JS_CallInternal+0x36ff>
   2cd25:	0f 1f 00             	nopl   (%rax)
   2cd28:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2cd2f:	45 89 d9             	mov    %r11d,%r9d
   2cd32:	31 c9                	xor    %ecx,%ecx
   2cd34:	4c 89 ef             	mov    %r13,%rdi
   2cd37:	48 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%rdx
   2cd3e:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cd44:	48 c7 85 80 fd ff ff 	movq   $0x0,-0x280(%rbp)
   2cd4b:	00 00 00 00 
   2cd4f:	48 c7 85 88 fd ff ff 	movq   $0x3,-0x278(%rbp)
   2cd56:	03 00 00 00 
   2cd5a:	6a 02                	push   $0x2
   2cd5c:	41 52                	push   %r10
   2cd5e:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2cd65:	ff b5 88 fd ff ff    	push   -0x278(%rbp)
   2cd6b:	ff b5 80 fd ff ff    	push   -0x280(%rbp)
   2cd71:	44 89 9d 00 fe ff ff 	mov    %r11d,-0x200(%rbp)
   2cd78:	e8 13 87 ff ff       	call   25490 <JS_CallInternal>
   2cd7d:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2cd84:	44 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11d
   2cd8b:	48 83 c4 20          	add    $0x20,%rsp
   2cd8f:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2cd96:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2cd9d:	e9 ce a2 ff ff       	jmp    27070 <JS_CallInternal+0x1be0>
   2cda2:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2cda9:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2cdb0:	00 
   2cdb1:	e9 c6 a0 ff ff       	jmp    26e7c <JS_CallInternal+0x19ec>
   2cdb6:	48 92                	xchg   %rax,%rdx
   2cdb8:	4c 89 ef             	mov    %r13,%rdi
   2cdbb:	48 89 c6             	mov    %rax,%rsi
   2cdbe:	e8 5d 41 ff ff       	call   20f20 <JS_ToBoolFree>
   2cdc3:	e9 07 c3 ff ff       	jmp    290cf <JS_CallInternal+0x3c3f>
   2cdc8:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2cdcd:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2cdd2:	66 83 7a 12 01       	cmpw   $0x1,0x12(%rdx)
   2cdd7:	0f 85 fa bb ff ff    	jne    289d7 <JS_CallInternal+0x3547>
   2cddd:	f6 42 10 08          	testb  $0x8,0x10(%rdx)
   2cde1:	0f 85 f0 bb ff ff    	jne    289d7 <JS_CallInternal+0x3547>
   2cde7:	48 8b 72 18          	mov    0x18(%rdx),%rsi
   2cdeb:	48 39 31             	cmp    %rsi,(%rcx)
   2cdee:	0f 85 e3 bb ff ff    	jne    289d7 <JS_CallInternal+0x3547>
   2cdf4:	8b 41 10             	mov    0x10(%rcx),%eax
   2cdf7:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2cdfb:	48 c1 e0 04          	shl    $0x4,%rax
   2cdff:	48 03 42 20          	add    0x20(%rdx),%rax
   2ce03:	48 8b 10             	mov    (%rax),%rdx
   2ce06:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ce0a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ce0d:	76 04                	jbe    2ce13 <JS_CallInternal+0x7983>
   2ce0f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2ce13:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2ce17:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2ce1c:	48 89 13             	mov    %rdx,(%rbx)
   2ce1f:	48 89 cb             	mov    %rcx,%rbx
   2ce22:	e9 ca bb ff ff       	jmp    289f1 <JS_CallInternal+0x3561>
   2ce27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2ce2e:	00 00 
   2ce30:	48 c7 85 70 fd ff ff 	movq   $0x0,-0x290(%rbp)
   2ce37:	00 00 00 00 
   2ce3b:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   2ce42:	31 c9                	xor    %ecx,%ecx
   2ce44:	4c 89 ef             	mov    %r13,%rdi
   2ce47:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   2ce4e:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2ce55:	48 c7 85 78 fd ff ff 	movq   $0x3,-0x288(%rbp)
   2ce5c:	03 00 00 00 
   2ce60:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2ce66:	6a 00                	push   $0x0
   2ce68:	41 52                	push   %r10
   2ce6a:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2ce71:	ff b5 78 fd ff ff    	push   -0x288(%rbp)
   2ce77:	ff b5 70 fd ff ff    	push   -0x290(%rbp)
   2ce7d:	e8 0e 86 ff ff       	call   25490 <JS_CallInternal>
   2ce82:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2ce89:	48 83 c4 20          	add    $0x20,%rsp
   2ce8d:	48 89 c6             	mov    %rax,%rsi
   2ce90:	e9 22 a3 ff ff       	jmp    271b7 <JS_CallInternal+0x1d27>
   2ce95:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ce99:	44 89 c8             	mov    %r9d,%eax
   2ce9c:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2cea3:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2cea7:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2ceaa:	83 e8 01             	sub    $0x1,%eax
   2cead:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2ceb0:	85 c0                	test   %eax,%eax
   2ceb2:	0f 8f fd cb ff ff    	jg     29ab5 <JS_CallInternal+0x4625>
   2ceb8:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2cebe:	e8 dd 9a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cec3:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2cec9:	e9 e7 cb ff ff       	jmp    29ab5 <JS_CallInternal+0x4625>
   2cece:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ced2:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2ced9:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2cedd:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cee0:	83 e8 01             	sub    $0x1,%eax
   2cee3:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cee6:	85 c0                	test   %eax,%eax
   2cee8:	0f 8f 35 a7 ff ff    	jg     27623 <JS_CallInternal+0x2193>
   2ceee:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2cef5:	e8 a6 9a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cefa:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2cf01:	e9 1d a7 ff ff       	jmp    27623 <JS_CallInternal+0x2193>
   2cf06:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2cf0a:	7d 06                	jge    2cf12 <JS_CallInternal+0x7a82>
   2cf0c:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2cf10:	7d 63                	jge    2cf75 <JS_CallInternal+0x7ae5>
   2cf12:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2cf16:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2cf1a:	b9 01 00 00 00       	mov    $0x1,%ecx
   2cf1f:	4c 89 ef             	mov    %r13,%rdi
   2cf22:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cf29:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cf2d:	e8 be 6b 01 00       	call   43af0 <JS_ToStringInternal>
   2cf32:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2cf39:	49 89 d7             	mov    %rdx,%r15
   2cf3c:	48 89 d0             	mov    %rdx,%rax
   2cf3f:	83 fa 06             	cmp    $0x6,%edx
   2cf42:	0f 84 e5 2b 00 00    	je     2fb2d <JS_CallInternal+0xa69d>
   2cf48:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2cf4c:	83 fe f6             	cmp    $0xfffffff6,%esi
   2cf4f:	76 15                	jbe    2cf66 <JS_CallInternal+0x7ad6>
   2cf51:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2cf55:	8b 4f fc             	mov    -0x4(%rdi),%ecx
   2cf58:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2cf5b:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2cf5e:	85 d2                	test   %edx,%edx
   2cf60:	0f 8e cf 2b 00 00    	jle    2fb35 <JS_CallInternal+0xa6a5>
   2cf66:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2cf6d:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2cf71:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2cf75:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cf7c:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cf80:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2cf84:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2cf88:	76 04                	jbe    2cf8e <JS_CallInternal+0x7afe>
   2cf8a:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2cf8e:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2cf92:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2cf96:	48 89 c1             	mov    %rax,%rcx
   2cf99:	4d 89 f8             	mov    %r15,%r8
   2cf9c:	4c 89 ef             	mov    %r13,%rdi
   2cf9f:	4d 89 e7             	mov    %r12,%r15
   2cfa2:	e8 39 3a 00 00       	call   309e0 <JS_GetPropertyValue>
   2cfa7:	48 89 c1             	mov    %rax,%rcx
   2cfaa:	48 89 d0             	mov    %rdx,%rax
   2cfad:	83 fa 06             	cmp    $0x6,%edx
   2cfb0:	0f 84 1a 8c ff ff    	je     25bd0 <JS_CallInternal+0x740>
   2cfb6:	48 89 ca             	mov    %rcx,%rdx
   2cfb9:	e9 d9 aa ff ff       	jmp    27a97 <JS_CallInternal+0x2607>
   2cfbe:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cfc2:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2cfc9:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2cfcd:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cfd0:	83 e8 01             	sub    $0x1,%eax
   2cfd3:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cfd6:	85 c0                	test   %eax,%eax
   2cfd8:	0f 8f 1b ce ff ff    	jg     29df9 <JS_CallInternal+0x4969>
   2cfde:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2cfe5:	e8 b6 99 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cfea:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2cff1:	e9 03 ce ff ff       	jmp    29df9 <JS_CallInternal+0x4969>
   2cff6:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2cffa:	0f 85 b7 95 ff ff    	jne    265b7 <JS_CallInternal+0x1127>
   2d000:	49 39 3a             	cmp    %rdi,(%r10)
   2d003:	0f 85 ae 95 ff ff    	jne    265b7 <JS_CallInternal+0x1127>
   2d009:	41 8b 52 10          	mov    0x10(%r10),%edx
   2d00d:	83 fa ff             	cmp    $0xffffffff,%edx
   2d010:	0f 84 a1 95 ff ff    	je     265b7 <JS_CallInternal+0x1127>
   2d016:	48 c1 e2 04          	shl    $0x4,%rdx
   2d01a:	48 03 50 20          	add    0x20(%rax),%rdx
   2d01e:	48 89 d0             	mov    %rdx,%rax
   2d021:	48 8b 12             	mov    (%rdx),%rdx
   2d024:	48 8b 48 08          	mov    0x8(%rax),%rcx
   2d028:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2d02b:	76 04                	jbe    2d031 <JS_CallInternal+0x7ba1>
   2d02d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2d031:	49 89 d7             	mov    %rdx,%r15
   2d034:	e9 e8 95 ff ff       	jmp    26621 <JS_CallInternal+0x1191>
   2d039:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2d040:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d044:	89 c8                	mov    %ecx,%eax
   2d046:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2d04d:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2d051:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d054:	83 e8 01             	sub    $0x1,%eax
   2d057:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d05a:	85 c0                	test   %eax,%eax
   2d05c:	0f 8f 87 a8 ff ff    	jg     278e9 <JS_CallInternal+0x2459>
   2d062:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2d069:	e8 32 99 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d06e:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2d075:	e9 6f a8 ff ff       	jmp    278e9 <JS_CallInternal+0x2459>
   2d07a:	8b 10                	mov    (%rax),%edx
   2d07c:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2d082:	0f 85 71 c9 ff ff    	jne    299f9 <JS_CallInternal+0x4569>
   2d088:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d08f:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d096:	4c 89 ef             	mov    %r13,%rdi
   2d099:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d09f:	e8 bc 33 04 00       	call   70460 <JS_HasProperty>
   2d0a4:	85 c0                	test   %eax,%eax
   2d0a6:	0f 88 24 8b ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2d0ac:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2d0b2:	b8 01 00 00 00       	mov    $0x1,%eax
   2d0b7:	0f 84 4f c9 ff ff    	je     29a0c <JS_CallInternal+0x457c>
   2d0bd:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d0c4:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d0cb:	45 31 c0             	xor    %r8d,%r8d
   2d0ce:	4c 89 ef             	mov    %r13,%rdi
   2d0d1:	e8 9a 10 02 00       	call   4e170 <JS_DeleteProperty>
   2d0d6:	85 c0                	test   %eax,%eax
   2d0d8:	0f 88 f2 8a ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2d0de:	0f 95 c0             	setne  %al
   2d0e1:	0f b6 c0             	movzbl %al,%eax
   2d0e4:	e9 23 c9 ff ff       	jmp    29a0c <JS_CallInternal+0x457c>
   2d0e9:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2d0f0:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2d0f7:	48 89 8d a8 fe ff ff 	mov    %rcx,-0x158(%rbp)
   2d0fe:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2d105:	48 89 85 c8 fe ff ff 	mov    %rax,-0x138(%rbp)
   2d10c:	e8 6f 57 ff ff       	call   22880 <close_var_refs>
   2d111:	48 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%rcx
   2d118:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   2d11f:	e9 80 8b ff ff       	jmp    25ca4 <JS_CallInternal+0x814>
   2d124:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d12b:	31 d2                	xor    %edx,%edx
   2d12d:	48 89 de             	mov    %rbx,%rsi
   2d130:	4c 89 ef             	mov    %r13,%rdi
   2d133:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d137:	e8 d4 fe 02 00       	call   5d010 <js_eq_slow>
   2d13c:	85 c0                	test   %eax,%eax
   2d13e:	0f 84 56 c5 ff ff    	je     2969a <JS_CallInternal+0x420a>
   2d144:	4d 89 e7             	mov    %r12,%r15
   2d147:	e9 84 8a ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d14c:	0f 1f 40 00          	nopl   0x0(%rax)
   2d150:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d157:	ba 01 00 00 00       	mov    $0x1,%edx
   2d15c:	48 89 de             	mov    %rbx,%rsi
   2d15f:	4c 89 ef             	mov    %r13,%rdi
   2d162:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d166:	e8 a5 fe 02 00       	call   5d010 <js_eq_slow>
   2d16b:	85 c0                	test   %eax,%eax
   2d16d:	0f 84 d2 c4 ff ff    	je     29645 <JS_CallInternal+0x41b5>
   2d173:	4d 89 e7             	mov    %r12,%r15
   2d176:	e9 55 8a ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d17b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d180:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d184:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2d18b:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2d18f:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d192:	83 e8 01             	sub    $0x1,%eax
   2d195:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d198:	85 c0                	test   %eax,%eax
   2d19a:	0f 8f c1 a5 ff ff    	jg     27761 <JS_CallInternal+0x22d1>
   2d1a0:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2d1a7:	e8 f4 97 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d1ac:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2d1b3:	e9 a9 a5 ff ff       	jmp    27761 <JS_CallInternal+0x22d1>
   2d1b8:	48 8d 35 8a c3 0a 00 	lea    0xac38a(%rip),%rsi        # d9549 <_IO_stdin_used+0x549>
   2d1bf:	4c 89 ef             	mov    %r13,%rdi
   2d1c2:	31 c0                	xor    %eax,%eax
   2d1c4:	e8 77 71 00 00       	call   34340 <JS_ThrowTypeError>
   2d1c9:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2d1d0:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2d1d3:	76 1e                	jbe    2d1f3 <JS_CallInternal+0x7d63>
   2d1d5:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2d1dc:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2d1df:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2d1e5:	83 e8 01             	sub    $0x1,%eax
   2d1e8:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2d1eb:	85 c0                	test   %eax,%eax
   2d1ed:	0f 8e 3b 2c 00 00    	jle    2fe2e <JS_CallInternal+0xa99e>
   2d1f3:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   2d1fa:	76 1e                	jbe    2d21a <JS_CallInternal+0x7d8a>
   2d1fc:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2d203:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2d206:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   2d20c:	83 e8 01             	sub    $0x1,%eax
   2d20f:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2d212:	85 c0                	test   %eax,%eax
   2d214:	0f 8e 8c 2d 00 00    	jle    2ffa6 <JS_CallInternal+0xab16>
   2d21a:	ba 06 00 00 00       	mov    $0x6,%edx
   2d21f:	31 c0                	xor    %eax,%eax
   2d221:	e9 1e 9d ff ff       	jmp    26f44 <JS_CallInternal+0x1ab4>
   2d226:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d22d:	44 89 d2             	mov    %r10d,%edx
   2d230:	48 89 de             	mov    %rbx,%rsi
   2d233:	4c 89 ef             	mov    %r13,%rdi
   2d236:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d23a:	e8 61 52 02 00       	call   524a0 <js_unary_arith_slow>
   2d23f:	85 c0                	test   %eax,%eax
   2d241:	0f 84 a4 e1 ff ff    	je     2b3eb <JS_CallInternal+0x5f5b>
   2d247:	4d 89 e7             	mov    %r12,%r15
   2d24a:	e9 81 89 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d24f:	90                   	nop
   2d250:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d254:	48 8b b7 48 04 00 00 	mov    0x448(%rdi),%rsi
   2d25b:	48 8b 34 ce          	mov    (%rsi,%rcx,8),%rsi
   2d25f:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2d262:	83 e9 01             	sub    $0x1,%ecx
   2d265:	89 4e fc             	mov    %ecx,-0x4(%rsi)
   2d268:	85 c9                	test   %ecx,%ecx
   2d26a:	0f 8f a9 a7 ff ff    	jg     27a19 <JS_CallInternal+0x2589>
   2d270:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2d277:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2d27e:	e8 1d 97 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d283:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2d28a:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d291:	e9 83 a7 ff ff       	jmp    27a19 <JS_CallInternal+0x2589>
   2d296:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d29a:	48 89 c2             	mov    %rax,%rdx
   2d29d:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2d2a3:	e8 18 17 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d2a8:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2d2ae:	e9 a5 8e ff ff       	jmp    26158 <JS_CallInternal+0xcc8>
   2d2b3:	0f b7 70 12          	movzwl 0x12(%rax),%esi
   2d2b7:	66 89 b5 00 fe ff ff 	mov    %si,-0x200(%rbp)
   2d2be:	66 83 fe 01          	cmp    $0x1,%si
   2d2c2:	0f 84 d9 f0 ff ff    	je     2c3a1 <JS_CallInternal+0x6f11>
   2d2c8:	48 8b 48 18          	mov    0x18(%rax),%rcx
   2d2cc:	49 89 c3             	mov    %rax,%r11
   2d2cf:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2d2d6:	e9 06 92 ff ff       	jmp    264e1 <JS_CallInternal+0x1051>
   2d2db:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2d2df:	76 13                	jbe    2d2f4 <JS_CallInternal+0x7e64>
   2d2e1:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d2e5:	83 e8 01             	sub    $0x1,%eax
   2d2e8:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d2ec:	85 c0                	test   %eax,%eax
   2d2ee:	0f 8e 44 2a 00 00    	jle    2fd38 <JS_CallInternal+0xa8a8>
   2d2f4:	b8 01 00 00 00       	mov    $0x1,%eax
   2d2f9:	e9 8b c2 ff ff       	jmp    29589 <JS_CallInternal+0x40f9>
   2d2fe:	45 31 db             	xor    %r11d,%r11d
   2d301:	e9 21 ea ff ff       	jmp    2bd27 <JS_CallInternal+0x6897>
   2d306:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d30a:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2d310:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2d317:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2d31b:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d31e:	83 e8 01             	sub    $0x1,%eax
   2d321:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d324:	85 c0                	test   %eax,%eax
   2d326:	0f 8f 0f ee ff ff    	jg     2c13b <JS_CallInternal+0x6cab>
   2d32c:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d332:	e8 69 96 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d337:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2d33d:	e9 f9 ed ff ff       	jmp    2c13b <JS_CallInternal+0x6cab>
   2d342:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   2d346:	76 13                	jbe    2d35b <JS_CallInternal+0x7ecb>
   2d348:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d34c:	83 e8 01             	sub    $0x1,%eax
   2d34f:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d353:	85 c0                	test   %eax,%eax
   2d355:	0f 8e 97 26 00 00    	jle    2f9f2 <JS_CallInternal+0xa562>
   2d35b:	45 31 ff             	xor    %r15d,%r15d
   2d35e:	e9 7b c2 ff ff       	jmp    295de <JS_CallInternal+0x414e>
   2d363:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d367:	48 89 ce             	mov    %rcx,%rsi
   2d36a:	e8 51 16 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d36f:	e9 78 8f ff ff       	jmp    262ec <JS_CallInternal+0xe5c>
   2d374:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2d379:	e9 bb 8d ff ff       	jmp    26139 <JS_CallInternal+0xca9>
   2d37e:	48 8d 35 e6 c1 0a 00 	lea    0xac1e6(%rip),%rsi        # d956b <_IO_stdin_used+0x56b>
   2d385:	4c 89 ef             	mov    %r13,%rdi
   2d388:	31 c0                	xor    %eax,%eax
   2d38a:	4d 89 e7             	mov    %r12,%r15
   2d38d:	e8 8e 91 00 00       	call   36520 <JS_ThrowInternalError>
   2d392:	e9 39 88 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d397:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2d39e:	48 8b 46 30          	mov    0x30(%rsi),%rax
   2d3a2:	48 01 c8             	add    %rcx,%rax
   2d3a5:	8b 48 04             	mov    0x4(%rax),%ecx
   2d3a8:	f6 00 08             	testb  $0x8,(%rax)
   2d3ab:	0f 85 d2 2c 00 00    	jne    30083 <JS_CallInternal+0xabf3>
   2d3b1:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d3b8:	48 83 ec 08          	sub    $0x8,%rsp
   2d3bc:	41 83 ea 37          	sub    $0x37,%r10d
   2d3c0:	4d 8b 85 80 01 00 00 	mov    0x180(%r13),%r8
   2d3c7:	4d 8b 8d 88 01 00 00 	mov    0x188(%r13),%r9
   2d3ce:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d3d5:	4c 89 ef             	mov    %r13,%rdi
   2d3d8:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2d3dc:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d3e3:	41 52                	push   %r10
   2d3e5:	e8 b6 2f 00 00       	call   303a0 <JS_GetPropertyInternal>
   2d3ea:	48 89 03             	mov    %rax,(%rbx)
   2d3ed:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d3f1:	5f                   	pop    %rdi
   2d3f2:	41 58                	pop    %r8
   2d3f4:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2d3f8:	0f 85 51 8f ff ff    	jne    2634f <JS_CallInternal+0xebf>
   2d3fe:	e9 cd 87 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d403:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d408:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d40f:	44 89 d2             	mov    %r10d,%edx
   2d412:	48 89 de             	mov    %rbx,%rsi
   2d415:	4c 89 ef             	mov    %r13,%rdi
   2d418:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d41c:	e8 7f 50 02 00       	call   524a0 <js_unary_arith_slow>
   2d421:	85 c0                	test   %eax,%eax
   2d423:	0f 84 64 d2 ff ff    	je     2a68d <JS_CallInternal+0x51fd>
   2d429:	4d 89 e7             	mov    %r12,%r15
   2d42c:	e9 9f 87 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d431:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2d438:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2d43c:	83 fe f6             	cmp    $0xfffffff6,%esi
   2d43f:	76 14                	jbe    2d455 <JS_CallInternal+0x7fc5>
   2d441:	49 8b 3a             	mov    (%r10),%rdi
   2d444:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2d447:	83 ea 01             	sub    $0x1,%edx
   2d44a:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2d44d:	85 d2                	test   %edx,%edx
   2d44f:	0f 8e fa 21 00 00    	jle    2f64f <JS_CallInternal+0xa1bf>
   2d455:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2d45c:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2d463:	00 
   2d464:	45 85 c0             	test   %r8d,%r8d
   2d467:	0f 88 63 87 ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2d46d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d470:	76 11                	jbe    2d483 <JS_CallInternal+0x7ff3>
   2d472:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2d475:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2d478:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d47b:	85 d2                	test   %edx,%edx
   2d47d:	0f 8e 18 22 00 00    	jle    2f69b <JS_CallInternal+0xa20b>
   2d483:	8b 85 dc fe ff ff    	mov    -0x124(%rbp),%eax
   2d489:	31 d2                	xor    %edx,%edx
   2d48b:	be 03 00 00 00       	mov    $0x3,%esi
   2d490:	85 c0                	test   %eax,%eax
   2d492:	0f 95 c2             	setne  %dl
   2d495:	31 ff                	xor    %edi,%edi
   2d497:	e9 2c d7 ff ff       	jmp    2abc8 <JS_CallInternal+0x5738>
   2d49c:	49 83 c7 01          	add    $0x1,%r15
   2d4a0:	e9 2b 87 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d4a5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d4a9:	89 c0                	mov    %eax,%eax
   2d4ab:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2d4b2:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2d4b6:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d4b9:	83 e8 01             	sub    $0x1,%eax
   2d4bc:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d4bf:	85 c0                	test   %eax,%eax
   2d4c1:	0f 8f 44 c8 ff ff    	jg     29d0b <JS_CallInternal+0x487b>
   2d4c7:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2d4ce:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2d4d5:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d4dc:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   2d4e3:	e8 b8 94 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d4e8:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2d4ef:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2d4f6:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d4fd:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2d504:	e9 02 c8 ff ff       	jmp    29d0b <JS_CallInternal+0x487b>
   2d509:	48 83 ec 08          	sub    $0x8,%rsp
   2d50d:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   2d511:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2d517:	50                   	push   %rax
   2d518:	e9 81 f3 ff ff       	jmp    2c89e <JS_CallInternal+0x740e>
   2d51d:	41 0f be 42 06       	movsbl 0x6(%r10),%eax
   2d522:	41 bb 02 00 00 00    	mov    $0x2,%r11d
   2d528:	e9 26 8d ff ff       	jmp    26253 <JS_CallInternal+0xdc3>
   2d52d:	48 89 ce             	mov    %rcx,%rsi
   2d530:	8b 49 ac             	mov    -0x54(%rcx),%ecx
   2d533:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d539:	83 e9 01             	sub    $0x1,%ecx
   2d53c:	89 4e ac             	mov    %ecx,-0x54(%rsi)
   2d53f:	0f 85 c8 c2 ff ff    	jne    2980d <JS_CallInternal+0x437d>
   2d545:	80 bf a0 04 00 00 02 	cmpb   $0x2,0x4a0(%rdi)
   2d54c:	0f 84 bb c2 ff ff    	je     2980d <JS_CallInternal+0x437d>
   2d552:	48 83 ee 50          	sub    $0x50,%rsi
   2d556:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2d55d:	e8 7e 52 ff ff       	call   227e0 <async_func_free.part.0>
   2d562:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2d569:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   2d570:	00 
   2d571:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d578:	48 03 56 28          	add    0x28(%rsi),%rdx
   2d57c:	e9 8c c2 ff ff       	jmp    2980d <JS_CallInternal+0x437d>
   2d581:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2d586:	0f 85 3e dc ff ff    	jne    2b1ca <JS_CallInternal+0x5d3a>
   2d58c:	49 8b 4a 18          	mov    0x18(%r10),%rcx
   2d590:	48 39 08             	cmp    %rcx,(%rax)
   2d593:	0f 85 31 dc ff ff    	jne    2b1ca <JS_CallInternal+0x5d3a>
   2d599:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
   2d59e:	0f 85 26 dc ff ff    	jne    2b1ca <JS_CallInternal+0x5d3a>
   2d5a4:	8b 50 10             	mov    0x10(%rax),%edx
   2d5a7:	8b 79 18             	mov    0x18(%rcx),%edi
   2d5aa:	48 8d 34 d5 00 00 00 	lea    0x0(,%rdx,8),%rsi
   2d5b1:	00 
   2d5b2:	48 8d 74 be 3c       	lea    0x3c(%rsi,%rdi,4),%rsi
   2d5b7:	0f b6 4c 31 03       	movzbl 0x3(%rcx,%rsi,1),%ecx
   2d5bc:	c0 e9 02             	shr    $0x2,%cl
   2d5bf:	83 e1 3a             	and    $0x3a,%ecx
   2d5c2:	80 f9 02             	cmp    $0x2,%cl
   2d5c5:	0f 85 ff db ff ff    	jne    2b1ca <JS_CallInternal+0x5d3a>
   2d5cb:	48 89 d0             	mov    %rdx,%rax
   2d5ce:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2d5d3:	4c 89 ef             	mov    %r13,%rdi
   2d5d6:	48 83 eb 20          	sub    $0x20,%rbx
   2d5da:	48 c1 e0 04          	shl    $0x4,%rax
   2d5de:	49 03 42 20          	add    0x20(%r10),%rax
   2d5e2:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2d5e9:	49 83 c4 05          	add    $0x5,%r12
   2d5ed:	48 8b 30             	mov    (%rax),%rsi
   2d5f0:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2d5f4:	0f 11 00             	movups %xmm0,(%rax)
   2d5f7:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2d5fe:	e8 3d 15 ff ff       	call   1eb40 <JS_FreeValue>
   2d603:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d60a:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2d611:	4c 89 ef             	mov    %r13,%rdi
   2d614:	48 89 c6             	mov    %rax,%rsi
   2d617:	e8 24 15 ff ff       	call   1eb40 <JS_FreeValue>
   2d61c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2d622:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2d626:	49 89 c2             	mov    %rax,%r10
   2d629:	e9 82 81 ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2d62e:	66 90                	xchg   %ax,%ax
   2d630:	b9 03 00 00 00       	mov    $0x3,%ecx
   2d635:	45 31 ff             	xor    %r15d,%r15d
   2d638:	e9 e4 8f ff ff       	jmp    26621 <JS_CallInternal+0x1191>
   2d63d:	8b 02                	mov    (%rdx),%eax
   2d63f:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2d644:	0f 85 d8 d3 ff ff    	jne    2aa22 <JS_CallInternal+0x5592>
   2d64a:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d651:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d658:	4c 89 ef             	mov    %r13,%rdi
   2d65b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d661:	e8 fa 2d 04 00       	call   70460 <JS_HasProperty>
   2d666:	85 c0                	test   %eax,%eax
   2d668:	0f 88 62 85 ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2d66e:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2d674:	0f 84 57 19 00 00    	je     2efd1 <JS_CallInternal+0x9b41>
   2d67a:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d681:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2d688:	83 fa f6             	cmp    $0xfffffff6,%edx
   2d68b:	76 04                	jbe    2d691 <JS_CallInternal+0x8201>
   2d68d:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2d691:	48 89 03             	mov    %rax,(%rbx)
   2d694:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d698:	e9 d3 d3 ff ff       	jmp    2aa70 <JS_CallInternal+0x55e0>
   2d69d:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   2d6a4:	e9 6f 8b ff ff       	jmp    26218 <JS_CallInternal+0xd88>
   2d6a9:	0f b6 d0             	movzbl %al,%edx
   2d6ac:	48 8d 35 7c be 0a 00 	lea    0xabe7c(%rip),%rsi        # d952f <_IO_stdin_used+0x52f>
   2d6b3:	4c 89 ef             	mov    %r13,%rdi
   2d6b6:	31 c0                	xor    %eax,%eax
   2d6b8:	e8 63 8e 00 00       	call   36520 <JS_ThrowInternalError>
   2d6bd:	e9 0e 85 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d6c2:	81 e9 b3 00 00 00    	sub    $0xb3,%ecx
   2d6c8:	be 02 00 00 00       	mov    $0x2,%esi
   2d6cd:	83 f9 01             	cmp    $0x1,%ecx
   2d6d0:	0f 85 c3 8d ff ff    	jne    26499 <JS_CallInternal+0x1009>
   2d6d6:	48 8d 0c 32          	lea    (%rdx,%rsi,1),%rcx
   2d6da:	e9 dc 8f ff ff       	jmp    266bb <JS_CallInternal+0x122b>
   2d6df:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   2d6e6:	e9 2d 8b ff ff       	jmp    26218 <JS_CallInternal+0xd88>
   2d6eb:	41 0f bf 42 06       	movswl 0x6(%r10),%eax
   2d6f0:	41 bb 03 00 00 00    	mov    $0x3,%r11d
   2d6f6:	e9 58 8b ff ff       	jmp    26253 <JS_CallInternal+0xdc3>
   2d6fb:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d702:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2d706:	4c 89 ef             	mov    %r13,%rdi
   2d709:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d710:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d717:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d71e:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2d722:	e8 39 2d 04 00       	call   70460 <JS_HasProperty>
   2d727:	85 c0                	test   %eax,%eax
   2d729:	0f 88 a1 84 ff ff    	js     25bd0 <JS_CallInternal+0x740>
   2d72f:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d736:	0f 85 9c 15 00 00    	jne    2ecd8 <JS_CallInternal+0x9848>
   2d73c:	49 8b 45 10          	mov    0x10(%r13),%rax
   2d740:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2d747:	48 85 c0             	test   %rax,%rax
   2d74a:	0f 84 88 15 00 00    	je     2ecd8 <JS_CallInternal+0x9848>
   2d750:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2d754:	0f 84 7e 15 00 00    	je     2ecd8 <JS_CallInternal+0x9848>
   2d75a:	41 8b 71 04          	mov    0x4(%r9),%esi
   2d75e:	4c 89 ef             	mov    %r13,%rdi
   2d761:	e8 fa 8b 00 00       	call   36360 <JS_ThrowReferenceErrorNotDefined>
   2d766:	e9 65 84 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2d76b:	48 89 f2             	mov    %rsi,%rdx
   2d76e:	48 89 fe             	mov    %rdi,%rsi
   2d771:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d775:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d77c:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d783:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2d78a:	e8 31 12 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d78f:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d796:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d79d:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d7a4:	e9 c2 90 ff ff       	jmp    2686b <JS_CallInternal+0x13db>
   2d7a9:	48 89 fe             	mov    %rdi,%rsi
   2d7ac:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7b0:	e8 0b 12 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d7b5:	e9 90 9b ff ff       	jmp    2734a <JS_CallInternal+0x1eba>
   2d7ba:	48 89 fe             	mov    %rdi,%rsi
   2d7bd:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7c1:	e8 fa 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d7c6:	e9 db 9a ff ff       	jmp    272a6 <JS_CallInternal+0x1e16>
   2d7cb:	0f b7 72 01          	movzwl 0x1(%rdx),%esi
   2d7cf:	48 c1 e6 04          	shl    $0x4,%rsi
   2d7d3:	83 ff 58             	cmp    $0x58,%edi
   2d7d6:	0f 85 2b 26 00 00    	jne    2fe07 <JS_CallInternal+0xa977>
   2d7dc:	48 03 b5 80 fe ff ff 	add    -0x180(%rbp),%rsi
   2d7e3:	e9 30 8a ff ff       	jmp    26218 <JS_CallInternal+0xd88>
   2d7e8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7ec:	48 89 ce             	mov    %rcx,%rsi
   2d7ef:	e8 cc 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d7f4:	e9 12 cc ff ff       	jmp    2a40b <JS_CallInternal+0x4f7b>
   2d7f9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7fd:	4c 89 d6             	mov    %r10,%rsi
   2d800:	4c 89 fa             	mov    %r15,%rdx
   2d803:	e8 b8 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d808:	e9 ad 9c ff ff       	jmp    274ba <JS_CallInternal+0x202a>
   2d80d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d811:	48 89 c2             	mov    %rax,%rdx
   2d814:	48 89 ce             	mov    %rcx,%rsi
   2d817:	e8 a4 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d81c:	e9 bc ba ff ff       	jmp    292dd <JS_CallInternal+0x3e4d>
   2d821:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d825:	48 89 ce             	mov    %rcx,%rsi
   2d828:	e8 93 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d82d:	e9 14 bd ff ff       	jmp    29546 <JS_CallInternal+0x40b6>
   2d832:	48 89 fe             	mov    %rdi,%rsi
   2d835:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d839:	e8 82 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d83e:	e9 1f c8 ff ff       	jmp    2a062 <JS_CallInternal+0x4bd2>
   2d843:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d847:	48 89 ce             	mov    %rcx,%rsi
   2d84a:	e8 71 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d84f:	e9 0a cc ff ff       	jmp    2a45e <JS_CallInternal+0x4fce>
   2d854:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d858:	4c 89 d6             	mov    %r10,%rsi
   2d85b:	4c 89 da             	mov    %r11,%rdx
   2d85e:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d864:	e8 57 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d869:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2d86f:	e9 c2 d9 ff ff       	jmp    2b236 <JS_CallInternal+0x5da6>
   2d874:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d878:	4c 89 c2             	mov    %r8,%rdx
   2d87b:	e8 40 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d880:	e9 d9 c2 ff ff       	jmp    29b5e <JS_CallInternal+0x46ce>
   2d885:	48 89 fe             	mov    %rdi,%rsi
   2d888:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d88c:	e8 2f 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d891:	e9 65 c0 ff ff       	jmp    298fb <JS_CallInternal+0x446b>
   2d896:	48 89 f2             	mov    %rsi,%rdx
   2d899:	48 89 fe             	mov    %rdi,%rsi
   2d89c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8a0:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d8a7:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d8ae:	e8 0d 11 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d8b3:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d8ba:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d8c1:	e9 4d b9 ff ff       	jmp    29213 <JS_CallInternal+0x3d83>
   2d8c6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8ca:	48 89 c2             	mov    %rax,%rdx
   2d8cd:	48 89 ce             	mov    %rcx,%rsi
   2d8d0:	e8 eb 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d8d5:	e9 c2 af ff ff       	jmp    2889c <JS_CallInternal+0x340c>
   2d8da:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8de:	48 89 c2             	mov    %rax,%rdx
   2d8e1:	48 89 ce             	mov    %rcx,%rsi
   2d8e4:	e8 d7 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d8e9:	e9 65 af ff ff       	jmp    28853 <JS_CallInternal+0x33c3>
   2d8ee:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8f2:	48 89 c2             	mov    %rax,%rdx
   2d8f5:	48 89 ce             	mov    %rcx,%rsi
   2d8f8:	e8 c3 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d8fd:	e9 e5 af ff ff       	jmp    288e7 <JS_CallInternal+0x3457>
   2d902:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d906:	48 89 c2             	mov    %rax,%rdx
   2d909:	e8 b2 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d90e:	e9 fe ad ff ff       	jmp    28711 <JS_CallInternal+0x3281>
   2d913:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d917:	48 89 c2             	mov    %rax,%rdx
   2d91a:	e8 a1 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d91f:	e9 99 ae ff ff       	jmp    287bd <JS_CallInternal+0x332d>
   2d924:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d928:	48 89 c2             	mov    %rax,%rdx
   2d92b:	e8 90 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d930:	e9 31 ae ff ff       	jmp    28766 <JS_CallInternal+0x32d6>
   2d935:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d939:	48 89 c2             	mov    %rax,%rdx
   2d93c:	48 89 ce             	mov    %rcx,%rsi
   2d93f:	e8 7c 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d944:	e9 bf ae ff ff       	jmp    28808 <JS_CallInternal+0x3378>
   2d949:	41 8b 42 06          	mov    0x6(%r10),%eax
   2d94d:	41 bb 05 00 00 00    	mov    $0x5,%r11d
   2d953:	e9 fb 88 ff ff       	jmp    26253 <JS_CallInternal+0xdc3>
   2d958:	48 89 fe             	mov    %rdi,%rsi
   2d95b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d95f:	e8 5c 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d964:	e9 91 d4 ff ff       	jmp    2adfa <JS_CallInternal+0x596a>
   2d969:	45 31 c0             	xor    %r8d,%r8d
   2d96c:	48 92                	xchg   %rax,%rdx
   2d96e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d972:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2d979:	48 89 c6             	mov    %rax,%rsi
   2d97c:	e8 3f 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d981:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2d988:	e9 87 ee ff ff       	jmp    2c814 <JS_CallInternal+0x7384>
   2d98d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d991:	48 89 c2             	mov    %rax,%rdx
   2d994:	e8 27 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d999:	e9 fe b4 ff ff       	jmp    28e9c <JS_CallInternal+0x3a0c>
   2d99e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9a2:	48 89 c2             	mov    %rax,%rdx
   2d9a5:	e8 16 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d9aa:	e9 d6 b0 ff ff       	jmp    28a85 <JS_CallInternal+0x35f5>
   2d9af:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9b3:	48 89 c2             	mov    %rax,%rdx
   2d9b6:	e8 05 10 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d9bb:	e9 87 b4 ff ff       	jmp    28e47 <JS_CallInternal+0x39b7>
   2d9c0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9c4:	48 89 c2             	mov    %rax,%rdx
   2d9c7:	48 89 ce             	mov    %rcx,%rsi
   2d9ca:	e8 f1 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d9cf:	e9 1c b4 ff ff       	jmp    28df0 <JS_CallInternal+0x3960>
   2d9d4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9d8:	48 89 c2             	mov    %rax,%rdx
   2d9db:	48 89 ce             	mov    %rcx,%rsi
   2d9de:	e8 dd 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d9e3:	e9 bf b3 ff ff       	jmp    28da7 <JS_CallInternal+0x3917>
   2d9e8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9ec:	48 89 c2             	mov    %rax,%rdx
   2d9ef:	48 89 ce             	mov    %rcx,%rsi
   2d9f2:	e8 c9 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2d9f7:	e9 60 b3 ff ff       	jmp    28d5c <JS_CallInternal+0x38cc>
   2d9fc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da00:	48 89 c2             	mov    %rax,%rdx
   2da03:	48 89 ce             	mov    %rcx,%rsi
   2da06:	e8 b5 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2da0b:	e9 01 b3 ff ff       	jmp    28d11 <JS_CallInternal+0x3881>
   2da10:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da14:	48 89 ce             	mov    %rcx,%rsi
   2da17:	e8 a4 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2da1c:	e9 5c b2 ff ff       	jmp    28c7d <JS_CallInternal+0x37ed>
   2da21:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da25:	48 89 ce             	mov    %rcx,%rsi
   2da28:	e8 93 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2da2d:	e9 66 cd ff ff       	jmp    2a798 <JS_CallInternal+0x5308>
   2da32:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da36:	48 89 ce             	mov    %rcx,%rsi
   2da39:	e8 82 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2da3e:	e9 56 99 ff ff       	jmp    27399 <JS_CallInternal+0x1f09>
   2da43:	48 89 f2             	mov    %rsi,%rdx
   2da46:	48 89 fe             	mov    %rdi,%rsi
   2da49:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da4d:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2da54:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2da5b:	e8 60 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2da60:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2da67:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2da6e:	e9 64 91 ff ff       	jmp    26bd7 <JS_CallInternal+0x1747>
   2da73:	44 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10d
   2da7a:	45 85 d2             	test   %r10d,%r10d
   2da7d:	74 42                	je     2dac1 <JS_CallInternal+0x8631>
   2da7f:	4c 89 c3             	mov    %r8,%rbx
   2da82:	4f 8d 24 01          	lea    (%r9,%r8,1),%r12
   2da86:	4d 89 c6             	mov    %r8,%r14
   2da89:	eb 09                	jmp    2da94 <JS_CallInternal+0x8604>
   2da8b:	48 83 c3 10          	add    $0x10,%rbx
   2da8f:	4c 39 e3             	cmp    %r12,%rbx
   2da92:	74 2a                	je     2dabe <JS_CallInternal+0x862e>
   2da94:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2da98:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2da9b:	76 ee                	jbe    2da8b <JS_CallInternal+0x85fb>
   2da9d:	48 8b 0b             	mov    (%rbx),%rcx
   2daa0:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2daa3:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2daa6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2daa9:	85 d2                	test   %edx,%edx
   2daab:	7f de                	jg     2da8b <JS_CallInternal+0x85fb>
   2daad:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dab1:	48 89 c2             	mov    %rax,%rdx
   2dab4:	48 89 ce             	mov    %rcx,%rsi
   2dab7:	e8 04 0f ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dabc:	eb cd                	jmp    2da8b <JS_CallInternal+0x85fb>
   2dabe:	4d 89 f0             	mov    %r14,%r8
   2dac1:	4c 89 c3             	mov    %r8,%rbx
   2dac4:	e9 07 81 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2dac9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dacd:	48 89 c2             	mov    %rax,%rdx
   2dad0:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2dad7:	e8 e4 0e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dadc:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dae3:	e9 5c 91 ff ff       	jmp    26c44 <JS_CallInternal+0x17b4>
   2dae8:	48 89 f2             	mov    %rsi,%rdx
   2daeb:	48 89 fe             	mov    %rdi,%rsi
   2daee:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2daf2:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2daf9:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2db00:	e8 bb 0e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2db05:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2db0c:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2db13:	e9 a2 90 ff ff       	jmp    26bba <JS_CallInternal+0x172a>
   2db18:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db1c:	48 89 ce             	mov    %rcx,%rsi
   2db1f:	e8 9c 0e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2db24:	e9 18 b4 ff ff       	jmp    28f41 <JS_CallInternal+0x3ab1>
   2db29:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db2d:	48 89 c2             	mov    %rax,%rdx
   2db30:	e8 8b 0e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2db35:	e9 b9 b3 ff ff       	jmp    28ef3 <JS_CallInternal+0x3a63>
   2db3a:	48 83 ec 08          	sub    $0x8,%rsp
   2db3e:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2db44:	4c 89 ef             	mov    %r13,%rdi
   2db47:	49 89 d1             	mov    %rdx,%r9
   2db4a:	6a 00                	push   $0x0
   2db4c:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2db53:	4c 89 e6             	mov    %r12,%rsi
   2db56:	e8 45 28 00 00       	call   303a0 <JS_GetPropertyInternal>
   2db5b:	5f                   	pop    %rdi
   2db5c:	41 58                	pop    %r8
   2db5e:	48 89 c1             	mov    %rax,%rcx
   2db61:	48 89 d0             	mov    %rdx,%rax
   2db64:	83 fa 06             	cmp    $0x6,%edx
   2db67:	0f 85 63 dc ff ff    	jne    2b7d0 <JS_CallInternal+0x6340>
   2db6d:	e9 5e 80 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2db72:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db76:	4c 89 d6             	mov    %r10,%rsi
   2db79:	4c 89 fa             	mov    %r15,%rdx
   2db7c:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2db83:	e8 38 0e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2db88:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2db8f:	e9 b4 c1 ff ff       	jmp    29d48 <JS_CallInternal+0x48b8>
   2db94:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db98:	48 89 c2             	mov    %rax,%rdx
   2db9b:	48 89 ce             	mov    %rcx,%rsi
   2db9e:	e8 1d 0e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dba3:	e9 20 a4 ff ff       	jmp    27fc8 <JS_CallInternal+0x2b38>
   2dba8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbac:	48 89 c2             	mov    %rax,%rdx
   2dbaf:	48 89 ce             	mov    %rcx,%rsi
   2dbb2:	e8 09 0e ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dbb7:	e9 bf a3 ff ff       	jmp    27f7b <JS_CallInternal+0x2aeb>
   2dbbc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbc0:	48 89 c2             	mov    %rax,%rdx
   2dbc3:	48 89 ce             	mov    %rcx,%rsi
   2dbc6:	e8 f5 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dbcb:	e9 40 a4 ff ff       	jmp    28010 <JS_CallInternal+0x2b80>
   2dbd0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbd4:	48 89 c2             	mov    %rax,%rdx
   2dbd7:	48 89 ce             	mov    %rcx,%rsi
   2dbda:	e8 e1 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dbdf:	e9 14 91 ff ff       	jmp    26cf8 <JS_CallInternal+0x1868>
   2dbe4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbe8:	48 89 c2             	mov    %rax,%rdx
   2dbeb:	48 89 ce             	mov    %rcx,%rsi
   2dbee:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2dbf5:	e8 c6 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dbfa:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2dc01:	e9 d5 90 ff ff       	jmp    26cdb <JS_CallInternal+0x184b>
   2dc06:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2dc0d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc11:	48 89 d0             	mov    %rdx,%rax
   2dc14:	4c 89 ca             	mov    %r9,%rdx
   2dc17:	48 89 c6             	mov    %rax,%rsi
   2dc1a:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2dc21:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2dc28:	e8 93 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dc2d:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2dc34:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2dc3b:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2dc42:	e9 9c c5 ff ff       	jmp    2a1e3 <JS_CallInternal+0x4d53>
   2dc47:	48 89 f2             	mov    %rsi,%rdx
   2dc4a:	48 89 fe             	mov    %rdi,%rsi
   2dc4d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc51:	44 89 85 00 fe ff ff 	mov    %r8d,-0x200(%rbp)
   2dc58:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2dc5f:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2dc66:	e8 55 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dc6b:	44 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8d
   2dc72:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2dc79:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2dc80:	e9 89 c5 ff ff       	jmp    2a20e <JS_CallInternal+0x4d7e>
   2dc85:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc89:	48 89 c2             	mov    %rax,%rdx
   2dc8c:	e8 2f 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dc91:	e9 24 aa ff ff       	jmp    286ba <JS_CallInternal+0x322a>
   2dc96:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc9a:	48 89 c2             	mov    %rax,%rdx
   2dc9d:	48 89 ce             	mov    %rcx,%rsi
   2dca0:	e8 1b 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dca5:	e9 0b da ff ff       	jmp    2b6b5 <JS_CallInternal+0x6225>
   2dcaa:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dcae:	48 89 c2             	mov    %rax,%rdx
   2dcb1:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2dcb8:	e8 03 0d ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dcbd:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dcc4:	e9 76 89 ff ff       	jmp    2663f <JS_CallInternal+0x11af>
   2dcc9:	48 89 f2             	mov    %rsi,%rdx
   2dccc:	48 89 fe             	mov    %rdi,%rsi
   2dccf:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dcd3:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2dcda:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2dce1:	e8 da 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dce6:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2dced:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2dcf4:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2dcfb:	e9 30 8b ff ff       	jmp    26830 <JS_CallInternal+0x13a0>
   2dd00:	48 89 f2             	mov    %rsi,%rdx
   2dd03:	48 89 fe             	mov    %rdi,%rsi
   2dd06:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd0a:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2dd11:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2dd18:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2dd1f:	e8 9c 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dd24:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2dd2b:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2dd32:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2dd39:	e9 0f 8b ff ff       	jmp    2684d <JS_CallInternal+0x13bd>
   2dd3e:	48 89 fe             	mov    %rdi,%rsi
   2dd41:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd45:	e8 76 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dd4a:	e9 db ae ff ff       	jmp    28c2a <JS_CallInternal+0x379a>
   2dd4f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd53:	48 89 c2             	mov    %rax,%rdx
   2dd56:	48 89 ce             	mov    %rcx,%rsi
   2dd59:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2dd60:	e8 5b 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dd65:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2dd6c:	e9 86 ea ff ff       	jmp    2c7f7 <JS_CallInternal+0x7367>
   2dd71:	48 89 fe             	mov    %rdi,%rsi
   2dd74:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd78:	e8 43 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dd7d:	e9 b4 d2 ff ff       	jmp    2b036 <JS_CallInternal+0x5ba6>
   2dd82:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd86:	48 89 ce             	mov    %rcx,%rsi
   2dd89:	e8 32 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dd8e:	e9 38 cb ff ff       	jmp    2a8cb <JS_CallInternal+0x543b>
   2dd93:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd97:	48 89 ce             	mov    %rcx,%rsi
   2dd9a:	e8 21 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dd9f:	e9 ec d1 ff ff       	jmp    2af90 <JS_CallInternal+0x5b00>
   2dda4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dda8:	48 89 c2             	mov    %rax,%rdx
   2ddab:	48 89 ce             	mov    %rcx,%rsi
   2ddae:	e8 0d 0c ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2ddb3:	e9 88 ce ff ff       	jmp    2ac40 <JS_CallInternal+0x57b0>
   2ddb8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ddbc:	48 89 ce             	mov    %rcx,%rsi
   2ddbf:	e8 fc 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2ddc4:	e9 82 d0 ff ff       	jmp    2ae4b <JS_CallInternal+0x59bb>
   2ddc9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ddcd:	48 89 ce             	mov    %rcx,%rsi
   2ddd0:	e8 eb 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2ddd5:	e9 1e d1 ff ff       	jmp    2aef8 <JS_CallInternal+0x5a68>
   2ddda:	48 89 fe             	mov    %rdi,%rsi
   2dddd:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dde1:	e8 da 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2dde6:	e9 bd d0 ff ff       	jmp    2aea8 <JS_CallInternal+0x5a18>
   2ddeb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ddef:	4c 89 ca             	mov    %r9,%rdx
   2ddf2:	4c 89 fe             	mov    %r15,%rsi
   2ddf5:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2ddfc:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2de03:	e8 b8 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2de08:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2de0f:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2de16:	e9 07 96 ff ff       	jmp    27422 <JS_CallInternal+0x1f92>
   2de1b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2de1f:	48 89 f2             	mov    %rsi,%rdx
   2de22:	48 89 ce             	mov    %rcx,%rsi
   2de25:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2de2c:	e8 8f 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2de31:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2de38:	e9 6b 89 ff ff       	jmp    267a8 <JS_CallInternal+0x1318>
   2de3d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2de41:	48 89 f2             	mov    %rsi,%rdx
   2de44:	48 89 ce             	mov    %rcx,%rsi
   2de47:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2de4e:	e8 6d 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2de53:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2de5a:	e9 5d 8b ff ff       	jmp    269bc <JS_CallInternal+0x152c>
   2de5f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2de63:	4c 89 ca             	mov    %r9,%rdx
   2de66:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2de6d:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2de74:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2de7b:	e8 40 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2de80:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2de87:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2de8e:	e9 9c be ff ff       	jmp    29d2f <JS_CallInternal+0x489f>
   2de93:	4d 89 e7             	mov    %r12,%r15
   2de96:	e9 35 7d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2de9b:	4d 89 e7             	mov    %r12,%r15
   2de9e:	e9 2d 7d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2dea3:	48 89 d0             	mov    %rdx,%rax
   2dea6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2deaa:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2deb1:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2deb7:	48 89 c6             	mov    %rax,%rsi
   2deba:	e8 01 0b ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2debf:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2dec5:	e9 1a bc ff ff       	jmp    29ae4 <JS_CallInternal+0x4654>
   2deca:	4d 89 e7             	mov    %r12,%r15
   2decd:	e9 fe 7c ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ded2:	31 c0                	xor    %eax,%eax
   2ded4:	48 8d 35 a2 b6 0a 00 	lea    0xab6a2(%rip),%rsi        # d957d <_IO_stdin_used+0x57d>
   2dedb:	4c 89 ef             	mov    %r13,%rdi
   2dede:	4d 89 e7             	mov    %r12,%r15
   2dee1:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2dee8:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2deef:	e8 2c 86 00 00       	call   36520 <JS_ThrowInternalError>
   2def4:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2def7:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2defe:	76 18                	jbe    2df18 <JS_CallInternal+0x8a88>
   2df00:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2df07:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2df0a:	83 e8 01             	sub    $0x1,%eax
   2df0d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2df10:	85 c0                	test   %eax,%eax
   2df12:	0f 8e fb 1e 00 00    	jle    2fe13 <JS_CallInternal+0xa983>
   2df18:	4c 89 c3             	mov    %r8,%rbx
   2df1b:	e9 b0 7c ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2df20:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2df27:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2df2e:	0f b7 d1             	movzwl %cx,%edx
   2df31:	31 c9                	xor    %ecx,%ecx
   2df33:	e8 88 84 00 00       	call   363c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2df38:	e9 93 7c ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2df3d:	c7 85 dc fe ff ff ff 	movl   $0xffffffff,-0x124(%rbp)
   2df44:	ff ff ff 
   2df47:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2df4b:	83 fe f6             	cmp    $0xfffffff6,%esi
   2df4e:	0f 87 3d 14 00 00    	ja     2f391 <JS_CallInternal+0x9f01>
   2df54:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2df5b:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2df62:	00 
   2df63:	e9 68 7c ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2df68:	ba 01 00 00 00       	mov    $0x1,%edx
   2df6d:	be 03 00 00 00       	mov    $0x3,%esi
   2df72:	31 ff                	xor    %edi,%edi
   2df74:	e9 4f cc ff ff       	jmp    2abc8 <JS_CallInternal+0x5738>
   2df79:	48 8d 35 15 b6 0a 00 	lea    0xab615(%rip),%rsi        # d9595 <_IO_stdin_used+0x595>
   2df80:	4c 89 ef             	mov    %r13,%rdi
   2df83:	31 c0                	xor    %eax,%eax
   2df85:	e8 b6 63 00 00       	call   34340 <JS_ThrowTypeError>
   2df8a:	83 bd 10 fe ff ff f6 	cmpl   $0xfffffff6,-0x1f0(%rbp)
   2df91:	76 1e                	jbe    2dfb1 <JS_CallInternal+0x8b21>
   2df93:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2df9a:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2df9d:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2dfa3:	83 e8 01             	sub    $0x1,%eax
   2dfa6:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2dfa9:	85 c0                	test   %eax,%eax
   2dfab:	0f 8e fb 1c 00 00    	jle    2fcac <JS_CallInternal+0xa81c>
   2dfb1:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2dfb5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2dfb8:	76 6d                	jbe    2e027 <JS_CallInternal+0x8b97>
   2dfba:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2dfc0:	e9 1e e8 ff ff       	jmp    2c7e3 <JS_CallInternal+0x7353>
   2dfc5:	48 8d 15 f1 b4 0a 00 	lea    0xab4f1(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2dfcc:	85 c9                	test   %ecx,%ecx
   2dfce:	0f 85 f0 1c 00 00    	jne    2fcc4 <JS_CallInternal+0xa834>
   2dfd4:	48 8d 35 3e b5 0a 00 	lea    0xab53e(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2dfdb:	4c 89 ef             	mov    %r13,%rdi
   2dfde:	31 c0                	xor    %eax,%eax
   2dfe0:	e8 3b 82 00 00       	call   36220 <JS_ThrowReferenceError>
   2dfe5:	e9 e6 7b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2dfea:	48 8d 35 96 b5 0a 00 	lea    0xab596(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2dff1:	4c 89 ef             	mov    %r13,%rdi
   2dff4:	31 c0                	xor    %eax,%eax
   2dff6:	e8 45 63 00 00       	call   34340 <JS_ThrowTypeError>
   2dffb:	eb 8d                	jmp    2df8a <JS_CallInternal+0x8afa>
   2dffd:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e004:	44 89 d2             	mov    %r10d,%edx
   2e007:	48 89 de             	mov    %rbx,%rsi
   2e00a:	4c 89 ef             	mov    %r13,%rdi
   2e00d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e011:	e8 9a 4d 02 00       	call   52db0 <js_binary_logic_slow>
   2e016:	85 c0                	test   %eax,%eax
   2e018:	0f 85 0e 22 00 00    	jne    3022c <JS_CallInternal+0xad9c>
   2e01e:	48 83 eb 10          	sub    $0x10,%rbx
   2e022:	e9 f7 be ff ff       	jmp    29f1e <JS_CallInternal+0x4a8e>
   2e027:	49 8b 47 08          	mov    0x8(%r15),%rax
   2e02b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e02e:	0f 86 ea e7 ff ff    	jbe    2c81e <JS_CallInternal+0x738e>
   2e034:	49 8b 17             	mov    (%r15),%rdx
   2e037:	4d 89 e7             	mov    %r12,%r15
   2e03a:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2e03d:	83 e9 01             	sub    $0x1,%ecx
   2e040:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2e043:	85 c9                	test   %ecx,%ecx
   2e045:	0f 8f 85 7b ff ff    	jg     25bd0 <JS_CallInternal+0x740>
   2e04b:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2e051:	e9 16 f9 ff ff       	jmp    2d96c <JS_CallInternal+0x84dc>
   2e056:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2e05d:	48 89 ce             	mov    %rcx,%rsi
   2e060:	e8 5b 09 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e065:	e9 0a cd ff ff       	jmp    2ad74 <JS_CallInternal+0x58e4>
   2e06a:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2e071:	48 8d 15 45 b4 0a 00 	lea    0xab445(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2e078:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e07c:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2e080:	85 c0                	test   %eax,%eax
   2e082:	0f 85 d0 1d 00 00    	jne    2fe58 <JS_CallInternal+0xa9c8>
   2e088:	48 8d 35 8a b4 0a 00 	lea    0xab48a(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2e08f:	4c 89 ef             	mov    %r13,%rdi
   2e092:	31 c0                	xor    %eax,%eax
   2e094:	e8 87 81 00 00       	call   36220 <JS_ThrowReferenceError>
   2e099:	e9 32 7b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e09e:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e0a2:	b8 08 00 00 00       	mov    $0x8,%eax
   2e0a7:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
   2e0ac:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2e0b1:	e9 ea c2 ff ff       	jmp    2a3a0 <JS_CallInternal+0x4f10>
   2e0b6:	83 f8 08             	cmp    $0x8,%eax
   2e0b9:	0f 84 17 19 00 00    	je     2f9d6 <JS_CallInternal+0xa546>
   2e0bf:	83 f8 f9             	cmp    $0xfffffff9,%eax
   2e0c2:	0f 84 65 14 00 00    	je     2f52d <JS_CallInternal+0xa09d>
   2e0c8:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2e0cf:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2e0d3:	49 8b 31             	mov    (%r9),%rsi
   2e0d6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e0d9:	0f 87 65 14 00 00    	ja     2f544 <JS_CallInternal+0xa0b4>
   2e0df:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
   2e0e6:	4c 89 ef             	mov    %r13,%rdi
   2e0e9:	48 83 eb 10          	sub    $0x10,%rbx
   2e0ed:	48 8d b5 70 ff ff ff 	lea    -0x90(%rbp),%rsi
   2e0f4:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2e0fb:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   2e102:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   2e109:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   2e110:	e8 cb 94 02 00       	call   575e0 <js_add_slow>
   2e115:	85 c0                	test   %eax,%eax
   2e117:	0f 85 b3 7a ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2e11d:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2e124:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
   2e12b:	49 8b 09             	mov    (%r9),%rcx
   2e12e:	49 8b 41 08          	mov    0x8(%r9),%rax
   2e132:	49 89 11             	mov    %rdx,(%r9)
   2e135:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
   2e13c:	49 89 51 08          	mov    %rdx,0x8(%r9)
   2e140:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e143:	0f 86 5f c2 ff ff    	jbe    2a3a8 <JS_CallInternal+0x4f18>
   2e149:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2e14c:	83 ea 01             	sub    $0x1,%edx
   2e14f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2e152:	85 d2                	test   %edx,%edx
   2e154:	0f 8f 4e c2 ff ff    	jg     2a3a8 <JS_CallInternal+0x4f18>
   2e15a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e15e:	48 89 c2             	mov    %rax,%rdx
   2e161:	48 89 ce             	mov    %rcx,%rsi
   2e164:	e8 57 08 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e169:	e9 3a c2 ff ff       	jmp    2a3a8 <JS_CallInternal+0x4f18>
   2e16e:	4c 89 ef             	mov    %r13,%rdi
   2e171:	e8 6a 84 00 00       	call   365e0 <__js_poll_interrupts>
   2e176:	85 c0                	test   %eax,%eax
   2e178:	0f 85 52 7a ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2e17e:	e9 76 c6 ff ff       	jmp    2a7f9 <JS_CallInternal+0x5369>
   2e183:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e188:	4c 89 ef             	mov    %r13,%rdi
   2e18b:	e8 50 84 00 00       	call   365e0 <__js_poll_interrupts>
   2e190:	85 c0                	test   %eax,%eax
   2e192:	0f 85 38 7a ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2e198:	e9 32 c8 ff ff       	jmp    2a9cf <JS_CallInternal+0x553f>
   2e19d:	0f 1f 00             	nopl   (%rax)
   2e1a0:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e1a7:	0f b7 d1             	movzwl %cx,%edx
   2e1aa:	4c 89 ef             	mov    %r13,%rdi
   2e1ad:	31 c9                	xor    %ecx,%ecx
   2e1af:	e8 0c 82 00 00       	call   363c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e1b4:	e9 17 7a ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e1b9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e1bd:	48 89 c2             	mov    %rax,%rdx
   2e1c0:	48 89 ce             	mov    %rcx,%rsi
   2e1c3:	e8 f8 07 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e1c8:	e9 90 94 ff ff       	jmp    2765d <JS_CallInternal+0x21cd>
   2e1cd:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e1d1:	48 89 c2             	mov    %rax,%rdx
   2e1d4:	48 89 ce             	mov    %rcx,%rsi
   2e1d7:	e8 e4 07 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e1dc:	e9 a0 94 ff ff       	jmp    27681 <JS_CallInternal+0x21f1>
   2e1e1:	4d 89 e7             	mov    %r12,%r15
   2e1e4:	e9 e7 79 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e1e9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e1ed:	48 89 c2             	mov    %rax,%rdx
   2e1f0:	48 89 ce             	mov    %rcx,%rsi
   2e1f3:	e8 c8 07 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e1f8:	e9 57 97 ff ff       	jmp    27954 <JS_CallInternal+0x24c4>
   2e1fd:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e201:	48 89 c2             	mov    %rax,%rdx
   2e204:	48 89 ce             	mov    %rcx,%rsi
   2e207:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2e20e:	e8 ad 07 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e213:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2e21a:	e9 f4 96 ff ff       	jmp    27913 <JS_CallInternal+0x2483>
   2e21f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e223:	48 89 c2             	mov    %rax,%rdx
   2e226:	48 89 ce             	mov    %rcx,%rsi
   2e229:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2e230:	e8 8b 07 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e235:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2e23c:	e9 ff 93 ff ff       	jmp    27640 <JS_CallInternal+0x21b0>
   2e241:	83 fe 08             	cmp    $0x8,%esi
   2e244:	0f 84 7a 15 00 00    	je     2f7c4 <JS_CallInternal+0xa334>
   2e24a:	83 f9 08             	cmp    $0x8,%ecx
   2e24d:	75 08                	jne    2e257 <JS_CallInternal+0x8dc7>
   2e24f:	85 f6                	test   %esi,%esi
   2e251:	0f 84 f8 16 00 00    	je     2f94f <JS_CallInternal+0xa4bf>
   2e257:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e25e:	44 89 d2             	mov    %r10d,%edx
   2e261:	48 89 de             	mov    %rbx,%rsi
   2e264:	4c 89 ef             	mov    %r13,%rdi
   2e267:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e26b:	e8 40 e8 02 00       	call   5cab0 <js_relational_slow>
   2e270:	85 c0                	test   %eax,%eax
   2e272:	0f 85 89 1e 00 00    	jne    30101 <JS_CallInternal+0xac71>
   2e278:	48 83 eb 10          	sub    $0x10,%rbx
   2e27c:	e9 77 be ff ff       	jmp    2a0f8 <JS_CallInternal+0x4c68>
   2e281:	48 39 8d 10 fe ff ff 	cmp    %rcx,-0x1f0(%rbp)
   2e288:	0f 85 61 e1 ff ff    	jne    2c3ef <JS_CallInternal+0x6f5f>
   2e28e:	41 8b 42 10          	mov    0x10(%r10),%eax
   2e292:	83 f8 ff             	cmp    $0xffffffff,%eax
   2e295:	0f 84 54 e1 ff ff    	je     2c3ef <JS_CallInternal+0x6f5f>
   2e29b:	48 c1 e0 04          	shl    $0x4,%rax
   2e29f:	49 03 43 20          	add    0x20(%r11),%rax
   2e2a3:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2e2a7:	48 8b 08             	mov    (%rax),%rcx
   2e2aa:	83 fa f6             	cmp    $0xfffffff6,%edx
   2e2ad:	76 04                	jbe    2e2b3 <JS_CallInternal+0x8e23>
   2e2af:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2e2b3:	49 89 cf             	mov    %rcx,%r15
   2e2b6:	e9 a9 82 ff ff       	jmp    26564 <JS_CallInternal+0x10d4>
   2e2bb:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2e2bf:	e9 0b e0 ff ff       	jmp    2c2cf <JS_CallInternal+0x6e3f>
   2e2c4:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e2cb:	44 89 d2             	mov    %r10d,%edx
   2e2ce:	48 89 de             	mov    %rbx,%rsi
   2e2d1:	4c 89 ef             	mov    %r13,%rdi
   2e2d4:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e2d8:	e8 d3 4a 02 00       	call   52db0 <js_binary_logic_slow>
   2e2dd:	85 c0                	test   %eax,%eax
   2e2df:	0f 85 8a 1f 00 00    	jne    3026f <JS_CallInternal+0xaddf>
   2e2e5:	48 83 eb 10          	sub    $0x10,%rbx
   2e2e9:	e9 d5 cf ff ff       	jmp    2b2c3 <JS_CallInternal+0x5e33>
   2e2ee:	83 fa 08             	cmp    $0x8,%edx
   2e2f1:	0f 84 0f 1a 00 00    	je     2fd06 <JS_CallInternal+0xa876>
   2e2f7:	83 fa ff             	cmp    $0xffffffff,%edx
   2e2fa:	0f 84 37 17 00 00    	je     2fa37 <JS_CallInternal+0xa5a7>
   2e300:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e303:	83 f8 01             	cmp    $0x1,%eax
   2e306:	0f 86 fa 16 00 00    	jbe    2fa06 <JS_CallInternal+0xa576>
   2e30c:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e30f:	0f 85 3b ee ff ff    	jne    2d150 <JS_CallInternal+0x7cc0>
   2e315:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e318:	0f 85 32 ee ff ff    	jne    2d150 <JS_CallInternal+0x7cc0>
   2e31e:	4c 89 c6             	mov    %r8,%rsi
   2e321:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2e328:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2e32f:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e336:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e33d:	e8 ae b0 fe ff       	call   193f0 <js_string_eq.isra.0>
   2e342:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e349:	4c 89 ef             	mov    %r13,%rdi
   2e34c:	41 89 c7             	mov    %eax,%r15d
   2e34f:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2e356:	48 89 c6             	mov    %rax,%rsi
   2e359:	e8 e2 07 ff ff       	call   1eb40 <JS_FreeValue>
   2e35e:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2e365:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2e36c:	4c 89 ef             	mov    %r13,%rdi
   2e36f:	4c 89 c6             	mov    %r8,%rsi
   2e372:	4c 89 ca             	mov    %r9,%rdx
   2e375:	e8 c6 07 ff ff       	call   1eb40 <JS_FreeValue>
   2e37a:	e9 b3 b2 ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   2e37f:	90                   	nop
   2e380:	4c 89 ef             	mov    %r13,%rdi
   2e383:	e8 58 82 00 00       	call   365e0 <__js_poll_interrupts>
   2e388:	85 c0                	test   %eax,%eax
   2e38a:	0f 85 40 78 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2e390:	e9 af ac ff ff       	jmp    29044 <JS_CallInternal+0x3bb4>
   2e395:	0f 1f 00             	nopl   (%rax)
   2e398:	4c 89 ef             	mov    %r13,%rdi
   2e39b:	e8 40 82 00 00       	call   365e0 <__js_poll_interrupts>
   2e3a0:	85 c0                	test   %eax,%eax
   2e3a2:	0f 85 28 78 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2e3a8:	e9 3b ac ff ff       	jmp    28fe8 <JS_CallInternal+0x3b58>
   2e3ad:	0f 1f 00             	nopl   (%rax)
   2e3b0:	83 f9 08             	cmp    $0x8,%ecx
   2e3b3:	0f 84 28 15 00 00    	je     2f8e1 <JS_CallInternal+0xa451>
   2e3b9:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2e3bc:	0f 84 e5 14 00 00    	je     2f8a7 <JS_CallInternal+0xa417>
   2e3c2:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2e3c5:	83 f8 01             	cmp    $0x1,%eax
   2e3c8:	0f 86 7b 1e 00 00    	jbe    30249 <JS_CallInternal+0xadb9>
   2e3ce:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e3d1:	0f 85 76 14 00 00    	jne    2f84d <JS_CallInternal+0xa3bd>
   2e3d7:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2e3db:	0f 85 6c 14 00 00    	jne    2f84d <JS_CallInternal+0xa3bd>
   2e3e1:	4c 89 d6             	mov    %r10,%rsi
   2e3e4:	48 89 d7             	mov    %rdx,%rdi
   2e3e7:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2e3ee:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e3f5:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2e3fc:	e8 ef af fe ff       	call   193f0 <js_string_eq.isra.0>
   2e401:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2e408:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e40f:	4c 89 ef             	mov    %r13,%rdi
   2e412:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e418:	48 89 d6             	mov    %rdx,%rsi
   2e41b:	48 89 ca             	mov    %rcx,%rdx
   2e41e:	e8 1d 07 ff ff       	call   1eb40 <JS_FreeValue>
   2e423:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2e42a:	4d 89 fb             	mov    %r15,%r11
   2e42d:	4c 89 d6             	mov    %r10,%rsi
   2e430:	4c 89 da             	mov    %r11,%rdx
   2e433:	4c 89 ef             	mov    %r13,%rdi
   2e436:	e8 05 07 ff ff       	call   1eb40 <JS_FreeValue>
   2e43b:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e441:	83 f0 01             	xor    $0x1,%eax
   2e444:	48 98                	cltq
   2e446:	e9 3e b1 ff ff       	jmp    29589 <JS_CallInternal+0x40f9>
   2e44b:	83 fe 08             	cmp    $0x8,%esi
   2e44e:	0f 84 bb 14 00 00    	je     2f90f <JS_CallInternal+0xa47f>
   2e454:	83 f9 08             	cmp    $0x8,%ecx
   2e457:	75 08                	jne    2e461 <JS_CallInternal+0x8fd1>
   2e459:	85 f6                	test   %esi,%esi
   2e45b:	0f 84 00 15 00 00    	je     2f961 <JS_CallInternal+0xa4d1>
   2e461:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e468:	44 89 d2             	mov    %r10d,%edx
   2e46b:	48 89 de             	mov    %rbx,%rsi
   2e46e:	4c 89 ef             	mov    %r13,%rdi
   2e471:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e475:	e8 36 e6 02 00       	call   5cab0 <js_relational_slow>
   2e47a:	85 c0                	test   %eax,%eax
   2e47c:	0f 85 47 1e 00 00    	jne    302c9 <JS_CallInternal+0xae39>
   2e482:	48 83 eb 10          	sub    $0x10,%rbx
   2e486:	e9 22 bc ff ff       	jmp    2a0ad <JS_CallInternal+0x4c1d>
   2e48b:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2e492:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e496:	48 89 ce             	mov    %rcx,%rsi
   2e499:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2e4a0:	e8 1b 05 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e4a5:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2e4ac:	e9 78 b9 ff ff       	jmp    29e29 <JS_CallInternal+0x4999>
   2e4b1:	4d 89 e7             	mov    %r12,%r15
   2e4b4:	e9 17 77 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e4b9:	48 8d 35 d5 b0 0a 00 	lea    0xab0d5(%rip),%rsi        # d9595 <_IO_stdin_used+0x595>
   2e4c0:	4c 89 ef             	mov    %r13,%rdi
   2e4c3:	31 c0                	xor    %eax,%eax
   2e4c5:	e8 76 5e 00 00       	call   34340 <JS_ThrowTypeError>
   2e4ca:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2e4ce:	48 89 c1             	mov    %rax,%rcx
   2e4d1:	48 89 d0             	mov    %rdx,%rax
   2e4d4:	49 8b 17             	mov    (%r15),%rdx
   2e4d7:	41 89 c0             	mov    %eax,%r8d
   2e4da:	e9 ed bc ff ff       	jmp    2a1cc <JS_CallInternal+0x4d3c>
   2e4df:	48 8d 35 a1 b0 0a 00 	lea    0xab0a1(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2e4e6:	4c 89 ef             	mov    %r13,%rdi
   2e4e9:	31 c0                	xor    %eax,%eax
   2e4eb:	e8 50 5e 00 00       	call   34340 <JS_ThrowTypeError>
   2e4f0:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2e4f4:	48 89 c1             	mov    %rax,%rcx
   2e4f7:	48 89 d0             	mov    %rdx,%rax
   2e4fa:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2e4fe:	41 89 c0             	mov    %eax,%r8d
   2e501:	e9 c6 bc ff ff       	jmp    2a1cc <JS_CallInternal+0x4d3c>
   2e506:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e50d:	0f b7 d1             	movzwl %cx,%edx
   2e510:	4c 89 ef             	mov    %r13,%rdi
   2e513:	31 c9                	xor    %ecx,%ecx
   2e515:	e8 a6 7e 00 00       	call   363c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e51a:	e9 b1 76 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e51f:	48 8d 35 9a e8 0a 00 	lea    0xae89a(%rip),%rsi        # dcdc0 <_IO_stdin_used+0x3dc0>
   2e526:	4c 89 ef             	mov    %r13,%rdi
   2e529:	31 c0                	xor    %eax,%eax
   2e52b:	e8 f0 7c 00 00       	call   36220 <JS_ThrowReferenceError>
   2e530:	e9 9b 76 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e535:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e539:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e53d:	89 c2                	mov    %eax,%edx
   2e53f:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e545:	4d 89 e7             	mov    %r12,%r15
   2e548:	e8 83 a4 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e54d:	48 8d 35 6e b0 0a 00 	lea    0xab06e(%rip),%rsi        # d95c2 <_IO_stdin_used+0x5c2>
   2e554:	4c 89 ef             	mov    %r13,%rdi
   2e557:	48 89 c2             	mov    %rax,%rdx
   2e55a:	31 c0                	xor    %eax,%eax
   2e55c:	e8 bf 7c 00 00       	call   36220 <JS_ThrowReferenceError>
   2e561:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e567:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e56d:	0f 8e 5d 76 ff ff    	jle    25bd0 <JS_CallInternal+0x740>
   2e573:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e577:	89 ce                	mov    %ecx,%esi
   2e579:	e8 72 c6 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e57e:	e9 4d 76 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e583:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e587:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2e58e:	4c 89 fa             	mov    %r15,%rdx
   2e591:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2e598:	e8 23 04 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e59d:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2e5a4:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2e5ab:	e9 4f 88 ff ff       	jmp    26dff <JS_CallInternal+0x196f>
   2e5b0:	48 83 c3 10          	add    $0x10,%rbx
   2e5b4:	e9 17 76 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e5b9:	48 83 c3 10          	add    $0x10,%rbx
   2e5bd:	e9 0e 76 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e5c2:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2e5c6:	0f 8d 40 0d 00 00    	jge    2f30c <JS_CallInternal+0x9e7c>
   2e5cc:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2e5d0:	0f 8d 9f e9 ff ff    	jge    2cf75 <JS_CallInternal+0x7ae5>
   2e5d6:	83 e8 02             	sub    $0x2,%eax
   2e5d9:	83 f8 01             	cmp    $0x1,%eax
   2e5dc:	0f 87 30 e9 ff ff    	ja     2cf12 <JS_CallInternal+0x7a82>
   2e5e2:	48 8d 35 c3 af 0a 00 	lea    0xaafc3(%rip),%rsi        # d95ac <_IO_stdin_used+0x5ac>
   2e5e9:	4c 89 ef             	mov    %r13,%rdi
   2e5ec:	31 c0                	xor    %eax,%eax
   2e5ee:	4d 89 e7             	mov    %r12,%r15
   2e5f1:	e8 4a 5d 00 00       	call   34340 <JS_ThrowTypeError>
   2e5f6:	e9 d5 75 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e5fb:	4d 89 e7             	mov    %r12,%r15
   2e5fe:	e9 cd 75 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e603:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e607:	48 89 c2             	mov    %rax,%rdx
   2e60a:	48 89 ce             	mov    %rcx,%rsi
   2e60d:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2e614:	e8 a7 03 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e619:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2e620:	e9 12 93 ff ff       	jmp    27937 <JS_CallInternal+0x24a7>
   2e625:	83 fa 08             	cmp    $0x8,%edx
   2e628:	0f 84 e2 15 00 00    	je     2fc10 <JS_CallInternal+0xa780>
   2e62e:	83 fa ff             	cmp    $0xffffffff,%edx
   2e631:	0f 84 8c 15 00 00    	je     2fbc3 <JS_CallInternal+0xa733>
   2e637:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e63a:	83 f8 01             	cmp    $0x1,%eax
   2e63d:	0f 86 34 1c 00 00    	jbe    30277 <JS_CallInternal+0xade7>
   2e643:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e646:	0f 85 0b 15 00 00    	jne    2fb57 <JS_CallInternal+0xa6c7>
   2e64c:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2e650:	0f 85 01 15 00 00    	jne    2fb57 <JS_CallInternal+0xa6c7>
   2e656:	4c 89 d6             	mov    %r10,%rsi
   2e659:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2e660:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2e667:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2e66e:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2e675:	e8 76 ad fe ff       	call   193f0 <js_string_eq.isra.0>
   2e67a:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2e681:	4c 89 ef             	mov    %r13,%rdi
   2e684:	4c 63 f8             	movslq %eax,%r15
   2e687:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2e68e:	48 89 c6             	mov    %rax,%rsi
   2e691:	e8 aa 04 ff ff       	call   1eb40 <JS_FreeValue>
   2e696:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2e69d:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2e6a4:	4c 89 ef             	mov    %r13,%rdi
   2e6a7:	4c 89 d6             	mov    %r10,%rsi
   2e6aa:	4c 89 da             	mov    %r11,%rdx
   2e6ad:	e8 8e 04 ff ff       	call   1eb40 <JS_FreeValue>
   2e6b2:	e9 27 af ff ff       	jmp    295de <JS_CallInternal+0x414e>
   2e6b7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e6bb:	48 89 c2             	mov    %rax,%rdx
   2e6be:	48 89 ce             	mov    %rcx,%rsi
   2e6c1:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e6c8:	e8 f3 02 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e6cd:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e6d4:	e9 c2 90 ff ff       	jmp    2779b <JS_CallInternal+0x230b>
   2e6d9:	49 8b 45 10          	mov    0x10(%r13),%rax
   2e6dd:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e6e4:	48 85 c0             	test   %rax,%rax
   2e6e7:	0f 84 b0 0b 00 00    	je     2f29d <JS_CallInternal+0x9e0d>
   2e6ed:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e6f1:	0f 84 a6 0b 00 00    	je     2f29d <JS_CallInternal+0x9e0d>
   2e6f7:	89 ce                	mov    %ecx,%esi
   2e6f9:	4c 89 ef             	mov    %r13,%rdi
   2e6fc:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e702:	4d 89 e7             	mov    %r12,%r15
   2e705:	e8 56 7c 00 00       	call   36360 <JS_ThrowReferenceErrorNotDefined>
   2e70a:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e710:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e716:	0f 8e b4 74 ff ff    	jle    25bd0 <JS_CallInternal+0x740>
   2e71c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e720:	89 ce                	mov    %ecx,%esi
   2e722:	e8 c9 c4 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e727:	e9 a4 74 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e72c:	4d 89 e7             	mov    %r12,%r15
   2e72f:	e9 9c 74 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e734:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e738:	48 89 c2             	mov    %rax,%rdx
   2e73b:	48 89 ce             	mov    %rcx,%rsi
   2e73e:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e745:	e8 76 02 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e74a:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e751:	e9 28 90 ff ff       	jmp    2777e <JS_CallInternal+0x22ee>
   2e756:	4d 89 e7             	mov    %r12,%r15
   2e759:	e9 72 74 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e75e:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2e763:	0f 85 fb 7d ff ff    	jne    26564 <JS_CallInternal+0x10d4>
   2e769:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2e76d:	0f 85 f1 7d ff ff    	jne    26564 <JS_CallInternal+0x10d4>
   2e773:	41 80 78 10 00       	cmpb   $0x0,0x10(%r8)
   2e778:	0f 84 e6 7d ff ff    	je     26564 <JS_CallInternal+0x10d4>
   2e77e:	49 8b 4a 08          	mov    0x8(%r10),%rcx
   2e782:	45 31 db             	xor    %r11d,%r11d
   2e785:	48 c1 fe 04          	sar    $0x4,%rsi
   2e789:	49 8b 02             	mov    (%r10),%rax
   2e78c:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   2e791:	4d 89 02             	mov    %r8,(%r10)
   2e794:	4d 89 5a 08          	mov    %r11,0x8(%r10)
   2e798:	41 89 72 10          	mov    %esi,0x10(%r10)
   2e79c:	48 85 c9             	test   %rcx,%rcx
   2e79f:	74 28                	je     2e7c9 <JS_CallInternal+0x9339>
   2e7a1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e7a5:	48 89 ce             	mov    %rcx,%rsi
   2e7a8:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2e7af:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2e7b6:	e8 95 1e ff ff       	call   20650 <js_free_shape>
   2e7bb:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e7c2:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2e7c9:	48 85 c0             	test   %rax,%rax
   2e7cc:	0f 84 92 7d ff ff    	je     26564 <JS_CallInternal+0x10d4>
   2e7d2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e7d6:	48 89 c6             	mov    %rax,%rsi
   2e7d9:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2e7e0:	e8 6b 1e ff ff       	call   20650 <js_free_shape>
   2e7e5:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2e7ec:	e9 73 7d ff ff       	jmp    26564 <JS_CallInternal+0x10d4>
   2e7f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2e7f8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e7fc:	48 89 c2             	mov    %rax,%rdx
   2e7ff:	48 89 ce             	mov    %rcx,%rsi
   2e802:	e8 b9 01 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e807:	e9 82 d7 ff ff       	jmp    2bf8e <JS_CallInternal+0x6afe>
   2e80c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e810:	48 89 c2             	mov    %rax,%rdx
   2e813:	48 89 ce             	mov    %rcx,%rsi
   2e816:	e8 a5 01 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e81b:	e9 92 d7 ff ff       	jmp    2bfb2 <JS_CallInternal+0x6b22>
   2e820:	4c 89 ef             	mov    %r13,%rdi
   2e823:	e8 b8 7d 00 00       	call   365e0 <__js_poll_interrupts>
   2e828:	85 c0                	test   %eax,%eax
   2e82a:	0f 85 a0 73 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2e830:	e9 6a a8 ff ff       	jmp    2909f <JS_CallInternal+0x3c0f>
   2e835:	0f 1f 00             	nopl   (%rax)
   2e838:	4d 89 e7             	mov    %r12,%r15
   2e83b:	e9 90 73 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e840:	48 8d 35 4e ad 0a 00 	lea    0xaad4e(%rip),%rsi        # d9595 <_IO_stdin_used+0x595>
   2e847:	4c 89 ef             	mov    %r13,%rdi
   2e84a:	31 c0                	xor    %eax,%eax
   2e84c:	4d 89 e7             	mov    %r12,%r15
   2e84f:	e8 ec 5a 00 00       	call   34340 <JS_ThrowTypeError>
   2e854:	e9 50 bd ff ff       	jmp    2a5a9 <JS_CallInternal+0x5119>
   2e859:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e85d:	48 89 c2             	mov    %rax,%rdx
   2e860:	48 89 ce             	mov    %rcx,%rsi
   2e863:	e8 58 01 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e868:	e9 74 d8 ff ff       	jmp    2c0e1 <JS_CallInternal+0x6c51>
   2e86d:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2e874:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e878:	4c 89 fe             	mov    %r15,%rsi
   2e87b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e881:	e8 3a 01 ff ff       	call   1e9c0 <__JS_FreeValueRT>
   2e886:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e88c:	e9 6f b2 ff ff       	jmp    29b00 <JS_CallInternal+0x4670>
   2e891:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e898:	0f b7 d1             	movzwl %cx,%edx
   2e89b:	4c 89 ef             	mov    %r13,%rdi
   2e89e:	31 c9                	xor    %ecx,%ecx
   2e8a0:	e8 1b 7b 00 00       	call   363c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e8a5:	e9 26 73 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e8aa:	48 83 c3 10          	add    $0x10,%rbx
   2e8ae:	e9 1d 73 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e8b3:	4d 89 e7             	mov    %r12,%r15
   2e8b6:	48 83 c3 10          	add    $0x10,%rbx
   2e8ba:	e9 11 73 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e8bf:	4d 89 e7             	mov    %r12,%r15
   2e8c2:	e9 09 73 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e8c7:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e8cb:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e8d2:	00 
   2e8d3:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e8d8:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e8dd:	e9 77 cd ff ff       	jmp    2b659 <JS_CallInternal+0x61c9>
   2e8e2:	83 fa 08             	cmp    $0x8,%edx
   2e8e5:	0f 84 18 0e 00 00    	je     2f703 <JS_CallInternal+0xa273>
   2e8eb:	83 f8 08             	cmp    $0x8,%eax
   2e8ee:	0f 85 f1 cb ff ff    	jne    2b4e5 <JS_CallInternal+0x6055>
   2e8f4:	85 d2                	test   %edx,%edx
   2e8f6:	0f 85 e9 cb ff ff    	jne    2b4e5 <JS_CallInternal+0x6055>
   2e8fc:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e900:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2e904:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2e909:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   2e90d:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e914:	00 
   2e915:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e91a:	e9 3a cd ff ff       	jmp    2b659 <JS_CallInternal+0x61c9>
   2e91f:	4d 89 e7             	mov    %r12,%r15
   2e922:	e9 a9 72 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e927:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e92b:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e932:	00 
   2e933:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e938:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e93d:	e9 b9 cc ff ff       	jmp    2b5fb <JS_CallInternal+0x616b>
   2e942:	83 fa 08             	cmp    $0x8,%edx
   2e945:	0f 84 b9 16 00 00    	je     30004 <JS_CallInternal+0xab74>
   2e94b:	83 f8 08             	cmp    $0x8,%eax
   2e94e:	0f 84 11 16 00 00    	je     2ff65 <JS_CallInternal+0xaad5>
   2e954:	8d 72 07             	lea    0x7(%rdx),%esi
   2e957:	83 fe 01             	cmp    $0x1,%esi
   2e95a:	0f 86 6c 16 00 00    	jbe    2ffcc <JS_CallInternal+0xab3c>
   2e960:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e967:	48 89 de             	mov    %rbx,%rsi
   2e96a:	4c 89 ef             	mov    %r13,%rdi
   2e96d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e971:	e8 6a 8c 02 00       	call   575e0 <js_add_slow>
   2e976:	85 c0                	test   %eax,%eax
   2e978:	0f 84 7d cc ff ff    	je     2b5fb <JS_CallInternal+0x616b>
   2e97e:	4d 89 e7             	mov    %r12,%r15
   2e981:	e9 4a 72 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2e986:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2e98d:	00 00 00 
   2e990:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e994:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e999:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e9a0:	00 
   2e9a1:	48 83 eb 10          	sub    $0x10,%rbx
   2e9a5:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2e9aa:	e9 79 c9 ff ff       	jmp    2b328 <JS_CallInternal+0x5e98>
   2e9af:	8b 01                	mov    (%rcx),%eax
   2e9b1:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2e9b6:	0f 85 e1 b7 ff ff    	jne    2a19d <JS_CallInternal+0x4d0d>
   2e9bc:	89 fa                	mov    %edi,%edx
   2e9be:	48 8b bd 20 fe ff ff 	mov    -0x1e0(%rbp),%rdi
   2e9c5:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e9c9:	e8 02 a0 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e9ce:	48 8d 35 33 e4 0a 00 	lea    0xae433(%rip),%rsi        # dce08 <_IO_stdin_used+0x3e08>
   2e9d5:	4c 89 ef             	mov    %r13,%rdi
   2e9d8:	48 89 c2             	mov    %rax,%rdx
   2e9db:	31 c0                	xor    %eax,%eax
   2e9dd:	e8 5e 59 00 00       	call   34340 <JS_ThrowTypeError>
   2e9e2:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2e9e6:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2e9ea:	0f 87 ea 0b 00 00    	ja     2f5da <JS_CallInternal+0xa14a>
   2e9f0:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2e9f7:	48 8b 70 08          	mov    0x8(%rax),%rsi
   2e9fb:	83 fe f6             	cmp    $0xfffffff6,%esi
   2e9fe:	0f 87 eb 0b 00 00    	ja     2f5ef <JS_CallInternal+0xa15f>
   2ea04:	31 f6                	xor    %esi,%esi
   2ea06:	48 c7 43 e8 06 00 00 	movq   $0x6,-0x18(%rbx)
   2ea0d:	00 
   2ea0e:	48 89 73 e0          	mov    %rsi,-0x20(%rbx)
   2ea12:	4c 89 fb             	mov    %r15,%rbx
   2ea15:	4d 89 e7             	mov    %r12,%r15
   2ea18:	e9 b3 71 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ea1d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ea24:	44 89 d2             	mov    %r10d,%edx
   2ea27:	48 89 de             	mov    %rbx,%rsi
   2ea2a:	4c 89 ef             	mov    %r13,%rdi
   2ea2d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ea31:	e8 7a 43 02 00       	call   52db0 <js_binary_logic_slow>
   2ea36:	85 c0                	test   %eax,%eax
   2ea38:	0f 85 b6 18 00 00    	jne    302f4 <JS_CallInternal+0xae64>
   2ea3e:	48 83 eb 10          	sub    $0x10,%rbx
   2ea42:	e9 59 c9 ff ff       	jmp    2b3a0 <JS_CallInternal+0x5f10>
   2ea47:	83 fe 08             	cmp    $0x8,%esi
   2ea4a:	0f 84 93 12 00 00    	je     2fce3 <JS_CallInternal+0xa853>
   2ea50:	83 f9 08             	cmp    $0x8,%ecx
   2ea53:	75 08                	jne    2ea5d <JS_CallInternal+0x95cd>
   2ea55:	85 f6                	test   %esi,%esi
   2ea57:	0f 84 a4 0b 00 00    	je     2f601 <JS_CallInternal+0xa171>
   2ea5d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ea64:	44 89 d2             	mov    %r10d,%edx
   2ea67:	48 89 de             	mov    %rbx,%rsi
   2ea6a:	4c 89 ef             	mov    %r13,%rdi
   2ea6d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ea71:	e8 3a e0 02 00       	call   5cab0 <js_relational_slow>
   2ea76:	85 c0                	test   %eax,%eax
   2ea78:	0f 85 8b 16 00 00    	jne    30109 <JS_CallInternal+0xac79>
   2ea7e:	48 83 eb 10          	sub    $0x10,%rbx
   2ea82:	e9 27 ba ff ff       	jmp    2a4ae <JS_CallInternal+0x501e>
   2ea87:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ea8b:	4c 89 fa             	mov    %r15,%rdx
   2ea8e:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2ea95:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2ea9c:	e8 1f ff fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2eaa1:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2eaa8:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2eaaf:	e9 23 a9 ff ff       	jmp    293d7 <JS_CallInternal+0x3f47>
   2eab4:	83 fa 08             	cmp    $0x8,%edx
   2eab7:	0f 84 de 0c 00 00    	je     2f79b <JS_CallInternal+0xa30b>
   2eabd:	83 fa ff             	cmp    $0xffffffff,%edx
   2eac0:	0f 84 91 0c 00 00    	je     2f757 <JS_CallInternal+0xa2c7>
   2eac6:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2eac9:	83 f8 01             	cmp    $0x1,%eax
   2eacc:	0f 86 3a 0d 00 00    	jbe    2f80c <JS_CallInternal+0xa37c>
   2ead2:	83 fa f9             	cmp    $0xfffffff9,%edx
   2ead5:	0f 85 49 e6 ff ff    	jne    2d124 <JS_CallInternal+0x7c94>
   2eadb:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2eadf:	0f 85 3f e6 ff ff    	jne    2d124 <JS_CallInternal+0x7c94>
   2eae5:	4c 89 c6             	mov    %r8,%rsi
   2eae8:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2eaef:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2eaf6:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2eafd:	e8 ee a8 fe ff       	call   193f0 <js_string_eq.isra.0>
   2eb02:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2eb09:	4c 89 ef             	mov    %r13,%rdi
   2eb0c:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2eb12:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2eb19:	48 89 c6             	mov    %rax,%rsi
   2eb1c:	e8 1f 00 ff ff       	call   1eb40 <JS_FreeValue>
   2eb21:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2eb28:	4c 89 c6             	mov    %r8,%rsi
   2eb2b:	4c 89 fa             	mov    %r15,%rdx
   2eb2e:	4c 89 ef             	mov    %r13,%rdi
   2eb31:	e8 0a 00 ff ff       	call   1eb40 <JS_FreeValue>
   2eb36:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2eb3c:	e9 4a ab ff ff       	jmp    2968b <JS_CallInternal+0x41fb>
   2eb41:	83 fe 08             	cmp    $0x8,%esi
   2eb44:	0f 84 03 11 00 00    	je     2fc4d <JS_CallInternal+0xa7bd>
   2eb4a:	83 f9 08             	cmp    $0x8,%ecx
   2eb4d:	75 08                	jne    2eb57 <JS_CallInternal+0x96c7>
   2eb4f:	85 f6                	test   %esi,%esi
   2eb51:	0f 84 2e 11 00 00    	je     2fc85 <JS_CallInternal+0xa7f5>
   2eb57:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2eb5e:	44 89 d2             	mov    %r10d,%edx
   2eb61:	48 89 de             	mov    %rbx,%rsi
   2eb64:	4c 89 ef             	mov    %r13,%rdi
   2eb67:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2eb6b:	e8 40 df 02 00       	call   5cab0 <js_relational_slow>
   2eb70:	85 c0                	test   %eax,%eax
   2eb72:	0f 85 ea 14 00 00    	jne    30062 <JS_CallInternal+0xabd2>
   2eb78:	48 83 eb 10          	sub    $0x10,%rbx
   2eb7c:	e9 78 b9 ff ff       	jmp    2a4f9 <JS_CallInternal+0x5069>
   2eb81:	83 fe 08             	cmp    $0x8,%esi
   2eb84:	0f 84 4b 13 00 00    	je     2fed5 <JS_CallInternal+0xaa45>
   2eb8a:	83 f8 08             	cmp    $0x8,%eax
   2eb8d:	0f 85 52 c9 ff ff    	jne    2b4e5 <JS_CallInternal+0x6055>
   2eb93:	85 f6                	test   %esi,%esi
   2eb95:	0f 85 4a c9 ff ff    	jne    2b4e5 <JS_CallInternal+0x6055>
   2eb9b:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2eb9f:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2eba3:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2eba8:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
   2ebac:	e9 e8 fd ff ff       	jmp    2e999 <JS_CallInternal+0x9509>
   2ebb1:	48 83 eb 10          	sub    $0x10,%rbx
   2ebb5:	e9 16 70 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ebba:	4d 89 e7             	mov    %r12,%r15
   2ebbd:	e9 0e 70 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ebc2:	48 8d 35 be a9 0a 00 	lea    0xaa9be(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2ebc9:	4c 89 ef             	mov    %r13,%rdi
   2ebcc:	31 c0                	xor    %eax,%eax
   2ebce:	4d 89 e7             	mov    %r12,%r15
   2ebd1:	e8 6a 57 00 00       	call   34340 <JS_ThrowTypeError>
   2ebd6:	e9 ce b9 ff ff       	jmp    2a5a9 <JS_CallInternal+0x5119>
   2ebdb:	48 8d 35 06 e2 0a 00 	lea    0xae206(%rip),%rsi        # dcde8 <_IO_stdin_used+0x3de8>
   2ebe2:	4c 89 ef             	mov    %r13,%rdi
   2ebe5:	31 c0                	xor    %eax,%eax
   2ebe7:	4d 89 e7             	mov    %r12,%r15
   2ebea:	e8 51 57 00 00       	call   34340 <JS_ThrowTypeError>
   2ebef:	e9 dc 6f ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ebf4:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ebfb:	48 89 de             	mov    %rbx,%rsi
   2ebfe:	4c 89 ef             	mov    %r13,%rdi
   2ec01:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ec05:	e8 d6 3f 02 00       	call   52be0 <js_shr_slow>
   2ec0a:	85 c0                	test   %eax,%eax
   2ec0c:	0f 85 1d 14 00 00    	jne    3002f <JS_CallInternal+0xab9f>
   2ec12:	48 83 eb 10          	sub    $0x10,%rbx
   2ec16:	e9 cf b6 ff ff       	jmp    2a2ea <JS_CallInternal+0x4e5a>
   2ec1b:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2ec22:	48 8d 15 94 a8 0a 00 	lea    0xaa894(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2ec29:	48 8b 40 30          	mov    0x30(%rax),%rax
   2ec2d:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2ec31:	85 c0                	test   %eax,%eax
   2ec33:	0f 85 fd 0b 00 00    	jne    2f836 <JS_CallInternal+0xa3a6>
   2ec39:	48 8d 35 d9 a8 0a 00 	lea    0xaa8d9(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2ec40:	4c 89 ef             	mov    %r13,%rdi
   2ec43:	31 c0                	xor    %eax,%eax
   2ec45:	e8 d6 75 00 00       	call   36220 <JS_ThrowReferenceError>
   2ec4a:	e9 81 6f ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ec4f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ec53:	4c 89 fa             	mov    %r15,%rdx
   2ec56:	48 89 ce             	mov    %rcx,%rsi
   2ec59:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2ec60:	e8 5b fd fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2ec65:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2ec6c:	e9 dc b1 ff ff       	jmp    29e4d <JS_CallInternal+0x49bd>
   2ec71:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2ec78:	48 8b 40 30          	mov    0x30(%rax),%rax
   2ec7c:	8b 44 d0 04          	mov    0x4(%rax,%rdx,8),%eax
   2ec80:	48 8d 15 36 a8 0a 00 	lea    0xaa836(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2ec87:	85 c0                	test   %eax,%eax
   2ec89:	0f 85 2f 12 00 00    	jne    2febe <JS_CallInternal+0xaa2e>
   2ec8f:	48 8d 35 83 a8 0a 00 	lea    0xaa883(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2ec96:	4c 89 ef             	mov    %r13,%rdi
   2ec99:	31 c0                	xor    %eax,%eax
   2ec9b:	e8 80 75 00 00       	call   36220 <JS_ThrowReferenceError>
   2eca0:	e9 2b 6f ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2eca5:	4c 89 ef             	mov    %r13,%rdi
   2eca8:	e8 33 79 00 00       	call   365e0 <__js_poll_interrupts>
   2ecad:	85 c0                	test   %eax,%eax
   2ecaf:	0f 85 1b 6f ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2ecb5:	e9 78 bb ff ff       	jmp    2a832 <JS_CallInternal+0x53a2>
   2ecba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2ecc0:	4c 89 ef             	mov    %r13,%rdi
   2ecc3:	e8 18 79 00 00       	call   365e0 <__js_poll_interrupts>
   2ecc8:	85 c0                	test   %eax,%eax
   2ecca:	0f 85 00 6f ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2ecd0:	e9 cb b5 ff ff       	jmp    2a2a0 <JS_CallInternal+0x4e10>
   2ecd5:	0f 1f 00             	nopl   (%rax)
   2ecd8:	48 83 ec 08          	sub    $0x8,%rsp
   2ecdc:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2ece0:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
   2ece4:	48 83 eb 10          	sub    $0x10,%rbx
   2ece8:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2ecec:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2ecf3:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2ecfa:	68 00 80 00 00       	push   $0x8000
   2ecff:	49 89 f0             	mov    %rsi,%r8
   2ed02:	49 89 f9             	mov    %rdi,%r9
   2ed05:	41 ff b5 88 01 00 00 	push   0x188(%r13)
   2ed0c:	48 89 c6             	mov    %rax,%rsi
   2ed0f:	4c 89 ef             	mov    %r13,%rdi
   2ed12:	41 ff b5 80 01 00 00 	push   0x180(%r13)
   2ed19:	e8 d2 23 00 00       	call   310f0 <JS_SetPropertyInternal>
   2ed1e:	48 83 c4 20          	add    $0x20,%rsp
   2ed22:	85 c0                	test   %eax,%eax
   2ed24:	0f 89 c6 75 ff ff    	jns    262f0 <JS_CallInternal+0xe60>
   2ed2a:	e9 a1 6e ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ed2f:	90                   	nop
   2ed30:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ed37:	44 89 d2             	mov    %r10d,%edx
   2ed3a:	48 89 de             	mov    %rbx,%rsi
   2ed3d:	4c 89 ef             	mov    %r13,%rdi
   2ed40:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ed44:	e8 67 40 02 00       	call   52db0 <js_binary_logic_slow>
   2ed49:	85 c0                	test   %eax,%eax
   2ed4b:	0f 85 ab 15 00 00    	jne    302fc <JS_CallInternal+0xae6c>
   2ed51:	48 83 eb 10          	sub    $0x10,%rbx
   2ed55:	e9 29 c5 ff ff       	jmp    2b283 <JS_CallInternal+0x5df3>
   2ed5a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ed61:	44 89 d2             	mov    %r10d,%edx
   2ed64:	48 89 de             	mov    %rbx,%rsi
   2ed67:	4c 89 ef             	mov    %r13,%rdi
   2ed6a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ed6e:	e8 3d 40 02 00       	call   52db0 <js_binary_logic_slow>
   2ed73:	85 c0                	test   %eax,%eax
   2ed75:	0f 85 1a 15 00 00    	jne    30295 <JS_CallInternal+0xae05>
   2ed7b:	48 83 eb 10          	sub    $0x10,%rbx
   2ed7f:	e9 5a b1 ff ff       	jmp    29ede <JS_CallInternal+0x4a4e>
   2ed84:	0f 85 29 13 00 00    	jne    300b3 <JS_CallInternal+0xac23>
   2ed8a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed8e:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2ed95:	48 85 c0             	test   %rax,%rax
   2ed98:	0f 84 3d 07 00 00    	je     2f4db <JS_CallInternal+0xa04b>
   2ed9e:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2eda2:	0f 84 33 07 00 00    	je     2f4db <JS_CallInternal+0xa04b>
   2eda8:	89 ce                	mov    %ecx,%esi
   2edaa:	4c 89 ef             	mov    %r13,%rdi
   2edad:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2edb3:	4d 89 e7             	mov    %r12,%r15
   2edb6:	e8 a5 75 00 00       	call   36360 <JS_ThrowReferenceErrorNotDefined>
   2edbb:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2edc1:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2edc7:	0f 8e 03 6e ff ff    	jle    25bd0 <JS_CallInternal+0x740>
   2edcd:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2edd1:	89 ce                	mov    %ecx,%esi
   2edd3:	e8 18 be fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2edd8:	e9 f3 6d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2eddd:	48 92                	xchg   %rax,%rdx
   2eddf:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ede3:	48 89 c6             	mov    %rax,%rsi
   2ede6:	e8 d5 fb fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2edeb:	e9 5f 96 ff ff       	jmp    2844f <JS_CallInternal+0x2fbf>
   2edf0:	4d 89 e7             	mov    %r12,%r15
   2edf3:	e9 d8 6d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2edf8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2edfc:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ee00:	89 ca                	mov    %ecx,%edx
   2ee02:	e8 c9 9b fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2ee07:	48 8d 35 4b a7 0a 00 	lea    0xaa74b(%rip),%rsi        # d9559 <_IO_stdin_used+0x559>
   2ee0e:	4c 89 ef             	mov    %r13,%rdi
   2ee11:	48 89 c2             	mov    %rax,%rdx
   2ee14:	31 c0                	xor    %eax,%eax
   2ee16:	e8 25 55 00 00       	call   34340 <JS_ThrowTypeError>
   2ee1b:	e9 b0 6d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ee20:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee24:	4c 89 d6             	mov    %r10,%rsi
   2ee27:	4c 89 da             	mov    %r11,%rdx
   2ee2a:	e8 91 fb fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2ee2f:	e9 5b bb ff ff       	jmp    2a98f <JS_CallInternal+0x54ff>
   2ee34:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee38:	48 89 ce             	mov    %rcx,%rsi
   2ee3b:	e8 80 fb fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2ee40:	e9 de 89 ff ff       	jmp    27823 <JS_CallInternal+0x2393>
   2ee45:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee49:	4c 89 ca             	mov    %r9,%rdx
   2ee4c:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   2ee52:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2ee59:	e8 62 fb fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2ee5e:	8b 85 10 fe ff ff    	mov    -0x1f0(%rbp),%eax
   2ee64:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2ee6b:	e9 92 ad ff ff       	jmp    29c02 <JS_CallInternal+0x4772>
   2ee70:	8b 02                	mov    (%rdx),%eax
   2ee72:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ee77:	0f 85 a9 be ff ff    	jne    2ad26 <JS_CallInternal+0x5896>
   2ee7d:	48 8d 0d c0 a2 0a 00 	lea    0xaa2c0(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   2ee84:	4c 89 ef             	mov    %r13,%rdi
   2ee87:	31 c0                	xor    %eax,%eax
   2ee89:	48 8d 15 78 df 0a 00 	lea    0xadf78(%rip),%rdx        # dce08 <_IO_stdin_used+0x3e08>
   2ee90:	e8 bb 56 00 00       	call   34550 <__JS_ThrowTypeErrorAtom>
   2ee95:	e9 f0 f0 ff ff       	jmp    2df8a <JS_CallInternal+0x8afa>
   2ee9a:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2eea0:	7e 21                	jle    2eec3 <JS_CallInternal+0x9a33>
   2eea2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eea6:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2eead:	48 8b 34 d0          	mov    (%rax,%rdx,8),%rsi
   2eeb1:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2eeb4:	83 e8 01             	sub    $0x1,%eax
   2eeb7:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2eeba:	85 c0                	test   %eax,%eax
   2eebc:	7f 05                	jg     2eec3 <JS_CallInternal+0x9a33>
   2eebe:	e8 dd 7a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2eec3:	48 8d 35 06 de 0a 00 	lea    0xade06(%rip),%rsi        # dccd0 <_IO_stdin_used+0x3cd0>
   2eeca:	4c 89 ef             	mov    %r13,%rdi
   2eecd:	31 c0                	xor    %eax,%eax
   2eecf:	e8 6c 54 00 00       	call   34340 <JS_ThrowTypeError>
   2eed4:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2eedb:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2eee2:	00 
   2eee3:	e9 97 cb ff ff       	jmp    2ba7f <JS_CallInternal+0x65ef>
   2eee8:	48 85 c0             	test   %rax,%rax
   2eeeb:	0f 84 bf 0f 00 00    	je     2feb0 <JS_CallInternal+0xaa20>
   2eef1:	0f b7 48 12          	movzwl 0x12(%rax),%ecx
   2eef5:	66 89 8d 00 fe ff ff 	mov    %cx,-0x200(%rbp)
   2eefc:	66 83 f9 01          	cmp    $0x1,%cx
   2ef00:	0f 85 e9 d4 ff ff    	jne    2c3ef <JS_CallInternal+0x6f5f>
   2ef06:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2ef0a:	0f 85 d1 75 ff ff    	jne    264e1 <JS_CallInternal+0x1051>
   2ef10:	48 3b 70 18          	cmp    0x18(%rax),%rsi
   2ef14:	0f 85 c7 75 ff ff    	jne    264e1 <JS_CallInternal+0x1051>
   2ef1a:	41 8b 52 10          	mov    0x10(%r10),%edx
   2ef1e:	48 c1 e2 04          	shl    $0x4,%rdx
   2ef22:	48 03 50 20          	add    0x20(%rax),%rdx
   2ef26:	48 8b 0a             	mov    (%rdx),%rcx
   2ef29:	48 8b 52 08          	mov    0x8(%rdx),%rdx
   2ef2d:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ef30:	0f 86 7d f3 ff ff    	jbe    2e2b3 <JS_CallInternal+0x8e23>
   2ef36:	e9 74 f3 ff ff       	jmp    2e2af <JS_CallInternal+0x8e1f>
   2ef3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2ef40:	4d 89 e7             	mov    %r12,%r15
   2ef43:	4c 89 db             	mov    %r11,%rbx
   2ef46:	e9 85 6c ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ef4b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ef4f:	48 89 ce             	mov    %rcx,%rsi
   2ef52:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2ef59:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2ef60:	e8 5b fa fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2ef65:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   2ef6c:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2ef73:	e9 fe b9 ff ff       	jmp    2a976 <JS_CallInternal+0x54e6>
   2ef78:	0f 85 2c 13 00 00    	jne    302aa <JS_CallInternal+0xae1a>
   2ef7e:	49 8b 45 10          	mov    0x10(%r13),%rax
   2ef82:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2ef89:	48 85 c0             	test   %rax,%rax
   2ef8c:	0f 84 7c 87 ff ff    	je     2770e <JS_CallInternal+0x227e>
   2ef92:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2ef96:	0f 84 72 87 ff ff    	je     2770e <JS_CallInternal+0x227e>
   2ef9c:	89 ce                	mov    %ecx,%esi
   2ef9e:	4c 89 ef             	mov    %r13,%rdi
   2efa1:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2efa7:	4d 89 e7             	mov    %r12,%r15
   2efaa:	e8 b1 73 00 00       	call   36360 <JS_ThrowReferenceErrorNotDefined>
   2efaf:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2efb5:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2efbb:	0f 8e 0f 6c ff ff    	jle    25bd0 <JS_CallInternal+0x740>
   2efc1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2efc5:	89 ce                	mov    %ecx,%esi
   2efc7:	e8 24 bc fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2efcc:	e9 ff 6b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2efd1:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2efd8:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2efdf:	00 
   2efe0:	e9 8b ba ff ff       	jmp    2aa70 <JS_CallInternal+0x55e0>
   2efe5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2efe9:	4c 89 fe             	mov    %r15,%rsi
   2efec:	4c 89 c2             	mov    %r8,%rdx
   2efef:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2eff5:	e8 c6 f9 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2effa:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2f000:	e9 16 ac ff ff       	jmp    29c1b <JS_CallInternal+0x478b>
   2f005:	4d 89 e7             	mov    %r12,%r15
   2f008:	e9 9c b5 ff ff       	jmp    2a5a9 <JS_CallInternal+0x5119>
   2f00d:	39 c1                	cmp    %eax,%ecx
   2f00f:	0f 85 a0 db ff ff    	jne    2cbb5 <JS_CallInternal+0x7725>
   2f015:	0f b6 4a 10          	movzbl 0x10(%rdx),%ecx
   2f019:	f7 d1                	not    %ecx
   2f01b:	83 e1 12             	and    $0x12,%ecx
   2f01e:	0f 85 91 db ff ff    	jne    2cbb5 <JS_CallInternal+0x7725>
   2f024:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
   2f028:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2f02c:	48 85 c9             	test   %rcx,%rcx
   2f02f:	74 0a                	je     2f03b <JS_CallInternal+0x9bab>
   2f031:	f6 41 10 01          	testb  $0x1,0x10(%rcx)
   2f035:	0f 84 7a db ff ff    	je     2cbb5 <JS_CallInternal+0x7725>
   2f03b:	48 8b 72 20          	mov    0x20(%rdx),%rsi
   2f03f:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   2f043:	0f 85 6c db ff ff    	jne    2cbb5 <JS_CallInternal+0x7725>
   2f049:	8d 48 01             	lea    0x1(%rax),%ecx
   2f04c:	39 4a 28             	cmp    %ecx,0x28(%rdx)
   2f04f:	0f 82 60 db ff ff    	jb     2cbb5 <JS_CallInternal+0x7725>
   2f055:	39 0e                	cmp    %ecx,(%rsi)
   2f057:	73 1c                	jae    2f075 <JS_CallInternal+0x9be5>
   2f059:	44 8b 47 18          	mov    0x18(%rdi),%r8d
   2f05d:	42 f6 44 87 3f 08    	testb  $0x8,0x3f(%rdi,%r8,4)
   2f063:	0f 84 4c db ff ff    	je     2cbb5 <JS_CallInternal+0x7725>
   2f069:	89 cf                	mov    %ecx,%edi
   2f06b:	45 31 db             	xor    %r11d,%r11d
   2f06e:	48 89 3e             	mov    %rdi,(%rsi)
   2f071:	4c 89 5e 08          	mov    %r11,0x8(%rsi)
   2f075:	89 4a 38             	mov    %ecx,0x38(%rdx)
   2f078:	89 c0                	mov    %eax,%eax
   2f07a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2f07f:	48 c1 e0 04          	shl    $0x4,%rax
   2f083:	48 03 42 30          	add    0x30(%rdx),%rax
   2f087:	0f 11 00             	movups %xmm0,(%rax)
   2f08a:	e9 94 87 ff ff       	jmp    27823 <JS_CallInternal+0x2393>
   2f08f:	90                   	nop
   2f090:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f094:	48 89 c2             	mov    %rax,%rdx
   2f097:	48 89 ce             	mov    %rcx,%rsi
   2f09a:	e8 21 f9 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f09f:	e9 a0 87 ff ff       	jmp    27844 <JS_CallInternal+0x23b4>
   2f0a4:	4d 89 e7             	mov    %r12,%r15
   2f0a7:	e9 24 6b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f0ac:	09 ca                	or     %ecx,%edx
   2f0ae:	0f 89 61 c2 ff ff    	jns    2b315 <JS_CallInternal+0x5e85>
   2f0b4:	f2 0f 10 05 e4 79 0b 	movsd  0xb79e4(%rip),%xmm0        # e6aa0 <typed_array_size_log2+0x28>
   2f0bb:	00 
   2f0bc:	e9 d8 f8 ff ff       	jmp    2e999 <JS_CallInternal+0x9509>
   2f0c1:	66 83 bd 00 fe ff ff 	cmpw   $0x1,-0x200(%rbp)
   2f0c8:	01 
   2f0c9:	0f 85 95 74 ff ff    	jne    26564 <JS_CallInternal+0x10d4>
   2f0cf:	41 f6 43 10 08       	testb  $0x8,0x10(%r11)
   2f0d4:	0f 85 8a 74 ff ff    	jne    26564 <JS_CallInternal+0x10d4>
   2f0da:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2f0df:	0f 85 7f 74 ff ff    	jne    26564 <JS_CallInternal+0x10d4>
   2f0e5:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2f0e9:	0f 85 75 74 ff ff    	jne    26564 <JS_CallInternal+0x10d4>
   2f0ef:	80 79 10 00          	cmpb   $0x0,0x10(%rcx)
   2f0f3:	0f 84 6b 74 ff ff    	je     26564 <JS_CallInternal+0x10d4>
   2f0f9:	41 80 78 10 00       	cmpb   $0x0,0x10(%r8)
   2f0fe:	0f 84 60 74 ff ff    	je     26564 <JS_CallInternal+0x10d4>
   2f104:	49 8b 42 08          	mov    0x8(%r10),%rax
   2f108:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2f10d:	48 c1 fe 04          	sar    $0x4,%rsi
   2f111:	49 8b 0a             	mov    (%r10),%rcx
   2f114:	48 8b bd 10 fe ff ff 	mov    -0x1f0(%rbp),%rdi
   2f11b:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2f120:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f124:	66 0f 6c c7          	punpcklqdq %xmm7,%xmm0
   2f128:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   2f12d:	41 89 72 10          	mov    %esi,0x10(%r10)
   2f131:	41 0f 11 02          	movups %xmm0,(%r10)
   2f135:	48 85 c0             	test   %rax,%rax
   2f138:	74 28                	je     2f162 <JS_CallInternal+0x9cd2>
   2f13a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f13e:	48 89 c6             	mov    %rax,%rsi
   2f141:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2f148:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2f14f:	e8 fc 14 ff ff       	call   20650 <js_free_shape>
   2f154:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2f15b:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2f162:	48 85 c9             	test   %rcx,%rcx
   2f165:	0f 84 f9 73 ff ff    	je     26564 <JS_CallInternal+0x10d4>
   2f16b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f16f:	48 89 ce             	mov    %rcx,%rsi
   2f172:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2f179:	e8 d2 14 ff ff       	call   20650 <js_free_shape>
   2f17e:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2f185:	e9 da 73 ff ff       	jmp    26564 <JS_CallInternal+0x10d4>
   2f18a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2f190:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f194:	48 89 c2             	mov    %rax,%rdx
   2f197:	48 89 ce             	mov    %rcx,%rsi
   2f19a:	e8 21 f8 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f19f:	e9 87 c6 ff ff       	jmp    2b82b <JS_CallInternal+0x639b>
   2f1a4:	f2 0f 10 05 4c 02 0b 	movsd  0xb024c(%rip),%xmm0        # df3f8 <__PRETTY_FUNCTION__.0+0xb8>
   2f1ab:	00 
   2f1ac:	e9 22 d4 ff ff       	jmp    2c5d3 <JS_CallInternal+0x7143>
   2f1b1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f1b5:	48 89 c2             	mov    %rax,%rdx
   2f1b8:	48 89 ce             	mov    %rcx,%rsi
   2f1bb:	e8 00 f8 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f1c0:	e9 95 d4 ff ff       	jmp    2c65a <JS_CallInternal+0x71ca>
   2f1c5:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   2f1cb:	83 e8 02             	sub    $0x2,%eax
   2f1ce:	83 f8 01             	cmp    $0x1,%eax
   2f1d1:	0f 87 5e 0d 00 00    	ja     2ff35 <JS_CallInternal+0xaaa5>
   2f1d7:	49 8b 85 88 01 00 00 	mov    0x188(%r13),%rax
   2f1de:	49 8b 95 80 01 00 00 	mov    0x180(%r13),%rdx
   2f1e5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2f1e8:	0f 86 a0 8f ff ff    	jbe    2818e <JS_CallInternal+0x2cfe>
   2f1ee:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2f1f2:	e9 97 8f ff ff       	jmp    2818e <JS_CallInternal+0x2cfe>
   2f1f7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f1fb:	48 89 c2             	mov    %rax,%rdx
   2f1fe:	48 89 ce             	mov    %rcx,%rsi
   2f201:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2f208:	e8 b3 f7 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f20d:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2f214:	e9 1f a1 ff ff       	jmp    29338 <JS_CallInternal+0x3ea8>
   2f219:	0f 85 b1 69 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2f21f:	49 8b 45 10          	mov    0x10(%r13),%rax
   2f223:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2f22a:	48 85 c0             	test   %rax,%rax
   2f22d:	0f 84 38 c6 ff ff    	je     2b86b <JS_CallInternal+0x63db>
   2f233:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2f237:	0f 84 2e c6 ff ff    	je     2b86b <JS_CallInternal+0x63db>
   2f23d:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   2f243:	4c 89 ef             	mov    %r13,%rdi
   2f246:	e8 15 71 00 00       	call   36360 <JS_ThrowReferenceErrorNotDefined>
   2f24b:	e9 80 69 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f250:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f254:	48 89 ca             	mov    %rcx,%rdx
   2f257:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f25d:	e8 5e f7 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f262:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2f268:	e9 5b c6 ff ff       	jmp    2b8c8 <JS_CallInternal+0x6438>
   2f26d:	48 89 f2             	mov    %rsi,%rdx
   2f270:	48 89 fe             	mov    %rdi,%rsi
   2f273:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f277:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2f27e:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f285:	e8 36 f7 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f28a:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2f291:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f298:	e9 3a d6 ff ff       	jmp    2c8d7 <JS_CallInternal+0x7447>
   2f29d:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2f2a4:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2f2ab:	83 fa f6             	cmp    $0xfffffff6,%edx
   2f2ae:	76 04                	jbe    2f2b4 <JS_CallInternal+0x9e24>
   2f2b0:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2f2b4:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2f2b8:	48 89 53 d8          	mov    %rdx,-0x28(%rbx)
   2f2bc:	e9 17 84 ff ff       	jmp    276d8 <JS_CallInternal+0x2248>
   2f2c1:	0f 85 09 69 ff ff    	jne    25bd0 <JS_CallInternal+0x740>
   2f2c7:	49 8b 45 10          	mov    0x10(%r13),%rax
   2f2cb:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2f2d2:	48 85 c0             	test   %rax,%rax
   2f2d5:	0f 84 25 05 00 00    	je     2f800 <JS_CallInternal+0xa370>
   2f2db:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2f2df:	0f 84 1b 05 00 00    	je     2f800 <JS_CallInternal+0xa370>
   2f2e5:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   2f2eb:	4c 89 ef             	mov    %r13,%rdi
   2f2ee:	e8 6d 70 00 00       	call   36360 <JS_ThrowReferenceErrorNotDefined>
   2f2f3:	e9 d8 68 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f2f8:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2f2ff:	4c 89 c6             	mov    %r8,%rsi
   2f302:	e8 b9 38 ff ff       	call   22bc0 <free_var_ref>
   2f307:	e9 2a 6b ff ff       	jmp    25e36 <JS_CallInternal+0x9a6>
   2f30c:	45 85 ff             	test   %r15d,%r15d
   2f30f:	0f 85 c1 f2 ff ff    	jne    2e5d6 <JS_CallInternal+0x9146>
   2f315:	e9 5b dc ff ff       	jmp    2cf75 <JS_CallInternal+0x7ae5>
   2f31a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2f320:	f2 0f 10 05 78 77 0b 	movsd  0xb7778(%rip),%xmm0        # e6aa0 <typed_array_size_log2+0x28>
   2f327:	00 
   2f328:	e9 a6 d2 ff ff       	jmp    2c5d3 <JS_CallInternal+0x7143>
   2f32d:	4d 89 e7             	mov    %r12,%r15
   2f330:	e9 9b 68 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f335:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f339:	48 89 c2             	mov    %rax,%rdx
   2f33c:	e8 7f f6 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f341:	e9 50 a6 ff ff       	jmp    29996 <JS_CallInternal+0x4506>
   2f346:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2f34a:	0f 86 2f e7 ff ff    	jbe    2da7f <JS_CallInternal+0x85ef>
   2f350:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2f353:	83 e8 01             	sub    $0x1,%eax
   2f356:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2f359:	85 c0                	test   %eax,%eax
   2f35b:	0f 8f 1e e7 ff ff    	jg     2da7f <JS_CallInternal+0x85ef>
   2f361:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f365:	48 89 ce             	mov    %rcx,%rsi
   2f368:	4c 89 d2             	mov    %r10,%rdx
   2f36b:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2f372:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2f379:	e8 42 f6 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f37e:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2f385:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2f38c:	e9 ee e6 ff ff       	jmp    2da7f <JS_CallInternal+0x85ef>
   2f391:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2f397:	e9 a5 e0 ff ff       	jmp    2d441 <JS_CallInternal+0x7fb1>
   2f39c:	48 8b 48 18          	mov    0x18(%rax),%rcx
   2f3a0:	49 89 c3             	mov    %rax,%r11
   2f3a3:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2f3aa:	e9 40 d0 ff ff       	jmp    2c3ef <JS_CallInternal+0x6f5f>
   2f3af:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f3b3:	48 89 c2             	mov    %rax,%rdx
   2f3b6:	48 89 ce             	mov    %rcx,%rsi
   2f3b9:	e8 02 f6 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f3be:	e9 4f d8 ff ff       	jmp    2cc12 <JS_CallInternal+0x7782>
   2f3c3:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2f3c9:	0f 8e f4 fa ff ff    	jle    2eec3 <JS_CallInternal+0x9a33>
   2f3cf:	31 c0                	xor    %eax,%eax
   2f3d1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f3d5:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2f3dc:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2f3e0:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2f3e3:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2f3e6:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2f3e9:	85 d2                	test   %edx,%edx
   2f3eb:	7f 13                	jg     2f400 <JS_CallInternal+0x9f70>
   2f3ed:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2f3f4:	e8 a7 75 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f3f9:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2f400:	48 85 c0             	test   %rax,%rax
   2f403:	0f 85 99 c7 ff ff    	jne    2bba2 <JS_CallInternal+0x6712>
   2f409:	e9 b5 fa ff ff       	jmp    2eec3 <JS_CallInternal+0x9a33>
   2f40e:	66 90                	xchg   %ax,%ax
   2f410:	48 63 b5 a8 fe ff ff 	movslq -0x158(%rbp),%rsi
   2f417:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f41b:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2f422:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f429:	48 c1 e6 04          	shl    $0x4,%rsi
   2f42d:	48 89 b5 10 fe ff ff 	mov    %rsi,-0x1f0(%rbp)
   2f434:	e8 47 6a fe ff       	call   15e80 <__js_malloc>
   2f439:	4c 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%r10
   2f440:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2f447:	48 89 c2             	mov    %rax,%rdx
   2f44a:	31 c0                	xor    %eax,%eax
   2f44c:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f453:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2f45a:	48 85 d2             	test   %rdx,%rdx
   2f45d:	0f 84 6f 0c 00 00    	je     300d2 <JS_CallInternal+0xac42>
   2f463:	4d 8b 4c 02 08       	mov    0x8(%r10,%rax,1),%r9
   2f468:	49 8b 3c 02          	mov    (%r10,%rax,1),%rdi
   2f46c:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2f470:	76 04                	jbe    2f476 <JS_CallInternal+0x9fe6>
   2f472:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f476:	48 89 3c 02          	mov    %rdi,(%rdx,%rax,1)
   2f47a:	4c 89 4c 02 08       	mov    %r9,0x8(%rdx,%rax,1)
   2f47f:	48 83 c0 10          	add    $0x10,%rax
   2f483:	48 39 c6             	cmp    %rax,%rsi
   2f486:	75 db                	jne    2f463 <JS_CallInternal+0x9fd3>
   2f488:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2f48e:	48 89 51 30          	mov    %rdx,0x30(%rcx)
   2f492:	89 41 38             	mov    %eax,0x38(%rcx)
   2f495:	48 89 0b             	mov    %rcx,(%rbx)
   2f498:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   2f49c:	e9 ed c4 ff ff       	jmp    2b98e <JS_CallInternal+0x64fe>
   2f4a1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f4a5:	89 f2                	mov    %esi,%edx
   2f4a7:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f4ab:	e8 20 95 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f4b0:	48 89 c2             	mov    %rax,%rdx
   2f4b3:	e9 45 c4 ff ff       	jmp    2b8fd <JS_CallInternal+0x646d>
   2f4b8:	0f be 4a 01          	movsbl 0x1(%rdx),%ecx
   2f4bc:	be 03 00 00 00       	mov    $0x3,%esi
   2f4c1:	e9 07 e2 ff ff       	jmp    2d6cd <JS_CallInternal+0x823d>
   2f4c6:	8b 09                	mov    (%rcx),%ecx
   2f4c8:	81 e1 ff ff ff 03    	and    $0x3ffffff,%ecx
   2f4ce:	0f 85 16 a8 ff ff    	jne    29cea <JS_CallInternal+0x485a>
   2f4d4:	31 c9                	xor    %ecx,%ecx
   2f4d6:	e9 25 a8 ff ff       	jmp    29d00 <JS_CallInternal+0x4870>
   2f4db:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f4e1:	0f 8f ce 08 00 00    	jg     2fdb5 <JS_CallInternal+0xa925>
   2f4e7:	45 31 ff             	xor    %r15d,%r15d
   2f4ea:	b8 03 00 00 00       	mov    $0x3,%eax
   2f4ef:	e9 2e 85 ff ff       	jmp    27a22 <JS_CallInternal+0x2592>
   2f4f4:	48 8d 35 45 d8 0a 00 	lea    0xad845(%rip),%rsi        # dcd40 <_IO_stdin_used+0x3d40>
   2f4fb:	4c 89 ef             	mov    %r13,%rdi
   2f4fe:	31 c0                	xor    %eax,%eax
   2f500:	4d 89 e7             	mov    %r12,%r15
   2f503:	e8 38 4e 00 00       	call   34340 <JS_ThrowTypeError>
   2f508:	e9 c3 66 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f50d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f511:	4c 89 d6             	mov    %r10,%rsi
   2f514:	4c 89 da             	mov    %r11,%rdx
   2f517:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f51d:	e8 9e f4 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f522:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2f528:	e9 3d d6 ff ff       	jmp    2cb6a <JS_CallInternal+0x76da>
   2f52d:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2f530:	0f 84 2f 0c 00 00    	je     30165 <JS_CallInternal+0xacd5>
   2f536:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2f53d:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2f541:	49 8b 31             	mov    (%r9),%rsi
   2f544:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2f548:	e9 92 eb ff ff       	jmp    2e0df <JS_CallInternal+0x8c4f>
   2f54d:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2f552:	0f 85 c9 70 ff ff    	jne    26621 <JS_CallInternal+0x1191>
   2f558:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2f55c:	0f 85 bf 70 ff ff    	jne    26621 <JS_CallInternal+0x1191>
   2f562:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   2f566:	0f 84 b5 70 ff ff    	je     26621 <JS_CallInternal+0x1191>
   2f56c:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2f570:	49 8b 02             	mov    (%r10),%rax
   2f573:	48 c1 fa 04          	sar    $0x4,%rdx
   2f577:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f57b:	49 89 3a             	mov    %rdi,(%r10)
   2f57e:	31 ff                	xor    %edi,%edi
   2f580:	49 89 7a 08          	mov    %rdi,0x8(%r10)
   2f584:	41 89 52 10          	mov    %edx,0x10(%r10)
   2f588:	48 85 f6             	test   %rsi,%rsi
   2f58b:	74 25                	je     2f5b2 <JS_CallInternal+0xa122>
   2f58d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f591:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2f598:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f59f:	e8 ac 10 ff ff       	call   20650 <js_free_shape>
   2f5a4:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2f5ab:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f5b2:	48 85 c0             	test   %rax,%rax
   2f5b5:	0f 84 66 70 ff ff    	je     26621 <JS_CallInternal+0x1191>
   2f5bb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f5bf:	48 89 c6             	mov    %rax,%rsi
   2f5c2:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f5c9:	e8 82 10 ff ff       	call   20650 <js_free_shape>
   2f5ce:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f5d5:	e9 47 70 ff ff       	jmp    26621 <JS_CallInternal+0x1191>
   2f5da:	49 8b 17             	mov    (%r15),%rdx
   2f5dd:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2f5e3:	31 c9                	xor    %ecx,%ecx
   2f5e5:	b8 06 00 00 00       	mov    $0x6,%eax
   2f5ea:	e9 e3 ab ff ff       	jmp    2a1d2 <JS_CallInternal+0x4d42>
   2f5ef:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2f5f5:	31 c9                	xor    %ecx,%ecx
   2f5f7:	b8 06 00 00 00       	mov    $0x6,%eax
   2f5fc:	e9 f2 ab ff ff       	jmp    2a1f3 <JS_CallInternal+0x4d63>
   2f601:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f605:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f609:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f60e:	31 c0                	xor    %eax,%eax
   2f610:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f614:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f61b:	00 
   2f61c:	0f 93 c0             	setae  %al
   2f61f:	48 83 eb 10          	sub    $0x10,%rbx
   2f623:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f627:	e9 82 ae ff ff       	jmp    2a4ae <JS_CallInternal+0x501e>
   2f62c:	48 89 03             	mov    %rax,(%rbx)
   2f62f:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2f633:	e9 47 c4 ff ff       	jmp    2ba7f <JS_CallInternal+0x65ef>
   2f638:	31 f6                	xor    %esi,%esi
   2f63a:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2f641:	00 
   2f642:	48 83 c3 10          	add    $0x10,%rbx
   2f646:	48 89 73 f0          	mov    %rsi,-0x10(%rbx)
   2f64a:	e9 46 c3 ff ff       	jmp    2b995 <JS_CallInternal+0x6505>
   2f64f:	48 89 f2             	mov    %rsi,%rdx
   2f652:	48 89 fe             	mov    %rdi,%rsi
   2f655:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f659:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2f660:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f667:	44 89 85 10 fe ff ff 	mov    %r8d,-0x1f0(%rbp)
   2f66e:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2f675:	e8 46 f3 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f67a:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2f681:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f688:	44 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8d
   2f68f:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2f696:	e9 ba dd ff ff       	jmp    2d455 <JS_CallInternal+0x7fc5>
   2f69b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f69f:	48 89 c2             	mov    %rax,%rdx
   2f6a2:	48 89 ce             	mov    %rcx,%rsi
   2f6a5:	e8 16 f3 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f6aa:	e9 d4 dd ff ff       	jmp    2d483 <JS_CallInternal+0x7ff3>
   2f6af:	48 8d 35 35 9e 0a 00 	lea    0xa9e35(%rip),%rsi        # d94eb <_IO_stdin_used+0x4eb>
   2f6b6:	4c 89 ef             	mov    %r13,%rdi
   2f6b9:	4d 89 e7             	mov    %r12,%r15
   2f6bc:	e8 7f 4c 00 00       	call   34340 <JS_ThrowTypeError>
   2f6c1:	e9 0a 65 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f6c6:	4d 89 e7             	mov    %r12,%r15
   2f6c9:	e9 02 65 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f6ce:	48 83 eb 10          	sub    $0x10,%rbx
   2f6d2:	4d 89 e7             	mov    %r12,%r15
   2f6d5:	e9 f6 64 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f6da:	48 8d 35 a6 9e 0a 00 	lea    0xa9ea6(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2f6e1:	4c 89 ef             	mov    %r13,%rdi
   2f6e4:	31 c0                	xor    %eax,%eax
   2f6e6:	4d 89 e7             	mov    %r12,%r15
   2f6e9:	e8 52 4c 00 00       	call   34340 <JS_ThrowTypeError>
   2f6ee:	e9 dd 64 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f6f3:	4d 89 e7             	mov    %r12,%r15
   2f6f6:	e9 d5 64 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f6fb:	4d 89 e7             	mov    %r12,%r15
   2f6fe:	e9 cd 64 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f703:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2f708:	83 f8 08             	cmp    $0x8,%eax
   2f70b:	0f 84 f3 f1 ff ff    	je     2e904 <JS_CallInternal+0x9474>
   2f711:	85 c0                	test   %eax,%eax
   2f713:	0f 85 cc bd ff ff    	jne    2b4e5 <JS_CallInternal+0x6055>
   2f719:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f71d:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2f721:	e9 e3 f1 ff ff       	jmp    2e909 <JS_CallInternal+0x9479>
   2f726:	48 8d 35 bb d6 0a 00 	lea    0xad6bb(%rip),%rsi        # dcde8 <_IO_stdin_used+0x3de8>
   2f72d:	4c 89 ef             	mov    %r13,%rdi
   2f730:	31 c0                	xor    %eax,%eax
   2f732:	4d 89 e7             	mov    %r12,%r15
   2f735:	e8 06 4c 00 00       	call   34340 <JS_ThrowTypeError>
   2f73a:	e9 91 64 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f73f:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2f746:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f74a:	48 89 de             	mov    %rbx,%rsi
   2f74d:	e8 6e f2 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f752:	e9 79 ae ff ff       	jmp    2a5d0 <JS_CallInternal+0x5140>
   2f757:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2f75b:	83 f8 01             	cmp    $0x1,%eax
   2f75e:	0f 86 6d 0b 00 00    	jbe    302d1 <JS_CallInternal+0xae41>
   2f764:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2f768:	0f 85 b6 d9 ff ff    	jne    2d124 <JS_CallInternal+0x7c94>
   2f76e:	4c 39 c7             	cmp    %r8,%rdi
   2f771:	48 89 fe             	mov    %rdi,%rsi
   2f774:	4c 89 ef             	mov    %r13,%rdi
   2f777:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2f77e:	0f 94 c1             	sete   %cl
   2f781:	0f b6 c9             	movzbl %cl,%ecx
   2f784:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2f78a:	e8 b1 f3 fe ff       	call   1eb40 <JS_FreeValue>
   2f78f:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2f796:	e9 8d f3 ff ff       	jmp    2eb28 <JS_CallInternal+0x9698>
   2f79b:	45 85 ff             	test   %r15d,%r15d
   2f79e:	0f 85 08 02 00 00    	jne    2f9ac <JS_CallInternal+0xa51c>
   2f7a4:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f7a8:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2f7ad:	31 c9                	xor    %ecx,%ecx
   2f7af:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2f7b4:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f7b8:	0f 9b c1             	setnp  %cl
   2f7bb:	41 0f 45 cf          	cmovne %r15d,%ecx
   2f7bf:	e9 c7 9e ff ff       	jmp    2968b <JS_CallInternal+0x41fb>
   2f7c4:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f7c9:	83 f9 08             	cmp    $0x8,%ecx
   2f7cc:	0f 84 85 01 00 00    	je     2f957 <JS_CallInternal+0xa4c7>
   2f7d2:	85 c9                	test   %ecx,%ecx
   2f7d4:	0f 85 7d ea ff ff    	jne    2e257 <JS_CallInternal+0x8dc7>
   2f7da:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f7de:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f7e2:	31 c0                	xor    %eax,%eax
   2f7e4:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f7e8:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f7ef:	00 
   2f7f0:	0f 97 c0             	seta   %al
   2f7f3:	48 83 eb 10          	sub    $0x10,%rbx
   2f7f7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f7fb:	e9 f8 a8 ff ff       	jmp    2a0f8 <JS_CallInternal+0x4c68>
   2f800:	b8 03 00 00 00       	mov    $0x3,%eax
   2f805:	31 c9                	xor    %ecx,%ecx
   2f807:	e9 44 bf ff ff       	jmp    2b750 <JS_CallInternal+0x62c0>
   2f80c:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2f810:	83 f8 01             	cmp    $0x1,%eax
   2f813:	0f 86 eb 0a 00 00    	jbe    30304 <JS_CallInternal+0xae74>
   2f819:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2f81d:	0f 85 01 d9 ff ff    	jne    2d124 <JS_CallInternal+0x7c94>
   2f823:	41 0f b6 48 11       	movzbl 0x11(%r8),%ecx
   2f828:	83 e1 01             	and    $0x1,%ecx
   2f82b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2f831:	e9 f2 f2 ff ff       	jmp    2eb28 <JS_CallInternal+0x9698>
   2f836:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f83a:	89 c2                	mov    %eax,%edx
   2f83c:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f840:	e8 8b 91 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f845:	48 89 c2             	mov    %rax,%rdx
   2f848:	e9 ec f3 ff ff       	jmp    2ec39 <JS_CallInternal+0x97a9>
   2f84d:	4d 89 fb             	mov    %r15,%r11
   2f850:	49 89 cf             	mov    %rcx,%r15
   2f853:	48 89 d7             	mov    %rdx,%rdi
   2f856:	45 31 c0             	xor    %r8d,%r8d
   2f859:	4c 89 d2             	mov    %r10,%rdx
   2f85c:	4c 89 d9             	mov    %r11,%rcx
   2f85f:	4c 89 fe             	mov    %r15,%rsi
   2f862:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2f869:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2f870:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2f877:	e8 34 c5 fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2f87c:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2f883:	4c 89 fa             	mov    %r15,%rdx
   2f886:	4c 89 ef             	mov    %r13,%rdi
   2f889:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f88f:	e8 ac f2 fe ff       	call   1eb40 <JS_FreeValue>
   2f894:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2f89b:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2f8a2:	e9 86 eb ff ff       	jmp    2e42d <JS_CallInternal+0x8f9d>
   2f8a7:	31 c0                	xor    %eax,%eax
   2f8a9:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2f8ad:	75 08                	jne    2f8b7 <JS_CallInternal+0xa427>
   2f8af:	31 c0                	xor    %eax,%eax
   2f8b1:	4c 39 d2             	cmp    %r10,%rdx
   2f8b4:	0f 94 c0             	sete   %al
   2f8b7:	48 89 d6             	mov    %rdx,%rsi
   2f8ba:	4c 89 ef             	mov    %r13,%rdi
   2f8bd:	48 89 ca             	mov    %rcx,%rdx
   2f8c0:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2f8c7:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f8cd:	e8 6e f2 fe ff       	call   1eb40 <JS_FreeValue>
   2f8d2:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2f8d9:	4d 89 fb             	mov    %r15,%r11
   2f8dc:	e9 4c eb ff ff       	jmp    2e42d <JS_CallInternal+0x8f9d>
   2f8e1:	45 85 ff             	test   %r15d,%r15d
   2f8e4:	0f 85 86 00 00 00    	jne    2f970 <JS_CallInternal+0xa4e0>
   2f8ea:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2f8ef:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f8f3:	31 c0                	xor    %eax,%eax
   2f8f5:	ba 01 00 00 00       	mov    $0x1,%edx
   2f8fa:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2f8ff:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f903:	0f 9a c0             	setp   %al
   2f906:	48 0f 45 c2          	cmovne %rdx,%rax
   2f90a:	e9 7a 9c ff ff       	jmp    29589 <JS_CallInternal+0x40f9>
   2f90f:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f914:	83 f9 08             	cmp    $0x8,%ecx
   2f917:	74 50                	je     2f969 <JS_CallInternal+0xa4d9>
   2f919:	85 c9                	test   %ecx,%ecx
   2f91b:	0f 85 40 eb ff ff    	jne    2e461 <JS_CallInternal+0x8fd1>
   2f921:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f925:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f929:	31 c0                	xor    %eax,%eax
   2f92b:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f92f:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f936:	00 
   2f937:	0f 93 c0             	setae  %al
   2f93a:	48 83 eb 10          	sub    $0x10,%rbx
   2f93e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f942:	e9 66 a7 ff ff       	jmp    2a0ad <JS_CallInternal+0x4c1d>
   2f947:	4d 89 e7             	mov    %r12,%r15
   2f94a:	e9 81 62 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2f94f:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f953:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f957:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f95c:	e9 81 fe ff ff       	jmp    2f7e2 <JS_CallInternal+0xa352>
   2f961:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f965:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f969:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f96e:	eb b9                	jmp    2f929 <JS_CallInternal+0xa499>
   2f970:	41 83 ff 08          	cmp    $0x8,%r15d
   2f974:	0f 85 d8 07 00 00    	jne    30152 <JS_CallInternal+0xacc2>
   2f97a:	66 48 0f 6e f2       	movq   %rdx,%xmm6
   2f97f:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2f984:	31 c0                	xor    %eax,%eax
   2f986:	ba 01 00 00 00       	mov    $0x1,%edx
   2f98b:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f98f:	0f 9a c0             	setp   %al
   2f992:	48 0f 45 c2          	cmovne %rdx,%rax
   2f996:	e9 ee 9b ff ff       	jmp    29589 <JS_CallInternal+0x40f9>
   2f99b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f99f:	48 89 c2             	mov    %rax,%rdx
   2f9a2:	e8 19 f0 fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2f9a7:	e9 fd cb ff ff       	jmp    2c5a9 <JS_CallInternal+0x7119>
   2f9ac:	41 83 ff 08          	cmp    $0x8,%r15d
   2f9b0:	0f 85 6e d7 ff ff    	jne    2d124 <JS_CallInternal+0x7c94>
   2f9b6:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f9bb:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2f9c0:	31 c9                	xor    %ecx,%ecx
   2f9c2:	b8 00 00 00 00       	mov    $0x0,%eax
   2f9c7:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f9cb:	0f 9b c1             	setnp  %cl
   2f9ce:	0f 45 c8             	cmovne %eax,%ecx
   2f9d1:	e9 b5 9c ff ff       	jmp    2968b <JS_CallInternal+0x41fb>
   2f9d6:	83 f9 08             	cmp    $0x8,%ecx
   2f9d9:	0f 84 63 06 00 00    	je     30042 <JS_CallInternal+0xabb2>
   2f9df:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2f9e6:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2f9ea:	49 8b 31             	mov    (%r9),%rsi
   2f9ed:	e9 ed e6 ff ff       	jmp    2e0df <JS_CallInternal+0x8c4f>
   2f9f2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f9f6:	4c 89 d6             	mov    %r10,%rsi
   2f9f9:	4c 89 c2             	mov    %r8,%rdx
   2f9fc:	e8 bf ef fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2fa01:	e9 55 d9 ff ff       	jmp    2d35b <JS_CallInternal+0x7ecb>
   2fa06:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2fa09:	83 f8 01             	cmp    $0x1,%eax
   2fa0c:	0f 86 2c 08 00 00    	jbe    3023e <JS_CallInternal+0xadae>
   2fa12:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2fa15:	0f 85 35 d7 ff ff    	jne    2d150 <JS_CallInternal+0x7cc0>
   2fa1b:	45 0f b6 78 11       	movzbl 0x11(%r8),%r15d
   2fa20:	4c 89 c6             	mov    %r8,%rsi
   2fa23:	48 89 ca             	mov    %rcx,%rdx
   2fa26:	4c 89 ef             	mov    %r13,%rdi
   2fa29:	41 83 e7 01          	and    $0x1,%r15d
   2fa2d:	e8 0e f1 fe ff       	call   1eb40 <JS_FreeValue>
   2fa32:	e9 fb 9b ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   2fa37:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2fa3a:	83 f8 01             	cmp    $0x1,%eax
   2fa3d:	0f 86 57 06 00 00    	jbe    3009a <JS_CallInternal+0xac0a>
   2fa43:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2fa46:	0f 85 04 d7 ff ff    	jne    2d150 <JS_CallInternal+0x7cc0>
   2fa4c:	4c 39 c7             	cmp    %r8,%rdi
   2fa4f:	48 89 fe             	mov    %rdi,%rsi
   2fa52:	4c 89 ef             	mov    %r13,%rdi
   2fa55:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2fa5c:	41 0f 94 c7          	sete   %r15b
   2fa60:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2fa67:	e8 d4 f0 fe ff       	call   1eb40 <JS_FreeValue>
   2fa6c:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2fa73:	4c 89 ef             	mov    %r13,%rdi
   2fa76:	45 0f b6 ff          	movzbl %r15b,%r15d
   2fa7a:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2fa81:	4c 89 c6             	mov    %r8,%rsi
   2fa84:	4c 89 ca             	mov    %r9,%rdx
   2fa87:	e8 b4 f0 fe ff       	call   1eb40 <JS_FreeValue>
   2fa8c:	e9 a1 9b ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   2fa91:	4d 39 02             	cmp    %r8,(%r10)
   2fa94:	0f 85 20 c9 ff ff    	jne    2c3ba <JS_CallInternal+0x6f2a>
   2fa9a:	45 8b 4a 10          	mov    0x10(%r10),%r9d
   2fa9e:	41 8b 78 18          	mov    0x18(%r8),%edi
   2faa2:	4a 8d 34 cd 00 00 00 	lea    0x0(,%r9,8),%rsi
   2faa9:	00 
   2faaa:	48 8d 74 be 3c       	lea    0x3c(%rsi,%rdi,4),%rsi
   2faaf:	41 0f b6 74 30 03    	movzbl 0x3(%r8,%rsi,1),%esi
   2fab5:	40 c0 ee 02          	shr    $0x2,%sil
   2fab9:	83 e6 3a             	and    $0x3a,%esi
   2fabc:	40 80 fe 02          	cmp    $0x2,%sil
   2fac0:	0f 85 f4 c8 ff ff    	jne    2c3ba <JS_CallInternal+0x6f2a>
   2fac6:	4c 89 ce             	mov    %r9,%rsi
   2fac9:	48 c1 e6 04          	shl    $0x4,%rsi
   2facd:	48 03 70 20          	add    0x20(%rax),%rsi
   2fad1:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   2fad5:	0f 85 df c8 ff ff    	jne    2c3ba <JS_CallInternal+0x6f2a>
   2fadb:	8b 3e                	mov    (%rsi),%edi
   2fadd:	81 ff ff ff ff 7f    	cmp    $0x7fffffff,%edi
   2fae3:	0f 84 d1 c8 ff ff    	je     2c3ba <JS_CallInternal+0x6f2a>
   2fae9:	8d 57 01             	lea    0x1(%rdi),%edx
   2faec:	31 ff                	xor    %edi,%edi
   2faee:	48 83 eb 10          	sub    $0x10,%rbx
   2faf2:	48 89 16             	mov    %rdx,(%rsi)
   2faf5:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2fafc:	48 89 7e 08          	mov    %rdi,0x8(%rsi)
   2fb00:	48 89 c6             	mov    %rax,%rsi
   2fb03:	4c 89 ef             	mov    %r13,%rdi
   2fb06:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2fb0d:	e8 2e f0 fe ff       	call   1eb40 <JS_FreeValue>
   2fb12:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2fb19:	0f b6 41 05          	movzbl 0x5(%rcx),%eax
   2fb1d:	4c 8d 61 06          	lea    0x6(%rcx),%r12
   2fb21:	49 89 c2             	mov    %rax,%r10
   2fb24:	49 8b 0c c6          	mov    (%r14,%rax,8),%rcx
   2fb28:	e9 83 5c ff ff       	jmp    257b0 <JS_CallInternal+0x320>
   2fb2d:	4d 89 e7             	mov    %r12,%r15
   2fb30:	e9 9b 60 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fb35:	48 89 f2             	mov    %rsi,%rdx
   2fb38:	48 89 fe             	mov    %rdi,%rsi
   2fb3b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fb3f:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2fb46:	e8 75 ee fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2fb4b:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2fb52:	e9 0f d4 ff ff       	jmp    2cf66 <JS_CallInternal+0x7ad6>
   2fb57:	4d 89 c3             	mov    %r8,%r11
   2fb5a:	49 89 d7             	mov    %rdx,%r15
   2fb5d:	45 31 c0             	xor    %r8d,%r8d
   2fb60:	4c 89 d2             	mov    %r10,%rdx
   2fb63:	4c 89 d9             	mov    %r11,%rcx
   2fb66:	4c 89 fe             	mov    %r15,%rsi
   2fb69:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2fb70:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2fb77:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2fb7e:	e8 2d c2 fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2fb83:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2fb8a:	4c 89 fa             	mov    %r15,%rdx
   2fb8d:	4c 89 ef             	mov    %r13,%rdi
   2fb90:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2fb96:	e8 a5 ef fe ff       	call   1eb40 <JS_FreeValue>
   2fb9b:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2fba2:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2fba9:	4c 89 ef             	mov    %r13,%rdi
   2fbac:	4c 89 d6             	mov    %r10,%rsi
   2fbaf:	4c 89 da             	mov    %r11,%rdx
   2fbb2:	e8 89 ef fe ff       	call   1eb40 <JS_FreeValue>
   2fbb7:	4c 63 bd 30 fe ff ff 	movslq -0x1d0(%rbp),%r15
   2fbbe:	e9 1b 9a ff ff       	jmp    295de <JS_CallInternal+0x414e>
   2fbc3:	45 31 ff             	xor    %r15d,%r15d
   2fbc6:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2fbca:	75 0a                	jne    2fbd6 <JS_CallInternal+0xa746>
   2fbcc:	45 31 ff             	xor    %r15d,%r15d
   2fbcf:	4c 39 d7             	cmp    %r10,%rdi
   2fbd2:	41 0f 94 c7          	sete   %r15b
   2fbd6:	48 89 fe             	mov    %rdi,%rsi
   2fbd9:	4c 89 ef             	mov    %r13,%rdi
   2fbdc:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2fbe3:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2fbea:	e8 51 ef fe ff       	call   1eb40 <JS_FreeValue>
   2fbef:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2fbf6:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   2fbfd:	4c 89 ef             	mov    %r13,%rdi
   2fc00:	4c 89 d6             	mov    %r10,%rsi
   2fc03:	4c 89 da             	mov    %r11,%rdx
   2fc06:	e8 35 ef fe ff       	call   1eb40 <JS_FreeValue>
   2fc0b:	e9 ce 99 ff ff       	jmp    295de <JS_CallInternal+0x414e>
   2fc10:	45 85 c0             	test   %r8d,%r8d
   2fc13:	0f 85 6f 01 00 00    	jne    2fd88 <JS_CallInternal+0xa8f8>
   2fc19:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fc1d:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2fc22:	45 31 ff             	xor    %r15d,%r15d
   2fc25:	b8 00 00 00 00       	mov    $0x0,%eax
   2fc2a:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2fc2f:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2fc33:	41 0f 9b c7          	setnp  %r15b
   2fc37:	4c 0f 45 f8          	cmovne %rax,%r15
   2fc3b:	e9 9e 99 ff ff       	jmp    295de <JS_CallInternal+0x414e>
   2fc40:	8b 4a 01             	mov    0x1(%rdx),%ecx
   2fc43:	be 06 00 00 00       	mov    $0x6,%esi
   2fc48:	e9 80 da ff ff       	jmp    2d6cd <JS_CallInternal+0x823d>
   2fc4d:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2fc52:	83 f9 08             	cmp    $0x8,%ecx
   2fc55:	74 36                	je     2fc8d <JS_CallInternal+0xa7fd>
   2fc57:	85 c9                	test   %ecx,%ecx
   2fc59:	0f 85 f8 ee ff ff    	jne    2eb57 <JS_CallInternal+0x96c7>
   2fc5f:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fc63:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2fc67:	31 c0                	xor    %eax,%eax
   2fc69:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2fc6d:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2fc74:	00 
   2fc75:	0f 97 c0             	seta   %al
   2fc78:	48 83 eb 10          	sub    $0x10,%rbx
   2fc7c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fc80:	e9 74 a8 ff ff       	jmp    2a4f9 <JS_CallInternal+0x5069>
   2fc85:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fc89:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2fc8d:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2fc92:	eb d3                	jmp    2fc67 <JS_CallInternal+0xa7d7>
   2fc94:	4d 89 e7             	mov    %r12,%r15
   2fc97:	e9 34 5f ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fc9c:	4d 89 e7             	mov    %r12,%r15
   2fc9f:	e9 2c 5f ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fca4:	4d 89 e7             	mov    %r12,%r15
   2fca7:	e9 24 5f ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fcac:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2fcb3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fcb7:	48 89 ce             	mov    %rcx,%rsi
   2fcba:	e8 01 ed fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2fcbf:	e9 ed e2 ff ff       	jmp    2dfb1 <JS_CallInternal+0x8b21>
   2fcc4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fcc8:	89 ca                	mov    %ecx,%edx
   2fcca:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fcce:	e8 fd 8c fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2fcd3:	48 89 c2             	mov    %rax,%rdx
   2fcd6:	e9 f9 e2 ff ff       	jmp    2dfd4 <JS_CallInternal+0x8b44>
   2fcdb:	4d 89 e7             	mov    %r12,%r15
   2fcde:	e9 ed 5e ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fce3:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2fce8:	83 f9 08             	cmp    $0x8,%ecx
   2fceb:	0f 84 18 f9 ff ff    	je     2f609 <JS_CallInternal+0xa179>
   2fcf1:	85 c9                	test   %ecx,%ecx
   2fcf3:	0f 85 64 ed ff ff    	jne    2ea5d <JS_CallInternal+0x95cd>
   2fcf9:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fcfd:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2fd01:	e9 08 f9 ff ff       	jmp    2f60e <JS_CallInternal+0xa17e>
   2fd06:	85 c9                	test   %ecx,%ecx
   2fd08:	0f 85 cd 00 00 00    	jne    2fddb <JS_CallInternal+0xa94b>
   2fd0e:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fd12:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2fd17:	45 31 ff             	xor    %r15d,%r15d
   2fd1a:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2fd1f:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2fd23:	41 0f 9b c7          	setnp  %r15b
   2fd27:	44 0f 45 f9          	cmovne %ecx,%r15d
   2fd2b:	e9 02 99 ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   2fd30:	4d 89 e7             	mov    %r12,%r15
   2fd33:	e9 98 5e ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fd38:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fd3c:	4c 89 d6             	mov    %r10,%rsi
   2fd3f:	4c 89 fa             	mov    %r15,%rdx
   2fd42:	e8 79 ec fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2fd47:	e9 a8 d5 ff ff       	jmp    2d2f4 <JS_CallInternal+0x7e64>
   2fd4c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fd50:	4c 89 c6             	mov    %r8,%rsi
   2fd53:	4c 89 e2             	mov    %r12,%rdx
   2fd56:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2fd5c:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   2fd63:	e8 58 ec fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2fd68:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2fd6e:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   2fd75:	e9 68 c0 ff ff       	jmp    2bde2 <JS_CallInternal+0x6952>
   2fd7a:	0f bf 4a 01          	movswl 0x1(%rdx),%ecx
   2fd7e:	be 04 00 00 00       	mov    $0x4,%esi
   2fd83:	e9 45 d9 ff ff       	jmp    2d6cd <JS_CallInternal+0x823d>
   2fd88:	41 83 f8 08          	cmp    $0x8,%r8d
   2fd8c:	0f 85 87 04 00 00    	jne    30219 <JS_CallInternal+0xad89>
   2fd92:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2fd97:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2fd9c:	45 31 ff             	xor    %r15d,%r15d
   2fd9f:	b8 00 00 00 00       	mov    $0x0,%eax
   2fda4:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2fda8:	41 0f 9b c7          	setnp  %r15b
   2fdac:	4c 0f 45 f8          	cmovne %rax,%r15
   2fdb0:	e9 29 98 ff ff       	jmp    295de <JS_CallInternal+0x414e>
   2fdb5:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2fdbc:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2fdc0:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2fdc3:	83 e8 01             	sub    $0x1,%eax
   2fdc6:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2fdc9:	85 c0                	test   %eax,%eax
   2fdcb:	0f 8f 16 f7 ff ff    	jg     2f4e7 <JS_CallInternal+0xa057>
   2fdd1:	e8 ca 6b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2fdd6:	e9 0c f7 ff ff       	jmp    2f4e7 <JS_CallInternal+0xa057>
   2fddb:	83 f9 08             	cmp    $0x8,%ecx
   2fdde:	0f 85 6c d3 ff ff    	jne    2d150 <JS_CallInternal+0x7cc0>
   2fde4:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2fde9:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2fdee:	45 31 ff             	xor    %r15d,%r15d
   2fdf1:	b8 00 00 00 00       	mov    $0x0,%eax
   2fdf6:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2fdfa:	41 0f 9b c7          	setnp  %r15b
   2fdfe:	44 0f 45 f8          	cmovne %eax,%r15d
   2fe02:	e9 2b 98 ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   2fe07:	48 03 b5 a0 fe ff ff 	add    -0x160(%rbp),%rsi
   2fe0e:	e9 05 64 ff ff       	jmp    26218 <JS_CallInternal+0xd88>
   2fe13:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe17:	48 89 ce             	mov    %rcx,%rsi
   2fe1a:	48 89 da             	mov    %rbx,%rdx
   2fe1d:	e8 9e eb fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2fe22:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2fe29:	e9 ea e0 ff ff       	jmp    2df18 <JS_CallInternal+0x8a88>
   2fe2e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe32:	48 89 ce             	mov    %rcx,%rsi
   2fe35:	48 89 da             	mov    %rbx,%rdx
   2fe38:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2fe3f:	e8 7c eb fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2fe44:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2fe4b:	e9 a3 d3 ff ff       	jmp    2d1f3 <JS_CallInternal+0x7d63>
   2fe50:	4d 89 e7             	mov    %r12,%r15
   2fe53:	e9 78 5d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fe58:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe5c:	89 c2                	mov    %eax,%edx
   2fe5e:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fe62:	e8 69 8b fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2fe67:	48 89 c2             	mov    %rax,%rdx
   2fe6a:	e9 19 e2 ff ff       	jmp    2e088 <JS_CallInternal+0x8bf8>
   2fe6f:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2fe76:	48 8d 35 83 ce 0a 00 	lea    0xace83(%rip),%rsi        # dcd00 <_IO_stdin_used+0x3d00>
   2fe7d:	31 c0                	xor    %eax,%eax
   2fe7f:	4d 89 e7             	mov    %r12,%r15
   2fe82:	e8 b9 44 00 00       	call   34340 <JS_ThrowTypeError>
   2fe87:	e9 44 5d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fe8c:	48 8d 35 43 97 0a 00 	lea    0xa9743(%rip),%rsi        # d95d6 <_IO_stdin_used+0x5d6>
   2fe93:	4c 89 ef             	mov    %r13,%rdi
   2fe96:	31 c0                	xor    %eax,%eax
   2fe98:	4d 89 e7             	mov    %r12,%r15
   2fe9b:	e8 a0 44 00 00       	call   34340 <JS_ThrowTypeError>
   2fea0:	e9 2b 5d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2fea5:	4c 89 fb             	mov    %r15,%rbx
   2fea8:	4d 89 e7             	mov    %r12,%r15
   2feab:	e9 20 5d ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2feb0:	66 c7 85 00 fe ff ff 	movw   $0x1,-0x200(%rbp)
   2feb7:	01 00 
   2feb9:	e9 23 66 ff ff       	jmp    264e1 <JS_CallInternal+0x1051>
   2febe:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fec2:	89 c2                	mov    %eax,%edx
   2fec4:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fec8:	e8 03 8b fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2fecd:	48 89 c2             	mov    %rax,%rdx
   2fed0:	e9 ba ed ff ff       	jmp    2ec8f <JS_CallInternal+0x97ff>
   2fed5:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2feda:	83 f8 08             	cmp    $0x8,%eax
   2fedd:	0f 84 c0 ec ff ff    	je     2eba3 <JS_CallInternal+0x9713>
   2fee3:	85 c0                	test   %eax,%eax
   2fee5:	0f 85 fa b5 ff ff    	jne    2b4e5 <JS_CallInternal+0x6055>
   2feeb:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2feef:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2fef3:	e9 b0 ec ff ff       	jmp    2eba8 <JS_CallInternal+0x9718>
   2fef8:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2feff:	31 d2                	xor    %edx,%edx
   2ff01:	48 63 c9             	movslq %ecx,%rcx
   2ff04:	f3 0f 6f 80 d8 04 00 	movdqu 0x4d8(%rax),%xmm0
   2ff0b:	00 
   2ff0c:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2ff10:	48 89 90 d8 04 00 00 	mov    %rdx,0x4d8(%rax)
   2ff17:	48 c7 80 e0 04 00 00 	movq   $0x4,0x4e0(%rax)
   2ff1e:	04 00 00 00 
   2ff22:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2ff29:	48 03 48 18          	add    0x18(%rax),%rcx
   2ff2d:	49 89 cf             	mov    %rcx,%r15
   2ff30:	e9 1c 58 ff ff       	jmp    25751 <JS_CallInternal+0x2c1>
   2ff35:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   2ff3c:	48 8b 95 70 fe ff ff 	mov    -0x190(%rbp),%rdx
   2ff43:	4c 89 ef             	mov    %r13,%rdi
   2ff46:	48 89 c6             	mov    %rax,%rsi
   2ff49:	e8 02 b8 01 00       	call   4b750 <JS_ToObject>
   2ff4e:	48 89 c1             	mov    %rax,%rcx
   2ff51:	48 89 d0             	mov    %rdx,%rax
   2ff54:	83 fa 06             	cmp    $0x6,%edx
   2ff57:	0f 84 ca 00 00 00    	je     30027 <JS_CallInternal+0xab97>
   2ff5d:	48 89 ca             	mov    %rcx,%rdx
   2ff60:	e9 29 82 ff ff       	jmp    2818e <JS_CallInternal+0x2cfe>
   2ff65:	85 d2                	test   %edx,%edx
   2ff67:	0f 85 f3 e9 ff ff    	jne    2e960 <JS_CallInternal+0x94d0>
   2ff6d:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2ff71:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
   2ff75:	66 48 0f 6e c1       	movq   %rcx,%xmm0
   2ff7a:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   2ff7e:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2ff85:	00 
   2ff86:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2ff8b:	e9 6b b6 ff ff       	jmp    2b5fb <JS_CallInternal+0x616b>
   2ff90:	31 ff                	xor    %edi,%edi
   2ff92:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2ff99:	00 
   2ff9a:	4d 89 e7             	mov    %r12,%r15
   2ff9d:	48 89 7b f0          	mov    %rdi,-0x10(%rbx)
   2ffa1:	e9 2a 5c ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   2ffa6:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2ffad:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ffb1:	48 89 de             	mov    %rbx,%rsi
   2ffb4:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2ffbb:	e8 00 ea fe ff       	call   1e9c0 <__JS_FreeValueRT>
   2ffc0:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2ffc7:	e9 4e d2 ff ff       	jmp    2d21a <JS_CallInternal+0x7d8a>
   2ffcc:	8d 70 07             	lea    0x7(%rax),%esi
   2ffcf:	83 fe 01             	cmp    $0x1,%esi
   2ffd2:	0f 87 88 e9 ff ff    	ja     2e960 <JS_CallInternal+0x94d0>
   2ffd8:	48 89 fe             	mov    %rdi,%rsi
   2ffdb:	49 89 c0             	mov    %rax,%r8
   2ffde:	4c 89 ef             	mov    %r13,%rdi
   2ffe1:	4d 89 e7             	mov    %r12,%r15
   2ffe4:	e8 a7 44 01 00       	call   44490 <JS_ConcatString>
   2ffe9:	48 8d 5b f0          	lea    -0x10(%rbx),%rbx
   2ffed:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2fff1:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2fff5:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fff9:	0f 85 00 b6 ff ff    	jne    2b5ff <JS_CallInternal+0x616f>
   2ffff:	e9 cc 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30004:	66 48 0f 6e cf       	movq   %rdi,%xmm1
   30009:	83 f8 08             	cmp    $0x8,%eax
   3000c:	0f 84 63 ff ff ff    	je     2ff75 <JS_CallInternal+0xaae5>
   30012:	85 c0                	test   %eax,%eax
   30014:	0f 85 46 e9 ff ff    	jne    2e960 <JS_CallInternal+0x94d0>
   3001a:	66 0f ef c0          	pxor   %xmm0,%xmm0
   3001e:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   30022:	e9 53 ff ff ff       	jmp    2ff7a <JS_CallInternal+0xaaea>
   30027:	4d 89 e7             	mov    %r12,%r15
   3002a:	e9 a1 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   3002f:	4d 89 e7             	mov    %r12,%r15
   30032:	e9 99 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30037:	4c 89 fb             	mov    %r15,%rbx
   3003a:	4d 89 e7             	mov    %r12,%r15
   3003d:	e9 8e 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30042:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   30047:	f2 41 0f 58 01       	addsd  (%r9),%xmm0
   3004c:	49 c7 41 08 08 00 00 	movq   $0x8,0x8(%r9)
   30053:	00 
   30054:	48 83 eb 10          	sub    $0x10,%rbx
   30058:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   3005d:	e9 46 a3 ff ff       	jmp    2a3a8 <JS_CallInternal+0x4f18>
   30062:	4d 89 e7             	mov    %r12,%r15
   30065:	e9 66 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   3006a:	48 8d 35 65 95 0a 00 	lea    0xa9565(%rip),%rsi        # d95d6 <_IO_stdin_used+0x5d6>
   30071:	4c 89 ef             	mov    %r13,%rdi
   30074:	31 c0                	xor    %eax,%eax
   30076:	4d 89 e7             	mov    %r12,%r15
   30079:	e8 c2 42 00 00       	call   34340 <JS_ThrowTypeError>
   3007e:	e9 4d 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30083:	89 ce                	mov    %ecx,%esi
   30085:	4c 89 ef             	mov    %r13,%rdi
   30088:	e8 53 62 00 00       	call   362e0 <JS_ThrowReferenceErrorUninitialized>
   3008d:	e9 3e 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30092:	4d 89 e7             	mov    %r12,%r15
   30095:	e9 36 5b ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   3009a:	44 0f b6 7f 11       	movzbl 0x11(%rdi),%r15d
   3009f:	48 89 fe             	mov    %rdi,%rsi
   300a2:	4c 89 ef             	mov    %r13,%rdi
   300a5:	41 83 e7 01          	and    $0x1,%r15d
   300a9:	e8 92 ea fe ff       	call   1eb40 <JS_FreeValue>
   300ae:	e9 7f 95 ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   300b3:	4d 89 e7             	mov    %r12,%r15
   300b6:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   300bc:	0f 8e 0e 5b ff ff    	jle    25bd0 <JS_CallInternal+0x740>
   300c2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   300c6:	89 ce                	mov    %ecx,%esi
   300c8:	e8 23 ab fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   300cd:	e9 fe 5a ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   300d2:	4d 8b 65 10          	mov    0x10(%r13),%r12
   300d6:	41 80 bc 24 e9 04 00 	cmpb   $0x0,0x4e9(%r12)
   300dd:	00 00 
   300df:	74 30                	je     30111 <JS_CallInternal+0xac81>
   300e1:	4c 89 ef             	mov    %r13,%rdi
   300e4:	48 89 ce             	mov    %rcx,%rsi
   300e7:	4c 89 c2             	mov    %r8,%rdx
   300ea:	e8 51 ea fe ff       	call   1eb40 <JS_FreeValue>
   300ef:	31 ff                	xor    %edi,%edi
   300f1:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   300f8:	00 
   300f9:	48 89 3b             	mov    %rdi,(%rbx)
   300fc:	e9 7e b9 ff ff       	jmp    2ba7f <JS_CallInternal+0x65ef>
   30101:	4d 89 e7             	mov    %r12,%r15
   30104:	e9 c7 5a ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30109:	4d 89 e7             	mov    %r12,%r15
   3010c:	e9 bf 5a ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30111:	41 c6 84 24 e9 04 00 	movb   $0x1,0x4e9(%r12)
   30118:	00 01 
   3011a:	48 8d 35 bc 93 0a 00 	lea    0xa93bc(%rip),%rsi        # d94dd <_IO_stdin_used+0x4dd>
   30121:	4c 89 ef             	mov    %r13,%rdi
   30124:	31 c0                	xor    %eax,%eax
   30126:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   3012d:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   30134:	e8 e7 63 00 00       	call   36520 <JS_ThrowInternalError>
   30139:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   30140:	41 c6 84 24 e9 04 00 	movb   $0x0,0x4e9(%r12)
   30147:	00 00 
   30149:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   30150:	eb 8f                	jmp    300e1 <JS_CallInternal+0xac51>
   30152:	4c 89 d6             	mov    %r10,%rsi
   30155:	4c 89 fa             	mov    %r15,%rdx
   30158:	4c 89 ef             	mov    %r13,%rdi
   3015b:	e8 e0 e9 fe ff       	call   1eb40 <JS_FreeValue>
   30160:	e9 8f d1 ff ff       	jmp    2d2f4 <JS_CallInternal+0x7e64>
   30165:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   3016c:	49 8b 31             	mov    (%r9),%rsi
   3016f:	4c 89 ef             	mov    %r13,%rdi
   30172:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   30179:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   30180:	48 83 eb 10          	sub    $0x10,%rbx
   30184:	4c 89 78 30          	mov    %r15,0x30(%rax)
   30188:	48 89 8d 38 fe ff ff 	mov    %rcx,-0x1c8(%rbp)
   3018f:	e8 bc 62 fe ff       	call   16450 <JS_ConcatStringInPlace>
   30194:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   3019b:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   301a2:	85 c0                	test   %eax,%eax
   301a4:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   301ab:	75 59                	jne    30206 <JS_CallInternal+0xad76>
   301ad:	49 8b 51 08          	mov    0x8(%r9),%rdx
   301b1:	49 8b 01             	mov    (%r9),%rax
   301b4:	83 fa f6             	cmp    $0xfffffff6,%edx
   301b7:	76 04                	jbe    301bd <JS_CallInternal+0xad2d>
   301b9:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   301bd:	4c 89 d1             	mov    %r10,%rcx
   301c0:	4d 89 d8             	mov    %r11,%r8
   301c3:	48 89 c6             	mov    %rax,%rsi
   301c6:	4c 89 ef             	mov    %r13,%rdi
   301c9:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   301d0:	e8 bb 42 01 00       	call   44490 <JS_ConcatString>
   301d5:	48 89 c1             	mov    %rax,%rcx
   301d8:	48 89 d0             	mov    %rdx,%rax
   301db:	83 fa 06             	cmp    $0x6,%edx
   301de:	0f 84 ec 59 ff ff    	je     25bd0 <JS_CallInternal+0x740>
   301e4:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   301eb:	4c 89 ef             	mov    %r13,%rdi
   301ee:	49 8b 31             	mov    (%r9),%rsi
   301f1:	49 8b 51 08          	mov    0x8(%r9),%rdx
   301f5:	49 89 09             	mov    %rcx,(%r9)
   301f8:	49 89 41 08          	mov    %rax,0x8(%r9)
   301fc:	e8 3f e9 fe ff       	call   1eb40 <JS_FreeValue>
   30201:	e9 a2 a1 ff ff       	jmp    2a3a8 <JS_CallInternal+0x4f18>
   30206:	4c 89 d6             	mov    %r10,%rsi
   30209:	4c 89 da             	mov    %r11,%rdx
   3020c:	4c 89 ef             	mov    %r13,%rdi
   3020f:	e8 2c e9 fe ff       	call   1eb40 <JS_FreeValue>
   30214:	e9 8f a1 ff ff       	jmp    2a3a8 <JS_CallInternal+0x4f18>
   30219:	4c 89 d6             	mov    %r10,%rsi
   3021c:	4c 89 c2             	mov    %r8,%rdx
   3021f:	4c 89 ef             	mov    %r13,%rdi
   30222:	e8 19 e9 fe ff       	call   1eb40 <JS_FreeValue>
   30227:	e9 2f d1 ff ff       	jmp    2d35b <JS_CallInternal+0x7ecb>
   3022c:	4d 89 e7             	mov    %r12,%r15
   3022f:	e9 9c 59 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30234:	e8 a7 60 00 00       	call   362e0 <JS_ThrowReferenceErrorUninitialized>
   30239:	e9 92 59 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   3023e:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   30244:	e9 e9 93 ff ff       	jmp    29632 <JS_CallInternal+0x41a2>
   30249:	4c 89 d6             	mov    %r10,%rsi
   3024c:	4c 89 fa             	mov    %r15,%rdx
   3024f:	4c 89 ef             	mov    %r13,%rdi
   30252:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   30259:	e8 e2 e8 fe ff       	call   1eb40 <JS_FreeValue>
   3025e:	31 c0                	xor    %eax,%eax
   30260:	44 39 bd 30 fe ff ff 	cmp    %r15d,-0x1d0(%rbp)
   30267:	0f 95 c0             	setne  %al
   3026a:	e9 1a 93 ff ff       	jmp    29589 <JS_CallInternal+0x40f9>
   3026f:	4d 89 e7             	mov    %r12,%r15
   30272:	e9 59 59 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30277:	44 39 c2             	cmp    %r8d,%edx
   3027a:	4c 89 d6             	mov    %r10,%rsi
   3027d:	4c 89 c2             	mov    %r8,%rdx
   30280:	4c 89 ef             	mov    %r13,%rdi
   30283:	41 0f 94 c7          	sete   %r15b
   30287:	e8 b4 e8 fe ff       	call   1eb40 <JS_FreeValue>
   3028c:	45 0f b6 ff          	movzbl %r15b,%r15d
   30290:	e9 49 93 ff ff       	jmp    295de <JS_CallInternal+0x414e>
   30295:	4d 89 e7             	mov    %r12,%r15
   30298:	e9 33 59 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   3029d:	4c 89 d8             	mov    %r11,%rax
   302a0:	e9 23 64 ff ff       	jmp    266c8 <JS_CallInternal+0x1238>
   302a5:	e8 26 1a fe ff       	call   11cd0 <__stack_chk_fail@plt>
   302aa:	4d 89 e7             	mov    %r12,%r15
   302ad:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   302b3:	0f 8e 17 59 ff ff    	jle    25bd0 <JS_CallInternal+0x740>
   302b9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   302bd:	89 ce                	mov    %ecx,%esi
   302bf:	e8 2c a9 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   302c4:	e9 07 59 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   302c9:	4d 89 e7             	mov    %r12,%r15
   302cc:	e9 ff 58 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   302d1:	0f b6 4f 11          	movzbl 0x11(%rdi),%ecx
   302d5:	48 89 fe             	mov    %rdi,%rsi
   302d8:	4c 89 ef             	mov    %r13,%rdi
   302db:	83 e1 01             	and    $0x1,%ecx
   302de:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   302e4:	e8 57 e8 fe ff       	call   1eb40 <JS_FreeValue>
   302e9:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   302ef:	e9 97 93 ff ff       	jmp    2968b <JS_CallInternal+0x41fb>
   302f4:	4d 89 e7             	mov    %r12,%r15
   302f7:	e9 d4 58 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   302fc:	4d 89 e7             	mov    %r12,%r15
   302ff:	e9 cc 58 ff ff       	jmp    25bd0 <JS_CallInternal+0x740>
   30304:	b9 01 00 00 00       	mov    $0x1,%ecx
   30309:	e9 7d 93 ff ff       	jmp    2968b <JS_CallInternal+0x41fb>

Disassembly of section .fini:
