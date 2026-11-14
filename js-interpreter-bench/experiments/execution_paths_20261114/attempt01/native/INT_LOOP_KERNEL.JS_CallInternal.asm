
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/execution_paths_20261114/attempt01/work/INT_LOOP_KERNEL.release/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

00000000000253d0 <JS_CallInternal>:
   253d0:	55                   	push   %rbp
   253d1:	48 89 e5             	mov    %rsp,%rbp
   253d4:	41 57                	push   %r15
   253d6:	49 89 ff             	mov    %rdi,%r15
   253d9:	41 56                	push   %r14
   253db:	41 55                	push   %r13
   253dd:	49 89 d5             	mov    %rdx,%r13
   253e0:	41 54                	push   %r12
   253e2:	49 89 f4             	mov    %rsi,%r12
   253e5:	53                   	push   %rbx
   253e6:	48 89 cb             	mov    %rcx,%rbx
   253e9:	48 81 ec b8 02 00 00 	sub    $0x2b8,%rsp
   253f0:	48 8b 45 10          	mov    0x10(%rbp),%rax
   253f4:	48 89 b5 98 fe ff ff 	mov    %rsi,-0x168(%rbp)
   253fb:	48 89 b5 30 fe ff ff 	mov    %rsi,-0x1d0(%rbp)
   25402:	4c 89 c6             	mov    %r8,%rsi
   25405:	48 89 85 28 fe ff ff 	mov    %rax,-0x1d8(%rbp)
   2540c:	48 8b 45 18          	mov    0x18(%rbp),%rax
   25410:	48 89 95 38 fe ff ff 	mov    %rdx,-0x1c8(%rbp)
   25417:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
   2541e:	48 8b 45 20          	mov    0x20(%rbp),%rax
   25422:	48 89 8d 20 fe ff ff 	mov    %rcx,-0x1e0(%rbp)
   25429:	4c 89 85 40 fe ff ff 	mov    %r8,-0x1c0(%rbp)
   25430:	44 89 8d 70 fe ff ff 	mov    %r9d,-0x190(%rbp)
   25437:	48 89 85 60 fe ff ff 	mov    %rax,-0x1a0(%rbp)
   2543e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
   25445:	00 00 
   25447:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   2544b:	48 8b 47 10          	mov    0x10(%rdi),%rax
   2544f:	48 89 85 78 fe ff ff 	mov    %rax,-0x188(%rbp)
   25456:	8b 87 a8 01 00 00    	mov    0x1a8(%rdi),%eax
   2545c:	83 e8 01             	sub    $0x1,%eax
   2545f:	89 87 a8 01 00 00    	mov    %eax,0x1a8(%rdi)
   25465:	85 c0                	test   %eax,%eax
   25467:	0f 8e c3 05 00 00    	jle    25a30 <JS_CallInternal+0x660>
   2546d:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   25471:	0f 85 11 06 00 00    	jne    25a88 <JS_CallInternal+0x6b8>
   25477:	48 8b 85 98 fe ff ff 	mov    -0x168(%rbp),%rax
   2547e:	0f b7 40 12          	movzwl 0x12(%rax),%eax
   25482:	66 83 f8 0d          	cmp    $0xd,%ax
   25486:	0f 85 26 08 00 00    	jne    25cb2 <JS_CallInternal+0x8e2>
   2548c:	48 8b 85 98 fe ff ff 	mov    -0x168(%rbp),%rax
   25493:	48 8b 40 28          	mov    0x28(%rax),%rax
   25497:	48 89 85 80 fe ff ff 	mov    %rax,-0x180(%rbp)
   2549e:	44 0f b7 40 38       	movzwl 0x38(%rax),%r8d
   254a3:	44 3b 85 70 fe ff ff 	cmp    -0x190(%rbp),%r8d
   254aa:	0f 8f f6 01 00 00    	jg     256a6 <JS_CallInternal+0x2d6>
   254b0:	8b 45 28             	mov    0x28(%rbp),%eax
   254b3:	83 e0 02             	and    $0x2,%eax
   254b6:	41 0f 45 c0          	cmovne %r8d,%eax
   254ba:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   254c1:	4c 8b b5 78 fe ff ff 	mov    -0x188(%rbp),%r14
   254c8:	44 0f b7 57 3a       	movzwl 0x3a(%rdi),%r10d
   254cd:	0f b7 77 3e          	movzwl 0x3e(%rdi),%esi
   254d1:	0f b7 57 40          	movzwl 0x40(%rdi),%edx
   254d5:	48 89 ef             	mov    %rbp,%rdi
   254d8:	48 89 f1             	mov    %rsi,%rcx
   254db:	44 01 d6             	add    %r10d,%esi
   254de:	4c 89 d3             	mov    %r10,%rbx
   254e1:	01 c6                	add    %eax,%esi
   254e3:	49 89 d1             	mov    %rdx,%r9
   254e6:	48 63 f6             	movslq %esi,%rsi
   254e9:	48 8d 34 72          	lea    (%rdx,%rsi,2),%rsi
   254ed:	48 c1 e6 03          	shl    $0x3,%rsi
   254f1:	48 29 f7             	sub    %rsi,%rdi
   254f4:	49 3b be d0 04 00 00 	cmp    0x4d0(%r14),%rdi
   254fb:	0f 82 4f 08 00 00    	jb     25d50 <JS_CallInternal+0x980>
   25501:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   25508:	48 83 c6 17          	add    $0x17,%rsi
   2550c:	49 89 f3             	mov    %rsi,%r11
   2550f:	0f b6 7f 10          	movzbl 0x10(%rdi),%edi
   25513:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
   2551a:	4c 89 a5 08 ff ff ff 	mov    %r12,-0xf8(%rbp)
   25521:	4c 89 ad 10 ff ff ff 	mov    %r13,-0xf0(%rbp)
   25528:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
   2552e:	8b bd 70 fe ff ff    	mov    -0x190(%rbp),%edi
   25534:	89 bd 38 ff ff ff    	mov    %edi,-0xc8(%rbp)
   2553a:	48 8b bd 98 fe ff ff 	mov    -0x168(%rbp),%rdi
   25541:	48 8b 7f 30          	mov    0x30(%rdi),%rdi
   25545:	48 89 bd 58 fe ff ff 	mov    %rdi,-0x1a8(%rbp)
   2554c:	48 89 e7             	mov    %rsp,%rdi
   2554f:	4c 29 df             	sub    %r11,%rdi
   25552:	48 39 fc             	cmp    %rdi,%rsp
   25555:	74 15                	je     2556c <JS_CallInternal+0x19c>
   25557:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
   2555e:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
   25565:	00 00 
   25567:	48 39 fc             	cmp    %rdi,%rsp
   2556a:	75 eb                	jne    25557 <JS_CallInternal+0x187>
   2556c:	81 e6 f0 0f 00 00    	and    $0xff0,%esi
   25572:	48 29 f4             	sub    %rsi,%rsp
   25575:	48 85 f6             	test   %rsi,%rsi
   25578:	74 06                	je     25580 <JS_CallInternal+0x1b0>
   2557a:	48 83 4c 34 f8 00    	orq    $0x0,-0x8(%rsp,%rsi,1)
   25580:	48 8b b5 60 fe ff ff 	mov    -0x1a0(%rbp),%rsi
   25587:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
   2558c:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   25590:	48 89 bd f0 fd ff ff 	mov    %rdi,-0x210(%rbp)
   25597:	48 89 b5 50 fe ff ff 	mov    %rsi,-0x1b0(%rbp)
   2559e:	85 c0                	test   %eax,%eax
   255a0:	0f 85 42 65 00 00    	jne    2bae8 <JS_CallInternal+0x6718>
   255a6:	48 98                	cltq
   255a8:	48 c1 e0 04          	shl    $0x4,%rax
   255ac:	48 01 f8             	add    %rdi,%rax
   255af:	48 89 85 68 fe ff ff 	mov    %rax,-0x198(%rbp)
   255b6:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
   255bd:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   255c4:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
   255cb:	45 85 d2             	test   %r10d,%r10d
   255ce:	74 48                	je     25618 <JS_CallInternal+0x248>
   255d0:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   255d7:	48 89 de             	mov    %rbx,%rsi
   255da:	48 c1 e6 04          	shl    $0x4,%rsi
   255de:	48 89 f8             	mov    %rdi,%rax
   255e1:	48 01 fe             	add    %rdi,%rsi
   255e4:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   255ea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   255f1:	00 00 00 00 
   255f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   255fc:	00 00 00 00 
   25600:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   25607:	48 83 c0 10          	add    $0x10,%rax
   2560b:	48 c7 40 f8 03 00 00 	movq   $0x3,-0x8(%rax)
   25612:	00 
   25613:	48 39 f0             	cmp    %rsi,%rax
   25616:	75 e8                	jne    25600 <JS_CallInternal+0x230>
   25618:	48 c1 e3 04          	shl    $0x4,%rbx
   2561c:	48 c1 e1 04          	shl    $0x4,%rcx
   25620:	48 03 9d 68 fe ff ff 	add    -0x198(%rbp),%rbx
   25627:	48 8d 3c 0b          	lea    (%rbx,%rcx,1),%rdi
   2562b:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
   25632:	66 45 85 c9          	test   %r9w,%r9w
   25636:	74 0b                	je     25643 <JS_CallInternal+0x273>
   25638:	48 c1 e2 03          	shl    $0x3,%rdx
   2563c:	31 f6                	xor    %esi,%esi
   2563e:	e8 1d c2 fe ff       	call   11860 <memset@plt>
   25643:	48 8b bd 78 fe ff ff 	mov    -0x188(%rbp),%rdi
   2564a:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   25651:	48 89 9d 18 fe ff ff 	mov    %rbx,-0x1e8(%rbp)
   25658:	48 8b 97 f0 04 00 00 	mov    0x4f0(%rdi),%rdx
   2565f:	48 8b 41 18          	mov    0x18(%rcx),%rax
   25663:	4c 8b 69 48          	mov    0x48(%rcx),%r13
   25667:	48 8b 8d 98 fe ff ff 	mov    -0x168(%rbp),%rcx
   2566e:	48 89 95 00 ff ff ff 	mov    %rdx,-0x100(%rbp)
   25675:	48 8d 95 00 ff ff ff 	lea    -0x100(%rbp),%rdx
   2567c:	48 89 97 f0 04 00 00 	mov    %rdx,0x4f0(%rdi)
   25683:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2568a:	48 89 95 90 fe ff ff 	mov    %rdx,-0x170(%rbp)
   25691:	4c 8d 60 01          	lea    0x1(%rax),%r12
   25695:	0f b6 00             	movzbl (%rax),%eax
   25698:	4c 8d 35 a1 56 0e 00 	lea    0xe56a1(%rip),%r14        # 10ad40 <dispatch_table.86>
   2569f:	49 89 c2             	mov    %rax,%r10
   256a2:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   256a6:	44 89 c0             	mov    %r8d,%eax
   256a9:	e9 0c fe ff ff       	jmp    254ba <JS_CallInternal+0xea>
   256ae:	f3 0f 1e fa          	endbr64
   256b2:	0f 1f 00             	nopl   (%rax)
   256b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   256bc:	00 00 00 00 
   256c0:	f3 0f 1e fa          	endbr64
   256c4:	41 8d 82 4d ff ff ff 	lea    -0xb3(%r10),%eax
   256cb:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   256d2:	00 
   256d3:	49 83 c4 01          	add    $0x1,%r12
   256d7:	48 83 c3 10          	add    $0x10,%rbx
   256db:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   256df:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   256e5:	49 89 c2             	mov    %rax,%r10
   256e8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   256ec:	ff e0                	jmp    *%rax
   256ee:	f3 0f 1e fa          	endbr64
   256f2:	0f 1f 00             	nopl   (%rax)
   256f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   256fc:	00 00 00 00 
   25700:	f3 0f 1e fa          	endbr64
   25704:	41 8b 44 24 04       	mov    0x4(%r12),%eax
   25709:	4d 8d 5c 24 09       	lea    0x9(%r12),%r11
   2570e:	41 8b 0c 24          	mov    (%r12),%ecx
   25712:	4c 89 ef             	mov    %r13,%rdi
   25715:	f3 0f 6f 5b f0       	movdqu -0x10(%rbx),%xmm3
   2571a:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   25721:	89 85 b8 fd ff ff    	mov    %eax,-0x248(%rbp)
   25727:	41 0f b6 44 24 08    	movzbl 0x8(%r12),%eax
   2572d:	0f 29 9d 00 fe ff ff 	movaps %xmm3,-0x200(%rbp)
   25734:	48 8b 95 08 fe ff ff 	mov    -0x1f8(%rbp),%rdx
   2573b:	88 85 e0 fd ff ff    	mov    %al,-0x220(%rbp)
   25741:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   25748:	44 89 95 d0 fd ff ff 	mov    %r10d,-0x230(%rbp)
   2574f:	49 89 d4             	mov    %rdx,%r12
   25752:	4c 89 58 30          	mov    %r11,0x30(%rax)
   25756:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2575d:	89 8d c0 fd ff ff    	mov    %ecx,-0x240(%rbp)
   25763:	48 89 c6             	mov    %rax,%rsi
   25766:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2576d:	e8 ee ae 04 00       	call   70660 <JS_HasProperty>
   25772:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   25779:	85 c0                	test   %eax,%eax
   2577b:	0f 88 36 08 00 00    	js     25fb7 <JS_CallInternal+0xbe7>
   25781:	0f 84 b7 64 00 00    	je     2bc3e <JS_CallInternal+0x686e>
   25787:	80 bd e0 fd ff ff 00 	cmpb   $0x0,-0x220(%rbp)
   2578e:	44 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10d
   25795:	0f 85 4f 06 00 00    	jne    25dea <JS_CallInternal+0xa1a>
   2579b:	41 83 ea 71          	sub    $0x71,%r10d
   2579f:	41 83 fa 04          	cmp    $0x4,%r10d
   257a3:	0f 87 7f 05 00 00    	ja     25d28 <JS_CallInternal+0x958>
   257a9:	48 8d 15 14 da 0b 00 	lea    0xbda14(%rip),%rdx        # e31c4 <qjsc_repl_size+0x4b8>
   257b0:	4a 63 04 92          	movslq (%rdx,%r10,4),%rax
   257b4:	48 01 d0             	add    %rdx,%rax
   257b7:	3e ff e0             	notrack jmp *%rax
   257ba:	f3 0f 1e fa          	endbr64
   257be:	f3 0f 1e fa          	endbr64
   257c2:	4c 89 a5 00 fe ff ff 	mov    %r12,-0x200(%rbp)
   257c9:	45 8d 8a 14 ff ff ff 	lea    -0xec(%r10),%r9d
   257d0:	4d 63 e1             	movslq %r9d,%r12
   257d3:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   257da:	49 89 db             	mov    %rbx,%r11
   257dd:	4c 89 ef             	mov    %r13,%rdi
   257e0:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   257e7:	49 c1 e4 04          	shl    $0x4,%r12
   257eb:	44 89 95 d0 fd ff ff 	mov    %r10d,-0x230(%rbp)
   257f2:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   257f8:	4d 29 e3             	sub    %r12,%r11
   257fb:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   257ff:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   25803:	48 89 48 30          	mov    %rcx,0x30(%rax)
   25807:	31 c9                	xor    %ecx,%ecx
   25809:	6a 00                	push   $0x0
   2580b:	41 53                	push   %r11
   2580d:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   25814:	6a 03                	push   $0x3
   25816:	6a 00                	push   $0x0
   25818:	44 89 8d f8 fd ff ff 	mov    %r9d,-0x208(%rbp)
   2581f:	e8 ac fb ff ff       	call   253d0 <JS_CallInternal>
   25824:	48 83 c4 20          	add    $0x20,%rsp
   25828:	44 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9d
   2582f:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   25836:	83 fa 06             	cmp    $0x6,%edx
   25839:	49 89 c0             	mov    %rax,%r8
   2583c:	48 89 d0             	mov    %rdx,%rax
   2583f:	0f 84 56 69 00 00    	je     2c19b <JS_CallInternal+0x6dcb>
   25845:	4c 89 c1             	mov    %r8,%rcx
   25848:	83 bd d0 fd ff ff 23 	cmpl   $0x23,-0x230(%rbp)
   2584f:	0f 84 ff 02 00 00    	je     25b54 <JS_CallInternal+0x784>
   25855:	4d 01 dc             	add    %r11,%r12
   25858:	45 85 c9             	test   %r9d,%r9d
   2585b:	0f 88 aa 00 00 00    	js     2590b <JS_CallInternal+0x53b>
   25861:	48 89 9d e0 fd ff ff 	mov    %rbx,-0x220(%rbp)
   25868:	49 8d 5b f0          	lea    -0x10(%r11),%rbx
   2586c:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   25873:	4d 89 e8             	mov    %r13,%r8
   25876:	49 89 d5             	mov    %rdx,%r13
   25879:	44 89 8d d0 fd ff ff 	mov    %r9d,-0x230(%rbp)
   25880:	eb 27                	jmp    258a9 <JS_CallInternal+0x4d9>
   25882:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   25889:	00 
   2588a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25891:	00 00 00 00 
   25895:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2589c:	00 00 00 00 
   258a0:	48 83 c3 10          	add    $0x10,%rbx
   258a4:	4c 39 e3             	cmp    %r12,%rbx
   258a7:	74 47                	je     258f0 <JS_CallInternal+0x520>
   258a9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   258ad:	83 fa f6             	cmp    $0xfffffff6,%edx
   258b0:	76 ee                	jbe    258a0 <JS_CallInternal+0x4d0>
   258b2:	48 8b 33             	mov    (%rbx),%rsi
   258b5:	8b 46 fc             	mov    -0x4(%rsi),%eax
   258b8:	83 e8 01             	sub    $0x1,%eax
   258bb:	89 46 fc             	mov    %eax,-0x4(%rsi)
   258be:	85 c0                	test   %eax,%eax
   258c0:	7f de                	jg     258a0 <JS_CallInternal+0x4d0>
   258c2:	49 8b 78 10          	mov    0x10(%r8),%rdi
   258c6:	48 83 c3 10          	add    $0x10,%rbx
   258ca:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   258d1:	e8 4a 90 ff ff       	call   1e920 <__JS_FreeValueRT>
   258d6:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   258dd:	4c 39 e3             	cmp    %r12,%rbx
   258e0:	75 c7                	jne    258a9 <JS_CallInternal+0x4d9>
   258e2:	0f 1f 00             	nopl   (%rax)
   258e5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   258ec:	00 00 00 00 
   258f0:	4c 89 e8             	mov    %r13,%rax
   258f3:	48 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%rbx
   258fa:	4d 89 c5             	mov    %r8,%r13
   258fd:	44 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9d
   25904:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   2590b:	41 83 c1 01          	add    $0x1,%r9d
   2590f:	4d 63 c9             	movslq %r9d,%r9
   25912:	49 c1 e1 04          	shl    $0x4,%r9
   25916:	4c 29 cb             	sub    %r9,%rbx
   25919:	48 89 da             	mov    %rbx,%rdx
   2591c:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   25920:	48 89 42 08          	mov    %rax,0x8(%rdx)
   25924:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2592b:	4c 89 02             	mov    %r8,(%rdx)
   2592e:	4c 8d 60 01          	lea    0x1(%rax),%r12
   25932:	0f b6 00             	movzbl (%rax),%eax
   25935:	49 89 c2             	mov    %rax,%r10
   25938:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2593c:	f3 0f 1e fa          	endbr64
   25940:	f3 0f 1e fa          	endbr64
   25944:	41 8b 04 24          	mov    (%r12),%eax
   25948:	49 8d 4c 24 06       	lea    0x6(%r12),%rcx
   2594d:	31 f6                	xor    %esi,%esi
   2594f:	ba 02 00 00 00       	mov    $0x2,%edx
   25954:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   2595b:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2595f:	4c 89 ef             	mov    %r13,%rdi
   25962:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   25968:	41 0f b7 44 24 04    	movzwl 0x4(%r12),%eax
   2596e:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   25975:	b9 01 00 00 00       	mov    $0x1,%ecx
   2597a:	44 89 95 d0 fd ff ff 	mov    %r10d,-0x230(%rbp)
   25981:	66 89 85 e0 fd ff ff 	mov    %ax,-0x220(%rbp)
   25988:	e8 63 58 02 00       	call   4b1f0 <JS_NewObjectProtoClass>
   2598d:	48 89 03             	mov    %rax,(%rbx)
   25990:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   25994:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   25998:	0f 84 49 02 00 00    	je     25be7 <JS_CallInternal+0x817>
   2599e:	44 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10d
   259a5:	41 83 fa 78          	cmp    $0x78,%r10d
   259a9:	0f 85 0d 02 00 00    	jne    25bbc <JS_CallInternal+0x7ec>
   259af:	0f b7 85 e0 fd ff ff 	movzwl -0x220(%rbp),%eax
   259b6:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   259bd:	4c 8b 04 c1          	mov    (%rcx,%rax,8),%r8
   259c1:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   259c6:	48 8b 33             	mov    (%rbx),%rsi
   259c9:	8b 95 00 fe ff ff    	mov    -0x200(%rbp),%edx
   259cf:	b9 22 00 00 00       	mov    $0x22,%ecx
   259d4:	4c 89 ef             	mov    %r13,%rdi
   259d7:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   259de:	e8 7d 4c 02 00       	call   4a660 <add_property>
   259e3:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   259ea:	48 85 c0             	test   %rax,%rax
   259ed:	0f 84 53 98 00 00    	je     2f246 <JS_CallInternal+0x9e76>
   259f3:	4c 89 00             	mov    %r8,(%rax)
   259f6:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   259fc:	31 d2                	xor    %edx,%edx
   259fe:	4c 89 ef             	mov    %r13,%rdi
   25a01:	48 83 c3 20          	add    $0x20,%rbx
   25a05:	49 83 c4 07          	add    $0x7,%r12
   25a09:	e8 b2 66 01 00       	call   3c0c0 <__JS_AtomToValue>
   25a0e:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   25a15:	48 89 01             	mov    %rax,(%rcx)
   25a18:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   25a1c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   25a22:	49 89 c2             	mov    %rax,%r10
   25a25:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25a29:	ff e0                	jmp    *%rax
   25a2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   25a30:	48 89 8d 80 fe ff ff 	mov    %rcx,-0x180(%rbp)
   25a37:	4c 89 85 88 fe ff ff 	mov    %r8,-0x178(%rbp)
   25a3e:	e8 9d 0d 01 00       	call   367e0 <__js_poll_interrupts>
   25a43:	48 8b 9d 80 fe ff ff 	mov    -0x180(%rbp),%rbx
   25a4a:	48 8b b5 88 fe ff ff 	mov    -0x178(%rbp),%rsi
   25a51:	85 c0                	test   %eax,%eax
   25a53:	0f 84 14 fa ff ff    	je     2546d <JS_CallInternal+0x9d>
   25a59:	31 c0                	xor    %eax,%eax
   25a5b:	ba 06 00 00 00       	mov    $0x6,%edx
   25a60:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   25a64:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
   25a6b:	00 00 
   25a6d:	0f 85 9d a7 00 00    	jne    30210 <JS_CallInternal+0xae40>
   25a73:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
   25a77:	5b                   	pop    %rbx
   25a78:	41 5c                	pop    %r12
   25a7a:	41 5d                	pop    %r13
   25a7c:	41 5e                	pop    %r14
   25a7e:	41 5f                	pop    %r15
   25a80:	5d                   	pop    %rbp
   25a81:	c3                   	ret
   25a82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   25a88:	f6 45 28 04          	testb  $0x4,0x28(%rbp)
   25a8c:	0f 84 fe 03 00 00    	je     25e90 <JS_CallInternal+0xac0>
   25a92:	48 8b 85 98 fe ff ff 	mov    -0x168(%rbp),%rax
   25a99:	48 8b 48 58          	mov    0x58(%rax),%rcx
   25a9d:	48 8b 50 70          	mov    0x70(%rax),%rdx
   25aa1:	48 8d 78 50          	lea    0x50(%rax),%rdi
   25aa5:	48 8b 70 68          	mov    0x68(%rax),%rsi
   25aa9:	48 89 bd 90 fe ff ff 	mov    %rdi,-0x170(%rbp)
   25ab0:	48 8b 59 28          	mov    0x28(%rcx),%rbx
   25ab4:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   25abb:	48 8b 49 30          	mov    0x30(%rcx),%rcx
   25abf:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   25ac6:	4c 8b 6b 48          	mov    0x48(%rbx),%r13
   25aca:	48 89 9d 80 fe ff ff 	mov    %rbx,-0x180(%rbp)
   25ad1:	48 89 8d 58 fe ff ff 	mov    %rcx,-0x1a8(%rbp)
   25ad8:	48 89 c1             	mov    %rax,%rcx
   25adb:	0f b7 43 3a          	movzwl 0x3a(%rbx),%eax
   25adf:	4c 8b a1 80 00 00 00 	mov    0x80(%rcx),%r12
   25ae6:	48 8b 99 90 00 00 00 	mov    0x90(%rcx),%rbx
   25aed:	48 c7 81 90 00 00 00 	movq   $0x0,0x90(%rcx)
   25af4:	00 00 00 00 
   25af8:	48 c1 e0 04          	shl    $0x4,%rax
   25afc:	48 89 b5 f0 fd ff ff 	mov    %rsi,-0x210(%rbp)
   25b03:	48 01 d0             	add    %rdx,%rax
   25b06:	48 8b 95 78 fe ff ff 	mov    -0x188(%rbp),%rdx
   25b0d:	48 89 85 18 fe ff ff 	mov    %rax,-0x1e8(%rbp)
   25b14:	48 8b 82 f0 04 00 00 	mov    0x4f0(%rdx),%rax
   25b1b:	48 89 41 50          	mov    %rax,0x50(%rcx)
   25b1f:	48 89 ba f0 04 00 00 	mov    %rdi,0x4f0(%rdx)
   25b26:	8b 79 24             	mov    0x24(%rcx),%edi
   25b29:	85 ff                	test   %edi,%edi
   25b2b:	0f 84 aa 02 00 00    	je     25ddb <JS_CallInternal+0xa0b>
   25b31:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   25b38:	48 89 85 50 fe ff ff 	mov    %rax,-0x1b0(%rbp)
   25b3f:	e9 bc 00 00 00       	jmp    25c00 <JS_CallInternal+0x830>
   25b44:	f3 0f 1e fa          	endbr64
   25b48:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25b4c:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   25b50:	48 83 eb 10          	sub    $0x10,%rbx
   25b54:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   25b5b:	66 83 7f 40 00       	cmpw   $0x0,0x40(%rdi)
   25b60:	0f 85 ea 74 00 00    	jne    2d050 <JS_CallInternal+0x7c80>
   25b66:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   25b6d:	49 39 dc             	cmp    %rbx,%r12
   25b70:	0f 83 19 01 00 00    	jae    25c8f <JS_CallInternal+0x8bf>
   25b76:	49 89 c6             	mov    %rax,%r14
   25b79:	49 89 cf             	mov    %rcx,%r15
   25b7c:	eb 0f                	jmp    25b8d <JS_CallInternal+0x7bd>
   25b7e:	66 90                	xchg   %ax,%ax
   25b80:	49 83 c4 10          	add    $0x10,%r12
   25b84:	49 39 dc             	cmp    %rbx,%r12
   25b87:	0f 83 b8 01 00 00    	jae    25d45 <JS_CallInternal+0x975>
   25b8d:	49 8b 74 24 08       	mov    0x8(%r12),%rsi
   25b92:	83 fe f6             	cmp    $0xfffffff6,%esi
   25b95:	76 e9                	jbe    25b80 <JS_CallInternal+0x7b0>
   25b97:	49 8b 14 24          	mov    (%r12),%rdx
   25b9b:	8b 42 fc             	mov    -0x4(%rdx),%eax
   25b9e:	83 e8 01             	sub    $0x1,%eax
   25ba1:	89 42 fc             	mov    %eax,-0x4(%rdx)
   25ba4:	85 c0                	test   %eax,%eax
   25ba6:	7f d8                	jg     25b80 <JS_CallInternal+0x7b0>
   25ba8:	48 89 d0             	mov    %rdx,%rax
   25bab:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25baf:	48 89 f2             	mov    %rsi,%rdx
   25bb2:	48 89 c6             	mov    %rax,%rsi
   25bb5:	e8 66 8d ff ff       	call   1e920 <__JS_FreeValueRT>
   25bba:	eb c4                	jmp    25b80 <JS_CallInternal+0x7b0>
   25bbc:	31 c9                	xor    %ecx,%ecx
   25bbe:	0f b7 95 e0 fd ff ff 	movzwl -0x220(%rbp),%edx
   25bc5:	41 83 fa 77          	cmp    $0x77,%r10d
   25bc9:	4c 89 ef             	mov    %r13,%rdi
   25bcc:	48 8b b5 90 fe ff ff 	mov    -0x170(%rbp),%rsi
   25bd3:	0f 94 c1             	sete   %cl
   25bd6:	e8 15 44 02 00       	call   49ff0 <get_var_ref>
   25bdb:	49 89 c0             	mov    %rax,%r8
   25bde:	48 85 c0             	test   %rax,%rax
   25be1:	0f 85 df fd ff ff    	jne    259c6 <JS_CallInternal+0x5f6>
   25be7:	48 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%rbx
   25bee:	4c 8b a5 c0 fd ff ff 	mov    -0x240(%rbp),%r12
   25bf5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25bfc:	00 00 00 00 
   25c00:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   25c07:	83 b8 e0 04 00 00 ff 	cmpl   $0xffffffff,0x4e0(%rax)
   25c0e:	75 41                	jne    25c51 <JS_CallInternal+0x881>
   25c10:	48 8b 80 d8 04 00 00 	mov    0x4d8(%rax),%rax
   25c17:	66 83 78 12 03       	cmpw   $0x3,0x12(%rax)
   25c1c:	75 33                	jne    25c51 <JS_CallInternal+0x881>
   25c1e:	48 8b 48 18          	mov    0x18(%rax),%rcx
   25c22:	8b 51 18             	mov    0x18(%rcx),%edx
   25c25:	89 d0                	mov    %edx,%eax
   25c27:	83 e0 39             	and    $0x39,%eax
   25c2a:	8b 44 81 38          	mov    0x38(%rcx,%rax,4),%eax
   25c2e:	48 85 c0             	test   %rax,%rax
   25c31:	0f 84 29 6c 00 00    	je     2c860 <JS_CallInternal+0x7490>
   25c37:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   25c3e:	00 
   25c3f:	48 8d 44 c2 f8       	lea    -0x8(%rdx,%rax,8),%rax
   25c44:	48 01 c8             	add    %rcx,%rax
   25c47:	83 78 04 39          	cmpl   $0x39,0x4(%rax)
   25c4b:	0f 85 02 6c 00 00    	jne    2c853 <JS_CallInternal+0x7483>
   25c51:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   25c58:	80 b8 e8 04 00 00 00 	cmpb   $0x0,0x4e8(%rax)
   25c5f:	0f 84 48 01 00 00    	je     25dad <JS_CallInternal+0x9dd>
   25c65:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   25c6c:	b9 00 00 00 00       	mov    $0x0,%ecx
   25c71:	f6 40 11 30          	testb  $0x30,0x11(%rax)
   25c75:	b8 06 00 00 00       	mov    $0x6,%eax
   25c7a:	0f 84 d4 fe ff ff    	je     25b54 <JS_CallInternal+0x784>
   25c80:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25c87:	4c 89 67 30          	mov    %r12,0x30(%rdi)
   25c8b:	48 89 5f 40          	mov    %rbx,0x40(%rdi)
   25c8f:	48 8b 9d 90 fe ff ff 	mov    -0x170(%rbp),%rbx
   25c96:	48 8b 13             	mov    (%rbx),%rdx
   25c99:	48 8b 9d 78 fe ff ff 	mov    -0x188(%rbp),%rbx
   25ca0:	48 89 93 f0 04 00 00 	mov    %rdx,0x4f0(%rbx)
   25ca7:	48 89 c2             	mov    %rax,%rdx
   25caa:	48 89 c8             	mov    %rcx,%rax
   25cad:	e9 ae fd ff ff       	jmp    25a60 <JS_CallInternal+0x690>
   25cb2:	48 8b 8d 78 fe ff ff 	mov    -0x188(%rbp),%rcx
   25cb9:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   25cbd:	48 c1 e0 03          	shl    $0x3,%rax
   25cc1:	48 03 81 58 04 00 00 	add    0x458(%rcx),%rax
   25cc8:	48 8b 40 18          	mov    0x18(%rax),%rax
   25ccc:	48 85 c0             	test   %rax,%rax
   25ccf:	0f 84 bb 01 00 00    	je     25e90 <JS_CallInternal+0xac0>
   25cd5:	48 89 d9             	mov    %rbx,%rcx
   25cd8:	8b 5d 28             	mov    0x28(%rbp),%ebx
   25cdb:	49 89 f0             	mov    %rsi,%r8
   25cde:	44 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%r9d
   25ce5:	4c 89 e6             	mov    %r12,%rsi
   25ce8:	4c 89 ea             	mov    %r13,%rdx
   25ceb:	4c 89 ff             	mov    %r15,%rdi
   25cee:	53                   	push   %rbx
   25cef:	ff b5 60 fe ff ff    	push   -0x1a0(%rbp)
   25cf5:	ff d0                	call   *%rax
   25cf7:	59                   	pop    %rcx
   25cf8:	5e                   	pop    %rsi
   25cf9:	e9 62 fd ff ff       	jmp    25a60 <JS_CallInternal+0x690>
   25cfe:	8b b5 c0 fd ff ff    	mov    -0x240(%rbp),%esi
   25d04:	31 d2                	xor    %edx,%edx
   25d06:	4c 89 ef             	mov    %r13,%rdi
   25d09:	48 83 c3 10          	add    $0x10,%rbx
   25d0d:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   25d14:	e8 a7 63 01 00       	call   3c0c0 <__JS_AtomToValue>
   25d19:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   25d20:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25d24:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   25d28:	8b 85 b8 fd ff ff    	mov    -0x248(%rbp),%eax
   25d2e:	83 e8 05             	sub    $0x5,%eax
   25d31:	48 98                	cltq
   25d33:	49 01 c3             	add    %rax,%r11
   25d36:	41 0f b6 03          	movzbl (%r11),%eax
   25d3a:	4d 8d 63 01          	lea    0x1(%r11),%r12
   25d3e:	49 89 c2             	mov    %rax,%r10
   25d41:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   25d45:	4c 89 f0             	mov    %r14,%rax
   25d48:	4c 89 f9             	mov    %r15,%rcx
   25d4b:	e9 3f ff ff ff       	jmp    25c8f <JS_CallInternal+0x8bf>
   25d50:	48 8d 35 77 37 0b 00 	lea    0xb3777(%rip),%rsi        # d94ce <_IO_stdin_used+0x4ce>
   25d57:	4c 89 ff             	mov    %r15,%rdi
   25d5a:	31 c0                	xor    %eax,%eax
   25d5c:	e8 bf 09 01 00       	call   36720 <JS_ThrowInternalError>
   25d61:	e9 fa fc ff ff       	jmp    25a60 <JS_CallInternal+0x690>
   25d66:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25d6a:	48 89 ce             	mov    %rcx,%rsi
   25d6d:	4c 89 f2             	mov    %r14,%rdx
   25d70:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   25d77:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   25d7e:	e8 9d 8b ff ff       	call   1e920 <__JS_FreeValueRT>
   25d83:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   25d8a:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   25d91:	0f 1f 40 00          	nopl   0x0(%rax)
   25d95:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25d9c:	00 00 00 00 
   25da0:	41 83 fe 05          	cmp    $0x5,%r14d
   25da4:	0f 84 bc 65 00 00    	je     2c366 <JS_CallInternal+0x6f96>
   25daa:	48 89 c3             	mov    %rax,%rbx
   25dad:	48 39 9d 18 fe ff ff 	cmp    %rbx,-0x1e8(%rbp)
   25db4:	0f 83 ab fe ff ff    	jae    25c65 <JS_CallInternal+0x895>
   25dba:	4c 8b 73 f8          	mov    -0x8(%rbx),%r14
   25dbe:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   25dc2:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25dc6:	41 83 fe f6          	cmp    $0xfffffff6,%r14d
   25dca:	76 d4                	jbe    25da0 <JS_CallInternal+0x9d0>
   25dcc:	8b 79 fc             	mov    -0x4(%rcx),%edi
   25dcf:	8d 57 ff             	lea    -0x1(%rdi),%edx
   25dd2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   25dd5:	85 d2                	test   %edx,%edx
   25dd7:	7f c7                	jg     25da0 <JS_CallInternal+0x9d0>
   25dd9:	eb 8b                	jmp    25d66 <JS_CallInternal+0x996>
   25ddb:	48 89 b5 50 fe ff ff 	mov    %rsi,-0x1b0(%rbp)
   25de2:	4c 89 e0             	mov    %r12,%rax
   25de5:	e9 a7 f8 ff ff       	jmp    25691 <JS_CallInternal+0x2c1>
   25dea:	48 83 ec 08          	sub    $0x8,%rsp
   25dee:	4d 89 e1             	mov    %r12,%r9
   25df1:	4c 89 e2             	mov    %r12,%rdx
   25df4:	4c 89 ef             	mov    %r13,%rdi
   25df7:	44 89 95 e0 fd ff ff 	mov    %r10d,-0x220(%rbp)
   25dfe:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   25e05:	b9 f1 00 00 00       	mov    $0xf1,%ecx
   25e0a:	6a 00                	push   $0x0
   25e0c:	48 8b b5 b0 fd ff ff 	mov    -0x250(%rbp),%rsi
   25e13:	e8 88 a7 00 00       	call   305a0 <JS_GetPropertyInternal>
   25e18:	5e                   	pop    %rsi
   25e19:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   25e20:	83 fa 06             	cmp    $0x6,%edx
   25e23:	49 89 c0             	mov    %rax,%r8
   25e26:	49 89 d4             	mov    %rdx,%r12
   25e29:	5f                   	pop    %rdi
   25e2a:	0f 84 87 01 00 00    	je     25fb7 <JS_CallInternal+0xbe7>
   25e30:	83 fa ff             	cmp    $0xffffffff,%edx
   25e33:	44 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10d
   25e3a:	0f 84 8b 5d 00 00    	je     2bbcb <JS_CallInternal+0x67fb>
   25e40:	83 fa f6             	cmp    $0xfffffff6,%edx
   25e43:	0f 86 52 f9 ff ff    	jbe    2579b <JS_CallInternal+0x3cb>
   25e49:	8b 40 fc             	mov    -0x4(%rax),%eax
   25e4c:	83 e8 01             	sub    $0x1,%eax
   25e4f:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   25e53:	85 c0                	test   %eax,%eax
   25e55:	0f 8f 40 f9 ff ff    	jg     2579b <JS_CallInternal+0x3cb>
   25e5b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25e5f:	4c 89 c6             	mov    %r8,%rsi
   25e62:	44 89 95 e0 fd ff ff 	mov    %r10d,-0x220(%rbp)
   25e69:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   25e70:	e8 ab 8a ff ff       	call   1e920 <__JS_FreeValueRT>
   25e75:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   25e7c:	44 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10d
   25e83:	e9 13 f9 ff ff       	jmp    2579b <JS_CallInternal+0x3cb>
   25e88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   25e8f:	00 
   25e90:	48 8d 35 0a 4d 0b 00 	lea    0xb4d0a(%rip),%rsi        # daba1 <_IO_stdin_used+0x1ba1>
   25e97:	4c 89 ff             	mov    %r15,%rdi
   25e9a:	31 c0                	xor    %eax,%eax
   25e9c:	e8 9f e6 00 00       	call   34540 <JS_ThrowTypeError>
   25ea1:	e9 ba fb ff ff       	jmp    25a60 <JS_CallInternal+0x690>
   25ea6:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   25ead:	48 8b 95 08 fe ff ff 	mov    -0x1f8(%rbp),%rdx
   25eb4:	4c 89 ef             	mov    %r13,%rdi
   25eb7:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   25ebe:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   25ec4:	48 89 c6             	mov    %rax,%rsi
   25ec7:	48 89 95 f8 fd ff ff 	mov    %rdx,-0x208(%rbp)
   25ece:	49 89 c4             	mov    %rax,%r12
   25ed1:	e8 8a a7 04 00       	call   70660 <JS_HasProperty>
   25ed6:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   25edd:	85 c0                	test   %eax,%eax
   25edf:	0f 88 d2 00 00 00    	js     25fb7 <JS_CallInternal+0xbe7>
   25ee5:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   25eec:	b8 03 00 00 00       	mov    $0x3,%eax
   25ef1:	b9 00 00 00 00       	mov    $0x0,%ecx
   25ef6:	0f 85 5e 76 00 00    	jne    2d55a <JS_CallInternal+0x818a>
   25efc:	48 89 0b             	mov    %rcx,(%rbx)
   25eff:	48 83 c3 10          	add    $0x10,%rbx
   25f03:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25f07:	e9 1c fe ff ff       	jmp    25d28 <JS_CallInternal+0x958>
   25f0c:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   25f13:	48 8b 95 08 fe ff ff 	mov    -0x1f8(%rbp),%rdx
   25f1a:	4c 89 ef             	mov    %r13,%rdi
   25f1d:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   25f24:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   25f2a:	48 89 c6             	mov    %rax,%rsi
   25f2d:	e8 2e a7 04 00       	call   70660 <JS_HasProperty>
   25f32:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   25f39:	85 c0                	test   %eax,%eax
   25f3b:	0f 8e 42 92 00 00    	jle    2f183 <JS_CallInternal+0x9db3>
   25f41:	48 83 ec 08          	sub    $0x8,%rsp
   25f45:	4c 8b 43 e0          	mov    -0x20(%rbx),%r8
   25f49:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   25f4d:	4c 89 ef             	mov    %r13,%rdi
   25f50:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   25f57:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   25f5e:	4c 8d 63 e0          	lea    -0x20(%rbx),%r12
   25f62:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   25f69:	68 00 80 00 00       	push   $0x8000
   25f6e:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   25f74:	4c 89 d6             	mov    %r10,%rsi
   25f77:	41 53                	push   %r11
   25f79:	4c 89 da             	mov    %r11,%rdx
   25f7c:	41 52                	push   %r10
   25f7e:	e8 6d b3 00 00       	call   312f0 <JS_SetPropertyInternal>
   25f83:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   25f87:	48 83 c4 20          	add    $0x20,%rsp
   25f8b:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   25f92:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   25f95:	76 15                	jbe    25fac <JS_CallInternal+0xbdc>
   25f97:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   25f9b:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   25f9e:	8d 53 ff             	lea    -0x1(%rbx),%edx
   25fa1:	89 56 fc             	mov    %edx,-0x4(%rsi)
   25fa4:	85 d2                	test   %edx,%edx
   25fa6:	0f 8e 1c 92 00 00    	jle    2f1c8 <JS_CallInternal+0x9df8>
   25fac:	4c 89 e3             	mov    %r12,%rbx
   25faf:	85 c0                	test   %eax,%eax
   25fb1:	0f 89 71 fd ff ff    	jns    25d28 <JS_CallInternal+0x958>
   25fb7:	4d 89 dc             	mov    %r11,%r12
   25fba:	e9 41 fc ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   25fbf:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   25fc6:	48 8b 95 08 fe ff ff 	mov    -0x1f8(%rbp),%rdx
   25fcd:	4c 89 ef             	mov    %r13,%rdi
   25fd0:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   25fd7:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   25fdd:	48 89 c6             	mov    %rax,%rsi
   25fe0:	48 89 95 f8 fd ff ff 	mov    %rdx,-0x208(%rbp)
   25fe7:	49 89 c4             	mov    %rax,%r12
   25fea:	e8 71 a6 04 00       	call   70660 <JS_HasProperty>
   25fef:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   25ff6:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   25ffd:	85 c0                	test   %eax,%eax
   25fff:	0f 8e 4b 93 00 00    	jle    2f350 <JS_CallInternal+0x9f80>
   26005:	48 83 ec 08          	sub    $0x8,%rsp
   26009:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   2600f:	49 89 d1             	mov    %rdx,%r9
   26012:	4c 89 e6             	mov    %r12,%rsi
   26015:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2601c:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   26023:	4c 89 ef             	mov    %r13,%rdi
   26026:	6a 00                	push   $0x0
   26028:	e8 73 a5 00 00       	call   305a0 <JS_GetPropertyInternal>
   2602d:	41 59                	pop    %r9
   2602f:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   26036:	83 fa 06             	cmp    $0x6,%edx
   26039:	48 89 c1             	mov    %rax,%rcx
   2603c:	41 5a                	pop    %r10
   2603e:	48 89 d0             	mov    %rdx,%rax
   26041:	0f 84 70 ff ff ff    	je     25fb7 <JS_CallInternal+0xbe7>
   26047:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2604b:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2604f:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26053:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   26057:	83 fa f6             	cmp    $0xfffffff6,%edx
   2605a:	0f 86 c8 fc ff ff    	jbe    25d28 <JS_CallInternal+0x958>
   26060:	8b 46 fc             	mov    -0x4(%rsi),%eax
   26063:	83 e8 01             	sub    $0x1,%eax
   26066:	89 46 fc             	mov    %eax,-0x4(%rsi)
   26069:	85 c0                	test   %eax,%eax
   2606b:	0f 8f b7 fc ff ff    	jg     25d28 <JS_CallInternal+0x958>
   26071:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   26075:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2607c:	e8 9f 88 ff ff       	call   1e920 <__JS_FreeValueRT>
   26081:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   26088:	e9 9b fc ff ff       	jmp    25d28 <JS_CallInternal+0x958>
   2608d:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   26094:	48 8b 95 08 fe ff ff 	mov    -0x1f8(%rbp),%rdx
   2609b:	45 31 c0             	xor    %r8d,%r8d
   2609e:	4c 89 ef             	mov    %r13,%rdi
   260a1:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   260a7:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   260ae:	48 89 c6             	mov    %rax,%rsi
   260b1:	e8 ba 82 02 00       	call   4e370 <JS_DeleteProperty>
   260b6:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   260bd:	85 c0                	test   %eax,%eax
   260bf:	41 89 c4             	mov    %eax,%r12d
   260c2:	0f 88 ef fe ff ff    	js     25fb7 <JS_CallInternal+0xbe7>
   260c8:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   260cc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   260cf:	76 15                	jbe    260e6 <JS_CallInternal+0xd16>
   260d1:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   260d5:	8b 79 fc             	mov    -0x4(%rcx),%edi
   260d8:	8d 57 ff             	lea    -0x1(%rdi),%edx
   260db:	89 51 fc             	mov    %edx,-0x4(%rcx)
   260de:	85 d2                	test   %edx,%edx
   260e0:	0f 8e 0d 91 00 00    	jle    2f1f3 <JS_CallInternal+0x9e23>
   260e6:	31 c0                	xor    %eax,%eax
   260e8:	45 85 e4             	test   %r12d,%r12d
   260eb:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   260f2:	00 
   260f3:	0f 95 c0             	setne  %al
   260f6:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   260fa:	e9 29 fc ff ff       	jmp    25d28 <JS_CallInternal+0x958>
   260ff:	f3 0f 1e fa          	endbr64
   26103:	f3 0f 1e fa          	endbr64
   26107:	41 0f b7 04 24       	movzwl (%r12),%eax
   2610c:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   26113:	4d 8d 5c 24 02       	lea    0x2(%r12),%r11
   26118:	48 8b 0c c1          	mov    (%rcx,%rax,8),%rcx
   2611c:	4c 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%r9
   26123:	00 
   26124:	48 8b 41 18          	mov    0x18(%rcx),%rax
   26128:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2612c:	83 fa 04             	cmp    $0x4,%edx
   2612f:	0f 84 16 65 00 00    	je     2c64b <JS_CallInternal+0x727b>
   26135:	80 79 12 00          	cmpb   $0x0,0x12(%rcx)
   26139:	0f 85 0c 65 00 00    	jne    2c64b <JS_CallInternal+0x727b>
   2613f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   26144:	48 8b 08             	mov    (%rax),%rcx
   26147:	0f 11 00             	movups %xmm0,(%rax)
   2614a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2614d:	76 11                	jbe    26160 <JS_CallInternal+0xd90>
   2614f:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26152:	83 e8 01             	sub    $0x1,%eax
   26155:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26158:	85 c0                	test   %eax,%eax
   2615a:	0f 8e 90 70 00 00    	jle    2d1f0 <JS_CallInternal+0x7e20>
   26160:	48 83 eb 10          	sub    $0x10,%rbx
   26164:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2616a:	49 83 c4 03          	add    $0x3,%r12
   2616e:	49 89 c2             	mov    %rax,%r10
   26171:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26175:	ff e0                	jmp    *%rax
   26177:	f3 0f 1e fa          	endbr64
   2617b:	f3 0f 1e fa          	endbr64
   2617f:	41 0f b7 04 24       	movzwl (%r12),%eax
   26184:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   2618b:	4d 8d 5c 24 02       	lea    0x2(%r12),%r11
   26190:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   26197:	00 
   26198:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   2619c:	48 8b 40 18          	mov    0x18(%rax),%rax
   261a0:	48 8b 10             	mov    (%rax),%rdx
   261a3:	48 8b 40 08          	mov    0x8(%rax),%rax
   261a7:	83 f8 04             	cmp    $0x4,%eax
   261aa:	0f 84 fe 70 00 00    	je     2d2ae <JS_CallInternal+0x7ede>
   261b0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   261b3:	76 04                	jbe    261b9 <JS_CallInternal+0xde9>
   261b5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   261b9:	48 89 13             	mov    %rdx,(%rbx)
   261bc:	48 89 43 08          	mov    %rax,0x8(%rbx)
   261c0:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   261c6:	48 83 c3 10          	add    $0x10,%rbx
   261ca:	49 83 c4 03          	add    $0x3,%r12
   261ce:	49 89 c2             	mov    %rax,%r10
   261d1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   261d5:	ff e0                	jmp    *%rax
   261d7:	f3 0f 1e fa          	endbr64
   261db:	f3 0f 1e fa          	endbr64
   261df:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   261e4:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   261e9:	44 89 95 f8 fd ff ff 	mov    %r10d,-0x208(%rbp)
   261f0:	4c 89 ef             	mov    %r13,%rdi
   261f3:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   261fa:	45 0f b7 d9          	movzwl %r9w,%r11d
   261fe:	44 89 8d d0 fd ff ff 	mov    %r9d,-0x230(%rbp)
   26205:	49 c1 e3 04          	shl    $0x4,%r11
   26209:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   26210:	4c 89 d8             	mov    %r11,%rax
   26213:	49 89 db             	mov    %rbx,%r11
   26216:	49 29 c3             	sub    %rax,%r11
   26219:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   26220:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   26224:	4d 8b 43 e8          	mov    -0x18(%r11),%r8
   26228:	48 89 48 30          	mov    %rcx,0x30(%rax)
   2622c:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   26230:	49 8b 4b e0          	mov    -0x20(%r11),%rcx
   26234:	6a 00                	push   $0x0
   26236:	41 53                	push   %r11
   26238:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2623f:	6a 03                	push   $0x3
   26241:	6a 00                	push   $0x0
   26243:	e8 88 f1 ff ff       	call   253d0 <JS_CallInternal>
   26248:	48 83 c4 20          	add    $0x20,%rsp
   2624c:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   26253:	83 fa 06             	cmp    $0x6,%edx
   26256:	48 89 c6             	mov    %rax,%rsi
   26259:	48 89 d0             	mov    %rdx,%rax
   2625c:	0f 84 de 6f 00 00    	je     2d240 <JS_CallInternal+0x7e70>
   26262:	48 89 f1             	mov    %rsi,%rcx
   26265:	83 bd f8 fd ff ff 25 	cmpl   $0x25,-0x208(%rbp)
   2626c:	0f 84 e2 f8 ff ff    	je     25b54 <JS_CallInternal+0x784>
   26272:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   26279:	4d 8d 43 e0          	lea    -0x20(%r11),%r8
   2627d:	4c 89 a5 00 fe ff ff 	mov    %r12,-0x200(%rbp)
   26284:	4c 89 bd f8 fd ff ff 	mov    %r15,-0x208(%rbp)
   2628b:	49 89 df             	mov    %rbx,%r15
   2628e:	4c 89 c3             	mov    %r8,%rbx
   26291:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
   26298:	4e 8d 24 19          	lea    (%rcx,%r11,1),%r12
   2629c:	eb 0f                	jmp    262ad <JS_CallInternal+0xedd>
   2629e:	66 90                	xchg   %ax,%ax
   262a0:	48 83 c3 10          	add    $0x10,%rbx
   262a4:	4c 39 e3             	cmp    %r12,%rbx
   262a7:	0f 84 d8 59 00 00    	je     2bc85 <JS_CallInternal+0x68b5>
   262ad:	48 8b 73 08          	mov    0x8(%rbx),%rsi
   262b1:	83 fe f6             	cmp    $0xfffffff6,%esi
   262b4:	76 ea                	jbe    262a0 <JS_CallInternal+0xed0>
   262b6:	48 8b 3b             	mov    (%rbx),%rdi
   262b9:	8b 4f fc             	mov    -0x4(%rdi),%ecx
   262bc:	8d 51 ff             	lea    -0x1(%rcx),%edx
   262bf:	89 57 fc             	mov    %edx,-0x4(%rdi)
   262c2:	85 d2                	test   %edx,%edx
   262c4:	7f da                	jg     262a0 <JS_CallInternal+0xed0>
   262c6:	48 89 f2             	mov    %rsi,%rdx
   262c9:	48 89 fe             	mov    %rdi,%rsi
   262cc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   262d0:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   262d7:	e8 44 86 ff ff       	call   1e920 <__JS_FreeValueRT>
   262dc:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   262e3:	eb bb                	jmp    262a0 <JS_CallInternal+0xed0>
   262e5:	f3 0f 1e fa          	endbr64
   262e9:	f3 0f 1e fa          	endbr64
   262ed:	49 8d 44 24 02       	lea    0x2(%r12),%rax
   262f2:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   262f7:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   262fe:	e9 cd f4 ff ff       	jmp    257d0 <JS_CallInternal+0x400>
   26303:	f3 0f 1e fa          	endbr64
   26307:	f3 0f 1e fa          	endbr64
   2630b:	48 83 ec 08          	sub    $0x8,%rsp
   2630f:	31 c0                	xor    %eax,%eax
   26311:	41 83 fa 54          	cmp    $0x54,%r10d
   26315:	41 0f b6 4c 24 04    	movzbl 0x4(%r12),%ecx
   2631b:	0f 94 c0             	sete   %al
   2631e:	41 8b 14 24          	mov    (%r12),%edx
   26322:	48 89 de             	mov    %rbx,%rsi
   26325:	4c 89 ef             	mov    %r13,%rdi
   26328:	4c 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%r9
   2632f:	4c 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%r8
   26336:	50                   	push   %rax
   26337:	e8 c4 c9 06 00       	call   92d00 <js_op_define_class>
   2633c:	5a                   	pop    %rdx
   2633d:	59                   	pop    %rcx
   2633e:	83 f8 ff             	cmp    $0xffffffff,%eax
   26341:	0f 84 18 93 00 00    	je     2f65f <JS_CallInternal+0xa28f>
   26347:	41 0f b6 44 24 05    	movzbl 0x5(%r12),%eax
   2634d:	49 83 c4 06          	add    $0x6,%r12
   26351:	49 89 c2             	mov    %rax,%r10
   26354:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26358:	ff e0                	jmp    *%rax
   2635a:	f3 0f 1e fa          	endbr64
   2635e:	f3 0f 1e fa          	endbr64
   26362:	41 83 fa 52          	cmp    $0x52,%r10d
   26366:	0f 94 85 e0 fd ff ff 	sete   -0x220(%rbp)
   2636d:	0f 84 ae 62 00 00    	je     2c621 <JS_CallInternal+0x7251>
   26373:	41 8b 04 24          	mov    (%r12),%eax
   26377:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2637d:	49 8d 44 24 04       	lea    0x4(%r12),%rax
   26382:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   26389:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   26390:	bf 03 00 00 00       	mov    $0x3,%edi
   26395:	0f b6 8d e0 fd ff ff 	movzbl -0x220(%rbp),%ecx
   2639c:	48 c7 85 88 fd ff ff 	movq   $0x0,-0x278(%rbp)
   263a3:	00 00 00 00 
   263a7:	48 c7 85 80 fd ff ff 	movq   $0x3,-0x280(%rbp)
   263ae:	03 00 00 00 
   263b2:	0f b6 10             	movzbl (%rax),%edx
   263b5:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   263ba:	89 8d 5c fd ff ff    	mov    %ecx,-0x2a4(%rbp)
   263c0:	29 c8                	sub    %ecx,%eax
   263c2:	48 89 bd 78 fd ff ff 	mov    %rdi,-0x288(%rbp)
   263c9:	48 98                	cltq
   263cb:	48 89 bd 68 fd ff ff 	mov    %rdi,-0x298(%rbp)
   263d2:	48 c1 e0 04          	shl    $0x4,%rax
   263d6:	48 01 d8             	add    %rbx,%rax
   263d9:	48 8b 08             	mov    (%rax),%rcx
   263dc:	48 8b 40 08          	mov    0x8(%rax),%rax
   263e0:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   263e7:	89 d0                	mov    %edx,%eax
   263e9:	83 e0 04             	and    $0x4,%eax
   263ec:	48 89 8d b8 fd ff ff 	mov    %rcx,-0x248(%rbp)
   263f3:	3c 01                	cmp    $0x1,%al
   263f5:	19 c0                	sbb    %eax,%eax
   263f7:	31 f6                	xor    %esi,%esi
   263f9:	83 e0 fc             	and    $0xfffffffc,%eax
   263fc:	48 89 b5 70 fd ff ff 	mov    %rsi,-0x290(%rbp)
   26403:	48 89 b5 60 fd ff ff 	mov    %rsi,-0x2a0(%rbp)
   2640a:	05 05 45 00 00       	add    $0x4505,%eax
   2640f:	83 e2 03             	and    $0x3,%edx
   26412:	0f 85 f8 58 00 00    	jne    2bd10 <JS_CallInternal+0x6940>
   26418:	0d 02 22 00 00       	or     $0x2202,%eax
   2641d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26421:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   26425:	4c 89 ef             	mov    %r13,%rdi
   26428:	89 85 58 fd ff ff    	mov    %eax,-0x2a8(%rbp)
   2642e:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26432:	48 89 8d 88 fd ff ff 	mov    %rcx,-0x278(%rbp)
   26439:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   2643f:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   26446:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2644a:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2644f:	48 89 8d 80 fd ff ff 	mov    %rcx,-0x280(%rbp)
   26456:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2645d:	e8 9e e1 01 00       	call   44600 <js_get_function_name>
   26462:	49 89 c0             	mov    %rax,%r8
   26465:	49 89 d1             	mov    %rdx,%r9
   26468:	41 83 f9 06          	cmp    $0x6,%r9d
   2646c:	0f 84 74 6d 00 00    	je     2d1e6 <JS_CallInternal+0x7e16>
   26472:	48 83 ec 08          	sub    $0x8,%rsp
   26476:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   2647d:	4c 89 ef             	mov    %r13,%rdi
   26480:	b9 3a 00 00 00       	mov    $0x3a,%ecx
   26485:	6a 01                	push   $0x1
   26487:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2648e:	e8 7d d1 00 00       	call   33610 <JS_DefinePropertyValue>
   26493:	5e                   	pop    %rsi
   26494:	5f                   	pop    %rdi
   26495:	85 c0                	test   %eax,%eax
   26497:	0f 88 49 6d 00 00    	js     2d1e6 <JS_CallInternal+0x7e16>
   2649d:	48 8b 8d b8 fd ff ff 	mov    -0x248(%rbp),%rcx
   264a4:	4c 8b 85 b0 fd ff ff 	mov    -0x250(%rbp),%r8
   264ab:	4c 89 ef             	mov    %r13,%rdi
   264ae:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   264b5:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   264bc:	e8 0f 9f ff ff       	call   203d0 <js_method_set_home_object>
   264c1:	8b 85 58 fd ff ff    	mov    -0x2a8(%rbp),%eax
   264c7:	48 83 ec 08          	sub    $0x8,%rsp
   264cb:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   264d1:	4c 8b 85 88 fd ff ff 	mov    -0x278(%rbp),%r8
   264d8:	4c 8b 8d 80 fd ff ff 	mov    -0x280(%rbp),%r9
   264df:	4c 89 ef             	mov    %r13,%rdi
   264e2:	48 8b b5 b8 fd ff ff 	mov    -0x248(%rbp),%rsi
   264e9:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   264f0:	50                   	push   %rax
   264f1:	ff b5 68 fd ff ff    	push   -0x298(%rbp)
   264f7:	ff b5 60 fd ff ff    	push   -0x2a0(%rbp)
   264fd:	ff b5 78 fd ff ff    	push   -0x288(%rbp)
   26503:	ff b5 70 fd ff ff    	push   -0x290(%rbp)
   26509:	e8 72 c2 00 00       	call   32780 <JS_DefineProperty>
   2650e:	48 83 c4 30          	add    $0x30,%rsp
   26512:	89 c1                	mov    %eax,%ecx
   26514:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   26519:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2651c:	76 15                	jbe    26533 <JS_CallInternal+0x1163>
   2651e:	49 8b 34 24          	mov    (%r12),%rsi
   26522:	8b 7e fc             	mov    -0x4(%rsi),%edi
   26525:	8d 57 ff             	lea    -0x1(%rdi),%edx
   26528:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2652b:	85 d2                	test   %edx,%edx
   2652d:	0f 8e 7d 6b 00 00    	jle    2d0b0 <JS_CallInternal+0x7ce0>
   26533:	80 bd e0 fd ff ff 00 	cmpb   $0x0,-0x220(%rbp)
   2653a:	0f 85 00 5a 00 00    	jne    2bf40 <JS_CallInternal+0x6b70>
   26540:	8b 85 5c fd ff ff    	mov    -0x2a4(%rbp),%eax
   26546:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   2654d:	83 c0 01             	add    $0x1,%eax
   26550:	49 83 c4 01          	add    $0x1,%r12
   26554:	48 98                	cltq
   26556:	48 c1 e0 04          	shl    $0x4,%rax
   2655a:	48 29 c3             	sub    %rax,%rbx
   2655d:	85 c9                	test   %ecx,%ecx
   2655f:	0f 88 9b f6 ff ff    	js     25c00 <JS_CallInternal+0x830>
   26565:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2656c:	4c 8d 60 02          	lea    0x2(%rax),%r12
   26570:	0f b6 40 01          	movzbl 0x1(%rax),%eax
   26574:	49 89 c2             	mov    %rax,%r10
   26577:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2657b:	f3 0f 1e fa          	endbr64
   2657f:	f3 0f 1e fa          	endbr64
   26583:	31 c0                	xor    %eax,%eax
   26585:	b9 02 00 00 00       	mov    $0x2,%ecx
   2658a:	e9 f1 f6 ff ff       	jmp    25c80 <JS_CallInternal+0x8b0>
   2658f:	f3 0f 1e fa          	endbr64
   26593:	f3 0f 1e fa          	endbr64
   26597:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2659e:	4c 89 e2             	mov    %r12,%rdx
   265a1:	44 89 d1             	mov    %r10d,%ecx
   265a4:	4c 89 ef             	mov    %r13,%rdi
   265a7:	48 8d 35 a2 68 0b 00 	lea    0xb68a2(%rip),%rsi        # dce50 <_IO_stdin_used+0x3e50>
   265ae:	48 2b 50 18          	sub    0x18(%rax),%rdx
   265b2:	31 c0                	xor    %eax,%eax
   265b4:	83 ea 01             	sub    $0x1,%edx
   265b7:	e8 64 01 01 00       	call   36720 <JS_ThrowInternalError>
   265bc:	e9 3f f6 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   265c1:	f3 0f 1e fa          	endbr64
   265c5:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   265c9:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   265cd:	4c 89 ef             	mov    %r13,%rdi
   265d0:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   265d4:	e8 87 e8 ff ff       	call   24e60 <js_operator_typeof>
   265d9:	83 f8 1b             	cmp    $0x1b,%eax
   265dc:	74 5d                	je     2663b <JS_CallInternal+0x126b>
   265de:	49 8b 52 08          	mov    0x8(%r10),%rdx
   265e2:	49 8b 0a             	mov    (%r10),%rcx
   265e5:	83 fa f6             	cmp    $0xfffffff6,%edx
   265e8:	76 11                	jbe    265fb <JS_CallInternal+0x122b>
   265ea:	8b 41 fc             	mov    -0x4(%rcx),%eax
   265ed:	83 e8 01             	sub    $0x1,%eax
   265f0:	89 41 fc             	mov    %eax,-0x4(%rcx)
   265f3:	85 c0                	test   %eax,%eax
   265f5:	0f 8e 15 60 00 00    	jle    2c610 <JS_CallInternal+0x7240>
   265fb:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   26602:	00 
   26603:	49 83 c4 01          	add    $0x1,%r12
   26607:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2660e:	00 
   2660f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26615:	49 89 c2             	mov    %rax,%r10
   26618:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2661c:	ff e0                	jmp    *%rax
   2661e:	f3 0f 1e fa          	endbr64
   26622:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26626:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2662a:	4c 89 ef             	mov    %r13,%rdi
   2662d:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   26631:	e8 2a e8 ff ff       	call   24e60 <js_operator_typeof>
   26636:	83 f8 49             	cmp    $0x49,%eax
   26639:	75 a3                	jne    265de <JS_CallInternal+0x120e>
   2663b:	49 8b 42 08          	mov    0x8(%r10),%rax
   2663f:	49 8b 12             	mov    (%r10),%rdx
   26642:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26645:	76 11                	jbe    26658 <JS_CallInternal+0x1288>
   26647:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2664a:	83 e9 01             	sub    $0x1,%ecx
   2664d:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   26650:	85 c9                	test   %ecx,%ecx
   26652:	0f 8e e0 88 00 00    	jle    2ef38 <JS_CallInternal+0x9b68>
   26658:	48 c7 43 f0 01 00 00 	movq   $0x1,-0x10(%rbx)
   2665f:	00 
   26660:	49 83 c4 01          	add    $0x1,%r12
   26664:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2666b:	00 
   2666c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26672:	49 89 c2             	mov    %rax,%r10
   26675:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26679:	ff e0                	jmp    *%rax
   2667b:	f3 0f 1e fa          	endbr64
   2667f:	83 7b f8 02          	cmpl   $0x2,-0x8(%rbx)
   26683:	74 d3                	je     26658 <JS_CallInternal+0x1288>
   26685:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   26689:	e9 50 ff ff ff       	jmp    265de <JS_CallInternal+0x120e>
   2668e:	f3 0f 1e fa          	endbr64
   26692:	83 7b f8 03          	cmpl   $0x3,-0x8(%rbx)
   26696:	75 ed                	jne    26685 <JS_CallInternal+0x12b5>
   26698:	eb be                	jmp    26658 <JS_CallInternal+0x1288>
   2669a:	f3 0f 1e fa          	endbr64
   2669e:	8b 43 f8             	mov    -0x8(%rbx),%eax
   266a1:	83 e8 02             	sub    $0x2,%eax
   266a4:	83 f8 01             	cmp    $0x1,%eax
   266a7:	77 dc                	ja     26685 <JS_CallInternal+0x12b5>
   266a9:	eb ad                	jmp    26658 <JS_CallInternal+0x1288>
   266ab:	f3 0f 1e fa          	endbr64
   266af:	41 0f b6 04 24       	movzbl (%r12),%eax
   266b4:	49 83 c4 01          	add    $0x1,%r12
   266b8:	49 89 c2             	mov    %rax,%r10
   266bb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   266bf:	ff e0                	jmp    *%rax
   266c1:	f3 0f 1e fa          	endbr64
   266c5:	41 0f b7 04 24       	movzwl (%r12),%eax
   266ca:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   266cf:	48 c1 e0 04          	shl    $0x4,%rax
   266d3:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   266da:	48 8b 50 08          	mov    0x8(%rax),%rdx
   266de:	48 8b 08             	mov    (%rax),%rcx
   266e1:	0f 11 00             	movups %xmm0,(%rax)
   266e4:	83 fa f6             	cmp    $0xfffffff6,%edx
   266e7:	76 11                	jbe    266fa <JS_CallInternal+0x132a>
   266e9:	8b 41 fc             	mov    -0x4(%rcx),%eax
   266ec:	83 e8 01             	sub    $0x1,%eax
   266ef:	89 41 fc             	mov    %eax,-0x4(%rcx)
   266f2:	85 c0                	test   %eax,%eax
   266f4:	0f 8e 1e 74 00 00    	jle    2db18 <JS_CallInternal+0x8748>
   266fa:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   26700:	48 83 eb 10          	sub    $0x10,%rbx
   26704:	49 83 c4 03          	add    $0x3,%r12
   26708:	49 89 c2             	mov    %rax,%r10
   2670b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2670f:	ff e0                	jmp    *%rax
   26711:	f3 0f 1e fa          	endbr64
   26715:	41 0f b7 04 24       	movzwl (%r12),%eax
   2671a:	48 c1 e0 04          	shl    $0x4,%rax
   2671e:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   26725:	48 8b 10             	mov    (%rax),%rdx
   26728:	48 8b 40 08          	mov    0x8(%rax),%rax
   2672c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2672f:	76 04                	jbe    26735 <JS_CallInternal+0x1365>
   26731:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26735:	48 89 13             	mov    %rdx,(%rbx)
   26738:	49 83 c4 03          	add    $0x3,%r12
   2673c:	48 83 c3 10          	add    $0x10,%rbx
   26740:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26744:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2674a:	49 89 c2             	mov    %rax,%r10
   2674d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26751:	ff e0                	jmp    *%rax
   26753:	f3 0f 1e fa          	endbr64
   26757:	e9 a4 ef ff ff       	jmp    25700 <JS_CallInternal+0x330>
   2675c:	f3 0f 1e fa          	endbr64
   26760:	e9 9b ef ff ff       	jmp    25700 <JS_CallInternal+0x330>
   26765:	f3 0f 1e fa          	endbr64
   26769:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2676d:	83 f8 fa             	cmp    $0xfffffffa,%eax
   26770:	0f 8d 91 5b 00 00    	jge    2c307 <JS_CallInternal+0x6f37>
   26776:	83 f8 f8             	cmp    $0xfffffff8,%eax
   26779:	0f 8c 90 5b 00 00    	jl     2c30f <JS_CallInternal+0x6f3f>
   2677f:	41 0f b6 04 24       	movzbl (%r12),%eax
   26784:	49 83 c4 01          	add    $0x1,%r12
   26788:	49 89 c2             	mov    %rax,%r10
   2678b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2678f:	ff e0                	jmp    *%rax
   26791:	f3 0f 1e fa          	endbr64
   26795:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   26799:	74 4d                	je     267e8 <JS_CallInternal+0x1418>
   2679b:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   267a2:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   267a6:	4c 89 ef             	mov    %r13,%rdi
   267a9:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   267ad:	4c 89 60 30          	mov    %r12,0x30(%rax)
   267b1:	e8 9a 51 02 00       	call   4b950 <JS_ToObject>
   267b6:	48 89 d1             	mov    %rdx,%rcx
   267b9:	83 fa 06             	cmp    $0x6,%edx
   267bc:	0f 84 3e f4 ff ff    	je     25c00 <JS_CallInternal+0x830>
   267c2:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   267c6:	83 fe f6             	cmp    $0xfffffff6,%esi
   267c9:	76 15                	jbe    267e0 <JS_CallInternal+0x1410>
   267cb:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   267cf:	8b 57 fc             	mov    -0x4(%rdi),%edx
   267d2:	83 ea 01             	sub    $0x1,%edx
   267d5:	89 57 fc             	mov    %edx,-0x4(%rdi)
   267d8:	85 d2                	test   %edx,%edx
   267da:	0f 8e 73 89 00 00    	jle    2f153 <JS_CallInternal+0x9d83>
   267e0:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   267e4:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   267e8:	41 0f b6 04 24       	movzbl (%r12),%eax
   267ed:	49 83 c4 01          	add    $0x1,%r12
   267f1:	49 89 c2             	mov    %rax,%r10
   267f4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   267f8:	ff e0                	jmp    *%rax
   267fa:	f3 0f 1e fa          	endbr64
   267fe:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   26805:	4d 8d 4c 24 04       	lea    0x4(%r12),%r9
   2680a:	41 8b 0c 24          	mov    (%r12),%ecx
   2680e:	4c 89 48 30          	mov    %r9,0x30(%rax)
   26812:	49 8b 85 90 01 00 00 	mov    0x190(%r13),%rax
   26819:	89 ce                	mov    %ecx,%esi
   2681b:	48 8b 50 18          	mov    0x18(%rax),%rdx
   2681f:	8b 42 18             	mov    0x18(%rdx),%eax
   26822:	21 c6                	and    %eax,%esi
   26824:	8b 74 b2 38          	mov    0x38(%rdx,%rsi,4),%esi
   26828:	48 85 f6             	test   %rsi,%rsi
   2682b:	0f 84 96 66 00 00    	je     2cec7 <JS_CallInternal+0x7af7>
   26831:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   26838:	00 
   26839:	48 8d 44 f7 f8       	lea    -0x8(%rdi,%rsi,8),%rax
   2683e:	48 01 d0             	add    %rdx,%rax
   26841:	3b 48 04             	cmp    0x4(%rax),%ecx
   26844:	0f 85 6f 66 00 00    	jne    2ceb9 <JS_CallInternal+0x7ae9>
   2684a:	31 c0                	xor    %eax,%eax
   2684c:	48 89 03             	mov    %rax,(%rbx)
   2684f:	49 83 c4 05          	add    $0x5,%r12
   26853:	48 83 c3 10          	add    $0x10,%rbx
   26857:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2685e:	00 
   2685f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26865:	49 89 c2             	mov    %rax,%r10
   26868:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2686c:	ff e0                	jmp    *%rax
   2686e:	f3 0f 1e fa          	endbr64
   26872:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   26879:	48 8b 4b e8          	mov    -0x18(%rbx),%rcx
   2687d:	4c 89 ef             	mov    %r13,%rdi
   26880:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26884:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26888:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2688c:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   26893:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2689a:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2689e:	48 89 b5 d0 fd ff ff 	mov    %rsi,-0x230(%rbp)
   268a5:	48 89 c2             	mov    %rax,%rdx
   268a8:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   268af:	e8 7c 0a 02 00       	call   47330 <JS_ValueToAtom>
   268b4:	85 c0                	test   %eax,%eax
   268b6:	0f 84 44 f3 ff ff    	je     25c00 <JS_CallInternal+0x830>
   268bc:	48 8b b5 f8 fd ff ff 	mov    -0x208(%rbp),%rsi
   268c3:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   268ca:	89 c1                	mov    %eax,%ecx
   268cc:	4c 89 ef             	mov    %r13,%rdi
   268cf:	41 b8 00 80 00 00    	mov    $0x8000,%r8d
   268d5:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
   268db:	e8 90 7a 02 00       	call   4e370 <JS_DeleteProperty>
   268e0:	44 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9d
   268e7:	89 c1                	mov    %eax,%ecx
   268e9:	41 81 f9 f2 00 00 00 	cmp    $0xf2,%r9d
   268f0:	0f 8f 8a 65 00 00    	jg     2ce80 <JS_CallInternal+0x7ab0>
   268f6:	85 c9                	test   %ecx,%ecx
   268f8:	0f 88 02 f3 ff ff    	js     25c00 <JS_CallInternal+0x830>
   268fe:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   26905:	76 1e                	jbe    26925 <JS_CallInternal+0x1555>
   26907:	48 8b bd f8 fd ff ff 	mov    -0x208(%rbp),%rdi
   2690e:	8b 47 fc             	mov    -0x4(%rdi),%eax
   26911:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
   26917:	83 e8 01             	sub    $0x1,%eax
   2691a:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2691d:	85 c0                	test   %eax,%eax
   2691f:	0f 8e de 75 00 00    	jle    2df03 <JS_CallInternal+0x8b33>
   26925:	83 bd e0 fd ff ff f6 	cmpl   $0xfffffff6,-0x220(%rbp)
   2692c:	76 1e                	jbe    2694c <JS_CallInternal+0x157c>
   2692e:	48 8b bd d0 fd ff ff 	mov    -0x230(%rbp),%rdi
   26935:	8b 47 fc             	mov    -0x4(%rdi),%eax
   26938:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2693e:	83 e8 01             	sub    $0x1,%eax
   26941:	89 47 fc             	mov    %eax,-0x4(%rdi)
   26944:	85 c0                	test   %eax,%eax
   26946:	0f 8e 3c 7d 00 00    	jle    2e688 <JS_CallInternal+0x92b8>
   2694c:	31 c0                	xor    %eax,%eax
   2694e:	85 c9                	test   %ecx,%ecx
   26950:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   26957:	00 
   26958:	0f 95 c0             	setne  %al
   2695b:	48 83 eb 10          	sub    $0x10,%rbx
   2695f:	49 83 c4 01          	add    $0x1,%r12
   26963:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26967:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2696d:	49 89 c2             	mov    %rax,%r10
   26970:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26974:	ff e0                	jmp    *%rax
   26976:	f3 0f 1e fa          	endbr64
   2697a:	4d 8d 54 24 02       	lea    0x2(%r12),%r10
   2697f:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   26983:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   26987:	4c 89 ef             	mov    %r13,%rdi
   2698a:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   26991:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   26996:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   2699a:	b9 02 00 00 00       	mov    $0x2,%ecx
   2699f:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   269a6:	4c 89 50 30          	mov    %r10,0x30(%rax)
   269aa:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   269b1:	e8 4a 5e 08 00       	call   ac800 <js_function_apply>
   269b6:	48 89 d1             	mov    %rdx,%rcx
   269b9:	83 fa 06             	cmp    $0x6,%edx
   269bc:	0f 84 91 7f 00 00    	je     2e953 <JS_CallInternal+0x9583>
   269c2:	48 8b 73 d8          	mov    -0x28(%rbx),%rsi
   269c6:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   269cd:	83 fe f6             	cmp    $0xfffffff6,%esi
   269d0:	76 15                	jbe    269e7 <JS_CallInternal+0x1617>
   269d2:	48 8b 7b d0          	mov    -0x30(%rbx),%rdi
   269d6:	8b 57 fc             	mov    -0x4(%rdi),%edx
   269d9:	83 ea 01             	sub    $0x1,%edx
   269dc:	89 57 fc             	mov    %edx,-0x4(%rdi)
   269df:	85 d2                	test   %edx,%edx
   269e1:	0f 8e 01 6e 00 00    	jle    2d7e8 <JS_CallInternal+0x8418>
   269e7:	49 8b 70 08          	mov    0x8(%r8),%rsi
   269eb:	83 fe f6             	cmp    $0xfffffff6,%esi
   269ee:	76 14                	jbe    26a04 <JS_CallInternal+0x1634>
   269f0:	49 8b 38             	mov    (%r8),%rdi
   269f3:	8b 57 fc             	mov    -0x4(%rdi),%edx
   269f6:	83 ea 01             	sub    $0x1,%edx
   269f9:	89 57 fc             	mov    %edx,-0x4(%rdi)
   269fc:	85 d2                	test   %edx,%edx
   269fe:	0f 8e 68 6d 00 00    	jle    2d76c <JS_CallInternal+0x839c>
   26a04:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   26a08:	83 fe f6             	cmp    $0xfffffff6,%esi
   26a0b:	76 15                	jbe    26a22 <JS_CallInternal+0x1652>
   26a0d:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   26a11:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26a14:	83 ea 01             	sub    $0x1,%edx
   26a17:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26a1a:	85 d2                	test   %edx,%edx
   26a1c:	0f 8e 88 6d 00 00    	jle    2d7aa <JS_CallInternal+0x83da>
   26a22:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   26a26:	49 83 c4 03          	add    $0x3,%r12
   26a2a:	48 89 4b d8          	mov    %rcx,-0x28(%rbx)
   26a2e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26a34:	4c 89 c3             	mov    %r8,%rbx
   26a37:	49 89 c2             	mov    %rax,%r10
   26a3a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26a3e:	ff e0                	jmp    *%rax
   26a40:	f3 0f 1e fa          	endbr64
   26a44:	49 8b 75 30          	mov    0x30(%r13),%rsi
   26a48:	41 0f b7 14 24       	movzwl (%r12),%edx
   26a4d:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   26a52:	4c 89 ef             	mov    %r13,%rdi
   26a55:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   26a5c:	31 c9                	xor    %ecx,%ecx
   26a5e:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   26a62:	49 89 d1             	mov    %rdx,%r9
   26a65:	49 c1 e1 04          	shl    $0x4,%r9
   26a69:	89 95 00 fe ff ff    	mov    %edx,-0x200(%rbp)
   26a6f:	4c 29 cb             	sub    %r9,%rbx
   26a72:	48 89 95 d0 fd ff ff 	mov    %rdx,-0x230(%rbp)
   26a79:	ba 02 00 00 00       	mov    $0x2,%edx
   26a7e:	4c 89 8d e0 fd ff ff 	mov    %r9,-0x220(%rbp)
   26a85:	48 89 9d f8 fd ff ff 	mov    %rbx,-0x208(%rbp)
   26a8c:	e8 af 3e 02 00       	call   4a940 <JS_NewObjectFromShape>
   26a91:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   26a98:	4c 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%r9
   26a9f:	83 fa 06             	cmp    $0x6,%edx
   26aa2:	48 89 c1             	mov    %rax,%rcx
   26aa5:	49 89 d2             	mov    %rdx,%r10
   26aa8:	0f 84 09 80 00 00    	je     2eab7 <JS_CallInternal+0x96e7>
   26aae:	8b 95 00 fe ff ff    	mov    -0x200(%rbp),%edx
   26ab4:	85 d2                	test   %edx,%edx
   26ab6:	0f 85 ef 5b 00 00    	jne    2c6ab <JS_CallInternal+0x72db>
   26abc:	4d 89 50 08          	mov    %r10,0x8(%r8)
   26ac0:	49 8d 58 10          	lea    0x10(%r8),%rbx
   26ac4:	49 83 c4 03          	add    $0x3,%r12
   26ac8:	49 89 08             	mov    %rcx,(%r8)
   26acb:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26ad1:	49 89 c2             	mov    %rax,%r10
   26ad4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ad8:	ff e0                	jmp    *%rax
   26ada:	f3 0f 1e fa          	endbr64
   26ade:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26ae2:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26ae6:	4c 89 ef             	mov    %r13,%rdi
   26ae9:	48 83 eb 10          	sub    $0x10,%rbx
   26aed:	e8 fe df ff ff       	call   24af0 <JS_Throw>
   26af2:	e9 09 f1 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   26af7:	f3 0f 1e fa          	endbr64
   26afb:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26aff:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26b03:	4c 8d 4b f0          	lea    -0x10(%rbx),%r9
   26b07:	4c 8d 5b e0          	lea    -0x20(%rbx),%r11
   26b0b:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26b0f:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26b13:	4c 89 ef             	mov    %r13,%rdi
   26b16:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   26b1d:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   26b24:	e8 87 68 02 00       	call   4d3b0 <JS_AddBrand>
   26b29:	83 f8 ff             	cmp    $0xffffffff,%eax
   26b2c:	0f 84 ce f0 ff ff    	je     25c00 <JS_CallInternal+0x830>
   26b32:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   26b39:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   26b40:	49 8b 43 08          	mov    0x8(%r11),%rax
   26b44:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26b47:	76 15                	jbe    26b5e <JS_CallInternal+0x178e>
   26b49:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   26b4d:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   26b50:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26b53:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26b56:	85 d2                	test   %edx,%edx
   26b58:	0f 8e 4f 6f 00 00    	jle    2daad <JS_CallInternal+0x86dd>
   26b5e:	49 8b 41 08          	mov    0x8(%r9),%rax
   26b62:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26b65:	76 14                	jbe    26b7b <JS_CallInternal+0x17ab>
   26b67:	49 8b 09             	mov    (%r9),%rcx
   26b6a:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   26b6d:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26b70:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26b73:	85 d2                	test   %edx,%edx
   26b75:	0f 8e 88 6e 00 00    	jle    2da03 <JS_CallInternal+0x8633>
   26b7b:	41 0f b6 04 24       	movzbl (%r12),%eax
   26b80:	4c 89 db             	mov    %r11,%rbx
   26b83:	49 83 c4 01          	add    $0x1,%r12
   26b87:	49 89 c2             	mov    %rax,%r10
   26b8a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26b8e:	ff e0                	jmp    *%rax
   26b90:	f3 0f 1e fa          	endbr64
   26b94:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26b98:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   26b9c:	83 f8 03             	cmp    $0x3,%eax
   26b9f:	0f 87 b6 5e 00 00    	ja     2ca5b <JS_CallInternal+0x768b>
   26ba5:	31 c0                	xor    %eax,%eax
   26ba7:	85 d2                	test   %edx,%edx
   26ba9:	0f 95 c0             	setne  %al
   26bac:	85 c0                	test   %eax,%eax
   26bae:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26bb5:	00 
   26bb6:	0f 94 c0             	sete   %al
   26bb9:	49 83 c4 01          	add    $0x1,%r12
   26bbd:	0f b6 c0             	movzbl %al,%eax
   26bc0:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26bc4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26bca:	49 89 c2             	mov    %rax,%r10
   26bcd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26bd1:	ff e0                	jmp    *%rax
   26bd3:	f3 0f 1e fa          	endbr64
   26bd7:	49 8d 44 24 01       	lea    0x1(%r12),%rax
   26bdc:	48 8b 73 c0          	mov    -0x40(%rbx),%rsi
   26be0:	48 8b 53 c8          	mov    -0x38(%rbx),%rdx
   26be4:	4c 89 ef             	mov    %r13,%rdi
   26be7:	45 0f b6 14 24       	movzbl (%r12),%r10d
   26bec:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
   26bf3:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26bfa:	49 89 f0             	mov    %rsi,%r8
   26bfd:	49 89 d1             	mov    %rdx,%r9
   26c00:	48 89 41 30          	mov    %rax,0x30(%rcx)
   26c04:	44 89 d0             	mov    %r10d,%eax
   26c07:	83 e0 01             	and    $0x1,%eax
   26c0a:	44 88 95 f8 fd ff ff 	mov    %r10b,-0x208(%rbp)
   26c11:	3c 01                	cmp    $0x1,%al
   26c13:	19 c9                	sbb    %ecx,%ecx
   26c15:	48 83 ec 08          	sub    $0x8,%rsp
   26c19:	6a 00                	push   $0x0
   26c1b:	83 e1 ef             	and    $0xffffffef,%ecx
   26c1e:	83 c1 17             	add    $0x17,%ecx
   26c21:	e8 7a 99 00 00       	call   305a0 <JS_GetPropertyInternal>
   26c26:	41 5b                	pop    %r11
   26c28:	48 89 c6             	mov    %rax,%rsi
   26c2b:	58                   	pop    %rax
   26c2c:	83 fa 06             	cmp    $0x6,%edx
   26c2f:	0f 84 19 69 00 00    	je     2d54e <JS_CallInternal+0x817e>
   26c35:	8d 4a fe             	lea    -0x2(%rdx),%ecx
   26c38:	b8 01 00 00 00       	mov    $0x1,%eax
   26c3d:	83 f9 01             	cmp    $0x1,%ecx
   26c40:	0f 87 92 58 00 00    	ja     2c4d8 <JS_CallInternal+0x7108>
   26c46:	48 89 03             	mov    %rax,(%rbx)
   26c49:	49 83 c4 02          	add    $0x2,%r12
   26c4d:	48 83 c3 10          	add    $0x10,%rbx
   26c51:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26c58:	00 
   26c59:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26c5f:	49 89 c2             	mov    %rax,%r10
   26c62:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26c66:	ff e0                	jmp    *%rax
   26c68:	f3 0f 1e fa          	endbr64
   26c6c:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   26c73:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   26c77:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   26c7b:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26c7f:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   26c83:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26c8a:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26c8e:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   26c95:	83 f8 ff             	cmp    $0xffffffff,%eax
   26c98:	0f 85 b6 95 00 00    	jne    30254 <JS_CallInternal+0xae84>
   26c9e:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   26ca2:	0f 84 60 5e 00 00    	je     2cb08 <JS_CallInternal+0x7738>
   26ca8:	4c 89 ca             	mov    %r9,%rdx
   26cab:	4c 89 d6             	mov    %r10,%rsi
   26cae:	4c 89 ef             	mov    %r13,%rdi
   26cb1:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   26cb8:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   26cbf:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   26cc6:	e8 65 06 02 00       	call   47330 <JS_ValueToAtom>
   26ccb:	89 c2                	mov    %eax,%edx
   26ccd:	85 d2                	test   %edx,%edx
   26ccf:	0f 84 2b ef ff ff    	je     25c00 <JS_CallInternal+0x830>
   26cd5:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   26cdc:	89 d1                	mov    %edx,%ecx
   26cde:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   26ce5:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   26cec:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   26cf3:	48 8b 70 18          	mov    0x18(%rax),%rsi
   26cf7:	8b 46 18             	mov    0x18(%rsi),%eax
   26cfa:	21 c1                	and    %eax,%ecx
   26cfc:	8b 4c 8e 38          	mov    0x38(%rsi,%rcx,4),%ecx
   26d00:	48 85 c9             	test   %rcx,%rcx
   26d03:	0f 84 e9 86 00 00    	je     2f3f2 <JS_CallInternal+0xa022>
   26d09:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   26d10:	00 
   26d11:	48 8d 44 cf f8       	lea    -0x8(%rdi,%rcx,8),%rax
   26d16:	48 01 f0             	add    %rsi,%rax
   26d19:	3b 50 04             	cmp    0x4(%rax),%edx
   26d1c:	0f 85 c2 86 00 00    	jne    2f3e4 <JS_CallInternal+0xa014>
   26d22:	b8 01 00 00 00       	mov    $0x1,%eax
   26d27:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   26d2d:	0f 8f 19 65 00 00    	jg     2d24c <JS_CallInternal+0x7e7c>
   26d33:	83 bd f8 fd ff ff f6 	cmpl   $0xfffffff6,-0x208(%rbp)
   26d3a:	76 1e                	jbe    26d5a <JS_CallInternal+0x198a>
   26d3c:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   26d43:	8b 51 fc             	mov    -0x4(%rcx),%edx
   26d46:	89 95 e0 fd ff ff    	mov    %edx,-0x220(%rbp)
   26d4c:	83 ea 01             	sub    $0x1,%edx
   26d4f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26d52:	85 d2                	test   %edx,%edx
   26d54:	0f 8e 75 6d 00 00    	jle    2dacf <JS_CallInternal+0x86ff>
   26d5a:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   26d5e:	76 13                	jbe    26d73 <JS_CallInternal+0x19a3>
   26d60:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   26d64:	8d 51 ff             	lea    -0x1(%rcx),%edx
   26d67:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   26d6b:	85 d2                	test   %edx,%edx
   26d6d:	0f 8e 49 6c 00 00    	jle    2d9bc <JS_CallInternal+0x85ec>
   26d73:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26d77:	49 83 c4 01          	add    $0x1,%r12
   26d7b:	48 83 eb 10          	sub    $0x10,%rbx
   26d7f:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26d86:	00 
   26d87:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26d8d:	49 89 c2             	mov    %rax,%r10
   26d90:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26d94:	ff e0                	jmp    *%rax
   26d96:	f3 0f 1e fa          	endbr64
   26d9a:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   26da1:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26da5:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   26da9:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   26db0:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26db4:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26dbb:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26dbf:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   26dc6:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26dca:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   26dd1:	83 f8 ff             	cmp    $0xffffffff,%eax
   26dd4:	0f 85 fc 8e 00 00    	jne    2fcd6 <JS_CallInternal+0xa906>
   26dda:	48 8b b5 e0 fd ff ff 	mov    -0x220(%rbp),%rsi
   26de1:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   26de8:	4c 89 ef             	mov    %r13,%rdi
   26deb:	e8 40 05 02 00       	call   47330 <JS_ValueToAtom>
   26df0:	89 c1                	mov    %eax,%ecx
   26df2:	85 c0                	test   %eax,%eax
   26df4:	0f 84 06 ee ff ff    	je     25c00 <JS_CallInternal+0x830>
   26dfa:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   26e01:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   26e08:	4c 89 ef             	mov    %r13,%rdi
   26e0b:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
   26e11:	e8 4a 98 04 00       	call   70660 <JS_HasProperty>
   26e16:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   26e1c:	41 89 c0             	mov    %eax,%r8d
   26e1f:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   26e25:	0f 8f 12 61 00 00    	jg     2cf3d <JS_CallInternal+0x7b6d>
   26e2b:	45 85 c0             	test   %r8d,%r8d
   26e2e:	0f 88 cc ed ff ff    	js     25c00 <JS_CallInternal+0x830>
   26e34:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   26e3b:	76 1e                	jbe    26e5b <JS_CallInternal+0x1a8b>
   26e3d:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   26e44:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26e47:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
   26e4d:	83 e8 01             	sub    $0x1,%eax
   26e50:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26e53:	85 c0                	test   %eax,%eax
   26e55:	0f 8e ea 77 00 00    	jle    2e645 <JS_CallInternal+0x9275>
   26e5b:	83 bd f8 fd ff ff f6 	cmpl   $0xfffffff6,-0x208(%rbp)
   26e62:	76 1e                	jbe    26e82 <JS_CallInternal+0x1ab2>
   26e64:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   26e6b:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26e6e:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   26e74:	83 e8 01             	sub    $0x1,%eax
   26e77:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26e7a:	85 c0                	test   %eax,%eax
   26e7c:	0f 8e ef 7a 00 00    	jle    2e971 <JS_CallInternal+0x95a1>
   26e82:	31 c0                	xor    %eax,%eax
   26e84:	45 85 c0             	test   %r8d,%r8d
   26e87:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   26e8e:	00 
   26e8f:	0f 95 c0             	setne  %al
   26e92:	48 83 eb 10          	sub    $0x10,%rbx
   26e96:	49 83 c4 01          	add    $0x1,%r12
   26e9a:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26e9e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26ea4:	49 89 c2             	mov    %rax,%r10
   26ea7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26eab:	ff e0                	jmp    *%rax
   26ead:	f3 0f 1e fa          	endbr64
   26eb1:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   26eb5:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   26eb9:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   26ebd:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   26ec1:	45 85 c0             	test   %r8d,%r8d
   26ec4:	0f 85 bd 6e 00 00    	jne    2dd87 <JS_CallInternal+0x89b7>
   26eca:	85 c9                	test   %ecx,%ecx
   26ecc:	0f 85 ae 55 00 00    	jne    2c480 <JS_CallInternal+0x70b0>
   26ed2:	31 c0                	xor    %eax,%eax
   26ed4:	44 39 d2             	cmp    %r10d,%edx
   26ed7:	0f 95 c0             	setne  %al
   26eda:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26ede:	49 83 c4 01          	add    $0x1,%r12
   26ee2:	48 83 eb 10          	sub    $0x10,%rbx
   26ee6:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26eed:	00 
   26eee:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26ef4:	49 89 c2             	mov    %rax,%r10
   26ef7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26efb:	ff e0                	jmp    *%rax
   26efd:	f3 0f 1e fa          	endbr64
   26f01:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26f05:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26f09:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   26f0d:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26f11:	85 d2                	test   %edx,%edx
   26f13:	0f 85 26 76 00 00    	jne    2e53f <JS_CallInternal+0x916f>
   26f19:	45 85 c0             	test   %r8d,%r8d
   26f1c:	0f 85 06 55 00 00    	jne    2c428 <JS_CallInternal+0x7058>
   26f22:	31 c0                	xor    %eax,%eax
   26f24:	44 39 d7             	cmp    %r10d,%edi
   26f27:	0f 94 c0             	sete   %al
   26f2a:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26f2e:	49 83 c4 01          	add    $0x1,%r12
   26f32:	48 83 eb 10          	sub    $0x10,%rbx
   26f36:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26f3d:	00 
   26f3e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26f44:	49 89 c2             	mov    %rax,%r10
   26f47:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f4b:	ff e0                	jmp    *%rax
   26f4d:	f3 0f 1e fa          	endbr64
   26f51:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26f55:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26f59:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   26f5d:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26f61:	85 d2                	test   %edx,%edx
   26f63:	0f 85 af 70 00 00    	jne    2e018 <JS_CallInternal+0x8c48>
   26f69:	45 85 c0             	test   %r8d,%r8d
   26f6c:	0f 85 8e 54 00 00    	jne    2c400 <JS_CallInternal+0x7030>
   26f72:	31 c9                	xor    %ecx,%ecx
   26f74:	44 39 cf             	cmp    %r9d,%edi
   26f77:	0f 94 c1             	sete   %cl
   26f7a:	83 f1 01             	xor    $0x1,%ecx
   26f7d:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   26f84:	00 
   26f85:	48 63 c1             	movslq %ecx,%rax
   26f88:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26f8c:	41 0f b6 04 24       	movzbl (%r12),%eax
   26f91:	48 83 eb 10          	sub    $0x10,%rbx
   26f95:	49 83 c4 01          	add    $0x1,%r12
   26f99:	49 89 c2             	mov    %rax,%r10
   26f9c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26fa0:	ff e0                	jmp    *%rax
   26fa2:	f3 0f 1e fa          	endbr64
   26fa6:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26faa:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26fae:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   26fb2:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   26fb6:	85 d2                	test   %edx,%edx
   26fb8:	0f 85 21 73 00 00    	jne    2e2df <JS_CallInternal+0x8f0f>
   26fbe:	85 c9                	test   %ecx,%ecx
   26fc0:	0f 85 90 54 00 00    	jne    2c456 <JS_CallInternal+0x7086>
   26fc6:	45 31 c0             	xor    %r8d,%r8d
   26fc9:	44 39 cf             	cmp    %r9d,%edi
   26fcc:	41 0f 94 c0          	sete   %r8b
   26fd0:	4d 63 c0             	movslq %r8d,%r8
   26fd3:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   26fda:	00 
   26fdb:	4c 89 43 e0          	mov    %r8,-0x20(%rbx)
   26fdf:	41 0f b6 04 24       	movzbl (%r12),%eax
   26fe4:	48 83 eb 10          	sub    $0x10,%rbx
   26fe8:	49 83 c4 01          	add    $0x1,%r12
   26fec:	49 89 c2             	mov    %rax,%r10
   26fef:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ff3:	ff e0                	jmp    *%rax
   26ff5:	f3 0f 1e fa          	endbr64
   26ff9:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   26ffd:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   27001:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27004:	76 04                	jbe    2700a <JS_CallInternal+0x1c3a>
   27006:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2700a:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2700e:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27012:	48 89 13             	mov    %rdx,(%rbx)
   27015:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27019:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2701c:	76 04                	jbe    27022 <JS_CallInternal+0x1c52>
   2701e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27022:	48 89 43 18          	mov    %rax,0x18(%rbx)
   27026:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2702a:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   2702e:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27032:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27035:	76 04                	jbe    2703b <JS_CallInternal+0x1c6b>
   27037:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2703b:	48 89 53 20          	mov    %rdx,0x20(%rbx)
   2703f:	49 83 c4 01          	add    $0x1,%r12
   27043:	48 83 c3 30          	add    $0x30,%rbx
   27047:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2704b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27051:	49 89 c2             	mov    %rax,%r10
   27054:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27058:	ff e0                	jmp    *%rax
   2705a:	f3 0f 1e fa          	endbr64
   2705e:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27062:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27066:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27069:	76 04                	jbe    2706f <JS_CallInternal+0x1c9f>
   2706b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2706f:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27073:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27077:	48 89 13             	mov    %rdx,(%rbx)
   2707a:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2707e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27081:	76 04                	jbe    27087 <JS_CallInternal+0x1cb7>
   27083:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27087:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   2708b:	49 83 c4 01          	add    $0x1,%r12
   2708f:	48 83 c3 20          	add    $0x20,%rbx
   27093:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27097:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2709d:	49 89 c2             	mov    %rax,%r10
   270a0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   270a4:	ff e0                	jmp    *%rax
   270a6:	f3 0f 1e fa          	endbr64
   270aa:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   270b1:	f3 0f 6f 63 f0       	movdqu -0x10(%rbx),%xmm4
   270b6:	4c 8b 53 f8          	mov    -0x8(%rbx),%r10
   270ba:	4c 89 60 30          	mov    %r12,0x30(%rax)
   270be:	0f 29 a5 00 fe ff ff 	movaps %xmm4,-0x200(%rbp)
   270c5:	41 83 fa ff          	cmp    $0xffffffff,%r10d
   270c9:	0f 84 de 52 00 00    	je     2c3ad <JS_CallInternal+0x6fdd>
   270cf:	41 83 fa 02          	cmp    $0x2,%r10d
   270d3:	0f 84 d4 52 00 00    	je     2c3ad <JS_CallInternal+0x6fdd>
   270d9:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   270dd:	76 18                	jbe    270f7 <JS_CallInternal+0x1d27>
   270df:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   270e6:	8b 48 fc             	mov    -0x4(%rax),%ecx
   270e9:	8d 51 ff             	lea    -0x1(%rcx),%edx
   270ec:	89 50 fc             	mov    %edx,-0x4(%rax)
   270ef:	85 d2                	test   %edx,%edx
   270f1:	0f 8e 3c 68 00 00    	jle    2d933 <JS_CallInternal+0x8563>
   270f7:	41 0f b6 04 24       	movzbl (%r12),%eax
   270fc:	48 83 eb 10          	sub    $0x10,%rbx
   27100:	49 83 c4 01          	add    $0x1,%r12
   27104:	49 89 c2             	mov    %rax,%r10
   27107:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2710b:	ff e0                	jmp    *%rax
   2710d:	f3 0f 1e fa          	endbr64
   27111:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   27115:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27119:	4c 89 ef             	mov    %r13,%rdi
   2711c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27120:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   27124:	e8 e7 05 02 00       	call   47710 <JS_DefineObjectNameComputed.constprop.0>
   27129:	83 f8 ff             	cmp    $0xffffffff,%eax
   2712c:	0f 84 ce ea ff ff    	je     25c00 <JS_CallInternal+0x830>
   27132:	41 0f b6 04 24       	movzbl (%r12),%eax
   27137:	49 83 c4 01          	add    $0x1,%r12
   2713b:	49 89 c2             	mov    %rax,%r10
   2713e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27142:	ff e0                	jmp    *%rax
   27144:	f3 0f 1e fa          	endbr64
   27148:	41 8b 0c 24          	mov    (%r12),%ecx
   2714c:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27150:	4c 89 ef             	mov    %r13,%rdi
   27153:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27157:	e8 b4 54 01 00       	call   3c610 <JS_DefineObjectName.constprop.0>
   2715c:	83 f8 ff             	cmp    $0xffffffff,%eax
   2715f:	0f 84 f4 6c 00 00    	je     2de59 <JS_CallInternal+0x8a89>
   27165:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2716b:	49 83 c4 05          	add    $0x5,%r12
   2716f:	49 89 c2             	mov    %rax,%r10
   27172:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27176:	ff e0                	jmp    *%rax
   27178:	f3 0f 1e fa          	endbr64
   2717c:	48 83 ec 08          	sub    $0x8,%rsp
   27180:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   27184:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   27188:	4c 89 ef             	mov    %r13,%rdi
   2718b:	41 8b 0c 24          	mov    (%r12),%ecx
   2718f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27193:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   27197:	68 07 40 00 00       	push   $0x4007
   2719c:	e8 6f c4 00 00       	call   33610 <JS_DefinePropertyValue>
   271a1:	41 58                	pop    %r8
   271a3:	41 59                	pop    %r9
   271a5:	85 c0                	test   %eax,%eax
   271a7:	0f 88 66 76 00 00    	js     2e813 <JS_CallInternal+0x9443>
   271ad:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   271b3:	48 83 eb 10          	sub    $0x10,%rbx
   271b7:	49 83 c4 05          	add    $0x5,%r12
   271bb:	49 89 c2             	mov    %rax,%r10
   271be:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   271c2:	ff e0                	jmp    *%rax
   271c4:	f3 0f 1e fa          	endbr64
   271c8:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   271cc:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   271d0:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   271d4:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   271db:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   271df:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   271e6:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   271ea:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   271ee:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   271f5:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   271f9:	0f 85 44 6c 00 00    	jne    2de43 <JS_CallInternal+0x8a73>
   271ff:	83 f8 f8             	cmp    $0xfffffff8,%eax
   27202:	0f 85 25 6c 00 00    	jne    2de2d <JS_CallInternal+0x8a5d>
   27208:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2720c:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   27213:	e8 e8 0f ff ff       	call   18200 <js_get_atom_index>
   27218:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2721f:	89 c6                	mov    %eax,%esi
   27221:	49 8b 48 18          	mov    0x18(%r8),%rcx
   27225:	89 f2                	mov    %esi,%edx
   27227:	8b 41 18             	mov    0x18(%rcx),%eax
   2722a:	21 c2                	and    %eax,%edx
   2722c:	8b 54 91 38          	mov    0x38(%rcx,%rdx,4),%edx
   27230:	48 85 d2             	test   %rdx,%rdx
   27233:	0f 84 90 4c 00 00    	je     2bec9 <JS_CallInternal+0x6af9>
   27239:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   27240:	00 
   27241:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   27246:	48 01 c8             	add    %rcx,%rax
   27249:	3b 70 04             	cmp    0x4(%rax),%esi
   2724c:	0f 85 69 4c 00 00    	jne    2bebb <JS_CallInternal+0x6aeb>
   27252:	48 8d 0d eb 1e 0b 00 	lea    0xb1eeb(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   27259:	48 8d 15 18 5c 0b 00 	lea    0xb5c18(%rip),%rdx        # dce78 <_IO_stdin_used+0x3e78>
   27260:	4c 89 ef             	mov    %r13,%rdi
   27263:	31 c0                	xor    %eax,%eax
   27265:	e8 e6 d4 00 00       	call   34750 <__JS_ThrowTypeErrorAtom>
   2726a:	83 bd e0 fd ff ff f6 	cmpl   $0xfffffff6,-0x220(%rbp)
   27271:	76 1e                	jbe    27291 <JS_CallInternal+0x1ec1>
   27273:	48 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%rbx
   2727a:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2727d:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   27283:	83 e8 01             	sub    $0x1,%eax
   27286:	89 43 fc             	mov    %eax,-0x4(%rbx)
   27289:	85 c0                	test   %eax,%eax
   2728b:	0f 8e c2 8b 00 00    	jle    2fe53 <JS_CallInternal+0xaa83>
   27291:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   27298:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2729c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2729f:	0f 86 5b e9 ff ff    	jbe    25c00 <JS_CallInternal+0x830>
   272a5:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   272ac:	48 8b 0b             	mov    (%rbx),%rcx
   272af:	8b 79 fc             	mov    -0x4(%rcx),%edi
   272b2:	8d 57 ff             	lea    -0x1(%rdi),%edx
   272b5:	89 51 fc             	mov    %edx,-0x4(%rcx)
   272b8:	85 d2                	test   %edx,%edx
   272ba:	0f 8f 40 e9 ff ff    	jg     25c00 <JS_CallInternal+0x830>
   272c0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   272c4:	48 89 c2             	mov    %rax,%rdx
   272c7:	48 89 ce             	mov    %rcx,%rsi
   272ca:	e8 51 76 ff ff       	call   1e920 <__JS_FreeValueRT>
   272cf:	e9 2c e9 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   272d4:	0f 1f 40 00          	nopl   0x0(%rax)
   272d8:	f3 0f 1e fa          	endbr64
   272dc:	41 0f b7 04 24       	movzwl (%r12),%eax
   272e1:	48 c1 e0 04          	shl    $0x4,%rax
   272e5:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   272ec:	48 8b 50 08          	mov    0x8(%rax),%rdx
   272f0:	48 8b 08             	mov    (%rax),%rcx
   272f3:	48 c7 40 08 04 00 00 	movq   $0x4,0x8(%rax)
   272fa:	00 
   272fb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   27302:	83 fa f6             	cmp    $0xfffffff6,%edx
   27305:	76 11                	jbe    27318 <JS_CallInternal+0x1f48>
   27307:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2730a:	83 e8 01             	sub    $0x1,%eax
   2730d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   27310:	85 c0                	test   %eax,%eax
   27312:	0f 8e c6 66 00 00    	jle    2d9de <JS_CallInternal+0x860e>
   27318:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2731e:	49 83 c4 03          	add    $0x3,%r12
   27322:	49 89 c2             	mov    %rax,%r10
   27325:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27329:	ff e0                	jmp    *%rax
   2732b:	f3 0f 1e fa          	endbr64
   2732f:	41 0f b7 14 24       	movzwl (%r12),%edx
   27334:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   2733b:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   27340:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   27344:	48 8b 40 18          	mov    0x18(%rax),%rax
   27348:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2734c:	0f 85 61 6d 00 00    	jne    2e0b3 <JS_CallInternal+0x8ce3>
   27352:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27357:	49 83 c4 03          	add    $0x3,%r12
   2735b:	48 83 eb 10          	sub    $0x10,%rbx
   2735f:	0f 11 00             	movups %xmm0,(%rax)
   27362:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27368:	49 89 c2             	mov    %rax,%r10
   2736b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2736f:	ff e0                	jmp    *%rax
   27371:	f3 0f 1e fa          	endbr64
   27375:	41 0f b7 34 24       	movzwl (%r12),%esi
   2737a:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   27381:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   27386:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
   2738a:	48 8b 50 18          	mov    0x18(%rax),%rdx
   2738e:	48 8b 42 08          	mov    0x8(%rdx),%rax
   27392:	83 f8 04             	cmp    $0x4,%eax
   27395:	0f 84 cc 6b 00 00    	je     2df67 <JS_CallInternal+0x8b97>
   2739b:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   273a0:	48 8b 0a             	mov    (%rdx),%rcx
   273a3:	0f 11 02             	movups %xmm0,(%rdx)
   273a6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   273a9:	76 11                	jbe    273bc <JS_CallInternal+0x1fec>
   273ab:	8b 79 fc             	mov    -0x4(%rcx),%edi
   273ae:	8d 57 ff             	lea    -0x1(%rdi),%edx
   273b1:	89 51 fc             	mov    %edx,-0x4(%rcx)
   273b4:	85 d2                	test   %edx,%edx
   273b6:	0f 8e 33 66 00 00    	jle    2d9ef <JS_CallInternal+0x861f>
   273bc:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   273c2:	48 83 eb 10          	sub    $0x10,%rbx
   273c6:	49 83 c4 03          	add    $0x3,%r12
   273ca:	49 89 c2             	mov    %rax,%r10
   273cd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   273d1:	ff e0                	jmp    *%rax
   273d3:	f3 0f 1e fa          	endbr64
   273d7:	31 c0                	xor    %eax,%eax
   273d9:	b9 01 00 00 00       	mov    $0x1,%ecx
   273de:	e9 9d e8 ff ff       	jmp    25c80 <JS_CallInternal+0x8b0>
   273e3:	f3 0f 1e fa          	endbr64
   273e7:	31 c0                	xor    %eax,%eax
   273e9:	31 c9                	xor    %ecx,%ecx
   273eb:	e9 90 e8 ff ff       	jmp    25c80 <JS_CallInternal+0x8b0>
   273f0:	f3 0f 1e fa          	endbr64
   273f4:	e9 07 e3 ff ff       	jmp    25700 <JS_CallInternal+0x330>
   273f9:	f3 0f 1e fa          	endbr64
   273fd:	31 c0                	xor    %eax,%eax
   273ff:	b9 03 00 00 00       	mov    $0x3,%ecx
   27404:	e9 77 e8 ff ff       	jmp    25c80 <JS_CallInternal+0x8b0>
   27409:	f3 0f 1e fa          	endbr64
   2740d:	b8 03 00 00 00       	mov    $0x3,%eax
   27412:	31 c9                	xor    %ecx,%ecx
   27414:	e9 67 e8 ff ff       	jmp    25c80 <JS_CallInternal+0x8b0>
   27419:	f3 0f 1e fa          	endbr64
   2741d:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   27421:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27425:	4c 89 ef             	mov    %r13,%rdi
   27428:	4c 89 c2             	mov    %r8,%rdx
   2742b:	e8 30 da ff ff       	call   24e60 <js_operator_typeof>
   27430:	89 c1                	mov    %eax,%ecx
   27432:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   27436:	76 11                	jbe    27449 <JS_CallInternal+0x2079>
   27438:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2743b:	83 e8 01             	sub    $0x1,%eax
   2743e:	89 46 fc             	mov    %eax,-0x4(%rsi)
   27441:	85 c0                	test   %eax,%eax
   27443:	0f 8e 5b 68 00 00    	jle    2dca4 <JS_CallInternal+0x88d4>
   27449:	ba 01 00 00 00       	mov    $0x1,%edx
   2744e:	89 ce                	mov    %ecx,%esi
   27450:	4c 89 ef             	mov    %r13,%rdi
   27453:	49 83 c4 01          	add    $0x1,%r12
   27457:	e8 64 4c 01 00       	call   3c0c0 <__JS_AtomToValue>
   2745c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27460:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   27464:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2746a:	49 89 c2             	mov    %rax,%r10
   2746d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27471:	ff e0                	jmp    *%rax
   27473:	f3 0f 1e fa          	endbr64
   27477:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2747e:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27482:	4c 89 ef             	mov    %r13,%rdi
   27485:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   27489:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2748d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27491:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   27495:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2749c:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   274a3:	48 89 b5 d0 fd ff ff 	mov    %rsi,-0x230(%rbp)
   274aa:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   274b1:	e8 5a e4 06 00       	call   95910 <JS_IsInstanceOf>
   274b6:	85 c0                	test   %eax,%eax
   274b8:	0f 88 42 e7 ff ff    	js     25c00 <JS_CallInternal+0x830>
   274be:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   274c5:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   274cc:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   274d3:	83 fa f6             	cmp    $0xfffffff6,%edx
   274d6:	76 18                	jbe    274f0 <JS_CallInternal+0x2120>
   274d8:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   274df:	8b 7e fc             	mov    -0x4(%rsi),%edi
   274e2:	83 ef 01             	sub    $0x1,%edi
   274e5:	89 7e fc             	mov    %edi,-0x4(%rsi)
   274e8:	85 ff                	test   %edi,%edi
   274ea:	0f 8e b8 78 00 00    	jle    2eda8 <JS_CallInternal+0x99d8>
   274f0:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   274f4:	76 11                	jbe    27507 <JS_CallInternal+0x2137>
   274f6:	8b 51 fc             	mov    -0x4(%rcx),%edx
   274f9:	83 ea 01             	sub    $0x1,%edx
   274fc:	89 51 fc             	mov    %edx,-0x4(%rcx)
   274ff:	85 d2                	test   %edx,%edx
   27501:	0f 8e 75 78 00 00    	jle    2ed7c <JS_CallInternal+0x99ac>
   27507:	85 c0                	test   %eax,%eax
   27509:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   27510:	00 
   27511:	0f 95 c0             	setne  %al
   27514:	48 83 eb 10          	sub    $0x10,%rbx
   27518:	49 83 c4 01          	add    $0x1,%r12
   2751c:	0f b6 c0             	movzbl %al,%eax
   2751f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27523:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27529:	49 89 c2             	mov    %rax,%r10
   2752c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27530:	ff e0                	jmp    *%rax
   27532:	f3 0f 1e fa          	endbr64
   27536:	44 8b 43 f8          	mov    -0x8(%rbx),%r8d
   2753a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2753e:	45 85 c0             	test   %r8d,%r8d
   27541:	0f 85 26 57 00 00    	jne    2cc6d <JS_CallInternal+0x789d>
   27547:	f7 d0                	not    %eax
   27549:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   27550:	00 
   27551:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27555:	41 0f b6 04 24       	movzbl (%r12),%eax
   2755a:	49 83 c4 01          	add    $0x1,%r12
   2755e:	49 89 c2             	mov    %rax,%r10
   27561:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27565:	ff e0                	jmp    *%rax
   27567:	f3 0f 1e fa          	endbr64
   2756b:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   27570:	4d 8d 44 24 01       	lea    0x1(%r12),%r8
   27575:	48 c1 e1 04          	shl    $0x4,%rcx
   27579:	48 03 8d 68 fe ff ff 	add    -0x198(%rbp),%rcx
   27580:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   27584:	48 8b 01             	mov    (%rcx),%rax
   27587:	85 d2                	test   %edx,%edx
   27589:	0f 85 b4 4c 00 00    	jne    2c243 <JS_CallInternal+0x6e73>
   2758f:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   27594:	0f 84 a9 4c 00 00    	je     2c243 <JS_CallInternal+0x6e73>
   2759a:	83 e8 01             	sub    $0x1,%eax
   2759d:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   275a4:	00 
   275a5:	48 89 01             	mov    %rax,(%rcx)
   275a8:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   275ae:	49 83 c4 02          	add    $0x2,%r12
   275b2:	49 89 c2             	mov    %rax,%r10
   275b5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   275b9:	ff e0                	jmp    *%rax
   275bb:	f3 0f 1e fa          	endbr64
   275bf:	e9 fa e1 ff ff       	jmp    257be <JS_CallInternal+0x3ee>
   275c4:	f3 0f 1e fa          	endbr64
   275c8:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   275cc:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   275d0:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
   275d5:	83 fa 03             	cmp    $0x3,%edx
   275d8:	0f 87 05 54 00 00    	ja     2c9e3 <JS_CallInternal+0x7613>
   275de:	48 83 eb 10          	sub    $0x10,%rbx
   275e2:	85 c0                	test   %eax,%eax
   275e4:	75 0d                	jne    275f3 <JS_CallInternal+0x2223>
   275e6:	41 0f be 04 24       	movsbl (%r12),%eax
   275eb:	83 e8 01             	sub    $0x1,%eax
   275ee:	48 98                	cltq
   275f0:	48 01 c1             	add    %rax,%rcx
   275f3:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   275fa:	83 e8 01             	sub    $0x1,%eax
   275fd:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   27604:	85 c0                	test   %eax,%eax
   27606:	0f 8e 46 6c 00 00    	jle    2e252 <JS_CallInternal+0x8e82>
   2760c:	0f b6 01             	movzbl (%rcx),%eax
   2760f:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   27613:	49 89 c2             	mov    %rax,%r10
   27616:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2761a:	f3 0f 1e fa          	endbr64
   2761e:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27622:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   27626:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
   2762b:	83 fa 03             	cmp    $0x3,%edx
   2762e:	0f 87 eb 53 00 00    	ja     2ca1f <JS_CallInternal+0x764f>
   27634:	48 83 eb 10          	sub    $0x10,%rbx
   27638:	85 c0                	test   %eax,%eax
   2763a:	74 0d                	je     27649 <JS_CallInternal+0x2279>
   2763c:	41 0f be 04 24       	movsbl (%r12),%eax
   27641:	83 e8 01             	sub    $0x1,%eax
   27644:	48 98                	cltq
   27646:	48 01 c1             	add    %rax,%rcx
   27649:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   27650:	83 e8 01             	sub    $0x1,%eax
   27653:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2765a:	85 c0                	test   %eax,%eax
   2765c:	0f 8e 2a 6d 00 00    	jle    2e38c <JS_CallInternal+0x8fbc>
   27662:	0f b6 01             	movzbl (%rcx),%eax
   27665:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   27669:	49 89 c2             	mov    %rax,%r10
   2766c:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   27670:	f3 0f 1e fa          	endbr64
   27674:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27678:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2767c:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   27681:	83 fa 03             	cmp    $0x3,%edx
   27684:	0f 87 77 53 00 00    	ja     2ca01 <JS_CallInternal+0x7631>
   2768a:	48 83 eb 10          	sub    $0x10,%rbx
   2768e:	85 c0                	test   %eax,%eax
   27690:	75 0c                	jne    2769e <JS_CallInternal+0x22ce>
   27692:	41 8b 04 24          	mov    (%r12),%eax
   27696:	83 e8 04             	sub    $0x4,%eax
   27699:	48 98                	cltq
   2769b:	48 01 c1             	add    %rax,%rcx
   2769e:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   276a5:	83 e8 01             	sub    $0x1,%eax
   276a8:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   276af:	85 c0                	test   %eax,%eax
   276b1:	0f 8e fb 6c 00 00    	jle    2e3b2 <JS_CallInternal+0x8fe2>
   276b7:	0f b6 01             	movzbl (%rcx),%eax
   276ba:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   276be:	49 89 c2             	mov    %rax,%r10
   276c1:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   276c5:	f3 0f 1e fa          	endbr64
   276c9:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   276cd:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   276d1:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   276d6:	83 fa 03             	cmp    $0x3,%edx
   276d9:	0f 87 5e 53 00 00    	ja     2ca3d <JS_CallInternal+0x766d>
   276df:	48 83 eb 10          	sub    $0x10,%rbx
   276e3:	85 c0                	test   %eax,%eax
   276e5:	74 0c                	je     276f3 <JS_CallInternal+0x2323>
   276e7:	41 8b 04 24          	mov    (%r12),%eax
   276eb:	83 e8 04             	sub    $0x4,%eax
   276ee:	48 98                	cltq
   276f0:	48 01 c1             	add    %rax,%rcx
   276f3:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   276fa:	83 e8 01             	sub    $0x1,%eax
   276fd:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   27704:	85 c0                	test   %eax,%eax
   27706:	0f 8e 5d 6a 00 00    	jle    2e169 <JS_CallInternal+0x8d99>
   2770c:	0f b6 01             	movzbl (%rcx),%eax
   2770f:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   27713:	49 89 c2             	mov    %rax,%r10
   27716:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2771a:	f3 0f 1e fa          	endbr64
   2771e:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   27725:	49 0f be 14 24       	movsbq (%r12),%rdx
   2772a:	83 e8 01             	sub    $0x1,%eax
   2772d:	4c 01 e2             	add    %r12,%rdx
   27730:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   27737:	85 c0                	test   %eax,%eax
   27739:	0f 8e 27 74 00 00    	jle    2eb66 <JS_CallInternal+0x9796>
   2773f:	0f b6 02             	movzbl (%rdx),%eax
   27742:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   27746:	49 89 c2             	mov    %rax,%r10
   27749:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2774d:	f3 0f 1e fa          	endbr64
   27751:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27755:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27759:	83 fa f6             	cmp    $0xfffffff6,%edx
   2775c:	76 04                	jbe    27762 <JS_CallInternal+0x2392>
   2775e:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27762:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   27769:	48 8b 47 38          	mov    0x38(%rdi),%rax
   2776d:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   27771:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   27775:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   27779:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2777c:	76 11                	jbe    2778f <JS_CallInternal+0x23bf>
   2777e:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27781:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27784:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27787:	85 d2                	test   %edx,%edx
   27789:	0f 8e e7 63 00 00    	jle    2db76 <JS_CallInternal+0x87a6>
   2778f:	41 0f b6 04 24       	movzbl (%r12),%eax
   27794:	49 83 c4 01          	add    $0x1,%r12
   27798:	49 89 c2             	mov    %rax,%r10
   2779b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2779f:	ff e0                	jmp    *%rax
   277a1:	f3 0f 1e fa          	endbr64
   277a5:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   277a9:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   277ad:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   277b1:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   277b5:	89 cf                	mov    %ecx,%edi
   277b7:	09 f7                	or     %esi,%edi
   277b9:	0f 85 ec 6c 00 00    	jne    2e4ab <JS_CallInternal+0x90db>
   277bf:	39 d0                	cmp    %edx,%eax
   277c1:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   277c8:	00 
   277c9:	0f 9e c0             	setle  %al
   277cc:	48 83 eb 10          	sub    $0x10,%rbx
   277d0:	0f b6 c0             	movzbl %al,%eax
   277d3:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   277d7:	41 0f b6 04 24       	movzbl (%r12),%eax
   277dc:	49 83 c4 01          	add    $0x1,%r12
   277e0:	49 89 c2             	mov    %rax,%r10
   277e3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   277e7:	ff e0                	jmp    *%rax
   277e9:	f3 0f 1e fa          	endbr64
   277ed:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   277f1:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   277f5:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   277f9:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   277fd:	89 cf                	mov    %ecx,%edi
   277ff:	09 f7                	or     %esi,%edi
   27801:	0f 85 64 6c 00 00    	jne    2e46b <JS_CallInternal+0x909b>
   27807:	39 d0                	cmp    %edx,%eax
   27809:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   27810:	00 
   27811:	0f 9c c0             	setl   %al
   27814:	48 83 eb 10          	sub    $0x10,%rbx
   27818:	0f b6 c0             	movzbl %al,%eax
   2781b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2781f:	41 0f b6 04 24       	movzbl (%r12),%eax
   27824:	49 83 c4 01          	add    $0x1,%r12
   27828:	49 89 c2             	mov    %rax,%r10
   2782b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2782f:	ff e0                	jmp    *%rax
   27831:	f3 0f 1e fa          	endbr64
   27835:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27839:	0b 53 e8             	or     -0x18(%rbx),%edx
   2783c:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27840:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27844:	0f 85 cb 6c 00 00    	jne    2e515 <JS_CallInternal+0x9145>
   2784a:	31 c8                	xor    %ecx,%eax
   2784c:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   27853:	00 
   27854:	48 83 eb 10          	sub    $0x10,%rbx
   27858:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2785c:	41 0f b6 04 24       	movzbl (%r12),%eax
   27861:	49 83 c4 01          	add    $0x1,%r12
   27865:	49 89 c2             	mov    %rax,%r10
   27868:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2786c:	ff e0                	jmp    *%rax
   2786e:	f3 0f 1e fa          	endbr64
   27872:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27876:	0b 53 e8             	or     -0x18(%rbx),%edx
   27879:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2787d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27881:	0f 85 64 6c 00 00    	jne    2e4eb <JS_CallInternal+0x911b>
   27887:	09 c8                	or     %ecx,%eax
   27889:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   27890:	00 
   27891:	48 83 eb 10          	sub    $0x10,%rbx
   27895:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27899:	41 0f b6 04 24       	movzbl (%r12),%eax
   2789e:	49 83 c4 01          	add    $0x1,%r12
   278a2:	49 89 c2             	mov    %rax,%r10
   278a5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   278a9:	ff e0                	jmp    *%rax
   278ab:	f3 0f 1e fa          	endbr64
   278af:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   278b3:	0b 53 e8             	or     -0x18(%rbx),%edx
   278b6:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   278ba:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   278be:	0f 85 53 6b 00 00    	jne    2e417 <JS_CallInternal+0x9047>
   278c4:	21 c8                	and    %ecx,%eax
   278c6:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   278cd:	00 
   278ce:	48 83 eb 10          	sub    $0x10,%rbx
   278d2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   278d6:	41 0f b6 04 24       	movzbl (%r12),%eax
   278db:	49 83 c4 01          	add    $0x1,%r12
   278df:	49 89 c2             	mov    %rax,%r10
   278e2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   278e6:	ff e0                	jmp    *%rax
   278e8:	f3 0f 1e fa          	endbr64
   278ec:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   278f0:	0b 53 e8             	or     -0x18(%rbx),%edx
   278f3:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   278f7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   278fb:	0f 85 8f 71 00 00    	jne    2ea90 <JS_CallInternal+0x96c0>
   27901:	d3 e8                	shr    %cl,%eax
   27903:	85 c0                	test   %eax,%eax
   27905:	0f 88 8d 4d 00 00    	js     2c698 <JS_CallInternal+0x72c8>
   2790b:	66 0f 6e c0          	movd   %eax,%xmm0
   2790f:	31 c0                	xor    %eax,%eax
   27911:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   27915:	48 83 eb 10          	sub    $0x10,%rbx
   27919:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2791e:	41 0f b6 04 24       	movzbl (%r12),%eax
   27923:	49 83 c4 01          	add    $0x1,%r12
   27927:	49 89 c2             	mov    %rax,%r10
   2792a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2792e:	ff e0                	jmp    *%rax
   27930:	f3 0f 1e fa          	endbr64
   27934:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27938:	0b 53 e8             	or     -0x18(%rbx),%edx
   2793b:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2793f:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27943:	0f 85 f8 6a 00 00    	jne    2e441 <JS_CallInternal+0x9071>
   27949:	d3 f8                	sar    %cl,%eax
   2794b:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   27952:	00 
   27953:	48 83 eb 10          	sub    $0x10,%rbx
   27957:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2795b:	41 0f b6 04 24       	movzbl (%r12),%eax
   27960:	49 83 c4 01          	add    $0x1,%r12
   27964:	49 89 c2             	mov    %rax,%r10
   27967:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2796b:	ff e0                	jmp    *%rax
   2796d:	f3 0f 1e fa          	endbr64
   27971:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27975:	0b 53 e8             	or     -0x18(%rbx),%edx
   27978:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2797c:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27980:	0f 85 55 6c 00 00    	jne    2e5db <JS_CallInternal+0x920b>
   27986:	d3 e0                	shl    %cl,%eax
   27988:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2798f:	00 
   27990:	48 83 eb 10          	sub    $0x10,%rbx
   27994:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27998:	41 0f b6 04 24       	movzbl (%r12),%eax
   2799d:	49 83 c4 01          	add    $0x1,%r12
   279a1:	49 89 c2             	mov    %rax,%r10
   279a4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   279a8:	ff e0                	jmp    *%rax
   279aa:	f3 0f 1e fa          	endbr64
   279ae:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   279b2:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   279b6:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   279ba:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   279be:	89 cf                	mov    %ecx,%edi
   279c0:	09 f7                	or     %esi,%edi
   279c2:	0f 85 3d 6c 00 00    	jne    2e605 <JS_CallInternal+0x9235>
   279c8:	39 c2                	cmp    %eax,%edx
   279ca:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   279d1:	00 
   279d2:	0f 9d c0             	setge  %al
   279d5:	48 83 eb 10          	sub    $0x10,%rbx
   279d9:	0f b6 c0             	movzbl %al,%eax
   279dc:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   279e0:	41 0f b6 04 24       	movzbl (%r12),%eax
   279e5:	49 83 c4 01          	add    $0x1,%r12
   279e9:	49 89 c2             	mov    %rax,%r10
   279ec:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   279f0:	ff e0                	jmp    *%rax
   279f2:	f3 0f 1e fa          	endbr64
   279f6:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   279fa:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   279fe:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27a02:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   27a06:	89 cf                	mov    %ecx,%edi
   27a08:	09 f7                	or     %esi,%edi
   27a0a:	0f 85 17 65 00 00    	jne    2df27 <JS_CallInternal+0x8b57>
   27a10:	39 c2                	cmp    %eax,%edx
   27a12:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   27a19:	00 
   27a1a:	0f 9f c0             	setg   %al
   27a1d:	48 83 eb 10          	sub    $0x10,%rbx
   27a21:	0f b6 c0             	movzbl %al,%eax
   27a24:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27a28:	41 0f b6 04 24       	movzbl (%r12),%eax
   27a2d:	49 83 c4 01          	add    $0x1,%r12
   27a31:	49 89 c2             	mov    %rax,%r10
   27a34:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a38:	ff e0                	jmp    *%rax
   27a3a:	f3 0f 1e fa          	endbr64
   27a3e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27a42:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27a46:	a9 f7 ff ff ff       	test   $0xfffffff7,%eax
   27a4b:	74 1b                	je     27a68 <JS_CallInternal+0x2698>
   27a4d:	83 e8 01             	sub    $0x1,%eax
   27a50:	83 f8 01             	cmp    $0x1,%eax
   27a53:	0f 87 bc 57 00 00    	ja     2d215 <JS_CallInternal+0x7e45>
   27a59:	83 e2 ff             	and    $0xffffffff,%edx
   27a5c:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   27a63:	00 
   27a64:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   27a68:	41 0f b6 04 24       	movzbl (%r12),%eax
   27a6d:	49 83 c4 01          	add    $0x1,%r12
   27a71:	49 89 c2             	mov    %rax,%r10
   27a74:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a78:	ff e0                	jmp    *%rax
   27a7a:	f3 0f 1e fa          	endbr64
   27a7e:	49 8d 44 24 01       	lea    0x1(%r12),%rax
   27a83:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   27a8a:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   27a91:	41 0f b6 04 24       	movzbl (%r12),%eax
   27a96:	48 c1 e0 04          	shl    $0x4,%rax
   27a9a:	48 03 41 50          	add    0x50(%rcx),%rax
   27a9e:	48 8b 10             	mov    (%rax),%rdx
   27aa1:	48 8b 40 08          	mov    0x8(%rax),%rax
   27aa5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27aa8:	76 04                	jbe    27aae <JS_CallInternal+0x26de>
   27aaa:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27aae:	48 92                	xchg   %rax,%rdx
   27ab0:	4c 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%r8
   27ab7:	45 31 c9             	xor    %r9d,%r9d
   27aba:	4c 89 ef             	mov    %r13,%rdi
   27abd:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   27ac4:	48 89 c6             	mov    %rax,%rsi
   27ac7:	e8 b4 74 02 00       	call   4ef80 <js_closure>
   27acc:	48 89 03             	mov    %rax,(%rbx)
   27acf:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27ad3:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27ad7:	0f 84 e9 67 00 00    	je     2e2c6 <JS_CallInternal+0x8ef6>
   27add:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   27ae3:	48 83 c3 10          	add    $0x10,%rbx
   27ae7:	49 83 c4 02          	add    $0x2,%r12
   27aeb:	49 89 c2             	mov    %rax,%r10
   27aee:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27af2:	ff e0                	jmp    *%rax
   27af4:	f3 0f 1e fa          	endbr64
   27af8:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   27aff:	41 0f b6 04 24       	movzbl (%r12),%eax
   27b04:	48 c1 e0 04          	shl    $0x4,%rax
   27b08:	48 03 41 50          	add    0x50(%rcx),%rax
   27b0c:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27b10:	48 8b 10             	mov    (%rax),%rdx
   27b13:	48 8b 40 08          	mov    0x8(%rax),%rax
   27b17:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b1a:	76 04                	jbe    27b20 <JS_CallInternal+0x2750>
   27b1c:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27b20:	48 89 13             	mov    %rdx,(%rbx)
   27b23:	49 83 c4 02          	add    $0x2,%r12
   27b27:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27b2b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27b31:	48 89 cb             	mov    %rcx,%rbx
   27b34:	49 89 c2             	mov    %rax,%r10
   27b37:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27b3b:	ff e0                	jmp    *%rax
   27b3d:	f3 0f 1e fa          	endbr64
   27b41:	41 0f b6 3c 24       	movzbl (%r12),%edi
   27b46:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
   27b4d:	4d 8d 54 24 01       	lea    0x1(%r12),%r10
   27b52:	45 31 c9             	xor    %r9d,%r9d
   27b55:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   27b5c:	89 fa                	mov    %edi,%edx
   27b5e:	89 f8                	mov    %edi,%eax
   27b60:	4c 89 51 30          	mov    %r10,0x30(%rcx)
   27b64:	c1 fa 02             	sar    $0x2,%edx
   27b67:	83 e0 03             	and    $0x3,%eax
   27b6a:	83 e2 07             	and    $0x7,%edx
   27b6d:	f7 d0                	not    %eax
   27b6f:	f7 d2                	not    %edx
   27b71:	48 98                	cltq
   27b73:	48 63 d2             	movslq %edx,%rdx
   27b76:	48 c1 e0 04          	shl    $0x4,%rax
   27b7a:	48 c1 e2 04          	shl    $0x4,%rdx
   27b7e:	48 01 d8             	add    %rbx,%rax
   27b81:	48 01 da             	add    %rbx,%rdx
   27b84:	48 8b 30             	mov    (%rax),%rsi
   27b87:	48 8b 0a             	mov    (%rdx),%rcx
   27b8a:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   27b8e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27b92:	89 f8                	mov    %edi,%eax
   27b94:	4c 89 ef             	mov    %r13,%rdi
   27b97:	c1 f8 05             	sar    $0x5,%eax
   27b9a:	f7 d0                	not    %eax
   27b9c:	48 98                	cltq
   27b9e:	48 c1 e0 04          	shl    $0x4,%rax
   27ba2:	ff 74 03 08          	push   0x8(%rbx,%rax,1)
   27ba6:	ff 34 03             	push   (%rbx,%rax,1)
   27ba9:	e8 d2 c9 06 00       	call   94580 <JS_CopyDataProperties>
   27bae:	5e                   	pop    %rsi
   27baf:	5f                   	pop    %rdi
   27bb0:	85 c0                	test   %eax,%eax
   27bb2:	0f 85 0b 7e 00 00    	jne    2f9c3 <JS_CallInternal+0xa5f3>
   27bb8:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   27bbe:	49 83 c4 02          	add    $0x2,%r12
   27bc2:	49 89 c2             	mov    %rax,%r10
   27bc5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27bc9:	ff e0                	jmp    *%rax
   27bcb:	f3 0f 1e fa          	endbr64
   27bcf:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   27bd6:	48 89 de             	mov    %rbx,%rsi
   27bd9:	4c 89 ef             	mov    %r13,%rdi
   27bdc:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27be0:	e8 6b e0 07 00       	call   a5c50 <js_append_enumerate>
   27be5:	85 c0                	test   %eax,%eax
   27be7:	0f 85 13 e0 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   27bed:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27bf1:	48 83 eb 10          	sub    $0x10,%rbx
   27bf5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27bf8:	76 14                	jbe    27c0e <JS_CallInternal+0x283e>
   27bfa:	48 8b 0b             	mov    (%rbx),%rcx
   27bfd:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27c00:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27c03:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27c06:	85 d2                	test   %edx,%edx
   27c08:	0f 8e ae 5c 00 00    	jle    2d8bc <JS_CallInternal+0x84ec>
   27c0e:	41 0f b6 04 24       	movzbl (%r12),%eax
   27c13:	49 83 c4 01          	add    $0x1,%r12
   27c17:	49 89 c2             	mov    %rax,%r10
   27c1a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27c1e:	ff e0                	jmp    *%rax
   27c20:	f3 0f 1e fa          	endbr64
   27c24:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   27c29:	49 89 da             	mov    %rbx,%r10
   27c2c:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   27c31:	4c 89 ef             	mov    %r13,%rdi
   27c34:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   27c3b:	4c 89 c8             	mov    %r9,%rax
   27c3e:	44 89 8d 00 fe ff ff 	mov    %r9d,-0x200(%rbp)
   27c45:	48 c1 e0 04          	shl    $0x4,%rax
   27c49:	49 29 c2             	sub    %rax,%r10
   27c4c:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   27c53:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   27c5a:	4d 8b 42 f8          	mov    -0x8(%r10),%r8
   27c5e:	49 8b 72 e0          	mov    -0x20(%r10),%rsi
   27c62:	48 89 48 30          	mov    %rcx,0x30(%rax)
   27c66:	49 8b 52 e8          	mov    -0x18(%r10),%rdx
   27c6a:	49 8b 4a f0          	mov    -0x10(%r10),%rcx
   27c6e:	6a 00                	push   $0x0
   27c70:	41 52                	push   %r10
   27c72:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   27c79:	e8 e2 36 07 00       	call   9b360 <JS_CallConstructorInternal>
   27c7e:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   27c85:	41 5b                	pop    %r11
   27c87:	58                   	pop    %rax
   27c88:	83 fa 06             	cmp    $0x6,%edx
   27c8b:	0f 84 b6 6c 00 00    	je     2e947 <JS_CallInternal+0x9577>
   27c91:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   27c98:	48 89 95 c0 fd ff ff 	mov    %rdx,-0x240(%rbp)
   27c9f:	4c 89 a5 e0 fd ff ff 	mov    %r12,-0x220(%rbp)
   27ca6:	49 8d 42 e0          	lea    -0x20(%r10),%rax
   27caa:	4c 03 95 d0 fd ff ff 	add    -0x230(%rbp),%r10
   27cb1:	4c 89 bd d0 fd ff ff 	mov    %r15,-0x230(%rbp)
   27cb8:	49 89 df             	mov    %rbx,%r15
   27cbb:	4d 89 d4             	mov    %r10,%r12
   27cbe:	48 89 c3             	mov    %rax,%rbx
   27cc1:	eb 2a                	jmp    27ced <JS_CallInternal+0x291d>
   27cc3:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   27cca:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   27cd1:	00 00 00 00 
   27cd5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   27cdc:	00 00 00 00 
   27ce0:	48 83 c3 10          	add    $0x10,%rbx
   27ce4:	4c 39 e3             	cmp    %r12,%rbx
   27ce7:	0f 84 30 41 00 00    	je     2be1d <JS_CallInternal+0x6a4d>
   27ced:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27cf1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27cf4:	76 ea                	jbe    27ce0 <JS_CallInternal+0x2910>
   27cf6:	48 8b 33             	mov    (%rbx),%rsi
   27cf9:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27cfc:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27cff:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27d02:	85 d2                	test   %edx,%edx
   27d04:	7f da                	jg     27ce0 <JS_CallInternal+0x2910>
   27d06:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   27d0a:	48 89 c2             	mov    %rax,%rdx
   27d0d:	e8 0e 6c ff ff       	call   1e920 <__JS_FreeValueRT>
   27d12:	eb cc                	jmp    27ce0 <JS_CallInternal+0x2910>
   27d14:	f3 0f 1e fa          	endbr64
   27d18:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   27d1f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27d23:	4c 89 ef             	mov    %r13,%rdi
   27d26:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   27d2a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27d2e:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   27d32:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   27d39:	e8 f2 f5 01 00       	call   47330 <JS_ValueToAtom>
   27d3e:	89 c1                	mov    %eax,%ecx
   27d40:	85 c0                	test   %eax,%eax
   27d42:	0f 84 b8 de ff ff    	je     25c00 <JS_CallInternal+0x830>
   27d48:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   27d4c:	0f 84 67 6c 00 00    	je     2e9b9 <JS_CallInternal+0x95e9>
   27d52:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   27d56:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   27d5a:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   27d5e:	4c 89 ef             	mov    %r13,%rdi
   27d61:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   27d68:	89 8d f8 fd ff ff    	mov    %ecx,-0x208(%rbp)
   27d6e:	e8 ed 88 04 00       	call   70660 <JS_HasProperty>
   27d73:	8b 8d f8 fd ff ff    	mov    -0x208(%rbp),%ecx
   27d79:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   27d80:	85 c0                	test   %eax,%eax
   27d82:	0f 8e 9e 6f 00 00    	jle    2ed26 <JS_CallInternal+0x9956>
   27d88:	48 83 ec 08          	sub    $0x8,%rsp
   27d8c:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   27d90:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   27d94:	4c 89 ef             	mov    %r13,%rdi
   27d97:	49 8b 33             	mov    (%r11),%rsi
   27d9a:	49 8b 53 08          	mov    0x8(%r11),%rdx
   27d9e:	68 00 80 00 00       	push   $0x8000
   27da3:	41 ff 73 08          	push   0x8(%r11)
   27da7:	41 ff 33             	push   (%r11)
   27daa:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   27db1:	89 8d f8 fd ff ff    	mov    %ecx,-0x208(%rbp)
   27db7:	e8 34 95 00 00       	call   312f0 <JS_SetPropertyInternal>
   27dbc:	8b 8d f8 fd ff ff    	mov    -0x208(%rbp),%ecx
   27dc2:	48 83 c4 20          	add    $0x20,%rsp
   27dc6:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   27dcd:	89 c3                	mov    %eax,%ebx
   27dcf:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   27dd5:	0f 8f 9a 51 00 00    	jg     2cf75 <JS_CallInternal+0x7ba5>
   27ddb:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   27de2:	48 8b 41 08          	mov    0x8(%rcx),%rax
   27de6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27de9:	76 14                	jbe    27dff <JS_CallInternal+0x2a2f>
   27deb:	48 8b 09             	mov    (%rcx),%rcx
   27dee:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27df1:	83 ea 01             	sub    $0x1,%edx
   27df4:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27df7:	85 d2                	test   %edx,%edx
   27df9:	0f 8e 11 6c 00 00    	jle    2ea10 <JS_CallInternal+0x9640>
   27dff:	49 8b 43 08          	mov    0x8(%r11),%rax
   27e03:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e06:	76 14                	jbe    27e1c <JS_CallInternal+0x2a4c>
   27e08:	49 8b 0b             	mov    (%r11),%rcx
   27e0b:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27e0e:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27e11:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27e14:	85 d2                	test   %edx,%edx
   27e16:	0f 8e 7b 6b 00 00    	jle    2e997 <JS_CallInternal+0x95c7>
   27e1c:	85 db                	test   %ebx,%ebx
   27e1e:	0f 88 38 71 00 00    	js     2ef5c <JS_CallInternal+0x9b8c>
   27e24:	41 0f b6 04 24       	movzbl (%r12),%eax
   27e29:	4c 89 db             	mov    %r11,%rbx
   27e2c:	49 83 c4 01          	add    $0x1,%r12
   27e30:	49 89 c2             	mov    %rax,%r10
   27e33:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27e37:	ff e0                	jmp    *%rax
   27e39:	f3 0f 1e fa          	endbr64
   27e3d:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   27e41:	0f 85 36 4b 00 00    	jne    2c97d <JS_CallInternal+0x75ad>
   27e47:	44 8b 43 e8          	mov    -0x18(%rbx),%r8d
   27e4b:	45 85 c0             	test   %r8d,%r8d
   27e4e:	0f 85 29 4b 00 00    	jne    2c97d <JS_CallInternal+0x75ad>
   27e54:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   27e58:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27e5c:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   27e61:	0f 85 16 4b 00 00    	jne    2c97d <JS_CallInternal+0x75ad>
   27e67:	8b 4a 38             	mov    0x38(%rdx),%ecx
   27e6a:	39 c8                	cmp    %ecx,%eax
   27e6c:	0f 83 79 6f 00 00    	jae    2edeb <JS_CallInternal+0x9a1b>
   27e72:	89 c0                	mov    %eax,%eax
   27e74:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27e79:	48 c1 e0 04          	shl    $0x4,%rax
   27e7d:	48 03 42 30          	add    0x30(%rdx),%rax
   27e81:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27e85:	48 8b 08             	mov    (%rax),%rcx
   27e88:	0f 11 00             	movups %xmm0,(%rax)
   27e8b:	83 fa f6             	cmp    $0xfffffff6,%edx
   27e8e:	76 11                	jbe    27ea1 <JS_CallInternal+0x2ad1>
   27e90:	8b 41 fc             	mov    -0x4(%rcx),%eax
   27e93:	83 e8 01             	sub    $0x1,%eax
   27e96:	89 41 fc             	mov    %eax,-0x4(%rcx)
   27e99:	85 c0                	test   %eax,%eax
   27e9b:	0f 8e aa 70 00 00    	jle    2ef4b <JS_CallInternal+0x9b7b>
   27ea1:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   27ea5:	48 83 eb 30          	sub    $0x30,%rbx
   27ea9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27eac:	76 14                	jbe    27ec2 <JS_CallInternal+0x2af2>
   27eae:	48 8b 0b             	mov    (%rbx),%rcx
   27eb1:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27eb4:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27eb7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27eba:	85 d2                	test   %edx,%edx
   27ebc:	0f 8e ae 6f 00 00    	jle    2ee70 <JS_CallInternal+0x9aa0>
   27ec2:	41 0f b6 04 24       	movzbl (%r12),%eax
   27ec7:	49 83 c4 01          	add    $0x1,%r12
   27ecb:	49 89 c2             	mov    %rax,%r10
   27ece:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ed2:	ff e0                	jmp    *%rax
   27ed4:	f3 0f 1e fa          	endbr64
   27ed8:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27edc:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27ee0:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   27ee4:	4c 89 ef             	mov    %r13,%rdi
   27ee7:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   27eee:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   27ef5:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27ef9:	e8 32 f4 01 00       	call   47330 <JS_ValueToAtom>
   27efe:	89 c1                	mov    %eax,%ecx
   27f00:	85 c0                	test   %eax,%eax
   27f02:	0f 84 f8 dc ff ff    	je     25c00 <JS_CallInternal+0x830>
   27f08:	48 83 ec 08          	sub    $0x8,%rsp
   27f0c:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   27f10:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   27f14:	4c 8b 4b d8          	mov    -0x28(%rbx),%r9
   27f18:	4c 89 9d b8 fd ff ff 	mov    %r11,-0x248(%rbp)
   27f1f:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   27f23:	4c 89 ef             	mov    %r13,%rdi
   27f26:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27f2a:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   27f2e:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   27f35:	6a 00                	push   $0x0
   27f37:	89 8d c0 fd ff ff    	mov    %ecx,-0x240(%rbp)
   27f3d:	e8 5e 86 00 00       	call   305a0 <JS_GetPropertyInternal>
   27f42:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   27f48:	4c 8b 9d b8 fd ff ff 	mov    -0x248(%rbp),%r11
   27f4f:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   27f56:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   27f5c:	48 89 95 f8 fd ff ff 	mov    %rdx,-0x208(%rbp)
   27f63:	41 59                	pop    %r9
   27f65:	41 5a                	pop    %r10
   27f67:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   27f6e:	0f 8f 0d 4e 00 00    	jg     2cd81 <JS_CallInternal+0x79b1>
   27f74:	83 bd f8 fd ff ff 06 	cmpl   $0x6,-0x208(%rbp)
   27f7b:	0f 84 7f dc ff ff    	je     25c00 <JS_CallInternal+0x830>
   27f81:	49 8b 42 08          	mov    0x8(%r10),%rax
   27f85:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f88:	76 14                	jbe    27f9e <JS_CallInternal+0x2bce>
   27f8a:	49 8b 0a             	mov    (%r10),%rcx
   27f8d:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27f90:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27f93:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27f96:	85 d2                	test   %edx,%edx
   27f98:	0f 8e 9f 68 00 00    	jle    2e83d <JS_CallInternal+0x946d>
   27f9e:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   27fa5:	48 8b 41 08          	mov    0x8(%rcx),%rax
   27fa9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27fac:	76 14                	jbe    27fc2 <JS_CallInternal+0x2bf2>
   27fae:	48 8b 09             	mov    (%rcx),%rcx
   27fb1:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27fb4:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27fb7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27fba:	85 d2                	test   %edx,%edx
   27fbc:	0f 8e 6e 6b 00 00    	jle    2eb30 <JS_CallInternal+0x9760>
   27fc2:	49 8b 43 08          	mov    0x8(%r11),%rax
   27fc6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27fc9:	76 14                	jbe    27fdf <JS_CallInternal+0x2c0f>
   27fcb:	49 8b 0b             	mov    (%r11),%rcx
   27fce:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27fd1:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27fd4:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27fd7:	85 d2                	test   %edx,%edx
   27fd9:	0f 8e 4a 68 00 00    	jle    2e829 <JS_CallInternal+0x9459>
   27fdf:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   27fe6:	49 83 c4 01          	add    $0x1,%r12
   27fea:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   27fee:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   27ff5:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   27ff9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27fff:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   28006:	49 89 c2             	mov    %rax,%r10
   28009:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2800d:	ff e0                	jmp    *%rax
   2800f:	f3 0f 1e fa          	endbr64
   28013:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2801a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2801e:	4c 89 ef             	mov    %r13,%rdi
   28021:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28025:	4c 89 60 30          	mov    %r12,0x30(%rax)
   28029:	e8 02 f3 01 00       	call   47330 <JS_ValueToAtom>
   2802e:	89 c1                	mov    %eax,%ecx
   28030:	85 c0                	test   %eax,%eax
   28032:	0f 84 c8 db ff ff    	je     25c00 <JS_CallInternal+0x830>
   28038:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2803c:	83 fa 03             	cmp    $0x3,%edx
   2803f:	0f 84 73 5e 00 00    	je     2deb8 <JS_CallInternal+0x8ae8>
   28045:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   28049:	4c 89 ef             	mov    %r13,%rdi
   2804c:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   28052:	e8 09 86 04 00       	call   70660 <JS_HasProperty>
   28057:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2805d:	85 c0                	test   %eax,%eax
   2805f:	0f 8e fd 5d 00 00    	jle    2de62 <JS_CallInternal+0x8a92>
   28065:	48 83 ec 08          	sub    $0x8,%rsp
   28069:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2806d:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28071:	4c 89 ef             	mov    %r13,%rdi
   28074:	6a 00                	push   $0x0
   28076:	49 89 f0             	mov    %rsi,%r8
   28079:	49 89 d1             	mov    %rdx,%r9
   2807c:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   28082:	e8 19 85 00 00       	call   305a0 <JS_GetPropertyInternal>
   28087:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2808d:	41 5b                	pop    %r11
   2808f:	49 89 d1             	mov    %rdx,%r9
   28092:	48 89 c2             	mov    %rax,%rdx
   28095:	58                   	pop    %rax
   28096:	4d 89 c8             	mov    %r9,%r8
   28099:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2809f:	0f 8f 53 50 00 00    	jg     2d0f8 <JS_CallInternal+0x7d28>
   280a5:	41 83 f9 06          	cmp    $0x6,%r9d
   280a9:	0f 84 51 db ff ff    	je     25c00 <JS_CallInternal+0x830>
   280af:	48 89 13             	mov    %rdx,(%rbx)
   280b2:	49 83 c4 01          	add    $0x1,%r12
   280b6:	48 83 c3 10          	add    $0x10,%rbx
   280ba:	4c 89 43 f8          	mov    %r8,-0x8(%rbx)
   280be:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   280c4:	49 89 c2             	mov    %rax,%r10
   280c7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   280cb:	ff e0                	jmp    *%rax
   280cd:	f3 0f 1e fa          	endbr64
   280d1:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   280d5:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   280d9:	4c 8d 5b f0          	lea    -0x10(%rbx),%r11
   280dd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   280e0:	76 04                	jbe    280e6 <JS_CallInternal+0x2d16>
   280e2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   280e6:	48 92                	xchg   %rax,%rdx
   280e8:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   280ec:	41 b9 07 40 00 00    	mov    $0x4007,%r9d
   280f2:	4c 89 ef             	mov    %r13,%rdi
   280f5:	49 89 d0             	mov    %rdx,%r8
   280f8:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   280fc:	41 ff 73 08          	push   0x8(%r11)
   28100:	48 89 c1             	mov    %rax,%rcx
   28103:	41 ff 33             	push   (%r11)
   28106:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2810d:	e8 ee f3 01 00       	call   47500 <JS_DefinePropertyValueValue>
   28112:	41 58                	pop    %r8
   28114:	41 59                	pop    %r9
   28116:	85 c0                	test   %eax,%eax
   28118:	0f 88 5d 5c 00 00    	js     2dd7b <JS_CallInternal+0x89ab>
   2811e:	41 0f b6 04 24       	movzbl (%r12),%eax
   28123:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2812a:	49 83 c4 01          	add    $0x1,%r12
   2812e:	49 89 c2             	mov    %rax,%r10
   28131:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28135:	ff e0                	jmp    *%rax
   28137:	f3 0f 1e fa          	endbr64
   2813b:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   28142:	4c 89 60 30          	mov    %r12,0x30(%rax)
   28146:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2814a:	0f 85 5d 76 00 00    	jne    2f7ad <JS_CallInternal+0xa3dd>
   28150:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   28154:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28158:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2815c:	4c 89 ef             	mov    %r13,%rdi
   2815f:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   28166:	e8 c5 f1 01 00       	call   47330 <JS_ValueToAtom>
   2816b:	89 c1                	mov    %eax,%ecx
   2816d:	85 c0                	test   %eax,%eax
   2816f:	0f 84 8b da ff ff    	je     25c00 <JS_CallInternal+0x830>
   28175:	48 83 ec 08          	sub    $0x8,%rsp
   28179:	4c 8d 53 d0          	lea    -0x30(%rbx),%r10
   2817d:	48 8d 43 c0          	lea    -0x40(%rbx),%rax
   28181:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   28185:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2818c:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   28190:	4c 89 ef             	mov    %r13,%rdi
   28193:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   28197:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2819b:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   281a2:	68 00 80 00 00       	push   $0x8000
   281a7:	ff 73 c8             	push   -0x38(%rbx)
   281aa:	ff 73 c0             	push   -0x40(%rbx)
   281ad:	89 8d e0 fd ff ff    	mov    %ecx,-0x220(%rbp)
   281b3:	e8 38 91 00 00       	call   312f0 <JS_SetPropertyInternal>
   281b8:	8b 8d e0 fd ff ff    	mov    -0x220(%rbp),%ecx
   281be:	48 83 c4 20          	add    $0x20,%rsp
   281c2:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   281c9:	89 c3                	mov    %eax,%ebx
   281cb:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   281d1:	0f 8f 70 4b 00 00    	jg     2cd47 <JS_CallInternal+0x7977>
   281d7:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   281de:	48 8b 41 08          	mov    0x8(%rcx),%rax
   281e2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   281e5:	76 14                	jbe    281fb <JS_CallInternal+0x2e2b>
   281e7:	48 8b 09             	mov    (%rcx),%rcx
   281ea:	8b 51 fc             	mov    -0x4(%rcx),%edx
   281ed:	83 ea 01             	sub    $0x1,%edx
   281f0:	89 51 fc             	mov    %edx,-0x4(%rcx)
   281f3:	85 d2                	test   %edx,%edx
   281f5:	0f 8e dd 61 00 00    	jle    2e3d8 <JS_CallInternal+0x9008>
   281fb:	49 8b 42 08          	mov    0x8(%r10),%rax
   281ff:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28202:	76 14                	jbe    28218 <JS_CallInternal+0x2e48>
   28204:	49 8b 0a             	mov    (%r10),%rcx
   28207:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2820a:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2820d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28210:	85 d2                	test   %edx,%edx
   28212:	0f 8e dd 5e 00 00    	jle    2e0f5 <JS_CallInternal+0x8d25>
   28218:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2821f:	48 8b 41 08          	mov    0x8(%rcx),%rax
   28223:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28226:	76 14                	jbe    2823c <JS_CallInternal+0x2e6c>
   28228:	48 8b 09             	mov    (%rcx),%rcx
   2822b:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2822e:	83 ea 01             	sub    $0x1,%edx
   28231:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28234:	85 d2                	test   %edx,%edx
   28236:	0f 8e 19 5f 00 00    	jle    2e155 <JS_CallInternal+0x8d85>
   2823c:	85 db                	test   %ebx,%ebx
   2823e:	0f 88 9e 77 00 00    	js     2f9e2 <JS_CallInternal+0xa612>
   28244:	41 0f b6 04 24       	movzbl (%r12),%eax
   28249:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   28250:	49 83 c4 01          	add    $0x1,%r12
   28254:	49 89 c2             	mov    %rax,%r10
   28257:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2825b:	ff e0                	jmp    *%rax
   2825d:	f3 0f 1e fa          	endbr64
   28261:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   28265:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28269:	83 f8 ff             	cmp    $0xffffffff,%eax
   2826c:	0f 85 1e 4a 00 00    	jne    2cc90 <JS_CallInternal+0x78c0>
   28272:	85 c9                	test   %ecx,%ecx
   28274:	0f 85 9a 68 00 00    	jne    2eb14 <JS_CallInternal+0x9744>
   2827a:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2827e:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   28282:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   28287:	0f 85 72 4a 00 00    	jne    2ccff <JS_CallInternal+0x792f>
   2828d:	3b 42 38             	cmp    0x38(%rdx),%eax
   28290:	0f 83 69 4a 00 00    	jae    2ccff <JS_CallInternal+0x792f>
   28296:	89 c0                	mov    %eax,%eax
   28298:	48 c1 e0 04          	shl    $0x4,%rax
   2829c:	48 03 42 30          	add    0x30(%rdx),%rax
   282a0:	48 8b 10             	mov    (%rax),%rdx
   282a3:	48 8b 40 08          	mov    0x8(%rax),%rax
   282a7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   282aa:	76 04                	jbe    282b0 <JS_CallInternal+0x2ee0>
   282ac:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   282b0:	48 89 13             	mov    %rdx,(%rbx)
   282b3:	49 83 c4 01          	add    $0x1,%r12
   282b7:	48 83 c3 10          	add    $0x10,%rbx
   282bb:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   282bf:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   282c5:	49 89 c2             	mov    %rax,%r10
   282c8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   282cc:	ff e0                	jmp    *%rax
   282ce:	f3 0f 1e fa          	endbr64
   282d2:	4c 8b 53 e8          	mov    -0x18(%rbx),%r10
   282d6:	4c 8b 4b e0          	mov    -0x20(%rbx),%r9
   282da:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   282de:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   282e2:	41 83 fa ff          	cmp    $0xffffffff,%r10d
   282e6:	0f 85 45 46 00 00    	jne    2c931 <JS_CallInternal+0x7561>
   282ec:	85 f6                	test   %esi,%esi
   282ee:	0f 85 3d 46 00 00    	jne    2c931 <JS_CallInternal+0x7561>
   282f4:	66 41 83 79 12 02    	cmpw   $0x2,0x12(%r9)
   282fa:	0f 85 31 46 00 00    	jne    2c931 <JS_CallInternal+0x7561>
   28300:	41 3b 49 38          	cmp    0x38(%r9),%ecx
   28304:	0f 83 27 46 00 00    	jae    2c931 <JS_CallInternal+0x7561>
   2830a:	89 c8                	mov    %ecx,%eax
   2830c:	48 c1 e0 04          	shl    $0x4,%rax
   28310:	49 03 41 30          	add    0x30(%r9),%rax
   28314:	48 8b 08             	mov    (%rax),%rcx
   28317:	48 8b 40 08          	mov    0x8(%rax),%rax
   2831b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2831e:	76 04                	jbe    28324 <JS_CallInternal+0x2f54>
   28320:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28324:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   28328:	76 13                	jbe    2833d <JS_CallInternal+0x2f6d>
   2832a:	41 8b 79 fc          	mov    -0x4(%r9),%edi
   2832e:	8d 57 ff             	lea    -0x1(%rdi),%edx
   28331:	41 89 51 fc          	mov    %edx,-0x4(%r9)
   28335:	85 d2                	test   %edx,%edx
   28337:	0f 8e a4 55 00 00    	jle    2d8e1 <JS_CallInternal+0x8511>
   2833d:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   28341:	49 83 c4 01          	add    $0x1,%r12
   28345:	48 83 eb 10          	sub    $0x10,%rbx
   28349:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2834d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28353:	49 89 c2             	mov    %rax,%r10
   28356:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2835a:	ff e0                	jmp    *%rax
   2835c:	f3 0f 1e fa          	endbr64
   28360:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   28364:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   28368:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2836c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28370:	83 fe ff             	cmp    $0xffffffff,%esi
   28373:	0f 85 30 44 00 00    	jne    2c7a9 <JS_CallInternal+0x73d9>
   28379:	85 c9                	test   %ecx,%ecx
   2837b:	0f 85 28 44 00 00    	jne    2c7a9 <JS_CallInternal+0x73d9>
   28381:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   28386:	0f 85 1d 44 00 00    	jne    2c7a9 <JS_CallInternal+0x73d9>
   2838c:	3b 42 38             	cmp    0x38(%rdx),%eax
   2838f:	0f 83 14 44 00 00    	jae    2c7a9 <JS_CallInternal+0x73d9>
   28395:	89 c0                	mov    %eax,%eax
   28397:	48 c1 e0 04          	shl    $0x4,%rax
   2839b:	48 03 42 30          	add    0x30(%rdx),%rax
   2839f:	48 8b 10             	mov    (%rax),%rdx
   283a2:	48 8b 40 08          	mov    0x8(%rax),%rax
   283a6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   283a9:	76 04                	jbe    283af <JS_CallInternal+0x2fdf>
   283ab:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   283af:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   283b3:	49 83 c4 01          	add    $0x1,%r12
   283b7:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   283bb:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   283c1:	49 89 c2             	mov    %rax,%r10
   283c4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   283c8:	ff e0                	jmp    *%rax
   283ca:	f3 0f 1e fa          	endbr64
   283ce:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   283d2:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   283d6:	4c 89 ef             	mov    %r13,%rdi
   283d9:	49 83 c4 01          	add    $0x1,%r12
   283dd:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   283e1:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   283e5:	e8 e6 7f ff ff       	call   203d0 <js_method_set_home_object>
   283ea:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   283f0:	49 89 c2             	mov    %rax,%r10
   283f3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   283f7:	ff e0                	jmp    *%rax
   283f9:	f3 0f 1e fa          	endbr64
   283fd:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   28401:	49 8d 44 24 04       	lea    0x4(%r12),%rax
   28406:	41 8b 0c 24          	mov    (%r12),%ecx
   2840a:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   28411:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   28415:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   28419:	0f 85 5c 46 00 00    	jne    2ca7b <JS_CallInternal+0x76ab>
   2841f:	49 8b 72 18          	mov    0x18(%r10),%rsi
   28423:	8b 46 18             	mov    0x18(%rsi),%eax
   28426:	89 c2                	mov    %eax,%edx
   28428:	21 ca                	and    %ecx,%edx
   2842a:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   2842e:	48 85 d2             	test   %rdx,%rdx
   28431:	0f 84 44 46 00 00    	je     2ca7b <JS_CallInternal+0x76ab>
   28437:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2843e:	00 
   2843f:	48 83 ea 01          	sub    $0x1,%rdx
   28443:	48 8d 04 d7          	lea    (%rdi,%rdx,8),%rax
   28447:	48 01 f0             	add    %rsi,%rax
   2844a:	3b 48 04             	cmp    0x4(%rax),%ecx
   2844d:	0f 85 1a 46 00 00    	jne    2ca6d <JS_CallInternal+0x769d>
   28453:	0f b6 40 03          	movzbl 0x3(%rax),%eax
   28457:	49 8b 72 20          	mov    0x20(%r10),%rsi
   2845b:	c0 e8 02             	shr    $0x2,%al
   2845e:	83 e0 3a             	and    $0x3a,%eax
   28461:	3c 02                	cmp    $0x2,%al
   28463:	0f 85 12 46 00 00    	jne    2ca7b <JS_CallInternal+0x76ab>
   28469:	48 c1 e2 04          	shl    $0x4,%rdx
   2846d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28472:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
   28476:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2847a:	48 8b 08             	mov    (%rax),%rcx
   2847d:	0f 11 00             	movups %xmm0,(%rax)
   28480:	83 fa f6             	cmp    $0xfffffff6,%edx
   28483:	76 11                	jbe    28496 <JS_CallInternal+0x30c6>
   28485:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28488:	83 e8 01             	sub    $0x1,%eax
   2848b:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2848e:	85 c0                	test   %eax,%eax
   28490:	0f 8e 22 6b 00 00    	jle    2efb8 <JS_CallInternal+0x9be8>
   28496:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2849a:	76 13                	jbe    284af <JS_CallInternal+0x30df>
   2849c:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   284a0:	83 e8 01             	sub    $0x1,%eax
   284a3:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   284a7:	85 c0                	test   %eax,%eax
   284a9:	0f 8e 28 69 00 00    	jle    2edd7 <JS_CallInternal+0x9a07>
   284af:	48 83 eb 20          	sub    $0x20,%rbx
   284b3:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   284b9:	49 83 c4 05          	add    $0x5,%r12
   284bd:	49 89 c2             	mov    %rax,%r10
   284c0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   284c4:	ff e0                	jmp    *%rax
   284c6:	f3 0f 1e fa          	endbr64
   284ca:	41 8b 04 24          	mov    (%r12),%eax
   284ce:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   284d2:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   284d7:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   284de:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   284e2:	4c 01 e0             	add    %r12,%rax
   284e5:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   284e9:	75 0c                	jne    284f7 <JS_CallInternal+0x3127>
   284eb:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   284f1:	0f 84 c8 4e 00 00    	je     2d3bf <JS_CallInternal+0x7fef>
   284f7:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
   284fe:	48 83 ec 08          	sub    $0x8,%rsp
   28502:	48 8b bd 00 fe ff ff 	mov    -0x200(%rbp),%rdi
   28509:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   28510:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   28514:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   28518:	4c 89 da             	mov    %r11,%rdx
   2851b:	4c 89 d6             	mov    %r10,%rsi
   2851e:	48 89 79 30          	mov    %rdi,0x30(%rcx)
   28522:	8b 48 14             	mov    0x14(%rax),%ecx
   28525:	4c 89 ef             	mov    %r13,%rdi
   28528:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2852f:	68 00 80 00 00       	push   $0x8000
   28534:	41 53                	push   %r11
   28536:	41 52                	push   %r10
   28538:	e8 b3 8d 00 00       	call   312f0 <JS_SetPropertyInternal>
   2853d:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   28544:	48 83 c4 20          	add    $0x20,%rsp
   28548:	89 c1                	mov    %eax,%ecx
   2854a:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2854e:	76 1a                	jbe    2856a <JS_CallInternal+0x319a>
   28550:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   28557:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2855b:	83 e8 01             	sub    $0x1,%eax
   2855e:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   28562:	85 c0                	test   %eax,%eax
   28564:	0f 8e 66 50 00 00    	jle    2d5d0 <JS_CallInternal+0x8200>
   2856a:	48 83 eb 20          	sub    $0x20,%rbx
   2856e:	85 c9                	test   %ecx,%ecx
   28570:	0f 88 2b 63 00 00    	js     2e8a1 <JS_CallInternal+0x94d1>
   28576:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2857c:	49 83 c4 05          	add    $0x5,%r12
   28580:	49 89 c2             	mov    %rax,%r10
   28583:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28587:	ff e0                	jmp    *%rax
   28589:	f3 0f 1e fa          	endbr64
   2858d:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   28591:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   28595:	83 fe ff             	cmp    $0xffffffff,%esi
   28598:	0f 85 05 3b 00 00    	jne    2c0a3 <JS_CallInternal+0x6cd3>
   2859e:	48 89 f9             	mov    %rdi,%rcx
   285a1:	0f 1f 40 00          	nopl   0x0(%rax)
   285a5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   285ac:	00 00 00 00 
   285b0:	4c 8b 41 18          	mov    0x18(%rcx),%r8
   285b4:	41 8b 50 18          	mov    0x18(%r8),%edx
   285b8:	89 d0                	mov    %edx,%eax
   285ba:	83 e0 32             	and    $0x32,%eax
   285bd:	41 8b 44 80 38       	mov    0x38(%r8,%rax,4),%eax
   285c2:	48 85 c0             	test   %rax,%rax
   285c5:	0f 84 6d 34 00 00    	je     2ba38 <JS_CallInternal+0x6668>
   285cb:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   285d2:	00 
   285d3:	48 83 e8 01          	sub    $0x1,%rax
   285d7:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   285db:	4c 01 c2             	add    %r8,%rdx
   285de:	83 7a 04 32          	cmpl   $0x32,0x4(%rdx)
   285e2:	0f 85 43 34 00 00    	jne    2ba2b <JS_CallInternal+0x665b>
   285e8:	48 8b 49 20          	mov    0x20(%rcx),%rcx
   285ec:	80 7a 03 3f          	cmpb   $0x3f,0x3(%rdx)
   285f0:	0f 87 ad 3a 00 00    	ja     2c0a3 <JS_CallInternal+0x6cd3>
   285f6:	48 c1 e0 04          	shl    $0x4,%rax
   285fa:	48 01 c1             	add    %rax,%rcx
   285fd:	48 8b 01             	mov    (%rcx),%rax
   28600:	48 8b 49 08          	mov    0x8(%rcx),%rcx
   28604:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28607:	76 04                	jbe    2860d <JS_CallInternal+0x323d>
   28609:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2860d:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   28611:	83 fe f6             	cmp    $0xfffffff6,%esi
   28614:	76 15                	jbe    2862b <JS_CallInternal+0x325b>
   28616:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2861a:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2861d:	83 ea 01             	sub    $0x1,%edx
   28620:	89 57 fc             	mov    %edx,-0x4(%rdi)
   28623:	85 d2                	test   %edx,%edx
   28625:	0f 8e fa 53 00 00    	jle    2da25 <JS_CallInternal+0x8655>
   2862b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2862f:	49 83 c4 01          	add    $0x1,%r12
   28633:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   28637:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2863d:	49 89 c2             	mov    %rax,%r10
   28640:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28644:	ff e0                	jmp    *%rax
   28646:	f3 0f 1e fa          	endbr64
   2864a:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28651:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28655:	48 8b 40 10          	mov    0x10(%rax),%rax
   28659:	48 8b 40 18          	mov    0x18(%rax),%rax
   2865d:	48 8b 10             	mov    (%rax),%rdx
   28660:	48 8b 40 08          	mov    0x8(%rax),%rax
   28664:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28667:	76 04                	jbe    2866d <JS_CallInternal+0x329d>
   28669:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2866d:	48 89 13             	mov    %rdx,(%rbx)
   28670:	49 83 c4 01          	add    $0x1,%r12
   28674:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28678:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2867e:	48 89 cb             	mov    %rcx,%rbx
   28681:	49 89 c2             	mov    %rax,%r10
   28684:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28688:	ff e0                	jmp    *%rax
   2868a:	f3 0f 1e fa          	endbr64
   2868e:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28695:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28699:	48 8b 40 08          	mov    0x8(%rax),%rax
   2869d:	48 8b 40 18          	mov    0x18(%rax),%rax
   286a1:	48 8b 10             	mov    (%rax),%rdx
   286a4:	48 8b 40 08          	mov    0x8(%rax),%rax
   286a8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   286ab:	76 04                	jbe    286b1 <JS_CallInternal+0x32e1>
   286ad:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   286b1:	48 89 13             	mov    %rdx,(%rbx)
   286b4:	49 83 c4 01          	add    $0x1,%r12
   286b8:	48 89 43 08          	mov    %rax,0x8(%rbx)
   286bc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   286c2:	48 89 cb             	mov    %rcx,%rbx
   286c5:	49 89 c2             	mov    %rax,%r10
   286c8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   286cc:	ff e0                	jmp    *%rax
   286ce:	f3 0f 1e fa          	endbr64
   286d2:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   286d9:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   286dd:	48 8b 00             	mov    (%rax),%rax
   286e0:	48 8b 40 18          	mov    0x18(%rax),%rax
   286e4:	48 8b 10             	mov    (%rax),%rdx
   286e7:	48 8b 40 08          	mov    0x8(%rax),%rax
   286eb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   286ee:	76 04                	jbe    286f4 <JS_CallInternal+0x3324>
   286f0:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   286f4:	48 89 13             	mov    %rdx,(%rbx)
   286f7:	49 83 c4 01          	add    $0x1,%r12
   286fb:	48 89 43 08          	mov    %rax,0x8(%rbx)
   286ff:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28705:	48 89 cb             	mov    %rcx,%rbx
   28708:	49 89 c2             	mov    %rax,%r10
   2870b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2870f:	ff e0                	jmp    *%rax
   28711:	f3 0f 1e fa          	endbr64
   28715:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28719:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2871d:	83 fa f6             	cmp    $0xfffffff6,%edx
   28720:	76 04                	jbe    28726 <JS_CallInternal+0x3356>
   28722:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28726:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   2872d:	48 8b 47 38          	mov    0x38(%rdi),%rax
   28731:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   28735:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   28739:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   2873d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28740:	76 11                	jbe    28753 <JS_CallInternal+0x3383>
   28742:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28745:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28748:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2874b:	85 d2                	test   %edx,%edx
   2874d:	0f 8e 02 53 00 00    	jle    2da55 <JS_CallInternal+0x8685>
   28753:	41 0f b6 04 24       	movzbl (%r12),%eax
   28758:	49 83 c4 01          	add    $0x1,%r12
   2875c:	49 89 c2             	mov    %rax,%r10
   2875f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28763:	ff e0                	jmp    *%rax
   28765:	f3 0f 1e fa          	endbr64
   28769:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2876d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28771:	83 fa f6             	cmp    $0xfffffff6,%edx
   28774:	76 04                	jbe    2877a <JS_CallInternal+0x33aa>
   28776:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2877a:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   28781:	48 8b 47 28          	mov    0x28(%rdi),%rax
   28785:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   28789:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   2878d:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   28791:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28794:	76 11                	jbe    287a7 <JS_CallInternal+0x33d7>
   28796:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28799:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2879c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2879f:	85 d2                	test   %edx,%edx
   287a1:	0f 8e bf 52 00 00    	jle    2da66 <JS_CallInternal+0x8696>
   287a7:	41 0f b6 04 24       	movzbl (%r12),%eax
   287ac:	49 83 c4 01          	add    $0x1,%r12
   287b0:	49 89 c2             	mov    %rax,%r10
   287b3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   287b7:	ff e0                	jmp    *%rax
   287b9:	f3 0f 1e fa          	endbr64
   287bd:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   287c1:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   287c5:	83 fa f6             	cmp    $0xfffffff6,%edx
   287c8:	76 04                	jbe    287ce <JS_CallInternal+0x33fe>
   287ca:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   287ce:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   287d5:	48 8b 47 08          	mov    0x8(%rdi),%rax
   287d9:	48 8b 37             	mov    (%rdi),%rsi
   287dc:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   287e0:	48 89 0f             	mov    %rcx,(%rdi)
   287e3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   287e6:	76 11                	jbe    287f9 <JS_CallInternal+0x3429>
   287e8:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   287eb:	8d 51 ff             	lea    -0x1(%rcx),%edx
   287ee:	89 56 fc             	mov    %edx,-0x4(%rsi)
   287f1:	85 d2                	test   %edx,%edx
   287f3:	0f 8e 8f 52 00 00    	jle    2da88 <JS_CallInternal+0x86b8>
   287f9:	41 0f b6 04 24       	movzbl (%r12),%eax
   287fe:	49 83 c4 01          	add    $0x1,%r12
   28802:	49 89 c2             	mov    %rax,%r10
   28805:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28809:	ff e0                	jmp    *%rax
   2880b:	f3 0f 1e fa          	endbr64
   2880f:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28813:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28817:	83 fa f6             	cmp    $0xfffffff6,%edx
   2881a:	76 04                	jbe    28820 <JS_CallInternal+0x3450>
   2881c:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28820:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   28827:	48 8b 47 18          	mov    0x18(%rdi),%rax
   2882b:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   2882f:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   28833:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   28837:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2883a:	76 11                	jbe    2884d <JS_CallInternal+0x347d>
   2883c:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2883f:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28842:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28845:	85 d2                	test   %edx,%edx
   28847:	0f 8e 2a 52 00 00    	jle    2da77 <JS_CallInternal+0x86a7>
   2884d:	41 0f b6 04 24       	movzbl (%r12),%eax
   28852:	49 83 c4 01          	add    $0x1,%r12
   28856:	49 89 c2             	mov    %rax,%r10
   28859:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2885d:	ff e0                	jmp    *%rax
   2885f:	f3 0f 1e fa          	endbr64
   28863:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   2886a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2886f:	48 83 eb 10          	sub    $0x10,%rbx
   28873:	48 8b 47 38          	mov    0x38(%rdi),%rax
   28877:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2887b:	0f 11 47 30          	movups %xmm0,0x30(%rdi)
   2887f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28882:	76 11                	jbe    28895 <JS_CallInternal+0x34c5>
   28884:	8b 79 fc             	mov    -0x4(%rcx),%edi
   28887:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2888a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2888d:	85 d2                	test   %edx,%edx
   2888f:	0f 8e 04 52 00 00    	jle    2da99 <JS_CallInternal+0x86c9>
   28895:	41 0f b6 04 24       	movzbl (%r12),%eax
   2889a:	49 83 c4 01          	add    $0x1,%r12
   2889e:	49 89 c2             	mov    %rax,%r10
   288a1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   288a5:	ff e0                	jmp    *%rax
   288a7:	f3 0f 1e fa          	endbr64
   288ab:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   288b2:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   288b7:	48 83 eb 10          	sub    $0x10,%rbx
   288bb:	48 8b 47 28          	mov    0x28(%rdi),%rax
   288bf:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
   288c3:	0f 11 47 20          	movups %xmm0,0x20(%rdi)
   288c7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   288ca:	76 11                	jbe    288dd <JS_CallInternal+0x350d>
   288cc:	8b 79 fc             	mov    -0x4(%rcx),%edi
   288cf:	8d 57 ff             	lea    -0x1(%rdi),%edx
   288d2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   288d5:	85 d2                	test   %edx,%edx
   288d7:	0f 8e be 52 00 00    	jle    2db9b <JS_CallInternal+0x87cb>
   288dd:	41 0f b6 04 24       	movzbl (%r12),%eax
   288e2:	49 83 c4 01          	add    $0x1,%r12
   288e6:	49 89 c2             	mov    %rax,%r10
   288e9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   288ed:	ff e0                	jmp    *%rax
   288ef:	f3 0f 1e fa          	endbr64
   288f3:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   288fa:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   288fe:	48 8b 50 20          	mov    0x20(%rax),%rdx
   28902:	48 8b 40 28          	mov    0x28(%rax),%rax
   28906:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28909:	76 04                	jbe    2890f <JS_CallInternal+0x353f>
   2890b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2890f:	48 89 13             	mov    %rdx,(%rbx)
   28912:	49 83 c4 01          	add    $0x1,%r12
   28916:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2891a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28920:	48 89 cb             	mov    %rcx,%rbx
   28923:	49 89 c2             	mov    %rax,%r10
   28926:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2892a:	ff e0                	jmp    *%rax
   2892c:	f3 0f 1e fa          	endbr64
   28930:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   28937:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2893b:	48 8b 50 10          	mov    0x10(%rax),%rdx
   2893f:	48 8b 40 18          	mov    0x18(%rax),%rax
   28943:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28946:	76 04                	jbe    2894c <JS_CallInternal+0x357c>
   28948:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2894c:	48 89 13             	mov    %rdx,(%rbx)
   2894f:	49 83 c4 01          	add    $0x1,%r12
   28953:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28957:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2895d:	48 89 cb             	mov    %rcx,%rbx
   28960:	49 89 c2             	mov    %rax,%r10
   28963:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28967:	ff e0                	jmp    *%rax
   28969:	f3 0f 1e fa          	endbr64
   2896d:	48 8b 8d 50 fe ff ff 	mov    -0x1b0(%rbp),%rcx
   28974:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   28978:	48 8b 01             	mov    (%rcx),%rax
   2897b:	83 fa ff             	cmp    $0xffffffff,%edx
   2897e:	0f 84 19 3f 00 00    	je     2c89d <JS_CallInternal+0x74cd>
   28984:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28988:	83 fa f6             	cmp    $0xfffffff6,%edx
   2898b:	76 04                	jbe    28991 <JS_CallInternal+0x35c1>
   2898d:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28991:	48 89 03             	mov    %rax,(%rbx)
   28994:	4c 89 e0             	mov    %r12,%rax
   28997:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
   2899c:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   289a0:	0f b6 00             	movzbl (%rax),%eax
   289a3:	48 89 cb             	mov    %rcx,%rbx
   289a6:	49 89 c2             	mov    %rax,%r10
   289a9:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   289ad:	f3 0f 1e fa          	endbr64
   289b1:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   289b8:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   289bc:	48 8b 10             	mov    (%rax),%rdx
   289bf:	48 8b 40 08          	mov    0x8(%rax),%rax
   289c3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   289c6:	76 04                	jbe    289cc <JS_CallInternal+0x35fc>
   289c8:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   289cc:	48 89 13             	mov    %rdx,(%rbx)
   289cf:	49 83 c4 01          	add    $0x1,%r12
   289d3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   289d7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   289dd:	48 89 cb             	mov    %rcx,%rbx
   289e0:	49 89 c2             	mov    %rax,%r10
   289e3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   289e7:	ff e0                	jmp    *%rax
   289e9:	f3 0f 1e fa          	endbr64
   289ed:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   289f4:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   289f9:	48 83 eb 10          	sub    $0x10,%rbx
   289fd:	48 8b 47 08          	mov    0x8(%rdi),%rax
   28a01:	48 8b 0f             	mov    (%rdi),%rcx
   28a04:	0f 11 07             	movups %xmm0,(%rdi)
   28a07:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a0a:	76 11                	jbe    28a1d <JS_CallInternal+0x364d>
   28a0c:	8b 79 fc             	mov    -0x4(%rcx),%edi
   28a0f:	8d 57 ff             	lea    -0x1(%rdi),%edx
   28a12:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28a15:	85 d2                	test   %edx,%edx
   28a17:	0f 8e 6a 51 00 00    	jle    2db87 <JS_CallInternal+0x87b7>
   28a1d:	41 0f b6 04 24       	movzbl (%r12),%eax
   28a22:	49 83 c4 01          	add    $0x1,%r12
   28a26:	49 89 c2             	mov    %rax,%r10
   28a29:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28a2d:	ff e0                	jmp    *%rax
   28a2f:	f3 0f 1e fa          	endbr64
   28a33:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   28a3a:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28a3e:	48 8b 50 30          	mov    0x30(%rax),%rdx
   28a42:	48 8b 40 38          	mov    0x38(%rax),%rax
   28a46:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a49:	76 04                	jbe    28a4f <JS_CallInternal+0x367f>
   28a4b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28a4f:	48 89 13             	mov    %rdx,(%rbx)
   28a52:	49 83 c4 01          	add    $0x1,%r12
   28a56:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28a5a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28a60:	48 89 cb             	mov    %rcx,%rbx
   28a63:	49 89 c2             	mov    %rax,%r10
   28a66:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28a6a:	ff e0                	jmp    *%rax
   28a6c:	f3 0f 1e fa          	endbr64
   28a70:	48 8b bd 50 fe ff ff 	mov    -0x1b0(%rbp),%rdi
   28a77:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28a7c:	48 83 eb 10          	sub    $0x10,%rbx
   28a80:	48 8b 47 18          	mov    0x18(%rdi),%rax
   28a84:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
   28a88:	0f 11 47 10          	movups %xmm0,0x10(%rdi)
   28a8c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a8f:	76 11                	jbe    28aa2 <JS_CallInternal+0x36d2>
   28a91:	8b 79 fc             	mov    -0x4(%rcx),%edi
   28a94:	8d 57 ff             	lea    -0x1(%rdi),%edx
   28a97:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28a9a:	85 d2                	test   %edx,%edx
   28a9c:	0f 8e 0d 51 00 00    	jle    2dbaf <JS_CallInternal+0x87df>
   28aa2:	41 0f b6 04 24       	movzbl (%r12),%eax
   28aa7:	49 83 c4 01          	add    $0x1,%r12
   28aab:	49 89 c2             	mov    %rax,%r10
   28aae:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28ab2:	ff e0                	jmp    *%rax
   28ab4:	f3 0f 1e fa          	endbr64
   28ab8:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28abc:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28ac0:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28ac3:	76 04                	jbe    28ac9 <JS_CallInternal+0x36f9>
   28ac5:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28ac9:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28ad0:	48 8b 40 10          	mov    0x10(%rax),%rax
   28ad4:	48 8b 40 18          	mov    0x18(%rax),%rax
   28ad8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28adc:	48 8b 38             	mov    (%rax),%rdi
   28adf:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28ae3:	48 89 30             	mov    %rsi,(%rax)
   28ae6:	83 fa f6             	cmp    $0xfffffff6,%edx
   28ae9:	76 11                	jbe    28afc <JS_CallInternal+0x372c>
   28aeb:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28aee:	83 e8 01             	sub    $0x1,%eax
   28af1:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28af4:	85 c0                	test   %eax,%eax
   28af6:	0f 8e c7 50 00 00    	jle    2dbc3 <JS_CallInternal+0x87f3>
   28afc:	41 0f b6 04 24       	movzbl (%r12),%eax
   28b01:	49 83 c4 01          	add    $0x1,%r12
   28b05:	49 89 c2             	mov    %rax,%r10
   28b08:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28b0c:	ff e0                	jmp    *%rax
   28b0e:	f3 0f 1e fa          	endbr64
   28b12:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28b16:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28b1a:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28b1d:	76 04                	jbe    28b23 <JS_CallInternal+0x3753>
   28b1f:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28b23:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28b2a:	48 8b 00             	mov    (%rax),%rax
   28b2d:	48 8b 40 18          	mov    0x18(%rax),%rax
   28b31:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28b35:	48 8b 38             	mov    (%rax),%rdi
   28b38:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28b3c:	48 89 30             	mov    %rsi,(%rax)
   28b3f:	83 fa f6             	cmp    $0xfffffff6,%edx
   28b42:	76 11                	jbe    28b55 <JS_CallInternal+0x3785>
   28b44:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28b47:	83 e8 01             	sub    $0x1,%eax
   28b4a:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28b4d:	85 c0                	test   %eax,%eax
   28b4f:	0f 8e 90 50 00 00    	jle    2dbe5 <JS_CallInternal+0x8815>
   28b55:	41 0f b6 04 24       	movzbl (%r12),%eax
   28b5a:	49 83 c4 01          	add    $0x1,%r12
   28b5e:	49 89 c2             	mov    %rax,%r10
   28b61:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28b65:	ff e0                	jmp    *%rax
   28b67:	f3 0f 1e fa          	endbr64
   28b6b:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28b6f:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28b73:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28b76:	76 04                	jbe    28b7c <JS_CallInternal+0x37ac>
   28b78:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28b7c:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28b83:	48 8b 40 08          	mov    0x8(%rax),%rax
   28b87:	48 8b 40 18          	mov    0x18(%rax),%rax
   28b8b:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28b8f:	48 8b 38             	mov    (%rax),%rdi
   28b92:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28b96:	48 89 30             	mov    %rsi,(%rax)
   28b99:	83 fa f6             	cmp    $0xfffffff6,%edx
   28b9c:	76 11                	jbe    28baf <JS_CallInternal+0x37df>
   28b9e:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28ba1:	83 e8 01             	sub    $0x1,%eax
   28ba4:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28ba7:	85 c0                	test   %eax,%eax
   28ba9:	0f 8e 25 50 00 00    	jle    2dbd4 <JS_CallInternal+0x8804>
   28baf:	41 0f b6 04 24       	movzbl (%r12),%eax
   28bb4:	49 83 c4 01          	add    $0x1,%r12
   28bb8:	49 89 c2             	mov    %rax,%r10
   28bbb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28bbf:	ff e0                	jmp    *%rax
   28bc1:	f3 0f 1e fa          	endbr64
   28bc5:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28bcc:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28bd1:	48 83 eb 10          	sub    $0x10,%rbx
   28bd5:	48 8b 40 18          	mov    0x18(%rax),%rax
   28bd9:	48 8b 40 18          	mov    0x18(%rax),%rax
   28bdd:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28be1:	48 8b 08             	mov    (%rax),%rcx
   28be4:	0f 11 00             	movups %xmm0,(%rax)
   28be7:	83 fa f6             	cmp    $0xfffffff6,%edx
   28bea:	76 11                	jbe    28bfd <JS_CallInternal+0x382d>
   28bec:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28bef:	83 e8 01             	sub    $0x1,%eax
   28bf2:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28bf5:	85 c0                	test   %eax,%eax
   28bf7:	0f 8e f9 4f 00 00    	jle    2dbf6 <JS_CallInternal+0x8826>
   28bfd:	41 0f b6 04 24       	movzbl (%r12),%eax
   28c02:	49 83 c4 01          	add    $0x1,%r12
   28c06:	49 89 c2             	mov    %rax,%r10
   28c09:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28c0d:	ff e0                	jmp    *%rax
   28c0f:	f3 0f 1e fa          	endbr64
   28c13:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28c1a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28c1f:	48 83 eb 10          	sub    $0x10,%rbx
   28c23:	48 8b 40 10          	mov    0x10(%rax),%rax
   28c27:	48 8b 40 18          	mov    0x18(%rax),%rax
   28c2b:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28c2f:	48 8b 08             	mov    (%rax),%rcx
   28c32:	0f 11 00             	movups %xmm0,(%rax)
   28c35:	83 fa f6             	cmp    $0xfffffff6,%edx
   28c38:	76 11                	jbe    28c4b <JS_CallInternal+0x387b>
   28c3a:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28c3d:	83 e8 01             	sub    $0x1,%eax
   28c40:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28c43:	85 c0                	test   %eax,%eax
   28c45:	0f 8e a7 4a 00 00    	jle    2d6f2 <JS_CallInternal+0x8322>
   28c4b:	41 0f b6 04 24       	movzbl (%r12),%eax
   28c50:	49 83 c4 01          	add    $0x1,%r12
   28c54:	49 89 c2             	mov    %rax,%r10
   28c57:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28c5b:	ff e0                	jmp    *%rax
   28c5d:	f3 0f 1e fa          	endbr64
   28c61:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28c68:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28c6d:	48 83 eb 10          	sub    $0x10,%rbx
   28c71:	48 8b 00             	mov    (%rax),%rax
   28c74:	48 8b 40 18          	mov    0x18(%rax),%rax
   28c78:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28c7c:	48 8b 08             	mov    (%rax),%rcx
   28c7f:	0f 11 00             	movups %xmm0,(%rax)
   28c82:	83 fa f6             	cmp    $0xfffffff6,%edx
   28c85:	76 11                	jbe    28c98 <JS_CallInternal+0x38c8>
   28c87:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28c8a:	83 e8 01             	sub    $0x1,%eax
   28c8d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28c90:	85 c0                	test   %eax,%eax
   28c92:	0f 8e 8d 4a 00 00    	jle    2d725 <JS_CallInternal+0x8355>
   28c98:	41 0f b6 04 24       	movzbl (%r12),%eax
   28c9d:	49 83 c4 01          	add    $0x1,%r12
   28ca1:	49 89 c2             	mov    %rax,%r10
   28ca4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28ca8:	ff e0                	jmp    *%rax
   28caa:	f3 0f 1e fa          	endbr64
   28cae:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28cb5:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28cba:	48 83 eb 10          	sub    $0x10,%rbx
   28cbe:	48 8b 40 08          	mov    0x8(%rax),%rax
   28cc2:	48 8b 40 18          	mov    0x18(%rax),%rax
   28cc6:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28cca:	48 8b 08             	mov    (%rax),%rcx
   28ccd:	0f 11 00             	movups %xmm0,(%rax)
   28cd0:	83 fa f6             	cmp    $0xfffffff6,%edx
   28cd3:	76 11                	jbe    28ce6 <JS_CallInternal+0x3916>
   28cd5:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28cd8:	83 e8 01             	sub    $0x1,%eax
   28cdb:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28cde:	85 c0                	test   %eax,%eax
   28ce0:	0f 8e 1d 4a 00 00    	jle    2d703 <JS_CallInternal+0x8333>
   28ce6:	41 0f b6 04 24       	movzbl (%r12),%eax
   28ceb:	49 83 c4 01          	add    $0x1,%r12
   28cef:	49 89 c2             	mov    %rax,%r10
   28cf2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28cf6:	ff e0                	jmp    *%rax
   28cf8:	f3 0f 1e fa          	endbr64
   28cfc:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28d03:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28d07:	48 8b 40 18          	mov    0x18(%rax),%rax
   28d0b:	48 8b 40 18          	mov    0x18(%rax),%rax
   28d0f:	48 8b 10             	mov    (%rax),%rdx
   28d12:	48 8b 40 08          	mov    0x8(%rax),%rax
   28d16:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28d19:	76 04                	jbe    28d1f <JS_CallInternal+0x394f>
   28d1b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28d1f:	48 89 13             	mov    %rdx,(%rbx)
   28d22:	49 83 c4 01          	add    $0x1,%r12
   28d26:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28d2a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28d30:	48 89 cb             	mov    %rcx,%rbx
   28d33:	49 89 c2             	mov    %rax,%r10
   28d36:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28d3a:	ff e0                	jmp    *%rax
   28d3c:	f3 0f 1e fa          	endbr64
   28d40:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   28d44:	41 0f b7 04 24       	movzwl (%r12),%eax
   28d49:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   28d4d:	83 fe f6             	cmp    $0xfffffff6,%esi
   28d50:	76 04                	jbe    28d56 <JS_CallInternal+0x3986>
   28d52:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   28d56:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   28d5d:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   28d61:	48 8b 40 18          	mov    0x18(%rax),%rax
   28d65:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28d69:	48 8b 08             	mov    (%rax),%rcx
   28d6c:	48 89 70 08          	mov    %rsi,0x8(%rax)
   28d70:	48 89 38             	mov    %rdi,(%rax)
   28d73:	83 fa f6             	cmp    $0xfffffff6,%edx
   28d76:	76 11                	jbe    28d89 <JS_CallInternal+0x39b9>
   28d78:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28d7b:	83 e8 01             	sub    $0x1,%eax
   28d7e:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28d81:	85 c0                	test   %eax,%eax
   28d83:	0f 8e 8b 49 00 00    	jle    2d714 <JS_CallInternal+0x8344>
   28d89:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28d8f:	49 83 c4 03          	add    $0x3,%r12
   28d93:	49 89 c2             	mov    %rax,%r10
   28d96:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28d9a:	ff e0                	jmp    *%rax
   28d9c:	f3 0f 1e fa          	endbr64
   28da0:	41 0f b7 04 24       	movzwl (%r12),%eax
   28da5:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   28dac:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28db1:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   28db5:	48 8b 40 18          	mov    0x18(%rax),%rax
   28db9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28dbd:	48 8b 08             	mov    (%rax),%rcx
   28dc0:	0f 11 00             	movups %xmm0,(%rax)
   28dc3:	83 fa f6             	cmp    $0xfffffff6,%edx
   28dc6:	76 11                	jbe    28dd9 <JS_CallInternal+0x3a09>
   28dc8:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28dcb:	83 e8 01             	sub    $0x1,%eax
   28dce:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28dd1:	85 c0                	test   %eax,%eax
   28dd3:	0f 8e 5d 49 00 00    	jle    2d736 <JS_CallInternal+0x8366>
   28dd9:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28ddf:	48 83 eb 10          	sub    $0x10,%rbx
   28de3:	49 83 c4 03          	add    $0x3,%r12
   28de7:	49 89 c2             	mov    %rax,%r10
   28dea:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28dee:	ff e0                	jmp    *%rax
   28df0:	f3 0f 1e fa          	endbr64
   28df4:	41 0f b7 04 24       	movzwl (%r12),%eax
   28df9:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   28e00:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   28e04:	48 8b 40 18          	mov    0x18(%rax),%rax
   28e08:	48 8b 10             	mov    (%rax),%rdx
   28e0b:	48 8b 40 08          	mov    0x8(%rax),%rax
   28e0f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28e12:	76 04                	jbe    28e18 <JS_CallInternal+0x3a48>
   28e14:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28e18:	48 89 13             	mov    %rdx,(%rbx)
   28e1b:	49 83 c4 03          	add    $0x3,%r12
   28e1f:	48 83 c3 10          	add    $0x10,%rbx
   28e23:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28e27:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28e2d:	49 89 c2             	mov    %rax,%r10
   28e30:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28e34:	ff e0                	jmp    *%rax
   28e36:	f3 0f 1e fa          	endbr64
   28e3a:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28e3e:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28e42:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28e45:	76 04                	jbe    28e4b <JS_CallInternal+0x3a7b>
   28e47:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28e4b:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28e52:	48 8b 40 18          	mov    0x18(%rax),%rax
   28e56:	48 8b 40 18          	mov    0x18(%rax),%rax
   28e5a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28e5e:	48 8b 38             	mov    (%rax),%rdi
   28e61:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28e65:	48 89 30             	mov    %rsi,(%rax)
   28e68:	83 fa f6             	cmp    $0xfffffff6,%edx
   28e6b:	76 11                	jbe    28e7e <JS_CallInternal+0x3aae>
   28e6d:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28e70:	83 e8 01             	sub    $0x1,%eax
   28e73:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28e76:	85 c0                	test   %eax,%eax
   28e78:	0f 8e c9 48 00 00    	jle    2d747 <JS_CallInternal+0x8377>
   28e7e:	41 0f b6 04 24       	movzbl (%r12),%eax
   28e83:	49 83 c4 01          	add    $0x1,%r12
   28e87:	49 89 c2             	mov    %rax,%r10
   28e8a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28e8e:	ff e0                	jmp    *%rax
   28e90:	f3 0f 1e fa          	endbr64
   28e94:	41 0f b7 34 24       	movzwl (%r12),%esi
   28e99:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   28ea0:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   28ea5:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
   28ea9:	48 8b 40 18          	mov    0x18(%rax),%rax
   28ead:	48 8b 10             	mov    (%rax),%rdx
   28eb0:	48 8b 40 08          	mov    0x8(%rax),%rax
   28eb4:	83 f8 04             	cmp    $0x4,%eax
   28eb7:	0f 84 ec 50 00 00    	je     2dfa9 <JS_CallInternal+0x8bd9>
   28ebd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28ec0:	76 04                	jbe    28ec6 <JS_CallInternal+0x3af6>
   28ec2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28ec6:	48 89 13             	mov    %rdx,(%rbx)
   28ec9:	49 83 c4 03          	add    $0x3,%r12
   28ecd:	48 83 c3 10          	add    $0x10,%rbx
   28ed1:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28ed5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28edb:	49 89 c2             	mov    %rax,%r10
   28ede:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28ee2:	ff e0                	jmp    *%rax
   28ee4:	f3 0f 1e fa          	endbr64
   28ee8:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28eec:	41 0f b7 04 24       	movzwl (%r12),%eax
   28ef1:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28ef5:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28ef8:	76 04                	jbe    28efe <JS_CallInternal+0x3b2e>
   28efa:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28efe:	48 c1 e0 04          	shl    $0x4,%rax
   28f02:	48 03 85 50 fe ff ff 	add    -0x1b0(%rbp),%rax
   28f09:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28f0d:	48 8b 38             	mov    (%rax),%rdi
   28f10:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28f14:	48 89 30             	mov    %rsi,(%rax)
   28f17:	83 fa f6             	cmp    $0xfffffff6,%edx
   28f1a:	76 11                	jbe    28f2d <JS_CallInternal+0x3b5d>
   28f1c:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28f1f:	83 e8 01             	sub    $0x1,%eax
   28f22:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28f25:	85 c0                	test   %eax,%eax
   28f27:	0f 8e e4 49 00 00    	jle    2d911 <JS_CallInternal+0x8541>
   28f2d:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28f33:	49 83 c4 03          	add    $0x3,%r12
   28f37:	49 89 c2             	mov    %rax,%r10
   28f3a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28f3e:	ff e0                	jmp    *%rax
   28f40:	f3 0f 1e fa          	endbr64
   28f44:	41 0f b7 04 24       	movzwl (%r12),%eax
   28f49:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28f4e:	48 c1 e0 04          	shl    $0x4,%rax
   28f52:	48 03 85 50 fe ff ff 	add    -0x1b0(%rbp),%rax
   28f59:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28f5d:	48 8b 08             	mov    (%rax),%rcx
   28f60:	0f 11 00             	movups %xmm0,(%rax)
   28f63:	83 fa f6             	cmp    $0xfffffff6,%edx
   28f66:	76 11                	jbe    28f79 <JS_CallInternal+0x3ba9>
   28f68:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28f6b:	83 e8 01             	sub    $0x1,%eax
   28f6e:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28f71:	85 c0                	test   %eax,%eax
   28f73:	0f 8e a9 49 00 00    	jle    2d922 <JS_CallInternal+0x8552>
   28f79:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28f7f:	48 83 eb 10          	sub    $0x10,%rbx
   28f83:	49 83 c4 03          	add    $0x3,%r12
   28f87:	49 89 c2             	mov    %rax,%r10
   28f8a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28f8e:	ff e0                	jmp    *%rax
   28f90:	f3 0f 1e fa          	endbr64
   28f94:	41 0f b7 04 24       	movzwl (%r12),%eax
   28f99:	48 c1 e0 04          	shl    $0x4,%rax
   28f9d:	48 03 85 50 fe ff ff 	add    -0x1b0(%rbp),%rax
   28fa4:	48 8b 10             	mov    (%rax),%rdx
   28fa7:	48 8b 40 08          	mov    0x8(%rax),%rax
   28fab:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28fae:	76 04                	jbe    28fb4 <JS_CallInternal+0x3be4>
   28fb0:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28fb4:	48 89 13             	mov    %rdx,(%rbx)
   28fb7:	49 83 c4 03          	add    $0x3,%r12
   28fbb:	48 83 c3 10          	add    $0x10,%rbx
   28fbf:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28fc3:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28fc9:	49 89 c2             	mov    %rax,%r10
   28fcc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28fd0:	ff e0                	jmp    *%rax
   28fd2:	f3 0f 1e fa          	endbr64
   28fd6:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28fda:	41 0f b7 04 24       	movzwl (%r12),%eax
   28fdf:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28fe3:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28fe6:	76 04                	jbe    28fec <JS_CallInternal+0x3c1c>
   28fe8:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28fec:	48 c1 e0 04          	shl    $0x4,%rax
   28ff0:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   28ff7:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28ffb:	48 8b 38             	mov    (%rax),%rdi
   28ffe:	48 89 48 08          	mov    %rcx,0x8(%rax)
   29002:	48 89 30             	mov    %rsi,(%rax)
   29005:	83 fa f6             	cmp    $0xfffffff6,%edx
   29008:	76 11                	jbe    2901b <JS_CallInternal+0x3c4b>
   2900a:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2900d:	83 e8 01             	sub    $0x1,%eax
   29010:	89 47 fc             	mov    %eax,-0x4(%rdi)
   29013:	85 c0                	test   %eax,%eax
   29015:	0f 8e 0e 4b 00 00    	jle    2db29 <JS_CallInternal+0x8759>
   2901b:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   29021:	49 83 c4 03          	add    $0x3,%r12
   29025:	49 89 c2             	mov    %rax,%r10
   29028:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2902c:	ff e0                	jmp    *%rax
   2902e:	f3 0f 1e fa          	endbr64
   29032:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29036:	4c 8d 4b e0          	lea    -0x20(%rbx),%r9
   2903a:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   2903e:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29042:	49 8b 58 08          	mov    0x8(%r8),%rbx
   29046:	4c 89 8d c0 fd ff ff 	mov    %r9,-0x240(%rbp)
   2904d:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29054:	49 8b 41 08          	mov    0x8(%r9),%rax
   29058:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2905f:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   29066:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2906d:	83 fb f9             	cmp    $0xfffffff9,%ebx
   29070:	0f 85 37 3f 00 00    	jne    2cfad <JS_CallInternal+0x7bdd>
   29076:	83 f8 f9             	cmp    $0xfffffff9,%eax
   29079:	0f 85 2e 3f 00 00    	jne    2cfad <JS_CallInternal+0x7bdd>
   2907f:	49 8b 75 48          	mov    0x48(%r13),%rsi
   29083:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   2908a:	ba 12 00 00 00       	mov    $0x12,%edx
   2908f:	4c 89 ef             	mov    %r13,%rdi
   29092:	48 c7 85 50 ff ff ff 	movq   $0x0,-0xb0(%rbp)
   29099:	00 00 00 00 
   2909d:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   290a1:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   290a8:	00 00 00 00 
   290ac:	e8 8f 18 02 00       	call   4a940 <JS_NewObjectFromShape>
   290b1:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   290b8:	4c 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9
   290bf:	83 fa 06             	cmp    $0x6,%edx
   290c2:	0f 84 04 3f 00 00    	je     2cfcc <JS_CallInternal+0x7bfc>
   290c8:	f3 0f 7e 85 00 fe ff 	movq   -0x200(%rbp),%xmm0
   290cf:	ff 
   290d0:	0f 16 85 f8 fd ff ff 	movhps -0x208(%rbp),%xmm0
   290d7:	0f 11 40 28          	movups %xmm0,0x28(%rax)
   290db:	49 89 01             	mov    %rax,(%r9)
   290de:	49 89 51 08          	mov    %rdx,0x8(%r9)
   290e2:	41 83 78 f8 06       	cmpl   $0x6,-0x8(%r8)
   290e7:	0f 84 52 58 00 00    	je     2e93f <JS_CallInternal+0x956f>
   290ed:	41 0f b6 04 24       	movzbl (%r12),%eax
   290f2:	4c 89 c3             	mov    %r8,%rbx
   290f5:	49 83 c4 01          	add    $0x1,%r12
   290f9:	49 89 c2             	mov    %rax,%r10
   290fc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29100:	ff e0                	jmp    *%rax
   29102:	f3 0f 1e fa          	endbr64
   29106:	41 0f b7 04 24       	movzwl (%r12),%eax
   2910b:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2910f:	4c 89 ef             	mov    %r13,%rdi
   29112:	48 8d b5 ac fe ff ff 	lea    -0x154(%rbp),%rsi
   29119:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
   29120:	66 89 85 f8 fd ff ff 	mov    %ax,-0x208(%rbp)
   29127:	49 8d 44 24 02       	lea    0x2(%r12),%rax
   2912c:	48 89 41 30          	mov    %rax,0x30(%rcx)
   29130:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29134:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2913b:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   2913f:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29146:	e8 f5 47 06 00       	call   8d940 <build_arg_list>
   2914b:	49 89 c2             	mov    %rax,%r10
   2914e:	48 85 c0             	test   %rax,%rax
   29151:	0f 84 99 44 00 00    	je     2d5f0 <JS_CallInternal+0x8220>
   29157:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2915b:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2915f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   29165:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2916c:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   29173:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   2917a:	48 89 c6             	mov    %rax,%rsi
   2917d:	48 89 bd d0 fd ff ff 	mov    %rdi,-0x230(%rbp)
   29184:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2918b:	e8 60 2f ff ff       	call   1c0f0 <js_strict_eq2.isra.0>
   29190:	44 8b 9d ac fe ff ff 	mov    -0x154(%rbp),%r11d
   29197:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2919e:	85 c0                	test   %eax,%eax
   291a0:	0f 84 e8 39 00 00    	je     2cb8e <JS_CallInternal+0x77be>
   291a6:	0f b7 85 f8 fd ff ff 	movzwl -0x208(%rbp),%eax
   291ad:	83 e8 02             	sub    $0x2,%eax
   291b0:	45 85 db             	test   %r11d,%r11d
   291b3:	0f 84 c8 39 00 00    	je     2cb81 <JS_CallInternal+0x77b1>
   291b9:	49 8b 0a             	mov    (%r10),%rcx
   291bc:	4d 8b 42 08          	mov    0x8(%r10),%r8
   291c0:	48 83 ec 08          	sub    $0x8,%rsp
   291c4:	44 89 9d c0 fd ff ff 	mov    %r11d,-0x240(%rbp)
   291cb:	31 f6                	xor    %esi,%esi
   291cd:	4c 89 ef             	mov    %r13,%rdi
   291d0:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   291d7:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   291dd:	ba 03 00 00 00       	mov    $0x3,%edx
   291e2:	50                   	push   %rax
   291e3:	e8 b8 bd 01 00       	call   44fa0 <JS_EvalObject>
   291e8:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   291ef:	48 89 95 f8 fd ff ff 	mov    %rdx,-0x208(%rbp)
   291f6:	41 5a                	pop    %r10
   291f8:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   291ff:	41 5b                	pop    %r11
   29201:	44 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%r11d
   29208:	45 85 db             	test   %r11d,%r11d
   2920b:	0f 84 81 2b 00 00    	je     2bd92 <JS_CallInternal+0x69c2>
   29211:	45 89 d8             	mov    %r11d,%r8d
   29214:	48 89 9d c0 fd ff ff 	mov    %rbx,-0x240(%rbp)
   2921b:	4c 89 d3             	mov    %r10,%rbx
   2921e:	49 c1 e0 04          	shl    $0x4,%r8
   29222:	4c 89 95 b8 fd ff ff 	mov    %r10,-0x248(%rbp)
   29229:	4d 01 d0             	add    %r10,%r8
   2922c:	4d 89 ea             	mov    %r13,%r10
   2922f:	4d 89 e5             	mov    %r12,%r13
   29232:	4d 89 c4             	mov    %r8,%r12
   29235:	eb 16                	jmp    2924d <JS_CallInternal+0x3e7d>
   29237:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2923e:	00 00 
   29240:	48 83 c3 10          	add    $0x10,%rbx
   29244:	4c 39 e3             	cmp    %r12,%rbx
   29247:	0f 84 31 2b 00 00    	je     2bd7e <JS_CallInternal+0x69ae>
   2924d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   29251:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29254:	76 ea                	jbe    29240 <JS_CallInternal+0x3e70>
   29256:	48 8b 33             	mov    (%rbx),%rsi
   29259:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2925c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2925f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   29262:	85 d2                	test   %edx,%edx
   29264:	7f da                	jg     29240 <JS_CallInternal+0x3e70>
   29266:	49 8b 7a 10          	mov    0x10(%r10),%rdi
   2926a:	48 89 c2             	mov    %rax,%rdx
   2926d:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   29274:	e8 a7 56 ff ff       	call   1e920 <__JS_FreeValueRT>
   29279:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   29280:	eb be                	jmp    29240 <JS_CallInternal+0x3e70>
   29282:	f3 0f 1e fa          	endbr64
   29286:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   2928b:	49 89 da             	mov    %rbx,%r10
   2928e:	41 0f b7 7c 24 02    	movzwl 0x2(%r12),%edi
   29294:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   2929a:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   292a1:	48 89 c8             	mov    %rcx,%rax
   292a4:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   292aa:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   292af:	48 c1 e0 04          	shl    $0x4,%rax
   292b3:	66 89 bd d0 fd ff ff 	mov    %di,-0x230(%rbp)
   292ba:	49 29 c2             	sub    %rax,%r10
   292bd:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   292c4:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   292cb:	49 8b 7a f0          	mov    -0x10(%r10),%rdi
   292cf:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   292d6:	48 89 48 30          	mov    %rcx,0x30(%rax)
   292da:	49 8b 42 f8          	mov    -0x8(%r10),%rax
   292de:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   292e5:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   292ec:	48 89 c6             	mov    %rax,%rsi
   292ef:	48 89 bd b8 fd ff ff 	mov    %rdi,-0x248(%rbp)
   292f6:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   292fd:	e8 ee 2d ff ff       	call   1c0f0 <js_strict_eq2.isra.0>
   29302:	4c 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%r10
   29309:	85 c0                	test   %eax,%eax
   2930b:	0f 84 f7 38 00 00    	je     2cc08 <JS_CallInternal+0x7838>
   29311:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%rbp),%eax
   29318:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   2931e:	83 e8 02             	sub    $0x2,%eax
   29321:	85 f6                	test   %esi,%esi
   29323:	0f 84 4b 38 00 00    	je     2cb74 <JS_CallInternal+0x77a4>
   29329:	49 8b 0a             	mov    (%r10),%rcx
   2932c:	4d 8b 42 08          	mov    0x8(%r10),%r8
   29330:	48 83 ec 08          	sub    $0x8,%rsp
   29334:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   2933b:	31 f6                	xor    %esi,%esi
   2933d:	4c 89 ef             	mov    %r13,%rdi
   29340:	50                   	push   %rax
   29341:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   29347:	ba 03 00 00 00       	mov    $0x3,%edx
   2934c:	e8 4f bc 01 00       	call   44fa0 <JS_EvalObject>
   29351:	4c 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%r10
   29358:	48 89 c6             	mov    %rax,%rsi
   2935b:	58                   	pop    %rax
   2935c:	59                   	pop    %rcx
   2935d:	83 fa 06             	cmp    $0x6,%edx
   29360:	0f 84 1a 50 00 00    	je     2e380 <JS_CallInternal+0x8fb0>
   29366:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   2936d:	49 8d 42 f0          	lea    -0x10(%r10),%rax
   29371:	4c 89 a5 f8 fd ff ff 	mov    %r12,-0x208(%rbp)
   29378:	4c 89 bd c0 fd ff ff 	mov    %r15,-0x240(%rbp)
   2937f:	49 89 df             	mov    %rbx,%r15
   29382:	48 89 c3             	mov    %rax,%rbx
   29385:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
   2938c:	4e 8d 24 11          	lea    (%rcx,%r10,1),%r12
   29390:	48 89 95 d0 fd ff ff 	mov    %rdx,-0x230(%rbp)
   29397:	eb 14                	jmp    293ad <JS_CallInternal+0x3fdd>
   29399:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   293a0:	48 83 c3 10          	add    $0x10,%rbx
   293a4:	4c 39 e3             	cmp    %r12,%rbx
   293a7:	0f 84 bf 2a 00 00    	je     2be6c <JS_CallInternal+0x6a9c>
   293ad:	48 8b 43 08          	mov    0x8(%rbx),%rax
   293b1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   293b4:	76 ea                	jbe    293a0 <JS_CallInternal+0x3fd0>
   293b6:	48 8b 33             	mov    (%rbx),%rsi
   293b9:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   293bc:	8d 51 ff             	lea    -0x1(%rcx),%edx
   293bf:	89 56 fc             	mov    %edx,-0x4(%rsi)
   293c2:	85 d2                	test   %edx,%edx
   293c4:	7f da                	jg     293a0 <JS_CallInternal+0x3fd0>
   293c6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   293ca:	48 89 c2             	mov    %rax,%rdx
   293cd:	e8 4e 55 ff ff       	call   1e920 <__JS_FreeValueRT>
   293d2:	eb cc                	jmp    293a0 <JS_CallInternal+0x3fd0>
   293d4:	f3 0f 1e fa          	endbr64
   293d8:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   293de:	41 8b 34 24          	mov    (%r12),%esi
   293e2:	49 83 c4 05          	add    $0x5,%r12
   293e6:	3c 04                	cmp    $0x4,%al
   293e8:	0f 87 b8 3f 00 00    	ja     2d3a6 <JS_CallInternal+0x7fd6>
   293ee:	48 8d 15 e3 9d 0b 00 	lea    0xb9de3(%rip),%rdx        # e31d8 <qjsc_repl_size+0x4cc>
   293f5:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   293f9:	48 01 d0             	add    %rdx,%rax
   293fc:	3e ff e0             	notrack jmp *%rax
   293ff:	48 8d 35 8a 39 0b 00 	lea    0xb398a(%rip),%rsi        # dcd90 <_IO_stdin_used+0x3d90>
   29406:	4c 89 ef             	mov    %r13,%rdi
   29409:	31 c0                	xor    %eax,%eax
   2940b:	e8 10 d0 00 00       	call   36420 <JS_ThrowReferenceError>
   29410:	e9 eb c7 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   29415:	48 8d 15 a1 00 0b 00 	lea    0xb00a1(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2941c:	85 f6                	test   %esi,%esi
   2941e:	0f 85 cc 61 00 00    	jne    2f5f0 <JS_CallInternal+0xa220>
   29424:	48 8d 35 ee 00 0b 00 	lea    0xb00ee(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2942b:	4c 89 ef             	mov    %r13,%rdi
   2942e:	31 c0                	xor    %eax,%eax
   29430:	e8 eb cf 00 00       	call   36420 <JS_ThrowReferenceError>
   29435:	e9 c6 c7 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2943a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2943e:	89 f2                	mov    %esi,%edx
   29440:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   29444:	e8 c7 f8 fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   29449:	48 8d 35 b3 00 0b 00 	lea    0xb00b3(%rip),%rsi        # d9503 <_IO_stdin_used+0x503>
   29450:	4c 89 ef             	mov    %r13,%rdi
   29453:	48 89 c2             	mov    %rax,%rdx
   29456:	31 c0                	xor    %eax,%eax
   29458:	e8 93 ac 00 00       	call   340f0 <JS_ThrowSyntaxError>
   2945d:	e9 9e c7 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   29462:	4c 89 ef             	mov    %r13,%rdi
   29465:	e8 26 c4 00 00       	call   35890 <JS_ThrowTypeErrorReadOnly.part.0>
   2946a:	e9 91 c7 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2946f:	48 8d 35 42 39 0b 00 	lea    0xb3942(%rip),%rsi        # dcdb8 <_IO_stdin_used+0x3db8>
   29476:	4c 89 ef             	mov    %r13,%rdi
   29479:	31 c0                	xor    %eax,%eax
   2947b:	e8 c0 b0 00 00       	call   34540 <JS_ThrowTypeError>
   29480:	e9 7b c7 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   29485:	f3 0f 1e fa          	endbr64
   29489:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   2948d:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29491:	45 85 db             	test   %r11d,%r11d
   29494:	0f 85 46 31 00 00    	jne    2c5e0 <JS_CallInternal+0x7210>
   2949a:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2949f:	0f 84 3b 31 00 00    	je     2c5e0 <JS_CallInternal+0x7210>
   294a5:	83 c0 01             	add    $0x1,%eax
   294a8:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   294af:	00 
   294b0:	48 89 03             	mov    %rax,(%rbx)
   294b3:	41 0f b6 04 24       	movzbl (%r12),%eax
   294b8:	48 83 c3 10          	add    $0x10,%rbx
   294bc:	49 83 c4 01          	add    $0x1,%r12
   294c0:	49 89 c2             	mov    %rax,%r10
   294c3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   294c7:	ff e0                	jmp    *%rax
   294c9:	f3 0f 1e fa          	endbr64
   294cd:	8b 53 f8             	mov    -0x8(%rbx),%edx
   294d0:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   294d4:	85 d2                	test   %edx,%edx
   294d6:	0f 85 d4 30 00 00    	jne    2c5b0 <JS_CallInternal+0x71e0>
   294dc:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   294e1:	0f 84 c9 30 00 00    	je     2c5b0 <JS_CallInternal+0x71e0>
   294e7:	83 e8 01             	sub    $0x1,%eax
   294ea:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   294f1:	00 
   294f2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   294f6:	41 0f b6 04 24       	movzbl (%r12),%eax
   294fb:	49 83 c4 01          	add    $0x1,%r12
   294ff:	49 89 c2             	mov    %rax,%r10
   29502:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29506:	ff e0                	jmp    *%rax
   29508:	f3 0f 1e fa          	endbr64
   2950c:	83 bd 48 fe ff ff 03 	cmpl   $0x3,-0x1b8(%rbp)
   29513:	0f 84 95 5e 00 00    	je     2f3ae <JS_CallInternal+0x9fde>
   29519:	41 0f b6 04 24       	movzbl (%r12),%eax
   2951e:	49 83 c4 01          	add    $0x1,%r12
   29522:	49 89 c2             	mov    %rax,%r10
   29525:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29529:	ff e0                	jmp    *%rax
   2952b:	f3 0f 1e fa          	endbr64
   2952f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29533:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29537:	45 31 c9             	xor    %r9d,%r9d
   2953a:	4c 89 ef             	mov    %r13,%rdi
   2953d:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   29544:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29548:	48 c7 85 90 fd ff ff 	movq   $0x0,-0x270(%rbp)
   2954f:	00 00 00 00 
   29553:	48 c7 85 98 fd ff ff 	movq   $0x3,-0x268(%rbp)
   2955a:	03 00 00 00 
   2955e:	4c 8b 43 d8          	mov    -0x28(%rbx),%r8
   29562:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29566:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   2956d:	00 
   2956e:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   29575:	00 
   29576:	6a 02                	push   $0x2
   29578:	6a 00                	push   $0x0
   2957a:	ff b5 98 fd ff ff    	push   -0x268(%rbp)
   29580:	ff b5 90 fd ff ff    	push   -0x270(%rbp)
   29586:	e8 45 be ff ff       	call   253d0 <JS_CallInternal>
   2958b:	48 83 c4 20          	add    $0x20,%rsp
   2958f:	83 fa 06             	cmp    $0x6,%edx
   29592:	0f 84 68 c6 ff ff    	je     25c00 <JS_CallInternal+0x830>
   29598:	48 89 03             	mov    %rax,(%rbx)
   2959b:	49 83 c4 01          	add    $0x1,%r12
   2959f:	48 83 c3 10          	add    $0x10,%rbx
   295a3:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   295a7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   295ad:	49 89 c2             	mov    %rax,%r10
   295b0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   295b4:	ff e0                	jmp    *%rax
   295b6:	f3 0f 1e fa          	endbr64
   295ba:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   295c1:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   295c5:	48 8b 50 30          	mov    0x30(%rax),%rdx
   295c9:	48 8b 40 38          	mov    0x38(%rax),%rax
   295cd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   295d0:	76 04                	jbe    295d6 <JS_CallInternal+0x4206>
   295d2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   295d6:	48 89 13             	mov    %rdx,(%rbx)
   295d9:	49 83 c4 01          	add    $0x1,%r12
   295dd:	48 89 43 08          	mov    %rax,0x8(%rbx)
   295e1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   295e7:	48 89 cb             	mov    %rcx,%rbx
   295ea:	49 89 c2             	mov    %rax,%r10
   295ed:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   295f1:	ff e0                	jmp    *%rax
   295f3:	f3 0f 1e fa          	endbr64
   295f7:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   295fe:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   29602:	48 8b 50 20          	mov    0x20(%rax),%rdx
   29606:	48 8b 40 28          	mov    0x28(%rax),%rax
   2960a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2960d:	76 04                	jbe    29613 <JS_CallInternal+0x4243>
   2960f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29613:	48 89 13             	mov    %rdx,(%rbx)
   29616:	49 83 c4 01          	add    $0x1,%r12
   2961a:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2961e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29624:	48 89 cb             	mov    %rcx,%rbx
   29627:	49 89 c2             	mov    %rax,%r10
   2962a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2962e:	ff e0                	jmp    *%rax
   29630:	f3 0f 1e fa          	endbr64
   29634:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   2963b:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2963f:	48 8b 50 10          	mov    0x10(%rax),%rdx
   29643:	48 8b 40 18          	mov    0x18(%rax),%rax
   29647:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2964a:	76 04                	jbe    29650 <JS_CallInternal+0x4280>
   2964c:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29650:	48 89 13             	mov    %rdx,(%rbx)
   29653:	49 83 c4 01          	add    $0x1,%r12
   29657:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2965b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29661:	48 89 cb             	mov    %rcx,%rbx
   29664:	49 89 c2             	mov    %rax,%r10
   29667:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2966b:	ff e0                	jmp    *%rax
   2966d:	f3 0f 1e fa          	endbr64
   29671:	48 8b 8d 68 fe ff ff 	mov    -0x198(%rbp),%rcx
   29678:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   2967c:	48 8b 01             	mov    (%rcx),%rax
   2967f:	83 fa ff             	cmp    $0xffffffff,%edx
   29682:	0f 84 60 31 00 00    	je     2c7e8 <JS_CallInternal+0x7418>
   29688:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2968c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2968f:	76 04                	jbe    29695 <JS_CallInternal+0x42c5>
   29691:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   29695:	48 89 03             	mov    %rax,(%rbx)
   29698:	4c 89 e0             	mov    %r12,%rax
   2969b:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
   296a0:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   296a4:	0f b6 00             	movzbl (%rax),%eax
   296a7:	48 89 cb             	mov    %rcx,%rbx
   296aa:	49 89 c2             	mov    %rax,%r10
   296ad:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   296b1:	f3 0f 1e fa          	endbr64
   296b5:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   296bc:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   296c0:	48 8b 10             	mov    (%rax),%rdx
   296c3:	48 8b 40 08          	mov    0x8(%rax),%rax
   296c7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   296ca:	76 04                	jbe    296d0 <JS_CallInternal+0x4300>
   296cc:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   296d0:	48 89 13             	mov    %rdx,(%rbx)
   296d3:	49 83 c4 01          	add    $0x1,%r12
   296d7:	48 89 43 08          	mov    %rax,0x8(%rbx)
   296db:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   296e1:	48 89 cb             	mov    %rcx,%rbx
   296e4:	49 89 c2             	mov    %rax,%r10
   296e7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   296eb:	ff e0                	jmp    *%rax
   296ed:	f3 0f 1e fa          	endbr64
   296f1:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   296f5:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   296f9:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   296fc:	76 04                	jbe    29702 <JS_CallInternal+0x4332>
   296fe:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   29702:	41 0f b6 04 24       	movzbl (%r12),%eax
   29707:	48 c1 e0 04          	shl    $0x4,%rax
   2970b:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   29712:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29716:	48 8b 38             	mov    (%rax),%rdi
   29719:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2971d:	48 89 30             	mov    %rsi,(%rax)
   29720:	83 fa f6             	cmp    $0xfffffff6,%edx
   29723:	76 11                	jbe    29736 <JS_CallInternal+0x4366>
   29725:	8b 47 fc             	mov    -0x4(%rdi),%eax
   29728:	83 e8 01             	sub    $0x1,%eax
   2972b:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2972e:	85 c0                	test   %eax,%eax
   29730:	0f 8e 9a 41 00 00    	jle    2d8d0 <JS_CallInternal+0x8500>
   29736:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2973c:	49 83 c4 02          	add    $0x2,%r12
   29740:	49 89 c2             	mov    %rax,%r10
   29743:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29747:	ff e0                	jmp    *%rax
   29749:	f3 0f 1e fa          	endbr64
   2974d:	41 0f b6 04 24       	movzbl (%r12),%eax
   29752:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29757:	48 83 eb 10          	sub    $0x10,%rbx
   2975b:	48 c1 e0 04          	shl    $0x4,%rax
   2975f:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   29766:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2976a:	48 8b 08             	mov    (%rax),%rcx
   2976d:	0f 11 00             	movups %xmm0,(%rax)
   29770:	83 fa f6             	cmp    $0xfffffff6,%edx
   29773:	76 11                	jbe    29786 <JS_CallInternal+0x43b6>
   29775:	8b 41 fc             	mov    -0x4(%rcx),%eax
   29778:	83 e8 01             	sub    $0x1,%eax
   2977b:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2977e:	85 c0                	test   %eax,%eax
   29780:	0f 8e e8 3e 00 00    	jle    2d66e <JS_CallInternal+0x829e>
   29786:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2978c:	49 83 c4 02          	add    $0x2,%r12
   29790:	49 89 c2             	mov    %rax,%r10
   29793:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29797:	ff e0                	jmp    *%rax
   29799:	f3 0f 1e fa          	endbr64
   2979d:	41 0f b6 04 24       	movzbl (%r12),%eax
   297a2:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   297a6:	48 c1 e0 04          	shl    $0x4,%rax
   297aa:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   297b1:	48 8b 10             	mov    (%rax),%rdx
   297b4:	48 8b 40 08          	mov    0x8(%rax),%rax
   297b8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   297bb:	76 04                	jbe    297c1 <JS_CallInternal+0x43f1>
   297bd:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   297c1:	48 89 13             	mov    %rdx,(%rbx)
   297c4:	49 83 c4 02          	add    $0x2,%r12
   297c8:	48 89 43 08          	mov    %rax,0x8(%rbx)
   297cc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   297d2:	48 89 cb             	mov    %rcx,%rbx
   297d5:	49 89 c2             	mov    %rax,%r10
   297d8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   297dc:	ff e0                	jmp    *%rax
   297de:	f3 0f 1e fa          	endbr64
   297e2:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   297e9:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   297ee:	48 83 eb 10          	sub    $0x10,%rbx
   297f2:	48 8b 47 38          	mov    0x38(%rdi),%rax
   297f6:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   297fa:	0f 11 47 30          	movups %xmm0,0x30(%rdi)
   297fe:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29801:	76 11                	jbe    29814 <JS_CallInternal+0x4444>
   29803:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29806:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29809:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2980c:	85 d2                	test   %edx,%edx
   2980e:	0f 8e 46 3e 00 00    	jle    2d65a <JS_CallInternal+0x828a>
   29814:	41 0f b6 04 24       	movzbl (%r12),%eax
   29819:	49 83 c4 01          	add    $0x1,%r12
   2981d:	49 89 c2             	mov    %rax,%r10
   29820:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29824:	ff e0                	jmp    *%rax
   29826:	f3 0f 1e fa          	endbr64
   2982a:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   29831:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29836:	48 83 eb 10          	sub    $0x10,%rbx
   2983a:	48 8b 47 28          	mov    0x28(%rdi),%rax
   2983e:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
   29842:	0f 11 47 20          	movups %xmm0,0x20(%rdi)
   29846:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29849:	76 11                	jbe    2985c <JS_CallInternal+0x448c>
   2984b:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2984e:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29851:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29854:	85 d2                	test   %edx,%edx
   29856:	0f 8e ea 3d 00 00    	jle    2d646 <JS_CallInternal+0x8276>
   2985c:	41 0f b6 04 24       	movzbl (%r12),%eax
   29861:	49 83 c4 01          	add    $0x1,%r12
   29865:	49 89 c2             	mov    %rax,%r10
   29868:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2986c:	ff e0                	jmp    *%rax
   2986e:	f3 0f 1e fa          	endbr64
   29872:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   29879:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2987e:	48 83 eb 10          	sub    $0x10,%rbx
   29882:	48 8b 47 18          	mov    0x18(%rdi),%rax
   29886:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
   2988a:	0f 11 47 10          	movups %xmm0,0x10(%rdi)
   2988e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29891:	76 11                	jbe    298a4 <JS_CallInternal+0x44d4>
   29893:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29896:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29899:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2989c:	85 d2                	test   %edx,%edx
   2989e:	0f 8e 8e 3d 00 00    	jle    2d632 <JS_CallInternal+0x8262>
   298a4:	41 0f b6 04 24       	movzbl (%r12),%eax
   298a9:	49 83 c4 01          	add    $0x1,%r12
   298ad:	49 89 c2             	mov    %rax,%r10
   298b0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   298b4:	ff e0                	jmp    *%rax
   298b6:	f3 0f 1e fa          	endbr64
   298ba:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   298c1:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   298c6:	48 83 eb 10          	sub    $0x10,%rbx
   298ca:	48 8b 47 08          	mov    0x8(%rdi),%rax
   298ce:	48 8b 0f             	mov    (%rdi),%rcx
   298d1:	0f 11 07             	movups %xmm0,(%rdi)
   298d4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   298d7:	76 11                	jbe    298ea <JS_CallInternal+0x451a>
   298d9:	8b 79 fc             	mov    -0x4(%rcx),%edi
   298dc:	8d 57 ff             	lea    -0x1(%rdi),%edx
   298df:	89 51 fc             	mov    %edx,-0x4(%rcx)
   298e2:	85 d2                	test   %edx,%edx
   298e4:	0f 8e 34 3d 00 00    	jle    2d61e <JS_CallInternal+0x824e>
   298ea:	41 0f b6 04 24       	movzbl (%r12),%eax
   298ef:	49 83 c4 01          	add    $0x1,%r12
   298f3:	49 89 c2             	mov    %rax,%r10
   298f6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   298fa:	ff e0                	jmp    *%rax
   298fc:	f3 0f 1e fa          	endbr64
   29900:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29904:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29908:	83 fa f6             	cmp    $0xfffffff6,%edx
   2990b:	76 04                	jbe    29911 <JS_CallInternal+0x4541>
   2990d:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   29911:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   29918:	48 8b 47 18          	mov    0x18(%rdi),%rax
   2991c:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   29920:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   29924:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   29928:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2992b:	76 11                	jbe    2993e <JS_CallInternal+0x456e>
   2992d:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   29930:	8d 51 ff             	lea    -0x1(%rcx),%edx
   29933:	89 56 fc             	mov    %edx,-0x4(%rsi)
   29936:	85 d2                	test   %edx,%edx
   29938:	0f 8e cf 3c 00 00    	jle    2d60d <JS_CallInternal+0x823d>
   2993e:	41 0f b6 04 24       	movzbl (%r12),%eax
   29943:	49 83 c4 01          	add    $0x1,%r12
   29947:	49 89 c2             	mov    %rax,%r10
   2994a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2994e:	ff e0                	jmp    *%rax
   29950:	f3 0f 1e fa          	endbr64
   29954:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29958:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2995c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2995f:	76 04                	jbe    29965 <JS_CallInternal+0x4595>
   29961:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   29965:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   2996c:	48 8b 47 08          	mov    0x8(%rdi),%rax
   29970:	48 8b 37             	mov    (%rdi),%rsi
   29973:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   29977:	48 89 0f             	mov    %rcx,(%rdi)
   2997a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2997d:	76 11                	jbe    29990 <JS_CallInternal+0x45c0>
   2997f:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   29982:	8d 51 ff             	lea    -0x1(%rcx),%edx
   29985:	89 56 fc             	mov    %edx,-0x4(%rsi)
   29988:	85 d2                	test   %edx,%edx
   2998a:	0f 8e 6c 3c 00 00    	jle    2d5fc <JS_CallInternal+0x822c>
   29990:	41 0f b6 04 24       	movzbl (%r12),%eax
   29995:	49 83 c4 01          	add    $0x1,%r12
   29999:	49 89 c2             	mov    %rax,%r10
   2999c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   299a0:	ff e0                	jmp    *%rax
   299a2:	f3 0f 1e fa          	endbr64
   299a6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   299aa:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   299ae:	83 fa f6             	cmp    $0xfffffff6,%edx
   299b1:	76 04                	jbe    299b7 <JS_CallInternal+0x45e7>
   299b3:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   299b7:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   299be:	48 8b 47 28          	mov    0x28(%rdi),%rax
   299c2:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   299c6:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   299ca:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   299ce:	83 f8 f6             	cmp    $0xfffffff6,%eax
   299d1:	76 11                	jbe    299e4 <JS_CallInternal+0x4614>
   299d3:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   299d6:	8d 51 ff             	lea    -0x1(%rcx),%edx
   299d9:	89 56 fc             	mov    %edx,-0x4(%rsi)
   299dc:	85 d2                	test   %edx,%edx
   299de:	0f 8e 97 3e 00 00    	jle    2d87b <JS_CallInternal+0x84ab>
   299e4:	41 0f b6 04 24       	movzbl (%r12),%eax
   299e9:	49 83 c4 01          	add    $0x1,%r12
   299ed:	49 89 c2             	mov    %rax,%r10
   299f0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   299f4:	ff e0                	jmp    *%rax
   299f6:	f3 0f 1e fa          	endbr64
   299fa:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   299fe:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29a02:	4c 8d 4b f0          	lea    -0x10(%rbx),%r9
   29a06:	4c 89 ef             	mov    %r13,%rdi
   29a09:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29a0d:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   29a14:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   29a1b:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   29a1f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29a23:	e8 f8 a7 08 00       	call   b4220 <js_dynamic_import>
   29a28:	48 89 c1             	mov    %rax,%rcx
   29a2b:	48 89 d0             	mov    %rdx,%rax
   29a2e:	83 fa 06             	cmp    $0x6,%edx
   29a31:	0f 84 c9 c1 ff ff    	je     25c00 <JS_CallInternal+0x830>
   29a37:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29a3b:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   29a42:	83 fe f6             	cmp    $0xfffffff6,%esi
   29a45:	76 15                	jbe    29a5c <JS_CallInternal+0x468c>
   29a47:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29a4b:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   29a4e:	8d 53 ff             	lea    -0x1(%rbx),%edx
   29a51:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29a54:	85 d2                	test   %edx,%edx
   29a56:	0f 8e eb 3e 00 00    	jle    2d947 <JS_CallInternal+0x8577>
   29a5c:	49 8b 71 08          	mov    0x8(%r9),%rsi
   29a60:	83 fe f6             	cmp    $0xfffffff6,%esi
   29a63:	76 14                	jbe    29a79 <JS_CallInternal+0x46a9>
   29a65:	49 8b 39             	mov    (%r9),%rdi
   29a68:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   29a6b:	8d 53 ff             	lea    -0x1(%rbx),%edx
   29a6e:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29a71:	85 d2                	test   %edx,%edx
   29a73:	0f 8e 05 3f 00 00    	jle    2d97e <JS_CallInternal+0x85ae>
   29a79:	49 89 49 f0          	mov    %rcx,-0x10(%r9)
   29a7d:	4c 89 cb             	mov    %r9,%rbx
   29a80:	49 83 c4 01          	add    $0x1,%r12
   29a84:	49 89 41 f8          	mov    %rax,-0x8(%r9)
   29a88:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29a8e:	49 89 c2             	mov    %rax,%r10
   29a91:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a95:	ff e0                	jmp    *%rax
   29a97:	f3 0f 1e fa          	endbr64
   29a9b:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   29aa2:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29aa6:	4c 89 ef             	mov    %r13,%rdi
   29aa9:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29aad:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29ab1:	e8 2a b1 ff ff       	call   24be0 <JS_GetPrototype>
   29ab6:	48 89 c1             	mov    %rax,%rcx
   29ab9:	48 89 d0             	mov    %rdx,%rax
   29abc:	83 fa 06             	cmp    $0x6,%edx
   29abf:	0f 84 3b c1 ff ff    	je     25c00 <JS_CallInternal+0x830>
   29ac5:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   29ac9:	83 fe f6             	cmp    $0xfffffff6,%esi
   29acc:	76 15                	jbe    29ae3 <JS_CallInternal+0x4713>
   29ace:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   29ad2:	8b 57 fc             	mov    -0x4(%rdi),%edx
   29ad5:	83 ea 01             	sub    $0x1,%edx
   29ad8:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29adb:	85 d2                	test   %edx,%edx
   29add:	0f 8e a9 3d 00 00    	jle    2d88c <JS_CallInternal+0x84bc>
   29ae3:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   29ae7:	49 83 c4 01          	add    $0x1,%r12
   29aeb:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   29aef:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29af5:	49 89 c2             	mov    %rax,%r10
   29af8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29afc:	ff e0                	jmp    *%rax
   29afe:	f3 0f 1e fa          	endbr64
   29b02:	49 8b 45 58          	mov    0x58(%r13),%rax
   29b06:	b9 01 00 00 00       	mov    $0x1,%ecx
   29b0b:	4c 89 ef             	mov    %r13,%rdi
   29b0e:	48 8b 70 10          	mov    0x10(%rax),%rsi
   29b12:	48 8b 50 18          	mov    0x18(%rax),%rdx
   29b16:	e8 d5 16 02 00       	call   4b1f0 <JS_NewObjectProtoClass>
   29b1b:	48 89 03             	mov    %rax,(%rbx)
   29b1e:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29b22:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   29b26:	0f 84 aa 47 00 00    	je     2e2d6 <JS_CallInternal+0x8f06>
   29b2c:	41 0f b6 04 24       	movzbl (%r12),%eax
   29b31:	48 83 c3 10          	add    $0x10,%rbx
   29b35:	49 83 c4 01          	add    $0x1,%r12
   29b39:	49 89 c2             	mov    %rax,%r10
   29b3c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29b40:	ff e0                	jmp    *%rax
   29b42:	f3 0f 1e fa          	endbr64
   29b46:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   29b4d:	49 83 c4 01          	add    $0x1,%r12
   29b51:	48 83 c3 10          	add    $0x10,%rbx
   29b55:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29b5c:	00 
   29b5d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29b63:	49 89 c2             	mov    %rax,%r10
   29b66:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29b6a:	ff e0                	jmp    *%rax
   29b6c:	f3 0f 1e fa          	endbr64
   29b70:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   29b77:	49 83 c4 01          	add    $0x1,%r12
   29b7b:	48 83 c3 10          	add    $0x10,%rbx
   29b7f:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29b86:	00 
   29b87:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29b8d:	49 89 c2             	mov    %rax,%r10
   29b90:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29b94:	ff e0                	jmp    *%rax
   29b96:	f3 0f 1e fa          	endbr64
   29b9a:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   29ba1:	f6 40 10 01          	testb  $0x1,0x10(%rax)
   29ba5:	75 0d                	jne    29bb4 <JS_CallInternal+0x47e4>
   29ba7:	83 bd 40 fe ff ff ff 	cmpl   $0xffffffff,-0x1c0(%rbp)
   29bae:	0f 85 c8 57 00 00    	jne    2f37c <JS_CallInternal+0x9fac>
   29bb4:	83 bd 40 fe ff ff f6 	cmpl   $0xfffffff6,-0x1c0(%rbp)
   29bbb:	76 0b                	jbe    29bc8 <JS_CallInternal+0x47f8>
   29bbd:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   29bc4:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   29bc8:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   29bcf:	48 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%rdx
   29bd6:	48 89 13             	mov    %rdx,(%rbx)
   29bd9:	49 83 c4 01          	add    $0x1,%r12
   29bdd:	48 83 c3 10          	add    $0x10,%rbx
   29be1:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   29be5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29beb:	49 89 c2             	mov    %rax,%r10
   29bee:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29bf2:	ff e0                	jmp    *%rax
   29bf4:	f3 0f 1e fa          	endbr64
   29bf8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   29bff:	49 83 c4 01          	add    $0x1,%r12
   29c03:	48 83 c3 10          	add    $0x10,%rbx
   29c07:	48 c7 43 f8 02 00 00 	movq   $0x2,-0x8(%rbx)
   29c0e:	00 
   29c0f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c15:	49 89 c2             	mov    %rax,%r10
   29c18:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c1c:	ff e0                	jmp    *%rax
   29c1e:	f3 0f 1e fa          	endbr64
   29c22:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   29c29:	49 83 c4 01          	add    $0x1,%r12
   29c2d:	48 83 c3 10          	add    $0x10,%rbx
   29c31:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   29c38:	00 
   29c39:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c3f:	49 89 c2             	mov    %rax,%r10
   29c42:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c46:	ff e0                	jmp    *%rax
   29c48:	f3 0f 1e fa          	endbr64
   29c4c:	41 8b 34 24          	mov    (%r12),%esi
   29c50:	31 d2                	xor    %edx,%edx
   29c52:	4c 89 ef             	mov    %r13,%rdi
   29c55:	48 83 c3 10          	add    $0x10,%rbx
   29c59:	49 83 c4 05          	add    $0x5,%r12
   29c5d:	e8 5e 24 01 00       	call   3c0c0 <__JS_AtomToValue>
   29c62:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29c66:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29c6a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c70:	49 89 c2             	mov    %rax,%r10
   29c73:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c77:	ff e0                	jmp    *%rax
   29c79:	f3 0f 1e fa          	endbr64
   29c7d:	ba 01 00 00 00       	mov    $0x1,%edx
   29c82:	4c 89 ef             	mov    %r13,%rdi
   29c85:	48 83 c3 10          	add    $0x10,%rbx
   29c89:	49 83 c4 01          	add    $0x1,%r12
   29c8d:	be 2f 00 00 00       	mov    $0x2f,%esi
   29c92:	e8 29 24 01 00       	call   3c0c0 <__JS_AtomToValue>
   29c97:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29c9b:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29c9f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29ca5:	49 89 c2             	mov    %rax,%r10
   29ca8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29cac:	ff e0                	jmp    *%rax
   29cae:	f3 0f 1e fa          	endbr64
   29cb2:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   29cb6:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   29cba:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29cbd:	76 11                	jbe    29cd0 <JS_CallInternal+0x4900>
   29cbf:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29cc2:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29cc5:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29cc8:	85 d2                	test   %edx,%edx
   29cca:	0f 8e 56 3b 00 00    	jle    2d826 <JS_CallInternal+0x8456>
   29cd0:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29cd5:	49 83 c4 01          	add    $0x1,%r12
   29cd9:	48 83 eb 10          	sub    $0x10,%rbx
   29cdd:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   29ce1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29ce7:	49 89 c2             	mov    %rax,%r10
   29cea:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29cee:	ff e0                	jmp    *%rax
   29cf0:	f3 0f 1e fa          	endbr64
   29cf4:	e9 c7 b9 ff ff       	jmp    256c0 <JS_CallInternal+0x2f0>
   29cf9:	f3 0f 1e fa          	endbr64
   29cfd:	e9 be b9 ff ff       	jmp    256c0 <JS_CallInternal+0x2f0>
   29d02:	f3 0f 1e fa          	endbr64
   29d06:	e9 b5 b9 ff ff       	jmp    256c0 <JS_CallInternal+0x2f0>
   29d0b:	f3 0f 1e fa          	endbr64
   29d0f:	e9 ac b9 ff ff       	jmp    256c0 <JS_CallInternal+0x2f0>
   29d14:	f3 0f 1e fa          	endbr64
   29d18:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   29d1f:	41 8b 04 24          	mov    (%r12),%eax
   29d23:	48 c1 e0 04          	shl    $0x4,%rax
   29d27:	48 03 41 50          	add    0x50(%rcx),%rax
   29d2b:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   29d2f:	48 8b 10             	mov    (%rax),%rdx
   29d32:	48 8b 40 08          	mov    0x8(%rax),%rax
   29d36:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29d39:	76 04                	jbe    29d3f <JS_CallInternal+0x496f>
   29d3b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29d3f:	48 89 13             	mov    %rdx,(%rbx)
   29d42:	49 83 c4 05          	add    $0x5,%r12
   29d46:	48 89 43 08          	mov    %rax,0x8(%rbx)
   29d4a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29d50:	48 89 cb             	mov    %rcx,%rbx
   29d53:	49 89 c2             	mov    %rax,%r10
   29d56:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d5a:	ff e0                	jmp    *%rax
   29d5c:	f3 0f 1e fa          	endbr64
   29d60:	49 63 04 24          	movslq (%r12),%rax
   29d64:	48 c7 43 08 07 00 00 	movq   $0x7,0x8(%rbx)
   29d6b:	00 
   29d6c:	49 83 c4 05          	add    $0x5,%r12
   29d70:	48 83 c3 10          	add    $0x10,%rbx
   29d74:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29d78:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29d7e:	49 89 c2             	mov    %rax,%r10
   29d81:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d85:	ff e0                	jmp    *%rax
   29d87:	f3 0f 1e fa          	endbr64
   29d8b:	41 8b 04 24          	mov    (%r12),%eax
   29d8f:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   29d96:	00 
   29d97:	49 83 c4 05          	add    $0x5,%r12
   29d9b:	48 83 c3 10          	add    $0x10,%rbx
   29d9f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29da3:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29da9:	49 89 c2             	mov    %rax,%r10
   29dac:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29db0:	ff e0                	jmp    *%rax
   29db2:	f3 0f 1e fa          	endbr64
   29db6:	e9 05 b9 ff ff       	jmp    256c0 <JS_CallInternal+0x2f0>
   29dbb:	f3 0f 1e fa          	endbr64
   29dbf:	e9 fc b8 ff ff       	jmp    256c0 <JS_CallInternal+0x2f0>
   29dc4:	f3 0f 1e fa          	endbr64
   29dc8:	e9 f3 b8 ff ff       	jmp    256c0 <JS_CallInternal+0x2f0>
   29dcd:	f3 0f 1e fa          	endbr64
   29dd1:	41 0f bf 04 24       	movswl (%r12),%eax
   29dd6:	48 83 c3 10          	add    $0x10,%rbx
   29dda:	49 83 c4 03          	add    $0x3,%r12
   29dde:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29de5:	00 
   29de6:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29dea:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29df0:	49 89 c2             	mov    %rax,%r10
   29df3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29df7:	ff e0                	jmp    *%rax
   29df9:	f3 0f 1e fa          	endbr64
   29dfd:	41 0f be 04 24       	movsbl (%r12),%eax
   29e02:	48 83 c3 10          	add    $0x10,%rbx
   29e06:	49 83 c4 02          	add    $0x2,%r12
   29e0a:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29e11:	00 
   29e12:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29e16:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29e1c:	49 89 c2             	mov    %rax,%r10
   29e1f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29e23:	ff e0                	jmp    *%rax
   29e25:	f3 0f 1e fa          	endbr64
   29e29:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29e2d:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29e31:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29e34:	76 04                	jbe    29e3a <JS_CallInternal+0x4a6a>
   29e36:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29e3a:	48 89 13             	mov    %rdx,(%rbx)
   29e3d:	49 83 c4 01          	add    $0x1,%r12
   29e41:	48 83 c3 10          	add    $0x10,%rbx
   29e45:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   29e49:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29e4f:	49 89 c2             	mov    %rax,%r10
   29e52:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29e56:	ff e0                	jmp    *%rax
   29e58:	f3 0f 1e fa          	endbr64
   29e5c:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   29e60:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29e64:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29e67:	76 11                	jbe    29e7a <JS_CallInternal+0x4aaa>
   29e69:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29e6c:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29e6f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29e72:	85 d2                	test   %edx,%edx
   29e74:	0f 8e c0 39 00 00    	jle    2d83a <JS_CallInternal+0x846a>
   29e7a:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   29e7f:	49 83 c4 01          	add    $0x1,%r12
   29e83:	48 83 eb 10          	sub    $0x10,%rbx
   29e87:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   29e8b:	f3 0f 6f 03          	movdqu (%rbx),%xmm0
   29e8f:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   29e93:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29e99:	49 89 c2             	mov    %rax,%r10
   29e9c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29ea0:	ff e0                	jmp    *%rax
   29ea2:	f3 0f 1e fa          	endbr64
   29ea6:	8b 8d 70 fe ff ff    	mov    -0x190(%rbp),%ecx
   29eac:	41 0f b7 04 24       	movzwl (%r12),%eax
   29eb1:	4c 89 ef             	mov    %r13,%rdi
   29eb4:	39 c8                	cmp    %ecx,%eax
   29eb6:	0f 4f c1             	cmovg  %ecx,%eax
   29eb9:	48 63 d0             	movslq %eax,%rdx
   29ebc:	29 c1                	sub    %eax,%ecx
   29ebe:	48 c1 e2 04          	shl    $0x4,%rdx
   29ec2:	89 ce                	mov    %ecx,%esi
   29ec4:	48 03 95 60 fe ff ff 	add    -0x1a0(%rbp),%rdx
   29ecb:	e8 80 30 02 00       	call   4cf50 <js_create_array>
   29ed0:	48 89 03             	mov    %rax,(%rbx)
   29ed3:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29ed7:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   29edb:	0f 84 05 4d 00 00    	je     2ebe6 <JS_CallInternal+0x9816>
   29ee1:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   29ee7:	48 83 c3 10          	add    $0x10,%rbx
   29eeb:	49 83 c4 03          	add    $0x3,%r12
   29eef:	49 89 c2             	mov    %rax,%r10
   29ef2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29ef6:	ff e0                	jmp    *%rax
   29ef8:	f3 0f 1e fa          	endbr64
   29efc:	49 8d 44 24 01       	lea    0x1(%r12),%rax
   29f01:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   29f08:	41 80 3c 24 06       	cmpb   $0x6,(%r12)
   29f0d:	0f 87 ca 86 fe ff    	ja     125dd <JS_CallInternal.cold>
   29f13:	41 0f b6 04 24       	movzbl (%r12),%eax
   29f18:	48 8d 15 cd 92 0b 00 	lea    0xb92cd(%rip),%rdx        # e31ec <qjsc_repl_size+0x4e0>
   29f1f:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   29f23:	48 01 d0             	add    %rdx,%rax
   29f26:	3e ff e0             	notrack jmp *%rax
   29f29:	48 8d 43 10          	lea    0x10(%rbx),%rax
   29f2d:	b9 01 00 00 00       	mov    $0x1,%ecx
   29f32:	31 f6                	xor    %esi,%esi
   29f34:	ba 02 00 00 00       	mov    $0x2,%edx
   29f39:	4c 89 ef             	mov    %r13,%rdi
   29f3c:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29f43:	e8 a8 12 02 00       	call   4b1f0 <JS_NewObjectProtoClass>
   29f48:	48 89 03             	mov    %rax,(%rbx)
   29f4b:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29f4f:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   29f53:	0f 84 74 01 00 00    	je     2a0cd <JS_CallInternal+0x4cfd>
   29f59:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   29f60:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   29f66:	49 83 c4 02          	add    $0x2,%r12
   29f6a:	49 89 c2             	mov    %rax,%r10
   29f6d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29f71:	ff e0                	jmp    *%rax
   29f73:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   29f7a:	48 8b 40 38          	mov    0x38(%rax),%rax
   29f7e:	48 85 c0             	test   %rax,%rax
   29f81:	0f 84 1c 59 00 00    	je     2f8a3 <JS_CallInternal+0xa4d3>
   29f87:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   29f8b:	48 83 c3 10          	add    $0x10,%rbx
   29f8f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29f93:	48 c7 43 f8 ff ff ff 	movq   $0xffffffffffffffff,-0x8(%rbx)
   29f9a:	ff 
   29f9b:	eb c3                	jmp    29f60 <JS_CallInternal+0x4b90>
   29f9d:	48 8d 43 10          	lea    0x10(%rbx),%rax
   29fa1:	49 8b 95 58 01 00 00 	mov    0x158(%r13),%rdx
   29fa8:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   29faf:	00 00 00 00 
   29fb3:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29fba:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   29fc0:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
   29fc7:	49 8b 85 50 01 00 00 	mov    0x150(%r13),%rax
   29fce:	83 fa f6             	cmp    $0xfffffff6,%edx
   29fd1:	76 04                	jbe    29fd7 <JS_CallInternal+0x4c07>
   29fd3:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   29fd7:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
   29fde:	49 8b 85 60 01 00 00 	mov    0x160(%r13),%rax
   29fe5:	41 83 bd 68 01 00 00 	cmpl   $0xfffffff6,0x168(%r13)
   29fec:	f6 
   29fed:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   29ff4:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   29ffb:	76 04                	jbe    2a001 <JS_CallInternal+0x4c31>
   29ffd:	83 40 fc 02          	addl   $0x2,-0x4(%rax)
   2a001:	49 8b 75 38          	mov    0x38(%r13),%rsi
   2a005:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   2a00c:	ba 08 00 00 00       	mov    $0x8,%edx
   2a011:	4c 89 ef             	mov    %r13,%rdi
   2a014:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   2a01b:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a01f:	e8 1c 09 02 00       	call   4a940 <JS_NewObjectFromShape>
   2a024:	48 89 c1             	mov    %rax,%rcx
   2a027:	83 fa 06             	cmp    $0x6,%edx
   2a02a:	0f 84 9e 5b 00 00    	je     2fbce <JS_CallInternal+0xa7fe>
   2a030:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   2a036:	85 c0                	test   %eax,%eax
   2a038:	0f 8f 72 54 00 00    	jg     2f4b0 <JS_CallInternal+0xa0e0>
   2a03e:	48 c7 41 30 00 00 00 	movq   $0x0,0x30(%rcx)
   2a045:	00 
   2a046:	89 41 38             	mov    %eax,0x38(%rcx)
   2a049:	48 89 0b             	mov    %rcx,(%rbx)
   2a04c:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a050:	e9 04 ff ff ff       	jmp    29f59 <JS_CallInternal+0x4b89>
   2a055:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2a05c:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2a060:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   2a064:	48 8b 47 08          	mov    0x8(%rdi),%rax
   2a068:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a06b:	76 04                	jbe    2a071 <JS_CallInternal+0x4ca1>
   2a06d:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a071:	48 89 03             	mov    %rax,(%rbx)
   2a074:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a078:	48 89 cb             	mov    %rcx,%rbx
   2a07b:	e9 e0 fe ff ff       	jmp    29f60 <JS_CallInternal+0x4b90>
   2a080:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2a087:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2a08b:	48 8b 95 60 fe ff ff 	mov    -0x1a0(%rbp),%rdx
   2a092:	4c 89 ef             	mov    %r13,%rdi
   2a095:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2a09c:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   2a0a2:	44 0f b7 41 38       	movzwl 0x38(%rcx),%r8d
   2a0a7:	48 8b 8d 90 fe ff ff 	mov    -0x170(%rbp),%rcx
   2a0ae:	89 c6                	mov    %eax,%esi
   2a0b0:	41 39 c0             	cmp    %eax,%r8d
   2a0b3:	44 0f 4f c0          	cmovg  %eax,%r8d
   2a0b7:	e8 b4 0c 02 00       	call   4ad70 <js_build_mapped_arguments>
   2a0bc:	48 89 03             	mov    %rax,(%rbx)
   2a0bf:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a0c3:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2a0c7:	0f 85 8c fe ff ff    	jne    29f59 <JS_CallInternal+0x4b89>
   2a0cd:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2a0d4:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   2a0db:	e9 20 bb ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2a0e0:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2a0e4:	31 f6                	xor    %esi,%esi
   2a0e6:	4c 89 ef             	mov    %r13,%rdi
   2a0e9:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2a0f0:	e8 8b b1 ff ff       	call   25280 <JS_GetScriptOrModuleName>
   2a0f5:	89 c2                	mov    %eax,%edx
   2a0f7:	85 d2                	test   %edx,%edx
   2a0f9:	0f 84 8c 4f 00 00    	je     2f08b <JS_CallInternal+0x9cbb>
   2a0ff:	49 8b 85 b8 01 00 00 	mov    0x1b8(%r13),%rax
   2a106:	49 8d 8d b0 01 00 00 	lea    0x1b0(%r13),%rcx
   2a10d:	48 39 c8             	cmp    %rcx,%rax
   2a110:	75 1b                	jne    2a12d <JS_CallInternal+0x4d5d>
   2a112:	e9 4b 4f 00 00       	jmp    2f062 <JS_CallInternal+0x9c92>
   2a117:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2a11e:	00 00 
   2a120:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a124:	48 39 c8             	cmp    %rcx,%rax
   2a127:	0f 84 51 55 00 00    	je     2f67e <JS_CallInternal+0xa2ae>
   2a12d:	3b 50 f8             	cmp    -0x8(%rax),%edx
   2a130:	75 ee                	jne    2a120 <JS_CallInternal+0x4d50>
   2a132:	48 83 e8 18          	sub    $0x18,%rax
   2a136:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2a13c:	0f 8f 4a 55 00 00    	jg     2f68c <JS_CallInternal+0xa2bc>
   2a142:	48 89 c6             	mov    %rax,%rsi
   2a145:	4c 89 ef             	mov    %r13,%rdi
   2a148:	e8 03 b2 ff ff       	call   25350 <JS_GetImportMeta>
   2a14d:	48 89 03             	mov    %rax,(%rbx)
   2a150:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a154:	83 fa 06             	cmp    $0x6,%edx
   2a157:	0f 85 fc fd ff ff    	jne    29f59 <JS_CallInternal+0x4b89>
   2a15d:	e9 6b ff ff ff       	jmp    2a0cd <JS_CallInternal+0x4cfd>
   2a162:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2a168:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2a16c:	83 bd 48 fe ff ff f6 	cmpl   $0xfffffff6,-0x1b8(%rbp)
   2a173:	76 0b                	jbe    2a180 <JS_CallInternal+0x4db0>
   2a175:	48 8b 8d 28 fe ff ff 	mov    -0x1d8(%rbp),%rcx
   2a17c:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2a180:	48 8b 8d 28 fe ff ff 	mov    -0x1d8(%rbp),%rcx
   2a187:	48 89 0b             	mov    %rcx,(%rbx)
   2a18a:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   2a191:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   2a195:	48 89 c3             	mov    %rax,%rbx
   2a198:	e9 c3 fd ff ff       	jmp    29f60 <JS_CallInternal+0x4b90>
   2a19d:	f3 0f 1e fa          	endbr64
   2a1a1:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a1a5:	48 83 eb 10          	sub    $0x10,%rbx
   2a1a9:	48 8b 0b             	mov    (%rbx),%rcx
   2a1ac:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a1af:	76 11                	jbe    2a1c2 <JS_CallInternal+0x4df2>
   2a1b1:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2a1b4:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2a1b7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a1ba:	85 d2                	test   %edx,%edx
   2a1bc:	0f 8e 96 35 00 00    	jle    2d758 <JS_CallInternal+0x8388>
   2a1c2:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a1c7:	49 83 c4 01          	add    $0x1,%r12
   2a1cb:	49 89 c2             	mov    %rax,%r10
   2a1ce:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a1d2:	ff e0                	jmp    *%rax
   2a1d4:	f3 0f 1e fa          	endbr64
   2a1d8:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a1dd:	f3 0f 6f 43 b0       	movdqu -0x50(%rbx),%xmm0
   2a1e2:	49 83 c4 01          	add    $0x1,%r12
   2a1e6:	0f 11 4b b0          	movups %xmm1,-0x50(%rbx)
   2a1ea:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a1ef:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   2a1f3:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a1f8:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a1fc:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a201:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a205:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a209:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a20f:	49 89 c2             	mov    %rax,%r10
   2a212:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a216:	ff e0                	jmp    *%rax
   2a218:	f3 0f 1e fa          	endbr64
   2a21c:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a221:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   2a226:	49 83 c4 01          	add    $0x1,%r12
   2a22a:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   2a22e:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a233:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a237:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a23c:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a240:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a244:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a24a:	49 89 c2             	mov    %rax,%r10
   2a24d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a251:	ff e0                	jmp    *%rax
   2a253:	f3 0f 1e fa          	endbr64
   2a257:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a25c:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a261:	49 83 c4 01          	add    $0x1,%r12
   2a265:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a269:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a26e:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a272:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a276:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a27c:	49 89 c2             	mov    %rax,%r10
   2a27f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a283:	ff e0                	jmp    *%rax
   2a285:	f3 0f 1e fa          	endbr64
   2a289:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a28e:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a293:	49 83 c4 01          	add    $0x1,%r12
   2a297:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a29b:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2a29f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a2a5:	49 89 c2             	mov    %rax,%r10
   2a2a8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a2ac:	ff e0                	jmp    *%rax
   2a2ae:	f3 0f 1e fa          	endbr64
   2a2b2:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a2b7:	0f 11 03             	movups %xmm0,(%rbx)
   2a2ba:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   2a2bf:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a2c4:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2a2c8:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a2cc:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a2d1:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   2a2d5:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   2a2da:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2a2de:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a2e1:	76 04                	jbe    2a2e7 <JS_CallInternal+0x4f17>
   2a2e3:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a2e7:	48 89 53 c0          	mov    %rdx,-0x40(%rbx)
   2a2eb:	49 83 c4 01          	add    $0x1,%r12
   2a2ef:	48 83 c3 10          	add    $0x10,%rbx
   2a2f3:	48 89 43 b8          	mov    %rax,-0x48(%rbx)
   2a2f7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a2fd:	49 89 c2             	mov    %rax,%r10
   2a300:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a304:	ff e0                	jmp    *%rax
   2a306:	f3 0f 1e fa          	endbr64
   2a30a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a30f:	0f 11 03             	movups %xmm0,(%rbx)
   2a312:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   2a317:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a31c:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2a320:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a324:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a329:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   2a32d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a330:	76 04                	jbe    2a336 <JS_CallInternal+0x4f66>
   2a332:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a336:	48 89 53 d0          	mov    %rdx,-0x30(%rbx)
   2a33a:	49 83 c4 01          	add    $0x1,%r12
   2a33e:	48 83 c3 10          	add    $0x10,%rbx
   2a342:	48 89 43 c8          	mov    %rax,-0x38(%rbx)
   2a346:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a34c:	49 89 c2             	mov    %rax,%r10
   2a34f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a353:	ff e0                	jmp    *%rax
   2a355:	f3 0f 1e fa          	endbr64
   2a359:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a35e:	0f 11 03             	movups %xmm0,(%rbx)
   2a361:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   2a366:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2a36a:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a36f:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a373:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a376:	76 04                	jbe    2a37c <JS_CallInternal+0x4fac>
   2a378:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a37c:	48 89 53 e0          	mov    %rdx,-0x20(%rbx)
   2a380:	49 83 c4 01          	add    $0x1,%r12
   2a384:	48 83 c3 10          	add    $0x10,%rbx
   2a388:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   2a38c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a392:	49 89 c2             	mov    %rax,%r10
   2a395:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a399:	ff e0                	jmp    *%rax
   2a39b:	f3 0f 1e fa          	endbr64
   2a39f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a3a4:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2a3a8:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2a3ac:	0f 11 03             	movups %xmm0,(%rbx)
   2a3af:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a3b2:	76 04                	jbe    2a3b8 <JS_CallInternal+0x4fe8>
   2a3b4:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a3b8:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2a3bc:	49 83 c4 01          	add    $0x1,%r12
   2a3c0:	48 83 c3 10          	add    $0x10,%rbx
   2a3c4:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a3c8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a3ce:	49 89 c2             	mov    %rax,%r10
   2a3d1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a3d5:	ff e0                	jmp    *%rax
   2a3d7:	f3 0f 1e fa          	endbr64
   2a3db:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a3e0:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a3e5:	49 83 c4 01          	add    $0x1,%r12
   2a3e9:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a3ed:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a3f1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a3f7:	49 89 c2             	mov    %rax,%r10
   2a3fa:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a3fe:	ff e0                	jmp    *%rax
   2a400:	f3 0f 1e fa          	endbr64
   2a404:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a409:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a40e:	49 83 c4 01          	add    $0x1,%r12
   2a412:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a416:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a41b:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a41f:	f3 0f 6f 4b b0       	movdqu -0x50(%rbx),%xmm1
   2a424:	0f 11 43 b0          	movups %xmm0,-0x50(%rbx)
   2a428:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   2a42c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a432:	49 89 c2             	mov    %rax,%r10
   2a435:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a439:	ff e0                	jmp    *%rax
   2a43b:	f3 0f 1e fa          	endbr64
   2a43f:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a444:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a449:	49 83 c4 01          	add    $0x1,%r12
   2a44d:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a451:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a456:	0f 11 43 c0          	movups %xmm0,-0x40(%rbx)
   2a45a:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a45e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a464:	49 89 c2             	mov    %rax,%r10
   2a467:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a46b:	ff e0                	jmp    *%rax
   2a46d:	f3 0f 1e fa          	endbr64
   2a471:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a476:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a47b:	49 83 c4 01          	add    $0x1,%r12
   2a47f:	0f 11 4b f0          	movups %xmm1,-0x10(%rbx)
   2a483:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a488:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2a48c:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a490:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a496:	49 89 c2             	mov    %rax,%r10
   2a499:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a49d:	ff e0                	jmp    *%rax
   2a49f:	f3 0f 1e fa          	endbr64
   2a4a3:	41 8b 04 24          	mov    (%r12),%eax
   2a4a7:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2a4ae:	48 c1 e0 04          	shl    $0x4,%rax
   2a4b2:	48 03 41 50          	add    0x50(%rcx),%rax
   2a4b6:	48 8b 10             	mov    (%rax),%rdx
   2a4b9:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a4bd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a4c0:	76 04                	jbe    2a4c6 <JS_CallInternal+0x50f6>
   2a4c2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a4c6:	48 92                	xchg   %rax,%rdx
   2a4c8:	4c 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%r8
   2a4cf:	45 31 c9             	xor    %r9d,%r9d
   2a4d2:	4c 89 ef             	mov    %r13,%rdi
   2a4d5:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   2a4dc:	48 89 c6             	mov    %rax,%rsi
   2a4df:	e8 9c 4a 02 00       	call   4ef80 <js_closure>
   2a4e4:	48 89 03             	mov    %rax,(%rbx)
   2a4e7:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a4eb:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2a4ef:	0f 84 1d 3d 00 00    	je     2e212 <JS_CallInternal+0x8e42>
   2a4f5:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2a4fb:	48 83 c3 10          	add    $0x10,%rbx
   2a4ff:	49 83 c4 05          	add    $0x5,%r12
   2a503:	49 89 c2             	mov    %rax,%r10
   2a506:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a50a:	ff e0                	jmp    *%rax
   2a50c:	f3 0f 1e fa          	endbr64
   2a510:	f3 0f 6f 53 e0       	movdqu -0x20(%rbx),%xmm2
   2a515:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a51a:	49 83 c4 01          	add    $0x1,%r12
   2a51e:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a523:	0f 11 53 c0          	movups %xmm2,-0x40(%rbx)
   2a527:	f3 0f 6f 53 f0       	movdqu -0x10(%rbx),%xmm2
   2a52c:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a530:	0f 11 53 d0          	movups %xmm2,-0x30(%rbx)
   2a534:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a538:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a53e:	49 89 c2             	mov    %rax,%r10
   2a541:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a545:	ff e0                	jmp    *%rax
   2a547:	f3 0f 1e fa          	endbr64
   2a54b:	e9 6e b2 ff ff       	jmp    257be <JS_CallInternal+0x3ee>
   2a550:	f3 0f 1e fa          	endbr64
   2a554:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a558:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2a55c:	4c 89 ef             	mov    %r13,%rdi
   2a55f:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2a563:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   2a567:	e8 84 a3 00 00       	call   348f0 <JS_CheckBrand>
   2a56c:	83 f8 ff             	cmp    $0xffffffff,%eax
   2a56f:	0f 84 8b b6 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2a575:	85 c0                	test   %eax,%eax
   2a577:	0f 84 32 54 00 00    	je     2f9af <JS_CallInternal+0xa5df>
   2a57d:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a582:	49 83 c4 01          	add    $0x1,%r12
   2a586:	49 89 c2             	mov    %rax,%r10
   2a589:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a58d:	ff e0                	jmp    *%rax
   2a58f:	f3 0f 1e fa          	endbr64
   2a593:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2a59a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2a59e:	83 bd 48 fe ff ff 03 	cmpl   $0x3,-0x1b8(%rbp)
   2a5a5:	0f 84 03 4e 00 00    	je     2f3ae <JS_CallInternal+0x9fde>
   2a5ab:	48 8b 85 98 fe ff ff 	mov    -0x168(%rbp),%rax
   2a5b2:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   2a5b9:	4c 89 ef             	mov    %r13,%rdi
   2a5bc:	48 89 c6             	mov    %rax,%rsi
   2a5bf:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2a5c6:	48 89 95 38 fe ff ff 	mov    %rdx,-0x1c8(%rbp)
   2a5cd:	e8 0e a6 ff ff       	call   24be0 <JS_GetPrototype>
   2a5d2:	48 89 c6             	mov    %rax,%rsi
   2a5d5:	49 89 d2             	mov    %rdx,%r10
   2a5d8:	83 fa 06             	cmp    $0x6,%edx
   2a5db:	0f 84 1f b6 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2a5e1:	48 8b 95 48 fe ff ff 	mov    -0x1b8(%rbp),%rdx
   2a5e8:	48 8b 85 28 fe ff ff 	mov    -0x1d8(%rbp),%rax
   2a5ef:	6a 02                	push   $0x2
   2a5f1:	4c 89 ef             	mov    %r13,%rdi
   2a5f4:	ff b5 60 fe ff ff    	push   -0x1a0(%rbp)
   2a5fa:	44 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%r9d
   2a601:	49 89 d0             	mov    %rdx,%r8
   2a604:	48 89 c1             	mov    %rax,%rcx
   2a607:	4c 89 d2             	mov    %r10,%rdx
   2a60a:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2a611:	48 89 b5 f8 fd ff ff 	mov    %rsi,-0x208(%rbp)
   2a618:	e8 43 0d 07 00       	call   9b360 <JS_CallConstructorInternal>
   2a61d:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2a624:	5f                   	pop    %rdi
   2a625:	48 89 c1             	mov    %rax,%rcx
   2a628:	41 58                	pop    %r8
   2a62a:	48 89 d0             	mov    %rdx,%rax
   2a62d:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2a631:	76 18                	jbe    2a64b <JS_CallInternal+0x527b>
   2a633:	48 8b b5 f8 fd ff ff 	mov    -0x208(%rbp),%rsi
   2a63a:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2a63d:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2a640:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2a643:	85 d2                	test   %edx,%edx
   2a645:	0f 8e a0 39 00 00    	jle    2dfeb <JS_CallInternal+0x8c1b>
   2a64b:	83 f8 06             	cmp    $0x6,%eax
   2a64e:	0f 84 ac b5 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2a654:	48 89 0b             	mov    %rcx,(%rbx)
   2a657:	49 83 c4 01          	add    $0x1,%r12
   2a65b:	48 83 c3 10          	add    $0x10,%rbx
   2a65f:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2a663:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a669:	49 89 c2             	mov    %rax,%r10
   2a66c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a670:	ff e0                	jmp    *%rax
   2a672:	f3 0f 1e fa          	endbr64
   2a676:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a67a:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a67e:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a682:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a686:	89 c7                	mov    %eax,%edi
   2a688:	09 f7                	or     %esi,%edi
   2a68a:	0f 85 98 3a 00 00    	jne    2e128 <JS_CallInternal+0x8d58>
   2a690:	48 63 f2             	movslq %edx,%rsi
   2a693:	48 63 c1             	movslq %ecx,%rax
   2a696:	48 0f af c6          	imul   %rsi,%rax
   2a69a:	48 63 f0             	movslq %eax,%rsi
   2a69d:	48 39 c6             	cmp    %rax,%rsi
   2a6a0:	0f 85 63 3a 00 00    	jne    2e109 <JS_CallInternal+0x8d39>
   2a6a6:	48 85 f6             	test   %rsi,%rsi
   2a6a9:	0f 84 f1 48 00 00    	je     2efa0 <JS_CallInternal+0x9bd0>
   2a6af:	83 e0 ff             	and    $0xffffffff,%eax
   2a6b2:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a6b9:	00 
   2a6ba:	48 83 eb 10          	sub    $0x10,%rbx
   2a6be:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a6c2:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a6c7:	49 83 c4 01          	add    $0x1,%r12
   2a6cb:	49 89 c2             	mov    %rax,%r10
   2a6ce:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a6d2:	ff e0                	jmp    *%rax
   2a6d4:	f3 0f 1e fa          	endbr64
   2a6d8:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a6dc:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2a6e0:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2a6e4:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a6e8:	89 c6                	mov    %eax,%esi
   2a6ea:	09 d6                	or     %edx,%esi
   2a6ec:	0f 85 1c 45 00 00    	jne    2ec0e <JS_CallInternal+0x983e>
   2a6f2:	89 fa                	mov    %edi,%edx
   2a6f4:	48 63 f1             	movslq %ecx,%rsi
   2a6f7:	48 63 c7             	movslq %edi,%rax
   2a6fa:	29 ca                	sub    %ecx,%edx
   2a6fc:	48 29 f0             	sub    %rsi,%rax
   2a6ff:	48 63 ca             	movslq %edx,%rcx
   2a702:	48 39 c1             	cmp    %rax,%rcx
   2a705:	0f 85 e8 44 00 00    	jne    2ebf3 <JS_CallInternal+0x9823>
   2a70b:	89 d0                	mov    %edx,%eax
   2a70d:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a714:	00 
   2a715:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2a719:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a71e:	48 83 eb 10          	sub    $0x10,%rbx
   2a722:	49 83 c4 01          	add    $0x1,%r12
   2a726:	49 89 c2             	mov    %rax,%r10
   2a729:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a72d:	ff e0                	jmp    *%rax
   2a72f:	f3 0f 1e fa          	endbr64
   2a733:	45 0f b6 0c 24       	movzbl (%r12),%r9d
   2a738:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a73c:	4d 8d 54 24 01       	lea    0x1(%r12),%r10
   2a741:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a745:	49 c1 e1 04          	shl    $0x4,%r9
   2a749:	4c 03 8d 68 fe ff ff 	add    -0x198(%rbp),%r9
   2a750:	89 cf                	mov    %ecx,%edi
   2a752:	49 8b 41 08          	mov    0x8(%r9),%rax
   2a756:	09 c7                	or     %eax,%edi
   2a758:	0f 85 f6 3f 00 00    	jne    2e754 <JS_CallInternal+0x9384>
   2a75e:	49 8b 01             	mov    (%r9),%rax
   2a761:	48 63 f2             	movslq %edx,%rsi
   2a764:	48 63 c8             	movslq %eax,%rcx
   2a767:	01 d0                	add    %edx,%eax
   2a769:	48 01 f1             	add    %rsi,%rcx
   2a76c:	48 63 d0             	movslq %eax,%rdx
   2a76f:	48 39 ca             	cmp    %rcx,%rdx
   2a772:	0f 85 c4 3f 00 00    	jne    2e73c <JS_CallInternal+0x936c>
   2a778:	89 c0                	mov    %eax,%eax
   2a77a:	49 89 01             	mov    %rax,(%r9)
   2a77d:	31 c0                	xor    %eax,%eax
   2a77f:	49 89 41 08          	mov    %rax,0x8(%r9)
   2a783:	48 83 eb 10          	sub    $0x10,%rbx
   2a787:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2a78d:	49 83 c4 02          	add    $0x2,%r12
   2a791:	49 89 c2             	mov    %rax,%r10
   2a794:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a798:	ff e0                	jmp    *%rax
   2a79a:	f3 0f 1e fa          	endbr64
   2a79e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a7a2:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2a7a6:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2a7aa:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a7ae:	89 c6                	mov    %eax,%esi
   2a7b0:	09 d6                	or     %edx,%esi
   2a7b2:	0f 85 95 42 00 00    	jne    2ea4d <JS_CallInternal+0x967d>
   2a7b8:	48 63 f1             	movslq %ecx,%rsi
   2a7bb:	48 63 c7             	movslq %edi,%rax
   2a7be:	8d 14 39             	lea    (%rcx,%rdi,1),%edx
   2a7c1:	48 01 f0             	add    %rsi,%rax
   2a7c4:	48 63 ca             	movslq %edx,%rcx
   2a7c7:	48 39 c1             	cmp    %rax,%rcx
   2a7ca:	0f 85 62 42 00 00    	jne    2ea32 <JS_CallInternal+0x9662>
   2a7d0:	89 d0                	mov    %edx,%eax
   2a7d2:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a7d9:	00 
   2a7da:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2a7de:	48 83 eb 10          	sub    $0x10,%rbx
   2a7e2:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a7e7:	49 83 c4 01          	add    $0x1,%r12
   2a7eb:	49 89 c2             	mov    %rax,%r10
   2a7ee:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a7f2:	ff e0                	jmp    *%rax
   2a7f4:	f3 0f 1e fa          	endbr64
   2a7f8:	b8 03 00 00 00       	mov    $0x3,%eax
   2a7fd:	31 c9                	xor    %ecx,%ecx
   2a7ff:	e9 50 b3 ff ff       	jmp    25b54 <JS_CallInternal+0x784>
   2a804:	f3 0f 1e fa          	endbr64
   2a808:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2a80c:	48 8d 4b f0          	lea    -0x10(%rbx),%rcx
   2a810:	4c 8b 5b e0          	mov    -0x20(%rbx),%r11
   2a814:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a818:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2a81f:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2a823:	83 7b e8 ff          	cmpl   $0xffffffff,-0x18(%rbx)
   2a827:	0f 85 49 44 00 00    	jne    2ec76 <JS_CallInternal+0x98a6>
   2a82d:	41 83 fa f8          	cmp    $0xfffffff8,%r10d
   2a831:	0f 85 7b 43 00 00    	jne    2ebb2 <JS_CallInternal+0x97e2>
   2a837:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2a83b:	48 89 d6             	mov    %rdx,%rsi
   2a83e:	4c 89 9d c0 fd ff ff 	mov    %r11,-0x240(%rbp)
   2a845:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2a84c:	48 89 bd b8 fd ff ff 	mov    %rdi,-0x248(%rbp)
   2a853:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2a85a:	48 89 95 f8 fd ff ff 	mov    %rdx,-0x208(%rbp)
   2a861:	e8 9a d9 fe ff       	call   18200 <js_get_atom_index>
   2a866:	4c 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%r11
   2a86d:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   2a874:	41 89 c0             	mov    %eax,%r8d
   2a877:	49 8b 7b 18          	mov    0x18(%r11),%rdi
   2a87b:	8b 77 18             	mov    0x18(%rdi),%esi
   2a87e:	21 f0                	and    %esi,%eax
   2a880:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2a884:	48 85 c0             	test   %rax,%rax
   2a887:	0f 84 2b 44 00 00    	je     2ecb8 <JS_CallInternal+0x98e8>
   2a88d:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2a894:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2a89b:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   2a8a2:	00 
   2a8a3:	48 83 e8 01          	sub    $0x1,%rax
   2a8a7:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   2a8ab:	48 01 fe             	add    %rdi,%rsi
   2a8ae:	44 3b 46 04          	cmp    0x4(%rsi),%r8d
   2a8b2:	0f 85 f3 43 00 00    	jne    2ecab <JS_CallInternal+0x98db>
   2a8b8:	48 c1 e0 04          	shl    $0x4,%rax
   2a8bc:	49 03 43 20          	add    0x20(%r11),%rax
   2a8c0:	48 8b 30             	mov    (%rax),%rsi
   2a8c3:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a8c7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a8ca:	76 04                	jbe    2a8d0 <JS_CallInternal+0x5500>
   2a8cc:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a8d0:	49 89 f0             	mov    %rsi,%r8
   2a8d3:	41 89 c1             	mov    %eax,%r9d
   2a8d6:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2a8da:	76 11                	jbe    2a8ed <JS_CallInternal+0x551d>
   2a8dc:	8b 7a fc             	mov    -0x4(%rdx),%edi
   2a8df:	8d 77 ff             	lea    -0x1(%rdi),%esi
   2a8e2:	89 72 fc             	mov    %esi,-0x4(%rdx)
   2a8e5:	85 f6                	test   %esi,%esi
   2a8e7:	0f 8e d4 33 00 00    	jle    2dcc1 <JS_CallInternal+0x88f1>
   2a8ed:	48 8b bd 00 fe ff ff 	mov    -0x200(%rbp),%rdi
   2a8f4:	48 8b 77 08          	mov    0x8(%rdi),%rsi
   2a8f8:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a8fb:	76 1b                	jbe    2a918 <JS_CallInternal+0x5548>
   2a8fd:	48 8b bd 00 fe ff ff 	mov    -0x200(%rbp),%rdi
   2a904:	48 8b 3f             	mov    (%rdi),%rdi
   2a907:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2a90a:	83 ea 01             	sub    $0x1,%edx
   2a90d:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2a910:	85 d2                	test   %edx,%edx
   2a912:	0f 8e f5 33 00 00    	jle    2dd0d <JS_CallInternal+0x893d>
   2a918:	4c 89 43 e0          	mov    %r8,-0x20(%rbx)
   2a91c:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a920:	41 83 f9 06          	cmp    $0x6,%r9d
   2a924:	0f 84 f4 43 00 00    	je     2ed1e <JS_CallInternal+0x994e>
   2a92a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a92f:	48 89 cb             	mov    %rcx,%rbx
   2a932:	49 83 c4 01          	add    $0x1,%r12
   2a936:	49 89 c2             	mov    %rax,%r10
   2a939:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a93d:	ff e0                	jmp    *%rax
   2a93f:	f3 0f 1e fa          	endbr64
   2a943:	41 8b 34 24          	mov    (%r12),%esi
   2a947:	4c 89 ef             	mov    %r13,%rdi
   2a94a:	e8 01 c3 00 00       	call   36c50 <JS_NewSymbolFromAtom.constprop.0>
   2a94f:	83 fa 06             	cmp    $0x6,%edx
   2a952:	0f 84 c8 3e 00 00    	je     2e820 <JS_CallInternal+0x9450>
   2a958:	48 89 03             	mov    %rax,(%rbx)
   2a95b:	49 83 c4 05          	add    $0x5,%r12
   2a95f:	48 83 c3 10          	add    $0x10,%rbx
   2a963:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a967:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a96d:	49 89 c2             	mov    %rax,%r10
   2a970:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a974:	ff e0                	jmp    *%rax
   2a976:	f3 0f 1e fa          	endbr64
   2a97a:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2a97e:	48 8b 38             	mov    (%rax),%rdi
   2a981:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   2a985:	48 83 eb 30          	sub    $0x30,%rbx
   2a989:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a98d:	48 8b 0b             	mov    (%rbx),%rcx
   2a990:	49 8b 30             	mov    (%r8),%rsi
   2a993:	49 8b 50 08          	mov    0x8(%r8),%rdx
   2a997:	48 89 bd 00 fe ff ff 	mov    %rdi,-0x200(%rbp)
   2a99e:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2a9a5:	83 7b 08 ff          	cmpl   $0xffffffff,0x8(%rbx)
   2a9a9:	0f 85 69 3d 00 00    	jne    2e718 <JS_CallInternal+0x9348>
   2a9af:	83 fa f8             	cmp    $0xfffffff8,%edx
   2a9b2:	0f 85 fd 37 00 00    	jne    2e1b5 <JS_CallInternal+0x8de5>
   2a9b8:	49 8b 45 10          	mov    0x10(%r13),%rax
   2a9bc:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2a9c3:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2a9ca:	48 89 c7             	mov    %rax,%rdi
   2a9cd:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2a9d4:	e8 27 d8 fe ff       	call   18200 <js_get_atom_index>
   2a9d9:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2a9e0:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2a9e7:	89 c6                	mov    %eax,%esi
   2a9e9:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   2a9ed:	8b 57 18             	mov    0x18(%rdi),%edx
   2a9f0:	21 d0                	and    %edx,%eax
   2a9f2:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2a9f6:	48 85 c0             	test   %rax,%rax
   2a9f9:	0f 84 72 45 00 00    	je     2ef71 <JS_CallInternal+0x9ba1>
   2a9ff:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2aa06:	00 
   2aa07:	48 83 e8 01          	sub    $0x1,%rax
   2aa0b:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2aa0f:	48 01 fa             	add    %rdi,%rdx
   2aa12:	3b 72 04             	cmp    0x4(%rdx),%esi
   2aa15:	0f 85 49 45 00 00    	jne    2ef64 <JS_CallInternal+0x9b94>
   2aa1b:	48 8b bd 00 fe ff ff 	mov    -0x200(%rbp),%rdi
   2aa22:	48 c1 e0 04          	shl    $0x4,%rax
   2aa26:	48 03 41 20          	add    0x20(%rcx),%rax
   2aa2a:	48 8b 08             	mov    (%rax),%rcx
   2aa2d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aa31:	48 89 38             	mov    %rdi,(%rax)
   2aa34:	48 8b bd f8 fd ff ff 	mov    -0x208(%rbp),%rdi
   2aa3b:	48 89 78 08          	mov    %rdi,0x8(%rax)
   2aa3f:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aa42:	76 11                	jbe    2aa55 <JS_CallInternal+0x5685>
   2aa44:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2aa47:	83 e8 01             	sub    $0x1,%eax
   2aa4a:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2aa4d:	85 c0                	test   %eax,%eax
   2aa4f:	0f 8e 04 33 00 00    	jle    2dd59 <JS_CallInternal+0x8989>
   2aa55:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2aa59:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aa5c:	0f 87 06 1b 00 00    	ja     2c568 <JS_CallInternal+0x7198>
   2aa62:	49 8b 40 08          	mov    0x8(%r8),%rax
   2aa66:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aa69:	76 14                	jbe    2aa7f <JS_CallInternal+0x56af>
   2aa6b:	49 8b 10             	mov    (%r8),%rdx
   2aa6e:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2aa71:	83 e9 01             	sub    $0x1,%ecx
   2aa74:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2aa77:	85 c9                	test   %ecx,%ecx
   2aa79:	0f 8e 00 2c 00 00    	jle    2d67f <JS_CallInternal+0x82af>
   2aa7f:	41 0f b6 04 24       	movzbl (%r12),%eax
   2aa84:	49 83 c4 01          	add    $0x1,%r12
   2aa88:	49 89 c2             	mov    %rax,%r10
   2aa8b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aa8f:	ff e0                	jmp    *%rax
   2aa91:	f3 0f 1e fa          	endbr64
   2aa95:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2aa99:	83 f8 ff             	cmp    $0xffffffff,%eax
   2aa9c:	0f 84 6e 1e 00 00    	je     2c910 <JS_CallInternal+0x7540>
   2aaa2:	83 f8 03             	cmp    $0x3,%eax
   2aaa5:	0f 85 66 53 00 00    	jne    2fe11 <JS_CallInternal+0xaa41>
   2aaab:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   2aab2:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2aab9:	00 
   2aaba:	41 0f b6 04 24       	movzbl (%r12),%eax
   2aabf:	48 83 c3 10          	add    $0x10,%rbx
   2aac3:	49 83 c4 01          	add    $0x1,%r12
   2aac7:	49 89 c2             	mov    %rax,%r10
   2aaca:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aace:	ff e0                	jmp    *%rax
   2aad0:	f3 0f 1e fa          	endbr64
   2aad4:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   2aad9:	4d 8d 44 24 01       	lea    0x1(%r12),%r8
   2aade:	48 c1 e1 04          	shl    $0x4,%rcx
   2aae2:	48 03 8d 68 fe ff ff 	add    -0x198(%rbp),%rcx
   2aae9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   2aaed:	48 8b 01             	mov    (%rcx),%rax
   2aaf0:	85 d2                	test   %edx,%edx
   2aaf2:	0f 85 af 16 00 00    	jne    2c1a7 <JS_CallInternal+0x6dd7>
   2aaf8:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2aafd:	0f 84 a4 16 00 00    	je     2c1a7 <JS_CallInternal+0x6dd7>
   2ab03:	83 c0 01             	add    $0x1,%eax
   2ab06:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   2ab0d:	00 
   2ab0e:	48 89 01             	mov    %rax,(%rcx)
   2ab11:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2ab17:	49 83 c4 02          	add    $0x2,%r12
   2ab1b:	49 89 c2             	mov    %rax,%r10
   2ab1e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ab22:	ff e0                	jmp    *%rax
   2ab24:	f3 0f 1e fa          	endbr64
   2ab28:	44 8b 4b f8          	mov    -0x8(%rbx),%r9d
   2ab2c:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ab30:	45 85 c9             	test   %r9d,%r9d
   2ab33:	0f 85 05 1a 00 00    	jne    2c53e <JS_CallInternal+0x716e>
   2ab39:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2ab3e:	0f 84 fa 19 00 00    	je     2c53e <JS_CallInternal+0x716e>
   2ab44:	83 e8 01             	sub    $0x1,%eax
   2ab47:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   2ab4e:	00 
   2ab4f:	48 89 03             	mov    %rax,(%rbx)
   2ab52:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ab57:	48 83 c3 10          	add    $0x10,%rbx
   2ab5b:	49 83 c4 01          	add    $0x1,%r12
   2ab5f:	49 89 c2             	mov    %rax,%r10
   2ab62:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ab66:	ff e0                	jmp    *%rax
   2ab68:	f3 0f 1e fa          	endbr64
   2ab6c:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ab70:	0b 43 e8             	or     -0x18(%rbx),%eax
   2ab73:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2ab77:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2ab7b:	75 39                	jne    2abb6 <JS_CallInternal+0x57e6>
   2ab7d:	89 c8                	mov    %ecx,%eax
   2ab7f:	89 d6                	mov    %edx,%esi
   2ab81:	85 c9                	test   %ecx,%ecx
   2ab83:	78 31                	js     2abb6 <JS_CallInternal+0x57e6>
   2ab85:	85 d2                	test   %edx,%edx
   2ab87:	7e 2d                	jle    2abb6 <JS_CallInternal+0x57e6>
   2ab89:	99                   	cltd
   2ab8a:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2ab91:	00 
   2ab92:	49 83 c4 01          	add    $0x1,%r12
   2ab96:	48 83 eb 10          	sub    $0x10,%rbx
   2ab9a:	f7 fe                	idiv   %esi
   2ab9c:	48 63 d2             	movslq %edx,%rdx
   2ab9f:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2aba3:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2aba9:	49 89 c2             	mov    %rax,%r10
   2abac:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2abb0:	ff e0                	jmp    *%rax
   2abb2:	f3 0f 1e fa          	endbr64
   2abb6:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2abbd:	44 89 d2             	mov    %r10d,%edx
   2abc0:	48 89 de             	mov    %rbx,%rsi
   2abc3:	4c 89 ef             	mov    %r13,%rdi
   2abc6:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2abca:	e8 61 ba 02 00       	call   56630 <js_binary_arith_slow>
   2abcf:	85 c0                	test   %eax,%eax
   2abd1:	0f 85 29 b0 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2abd7:	41 0f b6 04 24       	movzbl (%r12),%eax
   2abdc:	48 83 eb 10          	sub    $0x10,%rbx
   2abe0:	49 83 c4 01          	add    $0x1,%r12
   2abe4:	49 89 c2             	mov    %rax,%r10
   2abe7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2abeb:	ff e0                	jmp    *%rax
   2abed:	f3 0f 1e fa          	endbr64
   2abf1:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2abf5:	0b 43 e8             	or     -0x18(%rbx),%eax
   2abf8:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2abfc:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2ac00:	75 b4                	jne    2abb6 <JS_CallInternal+0x57e6>
   2ac02:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ac06:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2ac0a:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2ac0e:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2ac12:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
   2ac16:	66 0f 2f 05 32 48 0b 	comisd 0xb4832(%rip),%xmm0        # df450 <__PRETTY_FUNCTION__.0+0xc0>
   2ac1d:	00 
   2ac1e:	66 48 0f 7e c0       	movq   %xmm0,%rax
   2ac23:	0f 82 0d 13 00 00    	jb     2bf36 <JS_CallInternal+0x6b66>
   2ac29:	f2 0f 10 0d 27 48 0b 	movsd  0xb4827(%rip),%xmm1        # df458 <__PRETTY_FUNCTION__.0+0xc8>
   2ac30:	00 
   2ac31:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2ac35:	0f 82 fb 12 00 00    	jb     2bf36 <JS_CallInternal+0x6b66>
   2ac3b:	f2 0f 2c c8          	cvttsd2si %xmm0,%ecx
   2ac3f:	66 0f ef f6          	pxor   %xmm6,%xmm6
   2ac43:	ba 08 00 00 00       	mov    $0x8,%edx
   2ac48:	f2 0f 2a f1          	cvtsi2sd %ecx,%xmm6
   2ac4c:	66 48 0f 7e f6       	movq   %xmm6,%rsi
   2ac51:	89 c9                	mov    %ecx,%ecx
   2ac53:	48 39 f0             	cmp    %rsi,%rax
   2ac56:	be 00 00 00 00       	mov    $0x0,%esi
   2ac5b:	48 0f 44 d6          	cmove  %rsi,%rdx
   2ac5f:	48 0f 44 c1          	cmove  %rcx,%rax
   2ac63:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2ac67:	49 83 c4 01          	add    $0x1,%r12
   2ac6b:	48 83 eb 10          	sub    $0x10,%rbx
   2ac6f:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2ac73:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ac79:	49 89 c2             	mov    %rax,%r10
   2ac7c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ac80:	ff e0                	jmp    *%rax
   2ac82:	f3 0f 1e fa          	endbr64
   2ac86:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ac8a:	41 8b 0c 24          	mov    (%r12),%ecx
   2ac8e:	4d 8d 54 24 04       	lea    0x4(%r12),%r10
   2ac93:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2ac97:	83 f8 ff             	cmp    $0xffffffff,%eax
   2ac9a:	0f 85 f9 12 00 00    	jne    2bf99 <JS_CallInternal+0x6bc9>
   2aca0:	4c 89 cf             	mov    %r9,%rdi
   2aca3:	66 90                	xchg   %ax,%ax
   2aca5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2acac:	00 00 00 00 
   2acb0:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   2acb4:	41 8b 70 18          	mov    0x18(%r8),%esi
   2acb8:	89 f2                	mov    %esi,%edx
   2acba:	21 ca                	and    %ecx,%edx
   2acbc:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   2acc1:	48 85 d2             	test   %rdx,%rdx
   2acc4:	0f 84 3e 0d 00 00    	je     2ba08 <JS_CallInternal+0x6638>
   2acca:	4c 8d 1c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r11
   2acd1:	00 
   2acd2:	48 83 ea 01          	sub    $0x1,%rdx
   2acd6:	49 8d 34 d3          	lea    (%r11,%rdx,8),%rsi
   2acda:	4c 01 c6             	add    %r8,%rsi
   2acdd:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2ace0:	0f 85 14 0d 00 00    	jne    2b9fa <JS_CallInternal+0x662a>
   2ace6:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   2acea:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2acee:	0f 87 a5 12 00 00    	ja     2bf99 <JS_CallInternal+0x6bc9>
   2acf4:	48 c1 e2 04          	shl    $0x4,%rdx
   2acf8:	48 01 d7             	add    %rdx,%rdi
   2acfb:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   2acff:	48 8b 07             	mov    (%rdi),%rax
   2ad02:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2ad05:	76 04                	jbe    2ad0b <JS_CallInternal+0x593b>
   2ad07:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2ad0b:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2ad0f:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ad12:	76 15                	jbe    2ad29 <JS_CallInternal+0x5959>
   2ad14:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2ad18:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2ad1b:	83 ea 01             	sub    $0x1,%edx
   2ad1e:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2ad21:	85 d2                	test   %edx,%edx
   2ad23:	0f 8e 77 28 00 00    	jle    2d5a0 <JS_CallInternal+0x81d0>
   2ad29:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ad2d:	49 83 c4 05          	add    $0x5,%r12
   2ad31:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2ad35:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ad3b:	49 89 c2             	mov    %rax,%r10
   2ad3e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ad42:	ff e0                	jmp    *%rax
   2ad44:	f3 0f 1e fa          	endbr64
   2ad48:	8b 85 54 fd ff ff    	mov    -0x2ac(%rbp),%eax
   2ad4e:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2ad55:	49 8d 74 24 ff       	lea    -0x1(%r12),%rsi
   2ad5a:	48 8d 95 d0 fe ff ff 	lea    -0x130(%rbp),%rdx
   2ad61:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   2ad68:	89 85 dc fe ff ff    	mov    %eax,-0x124(%rbp)
   2ad6e:	48 8b 85 48 fd ff ff 	mov    -0x2b8(%rbp),%rax
   2ad75:	48 89 85 e8 fe ff ff 	mov    %rax,-0x118(%rbp)
   2ad7c:	48 8b 85 40 fd ff ff 	mov    -0x2c0(%rbp),%rax
   2ad83:	48 89 85 f0 fe ff ff 	mov    %rax,-0x110(%rbp)
   2ad8a:	e8 01 dc fe ff       	call   18990 <ex_loop_match>
   2ad8f:	8b 8d dc fe ff ff    	mov    -0x124(%rbp),%ecx
   2ad95:	89 8d 54 fd ff ff    	mov    %ecx,-0x2ac(%rbp)
   2ad9b:	48 8b 8d e8 fe ff ff 	mov    -0x118(%rbp),%rcx
   2ada2:	48 89 8d 48 fd ff ff 	mov    %rcx,-0x2b8(%rbp)
   2ada9:	48 8b 8d f0 fe ff ff 	mov    -0x110(%rbp),%rcx
   2adb0:	48 89 8d 40 fd ff ff 	mov    %rcx,-0x2c0(%rbp)
   2adb7:	85 c0                	test   %eax,%eax
   2adb9:	0f 84 23 78 fe ff    	je     125e2 <JS_CallInternal.cold+0x5>
   2adbf:	8b 95 d8 fe ff ff    	mov    -0x128(%rbp),%edx
   2adc5:	83 fa 02             	cmp    $0x2,%edx
   2adc8:	0f 84 56 1b 00 00    	je     2c924 <JS_CallInternal+0x7554>
   2adce:	48 63 85 54 fd ff ff 	movslq -0x2ac(%rbp),%rax
   2add5:	48 c1 e0 04          	shl    $0x4,%rax
   2add9:	85 d2                	test   %edx,%edx
   2addb:	0f 84 80 1d 00 00    	je     2cb61 <JS_CallInternal+0x7791>
   2ade1:	48 03 85 50 fe ff ff 	add    -0x1b0(%rbp),%rax
   2ade8:	48 8b 30             	mov    (%rax),%rsi
   2adeb:	48 8b 78 08          	mov    0x8(%rax),%rdi
   2adef:	48 63 85 d0 fe ff ff 	movslq -0x130(%rbp),%rax
   2adf6:	4c 8b 9d 68 fe ff ff 	mov    -0x198(%rbp),%r11
   2adfd:	48 89 c1             	mov    %rax,%rcx
   2ae00:	48 c1 e0 04          	shl    $0x4,%rax
   2ae04:	4c 01 d8             	add    %r11,%rax
   2ae07:	44 8b 48 08          	mov    0x8(%rax),%r9d
   2ae0b:	45 85 c9             	test   %r9d,%r9d
   2ae0e:	75 17                	jne    2ae27 <JS_CallInternal+0x5a57>
   2ae10:	48 63 95 d4 fe ff ff 	movslq -0x12c(%rbp),%rdx
   2ae17:	48 c1 e2 04          	shl    $0x4,%rdx
   2ae1b:	4c 01 da             	add    %r11,%rdx
   2ae1e:	0b 7a 08             	or     0x8(%rdx),%edi
   2ae21:	0f 84 5d 40 00 00    	je     2ee84 <JS_CallInternal+0x9ab4>
   2ae27:	8d 51 c3             	lea    -0x3d(%rcx),%edx
   2ae2a:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2ae2e:	41 88 54 24 ff       	mov    %dl,-0x1(%r12)
   2ae33:	48 8b 10             	mov    (%rax),%rdx
   2ae36:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ae3a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ae3d:	76 04                	jbe    2ae43 <JS_CallInternal+0x5a73>
   2ae3f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2ae43:	48 89 13             	mov    %rdx,(%rbx)
   2ae46:	49 83 c4 01          	add    $0x1,%r12
   2ae4a:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2ae4e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ae54:	48 89 cb             	mov    %rcx,%rbx
   2ae57:	49 89 c2             	mov    %rax,%r10
   2ae5a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ae5e:	ff e0                	jmp    *%rax
   2ae60:	f3 0f 1e fa          	endbr64
   2ae64:	45 8b 0c 24          	mov    (%r12),%r9d
   2ae68:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ae6c:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   2ae71:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2ae78:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   2ae7c:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2ae83:	4d 01 e1             	add    %r12,%r9
   2ae86:	83 f8 ff             	cmp    $0xffffffff,%eax
   2ae89:	0f 85 d9 3a 00 00    	jne    2e968 <JS_CallInternal+0x9598>
   2ae8f:	41 0f b7 42 12       	movzwl 0x12(%r10),%eax
   2ae94:	4d 8b 5a 18          	mov    0x18(%r10),%r11
   2ae98:	66 89 85 e0 fd ff ff 	mov    %ax,-0x220(%rbp)
   2ae9f:	66 83 f8 01          	cmp    $0x1,%ax
   2aea3:	0f 84 5f 1f 00 00    	je     2ce08 <JS_CallInternal+0x7a38>
   2aea9:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2aead:	4c 89 da             	mov    %r11,%rdx
   2aeb0:	4c 89 d7             	mov    %r10,%rdi
   2aeb3:	66 90                	xchg   %ax,%ax
   2aeb5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2aebc:	00 00 00 00 
   2aec0:	8b 72 18             	mov    0x18(%rdx),%esi
   2aec3:	89 f0                	mov    %esi,%eax
   2aec5:	21 c8                	and    %ecx,%eax
   2aec7:	8b 44 82 38          	mov    0x38(%rdx,%rax,4),%eax
   2aecb:	48 85 c0             	test   %rax,%rax
   2aece:	0f 84 c5 0b 00 00    	je     2ba99 <JS_CallInternal+0x66c9>
   2aed4:	4c 8d 04 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r8
   2aedb:	00 
   2aedc:	48 83 e8 01          	sub    $0x1,%rax
   2aee0:	49 8d 34 c0          	lea    (%r8,%rax,8),%rsi
   2aee4:	48 01 d6             	add    %rdx,%rsi
   2aee7:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2aeea:	0f 85 9c 0b 00 00    	jne    2ba8c <JS_CallInternal+0x66bc>
   2aef0:	4c 8b 47 20          	mov    0x20(%rdi),%r8
   2aef4:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2aef8:	0f 87 47 11 00 00    	ja     2c045 <JS_CallInternal+0x6c75>
   2aefe:	48 c1 e0 04          	shl    $0x4,%rax
   2af02:	49 01 c0             	add    %rax,%r8
   2af05:	48 89 c6             	mov    %rax,%rsi
   2af08:	49 8b 40 08          	mov    0x8(%r8),%rax
   2af0c:	49 8b 08             	mov    (%r8),%rcx
   2af0f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2af12:	76 04                	jbe    2af18 <JS_CallInternal+0x5b48>
   2af14:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2af18:	49 39 fa             	cmp    %rdi,%r10
   2af1b:	0f 84 d8 44 00 00    	je     2f3f9 <JS_CallInternal+0xa029>
   2af21:	49 39 7b 30          	cmp    %rdi,0x30(%r11)
   2af25:	0f 84 25 4c 00 00    	je     2fb50 <JS_CallInternal+0xa780>
   2af2b:	48 89 0b             	mov    %rcx,(%rbx)
   2af2e:	49 83 c4 05          	add    $0x5,%r12
   2af32:	48 83 c3 10          	add    $0x10,%rbx
   2af36:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2af3a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2af40:	49 89 c2             	mov    %rax,%r10
   2af43:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2af47:	ff e0                	jmp    *%rax
   2af49:	f3 0f 1e fa          	endbr64
   2af4d:	41 8b 04 24          	mov    (%r12),%eax
   2af51:	4c 8b 5b f8          	mov    -0x8(%rbx),%r11
   2af55:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   2af5a:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2af61:	4d 8d 14 04          	lea    (%r12,%rax,1),%r10
   2af65:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2af69:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2af6d:	0f 85 ec 39 00 00    	jne    2e95f <JS_CallInternal+0x958f>
   2af73:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2af77:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2af7c:	0f 84 40 1e 00 00    	je     2cdc2 <JS_CallInternal+0x79f2>
   2af82:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2af86:	49 89 c0             	mov    %rax,%r8
   2af89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2af90:	8b 77 18             	mov    0x18(%rdi),%esi
   2af93:	89 f2                	mov    %esi,%edx
   2af95:	21 ca                	and    %ecx,%edx
   2af97:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2af9b:	48 85 d2             	test   %rdx,%rdx
   2af9e:	0f 84 23 0b 00 00    	je     2bac7 <JS_CallInternal+0x66f7>
   2afa4:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   2afab:	00 
   2afac:	48 83 ea 01          	sub    $0x1,%rdx
   2afb0:	49 8d 34 d1          	lea    (%r9,%rdx,8),%rsi
   2afb4:	48 01 fe             	add    %rdi,%rsi
   2afb7:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2afba:	0f 85 f9 0a 00 00    	jne    2bab9 <JS_CallInternal+0x66e9>
   2afc0:	4d 8b 48 20          	mov    0x20(%r8),%r9
   2afc4:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2afc8:	0f 87 89 11 00 00    	ja     2c157 <JS_CallInternal+0x6d87>
   2afce:	48 c1 e2 04          	shl    $0x4,%rdx
   2afd2:	49 01 d1             	add    %rdx,%r9
   2afd5:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2afd9:	49 8b 31             	mov    (%r9),%rsi
   2afdc:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2afdf:	76 04                	jbe    2afe5 <JS_CallInternal+0x5c15>
   2afe1:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2afe5:	49 89 f1             	mov    %rsi,%r9
   2afe8:	4c 39 c0             	cmp    %r8,%rax
   2afeb:	0f 84 7d 42 00 00    	je     2f26e <JS_CallInternal+0x9e9e>
   2aff1:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2aff5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aff8:	76 15                	jbe    2b00f <JS_CallInternal+0x5c3f>
   2affa:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2affe:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2b001:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2b004:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b007:	85 d2                	test   %edx,%edx
   2b009:	0f 8e 3f 28 00 00    	jle    2d84e <JS_CallInternal+0x847e>
   2b00f:	4c 89 4b f0          	mov    %r9,-0x10(%rbx)
   2b013:	49 83 c4 05          	add    $0x5,%r12
   2b017:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2b01b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b021:	49 89 c2             	mov    %rax,%r10
   2b024:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b028:	ff e0                	jmp    *%rax
   2b02a:	f3 0f 1e fa          	endbr64
   2b02e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b032:	41 8b 0c 24          	mov    (%r12),%ecx
   2b036:	4d 8d 54 24 04       	lea    0x4(%r12),%r10
   2b03b:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2b03f:	83 f8 ff             	cmp    $0xffffffff,%eax
   2b042:	0f 85 a7 0f 00 00    	jne    2bfef <JS_CallInternal+0x6c1f>
   2b048:	4c 89 cf             	mov    %r9,%rdi
   2b04b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2b050:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   2b054:	41 8b 70 18          	mov    0x18(%r8),%esi
   2b058:	89 f2                	mov    %esi,%edx
   2b05a:	21 ca                	and    %ecx,%edx
   2b05c:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   2b061:	48 85 d2             	test   %rdx,%rdx
   2b064:	0f 84 ff 09 00 00    	je     2ba69 <JS_CallInternal+0x6699>
   2b06a:	4c 8d 1c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r11
   2b071:	00 
   2b072:	48 83 ea 01          	sub    $0x1,%rdx
   2b076:	49 8d 34 d3          	lea    (%r11,%rdx,8),%rsi
   2b07a:	4c 01 c6             	add    %r8,%rsi
   2b07d:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2b080:	0f 85 d5 09 00 00    	jne    2ba5b <JS_CallInternal+0x668b>
   2b086:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   2b08a:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b08e:	0f 87 5b 0f 00 00    	ja     2bfef <JS_CallInternal+0x6c1f>
   2b094:	48 c1 e2 04          	shl    $0x4,%rdx
   2b098:	48 01 d7             	add    %rdx,%rdi
   2b09b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   2b09f:	48 8b 07             	mov    (%rdi),%rax
   2b0a2:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b0a5:	76 04                	jbe    2b0ab <JS_CallInternal+0x5cdb>
   2b0a7:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b0ab:	48 89 03             	mov    %rax,(%rbx)
   2b0ae:	49 83 c4 05          	add    $0x5,%r12
   2b0b2:	48 83 c3 10          	add    $0x10,%rbx
   2b0b6:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b0ba:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b0c0:	49 89 c2             	mov    %rax,%r10
   2b0c3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b0c7:	ff e0                	jmp    *%rax
   2b0c9:	f3 0f 1e fa          	endbr64
   2b0cd:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2b0d1:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   2b0d5:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2b0d9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b0dc:	76 11                	jbe    2b0ef <JS_CallInternal+0x5d1f>
   2b0de:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2b0e1:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2b0e4:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b0e7:	85 d2                	test   %edx,%edx
   2b0e9:	0f 8e b1 25 00 00    	jle    2d6a0 <JS_CallInternal+0x82d0>
   2b0ef:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   2b0f3:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   2b0f7:	74 58                	je     2b151 <JS_CallInternal+0x5d81>
   2b0f9:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b100:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2b104:	31 c9                	xor    %ecx,%ecx
   2b106:	4c 89 ef             	mov    %r13,%rdi
   2b109:	49 8b 53 08          	mov    0x8(%r11),%rdx
   2b10d:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2b114:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b118:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2b11f:	e8 6c 9e 06 00       	call   94f90 <JS_IteratorClose>
   2b124:	85 c0                	test   %eax,%eax
   2b126:	0f 85 1c 51 00 00    	jne    30248 <JS_CallInternal+0xae78>
   2b12c:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2b133:	49 8b 43 08          	mov    0x8(%r11),%rax
   2b137:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b13a:	76 15                	jbe    2b151 <JS_CallInternal+0x5d81>
   2b13c:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   2b140:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2b143:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2b146:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b149:	85 d2                	test   %edx,%edx
   2b14b:	0f 8e 1d 44 00 00    	jle    2f56e <JS_CallInternal+0xa19e>
   2b151:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b156:	4c 89 db             	mov    %r11,%rbx
   2b159:	49 83 c4 01          	add    $0x1,%r12
   2b15d:	49 89 c2             	mov    %rax,%r10
   2b160:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b164:	ff e0                	jmp    *%rax
   2b166:	f3 0f 1e fa          	endbr64
   2b16a:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b171:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   2b175:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b179:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b17d:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2b181:	0f 85 f0 4a 00 00    	jne    2fc77 <JS_CallInternal+0xa8a7>
   2b187:	48 8d 8d ac fe ff ff 	lea    -0x154(%rbp),%rcx
   2b18e:	4c 89 c2             	mov    %r8,%rdx
   2b191:	48 89 c6             	mov    %rax,%rsi
   2b194:	4c 89 ef             	mov    %r13,%rdi
   2b197:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2b19e:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2b1a5:	e8 f6 be 05 00       	call   870a0 <JS_IteratorGetCompleteValue>
   2b1aa:	48 89 c1             	mov    %rax,%rcx
   2b1ad:	48 89 d0             	mov    %rdx,%rax
   2b1b0:	83 fa 06             	cmp    $0x6,%edx
   2b1b3:	0f 84 47 aa ff ff    	je     25c00 <JS_CallInternal+0x830>
   2b1b9:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   2b1c0:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2b1c3:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2b1c6:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b1c9:	85 d2                	test   %edx,%edx
   2b1cb:	0f 8e a7 30 00 00    	jle    2e278 <JS_CallInternal+0x8ea8>
   2b1d1:	8b 95 ac fe ff ff    	mov    -0x154(%rbp),%edx
   2b1d7:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b1db:	31 c0                	xor    %eax,%eax
   2b1dd:	48 c7 43 e0 00 00 00 	movq   $0x0,-0x20(%rbx)
   2b1e4:	00 
   2b1e5:	85 d2                	test   %edx,%edx
   2b1e7:	48 c7 43 e8 05 00 00 	movq   $0x5,-0x18(%rbx)
   2b1ee:	00 
   2b1ef:	0f 95 c0             	setne  %al
   2b1f2:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2b1f6:	49 83 c4 01          	add    $0x1,%r12
   2b1fa:	48 83 c3 10          	add    $0x10,%rbx
   2b1fe:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b202:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2b209:	00 
   2b20a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b210:	49 89 c2             	mov    %rax,%r10
   2b213:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b217:	ff e0                	jmp    *%rax
   2b219:	f3 0f 1e fa          	endbr64
   2b21d:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b224:	ba 01 00 00 00       	mov    $0x1,%edx
   2b229:	48 89 de             	mov    %rbx,%rsi
   2b22c:	4c 89 ef             	mov    %r13,%rdi
   2b22f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b233:	e8 b8 4d 07 00       	call   9fff0 <js_for_of_start>
   2b238:	85 c0                	test   %eax,%eax
   2b23a:	0f 85 c0 a9 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2b240:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2b247:	00 
   2b248:	49 83 c4 01          	add    $0x1,%r12
   2b24c:	48 83 c3 20          	add    $0x20,%rbx
   2b250:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b257:	00 
   2b258:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b25e:	49 89 c2             	mov    %rax,%r10
   2b261:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b265:	ff e0                	jmp    *%rax
   2b267:	f3 0f 1e fa          	endbr64
   2b26b:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   2b26f:	0f 85 c7 2f 00 00    	jne    2e23c <JS_CallInternal+0x8e6c>
   2b275:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b27a:	49 83 c4 01          	add    $0x1,%r12
   2b27e:	49 89 c2             	mov    %rax,%r10
   2b281:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b285:	ff e0                	jmp    *%rax
   2b287:	f3 0f 1e fa          	endbr64
   2b28b:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   2b28f:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2b293:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2b297:	4c 89 ef             	mov    %r13,%rdi
   2b29a:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2b29e:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2b2a2:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2b2a8:	48 c7 85 a0 fd ff ff 	movq   $0x0,-0x260(%rbp)
   2b2af:	00 00 00 00 
   2b2b3:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b2ba:	48 c7 85 a8 fd ff ff 	movq   $0x3,-0x258(%rbp)
   2b2c1:	03 00 00 00 
   2b2c5:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b2c9:	6a 02                	push   $0x2
   2b2cb:	41 52                	push   %r10
   2b2cd:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2b2d4:	ff b5 a8 fd ff ff    	push   -0x258(%rbp)
   2b2da:	ff b5 a0 fd ff ff    	push   -0x260(%rbp)
   2b2e0:	e8 eb a0 ff ff       	call   253d0 <JS_CallInternal>
   2b2e5:	48 83 c4 20          	add    $0x20,%rsp
   2b2e9:	48 89 c1             	mov    %rax,%rcx
   2b2ec:	48 89 d0             	mov    %rdx,%rax
   2b2ef:	83 fa 06             	cmp    $0x6,%edx
   2b2f2:	0f 84 08 a9 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2b2f8:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2b2ff:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2b303:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b306:	76 15                	jbe    2b31d <JS_CallInternal+0x5f4d>
   2b308:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2b30c:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2b30f:	83 ea 01             	sub    $0x1,%edx
   2b312:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2b315:	85 d2                	test   %edx,%edx
   2b317:	0f 8e a5 23 00 00    	jle    2d6c2 <JS_CallInternal+0x82f2>
   2b31d:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2b321:	49 83 c4 01          	add    $0x1,%r12
   2b325:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b329:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b32f:	49 89 c2             	mov    %rax,%r10
   2b332:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b336:	ff e0                	jmp    *%rax
   2b338:	f3 0f 1e fa          	endbr64
   2b33c:	8b 4b f8             	mov    -0x8(%rbx),%ecx
   2b33f:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b343:	85 c9                	test   %ecx,%ecx
   2b345:	0f 85 62 11 00 00    	jne    2c4ad <JS_CallInternal+0x70dd>
   2b34b:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2b350:	0f 84 57 11 00 00    	je     2c4ad <JS_CallInternal+0x70dd>
   2b356:	83 c0 01             	add    $0x1,%eax
   2b359:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b360:	00 
   2b361:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b365:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b36a:	49 83 c4 01          	add    $0x1,%r12
   2b36e:	49 89 c2             	mov    %rax,%r10
   2b371:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b375:	ff e0                	jmp    *%rax
   2b377:	f3 0f 1e fa          	endbr64
   2b37b:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b37f:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b383:	83 fa 02             	cmp    $0x2,%edx
   2b386:	0f 87 53 0f 00 00    	ja     2c2df <JS_CallInternal+0x6f0f>
   2b38c:	85 c0                	test   %eax,%eax
   2b38e:	0f 84 73 42 00 00    	je     2f607 <JS_CallInternal+0xa237>
   2b394:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2b399:	0f 84 9a 3e 00 00    	je     2f239 <JS_CallInternal+0x9e69>
   2b39f:	f7 d8                	neg    %eax
   2b3a1:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b3a8:	00 
   2b3a9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b3ad:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b3b2:	49 83 c4 01          	add    $0x1,%r12
   2b3b6:	49 89 c2             	mov    %rax,%r10
   2b3b9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b3bd:	ff e0                	jmp    *%rax
   2b3bf:	f3 0f 1e fa          	endbr64
   2b3c3:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2b3ca:	49 63 14 24          	movslq (%r12),%rdx
   2b3ce:	83 e8 01             	sub    $0x1,%eax
   2b3d1:	4c 01 e2             	add    %r12,%rdx
   2b3d4:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2b3db:	85 c0                	test   %eax,%eax
   2b3dd:	0f 8e ac 2d 00 00    	jle    2e18f <JS_CallInternal+0x8dbf>
   2b3e3:	0f b6 02             	movzbl (%rdx),%eax
   2b3e6:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   2b3ea:	49 89 c2             	mov    %rax,%r10
   2b3ed:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2b3f1:	f3 0f 1e fa          	endbr64
   2b3f5:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2b3fc:	49 0f bf 14 24       	movswq (%r12),%rdx
   2b401:	83 e8 01             	sub    $0x1,%eax
   2b404:	4c 01 e2             	add    %r12,%rdx
   2b407:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2b40e:	85 c0                	test   %eax,%eax
   2b410:	0f 8e 76 37 00 00    	jle    2eb8c <JS_CallInternal+0x97bc>
   2b416:	0f b6 02             	movzbl (%rdx),%eax
   2b419:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   2b41d:	49 89 c2             	mov    %rax,%r10
   2b420:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2b424:	f3 0f 1e fa          	endbr64
   2b428:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b42f:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b433:	4c 89 ef             	mov    %r13,%rdi
   2b436:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b43a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b43e:	e8 cd 4d 04 00       	call   70210 <build_for_in_iterator>
   2b443:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b447:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b44b:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2b44f:	0f 84 ab a7 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2b455:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b45a:	49 83 c4 01          	add    $0x1,%r12
   2b45e:	49 89 c2             	mov    %rax,%r10
   2b461:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b465:	ff e0                	jmp    *%rax
   2b467:	f3 0f 1e fa          	endbr64
   2b46b:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b470:	48 89 c1             	mov    %rax,%rcx
   2b473:	48 c1 e0 04          	shl    $0x4,%rax
   2b477:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   2b47e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b482:	83 fa 04             	cmp    $0x4,%edx
   2b485:	0f 84 6f 2f 00 00    	je     2e3fa <JS_CallInternal+0x902a>
   2b48b:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2b48f:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b493:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2b496:	76 04                	jbe    2b49c <JS_CallInternal+0x60cc>
   2b498:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2b49c:	48 8b 38             	mov    (%rax),%rdi
   2b49f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2b4a3:	48 89 30             	mov    %rsi,(%rax)
   2b4a6:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b4a9:	76 11                	jbe    2b4bc <JS_CallInternal+0x60ec>
   2b4ab:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2b4ae:	83 e8 01             	sub    $0x1,%eax
   2b4b1:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2b4b4:	85 c0                	test   %eax,%eax
   2b4b6:	0f 8e 4b 27 00 00    	jle    2dc07 <JS_CallInternal+0x8837>
   2b4bc:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2b4c2:	49 83 c4 03          	add    $0x3,%r12
   2b4c6:	49 89 c2             	mov    %rax,%r10
   2b4c9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b4cd:	ff e0                	jmp    *%rax
   2b4cf:	f3 0f 1e fa          	endbr64
   2b4d3:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b4d8:	48 89 c1             	mov    %rax,%rcx
   2b4db:	48 c1 e0 04          	shl    $0x4,%rax
   2b4df:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   2b4e6:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b4ea:	83 fa 04             	cmp    $0x4,%edx
   2b4ed:	0f 84 78 31 00 00    	je     2e66b <JS_CallInternal+0x929b>
   2b4f3:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2b4f8:	48 8b 08             	mov    (%rax),%rcx
   2b4fb:	0f 11 00             	movups %xmm0,(%rax)
   2b4fe:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b501:	76 11                	jbe    2b514 <JS_CallInternal+0x6144>
   2b503:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2b506:	83 e8 01             	sub    $0x1,%eax
   2b509:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2b50c:	85 c0                	test   %eax,%eax
   2b50e:	0f 8e 26 26 00 00    	jle    2db3a <JS_CallInternal+0x876a>
   2b514:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2b51a:	48 83 eb 10          	sub    $0x10,%rbx
   2b51e:	49 83 c4 03          	add    $0x3,%r12
   2b522:	49 89 c2             	mov    %rax,%r10
   2b525:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b529:	ff e0                	jmp    *%rax
   2b52b:	f3 0f 1e fa          	endbr64
   2b52f:	49 8b b5 90 01 00 00 	mov    0x190(%r13),%rsi
   2b536:	41 8b 0c 24          	mov    (%r12),%ecx
   2b53a:	4d 8d 44 24 04       	lea    0x4(%r12),%r8
   2b53f:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b546:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
   2b54a:	4c 89 40 30          	mov    %r8,0x30(%rax)
   2b54e:	89 c8                	mov    %ecx,%eax
   2b550:	8b 57 18             	mov    0x18(%rdi),%edx
   2b553:	21 d0                	and    %edx,%eax
   2b555:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2b559:	48 85 c0             	test   %rax,%rax
   2b55c:	0f 84 92 1f 00 00    	je     2d4f4 <JS_CallInternal+0x8124>
   2b562:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2b569:	00 
   2b56a:	48 83 e8 01          	sub    $0x1,%rax
   2b56e:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2b572:	48 01 fa             	add    %rdi,%rdx
   2b575:	3b 4a 04             	cmp    0x4(%rdx),%ecx
   2b578:	0f 85 69 1f 00 00    	jne    2d4e7 <JS_CallInternal+0x8117>
   2b57e:	48 c1 e0 04          	shl    $0x4,%rax
   2b582:	48 03 46 20          	add    0x20(%rsi),%rax
   2b586:	48 8b 00             	mov    (%rax),%rax
   2b589:	48 8b 40 18          	mov    0x18(%rax),%rax
   2b58d:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2b591:	0f 84 84 3a 00 00    	je     2f01b <JS_CallInternal+0x9c4b>
   2b597:	f6 42 03 08          	testb  $0x8,0x3(%rdx)
   2b59b:	0f 84 44 3a 00 00    	je     2efe5 <JS_CallInternal+0x9c15>
   2b5a1:	49 8b 85 98 01 00 00 	mov    0x198(%r13),%rax
   2b5a8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b5ab:	76 04                	jbe    2b5b1 <JS_CallInternal+0x61e1>
   2b5ad:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2b5b1:	48 89 33             	mov    %rsi,(%rbx)
   2b5b4:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2b5b8:	31 d2                	xor    %edx,%edx
   2b5ba:	89 ce                	mov    %ecx,%esi
   2b5bc:	4c 89 ef             	mov    %r13,%rdi
   2b5bf:	48 83 c3 20          	add    $0x20,%rbx
   2b5c3:	e8 f8 0a 01 00       	call   3c0c0 <__JS_AtomToValue>
   2b5c8:	49 83 c4 05          	add    $0x5,%r12
   2b5cc:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b5d0:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b5d4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b5da:	49 89 c2             	mov    %rax,%r10
   2b5dd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b5e1:	ff e0                	jmp    *%rax
   2b5e3:	f3 0f 1e fa          	endbr64
   2b5e7:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2b5ee:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b5f3:	48 8b b5 90 fe ff ff 	mov    -0x170(%rbp),%rsi
   2b5fa:	0f b7 51 38          	movzwl 0x38(%rcx),%edx
   2b5fe:	48 8b 79 28          	mov    0x28(%rcx),%rdi
   2b602:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
   2b606:	01 d0                	add    %edx,%eax
   2b608:	48 98                	cltq
   2b60a:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   2b60e:	48 8d 04 87          	lea    (%rdi,%rax,4),%rax
   2b612:	0f b7 40 0a          	movzwl 0xa(%rax),%eax
   2b616:	48 c1 e0 03          	shl    $0x3,%rax
   2b61a:	48 01 c1             	add    %rax,%rcx
   2b61d:	48 8b 11             	mov    (%rcx),%rdx
   2b620:	48 85 d2             	test   %rdx,%rdx
   2b623:	74 47                	je     2b66c <JS_CallInternal+0x629c>
   2b625:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2b629:	f6 46 3c 04          	testb  $0x4,0x3c(%rsi)
   2b62d:	0f 85 56 1e 00 00    	jne    2d489 <JS_CallInternal+0x80b9>
   2b633:	48 8b 72 18          	mov    0x18(%rdx),%rsi
   2b637:	48 8b 06             	mov    (%rsi),%rax
   2b63a:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   2b63e:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b641:	76 04                	jbe    2b647 <JS_CallInternal+0x6277>
   2b643:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b647:	48 8d 7a 20          	lea    0x20(%rdx),%rdi
   2b64b:	66 48 0f 6e e8       	movq   %rax,%xmm5
   2b650:	48 89 72 28          	mov    %rsi,0x28(%rdx)
   2b654:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2b659:	c6 42 10 01          	movb   $0x1,0x10(%rdx)
   2b65d:	66 0f 6c c5          	punpcklqdq %xmm5,%xmm0
   2b661:	0f 11 42 18          	movups %xmm0,0x18(%rdx)
   2b665:	48 c7 01 00 00 00 00 	movq   $0x0,(%rcx)
   2b66c:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2b672:	49 83 c4 03          	add    $0x3,%r12
   2b676:	49 89 c2             	mov    %rax,%r10
   2b679:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b67d:	ff e0                	jmp    *%rax
   2b67f:	f3 0f 1e fa          	endbr64
   2b683:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b688:	48 c1 e0 04          	shl    $0x4,%rax
   2b68c:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   2b693:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2b697:	0f 85 0f 2c 00 00    	jne    2e2ac <JS_CallInternal+0x8edc>
   2b69d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2b6a2:	49 83 c4 03          	add    $0x3,%r12
   2b6a6:	48 83 eb 10          	sub    $0x10,%rbx
   2b6aa:	0f 11 00             	movups %xmm0,(%rax)
   2b6ad:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b6b3:	49 89 c2             	mov    %rax,%r10
   2b6b6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b6ba:	ff e0                	jmp    *%rax
   2b6bc:	f3 0f 1e fa          	endbr64
   2b6c0:	e9 7b a2 ff ff       	jmp    25940 <JS_CallInternal+0x570>
   2b6c5:	f3 0f 1e fa          	endbr64
   2b6c9:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b6ce:	48 89 c1             	mov    %rax,%rcx
   2b6d1:	48 c1 e0 04          	shl    $0x4,%rax
   2b6d5:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   2b6dc:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b6e0:	83 fa 04             	cmp    $0x4,%edx
   2b6e3:	0f 84 ec 31 00 00    	je     2e8d5 <JS_CallInternal+0x9505>
   2b6e9:	48 8b 00             	mov    (%rax),%rax
   2b6ec:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b6ef:	76 04                	jbe    2b6f5 <JS_CallInternal+0x6325>
   2b6f1:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b6f5:	48 89 03             	mov    %rax,(%rbx)
   2b6f8:	49 83 c4 03          	add    $0x3,%r12
   2b6fc:	48 83 c3 10          	add    $0x10,%rbx
   2b700:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b704:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b70a:	49 89 c2             	mov    %rax,%r10
   2b70d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b711:	ff e0                	jmp    *%rax
   2b713:	f3 0f 1e fa          	endbr64
   2b717:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b71c:	48 89 c1             	mov    %rax,%rcx
   2b71f:	48 c1 e0 04          	shl    $0x4,%rax
   2b723:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   2b72a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b72e:	83 fa 04             	cmp    $0x4,%edx
   2b731:	0f 84 e8 2a 00 00    	je     2e21f <JS_CallInternal+0x8e4f>
   2b737:	48 8b 00             	mov    (%rax),%rax
   2b73a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b73d:	76 04                	jbe    2b743 <JS_CallInternal+0x6373>
   2b73f:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b743:	48 89 03             	mov    %rax,(%rbx)
   2b746:	49 83 c4 03          	add    $0x3,%r12
   2b74a:	48 83 c3 10          	add    $0x10,%rbx
   2b74e:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b752:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b758:	49 89 c2             	mov    %rax,%r10
   2b75b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b75f:	ff e0                	jmp    *%rax
   2b761:	f3 0f 1e fa          	endbr64
   2b765:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b769:	48 8d 4b f0          	lea    -0x10(%rbx),%rcx
   2b76d:	48 8b 5b f8          	mov    -0x8(%rbx),%rbx
   2b771:	48 39 8d 18 fe ff ff 	cmp    %rcx,-0x1e8(%rbp)
   2b778:	0f 83 67 05 00 00    	jae    2bce5 <JS_CallInternal+0x6915>
   2b77e:	4c 89 a5 f8 fd ff ff 	mov    %r12,-0x208(%rbp)
   2b785:	4c 8b a5 18 fe ff ff 	mov    -0x1e8(%rbp),%r12
   2b78c:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2b793:	4d 89 e8             	mov    %r13,%r8
   2b796:	49 89 dd             	mov    %rbx,%r13
   2b799:	48 89 cb             	mov    %rcx,%rbx
   2b79c:	eb 0b                	jmp    2b7a9 <JS_CallInternal+0x63d9>
   2b79e:	66 90                	xchg   %ax,%ax
   2b7a0:	49 39 dc             	cmp    %rbx,%r12
   2b7a3:	0f 83 25 05 00 00    	jae    2bcce <JS_CallInternal+0x68fe>
   2b7a9:	83 7b f8 05          	cmpl   $0x5,-0x8(%rbx)
   2b7ad:	0f 84 1b 05 00 00    	je     2bcce <JS_CallInternal+0x68fe>
   2b7b3:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b7b7:	48 83 eb 10          	sub    $0x10,%rbx
   2b7bb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b7be:	76 e0                	jbe    2b7a0 <JS_CallInternal+0x63d0>
   2b7c0:	48 8b 33             	mov    (%rbx),%rsi
   2b7c3:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2b7c6:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2b7c9:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b7cc:	85 d2                	test   %edx,%edx
   2b7ce:	7f d0                	jg     2b7a0 <JS_CallInternal+0x63d0>
   2b7d0:	49 8b 78 10          	mov    0x10(%r8),%rdi
   2b7d4:	48 89 c2             	mov    %rax,%rdx
   2b7d7:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2b7de:	e8 3d 31 ff ff       	call   1e920 <__JS_FreeValueRT>
   2b7e3:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2b7ea:	eb b4                	jmp    2b7a0 <JS_CallInternal+0x63d0>
   2b7ec:	f3 0f 1e fa          	endbr64
   2b7f0:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b7f7:	31 d2                	xor    %edx,%edx
   2b7f9:	48 89 de             	mov    %rbx,%rsi
   2b7fc:	4c 89 ef             	mov    %r13,%rdi
   2b7ff:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b803:	e8 e8 47 07 00       	call   9fff0 <js_for_of_start>
   2b808:	85 c0                	test   %eax,%eax
   2b80a:	0f 85 f0 a3 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2b810:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2b817:	00 
   2b818:	49 83 c4 01          	add    $0x1,%r12
   2b81c:	48 83 c3 20          	add    $0x20,%rbx
   2b820:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b827:	00 
   2b828:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b82e:	49 89 c2             	mov    %rax,%r10
   2b831:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b835:	ff e0                	jmp    *%rax
   2b837:	f3 0f 1e fa          	endbr64
   2b83b:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b842:	48 89 de             	mov    %rbx,%rsi
   2b845:	4c 89 ef             	mov    %r13,%rdi
   2b848:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b84c:	e8 4f a5 05 00       	call   85da0 <js_for_in_next>
   2b851:	85 c0                	test   %eax,%eax
   2b853:	0f 85 a7 a3 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2b859:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b85e:	48 83 c3 20          	add    $0x20,%rbx
   2b862:	49 83 c4 01          	add    $0x1,%r12
   2b866:	49 89 c2             	mov    %rax,%r10
   2b869:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b86d:	ff e0                	jmp    *%rax
   2b86f:	f3 0f 1e fa          	endbr64
   2b873:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   2b878:	41 ba fd ff ff ff    	mov    $0xfffffffd,%r10d
   2b87e:	4d 8d 5c 24 01       	lea    0x1(%r12),%r11
   2b883:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2b88a:	c7 85 ac fe ff ff 01 	movl   $0x1,-0x154(%rbp)
   2b891:	00 00 00 
   2b894:	41 29 ca             	sub    %ecx,%r10d
   2b897:	4c 89 58 30          	mov    %r11,0x30(%rax)
   2b89b:	4d 63 d2             	movslq %r10d,%r10
   2b89e:	49 c1 e2 04          	shl    $0x4,%r10
   2b8a2:	49 01 da             	add    %rbx,%r10
   2b8a5:	49 8b 52 08          	mov    0x8(%r10),%rdx
   2b8a9:	83 fa 03             	cmp    $0x3,%edx
   2b8ac:	0f 84 de 2f 00 00    	je     2e890 <JS_CallInternal+0x94c0>
   2b8b2:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   2b8b7:	49 8b 32             	mov    (%r10),%rsi
   2b8ba:	4c 89 ef             	mov    %r13,%rdi
   2b8bd:	4c 8d 8d ac fe ff ff 	lea    -0x154(%rbp),%r9
   2b8c4:	29 c8                	sub    %ecx,%eax
   2b8c6:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2b8cd:	48 98                	cltq
   2b8cf:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2b8d6:	48 c1 e0 04          	shl    $0x4,%rax
   2b8da:	48 01 d8             	add    %rbx,%rax
   2b8dd:	48 8b 08             	mov    (%rax),%rcx
   2b8e0:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2b8e4:	e8 77 5e 07 00       	call   a1760 <JS_IteratorNext.constprop.0>
   2b8e9:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2b8f0:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2b8f7:	48 89 c1             	mov    %rax,%rcx
   2b8fa:	83 fa 06             	cmp    $0x6,%edx
   2b8fd:	48 89 d0             	mov    %rdx,%rax
   2b900:	48 89 d6             	mov    %rdx,%rsi
   2b903:	48 89 cf             	mov    %rcx,%rdi
   2b906:	0f 84 53 2f 00 00    	je     2e85f <JS_CallInternal+0x948f>
   2b90c:	44 8b 85 ac fe ff ff 	mov    -0x154(%rbp),%r8d
   2b913:	31 d2                	xor    %edx,%edx
   2b915:	45 85 c0             	test   %r8d,%r8d
   2b918:	0f 85 0e 1a 00 00    	jne    2d32c <JS_CallInternal+0x7f5c>
   2b91e:	48 89 3b             	mov    %rdi,(%rbx)
   2b921:	49 83 c4 02          	add    $0x2,%r12
   2b925:	48 83 c3 20          	add    $0x20,%rbx
   2b929:	48 89 73 e8          	mov    %rsi,-0x18(%rbx)
   2b92d:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2b931:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2b938:	00 
   2b939:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b93f:	49 89 c2             	mov    %rax,%r10
   2b942:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b946:	ff e0                	jmp    *%rax
   2b948:	f3 0f 1e fa          	endbr64
   2b94c:	49 63 04 24          	movslq (%r12),%rax
   2b950:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2b957:	49 8d 54 24 04       	lea    0x4(%r12),%rdx
   2b95c:	48 83 c3 10          	add    $0x10,%rbx
   2b960:	2b 51 18             	sub    0x18(%rcx),%edx
   2b963:	4c 01 e0             	add    %r12,%rax
   2b966:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b96d:	00 
   2b96e:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2b972:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2b976:	0f b6 00             	movzbl (%rax),%eax
   2b979:	49 89 c2             	mov    %rax,%r10
   2b97c:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2b980:	f3 0f 1e fa          	endbr64
   2b984:	8b 73 f8             	mov    -0x8(%rbx),%esi
   2b987:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b98b:	85 f6                	test   %esi,%esi
   2b98d:	0f 85 fd 19 00 00    	jne    2d390 <JS_CallInternal+0x7fc0>
   2b993:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2b99a:	3b 41 20             	cmp    0x20(%rcx),%eax
   2b99d:	0f 83 ed 19 00 00    	jae    2d390 <JS_CallInternal+0x7fc0>
   2b9a3:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2b9aa:	89 c0                	mov    %eax,%eax
   2b9ac:	48 83 eb 10          	sub    $0x10,%rbx
   2b9b0:	48 03 41 18          	add    0x18(%rcx),%rax
   2b9b4:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2b9b8:	0f b6 00             	movzbl (%rax),%eax
   2b9bb:	49 89 c2             	mov    %rax,%r10
   2b9be:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2b9c2:	f3 0f 1e fa          	endbr64
   2b9c6:	49 63 04 24          	movslq (%r12),%rax
   2b9ca:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2b9d1:	48 83 c3 10          	add    $0x10,%rbx
   2b9d5:	4c 01 e0             	add    %r12,%rax
   2b9d8:	2b 41 18             	sub    0x18(%rcx),%eax
   2b9db:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b9e2:	00 
   2b9e3:	49 83 c4 05          	add    $0x5,%r12
   2b9e7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b9eb:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b9f1:	49 89 c2             	mov    %rax,%r10
   2b9f4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b9f8:	ff e0                	jmp    *%rax
   2b9fa:	8b 16                	mov    (%rsi),%edx
   2b9fc:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2ba02:	0f 85 ca f2 ff ff    	jne    2acd2 <JS_CallInternal+0x5902>
   2ba08:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2ba0c:	0f 85 7d 05 00 00    	jne    2bf8f <JS_CallInternal+0x6bbf>
   2ba12:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2ba16:	48 85 ff             	test   %rdi,%rdi
   2ba19:	0f 85 91 f2 ff ff    	jne    2acb0 <JS_CallInternal+0x58e0>
   2ba1f:	b9 03 00 00 00       	mov    $0x3,%ecx
   2ba24:	31 c0                	xor    %eax,%eax
   2ba26:	e9 e0 f2 ff ff       	jmp    2ad0b <JS_CallInternal+0x593b>
   2ba2b:	8b 02                	mov    (%rdx),%eax
   2ba2d:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ba32:	0f 85 9b cb ff ff    	jne    285d3 <JS_CallInternal+0x3203>
   2ba38:	f6 41 10 08          	testb  $0x8,0x10(%rcx)
   2ba3c:	0f 85 57 06 00 00    	jne    2c099 <JS_CallInternal+0x6cc9>
   2ba42:	49 8b 48 30          	mov    0x30(%r8),%rcx
   2ba46:	48 85 c9             	test   %rcx,%rcx
   2ba49:	0f 85 61 cb ff ff    	jne    285b0 <JS_CallInternal+0x31e0>
   2ba4f:	b9 03 00 00 00       	mov    $0x3,%ecx
   2ba54:	31 c0                	xor    %eax,%eax
   2ba56:	e9 b2 cb ff ff       	jmp    2860d <JS_CallInternal+0x323d>
   2ba5b:	8b 16                	mov    (%rsi),%edx
   2ba5d:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2ba63:	0f 85 09 f6 ff ff    	jne    2b072 <JS_CallInternal+0x5ca2>
   2ba69:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2ba6d:	0f 85 72 05 00 00    	jne    2bfe5 <JS_CallInternal+0x6c15>
   2ba73:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2ba77:	48 85 ff             	test   %rdi,%rdi
   2ba7a:	0f 85 d0 f5 ff ff    	jne    2b050 <JS_CallInternal+0x5c80>
   2ba80:	ba 03 00 00 00       	mov    $0x3,%edx
   2ba85:	31 c0                	xor    %eax,%eax
   2ba87:	e9 1f f6 ff ff       	jmp    2b0ab <JS_CallInternal+0x5cdb>
   2ba8c:	8b 06                	mov    (%rsi),%eax
   2ba8e:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ba93:	0f 85 43 f4 ff ff    	jne    2aedc <JS_CallInternal+0x5b0c>
   2ba99:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2ba9d:	0f 85 94 05 00 00    	jne    2c037 <JS_CallInternal+0x6c67>
   2baa3:	48 8b 7a 30          	mov    0x30(%rdx),%rdi
   2baa7:	48 85 ff             	test   %rdi,%rdi
   2baaa:	0f 84 c0 19 00 00    	je     2d470 <JS_CallInternal+0x80a0>
   2bab0:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   2bab4:	e9 07 f4 ff ff       	jmp    2aec0 <JS_CallInternal+0x5af0>
   2bab9:	8b 16                	mov    (%rsi),%edx
   2babb:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bac1:	0f 85 e5 f4 ff ff    	jne    2afac <JS_CallInternal+0x5bdc>
   2bac7:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bacc:	0f 85 7b 06 00 00    	jne    2c14d <JS_CallInternal+0x6d7d>
   2bad2:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bad6:	4d 85 c0             	test   %r8,%r8
   2bad9:	0f 84 9d 19 00 00    	je     2d47c <JS_CallInternal+0x80ac>
   2badf:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2bae3:	e9 a8 f4 ff ff       	jmp    2af90 <JS_CallInternal+0x5bc0>
   2bae8:	8b b5 70 fe ff ff    	mov    -0x190(%rbp),%esi
   2baee:	41 39 f0             	cmp    %esi,%r8d
   2baf1:	41 89 f4             	mov    %esi,%r12d
   2baf4:	45 0f 4e e0          	cmovle %r8d,%r12d
   2baf8:	45 85 e4             	test   %r12d,%r12d
   2bafb:	0f 8e 89 16 00 00    	jle    2d18a <JS_CallInternal+0x7dba>
   2bb01:	89 85 90 fe ff ff    	mov    %eax,-0x170(%rbp)
   2bb07:	4d 63 ec             	movslq %r12d,%r13
   2bb0a:	4c 8b b5 60 fe ff ff 	mov    -0x1a0(%rbp),%r14
   2bb11:	31 f6                	xor    %esi,%esi
   2bb13:	49 c1 e5 04          	shl    $0x4,%r13
   2bb17:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2bb1e:	00 
   2bb1f:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bb26:	00 00 00 00 
   2bb2a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bb31:	00 00 00 00 
   2bb35:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bb3c:	00 00 00 00 
   2bb40:	49 8b 44 36 08       	mov    0x8(%r14,%rsi,1),%rax
   2bb45:	4d 8b 1c 36          	mov    (%r14,%rsi,1),%r11
   2bb49:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bb4c:	76 05                	jbe    2bb53 <JS_CallInternal+0x6783>
   2bb4e:	41 83 43 fc 01       	addl   $0x1,-0x4(%r11)
   2bb53:	4c 89 1c 37          	mov    %r11,(%rdi,%rsi,1)
   2bb57:	48 89 44 37 08       	mov    %rax,0x8(%rdi,%rsi,1)
   2bb5c:	48 83 c6 10          	add    $0x10,%rsi
   2bb60:	4c 39 ee             	cmp    %r13,%rsi
   2bb63:	75 db                	jne    2bb40 <JS_CallInternal+0x6770>
   2bb65:	8b 85 90 fe ff ff    	mov    -0x170(%rbp),%eax
   2bb6b:	45 39 e0             	cmp    %r12d,%r8d
   2bb6e:	7e 48                	jle    2bbb8 <JS_CallInternal+0x67e8>
   2bb70:	45 8d 58 ff          	lea    -0x1(%r8),%r11d
   2bb74:	4d 63 ec             	movslq %r12d,%r13
   2bb77:	45 29 e3             	sub    %r12d,%r11d
   2bb7a:	4c 89 ee             	mov    %r13,%rsi
   2bb7d:	4d 01 eb             	add    %r13,%r11
   2bb80:	48 c1 e6 04          	shl    $0x4,%rsi
   2bb84:	49 c1 e3 04          	shl    $0x4,%r11
   2bb88:	48 01 fe             	add    %rdi,%rsi
   2bb8b:	4e 8d 5c 1f 10       	lea    0x10(%rdi,%r11,1),%r11
   2bb90:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2bb95:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bb9c:	00 00 00 00 
   2bba0:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
   2bba7:	48 83 c6 10          	add    $0x10,%rsi
   2bbab:	48 c7 46 f8 03 00 00 	movq   $0x3,-0x8(%rsi)
   2bbb2:	00 
   2bbb3:	4c 39 de             	cmp    %r11,%rsi
   2bbb6:	75 e8                	jne    2bba0 <JS_CallInternal+0x67d0>
   2bbb8:	44 89 85 38 ff ff ff 	mov    %r8d,-0xc8(%rbp)
   2bbbf:	48 89 bd 50 fe ff ff 	mov    %rdi,-0x1b0(%rbp)
   2bbc6:	e9 db 99 ff ff       	jmp    255a6 <JS_CallInternal+0x1d6>
   2bbcb:	48 83 ec 08          	sub    $0x8,%rsp
   2bbcf:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   2bbd5:	49 89 d1             	mov    %rdx,%r9
   2bbd8:	48 89 c6             	mov    %rax,%rsi
   2bbdb:	44 89 95 d0 fd ff ff 	mov    %r10d,-0x230(%rbp)
   2bbe2:	4c 89 ef             	mov    %r13,%rdi
   2bbe5:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   2bbec:	6a 00                	push   $0x0
   2bbee:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2bbf5:	e8 a6 49 00 00       	call   305a0 <JS_GetPropertyInternal>
   2bbfa:	4c 89 ef             	mov    %r13,%rdi
   2bbfd:	48 89 c6             	mov    %rax,%rsi
   2bc00:	e8 5b 52 ff ff       	call   20e60 <JS_ToBoolFree>
   2bc05:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   2bc0c:	44 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10d
   2bc13:	41 8b 48 fc          	mov    -0x4(%r8),%ecx
   2bc17:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2bc1a:	85 d2                	test   %edx,%edx
   2bc1c:	41 89 50 fc          	mov    %edx,-0x4(%r8)
   2bc20:	41 5b                	pop    %r11
   2bc22:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   2bc29:	59                   	pop    %rcx
   2bc2a:	0f 8e a5 3c 00 00    	jle    2f8d5 <JS_CallInternal+0xa505>
   2bc30:	85 c0                	test   %eax,%eax
   2bc32:	0f 88 7f a3 ff ff    	js     25fb7 <JS_CallInternal+0xbe7>
   2bc38:	0f 84 5d 9b ff ff    	je     2579b <JS_CallInternal+0x3cb>
   2bc3e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2bc42:	48 83 eb 10          	sub    $0x10,%rbx
   2bc46:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bc49:	0f 86 e7 a0 ff ff    	jbe    25d36 <JS_CallInternal+0x966>
   2bc4f:	48 8b 0b             	mov    (%rbx),%rcx
   2bc52:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2bc55:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2bc58:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bc5b:	85 d2                	test   %edx,%edx
   2bc5d:	0f 8f d3 a0 ff ff    	jg     25d36 <JS_CallInternal+0x966>
   2bc63:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bc67:	48 89 c2             	mov    %rax,%rdx
   2bc6a:	48 89 ce             	mov    %rcx,%rsi
   2bc6d:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2bc74:	e8 a7 2c ff ff       	call   1e920 <__JS_FreeValueRT>
   2bc79:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2bc80:	e9 b1 a0 ff ff       	jmp    25d36 <JS_CallInternal+0x966>
   2bc85:	8b 95 d0 fd ff ff    	mov    -0x230(%rbp),%edx
   2bc8b:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2bc92:	4c 89 f9             	mov    %r15,%rcx
   2bc95:	48 8b b5 e0 fd ff ff 	mov    -0x220(%rbp),%rsi
   2bc9c:	4c 8b bd f8 fd ff ff 	mov    -0x208(%rbp),%r15
   2bca3:	83 c2 02             	add    $0x2,%edx
   2bca6:	49 83 c4 03          	add    $0x3,%r12
   2bcaa:	48 63 d2             	movslq %edx,%rdx
   2bcad:	48 c1 e2 04          	shl    $0x4,%rdx
   2bcb1:	48 29 d1             	sub    %rdx,%rcx
   2bcb4:	48 89 31             	mov    %rsi,(%rcx)
   2bcb7:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2bcbb:	48 89 41 08          	mov    %rax,0x8(%rcx)
   2bcbf:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bcc5:	49 89 c2             	mov    %rax,%r10
   2bcc8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bccc:	ff e0                	jmp    *%rax
   2bcce:	48 89 d9             	mov    %rbx,%rcx
   2bcd1:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   2bcd8:	4c 89 eb             	mov    %r13,%rbx
   2bcdb:	4d 89 c5             	mov    %r8,%r13
   2bcde:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2bce5:	48 39 8d 18 fe ff ff 	cmp    %rcx,-0x1e8(%rbp)
   2bcec:	0f 84 00 2c 00 00    	je     2e8f2 <JS_CallInternal+0x9522>
   2bcf2:	48 89 59 f8          	mov    %rbx,-0x8(%rcx)
   2bcf6:	49 83 c4 01          	add    $0x1,%r12
   2bcfa:	48 89 cb             	mov    %rcx,%rbx
   2bcfd:	4c 89 41 f0          	mov    %r8,-0x10(%rcx)
   2bd01:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bd07:	49 89 c2             	mov    %rax,%r10
   2bd0a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bd0e:	ff e0                	jmp    *%rax
   2bd10:	80 fa 01             	cmp    $0x1,%dl
   2bd13:	0f 84 cf 03 00 00    	je     2c0e8 <JS_CallInternal+0x6d18>
   2bd19:	80 cc 10             	or     $0x10,%ah
   2bd1c:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2bd20:	f3 0f 6f 7b f0       	movdqu -0x10(%rbx),%xmm7
   2bd25:	4c 89 ef             	mov    %r13,%rdi
   2bd28:	89 85 58 fd ff ff    	mov    %eax,-0x2a8(%rbp)
   2bd2e:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2bd32:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   2bd38:	0f 29 bd 60 fd ff ff 	movaps %xmm7,-0x2a0(%rbp)
   2bd3f:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2bd46:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2bd4b:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2bd52:	e8 a9 88 01 00       	call   44600 <js_get_function_name>
   2bd57:	4c 8d 05 e6 d3 0a 00 	lea    0xad3e6(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2bd5e:	48 8d 35 61 d8 0a 00 	lea    0xad861(%rip),%rsi        # d95c6 <_IO_stdin_used+0x5c6>
   2bd65:	4c 89 ef             	mov    %r13,%rdi
   2bd68:	48 89 d1             	mov    %rdx,%rcx
   2bd6b:	48 89 c2             	mov    %rax,%rdx
   2bd6e:	e8 ed 86 01 00       	call   44460 <JS_ConcatString3>
   2bd73:	49 89 c0             	mov    %rax,%r8
   2bd76:	49 89 d1             	mov    %rdx,%r9
   2bd79:	e9 ea a6 ff ff       	jmp    26468 <JS_CallInternal+0x1098>
   2bd7e:	4d 89 ec             	mov    %r13,%r12
   2bd81:	48 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%rbx
   2bd88:	4d 89 d5             	mov    %r10,%r13
   2bd8b:	4c 8b 95 b8 fd ff ff 	mov    -0x248(%rbp),%r10
   2bd92:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bd96:	4c 89 d6             	mov    %r10,%rsi
   2bd99:	e8 52 a2 fe ff       	call   15ff0 <__js_free>
   2bd9e:	83 bd f8 fd ff ff 06 	cmpl   $0x6,-0x208(%rbp)
   2bda5:	0f 84 45 18 00 00    	je     2d5f0 <JS_CallInternal+0x8220>
   2bdab:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2bdaf:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bdb2:	76 15                	jbe    2bdc9 <JS_CallInternal+0x69f9>
   2bdb4:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2bdb8:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2bdbb:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2bdbe:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bdc1:	85 d2                	test   %edx,%edx
   2bdc3:	0f 8e e4 2a 00 00    	jle    2e8ad <JS_CallInternal+0x94dd>
   2bdc9:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2bdd0:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2bdd4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bdd7:	76 14                	jbe    2bded <JS_CallInternal+0x6a1d>
   2bdd9:	48 8b 09             	mov    (%rcx),%rcx
   2bddc:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2bddf:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2bde2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bde5:	85 d2                	test   %edx,%edx
   2bde7:	0f 8e d4 2a 00 00    	jle    2e8c1 <JS_CallInternal+0x94f1>
   2bded:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2bdf4:	49 83 c4 03          	add    $0x3,%r12
   2bdf8:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2bdfc:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2be03:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2be07:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2be0d:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2be14:	49 89 c2             	mov    %rax,%r10
   2be17:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2be1b:	ff e0                	jmp    *%rax
   2be1d:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2be23:	4c 89 f9             	mov    %r15,%rcx
   2be26:	4c 8b a5 e0 fd ff ff 	mov    -0x220(%rbp),%r12
   2be2d:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2be34:	4c 8b bd d0 fd ff ff 	mov    -0x230(%rbp),%r15
   2be3b:	83 c0 02             	add    $0x2,%eax
   2be3e:	49 83 c4 03          	add    $0x3,%r12
   2be42:	48 98                	cltq
   2be44:	48 c1 e0 04          	shl    $0x4,%rax
   2be48:	48 29 c1             	sub    %rax,%rcx
   2be4b:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2be52:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2be56:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2be5a:	48 89 01             	mov    %rax,(%rcx)
   2be5d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2be63:	49 89 c2             	mov    %rax,%r10
   2be66:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2be6a:	ff e0                	jmp    *%rax
   2be6c:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2be72:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   2be79:	4c 89 f9             	mov    %r15,%rcx
   2be7c:	48 8b b5 e0 fd ff ff 	mov    -0x220(%rbp),%rsi
   2be83:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2be8a:	83 c0 01             	add    $0x1,%eax
   2be8d:	4c 8b bd c0 fd ff ff 	mov    -0x240(%rbp),%r15
   2be94:	49 83 c4 05          	add    $0x5,%r12
   2be98:	48 98                	cltq
   2be9a:	48 c1 e0 04          	shl    $0x4,%rax
   2be9e:	48 29 c1             	sub    %rax,%rcx
   2bea1:	48 89 31             	mov    %rsi,(%rcx)
   2bea4:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2bea8:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2beac:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2beb2:	49 89 c2             	mov    %rax,%r10
   2beb5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2beb9:	ff e0                	jmp    *%rax
   2bebb:	8b 10                	mov    (%rax),%edx
   2bebd:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bec3:	0f 85 78 b3 ff ff    	jne    27241 <JS_CallInternal+0x1e71>
   2bec9:	89 f2                	mov    %esi,%edx
   2becb:	b9 07 00 00 00       	mov    $0x7,%ecx
   2bed0:	4c 89 c6             	mov    %r8,%rsi
   2bed3:	4c 89 ef             	mov    %r13,%rdi
   2bed6:	e8 85 e7 01 00       	call   4a660 <add_property>
   2bedb:	48 85 c0             	test   %rax,%rax
   2bede:	0f 84 86 b3 ff ff    	je     2726a <JS_CallInternal+0x1e9a>
   2bee4:	48 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%rbx
   2beeb:	48 89 18             	mov    %rbx,(%rax)
   2beee:	48 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%rbx
   2bef5:	48 89 58 08          	mov    %rbx,0x8(%rax)
   2bef9:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2bf00:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2bf04:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bf07:	76 14                	jbe    2bf1d <JS_CallInternal+0x6b4d>
   2bf09:	48 8b 0b             	mov    (%rbx),%rcx
   2bf0c:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2bf0f:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2bf12:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bf15:	85 d2                	test   %edx,%edx
   2bf17:	0f 8e 35 2c 00 00    	jle    2eb52 <JS_CallInternal+0x9782>
   2bf1d:	41 0f b6 04 24       	movzbl (%r12),%eax
   2bf22:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2bf29:	49 83 c4 01          	add    $0x1,%r12
   2bf2d:	49 89 c2             	mov    %rax,%r10
   2bf30:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bf34:	ff e0                	jmp    *%rax
   2bf36:	ba 08 00 00 00       	mov    $0x8,%edx
   2bf3b:	e9 23 ed ff ff       	jmp    2ac63 <JS_CallInternal+0x5893>
   2bf40:	81 bd 00 fe ff ff f2 	cmpl   $0xf2,-0x200(%rbp)
   2bf47:	00 00 00 
   2bf4a:	0f 8f fe 11 00 00    	jg     2d14e <JS_CallInternal+0x7d7e>
   2bf50:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2bf54:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bf57:	0f 86 e3 a5 ff ff    	jbe    26540 <JS_CallInternal+0x1170>
   2bf5d:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2bf61:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2bf64:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2bf67:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2bf6a:	85 d2                	test   %edx,%edx
   2bf6c:	0f 8f ce a5 ff ff    	jg     26540 <JS_CallInternal+0x1170>
   2bf72:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bf76:	48 89 c2             	mov    %rax,%rdx
   2bf79:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2bf7f:	e8 9c 29 ff ff       	call   1e920 <__JS_FreeValueRT>
   2bf84:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2bf8a:	e9 b1 a5 ff ff       	jmp    26540 <JS_CallInternal+0x1170>
   2bf8f:	49 89 f9             	mov    %rdi,%r9
   2bf92:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2bf99:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2bfa0:	48 83 ec 08          	sub    $0x8,%rsp
   2bfa4:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2bfa8:	48 89 c2             	mov    %rax,%rdx
   2bfab:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2bfb2:	4c 89 c8             	mov    %r9,%rax
   2bfb5:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2bfb9:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2bfbd:	48 89 c6             	mov    %rax,%rsi
   2bfc0:	4c 89 ef             	mov    %r13,%rdi
   2bfc3:	6a 00                	push   $0x0
   2bfc5:	e8 d6 45 00 00       	call   305a0 <JS_GetPropertyInternal>
   2bfca:	5f                   	pop    %rdi
   2bfcb:	41 58                	pop    %r8
   2bfcd:	48 89 d1             	mov    %rdx,%rcx
   2bfd0:	83 fa 06             	cmp    $0x6,%edx
   2bfd3:	0f 85 32 ed ff ff    	jne    2ad0b <JS_CallInternal+0x593b>
   2bfd9:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2bfe0:	e9 1b 9c ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2bfe5:	49 89 f9             	mov    %rdi,%r9
   2bfe8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2bfef:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2bff6:	48 83 ec 08          	sub    $0x8,%rsp
   2bffa:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2bffe:	48 89 c2             	mov    %rax,%rdx
   2c001:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2c008:	4c 89 c8             	mov    %r9,%rax
   2c00b:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c00f:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2c013:	48 89 c6             	mov    %rax,%rsi
   2c016:	4c 89 ef             	mov    %r13,%rdi
   2c019:	6a 00                	push   $0x0
   2c01b:	e8 80 45 00 00       	call   305a0 <JS_GetPropertyInternal>
   2c020:	59                   	pop    %rcx
   2c021:	5e                   	pop    %rsi
   2c022:	83 fa 06             	cmp    $0x6,%edx
   2c025:	0f 85 80 f0 ff ff    	jne    2b0ab <JS_CallInternal+0x5cdb>
   2c02b:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2c032:	e9 c9 9b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c037:	48 c7 85 00 fe ff ff 	movq   $0xffffffffffffffff,-0x200(%rbp)
   2c03e:	ff ff ff ff 
   2c042:	49 89 fa             	mov    %rdi,%r10
   2c045:	48 83 ec 08          	sub    $0x8,%rsp
   2c049:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c04d:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c051:	4c 89 d6             	mov    %r10,%rsi
   2c054:	48 8b bd f8 fd ff ff 	mov    -0x208(%rbp),%rdi
   2c05b:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c062:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2c069:	48 89 78 30          	mov    %rdi,0x30(%rax)
   2c06d:	4c 89 ef             	mov    %r13,%rdi
   2c070:	6a 00                	push   $0x0
   2c072:	4c 89 da             	mov    %r11,%rdx
   2c075:	e8 26 45 00 00       	call   305a0 <JS_GetPropertyInternal>
   2c07a:	41 5a                	pop    %r10
   2c07c:	41 5b                	pop    %r11
   2c07e:	48 89 c1             	mov    %rax,%rcx
   2c081:	48 89 d0             	mov    %rdx,%rax
   2c084:	83 fa 06             	cmp    $0x6,%edx
   2c087:	0f 85 9e ee ff ff    	jne    2af2b <JS_CallInternal+0x5b5b>
   2c08d:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   2c094:	e9 67 9b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c099:	48 89 cf             	mov    %rcx,%rdi
   2c09c:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   2c0a3:	48 83 ec 08          	sub    $0x8,%rsp
   2c0a7:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c0ab:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c0af:	48 89 f2             	mov    %rsi,%rdx
   2c0b2:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c0b9:	48 89 fe             	mov    %rdi,%rsi
   2c0bc:	b9 32 00 00 00       	mov    $0x32,%ecx
   2c0c1:	4c 89 ef             	mov    %r13,%rdi
   2c0c4:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c0c8:	6a 00                	push   $0x0
   2c0ca:	e8 d1 44 00 00       	call   305a0 <JS_GetPropertyInternal>
   2c0cf:	41 5b                	pop    %r11
   2c0d1:	48 89 d1             	mov    %rdx,%rcx
   2c0d4:	5a                   	pop    %rdx
   2c0d5:	83 f9 06             	cmp    $0x6,%ecx
   2c0d8:	0f 85 2f c5 ff ff    	jne    2860d <JS_CallInternal+0x323d>
   2c0de:	e9 1d 9b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c0e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2c0e8:	80 cc 08             	or     $0x8,%ah
   2c0eb:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2c0ef:	f3 0f 6f 73 f0       	movdqu -0x10(%rbx),%xmm6
   2c0f4:	4c 89 ef             	mov    %r13,%rdi
   2c0f7:	89 85 58 fd ff ff    	mov    %eax,-0x2a8(%rbp)
   2c0fd:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2c101:	8b b5 00 fe ff ff    	mov    -0x200(%rbp),%esi
   2c107:	0f 29 b5 70 fd ff ff 	movaps %xmm6,-0x290(%rbp)
   2c10e:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2c115:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2c11a:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2c121:	e8 da 84 01 00       	call   44600 <js_get_function_name>
   2c126:	4c 8d 05 17 d0 0a 00 	lea    0xad017(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2c12d:	48 8d 35 8d d4 0a 00 	lea    0xad48d(%rip),%rsi        # d95c1 <_IO_stdin_used+0x5c1>
   2c134:	4c 89 ef             	mov    %r13,%rdi
   2c137:	48 89 d1             	mov    %rdx,%rcx
   2c13a:	48 89 c2             	mov    %rax,%rdx
   2c13d:	e8 1e 83 01 00       	call   44460 <JS_ConcatString3>
   2c142:	49 89 c0             	mov    %rax,%r8
   2c145:	49 89 d1             	mov    %rdx,%r9
   2c148:	e9 1b a3 ff ff       	jmp    26468 <JS_CallInternal+0x1098>
   2c14d:	4c 89 c0             	mov    %r8,%rax
   2c150:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   2c157:	48 83 ec 08          	sub    $0x8,%rsp
   2c15b:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c15f:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c163:	48 89 c6             	mov    %rax,%rsi
   2c166:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2c16d:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2c174:	48 89 57 30          	mov    %rdx,0x30(%rdi)
   2c178:	4c 89 ef             	mov    %r13,%rdi
   2c17b:	4c 89 da             	mov    %r11,%rdx
   2c17e:	6a 00                	push   $0x0
   2c180:	e8 1b 44 00 00       	call   305a0 <JS_GetPropertyInternal>
   2c185:	5e                   	pop    %rsi
   2c186:	5f                   	pop    %rdi
   2c187:	48 89 d1             	mov    %rdx,%rcx
   2c18a:	83 fa 06             	cmp    $0x6,%edx
   2c18d:	0f 84 09 2c 00 00    	je     2ed9c <JS_CallInternal+0x99cc>
   2c193:	49 89 c1             	mov    %rax,%r9
   2c196:	e9 56 ee ff ff       	jmp    2aff1 <JS_CallInternal+0x5c21>
   2c19b:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2c1a2:	e9 59 9a ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c1a7:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2c1ae:	4c 89 47 30          	mov    %r8,0x30(%rdi)
   2c1b2:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c1b5:	76 04                	jbe    2c1bb <JS_CallInternal+0x6deb>
   2c1b7:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c1bb:	48 89 95 b8 fe ff ff 	mov    %rdx,-0x148(%rbp)
   2c1c2:	4c 89 ef             	mov    %r13,%rdi
   2c1c5:	48 8d b5 c0 fe ff ff 	lea    -0x140(%rbp),%rsi
   2c1cc:	ba 8d 00 00 00       	mov    $0x8d,%edx
   2c1d1:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2c1d8:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2c1df:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
   2c1e6:	e8 b5 64 02 00       	call   526a0 <js_unary_arith_slow>
   2c1eb:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2c1f2:	85 c0                	test   %eax,%eax
   2c1f4:	0f 85 d9 42 00 00    	jne    304d3 <JS_CallInternal+0xb103>
   2c1fa:	48 8b b5 b0 fe ff ff 	mov    -0x150(%rbp),%rsi
   2c201:	48 8b 11             	mov    (%rcx),%rdx
   2c204:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2c208:	48 89 31             	mov    %rsi,(%rcx)
   2c20b:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c212:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2c216:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c219:	0f 86 f2 e8 ff ff    	jbe    2ab11 <JS_CallInternal+0x5741>
   2c21f:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c222:	83 e9 01             	sub    $0x1,%ecx
   2c225:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c228:	85 c9                	test   %ecx,%ecx
   2c22a:	0f 8f e1 e8 ff ff    	jg     2ab11 <JS_CallInternal+0x5741>
   2c230:	48 92                	xchg   %rax,%rdx
   2c232:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c236:	48 89 c6             	mov    %rax,%rsi
   2c239:	e8 e2 26 ff ff       	call   1e920 <__JS_FreeValueRT>
   2c23e:	e9 ce e8 ff ff       	jmp    2ab11 <JS_CallInternal+0x5741>
   2c243:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2c24a:	4c 89 47 30          	mov    %r8,0x30(%rdi)
   2c24e:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c251:	76 04                	jbe    2c257 <JS_CallInternal+0x6e87>
   2c253:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c257:	48 89 95 c8 fe ff ff 	mov    %rdx,-0x138(%rbp)
   2c25e:	4c 89 ef             	mov    %r13,%rdi
   2c261:	48 8d b5 d0 fe ff ff 	lea    -0x130(%rbp),%rsi
   2c268:	ba 8c 00 00 00       	mov    $0x8c,%edx
   2c26d:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2c274:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2c27b:	48 89 85 c0 fe ff ff 	mov    %rax,-0x140(%rbp)
   2c282:	e8 19 64 02 00       	call   526a0 <js_unary_arith_slow>
   2c287:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2c28e:	85 c0                	test   %eax,%eax
   2c290:	0f 85 57 42 00 00    	jne    304ed <JS_CallInternal+0xb11d>
   2c296:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2c29d:	48 8b 11             	mov    (%rcx),%rdx
   2c2a0:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2c2a4:	48 89 31             	mov    %rsi,(%rcx)
   2c2a7:	48 8b b5 c8 fe ff ff 	mov    -0x138(%rbp),%rsi
   2c2ae:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2c2b2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c2b5:	0f 86 ed b2 ff ff    	jbe    275a8 <JS_CallInternal+0x21d8>
   2c2bb:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c2be:	83 e9 01             	sub    $0x1,%ecx
   2c2c1:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c2c4:	85 c9                	test   %ecx,%ecx
   2c2c6:	0f 8f dc b2 ff ff    	jg     275a8 <JS_CallInternal+0x21d8>
   2c2cc:	48 92                	xchg   %rax,%rdx
   2c2ce:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c2d2:	48 89 c6             	mov    %rax,%rsi
   2c2d5:	e8 46 26 ff ff       	call   1e920 <__JS_FreeValueRT>
   2c2da:	e9 c9 b2 ff ff       	jmp    275a8 <JS_CallInternal+0x21d8>
   2c2df:	83 fa 08             	cmp    $0x8,%edx
   2c2e2:	0f 85 e5 0d 00 00    	jne    2d0cd <JS_CallInternal+0x7cfd>
   2c2e8:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2c2ed:	66 0f 57 05 eb a7 0b 	xorpd  0xba7eb(%rip),%xmm0        # e6ae0 <typed_array_size_log2+0x28>
   2c2f4:	00 
   2c2f5:	48 c7 43 f8 08 00 00 	movq   $0x8,-0x8(%rbx)
   2c2fc:	00 
   2c2fd:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2c302:	e9 a6 f0 ff ff       	jmp    2b3ad <JS_CallInternal+0x5fdd>
   2c307:	85 c0                	test   %eax,%eax
   2c309:	0f 84 70 a4 ff ff    	je     2677f <JS_CallInternal+0x13af>
   2c30f:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c313:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2c317:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c31c:	4c 89 ef             	mov    %r13,%rdi
   2c31f:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c326:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c32a:	e8 c1 79 01 00       	call   43cf0 <JS_ToStringInternal>
   2c32f:	48 89 d1             	mov    %rdx,%rcx
   2c332:	83 fa 06             	cmp    $0x6,%edx
   2c335:	0f 84 c5 98 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2c33b:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c33f:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c342:	76 15                	jbe    2c359 <JS_CallInternal+0x6f89>
   2c344:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c348:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2c34b:	83 ea 01             	sub    $0x1,%edx
   2c34e:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c351:	85 d2                	test   %edx,%edx
   2c353:	0f 8e ca 2d 00 00    	jle    2f123 <JS_CallInternal+0x9d53>
   2c359:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2c35d:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2c361:	e9 19 a4 ff ff       	jmp    2677f <JS_CallInternal+0x13af>
   2c366:	85 c9                	test   %ecx,%ecx
   2c368:	0f 85 9e 3c 00 00    	jne    3000c <JS_CallInternal+0xac3c>
   2c36e:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2c372:	4c 8d 73 e0          	lea    -0x20(%rbx),%r14
   2c376:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c379:	76 15                	jbe    2c390 <JS_CallInternal+0x6fc0>
   2c37b:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2c37f:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2c382:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2c385:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c388:	85 d2                	test   %edx,%edx
   2c38a:	0f 8e ca 2e 00 00    	jle    2f25a <JS_CallInternal+0x9e8a>
   2c390:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2c394:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2c398:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c39d:	4c 89 ef             	mov    %r13,%rdi
   2c3a0:	4c 89 f3             	mov    %r14,%rbx
   2c3a3:	e8 e8 8b 06 00       	call   94f90 <JS_IteratorClose>
   2c3a8:	e9 00 9a ff ff       	jmp    25dad <JS_CallInternal+0x9dd>
   2c3ad:	4c 89 95 08 fe ff ff 	mov    %r10,-0x1f8(%rbp)
   2c3b4:	48 8b 95 08 fe ff ff 	mov    -0x1f8(%rbp),%rdx
   2c3bb:	4c 89 ef             	mov    %r13,%rdi
   2c3be:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2c3c4:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2c3cb:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c3cf:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   2c3d6:	49 89 d0             	mov    %rdx,%r8
   2c3d9:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c3dd:	48 89 c1             	mov    %rax,%rcx
   2c3e0:	e8 cb 1d 01 00       	call   3e1b0 <JS_SetPrototypeInternal>
   2c3e5:	4c 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%r10
   2c3ec:	85 c0                	test   %eax,%eax
   2c3ee:	0f 89 e5 ac ff ff    	jns    270d9 <JS_CallInternal+0x1d09>
   2c3f4:	e9 07 98 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c3f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c400:	41 83 f8 08          	cmp    $0x8,%r8d
   2c404:	0f 85 7d 0c 00 00    	jne    2d087 <JS_CallInternal+0x7cb7>
   2c40a:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c40e:	66 49 0f 6e e1       	movq   %r9,%xmm4
   2c413:	31 c9                	xor    %ecx,%ecx
   2c415:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c419:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c41d:	0f 9b c1             	setnp  %cl
   2c420:	0f 45 ca             	cmovne %edx,%ecx
   2c423:	e9 52 ab ff ff       	jmp    26f7a <JS_CallInternal+0x1baa>
   2c428:	41 83 f8 08          	cmp    $0x8,%r8d
   2c42c:	0f 85 60 0d 00 00    	jne    2d192 <JS_CallInternal+0x7dc2>
   2c432:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c436:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c43b:	31 c0                	xor    %eax,%eax
   2c43d:	ba 00 00 00 00       	mov    $0x0,%edx
   2c442:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c446:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c44a:	0f 9b c0             	setnp  %al
   2c44d:	48 0f 45 c2          	cmovne %rdx,%rax
   2c451:	e9 d4 aa ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   2c456:	83 f9 08             	cmp    $0x8,%ecx
   2c459:	0f 85 c3 0b 00 00    	jne    2d022 <JS_CallInternal+0x7c52>
   2c45f:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c463:	66 49 0f 6e f9       	movq   %r9,%xmm7
   2c468:	45 31 c0             	xor    %r8d,%r8d
   2c46b:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c46f:	66 0f 2e c7          	ucomisd %xmm7,%xmm0
   2c473:	41 0f 9b c0          	setnp  %r8b
   2c477:	44 0f 45 c2          	cmovne %edx,%r8d
   2c47b:	e9 50 ab ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   2c480:	83 f9 08             	cmp    $0x8,%ecx
   2c483:	0f 85 3b 0d 00 00    	jne    2d1c4 <JS_CallInternal+0x7df4>
   2c489:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c48d:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c492:	31 c0                	xor    %eax,%eax
   2c494:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2c498:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c49c:	ba 01 00 00 00       	mov    $0x1,%edx
   2c4a1:	0f 9a c0             	setp   %al
   2c4a4:	48 0f 45 c2          	cmovne %rdx,%rax
   2c4a8:	e9 2d aa ff ff       	jmp    26eda <JS_CallInternal+0x1b0a>
   2c4ad:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c4b4:	44 89 d2             	mov    %r10d,%edx
   2c4b7:	48 89 de             	mov    %rbx,%rsi
   2c4ba:	4c 89 ef             	mov    %r13,%rdi
   2c4bd:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c4c1:	e8 da 61 02 00       	call   526a0 <js_unary_arith_slow>
   2c4c6:	85 c0                	test   %eax,%eax
   2c4c8:	0f 84 97 ee ff ff    	je     2b365 <JS_CallInternal+0x5f95>
   2c4ce:	e9 2d 97 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c4d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2c4d8:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2c4dc:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2c4e0:	f6 85 f8 fd ff ff 02 	testb  $0x2,-0x208(%rbp)
   2c4e7:	0f 84 14 0d 00 00    	je     2d201 <JS_CallInternal+0x7e31>
   2c4ed:	48 83 ec 08          	sub    $0x8,%rsp
   2c4f1:	45 31 c9             	xor    %r9d,%r9d
   2c4f4:	6a 00                	push   $0x0
   2c4f6:	4c 89 ef             	mov    %r13,%rdi
   2c4f9:	e8 12 40 00 00       	call   30510 <JS_CallFree>
   2c4fe:	41 59                	pop    %r9
   2c500:	41 5a                	pop    %r10
   2c502:	48 89 c1             	mov    %rax,%rcx
   2c505:	48 89 d0             	mov    %rdx,%rax
   2c508:	83 fa 06             	cmp    $0x6,%edx
   2c50b:	0f 84 3d 10 00 00    	je     2d54e <JS_CallInternal+0x817e>
   2c511:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c515:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c518:	76 15                	jbe    2c52f <JS_CallInternal+0x715f>
   2c51a:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c51e:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2c521:	83 ea 01             	sub    $0x1,%edx
   2c524:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c527:	85 d2                	test   %edx,%edx
   2c529:	0f 8e f1 2d 00 00    	jle    2f320 <JS_CallInternal+0x9f50>
   2c52f:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2c533:	31 c0                	xor    %eax,%eax
   2c535:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2c539:	e9 08 a7 ff ff       	jmp    26c46 <JS_CallInternal+0x1876>
   2c53e:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c545:	44 89 d2             	mov    %r10d,%edx
   2c548:	48 89 de             	mov    %rbx,%rsi
   2c54b:	4c 89 ef             	mov    %r13,%rdi
   2c54e:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c552:	e8 59 66 02 00       	call   52bb0 <js_post_inc_slow>
   2c557:	85 c0                	test   %eax,%eax
   2c559:	0f 84 f3 e5 ff ff    	je     2ab52 <JS_CallInternal+0x5782>
   2c55f:	e9 9c 96 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c564:	0f 1f 40 00          	nopl   0x0(%rax)
   2c568:	31 c9                	xor    %ecx,%ecx
   2c56a:	48 8b 33             	mov    (%rbx),%rsi
   2c56d:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2c570:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2c573:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c576:	85 d2                	test   %edx,%edx
   2c578:	0f 8e cd 15 00 00    	jle    2db4b <JS_CallInternal+0x877b>
   2c57e:	49 8b 40 08          	mov    0x8(%r8),%rax
   2c582:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c585:	76 14                	jbe    2c59b <JS_CallInternal+0x71cb>
   2c587:	49 8b 10             	mov    (%r8),%rdx
   2c58a:	8b 7a fc             	mov    -0x4(%rdx),%edi
   2c58d:	8d 77 ff             	lea    -0x1(%rdi),%esi
   2c590:	89 72 fc             	mov    %esi,-0x4(%rdx)
   2c593:	85 f6                	test   %esi,%esi
   2c595:	0f 8e e6 10 00 00    	jle    2d681 <JS_CallInternal+0x82b1>
   2c59b:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2c59e:	0f 85 db e4 ff ff    	jne    2aa7f <JS_CallInternal+0x56af>
   2c5a4:	e9 57 96 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c5a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c5b0:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c5b7:	44 89 d2             	mov    %r10d,%edx
   2c5ba:	48 89 de             	mov    %rbx,%rsi
   2c5bd:	4c 89 ef             	mov    %r13,%rdi
   2c5c0:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c5c4:	e8 d7 60 02 00       	call   526a0 <js_unary_arith_slow>
   2c5c9:	85 c0                	test   %eax,%eax
   2c5cb:	0f 84 25 cf ff ff    	je     294f6 <JS_CallInternal+0x4126>
   2c5d1:	e9 2a 96 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c5d6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2c5dd:	00 00 00 
   2c5e0:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c5e7:	44 89 d2             	mov    %r10d,%edx
   2c5ea:	48 89 de             	mov    %rbx,%rsi
   2c5ed:	4c 89 ef             	mov    %r13,%rdi
   2c5f0:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c5f4:	e8 b7 65 02 00       	call   52bb0 <js_post_inc_slow>
   2c5f9:	85 c0                	test   %eax,%eax
   2c5fb:	0f 84 b2 ce ff ff    	je     294b3 <JS_CallInternal+0x40e3>
   2c601:	e9 fa 95 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c606:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2c60d:	00 00 00 
   2c610:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c614:	48 89 ce             	mov    %rcx,%rsi
   2c617:	e8 04 23 ff ff       	call   1e920 <__JS_FreeValueRT>
   2c61c:	e9 da 9f ff ff       	jmp    265fb <JS_CallInternal+0x122b>
   2c621:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c625:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c629:	4c 89 ef             	mov    %r13,%rdi
   2c62c:	e8 ff ac 01 00       	call   47330 <JS_ValueToAtom>
   2c631:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2c637:	85 c0                	test   %eax,%eax
   2c639:	0f 84 c1 95 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2c63f:	4c 89 a5 f8 fd ff ff 	mov    %r12,-0x208(%rbp)
   2c646:	e9 3e 9d ff ff       	jmp    26389 <JS_CallInternal+0xfb9>
   2c64b:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2c652:	4c 03 4f 30          	add    0x30(%rdi),%r9
   2c656:	80 79 11 00          	cmpb   $0x0,0x11(%rcx)
   2c65a:	0f 84 b8 15 00 00    	je     2dc18 <JS_CallInternal+0x8848>
   2c660:	41 83 fa 3a          	cmp    $0x3a,%r10d
   2c664:	0f 84 d5 9a ff ff    	je     2613f <JS_CallInternal+0xd6f>
   2c66a:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2c671:	41 8b 71 04          	mov    0x4(%r9),%esi
   2c675:	4c 89 ef             	mov    %r13,%rdi
   2c678:	83 fa 04             	cmp    $0x4,%edx
   2c67b:	0f 84 13 3c 00 00    	je     30294 <JS_CallInternal+0xaec4>
   2c681:	e8 0a 92 00 00       	call   35890 <JS_ThrowTypeErrorReadOnly.part.0>
   2c686:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2c68d:	e9 6e 95 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c692:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2c698:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c69c:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2c6a1:	b8 08 00 00 00       	mov    $0x8,%eax
   2c6a6:	e9 66 b2 ff ff       	jmp    27911 <JS_CallInternal+0x2541>
   2c6ab:	48 89 ce             	mov    %rcx,%rsi
   2c6ae:	4c 89 ef             	mov    %r13,%rdi
   2c6b1:	4c 89 95 b8 fd ff ff 	mov    %r10,-0x248(%rbp)
   2c6b8:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2c6bf:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2c6c6:	4c 89 8d b0 fd ff ff 	mov    %r9,-0x250(%rbp)
   2c6cd:	e8 fe 11 01 00       	call   3d8d0 <expand_fast_array>
   2c6d2:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2c6d9:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2c6e0:	83 f8 ff             	cmp    $0xffffffff,%eax
   2c6e3:	4c 8b 95 b8 fd ff ff 	mov    -0x248(%rbp),%r10
   2c6ea:	4c 8b 8d b0 fd ff ff 	mov    -0x250(%rbp),%r9
   2c6f1:	0f 84 1d 2f 00 00    	je     2f614 <JS_CallInternal+0xa244>
   2c6f7:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2c6fd:	89 41 38             	mov    %eax,0x38(%rcx)
   2c700:	31 c0                	xor    %eax,%eax
   2c702:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2c709:	00 
   2c70a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2c711:	00 00 00 00 
   2c715:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2c71c:	00 00 00 00 
   2c720:	f3 41 0f 6f 04 00    	movdqu (%r8,%rax,1),%xmm0
   2c726:	48 8b 51 30          	mov    0x30(%rcx),%rdx
   2c72a:	0f 11 04 02          	movups %xmm0,(%rdx,%rax,1)
   2c72e:	48 83 c0 10          	add    $0x10,%rax
   2c732:	4c 39 c8             	cmp    %r9,%rax
   2c735:	75 e9                	jne    2c720 <JS_CallInternal+0x7350>
   2c737:	48 8b 51 20          	mov    0x20(%rcx),%rdx
   2c73b:	48 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%rbx
   2c742:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2c746:	48 8b 32             	mov    (%rdx),%rsi
   2c749:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
   2c750:	00 
   2c751:	48 89 1a             	mov    %rbx,(%rdx)
   2c754:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c757:	0f 86 5f a3 ff ff    	jbe    26abc <JS_CallInternal+0x16ec>
   2c75d:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2c760:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2c763:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c766:	85 d2                	test   %edx,%edx
   2c768:	0f 8f 4e a3 ff ff    	jg     26abc <JS_CallInternal+0x16ec>
   2c76e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c772:	48 89 c2             	mov    %rax,%rdx
   2c775:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2c77c:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2c783:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2c78a:	e8 91 21 ff ff       	call   1e920 <__JS_FreeValueRT>
   2c78f:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2c796:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2c79d:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2c7a4:	e9 13 a3 ff ff       	jmp    26abc <JS_CallInternal+0x16ec>
   2c7a9:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2c7b0:	49 89 d1             	mov    %rdx,%r9
   2c7b3:	49 89 f2             	mov    %rsi,%r10
   2c7b6:	48 89 ca             	mov    %rcx,%rdx
   2c7b9:	49 89 d0             	mov    %rdx,%r8
   2c7bc:	48 89 c1             	mov    %rax,%rcx
   2c7bf:	4c 89 ce             	mov    %r9,%rsi
   2c7c2:	4c 89 d2             	mov    %r10,%rdx
   2c7c5:	4c 89 67 30          	mov    %r12,0x30(%rdi)
   2c7c9:	4c 89 ef             	mov    %r13,%rdi
   2c7cc:	e8 0f 44 00 00       	call   30be0 <JS_GetPropertyValue>
   2c7d1:	48 89 c1             	mov    %rax,%rcx
   2c7d4:	48 89 d0             	mov    %rdx,%rax
   2c7d7:	83 fa 06             	cmp    $0x6,%edx
   2c7da:	0f 84 ef 31 00 00    	je     2f9cf <JS_CallInternal+0xa5ff>
   2c7e0:	48 89 ca             	mov    %rcx,%rdx
   2c7e3:	e9 c7 bb ff ff       	jmp    283af <JS_CallInternal+0x2fdf>
   2c7e8:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2c7ed:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2c7f2:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c7f7:	0f 85 8b ce ff ff    	jne    29688 <JS_CallInternal+0x42b8>
   2c7fd:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c801:	0f 85 81 ce ff ff    	jne    29688 <JS_CallInternal+0x42b8>
   2c807:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2c80b:	48 39 39             	cmp    %rdi,(%rcx)
   2c80e:	0f 85 74 ce ff ff    	jne    29688 <JS_CallInternal+0x42b8>
   2c814:	8b 51 10             	mov    0x10(%rcx),%edx
   2c817:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2c81b:	48 c1 e2 04          	shl    $0x4,%rdx
   2c81f:	48 03 50 20          	add    0x20(%rax),%rdx
   2c823:	48 89 d0             	mov    %rdx,%rax
   2c826:	48 8b 12             	mov    (%rdx),%rdx
   2c829:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c82d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c830:	76 04                	jbe    2c836 <JS_CallInternal+0x7466>
   2c832:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c836:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2c83a:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2c83f:	48 89 13             	mov    %rdx,(%rbx)
   2c842:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2c846:	0f b6 00             	movzbl (%rax),%eax
   2c849:	48 89 cb             	mov    %rcx,%rbx
   2c84c:	49 89 c2             	mov    %rax,%r10
   2c84f:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2c853:	8b 00                	mov    (%rax),%eax
   2c855:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2c85a:	0f 85 df 93 ff ff    	jne    25c3f <JS_CallInternal+0x86f>
   2c860:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c867:	48 83 ec 08          	sub    $0x8,%rsp
   2c86b:	31 c9                	xor    %ecx,%ecx
   2c86d:	45 31 c9             	xor    %r9d,%r9d
   2c870:	45 31 c0             	xor    %r8d,%r8d
   2c873:	4c 89 ef             	mov    %r13,%rdi
   2c876:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c87a:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   2c881:	48 8b b0 d8 04 00 00 	mov    0x4d8(%rax),%rsi
   2c888:	48 8b 90 e0 04 00 00 	mov    0x4e0(%rax),%rdx
   2c88f:	6a 00                	push   $0x0
   2c891:	e8 5a 6f 00 00       	call   337f0 <build_backtrace>
   2c896:	59                   	pop    %rcx
   2c897:	5e                   	pop    %rsi
   2c898:	e9 b4 93 ff ff       	jmp    25c51 <JS_CallInternal+0x881>
   2c89d:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2c8a2:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2c8a7:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c8ac:	0f 85 d2 c0 ff ff    	jne    28984 <JS_CallInternal+0x35b4>
   2c8b2:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c8b6:	0f 85 c8 c0 ff ff    	jne    28984 <JS_CallInternal+0x35b4>
   2c8bc:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2c8c0:	48 39 39             	cmp    %rdi,(%rcx)
   2c8c3:	0f 85 bb c0 ff ff    	jne    28984 <JS_CallInternal+0x35b4>
   2c8c9:	8b 51 10             	mov    0x10(%rcx),%edx
   2c8cc:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2c8d0:	48 c1 e2 04          	shl    $0x4,%rdx
   2c8d4:	48 03 50 20          	add    0x20(%rax),%rdx
   2c8d8:	48 89 d0             	mov    %rdx,%rax
   2c8db:	48 8b 12             	mov    (%rdx),%rdx
   2c8de:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c8e2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c8e5:	76 04                	jbe    2c8eb <JS_CallInternal+0x751b>
   2c8e7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c8eb:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2c8ef:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2c8f4:	48 89 13             	mov    %rdx,(%rbx)
   2c8f7:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2c8fb:	0f b6 00             	movzbl (%rax),%eax
   2c8fe:	48 89 cb             	mov    %rcx,%rbx
   2c901:	49 89 c2             	mov    %rax,%r10
   2c904:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2c908:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2c90f:	00 
   2c910:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2c917:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2c91e:	00 
   2c91f:	e9 96 e1 ff ff       	jmp    2aaba <JS_CallInternal+0x56ea>
   2c924:	8b b5 e4 fe ff ff    	mov    -0x11c(%rbp),%esi
   2c92a:	31 ff                	xor    %edi,%edi
   2c92c:	e9 be e4 ff ff       	jmp    2adef <JS_CallInternal+0x5a1f>
   2c931:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c938:	49 89 f0             	mov    %rsi,%r8
   2c93b:	4c 89 d2             	mov    %r10,%rdx
   2c93e:	4c 89 ce             	mov    %r9,%rsi
   2c941:	4c 89 ef             	mov    %r13,%rdi
   2c944:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2c94b:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c94f:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2c956:	e8 85 42 00 00       	call   30be0 <JS_GetPropertyValue>
   2c95b:	48 89 c1             	mov    %rax,%rcx
   2c95e:	48 89 d0             	mov    %rdx,%rax
   2c961:	83 fa 06             	cmp    $0x6,%edx
   2c964:	0f 84 99 36 00 00    	je     30003 <JS_CallInternal+0xac33>
   2c96a:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2c971:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   2c978:	e9 a7 b9 ff ff       	jmp    28324 <JS_CallInternal+0x2f54>
   2c97d:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2c984:	48 8d 7b f0          	lea    -0x10(%rbx),%rdi
   2c988:	41 b9 00 80 00 00    	mov    $0x8000,%r9d
   2c98e:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c992:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2c996:	48 8b 08             	mov    (%rax),%rcx
   2c999:	48 83 eb 30          	sub    $0x30,%rbx
   2c99d:	48 8b 33             	mov    (%rbx),%rsi
   2c9a0:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2c9a4:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   2c9a8:	ff 77 08             	push   0x8(%rdi)
   2c9ab:	ff 37                	push   (%rdi)
   2c9ad:	4c 89 ef             	mov    %r13,%rdi
   2c9b0:	e8 eb 55 00 00       	call   31fa0 <JS_SetPropertyValue>
   2c9b5:	48 8b 73 08          	mov    0x8(%rbx),%rsi
   2c9b9:	41 5a                	pop    %r10
   2c9bb:	41 5b                	pop    %r11
   2c9bd:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c9c0:	76 14                	jbe    2c9d6 <JS_CallInternal+0x7606>
   2c9c2:	48 8b 0b             	mov    (%rbx),%rcx
   2c9c5:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2c9c8:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2c9cb:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c9ce:	85 d2                	test   %edx,%edx
   2c9d0:	0f 8e 78 2b 00 00    	jle    2f54e <JS_CallInternal+0xa17e>
   2c9d6:	85 c0                	test   %eax,%eax
   2c9d8:	0f 89 e4 b4 ff ff    	jns    27ec2 <JS_CallInternal+0x2af2>
   2c9de:	e9 1d 92 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2c9e3:	48 89 c6             	mov    %rax,%rsi
   2c9e6:	4c 89 ef             	mov    %r13,%rdi
   2c9e9:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2c9f0:	e8 6b 44 ff ff       	call   20e60 <JS_ToBoolFree>
   2c9f5:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2c9fc:	e9 dd ab ff ff       	jmp    275de <JS_CallInternal+0x220e>
   2ca01:	48 89 c6             	mov    %rax,%rsi
   2ca04:	4c 89 ef             	mov    %r13,%rdi
   2ca07:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2ca0e:	e8 4d 44 ff ff       	call   20e60 <JS_ToBoolFree>
   2ca13:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ca1a:	e9 6b ac ff ff       	jmp    2768a <JS_CallInternal+0x22ba>
   2ca1f:	48 89 c6             	mov    %rax,%rsi
   2ca22:	4c 89 ef             	mov    %r13,%rdi
   2ca25:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2ca2c:	e8 2f 44 ff ff       	call   20e60 <JS_ToBoolFree>
   2ca31:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ca38:	e9 f7 ab ff ff       	jmp    27634 <JS_CallInternal+0x2264>
   2ca3d:	48 89 c6             	mov    %rax,%rsi
   2ca40:	4c 89 ef             	mov    %r13,%rdi
   2ca43:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2ca4a:	e8 11 44 ff ff       	call   20e60 <JS_ToBoolFree>
   2ca4f:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ca56:	e9 84 ac ff ff       	jmp    276df <JS_CallInternal+0x230f>
   2ca5b:	48 92                	xchg   %rax,%rdx
   2ca5d:	4c 89 ef             	mov    %r13,%rdi
   2ca60:	48 89 c6             	mov    %rax,%rsi
   2ca63:	e8 f8 43 ff ff       	call   20e60 <JS_ToBoolFree>
   2ca68:	e9 3f a1 ff ff       	jmp    26bac <JS_CallInternal+0x17dc>
   2ca6d:	8b 10                	mov    (%rax),%edx
   2ca6f:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2ca75:	0f 85 c4 b9 ff ff    	jne    2843f <JS_CallInternal+0x306f>
   2ca7b:	48 8b bd 00 fe ff ff 	mov    -0x200(%rbp),%rdi
   2ca82:	48 83 ec 08          	sub    $0x8,%rsp
   2ca86:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2ca8d:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2ca94:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2ca98:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2ca9c:	4c 89 da             	mov    %r11,%rdx
   2ca9f:	4c 89 d6             	mov    %r10,%rsi
   2caa2:	48 89 78 30          	mov    %rdi,0x30(%rax)
   2caa6:	4c 89 ef             	mov    %r13,%rdi
   2caa9:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2cab0:	68 00 80 00 00       	push   $0x8000
   2cab5:	41 53                	push   %r11
   2cab7:	41 52                	push   %r10
   2cab9:	e8 32 48 00 00       	call   312f0 <JS_SetPropertyInternal>
   2cabe:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2cac5:	48 83 c4 20          	add    $0x20,%rsp
   2cac9:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2cacd:	76 1a                	jbe    2cae9 <JS_CallInternal+0x7719>
   2cacf:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2cad6:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   2cada:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2cadd:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   2cae1:	85 d2                	test   %edx,%edx
   2cae3:	0f 8e db 28 00 00    	jle    2f3c4 <JS_CallInternal+0x9ff4>
   2cae9:	48 83 eb 20          	sub    $0x20,%rbx
   2caed:	85 c0                	test   %eax,%eax
   2caef:	0f 89 be b9 ff ff    	jns    284b3 <JS_CallInternal+0x30e3>
   2caf5:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2cafc:	e9 ff 90 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2cb01:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2cb08:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2cb0f:	4c 89 d1             	mov    %r10,%rcx
   2cb12:	4d 89 c8             	mov    %r9,%r8
   2cb15:	4c 89 ef             	mov    %r13,%rdi
   2cb18:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2cb1f:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   2cb26:	48 89 c6             	mov    %rax,%rsi
   2cb29:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2cb30:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2cb37:	e8 b4 7d 00 00       	call   348f0 <JS_CheckBrand>
   2cb3c:	83 f8 ff             	cmp    $0xffffffff,%eax
   2cb3f:	0f 84 bb 90 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2cb45:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2cb4c:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2cb53:	48 98                	cltq
   2cb55:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   2cb5c:	e9 d2 a1 ff ff       	jmp    26d33 <JS_CallInternal+0x1963>
   2cb61:	48 03 85 68 fe ff ff 	add    -0x198(%rbp),%rax
   2cb68:	48 8b 30             	mov    (%rax),%rsi
   2cb6b:	48 8b 78 08          	mov    0x8(%rax),%rdi
   2cb6f:	e9 7b e2 ff ff       	jmp    2adef <JS_CallInternal+0x5a1f>
   2cb74:	31 c9                	xor    %ecx,%ecx
   2cb76:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cb7c:	e9 af c7 ff ff       	jmp    29330 <JS_CallInternal+0x3f60>
   2cb81:	31 c9                	xor    %ecx,%ecx
   2cb83:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cb89:	e9 32 c6 ff ff       	jmp    291c0 <JS_CallInternal+0x3df0>
   2cb8e:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   2cb95:	45 89 d9             	mov    %r11d,%r9d
   2cb98:	31 c9                	xor    %ecx,%ecx
   2cb9a:	4c 89 ef             	mov    %r13,%rdi
   2cb9d:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2cba4:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cbaa:	48 c7 85 30 fd ff ff 	movq   $0x0,-0x2d0(%rbp)
   2cbb1:	00 00 00 00 
   2cbb5:	48 c7 85 38 fd ff ff 	movq   $0x3,-0x2c8(%rbp)
   2cbbc:	03 00 00 00 
   2cbc0:	6a 02                	push   $0x2
   2cbc2:	41 52                	push   %r10
   2cbc4:	4c 89 95 b8 fd ff ff 	mov    %r10,-0x248(%rbp)
   2cbcb:	ff b5 38 fd ff ff    	push   -0x2c8(%rbp)
   2cbd1:	ff b5 30 fd ff ff    	push   -0x2d0(%rbp)
   2cbd7:	44 89 9d e0 fd ff ff 	mov    %r11d,-0x220(%rbp)
   2cbde:	e8 ed 87 ff ff       	call   253d0 <JS_CallInternal>
   2cbe3:	4c 8b 95 b8 fd ff ff 	mov    -0x248(%rbp),%r10
   2cbea:	44 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11d
   2cbf1:	48 83 c4 20          	add    $0x20,%rsp
   2cbf5:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2cbfc:	48 89 95 f8 fd ff ff 	mov    %rdx,-0x208(%rbp)
   2cc03:	e9 00 c6 ff ff       	jmp    29208 <JS_CallInternal+0x3e38>
   2cc08:	48 c7 85 20 fd ff ff 	movq   $0x0,-0x2e0(%rbp)
   2cc0f:	00 00 00 00 
   2cc13:	48 8b b5 b8 fd ff ff 	mov    -0x248(%rbp),%rsi
   2cc1a:	31 c9                	xor    %ecx,%ecx
   2cc1c:	4c 89 ef             	mov    %r13,%rdi
   2cc1f:	44 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9d
   2cc26:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   2cc2d:	48 c7 85 28 fd ff ff 	movq   $0x3,-0x2d8(%rbp)
   2cc34:	03 00 00 00 
   2cc38:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cc3e:	6a 00                	push   $0x0
   2cc40:	41 52                	push   %r10
   2cc42:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   2cc49:	ff b5 28 fd ff ff    	push   -0x2d8(%rbp)
   2cc4f:	ff b5 20 fd ff ff    	push   -0x2e0(%rbp)
   2cc55:	e8 76 87 ff ff       	call   253d0 <JS_CallInternal>
   2cc5a:	4c 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%r10
   2cc61:	48 83 c4 20          	add    $0x20,%rsp
   2cc65:	48 89 c6             	mov    %rax,%rsi
   2cc68:	e9 f0 c6 ff ff       	jmp    2935d <JS_CallInternal+0x3f8d>
   2cc6d:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2cc74:	48 89 de             	mov    %rbx,%rsi
   2cc77:	4c 89 ef             	mov    %r13,%rdi
   2cc7a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cc7e:	e8 ad 5f 02 00       	call   52c30 <js_not_slow>
   2cc83:	85 c0                	test   %eax,%eax
   2cc85:	0f 84 ca a8 ff ff    	je     27555 <JS_CallInternal+0x2185>
   2cc8b:	e9 70 8f ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2cc90:	83 f9 fa             	cmp    $0xfffffffa,%ecx
   2cc93:	0f 8d a8 28 00 00    	jge    2f541 <JS_CallInternal+0xa171>
   2cc99:	83 f9 f8             	cmp    $0xfffffff8,%ecx
   2cc9c:	7d 61                	jge    2ccff <JS_CallInternal+0x792f>
   2cc9e:	83 e8 02             	sub    $0x2,%eax
   2cca1:	83 f8 01             	cmp    $0x1,%eax
   2cca4:	0f 86 79 2f 00 00    	jbe    2fc23 <JS_CallInternal+0xa853>
   2ccaa:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2ccae:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2ccb2:	b9 01 00 00 00       	mov    $0x1,%ecx
   2ccb7:	4c 89 ef             	mov    %r13,%rdi
   2ccba:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2ccc1:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ccc5:	e8 26 70 01 00       	call   43cf0 <JS_ToStringInternal>
   2ccca:	49 89 d0             	mov    %rdx,%r8
   2cccd:	48 89 d1             	mov    %rdx,%rcx
   2ccd0:	83 fa 06             	cmp    $0x6,%edx
   2ccd3:	0f 84 27 8f ff ff    	je     25c00 <JS_CallInternal+0x830>
   2ccd9:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2ccdd:	83 fe f6             	cmp    $0xfffffff6,%esi
   2cce0:	76 15                	jbe    2ccf7 <JS_CallInternal+0x7927>
   2cce2:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2cce6:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2cce9:	83 ea 01             	sub    $0x1,%edx
   2ccec:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2ccef:	85 d2                	test   %edx,%edx
   2ccf1:	0f 8e 42 2f 00 00    	jle    2fc39 <JS_CallInternal+0xa869>
   2ccf7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ccfb:	4c 89 43 f8          	mov    %r8,-0x8(%rbx)
   2ccff:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2cd06:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cd0a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2cd0e:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2cd11:	76 04                	jbe    2cd17 <JS_CallInternal+0x7947>
   2cd13:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2cd17:	48 89 ca             	mov    %rcx,%rdx
   2cd1a:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2cd1e:	48 89 c1             	mov    %rax,%rcx
   2cd21:	4c 89 ef             	mov    %r13,%rdi
   2cd24:	49 89 d0             	mov    %rdx,%r8
   2cd27:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2cd2b:	e8 b0 3e 00 00       	call   30be0 <JS_GetPropertyValue>
   2cd30:	48 89 c1             	mov    %rax,%rcx
   2cd33:	48 89 d0             	mov    %rdx,%rax
   2cd36:	83 fa 06             	cmp    $0x6,%edx
   2cd39:	0f 84 c1 8e ff ff    	je     25c00 <JS_CallInternal+0x830>
   2cd3f:	48 89 ca             	mov    %rcx,%rdx
   2cd42:	e9 69 b5 ff ff       	jmp    282b0 <JS_CallInternal+0x2ee0>
   2cd47:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cd4b:	89 c8                	mov    %ecx,%eax
   2cd4d:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2cd54:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2cd58:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cd5b:	83 e8 01             	sub    $0x1,%eax
   2cd5e:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cd61:	85 c0                	test   %eax,%eax
   2cd63:	0f 8f 6e b4 ff ff    	jg     281d7 <JS_CallInternal+0x2e07>
   2cd69:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2cd70:	e8 2b 9c fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cd75:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2cd7c:	e9 56 b4 ff ff       	jmp    281d7 <JS_CallInternal+0x2e07>
   2cd81:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cd85:	89 c8                	mov    %ecx,%eax
   2cd87:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2cd8e:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2cd92:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cd95:	83 e8 01             	sub    $0x1,%eax
   2cd98:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cd9b:	85 c0                	test   %eax,%eax
   2cd9d:	0f 8f d1 b1 ff ff    	jg     27f74 <JS_CallInternal+0x2ba4>
   2cda3:	4c 89 9d c0 fd ff ff 	mov    %r11,-0x240(%rbp)
   2cdaa:	e8 f1 9b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cdaf:	4c 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%r11
   2cdb6:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2cdbd:	e9 b2 b1 ff ff       	jmp    27f74 <JS_CallInternal+0x2ba4>
   2cdc2:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2cdc6:	0f 85 b6 e1 ff ff    	jne    2af82 <JS_CallInternal+0x5bb2>
   2cdcc:	49 39 3a             	cmp    %rdi,(%r10)
   2cdcf:	0f 85 ad e1 ff ff    	jne    2af82 <JS_CallInternal+0x5bb2>
   2cdd5:	41 8b 52 10          	mov    0x10(%r10),%edx
   2cdd9:	83 fa ff             	cmp    $0xffffffff,%edx
   2cddc:	0f 84 a0 e1 ff ff    	je     2af82 <JS_CallInternal+0x5bb2>
   2cde2:	48 c1 e2 04          	shl    $0x4,%rdx
   2cde6:	48 03 50 20          	add    0x20(%rax),%rdx
   2cdea:	48 89 d0             	mov    %rdx,%rax
   2cded:	48 8b 12             	mov    (%rdx),%rdx
   2cdf0:	48 8b 48 08          	mov    0x8(%rax),%rcx
   2cdf4:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2cdf7:	76 04                	jbe    2cdfd <JS_CallInternal+0x7a2d>
   2cdf9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cdfd:	49 89 d1             	mov    %rdx,%r9
   2ce00:	e9 ec e1 ff ff       	jmp    2aff1 <JS_CallInternal+0x5c21>
   2ce05:	0f 1f 00             	nopl   (%rax)
   2ce08:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2ce0d:	0f 85 96 e0 ff ff    	jne    2aea9 <JS_CallInternal+0x5ad9>
   2ce13:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2ce17:	49 8b 11             	mov    (%r9),%rdx
   2ce1a:	48 85 c9             	test   %rcx,%rcx
   2ce1d:	0f 84 91 27 00 00    	je     2f5b4 <JS_CallInternal+0xa1e4>
   2ce23:	49 8b 43 30          	mov    0x30(%r11),%rax
   2ce27:	4c 39 da             	cmp    %r11,%rdx
   2ce2a:	0f 85 79 e0 ff ff    	jne    2aea9 <JS_CallInternal+0x5ad9>
   2ce30:	48 85 c0             	test   %rax,%rax
   2ce33:	0f 84 70 e0 ff ff    	je     2aea9 <JS_CallInternal+0x5ad9>
   2ce39:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2ce3e:	0f 85 65 e0 ff ff    	jne    2aea9 <JS_CallInternal+0x5ad9>
   2ce44:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2ce48:	0f 85 5b e0 ff ff    	jne    2aea9 <JS_CallInternal+0x5ad9>
   2ce4e:	48 3b 48 18          	cmp    0x18(%rax),%rcx
   2ce52:	0f 85 51 e0 ff ff    	jne    2aea9 <JS_CallInternal+0x5ad9>
   2ce58:	41 8b 51 10          	mov    0x10(%r9),%edx
   2ce5c:	48 c1 e2 04          	shl    $0x4,%rdx
   2ce60:	48 03 50 20          	add    0x20(%rax),%rdx
   2ce64:	48 89 d0             	mov    %rdx,%rax
   2ce67:	48 8b 12             	mov    (%rdx),%rdx
   2ce6a:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ce6e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ce71:	76 04                	jbe    2ce77 <JS_CallInternal+0x7aa7>
   2ce73:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2ce77:	48 89 d1             	mov    %rdx,%rcx
   2ce7a:	e9 ac e0 ff ff       	jmp    2af2b <JS_CallInternal+0x5b5b>
   2ce7f:	90                   	nop
   2ce80:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ce84:	44 89 c8             	mov    %r9d,%eax
   2ce87:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2ce8e:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2ce92:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2ce95:	83 e8 01             	sub    $0x1,%eax
   2ce98:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2ce9b:	85 c0                	test   %eax,%eax
   2ce9d:	0f 8f 53 9a ff ff    	jg     268f6 <JS_CallInternal+0x1526>
   2cea3:	89 8d c0 fd ff ff    	mov    %ecx,-0x240(%rbp)
   2cea9:	e8 f2 9a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2ceae:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   2ceb4:	e9 3d 9a ff ff       	jmp    268f6 <JS_CallInternal+0x1526>
   2ceb9:	8b 30                	mov    (%rax),%esi
   2cebb:	81 e6 ff ff ff 03    	and    $0x3ffffff,%esi
   2cec1:	0f 85 72 99 ff ff    	jne    26839 <JS_CallInternal+0x1469>
   2cec7:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2cece:	4c 89 ef             	mov    %r13,%rdi
   2ced1:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2ced8:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2cedf:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2cee5:	e8 76 37 04 00       	call   70660 <JS_HasProperty>
   2ceea:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   2cef1:	85 c0                	test   %eax,%eax
   2cef3:	0f 88 ac 33 00 00    	js     302a5 <JS_CallInternal+0xaed5>
   2cef9:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2ceff:	b8 01 00 00 00       	mov    $0x1,%eax
   2cf04:	0f 84 42 99 ff ff    	je     2684c <JS_CallInternal+0x147c>
   2cf0a:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2cf11:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2cf18:	45 31 c0             	xor    %r8d,%r8d
   2cf1b:	4c 89 ef             	mov    %r13,%rdi
   2cf1e:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2cf25:	e8 46 14 02 00       	call   4e370 <JS_DeleteProperty>
   2cf2a:	85 c0                	test   %eax,%eax
   2cf2c:	0f 88 ba 2d 00 00    	js     2fcec <JS_CallInternal+0xa91c>
   2cf32:	0f 95 c0             	setne  %al
   2cf35:	0f b6 c0             	movzbl %al,%eax
   2cf38:	e9 0f 99 ff ff       	jmp    2684c <JS_CallInternal+0x147c>
   2cf3d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cf41:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2cf48:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2cf4c:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cf4f:	83 e8 01             	sub    $0x1,%eax
   2cf52:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cf55:	85 c0                	test   %eax,%eax
   2cf57:	0f 8f ce 9e ff ff    	jg     26e2b <JS_CallInternal+0x1a5b>
   2cf5d:	44 89 85 c0 fd ff ff 	mov    %r8d,-0x240(%rbp)
   2cf64:	e8 37 9a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cf69:	44 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8d
   2cf70:	e9 b6 9e ff ff       	jmp    26e2b <JS_CallInternal+0x1a5b>
   2cf75:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cf79:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2cf80:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2cf84:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cf87:	83 e8 01             	sub    $0x1,%eax
   2cf8a:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cf8d:	85 c0                	test   %eax,%eax
   2cf8f:	0f 8f 46 ae ff ff    	jg     27ddb <JS_CallInternal+0x2a0b>
   2cf95:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2cf9c:	e8 ff 99 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cfa1:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2cfa8:	e9 2e ae ff ff       	jmp    27ddb <JS_CallInternal+0x2a0b>
   2cfad:	48 8d 35 95 c5 0a 00 	lea    0xac595(%rip),%rsi        # d9549 <_IO_stdin_used+0x549>
   2cfb4:	4c 89 ef             	mov    %r13,%rdi
   2cfb7:	31 c0                	xor    %eax,%eax
   2cfb9:	e8 82 75 00 00       	call   34540 <JS_ThrowTypeError>
   2cfbe:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2cfc5:	4c 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9
   2cfcc:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2cfcf:	76 1e                	jbe    2cfef <JS_CallInternal+0x7c1f>
   2cfd1:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2cfd8:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2cfdb:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2cfe1:	83 e8 01             	sub    $0x1,%eax
   2cfe4:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2cfe7:	85 c0                	test   %eax,%eax
   2cfe9:	0f 8e 84 28 00 00    	jle    2f873 <JS_CallInternal+0xa4a3>
   2cfef:	83 bd e0 fd ff ff f6 	cmpl   $0xfffffff6,-0x220(%rbp)
   2cff6:	76 1e                	jbe    2d016 <JS_CallInternal+0x7c46>
   2cff8:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2cfff:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2d002:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%rbp)
   2d008:	83 e8 01             	sub    $0x1,%eax
   2d00b:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2d00e:	85 c0                	test   %eax,%eax
   2d010:	0f 8e 7d 2e 00 00    	jle    2fe93 <JS_CallInternal+0xaac3>
   2d016:	ba 06 00 00 00       	mov    $0x6,%edx
   2d01b:	31 c0                	xor    %eax,%eax
   2d01d:	e9 b9 c0 ff ff       	jmp    290db <JS_CallInternal+0x3d0b>
   2d022:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2d029:	31 d2                	xor    %edx,%edx
   2d02b:	48 89 de             	mov    %rbx,%rsi
   2d02e:	4c 89 ef             	mov    %r13,%rdi
   2d031:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d035:	e8 d6 01 03 00       	call   5d210 <js_eq_slow>
   2d03a:	85 c0                	test   %eax,%eax
   2d03c:	0f 84 9d 9f ff ff    	je     26fdf <JS_CallInternal+0x1c0f>
   2d042:	e9 b9 8b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d047:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2d04e:	00 00 
   2d050:	48 89 fe             	mov    %rdi,%rsi
   2d053:	48 8b 95 90 fe ff ff 	mov    -0x170(%rbp),%rdx
   2d05a:	48 8b bd 78 fe ff ff 	mov    -0x188(%rbp),%rdi
   2d061:	48 89 8d 70 fe ff ff 	mov    %rcx,-0x190(%rbp)
   2d068:	48 89 85 98 fe ff ff 	mov    %rax,-0x168(%rbp)
   2d06f:	e8 4c 57 ff ff       	call   227c0 <close_var_refs>
   2d074:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2d07b:	48 8b 85 98 fe ff ff 	mov    -0x168(%rbp),%rax
   2d082:	e9 df 8a ff ff       	jmp    25b66 <JS_CallInternal+0x796>
   2d087:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2d08e:	ba 01 00 00 00       	mov    $0x1,%edx
   2d093:	48 89 de             	mov    %rbx,%rsi
   2d096:	4c 89 ef             	mov    %r13,%rdi
   2d099:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d09d:	e8 6e 01 03 00       	call   5d210 <js_eq_slow>
   2d0a2:	85 c0                	test   %eax,%eax
   2d0a4:	0f 84 e2 9e ff ff    	je     26f8c <JS_CallInternal+0x1bbc>
   2d0aa:	e9 51 8b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d0af:	90                   	nop
   2d0b0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d0b4:	48 89 c2             	mov    %rax,%rdx
   2d0b7:	89 8d d0 fd ff ff    	mov    %ecx,-0x230(%rbp)
   2d0bd:	e8 5e 18 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d0c2:	8b 8d d0 fd ff ff    	mov    -0x230(%rbp),%ecx
   2d0c8:	e9 66 94 ff ff       	jmp    26533 <JS_CallInternal+0x1163>
   2d0cd:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2d0d4:	44 89 d2             	mov    %r10d,%edx
   2d0d7:	48 89 de             	mov    %rbx,%rsi
   2d0da:	4c 89 ef             	mov    %r13,%rdi
   2d0dd:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d0e1:	e8 ba 55 02 00       	call   526a0 <js_unary_arith_slow>
   2d0e6:	85 c0                	test   %eax,%eax
   2d0e8:	0f 84 bf e2 ff ff    	je     2b3ad <JS_CallInternal+0x5fdd>
   2d0ee:	e9 0d 8b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d0f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d0f8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d0fc:	89 c8                	mov    %ecx,%eax
   2d0fe:	48 8b b7 48 04 00 00 	mov    0x448(%rdi),%rsi
   2d105:	48 8b 34 c6          	mov    (%rsi,%rax,8),%rsi
   2d109:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d10c:	83 e8 01             	sub    $0x1,%eax
   2d10f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d112:	85 c0                	test   %eax,%eax
   2d114:	0f 8f 8b af ff ff    	jg     280a5 <JS_CallInternal+0x2cd5>
   2d11a:	4c 89 8d e0 fd ff ff 	mov    %r9,-0x220(%rbp)
   2d121:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2d128:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2d12f:	e8 6c 98 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d134:	4c 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%r9
   2d13b:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   2d142:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2d149:	e9 57 af ff ff       	jmp    280a5 <JS_CallInternal+0x2cd5>
   2d14e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d152:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2d158:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2d15f:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2d163:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d166:	83 e8 01             	sub    $0x1,%eax
   2d169:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d16c:	85 c0                	test   %eax,%eax
   2d16e:	0f 8f dc ed ff ff    	jg     2bf50 <JS_CallInternal+0x6b80>
   2d174:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2d17a:	e8 21 98 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d17f:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2d185:	e9 c6 ed ff ff       	jmp    2bf50 <JS_CallInternal+0x6b80>
   2d18a:	45 31 e4             	xor    %r12d,%r12d
   2d18d:	e9 d9 e9 ff ff       	jmp    2bb6b <JS_CallInternal+0x679b>
   2d192:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   2d196:	76 0f                	jbe    2d1a7 <JS_CallInternal+0x7dd7>
   2d198:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d19c:	83 e8 01             	sub    $0x1,%eax
   2d19f:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d1a3:	85 c0                	test   %eax,%eax
   2d1a5:	7e 07                	jle    2d1ae <JS_CallInternal+0x7dde>
   2d1a7:	31 c0                	xor    %eax,%eax
   2d1a9:	e9 7c 9d ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   2d1ae:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d1b2:	4c 89 d6             	mov    %r10,%rsi
   2d1b5:	4c 89 c2             	mov    %r8,%rdx
   2d1b8:	e8 63 17 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d1bd:	31 c0                	xor    %eax,%eax
   2d1bf:	e9 66 9d ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   2d1c4:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2d1c7:	76 13                	jbe    2d1dc <JS_CallInternal+0x7e0c>
   2d1c9:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d1cd:	83 e8 01             	sub    $0x1,%eax
   2d1d0:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d1d4:	85 c0                	test   %eax,%eax
   2d1d6:	0f 8e 33 2a 00 00    	jle    2fc0f <JS_CallInternal+0xa83f>
   2d1dc:	b8 01 00 00 00       	mov    $0x1,%eax
   2d1e1:	e9 f4 9c ff ff       	jmp    26eda <JS_CallInternal+0x1b0a>
   2d1e6:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2d1eb:	e9 24 93 ff ff       	jmp    26514 <JS_CallInternal+0x1144>
   2d1f0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d1f4:	48 89 ce             	mov    %rcx,%rsi
   2d1f7:	e8 24 17 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d1fc:	e9 5f 8f ff ff       	jmp    26160 <JS_CallInternal+0xd90>
   2d201:	48 83 ec 08          	sub    $0x8,%rsp
   2d205:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   2d209:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2d20f:	50                   	push   %rax
   2d210:	e9 e1 f2 ff ff       	jmp    2c4f6 <JS_CallInternal+0x7126>
   2d215:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2d21c:	44 89 d2             	mov    %r10d,%edx
   2d21f:	48 89 de             	mov    %rbx,%rsi
   2d222:	4c 89 ef             	mov    %r13,%rdi
   2d225:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d229:	e8 72 54 02 00       	call   526a0 <js_unary_arith_slow>
   2d22e:	85 c0                	test   %eax,%eax
   2d230:	0f 84 32 a8 ff ff    	je     27a68 <JS_CallInternal+0x2698>
   2d236:	e9 c5 89 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d23b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d240:	4c 8b a5 c0 fd ff ff 	mov    -0x240(%rbp),%r12
   2d247:	e9 b4 89 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d24c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d250:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2d257:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2d25b:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2d25e:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2d261:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2d264:	85 d2                	test   %edx,%edx
   2d266:	0f 8f c7 9a ff ff    	jg     26d33 <JS_CallInternal+0x1963>
   2d26c:	4c 89 95 c0 fd ff ff 	mov    %r10,-0x240(%rbp)
   2d273:	4c 89 9d c8 fd ff ff 	mov    %r11,-0x238(%rbp)
   2d27a:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2d281:	4c 89 8d e0 fd ff ff 	mov    %r9,-0x220(%rbp)
   2d288:	e8 13 97 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d28d:	4c 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10
   2d294:	4c 8b 9d c8 fd ff ff 	mov    -0x238(%rbp),%r11
   2d29b:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2d2a2:	4c 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%r9
   2d2a9:	e9 85 9a ff ff       	jmp    26d33 <JS_CallInternal+0x1963>
   2d2ae:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2d2b5:	48 8b 47 30          	mov    0x30(%rdi),%rax
   2d2b9:	48 01 c8             	add    %rcx,%rax
   2d2bc:	8b 48 04             	mov    0x4(%rax),%ecx
   2d2bf:	f6 00 08             	testb  $0x8,(%rax)
   2d2c2:	0f 85 0c 30 00 00    	jne    302d4 <JS_CallInternal+0xaf04>
   2d2c8:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2d2cf:	48 83 ec 08          	sub    $0x8,%rsp
   2d2d3:	41 83 ea 37          	sub    $0x37,%r10d
   2d2d7:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2d2de:	4d 8b 85 80 01 00 00 	mov    0x180(%r13),%r8
   2d2e5:	4d 8b 8d 88 01 00 00 	mov    0x188(%r13),%r9
   2d2ec:	4c 89 ef             	mov    %r13,%rdi
   2d2ef:	4c 89 58 30          	mov    %r11,0x30(%rax)
   2d2f3:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d2fa:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d301:	41 52                	push   %r10
   2d303:	e8 98 32 00 00       	call   305a0 <JS_GetPropertyInternal>
   2d308:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2d30f:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d313:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2d317:	48 89 03             	mov    %rax,(%rbx)
   2d31a:	41 58                	pop    %r8
   2d31c:	41 59                	pop    %r9
   2d31e:	0f 85 9c 8e ff ff    	jne    261c0 <JS_CallInternal+0xdf0>
   2d324:	4d 89 dc             	mov    %r11,%r12
   2d327:	e9 d4 88 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d32c:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2d330:	83 fe f6             	cmp    $0xfffffff6,%esi
   2d333:	76 14                	jbe    2d349 <JS_CallInternal+0x7f79>
   2d335:	49 8b 3a             	mov    (%r10),%rdi
   2d338:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2d33b:	83 ea 01             	sub    $0x1,%edx
   2d33e:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2d341:	85 d2                	test   %edx,%edx
   2d343:	0f 8e 67 1d 00 00    	jle    2f0b0 <JS_CallInternal+0x9ce0>
   2d349:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2d350:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2d357:	00 
   2d358:	45 85 c0             	test   %r8d,%r8d
   2d35b:	0f 88 24 15 00 00    	js     2e885 <JS_CallInternal+0x94b5>
   2d361:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d364:	76 11                	jbe    2d377 <JS_CallInternal+0x7fa7>
   2d366:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2d369:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2d36c:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d36f:	85 d2                	test   %edx,%edx
   2d371:	0f 8e dc 25 00 00    	jle    2f953 <JS_CallInternal+0xa583>
   2d377:	8b 8d ac fe ff ff    	mov    -0x154(%rbp),%ecx
   2d37d:	31 d2                	xor    %edx,%edx
   2d37f:	be 03 00 00 00       	mov    $0x3,%esi
   2d384:	85 c9                	test   %ecx,%ecx
   2d386:	0f 95 c2             	setne  %dl
   2d389:	31 ff                	xor    %edi,%edi
   2d38b:	e9 8e e5 ff ff       	jmp    2b91e <JS_CallInternal+0x654e>
   2d390:	48 8d 35 d4 c1 0a 00 	lea    0xac1d4(%rip),%rsi        # d956b <_IO_stdin_used+0x56b>
   2d397:	4c 89 ef             	mov    %r13,%rdi
   2d39a:	31 c0                	xor    %eax,%eax
   2d39c:	e8 7f 93 00 00       	call   36720 <JS_ThrowInternalError>
   2d3a1:	e9 5a 88 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d3a6:	0f b6 d0             	movzbl %al,%edx
   2d3a9:	48 8d 35 7f c1 0a 00 	lea    0xac17f(%rip),%rsi        # d952f <_IO_stdin_used+0x52f>
   2d3b0:	4c 89 ef             	mov    %r13,%rdi
   2d3b3:	31 c0                	xor    %eax,%eax
   2d3b5:	e8 66 93 00 00       	call   36720 <JS_ThrowInternalError>
   2d3ba:	e9 41 88 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d3bf:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2d3c4:	0f 85 2d b1 ff ff    	jne    284f7 <JS_CallInternal+0x3127>
   2d3ca:	49 8b 4a 18          	mov    0x18(%r10),%rcx
   2d3ce:	48 39 08             	cmp    %rcx,(%rax)
   2d3d1:	0f 85 20 b1 ff ff    	jne    284f7 <JS_CallInternal+0x3127>
   2d3d7:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
   2d3dc:	0f 85 15 b1 ff ff    	jne    284f7 <JS_CallInternal+0x3127>
   2d3e2:	8b 50 10             	mov    0x10(%rax),%edx
   2d3e5:	8b 79 18             	mov    0x18(%rcx),%edi
   2d3e8:	48 8d 34 d5 00 00 00 	lea    0x0(,%rdx,8),%rsi
   2d3ef:	00 
   2d3f0:	48 8d 74 be 3c       	lea    0x3c(%rsi,%rdi,4),%rsi
   2d3f5:	0f b6 4c 31 03       	movzbl 0x3(%rcx,%rsi,1),%ecx
   2d3fa:	c0 e9 02             	shr    $0x2,%cl
   2d3fd:	83 e1 3a             	and    $0x3a,%ecx
   2d400:	80 f9 02             	cmp    $0x2,%cl
   2d403:	0f 85 ee b0 ff ff    	jne    284f7 <JS_CallInternal+0x3127>
   2d409:	48 89 d0             	mov    %rdx,%rax
   2d40c:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2d411:	4c 89 ef             	mov    %r13,%rdi
   2d414:	48 83 eb 20          	sub    $0x20,%rbx
   2d418:	48 c1 e0 04          	shl    $0x4,%rax
   2d41c:	49 03 42 20          	add    0x20(%r10),%rax
   2d420:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2d427:	49 83 c4 05          	add    $0x5,%r12
   2d42b:	48 8b 30             	mov    (%rax),%rsi
   2d42e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2d432:	0f 11 00             	movups %xmm0,(%rax)
   2d435:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2d43c:	e8 5f 16 ff ff       	call   1eaa0 <JS_FreeValue>
   2d441:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2d448:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2d44f:	4c 89 ef             	mov    %r13,%rdi
   2d452:	48 89 c6             	mov    %rax,%rsi
   2d455:	e8 46 16 ff ff       	call   1eaa0 <JS_FreeValue>
   2d45a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2d460:	49 89 c2             	mov    %rax,%r10
   2d463:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2d467:	ff e0                	jmp    *%rax
   2d469:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2d470:	b8 03 00 00 00       	mov    $0x3,%eax
   2d475:	31 c9                	xor    %ecx,%ecx
   2d477:	e9 af da ff ff       	jmp    2af2b <JS_CallInternal+0x5b5b>
   2d47c:	b9 03 00 00 00       	mov    $0x3,%ecx
   2d481:	45 31 c9             	xor    %r9d,%r9d
   2d484:	e9 68 db ff ff       	jmp    2aff1 <JS_CallInternal+0x5c21>
   2d489:	49 89 f3             	mov    %rsi,%r11
   2d48c:	8b 76 ac             	mov    -0x54(%rsi),%esi
   2d48f:	89 b5 00 fe ff ff    	mov    %esi,-0x200(%rbp)
   2d495:	83 ee 01             	sub    $0x1,%esi
   2d498:	41 89 73 ac          	mov    %esi,-0x54(%r11)
   2d49c:	0f 85 91 e1 ff ff    	jne    2b633 <JS_CallInternal+0x6263>
   2d4a2:	80 bf a0 04 00 00 02 	cmpb   $0x2,0x4a0(%rdi)
   2d4a9:	0f 84 84 e1 ff ff    	je     2b633 <JS_CallInternal+0x6263>
   2d4af:	49 8d 73 b0          	lea    -0x50(%r11),%rsi
   2d4b3:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2d4ba:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d4c1:	e8 5a 52 ff ff       	call   22720 <async_func_free.part.0>
   2d4c6:	4c 8b 9d 90 fe ff ff 	mov    -0x170(%rbp),%r11
   2d4cd:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d4d4:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2d4db:	49 03 43 28          	add    0x28(%r11),%rax
   2d4df:	48 89 c1             	mov    %rax,%rcx
   2d4e2:	e9 4c e1 ff ff       	jmp    2b633 <JS_CallInternal+0x6263>
   2d4e7:	8b 02                	mov    (%rdx),%eax
   2d4e9:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2d4ee:	0f 85 76 e0 ff ff    	jne    2b56a <JS_CallInternal+0x619a>
   2d4f4:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d4fb:	4c 89 ef             	mov    %r13,%rdi
   2d4fe:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d505:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2d50c:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2d512:	e8 49 31 04 00       	call   70660 <JS_HasProperty>
   2d517:	85 c0                	test   %eax,%eax
   2d519:	0f 88 71 2e 00 00    	js     30390 <JS_CallInternal+0xafc0>
   2d51f:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2d525:	0f 84 23 1b 00 00    	je     2f04e <JS_CallInternal+0x9c7e>
   2d52b:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d532:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2d539:	83 fa f6             	cmp    $0xfffffff6,%edx
   2d53c:	76 04                	jbe    2d542 <JS_CallInternal+0x8172>
   2d53e:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2d542:	48 89 03             	mov    %rax,(%rbx)
   2d545:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d549:	e9 6a e0 ff ff       	jmp    2b5b8 <JS_CallInternal+0x61e8>
   2d54e:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2d555:	e9 a6 86 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d55a:	48 83 ec 08          	sub    $0x8,%rsp
   2d55e:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   2d564:	4c 89 ef             	mov    %r13,%rdi
   2d567:	49 89 d1             	mov    %rdx,%r9
   2d56a:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2d571:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2d578:	4c 89 e6             	mov    %r12,%rsi
   2d57b:	6a 00                	push   $0x0
   2d57d:	e8 1e 30 00 00       	call   305a0 <JS_GetPropertyInternal>
   2d582:	5f                   	pop    %rdi
   2d583:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2d58a:	83 fa 06             	cmp    $0x6,%edx
   2d58d:	48 89 c1             	mov    %rax,%rcx
   2d590:	41 58                	pop    %r8
   2d592:	48 89 d0             	mov    %rdx,%rax
   2d595:	0f 85 61 89 ff ff    	jne    25efc <JS_CallInternal+0xb2c>
   2d59b:	e9 17 8a ff ff       	jmp    25fb7 <JS_CallInternal+0xbe7>
   2d5a0:	48 89 f2             	mov    %rsi,%rdx
   2d5a3:	48 89 fe             	mov    %rdi,%rsi
   2d5a6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d5aa:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d5b1:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d5b8:	e8 63 13 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d5bd:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d5c4:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d5cb:	e9 59 d7 ff ff       	jmp    2ad29 <JS_CallInternal+0x5959>
   2d5d0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d5d4:	4c 89 d6             	mov    %r10,%rsi
   2d5d7:	4c 89 da             	mov    %r11,%rdx
   2d5da:	89 8d f8 fd ff ff    	mov    %ecx,-0x208(%rbp)
   2d5e0:	e8 3b 13 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d5e5:	8b 8d f8 fd ff ff    	mov    -0x208(%rbp),%ecx
   2d5eb:	e9 7a af ff ff       	jmp    2856a <JS_CallInternal+0x319a>
   2d5f0:	4c 8b a5 b0 fd ff ff 	mov    -0x250(%rbp),%r12
   2d5f7:	e9 04 86 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2d5fc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d600:	48 89 c2             	mov    %rax,%rdx
   2d603:	e8 18 13 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d608:	e9 83 c3 ff ff       	jmp    29990 <JS_CallInternal+0x45c0>
   2d60d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d611:	48 89 c2             	mov    %rax,%rdx
   2d614:	e8 07 13 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d619:	e9 20 c3 ff ff       	jmp    2993e <JS_CallInternal+0x456e>
   2d61e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d622:	48 89 c2             	mov    %rax,%rdx
   2d625:	48 89 ce             	mov    %rcx,%rsi
   2d628:	e8 f3 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d62d:	e9 b8 c2 ff ff       	jmp    298ea <JS_CallInternal+0x451a>
   2d632:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d636:	48 89 c2             	mov    %rax,%rdx
   2d639:	48 89 ce             	mov    %rcx,%rsi
   2d63c:	e8 df 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d641:	e9 5e c2 ff ff       	jmp    298a4 <JS_CallInternal+0x44d4>
   2d646:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d64a:	48 89 c2             	mov    %rax,%rdx
   2d64d:	48 89 ce             	mov    %rcx,%rsi
   2d650:	e8 cb 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d655:	e9 02 c2 ff ff       	jmp    2985c <JS_CallInternal+0x448c>
   2d65a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d65e:	48 89 c2             	mov    %rax,%rdx
   2d661:	48 89 ce             	mov    %rcx,%rsi
   2d664:	e8 b7 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d669:	e9 a6 c1 ff ff       	jmp    29814 <JS_CallInternal+0x4444>
   2d66e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d672:	48 89 ce             	mov    %rcx,%rsi
   2d675:	e8 a6 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d67a:	e9 07 c1 ff ff       	jmp    29786 <JS_CallInternal+0x43b6>
   2d67f:	31 c9                	xor    %ecx,%ecx
   2d681:	48 92                	xchg   %rax,%rdx
   2d683:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d687:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2d68d:	48 89 c6             	mov    %rax,%rsi
   2d690:	e8 8b 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d695:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2d69b:	e9 fb ee ff ff       	jmp    2c59b <JS_CallInternal+0x71cb>
   2d6a0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6a4:	48 89 c2             	mov    %rax,%rdx
   2d6a7:	48 89 ce             	mov    %rcx,%rsi
   2d6aa:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2d6b1:	e8 6a 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d6b6:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2d6bd:	e9 2d da ff ff       	jmp    2b0ef <JS_CallInternal+0x5d1f>
   2d6c2:	48 89 f2             	mov    %rsi,%rdx
   2d6c5:	48 89 fe             	mov    %rdi,%rsi
   2d6c8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6cc:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d6d3:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d6da:	e8 41 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d6df:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d6e6:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d6ed:	e9 2b dc ff ff       	jmp    2b31d <JS_CallInternal+0x5f4d>
   2d6f2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6f6:	48 89 ce             	mov    %rcx,%rsi
   2d6f9:	e8 22 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d6fe:	e9 48 b5 ff ff       	jmp    28c4b <JS_CallInternal+0x387b>
   2d703:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d707:	48 89 ce             	mov    %rcx,%rsi
   2d70a:	e8 11 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d70f:	e9 d2 b5 ff ff       	jmp    28ce6 <JS_CallInternal+0x3916>
   2d714:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d718:	48 89 ce             	mov    %rcx,%rsi
   2d71b:	e8 00 12 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d720:	e9 64 b6 ff ff       	jmp    28d89 <JS_CallInternal+0x39b9>
   2d725:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d729:	48 89 ce             	mov    %rcx,%rsi
   2d72c:	e8 ef 11 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d731:	e9 62 b5 ff ff       	jmp    28c98 <JS_CallInternal+0x38c8>
   2d736:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d73a:	48 89 ce             	mov    %rcx,%rsi
   2d73d:	e8 de 11 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d742:	e9 92 b6 ff ff       	jmp    28dd9 <JS_CallInternal+0x3a09>
   2d747:	48 89 fe             	mov    %rdi,%rsi
   2d74a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d74e:	e8 cd 11 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d753:	e9 26 b7 ff ff       	jmp    28e7e <JS_CallInternal+0x3aae>
   2d758:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d75c:	48 89 c2             	mov    %rax,%rdx
   2d75f:	48 89 ce             	mov    %rcx,%rsi
   2d762:	e8 b9 11 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d767:	e9 56 ca ff ff       	jmp    2a1c2 <JS_CallInternal+0x4df2>
   2d76c:	48 89 f2             	mov    %rsi,%rdx
   2d76f:	48 89 fe             	mov    %rdi,%rsi
   2d772:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d776:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2d77d:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d784:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2d78b:	e8 90 11 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d790:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   2d797:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d79e:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2d7a5:	e9 5a 92 ff ff       	jmp    26a04 <JS_CallInternal+0x1634>
   2d7aa:	48 89 f2             	mov    %rsi,%rdx
   2d7ad:	48 89 fe             	mov    %rdi,%rsi
   2d7b0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7b4:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2d7bb:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d7c2:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2d7c9:	e8 52 11 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d7ce:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   2d7d5:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d7dc:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2d7e3:	e9 3a 92 ff ff       	jmp    26a22 <JS_CallInternal+0x1652>
   2d7e8:	48 89 f2             	mov    %rsi,%rdx
   2d7eb:	48 89 fe             	mov    %rdi,%rsi
   2d7ee:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7f2:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2d7f9:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d800:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2d807:	e8 14 11 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d80c:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   2d813:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d81a:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2d821:	e9 c1 91 ff ff       	jmp    269e7 <JS_CallInternal+0x1617>
   2d826:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d82a:	48 89 c2             	mov    %rax,%rdx
   2d82d:	48 89 ce             	mov    %rcx,%rsi
   2d830:	e8 eb 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d835:	e9 96 c4 ff ff       	jmp    29cd0 <JS_CallInternal+0x4900>
   2d83a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d83e:	48 89 c2             	mov    %rax,%rdx
   2d841:	48 89 ce             	mov    %rcx,%rsi
   2d844:	e8 d7 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d849:	e9 2c c6 ff ff       	jmp    29e7a <JS_CallInternal+0x4aaa>
   2d84e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d852:	48 89 c2             	mov    %rax,%rdx
   2d855:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2d85c:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d863:	e8 b8 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d868:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   2d86f:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d876:	e9 94 d7 ff ff       	jmp    2b00f <JS_CallInternal+0x5c3f>
   2d87b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d87f:	48 89 c2             	mov    %rax,%rdx
   2d882:	e8 99 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d887:	e9 58 c1 ff ff       	jmp    299e4 <JS_CallInternal+0x4614>
   2d88c:	48 89 f2             	mov    %rsi,%rdx
   2d88f:	48 89 fe             	mov    %rdi,%rsi
   2d892:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d896:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d89d:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d8a4:	e8 77 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d8a9:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d8b0:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d8b7:	e9 27 c2 ff ff       	jmp    29ae3 <JS_CallInternal+0x4713>
   2d8bc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8c0:	48 89 c2             	mov    %rax,%rdx
   2d8c3:	48 89 ce             	mov    %rcx,%rsi
   2d8c6:	e8 55 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d8cb:	e9 3e a3 ff ff       	jmp    27c0e <JS_CallInternal+0x283e>
   2d8d0:	48 89 fe             	mov    %rdi,%rsi
   2d8d3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8d7:	e8 44 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d8dc:	e9 55 be ff ff       	jmp    29736 <JS_CallInternal+0x4366>
   2d8e1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8e5:	4c 89 ce             	mov    %r9,%rsi
   2d8e8:	4c 89 d2             	mov    %r10,%rdx
   2d8eb:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2d8f2:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d8f9:	e8 22 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d8fe:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2d905:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d90c:	e9 2c aa ff ff       	jmp    2833d <JS_CallInternal+0x2f6d>
   2d911:	48 89 fe             	mov    %rdi,%rsi
   2d914:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d918:	e8 03 10 ff ff       	call   1e920 <__JS_FreeValueRT>
   2d91d:	e9 0b b6 ff ff       	jmp    28f2d <JS_CallInternal+0x3b5d>
   2d922:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d926:	48 89 ce             	mov    %rcx,%rsi
   2d929:	e8 f2 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2d92e:	e9 46 b6 ff ff       	jmp    28f79 <JS_CallInternal+0x3ba9>
   2d933:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d937:	48 89 c6             	mov    %rax,%rsi
   2d93a:	4c 89 d2             	mov    %r10,%rdx
   2d93d:	e8 de 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2d942:	e9 b0 97 ff ff       	jmp    270f7 <JS_CallInternal+0x1d27>
   2d947:	48 89 f2             	mov    %rsi,%rdx
   2d94a:	48 89 fe             	mov    %rdi,%rsi
   2d94d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d951:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   2d958:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2d95f:	e8 bc 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2d964:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
   2d96b:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2d972:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2d979:	e9 de c0 ff ff       	jmp    29a5c <JS_CallInternal+0x468c>
   2d97e:	48 89 f2             	mov    %rsi,%rdx
   2d981:	48 89 fe             	mov    %rdi,%rsi
   2d984:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d988:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   2d98f:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2d996:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2d99d:	e8 7e 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2d9a2:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
   2d9a9:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2d9b0:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2d9b7:	e9 bd c0 ff ff       	jmp    29a79 <JS_CallInternal+0x46a9>
   2d9bc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9c0:	4c 89 d6             	mov    %r10,%rsi
   2d9c3:	4c 89 ca             	mov    %r9,%rdx
   2d9c6:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2d9cd:	e8 4e 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2d9d2:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2d9d9:	e9 95 93 ff ff       	jmp    26d73 <JS_CallInternal+0x19a3>
   2d9de:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9e2:	48 89 ce             	mov    %rcx,%rsi
   2d9e5:	e8 36 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2d9ea:	e9 29 99 ff ff       	jmp    27318 <JS_CallInternal+0x1f48>
   2d9ef:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9f3:	48 89 c2             	mov    %rax,%rdx
   2d9f6:	48 89 ce             	mov    %rcx,%rsi
   2d9f9:	e8 22 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2d9fe:	e9 b9 99 ff ff       	jmp    273bc <JS_CallInternal+0x1fec>
   2da03:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da07:	48 89 c2             	mov    %rax,%rdx
   2da0a:	48 89 ce             	mov    %rcx,%rsi
   2da0d:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2da14:	e8 07 0f ff ff       	call   1e920 <__JS_FreeValueRT>
   2da19:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2da20:	e9 56 91 ff ff       	jmp    26b7b <JS_CallInternal+0x17ab>
   2da25:	48 89 f2             	mov    %rsi,%rdx
   2da28:	48 89 fe             	mov    %rdi,%rsi
   2da2b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da2f:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2da36:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2da3d:	e8 de 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2da42:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2da49:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2da50:	e9 d6 ab ff ff       	jmp    2862b <JS_CallInternal+0x325b>
   2da55:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da59:	48 89 c2             	mov    %rax,%rdx
   2da5c:	e8 bf 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2da61:	e9 ed ac ff ff       	jmp    28753 <JS_CallInternal+0x3383>
   2da66:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da6a:	48 89 c2             	mov    %rax,%rdx
   2da6d:	e8 ae 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2da72:	e9 30 ad ff ff       	jmp    287a7 <JS_CallInternal+0x33d7>
   2da77:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da7b:	48 89 c2             	mov    %rax,%rdx
   2da7e:	e8 9d 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2da83:	e9 c5 ad ff ff       	jmp    2884d <JS_CallInternal+0x347d>
   2da88:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da8c:	48 89 c2             	mov    %rax,%rdx
   2da8f:	e8 8c 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2da94:	e9 60 ad ff ff       	jmp    287f9 <JS_CallInternal+0x3429>
   2da99:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da9d:	48 89 c2             	mov    %rax,%rdx
   2daa0:	48 89 ce             	mov    %rcx,%rsi
   2daa3:	e8 78 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2daa8:	e9 e8 ad ff ff       	jmp    28895 <JS_CallInternal+0x34c5>
   2daad:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dab1:	48 89 c2             	mov    %rax,%rdx
   2dab4:	48 89 ce             	mov    %rcx,%rsi
   2dab7:	e8 64 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2dabc:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2dac3:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2daca:	e9 8f 90 ff ff       	jmp    26b5e <JS_CallInternal+0x178e>
   2dacf:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2dad6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dada:	48 89 ce             	mov    %rcx,%rsi
   2dadd:	4c 89 95 c0 fd ff ff 	mov    %r10,-0x240(%rbp)
   2dae4:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2daeb:	4c 89 8d e0 fd ff ff 	mov    %r9,-0x220(%rbp)
   2daf2:	4c 89 9d c8 fd ff ff 	mov    %r11,-0x238(%rbp)
   2daf9:	e8 22 0e ff ff       	call   1e920 <__JS_FreeValueRT>
   2dafe:	4c 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10
   2db05:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2db0c:	4c 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%r9
   2db13:	e9 42 92 ff ff       	jmp    26d5a <JS_CallInternal+0x198a>
   2db18:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db1c:	48 89 ce             	mov    %rcx,%rsi
   2db1f:	e8 fc 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2db24:	e9 d1 8b ff ff       	jmp    266fa <JS_CallInternal+0x132a>
   2db29:	48 89 fe             	mov    %rdi,%rsi
   2db2c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db30:	e8 eb 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2db35:	e9 e1 b4 ff ff       	jmp    2901b <JS_CallInternal+0x3c4b>
   2db3a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db3e:	48 89 ce             	mov    %rcx,%rsi
   2db41:	e8 da 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2db46:	e9 c9 d9 ff ff       	jmp    2b514 <JS_CallInternal+0x6144>
   2db4b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db4f:	48 89 c2             	mov    %rax,%rdx
   2db52:	89 8d f8 fd ff ff    	mov    %ecx,-0x208(%rbp)
   2db58:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2db5f:	e8 bc 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2db64:	8b 8d f8 fd ff ff    	mov    -0x208(%rbp),%ecx
   2db6a:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2db71:	e9 08 ea ff ff       	jmp    2c57e <JS_CallInternal+0x71ae>
   2db76:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db7a:	48 89 c2             	mov    %rax,%rdx
   2db7d:	e8 9e 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2db82:	e9 08 9c ff ff       	jmp    2778f <JS_CallInternal+0x23bf>
   2db87:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db8b:	48 89 c2             	mov    %rax,%rdx
   2db8e:	48 89 ce             	mov    %rcx,%rsi
   2db91:	e8 8a 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2db96:	e9 82 ae ff ff       	jmp    28a1d <JS_CallInternal+0x364d>
   2db9b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db9f:	48 89 c2             	mov    %rax,%rdx
   2dba2:	48 89 ce             	mov    %rcx,%rsi
   2dba5:	e8 76 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2dbaa:	e9 2e ad ff ff       	jmp    288dd <JS_CallInternal+0x350d>
   2dbaf:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbb3:	48 89 c2             	mov    %rax,%rdx
   2dbb6:	48 89 ce             	mov    %rcx,%rsi
   2dbb9:	e8 62 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2dbbe:	e9 df ae ff ff       	jmp    28aa2 <JS_CallInternal+0x36d2>
   2dbc3:	48 89 fe             	mov    %rdi,%rsi
   2dbc6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbca:	e8 51 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2dbcf:	e9 28 af ff ff       	jmp    28afc <JS_CallInternal+0x372c>
   2dbd4:	48 89 fe             	mov    %rdi,%rsi
   2dbd7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbdb:	e8 40 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2dbe0:	e9 ca af ff ff       	jmp    28baf <JS_CallInternal+0x37df>
   2dbe5:	48 89 fe             	mov    %rdi,%rsi
   2dbe8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbec:	e8 2f 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2dbf1:	e9 5f af ff ff       	jmp    28b55 <JS_CallInternal+0x3785>
   2dbf6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbfa:	48 89 ce             	mov    %rcx,%rsi
   2dbfd:	e8 1e 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2dc02:	e9 f6 af ff ff       	jmp    28bfd <JS_CallInternal+0x382d>
   2dc07:	48 89 fe             	mov    %rdi,%rsi
   2dc0a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc0e:	e8 0d 0d ff ff       	call   1e920 <__JS_FreeValueRT>
   2dc13:	e9 a4 d8 ff ff       	jmp    2b4bc <JS_CallInternal+0x60ec>
   2dc18:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2dc1f:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2dc23:	4c 89 ef             	mov    %r13,%rdi
   2dc26:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2dc2d:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2dc34:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2dc3b:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2dc42:	4c 89 58 30          	mov    %r11,0x30(%rax)
   2dc46:	e8 15 2a 04 00       	call   70660 <JS_HasProperty>
   2dc4b:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2dc52:	85 c0                	test   %eax,%eax
   2dc54:	0f 88 42 25 00 00    	js     3019c <JS_CallInternal+0xadcc>
   2dc5a:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2dc61:	0f 85 45 0a 00 00    	jne    2e6ac <JS_CallInternal+0x92dc>
   2dc67:	49 8b 45 10          	mov    0x10(%r13),%rax
   2dc6b:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2dc72:	48 85 c0             	test   %rax,%rax
   2dc75:	0f 84 31 0a 00 00    	je     2e6ac <JS_CallInternal+0x92dc>
   2dc7b:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2dc7f:	0f 84 27 0a 00 00    	je     2e6ac <JS_CallInternal+0x92dc>
   2dc85:	41 8b 71 04          	mov    0x4(%r9),%esi
   2dc89:	4c 89 ef             	mov    %r13,%rdi
   2dc8c:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2dc93:	e8 c8 88 00 00       	call   36560 <JS_ThrowReferenceErrorNotDefined>
   2dc98:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2dc9f:	e9 5c 7f ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2dca4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dca8:	4c 89 c2             	mov    %r8,%rdx
   2dcab:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2dcb1:	e8 6a 0c ff ff       	call   1e920 <__JS_FreeValueRT>
   2dcb6:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2dcbc:	e9 88 97 ff ff       	jmp    27449 <JS_CallInternal+0x2079>
   2dcc1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dcc5:	48 89 d6             	mov    %rdx,%rsi
   2dcc8:	4c 89 d2             	mov    %r10,%rdx
   2dccb:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2dcd2:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2dcd9:	44 89 8d e0 fd ff ff 	mov    %r9d,-0x220(%rbp)
   2dce0:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2dce7:	e8 34 0c ff ff       	call   1e920 <__JS_FreeValueRT>
   2dcec:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   2dcf3:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2dcfa:	44 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%r9d
   2dd01:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2dd08:	e9 e0 cb ff ff       	jmp    2a8ed <JS_CallInternal+0x551d>
   2dd0d:	48 89 f2             	mov    %rsi,%rdx
   2dd10:	48 89 fe             	mov    %rdi,%rsi
   2dd13:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd17:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2dd1e:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2dd25:	44 89 8d f8 fd ff ff 	mov    %r9d,-0x208(%rbp)
   2dd2c:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2dd33:	e8 e8 0b ff ff       	call   1e920 <__JS_FreeValueRT>
   2dd38:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2dd3f:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2dd46:	44 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9d
   2dd4d:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2dd54:	e9 bf cb ff ff       	jmp    2a918 <JS_CallInternal+0x5548>
   2dd59:	48 8b bd c0 fd ff ff 	mov    -0x240(%rbp),%rdi
   2dd60:	48 89 ce             	mov    %rcx,%rsi
   2dd63:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2dd6a:	e8 b1 0b ff ff       	call   1e920 <__JS_FreeValueRT>
   2dd6f:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2dd76:	e9 da cc ff ff       	jmp    2aa55 <JS_CallInternal+0x5685>
   2dd7b:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2dd82:	e9 79 7e ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2dd87:	41 83 f8 08          	cmp    $0x8,%r8d
   2dd8b:	0f 84 e3 21 00 00    	je     2ff74 <JS_CallInternal+0xaba4>
   2dd91:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2dd95:	0f 84 8e 21 00 00    	je     2ff29 <JS_CallInternal+0xab59>
   2dd9b:	41 8d 40 fe          	lea    -0x2(%r8),%eax
   2dd9f:	83 f8 01             	cmp    $0x1,%eax
   2dda2:	0f 86 89 23 00 00    	jbe    30131 <JS_CallInternal+0xad61>
   2dda8:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2ddac:	0f 85 15 21 00 00    	jne    2fec7 <JS_CallInternal+0xaaf7>
   2ddb2:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2ddb5:	0f 85 0c 21 00 00    	jne    2fec7 <JS_CallInternal+0xaaf7>
   2ddbb:	4c 89 d6             	mov    %r10,%rsi
   2ddbe:	48 89 d7             	mov    %rdx,%rdi
   2ddc1:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2ddc8:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   2ddcf:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2ddd6:	48 89 95 f8 fd ff ff 	mov    %rdx,-0x208(%rbp)
   2dddd:	e8 4e b9 fe ff       	call   19730 <js_string_eq.isra.0>
   2dde2:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2dde9:	4c 89 ef             	mov    %r13,%rdi
   2ddec:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2ddf2:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2ddf9:	48 89 c6             	mov    %rax,%rsi
   2ddfc:	e8 9f 0c ff ff       	call   1eaa0 <JS_FreeValue>
   2de01:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2de08:	4c 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%r11
   2de0f:	4c 89 d6             	mov    %r10,%rsi
   2de12:	4c 89 da             	mov    %r11,%rdx
   2de15:	4c 89 ef             	mov    %r13,%rdi
   2de18:	e8 83 0c ff ff       	call   1eaa0 <JS_FreeValue>
   2de1d:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2de23:	83 f0 01             	xor    $0x1,%eax
   2de26:	48 98                	cltq
   2de28:	e9 ad 90 ff ff       	jmp    26eda <JS_CallInternal+0x1b0a>
   2de2d:	48 8d 35 80 b7 0a 00 	lea    0xab780(%rip),%rsi        # d95b4 <_IO_stdin_used+0x5b4>
   2de34:	4c 89 ef             	mov    %r13,%rdi
   2de37:	31 c0                	xor    %eax,%eax
   2de39:	e8 02 67 00 00       	call   34540 <JS_ThrowTypeError>
   2de3e:	e9 27 94 ff ff       	jmp    2726a <JS_CallInternal+0x1e9a>
   2de43:	48 8d 35 5c b7 0a 00 	lea    0xab75c(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2de4a:	4c 89 ef             	mov    %r13,%rdi
   2de4d:	31 c0                	xor    %eax,%eax
   2de4f:	e8 ec 66 00 00       	call   34540 <JS_ThrowTypeError>
   2de54:	e9 11 94 ff ff       	jmp    2726a <JS_CallInternal+0x1e9a>
   2de59:	49 83 c4 04          	add    $0x4,%r12
   2de5d:	e9 9e 7d ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2de62:	0f 85 4f 26 00 00    	jne    304b7 <JS_CallInternal+0xb0e7>
   2de68:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2de6c:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2de73:	48 85 c0             	test   %rax,%rax
   2de76:	0f 84 8e 12 00 00    	je     2f10a <JS_CallInternal+0x9d3a>
   2de7c:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2de80:	0f 84 84 12 00 00    	je     2f10a <JS_CallInternal+0x9d3a>
   2de86:	89 ce                	mov    %ecx,%esi
   2de88:	4c 89 ef             	mov    %r13,%rdi
   2de8b:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2de91:	e8 ca 86 00 00       	call   36560 <JS_ThrowReferenceErrorNotDefined>
   2de96:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2de9c:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2dea2:	0f 8e 58 7d ff ff    	jle    25c00 <JS_CallInternal+0x830>
   2dea8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2deac:	89 ce                	mov    %ecx,%esi
   2deae:	e8 7d d0 fe ff       	call   1af30 <JS_FreeAtom.part.0.isra.0>
   2deb3:	e9 48 7d ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2deb8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2debc:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2dec0:	89 c2                	mov    %eax,%edx
   2dec2:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2dec8:	e8 43 ae fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2decd:	48 8d 35 0d b7 0a 00 	lea    0xab70d(%rip),%rsi        # d95e1 <_IO_stdin_used+0x5e1>
   2ded4:	4c 89 ef             	mov    %r13,%rdi
   2ded7:	48 89 c2             	mov    %rax,%rdx
   2deda:	31 c0                	xor    %eax,%eax
   2dedc:	e8 3f 85 00 00       	call   36420 <JS_ThrowReferenceError>
   2dee1:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2dee7:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2deed:	0f 8e 0d 7d ff ff    	jle    25c00 <JS_CallInternal+0x830>
   2def3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2def7:	89 ce                	mov    %ecx,%esi
   2def9:	e8 32 d0 fe ff       	call   1af30 <JS_FreeAtom.part.0.isra.0>
   2defe:	e9 fd 7c ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2df03:	48 89 fe             	mov    %rdi,%rsi
   2df06:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2df0d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2df11:	89 8d c0 fd ff ff    	mov    %ecx,-0x240(%rbp)
   2df17:	e8 04 0a ff ff       	call   1e920 <__JS_FreeValueRT>
   2df1c:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   2df22:	e9 fe 89 ff ff       	jmp    26925 <JS_CallInternal+0x1555>
   2df27:	83 fe 08             	cmp    $0x8,%esi
   2df2a:	0f 84 be 1a 00 00    	je     2f9ee <JS_CallInternal+0xa61e>
   2df30:	83 f9 08             	cmp    $0x8,%ecx
   2df33:	75 08                	jne    2df3d <JS_CallInternal+0x8b6d>
   2df35:	85 f6                	test   %esi,%esi
   2df37:	0f 84 e9 1a 00 00    	je     2fa26 <JS_CallInternal+0xa656>
   2df3d:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2df44:	44 89 d2             	mov    %r10d,%edx
   2df47:	48 89 de             	mov    %rbx,%rsi
   2df4a:	4c 89 ef             	mov    %r13,%rdi
   2df4d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2df51:	e8 5a ed 02 00       	call   5ccb0 <js_relational_slow>
   2df56:	85 c0                	test   %eax,%eax
   2df58:	0f 85 a2 7c ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2df5e:	48 83 eb 10          	sub    $0x10,%rbx
   2df62:	e9 c1 9a ff ff       	jmp    27a28 <JS_CallInternal+0x2658>
   2df67:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2df6e:	48 8d 15 48 b5 0a 00 	lea    0xab548(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2df75:	48 8b 40 30          	mov    0x30(%rax),%rax
   2df79:	8b 44 f0 04          	mov    0x4(%rax,%rsi,8),%eax
   2df7d:	85 c0                	test   %eax,%eax
   2df7f:	0f 85 b0 1a 00 00    	jne    2fa35 <JS_CallInternal+0xa665>
   2df85:	48 8d 35 8d b5 0a 00 	lea    0xab58d(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2df8c:	4c 89 ef             	mov    %r13,%rdi
   2df8f:	31 c0                	xor    %eax,%eax
   2df91:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2df98:	e8 83 84 00 00       	call   36420 <JS_ThrowReferenceError>
   2df9d:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2dfa4:	e9 57 7c ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2dfa9:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2dfb0:	48 8d 15 06 b5 0a 00 	lea    0xab506(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2dfb7:	48 8b 40 30          	mov    0x30(%rax),%rax
   2dfbb:	8b 44 f0 04          	mov    0x4(%rax,%rsi,8),%eax
   2dfbf:	85 c0                	test   %eax,%eax
   2dfc1:	0f 85 63 17 00 00    	jne    2f72a <JS_CallInternal+0xa35a>
   2dfc7:	48 8d 35 4b b5 0a 00 	lea    0xab54b(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2dfce:	4c 89 ef             	mov    %r13,%rdi
   2dfd1:	31 c0                	xor    %eax,%eax
   2dfd3:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2dfda:	e8 41 84 00 00       	call   36420 <JS_ThrowReferenceError>
   2dfdf:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2dfe6:	e9 15 7c ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2dfeb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dfef:	4c 89 d2             	mov    %r10,%rdx
   2dff2:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2dff9:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e000:	e8 1b 09 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e005:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2e00c:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e013:	e9 33 c6 ff ff       	jmp    2a64b <JS_CallInternal+0x527b>
   2e018:	83 fa 08             	cmp    $0x8,%edx
   2e01b:	0f 84 b8 1a 00 00    	je     2fad9 <JS_CallInternal+0xa709>
   2e021:	83 fa ff             	cmp    $0xffffffff,%edx
   2e024:	0f 84 5d 1a 00 00    	je     2fa87 <JS_CallInternal+0xa6b7>
   2e02a:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e02d:	83 f8 01             	cmp    $0x1,%eax
   2e030:	0f 86 24 1a 00 00    	jbe    2fa5a <JS_CallInternal+0xa68a>
   2e036:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e039:	0f 85 48 f0 ff ff    	jne    2d087 <JS_CallInternal+0x7cb7>
   2e03f:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2e043:	0f 85 3e f0 ff ff    	jne    2d087 <JS_CallInternal+0x7cb7>
   2e049:	4c 89 ce             	mov    %r9,%rsi
   2e04c:	4c 89 8d e0 fd ff ff 	mov    %r9,-0x220(%rbp)
   2e053:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2e05a:	48 89 bd f8 fd ff ff 	mov    %rdi,-0x208(%rbp)
   2e061:	48 89 95 c0 fd ff ff 	mov    %rdx,-0x240(%rbp)
   2e068:	e8 c3 b6 fe ff       	call   19730 <js_string_eq.isra.0>
   2e06d:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2e074:	4c 89 ef             	mov    %r13,%rdi
   2e077:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2e07d:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2e084:	48 89 c6             	mov    %rax,%rsi
   2e087:	e8 14 0a ff ff       	call   1eaa0 <JS_FreeValue>
   2e08c:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2e093:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   2e09a:	4c 89 c6             	mov    %r8,%rsi
   2e09d:	4c 89 ca             	mov    %r9,%rdx
   2e0a0:	4c 89 ef             	mov    %r13,%rdi
   2e0a3:	e8 f8 09 ff ff       	call   1eaa0 <JS_FreeValue>
   2e0a8:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2e0ae:	e9 c7 8e ff ff       	jmp    26f7a <JS_CallInternal+0x1baa>
   2e0b3:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2e0ba:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e0be:	8b 44 d0 04          	mov    0x4(%rax,%rdx,8),%eax
   2e0c2:	48 8d 15 f4 b3 0a 00 	lea    0xab3f4(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2e0c9:	85 c0                	test   %eax,%eax
   2e0cb:	0f 85 96 18 00 00    	jne    2f967 <JS_CallInternal+0xa597>
   2e0d1:	48 8d 35 41 b4 0a 00 	lea    0xab441(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2e0d8:	4c 89 ef             	mov    %r13,%rdi
   2e0db:	31 c0                	xor    %eax,%eax
   2e0dd:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e0e4:	e8 37 83 00 00       	call   36420 <JS_ThrowReferenceError>
   2e0e9:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2e0f0:	e9 0b 7b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e0f5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e0f9:	48 89 c2             	mov    %rax,%rdx
   2e0fc:	48 89 ce             	mov    %rcx,%rsi
   2e0ff:	e8 1c 08 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e104:	e9 0f a1 ff ff       	jmp    28218 <JS_CallInternal+0x2e48>
   2e109:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e10d:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e112:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e119:	00 
   2e11a:	48 83 eb 10          	sub    $0x10,%rbx
   2e11e:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2e123:	e9 9a c5 ff ff       	jmp    2a6c2 <JS_CallInternal+0x52f2>
   2e128:	83 fe 08             	cmp    $0x8,%esi
   2e12b:	0f 84 5b 18 00 00    	je     2f98c <JS_CallInternal+0xa5bc>
   2e131:	83 f8 08             	cmp    $0x8,%eax
   2e134:	0f 85 7c ca ff ff    	jne    2abb6 <JS_CallInternal+0x57e6>
   2e13a:	85 f6                	test   %esi,%esi
   2e13c:	0f 85 74 ca ff ff    	jne    2abb6 <JS_CallInternal+0x57e6>
   2e142:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2e146:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2e14a:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2e14f:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
   2e153:	eb bd                	jmp    2e112 <JS_CallInternal+0x8d42>
   2e155:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e159:	48 89 c2             	mov    %rax,%rdx
   2e15c:	48 89 ce             	mov    %rcx,%rsi
   2e15f:	e8 bc 07 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e164:	e9 d3 a0 ff ff       	jmp    2823c <JS_CallInternal+0x2e6c>
   2e169:	4c 89 ef             	mov    %r13,%rdi
   2e16c:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e173:	e8 68 86 00 00       	call   367e0 <__js_poll_interrupts>
   2e178:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e17f:	85 c0                	test   %eax,%eax
   2e181:	0f 84 40 20 00 00    	je     301c7 <JS_CallInternal+0xadf7>
   2e187:	49 89 cc             	mov    %rcx,%r12
   2e18a:	e9 71 7a ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e18f:	4c 89 ef             	mov    %r13,%rdi
   2e192:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2e199:	e8 42 86 00 00       	call   367e0 <__js_poll_interrupts>
   2e19e:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2e1a5:	85 c0                	test   %eax,%eax
   2e1a7:	0f 84 d5 21 00 00    	je     30382 <JS_CallInternal+0xafb2>
   2e1ad:	49 89 d4             	mov    %rdx,%r12
   2e1b0:	e9 4b 7a ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e1b5:	48 8d 35 f8 b3 0a 00 	lea    0xab3f8(%rip),%rsi        # d95b4 <_IO_stdin_used+0x5b4>
   2e1bc:	4c 89 ef             	mov    %r13,%rdi
   2e1bf:	31 c0                	xor    %eax,%eax
   2e1c1:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2e1c8:	e8 73 63 00 00       	call   34540 <JS_ThrowTypeError>
   2e1cd:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2e1d4:	83 bd f8 fd ff ff f6 	cmpl   $0xfffffff6,-0x208(%rbp)
   2e1db:	76 1e                	jbe    2e1fb <JS_CallInternal+0x8e2b>
   2e1dd:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e1e4:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2e1e7:	89 85 e0 fd ff ff    	mov    %eax,-0x220(%rbp)
   2e1ed:	83 e8 01             	sub    $0x1,%eax
   2e1f0:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2e1f3:	85 c0                	test   %eax,%eax
   2e1f5:	0f 8e 92 1a 00 00    	jle    2fc8d <JS_CallInternal+0xa8bd>
   2e1fb:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2e1ff:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e202:	0f 86 43 0a 00 00    	jbe    2ec4b <JS_CallInternal+0x987b>
   2e208:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2e20d:	e9 58 e3 ff ff       	jmp    2c56a <JS_CallInternal+0x719a>
   2e212:	48 83 c3 10          	add    $0x10,%rbx
   2e216:	49 83 c4 04          	add    $0x4,%r12
   2e21a:	e9 e1 79 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e21f:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   2e226:	0f b7 d1             	movzwl %cx,%edx
   2e229:	4c 89 ef             	mov    %r13,%rdi
   2e22c:	31 c9                	xor    %ecx,%ecx
   2e22e:	49 83 c4 02          	add    $0x2,%r12
   2e232:	e8 89 83 00 00       	call   365c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e237:	e9 c4 79 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e23c:	48 8d 35 c5 eb 0a 00 	lea    0xaebc5(%rip),%rsi        # dce08 <_IO_stdin_used+0x3e08>
   2e243:	4c 89 ef             	mov    %r13,%rdi
   2e246:	31 c0                	xor    %eax,%eax
   2e248:	e8 f3 62 00 00       	call   34540 <JS_ThrowTypeError>
   2e24d:	e9 ae 79 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e252:	4c 89 ef             	mov    %r13,%rdi
   2e255:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e25c:	e8 7f 85 00 00       	call   367e0 <__js_poll_interrupts>
   2e261:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e268:	85 c0                	test   %eax,%eax
   2e26a:	0f 84 49 1f 00 00    	je     301b9 <JS_CallInternal+0xade9>
   2e270:	49 89 cc             	mov    %rcx,%r12
   2e273:	e9 88 79 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e278:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   2e27f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e283:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2e28a:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e291:	4c 89 ca             	mov    %r9,%rdx
   2e294:	e8 87 06 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e299:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2e2a0:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e2a7:	e9 25 cf ff ff       	jmp    2b1d1 <JS_CallInternal+0x5e01>
   2e2ac:	48 8d 35 2d eb 0a 00 	lea    0xaeb2d(%rip),%rsi        # dcde0 <_IO_stdin_used+0x3de0>
   2e2b3:	4c 89 ef             	mov    %r13,%rdi
   2e2b6:	31 c0                	xor    %eax,%eax
   2e2b8:	49 83 c4 02          	add    $0x2,%r12
   2e2bc:	e8 5f 81 00 00       	call   36420 <JS_ThrowReferenceError>
   2e2c1:	e9 3a 79 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e2c6:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2e2cd:	48 83 c3 10          	add    $0x10,%rbx
   2e2d1:	e9 2a 79 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e2d6:	48 83 c3 10          	add    $0x10,%rbx
   2e2da:	e9 21 79 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e2df:	83 fa 08             	cmp    $0x8,%edx
   2e2e2:	0f 84 03 1b 00 00    	je     2fdeb <JS_CallInternal+0xaa1b>
   2e2e8:	83 fa ff             	cmp    $0xffffffff,%edx
   2e2eb:	0f 84 95 1a 00 00    	je     2fd86 <JS_CallInternal+0xa9b6>
   2e2f1:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e2f4:	83 f8 01             	cmp    $0x1,%eax
   2e2f7:	0f 86 37 15 00 00    	jbe    2f834 <JS_CallInternal+0xa464>
   2e2fd:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e300:	0f 85 1c ed ff ff    	jne    2d022 <JS_CallInternal+0x7c52>
   2e306:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e309:	0f 85 13 ed ff ff    	jne    2d022 <JS_CallInternal+0x7c52>
   2e30f:	4c 89 ce             	mov    %r9,%rsi
   2e312:	4c 89 8d e0 fd ff ff 	mov    %r9,-0x220(%rbp)
   2e319:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2e320:	48 89 bd f8 fd ff ff 	mov    %rdi,-0x208(%rbp)
   2e327:	48 89 95 c0 fd ff ff 	mov    %rdx,-0x240(%rbp)
   2e32e:	e8 fd b3 fe ff       	call   19730 <js_string_eq.isra.0>
   2e333:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2e33a:	4c 89 ef             	mov    %r13,%rdi
   2e33d:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2e343:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2e34a:	48 89 c6             	mov    %rax,%rsi
   2e34d:	e8 4e 07 ff ff       	call   1eaa0 <JS_FreeValue>
   2e352:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
   2e359:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2e360:	4c 89 ef             	mov    %r13,%rdi
   2e363:	48 89 c6             	mov    %rax,%rsi
   2e366:	e8 35 07 ff ff       	call   1eaa0 <JS_FreeValue>
   2e36b:	44 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8d
   2e372:	e9 59 8c ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   2e377:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2e37e:	00 00 
   2e380:	4c 8b a5 c0 fd ff ff 	mov    -0x240(%rbp),%r12
   2e387:	e9 74 78 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e38c:	4c 89 ef             	mov    %r13,%rdi
   2e38f:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e396:	e8 45 84 00 00       	call   367e0 <__js_poll_interrupts>
   2e39b:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e3a2:	85 c0                	test   %eax,%eax
   2e3a4:	0f 84 dc 1e 00 00    	je     30286 <JS_CallInternal+0xaeb6>
   2e3aa:	49 89 cc             	mov    %rcx,%r12
   2e3ad:	e9 4e 78 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e3b2:	4c 89 ef             	mov    %r13,%rdi
   2e3b5:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e3bc:	e8 1f 84 00 00       	call   367e0 <__js_poll_interrupts>
   2e3c1:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e3c8:	85 c0                	test   %eax,%eax
   2e3ca:	0f 84 0f 21 00 00    	je     304df <JS_CallInternal+0xb10f>
   2e3d0:	49 89 cc             	mov    %rcx,%r12
   2e3d3:	e9 28 78 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e3d8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e3dc:	48 89 c2             	mov    %rax,%rdx
   2e3df:	48 89 ce             	mov    %rcx,%rsi
   2e3e2:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2e3e9:	e8 32 05 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e3ee:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2e3f5:	e9 01 9e ff ff       	jmp    281fb <JS_CallInternal+0x2e2b>
   2e3fa:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   2e401:	0f b7 d1             	movzwl %cx,%edx
   2e404:	4c 89 ef             	mov    %r13,%rdi
   2e407:	31 c9                	xor    %ecx,%ecx
   2e409:	49 83 c4 02          	add    $0x2,%r12
   2e40d:	e8 ae 81 00 00       	call   365c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e412:	e9 e9 77 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e417:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e41e:	44 89 d2             	mov    %r10d,%edx
   2e421:	48 89 de             	mov    %rbx,%rsi
   2e424:	4c 89 ef             	mov    %r13,%rdi
   2e427:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e42b:	e8 80 4b 02 00       	call   52fb0 <js_binary_logic_slow>
   2e430:	85 c0                	test   %eax,%eax
   2e432:	0f 85 c8 77 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e438:	48 83 eb 10          	sub    $0x10,%rbx
   2e43c:	e9 95 94 ff ff       	jmp    278d6 <JS_CallInternal+0x2506>
   2e441:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e448:	44 89 d2             	mov    %r10d,%edx
   2e44b:	48 89 de             	mov    %rbx,%rsi
   2e44e:	4c 89 ef             	mov    %r13,%rdi
   2e451:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e455:	e8 56 4b 02 00       	call   52fb0 <js_binary_logic_slow>
   2e45a:	85 c0                	test   %eax,%eax
   2e45c:	0f 85 9e 77 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e462:	48 83 eb 10          	sub    $0x10,%rbx
   2e466:	e9 f0 94 ff ff       	jmp    2795b <JS_CallInternal+0x258b>
   2e46b:	83 fe 08             	cmp    $0x8,%esi
   2e46e:	0f 84 84 18 00 00    	je     2fcf8 <JS_CallInternal+0xa928>
   2e474:	83 f9 08             	cmp    $0x8,%ecx
   2e477:	75 08                	jne    2e481 <JS_CallInternal+0x90b1>
   2e479:	85 f6                	test   %esi,%esi
   2e47b:	0f 84 af 18 00 00    	je     2fd30 <JS_CallInternal+0xa960>
   2e481:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e488:	44 89 d2             	mov    %r10d,%edx
   2e48b:	48 89 de             	mov    %rbx,%rsi
   2e48e:	4c 89 ef             	mov    %r13,%rdi
   2e491:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e495:	e8 16 e8 02 00       	call   5ccb0 <js_relational_slow>
   2e49a:	85 c0                	test   %eax,%eax
   2e49c:	0f 85 5e 77 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e4a2:	48 83 eb 10          	sub    $0x10,%rbx
   2e4a6:	e9 74 93 ff ff       	jmp    2781f <JS_CallInternal+0x244f>
   2e4ab:	83 fe 08             	cmp    $0x8,%esi
   2e4ae:	0f 84 8b 18 00 00    	je     2fd3f <JS_CallInternal+0xa96f>
   2e4b4:	83 f9 08             	cmp    $0x8,%ecx
   2e4b7:	75 08                	jne    2e4c1 <JS_CallInternal+0x90f1>
   2e4b9:	85 f6                	test   %esi,%esi
   2e4bb:	0f 84 b6 18 00 00    	je     2fd77 <JS_CallInternal+0xa9a7>
   2e4c1:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e4c8:	44 89 d2             	mov    %r10d,%edx
   2e4cb:	48 89 de             	mov    %rbx,%rsi
   2e4ce:	4c 89 ef             	mov    %r13,%rdi
   2e4d1:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e4d5:	e8 d6 e7 02 00       	call   5ccb0 <js_relational_slow>
   2e4da:	85 c0                	test   %eax,%eax
   2e4dc:	0f 85 1e 77 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e4e2:	48 83 eb 10          	sub    $0x10,%rbx
   2e4e6:	e9 ec 92 ff ff       	jmp    277d7 <JS_CallInternal+0x2407>
   2e4eb:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e4f2:	44 89 d2             	mov    %r10d,%edx
   2e4f5:	48 89 de             	mov    %rbx,%rsi
   2e4f8:	4c 89 ef             	mov    %r13,%rdi
   2e4fb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e4ff:	e8 ac 4a 02 00       	call   52fb0 <js_binary_logic_slow>
   2e504:	85 c0                	test   %eax,%eax
   2e506:	0f 85 f4 76 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e50c:	48 83 eb 10          	sub    $0x10,%rbx
   2e510:	e9 84 93 ff ff       	jmp    27899 <JS_CallInternal+0x24c9>
   2e515:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e51c:	44 89 d2             	mov    %r10d,%edx
   2e51f:	48 89 de             	mov    %rbx,%rsi
   2e522:	4c 89 ef             	mov    %r13,%rdi
   2e525:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e529:	e8 82 4a 02 00       	call   52fb0 <js_binary_logic_slow>
   2e52e:	85 c0                	test   %eax,%eax
   2e530:	0f 85 ca 76 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e536:	48 83 eb 10          	sub    $0x10,%rbx
   2e53a:	e9 1d 93 ff ff       	jmp    2785c <JS_CallInternal+0x248c>
   2e53f:	83 fa 08             	cmp    $0x8,%edx
   2e542:	0f 84 6a 1b 00 00    	je     300b2 <JS_CallInternal+0xace2>
   2e548:	83 fa ff             	cmp    $0xffffffff,%edx
   2e54b:	0f 84 1f 1b 00 00    	je     30070 <JS_CallInternal+0xaca0>
   2e551:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e554:	83 f8 01             	cmp    $0x1,%eax
   2e557:	0f 86 08 1c 00 00    	jbe    30165 <JS_CallInternal+0xad95>
   2e55d:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e560:	0f 85 3b 1a 00 00    	jne    2ffa1 <JS_CallInternal+0xabd1>
   2e566:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2e56a:	0f 85 31 1a 00 00    	jne    2ffa1 <JS_CallInternal+0xabd1>
   2e570:	4c 89 d6             	mov    %r10,%rsi
   2e573:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   2e57a:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   2e581:	48 89 95 d0 fd ff ff 	mov    %rdx,-0x230(%rbp)
   2e588:	48 89 bd f8 fd ff ff 	mov    %rdi,-0x208(%rbp)
   2e58f:	e8 9c b1 fe ff       	call   19730 <js_string_eq.isra.0>
   2e594:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2e59b:	4c 89 ef             	mov    %r13,%rdi
   2e59e:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2e5a4:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2e5ab:	48 89 c6             	mov    %rax,%rsi
   2e5ae:	e8 ed 04 ff ff       	call   1eaa0 <JS_FreeValue>
   2e5b3:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   2e5ba:	4c 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%r11
   2e5c1:	4c 89 d6             	mov    %r10,%rsi
   2e5c4:	4c 89 da             	mov    %r11,%rdx
   2e5c7:	4c 89 ef             	mov    %r13,%rdi
   2e5ca:	e8 d1 04 ff ff       	call   1eaa0 <JS_FreeValue>
   2e5cf:	48 63 85 00 fe ff ff 	movslq -0x200(%rbp),%rax
   2e5d6:	e9 4f 89 ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   2e5db:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e5e2:	44 89 d2             	mov    %r10d,%edx
   2e5e5:	48 89 de             	mov    %rbx,%rsi
   2e5e8:	4c 89 ef             	mov    %r13,%rdi
   2e5eb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e5ef:	e8 bc 49 02 00       	call   52fb0 <js_binary_logic_slow>
   2e5f4:	85 c0                	test   %eax,%eax
   2e5f6:	0f 85 04 76 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e5fc:	48 83 eb 10          	sub    $0x10,%rbx
   2e600:	e9 93 93 ff ff       	jmp    27998 <JS_CallInternal+0x25c8>
   2e605:	83 fe 08             	cmp    $0x8,%esi
   2e608:	0f 84 a5 16 00 00    	je     2fcb3 <JS_CallInternal+0xa8e3>
   2e60e:	83 f9 08             	cmp    $0x8,%ecx
   2e611:	75 08                	jne    2e61b <JS_CallInternal+0x924b>
   2e613:	85 f6                	test   %esi,%esi
   2e615:	0f 84 e7 14 00 00    	je     2fb02 <JS_CallInternal+0xa732>
   2e61b:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2e622:	44 89 d2             	mov    %r10d,%edx
   2e625:	48 89 de             	mov    %rbx,%rsi
   2e628:	4c 89 ef             	mov    %r13,%rdi
   2e62b:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e62f:	e8 7c e6 02 00       	call   5ccb0 <js_relational_slow>
   2e634:	85 c0                	test   %eax,%eax
   2e636:	0f 85 c4 75 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2e63c:	48 83 eb 10          	sub    $0x10,%rbx
   2e640:	e9 9b 93 ff ff       	jmp    279e0 <JS_CallInternal+0x2610>
   2e645:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2e64c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e650:	48 89 ce             	mov    %rcx,%rsi
   2e653:	44 89 85 c0 fd ff ff 	mov    %r8d,-0x240(%rbp)
   2e65a:	e8 c1 02 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e65f:	44 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8d
   2e666:	e9 f0 87 ff ff       	jmp    26e5b <JS_CallInternal+0x1a8b>
   2e66b:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   2e672:	0f b7 d1             	movzwl %cx,%edx
   2e675:	4c 89 ef             	mov    %r13,%rdi
   2e678:	31 c9                	xor    %ecx,%ecx
   2e67a:	49 83 c4 02          	add    $0x2,%r12
   2e67e:	e8 3d 7f 00 00       	call   365c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e683:	e9 78 75 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e688:	48 89 fe             	mov    %rdi,%rsi
   2e68b:	48 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%rdx
   2e692:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e696:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2e69c:	e8 7f 02 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e6a1:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2e6a7:	e9 a0 82 ff ff       	jmp    2694c <JS_CallInternal+0x157c>
   2e6ac:	48 83 ec 08          	sub    $0x8,%rsp
   2e6b0:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2e6b4:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
   2e6b8:	48 83 eb 10          	sub    $0x10,%rbx
   2e6bc:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2e6c3:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2e6c7:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2e6ce:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2e6d5:	49 89 f0             	mov    %rsi,%r8
   2e6d8:	49 89 f9             	mov    %rdi,%r9
   2e6db:	68 00 80 00 00       	push   $0x8000
   2e6e0:	4c 89 ef             	mov    %r13,%rdi
   2e6e3:	41 ff b5 88 01 00 00 	push   0x188(%r13)
   2e6ea:	48 89 c6             	mov    %rax,%rsi
   2e6ed:	41 ff b5 80 01 00 00 	push   0x180(%r13)
   2e6f4:	e8 f7 2b 00 00       	call   312f0 <JS_SetPropertyInternal>
   2e6f9:	48 83 c4 20          	add    $0x20,%rsp
   2e6fd:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2e704:	85 c0                	test   %eax,%eax
   2e706:	0f 89 58 7a ff ff    	jns    26164 <JS_CallInternal+0xd94>
   2e70c:	4d 89 dc             	mov    %r11,%r12
   2e70f:	e9 ec 74 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e714:	0f 1f 40 00          	nopl   0x0(%rax)
   2e718:	48 8d 35 87 ae 0a 00 	lea    0xaae87(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2e71f:	4c 89 ef             	mov    %r13,%rdi
   2e722:	31 c0                	xor    %eax,%eax
   2e724:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2e72b:	e8 10 5e 00 00       	call   34540 <JS_ThrowTypeError>
   2e730:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2e737:	e9 98 fa ff ff       	jmp    2e1d4 <JS_CallInternal+0x8e04>
   2e73c:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e740:	b8 08 00 00 00       	mov    $0x8,%eax
   2e745:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
   2e74a:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2e74f:	e9 2b c0 ff ff       	jmp    2a77f <JS_CallInternal+0x53af>
   2e754:	83 f8 08             	cmp    $0x8,%eax
   2e757:	0f 84 bb 10 00 00    	je     2f818 <JS_CallInternal+0xa448>
   2e75d:	83 f8 f9             	cmp    $0xfffffff9,%eax
   2e760:	0f 84 2e 0e 00 00    	je     2f594 <JS_CallInternal+0xa1c4>
   2e766:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2e76d:	49 8b 31             	mov    (%r9),%rsi
   2e770:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2e774:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e777:	0f 87 2e 0e 00 00    	ja     2f5ab <JS_CallInternal+0xa1db>
   2e77d:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
   2e784:	4c 89 ef             	mov    %r13,%rdi
   2e787:	48 83 eb 10          	sub    $0x10,%rbx
   2e78b:	48 8d b5 70 ff ff ff 	lea    -0x90(%rbp),%rsi
   2e792:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2e799:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2e7a0:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   2e7a7:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   2e7ae:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   2e7b5:	e8 26 90 02 00       	call   577e0 <js_add_slow>
   2e7ba:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   2e7c1:	85 c0                	test   %eax,%eax
   2e7c3:	0f 85 ad 1b 00 00    	jne    30376 <JS_CallInternal+0xafa6>
   2e7c9:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
   2e7d0:	49 8b 09             	mov    (%r9),%rcx
   2e7d3:	49 8b 41 08          	mov    0x8(%r9),%rax
   2e7d7:	49 89 11             	mov    %rdx,(%r9)
   2e7da:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
   2e7e1:	49 89 51 08          	mov    %rdx,0x8(%r9)
   2e7e5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e7e8:	0f 86 99 bf ff ff    	jbe    2a787 <JS_CallInternal+0x53b7>
   2e7ee:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2e7f1:	83 ea 01             	sub    $0x1,%edx
   2e7f4:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2e7f7:	85 d2                	test   %edx,%edx
   2e7f9:	0f 8f 88 bf ff ff    	jg     2a787 <JS_CallInternal+0x53b7>
   2e7ff:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e803:	48 89 c2             	mov    %rax,%rdx
   2e806:	48 89 ce             	mov    %rcx,%rsi
   2e809:	e8 12 01 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e80e:	e9 74 bf ff ff       	jmp    2a787 <JS_CallInternal+0x53b7>
   2e813:	48 83 eb 10          	sub    $0x10,%rbx
   2e817:	49 83 c4 04          	add    $0x4,%r12
   2e81b:	e9 e0 73 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e820:	49 83 c4 04          	add    $0x4,%r12
   2e824:	e9 d7 73 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e829:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e82d:	48 89 c2             	mov    %rax,%rdx
   2e830:	48 89 ce             	mov    %rcx,%rsi
   2e833:	e8 e8 00 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e838:	e9 a2 97 ff ff       	jmp    27fdf <JS_CallInternal+0x2c0f>
   2e83d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e841:	48 89 c2             	mov    %rax,%rdx
   2e844:	48 89 ce             	mov    %rcx,%rsi
   2e847:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   2e84e:	e8 cd 00 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e853:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   2e85a:	e9 3f 97 ff ff       	jmp    27f9e <JS_CallInternal+0x2bce>
   2e85f:	c7 85 ac fe ff ff ff 	movl   $0xffffffff,-0x154(%rbp)
   2e866:	ff ff ff 
   2e869:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2e86d:	83 fe f6             	cmp    $0xfffffff6,%esi
   2e870:	0f 87 13 0d 00 00    	ja     2f589 <JS_CallInternal+0xa1b9>
   2e876:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2e87d:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2e884:	00 
   2e885:	4d 89 dc             	mov    %r11,%r12
   2e888:	e9 73 73 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e88d:	0f 1f 00             	nopl   (%rax)
   2e890:	ba 01 00 00 00       	mov    $0x1,%edx
   2e895:	be 03 00 00 00       	mov    $0x3,%esi
   2e89a:	31 ff                	xor    %edi,%edi
   2e89c:	e9 7d d0 ff ff       	jmp    2b91e <JS_CallInternal+0x654e>
   2e8a1:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2e8a8:	e9 53 73 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e8ad:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e8b1:	48 89 c2             	mov    %rax,%rdx
   2e8b4:	48 89 ce             	mov    %rcx,%rsi
   2e8b7:	e8 64 00 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e8bc:	e9 08 d5 ff ff       	jmp    2bdc9 <JS_CallInternal+0x69f9>
   2e8c1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e8c5:	48 89 c2             	mov    %rax,%rdx
   2e8c8:	48 89 ce             	mov    %rcx,%rsi
   2e8cb:	e8 50 00 ff ff       	call   1e920 <__JS_FreeValueRT>
   2e8d0:	e9 18 d5 ff ff       	jmp    2bded <JS_CallInternal+0x6a1d>
   2e8d5:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   2e8dc:	0f b7 d1             	movzwl %cx,%edx
   2e8df:	4c 89 ff             	mov    %r15,%rdi
   2e8e2:	31 c9                	xor    %ecx,%ecx
   2e8e4:	49 83 c4 02          	add    $0x2,%r12
   2e8e8:	e8 d3 7c 00 00       	call   365c0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e8ed:	e9 0e 73 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e8f2:	31 c0                	xor    %eax,%eax
   2e8f4:	48 8d 35 82 ac 0a 00 	lea    0xaac82(%rip),%rsi        # d957d <_IO_stdin_used+0x57d>
   2e8fb:	4c 89 ef             	mov    %r13,%rdi
   2e8fe:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e905:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2e90c:	e8 0f 7e 00 00       	call   36720 <JS_ThrowInternalError>
   2e911:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2e914:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e91b:	76 1a                	jbe    2e937 <JS_CallInternal+0x9567>
   2e91d:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   2e924:	41 8b 40 fc          	mov    -0x4(%r8),%eax
   2e928:	83 e8 01             	sub    $0x1,%eax
   2e92b:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   2e92f:	85 c0                	test   %eax,%eax
   2e931:	0f 8e 83 0f 00 00    	jle    2f8ba <JS_CallInternal+0xa4ea>
   2e937:	48 89 cb             	mov    %rcx,%rbx
   2e93a:	e9 c1 72 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e93f:	4c 89 c3             	mov    %r8,%rbx
   2e942:	e9 b9 72 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e947:	4c 8b a5 c0 fd ff ff 	mov    -0x240(%rbp),%r12
   2e94e:	e9 ad 72 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e953:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2e95a:	e9 a1 72 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2e95f:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2e963:	e9 ef d7 ff ff       	jmp    2c157 <JS_CallInternal+0x6d87>
   2e968:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2e96c:	e9 d4 d6 ff ff       	jmp    2c045 <JS_CallInternal+0x6c75>
   2e971:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2e978:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e97c:	48 89 ce             	mov    %rcx,%rsi
   2e97f:	44 89 85 00 fe ff ff 	mov    %r8d,-0x200(%rbp)
   2e986:	e8 95 ff fe ff       	call   1e920 <__JS_FreeValueRT>
   2e98b:	44 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8d
   2e992:	e9 eb 84 ff ff       	jmp    26e82 <JS_CallInternal+0x1ab2>
   2e997:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e99b:	48 89 c2             	mov    %rax,%rdx
   2e99e:	48 89 ce             	mov    %rcx,%rsi
   2e9a1:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2e9a8:	e8 73 ff fe ff       	call   1e920 <__JS_FreeValueRT>
   2e9ad:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2e9b4:	e9 63 94 ff ff       	jmp    27e1c <JS_CallInternal+0x2a4c>
   2e9b9:	49 8b 45 10          	mov    0x10(%r13),%rax
   2e9bd:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e9c4:	48 85 c0             	test   %rax,%rax
   2e9c7:	0f 84 48 08 00 00    	je     2f215 <JS_CallInternal+0x9e45>
   2e9cd:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e9d1:	0f 84 3e 08 00 00    	je     2f215 <JS_CallInternal+0x9e45>
   2e9d7:	89 ce                	mov    %ecx,%esi
   2e9d9:	4c 89 ef             	mov    %r13,%rdi
   2e9dc:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2e9e2:	e8 79 7b 00 00       	call   36560 <JS_ThrowReferenceErrorNotDefined>
   2e9e7:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2e9ed:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e9f3:	0f 8e 07 72 ff ff    	jle    25c00 <JS_CallInternal+0x830>
   2e9f9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e9fd:	89 ce                	mov    %ecx,%esi
   2e9ff:	e8 2c c5 fe ff       	call   1af30 <JS_FreeAtom.part.0.isra.0>
   2ea04:	e9 f7 71 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2ea09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2ea10:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ea14:	48 89 c2             	mov    %rax,%rdx
   2ea17:	48 89 ce             	mov    %rcx,%rsi
   2ea1a:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2ea21:	e8 fa fe fe ff       	call   1e920 <__JS_FreeValueRT>
   2ea26:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2ea2d:	e9 cd 93 ff ff       	jmp    27dff <JS_CallInternal+0x2a2f>
   2ea32:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ea36:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2ea3d:	00 
   2ea3e:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2ea43:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2ea48:	e9 91 bd ff ff       	jmp    2a7de <JS_CallInternal+0x540e>
   2ea4d:	83 fa 08             	cmp    $0x8,%edx
   2ea50:	0f 84 28 0d 00 00    	je     2f77e <JS_CallInternal+0xa3ae>
   2ea56:	83 f8 08             	cmp    $0x8,%eax
   2ea59:	0f 84 f0 0c 00 00    	je     2f74f <JS_CallInternal+0xa37f>
   2ea5f:	8d 72 07             	lea    0x7(%rdx),%esi
   2ea62:	83 fe 01             	cmp    $0x1,%esi
   2ea65:	0f 86 6f 11 00 00    	jbe    2fbda <JS_CallInternal+0xa80a>
   2ea6b:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2ea72:	48 89 de             	mov    %rbx,%rsi
   2ea75:	4c 89 ef             	mov    %r13,%rdi
   2ea78:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ea7c:	e8 5f 8d 02 00       	call   577e0 <js_add_slow>
   2ea81:	85 c0                	test   %eax,%eax
   2ea83:	0f 84 55 bd ff ff    	je     2a7de <JS_CallInternal+0x540e>
   2ea89:	e9 72 71 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2ea8e:	66 90                	xchg   %ax,%ax
   2ea90:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   2ea97:	48 89 de             	mov    %rbx,%rsi
   2ea9a:	4c 89 ef             	mov    %r13,%rdi
   2ea9d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2eaa1:	e8 3a 43 02 00       	call   52de0 <js_shr_slow>
   2eaa6:	85 c0                	test   %eax,%eax
   2eaa8:	0f 85 52 71 ff ff    	jne    25c00 <JS_CallInternal+0x830>
   2eaae:	48 83 eb 10          	sub    $0x10,%rbx
   2eab2:	e9 67 8e ff ff       	jmp    2791e <JS_CallInternal+0x254e>
   2eab7:	44 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10d
   2eabe:	45 85 d2             	test   %r10d,%r10d
   2eac1:	74 42                	je     2eb05 <JS_CallInternal+0x9735>
   2eac3:	4c 89 c3             	mov    %r8,%rbx
   2eac6:	4f 8d 24 01          	lea    (%r9,%r8,1),%r12
   2eaca:	4d 89 c6             	mov    %r8,%r14
   2eacd:	eb 09                	jmp    2ead8 <JS_CallInternal+0x9708>
   2eacf:	48 83 c3 10          	add    $0x10,%rbx
   2ead3:	4c 39 e3             	cmp    %r12,%rbx
   2ead6:	74 2a                	je     2eb02 <JS_CallInternal+0x9732>
   2ead8:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2eadc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2eadf:	76 ee                	jbe    2eacf <JS_CallInternal+0x96ff>
   2eae1:	48 8b 0b             	mov    (%rbx),%rcx
   2eae4:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2eae7:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2eaea:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2eaed:	85 d2                	test   %edx,%edx
   2eaef:	7f de                	jg     2eacf <JS_CallInternal+0x96ff>
   2eaf1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eaf5:	48 89 c2             	mov    %rax,%rdx
   2eaf8:	48 89 ce             	mov    %rcx,%rsi
   2eafb:	e8 20 fe fe ff       	call   1e920 <__JS_FreeValueRT>
   2eb00:	eb cd                	jmp    2eacf <JS_CallInternal+0x96ff>
   2eb02:	4d 89 f0             	mov    %r14,%r8
   2eb05:	4c 8b a5 c0 fd ff ff 	mov    -0x240(%rbp),%r12
   2eb0c:	4c 89 c3             	mov    %r8,%rbx
   2eb0f:	e9 ec 70 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2eb14:	83 f9 fa             	cmp    $0xfffffffa,%ecx
   2eb17:	0f 8d 8d e1 ff ff    	jge    2ccaa <JS_CallInternal+0x78da>
   2eb1d:	83 f9 f8             	cmp    $0xfffffff8,%ecx
   2eb20:	0f 8c 84 e1 ff ff    	jl     2ccaa <JS_CallInternal+0x78da>
   2eb26:	e9 d4 e1 ff ff       	jmp    2ccff <JS_CallInternal+0x792f>
   2eb2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2eb30:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eb34:	48 89 c2             	mov    %rax,%rdx
   2eb37:	48 89 ce             	mov    %rcx,%rsi
   2eb3a:	4c 89 9d e0 fd ff ff 	mov    %r11,-0x220(%rbp)
   2eb41:	e8 da fd fe ff       	call   1e920 <__JS_FreeValueRT>
   2eb46:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   2eb4d:	e9 70 94 ff ff       	jmp    27fc2 <JS_CallInternal+0x2bf2>
   2eb52:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eb56:	48 89 c2             	mov    %rax,%rdx
   2eb59:	48 89 ce             	mov    %rcx,%rsi
   2eb5c:	e8 bf fd fe ff       	call   1e920 <__JS_FreeValueRT>
   2eb61:	e9 b7 d3 ff ff       	jmp    2bf1d <JS_CallInternal+0x6b4d>
   2eb66:	4c 89 ef             	mov    %r13,%rdi
   2eb69:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2eb70:	e8 6b 7c 00 00       	call   367e0 <__js_poll_interrupts>
   2eb75:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2eb7c:	85 c0                	test   %eax,%eax
   2eb7e:	0f 84 18 18 00 00    	je     3039c <JS_CallInternal+0xafcc>
   2eb84:	49 89 d4             	mov    %rdx,%r12
   2eb87:	e9 74 70 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2eb8c:	4c 89 ef             	mov    %r13,%rdi
   2eb8f:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2eb96:	e8 45 7c 00 00       	call   367e0 <__js_poll_interrupts>
   2eb9b:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2eba2:	85 c0                	test   %eax,%eax
   2eba4:	0f 84 2b 16 00 00    	je     301d5 <JS_CallInternal+0xae05>
   2ebaa:	49 89 d4             	mov    %rdx,%r12
   2ebad:	e9 4e 70 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2ebb2:	48 8d 35 fb a9 0a 00 	lea    0xaa9fb(%rip),%rsi        # d95b4 <_IO_stdin_used+0x5b4>
   2ebb9:	4c 89 ef             	mov    %r13,%rdi
   2ebbc:	31 c0                	xor    %eax,%eax
   2ebbe:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2ebc5:	e8 76 59 00 00       	call   34540 <JS_ThrowTypeError>
   2ebca:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2ebd1:	49 89 c0             	mov    %rax,%r8
   2ebd4:	48 89 d0             	mov    %rdx,%rax
   2ebd7:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2ebdb:	48 8b 11             	mov    (%rcx),%rdx
   2ebde:	41 89 c1             	mov    %eax,%r9d
   2ebe1:	e9 f0 bc ff ff       	jmp    2a8d6 <JS_CallInternal+0x5506>
   2ebe6:	48 83 c3 10          	add    $0x10,%rbx
   2ebea:	49 83 c4 02          	add    $0x2,%r12
   2ebee:	e9 0d 70 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2ebf3:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ebf7:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2ebfe:	00 
   2ebff:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2ec04:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2ec09:	e9 0b bb ff ff       	jmp    2a719 <JS_CallInternal+0x5349>
   2ec0e:	83 fa 08             	cmp    $0x8,%edx
   2ec11:	0f 84 16 0f 00 00    	je     2fb2d <JS_CallInternal+0xa75d>
   2ec17:	83 f8 08             	cmp    $0x8,%eax
   2ec1a:	0f 85 96 bf ff ff    	jne    2abb6 <JS_CallInternal+0x57e6>
   2ec20:	85 d2                	test   %edx,%edx
   2ec22:	0f 85 8e bf ff ff    	jne    2abb6 <JS_CallInternal+0x57e6>
   2ec28:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ec2c:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2ec30:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2ec35:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   2ec39:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2ec40:	00 
   2ec41:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2ec46:	e9 ce ba ff ff       	jmp    2a719 <JS_CallInternal+0x5349>
   2ec4b:	49 8b 40 08          	mov    0x8(%r8),%rax
   2ec4f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ec52:	0f 86 a8 6f ff ff    	jbe    25c00 <JS_CallInternal+0x830>
   2ec58:	49 8b 10             	mov    (%r8),%rdx
   2ec5b:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2ec5e:	83 e9 01             	sub    $0x1,%ecx
   2ec61:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2ec64:	85 c9                	test   %ecx,%ecx
   2ec66:	0f 8f 94 6f ff ff    	jg     25c00 <JS_CallInternal+0x830>
   2ec6c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2ec71:	e9 0b ea ff ff       	jmp    2d681 <JS_CallInternal+0x82b1>
   2ec76:	48 8d 35 29 a9 0a 00 	lea    0xaa929(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2ec7d:	4c 89 ef             	mov    %r13,%rdi
   2ec80:	31 c0                	xor    %eax,%eax
   2ec82:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2ec89:	e8 b2 58 00 00       	call   34540 <JS_ThrowTypeError>
   2ec8e:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2ec95:	49 89 c0             	mov    %rax,%r8
   2ec98:	48 89 d0             	mov    %rdx,%rax
   2ec9b:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2ec9f:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2eca3:	41 89 c1             	mov    %eax,%r9d
   2eca6:	e9 2b bc ff ff       	jmp    2a8d6 <JS_CallInternal+0x5506>
   2ecab:	8b 06                	mov    (%rsi),%eax
   2ecad:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ecb2:	0f 85 eb bb ff ff    	jne    2a8a3 <JS_CallInternal+0x54d3>
   2ecb8:	48 8b bd b8 fd ff ff 	mov    -0x248(%rbp),%rdi
   2ecbf:	44 89 c2             	mov    %r8d,%edx
   2ecc2:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ecc6:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2eccd:	e8 3e a0 fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2ecd2:	48 8d 35 4f e1 0a 00 	lea    0xae14f(%rip),%rsi        # dce28 <_IO_stdin_used+0x3e28>
   2ecd9:	4c 89 ef             	mov    %r13,%rdi
   2ecdc:	48 89 c2             	mov    %rax,%rdx
   2ecdf:	31 c0                	xor    %eax,%eax
   2ece1:	e8 5a 58 00 00       	call   34540 <JS_ThrowTypeError>
   2ece6:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2eced:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2ecf1:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2ecf5:	0f 87 6d 09 00 00    	ja     2f668 <JS_CallInternal+0xa298>
   2ecfb:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2ed02:	48 8b 70 08          	mov    0x8(%rax),%rsi
   2ed06:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ed09:	0f 87 8b 0a 00 00    	ja     2f79a <JS_CallInternal+0xa3ca>
   2ed0f:	45 31 d2             	xor    %r10d,%r10d
   2ed12:	48 c7 43 e8 06 00 00 	movq   $0x6,-0x18(%rbx)
   2ed19:	00 
   2ed1a:	4c 89 53 e0          	mov    %r10,-0x20(%rbx)
   2ed1e:	48 89 cb             	mov    %rcx,%rbx
   2ed21:	e9 da 6e ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2ed26:	0f 85 3e 15 00 00    	jne    3026a <JS_CallInternal+0xae9a>
   2ed2c:	49 8b 45 10          	mov    0x10(%r13),%rax
   2ed30:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2ed37:	48 85 c0             	test   %rax,%rax
   2ed3a:	0f 84 48 90 ff ff    	je     27d88 <JS_CallInternal+0x29b8>
   2ed40:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2ed44:	0f 84 3e 90 ff ff    	je     27d88 <JS_CallInternal+0x29b8>
   2ed4a:	89 ce                	mov    %ecx,%esi
   2ed4c:	4c 89 ef             	mov    %r13,%rdi
   2ed4f:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2ed55:	e8 06 78 00 00       	call   36560 <JS_ThrowReferenceErrorNotDefined>
   2ed5a:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2ed60:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2ed66:	0f 8e 94 6e ff ff    	jle    25c00 <JS_CallInternal+0x830>
   2ed6c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed70:	89 ce                	mov    %ecx,%esi
   2ed72:	e8 b9 c1 fe ff       	call   1af30 <JS_FreeAtom.part.0.isra.0>
   2ed77:	e9 84 6e ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2ed7c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed80:	48 89 ce             	mov    %rcx,%rsi
   2ed83:	4c 89 c2             	mov    %r8,%rdx
   2ed86:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2ed8c:	e8 8f fb fe ff       	call   1e920 <__JS_FreeValueRT>
   2ed91:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2ed97:	e9 6b 87 ff ff       	jmp    27507 <JS_CallInternal+0x2137>
   2ed9c:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2eda3:	e9 58 6e ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2eda8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2edac:	89 85 e0 fd ff ff    	mov    %eax,-0x220(%rbp)
   2edb2:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2edb9:	e8 62 fb fe ff       	call   1e920 <__JS_FreeValueRT>
   2edbe:	8b 85 e0 fd ff ff    	mov    -0x220(%rbp),%eax
   2edc4:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   2edcb:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2edd2:	e9 19 87 ff ff       	jmp    274f0 <JS_CallInternal+0x2120>
   2edd7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eddb:	4c 89 d6             	mov    %r10,%rsi
   2edde:	4c 89 da             	mov    %r11,%rdx
   2ede1:	e8 3a fb fe ff       	call   1e920 <__JS_FreeValueRT>
   2ede6:	e9 c4 96 ff ff       	jmp    284af <JS_CallInternal+0x30df>
   2edeb:	39 c1                	cmp    %eax,%ecx
   2eded:	0f 85 8a db ff ff    	jne    2c97d <JS_CallInternal+0x75ad>
   2edf3:	0f b6 4a 10          	movzbl 0x10(%rdx),%ecx
   2edf7:	f7 d1                	not    %ecx
   2edf9:	83 e1 12             	and    $0x12,%ecx
   2edfc:	0f 85 7b db ff ff    	jne    2c97d <JS_CallInternal+0x75ad>
   2ee02:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
   2ee06:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2ee0a:	48 85 c9             	test   %rcx,%rcx
   2ee0d:	74 0a                	je     2ee19 <JS_CallInternal+0x9a49>
   2ee0f:	f6 41 10 01          	testb  $0x1,0x10(%rcx)
   2ee13:	0f 84 64 db ff ff    	je     2c97d <JS_CallInternal+0x75ad>
   2ee19:	48 8b 72 20          	mov    0x20(%rdx),%rsi
   2ee1d:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   2ee21:	0f 85 56 db ff ff    	jne    2c97d <JS_CallInternal+0x75ad>
   2ee27:	8d 48 01             	lea    0x1(%rax),%ecx
   2ee2a:	39 4a 28             	cmp    %ecx,0x28(%rdx)
   2ee2d:	0f 82 4a db ff ff    	jb     2c97d <JS_CallInternal+0x75ad>
   2ee33:	39 0e                	cmp    %ecx,(%rsi)
   2ee35:	73 1b                	jae    2ee52 <JS_CallInternal+0x9a82>
   2ee37:	44 8b 47 18          	mov    0x18(%rdi),%r8d
   2ee3b:	42 f6 44 87 3f 08    	testb  $0x8,0x3f(%rdi,%r8,4)
   2ee41:	0f 84 36 db ff ff    	je     2c97d <JS_CallInternal+0x75ad>
   2ee47:	89 cf                	mov    %ecx,%edi
   2ee49:	48 89 3e             	mov    %rdi,(%rsi)
   2ee4c:	31 ff                	xor    %edi,%edi
   2ee4e:	48 89 7e 08          	mov    %rdi,0x8(%rsi)
   2ee52:	89 4a 38             	mov    %ecx,0x38(%rdx)
   2ee55:	89 c0                	mov    %eax,%eax
   2ee57:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2ee5c:	48 c1 e0 04          	shl    $0x4,%rax
   2ee60:	48 03 42 30          	add    0x30(%rdx),%rax
   2ee64:	0f 11 00             	movups %xmm0,(%rax)
   2ee67:	e9 35 90 ff ff       	jmp    27ea1 <JS_CallInternal+0x2ad1>
   2ee6c:	0f 1f 40 00          	nopl   0x0(%rax)
   2ee70:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee74:	48 89 c2             	mov    %rax,%rdx
   2ee77:	48 89 ce             	mov    %rcx,%rsi
   2ee7a:	e8 a1 fa fe ff       	call   1e920 <__JS_FreeValueRT>
   2ee7f:	e9 3e 90 ff ff       	jmp    27ec2 <JS_CallInternal+0x2af2>
   2ee84:	48 8b 08             	mov    (%rax),%rcx
   2ee87:	41 8b bd a8 01 00 00 	mov    0x1a8(%r13),%edi
   2ee8e:	41 89 f2             	mov    %esi,%r10d
   2ee91:	44 8b 02             	mov    (%rdx),%r8d
   2ee94:	41 89 c9             	mov    %ecx,%r9d
   2ee97:	83 ff 01             	cmp    $0x1,%edi
   2ee9a:	0f 8e 33 08 00 00    	jle    2f6d3 <JS_CallInternal+0xa303>
   2eea0:	44 8d 4f fd          	lea    -0x3(%rdi),%r9d
   2eea4:	8d 77 ff             	lea    -0x1(%rdi),%esi
   2eea7:	83 ef 02             	sub    $0x2,%edi
   2eeaa:	48 63 c9             	movslq %ecx,%rcx
   2eead:	83 e7 fe             	and    $0xfffffffe,%edi
   2eeb0:	41 29 f9             	sub    %edi,%r9d
   2eeb3:	45 89 cb             	mov    %r9d,%r11d
   2eeb6:	41 39 ca             	cmp    %ecx,%r10d
   2eeb9:	7e 46                	jle    2ef01 <JS_CallInternal+0x9b31>
   2eebb:	49 63 f8             	movslq %r8d,%rdi
   2eebe:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   2eec4:	48 01 cf             	add    %rcx,%rdi
   2eec7:	4c 01 cf             	add    %r9,%rdi
   2eeca:	49 81 c1 ff ff ff 7f 	add    $0x7fffffff,%r9
   2eed1:	49 39 f9             	cmp    %rdi,%r9
   2eed4:	0f 82 66 14 00 00    	jb     30340 <JS_CallInternal+0xaf70>
   2eeda:	41 01 c8             	add    %ecx,%r8d
   2eedd:	44 8d 49 01          	lea    0x1(%rcx),%r9d
   2eee1:	83 fe 01             	cmp    $0x1,%esi
   2eee4:	0f 84 27 0a 00 00    	je     2f911 <JS_CallInternal+0xa541>
   2eeea:	8d 7e fe             	lea    -0x2(%rsi),%edi
   2eeed:	48 83 c1 01          	add    $0x1,%rcx
   2eef1:	44 39 df             	cmp    %r11d,%edi
   2eef4:	0f 84 cf 07 00 00    	je     2f6c9 <JS_CallInternal+0xa2f9>
   2eefa:	89 fe                	mov    %edi,%esi
   2eefc:	41 39 ca             	cmp    %ecx,%r10d
   2eeff:	7f ba                	jg     2eebb <JS_CallInternal+0x9aeb>
   2ef01:	83 e1 ff             	and    $0xffffffff,%ecx
   2ef04:	41 89 b5 a8 01 00 00 	mov    %esi,0x1a8(%r13)
   2ef0b:	31 f6                	xor    %esi,%esi
   2ef0d:	48 89 08             	mov    %rcx,(%rax)
   2ef10:	31 c9                	xor    %ecx,%ecx
   2ef12:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2ef16:	44 89 c0             	mov    %r8d,%eax
   2ef19:	48 89 02             	mov    %rax,(%rdx)
   2ef1c:	48 8b 85 40 fd ff ff 	mov    -0x2c0(%rbp),%rax
   2ef23:	48 89 72 08          	mov    %rsi,0x8(%rdx)
   2ef27:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2ef2b:	0f b6 00             	movzbl (%rax),%eax
   2ef2e:	49 89 c2             	mov    %rax,%r10
   2ef31:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2ef35:	0f 1f 00             	nopl   (%rax)
   2ef38:	48 92                	xchg   %rax,%rdx
   2ef3a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ef3e:	48 89 c6             	mov    %rax,%rsi
   2ef41:	e8 da f9 fe ff       	call   1e920 <__JS_FreeValueRT>
   2ef46:	e9 0d 77 ff ff       	jmp    26658 <JS_CallInternal+0x1288>
   2ef4b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ef4f:	48 89 ce             	mov    %rcx,%rsi
   2ef52:	e8 c9 f9 fe ff       	call   1e920 <__JS_FreeValueRT>
   2ef57:	e9 45 8f ff ff       	jmp    27ea1 <JS_CallInternal+0x2ad1>
   2ef5c:	4c 89 db             	mov    %r11,%rbx
   2ef5f:	e9 9c 6c ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2ef64:	8b 02                	mov    (%rdx),%eax
   2ef66:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ef6b:	0f 85 96 ba ff ff    	jne    2aa07 <JS_CallInternal+0x5637>
   2ef71:	48 8d 0d cc a1 0a 00 	lea    0xaa1cc(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   2ef78:	48 8d 15 a9 de 0a 00 	lea    0xadea9(%rip),%rdx        # dce28 <_IO_stdin_used+0x3e28>
   2ef7f:	4c 89 ef             	mov    %r13,%rdi
   2ef82:	31 c0                	xor    %eax,%eax
   2ef84:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2ef8b:	e8 c0 57 00 00       	call   34750 <__JS_ThrowTypeErrorAtom>
   2ef90:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2ef97:	e9 38 f2 ff ff       	jmp    2e1d4 <JS_CallInternal+0x8e04>
   2ef9c:	0f 1f 40 00          	nopl   0x0(%rax)
   2efa0:	09 ca                	or     %ecx,%edx
   2efa2:	0f 89 07 b7 ff ff    	jns    2a6af <JS_CallInternal+0x52df>
   2efa8:	f2 0f 10 05 30 7b 0b 	movsd  0xb7b30(%rip),%xmm0        # e6ae0 <typed_array_size_log2+0x28>
   2efaf:	00 
   2efb0:	e9 5d f1 ff ff       	jmp    2e112 <JS_CallInternal+0x8d42>
   2efb5:	0f 1f 00             	nopl   (%rax)
   2efb8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2efbc:	48 89 ce             	mov    %rcx,%rsi
   2efbf:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2efc6:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2efcd:	e8 4e f9 fe ff       	call   1e920 <__JS_FreeValueRT>
   2efd2:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2efd9:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2efe0:	e9 b1 94 ff ff       	jmp    28496 <JS_CallInternal+0x30c6>
   2efe5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2efe9:	89 ca                	mov    %ecx,%edx
   2efeb:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2efef:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2eff6:	e8 15 9d fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2effb:	48 8d 35 57 a5 0a 00 	lea    0xaa557(%rip),%rsi        # d9559 <_IO_stdin_used+0x559>
   2f002:	4c 89 ef             	mov    %r13,%rdi
   2f005:	48 89 c2             	mov    %rax,%rdx
   2f008:	31 c0                	xor    %eax,%eax
   2f00a:	e8 31 55 00 00       	call   34540 <JS_ThrowTypeError>
   2f00f:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2f016:	e9 e5 6b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f01b:	48 8d 15 9b a4 0a 00 	lea    0xaa49b(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2f022:	85 c9                	test   %ecx,%ecx
   2f024:	0f 85 99 07 00 00    	jne    2f7c3 <JS_CallInternal+0xa3f3>
   2f02a:	48 8d 35 e8 a4 0a 00 	lea    0xaa4e8(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2f031:	4c 89 ef             	mov    %r13,%rdi
   2f034:	31 c0                	xor    %eax,%eax
   2f036:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2f03d:	e8 de 73 00 00       	call   36420 <JS_ThrowReferenceError>
   2f042:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2f049:	e9 b2 6b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f04e:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2f055:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2f05c:	00 
   2f05d:	e9 56 c5 ff ff       	jmp    2b5b8 <JS_CallInternal+0x61e8>
   2f062:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2f068:	7e 21                	jle    2f08b <JS_CallInternal+0x9cbb>
   2f06a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f06e:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2f075:	48 8b 34 d0          	mov    (%rax,%rdx,8),%rsi
   2f079:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2f07c:	83 e8 01             	sub    $0x1,%eax
   2f07f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2f082:	85 c0                	test   %eax,%eax
   2f084:	7f 05                	jg     2f08b <JS_CallInternal+0x9cbb>
   2f086:	e8 15 79 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f08b:	48 8d 35 5e dc 0a 00 	lea    0xadc5e(%rip),%rsi        # dccf0 <_IO_stdin_used+0x3cf0>
   2f092:	4c 89 ef             	mov    %r13,%rdi
   2f095:	31 c0                	xor    %eax,%eax
   2f097:	e8 a4 54 00 00       	call   34540 <JS_ThrowTypeError>
   2f09c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2f0a3:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2f0aa:	00 
   2f0ab:	e9 1d b0 ff ff       	jmp    2a0cd <JS_CallInternal+0x4cfd>
   2f0b0:	48 89 f2             	mov    %rsi,%rdx
   2f0b3:	48 89 fe             	mov    %rdi,%rsi
   2f0b6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f0ba:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2f0c1:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2f0c8:	44 89 85 e0 fd ff ff 	mov    %r8d,-0x220(%rbp)
   2f0cf:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   2f0d6:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2f0dd:	e8 3e f8 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f0e2:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   2f0e9:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2f0f0:	44 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8d
   2f0f7:	4c 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%r10
   2f0fe:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2f105:	e9 3f e2 ff ff       	jmp    2d349 <JS_CallInternal+0x7f79>
   2f10a:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f110:	0f 8f 55 0d 00 00    	jg     2fe6b <JS_CallInternal+0xaa9b>
   2f116:	31 d2                	xor    %edx,%edx
   2f118:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2f11e:	e9 8c 8f ff ff       	jmp    280af <JS_CallInternal+0x2cdf>
   2f123:	48 89 f2             	mov    %rsi,%rdx
   2f126:	48 89 fe             	mov    %rdi,%rsi
   2f129:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f12d:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2f134:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2f13b:	e8 e0 f7 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f140:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2f147:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2f14e:	e9 06 d2 ff ff       	jmp    2c359 <JS_CallInternal+0x6f89>
   2f153:	48 89 f2             	mov    %rsi,%rdx
   2f156:	48 89 fe             	mov    %rdi,%rsi
   2f159:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f15d:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2f164:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2f16b:	e8 b0 f7 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f170:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2f177:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2f17e:	e9 5d 76 ff ff       	jmp    267e0 <JS_CallInternal+0x1410>
   2f183:	0f 85 2e 6e ff ff    	jne    25fb7 <JS_CallInternal+0xbe7>
   2f189:	49 8b 45 10          	mov    0x10(%r13),%rax
   2f18d:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2f194:	48 85 c0             	test   %rax,%rax
   2f197:	0f 84 a4 6d ff ff    	je     25f41 <JS_CallInternal+0xb71>
   2f19d:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2f1a1:	0f 84 9a 6d ff ff    	je     25f41 <JS_CallInternal+0xb71>
   2f1a7:	8b b5 c0 fd ff ff    	mov    -0x240(%rbp),%esi
   2f1ad:	4c 89 ef             	mov    %r13,%rdi
   2f1b0:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2f1b7:	e8 a4 73 00 00       	call   36560 <JS_ThrowReferenceErrorNotDefined>
   2f1bc:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2f1c3:	e9 ef 6d ff ff       	jmp    25fb7 <JS_CallInternal+0xbe7>
   2f1c8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f1cc:	48 89 ca             	mov    %rcx,%rdx
   2f1cf:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%rbp)
   2f1d5:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2f1dc:	e8 3f f7 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f1e1:	8b 85 f8 fd ff ff    	mov    -0x208(%rbp),%eax
   2f1e7:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2f1ee:	e9 b9 6d ff ff       	jmp    25fac <JS_CallInternal+0xbdc>
   2f1f3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f1f7:	48 89 c2             	mov    %rax,%rdx
   2f1fa:	48 89 ce             	mov    %rcx,%rsi
   2f1fd:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   2f204:	e8 17 f7 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f209:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2f210:	e9 d1 6e ff ff       	jmp    260e6 <JS_CallInternal+0xd16>
   2f215:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2f21c:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2f223:	83 fa f6             	cmp    $0xfffffff6,%edx
   2f226:	76 04                	jbe    2f22c <JS_CallInternal+0x9e5c>
   2f228:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2f22c:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2f230:	48 89 53 d8          	mov    %rdx,-0x28(%rbx)
   2f234:	e9 19 8b ff ff       	jmp    27d52 <JS_CallInternal+0x2982>
   2f239:	f2 0f 10 05 07 02 0b 	movsd  0xb0207(%rip),%xmm0        # df448 <__PRETTY_FUNCTION__.0+0xb8>
   2f240:	00 
   2f241:	e9 af d0 ff ff       	jmp    2c2f5 <JS_CallInternal+0x6f25>
   2f246:	48 8b bd 78 fe ff ff 	mov    -0x188(%rbp),%rdi
   2f24d:	4c 89 c6             	mov    %r8,%rsi
   2f250:	e8 ab 38 ff ff       	call   22b00 <free_var_ref>
   2f255:	e9 8d 69 ff ff       	jmp    25be7 <JS_CallInternal+0x817>
   2f25a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f25e:	48 89 c2             	mov    %rax,%rdx
   2f261:	48 89 ce             	mov    %rcx,%rsi
   2f264:	e8 b7 f6 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f269:	e9 22 d1 ff ff       	jmp    2c390 <JS_CallInternal+0x6fc0>
   2f26e:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2f273:	0f 85 78 bd ff ff    	jne    2aff1 <JS_CallInternal+0x5c21>
   2f279:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2f27d:	0f 85 6e bd ff ff    	jne    2aff1 <JS_CallInternal+0x5c21>
   2f283:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   2f287:	0f 84 64 bd ff ff    	je     2aff1 <JS_CallInternal+0x5c21>
   2f28d:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2f291:	45 31 c0             	xor    %r8d,%r8d
   2f294:	48 c1 fa 04          	sar    $0x4,%rdx
   2f298:	49 8b 02             	mov    (%r10),%rax
   2f29b:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f29f:	49 89 3a             	mov    %rdi,(%r10)
   2f2a2:	4d 89 42 08          	mov    %r8,0x8(%r10)
   2f2a6:	41 89 52 10          	mov    %edx,0x10(%r10)
   2f2aa:	48 85 f6             	test   %rsi,%rsi
   2f2ad:	74 33                	je     2f2e2 <JS_CallInternal+0x9f12>
   2f2af:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f2b3:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   2f2ba:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2f2c1:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f2c8:	e8 e3 12 ff ff       	call   205b0 <js_free_shape>
   2f2cd:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
   2f2d4:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   2f2db:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f2e2:	48 85 c0             	test   %rax,%rax
   2f2e5:	0f 84 06 bd ff ff    	je     2aff1 <JS_CallInternal+0x5c21>
   2f2eb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f2ef:	48 89 c6             	mov    %rax,%rsi
   2f2f2:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2f2f9:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f300:	e8 ab 12 ff ff       	call   205b0 <js_free_shape>
   2f305:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f30c:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   2f313:	e9 d9 bc ff ff       	jmp    2aff1 <JS_CallInternal+0x5c21>
   2f318:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2f31f:	00 
   2f320:	48 89 f2             	mov    %rsi,%rdx
   2f323:	48 89 fe             	mov    %rdi,%rsi
   2f326:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f32a:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2f331:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f338:	e8 e3 f5 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f33d:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2f344:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f34b:	e9 df d1 ff ff       	jmp    2c52f <JS_CallInternal+0x715f>
   2f350:	0f 85 61 6c ff ff    	jne    25fb7 <JS_CallInternal+0xbe7>
   2f356:	49 8b 45 10          	mov    0x10(%r13),%rax
   2f35a:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2f361:	48 85 c0             	test   %rax,%rax
   2f364:	74 0a                	je     2f370 <JS_CallInternal+0x9fa0>
   2f366:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2f36a:	0f 85 37 fe ff ff    	jne    2f1a7 <JS_CallInternal+0x9dd7>
   2f370:	b8 03 00 00 00       	mov    $0x3,%eax
   2f375:	31 c9                	xor    %ecx,%ecx
   2f377:	e9 cb 6c ff ff       	jmp    26047 <JS_CallInternal+0xc77>
   2f37c:	8b 85 40 fe ff ff    	mov    -0x1c0(%rbp),%eax
   2f382:	83 e8 02             	sub    $0x2,%eax
   2f385:	83 f8 01             	cmp    $0x1,%eax
   2f388:	0f 87 5a 04 00 00    	ja     2f7e8 <JS_CallInternal+0xa418>
   2f38e:	49 8b 85 88 01 00 00 	mov    0x188(%r13),%rax
   2f395:	49 8b 95 80 01 00 00 	mov    0x180(%r13),%rdx
   2f39c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2f39f:	0f 86 31 a8 ff ff    	jbe    29bd6 <JS_CallInternal+0x4806>
   2f3a5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2f3a9:	e9 28 a8 ff ff       	jmp    29bd6 <JS_CallInternal+0x4806>
   2f3ae:	48 8d 35 ab d9 0a 00 	lea    0xad9ab(%rip),%rsi        # dcd60 <_IO_stdin_used+0x3d60>
   2f3b5:	4c 89 ef             	mov    %r13,%rdi
   2f3b8:	31 c0                	xor    %eax,%eax
   2f3ba:	e8 81 51 00 00       	call   34540 <JS_ThrowTypeError>
   2f3bf:	e9 3c 68 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f3c4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f3c8:	4c 89 d6             	mov    %r10,%rsi
   2f3cb:	4c 89 da             	mov    %r11,%rdx
   2f3ce:	89 85 f8 fd ff ff    	mov    %eax,-0x208(%rbp)
   2f3d4:	e8 47 f5 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f3d9:	8b 85 f8 fd ff ff    	mov    -0x208(%rbp),%eax
   2f3df:	e9 05 d7 ff ff       	jmp    2cae9 <JS_CallInternal+0x7719>
   2f3e4:	8b 08                	mov    (%rax),%ecx
   2f3e6:	81 e1 ff ff ff 03    	and    $0x3ffffff,%ecx
   2f3ec:	0f 85 1f 79 ff ff    	jne    26d11 <JS_CallInternal+0x1941>
   2f3f2:	31 c0                	xor    %eax,%eax
   2f3f4:	e9 2e 79 ff ff       	jmp    26d27 <JS_CallInternal+0x1957>
   2f3f9:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2f3ff:	0f 85 26 bb ff ff    	jne    2af2b <JS_CallInternal+0x5b5b>
   2f405:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2f40a:	0f 85 1b bb ff ff    	jne    2af2b <JS_CallInternal+0x5b5b>
   2f410:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2f414:	0f 84 11 bb ff ff    	je     2af2b <JS_CallInternal+0x5b5b>
   2f41a:	49 8b 79 08          	mov    0x8(%r9),%rdi
   2f41e:	4d 8b 01             	mov    (%r9),%r8
   2f421:	48 c1 fe 04          	sar    $0x4,%rsi
   2f425:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2f429:	49 89 11             	mov    %rdx,(%r9)
   2f42c:	31 d2                	xor    %edx,%edx
   2f42e:	49 89 51 08          	mov    %rdx,0x8(%r9)
   2f432:	41 89 71 10          	mov    %esi,0x10(%r9)
   2f436:	48 85 ff             	test   %rdi,%rdi
   2f439:	74 36                	je     2f471 <JS_CallInternal+0xa0a1>
   2f43b:	48 89 fe             	mov    %rdi,%rsi
   2f43e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f442:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2f449:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2f450:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2f457:	e8 54 11 ff ff       	call   205b0 <js_free_shape>
   2f45c:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2f463:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2f46a:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2f471:	4d 85 c0             	test   %r8,%r8
   2f474:	0f 84 b1 ba ff ff    	je     2af2b <JS_CallInternal+0x5b5b>
   2f47a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f47e:	4c 89 c6             	mov    %r8,%rsi
   2f481:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   2f488:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2f48f:	e8 1c 11 ff ff       	call   205b0 <js_free_shape>
   2f494:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2f49b:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   2f4a2:	e9 84 ba ff ff       	jmp    2af2b <JS_CallInternal+0x5b5b>
   2f4a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2f4ae:	00 00 
   2f4b0:	48 63 b5 70 fe ff ff 	movslq -0x190(%rbp),%rsi
   2f4b7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f4bb:	48 89 95 c0 fd ff ff 	mov    %rdx,-0x240(%rbp)
   2f4c2:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2f4c9:	48 c1 e6 04          	shl    $0x4,%rsi
   2f4cd:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
   2f4d4:	e8 a7 69 fe ff       	call   15e80 <__js_malloc>
   2f4d9:	4c 8b 95 60 fe ff ff 	mov    -0x1a0(%rbp),%r10
   2f4e0:	48 8b b5 e0 fd ff ff 	mov    -0x220(%rbp),%rsi
   2f4e7:	48 89 c2             	mov    %rax,%rdx
   2f4ea:	31 c0                	xor    %eax,%eax
   2f4ec:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2f4f3:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   2f4fa:	48 85 d2             	test   %rdx,%rdx
   2f4fd:	0f 84 12 0d 00 00    	je     30215 <JS_CallInternal+0xae45>
   2f503:	4d 8b 4c 02 08       	mov    0x8(%r10,%rax,1),%r9
   2f508:	49 8b 3c 02          	mov    (%r10,%rax,1),%rdi
   2f50c:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2f510:	76 04                	jbe    2f516 <JS_CallInternal+0xa146>
   2f512:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f516:	48 89 3c 02          	mov    %rdi,(%rdx,%rax,1)
   2f51a:	4c 89 4c 02 08       	mov    %r9,0x8(%rdx,%rax,1)
   2f51f:	48 83 c0 10          	add    $0x10,%rax
   2f523:	48 39 c6             	cmp    %rax,%rsi
   2f526:	75 db                	jne    2f503 <JS_CallInternal+0xa133>
   2f528:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   2f52e:	48 89 51 30          	mov    %rdx,0x30(%rcx)
   2f532:	89 41 38             	mov    %eax,0x38(%rcx)
   2f535:	48 89 0b             	mov    %rcx,(%rbx)
   2f538:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   2f53c:	e9 18 aa ff ff       	jmp    29f59 <JS_CallInternal+0x4b89>
   2f541:	85 c9                	test   %ecx,%ecx
   2f543:	0f 85 55 d7 ff ff    	jne    2cc9e <JS_CallInternal+0x78ce>
   2f549:	e9 b1 d7 ff ff       	jmp    2ccff <JS_CallInternal+0x792f>
   2f54e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f552:	48 89 f2             	mov    %rsi,%rdx
   2f555:	48 89 ce             	mov    %rcx,%rsi
   2f558:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2f55e:	e8 bd f3 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f563:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2f569:	e9 68 d4 ff ff       	jmp    2c9d6 <JS_CallInternal+0x7606>
   2f56e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f572:	48 89 c2             	mov    %rax,%rdx
   2f575:	48 89 ce             	mov    %rcx,%rsi
   2f578:	e8 a3 f3 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f57d:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   2f584:	e9 c8 bb ff ff       	jmp    2b151 <JS_CallInternal+0x5d81>
   2f589:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2f58f:	e9 a1 dd ff ff       	jmp    2d335 <JS_CallInternal+0x7f65>
   2f594:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2f597:	0f 84 0d 0e 00 00    	je     303aa <JS_CallInternal+0xafda>
   2f59d:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2f5a4:	49 8b 31             	mov    (%r9),%rsi
   2f5a7:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2f5ab:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2f5af:	e9 c9 f1 ff ff       	jmp    2e77d <JS_CallInternal+0x93ad>
   2f5b4:	4c 39 da             	cmp    %r11,%rdx
   2f5b7:	0f 85 ec b8 ff ff    	jne    2aea9 <JS_CallInternal+0x5ad9>
   2f5bd:	41 8b 41 10          	mov    0x10(%r9),%eax
   2f5c1:	83 f8 ff             	cmp    $0xffffffff,%eax
   2f5c4:	0f 84 df b8 ff ff    	je     2aea9 <JS_CallInternal+0x5ad9>
   2f5ca:	48 c1 e0 04          	shl    $0x4,%rax
   2f5ce:	49 03 42 20          	add    0x20(%r10),%rax
   2f5d2:	48 8b 10             	mov    (%rax),%rdx
   2f5d5:	48 8b 40 08          	mov    0x8(%rax),%rax
   2f5d9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2f5dc:	0f 86 95 d8 ff ff    	jbe    2ce77 <JS_CallInternal+0x7aa7>
   2f5e2:	e9 8c d8 ff ff       	jmp    2ce73 <JS_CallInternal+0x7aa3>
   2f5e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2f5ee:	00 00 
   2f5f0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f5f4:	89 f2                	mov    %esi,%edx
   2f5f6:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f5fa:	e8 11 97 fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2f5ff:	48 89 c2             	mov    %rax,%rdx
   2f602:	e9 1d 9e ff ff       	jmp    29424 <JS_CallInternal+0x4054>
   2f607:	f2 0f 10 05 d1 74 0b 	movsd  0xb74d1(%rip),%xmm0        # e6ae0 <typed_array_size_log2+0x28>
   2f60e:	00 
   2f60f:	e9 e1 cc ff ff       	jmp    2c2f5 <JS_CallInternal+0x6f25>
   2f614:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2f618:	0f 86 a5 f4 ff ff    	jbe    2eac3 <JS_CallInternal+0x96f3>
   2f61e:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2f621:	83 e8 01             	sub    $0x1,%eax
   2f624:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2f627:	85 c0                	test   %eax,%eax
   2f629:	0f 8f 94 f4 ff ff    	jg     2eac3 <JS_CallInternal+0x96f3>
   2f62f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f633:	48 89 ce             	mov    %rcx,%rsi
   2f636:	4c 89 d2             	mov    %r10,%rdx
   2f639:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2f640:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2f647:	e8 d4 f2 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f64c:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2f653:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   2f65a:	e9 64 f4 ff ff       	jmp    2eac3 <JS_CallInternal+0x96f3>
   2f65f:	49 83 c4 05          	add    $0x5,%r12
   2f663:	e9 98 65 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f668:	48 8b 11             	mov    (%rcx),%rdx
   2f66b:	41 b9 06 00 00 00    	mov    $0x6,%r9d
   2f671:	b8 06 00 00 00       	mov    $0x6,%eax
   2f676:	45 31 c0             	xor    %r8d,%r8d
   2f679:	e9 5e b2 ff ff       	jmp    2a8dc <JS_CallInternal+0x550c>
   2f67e:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2f684:	0f 8e 01 fa ff ff    	jle    2f08b <JS_CallInternal+0x9cbb>
   2f68a:	31 c0                	xor    %eax,%eax
   2f68c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f690:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2f697:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2f69b:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2f69e:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2f6a1:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2f6a4:	85 d2                	test   %edx,%edx
   2f6a6:	7f 13                	jg     2f6bb <JS_CallInternal+0xa2eb>
   2f6a8:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   2f6af:	e8 ec 72 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f6b4:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
   2f6bb:	48 85 c0             	test   %rax,%rax
   2f6be:	0f 85 7e aa ff ff    	jne    2a142 <JS_CallInternal+0x4d72>
   2f6c4:	e9 c2 f9 ff ff       	jmp    2f08b <JS_CallInternal+0x9cbb>
   2f6c9:	83 ee 01             	sub    $0x1,%esi
   2f6cc:	41 89 b5 a8 01 00 00 	mov    %esi,0x1a8(%r13)
   2f6d3:	31 ff                	xor    %edi,%edi
   2f6d5:	44 89 c9             	mov    %r9d,%ecx
   2f6d8:	48 89 78 08          	mov    %rdi,0x8(%rax)
   2f6dc:	4c 89 ef             	mov    %r13,%rdi
   2f6df:	48 89 08             	mov    %rcx,(%rax)
   2f6e2:	44 89 c0             	mov    %r8d,%eax
   2f6e5:	45 31 c0             	xor    %r8d,%r8d
   2f6e8:	45 39 ca             	cmp    %r9d,%r10d
   2f6eb:	48 89 02             	mov    %rax,(%rdx)
   2f6ee:	48 8b 85 48 fd ff ff 	mov    -0x2b8(%rbp),%rax
   2f6f5:	4c 89 42 08          	mov    %r8,0x8(%rdx)
   2f6f9:	48 0f 4e 85 40 fd ff 	cmovle -0x2c0(%rbp),%rax
   2f700:	ff 
   2f701:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2f708:	49 89 c4             	mov    %rax,%r12
   2f70b:	e8 30 71 00 00       	call   36840 <js_poll_interrupts>
   2f710:	85 c0                	test   %eax,%eax
   2f712:	0f 85 e1 0d 00 00    	jne    304f9 <JS_CallInternal+0xb129>
   2f718:	4c 89 e0             	mov    %r12,%rax
   2f71b:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
   2f720:	0f b6 00             	movzbl (%rax),%eax
   2f723:	49 89 c2             	mov    %rax,%r10
   2f726:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2f72a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f72e:	89 c2                	mov    %eax,%edx
   2f730:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f734:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f73b:	e8 d0 95 fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2f740:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f747:	48 89 c2             	mov    %rax,%rdx
   2f74a:	e9 78 e8 ff ff       	jmp    2dfc7 <JS_CallInternal+0x8bf7>
   2f74f:	85 d2                	test   %edx,%edx
   2f751:	0f 85 14 f3 ff ff    	jne    2ea6b <JS_CallInternal+0x969b>
   2f757:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f75b:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
   2f75f:	66 48 0f 6e c1       	movq   %rcx,%xmm0
   2f764:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   2f768:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2f76f:	00 
   2f770:	48 83 eb 10          	sub    $0x10,%rbx
   2f774:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2f779:	e9 64 b0 ff ff       	jmp    2a7e2 <JS_CallInternal+0x5412>
   2f77e:	66 48 0f 6e cf       	movq   %rdi,%xmm1
   2f783:	83 f8 08             	cmp    $0x8,%eax
   2f786:	74 d7                	je     2f75f <JS_CallInternal+0xa38f>
   2f788:	85 c0                	test   %eax,%eax
   2f78a:	0f 85 db f2 ff ff    	jne    2ea6b <JS_CallInternal+0x969b>
   2f790:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f794:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2f798:	eb ca                	jmp    2f764 <JS_CallInternal+0xa394>
   2f79a:	41 b9 06 00 00 00    	mov    $0x6,%r9d
   2f7a0:	b8 06 00 00 00       	mov    $0x6,%eax
   2f7a5:	45 31 c0             	xor    %r8d,%r8d
   2f7a8:	e9 50 b1 ff ff       	jmp    2a8fd <JS_CallInternal+0x552d>
   2f7ad:	48 8d 35 f2 9d 0a 00 	lea    0xa9df2(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2f7b4:	4c 89 ef             	mov    %r13,%rdi
   2f7b7:	31 c0                	xor    %eax,%eax
   2f7b9:	e8 82 4d 00 00       	call   34540 <JS_ThrowTypeError>
   2f7be:	e9 3d 64 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f7c3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f7c7:	89 ca                	mov    %ecx,%edx
   2f7c9:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f7cd:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2f7d4:	e8 37 95 fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2f7d9:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2f7e0:	48 89 c2             	mov    %rax,%rdx
   2f7e3:	e9 42 f8 ff ff       	jmp    2f02a <JS_CallInternal+0x9c5a>
   2f7e8:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   2f7ef:	48 8b 95 40 fe ff ff 	mov    -0x1c0(%rbp),%rdx
   2f7f6:	4c 89 ef             	mov    %r13,%rdi
   2f7f9:	48 89 c6             	mov    %rax,%rsi
   2f7fc:	e8 4f c1 01 00       	call   4b950 <JS_ToObject>
   2f801:	48 89 c1             	mov    %rax,%rcx
   2f804:	48 89 d0             	mov    %rdx,%rax
   2f807:	83 fa 06             	cmp    $0x6,%edx
   2f80a:	0f 84 f0 63 ff ff    	je     25c00 <JS_CallInternal+0x830>
   2f810:	48 89 ca             	mov    %rcx,%rdx
   2f813:	e9 be a3 ff ff       	jmp    29bd6 <JS_CallInternal+0x4806>
   2f818:	83 f9 08             	cmp    $0x8,%ecx
   2f81b:	0f 84 76 0c 00 00    	je     30497 <JS_CallInternal+0xb0c7>
   2f821:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2f828:	49 8b 31             	mov    (%r9),%rsi
   2f82b:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2f82f:	e9 49 ef ff ff       	jmp    2e77d <JS_CallInternal+0x93ad>
   2f834:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2f837:	83 f8 01             	cmp    $0x1,%eax
   2f83a:	0f 86 f5 0a 00 00    	jbe    30335 <JS_CallInternal+0xaf65>
   2f840:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2f843:	0f 85 d9 d7 ff ff    	jne    2d022 <JS_CallInternal+0x7c52>
   2f849:	45 0f b6 41 11       	movzbl 0x11(%r9),%r8d
   2f84e:	48 89 ca             	mov    %rcx,%rdx
   2f851:	4c 89 ce             	mov    %r9,%rsi
   2f854:	4c 89 ef             	mov    %r13,%rdi
   2f857:	41 83 e0 01          	and    $0x1,%r8d
   2f85b:	44 89 85 00 fe ff ff 	mov    %r8d,-0x200(%rbp)
   2f862:	e8 39 f2 fe ff       	call   1eaa0 <JS_FreeValue>
   2f867:	44 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8d
   2f86e:	e9 5d 77 ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   2f873:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f877:	48 89 ce             	mov    %rcx,%rsi
   2f87a:	48 89 da             	mov    %rbx,%rdx
   2f87d:	4c 89 8d c0 fd ff ff 	mov    %r9,-0x240(%rbp)
   2f884:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2f88b:	e8 90 f0 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f890:	4c 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9
   2f897:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2f89e:	e9 4c d7 ff ff       	jmp    2cfef <JS_CallInternal+0x7c1f>
   2f8a3:	31 c0                	xor    %eax,%eax
   2f8a5:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2f8ac:	00 
   2f8ad:	48 83 c3 10          	add    $0x10,%rbx
   2f8b1:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f8b5:	e9 a6 a6 ff ff       	jmp    29f60 <JS_CallInternal+0x4b90>
   2f8ba:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f8be:	4c 89 c6             	mov    %r8,%rsi
   2f8c1:	48 89 da             	mov    %rbx,%rdx
   2f8c4:	e8 57 f0 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f8c9:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f8d0:	e9 62 f0 ff ff       	jmp    2e937 <JS_CallInternal+0x9567>
   2f8d5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f8d9:	4c 89 c6             	mov    %r8,%rsi
   2f8dc:	4c 89 e2             	mov    %r12,%rdx
   2f8df:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2f8e5:	44 89 95 e0 fd ff ff 	mov    %r10d,-0x220(%rbp)
   2f8ec:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2f8f3:	e8 28 f0 fe ff       	call   1e920 <__JS_FreeValueRT>
   2f8f8:	8b 85 d0 fd ff ff    	mov    -0x230(%rbp),%eax
   2f8fe:	44 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10d
   2f905:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2f90c:	e9 1f c3 ff ff       	jmp    2bc30 <JS_CallInternal+0x6860>
   2f911:	44 89 c9             	mov    %r9d,%ecx
   2f914:	45 31 c9             	xor    %r9d,%r9d
   2f917:	45 31 d2             	xor    %r10d,%r10d
   2f91a:	4c 89 ef             	mov    %r13,%rdi
   2f91d:	41 c7 85 a8 01 00 00 	movl   $0x1,0x1a8(%r13)
   2f924:	01 00 00 00 
   2f928:	48 89 08             	mov    %rcx,(%rax)
   2f92b:	4c 89 48 08          	mov    %r9,0x8(%rax)
   2f92f:	44 89 c0             	mov    %r8d,%eax
   2f932:	48 89 02             	mov    %rax,(%rdx)
   2f935:	4c 89 52 08          	mov    %r10,0x8(%rdx)
   2f939:	e8 02 6f 00 00       	call   36840 <js_poll_interrupts>
   2f93e:	85 c0                	test   %eax,%eax
   2f940:	0f 85 b3 0b 00 00    	jne    304f9 <JS_CallInternal+0xb129>
   2f946:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2f94c:	49 89 c2             	mov    %rax,%r10
   2f94f:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2f953:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f957:	48 89 c2             	mov    %rax,%rdx
   2f95a:	48 89 ce             	mov    %rcx,%rsi
   2f95d:	e8 be ef fe ff       	call   1e920 <__JS_FreeValueRT>
   2f962:	e9 10 da ff ff       	jmp    2d377 <JS_CallInternal+0x7fa7>
   2f967:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f96b:	89 c2                	mov    %eax,%edx
   2f96d:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f971:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f978:	e8 93 93 fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2f97d:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f984:	48 89 c2             	mov    %rax,%rdx
   2f987:	e9 45 e7 ff ff       	jmp    2e0d1 <JS_CallInternal+0x8d01>
   2f98c:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2f991:	83 f8 08             	cmp    $0x8,%eax
   2f994:	0f 84 b0 e7 ff ff    	je     2e14a <JS_CallInternal+0x8d7a>
   2f99a:	85 c0                	test   %eax,%eax
   2f99c:	0f 85 14 b2 ff ff    	jne    2abb6 <JS_CallInternal+0x57e6>
   2f9a2:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f9a6:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2f9aa:	e9 a0 e7 ff ff       	jmp    2e14f <JS_CallInternal+0x8d7f>
   2f9af:	48 8d 35 35 9b 0a 00 	lea    0xa9b35(%rip),%rsi        # d94eb <_IO_stdin_used+0x4eb>
   2f9b6:	4c 89 ef             	mov    %r13,%rdi
   2f9b9:	e8 82 4b 00 00       	call   34540 <JS_ThrowTypeError>
   2f9be:	e9 3d 62 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f9c3:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2f9ca:	e9 31 62 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f9cf:	31 c0                	xor    %eax,%eax
   2f9d1:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2f9d8:	00 
   2f9d9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f9dd:	e9 1e 62 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f9e2:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2f9e9:	e9 12 62 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2f9ee:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f9f3:	83 f9 08             	cmp    $0x8,%ecx
   2f9f6:	74 36                	je     2fa2e <JS_CallInternal+0xa65e>
   2f9f8:	85 c9                	test   %ecx,%ecx
   2f9fa:	0f 85 3d e5 ff ff    	jne    2df3d <JS_CallInternal+0x8b6d>
   2fa00:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fa04:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2fa08:	31 c0                	xor    %eax,%eax
   2fa0a:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2fa0e:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2fa15:	00 
   2fa16:	0f 97 c0             	seta   %al
   2fa19:	48 83 eb 10          	sub    $0x10,%rbx
   2fa1d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fa21:	e9 02 80 ff ff       	jmp    27a28 <JS_CallInternal+0x2658>
   2fa26:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fa2a:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2fa2e:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2fa33:	eb d3                	jmp    2fa08 <JS_CallInternal+0xa638>
   2fa35:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fa39:	89 c2                	mov    %eax,%edx
   2fa3b:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fa3f:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2fa46:	e8 c5 92 fe ff       	call   18d10 <JS_AtomGetStrRT.constprop.0>
   2fa4b:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2fa52:	48 89 c2             	mov    %rax,%rdx
   2fa55:	e9 2b e5 ff ff       	jmp    2df85 <JS_CallInternal+0x8bb5>
   2fa5a:	41 8d 40 fe          	lea    -0x2(%r8),%eax
   2fa5e:	83 f8 01             	cmp    $0x1,%eax
   2fa61:	0f 86 7c 07 00 00    	jbe    301e3 <JS_CallInternal+0xae13>
   2fa67:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2fa6b:	0f 85 16 d6 ff ff    	jne    2d087 <JS_CallInternal+0x7cb7>
   2fa71:	41 0f b6 49 11       	movzbl 0x11(%r9),%ecx
   2fa76:	4d 87 c8             	xchg   %r9,%r8
   2fa79:	83 e1 01             	and    $0x1,%ecx
   2fa7c:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2fa82:	e9 13 e6 ff ff       	jmp    2e09a <JS_CallInternal+0x8cca>
   2fa87:	41 8d 40 fe          	lea    -0x2(%r8),%eax
   2fa8b:	83 f8 01             	cmp    $0x1,%eax
   2fa8e:	0f 86 59 07 00 00    	jbe    301ed <JS_CallInternal+0xae1d>
   2fa94:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2fa98:	0f 85 e9 d5 ff ff    	jne    2d087 <JS_CallInternal+0x7cb7>
   2fa9e:	4c 39 cf             	cmp    %r9,%rdi
   2faa1:	48 89 fe             	mov    %rdi,%rsi
   2faa4:	4c 89 ef             	mov    %r13,%rdi
   2faa7:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2faae:	0f 94 c1             	sete   %cl
   2fab1:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2fab8:	0f b6 c9             	movzbl %cl,%ecx
   2fabb:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2fac1:	e8 da ef fe ff       	call   1eaa0 <JS_FreeValue>
   2fac6:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   2facd:	4c 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%r9
   2fad4:	e9 c1 e5 ff ff       	jmp    2e09a <JS_CallInternal+0x8cca>
   2fad9:	45 85 c0             	test   %r8d,%r8d
   2fadc:	0f 85 64 05 00 00    	jne    30046 <JS_CallInternal+0xac76>
   2fae2:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fae6:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2faeb:	31 c9                	xor    %ecx,%ecx
   2faed:	f2 41 0f 2a c1       	cvtsi2sd %r9d,%xmm0
   2faf2:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2faf6:	0f 9b c1             	setnp  %cl
   2faf9:	41 0f 45 c8          	cmovne %r8d,%ecx
   2fafd:	e9 78 74 ff ff       	jmp    26f7a <JS_CallInternal+0x1baa>
   2fb02:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fb06:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2fb0a:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2fb0f:	31 c0                	xor    %eax,%eax
   2fb11:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2fb15:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2fb1c:	00 
   2fb1d:	0f 93 c0             	setae  %al
   2fb20:	48 83 eb 10          	sub    $0x10,%rbx
   2fb24:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fb28:	e9 b3 7e ff ff       	jmp    279e0 <JS_CallInternal+0x2610>
   2fb2d:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2fb32:	83 f8 08             	cmp    $0x8,%eax
   2fb35:	0f 84 f5 f0 ff ff    	je     2ec30 <JS_CallInternal+0x9860>
   2fb3b:	85 c0                	test   %eax,%eax
   2fb3d:	0f 85 73 b0 ff ff    	jne    2abb6 <JS_CallInternal+0x57e6>
   2fb43:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fb47:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2fb4b:	e9 e5 f0 ff ff       	jmp    2ec35 <JS_CallInternal+0x9865>
   2fb50:	66 83 bd e0 fd ff ff 	cmpw   $0x1,-0x220(%rbp)
   2fb57:	01 
   2fb58:	0f 85 cd b3 ff ff    	jne    2af2b <JS_CallInternal+0x5b5b>
   2fb5e:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2fb63:	0f 85 c2 b3 ff ff    	jne    2af2b <JS_CallInternal+0x5b5b>
   2fb69:	66 83 7f 12 01       	cmpw   $0x1,0x12(%rdi)
   2fb6e:	0f 85 b7 b3 ff ff    	jne    2af2b <JS_CallInternal+0x5b5b>
   2fb74:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2fb78:	0f 85 ad b3 ff ff    	jne    2af2b <JS_CallInternal+0x5b5b>
   2fb7e:	41 80 7b 10 00       	cmpb   $0x0,0x10(%r11)
   2fb83:	0f 84 a2 b3 ff ff    	je     2af2b <JS_CallInternal+0x5b5b>
   2fb89:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2fb8d:	0f 84 98 b3 ff ff    	je     2af2b <JS_CallInternal+0x5b5b>
   2fb93:	4d 8b 01             	mov    (%r9),%r8
   2fb96:	49 8b 79 08          	mov    0x8(%r9),%rdi
   2fb9a:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2fb9f:	66 49 0f 6e c3       	movq   %r11,%xmm0
   2fba4:	41 83 43 fc 01       	addl   $0x1,-0x4(%r11)
   2fba9:	66 0f 6c c5          	punpcklqdq %xmm5,%xmm0
   2fbad:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2fbb1:	48 89 f2             	mov    %rsi,%rdx
   2fbb4:	48 c1 fa 04          	sar    $0x4,%rdx
   2fbb8:	41 0f 11 01          	movups %xmm0,(%r9)
   2fbbc:	41 89 51 10          	mov    %edx,0x10(%r9)
   2fbc0:	48 85 ff             	test   %rdi,%rdi
   2fbc3:	0f 85 72 f8 ff ff    	jne    2f43b <JS_CallInternal+0xa06b>
   2fbc9:	e9 a3 f8 ff ff       	jmp    2f471 <JS_CallInternal+0xa0a1>
   2fbce:	48 89 03             	mov    %rax,(%rbx)
   2fbd1:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2fbd5:	e9 f3 a4 ff ff       	jmp    2a0cd <JS_CallInternal+0x4cfd>
   2fbda:	8d 70 07             	lea    0x7(%rax),%esi
   2fbdd:	83 fe 01             	cmp    $0x1,%esi
   2fbe0:	0f 87 85 ee ff ff    	ja     2ea6b <JS_CallInternal+0x969b>
   2fbe6:	48 89 fe             	mov    %rdi,%rsi
   2fbe9:	49 89 c0             	mov    %rax,%r8
   2fbec:	48 8d 5b f0          	lea    -0x10(%rbx),%rbx
   2fbf0:	4c 89 ef             	mov    %r13,%rdi
   2fbf3:	e8 98 4a 01 00       	call   44690 <JS_ConcatString>
   2fbf8:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2fbfc:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2fc00:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fc04:	0f 85 d8 ab ff ff    	jne    2a7e2 <JS_CallInternal+0x5412>
   2fc0a:	e9 f1 5f ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2fc0f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fc13:	4c 89 d6             	mov    %r10,%rsi
   2fc16:	48 89 ca             	mov    %rcx,%rdx
   2fc19:	e8 02 ed fe ff       	call   1e920 <__JS_FreeValueRT>
   2fc1e:	e9 b9 d5 ff ff       	jmp    2d1dc <JS_CallInternal+0x7e0c>
   2fc23:	48 8d 35 a1 99 0a 00 	lea    0xa99a1(%rip),%rsi        # d95cb <_IO_stdin_used+0x5cb>
   2fc2a:	4c 89 ef             	mov    %r13,%rdi
   2fc2d:	31 c0                	xor    %eax,%eax
   2fc2f:	e8 0c 49 00 00       	call   34540 <JS_ThrowTypeError>
   2fc34:	e9 c7 5f ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2fc39:	48 89 f2             	mov    %rsi,%rdx
   2fc3c:	48 89 fe             	mov    %rdi,%rsi
   2fc3f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fc43:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2fc4a:	48 89 85 f8 fd ff ff 	mov    %rax,-0x208(%rbp)
   2fc51:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2fc58:	e8 c3 ec fe ff       	call   1e920 <__JS_FreeValueRT>
   2fc5d:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2fc64:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2fc6b:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2fc72:	e9 80 d0 ff ff       	jmp    2ccf7 <JS_CallInternal+0x7927>
   2fc77:	48 8d 35 8a d1 0a 00 	lea    0xad18a(%rip),%rsi        # dce08 <_IO_stdin_used+0x3e08>
   2fc7e:	4c 89 ef             	mov    %r13,%rdi
   2fc81:	31 c0                	xor    %eax,%eax
   2fc83:	e8 b8 48 00 00       	call   34540 <JS_ThrowTypeError>
   2fc88:	e9 73 5f ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2fc8d:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2fc94:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fc98:	48 89 ce             	mov    %rcx,%rsi
   2fc9b:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   2fca2:	e8 79 ec fe ff       	call   1e920 <__JS_FreeValueRT>
   2fca7:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2fcae:	e9 48 e5 ff ff       	jmp    2e1fb <JS_CallInternal+0x8e2b>
   2fcb3:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2fcb8:	83 f9 08             	cmp    $0x8,%ecx
   2fcbb:	0f 84 49 fe ff ff    	je     2fb0a <JS_CallInternal+0xa73a>
   2fcc1:	85 c9                	test   %ecx,%ecx
   2fcc3:	0f 85 52 e9 ff ff    	jne    2e61b <JS_CallInternal+0x924b>
   2fcc9:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fccd:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2fcd1:	e9 39 fe ff ff       	jmp    2fb0f <JS_CallInternal+0xa73f>
   2fcd6:	48 8d 35 18 99 0a 00 	lea    0xa9918(%rip),%rsi        # d95f5 <_IO_stdin_used+0x5f5>
   2fcdd:	4c 89 ef             	mov    %r13,%rdi
   2fce0:	31 c0                	xor    %eax,%eax
   2fce2:	e8 59 48 00 00       	call   34540 <JS_ThrowTypeError>
   2fce7:	e9 14 5f ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2fcec:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2fcf3:	e9 08 5f ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2fcf8:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2fcfd:	83 f9 08             	cmp    $0x8,%ecx
   2fd00:	74 36                	je     2fd38 <JS_CallInternal+0xa968>
   2fd02:	85 c9                	test   %ecx,%ecx
   2fd04:	0f 85 77 e7 ff ff    	jne    2e481 <JS_CallInternal+0x90b1>
   2fd0a:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fd0e:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2fd12:	31 c0                	xor    %eax,%eax
   2fd14:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2fd18:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2fd1f:	00 
   2fd20:	0f 97 c0             	seta   %al
   2fd23:	48 83 eb 10          	sub    $0x10,%rbx
   2fd27:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fd2b:	e9 ef 7a ff ff       	jmp    2781f <JS_CallInternal+0x244f>
   2fd30:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fd34:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2fd38:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2fd3d:	eb d3                	jmp    2fd12 <JS_CallInternal+0xa942>
   2fd3f:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2fd44:	83 f9 08             	cmp    $0x8,%ecx
   2fd47:	74 36                	je     2fd7f <JS_CallInternal+0xa9af>
   2fd49:	85 c9                	test   %ecx,%ecx
   2fd4b:	0f 85 70 e7 ff ff    	jne    2e4c1 <JS_CallInternal+0x90f1>
   2fd51:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fd55:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2fd59:	31 c0                	xor    %eax,%eax
   2fd5b:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2fd5f:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2fd66:	00 
   2fd67:	0f 93 c0             	setae  %al
   2fd6a:	48 83 eb 10          	sub    $0x10,%rbx
   2fd6e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fd72:	e9 60 7a ff ff       	jmp    277d7 <JS_CallInternal+0x2407>
   2fd77:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fd7b:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2fd7f:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2fd84:	eb d3                	jmp    2fd59 <JS_CallInternal+0xa989>
   2fd86:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2fd89:	83 f8 01             	cmp    $0x1,%eax
   2fd8c:	0f 86 1b 05 00 00    	jbe    302ad <JS_CallInternal+0xaedd>
   2fd92:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2fd95:	0f 85 87 d2 ff ff    	jne    2d022 <JS_CallInternal+0x7c52>
   2fd9b:	4c 39 cf             	cmp    %r9,%rdi
   2fd9e:	48 89 fe             	mov    %rdi,%rsi
   2fda1:	4c 89 ef             	mov    %r13,%rdi
   2fda4:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2fdab:	41 0f 94 c0          	sete   %r8b
   2fdaf:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2fdb6:	45 0f b6 c0          	movzbl %r8b,%r8d
   2fdba:	44 89 85 00 fe ff ff 	mov    %r8d,-0x200(%rbp)
   2fdc1:	e8 da ec fe ff       	call   1eaa0 <JS_FreeValue>
   2fdc6:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   2fdcd:	48 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%rdx
   2fdd4:	4c 89 ef             	mov    %r13,%rdi
   2fdd7:	48 89 c6             	mov    %rax,%rsi
   2fdda:	e8 c1 ec fe ff       	call   1eaa0 <JS_FreeValue>
   2fddf:	44 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8d
   2fde6:	e9 e5 71 ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   2fdeb:	85 c9                	test   %ecx,%ecx
   2fded:	75 38                	jne    2fe27 <JS_CallInternal+0xaa57>
   2fdef:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fdf3:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2fdf8:	45 31 c0             	xor    %r8d,%r8d
   2fdfb:	f2 41 0f 2a c1       	cvtsi2sd %r9d,%xmm0
   2fe00:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2fe04:	41 0f 9b c0          	setnp  %r8b
   2fe08:	44 0f 45 c1          	cmovne %ecx,%r8d
   2fe0c:	e9 bf 71 ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   2fe11:	48 8d 35 08 cf 0a 00 	lea    0xacf08(%rip),%rsi        # dcd20 <_IO_stdin_used+0x3d20>
   2fe18:	4c 89 ff             	mov    %r15,%rdi
   2fe1b:	31 c0                	xor    %eax,%eax
   2fe1d:	e8 1e 47 00 00       	call   34540 <JS_ThrowTypeError>
   2fe22:	e9 d9 5d ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   2fe27:	83 f9 08             	cmp    $0x8,%ecx
   2fe2a:	0f 85 f2 d1 ff ff    	jne    2d022 <JS_CallInternal+0x7c52>
   2fe30:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2fe35:	66 49 0f 6e f9       	movq   %r9,%xmm7
   2fe3a:	45 31 c0             	xor    %r8d,%r8d
   2fe3d:	b8 00 00 00 00       	mov    $0x0,%eax
   2fe42:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2fe46:	41 0f 9b c0          	setnp  %r8b
   2fe4a:	44 0f 45 c0          	cmovne %eax,%r8d
   2fe4e:	e9 7d 71 ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   2fe53:	48 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%rdx
   2fe5a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe5e:	48 89 de             	mov    %rbx,%rsi
   2fe61:	e8 ba ea fe ff       	call   1e920 <__JS_FreeValueRT>
   2fe66:	e9 26 74 ff ff       	jmp    27291 <JS_CallInternal+0x1ec1>
   2fe6b:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2fe72:	89 c8                	mov    %ecx,%eax
   2fe74:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2fe78:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2fe7b:	83 e8 01             	sub    $0x1,%eax
   2fe7e:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2fe81:	85 c0                	test   %eax,%eax
   2fe83:	0f 8f 8d f2 ff ff    	jg     2f116 <JS_CallInternal+0x9d46>
   2fe89:	e8 12 6b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2fe8e:	e9 83 f2 ff ff       	jmp    2f116 <JS_CallInternal+0x9d46>
   2fe93:	48 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%rdx
   2fe9a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe9e:	48 89 de             	mov    %rbx,%rsi
   2fea1:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   2fea8:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   2feaf:	e8 6c ea fe ff       	call   1e920 <__JS_FreeValueRT>
   2feb4:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   2febb:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   2fec2:	e9 4f d1 ff ff       	jmp    2d016 <JS_CallInternal+0x7c46>
   2fec7:	4d 89 c1             	mov    %r8,%r9
   2feca:	48 89 d0             	mov    %rdx,%rax
   2fecd:	48 89 d7             	mov    %rdx,%rdi
   2fed0:	45 31 c0             	xor    %r8d,%r8d
   2fed3:	4c 89 d2             	mov    %r10,%rdx
   2fed6:	4c 89 ce             	mov    %r9,%rsi
   2fed9:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2fee0:	48 89 8d d8 fd ff ff 	mov    %rcx,-0x228(%rbp)
   2fee7:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2feee:	48 89 85 e0 fd ff ff 	mov    %rax,-0x220(%rbp)
   2fef5:	e8 f6 c1 fe ff       	call   1c0f0 <js_strict_eq2.isra.0>
   2fefa:	48 8b b5 e0 fd ff ff 	mov    -0x220(%rbp),%rsi
   2ff01:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2ff08:	4c 89 ef             	mov    %r13,%rdi
   2ff0b:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2ff11:	e8 8a eb fe ff       	call   1eaa0 <JS_FreeValue>
   2ff16:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2ff1d:	4c 8b 9d d8 fd ff ff 	mov    -0x228(%rbp),%r11
   2ff24:	e9 e6 de ff ff       	jmp    2de0f <JS_CallInternal+0x8a3f>
   2ff29:	45 31 c9             	xor    %r9d,%r9d
   2ff2c:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2ff2f:	75 0a                	jne    2ff3b <JS_CallInternal+0xab6b>
   2ff31:	45 31 c9             	xor    %r9d,%r9d
   2ff34:	4c 39 d2             	cmp    %r10,%rdx
   2ff37:	41 0f 94 c1          	sete   %r9b
   2ff3b:	48 89 d0             	mov    %rdx,%rax
   2ff3e:	4c 89 ef             	mov    %r13,%rdi
   2ff41:	4c 89 c2             	mov    %r8,%rdx
   2ff44:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   2ff4b:	48 89 c6             	mov    %rax,%rsi
   2ff4e:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   2ff55:	44 89 8d 00 fe ff ff 	mov    %r9d,-0x200(%rbp)
   2ff5c:	e8 3f eb fe ff       	call   1eaa0 <JS_FreeValue>
   2ff61:	4c 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%r10
   2ff68:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   2ff6f:	e9 9b de ff ff       	jmp    2de0f <JS_CallInternal+0x8a3f>
   2ff74:	85 c9                	test   %ecx,%ecx
   2ff76:	0f 85 60 01 00 00    	jne    300dc <JS_CallInternal+0xad0c>
   2ff7c:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2ff81:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ff85:	31 c0                	xor    %eax,%eax
   2ff87:	ba 01 00 00 00       	mov    $0x1,%edx
   2ff8c:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2ff91:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2ff95:	0f 9a c0             	setp   %al
   2ff98:	48 0f 45 c2          	cmovne %rdx,%rax
   2ff9c:	e9 39 6f ff ff       	jmp    26eda <JS_CallInternal+0x1b0a>
   2ffa1:	4d 89 c3             	mov    %r8,%r11
   2ffa4:	49 89 d1             	mov    %rdx,%r9
   2ffa7:	45 31 c0             	xor    %r8d,%r8d
   2ffaa:	4c 89 d2             	mov    %r10,%rdx
   2ffad:	4c 89 d9             	mov    %r11,%rcx
   2ffb0:	4c 89 ce             	mov    %r9,%rsi
   2ffb3:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2ffba:	4c 89 9d d8 fd ff ff 	mov    %r11,-0x228(%rbp)
   2ffc1:	48 89 bd e0 fd ff ff 	mov    %rdi,-0x220(%rbp)
   2ffc8:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   2ffcf:	e8 1c c1 fe ff       	call   1c0f0 <js_strict_eq2.isra.0>
   2ffd4:	48 8b b5 e0 fd ff ff 	mov    -0x220(%rbp),%rsi
   2ffdb:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2ffe2:	4c 89 ef             	mov    %r13,%rdi
   2ffe5:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2ffeb:	e8 b0 ea fe ff       	call   1eaa0 <JS_FreeValue>
   2fff0:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2fff7:	4c 8b 9d d8 fd ff ff 	mov    -0x228(%rbp),%r11
   2fffe:	e9 be e5 ff ff       	jmp    2e5c1 <JS_CallInternal+0x91f1>
   30003:	48 83 eb 10          	sub    $0x10,%rbx
   30007:	e9 f4 5b ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   3000c:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   30013:	31 d2                	xor    %edx,%edx
   30015:	f3 0f 6f 80 d8 04 00 	movdqu 0x4d8(%rax),%xmm0
   3001c:	00 
   3001d:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   30021:	48 89 90 d8 04 00 00 	mov    %rdx,0x4d8(%rax)
   30028:	48 c7 80 e0 04 00 00 	movq   $0x4,0x4e0(%rax)
   3002f:	04 00 00 00 
   30033:	48 63 c1             	movslq %ecx,%rax
   30036:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   3003d:	48 03 41 18          	add    0x18(%rcx),%rax
   30041:	e9 4b 56 ff ff       	jmp    25691 <JS_CallInternal+0x2c1>
   30046:	41 83 f8 08          	cmp    $0x8,%r8d
   3004a:	0f 85 37 d0 ff ff    	jne    2d087 <JS_CallInternal+0x7cb7>
   30050:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   30055:	66 49 0f 6e f9       	movq   %r9,%xmm7
   3005a:	31 c9                	xor    %ecx,%ecx
   3005c:	b8 00 00 00 00       	mov    $0x0,%eax
   30061:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   30065:	0f 9b c1             	setnp  %cl
   30068:	0f 45 c8             	cmovne %eax,%ecx
   3006b:	e9 0a 6f ff ff       	jmp    26f7a <JS_CallInternal+0x1baa>
   30070:	31 c9                	xor    %ecx,%ecx
   30072:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   30076:	75 08                	jne    30080 <JS_CallInternal+0xacb0>
   30078:	31 c9                	xor    %ecx,%ecx
   3007a:	4c 39 d7             	cmp    %r10,%rdi
   3007d:	0f 94 c1             	sete   %cl
   30080:	48 89 fe             	mov    %rdi,%rsi
   30083:	4c 89 ef             	mov    %r13,%rdi
   30086:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   3008d:	4c 89 85 e0 fd ff ff 	mov    %r8,-0x220(%rbp)
   30094:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   3009a:	e8 01 ea fe ff       	call   1eaa0 <JS_FreeValue>
   3009f:	4c 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%r10
   300a6:	4c 8b 9d e0 fd ff ff 	mov    -0x220(%rbp),%r11
   300ad:	e9 0f e5 ff ff       	jmp    2e5c1 <JS_CallInternal+0x91f1>
   300b2:	45 85 c0             	test   %r8d,%r8d
   300b5:	75 4f                	jne    30106 <JS_CallInternal+0xad36>
   300b7:	66 0f ef c0          	pxor   %xmm0,%xmm0
   300bb:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   300c0:	31 c0                	xor    %eax,%eax
   300c2:	ba 00 00 00 00       	mov    $0x0,%edx
   300c7:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   300cc:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   300d0:	0f 9b c0             	setnp  %al
   300d3:	48 0f 45 c2          	cmovne %rdx,%rax
   300d7:	e9 4e 6e ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   300dc:	83 f9 08             	cmp    $0x8,%ecx
   300df:	0f 85 a4 00 00 00    	jne    30189 <JS_CallInternal+0xadb9>
   300e5:	66 48 0f 6e f2       	movq   %rdx,%xmm6
   300ea:	66 49 0f 6e fa       	movq   %r10,%xmm7
   300ef:	31 c0                	xor    %eax,%eax
   300f1:	ba 01 00 00 00       	mov    $0x1,%edx
   300f6:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   300fa:	0f 9a c0             	setp   %al
   300fd:	48 0f 45 c2          	cmovne %rdx,%rax
   30101:	e9 d4 6d ff ff       	jmp    26eda <JS_CallInternal+0x1b0a>
   30106:	41 83 f8 08          	cmp    $0x8,%r8d
   3010a:	0f 85 94 00 00 00    	jne    301a4 <JS_CallInternal+0xadd4>
   30110:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   30115:	66 49 0f 6e fa       	movq   %r10,%xmm7
   3011a:	31 c0                	xor    %eax,%eax
   3011c:	ba 00 00 00 00       	mov    $0x0,%edx
   30121:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   30125:	0f 9b c0             	setnp  %al
   30128:	48 0f 45 c2          	cmovne %rdx,%rax
   3012c:	e9 f9 6d ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   30131:	4c 89 d6             	mov    %r10,%rsi
   30134:	48 89 ca             	mov    %rcx,%rdx
   30137:	4c 89 ef             	mov    %r13,%rdi
   3013a:	4c 89 85 f8 fd ff ff 	mov    %r8,-0x208(%rbp)
   30141:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   30148:	e8 53 e9 fe ff       	call   1eaa0 <JS_FreeValue>
   3014d:	31 c0                	xor    %eax,%eax
   3014f:	4c 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%r8
   30156:	44 3b 85 00 fe ff ff 	cmp    -0x200(%rbp),%r8d
   3015d:	0f 95 c0             	setne  %al
   30160:	e9 75 6d ff ff       	jmp    26eda <JS_CallInternal+0x1b0a>
   30165:	44 39 c2             	cmp    %r8d,%edx
   30168:	4c 89 d6             	mov    %r10,%rsi
   3016b:	4c 89 c2             	mov    %r8,%rdx
   3016e:	4c 89 ef             	mov    %r13,%rdi
   30171:	0f 94 85 00 fe ff ff 	sete   -0x200(%rbp)
   30178:	e8 23 e9 fe ff       	call   1eaa0 <JS_FreeValue>
   3017d:	0f b6 85 00 fe ff ff 	movzbl -0x200(%rbp),%eax
   30184:	e9 a1 6d ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   30189:	4c 89 d6             	mov    %r10,%rsi
   3018c:	48 89 ca             	mov    %rcx,%rdx
   3018f:	4c 89 ef             	mov    %r13,%rdi
   30192:	e8 09 e9 fe ff       	call   1eaa0 <JS_FreeValue>
   30197:	e9 40 d0 ff ff       	jmp    2d1dc <JS_CallInternal+0x7e0c>
   3019c:	4d 89 dc             	mov    %r11,%r12
   3019f:	e9 5c 5a ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   301a4:	4c 89 d6             	mov    %r10,%rsi
   301a7:	4c 89 c2             	mov    %r8,%rdx
   301aa:	4c 89 ef             	mov    %r13,%rdi
   301ad:	e8 ee e8 fe ff       	call   1eaa0 <JS_FreeValue>
   301b2:	31 c0                	xor    %eax,%eax
   301b4:	e9 71 6d ff ff       	jmp    26f2a <JS_CallInternal+0x1b5a>
   301b9:	0f b6 01             	movzbl (%rcx),%eax
   301bc:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   301c0:	49 89 c2             	mov    %rax,%r10
   301c3:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   301c7:	0f b6 01             	movzbl (%rcx),%eax
   301ca:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   301ce:	49 89 c2             	mov    %rax,%r10
   301d1:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   301d5:	0f b6 02             	movzbl (%rdx),%eax
   301d8:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   301dc:	49 89 c2             	mov    %rax,%r10
   301df:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   301e3:	b9 01 00 00 00       	mov    $0x1,%ecx
   301e8:	e9 8d 6d ff ff       	jmp    26f7a <JS_CallInternal+0x1baa>
   301ed:	0f b6 4f 11          	movzbl 0x11(%rdi),%ecx
   301f1:	48 89 fe             	mov    %rdi,%rsi
   301f4:	4c 89 ef             	mov    %r13,%rdi
   301f7:	83 e1 01             	and    $0x1,%ecx
   301fa:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   30200:	e8 9b e8 fe ff       	call   1eaa0 <JS_FreeValue>
   30205:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   3020b:	e9 6a 6d ff ff       	jmp    26f7a <JS_CallInternal+0x1baa>
   30210:	e8 bb 1a fe ff       	call   11cd0 <__stack_chk_fail@plt>
   30215:	4d 8b 65 10          	mov    0x10(%r13),%r12
   30219:	41 80 bc 24 e9 04 00 	cmpb   $0x0,0x4e9(%r12)
   30220:	00 00 
   30222:	0f 84 c9 00 00 00    	je     302f1 <JS_CallInternal+0xaf21>
   30228:	48 89 ce             	mov    %rcx,%rsi
   3022b:	4c 89 c2             	mov    %r8,%rdx
   3022e:	4c 89 ef             	mov    %r13,%rdi
   30231:	e8 6a e8 fe ff       	call   1eaa0 <JS_FreeValue>
   30236:	31 c0                	xor    %eax,%eax
   30238:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   3023f:	00 
   30240:	48 89 03             	mov    %rax,(%rbx)
   30243:	e9 85 9e ff ff       	jmp    2a0cd <JS_CallInternal+0x4cfd>
   30248:	48 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%rbx
   3024f:	e9 ac 59 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   30254:	48 8d 35 9a 93 0a 00 	lea    0xa939a(%rip),%rsi        # d95f5 <_IO_stdin_used+0x5f5>
   3025b:	4c 89 ef             	mov    %r13,%rdi
   3025e:	31 c0                	xor    %eax,%eax
   30260:	e8 db 42 00 00       	call   34540 <JS_ThrowTypeError>
   30265:	e9 96 59 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   3026a:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   30270:	0f 8e 8a 59 ff ff    	jle    25c00 <JS_CallInternal+0x830>
   30276:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   3027a:	89 ce                	mov    %ecx,%esi
   3027c:	e8 af ac fe ff       	call   1af30 <JS_FreeAtom.part.0.isra.0>
   30281:	e9 7a 59 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   30286:	0f b6 01             	movzbl (%rcx),%eax
   30289:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   3028d:	49 89 c2             	mov    %rax,%r10
   30290:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   30294:	e8 47 62 00 00       	call   364e0 <JS_ThrowReferenceErrorUninitialized>
   30299:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   302a0:	e9 5b 59 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   302a5:	4d 89 cc             	mov    %r9,%r12
   302a8:	e9 53 59 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   302ad:	44 0f b6 47 11       	movzbl 0x11(%rdi),%r8d
   302b2:	48 89 fe             	mov    %rdi,%rsi
   302b5:	4c 89 ef             	mov    %r13,%rdi
   302b8:	41 83 e0 01          	and    $0x1,%r8d
   302bc:	44 89 85 00 fe ff ff 	mov    %r8d,-0x200(%rbp)
   302c3:	e8 d8 e7 fe ff       	call   1eaa0 <JS_FreeValue>
   302c8:	44 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8d
   302cf:	e9 fc 6c ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   302d4:	89 ce                	mov    %ecx,%esi
   302d6:	4c 89 ef             	mov    %r13,%rdi
   302d9:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   302e0:	e8 fb 61 00 00       	call   364e0 <JS_ThrowReferenceErrorUninitialized>
   302e5:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   302ec:	e9 33 d0 ff ff       	jmp    2d324 <JS_CallInternal+0x7f54>
   302f1:	41 c6 84 24 e9 04 00 	movb   $0x1,0x4e9(%r12)
   302f8:	00 01 
   302fa:	48 8d 35 dc 91 0a 00 	lea    0xa91dc(%rip),%rsi        # d94dd <_IO_stdin_used+0x4dd>
   30301:	4c 89 ef             	mov    %r13,%rdi
   30304:	31 c0                	xor    %eax,%eax
   30306:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   3030d:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   30314:	e8 07 64 00 00       	call   36720 <JS_ThrowInternalError>
   30319:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   30320:	41 c6 84 24 e9 04 00 	movb   $0x0,0x4e9(%r12)
   30327:	00 00 
   30329:	48 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%rcx
   30330:	e9 f3 fe ff ff       	jmp    30228 <JS_CallInternal+0xae58>
   30335:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   3033b:	e9 90 6c ff ff       	jmp    26fd0 <JS_CallInternal+0x1c00>
   30340:	4c 21 c9             	and    %r9,%rcx
   30343:	45 31 db             	xor    %r11d,%r11d
   30346:	41 89 b5 a8 01 00 00 	mov    %esi,0x1a8(%r13)
   3034d:	45 31 e4             	xor    %r12d,%r12d
   30350:	48 89 08             	mov    %rcx,(%rax)
   30353:	4c 89 58 08          	mov    %r11,0x8(%rax)
   30357:	44 89 c0             	mov    %r8d,%eax
   3035a:	48 89 02             	mov    %rax,(%rdx)
   3035d:	48 8b 85 48 fd ff ff 	mov    -0x2b8(%rbp),%rax
   30364:	4c 89 62 08          	mov    %r12,0x8(%rdx)
   30368:	4c 8d 60 01          	lea    0x1(%rax),%r12
   3036c:	0f b6 00             	movzbl (%rax),%eax
   3036f:	49 89 c2             	mov    %rax,%r10
   30372:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   30376:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   3037d:	e9 7e 58 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   30382:	0f b6 02             	movzbl (%rdx),%eax
   30385:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   30389:	49 89 c2             	mov    %rax,%r10
   3038c:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   30390:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   30397:	e9 64 58 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   3039c:	0f b6 02             	movzbl (%rdx),%eax
   3039f:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   303a3:	49 89 c2             	mov    %rax,%r10
   303a6:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   303aa:	48 8b 85 90 fe ff ff 	mov    -0x170(%rbp),%rax
   303b1:	49 8b 31             	mov    (%r9),%rsi
   303b4:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   303bb:	4c 89 ef             	mov    %r13,%rdi
   303be:	48 89 8d 08 fe ff ff 	mov    %rcx,-0x1f8(%rbp)
   303c5:	48 8b 8d 08 fe ff ff 	mov    -0x1f8(%rbp),%rcx
   303cc:	48 83 eb 10          	sub    $0x10,%rbx
   303d0:	4c 89 50 30          	mov    %r10,0x30(%rax)
   303d4:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   303db:	4c 89 95 e0 fd ff ff 	mov    %r10,-0x220(%rbp)
   303e2:	48 89 c2             	mov    %rax,%rdx
   303e5:	4c 89 8d f8 fd ff ff 	mov    %r9,-0x208(%rbp)
   303ec:	e8 5f 60 fe ff       	call   16450 <JS_ConcatStringInPlace>
   303f1:	4c 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%r9
   303f8:	4c 8b 95 e0 fd ff ff 	mov    -0x220(%rbp),%r10
   303ff:	85 c0                	test   %eax,%eax
   30401:	75 6a                	jne    3046d <JS_CallInternal+0xb09d>
   30403:	49 8b 51 08          	mov    0x8(%r9),%rdx
   30407:	49 8b 01             	mov    (%r9),%rax
   3040a:	83 fa f6             	cmp    $0xfffffff6,%edx
   3040d:	76 04                	jbe    30413 <JS_CallInternal+0xb043>
   3040f:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   30413:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   3041a:	48 8b bd 08 fe ff ff 	mov    -0x1f8(%rbp),%rdi
   30421:	4c 89 8d e0 fd ff ff 	mov    %r9,-0x220(%rbp)
   30428:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   3042f:	48 89 f1             	mov    %rsi,%rcx
   30432:	49 89 f8             	mov    %rdi,%r8
   30435:	48 89 c6             	mov    %rax,%rsi
   30438:	4c 89 ef             	mov    %r13,%rdi
   3043b:	e8 50 42 01 00       	call   44690 <JS_ConcatString>
   30440:	48 89 c1             	mov    %rax,%rcx
   30443:	48 89 d0             	mov    %rdx,%rax
   30446:	83 fa 06             	cmp    $0x6,%edx
   30449:	74 40                	je     3048b <JS_CallInternal+0xb0bb>
   3044b:	4c 8b 8d e0 fd ff ff 	mov    -0x220(%rbp),%r9
   30452:	4c 89 ef             	mov    %r13,%rdi
   30455:	49 8b 31             	mov    (%r9),%rsi
   30458:	49 8b 51 08          	mov    0x8(%r9),%rdx
   3045c:	49 89 09             	mov    %rcx,(%r9)
   3045f:	49 89 41 08          	mov    %rax,0x8(%r9)
   30463:	e8 38 e6 fe ff       	call   1eaa0 <JS_FreeValue>
   30468:	e9 1a a3 ff ff       	jmp    2a787 <JS_CallInternal+0x53b7>
   3046d:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   30474:	48 8b 95 08 fe ff ff 	mov    -0x1f8(%rbp),%rdx
   3047b:	4c 89 ef             	mov    %r13,%rdi
   3047e:	48 89 c6             	mov    %rax,%rsi
   30481:	e8 1a e6 fe ff       	call   1eaa0 <JS_FreeValue>
   30486:	e9 fc a2 ff ff       	jmp    2a787 <JS_CallInternal+0x53b7>
   3048b:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   30492:	e9 69 57 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   30497:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   3049c:	f2 41 0f 58 01       	addsd  (%r9),%xmm0
   304a1:	49 c7 41 08 08 00 00 	movq   $0x8,0x8(%r9)
   304a8:	00 
   304a9:	48 83 eb 10          	sub    $0x10,%rbx
   304ad:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   304b2:	e9 d0 a2 ff ff       	jmp    2a787 <JS_CallInternal+0x53b7>
   304b7:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   304bd:	0f 8e 3d 57 ff ff    	jle    25c00 <JS_CallInternal+0x830>
   304c3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   304c7:	89 ce                	mov    %ecx,%esi
   304c9:	e8 62 aa fe ff       	call   1af30 <JS_FreeAtom.part.0.isra.0>
   304ce:	e9 2d 57 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   304d3:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   304da:	e9 21 57 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   304df:	0f b6 01             	movzbl (%rcx),%eax
   304e2:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   304e6:	49 89 c2             	mov    %rax,%r10
   304e9:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   304ed:	4c 8b a5 f8 fd ff ff 	mov    -0x208(%rbp),%r12
   304f4:	e9 07 57 ff ff       	jmp    25c00 <JS_CallInternal+0x830>
   304f9:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   30500:	e9 fb 56 ff ff       	jmp    25c00 <JS_CallInternal+0x830>

Disassembly of section .fini:
